unit uLocalizarPedidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, DBCtrls, Buttons, Grids, DBGrids,
  ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Menus,
  Mask, ToolEdit;

type
  TfmLocalizarPedidos = class(TfmFormBaseAvancado)
    lblCodigo: TLabel;
    edtPedido: TEdit;
    edtNomeFantasia: TEdit;
    Label1: TLabel;
    edtFuncionario: TDBLookupComboBox;
    Label3: TLabel;
    dbgLocalizarPedidos: TDBGrid;
    btnCancelar: TBitBtn;
    tabPedidos: TZQuery;
    dtsPedidos: TDataSource;
    tabFuncionarios: TZQuery;
    dtsFuncionarios: TDataSource;
    edtNotaFiscal: TEdit;
    Label2: TLabel;
    rdgStatusPedido: TRadioGroup;
    lblListandoPedidos: TLabel;
    edtOrdemCompra: TEdit;
    Label4: TLabel;
    edtDataPrevisao: TDateEdit;
    Label5: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dbgLocalizarPedidosCellClick(Column: TColumn);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtPedidoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPedidoKeyPress(Sender: TObject; var Key: Char);
    procedure edtNomeFantasiaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFuncionarioCloseUp(Sender: TObject);
    procedure edtNotaFiscalKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rdgStatusPedidoClick(Sender: TObject);
    procedure edtOrdemCompraKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDataPrevisaoChange(Sender: TObject);
  private
    procedure LoadData(Limit : Boolean = False);
  public
    { Public declarations }
  end;

var
  fmLocalizarPedidos: TfmLocalizarPedidos;

implementation

uses uFormBaseConfig, uConstantes, uMenu;

{$R *.dfm}

procedure TfmLocalizarPedidos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabPedidos.Close;
   tabFuncionarios.Close;
   inherited;
   fmLocalizarPedidos:=nil;
end;

procedure TfmLocalizarPedidos.FormCreate(Sender: TObject);
begin
   inherited; 
   SetFormStyle(fsNormal);
end;

procedure TfmLocalizarPedidos.dbgLocalizarPedidosCellClick(
  Column: TColumn);
begin
   if tabPedidos.RecordCount > 0 then begin
      fmMenu.pubTrans1:=tabPedidos.FieldByName('NPedido').AsString;
      Close;
    end
   else begin
      ShowMessage('Selecione um Registro para Confirmar');
   end;
end; 

procedure TfmLocalizarPedidos.btnCancelarClick(Sender: TObject);
begin
   fmMenu.pubTrans1:='';
   Close;
end;

procedure TfmLocalizarPedidos.FormShow(Sender: TObject);
begin
   inherited;
   fmMenu.pubTrans1:='';
   LoadData(True);
   tabFuncionarios.SQL.Add('SELECT Codigo,Nome FROM funcionarios WHERE DataSaida IS NULL ORDER BY Nome');
   tabFuncionarios.Open;
end;

procedure TfmLocalizarPedidos.edtPedidoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarPedidos.edtPedidoKeyPress(Sender: TObject;
  var Key: Char);
begin
   inherited;
   if not (Key in['0'..'9',Chr(8)]) then Key:=#0;
end;

procedure TfmLocalizarPedidos.edtNomeFantasiaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   LoadData;
end;

procedure TfmLocalizarPedidos.edtFuncionarioCloseUp(Sender: TObject);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarPedidos.LoadData(Limit : Boolean = False);
begin
   tabPedidos.Close;
   tabPedidos.SQL.Clear;
   tabPedidos.SQL.Add('SELECT pedidos.Data, pedidos.DataPrevisao, pedidos.DataProducao, pedidos.HoraProducao, pedidos.NPedido, pedidos.Fatura, clientes.NomeFantasia AS Cliente, funcionarios.Nome AS Vendedor');
   tabPedidos.SQL.Add('FROM pedidos');
   tabPedidos.SQL.Add('LEFT JOIN clientes ON clientes.CodigoCliente = pedidos.CodigoCliente');
   tabPedidos.SQL.Add('LEFT JOIN funcionarios ON funcionarios.Codigo = pedidos.CodigoFuncionario');
   tabPedidos.SQL.Add('WHERE pedidos.NPedido > 0');

   if Trim(edtPedido.Text) <> '' then begin
      tabPedidos.SQL.Add('AND pedidos.NPedido = '+edtPedido.Text);
   end;

   if Trim(edtNotaFiscal.Text) <> '' then begin
      tabPedidos.SQL.Add('AND pedidos.Fatura LIKE '+QuotedStr(edtNotaFiscal.Text+'%'));
   end;

   if Trim(edtOrdemCompra.Text) <> '' then begin
      tabPedidos.SQL.Add('AND pedidos.OrdemCompra = '+QuotedStr(edtOrdemCompra.Text));
   end;  

   if Trim(edtNomeFantasia.Text) <> '' then begin
      tabPedidos.SQL.Add('AND clientes.NomeFantasia LIKE '+QuotedStr('%'+edtNomeFantasia.Text+'%'));
   end;

   if Trim(edtFuncionario.Text) <> '' then begin
      tabPedidos.SQL.Add('AND pedidos.CodigoFuncionario = '+FloatToStr(edtFuncionario.KeyValue));
   end;

   if Length(Trim(edtDataPrevisao.Text)) = 10 then begin
      tabPedidos.SQL.Add('AND pedidos.DataPrevisao = '+QuotedStr(FormatDateTime(sis_date_format, edtDataPrevisao.Date)));
   end;

   case rdgStatusPedido.ItemIndex of
      1: tabPedidos.SQL.Add('AND pedidos.DataProducao IS NULL');
      2: tabPedidos.SQL.Add('AND pedidos.DataProducao IS NOT NULL AND pedidos.DataEntrega IS NULL');
      3: tabPedidos.SQL.Add('AND pedidos.DataProducao IS NOT NULL AND pedidos.DataEntrega IS NOT NULL');
   end;

   tabPedidos.SQL.Add('ORDER BY Data DESC, NPedido DESC');

   if Limit = True then begin
      tabPedidos.SQL.Add(db_limite_cmd + ' ' + IntToStr(db_limite_registros));
   end;
   
   tabPedidos.Open;

   lblListandoPedidos.Visible:=True;
   lblListandoPedidos.Caption:='Listando '+IntToStr(tabPedidos.RecordCount)+' pedido(s).'
end;

procedure TfmLocalizarPedidos.edtNotaFiscalKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   inherited;
   LoadData; 
end;

procedure TfmLocalizarPedidos.rdgStatusPedidoClick(Sender: TObject);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarPedidos.edtOrdemCompraKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarPedidos.edtDataPrevisaoChange(Sender: TObject);
begin
   inherited;
   LoadData;
end;

end.

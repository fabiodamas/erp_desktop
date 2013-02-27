unit uLocalizarPedidosCompras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, DBCtrls, Buttons, Grids, DBGrids,
  ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Menus;

type
  TfmLocalizarPedidosCompra = class(TfmFormBaseAvancado)
    lbl_codigo: TLabel;
    edtPedido: TEdit;
    edtFornecedor: TEdit;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dbgLocalizarPedidosCellClick(Column: TColumn);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtPedidoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPedidoKeyPress(Sender: TObject; var Key: Char);
    procedure edtFornecedorKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFuncionarioCloseUp(Sender: TObject);
    procedure edtNotaFiscalKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rdgStatusPedidoClick(Sender: TObject);
  private
    procedure LoadData(Limit : Boolean = False);
  public
    { Public declarations }
  end;

var
  fmLocalizarPedidosCompra: TfmLocalizarPedidosCompra;

implementation

uses uFormBaseConfig, uConstantes, uMenu;

{$R *.dfm}

procedure TfmLocalizarPedidosCompra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabPedidos.Close;
   tabFuncionarios.Close;
   inherited;
   fmLocalizarPedidosCompra:=nil;
end;

procedure TfmLocalizarPedidosCompra.FormCreate(Sender: TObject);
begin
   inherited; 
   SetFormStyle(fsNormal);
end;

procedure TfmLocalizarPedidosCompra.dbgLocalizarPedidosCellClick(
  Column: TColumn);
begin
   if tabPedidos.RecordCount > 0 then begin
      fmMenu.pubTrans1:=tabPedidos.FieldByName('Pedido').AsString;
      Close;
    end
   else begin
      ShowMessage('Selecione um Registro para Confirmar');
   end;
end; 

procedure TfmLocalizarPedidosCompra.btnCancelarClick(Sender: TObject);
begin
   fmMenu.pubTrans1:='';
   Close;
end;

procedure TfmLocalizarPedidosCompra.FormShow(Sender: TObject);
begin
   inherited;
   fmMenu.pubTrans1:='';
   LoadData(True);
   tabFuncionarios.SQL.Add('SELECT Codigo,Nome FROM funcionarios WHERE DataSaida IS NULL ORDER BY Nome');
   tabFuncionarios.Open;
end;

procedure TfmLocalizarPedidosCompra.edtPedidoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarPedidosCompra.edtPedidoKeyPress(Sender: TObject;
  var Key: Char);
begin
   inherited;
   if not (Key in['0'..'9',Chr(8)]) then Key:=#0;
end;

procedure TfmLocalizarPedidosCompra.edtFornecedorKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   LoadData;
end;

procedure TfmLocalizarPedidosCompra.edtFuncionarioCloseUp(Sender: TObject);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarPedidosCompra.LoadData(Limit : Boolean = False);
begin
   tabPedidos.Close;
   tabPedidos.SQL.Clear;
   tabPedidos.SQL.Add('SELECT pedidos_compras.Data, pedidos_compras.Pedido, ');
   tabPedidos.SQL.Add('pedidos_compras.NotaFiscal, fornecedores.NomeFantasia AS Fornecedor, funcionarios.Nome AS Vendedor');
   tabPedidos.SQL.Add('FROM pedidos_compras');
   tabPedidos.SQL.Add('LEFT JOIN fornecedores ON fornecedores.CodigoFornecedor = pedidos_compras.CodigoFornecedor');
   tabPedidos.SQL.Add('LEFT JOIN funcionarios ON funcionarios.Codigo = pedidos_compras.CodigoFuncionario');
   tabPedidos.SQL.Add('WHERE pedidos_compras.Pedido > 0');

   case rdgStatusPedido.ItemIndex of
      1: begin
         tabPedidos.SQL.Add('AND pedidos_compras.DataRecebimento IS NULL');
      end;
      2: begin
         tabPedidos.SQL.Add('AND pedidos_compras.DataRecebimento IS NOT NULL');
      end;
   end;

   if Trim(edtPedido.Text) <> '' then begin
      tabPedidos.SQL.Add('AND pedidos_compras.Pedido = '+edtPedido.Text);
   end;

   if Trim(edtNotaFiscal.Text) <> '' then begin
      tabPedidos.SQL.Add('AND pedidos_compras.NotaFiscal LIKE '+QuotedStr(edtNotaFiscal.Text+'%'));
   end;

   if Trim(edtFornecedor.Text) <> '' then begin
      tabPedidos.SQL.Add('AND fornecedores.NomeFantasia LIKE '+QuotedStr('%'+edtFornecedor.Text+'%'));
   end; 

   if Trim(edtFuncionario.Text) <> '' then begin
      tabPedidos.SQL.Add('AND pedidos_compras.CodigoFuncionario = '+FloatToStr(edtFuncionario.KeyValue));
   end;

   tabPedidos.SQL.Add('ORDER BY Data DESC');

   if Limit = True then begin
      tabPedidos.SQL.Add(db_limite_cmd + ' ' + IntToStr(db_limite_registros));
   end;
   
   tabPedidos.Open;
end;

procedure TfmLocalizarPedidosCompra.edtNotaFiscalKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarPedidosCompra.rdgStatusPedidoClick(Sender: TObject);
begin
   inherited;
   LoadData;
end;

end.

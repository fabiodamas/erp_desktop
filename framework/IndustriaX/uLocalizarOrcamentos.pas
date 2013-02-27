unit uLocalizarOrcamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, DBCtrls, Buttons, Grids, DBGrids,
  ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Menus;

type
  TfmLocalizarOrcamentos = class(TfmFormBaseAvancado)
    lblCodigo: TLabel;
    edtOrcamento: TEdit;
    edtNomeFantasia: TEdit;
    Label1: TLabel;
    edtFuncionario: TDBLookupComboBox;
    Label3: TLabel;
    dbgLocalizarPedidos: TDBGrid;
    btnCancelar: TBitBtn;
    tabOrcamentos: TZQuery;
    dtsOrcamentos: TDataSource;
    tabFuncionarios: TZQuery;
    dtsFuncionarios: TDataSource;
    rdgStatus: TRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dbgLocalizarPedidosCellClick(Column: TColumn);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtOrcamentoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtOrcamentoKeyPress(Sender: TObject; var Key: Char);
    procedure edtNomeFantasiaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFuncionarioCloseUp(Sender: TObject);
    procedure edtNotaFiscalKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rdgStatusClick(Sender: TObject);
  private
    procedure LoadData(Limit : Boolean = False);
  public
    { Public declarations }
  end;

var
  fmLocalizarOrcamentos: TfmLocalizarOrcamentos;

implementation

uses uFormBaseConfig, uConstantes, uMenu;

{$R *.dfm}

procedure TfmLocalizarOrcamentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabOrcamentos.Close;
   tabFuncionarios.Close;
   inherited;
   fmLocalizarOrcamentos:=nil;
end;

procedure TfmLocalizarOrcamentos.FormCreate(Sender: TObject);
begin
   inherited; 
   SetFormStyle(fsNormal);
end;

procedure TfmLocalizarOrcamentos.dbgLocalizarPedidosCellClick(
  Column: TColumn);
begin
   if tabOrcamentos.RecordCount > 0 then begin
      fmMenu.pubTrans1:=tabOrcamentos.FieldByName('Orcamento').AsString;
      Close;
    end
   else begin
      ShowMessage('Selecione um Registro para Confirmar');
   end;
end; 

procedure TfmLocalizarOrcamentos.btnCancelarClick(Sender: TObject);
begin
   fmMenu.pubTrans1:='';
   Close;
end;

procedure TfmLocalizarOrcamentos.FormShow(Sender: TObject);
begin
   inherited;
   fmMenu.pubTrans1:='';
   LoadData(True);
   tabFuncionarios.SQL.Add('SELECT Codigo,Nome FROM funcionarios WHERE DataSaida IS NULL ORDER BY Nome');
   tabFuncionarios.Open;
end;

procedure TfmLocalizarOrcamentos.edtOrcamentoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarOrcamentos.edtOrcamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
   inherited;
   if not (Key in['0'..'9',Chr(8)]) then Key:=#0;
end;

procedure TfmLocalizarOrcamentos.edtNomeFantasiaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   LoadData;
end;

procedure TfmLocalizarOrcamentos.edtFuncionarioCloseUp(Sender: TObject);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarOrcamentos.LoadData(Limit : Boolean = False);
var vWhere : string;
begin
   vWhere:='';

   tabOrcamentos.Close;
   tabOrcamentos.SQL.Clear;
   tabOrcamentos.SQL.Add('SELECT orcamentos.Data, orcamentos.Orcamento, clientes.NomeFantasia AS Cliente, funcionarios.Nome AS Vendedor');
   tabOrcamentos.SQL.Add('FROM orcamentos');
   tabOrcamentos.SQL.Add('LEFT JOIN clientes ON clientes.CodigoCliente = orcamentos.CodigoCliente');
   tabOrcamentos.SQL.Add('LEFT JOIN funcionarios ON funcionarios.Codigo = orcamentos.CodigoFuncionario');

   if Trim(edtOrcamento.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'orcamentos.Orcamento = '+edtOrcamento.Text;
   end;

   if Trim(edtNomeFantasia.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'clientes.NomeFantasia LIKE '+QuotedStr('%'+edtNomeFantasia.Text+'%');
   end;

   if Trim(edtFuncionario.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'orcamentos.CodigoFuncionario = '+FloatToStr(edtFuncionario.KeyValue);
   end;

   case rdgStatus.ItemIndex of
      1: begin
         if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
         vWhere:=vWhere + 'orcamentos.DataPedido IS NULL';
      end;
      2: begin  
         if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
         vWhere:=vWhere + 'orcamentos.DataPedido IS NOT NULL';
      end;
   end;

   if Trim(vWhere) <> '' then begin
      tabOrcamentos.SQL.Add('WHERE');
      tabOrcamentos.SQL.Add(vWhere);
   end;

   tabOrcamentos.SQL.Add('ORDER BY Data DESC');

   if Limit = True then begin
      tabOrcamentos.SQL.Add(db_limite_cmd + ' ' + IntToStr(db_limite_registros));
   end;

   tabOrcamentos.Open;
end;

procedure TfmLocalizarOrcamentos.edtNotaFiscalKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarOrcamentos.rdgStatusClick(Sender: TObject);
begin
   inherited;
   LoadData;
end;

end.

unit uLocalizarFaturamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, DBCtrls, Buttons, Grids, DBGrids,
  ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Menus;

type
  TfmLocalizarFaturamento = class(TfmFormBaseAvancado)
    lbl_codigo: TLabel;
    edtFatura: TEdit;
    edtNomeFantasia: TEdit;
    lblTipoConta: TLabel;
    edtFuncionario: TDBLookupComboBox;
    Label3: TLabel;
    dbgLocalizarFatura: TDBGrid;
    btnCancelar: TBitBtn;
    tabFaturamento: TZQuery;
    dtsFaturamento: TDataSource;
    tabFuncionarios: TZQuery;
    dtsFuncionarios: TDataSource;
    rdgStatusNota: TRadioGroup;
    lblNotasEncontradas: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dbgLocalizarFaturaCellClick(Column: TColumn);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtFaturaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFaturaKeyPress(Sender: TObject; var Key: Char);
    procedure edtNomeFantasiaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFuncionarioCloseUp(Sender: TObject);
    procedure rdgStatusNotaClick(Sender: TObject);
  private
    procedure LoadData(Limit: Boolean = False);
  public
    pubTipo: string; // '1' cliente, '2' fornecedor
  end;

var
  fmLocalizarFaturamento: TfmLocalizarFaturamento;

implementation

uses uFormBaseConfig, uConstantes, uMenu;

{$R *.dfm}

procedure TfmLocalizarFaturamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabFaturamento.Close;
   tabFuncionarios.Close;
   inherited;
   fmLocalizarFaturamento:=nil;
end;

procedure TfmLocalizarFaturamento.FormCreate(Sender: TObject);
begin
   inherited; 
   SetFormStyle(fsNormal);
end;

procedure TfmLocalizarFaturamento.dbgLocalizarFaturaCellClick(
  Column: TColumn);
begin
   if tabFaturamento.RecordCount > 0 then begin
      fmMenu.pubTrans1:=tabFaturamento.FieldByName('Fatura').AsString;
      fmMenu.pubTrans2:=FormatDateTime('yyyy', tabFaturamento.FieldByName('Data').AsDateTime);
      Close;
    end
   else begin
      ShowMessage('Selecione um Registro para Confirmar');
   end;
end; 

procedure TfmLocalizarFaturamento.btnCancelarClick(Sender: TObject);
begin
   fmMenu.pubTrans1:='';
   Close;
end;

procedure TfmLocalizarFaturamento.FormShow(Sender: TObject);
begin
   inherited;

   if pubTipo = '1' then begin
      lblTipoConta.Caption:='Cliente';
    end
   else begin
      lblTipoConta.Caption:='Fornecedor';
   end;

   dbgLocalizarFatura.Columns[3].Title.Caption:=lblTipoConta.Caption;
   fmMenu.pubTrans1:='';

   LoadData(True);

   tabFuncionarios.SQL.Add('SELECT Codigo,Nome FROM funcionarios WHERE DataSaida IS NULL ORDER BY Nome');
   tabFuncionarios.Open;
end;

procedure TfmLocalizarFaturamento.edtFaturaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarFaturamento.edtFaturaKeyPress(Sender: TObject;
  var Key: Char);
begin
   inherited;
   if not (Key in['0'..'9',Chr(8)]) then Key:=#0;
end;

procedure TfmLocalizarFaturamento.edtNomeFantasiaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Trim(edtNomeFantasia.Text) <> '' then begin
      LoadData;
   end;
end;

procedure TfmLocalizarFaturamento.edtFuncionarioCloseUp(Sender: TObject);
begin
   inherited;
   if Trim(edtFuncionario.Text) <> '' then begin
      LoadData;
   end;
end;

procedure TfmLocalizarFaturamento.LoadData(Limit: Boolean = False);
var vWhere: string;
begin
   vWhere:='';
   tabFaturamento.Close;
   tabFaturamento.SQL.Clear;
   tabFaturamento.SQL.Add('SELECT faturamento.Data, faturamento.Fatura, funcionarios.Nome AS Vendedor,');
   if pubTipo = '1' then begin
      tabFaturamento.SQL.Add('clientes.NomeFantasia AS NomeConta');
    end
   else begin
      tabFaturamento.SQL.Add('fornecedores.NomeFantasia AS NomeConta');
   end;
   tabFaturamento.SQL.Add('FROM faturamento');
   if pubTipo = '1' then begin
      tabFaturamento.SQL.Add('LEFT JOIN clientes ON clientes.CodigoCliente = faturamento.CodigoConta');
    end
   else begin
      tabFaturamento.SQL.Add('LEFT JOIN fornecedores ON fornecedores.CodigoFornecedor = faturamento.CodigoConta');
   end;
   tabFaturamento.SQL.Add('LEFT JOIN funcionarios ON funcionarios.Codigo = faturamento.CodigoFuncionario');
   case rdgStatusNota.ItemIndex of
      1: begin
         if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
         vWhere:=vWhere+'DataCancelamento IS NULL';
      end;
      2: begin
         if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
         vWhere:=vWhere+'DataCancelamento IS NOT NULL';
      end;
   end;

   if Trim(pubTipo) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere+'TipoTela = '+pubTipo;
   end;

   if Trim(edtFatura.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere+'Fatura LIKE '+QuotedStr(edtFatura.Text+'%');
   end;

   if Trim(edtNomeFantasia.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      if pubTipo = '1' then begin
         vWhere:=vWhere+'clientes.NomeFantasia LIKE '+QuotedStr('%'+edtNomeFantasia.Text+'%');
       end
      else begin
         vWhere:=vWhere+'fornecedores.NomeFantasia LIKE '+QuotedStr('%'+edtNomeFantasia.Text+'%');
      end;
   end;

   if Trim(edtFuncionario.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere+'faturamento.CodigoFuncionario = '+String(edtFuncionario.KeyValue);
   end;

   if Trim(vWhere) <> '' then begin
      tabFaturamento.SQL.Add('WHERE');
      tabFaturamento.SQL.Add(vWhere);
   end;

   tabFaturamento.SQL.Add('ORDER BY faturamento.Data DESC');

   if Limit = True then begin
      tabFaturamento.SQL.Add(db_limite_cmd + ' ' + IntToStr(db_limite_registros));
   end;
   
   tabFaturamento.Open;

   lblNotasEncontradas.Caption:='Listando ' + IntToStr(tabFaturamento.RecordCount) + ' notas.';
   lblNotasEncontradas.Visible:=True;
end;

procedure TfmLocalizarFaturamento.rdgStatusNotaClick(Sender: TObject);
begin
   inherited;
   LoadData;
end;

end.

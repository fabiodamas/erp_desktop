unit uLocalizarFuncionarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, DBCtrls, Buttons, Grids, DBGrids,
  ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Menus;

type
  TfmLocalizarFuncionarios = class(TfmFormBaseAvancado)
    lbl_codigo: TLabel;
    edtCodigo: TEdit;
    edtNome: TEdit;
    Label1: TLabel;
    edtDepartamento: TDBLookupComboBox;
    Label3: TLabel;
    dbgLocalizarFuncionarios: TDBGrid;
    btnCancelar: TBitBtn;
    tabDepartamentos: TZQuery;
    dtsDepartamentos: TDataSource;
    tabFuncionarios: TZQuery;
    dtsFuncionarios: TDataSource;
    rdgStatusFuncionario: TRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dbgLocalizarFuncionariosCellClick(Column: TColumn);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCodigoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edtNomeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDepartamentoCloseUp(Sender: TObject);
    procedure edtNotaFiscalKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rdgStatusFuncionarioClick(Sender: TObject);
  private
    procedure LoadData(Limit : Boolean = False);
  public
    { Public declarations }
  end;

var
  fmLocalizarFuncionarios: TfmLocalizarFuncionarios;

implementation

uses uFormBaseConfig, uConstantes, uMenu;

{$R *.dfm}

procedure TfmLocalizarFuncionarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabDepartamentos.Close;
   tabFuncionarios.Close;
   inherited;
   fmLocalizarFuncionarios:=nil;
end;

procedure TfmLocalizarFuncionarios.FormCreate(Sender: TObject);
begin
   inherited; 
   SetFormStyle(fsNormal);
end;

procedure TfmLocalizarFuncionarios.dbgLocalizarFuncionariosCellClick(
  Column: TColumn);
begin
   if tabFuncionarios.RecordCount > 0 then begin
      fmMenu.pubTrans1:=tabFuncionarios.FieldByName('Codigo').AsString;
      Close;
    end
   else begin
      ShowMessage('Selecione um Registro para Confirmar');
   end;
end; 

procedure TfmLocalizarFuncionarios.btnCancelarClick(Sender: TObject);
begin
   fmMenu.pubTrans1:='';
   Close;
end;

procedure TfmLocalizarFuncionarios.FormShow(Sender: TObject);
begin
   inherited;
   edtNome.SetFocus;
   fmMenu.pubTrans1:='';
   LoadData(True);
   tabDepartamentos.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('3')+' ORDER BY Descricao');
   tabDepartamentos.Open;
end;

procedure TfmLocalizarFuncionarios.edtCodigoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarFuncionarios.edtCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
   inherited;
   if not (Key in['0'..'9',Chr(8)]) then Key:=#0;
end;

procedure TfmLocalizarFuncionarios.edtNomeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   LoadData;
end;

procedure TfmLocalizarFuncionarios.edtDepartamentoCloseUp(Sender: TObject);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarFuncionarios.LoadData(Limit : Boolean = False);
var vWhere : string;
begin
   vWhere:='';

   tabFuncionarios.Close;
   tabFuncionarios.SQL.Clear;
   tabFuncionarios.SQL.Add('SELECT funcionarios.Codigo, funcionarios.Nome, ');
   tabFuncionarios.SQL.Add('genericos.Descricao AS Departamento, funcionarios.CodigoDepto ');
   tabFuncionarios.SQL.Add('FROM funcionarios ');
   tabFuncionarios.SQL.Add('LEFT JOIN genericos ON genericos.Codigo = funcionarios.CodigoDepto');

   case rdgStatusFuncionario.ItemIndex of
      1: begin
         if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
         vWhere:=vWhere + 'funcionarios.DataSaida IS NULL'; 
      end;
      2: begin
         if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
         vWhere:=vWhere + 'funcionarios.DataSaida IS NOT NULL';
      end;
   end;

   if Trim(edtCodigo.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'funcionarios.Codigo = '+QuotedStr(edtCodigo.Text);
   end;

   if Trim(edtNome.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'funcionarios.Nome LIKE '+QuotedStr('%'+edtNome.Text+'%');
   end;

   if Trim(edtDepartamento.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'funcionarios.CodigoDepto = '+QuotedStr(FloatToStr(edtDepartamento.KeyValue));
   end;

   if Trim(vWhere) <> '' then begin
      tabFuncionarios.SQL.Add('WHERE');
      tabFuncionarios.SQL.Add(vWhere);
   end; 

   tabFuncionarios.SQL.Add('ORDER BY funcionarios.Nome ');

   if Limit = True then begin
      tabFuncionarios.SQL.Add(db_limite_cmd + ' ' + IntToStr(db_limite_registros));
   end;

   tabFuncionarios.Open;
end;

procedure TfmLocalizarFuncionarios.edtNotaFiscalKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarFuncionarios.rdgStatusFuncionarioClick(Sender: TObject);
begin
   inherited;
   LoadData;
end;

end.

unit uLocalizarFornecedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, DBCtrls, Buttons, Grids, DBGrids,
  ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TfmLocalizarFornecedores = class(TfmFormBaseAvancado)
    lbl_codigo: TLabel;
    edt_fornecedor_codigo: TEdit;
    edt_fornecedor_nome: TEdit;
    Label1: TLabel;
    btn_localizar: TBitBtn;
    dbg_localizar: TDBGrid;
    edt_codigo_selecionado: TEdit;
    edt_nome_selecionado: TEdit;
    btn_ok: TBitBtn;
    btn_cancelar: TBitBtn;
    tab_fornecedores: TZQuery;
    dts_fornecedores: TDataSource;
    procedure btn_localizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dbg_localizarCellClick(Column: TColumn);
    procedure btn_cancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_okClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmLocalizarFornecedores: TfmLocalizarFornecedores;

implementation

uses uFormBaseConfig, uConstantes, uMenu;

{$R *.dfm}

procedure TfmLocalizarFornecedores.btn_localizarClick(Sender: TObject);
var vSQL: string;
begin
   vSQL:='';

   if Trim(edt_fornecedor_codigo.Text) <> '' then begin
      if Trim(vSQL) <> '' then vSQL:=vSQL+' AND ';
      vSQL:=vSQL+'Codigo = '+QuotedStr(edt_fornecedor_codigo.Text);
   end;

   if Trim(edt_fornecedor_nome.Text) <> '' then begin
      if Trim(vSQL) <> '' then vSQL:=vSQL+' AND ';
      vSQL:=vSQL+'Nome_Fantasia LIKE '+QuotedStr('%'+edt_fornecedor_nome.Text+'%');
   end;

   if Trim(vSQL) <> '' then begin
      tab_fornecedores.Close;
      tab_fornecedores.SQL.Clear;
      tab_fornecedores.SQL.Add('SELECT Codigo,Nome_Fantasia FROM fornecedores WHERE');
      tab_fornecedores.SQL.Add(vSQL);
      tab_fornecedores.Open;
    end
   else begin
      tab_fornecedores.Close;
      tab_fornecedores.SQL.Clear;
      tab_fornecedores.SQL.Add('SELECT Codigo,Nome_Fantasia FROM fornecedores ORDER BY Codigo DESC '+db_limite_cmd+' '+IntToStr(db_limite_registros));
      tab_fornecedores.Open;
   end;
end;

procedure TfmLocalizarFornecedores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tab_fornecedores.Close;
   inherited;
   fmLocalizarFornecedores:=nil;
end;

procedure TfmLocalizarFornecedores.FormCreate(Sender: TObject);
begin
   inherited; 
   SetFormStyle(fsNormal);
end;

procedure TfmLocalizarFornecedores.dbg_localizarCellClick(
  Column: TColumn);
begin
   if tab_fornecedores.RecordCount > 0 then begin
      edt_codigo_selecionado.Text:=tab_fornecedores.FieldByName('Codigo').AsString;
      edt_nome_selecionado.Text:=tab_fornecedores.FieldByName('Nome_Fantasia').AsString;
   end; 
end; 

procedure TfmLocalizarFornecedores.btn_cancelarClick(Sender: TObject);
begin
   fmMenu.pubTrans1:='';
   Close;
end;

procedure TfmLocalizarFornecedores.FormShow(Sender: TObject);
begin
   inherited;
   fmMenu.pubTrans1:='';
end;

procedure TfmLocalizarFornecedores.btn_okClick(Sender: TObject);
begin
   if Trim(edt_codigo_selecionado.Text) <> '' then begin
      fmMenu.pubTrans1:=edt_codigo_selecionado.Text;
      Close;
    end
   else begin
      ShowMessage('Selecione um Registro para Confirmar');
   end;
end;

end.

unit uLocalizarSetores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, DBCtrls, Buttons, Grids, DBGrids,
  ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TfmLocalizarSetores = class(TfmFormBaseAvancado)
    lbl_codigo: TLabel;
    edt_setor_codigo: TEdit;
    edt_setor_descricao: TEdit;
    Label1: TLabel;
    btn_localizar: TBitBtn;
    dbg_localizar: TDBGrid;
    edt_codigo_selecionado: TEdit;
    edt_nome_selecionado: TEdit;
    btn_ok: TBitBtn;
    btn_cancelar: TBitBtn;
    tab_setor: TZQuery;
    dts_setor: TDataSource;
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
  fmLocalizarSetores: TfmLocalizarSetores;

implementation

uses uFormBaseConfig, uConstantes, uMenu;

{$R *.dfm}

procedure TfmLocalizarSetores.btn_localizarClick(Sender: TObject);
var vSQL: string;
begin
   vSQL:='';

   if Trim(edt_setor_codigo.Text) <> '' then begin
      if Trim(vSQL) <> '' then vSQL:=vSQL+' AND ';
      vSQL:=vSQL+'Codigo = '+QuotedStr(edt_setor_codigo.Text);
   end;

   if Trim(edt_setor_descricao.Text) <> '' then begin
      if Trim(vSQL) <> '' then vSQL:=vSQL+' AND ';
      vSQL:=vSQL+'Descricao LIKE '+QuotedStr('%'+edt_setor_descricao.Text+'%');
   end;

   if Trim(vSQL) <> '' then begin
      tab_setor.Close;
      tab_setor.SQL.Clear;
      tab_setor.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('22')+' AND');
      tab_setor.SQL.Add(vSQL);
      tab_setor.Open;
    end
   else begin
      tab_setor.Close;
      tab_setor.SQL.Clear;
      tab_setor.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('22')+' ORDER BY Codigo DESC '+db_limite_cmd+' '+IntToStr(db_limite_registros));
      tab_setor.Open;
   end;
end;

procedure TfmLocalizarSetores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tab_setor.Close;
   inherited;
   fmLocalizarSetores:=nil;
end;

procedure TfmLocalizarSetores.FormCreate(Sender: TObject);
begin
   inherited; 
   SetFormStyle(fsNormal);
end;

procedure TfmLocalizarSetores.dbg_localizarCellClick(
  Column: TColumn);
begin
   if tab_setor.RecordCount > 0 then begin
      edt_codigo_selecionado.Text:=tab_setor.FieldByName('Codigo').AsString;
      edt_nome_selecionado.Text:=tab_setor.FieldByName('Descricao').AsString;
   end; 
end; 

procedure TfmLocalizarSetores.btn_cancelarClick(Sender: TObject);
begin
   fmMenu.pubTrans1:='';
   Close;
end;

procedure TfmLocalizarSetores.FormShow(Sender: TObject);
begin
   inherited;
   fmMenu.pubTrans1:='';
end;

procedure TfmLocalizarSetores.btn_okClick(Sender: TObject);
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

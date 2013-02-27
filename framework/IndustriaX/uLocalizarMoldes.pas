unit uLocalizarMoldes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, DBCtrls, Buttons, Grids, DBGrids,
  ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TfmLocalizarMoldes = class(TfmFormBaseAvancado)
    lbl_codigo: TLabel;
    edt_molde_numero: TEdit;
    edt_molde_descricao: TEdit;
    Label1: TLabel;
    btn_localizar: TBitBtn;
    dbg_localizar: TDBGrid;
    edt_codigo_selecionado: TEdit;
    edt_nome_selecionado: TEdit;
    btn_ok: TBitBtn;
    btn_cancelar: TBitBtn;
    tab_moldes: TZQuery;
    dts_moldes: TDataSource;
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
  fmLocalizarMoldes: TfmLocalizarMoldes;

implementation

uses uFormBaseConfig, uConstantes, uMenu;

{$R *.dfm}

procedure TfmLocalizarMoldes.btn_localizarClick(Sender: TObject);
var vSQL: string;
begin
   vSQL:='';

   if Trim(edt_molde_numero.Text) <> '' then begin
      if Trim(vSQL) <> '' then vSQL:=vSQL+' AND ';
      vSQL:=vSQL+'N_Molde = '+QuotedStr(edt_molde_numero.Text);
   end;

   if Trim(edt_molde_descricao.Text) <> '' then begin
      if Trim(vSQL) <> '' then vSQL:=vSQL+' AND ';
      vSQL:=vSQL+'Descricao LIKE '+QuotedStr('%'+edt_molde_descricao.Text+'%');      
   end; 

   if Trim(vSQL) <> '' then begin
      tab_moldes.Close;
      tab_moldes.SQL.Clear;
      tab_moldes.SQL.Add('SELECT * FROM moldes WHERE');
      tab_moldes.SQL.Add(vSQL);
      tab_moldes.Open;
    end
   else begin
      tab_moldes.Close;
      tab_moldes.SQL.Clear;
      tab_moldes.SQL.Add('SELECT * FROM moldes ORDER BY N_Molde DESC '+db_limite_cmd+' '+IntToStr(db_limite_registros));
      tab_moldes.Open;
   end;
end;

procedure TfmLocalizarMoldes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tab_moldes.Close;
   inherited;
   fmLocalizarMoldes:=nil;
end;

procedure TfmLocalizarMoldes.FormCreate(Sender: TObject);
begin
   inherited; 
   SetFormStyle(fsNormal);
end;

procedure TfmLocalizarMoldes.dbg_localizarCellClick(
  Column: TColumn);
begin
   if tab_moldes.RecordCount > 0 then begin
      edt_codigo_selecionado.Text:=tab_moldes.FieldByName('N_Molde').AsString;
      edt_nome_selecionado.Text:=tab_moldes.FieldByName('Descricao').AsString;
   end; 
end; 

procedure TfmLocalizarMoldes.btn_cancelarClick(Sender: TObject);
begin
   fmMenu.pubTrans1:='';
   Close;
end;

procedure TfmLocalizarMoldes.FormShow(Sender: TObject);
begin
   inherited;
   fmMenu.pubTrans1:='';
end;

procedure TfmLocalizarMoldes.btn_okClick(Sender: TObject);
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

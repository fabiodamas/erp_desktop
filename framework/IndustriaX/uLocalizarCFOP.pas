unit uLocalizarCFOP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, DBCtrls, Buttons, Grids, DBGrids,
  ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Menus;

type
  TfmLocalizarCFOP = class(TfmFormBaseAvancado)
    lbl_codigo: TLabel;
    edtCFOP: TEdit;
    edtNaturezaOperacao: TEdit;
    Label1: TLabel;
    dbgLocalizar: TDBGrid;
    btnCancelar: TBitBtn;
    tabCfop: TZQuery;
    dtsCfop: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dbgLocalizarCellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtCFOPChange(Sender: TObject);
    procedure edtNaturezaOperacaoChange(Sender: TObject);
  private
    procedure LoadData(Limit: boolean = False);
  public
    { Public declarations }
  end;

var
  fmLocalizarCFOP: TfmLocalizarCFOP;

implementation

uses uFormBaseConfig, uConstantes, uMenu;

{$R *.dfm}

procedure TfmLocalizarCFOP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabCfop.Close;
   inherited;
   fmLocalizarCFOP:=nil;
end;

procedure TfmLocalizarCFOP.FormCreate(Sender: TObject);
begin
   inherited; 
   SetFormStyle(fsNormal);
end;

procedure TfmLocalizarCFOP.dbgLocalizarCellClick(
  Column: TColumn);
begin
   if tabCfop.RecordCount > 0 then begin
      fmMenu.pubTrans1:=tabCfop.FieldByName('CodigoCFOP').AsString;
      Close;
   end;
end;

procedure TfmLocalizarCFOP.FormShow(Sender: TObject);
begin
   inherited;
   edtCFOP.SetFocus;
   fmMenu.pubTrans1:='';
   LoadData(True);
end;

procedure TfmLocalizarCFOP.btnCancelarClick(Sender: TObject);
begin
   inherited;
   fmMenu.pubTrans1:='';
   Close;
end;

procedure TfmLocalizarCFOP.LoadData(Limit: boolean);
var vWhere : string;
begin
   vWhere:='';
   tabCfop.Close;
   tabCfop.SQL.Clear;
   tabCfop.SQL.Add('SELECT * FROM cfop ');

   if Trim(edtCFOP.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'CFOP LIKE '+QuotedStr(edtCFOP.Text+'%');
   end;

   if Trim(edtNaturezaOperacao.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'NaturezaOperacao LIKE '+QuotedStr('%'+edtNaturezaOperacao.Text+'%');
   end;    

   if Trim(vWhere) <> '' then begin
      tabCfop.SQL.Add('WHERE');
      tabCfop.SQL.Add(vWHERE);
   end;

   tabCfop.SQL.Add('ORDER BY NaturezaOperacao');   
   if Limit = True then begin
      tabCfop.SQL.Add(db_limite_cmd + ' ' + IntToStr(db_limite_registros));
   end;

   tabCfop.Open;
end;

procedure TfmLocalizarCFOP.edtCFOPChange(Sender: TObject);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarCFOP.edtNaturezaOperacaoChange(Sender: TObject);
begin
   inherited;
   LoadData;
end;

end.

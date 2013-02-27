unit uLocalizarCentroCusto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, DBCtrls, Buttons, Grids, DBGrids,
  ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TfmLocalizarCentroCusto = class(TfmFormBaseAvancado)
    lbl_codigo: TLabel;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    Label1: TLabel;
    dbgLocalizar: TDBGrid;
    btnCancelar: TBitBtn;
    tabCC: TZQuery;
    dtsCC: TDataSource;
    edtFamilia: TEdit;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dbgLocalizarCellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtCodigoChange(Sender: TObject);
    procedure edtFamiliaChange(Sender: TObject);
    procedure edtDescricaoChange(Sender: TObject);
  private
    procedure LoadData(Limit: boolean = False);
  public
    { Public declarations }
  end;

var
  fmLocalizarCentroCusto: TfmLocalizarCentroCusto;

implementation

uses uFormBaseConfig, uConstantes, uMenu;

{$R *.dfm}

procedure TfmLocalizarCentroCusto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabCC.Close;
   inherited;
   fmLocalizarCentroCusto:=nil;
end;

procedure TfmLocalizarCentroCusto.FormCreate(Sender: TObject);
begin
   inherited; 
   SetFormStyle(fsNormal);
end;

procedure TfmLocalizarCentroCusto.dbgLocalizarCellClick(
  Column: TColumn);
begin
   if tabCC.RecordCount > 0 then begin
      fmMenu.pubTrans1:=tabCC.FieldByName('Codigo').AsString;
      Close;
   end;
end;

procedure TfmLocalizarCentroCusto.FormShow(Sender: TObject);
begin
   inherited;
   edtDescricao.SetFocus;
   fmMenu.pubTrans1:='';
   LoadData(True);
end;

procedure TfmLocalizarCentroCusto.btnCancelarClick(Sender: TObject);
begin
   inherited;
   fmMenu.pubTrans1:='';
   Close;
end;

procedure TfmLocalizarCentroCusto.LoadData(Limit: boolean);
var vWhere : string;
begin
   vWhere:='';
   tabCC.Close;
   tabCC.SQL.Clear;
   tabCC.SQL.Add('SELECT * FROM centro_custo');

   if Trim(edtCodigo.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'Codigo = '+edtCodigo.Text;
   end;

   if Trim(edtFamilia.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'Familia = '+QuotedStr(edtFamilia.Text);
   end;

   if Trim(edtDescricao.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'Descricao LIKE '+QuotedStr('%'+edtDescricao.Text+'%');
   end;    

   if Trim(vWhere) <> '' then begin
      tabCC.SQL.Add('WHERE');
      tabCC.SQL.Add(vWHERE);
   end;

   tabCC.SQL.Add('ORDER BY Familia,Descricao');   
   if Limit = True then begin
      tabCC.SQL.Add(db_limite_cmd + ' ' + IntToStr(db_limite_registros));
   end;
//   ShowMessage(tabCC.SQL.Text);
   tabCC.Open;
end;

procedure TfmLocalizarCentroCusto.edtCodigoChange(Sender: TObject);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarCentroCusto.edtFamiliaChange(Sender: TObject);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarCentroCusto.edtDescricaoChange(Sender: TObject);
begin
   inherited;
   LoadData;
end;

end.

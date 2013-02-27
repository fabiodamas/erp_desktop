unit uCores;

interface  

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Menus, Buttons, ExtCtrls, StdCtrls, Mask, DBCtrls, Grids,
  DBGrids, ImgList;

type
  TfmCores = class(TfmFormBaseCadastro)
    edtCodigo: TDBEdit;
    Label1: TLabel;
    edtDescricao: TDBEdit;
    Label2: TLabel;
    dbgGenericos: TDBGrid;
    edtAbreviacao: TDBEdit;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
  public
    procedure Novo; override;
    procedure Editar; override;
    procedure Deletar; override;
    procedure Cancelar; override;
    function Checagens: Boolean; override;
  end;

var
  fmCores: TfmCores;

implementation

uses uFormBaseConfig, uMenu, uFuncoes, uTipos, uLocalizarGenerico;

{$R *.dfm}

procedure TfmCores.Cancelar;
begin
end;

procedure TfmCores.Editar;
begin
end;

function TfmCores.Checagens: Boolean;
begin
   Result:=False;
   if Trim(edtDescricao.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Descrição');
      edtDescricao.SetFocus;
      Result:=True;
      exit;
   end;
end;

procedure TfmCores.Deletar;
begin
end;

procedure TfmCores.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TfmCores.Novo;
begin
   tabBase.FieldByName('Codigo').AsFloat:=CodeGenerator('cores', 'Codigo');
end;

procedure TfmCores.FormShow(Sender: TObject);
begin
   tabBase.SQL.Add('SELECT * FROM cores ORDER BY Descricao');
   tabBase.Open;
   inherited;
end;

procedure TfmCores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabBase.Close;
   inherited;
end;

procedure TfmCores.btnLocalizarClick(Sender: TObject);
var vParamLoc: TParametrosLocalizar;
begin
   inherited;
   vParamLoc.Table:='cores';
   vParamLoc.KeyField:='Codigo';
   vParamLoc.Field1:='Descricao';
   vParamLoc.Filter:='';
   if not Assigned (fmLocalizarGenerico) then begin
      Application.CreateForm(TfmLocalizarGenerico, fmLocalizarGenerico);
      fmLocalizarGenerico.LoadParams(vParamLoc);
      fmLocalizarGenerico.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      tabBase.Locate('Codigo', fmMenu.pubTrans1, []);
   end;
end;

procedure TfmCores.btnNovoClick(Sender: TObject);
begin
   inherited;
   edtDescricao.SetFocus;
end;

end.

unit uGenericos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Menus, Buttons, ExtCtrls, StdCtrls, Mask, DBCtrls, Grids,
  DBGrids, ImgList;

type
  TfmGenericos = class(TfmFormBaseCadastro)
    edtCodigo: TDBEdit;
    Label1: TLabel;
    edtDescricao: TDBEdit;
    Label2: TLabel;
    dbgGenericos: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    FTipo: string;
  public
    procedure Novo; override;
    procedure Editar; override;
    procedure Deletar; override;
    procedure Cancelar; override;
    function Checagens: Boolean; override;
  end;

var
  fmGenericos: TfmGenericos;

implementation

uses uFormBaseConfig, uMenu, uFuncoes, uTipos, uLocalizarGenerico;

{$R *.dfm}

procedure TfmGenericos.Cancelar;
begin
end;

procedure TfmGenericos.Editar;
begin
end;

function TfmGenericos.Checagens: Boolean;
begin
   Result:=False;
   if Trim(edtDescricao.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Descrição');
      edtDescricao.SetFocus;
      Result:=True;
      exit;
   end;
end;

procedure TfmGenericos.Deletar;
begin
end;

procedure TfmGenericos.FormCreate(Sender: TObject);
begin
   inherited;
   FTipo:=fmMenu.pubTipoTela;
   Caption:=fmMenu.pubTituloTela;
   SetFormStyle(fsMDIChild);
end;

procedure TfmGenericos.Novo;
begin
   tabBase.FieldByName('Codigo').AsFloat:=CodeGenerator('genericos', 'Codigo');
   tabBase.FieldByName('Tipo').AsString:=FTipo;
end;

procedure TfmGenericos.FormShow(Sender: TObject);
begin
   tabBase.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr(FTipo));
   tabBase.Open;
   inherited;
end;

procedure TfmGenericos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabBase.Close;
   inherited;
end;

procedure TfmGenericos.btnLocalizarClick(Sender: TObject);
var vParamLoc: TParametrosLocalizar;
begin
   inherited;
   vParamLoc.Table:='genericos';
   vParamLoc.KeyField:='Codigo';
   vParamLoc.Field1:='Descricao';
   vParamLoc.Filter:='Tipo = '+QuotedStr(FTipo);
   if not Assigned (fmLocalizarGenerico) then begin
      Application.CreateForm(TfmLocalizarGenerico, fmLocalizarGenerico);
      fmLocalizarGenerico.LoadParams(vParamLoc);
      fmLocalizarGenerico.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      tabBase.Locate('Codigo', fmMenu.pubTrans1, []);
   end;
end;

procedure TfmGenericos.btnNovoClick(Sender: TObject);
begin
   inherited;
   edtDescricao.SetFocus;
end;

end.

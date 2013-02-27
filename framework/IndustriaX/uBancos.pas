unit uBancos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Menus, Buttons, ExtCtrls, StdCtrls, Mask, DBCtrls, Grids,
  DBGrids, ImgList;

type
  TfmBancos = class(TfmFormBaseCadastro)
    edtCodigo: TDBEdit;
    Label1: TLabel;
    edtDescricao: TDBEdit;
    Label2: TLabel;
    dbgGenericos: TDBGrid;
    edtAgencia: TDBEdit;
    Label3: TLabel;
    edtBanco: TDBEdit;
    Label4: TLabel;
    edtConta: TDBEdit;
    Label5: TLabel;
    dbcSemValorComercial: TDBCheckBox;
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
  fmBancos: TfmBancos;

implementation

uses uFormBaseConfig, uMenu, uFuncoes, uTipos, uLocalizarGenerico;

{$R *.dfm}

procedure TfmBancos.Cancelar;
begin
end;

procedure TfmBancos.Editar;
begin
end;

function TfmBancos.Checagens: Boolean;
begin
   Result:=False;
   if Trim(edtDescricao.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Descrição');
      edtDescricao.SetFocus;
      Result:=True;
      exit;
   end;
end;

procedure TfmBancos.Deletar;
begin
end;

procedure TfmBancos.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TfmBancos.Novo;
begin
   tabBase.FieldByName('Codigo').AsFloat:=CodeGenerator('bancos', 'Codigo');
end;

procedure TfmBancos.FormShow(Sender: TObject);
begin
   tabBase.SQL.Add('SELECT * FROM bancos ORDER BY Descricao');
   tabBase.Open;
   inherited;
end;

procedure TfmBancos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabBase.Close;
   inherited;
end;

procedure TfmBancos.btnLocalizarClick(Sender: TObject);
var vParamLoc: TParametrosLocalizar;
begin
   inherited;
   vParamLoc.Table:='bancos';
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

procedure TfmBancos.btnNovoClick(Sender: TObject);
begin
   inherited;
   tabBase.FieldByName('SemValorComercial').AsInteger:=0;
   edtDescricao.SetFocus;
end;

end.

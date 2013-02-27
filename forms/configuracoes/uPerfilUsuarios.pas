unit uPerfilUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, uFormBaseCadastro, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Buttons, ExtCtrls,
  StdCtrls, Mask, DBCtrls, ComCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, cxTextEdit, cxMemo, cxDBEdit;

type
  TfmPerfilUsuarios = class(TfmFormBaseCadastro) 
    edtDescricao: TDBEdit;
    Label2: TLabel;
    edtCodigo: TDBEdit;
    Label1: TLabel;
    tevTelas: TTreeView;
    btnRestaurar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRestaurarClick(Sender: TObject);
    procedure tevTelasDblClick(Sender: TObject);
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
  fmPerfilUsuarios: TfmPerfilUsuarios;

implementation

uses uFormBase, uMenu, uFuncoes;

{$R *.dfm}

procedure TfmPerfilUsuarios.Novo;
var vTelas : string;
    vCnt : integer;
begin
   for vCnt:=0 to tevTelas.Items.Count - 1 do begin
      Application.ProcessMessages;
      if vCnt > 0 then begin
         if tevTelas.Items[vCnt].HasChildren then vTelas:=vTelas + '|' else vTelas:=vTelas + '||';
         vTelas:=vTelas + tevTelas.Items[vCnt].Text;
      end;
   end;
   tabBase.FieldByName('CodigoPerfil').AsFloat:=CodeGenerator('usuarios_perfil', 'CodigoPerfil');
   tabBase.FieldByName('Telas').AsString:=vTelas;
end;

procedure TfmPerfilUsuarios.Editar;
var vTelas : string;
    vCnt : integer;
begin
   for vCnt:=0 to tevTelas.Items.Count - 1 do begin
      Application.ProcessMessages;
      if vCnt > 0 then begin
         if tevTelas.Items[vCnt].HasChildren then vTelas := vTelas + '|' else vTelas:=vTelas + '||';
         vTelas:=vTelas + tevTelas.Items[vCnt].Text
      end;
   end;
   tabBase.FieldByName('Telas').AsString:=vTelas;
end;

procedure TfmPerfilUsuarios.Cancelar;
begin
end;

procedure TfmPerfilUsuarios.Deletar;
begin
end;

function TfmPerfilUsuarios.Checagens: Boolean;
begin
   Result:=False;
end;

procedure TfmPerfilUsuarios.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TfmPerfilUsuarios.FormShow(Sender: TObject);
begin
   inherited;
   tabBase.SQL.Add('SELECT * FROM usuarios_perfil ORDER BY Descricao');
   tabBase.Open;
end;

procedure TfmPerfilUsuarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabBase.Close;
   inherited;
end;

procedure TfmPerfilUsuarios.btnRestaurarClick(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      AtzTree(tevTelas, fmMenu.mnmMenu, fmMenu.Menu);
   end;
end;

procedure TfmPerfilUsuarios.tevTelasDblClick(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      tevTelas.Selected.Delete;
   end;
end;

procedure TfmPerfilUsuarios.btnNovoClick(Sender: TObject);
begin
   inherited;
   btnRestaurar.Click;
end;

end.

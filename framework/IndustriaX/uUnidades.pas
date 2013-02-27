unit uUnidades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Menus, Buttons, ExtCtrls, Grids, DBGrids, StdCtrls, Mask,
  DBCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxSpinEdit, cxDBEdit;

type
  TfmUnidades = class(TfmFormBaseCadastro)
    Label1: TLabel;
    Label2: TLabel;
    edtCodigo: TDBEdit;
    edtCompleto: TDBEdit;
    dbgUnidades: TDBGrid;
    Label3: TLabel;
    edtSigla: TDBEdit;
    lbl1: TLabel;
    edtQuantidade: TcxDBSpinEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtSiglaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Novo; override;
    procedure Editar; override;
    procedure Deletar; override;
    procedure Cancelar; override;
    function Checagens: Boolean; override;
  end;

var
  fmUnidades: TfmUnidades;

implementation

uses uMenu, uFuncoes, uFormBase;

{$R *.dfm}

procedure TfmUnidades.FormShow(Sender: TObject);
begin
   inherited;
   tabBase.SQL.Add('SELECT * FROM unidades');
   tabBase.Open;
end;

procedure TfmUnidades.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabBase.Close;
   inherited;
end;

procedure TfmUnidades.Editar;
begin
end;

procedure TfmUnidades.Cancelar;
begin

end;

function TfmUnidades.Checagens: Boolean;
begin
   Result:=False;
   if Trim(edtSigla.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Sigla');
      edtSigla.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtCompleto.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Nome Completo');
      edtCompleto.SetFocus;
      Result:=True;
      exit;
   end;
end;

procedure TfmUnidades.Deletar;
begin
end;

procedure TfmUnidades.Novo;
begin
   tabBase.FieldByName('Codigo').AsFloat:=CodeGenerator('unidades', 'Codigo');
end;

procedure TfmUnidades.edtSiglaKeyPress(Sender: TObject; var Key: Char);
begin
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Key = #32 then Key:=#0 else Key:=UpCase(Key);
   end;
end;

procedure TfmUnidades.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

end.

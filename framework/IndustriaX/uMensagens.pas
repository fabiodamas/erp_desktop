unit uMensagens;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Menus, Buttons, ExtCtrls, StdCtrls, Mask, DBCtrls, Grids,
  DBGrids, ImgList, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxCheckBox, cxMemo, cxCalendar, cxTimeEdit;

type
  TfmMensagens = class(TfmFormBaseCadastro)
    tvwMensagem: TcxGridDBTableView;
    lvlMensagem: TcxGridLevel;
    dbgMensagem: TcxGrid;
    clmMensagemCodigoMensagem: TcxGridDBColumn;
    clmMensagemUsuarioOrigem: TcxGridDBColumn;
    clmMensagemCodigoPerfilDestino: TcxGridDBColumn;
    clmMensagemUsuario: TcxGridDBColumn;
    clmMensagemDataEnvio: TcxGridDBColumn;
    clmMensagemHoraEnvio: TcxGridDBColumn;
    clmMensagemDataLeitura: TcxGridDBColumn;
    clmMensagemHoraLeitura: TcxGridDBColumn;
    clmMensagemConfirmarLeitura: TcxGridDBColumn;
    clmMensagemOrigem: TcxGridDBColumn;
    clmMensagemDescricao: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
    procedure Novo; override;
    procedure Editar; override;
    procedure Deletar; override;
    procedure Cancelar; override;
    function Checagens: Boolean; override;
  end;

var
  fmMensagens: TfmMensagens;

implementation

uses uFormBaseConfig, uMenu, uFuncoes;

{$R *.dfm}

procedure TfmMensagens.Novo;
begin

end;

procedure TfmMensagens.Editar;
begin
end;

procedure TfmMensagens.Cancelar;
begin
end;

function TfmMensagens.Checagens: Boolean;
begin
end;

procedure TfmMensagens.Deletar;
begin
end;

procedure TfmMensagens.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TfmMensagens.FormShow(Sender: TObject);
begin
   tabBase.SQL.Clear;
   tabBase.SQL.Add('SELECT * FROM mensagem ');
   tabBase.SQL.Add('         where usuario = ' + QuotedStr(fmMenu.pubUsuario) );
   tabBase.SQL.Add('         ORDER BY CodigoMensagem DESC ');
   tabBase.Open;

   inherited;
end;

procedure TfmMensagens.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabBase.Close;
   inherited;
end;

end.

unit uUsuariosLogados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, Grids, DBGrids, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, StdCtrls, Buttons, Menus, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, ExtCtrls, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid;

type
  TfmUsuariosLogados = class(TfmFormBaseAvancado)
    tabUsuariosLogados: TZQuery;
    dtsUsuariosLogados: TDataSource;
    tvwUsuariosLogados: TcxGridDBTableView;
    lvlUsuariosLogados: TcxGridLevel;
    dbgUsuariosLogados: TcxGrid;
    pnl1: TPanel;
    btnFechar: TBitBtn;
    clmUsuariosLogadosUsuario: TcxGridDBColumn;
    clmUsuariosLogadosComputador: TcxGridDBColumn;
    clmUsuariosLogadosDataLogin: TcxGridDBColumn;
    clmUsuariosLogadosDataLogoff: TcxGridDBColumn;
    clmUsuariosLogadosexecutavel: TcxGridDBColumn;
    stlCores: TcxStyleRepository;
    cstCorBranca: TcxStyle;
    cstCorAzul: TcxStyle;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure dbgUsuariosLogadosDrawDataCell(Sender: TObject;
      const Rect: TRect; Field: TField; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmUsuariosLogados: TfmUsuariosLogados;

implementation

uses uFormBase;

{$R *.dfm}

procedure TfmUsuariosLogados.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TfmUsuariosLogados.FormShow(Sender: TObject);
begin
   inherited;
   tabUsuariosLogados.SQL.Clear;
   tabUsuariosLogados.SQL.Add('SELECT * FROM usuarios_logados order by DataLogin desc');
   tabUsuariosLogados.Open;
end;

procedure TfmUsuariosLogados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabUsuariosLogados.Close;
   inherited;
end;

procedure TfmUsuariosLogados.btnFecharClick(Sender: TObject);
begin
   inherited;
   Close;
end;

procedure TfmUsuariosLogados.dbgUsuariosLogadosDrawDataCell(
  Sender: TObject; const Rect: TRect; Field: TField;
  State: TGridDrawState);
begin
  inherited;
   if Field <> nil then begin
      if Field.DataSet.FieldByName('DataLogin').IsNull then begin
         (Sender as TDBGrid).Canvas.Font.Color:=clRed;
       end
      else begin
         (Sender as TDBGrid).Canvas.Font.Color:=clGreen;
      end;
   end;
end;

end.

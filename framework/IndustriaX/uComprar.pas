unit uComprar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, StdCtrls, jpeg, cxImage, JvGIF, ShellApi;

type
  TfmComprar = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    btn1: TButton;
    lbl6: TLabel;
    lbl3: TLabel;
    lbl7: TLabel;
    img2: TcxImage;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl8: TLabel;
    img1: TcxImage;
    procedure img1Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmComprar: TfmComprar;

implementation

{$R *.dfm}

procedure TfmComprar.img1Click(Sender: TObject);
begin
  ShellExecute(0, 'open', PChar('http://www.softwarepi.com.br/index.php/precos'), nil, nil, SW_SHOWNORMAL)
end;

procedure TfmComprar.btn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfmComprar.FormCreate(Sender: TObject);
var
  hwndHandle: THANDLE;
  hMenuHandle: HMenu;
begin
  hwndHandle := Self.Handle;
  if (hwndHandle <> 0) then
  begin
    hMenuHandle := GetSystemMenu(hwndHandle, FALSE);
    if (hMenuHandle <> 0) then
      DeleteMenu(hMenuHandle, SC_CLOSE, MF_BYCOMMAND);
  end;
end;  

end.


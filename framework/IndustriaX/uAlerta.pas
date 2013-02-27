unit uAlerta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ExtCtrls;

type
  TfrmAlerta = class(TForm)
    lbl2: TLabel;
    retAviso: TRichEdit;
    pnl1: TPanel;
    btn1: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    pubCodigoMensagem : Real;

  end;

var
  frmAlerta: TfrmAlerta;
  vAcao : TCloseAction;

implementation

uses uMenu;

{$R *.dfm}

procedure TfrmAlerta.FormClose(Sender: TObject; var Action: TCloseAction);
var vTabMensagem : TZQuery;
begin
  Action := vAcao;

end;

procedure TfrmAlerta.btn1Click(Sender: TObject);
var
 vTabMensagem : TZQuery;
begin
    if pubCodigoMensagem <> 0 then
    begin
        vTabMensagem                   := TZQuery.Create(nil);
        vTabMensagem.Connection        := fmMenu.zcnConexao;

        vTabMensagem.SQL.Add('SELECT * from mensagem where CodigoMensagem = ' + FloatToStr(pubCodigoMensagem) );
        vTabMensagem.Open;

        vTabMensagem.Edit;
        vTabMensagem.FieldByName('ConfirmarLeitura').AsInteger := 1;
        vTabMensagem.FieldByName('DataLeitura').AsDateTime := Date;
        vTabMensagem.FieldByName('HoraLeitura').AsDateTime := Time;
        vTabMensagem.Post;

        fmMenu.tmrAvisoTimer(Sender);

        vAcao := caFree;

        Close;
    end;
end;

procedure TfrmAlerta.FormShow(Sender: TObject);
var
  hwndHandle : THANDLE;
  hMenuHandle : HMenu;
begin
  vAcao := caNone;

  hwndHandle := Self.Handle;

  if (hwndHandle <> 0) then
  begin
    hMenuHandle := GetSystemMenu(hwndHandle, FALSE);

    if (hMenuHandle <> 0) then
      DeleteMenu(hMenuHandle, SC_CLOSE, MF_BYCOMMAND);
  end;

end;

procedure TfrmAlerta.FormCreate(Sender: TObject);
var
  hwndHandle : THANDLE;
  hMenuHandle : HMenu;
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

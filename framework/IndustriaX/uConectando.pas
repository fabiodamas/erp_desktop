unit uConectando;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TfmConectando = class(TForm)
    pnlStatus: TPanel;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmConectando: TfmConectando;

implementation

{$R *.dfm}

procedure TfmConectando.FormActivate(Sender: TObject);
begin
  Application.ProcessMessages;
  Self.Update;
end;

end.

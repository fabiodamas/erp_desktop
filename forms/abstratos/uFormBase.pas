unit uFormBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, DB;

type
  TfmFormBase = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure SetFormStyle(Style: TFormStyle = fsNormal);
    procedure SetFontStyle(FontName: TFontname = 'Tahoma');
  end;

var
  fmFormBase: TfmFormBase;

implementation

{$R *.dfm}

procedure TfmFormBase.SetFormStyle(Style: TFormStyle = fsNormal); 
begin
   Visible:=False;
   FormStyle:=Style;
end;

procedure TfmFormBase.SetFontStyle(FontName: TFontname = 'Tahoma');
begin
   Font.Name:=FontName;
end; 

procedure TfmFormBase.FormCreate(Sender: TObject);
begin
   SetFontStyle();
   SetFormStyle();
end;

end.

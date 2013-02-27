unit uConfigPerfilUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, Buttons, Menus;

type
  TfmConfigPerfilUsuario = class(TfmFormBaseAvancado)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmConfigPerfilUsuario: TfmConfigPerfilUsuario;

implementation

uses uFormBase, uMenu;

{$R *.dfm}

procedure TfmConfigPerfilUsuario.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

end.

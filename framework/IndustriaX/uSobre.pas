unit uSobre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, Menus;

type
  TfmSobre = class(TfmFormBaseAvancado)
    lblSistema: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    lblVersao: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSobre: TfmSobre;

implementation

uses uFormBase, uMenu;

{$R *.dfm}

procedure TfmSobre.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TfmSobre.FormClick(Sender: TObject);
begin
   inherited;
   Close;
end;

procedure TfmSobre.FormShow(Sender: TObject);
begin
   inherited;
   lblVersao.Caption:='Versão: ' + fmMenu.pubVersao + ' Atualizado em: ' + fmMenu.pubDataBuild;
end;

end.

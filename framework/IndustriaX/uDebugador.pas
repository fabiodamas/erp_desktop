unit uDebugador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvExControls, uFormBaseCadastro, JvEditorCommon, JvEditor,
  JvHLEditor, ExtCtrls, StdCtrls, ZDataSet;

type
  TfmDebugador = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    jedEditor: TJvHLEditor;
    lstQuery: TListBox;
    procedure lstQueryClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    Formulario: TForm;
  end;

var
  fmDebugador: TfmDebugador;

implementation

{$R *.dfm}

procedure TfmDebugador.lstQueryClick(Sender: TObject);
var
  li_Contador : integer;
begin
  inherited;

  if lstQuery.ItemIndex <> -1 then
  begin
    for li_Contador := 0 to Formulario.ComponentCount - 1 do
    begin
      if Formulario.Components[li_Contador] is TZQuery then
      begin

        if (Formulario.Components[li_Contador] as TZQuery).Name = lstQuery.Items[lstQuery.ItemIndex] then
        begin
          jedEditor.Lines.Text := (Formulario.Components[li_Contador] as TZQuery).SQL.Text;
          Exit;
        end;
      end;
    end;
  end;

end;

procedure TfmDebugador.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=caFree; 
end;

end.


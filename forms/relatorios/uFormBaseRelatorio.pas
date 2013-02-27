unit uFormBaseRelatorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, Buttons, ExtCtrls, QuickRpt,
  QRCtrls, Menus, uTipos, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, QRPDFFilt;

type
  TfmFormBaseRelatorio = class(TfmFormBaseAvancado)
    btnVisualizar: TBitBtn;
    btnImprimir: TBitBtn;
    btnFechar: TBitBtn;
    btnOpcoes: TBitBtn;
    popOpcoes: TPopupMenu;
    procedure FormCreate(Sender: TObject);
    procedure btnOpcoesClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
  public
  end;

var
  fmFormBaseRelatorio: TfmFormBaseRelatorio;

implementation

uses uFormBase, uMenu, uFuncoes, uConstantes;

{$R *.dfm} 

procedure TfmFormBaseRelatorio.FormCreate(Sender: TObject);
begin
   inherited;
   if FindComponent('qrlSignature') <> nil then begin
      TQRLabel(FindComponent('qrlSignature')).Caption:=corp_signature;
   end;
   if FindComponent('qrlSignEmail') <> nil then begin
      TQRLabel(FindComponent('qrlSignEmail')).Caption:=corp_signature_email;
   end;   
end;

procedure TfmFormBaseRelatorio.btnOpcoesClick(Sender: TObject);
begin
   inherited;
   popOpcoes.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TfmFormBaseRelatorio.btnFecharClick(Sender: TObject);
begin
   Close;
end;

end.

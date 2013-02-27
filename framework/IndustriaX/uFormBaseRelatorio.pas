unit uFormBaseRelatorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, Buttons, ExtCtrls, QuickRpt,
  QRCtrls;

type
  TfmFormBaseRelatorio = class(TfmFormBaseAvancado)
    btn_visualizar: TBitBtn;
    btn_imprimir: TBitBtn;
    btn_fechar: TBitBtn;
    grb_campos_relatorio: TGroupBox;
    QuickRep1: TQuickRep;
    QRSubDetail1: TQRSubDetail;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmFormBaseRelatorio: TfmFormBaseRelatorio;

implementation

{$R *.dfm}

procedure TfmFormBaseRelatorio.FormCreate(Sender: TObject);
var vCnt : Integer;
    vCheckBox : TCheckBox;
    vCountCheckBox, vTop, vCount : Integer;
begin
   inherited;

   vCountCheckBox:=0;
   vCount:=0;
   vTop:=24;

   for vCnt:=0 to ComponentCount-1 do begin
      if Components[vCnt] is TQRDBText then begin
         if Trim((Components[vCnt] as TQRDBText).DataField) <> '' then begin

            vCountCheckBox:=vCountCheckBox+1;
            vCount:=vCount + 1;

            if vCountCheckBox = 1 then begin
               vCheckBox:=TCheckBox.Create(grb_campos_relatorio);
               vCheckBox.Parent:=grb_campos_relatorio; 
               vCheckBox.Left:=8;
               vCheckBox.Top:=vTop; 
               vCheckBox.Caption:=(Components[vCnt] as TQRDBText).Caption; 
               vCheckBox.Checked:=True;
               grb_campos_relatorio.Height:=vCheckBox.Top + 30;
            end; 

            if vCountCheckBox = 2 then begin
               vCheckBox:=TCheckBox.Create(grb_campos_relatorio);
               vCheckBox.Parent:=grb_campos_relatorio;
               vCheckBox.Left:=117;
               vCheckBox.Top:=vTop;
               vCheckBox.Caption:=(Components[vCnt] as TQRDBText).Caption;
               vCheckBox.Checked:=True;
               grb_campos_relatorio.Height:=vCheckBox.Top + 30;
            end; 

            if vCountCheckBox = 3 then begin
               vCheckBox:=TCheckBox.Create(grb_campos_relatorio);
               vCheckBox.Parent:=grb_campos_relatorio;
               vCheckBox.Left:=229;
               vCheckBox.Top:=vTop;
               vCheckBox.Caption:=(Components[vCnt] as TQRDBText).Caption;
               vCheckBox.Checked:=True;
               grb_campos_relatorio.Height:=vCheckBox.Top + 30;
            end;            

            if vCountCheckBox = 3 then begin
               vCountCheckBox:=0;
               vTop:=vTop + 24;
            end;
         end;
      end;
   end;

   if Height <= grb_campos_relatorio.Height then begin
      Height:=grb_campos_relatorio.Height + 38; 
   end;
end;

end.

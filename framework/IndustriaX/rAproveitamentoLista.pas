unit rAproveitamentoLista;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, QRCtrls, QuickRpt, ExtCtrls,
  Printers, Menus;

type
  TrtAproveitamentoLista = class(TfmFormBaseRelatorio)
    procedure btn_imprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rtAproveitamentoLista: TrtAproveitamentoLista;

implementation     

uses uFormBaseConfig;

{$R *.dfm}

procedure TrtAproveitamentoLista.btn_imprimirClick(Sender: TObject);
begin
//   if vImprime = True then begin
//      if pnd_impressao.Execute then begin
//         qrp_lista.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
//         qrp_lista.Print;
//      end;
//    end
//   else begin
//      qrp_lista.PreviewModal;
//   end;
//   vImprime:=True;
end;

procedure TrtAproveitamentoLista.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TrtAproveitamentoLista.btn_fecharClick(Sender: TObject);
begin
   Close;
end;

end.

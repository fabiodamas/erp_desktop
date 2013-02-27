unit rEmissaoFormasPagto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls;

type
  TrtEmissaoFormasPagto = class(TfmFormBaseRelatorio)
    tabBase: TZQuery;
    pndDialogo: TPrintDialog;
    qrpFormasPagto: TQuickRep;
    QRSubDetail1: TQRSubDetail;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    qrlSignature: TQRLabel;
    QRDBText3: TQRDBText;
    QRShape1: TQRShape;
    qrlTitulo: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape2: TQRShape;
    QRSysData2: TQRSysData;
    QRDBText7: TQRDBText;
    rdgOrdemEmissao: TRadioGroup;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
     procedure GerarImpressao(Impressora: Boolean = False);
  public
  end;

implementation

uses uFormBase, uMenu, uFuncoes, rEmissaoCentroCusto;

{$R *.dfm}

procedure TrtEmissaoFormasPagto.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TrtEmissaoFormasPagto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabBase.Close;
   inherited;
end;

procedure TrtEmissaoFormasPagto.btnVisualizarClick(Sender: TObject);
begin
   inherited;
   GerarImpressao();
end;

procedure TrtEmissaoFormasPagto.GerarImpressao(Impressora: Boolean = False);
begin
   tabBase.Close;
   tabBase.SQL.Clear;
   tabBase.SQL.Add('SELECT * FROM formas_pagamento');
   tabBase.SQL.Add('ORDER BY');
   case rdgOrdemEmissao.ItemIndex of
      0: tabBase.SQL.Add('Codigo');
      1: tabBase.SQL.Add('Descricao');
      2: tabBase.SQL.Add('Parcelas');
   end;

   tabBase.Open;

   if Impressora = True then begin
      if pndDialogo.Execute then begin
         qrpFormasPagto.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
         qrpFormasPagto.Print;
      end;
    end
   else begin
      qrpFormasPagto.PreviewModal;
   end;
end;

procedure TrtEmissaoFormasPagto.btnImprimirClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(True);
end;

end.

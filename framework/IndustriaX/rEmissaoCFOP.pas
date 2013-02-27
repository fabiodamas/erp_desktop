unit rEmissaoCFOP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls;

type
  TrtEmissaoCFOP = class(TfmFormBaseRelatorio)
    tabBase: TZQuery;
    pndDialogo: TPrintDialog;
    qrpCFOP: TQuickRep;
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

procedure TrtEmissaoCFOP.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TrtEmissaoCFOP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabBase.Close;
   inherited;
end;

procedure TrtEmissaoCFOP.btnVisualizarClick(Sender: TObject);
begin
   inherited;
   GerarImpressao();
end;

procedure TrtEmissaoCFOP.GerarImpressao(Impressora: Boolean = False);
begin
   tabBase.Close;
   tabBase.SQL.Clear;
   tabBase.SQL.Add('SELECT * FROM cfop');
   tabBase.SQL.Add('ORDER BY');
   case rdgOrdemEmissao.ItemIndex of
      0: tabBase.SQL.Add('CFOP');
      1: tabBase.SQL.Add('NaturezaOperacao');
   end;

   tabBase.Open;

   if Impressora = True then begin
      if pndDialogo.Execute then begin
         qrpCFOP.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
         qrpCFOP.Print;
      end;
    end
   else begin
      qrpCFOP.PreviewModal;
   end;
end;

procedure TrtEmissaoCFOP.btnImprimirClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(True); // OHHTEL
end;

end.

unit rEmissaoCentroCusto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls;

type
  TrtEmissaoCentroCusto = class(TfmFormBaseRelatorio)
    tabBase: TZQuery;
    pndDialogo: TPrintDialog;
    qrpCC: TQuickRep;
    QRSubDetail1: TQRSubDetail;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    qrlSignature: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRShape1: TQRShape;
    qrlTitulo: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape2: TQRShape;
    QRSysData2: TQRSysData;
    QRDBText7: TQRDBText;
    Label1: TLabel;
    rdgOrdemEmissao: TRadioGroup;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    edtFamilia: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
     procedure GerarImpressao(Impressora: Boolean = False);
  public
  end;

implementation

uses uFormBase, uMenu, uFuncoes;

{$R *.dfm}

procedure TrtEmissaoCentroCusto.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TrtEmissaoCentroCusto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabBase.Close;
   inherited;
end;

procedure TrtEmissaoCentroCusto.btnVisualizarClick(Sender: TObject);
begin
   inherited;
   GerarImpressao();
end;

procedure TrtEmissaoCentroCusto.GerarImpressao(Impressora: Boolean = False);
begin
  qrlTitulo.Caption:='Centro de Custo';

   tabBase.Close;
   tabBase.SQL.Clear;
   tabBase.SQL.Add('SELECT * FROM centro_custo');

   if Trim(edtFamilia.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Familia: '+edtFamilia.Text;
      tabBase.SQL.Add('WHERE Familia = '+QuotedStr(edtFamilia.Text));
   end;

   tabBase.SQL.Add('ORDER BY');
   case rdgOrdemEmissao.ItemIndex of
      0: tabBase.SQL.Add('Codigo');
      1: tabBase.SQL.Add('Familia');
      2: tabBase.SQL.Add('Descricao');
   end;

   tabBase.Open;

   if Impressora = True then begin
      if pndDialogo.Execute then begin
         qrpCC.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
         qrpCC.Print;
      end;
    end
   else begin
      qrpCC.PreviewModal;
   end;
end;

procedure TrtEmissaoCentroCusto.btnImprimirClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(True);
end;

end.

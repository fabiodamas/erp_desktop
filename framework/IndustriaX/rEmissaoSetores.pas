unit rEmissaoSetores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls;

type
  TrtEmissaoSetores = class(TfmFormBaseRelatorio)
    tabBase: TZQuery;
    pndDialogo: TPrintDialog;
    qrpSetor: TQuickRep;
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
    edtSetor: TEdit;
    Label8: TLabel;
    qrlTotal: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrpSetorBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
     procedure GerarImpressao(Impressora: Boolean = False);
  public
  end;

var
   vTotalSet : real;

implementation

uses uFormBase, uMenu, uFuncoes;

{$R *.dfm}

procedure TrtEmissaoSetores.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TrtEmissaoSetores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabBase.Close;
   inherited;
end;

procedure TrtEmissaoSetores.btnVisualizarClick(Sender: TObject);
begin
   inherited;
   GerarImpressao();
end;

procedure TrtEmissaoSetores.GerarImpressao(Impressora: Boolean = False);
begin
   qrlTitulo.Caption:='Setores';

   tabBase.Close;
   tabBase.SQL.Clear;
   tabBase.SQL.Add('SELECT setor.Codigo, setor.Setor, setor.Bairro, setor.Estado, ');
   tabBase.SQL.Add('cidades.Cidade');
   tabBase.SQL.Add('FROM setor');
   tabBase.SQL.Add('LEFT JOIN cidades ON setor.CodigoCidade = cidades.CodigoCidade');

   if Trim(edtSetor.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Setor: '+edtSetor.Text;
      tabBase.SQL.Add('WHERE Setor = '+QuotedStr(edtSetor.Text));
   end;

   tabBase.SQL.Add('ORDER BY');
   case rdgOrdemEmissao.ItemIndex of
      0: tabBase.SQL.Add('Codigo');
      1: tabBase.SQL.Add('Setor');
      2: tabBase.SQL.Add('Bairro');
      3: tabBase.SQL.Add('Estado');
      4: tabBase.SQL.Add('Cidade');  
   end;

   tabBase.Open;

   vTotalSet:=0; 

   if Impressora = True then begin
      if pndDialogo.Execute then begin
         qrpSetor.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
         qrpSetor.Print;
      end;
    end
   else begin
      qrpSetor.PreviewModal; 
   end;
end;

procedure TrtEmissaoSetores.btnImprimirClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(True);
end;

procedure TrtEmissaoSetores.QRSubDetail1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
   inherited;
   vTotalSet:=vTotalSet + 1;
   qrlTotal.Caption:='Total de Setores: '+FloatToStr(vTotalSet);
end;

procedure TrtEmissaoSetores.qrpSetorBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   inherited;
   vTotalSet:=0;
end;

end.

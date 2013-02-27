unit rEtiquetasProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls, qrBarcode;

type
  TrtEtiquetasProdutos = class(TfmFormBaseRelatorio)
    tabBase: TZQuery;
    pndDialogo: TPrintDialog;
    qrpProdutos: TQuickRep;
    QRSubDetail1: TQRSubDetail;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRDBText3: TQRDBText;
    Label1: TLabel;
    rdgOrdemEmissao: TRadioGroup;
    edtCodigoProduto: TEdit;
    QRDBText1: TQRDBText;
    qrsCodigoBarras: TQRAsBarcode;
    QRShape1: TQRShape;
    edtGrupo: TDBLookupComboBox;
    Label2: TLabel;
    tabGrupo: TZQuery;
    dtsGrupo: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormShow(Sender: TObject);
  private
    procedure GerarImpressao(Impressora: Boolean = False);
  public
  end;

implementation

uses uFormBase, uMenu, uFuncoes;

{$R *.dfm}

procedure TrtEtiquetasProdutos.FormCreate(Sender: TObject);
begin
  inherited;
  SetFormStyle(fsMDIChild);
end;

procedure TrtEtiquetasProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tabBase.Close;
  tabGrupo.Close;
  inherited;
end;

procedure TrtEtiquetasProdutos.btnVisualizarClick(Sender: TObject);
begin
  inherited;
  GerarImpressao();
end;

procedure TrtEtiquetasProdutos.GerarImpressao(Impressora: Boolean = False);
var vWhere: string;
begin
  vWhere:='';

  tabBase.Close;
  tabBase.SQL.Clear;
  tabBase.SQL.Add('SELECT * FROM produtos');

  if Trim(edtCodigoProduto.Text) <> '' then
  begin
    if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
    vWhere:=vWhere + 'CodigoProduto = '+QuotedStr(edtCodigoProduto.Text);
  end;

  if Trim(edtGrupo.Text) <> '' then
  begin
    if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
    vWhere:=vWhere + 'CodigoGrupo = '+QuotedStr(String(edtGrupo.KeyValue));
  end; 

  if Trim(vWhere) <> '' then
  begin
    tabBase.SQL.Add('WHERE '+vWhere);
  end;

  tabBase.SQL.Add('ORDER BY');
  case rdgOrdemEmissao.ItemIndex of
    0: tabBase.SQL.Add('CodigoProduto');
    1: tabBase.SQL.Add('NomeTecnico');
  end;

  tabBase.Open;

  if Impressora = True then
  begin
    if pndDialogo.Execute then
    begin
      qrpProdutos.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
      qrpProdutos.Print;
    end;
   end
  else
  begin
    qrpProdutos.PreviewModal;
  end;  
end;

procedure TrtEtiquetasProdutos.btnImprimirClick(Sender: TObject);
begin
  inherited;
  GerarImpressao(True);
end;

procedure TrtEtiquetasProdutos.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  qrsCodigoBarras.Text:=tabBase.FieldByName('CodigoProduto').AsString;
end;

procedure TrtEtiquetasProdutos.FormShow(Sender: TObject);
begin
  inherited;
  tabGrupo.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('1')+' ORDER BY Descricao');
  tabGrupo.Open;
end;

end.

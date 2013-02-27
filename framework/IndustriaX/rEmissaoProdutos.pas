unit rEmissaoProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls;

type
  TrtEmissaoProdutos = class(TfmFormBaseRelatorio)
    tabBase: TZQuery;
    pndDialogo: TPrintDialog;
    qrpProdutos: TQuickRep;
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
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    Label1: TLabel;
    edtGrupo: TDBLookupComboBox;
    tabGrupos: TZQuery;
    dtsGrupos: TDataSource;
    qrlTotal: TQRLabel;
    ckbProdutoAcabado: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrpProdutosBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
     procedure GerarImpressao(Impressora: Boolean = False);
  public
  end;

var vTotProd: real;

implementation

uses uFormBase, uMenu, uFuncoes, rEmissaoCentroCusto;

{$R *.dfm}

procedure TrtEmissaoProdutos.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TrtEmissaoProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabGrupos.Close;
   tabBase.Close;
   inherited;
end;

procedure TrtEmissaoProdutos.btnVisualizarClick(Sender: TObject);
begin
   inherited;
   GerarImpressao();
end;

procedure TrtEmissaoProdutos.GerarImpressao(Impressora: Boolean = False);
var vWhere : string;
begin
   vWhere:='';

   qrlTitulo.Caption:='Produtos';

   tabBase.Close;
   tabBase.SQL.Clear;
   tabBase.SQL.Add('SELECT produtos.CodigoProduto, produtos.NomeTecnico,');
   tabBase.SQL.Add('grp.Descricao AS Grupo');
   tabBase.SQL.Add('FROM produtos');
   tabBase.SQL.Add('LEFT JOIN genericos AS grp ON grp.Codigo = produtos.CodigoGrupo');

   if Trim(edtGrupo.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Grupo: '+edtGrupo.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere+' AND ';
      vWhere:=vWhere + 'produtos.CodigoGrupo = '+FloatToStr(edtGrupo.KeyValue);
   end;

   if ckbProdutoAcabado.Checked = True then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Produto Acabado';
      if Trim(vWhere) <> '' then vWhere:=vWhere+' AND ';
      vWhere:=vWhere + 'produtos.ProdutoAcabado = 1';
   end;

   if Trim(vWhere) <> '' then begin
      tabBase.SQL.Add('WHERE');
      tabBase.SQL.Add(vWhere);
   end;

   tabBase.SQL.Add('ORDER BY');
   case rdgOrdemEmissao.ItemIndex of
      0: tabBase.SQL.Add('CodigoProduto');
      1: tabBase.SQL.Add('NomeTecnico');
      2: tabBase.SQL.Add('CodigoGrupo');
      3: tabBase.SQL.Add('CodigoClassificacao');      
   end;

   tabBase.Open;

   vTotProd:=0;

   if Impressora = True then begin
      if pndDialogo.Execute then begin
         qrpProdutos.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
         qrpProdutos.Print;
      end;
    end
   else begin
      qrpProdutos.PreviewModal;
   end;
end;

procedure TrtEmissaoProdutos.btnImprimirClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(True);
end;

procedure TrtEmissaoProdutos.FormShow(Sender: TObject);
begin
   inherited;

   tabGrupos.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('1')+' ORDER BY Descricao');
   tabGrupos.Open;
end;

procedure TrtEmissaoProdutos.QRSubDetail1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
   inherited;
   vTotProd:=vTotProd + 1;
   qrlTotal.Caption:='Total de Produtos: '+FloatToStr(vTotProd);
end;

procedure TrtEmissaoProdutos.qrpProdutosBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   inherited;
   vTotProd:=0; 
end;

end.

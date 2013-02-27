unit rEmissaoEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls;

type
  TrtEmissaoEstoque = class(TfmFormBaseRelatorio)
    tabBase: TZQuery;
    pndDialogo: TPrintDialog;
    qrpEmissaoEstoque: TQuickRep;
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
    tabChecagens: TZQuery;
    QRSysData2: TQRSysData;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    edtGrupo: TDBLookupComboBox;
    Label1: TLabel;
    rdgOrdemEmissao: TRadioGroup;
    tabGrupos: TZQuery;
    dtsGrupos: TDataSource;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    ckbProdutoAcabado: TCheckBox;
    rdgEstoque: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
     procedure GerarImpressao(Impressora: Boolean = False);
  public
  end;

implementation

uses uFormBase, uMenu, uFuncoes;

{$R *.dfm}

procedure TrtEmissaoEstoque.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TrtEmissaoEstoque.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabGrupos.Close;
   tabBase.Close;
   inherited;
end;

procedure TrtEmissaoEstoque.btnVisualizarClick(Sender: TObject);
begin
   inherited;
   GerarImpressao();
end;

procedure TrtEmissaoEstoque.GerarImpressao(Impressora: Boolean = False);
begin
   tabBase.Close;
   tabBase.SQL.Clear;
   tabBase.SQL.Add('SELECT produtos.CodigoProduto, produtos.NomeTecnico,');
   tabBase.SQL.Add('produtos_status_estoque.Estoque AS Estoque, produtos_status_estoque.Interno AS Interno');
   tabBase.SQL.Add('FROM produtos, produtos_status_estoque');
   tabBase.SQL.Add('WHERE produtos.CodigoProduto = produtos_status_estoque.CodigoProduto'); 

   qrlTitulo.Caption:='Estoque';

   if Trim(edtGrupo.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Grupo: '+edtGrupo.Text;
      tabBase.SQL.Add('AND produtos.CodigoGrupo = '+FloatToStr(edtGrupo.KeyValue));
   end;
   if ckbProdutoAcabado.Checked = True then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Produto Acabado';
      tabBase.SQL.Add('AND produtos.ProdutoAcabado = 1');
   end;

   case rdgEstoque.ItemIndex of
      1: tabBase.SQL.Add('AND produtos_status_estoque.Estoque > 0');
      2: tabBase.SQL.Add('AND produtos_status_estoque.Estoque <= 0'); 
   end;

   tabBase.SQL.Add('ORDER BY');
   case rdgOrdemEmissao.ItemIndex of
      0: tabBase.SQL.Add('produtos.CodigoProduto');
      1: tabBase.SQL.Add('produtos.NomeTecnico');
      2: tabBase.SQL.Add('produtos_status_estoque.Estoque');
      3: tabBase.SQL.Add('produtos_status_estoque.Interno');
   end;

   tabBase.Open;

   if Impressora = True then begin
      if pndDialogo.Execute then begin
         qrpEmissaoEstoque.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
         qrpEmissaoEstoque.Print;
      end;
    end
   else begin
      qrpEmissaoEstoque.PreviewModal;
   end;
end;

procedure TrtEmissaoEstoque.btnImprimirClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(True);
end;

procedure TrtEmissaoEstoque.FormShow(Sender: TObject);
begin
   inherited;
   tabGrupos.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('1')+' ORDER BY Descricao');
   tabGrupos.Open;
end;

end.

unit rReposicaoEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls;

type
  TrtReposicaoEstoque = class(TfmFormBaseRelatorio)
    tabBase: TZQuery;
    pndDialogo: TPrintDialog;
    qrpReposicaoEstoque: TQuickRep;
    QRSubDetail1: TQRSubDetail;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    qrlSignature: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRShape1: TQRShape;
    qrlTitulo: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape2: TQRShape;
    tabChecagens: TZQuery;
    QRSysData2: TQRSysData;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    edtGrupo: TDBLookupComboBox;
    Label1: TLabel;
    rdgStatusEstoque: TRadioGroup;
    rdgOrdemEmissao: TRadioGroup;
    tabGrupos: TZQuery;
    dtsGrupos: TDataSource;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    qrlReposicao: TQRLabel;
    ckbProdutoAcabado: TCheckBox;
    rdgEstoque: TRadioGroup;
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

var
   vTotQtd: real;

implementation

uses uFormBase, uMenu, uFuncoes;

{$R *.dfm}

procedure TrtReposicaoEstoque.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TrtReposicaoEstoque.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabGrupos.Close;
   tabBase.Close;
   inherited;
end;

procedure TrtReposicaoEstoque.btnVisualizarClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(); 
end;

procedure TrtReposicaoEstoque.GerarImpressao(Impressora: Boolean = False);
begin
   qrlTitulo.Caption:='Reposição de Estoque';

   tabBase.Close;
   tabBase.SQL.Clear; 
   tabBase.SQL.Add('SELECT produtos.CodigoProduto, produtos.NomeTecnico,');
   tabBase.SQL.Add('produtos.PontoReposicao AS Minimo, genericos.Descricao AS Grupo,');
   tabBase.SQL.Add('produtos_status_estoque.Estoque AS Saldo, produtos_status_estoque.Interno AS Interno');
   tabBase.SQL.Add('FROM produtos, genericos, produtos_status_estoque');
   tabBase.SQL.Add('WHERE produtos.CodigoGrupo = genericos.Codigo');
   tabBase.SQL.Add('AND produtos.CodigoProduto = produtos_status_estoque.CodigoProduto'); 

   case rdgStatusEstoque.ItemIndex of
      1: tabBase.SQL.Add('AND produtos_status_estoque.Estoque < produtos.PontoReposicao');
      2: tabBase.SQL.Add('AND produtos_status_estoque.Estoque = produtos.PontoReposicao');
      3: tabBase.SQL.Add('AND produtos_status_estoque.Estoque > produtos.PontoReposicao');
   end;    

   case rdgEstoque.ItemIndex of
      1: tabBase.SQL.Add('AND produtos_status_estoque.Estoque > 0');
      2: tabBase.SQL.Add('AND produtos_status_estoque.Estoque <= 0');
   end;
   
   if Trim(edtGrupo.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Grupo: '+edtGrupo.Text;
      tabBase.SQL.Add('AND produtos.CodigoGrupo = '+FloatToStr(edtGrupo.KeyValue));
   end;
   if ckbProdutoAcabado.Checked = True then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Produto Acabado';
      tabBase.SQL.Add('AND produtos.ProdutoAcabado = 1');
   end;

   tabBase.SQL.Add('ORDER BY');
   case rdgOrdemEmissao.ItemIndex of
      0: tabBase.SQL.Add('produtos.CodigoProduto');
      1: tabBase.SQL.Add('produtos.NomeTecnico');
      2: tabBase.SQL.Add('genericos.Descricao');
      3: tabBase.SQL.Add('produtos.PontoReposicao');
      4: tabBase.SQL.Add('produtos_status_estoque.Estoque');
      5: tabBase.SQL.Add('produtos_status_estoque.Interno');
   end;

   tabBase.Open;

   vTotQtd:=0;

   if Impressora = True then begin
      if pndDialogo.Execute then begin
         qrpReposicaoEstoque.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
         qrpReposicaoEstoque.Print;
      end;
    end
   else begin
      qrpReposicaoEstoque.PreviewModal;
   end;
end;

procedure TrtReposicaoEstoque.btnImprimirClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(True);  
end;

procedure TrtReposicaoEstoque.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   inherited;
   qrlReposicao.Caption:='0';
   if tabBase.FieldByName('Saldo').AsFloat <= tabBase.FieldByName('Minimo').AsFloat then begin
      qrlReposicao.Caption:=FloatToStr(tabBase.FieldByName('Minimo').AsFloat - tabBase.FieldByName('Saldo').AsFloat);
   end;   
end;

procedure TrtReposicaoEstoque.FormShow(Sender: TObject);
begin
   inherited;
   tabGrupos.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('1')+' ORDER BY Descricao');
   tabGrupos.Open;
end;

end.

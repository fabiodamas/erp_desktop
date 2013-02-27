unit rInventarioProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls, Gauges;

type
  TrtInventarioProdutos = class(TfmFormBaseRelatorio)
    tabBase: TZQuery;
    pndDialogo: TPrintDialog;
    qrpInventario: TQuickRep;
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
    Label2: TLabel;
    edtTabelaCalculo: TDBLookupComboBox;
    edtGrupoRemover: TDBLookupComboBox;
    Label5: TLabel;
    tabGrupos: TZQuery;
    dtsGrupos: TDataSource;
    qrlEndereco: TQRLabel;
    qrdPais: TQRDBText;
    qrlPais: TQRLabel;
    qrlEmail: TQRLabel;
    qrlTotal: TQRLabel;
    lstGrupos: TListBox;
    btnGrupoAdicionar: TBitBtn;
    btnGrupoRemover: TBitBtn;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    tabAuxInventario: TClientDataSet;
    tabAuxInventarioCodigo: TStringField;
    tabAuxInventarioUnidade: TStringField;
    gagProgresso: TGauge;
    tabChecagens: TZQuery;
    edtPercCalc: TEdit;
    Label6: TLabel;
    rdgEstoque: TRadioGroup;
    tabTipoTabPreco: TZQuery;
    dtsTipoTabPreco: TDataSource;
    tabAuxInventarioProduto: TStringField;
    tabAuxInventarioQuantidade: TFloatField;
    tabAuxInventarioValorUnitario: TCurrencyField;
    tabAuxInventarioTotal: TCurrencyField;
    ckbProdutoAcabado: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGrupoAdicionarClick(Sender: TObject);
    procedure btnGrupoRemoverClick(Sender: TObject);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrpInventarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    procedure GerarImpressao(Impressora: Boolean = False);
  public
  end;

var vTotal, vVUnit, vQtd : real;

implementation

uses uFormBase, uMenu, uFuncoes, uConstantes;

{$R *.dfm}

procedure TrtInventarioProdutos.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TrtInventarioProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabBase.Close;
   tabGrupos.Close;
   tabAuxInventario.Close;
   tabTipoTabPreco.Close;
   inherited;
end;

procedure TrtInventarioProdutos.btnVisualizarClick(Sender: TObject);
begin
   inherited;
   GerarImpressao();
end;

procedure TrtInventarioProdutos.GerarImpressao(Impressora: Boolean = False);
var vWhere: string;
    vCnt : integer;
begin
   if Trim(edtTabelaCalculo.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Tabela para Cálculo');
      edtTabelaCalculo.SetFocus;
      exit;
   end;

   if Trim(edtPercCalc.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do % de Cálculo');
      edtPercCalc.SetFocus;
      exit;
   end;

   qrlTitulo.Caption:='Inventário de Produtos';

   tabAuxInventario.EmptyDataSet;

   vWhere:='';

   tabBase.Close;
   tabBase.SQL.Clear;
   tabBase.SQL.Add('SELECT produtos.CodigoProduto AS Codigo, produtos.NomeTecnico AS Produto,');
   tabBase.SQL.Add('un.Sigla AS Unidade, es.Estoque AS Quantidade, tp.ValorAtual AS ValorAtual');
   tabBase.SQL.Add('FROM produtos');
   tabBase.SQL.Add('LEFT JOIN unidades AS un ON produtos.CodigoUnidade = un.Codigo');
   tabBase.SQL.Add('LEFT JOIN produtos_status_estoque AS es ON produtos.CodigoProduto = es.CodigoProduto');
   tabBase.SQL.Add('LEFT JOIN tabela_precos AS tp ON produtos.CodigoProduto = tp.CodigoProduto AND tp.CodigoTabela = '+FloatToStr(edtTabelaCalculo.KeyValue));

   if Trim(edtGrupo.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Grupo: '+edtGrupo.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'produtos.CodigoGrupo = '+FloatToStr(edtGrupo.KeyValue);
   end;

   if ckbProdutoAcabado.Checked = True then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Produto Acabado';
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'produtos.ProdutoAcabado = 1';
   end;
   
   case rdgEstoque.ItemIndex of
      1: begin
         if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
         vWhere:=vWhere + 'Estoque > 0';
      end;
      2: begin
         if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
         vWhere:=vWhere + 'Estoque <= 0';
      end;
   end;

   if lstGrupos.Items.Count > 0 then begin
      for vCnt:=0 to (lstGrupos.Items.Count-1) do begin
         if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
         vWhere:=vWhere + '(produtos.CodigoGrupo <> '+FloatToStr(StrToFloat(Copy(lstGrupos.Items.Strings[vCnt], 1, 6)))+')';
      end;
   end;

   if Trim(vWhere) <> '' then begin
      tabBase.SQL.Add('WHERE');
      tabBase.SQL.Add(vWhere);
   end;

   tabBase.SQL.Add('ORDER BY');
   case rdgOrdemEmissao.ItemIndex of
      0: tabBase.SQL.Add('produtos.CodigoProduto');
      1: tabBase.SQL.Add('produtos.NomeTecnico');
   end;

   //ShowMessage(tabBase.SQL.Text);

   tabBase.Open; 

   gagProgresso.MaxValue:=tabBase.RecordCount;

   tabBase.First;
   while not tabBase.Eof do begin

      gagProgresso.Progress:=tabBase.RecNo;
      Application.ProcessMessages;

      tabAuxInventario.Append;
      tabAuxInventarioCodigo.Value:=tabBase.FieldByName('Codigo').AsString;
      tabAuxInventarioProduto.Value:=tabBase.FieldByName('Produto').AsString;
      tabAuxInventarioUnidade.Value:=tabBase.FieldByName('Unidade').AsString;
      tabAuxInventarioQuantidade.Value:=tabBase.FieldByName('Quantidade').AsFloat;
      tabAuxInventarioValorUnitario.Value:=tabBase.FieldByName('ValorAtual').AsFloat * (StrToFloat(edtPercCalc.Text)/100);
      tabAuxInventarioTotal.Value:=tabAuxInventarioValorUnitario.Value * tabAuxInventarioQuantidade.Value;

      tabAuxInventario.Post;
   
      tabBase.Next;
   end;

   gagProgresso.Progress:=0;

   vTotal:=0;
   vVUnit:=0;
   vQtd:=0;

   if Impressora = True then begin
      if pndDialogo.Execute then begin
         qrpInventario.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
         qrpInventario.Print;
      end;
    end
   else begin
      qrpInventario.PreviewModal;
   end;
end;

procedure TrtInventarioProdutos.btnImprimirClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(True);
end;

procedure TrtInventarioProdutos.FormShow(Sender: TObject);
begin
   inherited;

   tabAuxInventario.CreateDataSet;
   tabAuxInventario.EmptyDataSet;

   tabGrupos.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('1')+' ORDER BY Descricao');
   tabGrupos.Open;

   tabTipoTabPreco.SQL.Add('SELECT * FROM tipos_tabela_preco ORDER BY Descricao');
   tabTipoTabPreco.Open;
end;

procedure TrtInventarioProdutos.btnGrupoAdicionarClick(Sender: TObject);
begin
   inherited;
   if Trim(edtGrupoRemover.Text) <> '' then begin
      lstGrupos.Items.Add(StrZero(edtGrupoRemover.KeyValue, 6) + ' - ' + edtGrupoRemover.Text);
      edtGrupoRemover.KeyValue:=NULL;
   end;
end;

procedure TrtInventarioProdutos.btnGrupoRemoverClick(Sender: TObject);
begin
   inherited;
   if lstGrupos.Items.Count > 0 then begin
      lstGrupos.Items.Delete(lstGrupos.ItemIndex);
   end;
end;

procedure TrtInventarioProdutos.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   inherited;
   vTotal:=vTotal + tabAuxInventarioTotal.Value;
   vVUnit:=vVUnit + tabAuxInventarioValorUnitario.Value;
   vQtd:=vQtd     + tabAuxInventarioQuantidade.Value; 
   qrlTotal.Caption:='Quantidade: '+FloatToStr(vQtd)+' - Valor Unitário: '+FormatFloat(sis_curr_format, vVUnit)+' - Total: '+FormatFloat(sis_curr_format, vTotal);
end;

procedure TrtInventarioProdutos.qrpInventarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   inherited;
   vTotal:=0;
   vVUnit:=0;
   vQtd:=0;
end;

end.

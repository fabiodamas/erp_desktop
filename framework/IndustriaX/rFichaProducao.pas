unit rFichaProducao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls, ToolEdit, qrBarcode, qrpctrls;

type
  TrtFichaProducao = class(TfmFormBaseRelatorio)
    tabOP: TZQuery;
    pndDialogo: TPrintDialog;
    qrpFT: TQuickRep;
    qrbColuna: TQRBand;
    QRDBText3: TQRDBText;
    QRShape1: TQRShape;
    QRDBText7: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    Label1: TLabel;
    edtOP: TEdit;
    QRShape4: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    tabFT: TZQuery;
    dtsOP: TDataSource;
    qrbPagina: TQRBand;
    qrbRodape: TQRBand;
    qrlSignature: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape2: TQRShape;
    QRSysData2: TQRSysData;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel21: TQRLabel;
    qrdCodigoSetor: TQRDBText;
    QRDBText19: TQRDBText;
    tabRoteiro: TZQuery;
    qrbCodigoOperacao: TQRAsBarcode;
    qrlTitulo: TQRLabel;
    qrbComposicao: TQRBand;
    QRShape14: TQRShape;
    QRLabel23: TQRLabel;
    QRShape15: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRShape16: TQRShape;
    qrbRoteiro: TQRBand;
    QRShape8: TQRShape;
    QRLabel12: TQRLabel;
    QRShape9: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLabel15: TQRLabel;
    qsdMolde: TQRSubDetail;
    tabProdutoMolde: TZQuery;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    dtsProdutoMolde: TDataSource;
    strngfldProdutoMoldeNMolde: TStringField;
    strngfldProdutoMoldeMolde: TStringField;
    strngfldProdutoMoldeEndMolde: TStringField;
    QRShape6: TQRShape;
    strngfldFTCodigoPrincipal: TStringField;
    strngfldFTCodigoProduto: TStringField;
    strngfldFTDescricao: TStringField;
    tabFTQuantidade: TFloatField;
    tabFTValorCusto: TFloatField;
    tabFTCodigoUnidade: TFloatField;
    strngfldFTSigla: TStringField;
    strngfldFTEndereco: TStringField;
    qrlObservacoes: TQRPMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtsOPDataChange(Sender: TObject; Field: TField);
    procedure qrbComposicaoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbRoteiroBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qsdRoteiroBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbColunaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    procedure GerarImpressao(Impressora: Boolean = False);
  public 
  end;

implementation

uses uFormBase, uMenu, uFuncoes, uConstantes;          

{$R *.dfm}

procedure TrtFichaProducao.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);        
end;
   
procedure TrtFichaProducao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabOP.Close;
   tabFT.Close;
   tabRoteiro.Close;  
   inherited;
end;

procedure TrtFichaProducao.btnVisualizarClick(Sender: TObject);   
begin
   inherited;  
   GerarImpressao();
end;
 
procedure TrtFichaProducao.GerarImpressao(Impressora: Boolean = False);
begin 
  if Trim(edtOP.Text) = '' then
  begin
    ShowMessage('Obrigatório Preenchimento do Numero da Ordem de Produção');
    edtOP.SetFocus;
    exit;
  end;

  tabOP.Close;
  tabOP.SQL.Clear;
  tabOP.SQL.Add('SELECT opp.*, op.*, clientes.NomeFantasia AS Cliente, ');
  tabOP.SQL.Add('produtos.Endereco AS End, unidades.Sigla AS Sigla, produtos.NomeTecnico AS ProdPrincipal, ');
  tabOP.SQL.Add('moldes.NMolde, moldes.Descricao AS Molde, moldes.Endereco AS EndMolde, produtos.ValorAdicionalObs');
  tabOP.SQL.Add('FROM ordem_producao_produtos AS opp');
  tabOP.SQL.Add('LEFT JOIN ordem_producao AS op ON op.OrdemProducao = opp.OrdemProducao');
  tabOP.SQL.Add('LEFT JOIN clientes ON clientes.CodigoCliente = op.CodigoCliente');
  tabOP.SQL.Add('LEFT JOIN produtos ON produtos.CodigoProduto = opp.CodigoProduto');
  tabOP.SQL.Add('LEFT JOIN unidades ON unidades.Codigo = produtos.CodigoUnidade');
  tabOP.SQL.Add('LEFT JOIN moldes ON moldes.NMolde = produtos.NMolde');
  tabOP.SQL.Add('WHERE opp.OrdemProducao = '+QuotedStr(edtOP.Text));
  tabOP.Open;

  tabProdutoMolde.SQL.Clear;
  tabProdutoMolde.SQL.Add(' select                                                       ');
  tabProdutoMolde.SQL.Add('    moldes.NMolde,                                            ');
  tabProdutoMolde.SQL.Add('     moldes.Descricao as Molde,                               ');
  tabProdutoMolde.SQL.Add('     moldes.Endereco as EndMolde                              ');
  tabProdutoMolde.SQL.Add(' from                                                         ');
  tabProdutoMolde.SQL.Add('     produtos_moldes                                          ');
  tabProdutoMolde.SQL.Add('         left join                                            ');
  tabProdutoMolde.SQL.Add('     moldes ON produtos_moldes.CodigoMolde = moldes.NMolde    ');
  tabProdutoMolde.SQL.Add(' where                                                        ');
  tabProdutoMolde.SQL.Add('     produtos_moldes.CodigoProduto = ' + QuotedStr( tabOP.FieldByName('CodigoProduto').AsString  ));
  tabProdutoMolde.Open;

  if Impressora = True then
  begin
    if pndDialogo.Execute then
    begin
      qrpFT.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
      qrpFT.Print;
    end;
   end
  else
  begin
    qrpFT.PreviewModal;
  end;       
end;     
  
procedure TrtFichaProducao.btnImprimirClick(Sender: TObject);
begin 
   inherited;
   GerarImpressao(True);  
end; 
 
procedure TrtFichaProducao.FormShow(Sender: TObject); 
begin
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edtOP.Text:=fmMenu.pubTrans1;     
   end; 

   tabFT.SQL.Clear;
   tabFT.Params.CreateParam(ftString, 'CodigoProduto', ptUnknown);
   tabFT.SQL.Add('SELECT ft.*, unidades.Sigla AS Sigla, produtos.Endereco AS Endereco');
   tabFT.SQL.Add('FROM produtos_ficha_tecnica AS ft');
   tabFT.SQL.Add('LEFT JOIN unidades ON unidades.Codigo = ft.CodigoUnidade');
   tabFT.SQL.Add('LEFT JOIN produtos ON produtos.CodigoProduto = ft.CodigoProduto');
   tabFT.SQL.Add('WHERE ft.CodigoPrincipal = :CodigoProduto');
   tabFT.Open; 

   tabRoteiro.SQL.Clear;
   tabRoteiro.Params.CreateParam(ftString, 'CodigoProduto', ptUnknown);
   tabRoteiro.SQL.Add('SELECT sp.CodigoSetor, genericos.Descricao AS Operacao, sp.CodigoFuncionario');
   tabRoteiro.SQL.Add('FROM sequencia_producao_produtos AS sp');
   tabRoteiro.SQL.Add('LEFT JOIN genericos ON genericos.Codigo = sp.CodigoSetor');
   tabRoteiro.SQL.Add('WHERE sp.CodigoProduto = :CodigoProduto');
   tabRoteiro.Open;

   inherited;
end;

procedure TrtFichaProducao.dtsOPDataChange(Sender: TObject; Field: TField);
begin
   inherited; 
   tabFT.Close; 
   tabFT.ParamByName('CodigoProduto').AsString:=tabOP.FieldByName('CodigoProduto').AsString;
   tabFT.Open;

   tabRoteiro.Close; 
   tabRoteiro.ParamByName('CodigoProduto').AsString:=tabOP.FieldByName('CodigoProduto').AsString;
   tabRoteiro.Open;
end;

procedure TrtFichaProducao.qrbComposicaoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   inherited;
   PrintBand:=tabFT.RecordCount > 0;
end;

procedure TrtFichaProducao.qrbRoteiroBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   inherited;
   PrintBand:=tabRoteiro.RecordCount > 0;
end;

procedure TrtFichaProducao.qsdRoteiroBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var vCodigoBarras : string;
begin
   inherited;

   // Código de Barras Formado por:
   // 000000     - Ordem de Produção     (6) N
   // 000        - Código do Setor       (3) N
   // 000        - Código do Funcionário (3) N
   // XXXXXXX... - Código do Produto - (Restante) A

   vCodigoBarras:=StrZero(tabOP.FieldByName('OrdemProducao').AsString, 6)+
   StrZero(tabRoteiro.FieldByName('CodigoSetor').AsString, 3)+
   StrZero(tabRoteiro.FieldByName('CodigoFuncionario').AsString, 3)+
   tabOP.FieldByName('CodigoProduto').AsString;
   qrbCodigoOperacao.Text:=vCodigoBarras;

   qrbCodigoOperacao.Refresh; 
end;

procedure TrtFichaProducao.qrbColunaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var vTexto: ansistring;
begin
  inherited;
  vTexto:=DeleteLineBreaks(tabOp.FieldByName('ValorAdicionalObs').Value);
  qrlObservacoes.Lines.Text:=vTexto;
end;

end.

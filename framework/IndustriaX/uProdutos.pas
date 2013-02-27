unit uProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, DB, ZAbstractRODataset, ZAbstractDataset, jpeg,
  Menus, StdCtrls, ToolEdit, RXDBCtrl, DBCtrls, Grids, DBGrids, Buttons,
  ExtCtrls, ComCtrls, Mask, ZDataset, CurrEdit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid, cxTimeEdit, cxCalc, ZSqlUpdate,
  cxDBLookupComboBox, cxCurrencyEdit;

type
  TfmProdutos = class(TfmFormBaseCadastro)
    Label1: TLabel;
    edtNomeTecnico: TDBEdit;
    Label2: TLabel;
    pgcProdutos: TPageControl;
    tbsGeral: TTabSheet;
    tbsPrecos: TTabSheet;
    tbsVendas: TTabSheet;
    tbsCompras: TTabSheet;
    tbsObservacao: TTabSheet;
    tbsDescricao: TTabSheet;
    tbsMolde: TTabSheet;
    tbsProducao: TTabSheet;
    tbsFornecedores: TTabSheet;
    edtCodigoProduto: TEdit;
    Label3: TLabel;
    edtGrupo: TDBLookupComboBox;
    edtUnidade: TDBLookupComboBox;
    Label7: TLabel;
    edtPeso: TDBEdit;
    Label8: TLabel;
    edtPontoReposicao: TDBEdit;
    Label9: TLabel;
    edtNomeIngles: TDBEdit;
    Label10: TLabel;
    edtEndereco: TDBEdit;
    Label11: TLabel;
    edtNcm: TDBEdit;
    Label12: TLabel;
    edtExTipi: TDBEdit;
    Label13: TLabel;
    dbcEntraTabelaEstoque: TDBCheckBox;
    imgFotoProduto: TImage;
    btnAlterarFoto: TBitBtn;
    btnExcluirFoto: TBitBtn;
    edtEstoque: TEdit;
    Label14: TLabel;
    edtFaltas: TEdit;
    Label15: TLabel;
    edtEmpenho: TEdit;
    Label16: TLabel;
    edtInterno: TEdit;
    Label17: TLabel;
    edtDisponivel: TEdit;
    Label18: TLabel;
    pnlStatusEstoque: TPanel;
    lblSemImagem: TLabel;
    tabGrupos: TZQuery;
    dtsGrupos: TDataSource;
    tabSubGrupo: TZQuery;
    dtsSubGrupo: TDataSource;
    tabUnidades: TZQuery;
    dtsUnidades: TDataSource;
    tabProdutosEstoque: TZQuery;
    dtsProdutosEstoque: TDataSource;
    tabProdutosFotos: TZQuery;
    dtsProdutosFotos: TDataSource;
    grbPrecos: TGroupBox;
    grbValores: TGroupBox;
    dbgPrecos: TDBGrid;
    edtMoeda: TDBLookupComboBox;
    edtPercIpi: TDBEdit;
    Label21: TLabel;
    Label22: TLabel;
    edtQtdMoeda: TDBEdit;
    Label24: TLabel;
    dbgVendas: TDBGrid;
    dbgCompras: TDBGrid;
    edtObservacoes: TDBMemo;
    edtDescricaoDetalhada: TDBMemo;
    Label25: TLabel;
    Label26: TLabel;
    edtDescricaoIngles: TDBMemo;
    tabTabelaPrecos: TZQuery;
    dtsTabelaPrecos: TDataSource;
    tabTiposIndices: TZQuery;
    dtsTiposIndices: TDataSource;
    dbcEntraTabelaPreco: TDBCheckBox;
    tabProdutosVendas: TZQuery;
    dtsProdutosVendas: TDataSource;
    tabProdutosCompras: TZQuery;
    dtsProdutosCompras: TDataSource;
    Label27: TLabel;
    Label28: TLabel;
    tabMoldes: TZQuery;
    dtsMoldes: TDataSource;
    edtMoldeEndereco: TDBEdit;
    Label29: TLabel;
    edtMoldeDataFabricacao: TDBDateEdit;
    Label30: TLabel;
    Label31: TLabel;
    edtMoldeGrupo: TDBLookupComboBox;
    Label32: TLabel;
    edtMoldeCor: TDBLookupComboBox;
    Label33: TLabel;
    edtMoldePeso: TDBEdit;
    Label34: TLabel;
    edtMoldeTipo: TDBEdit;
    Label35: TLabel;
    edtMoldeNumeroCavidades: TDBEdit;
    Label36: TLabel;
    edtMoldeObservacao: TDBMemo;
    Label37: TLabel;
    tabChecagens: TZQuery;
    edtSetorCodigo: TEdit;
    edtSetorDescricao: TEdit;
    edtSetorObservacao: TMemo;
    Label38: TLabel;
    Label40: TLabel;
    btnSetorAdicionar: TBitBtn;
    btnLocalizaSetor: TBitBtn;
    tabSequenciaProducao: TZQuery;
    dtsSequenciaProducao: TDataSource;
    Label41: TLabel;
    edtFornecedorCodigo: TEdit;
    btnFornecedorLocalizar: TBitBtn;
    edtFornecedorNome: TEdit;
    btnFornecedorAdicionar: TBitBtn;
    dbgFornecedor: TDBGrid;
    tabProdutosFornecedores: TZQuery;
    dtsProdutosFornecedores: TDataSource;
    btnSetorRemover: TBitBtn;
    btnFornecedorRemover: TBitBtn;
    Bevel1: TBevel;
    lblStatusImagem: TLabel;
    btnImagemAnterior: TBitBtn;
    btnImagemProximo: TBitBtn;
    tabMoldesGrupos: TZQuery;
    dtsMoldesGrupos: TDataSource;
    tabMoldesSetor: TZQuery;
    dtsMoldesSetor: TDataSource;
    tabMoldesCor: TZQuery;
    dtsMoldesCor: TDataSource;
    Label43: TLabel;
    edtCor: TDBLookupComboBox;
    tabCor: TZQuery;
    dtsCor: TDataSource;
    dbcProdutoAcabado: TDBCheckBox;
    tabConfigPropri: TZQuery;
    tbsFichaTecnica: TTabSheet;
    Label4: TLabel;
    edtFTCodigo: TEdit;
    btnFTLocalizar: TBitBtn;
    edtFTDescricao: TEdit;
    edtFTQuantidade: TCurrencyEdit;
    Label5: TLabel;
    btnFTAdd: TBitBtn;
    btnFTRem: TBitBtn;
    tabProdutosFT: TZQuery;
    dtsProdutosFT: TDataSource;
    edtFTValorCustoProduto: TDBEdit;
    Label19: TLabel;
    edtFTValorUnitario: TCurrencyEdit;
    Label20: TLabel;
    Label44: TLabel;
    edtFTCustoAdicional: TDBEdit;
    edtFTUnidade: TDBLookupComboBox;
    Label45: TLabel;
    edtFTCustoAdicionalObs: TDBMemo;
    ClonarProduto1: TMenuItem;
    dbgProdutosMoldes: TDBGrid;
    btnMoldeAdicionar: TBitBtn;
    btnMoldeRemover: TBitBtn;
    tabProdutosMoldes: TZQuery;
    dtsProdutosMoldes: TDataSource;
    edtMoldeNumero: TEdit;
    edtMoldeDescricao: TEdit;
    dblkcbbCodigoGrupo: TDBLookupComboBox;
    tabSetor: TZQuery;
    dtsSetor: TDataSource;
    lbl1: TLabel;
    lbl2: TLabel;
    edtNMolde: TDBEdit;
    edtDescricao: TDBEdit;
    lbl3: TLabel;
    btnLocalizaMolde: TBitBtn;
    tabProdutosComprasCompra: TFloatField;
    dfdProdutosComprasData: TDateField;
    tabProdutosComprasValor: TFloatField;
    tabProdutosComprasQTD: TFloatField;
    tabProdutosComprasCodForn: TFloatField;
    strngfldProdutosComprasFornecedor: TStringField;
    dbgSetor: TcxGrid;
    tvwSetor: TcxGridDBTableView;
    lvlSetor: TcxGridLevel;
    clmSetor: TcxGridDBColumn;
    clmSeq: TcxGridDBColumn;
    clmObservacao: TcxGridDBColumn;
    clmTempoMedioHora: TcxGridDBColumn;
    upsSequenciaProducao: TZUpdateSQL;
    btnProducaoMediaHora: TBitBtn;
    lbl4: TLabel;
    edtCodigoModelo: TDBLookupComboBox;
    tabColecao: TZQuery;
    dtsColecao: TDataSource;
    lbl5: TLabel;
    lbcCodigoColecao: TDBLookupComboBox;
    tabSubGrupoCodigoSubGrupo: TFloatField;
    tabSubGrupoCodigoGrupo: TFloatField;
    tabSubGrupoDescricao: TWideStringField;
    lbl8: TLabel;
    edtCodigoGrade: TDBLookupComboBox;
    tabGrades: TZQuery;
    tabGradesCodigoGrade: TFloatField;
    cdsGradesDescricao: TStringField;
    dtsGrades: TDataSource;
    dbchkEntraTabelaPreco: TDBCheckBox;
    dbgFichaTecnica: TcxGrid;
    tvwFichaTecnica: TcxGridDBTableView;
    lvlFichaTecnica: TcxGridLevel;
    clmFichaTecnicaCodigoProduto: TcxGridDBColumn;
    clmFichaTecnicaDescricao: TcxGridDBColumn;
    clmFichaTecnicaQuantidade: TcxGridDBColumn;
    clmFichaTecnicaValorCusto: TcxGridDBColumn;
    clmFichaTecnicaCodigoUnidade: TcxGridDBColumn;
    clmFichaTecnicaCodigoMaterial: TcxGridDBColumn;
    clmFichaTecnicaCodigoCor: TcxGridDBColumn;
    tabMaterial: TZQuery;
    dtsMaterial: TDataSource;
    cdsMoldesNMolde: TStringField;
    cdsMoldesEndereco: TStringField;
    dfdMoldesDataFabricacao: TDateField;
    cdsMoldesTipo: TStringField;
    cdsMoldesPeso: TStringField;
    tabMoldesCodigoSetor: TFloatField;
    cdsMoldesDescricao: TStringField;
    tabMoldesCodigoGrupo: TFloatField;
    tabMoldesCodigoCor: TFloatField;
    cdsMoldesNumeroCavidades: TStringField;
    cdsMoldesMoldeTipoCaixa: TStringField;
    mmfMoldesObservacoes: TMemoField;
    cdsMoldesNMoldeCliente: TStringField;
    lbl6: TLabel;
    btn1: TBitBtn;
    edtCodigoMaterial: TEdit;
    edtDescricaoMaterial: TEdit;
    lbl7: TLabel;
    edtCorMaterial: TDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcluirFotoClick(Sender: TObject);
    procedure btnAlterarFotoClick(Sender: TObject);
    procedure btnLocalizaMoldeClick(Sender: TObject);
    procedure edtSetorCodigoChange(Sender: TObject);
    procedure btnLocalizaSetorClick(Sender: TObject);
    procedure btnSetorAdicionarClick(Sender: TObject);
    procedure edtFornecedorCodigoChange(Sender: TObject);
    procedure btnFornecedorLocalizarClick(Sender: TObject);
    procedure btnFornecedorAdicionarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnImagemAnteriorClick(Sender: TObject);
    procedure btnImagemProximoClick(Sender: TObject);
    procedure dtsMoldesDataChange(Sender: TObject; Field: TField);
    procedure btnSetorRemoverClick(Sender: TObject);
    procedure btnFornecedorRemoverClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure edtCodigoProdutoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure btnEditarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dtsBaseDataChange(Sender: TObject; Field: TField);
    procedure edtFTCodigoChange(Sender: TObject);
    procedure btnFTLocalizarClick(Sender: TObject);
    procedure btnFTAddClick(Sender: TObject);
    procedure btnFTRemClick(Sender: TObject);
    procedure edtFTCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure btnExcluirClick(Sender: TObject);
    procedure dbgFichaTecnicaCellClick(Column: TColumn);
    procedure edtFTCustoAdicionalExit(Sender: TObject);
    procedure dbgSetor1CellClick(Column: TColumn);
    procedure edtFTCustoAdicionalObsClick(Sender: TObject);
    procedure ClonarProduto1Click(Sender: TObject);
    procedure btnOpcoesClick(Sender: TObject);
    procedure pgcProdutosChange(Sender: TObject);
    procedure btnMoldeAdicionarClick(Sender: TObject);
    procedure btnMoldeRemoverClick(Sender: TObject);
    procedure edtMoldeNumeroChange(Sender: TObject);
    procedure ExibeDados;
    procedure btnProducaoMediaHoraClick(Sender: TObject);
    procedure tbsFichaTecnicaShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure edtCodigoMaterialChange(Sender: TObject);
  private
    FTyping: Boolean;
    procedure AtualizaCodigoProduto;
    procedure AtualizaStatusEstoque;
    procedure AtualizaDadosEstoque;
    procedure AtualizaFotoProduto;
    procedure AtualizaLabelStatusImagem;
    procedure AtualizaCustoProduto;
  public
    procedure Novo; override;
    procedure Editar; override;
    procedure Deletar; override;
    procedure Cancelar; override;
    function Checagens: Boolean; override;
  end;

var
  fmProdutos: TfmProdutos;

implementation

uses uMenu, uFormBaseConfig, uFuncoes, uCadastrarImagem, uConstantes,
  uLocalizarGenerico, uTipos, uLocalizarProdutos, uObservacoes,
  uProducaoMediaHora;

{$R *.dfm}

procedure TfmProdutos.Novo;
begin
  tabBase.FieldByName('CodigoProduto').AsString := Trim(edtCodigoProduto.Text);
end;

procedure TfmProdutos.Editar;
begin
end;

procedure TfmProdutos.Deletar;
begin
end;

procedure TfmProdutos.FormCreate(Sender: TObject);
begin
  inherited;
  SetFormStyle(fsMDIChild);
  FTyping := False;
end;

procedure TfmProdutos.FormShow(Sender: TObject);
begin
  inherited;

  pgcProdutos.ActivePageIndex := 0;

  //  Troquei o "ultimas_vendas" pelos "pedidos entregues" 21/09/11 (RS)

  tabMaterial.SQL.Clear;
  tabMaterial.SQL.Add('SELECT CodigoProduto, NomeTecnico FROM produtos ');
  tabMaterial.Open;

  tabColecao.SQL.Clear;
  tabColecao.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('29')+' ORDER BY Descricao');
  tabColecao.Open;

  tabProdutosVendas.SQL.Clear;
  tabProdutosVendas.Params.CreateParam(ftString, 'CodigoProduto', ptUnknown);
  tabProdutosVendas.SQL.Clear;
  tabProdutosVendas.SQL.Add('SELECT pedidos.DataEntrega AS Data, pedidos.NPedido AS Pedido, pedidos_produtos.Quantidade AS QTD,');
  tabProdutosVendas.SQL.Add('pedidos.CodigoCliente AS CodCli, clientes.NomeFantasia AS Cliente,');
  tabProdutosVendas.SQL.Add('pedidos_produtos.Valor AS Valor, pedidos_produtos.ValorTotal AS ValorTotal');
  tabProdutosVendas.SQL.Add('FROM pedidos_produtos');
  tabProdutosVendas.SQL.Add('LEFT JOIN pedidos ON pedidos.NPedido = pedidos_produtos.NPedido');
  tabProdutosVendas.SQL.Add('LEFT JOIN clientes ON pedidos.CodigoCliente = clientes.CodigoCliente');
  tabProdutosVendas.SQL.Add('WHERE pedidos_produtos.CodigoProduto = :CodigoProduto');
  tabProdutosVendas.SQL.Add('AND pedidos.NPedido > 0');
  tabProdutosVendas.SQL.Add('AND pedidos.DataEntrega IS NOT NULL');
  tabProdutosVendas.SQL.Add('ORDER BY pedidos.DataEntrega DESC');
  tabProdutosVendas.Open;

  tabGrades.SQL.Clear;
  tabGrades.SQL.Add(' select * from grades ');
  tabGrades.Open;

  tabProdutosCompras.Params.CreateParam(ftString, 'CodigoProduto', ptUnknown);
  tabProdutosCompras.SQL.Clear;
  tabProdutosCompras.SQL.Add('SELECT ultimas_compras.Documento AS Compra, ultimas_compras.DataCompra AS Data,');
  tabProdutosCompras.SQL.Add('ultimas_compras.ValorCompra AS Valor, ultimas_compras.Quantidade AS QTD,');
  tabProdutosCompras.SQL.Add('ultimas_compras.CodigoFornecedor AS CodForn, fornecedores.NomeFantasia AS Fornecedor');
  tabProdutosCompras.SQL.Add('FROM ultimas_compras, fornecedores');
  tabProdutosCompras.SQL.Add('WHERE ultimas_compras.CodigoProduto = :CodigoProduto');
  tabProdutosCompras.SQL.Add('AND ultimas_compras.CodigoFornecedor = fornecedores.CodigoFornecedor');
  tabProdutosCompras.SQL.Add('ORDER BY ultimas_compras.DataCompra DESC');
  tabProdutosCompras.Open;

  tabTabelaPrecos.SQL.Clear;
  tabTabelaPrecos.Params.CreateParam(ftString, 'CodigoProduto', ptUnknown);
  tabTabelaPrecos.SQL.Add('SELECT tabela_precos.CodigoProduto AS Produto, tipos_tabela_preco.Descricao AS Tabela, tabela_precos.ValorAtual AS Valor');
  tabTabelaPrecos.SQL.Add('FROM tipos_tabela_preco, tabela_precos');
  tabTabelaPrecos.SQL.Add('WHERE tabela_precos.CodigoProduto = :CodigoProduto');
  tabTabelaPrecos.SQL.Add('AND tipos_tabela_preco.Codigo = tabela_precos.CodigoTabela');
  tabTabelaPrecos.Open;

  tabProdutosEstoque.SQL.Clear;
  tabProdutosEstoque.Params.CreateParam(ftString, 'CodigoProduto', ptUnknown);
  tabProdutosEstoque.SQL.Add('SELECT * FROM produtos_status_estoque WHERE CodigoProduto = :CodigoProduto');
  tabProdutosEstoque.Open;

  tabProdutosFotos.SQL.Clear;
  tabProdutosFotos.Params.CreateParam(ftString, 'CodigoProduto', ptUnknown);
  tabProdutosFotos.SQL.Add('SELECT ID, CodigoProduto FROM produtos_fotos WHERE CodigoProduto = :CodigoProduto');
  tabProdutosFotos.Open;

  tabMoldesGrupos.SQL.Clear;
  tabMoldesGrupos.Params.CreateParam(ftFloat, 'MoldesGrupos', ptUnknown);
  tabMoldesGrupos.SQL.Add('SELECT * FROM genericos WHERE Codigo = :MoldesGrupos ORDER BY Descricao');
  tabMoldesGrupos.Open;

  tabMoldesSetor.SQL.Clear;
  tabMoldesSetor.Params.CreateParam(ftFloat, 'CodigoSetor', ptUnknown);
  tabMoldesSetor.SQL.Add('SELECT * FROM genericos WHERE Codigo = :CodigoSetor ORDER BY Descricao');
  tabMoldesSetor.Open;

  tabMoldesCor.SQL.Clear;
  tabMoldesCor.Params.CreateParam(ftFloat, 'MoldesCor', ptUnknown);
  tabMoldesCor.SQL.Add('SELECT * FROM cores WHERE Codigo = :MoldesCor ORDER BY Descricao');
  tabMoldesCor.Open;

  tabMoldes.SQL.Clear;
  tabMoldes.Params.CreateParam(ftString, 'NMolde', ptUnknown);
  tabMoldes.SQL.Add('SELECT * FROM moldes WHERE NMolde = :NMolde');
  tabMoldes.Open;

  {
  tabSequenciaProducao.Params.CreateParam(ftString, 'CodigoProduto', ptUnknown);-
  tabSequenciaProducao.SQL.Add('SELECT genericos.Descricao AS Setor, sequencia_producao_produtos.CodigoSetor, sequencia_producao_produtos.ProducaoPorHora,  ');
  tabSequenciaProducao.SQL.Add('sequencia_producao_produtos.Sequencia AS Seq, ');
  tabSequenciaProducao.SQL.Add('LEFT(sequencia_producao_produtos.ObsProducao, 255) AS Observacao, ');
  tabSequenciaProducao.SQL.Add('sequencia_producao_produtos.CodigoProduto, sequencia_producao_produtos.CodigoSetor');
  tabSequenciaProducao.SQL.Add('FROM sequencia_producao_produtos, genericos');
  tabSequenciaProducao.SQL.Add('WHERE sequencia_producao_produtos.CodigoProduto = :CodigoProduto');
  tabSequenciaProducao.SQL.Add('AND sequencia_producao_produtos.CodigoSetor = genericos.Codigo');
  tabSequenciaProducao.SQL.Add('ORDER BY sequencia_producao_produtos.Sequencia');
  tabSequenciaProducao.Open;
  }

  tabSequenciaProducao.SQL.Clear;
  tabSequenciaProducao.Params.CreateParam(ftString, 'CodigoProduto', ptUnknown);
  tabSequenciaProducao.SQL.Add(' SELECT                                                                 ');
  tabSequenciaProducao.SQL.Add('    genericos.Descricao AS Setor,                                       ');
  tabSequenciaProducao.SQL.Add('    sequencia_producao_produtos.CodigoSetor,                            ');
  tabSequenciaProducao.SQL.Add('    sequencia_producao_produtos.ProducaoPorHora,                        ');
  tabSequenciaProducao.SQL.Add('    sequencia_producao_produtos.Sequencia AS Seq,                       ');
  tabSequenciaProducao.SQL.Add('    LEFT(sequencia_producao_produtos.ObsProducao,255) AS Observacao,    ');
  tabSequenciaProducao.SQL.Add('    sequencia_producao_produtos.CodigoProduto,                          ');
  tabSequenciaProducao.SQL.Add('    sequencia_producao_produtos.CodigoSetor                             ');
  tabSequenciaProducao.SQL.Add(' FROM                                                                   ');
  tabSequenciaProducao.SQL.Add('    sequencia_producao_produtos inner join genericos on                 ');
  tabSequenciaProducao.SQL.Add('        sequencia_producao_produtos.CodigoSetor = genericos.Codigo      ');
  tabSequenciaProducao.SQL.Add(' WHERE                                                                  ');
  tabSequenciaProducao.SQL.Add('    sequencia_producao_produtos.CodigoProduto = :CodigoProduto          ');
  tabSequenciaProducao.SQL.Add(' ORDER BY sequencia_producao_produtos.Sequencia;                        ');


  tabProdutosFornecedores.SQL.Clear;
  tabProdutosFornecedores.Params.CreateParam(ftString, 'CodigoProduto', ptUnknown);
  tabProdutosFornecedores.SQL.Add('SELECT produtos_fornecedores.CodigoFornecedor, fornecedores.NomeFantasia AS Fornecedor');
  tabProdutosFornecedores.SQL.Add('FROM produtos_fornecedores');
  tabProdutosFornecedores.SQL.Add('LEFT JOIN fornecedores ON produtos_fornecedores.CodigoFornecedor = fornecedores.CodigoFornecedor');
  tabProdutosFornecedores.SQL.Add('WHERE produtos_fornecedores.CodigoProduto = :CodigoProduto');
  tabProdutosFornecedores.Open;

  tabProdutosMoldes.SQL.Clear;
  tabProdutosMoldes.Params.CreateParam(ftString, 'CodigoProduto', ptUnknown);
  tabProdutosMoldes.SQL.Add(' select                                                                ');
  tabProdutosMoldes.SQL.Add('        moldes.NMolde,                                                 ');
  tabProdutosMoldes.SQL.Add('        moldes.Descricao,                                              ');
  tabProdutosMoldes.SQL.Add('        moldes.Endereco,                                               ');
  tabProdutosMoldes.SQL.Add('        moldes.DataFabricacao,                                         ');
  tabProdutosMoldes.SQL.Add('        moldes.Tipo,                                                   ');
  tabProdutosMoldes.SQL.Add('        moldes.CodigoGrupo,                                            ');
  tabProdutosMoldes.SQL.Add('        moldes.CodigoCor,                                              ');
  tabProdutosMoldes.SQL.Add('        moldes.Peso,                                                   ');
  tabProdutosMoldes.SQL.Add('        moldes.NumeroCavidades,                                        ');
  tabProdutosMoldes.SQL.Add('        moldes.CodigoSetor,                                            ');
  tabProdutosMoldes.SQL.Add('        moldes.Observacoes,                                            ');
  tabProdutosMoldes.SQL.Add('        produtos_moldes.CodigoProduto,                                 ');
  tabProdutosMoldes.SQL.Add('        produtos_moldes.CodigoMolde                                    ');
  tabProdutosMoldes.SQL.Add('   from produtos_moldes                                                ');
  tabProdutosMoldes.SQL.Add('   left join moldes on produtos_moldes.CodigoMolde = moldes.NMolde     ');
  tabProdutosMoldes.SQL.Add('  where produtos_moldes.CodigoProduto = :CodigoProduto                 ');
  tabProdutosMoldes.Open;

  tabProdutosFT.SQL.Clear;
  tabProdutosFT.Params.CreateParam(ftString, 'CodigoProduto', ptUnknown);
  tabProdutosFT.SQL.Add('SELECT ft.CodigoProduto,ft.Descricao,ft.Quantidade,ft.ValorCusto,unidades.Sigla AS Unidade, ft.CodigoUnidade, ft.CodigoMaterial, ft.CodigoCor ');
  tabProdutosFT.SQL.Add('FROM produtos_ficha_tecnica AS ft');
  tabProdutosFT.SQL.Add('LEFT JOIN unidades ON unidades.Codigo = ft.CodigoUnidade');
  tabProdutosFT.SQL.Add('WHERE CodigoPrincipal = :CodigoProduto');
  tabProdutosFT.Open;

  tabBase.SQL.Clear;
  tabBase.Params.CreateParam(ftString, 'CodigoProduto', ptUnknown);
  tabBase.SQL.Add('SELECT * FROM produtos WHERE CodigoProduto = :CodigoProduto');
  tabBase.ParamByName('CodigoProduto').AsString := '0';
  tabBase.Open;

  tabGrupos.SQL.Clear;
  tabGrupos.SQL.Add('SELECT * FROM genericos WHERE Tipo = ' + QuotedStr('1') + ' ORDER BY Descricao');
  tabGrupos.Open;

  tabSetor.SQL.Clear;
  tabSetor.SQL.Add('SELECT * FROM genericos WHERE Tipo = ' + QuotedStr('22') + ' ORDER BY Descricao');
  tabSetor.Open;

  tabSubGrupo.SQL.Clear;
  tabSubGrupo.SQL.Clear;
  tabSubGrupo.SQL.Add('SELECT * FROM subgrupo');
  tabSubGrupo.Open;

  tabUnidades.SQL.Clear;
  tabUnidades.SQL.Add('SELECT * FROM unidades ORDER BY Descricao');
  tabUnidades.Open;

  tabTiposIndices.SQL.Clear;
  tabTiposIndices.SQL.Add('SELECT * FROM genericos WHERE Tipo = ' + QuotedStr('20') + ' ORDER BY Descricao');
  tabTiposIndices.Open;

  tabCor.SQL.Clear;
  tabCor.SQL.Add('SELECT * FROM cores ORDER BY Descricao');
  tabCor.Open;

  tabConfigPropri.SQL.Clear;
  tabConfigPropri.SQL.Add('SELECT CodigoGrupoMP FROM configuracoes_proprietario');
  tabConfigPropri.Open;
end;

procedure TfmProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tabBase.Close;
  tabGrupos.Close;
  tabSubGrupo.Close;
  tabUnidades.Close;
  tabProdutosEstoque.Close;
  tabProdutosFotos.Close;
  tabTabelaPrecos.Close;
  tabTiposIndices.Close;
  tabProdutosVendas.Close;
  tabProdutosCompras.Close;
  tabMoldes.Close;
  tabSequenciaProducao.Close;
  tabProdutosFornecedores.Close;
  tabProdutosMoldes.Close;
  tabChecagens.Close;
  tabCor.Close;
  tabConfigPropri.Close;
  tabProdutosFT.Close;
  inherited;
end;

function TfmProdutos.Checagens: Boolean;
begin
  Result := False;
  if Trim(edtCodigoProduto.Text) = '' then
  begin
    ShowMessage('Obrigatório Preenchimento do Código do Produto');
    edtCodigoProduto.SetFocus;
    Result := True;
    exit;
  end;
  if Trim(edtNomeTecnico.Text) = '' then
  begin
    ShowMessage('Obrigatório Preenchimento do Nome Técnico do Produto');
    edtNomeTecnico.SetFocus;
    Result := True;
    exit;
  end;
  {
  if Trim(edtGrupo.Text) = '' then
  begin
    ShowMessage('Obrigatório Preenchimento do Grupo');
    pgcProdutos.ActivePage := tbsGeral;
    edtGrupo.SetFocus;
    Result := True;
    exit;
  end;
  }
  // Grupo Matéria Prima
  if edtGrupo.KeyValue = tabConfigPropri.FieldByName('CodigoGrupoMP').AsFloat then
  begin
    if Trim(edtUnidade.Text) = '' then
    begin
      ShowMessage('Obrigatório Preenchimento da Unidade');
      pgcProdutos.ActivePage := tbsGeral;
      edtUnidade.SetFocus;
      exit;
    end;
    if Trim(edtMoeda.Text) = '' then
    begin
      ShowMessage('Obrigatório Preenchimento da Moeda');
      pgcProdutos.ActivePage := tbsPrecos;
      edtMoeda.SetFocus;
      exit;
    end;
  end;
  if tabBase.State = dsInsert then
  begin
    if ExistsValue('CodigoProduto', 'produtos', edtCodigoProduto.Text) then
    begin
      ShowMessage('Código do Produto já Existente');
      edtCodigoProduto.SetFocus;
      Result := True;
      exit;
    end;
  end;
end;

procedure TfmProdutos.AtualizaCodigoProduto;
begin
  if FTyping = False then
  begin
    edtCodigoProduto.Text := tabBase.FieldByName('CodigoProduto').AsString;
  end;
end;

procedure TfmProdutos.Cancelar;
begin
end;

procedure TfmProdutos.AtualizaStatusEstoque;
begin
  if Trim(edtCodigoProduto.Text) <> '' then
  begin
    if tabBase.FieldByName('PontoReposicao').AsFloat > 0 then
    begin
      if tabProdutosEstoque.FieldByName('Disponivel').AsFloat < tabBase.FieldByName('PontoReposicao').AsFloat then
      begin
        pnlStatusEstoque.Caption := 'Estoque Baixo';
        pnlStatusEstoque.Color := clRed;
      end
      else if tabProdutosEstoque.FieldByName('Disponivel').AsFloat > tabBase.FieldByName('PontoReposicao').AsFloat then
      begin
        pnlStatusEstoque.Color := clGreen;
        pnlStatusEstoque.Caption := 'Estoque Alto';
      end
      else
      begin
        pnlStatusEstoque.Color := clYellow;
        pnlStatusEstoque.Caption := 'Estoque Normal';
      end;
      edtPontoReposicao.Color := clWhite;
    end
    else
    begin
      pnlStatusEstoque.Caption := 'Ponto de Reposição não Definido';
      pnlStatusEstoque.Color := clInactiveCaption;
      edtPontoReposicao.Color := clInactiveCaption;
    end;
  end
  else
  begin
    pnlStatusEstoque.Caption := '';
    pnlStatusEstoque.Color := clBtnFace;
  end;
end;

procedure TfmProdutos.AtualizaDadosEstoque;
begin
  {
  if tabProdutosEstoque.FieldByName('Estoque').AsFloat < 0 then begin
     edtEstoque.Text:='0';
   end
  else begin
     edtEstoque.Text:=FloatToStr(tabProdutosEstoque.FieldByName('Estoque').AsFloat);
  end;
  }

  // Exibindo se a quantidade, mesmo se for negativo
  edtEstoque.Text := FloatToStr(tabProdutosEstoque.FieldByName('Estoque').AsFloat);

  edtFaltas.Text := FloatToStr(tabProdutosEstoque.FieldByName('Faltas').AsFloat);
  edtEmpenho.Text := FloatToStr(tabProdutosEstoque.FieldByName('Empenho').AsFloat);
  edtInterno.Text := FloatToStr(tabProdutosEstoque.FieldByName('Interno').AsFloat);
  edtDisponivel.Text := FloatToStr(tabProdutosEstoque.FieldByName('Disponivel').AsFloat);
end;

procedure TfmProdutos.AtualizaFotoProduto;
begin
  if not LoadImageFromBD_ID('Foto', 'produtos_fotos', 'ID', tabProdutosFotos.FieldByName('ID').AsString, imgFotoProduto) then
  begin
    imgFotoProduto.Picture := nil;
  end;
end;

procedure TfmProdutos.btnExcluirFotoClick(Sender: TObject);
begin
  if tabProdutosFotos.RecordCount > 0 then
  begin
    if Application.MessageBox(Pchar('Confirmar Exclusão da Foto do Produto ' + tabBase.FieldByName('CodigoProduto').AsString), 'Exclusão da Foto', 36) = 7 then
      exit;
    if tabBase.FieldByName('CodigoProduto').AsString = tabProdutosFotos.FieldByName('CodigoProduto').AsString then
    begin
      tabProdutosFotos.Delete;
      tabProdutosFotos.ApplyUpdates;
      AtualizaFotoProduto;
      AtualizaLabelStatusImagem;
    end;
  end;
end;

procedure TfmProdutos.btnAlterarFotoClick(Sender: TObject);
var
  vZQuery: TZQuery;
  AStream: TMemoryStream;
  vProdutosFotosID : Real;
begin
  if (Trim(edtCodigoProduto.Text) <> '') and (tabBase.RecordCount > 0) then
  begin
    if not Assigned(fmCadastrarImagem) then
    begin
      Application.CreateForm(TfmCadastrarImagem, fmCadastrarImagem);
      fmCadastrarImagem.ShowModal;
    end;
    if fmMenu.pubTransImg <> nil then
    begin

      // Exibe a imagem
      imgFotoProduto.Picture.Graphic := fmMenu.pubTransImg;

      try
        // Prepara a inserçào
        AStream := TMemoryStream.Create;
        vZQuery := TZQuery.Create(nil);
        vZQuery.Connection := fmMenu.zcnConexao;
        vZQuery.Close;
        vZQuery.SQL.Clear;

        try
          // Salva a imagem na variável
          imgFotoProduto.Picture.Graphic.SaveToStream(AStream);
          AStream.Position := 0;

          // Monta o comando SQL com os parametros
          vZQuery.Params.CreateParam(ftFloat, 'pID', ptUnknown);
          vZQuery.Params.CreateParam(ftString, 'pCodigoProduto', ptUnknown);
          vZQuery.Params.CreateParam(ftBlob, 'pFoto', ptUnknown);
          vZQuery.SQL.Add('INSERT INTO produtos_fotos (ID, CodigoProduto, Foto )');
          vZQuery.SQL.Add('VALUES (:pID, :pCodigoProduto, :pFoto)');

          // Preenche os paramestros e insere
          vProdutosFotosID := CodeGenerator('produtos_fotos', 'ID');
          vZQuery.ParamByName('pID').AsFloat := vProdutosFotosID;
          vZQuery.ParamByName('pCodigoProduto').AsString := edtCodigoProduto.Text;
          vZQuery.ParamByName('pFoto').LoadFromStream(AStream, ftBlob);
          vZQuery.ExecSQL;

          tabProdutosFotos.Close;
          tabProdutosFotos.ParamByName('CodigoProduto').AsString := tabBase.FieldByName('CodigoProduto').AsString;
          tabProdutosFotos.Open;

          tabProdutosFotos.Locate('ID',vProdutosFotosID, [] );

          // Coloca a imagem atual
          if not LoadImageFromBD_ID('Foto', 'produtos_fotos', 'ID', FloatToStr(vProdutosFotosID), imgFotoProduto) then
          begin
            imgFotoProduto.Picture := nil;
          end;

          AtualizaLabelStatusImagem;

        finally
          // libera as variáveis
          AStream.Free;
          vZQuery.Free;
        end;

      except
        on E: Exception do
        begin
          imgFotoProduto.Picture := nil;
          ShowMessage(E.Message);
        end;
      end;

    end;
  end
  else
  begin
    ShowMessage('Selecione um Produto para Incluir ou Alterar uma Imagem');
  end;
end;

procedure TfmProdutos.btnLocalizaMoldeClick(Sender: TObject);
{
var vParams: TParametrosLocalizar;
begin
   if tabBase.State in [dsInsert, dsEdit] then begin
      vParams.Table:='moldes';
      vParams.KeyField:='NMolde';
      vParams.Field1:='Descricao';
      if not Assigned (fmLocalizarGenerico) then begin
         Application.CreateForm(TfmLocalizarGenerico, fmLocalizarGenerico);
         fmLocalizarGenerico.LoadParams(vParams);
         fmLocalizarGenerico.ShowModal;
      end;
      if Trim(fmMenu.pubTrans1) <> '' then begin
         tabBase.FieldByName('NMolde').AsString:=fmMenu.pubTrans1;
         tabMoldes.Close;
         tabMoldes.ParamByName('NMolde').Value:=tabBase.FieldByName('NMolde').Value;
         tabMoldes.Open;
      end;
   end;
end;}
var
  vParam: TParametrosLocalizar;
begin
  if tabBase.State in [dsInsert, dsEdit] then
  begin
    vParam.Table := 'moldes';
    vParam.KeyField := 'NMolde';
    vParam.Field1 := 'Descricao';
    if not Assigned(fmLocalizarGenerico) then
    begin
      Application.CreateForm(TfmLocalizarGenerico, fmLocalizarGenerico);
      fmLocalizarGenerico.LoadParams(vParam);
      fmLocalizarGenerico.ShowModal;
    end;
    if Trim(fmMenu.pubTrans1) <> '' then
    begin
      edtMoldeNumero.Text := fmMenu.pubTrans1;
    end;
  end;
end;

procedure TfmProdutos.edtSetorCodigoChange(Sender: TObject);
begin
  if tabBase.State in [dsInsert, dsEdit] then
  begin
    if Trim(edtSetorCodigo.Text) <> '' then
    begin
      try
        tabChecagens.Close;
        tabChecagens.SQL.Clear;
        tabChecagens.SQL.Add('SELECT * FROM genericos WHERE Codigo = ' + edtSetorCodigo.Text + ' AND Tipo = ' + QuotedStr('22'));
        tabChecagens.Open;
        if tabChecagens.RecordCount > 0 then
        begin
          edtSetorDescricao.Text := tabChecagens.FieldByName('Descricao').AsString;
        end
        else
        begin
          edtSetorDescricao.Text := '';
        end;
      finally
        tabChecagens.Close;
      end;
    end
    else
    begin
      edtSetorDescricao.Text := '';
    end;
  end;
end;

procedure TfmProdutos.btnLocalizaSetorClick(Sender: TObject);
var
  vParam: TParametrosLocalizar;
begin
  if tabBase.State in [dsInsert, dsEdit] then
  begin
    vParam.Table := 'genericos';
    vParam.KeyField := 'Codigo';
    vParam.Field1 := 'Descricao';
    vParam.Filter := 'Tipo = ' + QuotedStr('22');
    if not Assigned(fmLocalizarGenerico) then
    begin
      Application.CreateForm(TfmLocalizarGenerico, fmLocalizarGenerico);
      fmLocalizarGenerico.LoadParams(vParam);

      fmLocalizarGenerico.ShowModal;
    end;
    if Trim(fmMenu.pubTrans1) <> '' then
    begin
      edtSetorCodigo.Text := fmMenu.pubTrans1;
    end;
  end;
end;

procedure TfmProdutos.btnSetorAdicionarClick(Sender: TObject);
var
  vSeq: Integer;
begin
  if tabBase.State in [dsInsert, dsEdit] then
  begin
    if Trim(tabBase.FieldByName('CodigoProduto').AsString) <> '' then
    begin
      if Trim(edtSetorDescricao.Text) <> '' then
      begin
        try
          tabChecagens.Close;
          tabChecagens.SQL.Clear;
          tabChecagens.SQL.Add('SELECT * FROM sequencia_producao_produtos WHERE CodigoProduto = ' + QuotedStr(edtCodigoProduto.Text) + ' AND CodigoSetor = ' + edtSetorCodigo.Text);
          tabChecagens.Open;

          if tabChecagens.RecordCount = 0 then
          begin
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT MAX(Sequencia) AS SEQ FROM sequencia_producao_produtos WHERE CodigoProduto = ' + QuotedStr(edtCodigoProduto.Text));
            tabChecagens.Open;
            vSeq := tabChecagens.FieldByName('SEQ').AsInteger;

            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT * FROM sequencia_producao_produtos WHERE 0');
            tabChecagens.Open;

            tabChecagens.Append;
            tabChecagens.FieldByName('CodigoProduto').AsString := tabBase.FieldByName('CodigoProduto').AsString;
            tabChecagens.FieldByName('CodigoSetor').AsFloat := StrToFloat(edtSetorCodigo.Text);
            tabChecagens.FieldByName('Sequencia').AsInteger := vSeq + 1;
          end
          else
          begin
            tabChecagens.Edit;
            tabChecagens.FieldByName('CodigoSetor').AsFloat := StrToFloat(edtSetorCodigo.Text);
            tabChecagens.FieldByName('ObsProducao').AsString := edtSetorObservacao.Text;
          end;

          tabChecagens.Post;
          tabChecagens.ApplyUpdates;

          edtSetorCodigo.Text := '';
          edtSetorDescricao.Text := '';
          edtSetorObservacao.Lines.Clear;

          edtSetorCodigo.SetFocus;

          tabSequenciaProducao.Close;
          tabSequenciaProducao.ParamByName('CodigoProduto').Value := tabBase.FieldByName('CodigoProduto').Value;
          tabSequenciaProducao.Open;
        finally
          tabChecagens.Close;
        end;
      end;
    end
    else
    begin
      ShowMessage('É necessário informar o Código do Produto antes de prosseguir.');
    end;
  end;
end;

procedure TfmProdutos.edtFornecedorCodigoChange(Sender: TObject);
begin
  if tabBase.State in [dsInsert, dsEdit] then
  begin
    if Trim(edtFornecedorCodigo.Text) <> '' then
    begin
      try
        tabChecagens.Close;
        tabChecagens.SQL.Clear;
        tabChecagens.SQL.Add('SELECT CodigoFornecedor,NomeFantasia FROM fornecedores WHERE CodigoFornecedor = ' + edtFornecedorCodigo.Text);
        tabChecagens.Open;
        if tabChecagens.RecordCount > 0 then
        begin
          edtFornecedorNome.Text := tabChecagens.FieldByName('NomeFantasia').AsString;
        end
        else
        begin
          edtFornecedorNome.Text := '';
        end;
      finally
        tabChecagens.Close;
      end;
    end
    else
    begin
      edtFornecedorNome.Text := '';
    end;
  end;
end;

procedure TfmProdutos.btnFornecedorLocalizarClick(Sender: TObject);
var
  vParam: TParametrosLocalizar;
begin
  if tabBase.State in [dsInsert, dsEdit] then
  begin
    vParam.Table := 'fornecedores';
    vParam.KeyField := 'CodigoFornecedor';
    vParam.Field1 := 'NomeFantasia';
    if not Assigned(fmLocalizarGenerico) then
    begin
      Application.CreateForm(TfmLocalizarGenerico, fmLocalizarGenerico);
      fmLocalizarGenerico.LoadParams(vParam);
      fmLocalizarGenerico.ShowModal;
    end;
    if Trim(fmMenu.pubTrans1) <> '' then
    begin
      edtFornecedorCodigo.Text := fmMenu.pubTrans1;
    end;
  end;
end;

procedure TfmProdutos.btnFornecedorAdicionarClick(Sender: TObject);
begin
  if tabBase.State in [dsInsert, dsEdit] then
  begin
    if Trim(edtFornecedorNome.Text) <> '' then
    begin
      try
        tabChecagens.Close;
        tabChecagens.SQL.Clear;
        tabChecagens.SQL.Add('SELECT CodigoFornecedor, CodigoProduto FROM produtos_fornecedores WHERE CodigoProduto = ' + QuotedStr(edtCodigoProduto.Text) + ' AND CodigoFornecedor = ' + edtFornecedorCodigo.Text);
        tabChecagens.Open;

        if tabChecagens.RecordCount > 0 then
        begin
          ShowMessage('Fornecedor ja incluido nesse Produto');
          exit;
        end;

        tabChecagens.Close;
        tabChecagens.SQL.Clear;
        tabChecagens.SQL.Add('SELECT * FROM produtos_fornecedores WHERE 0');
        tabChecagens.Open;

        tabChecagens.Append;
        tabChecagens.FieldByName('CodigoProduto').AsString := tabBase.FieldByName('CodigoProduto').AsString;
        tabChecagens.FieldByName('CodigoFornecedor').AsFloat := StrToFloat(edtFornecedorCodigo.Text);
        tabChecagens.Post;
        tabChecagens.ApplyUpdates;

        edtFornecedorCodigo.Text := '';
        edtFornecedorNome.Text := '';

        tabProdutosFornecedores.Close;
        tabProdutosFornecedores.ParamByName('CodigoProduto').Value := tabBase.FieldByName('CodigoProduto').Value;
        tabProdutosFornecedores.Open;
      finally
        tabChecagens.Close;
      end;
    end;
  end;
end;

procedure TfmProdutos.btnNovoClick(Sender: TObject);
begin
  inherited;

  // limpar
  tabProdutosEstoque.Close;
  tabProdutosEstoque.ParamByName('CodigoProduto').AsString := '-1';
  tabProdutosEstoque.Open;

  tabProdutosFotos.Close;
  tabProdutosFotos.ParamByName('CodigoProduto').AsString := '-1';
  tabProdutosFotos.Open;

  tabTabelaPrecos.Close;
  tabTabelaPrecos.ParamByName('CodigoProduto').AsString := '-1';
  tabTabelaPrecos.Open;

  tabProdutosVendas.Close;
  tabProdutosVendas.ParamByName('CodigoProduto').AsString := '-1';
  tabProdutosVendas.Open;

  tabProdutosCompras.Close;
  tabProdutosCompras.ParamByName('CodigoProduto').AsString := '-1';
  tabProdutosCompras.Open;

  tabMoldes.Close;
  tabMoldes.ParamByName('NMolde').AsString := '-1';
  tabMoldes.Open;

  tabSequenciaProducao.Close;
  tabSequenciaProducao.ParamByName('CodigoProduto').AsString := '-1';
  tabSequenciaProducao.Open;

  tabProdutosFornecedores.Close;
  tabProdutosFornecedores.ParamByName('CodigoProduto').AsString := '-1';
  tabProdutosFornecedores.Open;

  tabProdutosMoldes.Close;
  tabProdutosMoldes.ParamByName('CodigoProduto').AsString := '-1';
  tabProdutosMoldes.Open;

  tabProdutosFT.Close;
  tabProdutosFT.ParamByName('CodigoProduto').AsString := '-1';
  tabProdutosFT.Open;

  tabMoldesGrupos.Close;
  tabMoldesGrupos.ParamByName('MoldesGrupos').AsFloat := -1;
  tabMoldesGrupos.Open;

  tabMoldesSetor.Close;
  tabMoldesSetor.ParamByName('CodigoSetor').AsFloat := -1;
  tabMoldesSetor.Open;

  tabMoldesCor.Close;
  tabMoldesCor.ParamByName('MoldesCor').AsFloat := -1;
  tabMoldesCor.Open;

  AtualizaDadosEstoque;

  edtCodigoProduto.Text := '';
  pnlStatusEstoque.Caption := '';
  pnlStatusEstoque.Color := Color;
  imgFotoProduto.Picture := nil;
  lblStatusImagem.Caption := 'Imagem: 0 / 0';
  edtCodigoProduto.SetFocus;
end;

procedure TfmProdutos.AtualizaLabelStatusImagem;
begin
  lblStatusImagem.Caption := 'Imagem: ' + IntToStr(tabProdutosFotos.RecNo) + ' / ' + IntToStr(tabProdutosFotos.RecordCount);
end;

procedure TfmProdutos.btnImagemAnteriorClick(Sender: TObject);
begin
  tabProdutosFotos.Prior;
  AtualizaFotoProduto;
  AtualizaLabelStatusImagem;
end;

procedure TfmProdutos.btnImagemProximoClick(Sender: TObject);
begin
  tabProdutosFotos.Next;
  AtualizaFotoProduto;
  AtualizaLabelStatusImagem;
end;

procedure TfmProdutos.dtsMoldesDataChange(Sender: TObject; Field: TField);
begin
  {
  tabMoldesGrupos.Close;
  tabMoldesGrupos.ParamByName('MoldesGrupos').AsFloat := tabMoldes.FieldByName('CodigoGrupo').AsFloat;
  tabMoldesGrupos.Open;

  tabMoldesSetor.Close;
  tabMoldesSetor.ParamByName('CodigoSetor').AsFloat := tabMoldes.FieldByName('CodigoSetor').AsFloat;
  tabMoldesSetor.Open;

  tabMoldesCor.Close;
  tabMoldesCor.ParamByName('MoldesCor').AsFloat := tabMoldes.FieldByName('CodigoCor').AsFloat;
  tabMoldesCor.Open;
  }
end;

procedure TfmProdutos.btnSetorRemoverClick(Sender: TObject);
begin
  if tabBase.State in [dsInsert, dsEdit] then
  begin
    if tabSequenciaProducao.RecordCount > 0 then
    begin
      if Application.MessageBox('Deseja Realmente Excluir a Sequência?', PChar(Application.Title), 36) = 7 then
        exit;
      try
        tabChecagens.Close;
        tabChecagens.SQL.Clear;
        tabChecagens.SQL.Add('SELECT * FROM sequencia_producao_produtos WHERE ');
        tabChecagens.SQL.Add('CodigoProduto = ' + QuotedStr(tabSequenciaProducao.FieldByName('CodigoProduto').AsString));
        tabChecagens.SQL.Add(' AND CodigoSetor = ' + tabSequenciaProducao.FieldByName('CodigoSetor').AsString);
        tabChecagens.SQL.Add('LIMIT 1');
        tabChecagens.Open;
        if tabChecagens.RecordCount = 1 then
        begin
          tabChecagens.Delete;
          tabChecagens.ApplyUpdates;
        end;
      finally
        tabChecagens.Close;
      end;
      tabSequenciaProducao.Close;
      tabSequenciaProducao.ParamByName('CodigoProduto').Value := tabBase.FieldByName('CodigoProduto').Value;
      tabSequenciaProducao.Open;
    end;
  end;
end;

procedure TfmProdutos.btnFornecedorRemoverClick(Sender: TObject);
begin
  if tabBase.State in [dsInsert, dsEdit] then
  begin
    if tabProdutosFornecedores.RecordCount > 0 then
    begin
      if Application.MessageBox('Deseja Realmente Excluir o Fornecedor?', PChar(Application.Title), 36) = 7 then
        exit;
      tabProdutosFornecedores.Delete;
      tabProdutosFornecedores.ApplyUpdates;
    end;
  end;
end;

procedure TfmProdutos.btnLocalizarClick(Sender: TObject);
begin
  inherited;
  if not Assigned(fmLocalizarProdutos) then
  begin
    Application.CreateForm(TfmLocalizarProdutos, fmLocalizarProdutos);
    fmLocalizarProdutos.ShowModal;
  end;
  if Trim(fmMenu.pubTrans1) <> '' then
  begin
    edtCodigoProduto.Text := fmMenu.pubTrans1;
    tabBase.Close;
    tabBase.ParamByName('CodigoProduto').Value := edtCodigoProduto.Text;
    tabBase.Open;

    ExibeDados;
  end;
end;

procedure TfmProdutos.edtCodigoProdutoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if tabBase.State = dsBrowse then
  begin
    if Trim(edtCodigoProduto.Text) <> '' then
    begin
      FTyping := True;
      tabBase.Close;
      tabBase.ParamByName('CodigoProduto').AsString := edtCodigoProduto.Text;
      tabBase.Open;
      ExibeDados;
      FTyping := False;
    end
    else
    begin
      FTyping := True;
      tabBase.Close;
      tabBase.ParamByName('CodigoProduto').AsString := '';
      tabBase.Open;
      ExibeDados;
      FTyping := False;
    end;
  end;
end;

procedure TfmProdutos.edtCodigoProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #32 then
    Key := #0
  else
    Key := UpCase(Key);
end;

procedure TfmProdutos.btnEditarClick(Sender: TObject);
begin
  inherited;
  edtCodigoProduto.Enabled := False;
end;

procedure TfmProdutos.btnGravarClick(Sender: TObject);
begin
  inherited;
  edtCodigoProduto.Enabled := True;
end;

procedure TfmProdutos.btnCancelarClick(Sender: TObject);
begin
  inherited;
  edtCodigoProduto.Enabled := True;
end;

procedure TfmProdutos.dtsBaseDataChange(Sender: TObject; Field: TField);
begin

  if ((tabBase.State = dsBrowse) and (tabBase.RecordCount = 0)) then
  begin
    imgFotoProduto.Picture := nil;
    pnlStatusEstoque.Caption := 'Status Estoque';
    pnlStatusEstoque.Color := clBtnFace;

    edtEstoque.Text := '';
    edtFaltas.Text := '';
    edtEmpenho.Text := '';
    edtInterno.Text := '';
    edtDisponivel.Text := '';

    lblStatusImagem.Caption := 'Imagem: 0 / 0';
  end;

end;

procedure TfmProdutos.edtFTCodigoChange(Sender: TObject);
begin
  inherited;
  if tabBase.State in [dsInsert, dsEdit] then
  begin
    if Trim(edtFTCodigo.Text) <> '' then
    begin
      try
        tabChecagens.CLose;
        tabChecagens.SQL.Clear;
        tabChecagens.SQL.Add('SELECT NomeTecnico,CodigoUnidade FROM produtos WHERE CodigoProduto = ' + QuotedStr(edtFTCodigo.Text));
        tabChecagens.Open;
        if tabChecagens.RecordCount > 0 then
        begin
          edtFTDescricao.Text := tabChecagens.FieldByName('NomeTecnico').AsString;
          edtFTUnidade.KeyValue := tabChecagens.FieldByName('CodigoUnidade').AsFloat;
          edtFTValorUnitario.Value := fmMenu.GetLastCust(edtFTCodigo.Text);
        end
        else
        begin
          edtFTDescricao.Text := '';
          edtFTUnidade.KeyValue := NULL;
          edtFTValorUnitario.Value := 0;
        end;
      finally
        tabChecagens.CLose;
      end;
    end
    else
    begin
      edtFTDescricao.Text := '';
      edtFTUnidade.KeyValue := NULL;
      edtFTValorUnitario.Value := 0;
    end;
  end;
end;

procedure TfmProdutos.btnFTLocalizarClick(Sender: TObject);
begin
  inherited;
  if tabBase.State in [dsInsert, dsEdit] then
  begin
    if not Assigned(fmLocalizarProdutos) then
    begin
      Application.CreateForm(TfmLocalizarProdutos, fmLocalizarProdutos);
      fmLocalizarProdutos.ShowModal;
    end;
    if Trim(fmMenu.pubTrans1) <> '' then
    begin
      edtFTCodigo.Text := fmMenu.pubTrans1;
    end;
  end;
end;

procedure TfmProdutos.btnFTAddClick(Sender: TObject);
begin
  inherited;
  if tabBase.State in [dsEdit] then
  begin
    if Trim(edtFTCodigo.Text) = '' then
    begin
      ShowMessage('Obrigatório Preenchimento do Código do Produto');
      edtFTCodigo.SetFocus;
      exit;
    end;
    if Trim(edtFTDescricao.Text) = '' then
    begin
      ShowMessage('Obrigatório Preenchimento da Descrição do Produto');
      edtFTCodigo.SetFocus;
      exit;
    end;
    try
      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT * FROM produtos_ficha_tecnica WHERE CodigoPrincipal = ' + QuotedStr(edtCodigoProduto.Text));
      tabChecagens.SQL.Add('AND CodigoProduto = ' + QuotedStr(edtFTCodigo.Text));
      tabChecagens.Open;

      if tabChecagens.RecordCount = 0 then
      begin
        tabChecagens.Append;
        tabChecagens.FieldByName('CodigoPrincipal').AsString := edtCodigoProduto.Text;
        tabChecagens.FieldByName('CodigoProduto').AsString := edtFTCodigo.Text;
      end
      else
      begin
        tabChecagens.Edit;
      end;

      tabChecagens.FieldByName('Descricao').AsString := edtFTDescricao.Text;
      tabChecagens.FieldByName('Quantidade').AsFloat := edtFTQuantidade.Value;
      tabChecagens.FieldByName('ValorCusto').AsFloat := edtFTValorUnitario.Value;

      if edtDescricaoMaterial.Text <> '' then
      begin
        tabChecagens.FieldByName('CodigoMaterial').AsString := edtCodigoMaterial.Text;
      end;

      if Trim(edtCorMaterial.Text) <> '' then
      begin
        tabChecagens.FieldByName('CodigoCor').AsFloat      := StrToFloat(edtCorMaterial.KeyValue);
      end;

      if Trim(edtFTUnidade.Text) <> '' then
      begin
        tabChecagens.FieldByName('CodigoUnidade').AsFloat := StrToFloat(edtFTUnidade.KeyValue);
      end;


      tabChecagens.Post;
      tabChecagens.ApplyUpDates;

      edtFTCodigo.Text := '';
      edtFTDescricao.Text := '';
      edtFTQuantidade.Value := 0;
      edtFTValorUnitario.Value := 0;
      edtFTUnidade.KeyValue := NULL;

      edtCodigoMaterial.Text := '';
      edtDescricaoMaterial.Text := '';
      edtCorMaterial.KeyValue := NULL;

      tabProdutosFT.Close;
      tabProdutosFT.ParamByName('CodigoProduto').AsString := edtCodigoProduto.Text;
      tabProdutosFT.Open;

      AtualizaCustoProduto;

      edtFTCodigo.SetFocus;
    finally
      tabChecagens.Close;
    end;
  end
  else
  begin
    ShowMessage('Edite o Produto para Lançar a Ficha Técnica');
  end;
end;

procedure TfmProdutos.btnFTRemClick(Sender: TObject);
begin
  inherited;
  if tabBase.State in [dsInsert, dsEdit] then
  begin
    if tabProdutosFT.RecordCount > 0 then
    begin
      if Application.MessageBox('Deseja Realmente Excluir o Item da Ficha Técnica?', PChar(Application.Title), 36) = 7 then
        exit;
      try
        tabChecagens.Close;
        tabChecagens.SQL.Clear;
        tabChecagens.SQL.Add('SELECT * FROM produtos_ficha_tecnica ');
        tabChecagens.SQL.Add('WHERE CodigoProduto = ' + QuotedStr(tabProdutosFT.FieldByName('CodigoProduto').AsString) + ' AND ');
        tabChecagens.SQL.Add('CodigoPrincipal = ' + QuotedStr(edtCodigoProduto.Text));
        tabChecagens.SQL.Add(' LIMIT 1');
        tabChecagens.Open;
        tabChecagens.Delete;
        tabChecagens.ApplyUpdates;

        tabProdutosFT.Close;
        tabProdutosFT.ParamByName('CodigoProduto').AsString := tabBase.FieldByName('CodigoProduto').AsString;
        tabProdutosFT.Open;

        edtFTCodigo.Text := '';
        edtFTQuantidade.Value := 0;
        edtFTValorUnitario.Value := 0;
        edtFTUnidade.KeyValue := NULL;

        AtualizaCustoProduto;
      finally
        tabChecagens.Close;
      end;
    end;
  end;
end;

procedure TfmProdutos.edtFTCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #32 then
    Key := #0
  else
    Key := UpCase(Key);
end;

procedure TfmProdutos.btnExcluirClick(Sender: TObject);
begin
  if Trim(edtCodigoProduto.Text) <> '' then
  begin
    if StrToFloat(edtEstoque.Text) > 0 then
    begin
      ShowMessage('Não é possivel Excluir um Produto com Movimentações de Estoque');
      edtCodigoProduto.SetFocus;
      exit;
    end;
    inherited;
  end;
end;

procedure TfmProdutos.dbgFichaTecnicaCellClick(Column: TColumn);
begin
  inherited;
  if tabBase.State = dsEdit then
  begin
    edtFTCodigo.Text := tabProdutosFT.FieldByName('CodigoProduto').AsString;
    edtFTDescricao.Text := tabProdutosFT.FieldByName('Descricao').AsString;
    edtFTQuantidade.Text := tabProdutosFT.FieldByName('Quantidade').AsString;
    edtFTValorUnitario.Text := tabProdutosFT.FieldByName('ValorCusto').AsString;
    edtFTUnidade.KeyValue := tabProdutosFT.FieldByName('CodigoUnidade').AsFloat;
  end;
end;

procedure TfmProdutos.edtFTCustoAdicionalExit(Sender: TObject);
begin
  inherited;
  AtualizaCustoProduto;
end;

procedure TfmProdutos.AtualizaCustoProduto;
var
  vCusto: real;
begin
  if tabBase.State in [dsInsert, dsEdit] then
  begin
    vCusto := 0;
    tabProdutosFT.First;
    while not tabProdutosFT.Eof do
    begin
      vCusto := vCusto + (tabProdutosFT.FieldByName('ValorCusto').AsFloat * tabProdutosFT.FieldByName('Quantidade').AsFloat);
      tabProdutosFT.Next;
    end;

    tabBase.FieldByName('ValorCustoProduto').AsFloat := vCusto + ((vCusto * tabBase.FieldByName('PercAdicionalCusto').AsFloat) / 100);

  end;
end;

procedure TfmProdutos.dbgSetor1CellClick(Column: TColumn);
begin
  inherited;
  if tabBase.State = dsEdit then
  begin
    edtSetorCodigo.Text := tabSequenciaProducao.FieldByName('CodigoSetor').AsString;
    edtSetorObservacao.Text := tabSequenciaProducao.FieldByName('Observacao').AsString;
  end;
end;

procedure TfmProdutos.edtFTCustoAdicionalObsClick(Sender: TObject);
begin
  inherited;
  if tabBase.State in [dsInsert, dsEdit] then
  begin
    if not Assigned(fmObservacoes) then
    begin
      Application.CreateForm(TfmObservacoes, fmObservacoes);
      fmObservacoes.Caption := 'Observações Sobre o Custo Adicional';
      fmObservacoes.pubApplyUpDates := False;
      fmObservacoes.edtObservacoes.DataField := edtFTCustoAdicionalObs.DataField;
      fmObservacoes.edtObservacoes.DataSource := edtFTCustoAdicionalObs.DataSource;
      fmObservacoes.ShowModal;
    end;
  end;
end;

procedure TfmProdutos.ClonarProduto1Click(Sender: TObject);
var
  vCodigoProduto, vDescricao, vNomeIngles, vEndereco, vNCM, vEXTIPI,
    vObs, vDescDeta, vDescIngles, vMolde: string;
  vGrupo, vModelo, vCor, vUnidade, vPeso: real;
  vProdutoAcabado, vTabelaEstoque, vTabelaPreco,
    vPontoReposicao: Integer;
begin
  inherited;
  if not (tabBase.State in [dsInsert, dsEdit]) then
  begin
    if Trim(edtCodigoProduto.Text) <> '' then
    begin
      vCodigoProduto := tabBase.FieldByName('CodigoProduto').AsString;
      vDescricao := tabBase.FieldByName('NomeTecnico').AsString;
      vNomeIngles := tabBase.FieldByName('NomeIngles').AsString;
      vEndereco := tabBase.FieldByName('Endereco').AsString;
      vNCM := tabBase.FieldByName('NCM').AsString;
      vEXTIPI := tabBase.FieldByName('EXTIPI').AsString;
      vObs := tabBase.FieldByName('Observacao').AsString;
      vDescDeta := tabBase.FieldByName('DescricaoDetalhada').AsString;
      vDescIngles := tabBase.FieldByName('DescricaoIngles').AsString;
      vMolde := tabBase.FieldByName('NMolde').AsString;

      vGrupo := tabBase.FieldByName('CodigoGrupo').AsFloat;
      vModelo := tabBase.FieldByName('CodigoModelo').AsFloat;
      vCor := tabBase.FieldByName('CodigoCor').AsFloat;
      vUnidade := tabBase.FieldByName('CodigoUnidade').AsFloat;
      vPeso := tabBase.FieldByName('Peso').AsFloat;

      vProdutoAcabado := tabBase.FieldByName('ProdutoAcabado').AsInteger;
      vTabelaEstoque := tabBase.FieldByName('EntraTabelaEstoque').AsInteger;
      vTabelaPreco := tabBase.FieldByName('EntraTabelaPreco').AsInteger;

      vPontoReposicao := tabBase.FieldByName('PontoReposicao').AsInteger;

      btnNovo.Click;

      if tabBase.State = dsInsert then
      begin
        tabBase.FieldByName('CodigoProduto').AsString := vCodigoProduto + '(CLONE)';
        edtCodigoProduto.Text := tabBase.FieldByName('CodigoProduto').AsString;
        tabBase.FieldByName('NomeTecnico').AsString := vDescricao + ' (CLONE)';
        tabBase.FieldByName('NomeIngles').AsString := vNomeIngles;
        tabBase.FieldByName('Endereco').AsString := vEndereco;
        tabBase.FieldByName('NCM').AsString := vNCM;
        tabBase.FieldByName('EXTIPI').AsString := vEXTIPI;
        tabBase.FieldByName('Observacao').AsString := vObs;
        tabBase.FieldByName('DescricaoDetalhada').AsString := vDescDeta;
        tabBase.FieldByName('DescricaoIngles').AsString := vDescIngles;
        tabBase.FieldByName('NMolde').AsString := vMolde;

        tabBase.FieldByName('CodigoGrupo').AsFloat := vGrupo;
        tabBase.FieldByName('CodigoModelo').AsFloat := vModelo;
        tabBase.FieldByName('CodigoCor').AsFloat := vCor;
        tabBase.FieldByName('CodigoUnidade').AsFloat := vUnidade;
        tabBase.FieldByName('Peso').AsFloat := vPeso;

        tabBase.FieldByName('ProdutoAcabado').AsInteger := vProdutoAcabado;
        tabBase.FieldByName('EntraTabelaEstoque').AsInteger := vTabelaEstoque;
        tabBase.FieldByName('EntraTabelaPreco').AsInteger := vTabelaPreco;

        tabBase.FieldByName('PontoReposicao').AsInteger := vPontoReposicao;
      end;
    end;
  end;
end;

procedure TfmProdutos.btnOpcoesClick(Sender: TObject);
begin
  if (not (tabBase.State in [dsInsert, dsEdit])) and (Trim(edtCodigoProduto.Text) <> '') then
  begin
    ClonarProduto1.Enabled := True;
  end
  else
  begin
    ClonarProduto1.Enabled := False;
  end;
  inherited;
end;

procedure TfmProdutos.pgcProdutosChange(Sender: TObject);
begin
  inherited;
  if pgcProdutos.ActivePage = tbsFichaTecnica then
  begin
    if Trim(edtCodigoProduto.Text) <> '' then
    begin
      if tabBase.State = dsBrowse then
      begin
        fmMenu.AtualizarFichaTecnica(edtCodigoProduto.Text);
      end;
    end;
  end;
end;

procedure TfmProdutos.btnMoldeAdicionarClick(Sender: TObject);
begin
  if tabBase.State in [dsInsert, dsEdit] then
  begin
    if Trim(edtMoldeNumero.Text) <> '' then
    begin
      try
        tabChecagens.Close;
        tabChecagens.SQL.Clear;
        tabChecagens.SQL.Add('SELECT CodigoMolde, CodigoProduto FROM produtos_moldes WHERE CodigoProduto = ' + QuotedStr(edtCodigoProduto.Text) + ' AND CodigoMolde = ' + QuotedStr(edtMoldeNumero.Text));
        tabChecagens.Open;

        if tabChecagens.RecordCount > 0 then
        begin
          ShowMessage('Molde ja incluido nesse Produto');
          exit;
        end;

        tabChecagens.Close;
        tabChecagens.SQL.Clear;
        tabChecagens.SQL.Add('SELECT NMolde, Descricao FROM moldes WHERE NMolde = ' + QuotedStr(edtMoldeNumero.Text));
        tabChecagens.Open;

        if tabChecagens.RecordCount = 0 then
        begin
          ShowMessage('Molde não encontrado');

          edtMoldeDescricao.Text := '';

          Exit;
        end;

        tabChecagens.Close;
        tabChecagens.SQL.Clear;
        tabChecagens.SQL.Add('SELECT * FROM produtos_moldes WHERE 0');
        tabChecagens.Open;

        tabChecagens.Insert;
        tabChecagens.FieldByName('CodigoProduto').AsString := tabBase.FieldByName('CodigoProduto').AsString;
        tabChecagens.FieldByName('CodigoMolde').AsString := edtMoldeNumero.Text;
        tabChecagens.Post;
        tabChecagens.ApplyUpdates;

        edtMoldeNumero.Text := '';
        // edtMoldeNome.Text:='';

        tabProdutosMoldes.Close;
        tabProdutosMoldes.ParamByName('CodigoProduto').Value := tabBase.FieldByName('CodigoProduto').Value;
        tabProdutosMoldes.Open;
      finally
        tabChecagens.Close;
      end;
    end;
  end;
end;

procedure TfmProdutos.btnMoldeRemoverClick(Sender: TObject);
begin
  if tabBase.State in [dsInsert, dsEdit] then
  begin
    if tabProdutosMoldes.RecordCount > 0 then
    begin
      if Application.MessageBox('Deseja Realmente Excluir o Molde?', PChar(Application.Title), 36) = 7 then
        exit;

      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('DELETE FROM produtos_moldes WHERE   CodigoProduto = ' + QuotedStr(tabProdutosMoldes.FieldByName('CodigoProduto').AsString));
      tabChecagens.SQL.Add('                                  AND CodigoMolde = ' + QuotedStr(tabProdutosMoldes.FieldByName('CodigoMolde').AsString));
      tabChecagens.ExecSQL;

      tabProdutosMoldes.Refresh;
    end;
  end;
end;

procedure TfmProdutos.edtMoldeNumeroChange(Sender: TObject);
begin
  if tabBase.State in [dsInsert, dsEdit] then
  begin
    if Trim(edtMoldeNumero.Text) <> '' then
    begin
      try
        tabChecagens.Close;
        tabChecagens.SQL.Clear;
        tabChecagens.SQL.Add('SELECT NMolde, Descricao FROM moldes WHERE NMolde = ' + QuotedStr(edtMoldeNumero.Text));
        tabChecagens.Open;
        if tabChecagens.RecordCount > 0 then
        begin
          edtMoldeDescricao.Text := tabChecagens.FieldByName('Descricao').AsString;
        end
        else
        begin
          edtMoldeDescricao.Text := '';
        end;
      finally
        tabChecagens.Close;
      end;
    end
    else
    begin
      edtMoldeDescricao.Text := '';
    end;
  end;
end;

procedure TfmProdutos.ExibeDados;
begin
  tabProdutosEstoque.Close;
  tabProdutosEstoque.ParamByName('CodigoProduto').AsString := tabBase.FieldByName('CodigoProduto').AsString;
  tabProdutosEstoque.Open;

  tabProdutosFotos.Close;
  tabProdutosFotos.ParamByName('CodigoProduto').AsString := tabBase.FieldByName('CodigoProduto').AsString;
  tabProdutosFotos.Open;

  tabTabelaPrecos.Close;
  tabTabelaPrecos.ParamByName('CodigoProduto').AsString := tabBase.FieldByName('CodigoProduto').AsString;
  tabTabelaPrecos.Open;

  tabProdutosVendas.Close;
  tabProdutosVendas.ParamByName('CodigoProduto').AsString := tabBase.FieldByName('CodigoProduto').AsString;
  tabProdutosVendas.Open;

  tabProdutosCompras.Close;
  tabProdutosCompras.ParamByName('CodigoProduto').AsString := tabBase.FieldByName('CodigoProduto').AsString;
  tabProdutosCompras.Open;

  tabMoldes.Close;
  tabMoldes.ParamByName('NMolde').AsString := tabBase.FieldByName('NMolde').AsString;
  tabMoldes.Open;

  tabSequenciaProducao.Close;
  tabSequenciaProducao.ParamByName('CodigoProduto').AsString := tabBase.FieldByName('CodigoProduto').AsString;
  tabSequenciaProducao.Open;

  tabProdutosFornecedores.Close;
  tabProdutosFornecedores.ParamByName('CodigoProduto').AsString := tabBase.FieldByName('CodigoProduto').AsString;
  tabProdutosFornecedores.Open;

  tabProdutosMoldes.Close;
  tabProdutosMoldes.ParamByName('CodigoProduto').AsString := tabBase.FieldByName('CodigoProduto').AsString;
  tabProdutosMoldes.Open;

  tabProdutosFT.Close;
  tabProdutosFT.ParamByName('CodigoProduto').AsString := tabBase.FieldByName('CodigoProduto').AsString;
  tabProdutosFT.Open;

  AtualizaCodigoProduto;
  AtualizaDadosEstoque;
  AtualizaStatusEstoque;
  AtualizaFotoProduto;
  AtualizaLabelStatusImagem;
end;

procedure TfmProdutos.btnProducaoMediaHoraClick(Sender: TObject);
begin
  Application.CreateForm(TfmProducaoMediaHora, fmProducaoMediaHora);

  if edtCodigoProduto.Text <> '' then
  begin
    fmProducaoMediaHora.edtCodigoProduto.Text := edtCodigoProduto.Text;
  end;

  fmProducaoMediaHora.show;
end;

procedure TfmProdutos.tbsFichaTecnicaShow(Sender: TObject);
begin
  inherited;
  
  tabMaterial.Close;
  tabMaterial.SQL.Clear;
  tabMaterial.SQL.Add('SELECT CodigoProduto, NomeTecnico FROM produtos ');
  tabMaterial.Open;

end;

procedure TfmProdutos.btn1Click(Sender: TObject);
begin
  inherited;
  if tabBase.State in [dsInsert, dsEdit] then
  begin
    if not Assigned(fmLocalizarProdutos) then
    begin
      Application.CreateForm(TfmLocalizarProdutos, fmLocalizarProdutos);
      fmLocalizarProdutos.ShowModal;
    end;
    if Trim(fmMenu.pubTrans1) <> '' then
    begin
      edtCodigoMaterial.Text := fmMenu.pubTrans1;
    end;
  end;
end;

procedure TfmProdutos.edtCodigoMaterialChange(Sender: TObject);
begin
  inherited;
  if tabBase.State in [dsInsert, dsEdit] then
  begin
    if Trim(edtCodigoMaterial.Text) <> '' then
    begin
      try
        tabChecagens.CLose;
        tabChecagens.SQL.Clear;
        tabChecagens.SQL.Add('SELECT NomeTecnico FROM produtos WHERE CodigoProduto = ' + QuotedStr(edtCodigoMaterial.Text));
        tabChecagens.Open;

        if tabChecagens.RecordCount > 0 then
        begin
          edtDescricaoMaterial.Text := tabChecagens.FieldByName('NomeTecnico').AsString;
        end
        else
        begin
          edtDescricaoMaterial.Text := '';
        end;
      finally
        tabChecagens.CLose;
      end;
    end
    else
    begin
      edtDescricaoMaterial.Text := '';
    end;
  end;
end;

end.


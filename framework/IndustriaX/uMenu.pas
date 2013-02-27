unit uMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Menus, ZConnection, Buttons, uTipos,
  DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Math, StdCtrls, Mask,
  DBCtrls, QuickRpt, Grids, DBGrids, TypInfo, jpeg, uFormBaseMenu, AppEvnts,
  DBClient, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinsdxStatusBarPainter, dxStatusBar, HTMLHelpViewer,
  cxLocalization, ZSqlMonitor, XMLDoc, XMLIntf, AppEvent,
  ZAbstractConnection, ShellAPI;
type
  TfmMenu = class(TfmFormBaseMenu)
    mnmMenu: TMainMenu;
    Cadastros1: TMenuItem;
    Produtos1: TMenuItem;
    Moldes1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    zcnConexao: TZConnection;
    Sistema1: TMenuItem;
    Janelas1: TMenuItem;
    SobreoSistema1: TMenuItem;
    N2: TMenuItem;
    ConfiguraodosUsurios1: TMenuItem;
    Cascata1: TMenuItem;
    FecharTodas1: TMenuItem;
    ConfiguraodosArquivosdeSistema1: TMenuItem;
    zcnTeste: TZConnection;
    N3: TMenuItem;
    Clientes1: TMenuItem;
    Contatos1: TMenuItem;
    Empresas1: TMenuItem;
    Funcionrios1: TMenuItem;
    Fornecedores1: TMenuItem;
    N4: TMenuItem;
    Ativos1: TMenuItem;
    N5: TMenuItem;
    ransportadoras1: TMenuItem;
    Grupo1: TMenuItem;
    Modelo1: TMenuItem;
    Cor1: TMenuItem;
    N7: TMenuItem;
    ipos1: TMenuItem;
    N8: TMenuItem;
    FecharTodasasJanelas1: TMenuItem;
    Lanamentos1: TMenuItem;
    Financeiro1: TMenuItem;
    Preos1: TMenuItem;
    Relatrios1: TMenuItem;
    EnviodeEmailsLote1: TMenuItem;
    EnviodeEmailsIndividual1: TMenuItem;
    OramentosEnviadosporEmail1: TMenuItem;
    FormasdePagamento1: TMenuItem;
    LocalizaodosTtulos1: TMenuItem;
    ResponsvelTtulos1: TMenuItem;
    iposdeOramento1: TMenuItem;
    iposdeNotaFiscal1: TMenuItem;
    iposdeIndicesFinanceiros1: TMenuItem;
    iposdeTabelasdePreo1: TMenuItem;
    CFOP1: TMenuItem;
    RegimeTributrio1: TMenuItem;
    N15: TMenuItem;
    StatusdoPedido1: TMenuItem;
    GruposdeClientes1: TMenuItem;
    iposdeClientes1: TMenuItem;
    StatusdeClientes1: TMenuItem;
    Unidades1: TMenuItem;
    CentrodeCusto1: TMenuItem;
    Setor1: TMenuItem;
    N20: TMenuItem;
    SetordeTrabalho1: TMenuItem;
    tabBusca: TZQuery;
    Oramentos1: TMenuItem;
    PedidosdeVenda1: TMenuItem;
    Aproveitamento1: TMenuItem;
    ManutenodePreos1: TMenuItem;
    N24: TMenuItem;
    FaturamentoClientes1: TMenuItem;
    FaturamentoFornecedores1: TMenuItem;
    N13: TMenuItem;
    ProdutosRequisiodeEntrada1: TMenuItem;
    ProdutosRequisiodeSada1: TMenuItem;
    N25: TMenuItem;
    abelaCorreio1: TMenuItem;
    N26: TMenuItem;
    RequisiodeCompras1: TMenuItem;
    ConsultaRequisiodeCompras1: TMenuItem;
    OramentosdeCompras1: TMenuItem;
    Compras1: TMenuItem;
    N27: TMenuItem;
    ConsultaOramentodeCompras1: TMenuItem;
    N28: TMenuItem;
    PedidosdeCompra1: TMenuItem;
    N29: TMenuItem;
    OrdemdeProduoEntrada1: TMenuItem;
    Receber1: TMenuItem;
    Recebidos1: TMenuItem;
    N30: TMenuItem;
    Pagar1: TMenuItem;
    Pagos1: TMenuItem;
    Bancos1: TMenuItem;
    N32: TMenuItem;
    GerarPendentes1: TMenuItem;
    N33: TMenuItem;
    ExportaoNotaFiscalPaulista1: TMenuItem;
    ExportaoNotaFiscalEletrnica1: TMenuItem;
    N34: TMenuItem;
    EnviodoEmailNFe1: TMenuItem;
    tulosaReceber1: TMenuItem;
    Consulta1: TMenuItem;
    tulosRecebidos1: TMenuItem;
    Consulta2: TMenuItem;
    tulosaPagar1: TMenuItem;
    Consulta3: TMenuItem;
    tulosPagos1: TMenuItem;
    Consulta4: TMenuItem;
    RelatriodeTabelasdePreo1: TMenuItem;
    Estoque1: TMenuItem;
    Financeiro2: TMenuItem;
    Operacionais1: TMenuItem;
    Produo1: TMenuItem;
    Oramentos2: TMenuItem;
    Pedidos1: TMenuItem;
    Faturamento1: TMenuItem;
    Gerenciais1: TMenuItem;
    ReposiodeEstoque1: TMenuItem;
    RelaodeEstoque1: TMenuItem;
    Receber2: TMenuItem;
    Pagar2: TMenuItem;
    Produtos2: TMenuItem;
    N35: TMenuItem;
    Financeiro3: TMenuItem;
    Clientes2: TMenuItem;
    N14: TMenuItem;
    Moldes2: TMenuItem;
    N16: TMenuItem;
    N21: TMenuItem;
    N38: TMenuItem;
    ConfigurarBotesCadastro1: TMenuItem;
    ConfiguraodoPerfildeUsurios1: TMenuItem;
    N39: TMenuItem;
    N17: TMenuItem;
    N19: TMenuItem;
    Cidades1: TMenuItem;
    Pases1: TMenuItem;
    Endereos1: TMenuItem;
    Email2: TMenuItem;
    ConfiguraoRegional1: TMenuItem;
    Funcionrios2: TMenuItem;
    Departamentos1: TMenuItem;
    N6: TMenuItem;
    Cargos1: TMenuItem;
    GraudeParentesco1: TMenuItem;
    ConfiguraodosUsurios2: TMenuItem;
    UsuriosLogados2: TMenuItem;
    Produo2: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    AcertodoEstoque1: TMenuItem;
    tabAtualizaEstoque: TZQuery;
    tabEstoque: TZQuery;
    tabInterno: TZQuery;
    tabEmpenho: TZQuery;
    tulosEmitidos1: TMenuItem;
    tulosemAberto1: TMenuItem;
    tulosRecebidos2: TMenuItem;
    tulosEmitidos2: TMenuItem;
    tulosemAberto2: TMenuItem;
    tulosPagos2: TMenuItem;
    MatriaPrimaCapitalInvestido1: TMenuItem;
    RelaodeCentrodeCusto1: TMenuItem;
    RelaodeCFOP1: TMenuItem;
    N12: TMenuItem;
    N18: TMenuItem;
    N23: TMenuItem;
    InventriodeProdutos1: TMenuItem;
    N36: TMenuItem;
    VendasRecebidas1: TMenuItem;
    PedidosOscilaes1: TMenuItem;
    RelaodeClientes1: TMenuItem;
    RelaodeContatos1: TMenuItem;
    N41: TMenuItem;
    RelaodeSetores1: TMenuItem;
    RelaodeClientesporSetores1: TMenuItem;
    N43: TMenuItem;
    RelaodeFormasdePagto1: TMenuItem;
    N44: TMenuItem;
    RelaodeProdutos1: TMenuItem;
    OrdensdeProduo1: TMenuItem;
    N45: TMenuItem;
    EmissodeOramentos1: TMenuItem;
    PedidosPendentes1: TMenuItem;
    ProdutosPendentes1: TMenuItem;
    PedidosRealizados1: TMenuItem;
    FaturamentoPerodo1: TMenuItem;
    iposdeLiquidao1: TMenuItem;
    AppEvents: TApplicationEvents;
    Rastrear1: TMenuItem;
    tabConfigPropri: TZQuery;
    EstadoCivil1: TMenuItem;
    N31: TMenuItem;
    ProdutosPendentes2: TMenuItem;
    iposdeAusncias1: TMenuItem;
    N9: TMenuItem;
    IndicesFinanceiros1: TMenuItem;
    opProdutosVendidos1: TMenuItem;
    N40: TMenuItem;
    N47: TMenuItem;
    LogdeUsurios1: TMenuItem;
    GerarParticipaoVendedores1: TMenuItem;
    N48: TMenuItem;
    HorariosdeTrabalho1: TMenuItem;
    N49: TMenuItem;
    PaineldeProduo1: TMenuItem;
    VendasporEstado1: TMenuItem;
    ContasBancrias1: TMenuItem;
    iposdeAdvertncias1: TMenuItem;
    N50: TMenuItem;
    RemessaBancodoBrasil1: TMenuItem;
    RetornoBancodoBrasil1: TMenuItem;
    IndicesCotaes1: TMenuItem;
    N51: TMenuItem;
    EmissodoBoletoBancrio1: TMenuItem;
    LeituraDigital1: TMenuItem;
    N22: TMenuItem;
    CordosProdutos1: TMenuItem;
    Faturamento2: TMenuItem;
    FaturamentoAnual1: TMenuItem;
    Vendas1: TMenuItem;
    Gerenciais2: TMenuItem;
    Vendas2: TMenuItem;
    Produo3: TMenuItem;
    InjeesaoDia1: TMenuItem;
    InjeesporClientes1: TMenuItem;
    Produtos3: TMenuItem;
    FichaTcnica1: TMenuItem;
    PedidosReceber1: TMenuItem;
    N37: TMenuItem;
    Etiquetas1: TMenuItem;
    EtiquetasdeProdutos1: TMenuItem;
    N42: TMenuItem;
    N46: TMenuItem;
    Rtulos1: TMenuItem;
    tmrAviso: TTimer;
    grp1: TGroupBox;
    btn1: TButton;
    lblStatus: TLabel;
    lclTraducao: TcxLocalizer;
    mniErros1: TMenuItem;
    mniSolicitacoesMudanca: TMenuItem;
    grp2: TGroupBox;
    btn2: TButton;
    edtQtdEstoque: TEdit;
    grp3: TGroupBox;
    btn3: TButton;
    lblStatusAjustaEstoque: TLabel;
    mmoHistorico: TMemo;
    grp4: TGroupBox;
    lblAtualizarTodoEstoque: TLabel;
    btnAtualizarTodoEstoque: TButton;
    mmoAtualizarTodoEstoque: TMemo;
    tabProduto: TZQuery;
    btnCalcular: TButton;
    pnlReconectar: TPanel;
    lbl1: TLabel;
    btn4: TButton;
    lbl2: TLabel;
    grp5: TGroupBox;
    lblStatusNFE: TLabel;
    btnAdaptarNFE: TButton;
    mniResumoPedidos: TMenuItem;
    app1: TAppEvents;
    mniSubGrupodeProdutos1: TMenuItem;
    mniColeo1: TMenuItem;
    mniLinhas1: TMenuItem;
    mniGrades1: TMenuItem;
    imgLogo: TImage;
    mniao1: TMenuItem;

    procedure StatusConectado;
    procedure StatusDesconectado;
    procedure StatusReconectando;
    procedure Sair1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ConfiguraodosUsurios1Click(Sender: TObject);
    procedure Cascata1Click(Sender: TObject);
    procedure ConfiguraodosArquivosdeSistema1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Moldes1Click(Sender: TObject);
    procedure Grupo1Click(Sender: TObject);
    procedure Modelo1Click(Sender: TObject);
    procedure Cor1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Contatos1Click(Sender: TObject);
    procedure Empresas1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormasdePagamento1Click(Sender: TObject);
    procedure LocalizaodosTtulos1Click(Sender: TObject);
    procedure ResponsvelTtulos1Click(Sender: TObject);
    procedure iposdeOramento1Click(Sender: TObject);
    procedure iposdeOrdemdeServio1Click(Sender: TObject);
    procedure iposdeNotaFiscal1Click(Sender: TObject);
    procedure iposdeIndicesFinanceiros1Click(Sender: TObject);
    procedure iposdeTabelasdePreo1Click(Sender: TObject);
    procedure CFOP1Click(Sender: TObject);
    procedure RegimeTributrio1Click(Sender: TObject);
    procedure StatusdoPedido1Click(Sender: TObject);
    procedure GruposdeClientes1Click(Sender: TObject);
    procedure iposdeClientes1Click(Sender: TObject);
    procedure StatusdeClientes1Click(Sender: TObject);
    procedure Unidades1Click(Sender: TObject);
    procedure CentrodeCusto1Click(Sender: TObject);
    procedure Setor1Click(Sender: TObject);
    procedure SetordeTrabalho1Click(Sender: TObject);
    procedure FecharTodasasJanelas1Click(Sender: TObject);
    procedure Funcionrios1Click(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);
    procedure Ativos1Click(Sender: TObject);
    procedure ransportadoras1Click(Sender: TObject);
    procedure Aproveitamento1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ManutenodePreos1Click(Sender: TObject);
    procedure EnviodeEmailsLote1Click(Sender: TObject);
    procedure EnviodeEmailsIndividual1Click(Sender: TObject);
    procedure OramentosEnviadosporEmail1Click(Sender: TObject);
    procedure Oramentos1Click(Sender: TObject);
    procedure PedidosdeVenda1Click(Sender: TObject);
    procedure FaturamentoClientes1Click(Sender: TObject);
    procedure FaturamentoFornecedores1Click(Sender: TObject);
    procedure ProdutosRequisiodeEntrada1Click(Sender: TObject);
    procedure ProdutosRequisiodeSada1Click(Sender: TObject);
    procedure abelaCorreio1Click(Sender: TObject);
    procedure RequisiodeCompras1Click(Sender: TObject);
    procedure ConsultaRequisiodeCompras1Click(Sender: TObject);
    procedure OramentosdeCompras1Click(Sender: TObject);
    procedure ConsultaOramentodeCompras1Click(Sender: TObject);
    procedure PedidosdeCompra1Click(Sender: TObject);
    procedure OrdemdeProduoEntrada1Click(Sender: TObject);
    // procedure ConfigurarBotesCadastro1Click(Sender: TObject);
    procedure ConfiguraodoPerfildeUsurios1Click(Sender: TObject);
    procedure FecharTodas1Click(Sender: TObject);
    procedure Cidades1Click(Sender: TObject);
    procedure Pases1Click(Sender: TObject);
    procedure Endereos1Click(Sender: TObject);
    procedure Departamentos1Click(Sender: TObject);
    procedure Cargos1Click(Sender: TObject);
    procedure GraudeParentesco1Click(Sender: TObject);
    procedure SobreoSistema1Click(Sender: TObject);
    procedure ConfiguraoRegional1Click(Sender: TObject);
    procedure UsuriosLogados2Click(Sender: TObject);
    procedure AcertodoEstoque1Click(Sender: TObject);
    procedure ReposiodeEstoque1Click(Sender: TObject);
    procedure RelaodeEstoque1Click(Sender: TObject);
    procedure tulosEmitidos1Click(Sender: TObject);
    procedure Bancos1Click(Sender: TObject);
    procedure GerarPendentes1Click(Sender: TObject);
    procedure tulosaReceber1Click(Sender: TObject);
    procedure iposdeLiquidao1Click(Sender: TObject);
    procedure RelaodeCentrodeCusto1Click(Sender: TObject);
    procedure RelaodeCFOP1Click(Sender: TObject);
    procedure RelaodeClientes1Click(Sender: TObject);
    procedure RelaodeContatos1Click(Sender: TObject);
    procedure RelaodeSetores1Click(Sender: TObject);
    procedure RelaodeClientesporSetores1Click(Sender: TObject);
    procedure RelaodeFormasdePagto1Click(Sender: TObject);
    procedure RelaodeProdutos1Click(Sender: TObject);
    procedure FaturamentoPerodo1Click(Sender: TObject);
    procedure EmissodeOramentos1Click(Sender: TObject);
    procedure RelatriodeTabelasdePreo1Click(Sender: TObject);
    procedure Consulta1Click(Sender: TObject);
    procedure Consulta2Click(Sender: TObject);
    procedure tulosRecebidos1Click(Sender: TObject);
    procedure tulosemAberto1Click(Sender: TObject);
    procedure tulosRecebidos2Click(Sender: TObject);
    procedure MatriaPrimaCapitalInvestido1Click(Sender: TObject);
    procedure InventriodeProdutos1Click(Sender: TObject);
    procedure VendasRecebidas1Click(Sender: TObject);
    procedure tulosaPagar1Click(Sender: TObject);
    procedure tulosPagos1Click(Sender: TObject);
    procedure Consulta3Click(Sender: TObject);
    procedure Consulta4Click(Sender: TObject);
    procedure ExportaoNotaFiscalPaulista1Click(Sender: TObject);
    procedure ExportaoNotaFiscalEletrnica1Click(Sender: TObject);
    procedure EnviodoEmailNFe1Click(Sender: TObject);
    procedure tulosEmitidos2Click(Sender: TObject);
    procedure tulosemAberto2Click(Sender: TObject);
    procedure tulosPagos2Click(Sender: TObject);
    procedure PedidosOscilaes1Click(Sender: TObject);
    procedure AppEventsShortCut(var Msg: TWMKey;
      var Handled: Boolean);
    procedure Rastrear1Click(Sender: TObject);
    procedure PedidosPendentes1Click(Sender: TObject);
    procedure ProdutosPendentes1Click(Sender: TObject);
    procedure PedidosRealizados1Click(Sender: TObject);
    procedure OrdensdeProduo1Click(Sender: TObject);
    procedure EstadoCivil1Click(Sender: TObject);
    procedure ProdutosPendentes2Click(Sender: TObject);
    procedure iposdeAusncias1Click(Sender: TObject);
    procedure IndicesFinanceiros1Click(Sender: TObject);
    procedure opProdutosVendidos1Click(Sender: TObject);
    procedure LogdeUsurios1Click(Sender: TObject);
    procedure GerarParticipaoVendedores1Click(Sender: TObject);
    procedure HorariosdeTrabalho1Click(Sender: TObject);
    procedure PaineldeProduo1Click(Sender: TObject);
    procedure VendasporEstado1Click(Sender: TObject);
    procedure ContasBancrias1Click(Sender: TObject);
    procedure iposdeAdvertncias1Click(Sender: TObject);
    procedure RetornoBancodoBrasil1Click(Sender: TObject);
    procedure RemessaBancodoBrasil1Click(Sender: TObject);
    procedure IndicesCotaes1Click(Sender: TObject);
    procedure EmissodoBoletoBancrio1Click(Sender: TObject);
    procedure LeituraDigital1Click(Sender: TObject);
    procedure CordosProdutos1Click(Sender: TObject);
    procedure Faturamento2Click(Sender: TObject);
    procedure FaturamentoAnual1Click(Sender: TObject);
    procedure InjeesaoDia1Click(Sender: TObject);
    procedure InjeesporClientes1Click(Sender: TObject);
    procedure FichaTcnica1Click(Sender: TObject);
    procedure PedidosReceber1Click(Sender: TObject);
    procedure EtiquetasdeProdutos1Click(Sender: TObject);
    procedure Rtulos1Click(Sender: TObject);
    procedure imgLogoFundoClick(Sender: TObject);
    procedure tmrAvisoTimer(Sender: TObject);
    procedure stbMenuPanels5DblClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btnAtualizarTodoEstoqueClick(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
    procedure mniSolicitacoesMudancaClick(Sender: TObject);
    procedure aptErrosException(Sender: TObject; E: Exception);
    procedure btn4Click(Sender: TObject);
    procedure btnAdaptarNFEClick(Sender: TObject);
    procedure mniResumoPedidosClick(Sender: TObject);
    procedure AppEventsHint(Sender: TObject);
    procedure mniGrades1Click(Sender: TObject);
    procedure mniLinhas1Click(Sender: TObject);
    procedure mniColeo1Click(Sender: TObject);
    procedure mniSubGrupodeProdutos1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure mniao1Click(Sender: TObject);
  private
    function TestarConexao: Boolean;
    procedure Conectar;
    procedure CarregarLogoFundo;
    procedure FecharForms;
    function GetVersaoArq: string;
    procedure DisplayHint(Sender: TObject);
    function ExisteArray(Elemento: Real; Matriz: array of Real): Boolean;
  public
    pubHostConfig: THostConfig;
    pubTransImg: TGraphic;
    pubUsuario: string;
    pubLicense: string;
    pubPerfil: real;
    pubTituloTela: string;
    pubTipoTela: string[2];
    pubTrans1, pubTrans2: string;
    pubTrans3, pubTrans4: string;
    pubTrans5, pubTrans6: string;
    pubVersao, pubDataBuild: string;
    pubTituloPagar: TTituloPagar;
    pubVetorAlertas: array of Real;
    procedure CorEnter(Sender: TWinControl);
    procedure CorExit(Sender: TWinControl);
    procedure MudaCorFoco(Sender: TObject);
    procedure AtualizaEstoque(pCodigoProduto: string);
    procedure AtualizarFichaTecnica(pCodigoProduto: string);
    function CalculaEstoque(pCodigoProduto: string): real;
    function CalculaInterno(pCodigoProduto: string): real;
    function CalculaEmpenho(pCodigoProduto: string): real;
    function GetLastCust(pCodigoProduto: string): real;
    function GetLastDesc(pCodigoProduto: string): string;
    function pubNomeComputador: string;
  end;

var
  fmMenu: TfmMenu;
  vgLastCtrl: TWinControl;
  vCorOriginal: TColor;
  gb_Comprar : Boolean;

implementation

uses uUsuarios, uConfiguracaoBancoDados, uConstantes, uLogin, uProdutos,
  uMoldes, uGenericos, uClientes, uContatos, uEmpresas, uFuncoes,
  uFuncionarios, uUnidades, uFormasPagto, uTiposTabelasPrecos, uCfop,
  uCentroCusto, uFornecedores, uAtivos, uTransportadoras, uRegioes,
  uSetorTrabalho, uAproveitamento, uPrecos, uEnvioEmailLote,
  uEnvioEmailIndividual, uOrcamentosEnviadosEmail, uOrcamentosVendas,
  uPedidosVenda, uFaturamento, uRequisicaoProdutos, uTabelaCorreio,
  uRequisicaoCompras, uConsultaRequisicaoCompras, uOrcamentoCompras,
  uConsultaOrcamentosCompras, uPedidosCompra, uOrdemProducaoEntrada,
  {uConfigBotoesCadastro,}uChecaConexaoRede, uSolicitacaoMudanca,
  uCidades, uPaises, uEnderecos, uCargos, uConfiguracaoSistema, uAuditoria,
  uUsuariosLogados, uAcertoEstoque, rReposicaoEstoque, rEmissaoEstoque,
  uBancos, uGerarPendentesTitulos, uTitulosReceber, rEmissaoCentroCusto,
  rEmissaoCFOP, rEmissaoClientes, rEmissaoContatos, rEmissaoSetores,
  rEmissaoSetorClientes, rEmissaoFormasPagto, rEmissaoProdutos,
  rEmissaoFaturamento, rEmissaoOrcamentos, rEmissaoTabelaPrecos,
  rReceberEmitidos, uLocalizarTitulosReceber, rReceberAberto,
  rReceberRecebidos, rMateriaPrima, rInventarioProdutos, rPedidosRecebidos,
  uTitulosPagar, uLocalizarTitulosPagar, uNotaFiscalPaulista,
  uNotaFiscalEletronica, uNFeEnvioEmail, rPagarEmitidos, rPagarAberto,
  rPagarPagos, uLocalizarClientesContatos, uRastrearEstoque,
  rPedidosPendentes, rPedidosProdutos, rPedidosRealizados,
  rOrdensProducaoPendentes, uLocalizarTitulosRecebidos,
  uLocalizarTitulosPagos, uPerfilUsuarios, {uSobre,} uAlteracoesCodigos,
  rPedidosOscilacoes, rProdutosRealizados, uIndicesFinanceiros,
  rTopProdutosVendidos, uLogUsuarios, uHorariosTrabalho,
  uGerarParticipacaoVendedores, uPainelProducao, gVendasPorEstado,
  uContasBancarias, uRetornoBancoBrasil, uRemessaBancoBrasil,
  {uWebServices,}uIndicesCotacoes, uEmissaoBoletoBancario, uLeituraDigital,
  uCores, gVendasAnualVendedores, gVendasAnual, uCadastroEnderecos,
  gInjecoesDia, gInjecoesClientes, uDanfe, rFichaTecnica,
  rPedidosReceber, rEtiquetasProdutos, rRotuloLote, uHelpKeys, uAlerta,
  uMensagens, uFinalizarPedido, uFinaPediRelaAdmn, rResumoPedido,
  uConectando, uDebugador, uGrades, uLinhas, uSubGrupo, uComprar,
  uLoteProducao;

{$R *.dfm}

procedure TfmMenu.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TfmMenu.FormShow(Sender: TObject);
var
  vArquivo: TStringList;
begin
  try

    inherited;

    Self.Caption := corp_signature_menuprincipal + ' - ' + Self.Caption + ' - ' + corp_suporte;

    pubHostConfig := LoadConfigHost(GetPathProfileUser);

    if Trim(pubHostConfig.Host) = '' then
    begin
      if FileExists(ExtractFilePath(Application.ExeName) + sis_nome_abrv + '.ini') then
      begin
        vArquivo := TStringList.Create;
        try
          vArquivo.LoadFromFile(ExtractFilePath(Application.ExeName) + sis_nome_abrv + '.ini');
          pubHostConfig.Host := vArquivo.Strings[0];
          if Trim(vArquivo.Strings[1]) <> '' then
          begin
            pubHostConfig.Port := StrToInt(vArquivo.Strings[1]);
          end;
          pubHostConfig.User := vArquivo.Strings[2];
          pubHostConfig.Password := vArquivo.Strings[3];
        finally
          vArquivo.Free;
        end;
      end;

    end;

    if TestarConexao <> True then
    begin
      if not Assigned(fmConfiguracaoBancoDados) then
      begin
        Application.CreateForm(TfmConfiguracaoBancoDados, fmConfiguracaoBancoDados);
        fmConfiguracaoBancoDados.ShowModal;
      end;
      if TestarConexao <> True then
      begin
        ShowMessage('Erro ao Conectar no Banco de Dados MySql');
        Application.Terminate;
      end
      else
      begin
        Conectar;
      end;
    end
    else
    begin
      Conectar;

      Application.ProcessMessages;

      {
      Application.CreateForm(TfmConectando, fmConectando);
      fmConectando.Show;
      fmConectando.Update;
      Application.ProcessMessages;
      Application.ProcessMessages;
      fmConectando.Hide;
      fmConectando.Free;
      }
      
      StatusConectado;
      //  end;

      if not Assigned(fmLogin) then
      begin
        Application.CreateForm(TfmLogin, fmLogin);
        fmLogin.ShowModal;
      end;

      // ** Se alguma rotina importante for colocada aqui, verificar o término da
      // da tela do Login e acabar o procedimento do Menu Principal ** (RS)


      try
        tabConfigPropri.Close;
        tabConfigPropri.SQL.Clear;
        tabConfigPropri.SQL.Add('SELECT RazaoSocial FROM configuracoes_proprietario');
        tabConfigPropri.Open;
        pubLicense := tabConfigPropri.FieldByName('RazaoSocial').AsString;
      finally
        tabConfigPropri.Close;
      end;

      // Arquivo de tradução dos componentes da DevExpress
      try
        lclTraducao.FileName := ExtractFilePath(Application.ExeName) + 'dev-ptbr.ini';

        lclTraducao.Active := True;

        lclTraducao.Locale := 1046;
      except

      end;

      //  ** Criar uma thread para essa rotina, esta segurando um pouco na hora de logar ** (RS)
      {try
         vArquivo:=GetCotacoesUpdates;

         for vCnt:=0 to (vArquivo.Count-1) do begin

            Application.ProcessMessages;

            tabBusca.Close;
            tabBusca.SQL.Clear;
            tabBusca.SQL.Add('SELECT Cotacao,Indice ');
            tabBusca.SQL.Add('FROM indices_cotacoes ');
            tabBusca.SQL.Add('WHERE Cotacao = '+QuotedStr(vArquivo.Strings[vCnt]));
            tabBusca.Open;
            if tabBusca.RecordCount = 1 then begin
               vCodigoIndice:=tabBusca.FieldByName('Indice').AsFloat;
               vCotacao:=TGetCotacao.Create(tabBusca.FieldByName('Cotacao').AsString,
               Date-1, vResult);

   //            ShowMessage(vResult^);

               //vTemp:=GetCotacao(tabBusca.FieldByName('Cotacao').AsString, Date-1);
               //vTemp:=StringReplace(vResult^, '.', ',', [rfReplaceAll]);
               vValorCotacao:=StrToFloatDef(vTemp, 0);
               if vValorCotacao > 0 then begin
                  tabBusca.Close;
                  tabBusca.SQL.Clear;
                  tabBusca.SQL.Add('SELECT * ');
                  tabBusca.SQL.Add('FROM indices_financeiros ');
                  tabBusca.SQL.Add('WHERE Codigo = '+FloatToStr(vCodigoIndice)+' ');
                  tabBusca.SQL.Add('AND Data = '+QuotedStr(FormatDateTime(sis_date_format, Date-1)));
                  tabBusca.Open;
                  if tabBusca.RecordCount = 0 then begin
                     tabBusca.Append;
                     tabBusca.FieldByName('Codigo').AsFloat:=vCodigoIndice;
                     tabBusca.FieldByName('Valor').AsFloat:=vValorCotacao;
                     tabBusca.FieldByName('Data').AsDateTime:=Date-1;
                     tabBusca.Post;
                     tabBusca.ApplyUpdates;
                  end;
               end;
            end;
         end;
      finally
         tabBusca.Close;
         vArquivo.Free;
      end;}

    end;

    stbMenu.Panels[0].Text := 'Licença: ' + pubLicense;
    stbMenu.Panels[1].Text := 'Usuário: ' + pubUsuario;
    CarregarLogoFundo;


    fmMenu.pubTituloPagar := nil;
    Application.ProcessMessages;
  except
    ShowMessage('Impossível conectar ao servidor' + #13 + 'Clique em OK para finalizar');
    Application.Terminate;
  end;
end;

procedure TfmMenu.ConfiguraodosUsurios1Click(Sender: TObject);
var
  vFM: TfmUsuarios;
begin
  vFM := TfmUsuarios.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.Cascata1Click(Sender: TObject);
begin
  Cascade;
end;

procedure TfmMenu.ConfiguraodosArquivosdeSistema1Click(Sender: TObject);
begin
  if not Assigned(fmConfiguracaoBancoDados) then
  begin
    Application.CreateForm(TfmConfiguracaoBancoDados, fmConfiguracaoBancoDados);
    fmConfiguracaoBancoDados.ShowModal;
  end;
end;

function TfmMenu.TestarConexao: Boolean;
begin
  Result := True;

  StatusReconectando;

  zcnTeste.Disconnect;
  zcnTeste.LoginPrompt := False;
  zcnTeste.Protocol := db_protocolo;
  zcnTeste.Database := db_nome;
//  zcnTeste.HostName := GetIPFromHost(pubHostConfig.Host);
  zcnTeste.HostName := pubHostConfig.Host;
  zcnTeste.User := pubHostConfig.User;
  zcnTeste.Password := pubHostConfig.Password;
  zcnTeste.Port := pubHostConfig.Port;
  
  try
    zcnTeste.Connect;
  except
    Result := False;
    StatusDesconectado;
  end;

  StatusConectado;
end;

procedure TfmMenu.Conectar;
begin
  Application.ProcessMessages;
  zcnConexao.Disconnect;
  zcnConexao.LoginPrompt := False;
  zcnConexao.Protocol := db_protocolo;
  zcnConexao.Database := db_nome;
  zcnConexao.HostName := GetIPFromHost(pubHostConfig.Host);
  // zcnConexao.HostName := pubHostConfig.Host;
  zcnConexao.User := pubHostConfig.User;
  zcnConexao.Password := pubHostConfig.Password;
  zcnConexao.Port := pubHostConfig.Port;

  try
    zcnConexao.Connect;
    Application.ProcessMessages;
  except
    on E: Exception do
    begin
      Exception.Create('Erro: ' + E.Message);
    end;
  end;
end;

procedure TfmMenu.Produtos1Click(Sender: TObject);
var
  vFM: TfmProdutos;
begin
  vFM := TfmProdutos.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.Moldes1Click(Sender: TObject);
var
  vFM: TfmMoldes;
begin
  vFM := TfmMoldes.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.Grupo1Click(Sender: TObject);
var
  vFM: TfmGenericos;
begin
  pubTituloTela := 'Grupos';
  pubTipoTela := '1';
  vFM := TfmGenericos.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.Modelo1Click(Sender: TObject);
var
  vFM: TfmGenericos;
begin
  pubTituloTela := 'Modelos';
  pubTipoTela := '9';
  vFM := TfmGenericos.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.Cor1Click(Sender: TObject);
var
  vFM: TfmCores;
begin
  vFM := TfmCores.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.CarregarLogoFundo;
begin
  if FileExists(ExtractFilePath(Application.ExeName) + 'recursos\LogoFundo.jpg') then
  begin
    imgLogoFundo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'recursos\LogoFundo.jpg');
  end;
end;

procedure TfmMenu.Clientes1Click(Sender: TObject);
var
  vFM: TfmClientes;
begin
  fmMenu.pubTrans1 := '';
  vFM := TfmClientes.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.Contatos1Click(Sender: TObject);
var
  vFM: TfmContatos;
begin
  fmMenu.pubTrans1 := '';
  vFM := TfmContatos.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.Empresas1Click(Sender: TObject);
var
  vFM: TfmEmpresas;
begin
  vFM := TfmEmpresas.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Deseja Realmente Fechar o Sistema?', PChar(Application.Title), 36) = 7 then
  begin
    Action := caNone;
  end
  else
  begin
    FecharForms;
    if zcnConexao.Ping then
    begin
      UserLog(fmMenu.pubUsuario, GetPCName, 'off');
    end;
    inherited;
  end;
end;

procedure TfmMenu.FormasdePagamento1Click(Sender: TObject);
var
  vFM: TfmFormasPagto;
begin
  vFM := TfmFormasPagto.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.LocalizaodosTtulos1Click(Sender: TObject);
var
  vFM: TfmGenericos;
begin
  pubTituloTela := 'Localização dos Títulos';
  pubTipoTela := '7';
  vFM := TfmGenericos.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.ResponsvelTtulos1Click(Sender: TObject);
var
  vFM: TfmGenericos;
begin
  pubTituloTela := 'Responsável Títulos';
  pubTipoTela := '21';
  vFM := TfmGenericos.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.iposdeOramento1Click(Sender: TObject);
var
  vFM: TfmGenericos;
begin
  pubTituloTela := 'Tipos de Orçamento';
  pubTipoTela := '6';
  vFM := TfmGenericos.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.iposdeOrdemdeServio1Click(Sender: TObject);
var
  vFM: TfmGenericos;
begin
  pubTituloTela := 'Tipos de Vendas';
  pubTipoTela := '4';
  vFM := TfmGenericos.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.iposdeNotaFiscal1Click(Sender: TObject);
var
  vFM: TfmGenericos;
begin
  pubTituloTela := 'Tipos de Notas Fiscais';
  pubTipoTela := '17';
  vFM := TfmGenericos.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.iposdeIndicesFinanceiros1Click(Sender: TObject);
var
  vFM: TfmGenericos;
begin
  pubTituloTela := 'Tipos de Indices Financeiros';
  pubTipoTela := '20';
  vFM := TfmGenericos.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.iposdeTabelasdePreo1Click(Sender: TObject);
var
  vFM: TfmTiposTabelasPrecos;
begin
  vFM := TfmTiposTabelasPrecos.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.CFOP1Click(Sender: TObject);
var
  vFM: TfmCfop;
begin
  vFM := TfmCfop.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.RegimeTributrio1Click(Sender: TObject);
var
  vFM: TfmGenericos;
begin
  pubTituloTela := 'Regime Tributário';
  pubTipoTela := '24';
  vFM := TfmGenericos.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.StatusdoPedido1Click(Sender: TObject);
var
  vFM: TfmGenericos;
begin
  pubTituloTela := 'Status de Pedido';
  pubTipoTela := '18';
  vFM := TfmGenericos.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.GruposdeClientes1Click(Sender: TObject);
var
  vFM: TfmGenericos;
begin
  pubTituloTela := 'Grupos de Clientes';
  pubTipoTela := '11';
  vFM := TfmGenericos.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.iposdeClientes1Click(Sender: TObject);
var
  vFM: TfmGenericos;
begin
  pubTituloTela := 'Tipos de Clientes';
  pubTipoTela := '12';
  vFM := TfmGenericos.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.StatusdeClientes1Click(Sender: TObject);
var
  vFM: TfmGenericos;
begin
  pubTituloTela := 'Status de Clientes';
  pubTipoTela := '13';
  vFM := TfmGenericos.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.Unidades1Click(Sender: TObject);
var
  vFM: TfmUnidades;
begin
  vFM := TfmUnidades.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.CentrodeCusto1Click(Sender: TObject);
var
  vFM: TfmCentroCusto;
begin
  vFM := TfmCentroCusto.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.Setor1Click(Sender: TObject);
var
  vFM: TfmRegioes;
begin
  vFM := TfmRegioes.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.SetordeTrabalho1Click(Sender: TObject);
var
  vFM: TfmSetorTrabalho;
begin
  vFM := TfmSetorTrabalho.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.FecharForms;
var
  vCnt: Integer;
begin
  for vCnt := 0 to Screen.FormCount - 1 do
  begin
    if Screen.Forms[vCnt].FormStyle <> fsMDIForm then
    begin
      Screen.Forms[vCnt].Close;
    end;
  end;
end;

procedure TfmMenu.FecharTodasasJanelas1Click(Sender: TObject);
begin
  FecharForms;
end;

procedure TfmMenu.Funcionrios1Click(Sender: TObject);
var
  vFM: TfmFuncionarios;
begin
  vFM := TfmFuncionarios.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.Fornecedores1Click(Sender: TObject);
var
  vFM: TfmFornecedores;
begin
  vFM := TfmFornecedores.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.Ativos1Click(Sender: TObject);
var
  vFM: TfmAtivos;
begin
  vFM := TfmAtivos.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.ransportadoras1Click(Sender: TObject);
var
  vFM: TfmTransportadoras;
begin
  vFM := TfmTransportadoras.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.Aproveitamento1Click(Sender: TObject);
var
  vFM: TfmAproveitamento;
begin
  vFM := TfmAproveitamento.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.MudaCorFoco(Sender: TObject);
var
  vCorEnter, vCorExit: boolean;
  vControleAnterior: TWinControl;
begin
  if Screen.ActiveControl = nil then
  begin
    vgLastCtrl := nil;
    exit;
  end;

  vCorEnter := True;
  vCorExit := True;

  if Screen.ActiveControl is TButtonControl then
    vCorEnter := False;
  if Screen.ActiveControl is TQuickRep then
    vCorEnter := False;
  if Screen.ActiveControl is TForm then
    vCorEnter := False;
  if Screen.ActiveControl is TDBGrid then
    vCorEnter := False;
  if Screen.ActiveControl is TGroupBox then
    vCorEnter := False;
  if Screen.ActiveControl is TDBRadioGroup then
    vCorEnter := False;

  vControleAnterior := vgLastCtrl;

  if vControleAnterior <> nil then
  begin
    if vControleAnterior is TButtonControl then
      vCorExit := False;
    if vControleAnterior is TQuickRep then
      vCorExit := False;
    if vControleAnterior is TForm then
      vCorExit := False;
    if vControleAnterior is TDBGrid then
      vCorExit := False;
    if vControleAnterior is TGroupBox then
      vCorExit := False;
    if vControleAnterior is TDBRadioGroup then
      vCorExit := False;
  end;

  vgLastCtrl := Screen.ActiveControl;

  if vCorExit = True then
    CorExit(vControleAnterior);
  if vCorEnter = True then
    CorEnter(vgLastCtrl);
end;

procedure TfmMenu.FormCreate(Sender: TObject);
begin
  // pubVersao:='2.0.0.139';
  Application.HelpFile := ExtractFilePath(Application.ExeName) + 'recursos\industria.chm';

  pubVersao := GetVersaoArq;
  pubDataBuild := '06/02/2012';
  SetFontStyle();
  Screen.OnActiveControlChange := MudaCorFoco;
  if not DirectoryExists(PChar(GetPathProfileUser)) then
  begin
    ForceDirectories(GetPathProfileUser);
  end;
  Caption := Caption + ' - Versão ' + pubVersao;
  fmMenu.pubUsuario := '';

end;

procedure TfmMenu.FormDestroy(Sender: TObject);
begin
  Screen.OnActiveControlChange := nil;
end;

procedure TfmMenu.CorEnter(Sender: TWinControl);
var
  cCorEnter: TColor;
begin
  cCorEnter := sis_cor_foco_controle;
  if Sender <> nil then
  begin
    if IsPublishedProp(Sender, 'Color') then
    begin
      vCorOriginal := GetOrdProp(Sender, 'Color');
      SetOrdProp(Sender, 'Color', cCorEnter);
    end;
  end;
end;

procedure TfmMenu.CorExit(Sender: TWinControl);
begin
  if Sender <> nil then
  begin
    if IsPublishedProp(Sender, 'Color') then
    begin
      SetOrdProp(Sender, 'Color', vCorOriginal);
    end;
  end;
end;

procedure TfmMenu.ManutenodePreos1Click(Sender: TObject);
var
  vFM: TfmPrecos;
begin
  vFM := TfmPrecos.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.EnviodeEmailsLote1Click(Sender: TObject);
var
  vFM: TfmEnvioEmailLote;
begin
  vFM := TfmEnvioEmailLote.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.EnviodeEmailsIndividual1Click(Sender: TObject);
var
  vFM: TfmEnvioEmailIndividual;
begin
  vFM := TfmEnvioEmailIndividual.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.OramentosEnviadosporEmail1Click(Sender: TObject);
var
  vFM: TfmOrcamentosEnviadosEmail;
begin
  vFM := TfmOrcamentosEnviadosEmail.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.Oramentos1Click(Sender: TObject);
var
  vFM: TfmOrcamentosVendas;
begin
  vFM := TfmOrcamentosVendas.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.PedidosdeVenda1Click(Sender: TObject);
var
  vFM: TfmPedidosVenda;
begin
  vFM := TfmPedidosVenda.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.FaturamentoClientes1Click(Sender: TObject);
var
  vFM: TfmFaturamento;
begin
  fmMenu.pubTrans1 := '1';
  vFM := TfmFaturamento.Create(Self);

  // Para a nota fiscal eletronica
  vFM.Tag := 1;

  vFM.Show;
end;

procedure TfmMenu.FaturamentoFornecedores1Click(Sender: TObject);
var
  vFM: TfmFaturamento;
begin
  fmMenu.pubTrans1 := '2';
  vFM := TfmFaturamento.Create(Self);

  // Para a nota fiscal eletronica
  vFM.Tag := 2;

  vFM.Show;
end;

procedure TfmMenu.ProdutosRequisiodeEntrada1Click(Sender: TObject);
var
  vFM: TfmRequisicaoProdutos;
begin
  fmMenu.pubTrans1 := '1';
  vFM := TfmRequisicaoProdutos.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.ProdutosRequisiodeSada1Click(Sender: TObject);
var
  vFM: TfmRequisicaoProdutos;
begin
  fmMenu.pubTrans1 := '2';
  vFM := TfmRequisicaoProdutos.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.abelaCorreio1Click(Sender: TObject);
var
  vFM: TfmTabelaCorreio;
begin
  vFM := TfmTabelaCorreio.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.RequisiodeCompras1Click(Sender: TObject);
var
  vFM: TfmRequisicaoCompras;
begin
  fmMenu.pubTrans1 := '';
  vFM := TfmRequisicaoCompras.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.ConsultaRequisiodeCompras1Click(Sender: TObject);
var
  vFM: TfmConsultaRequisicaoCompras;
begin
  vFM := TfmConsultaRequisicaoCompras.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.OramentosdeCompras1Click(Sender: TObject);
var
  vFM: TfmOrcamentoCompras;
begin
  vFM := TfmOrcamentoCompras.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.ConsultaOramentodeCompras1Click(Sender: TObject);
var
  vFM: TfmConsultaOrcamentosCompras;
begin
  vFM := TfmConsultaOrcamentosCompras.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.PedidosdeCompra1Click(Sender: TObject);
var
  vFM: TfmPedidosCompra;
begin
  vFM := TfmPedidosCompra.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.OrdemdeProduoEntrada1Click(Sender: TObject);
var
  vFM: TfmOrdemProducaoEntrada;
begin
  vFM := TfmOrdemProducaoEntrada.Create(Self);
  vFM.Show;
end;

{procedure TfmMenu.ConfigurarBotesCadastro1Click(Sender: TObject);
var vFM : TfmConfigBotoesCadastro;
begin
  vFM:=TfmConfigBotoesCadastro.Create(Self);
  vFM.Show;
end;}

procedure TfmMenu.ConfiguraodoPerfildeUsurios1Click(Sender: TObject);
var
  vFM: TfmPerfilUsuarios;
begin
  vFM := TfmPerfilUsuarios.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.FecharTodas1Click(Sender: TObject);
begin
  FecharForms;
end;

procedure TfmMenu.Cidades1Click(Sender: TObject);
var
  vFM: TfmCidades;
begin
  vFM := TfmCidades.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.Pases1Click(Sender: TObject);
var
  vFM: TfmPaises;
begin
  vFM := TfmPaises.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.Endereos1Click(Sender: TObject);
var
  vFM: TfmCadastroEnderecos;
begin
  vFM := TfmCadastroEnderecos.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.Departamentos1Click(Sender: TObject);
var
  vFM: TfmGenericos;
begin
  pubTituloTela := 'Departamentos';
  pubTipoTela := '3';
  vFM := TfmGenericos.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.Cargos1Click(Sender: TObject);
var
  vFM: TfmCargos;
begin
  vFM := TfmCargos.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.GraudeParentesco1Click(Sender: TObject);
var
  vFM: TfmGenericos;
begin
  pubTituloTela := 'Grau de Parentesco';
  pubTipoTela := '25';
  vFM := TfmGenericos.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.SobreoSistema1Click(Sender: TObject);
// var vFM : TfmSobre;
//   vFM2 : TfmAlteracoesCodigos;
begin
  //  vFM:=TfmSobre.Create(Self);
  //   vFM.Show;
  //   ShowMessage(GetNomeSobreNome('João da Silva'));
  //   if pubUsuario = corp_adm_user then begin
  //      vFM2:=TfmAlteracoesCodigos.Create(Self);
  //      vFM2.Show;
  //   end;
  //   ShowMessage('Minha Pasta: '+GetPathProfileUser);
  //  inherited;
end;

procedure TfmMenu.ConfiguraoRegional1Click(Sender: TObject);
var
  vFM: TfmConfiguracaoSistema;
begin
  inherited;
  vFM := TfmConfiguracaoSistema.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.UsuriosLogados2Click(Sender: TObject);
var
  vFM: TfmUsuariosLogados;
begin
  vFM := TfmUsuariosLogados.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.AcertodoEstoque1Click(Sender: TObject);
var
  vFM: TfmAcertoEstoque;
begin
  vFM := TfmAcertoEstoque.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.ReposiodeEstoque1Click(Sender: TObject);
var
  vRT: TrtReposicaoEstoque;
begin
  inherited;
  vRT := TrtReposicaoEstoque.Create(Self);
  vRT.Show;
end;

procedure TfmMenu.RelaodeEstoque1Click(Sender: TObject);
var
  vRT: TrtEmissaoEstoque;
begin
  inherited;
  vRT := TrtEmissaoEstoque.Create(Self);
  vRT.Show;
end;

procedure TfmMenu.tulosEmitidos1Click(Sender: TObject);
var
  vRT: TrtReceberEmitidos;
begin
  inherited;
  vRT := TrtReceberEmitidos.Create(Self);
  vRT.Show;
end;

procedure TfmMenu.Bancos1Click(Sender: TObject);
var
  vFM: TfmBancos;
begin
  vFM := TfmBancos.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.GerarPendentes1Click(Sender: TObject);
var
  vFM: TfmGerarPendentesTitulos;
begin
  inherited;
  vFM := TfmGerarPendentesTitulos.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.tulosaReceber1Click(Sender: TObject);
var
  vFM: TfmTitulosReceber;
begin
  inherited;
  fmMenu.pubTrans1 := '';
  fmMenu.pubTrans2 := '1';
  vFM := TfmTitulosReceber.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.iposdeLiquidao1Click(Sender: TObject);
var
  vFM: TfmGenericos;
begin
  pubTituloTela := 'Tipos de Liquidação';
  pubTipoTela := '5';
  vFM := TfmGenericos.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.RelaodeCentrodeCusto1Click(Sender: TObject);
var
  vFM: TrtEmissaoCentroCusto;
begin
  inherited;
  vFM := TrtEmissaoCentroCusto.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.RelaodeCFOP1Click(Sender: TObject);
var
  vFM: TrtEmissaoCFOP;
begin
  inherited;
  vFM := TrtEmissaoCFOP.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.RelaodeClientes1Click(Sender: TObject);
var
  vRT: TrtEmissaoClientes;
begin
  inherited;
  vRT := TrtEmissaoClientes.Create(Self);
  vRT.Show;
end;

procedure TfmMenu.RelaodeContatos1Click(Sender: TObject);
var
  vRT: TrtEmissaoContatos;
begin
  inherited;
  vRT := TrtEmissaoContatos.Create(Self);
  vRT.Show;
end;

procedure TfmMenu.RelaodeSetores1Click(Sender: TObject);
var
  vRT: TrtEmissaoSetores;
begin
  inherited;
  vRT := TrtEmissaoSetores.Create(Self);
  vRT.Show;
end;

procedure TfmMenu.RelaodeClientesporSetores1Click(Sender: TObject);
var
  vRT: TrtEmissaoSetorClientes;
begin
  inherited;
  vRT := TrtEmissaoSetorClientes.Create(Self);
  vRT.Show;
end;

procedure TfmMenu.RelaodeFormasdePagto1Click(Sender: TObject);
var
  vRT: TrtEmissaoFormasPagto;
begin
  inherited;
  vRT := TrtEmissaoFormasPagto.Create(Self);
  vRT.Show;
end;

procedure TfmMenu.RelaodeProdutos1Click(Sender: TObject);
var
  vRT: TrtEmissaoProdutos;
begin
  inherited;
  vRT := TrtEmissaoProdutos.Create(Self);
  vRT.Show;
end;

procedure TfmMenu.FaturamentoPerodo1Click(Sender: TObject);
var
  vRT: TrtEmissaoFaturamento;
begin
  inherited;
  vRT := TrtEmissaoFaturamento.Create(Self);
  vRT.Show;
end;

procedure TfmMenu.EmissodeOramentos1Click(Sender: TObject);
var
  vRT: TrtEmissaoOrcamentos;
begin
  inherited;
  fmMenu.pubTrans1 := '';
  vRT := TrtEmissaoOrcamentos.Create(Self);
  vRT.Show;
end;

procedure TfmMenu.RelatriodeTabelasdePreo1Click(Sender: TObject);
var
  vRT: TrtEmissaoTabelaPrecos;
begin
  inherited;
  vRT := TrtEmissaoTabelaPrecos.Create(Self);
  vRT.Show;
end;

procedure TfmMenu.Consulta1Click(Sender: TObject);
var
  vFM: TfmLocalizarTitulosReceber;
begin
  inherited;
  vFM := TfmLocalizarTitulosReceber.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.Consulta2Click(Sender: TObject);
var
  vFM: TfmLocalizarTitulosRecebidos;
begin
  inherited;
  vFM := TfmLocalizarTitulosRecebidos.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.tulosRecebidos1Click(Sender: TObject);
var
  vFM: TfmTitulosReceber;
begin
  inherited;
  fmMenu.pubTrans1 := '';
  fmMenu.pubTrans2 := '2';
  vFM := TfmTitulosReceber.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.tulosemAberto1Click(Sender: TObject);
var
  vRT: TrtReceberAberto;
begin
  inherited;
  vRT := TrtReceberAberto.Create(Self);
  vRT.Show;
end;

procedure TfmMenu.tulosRecebidos2Click(Sender: TObject);
var
  vRT: TrtReceberRecebidos;
begin
  inherited;
  vRT := TrtReceberRecebidos.Create(Self);
  vRT.Show;
end;

procedure TfmMenu.MatriaPrimaCapitalInvestido1Click(Sender: TObject);
var
  vRT: TrtMateriaPrima;
begin
  inherited;
  vRT := TrtMateriaPrima.Create(Self);
  vRT.Show;
end;

procedure TfmMenu.InventriodeProdutos1Click(Sender: TObject);
var
  vRT: TrtInventarioProdutos;
begin
  inherited;
  vRT := TrtInventarioProdutos.Create(Self);
  vRT.Show;
end;

procedure TfmMenu.VendasRecebidas1Click(Sender: TObject);
var
  vRT: TrtPedidosRecebidos;
begin
  inherited;
  vRT := TrtPedidosRecebidos.Create(Self);
  vRT.Show;
end;

procedure TfmMenu.tulosaPagar1Click(Sender: TObject);
var
  vFM: TfmTitulosPagar;
begin
  inherited;
  fmMenu.pubTrans1 := '';
  fmMenu.pubTrans2 := '1';
  fmMenu.pubTituloPagar := nil;
  vFM := TfmTitulosPagar.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.tulosPagos1Click(Sender: TObject);
var
  vFM: TfmTitulosPagar;
begin
  inherited;
  fmMenu.pubTrans1 := '';
  fmMenu.pubTrans2 := '2';
  fmMenu.pubTituloPagar := nil;
  vFM := TfmTitulosPagar.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.Consulta3Click(Sender: TObject);
var
  vFM: TfmLocalizarTitulosPagar;
begin
  inherited;
  vFM := TfmLocalizarTitulosPagar.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.Consulta4Click(Sender: TObject);
var
  vFM: TfmLocalizarTitulosPagos;
begin
  inherited;
  vFM := TfmLocalizarTitulosPagos.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.ExportaoNotaFiscalPaulista1Click(Sender: TObject);
var
  vFM: TfmNotaFiscalPaulista;
begin
  inherited;
  vFM := TfmNotaFiscalPaulista.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.ExportaoNotaFiscalEletrnica1Click(Sender: TObject);
var
  vFM: TfmNotaFiscalEletronica;
begin
  inherited;
  vFM := TfmNotaFiscalEletronica.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.EnviodoEmailNFe1Click(Sender: TObject);
var
  vFM: TfmNFeEnvioEmail;
begin
  inherited;
  vFM := TfmNFeEnvioEmail.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.tulosEmitidos2Click(Sender: TObject);
var
  vRT: TrtPagarEmitidos;
begin
  inherited;
  vRT := TrtPagarEmitidos.Create(Self);
  vRT.Show;
end;

procedure TfmMenu.tulosemAberto2Click(Sender: TObject);
var
  vRT: TrtPagarAberto;
begin
  inherited;
  vRT := TrtPagarAberto.Create(Self);
  vRT.Show;
end;

procedure TfmMenu.tulosPagos2Click(Sender: TObject);
var
  vRT: TrtPagarPagos;
begin
  inherited;
  vRT := TrtPagarPagos.Create(Self);
  vRT.Show;
end;

procedure TfmMenu.PedidosOscilaes1Click(Sender: TObject);
var
  vRT: TrtPedidosOscilacoes;
begin
  inherited;
  vRT := TrtPedidosOscilacoes.Create(Self);
  vRT.Show;
end;

procedure TfmMenu.Rastrear1Click(Sender: TObject);
var
  vFM: TfmRastrearEstoque;
begin
  inherited;
  vFM := TfmRastrearEstoque.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.PedidosPendentes1Click(Sender: TObject);
var
  vRT: TrtPedidosPendentes;
begin
  inherited;
  vRT := TrtPedidosPendentes.Create(Self);
  vRT.Show;
end;

procedure TfmMenu.ProdutosPendentes1Click(Sender: TObject);
var
  vRT: TrtPedidosProdutos;
begin
  inherited;
  vRT := TrtPedidosProdutos.Create(Self);
  vRT.Show;
end;

procedure TfmMenu.PedidosRealizados1Click(Sender: TObject);
var
  vRT: TrtPedidosRealizados;
begin
  inherited;
  vRT := TrtPedidosRealizados.Create(Self);
  vRT.Show;
end;

procedure TfmMenu.OrdensdeProduo1Click(Sender: TObject);
var
  vRT: TrtOrdensProducaoPendentes;
begin
  inherited;
  vRT := TrtOrdensProducaoPendentes.Create(Self);
  vRT.Show;
end;

procedure TfmMenu.EstadoCivil1Click(Sender: TObject);
var
  vFM: TfmGenericos;
begin
  pubTituloTela := 'Estado Civil';
  pubTipoTela := '26';
  vFM := TfmGenericos.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.ProdutosPendentes2Click(Sender: TObject);
var
  vRT: TrtProdutosRealizados;
begin
  inherited;
  vRT := TrtProdutosRealizados.Create(Self);
  vRT.Show;
end;

procedure TfmMenu.iposdeAusncias1Click(Sender: TObject);
var
  vFM: TfmGenericos;
begin
  pubTituloTela := 'Tipos de Ausências';
  pubTipoTela := '27';
  vFM := TfmGenericos.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.IndicesFinanceiros1Click(Sender: TObject);
var
  vFM: TfmIndicesFinanceiros;
begin
  inherited;
  vFM := TfmIndicesFinanceiros.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.opProdutosVendidos1Click(Sender: TObject);
var
  vFM: TrtTopProdutosVendidos;
begin
  inherited;
  vFM := TrtTopProdutosVendidos.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.LogdeUsurios1Click(Sender: TObject);
var
  vFM: TfmLogUsuarios;
begin
  inherited;
  vFM := TfmLogUsuarios.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.GerarParticipaoVendedores1Click(Sender: TObject);
var
  vFM: TfmGerarParticipacaoVendedores;
begin
  inherited;
  vFM := TfmGerarParticipacaoVendedores.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.HorariosdeTrabalho1Click(Sender: TObject);
var
  vFM: TfmHorariosTrabalho;
begin
  inherited;
  vFM := TfmHorariosTrabalho.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.PaineldeProduo1Click(Sender: TObject);
var
  vFM: TfmPainelProducao;
begin
  inherited;
  vFM := TfmPainelProducao.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.VendasporEstado1Click(Sender: TObject);
var
  vGF: TgfVendasPorEstado;
begin
  inherited;
  vGF := TgfVendasPorEstado.Create(Self);
  vGF.Show;
end;

procedure TfmMenu.ContasBancrias1Click(Sender: TObject);
var
  vFM: TfmContasBancarias;
begin
  inherited;
  vFM := TfmContasBancarias.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.iposdeAdvertncias1Click(Sender: TObject);
var
  vFM: TfmGenericos;
begin
  pubTituloTela := 'Tipos de Advertências';
  pubTipoTela := '28';
  vFM := TfmGenericos.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.RetornoBancodoBrasil1Click(Sender: TObject);
var
  vFM: TfmRetornoBancoBrasil;
begin
  inherited;
  vFM := TfmRetornoBancoBrasil.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.RemessaBancodoBrasil1Click(Sender: TObject);
var
  vFM: TfmRemessaBancoBrasil;
begin
  inherited;
  vFM := TfmRemessaBancoBrasil.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.IndicesCotaes1Click(Sender: TObject);
var
  vFM: TfmIndicesCotacoes;
begin
  inherited;
  vFM := TfmIndicesCotacoes.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.EmissodoBoletoBancrio1Click(Sender: TObject);
var
  vFM: TfmEmissaoBoletoBancario;
begin
  inherited;
  vFM := TfmEmissaoBoletoBancario.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.LeituraDigital1Click(Sender: TObject);
var
  vFM: TfmLeituraDigital;
begin
  inherited;
  vFM := TfmLeituraDigital.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.CordosProdutos1Click(Sender: TObject);
var
  vFM: TfmCores;
begin
  vFM := TfmCores.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.Faturamento2Click(Sender: TObject);
var
  vGF: TgfVendasAnualVendedores;
begin
  inherited;
  vGF := TgfVendasAnualVendedores.Create(Self);
  vGF.Show;
end;

procedure TfmMenu.FaturamentoAnual1Click(Sender: TObject);
var
  vGF: TgfVendasAnual;
begin
  inherited;
  vGF := TgfVendasAnual.Create(Self);
  vGF.Show;
end;

procedure TfmMenu.InjeesaoDia1Click(Sender: TObject);
var
  vGF: TgfInjecoesDia;
begin
  inherited;
  vGF := TgfInjecoesDia.Create(Self);
  vGF.Show;
end;

procedure TfmMenu.InjeesporClientes1Click(Sender: TObject);
var
  vGF: TgfInjecoesClientes;
begin
  inherited;
  vGF := TgfInjecoesClientes.Create(Self);
  vGF.Show;
end;

procedure TfmMenu.FichaTcnica1Click(Sender: TObject);
var
  vRT: TrtFichaTecnica;
begin
  inherited;
  vRT := TrtFichaTecnica.Create(Self);
  vRT.Show;
end;

procedure TfmMenu.PedidosReceber1Click(Sender: TObject);
var
  vRT: TrtPedidosReceber;
begin
  inherited;
  vRT := TrtPedidosReceber.Create(Self);
  vRT.Show;
end;

procedure TfmMenu.EtiquetasdeProdutos1Click(Sender: TObject);
var
  vRT: TrtEtiquetasProdutos;
begin
  inherited;
  vRT := TrtEtiquetasProdutos.Create(Self);
  vRT.Show;
end;

procedure TfmMenu.Rtulos1Click(Sender: TObject);
var
  vRT: TrtRotuloLote;
begin
  inherited;
  vRT := TrtRotuloLote.Create(Self);
  vRT.Show;
end;

function TfmMenu.GetVersaoArq: string;
var
  VerInfoSize: DWORD;
  VerInfo: Pointer;
  VerValueSize: DWORD;
  VerValue: PVSFixedFileInfo;
  Dummy: DWORD;
begin

  VerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(ParamStr(0)), 0, VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);

  with VerValue^ do
  begin
    Result := IntToStr(dwFileVersionMS shr 16);
    Result := Result + '.' + IntToStr(dwFileVersionMS and $FFFF);
    Result := Result + '.' + IntToStr(dwFileVersionLS shr 16);
    Result := Result + '.' + IntToStr(dwFileVersionLS and $FFFF);
  end;

  FreeMem(VerInfo, VerInfoSize);

end;

procedure TfmMenu.AtualizarFichaTecnica(pCodigoProduto: string);
var
  vTotalCusto: real;
  vTabFT, vTabProd: TZQuery;
  vTemp: string;
begin
  vTabFT := TZQuery.Create(nil);
  vTabProd := TZQuery.Create(nil);
  try
    vTabFT.Connection := zcnConexao;
    vTabProd.Connection := zcnConexao;

    vTabProd.Close;
    vTabProd.SQL.Clear;
    vTabProd.SQL.Add('SELECT * FROM produtos WHERE CodigoProduto = ' + QuotedStr(pCodigoProduto));
    vTabProd.Open;

    vTabFT.Close;
    vTabFT.SQL.Clear;
    vTabFT.SQL.Add('SELECT * FROM produtos_ficha_tecnica WHERE CodigoPrincipal = ' + QuotedStr(pCodigoProduto));
    vTabFT.Open;

    vTotalCusto := 0;

    vTabFT.First;
    while not vTabFT.Eof do
    begin
      Application.ProcessMessages;

      vTabFT.Edit;
      vTabFT.FieldByName('ValorCusto').AsFloat := RoundReal(GetLastCust(vTabFT.FieldByName('CodigoProduto').AsString), 2);
      vTemp := GetLastDesc(vTabFT.FieldByName('CodigoProduto').AsString);
      if Trim(vTemp) <> '' then
      begin
        vTabFT.FieldByName('Descricao').AsString := vTemp;
      end;
      vTabFT.Post;
      vTabFT.ApplyUpdates;

      vTotalCusto := vTotalCusto + (vTabFT.FieldByName('ValorCusto').AsFloat * vTabFT.FieldByName('Quantidade').AsFloat);

      vTabFT.Next;
    end;

    if vTabProd.FieldByName('PercAdicionalCusto').AsFloat > 0 then
    begin
      vTotalCusto := vTotalCusto + ((vTabProd.FieldByName('PercAdicionalCusto').AsFloat * vTotalCusto) / 100);
    end;

    vTabProd.Edit;
    vTabProd.FieldByName('ValorCustoProduto').AsFloat := RoundReal(vTotalCusto, 2);
    vTabProd.Post;
    vTabProd.ApplyUpdates;
  finally
    vTabFT.Close;
    vTabProd.Close;
    vTabFT.Free;
    vTabProd.Free;
  end;
end;

function TfmMenu.GetLastDesc(pCodigoProduto: string): string;
var
  vTabProd: TZQuery;
begin
  Result := '';
  vTabProd := TZQuery.Create(nil);
  try
    vTabProd.Connection := zcnConexao;

    vTabProd.Close;
    vTabProd.SQL.Clear;
    vTabProd.SQL.Add('SELECT NomeTecnico FROM produtos WHERE CodigoProduto = ' + QuotedStr(pCodigoProduto));
    vTabProd.Open;

    if vTabProd.RecordCount = 1 then
    begin
      if Trim(vTabProd.FieldByName('NomeTecnico').AsString) <> '' then
      begin
        Result := vTabProd.FieldByName('NomeTecnico').AsString;
      end;
    end
    else
    begin
      Result := '';
    end;
  finally
    vTabProd.Close;
    vTabProd.Free;
  end;
end;

procedure TfmMenu.AtualizaEstoque(pCodigoProduto: string);
begin
  try
    try
      tabAtualizaEstoque.Close;
      tabAtualizaEstoque.SQL.Clear;
      tabAtualizaEstoque.SQL.Add('SELECT * FROM produtos_status_estoque WHERE CodigoProduto = ' + QuotedStr(pCodigoProduto));
      tabAtualizaEstoque.Open;
      if tabAtualizaEstoque.RecordCount = 0 then
      begin
        tabAtualizaEstoque.Append;
        tabAtualizaEstoque.FieldByName('CodigoProduto').AsString := pCodigoProduto;
      end
      else
      begin
        tabAtualizaEstoque.Edit;
      end;
      tabAtualizaEstoque.FieldByName('Estoque').AsFloat := CalculaEstoque(pCodigoProduto);
      tabAtualizaEstoque.FieldByName('Empenho').AsFloat := CalculaEmpenho(pCodigoProduto);
      tabAtualizaEstoque.FieldByName('Interno').AsFloat := CalculaInterno(pCodigoProduto);
      ;

      if tabAtualizaEstoque.FieldByName('Estoque').AsFloat - tabAtualizaEstoque.FieldByName('Empenho').AsFloat <= 0 then
      begin
        tabAtualizaEstoque.FieldByName('Disponivel').AsFloat := 0;
      end
      else
      begin
        tabAtualizaEstoque.FieldByName('Disponivel').AsFloat := tabAtualizaEstoque.FieldByName('Estoque').AsFloat - tabAtualizaEstoque.FieldByName('Empenho').AsFloat;
      end;
      if tabAtualizaEstoque.FieldByName('Empenho').AsFloat - tabAtualizaEstoque.FieldByName('Estoque').AsFloat <= 0 then
      begin
        tabAtualizaEstoque.FieldByName('Faltas').AsFloat := 0;
      end
      else
      begin
        tabAtualizaEstoque.FieldByName('Faltas').AsFloat := tabAtualizaEstoque.FieldByName('Empenho').AsFloat - tabAtualizaEstoque.FieldByName('Estoque').AsFloat;
      end;
      tabAtualizaEstoque.Post;
      tabAtualizaEstoque.ApplyUpdates;
    finally
      tabAtualizaEstoque.Close;
    end;
  except
    ShowMessage('Erro ao Calcular estoque do produto ' + pCodigoProduto);
  end

end;

function TfmMenu.CalculaEstoque(pCodigoProduto: string): real;
var
  vProducoes, vEntradas, vSaidas, vPedidos: real;
  vAcertoEntrada, vAcertoSaida: real;
begin
  try
    // Entradas - O.P.
    tabEstoque.Close;
    tabEstoque.SQL.Clear;
    tabEstoque.SQL.Add('SELECT SUM(ordem_producao_produtos.Quantidade) AS Producao');
    tabEstoque.SQL.Add('FROM ordem_producao, ordem_producao_produtos');
    tabEstoque.SQL.Add('WHERE ordem_producao.OrdemProducao = ordem_producao_produtos.OrdemProducao');
    tabEstoque.SQL.Add('AND ordem_producao_produtos.CodigoProduto = ' + QuotedStr(pCodigoProduto));
    tabEstoque.SQL.Add('AND ordem_producao.DataTermino IS NOT NULL');
    tabEstoque.Open;
    vProducoes := tabEstoque.FieldByName('Producao').AsFloat;

    // Entradas - Entradas
    tabEstoque.Close;
    tabEstoque.SQL.Clear;
    tabEstoque.SQL.Add('SELECT SUM(Quantidade) AS Entradas');
    tabEstoque.SQL.Add('FROM produtos_movimentos');
    tabEstoque.SQL.Add('WHERE CodigoProduto = ' + QuotedStr(pCodigoProduto));
    tabEstoque.SQL.Add('AND TipoMovimento = 1');
    tabEstoque.Open;
    vEntradas := tabEstoque.FieldByName('Entradas').AsFloat;

    // Entradas - Acertos de Entrada
    tabEstoque.Close;
    tabEstoque.SQL.Clear;
    tabEstoque.SQL.Add('SELECT SUM(Quantidade) AS AcertoEntradas');
    tabEstoque.SQL.Add('FROM acertos_produtos');
    tabEstoque.SQL.Add('WHERE CodigoProduto = ' + QuotedStr(pCodigoProduto));
    tabEstoque.SQL.Add('AND TipoAcerto = 1');
    tabEstoque.Open;
    vAcertoEntrada := tabEstoque.FieldByName('AcertoEntradas').AsFloat;

    // Saídas - Pedidos - Mudei para baixa parcial dia (10/01/2012)
    tabEstoque.Close;
    tabEstoque.SQL.Clear;
    tabEstoque.SQL.Add('SELECT SUM(pedidos_produtos.Quantidade) AS Pedidos');
    tabEstoque.SQL.Add('FROM pedidos');
    tabEstoque.SQL.Add('LEFT JOIN pedidos_produtos ON pedidos_produtos.NPedido = pedidos.NPedido');
    tabEstoque.SQL.Add('WHERE pedidos_produtos.CodigoProduto = ' + QuotedStr(pCodigoProduto));
    tabEstoque.SQL.Add(' AND (pedidos_produtos.DataProducao IS NOT NULL or pedidos.DataProducao IS NOT NULL)');
    tabEstoque.Open;
    vPedidos := tabEstoque.FieldByName('Pedidos').AsFloat;

    tabEstoque.Close;
    tabEstoque.SQL.Clear;
    tabEstoque.SQL.Add('SELECT SUM(produtos_movimentos.Quantidade) AS Saidas');
    tabEstoque.SQL.Add('FROM produtos_movimentos');
    tabEstoque.SQL.Add('WHERE produtos_movimentos.CodigoProduto = ' + QuotedStr(pCodigoProduto));
    tabEstoque.SQL.Add('AND TipoMovimento = 0');
    tabEstoque.Open;
    vSaidas := tabEstoque.FieldByName('Saidas').AsFloat;

    tabEstoque.Close;
    tabEstoque.SQL.Clear;
    tabEstoque.SQL.Add('SELECT SUM(Quantidade) AS AcertoSaidas');
    tabEstoque.SQL.Add('FROM acertos_produtos');
    tabEstoque.SQL.Add('WHERE CodigoProduto = ' + QuotedStr(pCodigoProduto));
    tabEstoque.SQL.Add('AND TipoAcerto = 0');
    tabEstoque.Open;
    vAcertoSaida := tabEstoque.FieldByName('AcertoSaidas').AsFloat;

    Result := (vProducoes + vEntradas + vAcertoEntrada) - (vPedidos + vSaidas + vAcertoSaida);

    Application.ProcessMessages;
  finally
    tabEstoque.Close;
  end;
end;

function TfmMenu.CalculaInterno(pCodigoProduto: string): real;
var
  vInterno: real;
begin
  try
    tabInterno.Close;
    tabInterno.SQL.Clear;
    tabInterno.SQL.Add('SELECT SUM(ordem_producao_produtos.Quantidade) AS Interno');
    tabInterno.SQL.Add('FROM ordem_producao, ordem_producao_produtos');
    tabInterno.SQL.Add('WHERE ordem_producao.OrdemProducao = ordem_producao_produtos.OrdemProducao');
    tabInterno.SQL.Add('AND ordem_producao_produtos.CodigoProduto = ' + QuotedStr(pCodigoProduto));
    tabInterno.SQL.Add('AND ordem_producao.DataTermino IS NULL');
    tabInterno.Open;
    vInterno := tabInterno.FieldByName('Interno').AsFloat;

    Result := vInterno;

    Application.ProcessMessages;
  finally
    tabInterno.Close;
  end;
end;

function TfmMenu.CalculaEmpenho(pCodigoProduto: string): real;
var
  vEmpenhos: real;
begin
  // Alterei para baixa parcial - 10/01/2012
  try
    tabEmpenho.Close;
    tabEmpenho.SQL.Clear;
    tabEmpenho.SQL.Add('     SELECT SUM(pedidos_produtos.Quantidade) AS Empenho                   ');
    tabEmpenho.SQL.Add('       FROM pedidos                                                       ');
    tabEmpenho.SQL.Add('  LEFT JOIN pedidos_produtos ON pedidos.NPedido = pedidos_produtos.NPedido');
    tabEmpenho.SQL.Add('      WHERE pedidos_produtos.CodigoProduto =                              ' + QuotedStr(pCodigoProduto));
    tabEmpenho.SQL.Add('        AND pedidos_produtos.DataProducao IS NULL                         ');
    tabEmpenho.SQL.Add('        AND pedidos.DataProducao IS NULL                                  ');
    tabEmpenho.Open;
    vEmpenhos := tabEmpenho.FieldByName('Empenho').AsFloat;
    Result := vEmpenhos;
    Application.ProcessMessages;
  finally
    tabEmpenho.Close;
  end;
end;

function TfmMenu.pubNomeComputador: string;
const
  MAX_COMPUTER_LENGTH = 30;
var
  pNome: PChar;
  len: DWord;
begin
  try
    len := MAX_COMPUTER_LENGTH + 1;
    GetMem(pNome, len);
    if GetComputerName(pNome, len) then
      Result := pNome
    else
      Result := 'Não foi possível obter o nome deste computador!';
  finally
    FreeMem(pNome, len);
  end;
end;

procedure TfmMenu.AppEventsShortCut(var Msg: TWMKey;
  var Handled: Boolean);

var
  vFM1: TfmClientes;
  vFM2: TfmContatos;
  vFM3: TfmDebugador;
  vTipoTela, vCodigo: string;
  vHelpContext: Integer;
  li_Contador: integer;
  vFormAtivo: TForm;
begin
  inherited;
  if Trim(fmMenu.pubUsuario) <> '' then
  begin

    if Msg.CharCode = VK_F12 then
    begin
      Handled := True; // pra dizer q ja usou a tecla.
      // if GetKeyState(VK_CONTROL) < 0 then //ctrl precionada.
      if not Assigned(fmLocalizarClientesContatos) then
      begin
        Application.CreateForm(TfmLocalizarClientesContatos, fmLocalizarClientesContatos);
        fmLocalizarClientesContatos.ShowModal;
      end;
      if (Trim(fmMenu.pubTrans1) <> '') and (Trim(fmMenu.pubTrans2) <> '') then
      begin
        vTipoTela := fmMenu.pubTrans2;
        vCodigo := fmMenu.pubTrans1;
        Application.ProcessMessages;
        if vTipoTela = '1' then
        begin
          fmMenu.pubTrans1 := vCodigo;
          vFM1 := TfmClientes.Create(Self);
          vFM1.Show;
        end
        else if vTipoTela = '2' then
        begin
          fmMenu.pubTrans1 := vCodigo;
          vFM2 := TfmContatos.Create(Self);
          vFM2.Show;
        end;
      end;
    end;

    if Msg.CharCode = VK_F2 then
    begin
      vFormAtivo := Screen.ActiveForm;
      vFM3 := TfmDebugador.Create(Self);

      for li_Contador := 0 to vFormAtivo.ComponentCount - 1 do
      begin
        // Se o elemento do formulário for um cxButton
        if vFormAtivo.Components[li_Contador] is TZQuery then
        begin
            vFM3.jedEditor.Lines.Text := (vFormAtivo.Components[li_Contador] as TZQuery).SQL.Text;
            vFM3.Formulario := vFormAtivo;
            vFM3.Caption := 'Debugador - ' + vFormAtivo.Caption;
            vFM3.lstQuery.Items.Add((vFormAtivo.Components[li_Contador] as TZQuery).Name);
        end;
      end;
      
      vFM3.Show;
    end;
    {
    if Msg.CharCode = VK_F1 then
    begin
      vHelpContext := 0;

      if Screen.ActiveForm.Name = 'fmMenu' then
      begin
        vHelpContext := HELP_Bemvindo;
      end
      else if (Screen.ActiveForm.Name = 'fmGenericos') and (pubTituloTela = 'Grupos') then
      begin
        vHelpContext := HELP_GrupoProdutos
      end
      else if (Screen.ActiveForm.Name = 'fmGenericos') and (pubTituloTela = 'Modelos') then
      begin
        vHelpContext := HELP_ModeloProdutos
      end
      else if Screen.ActiveForm.Name = 'fmUnidades' then
      begin
        vHelpContext := HELP_Unidades;
      end
      else if Screen.ActiveForm.Name = 'fmCores' then
      begin
        vHelpContext := HELP_CorProdutos;
      end
      else if Screen.ActiveForm.Name = 'fmProdutos' then
      begin
        vHelpContext := HELP_CadastroProdutos;
      end
      else if (Screen.ActiveForm.Name = 'fmGenericos') and (pubTituloTela = 'Grupos') then
      begin
        vHelpContext := HELP_GrupoProdutos;
      end
      else if (Screen.ActiveForm.Name = 'fmGenericos') and (pubTituloTela = 'Modelos') then
      begin
        vHelpContext := HELP_ModeloProdutos;
      end
      else if Screen.ActiveForm.Name = 'fmUnidades' then
      begin
        vHelpContext := HELP_Unidades;
      end
      else if Screen.ActiveForm.Name = 'fmCores' then
      begin
        vHelpContext := HELP_CorProdutos;
      end
      else if Screen.ActiveForm.Name = 'fmMoldes' then
      begin
        vHelpContext := HELP_CadastroMoldes;
      end
      else if Screen.ActiveForm.Name = 'fmCores' then
      begin
        vHelpContext := HELP_CorMoldes;
      end
      else if Screen.ActiveForm.Name = 'fmClientes' then
      begin
        vHelpContext := HELP_CadastroClientes;
      end
      else if (Screen.ActiveForm.Name = 'fmGenericos') and (pubTituloTela = 'Grupos de Clientes') then
      begin
        vHelpContext := HELP_GruposClientes;
      end
      else if (Screen.ActiveForm.Name = 'fmGenericos') and (pubTituloTela = 'Tipos de Clientes') then
      begin
        vHelpContext := HELP_TiposClientes;
      end
      else if (Screen.ActiveForm.Name = 'fmGenericos') and (pubTituloTela = 'Status de Clientes') then
      begin
        vHelpContext := HELP_StatusClientes;
      end
      else if Screen.ActiveForm.Name = 'fmRegioes' then
      begin
        vHelpContext := HELP_SetorRegies;
      end
      else if Screen.ActiveForm.Name = 'fmPaises' then
      begin
        vHelpContext := HELP_Paises;
      end
      else if Screen.ActiveForm.Name = 'fmCidades' then
      begin
        vHelpContext := HELP_Cidades;
      end
      else if Screen.ActiveForm.Name = 'fmCadastroEnderecos' then
      begin
        vHelpContext := HELP_Enderecos;
      end
      else if Screen.ActiveForm.Name = 'fmContatos' then
      begin
        vHelpContext := HELP_Contatos;
      end
      else if Screen.ActiveForm.Name = 'fmEmpresas' then
      begin
        vHelpContext := HELP_Empresas;
      end
      else if Screen.ActiveForm.Name = 'fmFuncionarios' then
      begin
        vHelpContext := HELP_Funcionarios2;
      end
      else if Screen.ActiveForm.Name = 'fmCargos' then
      begin
        vHelpContext := HELP_Cargos;
      end
      else if (Screen.ActiveForm.Name = 'fmGenericos') and (pubTituloTela = 'Departamentos') then
      begin
        vHelpContext := HELP_Departamentos;
      end
      else if (Screen.ActiveForm.Name = 'fmGenericos') and (pubTituloTela = 'Estado Civil') then
      begin
        vHelpContext := HELP_EstadoCivil;
      end
      else if (Screen.ActiveForm.Name = 'fmGenericos') and (pubTituloTela = 'Grau de Parentesco') then
      begin
        vHelpContext := HELP_GrauParentesco;
      end
      else if (Screen.ActiveForm.Name = 'fmGenericos') and (pubTituloTela = 'Tipos de Advertências') then
      begin
        vHelpContext := HELP_TiposAdvertencias;
      end
      else if (Screen.ActiveForm.Name = 'fmGenericos') and (pubTituloTela = 'Tipos de Ausências') then
      begin
        vHelpContext := HELP_TiposAusencias;
      end
      else if Screen.ActiveForm.Name = 'fmFornecedores' then
      begin
        vHelpContext := HELP_Fornecedores;
      end
      else if Screen.ActiveForm.Name = 'fmLeituraDigital' then
      begin
        vHelpContext := HELP_PontoBiometrico;
      end
      else if Screen.ActiveForm.Name = 'fmAtivos' then
      begin
        vHelpContext := HELP_Ativos;
      end
      else if Screen.ActiveForm.Name = 'fmTransportadoras' then
      begin
        vHelpContext := HELP_Transportadoras;
      end
      else if Screen.ActiveForm.Name = 'fmBancos' then
      begin
        vHelpContext := HELP_Bancos;
      end
      else if Screen.ActiveForm.Name = 'fmCentroCusto' then
      begin
        vHelpContext := HELP_CentroCusto;
      end
      else if Screen.ActiveForm.Name = 'fmCfop' then
      begin
        vHelpContext := HELP_CFOPNaturezaOperacao;
      end
      else if Screen.ActiveForm.Name = 'fmContasBancarias' then
      begin
        vHelpContext := HELP_ContasBancarias;
      end
      else if Screen.ActiveForm.Name = 'fmFormasPagto' then
      begin
        vHelpContext := HELP_FormasPagamento;
      end
      else if (Screen.ActiveForm.Name = 'fmGenericos') and (pubTituloTela = 'Localização dos Títulos') then
      begin
        vHelpContext := HELP_LocalizacaoTitulos;
      end
      else if (Screen.ActiveForm.Name = 'fmGenericos') and (pubTituloTela = 'Regime Tributário') then
      begin
        vHelpContext := HELP_RegimeTributario;
      end
      else if (Screen.ActiveForm.Name = 'fmGenericos') and (pubTituloTela = 'Responsável Títulos') then
      begin
        vHelpContext := HELP_ResponsavelTitulos;
      end
      else if (Screen.ActiveForm.Name = 'fmGenericos') and (pubTituloTela = 'Tipos de Indices Financeiros') then
      begin
        vHelpContext := HELP_TiposIndicesFinanceiros;
      end
      else if (Screen.ActiveForm.Name = 'fmGenericos') and (pubTituloTela = 'Tipos de Liquidação') then
      begin
        vHelpContext := HELP_TiposLiquidacao;
      end
      else if (Screen.ActiveForm.Name = 'fmGenericos') and (pubTituloTela = 'Tipos de Orçamento') then
      begin
        vHelpContext := HELP_TiposOrcamento;
      end
      else if (Screen.ActiveForm.Name = 'fmGenericos') and (pubTituloTela = 'Tipos de Notas Fiscais') then
      begin
        vHelpContext := HELP_TiposNotaFiscal;
      end
      else if (Screen.ActiveForm.Name = 'fmGenericos') and (pubTituloTela = 'Status de Pedido') then
      begin
        vHelpContext := HELP_StatusPedido;
      end
      else if Screen.ActiveForm.Name = 'fmSetorTrabalho' then
      begin
        vHelpContext := HELP_SetoresTrabalho;
      end
      else if Screen.ActiveForm.Name = 'fmHorariosTrabalho' then
      begin
        vHelpContext := HELP_HorariosTrabalho;
      end
      else if Screen.ActiveForm.Name = 'fmOrcamentosVendas' then
      begin
        vHelpContext := HELP_OramentosVenda;
      end
      else if Screen.ActiveForm.Name = 'fmPedidosVenda' then
      begin
        vHelpContext := HELP_PedidosVenda;
      end
      else if (Screen.ActiveForm.Name = 'fmFaturamento') and (pubTrans1 = '1') then
      begin
        vHelpContext := HELP_FaturamentoClientes;
      end
      else if (Screen.ActiveForm.Name = 'fmFaturamento') and (pubTrans1 = '2') then
      begin
        vHelpContext := HELP_FaturamentoFornecedores;
      end
      else if Screen.ActiveForm.Name = 'fmTabelaCorreio' then
      begin
        vHelpContext := HELP_TabelaCorreio;
      end
      else if Screen.ActiveForm.Name = 'fmOrdemProducaoEntrada' then
      begin
        vHelpContext := HELP_OrdemProducaoEntrada;
      end
      else if (Screen.ActiveForm.Name = 'fmRequisicaoProdutos') and (pubTrans1 = '1') then
      begin
        vHelpContext := HELP_ProdutosRequisicaoEntrada;
      end
      else if (Screen.ActiveForm.Name = 'fmRequisicaoProdutos') and (pubTrans1 = '2') then
      begin
        vHelpContext := HELP_ProdutosRequisicaoSaida;
      end
      else if Screen.ActiveForm.Name = 'fmAcertoEstoque' then
      begin
        vHelpContext := HELP_AcertoEstoque;
      end
      else if Screen.ActiveForm.Name = 'fmPainelProducao' then
      begin
        vHelpContext := HELP_PainelProducao;
      end
      else if Screen.ActiveForm.Name = 'fmRequisicaoCompras' then
      begin
        vHelpContext := HELP_RequisioCompras;
      end
      else if Screen.ActiveForm.Name = 'fmConsultaRequisicaoCompras' then
      begin
        vHelpContext := HELP_ConsultaRequisicaoCompras;
      end
      else if Screen.ActiveForm.Name = 'fmOrcamentoCompras' then
      begin
        vHelpContext := HELP_OrcamentoCompras;
      end
      else if Screen.ActiveForm.Name = 'fmConsultaOrcamentosCompras' then
      begin
        vHelpContext := HELP_ConsultaOrcamentoCompras;
      end
      else if Screen.ActiveForm.Name = 'fmPedidosCompra' then
      begin
        vHelpContext := HELP_PedidosCompra;
      end
      else if Screen.ActiveForm.Name = 'fmAproveitamento' then
      begin
        vHelpContext := HELP_Aproveitamento;
      end
      else if (Screen.ActiveForm.Name = 'fmTitulosReceber') and (pubTrans2 = '1') then
      begin
        vHelpContext := HELP_TitulosReceber;
      end
      else if Screen.ActiveForm.Name = 'fmLocalizarTitulosReceber' then
      begin
        vHelpContext := HELP_Consulta;
      end
      else if (Screen.ActiveForm.Name = 'fmTitulosReceber') and (pubTrans2 = '2') then
      begin
        vHelpContext := HELP_TtulosRecebidos;
      end
      else if Screen.ActiveForm.Name = 'fmLocalizarTitulosRecebidos' then
      begin
        vHelpContext := HELP_RecebidosConsulta;
      end
      else if (Screen.ActiveForm.Name = 'fmTitulosPagar') and (pubTrans2 = '1') then
      begin
        vHelpContext := HELP_TitulosPagar;
      end
      else if Screen.ActiveForm.Name = 'fmLocalizarTitulosPagar' then
      begin
        vHelpContext := HELP_PagarConsulta;
      end
      else if (Screen.ActiveForm.Name = 'fmTitulosPagar') and (pubTrans2 = '2') then
      begin
        vHelpContext := HELP_TtulosPagos;
      end
      else if Screen.ActiveForm.Name = 'fmLocalizarTitulosPagos' then
      begin
        vHelpContext := HELP_PagosConsulta;
      end
      else if Screen.ActiveForm.Name = 'fmIndicesFinanceiros' then
      begin
        vHelpContext := HELP_IndicesFinanceiros;
      end
      else if Screen.ActiveForm.Name = 'fmIndicesCotacoes' then
      begin
        vHelpContext := HELP_IndicesCotacoes;
      end
      else if Screen.ActiveForm.Name = 'fmGerarPendentesTitulos' then
      begin
        vHelpContext := HELP_GerarPendentes;
      end
      else if Screen.ActiveForm.Name = 'fmGerarParticipacaoVendedores' then
      begin
        vHelpContext := HELP_GerarParticipacaoVendedores;
      end
      else if Screen.ActiveForm.Name = 'fmEmissaoBoletoBancario' then
      begin
        vHelpContext := HELP_EmissoBoletoBancrio;
      end
      else if Screen.ActiveForm.Name = 'fmNotaFiscalPaulista' then
      begin
        vHelpContext := HELP_ExportaoNotaFiscalPaulista;
      end
      else if Screen.ActiveForm.Name = 'fmNotaFiscalEletronica' then
      begin
        vHelpContext := HELP_ExportacoNotaFiscalEletronica;
      end
      else if Screen.ActiveForm.Name = 'fmNFeEnvioEmail' then
      begin
        vHelpContext := HELP_EnvioEmailNFe;
      end
      else if Screen.ActiveForm.Name = 'fmRemessaBancoBrasil' then
      begin
        vHelpContext := HELP_RemessaBancoBrasil;
      end
      else if Screen.ActiveForm.Name = 'fmRetornoBancoBrasil' then
      begin
        vHelpContext := HELP_RetornoBancoBrasil;
      end
      else if Screen.ActiveForm.Name = 'fmTiposTabelasPrecos' then
      begin
        vHelpContext := HELP_TiposTabelasPreco;
      end
      else if Screen.ActiveForm.Name = 'fmPrecos' then
      begin
        vHelpContext := HELP_ManutencaoPrecos;
      end
      else if Screen.ActiveForm.Name = 'rtEmissaoTabelaPrecos' then
      begin
        vHelpContext := HELP_RelatorioTabelasdePreco;
      end
      else if Screen.ActiveForm.Name = 'fmEnvioEmailIndividual' then
      begin
        vHelpContext := HELP_EnvioEmails;
      end
      else if Screen.ActiveForm.Name = 'fmEnvioEmailLote' then
      begin
        vHelpContext := HELP_EnvioEmailsLote;
      end
      else if Screen.ActiveForm.Name = 'fmOrcamentosEnviadosEmail' then
      begin
        vHelpContext := HELP_OrcamentosEnviados;
      end
      else if Screen.ActiveForm.Name = 'rtReposicaoEstoque' then
      begin
        vHelpContext := HELP_ReposicaoEstoque;
      end
      else if Screen.ActiveForm.Name = 'rtEmissaoEstoque' then
      begin
        vHelpContext := HELP_EmissoEstoque;
      end
      else if Screen.ActiveForm.Name = 'rtEmissaoFaturamento' then
      begin
        vHelpContext := HELP_FaturamentoPeriodo;
      end
      else if Screen.ActiveForm.Name = 'rtReceberEmitidos' then
      begin
        vHelpContext := HELP_TitulosEmitidos;
      end
      else if Screen.ActiveForm.Name = 'rtReceberAberto' then
      begin
        vHelpContext := HELP_TitulosAberto;
      end
      else if Screen.ActiveForm.Name = 'rtReceberRecebidos' then
      begin
        vHelpContext := HELP_TitulosRecebidos;
      end
      else if Screen.ActiveForm.Name = 'rtPagarEmitidos' then
      begin
        vHelpContext := HELP_RFPagarTituloEmitidos;
      end
      else if Screen.ActiveForm.Name = 'rtPagarAberto' then
      begin
        vHelpContext := HELP_RFPagarTituloAberto;
      end
      else if Screen.ActiveForm.Name = 'rtPagarPagos' then
      begin
        vHelpContext := HELP_RFPagarTituloPagos;
      end
      else if Screen.ActiveForm.Name = 'rtMateriaPrima' then
      begin
        vHelpContext := HELP_MateriaPrimaCapitalInvestido;
      end
      else if Screen.ActiveForm.Name = 'rtEmissaoCentroCusto' then
      begin
        vHelpContext := HELP_RelacaoCentroCusto;
      end
      else if Screen.ActiveForm.Name = 'rtEmissaoCFOP' then
      begin
        vHelpContext := HELP_RelacaoCFOP;
      end
      else if Screen.ActiveForm.Name = 'rtInventarioProdutos' then
      begin
        vHelpContext := HELP_InventarioProdutos;
      end
      else if Screen.ActiveForm.Name = 'rtPedidosRecebidos' then
      begin
        vHelpContext := HELP_PedidosRecebidos;
      end
      else if Screen.ActiveForm.Name = 'rtPedidosOscilacoes' then
      begin
        vHelpContext := HELP_PedidosOscilacoes;
      end
      else if Screen.ActiveForm.Name = 'rtPedidosReceber' then
      begin
        vHelpContext := HELP_PedidosReceber;
      end
      else if Screen.ActiveForm.Name = 'rtTopProdutosVendidos' then
      begin
        vHelpContext := HELP_TopProdutosVendidos;
      end
      else if Screen.ActiveForm.Name = 'rtFichaTecnica' then
      begin
        vHelpContext := HELP_RGPFichaTecnica;
      end
      else if Screen.ActiveForm.Name = 'gfInjecoesDia' then
      begin
        vHelpContext := HELP_InjecoesDia;
      end
      else if Screen.ActiveForm.Name = 'gfInjecoesClientes' then
      begin
        vHelpContext := HELP_InjecoesClientes;
      end
      else if Screen.ActiveForm.Name = 'gfVendasAnual' then
      begin
        vHelpContext := HELP_VendasAnual;
      end
      else if Screen.ActiveForm.Name = 'gfVendasAnualVendedores' then
      begin
        vHelpContext := HELP_VendasAnualVendedores;
      end
      else if Screen.ActiveForm.Name = 'gfVendasPorEstado' then
      begin
        vHelpContext := HELP_VendasEstado;
      end
      else if Screen.ActiveForm.Name = 'rtEmissaoClientes' then
      begin
        vHelpContext := HELP_RelacaClientes;
      end
      else if Screen.ActiveForm.Name = 'rtEmissaoContatos' then
      begin
        vHelpContext := HELP_RelacaoContatos;
      end
      else if Screen.ActiveForm.Name = 'rtEmissaoSetores' then
      begin
        vHelpContext := HELP_RelacaoSetores;
      end
      else if Screen.ActiveForm.Name = 'rtEmissaoSetorClientes' then
      begin
        vHelpContext := HELP_RelacaoClientesSetores;
      end
      else if Screen.ActiveForm.Name = 'rtEmissaoFormasPagto' then
      begin
        vHelpContext := HELP_RelaodeFormasdePagamento;
      end
      else if Screen.ActiveForm.Name = 'rtEmissaoProdutos' then
      begin
        vHelpContext := HELP_RelacaoProdutos;
      end
      else if Screen.ActiveForm.Name = 'rtEtiquetasProdutos' then
      begin
        vHelpContext := HELP_EtiquetasProdutos;
      end
      else if Screen.ActiveForm.Name = 'rtEmissaoOrcamentos' then
      begin
        vHelpContext := HELP_EmissaoOrcamentos;
      end
      else if Screen.ActiveForm.Name = 'rtPedidosPendentes' then
      begin
        vHelpContext := HELP_PedidosPendentes;
      end
      else if Screen.ActiveForm.Name = 'rtPedidosProdutos' then
      begin
        vHelpContext := HELP_ProdutosPendentes;
      end
      else if Screen.ActiveForm.Name = 'rtPedidosRealizados' then
      begin
        vHelpContext := HELP_PedidosRealizados;
      end
      else if Screen.ActiveForm.Name = 'rtProdutosRealizados' then
      begin
        vHelpContext := HELP_ProdutosRealizados;
      end
      else if Screen.ActiveForm.Name = 'rtOrdensProducaoPendentes' then
      begin
        vHelpContext := HELP_OrdensProducao;
      end
      else if Screen.ActiveForm.Name = 'fmRastrearEstoque' then
      begin
        vHelpContext := HELP_RastrearProduto;
      end
      else if Screen.ActiveForm.Name = 'fmConfiguracaoSistema' then
      begin
        vHelpContext := HELP_ConfiguracaoSistema;
      end
      else if Screen.ActiveForm.Name = 'fmUsuarios' then
      begin
        vHelpContext := HELP_ConfiguracaosUsuarios;
      end
      else if Screen.ActiveForm.Name = 'fmPerfilUsuarios' then
      begin
        vHelpContext := HELP_ConfiguraoPerfilUsuarios;
      end
      else if Screen.ActiveForm.Name = 'fmUsuariosLogados' then
      begin
        vHelpContext := HELP_UsuariosLogados;
      end
      else if Screen.ActiveForm.Name = 'fmConfiguracaoBancoDados' then
      begin
        vHelpContext := HELP_ConfiguraoArquivosBancoDados;
      end
      else if Screen.ActiveForm.Name = 'fmLogUsuarios' then
      begin
        vHelpContext := HELP_LogUsuarios;
      end;

      Application.HelpContext(vHelpContext);

    end;
    }
  end;
end;

function TfmMenu.GetLastCust(pCodigoProduto: string): real;
var
  vQtdMoeda, vCodigoMoeda, vIndice: real;
begin
  try
    Result := 0;
    tabBusca.Close;
    tabBusca.SQL.Clear;
    tabBusca.SQL.Add('SELECT CodigoMoeda,QtdMoeda FROM produtos WHERE CodigoProduto = ' + QuotedStr(pCodigoProduto));
    tabBusca.Open;
    // Se tem moeda e qtd de moeda, significa, moeda estrangeira, faço o calculo.
    if (tabBusca.FieldByName('QtdMoeda').AsFloat > 0) and (tabBusca.FieldByName('CodigoMoeda').AsFloat > 0) then
    begin
      vQtdMoeda := tabBusca.FieldByName('QtdMoeda').AsFloat;
      vCodigoMoeda := tabBusca.FieldByName('CodigoMoeda').AsFloat;
      tabBusca.Close;
      tabBusca.SQL.Clear;
      tabBusca.SQL.Add('SELECT * FROM indices_financeiros');
      tabBusca.SQL.Add('WHERE Codigo = ' + FloatToStr(vCodigoMoeda));
      tabBusca.SQL.Add('ORDER BY Data DESC');
      tabBusca.SQL.Add(db_limite_cmd + ' 1');
      tabBusca.Open;
      vIndice := tabBusca.FieldByName('Valor').AsFloat;
      Result := vQtdMoeda * vIndice;
    end
    else
    begin
      // Verifico se tem ultima compra M.P.
      tabBusca.Close;
      tabBusca.SQL.Clear;
      tabBusca.SQL.Add('SELECT ValorCompra FROM ultimas_compras');
      tabBusca.SQL.Add('WHERE CodigoProduto = ' + QuotedStr(pCodigoProduto));
      tabBusca.SQL.Add('ORDER BY DataCompra DESC ' + db_limite_cmd + ' 1');
      tabBusca.Open;

      if tabBusca.RecordCount > 0 then
      begin
        Result := tabBusca.FieldByName('ValorCompra').AsFloat;
      end
        // P.S.A.
      else
      begin
        tabBusca.Close;
        tabBusca.SQL.Clear;
        tabBusca.SQL.Add('SELECT ValorCustoProduto FROM produtos');
        tabBusca.SQL.Add('WHERE CodigoProduto = ' + QuotedStr(pCodigoProduto));
        tabBusca.Open;
        if tabBusca.RecordCount = 1 then
        begin
          Result := tabBusca.FieldByName('ValorCustoProduto').AsFloat;
        end;
      end;
    end;
  finally
    tabBusca.Close;
  end;
  { * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * }
end;

procedure TfmMenu.DisplayHint(Sender: TObject);
begin
  stbMenu.Panels[4].Text := Application.Hint;
end;

procedure TfmMenu.imgLogoFundoClick(Sender: TObject);
begin
  inherited;
  Self.SetFocus;
  ShellExecute(0, 'open', PChar('http://www.softwarepi.com.br/index.php/precos'), nil, nil, SW_SHOWNORMAL)
end;

procedure TfmMenu.tmrAvisoTimer(Sender: TObject);
var
  BarraIniciar: HWND; {Barra Iniciar}
  tmAltura: Integer;
  tmRect: TRect;
  xTop: Integer;
  xIniTop: Integer;
  vCnt, vNovoTamanho: Integer;
  vCascataTopo: integer;
  vCascataTopoValor: integer;
  vCascataLeft: Integer;
  vCascataLeftValor: integer;

var
  vTabMensagem: TZQuery;
begin

  try
    try
      inherited;

      tmrAviso.Enabled := False;

      vCascataTopoValor := 20;
      vCascataLeftValor := 20;

      vCascataTopo := vCascataTopoValor;
      vCascataLeft := vCascataLeftValor;

      if pubUsuario = '' then
      begin
        Exit;
      end;

      vTabMensagem := TZQuery.Create(nil);
      vTabMensagem.Connection := fmMenu.zcnConexao;

      vTabMensagem.SQL.Add('SELECT * from mensagem ');
      vTabMensagem.SQL.Add(' where ConfirmarLeitura = 0 ');
      vTabMensagem.SQL.Add(' and Usuario = ' + QuotedStr(pubUsuario));

      vTabMensagem.Open;

      // Se não há mensagem sai do procedimento
      if vTabMensagem.RecordCount = 0 then
      begin
        stbMenu.Panels[5].Text := '0 Mensagem não lida.';
        Exit;
      end;

      tmrAviso.Interval := 10000;

      if vTabMensagem.RecordCount > 1 then
      begin
        stbMenu.Panels[5].Text := IntToStr(vTabMensagem.RecordCount) + ' Mensagens não lidas.';
      end
      else
      begin
        stbMenu.Panels[5].Text := IntToStr(vTabMensagem.RecordCount) + ' Mensagem não lida.';
      end;

      vTabMensagem.First;
      while not vTabMensagem.Eof do
      begin
        // Se o alerta não foi exibido ainda

        // Se nao existe o id na matriz
        if not ExisteArray(vTabMensagem.FieldByName('CodigoMensagem').AsFloat, pubVetorAlertas) then
        begin
          //localiza o Handle da janela iniciar
          BarraIniciar := FindWindow('Shell_TrayWnd', nil);

          //Pega o "retângulo" que envolve a barra e sua altura
          GetWindowRect(BarraIniciar, tmRect);
          tmAltura := tmRect.Bottom - tmRect.Top;

          frmAlerta := TfrmAlerta.Create(Self);

          with frmAlerta do
          begin
            vCascataLeft := vCascataLeft - vCascataLeftValor;
            Left := Screen.Width - ClientWidth - 5 + vCascataLeft;

            if tmRect.Top = -2 then
            begin
              tmAltura := 30;
            end;

            //Pega o top final
            vCascataTopo := vCascataTopo - vCascataTopoValor;
            xTop := Screen.Height - ClientHeight - tmAltura + vCascataTopo;

            //Pega o top inicial
            xIniTop := Screen.Height + ClientHeight + tmAltura;
            Top := xIniTop;

            retAviso.Text := vTabMensagem.FieldByName('Descricao').AsString;
            pubCodigoMensagem := vTabMensagem.FieldByName('CodigoMensagem').AsFloat;

            for vCnt := xIniTop downto xTop do
            begin
              Top := Top - 1;
              Show;
              Update;
              Application.ProcessMessages;
              Sleep(1);
              Application.ProcessMessages;
            end;

            // Incrementa o array que armazena as mensagens
            vNovoTamanho := High(pubVetorAlertas) + 2;

            SetLength(pubVetorAlertas, vNovoTamanho);

            pubVetorAlertas[vNovoTamanho - 1] := vTabMensagem.FieldByName('CodigoMensagem').AsFloat;
          end;

        end;

        vTabMensagem.Next;
      end;
    finally
      tmrAviso.Enabled := True;
    end;
  except

  end;

  // Sleep(3000);
  // Close;
  // FreeAndNil(fAlertaMsn);

end;

function TfmMenu.ExisteArray(Elemento: Real; Matriz: array of Real): Boolean;
var
  vCnt: Integer;
begin
  Result := False;

  for vCnt := 0 to High(pubVetorAlertas) do
  begin
    if Elemento = pubVetorAlertas[vCnt] then
    begin
      Result := True;
    end;
  end;

end;

procedure TfmMenu.stbMenuPanels5DblClick(Sender: TObject);
var
  vFM: TfmMensagens;
begin
  inherited;
  vFM := TfmMensagens.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.btn1Click(Sender: TObject);
var
  vTabProdutos, vInsercao: TZQuery;
  vProduto, vTipo: string;
  vEstoque: Real;
begin
  inherited;

  vTabProdutos := TZQuery.Create(nil);
  vTabProdutos.Connection := zcnConexao;

  vInsercao := TZQuery.Create(nil);
  vInsercao.Connection := zcnConexao;

  vTabProdutos.Close;
  vTabProdutos.SQL.Clear;
  //   vTabProdutos.SQL.Add('SELECT * FROM produtos WHERE CodigoProduto = '+QuotedStr(pCodigoProduto));
  vTabProdutos.SQL.Add(' select ');
  vTabProdutos.SQL.Add('       CodigoProduto, NomeTecnico ');
  vTabProdutos.SQL.Add('        from ');
  vTabProdutos.SQL.Add('            produtos ');
  vTabProdutos.SQL.Add('        where ');
  vTabProdutos.SQL.Add('            CodigoGrupo in (267 , 101) ');
  //   vTabProdutos.SQL.Add('            and CodigoProduto = ' +  QuotedStr(vProduto));
  vTabProdutos.Open;
  vTabProdutos.First;

  while not vTabProdutos.Eof do
  begin
    lblStatus.Caption := 'Status: ' + IntToStr(vTabProdutos.RecNo) + ' de ' + IntToStr(vTabProdutos.RecordCount);

    AtualizaEstoque(vTabProdutos.FieldByName('CodigoProduto').AsString);

    vProduto := vTabProdutos.FieldByName('CodigoProduto').AsString;

    tabAtualizaEstoque.Close;
    tabAtualizaEstoque.SQL.Clear;
    tabAtualizaEstoque.SQL.Add('SELECT * FROM produtos_status_estoque WHERE CodigoProduto = ' + QuotedStr(vTabProdutos.FieldByName('CodigoProduto').AsString));
    tabAtualizaEstoque.Open;

    if tabAtualizaEstoque.FieldByName('Estoque').AsFloat <> 0 then
    begin

      tabAtualizaEstoque.SQL.Clear;
      tabAtualizaEstoque.SQL.Add(' select ');
      tabAtualizaEstoque.SQL.Add('    (COALESCE(Producao, 0) + COALESCE(Entradas, 0) + COALESCE(AcertoEntradas, 0)) as TotalEntradas, ');
      tabAtualizaEstoque.SQL.Add('    (COALESCE(Pedidos, 0) + COALESCE(Saidas, 0) + COALESCE(AcertoSaidas, 0)) as TotalSaidas ');
      tabAtualizaEstoque.SQL.Add(' FROM ');
      tabAtualizaEstoque.SQL.Add('    (Select ');
      tabAtualizaEstoque.SQL.Add('        (SELECT ');
      tabAtualizaEstoque.SQL.Add('                    SUM(ordem_producao_produtos.Quantidade) AS Producao ');
      tabAtualizaEstoque.SQL.Add('                FROM ');
      tabAtualizaEstoque.SQL.Add('                    ordem_producao, ordem_producao_produtos ');
      tabAtualizaEstoque.SQL.Add('                WHERE ');
      tabAtualizaEstoque.SQL.Add('                    ordem_producao.OrdemProducao = ordem_producao_produtos.OrdemProducao AND  ');
      tabAtualizaEstoque.SQL.Add(' ordem_producao_produtos.CodigoProduto = ' + QuotedStr(vProduto) + '  AND');
      tabAtualizaEstoque.SQL.Add('                ordem_producao.DataTermino IS NOT NULL) AS Producao, ');
      tabAtualizaEstoque.SQL.Add('            (SELECT ');
      tabAtualizaEstoque.SQL.Add('                    SUM(Quantidade) AS Entradas ');
      tabAtualizaEstoque.SQL.Add('                FROM ');
      tabAtualizaEstoque.SQL.Add('                    produtos_movimentos ');
      tabAtualizaEstoque.SQL.Add('                WHERE ');
      tabAtualizaEstoque.SQL.Add('                    CodigoProduto = ' + QuotedStr(vProduto));
      tabAtualizaEstoque.SQL.Add('       and  TipoMovimento = 1) as Entradas, ');
      tabAtualizaEstoque.SQL.Add('            (SELECT ');
      tabAtualizaEstoque.SQL.Add('                    SUM(Quantidade) AS AcertoEntradas ');
      tabAtualizaEstoque.SQL.Add('                FROM ');
      tabAtualizaEstoque.SQL.Add('                    acertos_produtos ');
      tabAtualizaEstoque.SQL.Add('                WHERE ');
      tabAtualizaEstoque.SQL.Add('                    CodigoProduto = ' + QuotedStr(vProduto) + ' AND TipoAcerto = 1) as AcertoEntradas, ');
      //      tabAtualizaEstoque.SQL.Add('                    TipoAcerto = 1) as AcertoEntradas, ');
      tabAtualizaEstoque.SQL.Add('            (SELECT ');
      tabAtualizaEstoque.SQL.Add('                    SUM(pedidos_produtos.Quantidade) AS Pedidos ');
      tabAtualizaEstoque.SQL.Add('                FROM ');
      tabAtualizaEstoque.SQL.Add('                    pedidos ');
      tabAtualizaEstoque.SQL.Add('                LEFT JOIN pedidos_produtos ON pedidos_produtos.NPedido = pedidos.NPedido ');
      tabAtualizaEstoque.SQL.Add('                WHERE ');
      tabAtualizaEstoque.SQL.Add('                    pedidos_produtos.CodigoProduto = ' + QuotedStr(vProduto) + ' AND pedidos_produtos.DataProducao IS NOT NULL) as Pedidos, ');
      // tabAtualizaEstoque.SQL.Add('                    pedidos_produtos.DataProducao IS NOT NULL) as Pedidos, ');
      tabAtualizaEstoque.SQL.Add('            (SELECT ');
      tabAtualizaEstoque.SQL.Add('                    SUM(produtos_movimentos.Quantidade) AS Saidas ');
      tabAtualizaEstoque.SQL.Add('                FROM ');
      tabAtualizaEstoque.SQL.Add('                    produtos_movimentos ');
      tabAtualizaEstoque.SQL.Add('                WHERE ');
      tabAtualizaEstoque.SQL.Add('                    produtos_movimentos.CodigoProduto = ' + QuotedStr(vProduto) + ' AND TipoMovimento = 0) as Saidas, ');
      // tabAtualizaEstoque.SQL.Add('                    TipoMovimento = 0) as Saidas, ');
      tabAtualizaEstoque.SQL.Add('            (SELECT ');
      tabAtualizaEstoque.SQL.Add('                    SUM(Quantidade) AS AcertoSaidas ');
      tabAtualizaEstoque.SQL.Add('                FROM ');
      tabAtualizaEstoque.SQL.Add('                    acertos_produtos ');
      tabAtualizaEstoque.SQL.Add('                WHERE ');
      tabAtualizaEstoque.SQL.Add('                    CodigoProduto = ' + QuotedStr(vProduto) + ' AND TipoAcerto = 0) as AcertoSaidas ');
      // tabAtualizaEstoque.SQL.Add('                    TipoAcerto = 0) as AcertoSaidas ');
      tabAtualizaEstoque.SQL.Add('    From dual) As Q ');
      tabAtualizaEstoque.Open;

      vEstoque := 0;
      vTipo := '1';

      if tabAtualizaEstoque.FieldByName('TotalEntradas').AsFloat < tabAtualizaEstoque.FieldByName('TotalSaidas').AsFloat then
      begin
        // Entrada
        vTipo := '1';
        vEstoque := tabAtualizaEstoque.FieldByName('TotalSaidas').AsFloat - tabAtualizaEstoque.FieldByName('TotalEntradas').AsFloat;
      end
      else
      begin
        // Saída
        vTipo := '0';
        vEstoque := tabAtualizaEstoque.FieldByName('TotalEntradas').AsFloat - tabAtualizaEstoque.FieldByName('TotalSaidas').AsFloat;
      end;

      if tabAtualizaEstoque.FieldByName('TotalEntradas').AsFloat <> tabAtualizaEstoque.FieldByName('TotalSaidas').AsFloat then
      begin
        vInsercao.SQL.Clear;
        vInsercao.SQL.Add('    INSERT INTO acertos_produtos (Documento, CodigoProduto, Descricao, Quantidade, TipoAcerto) ');
        vInsercao.SQL.Add('    values  (' + FloatToStr(CodeGenerator('acertos_produtos', 'Documento')) + '  , ');
        vInsercao.SQL.Add('    ' + QuotedStr(vProduto) + ', ');
        vInsercao.SQL.Add('        Left( ' + QuotedStr(vTabProdutos.FieldByName('NomeTecnico').AsString) + ' ,60), ');
        vInsercao.SQL.Add('        ' + FloatToStr(vEstoque) + ', ');
        vInsercao.SQL.Add('        ' + vTipo + ' )');
        vInsercao.ExecSQL;

        AtualizaEstoque(vTabProdutos.FieldByName('CodigoProduto').AsString);

      end

    end;

    vTabProdutos.Next;
  end;

end;

procedure TfmMenu.btn2Click(Sender: TObject);
begin
  inherited;
  AtualizaEstoque(edtQtdEstoque.Text);
end;

procedure TfmMenu.btn3Click(Sender: TObject);
var
  vTabPedidos, vTabPedidosProdutos, vTabTemp, vTabAtualiza: TZQuery;
  vProduto, vTipo: string;
  vEstoque: Real;
begin
  inherited;
  Application.ProcessMessages;

  vTabPedidos := TZQuery.Create(nil);
  vTabPedidos.Connection := zcnConexao;

  vTabPedidos := TZQuery.Create(nil);
  vTabPedidos.Connection := zcnConexao;

  vTabAtualiza := TZQuery.Create(nil);
  vTabAtualiza.Connection := zcnConexao;

  vTabPedidosProdutos := TZQuery.Create(nil);
  vTabPedidosProdutos.Connection := zcnConexao;

  vTabPedidosProdutos.Close;
  vTabPedidosProdutos.SQL.Clear;
  vTabPedidosProdutos.SQL.Add(' select ID, CodigoProduto, NPedido         ');
  vTabPedidosProdutos.SQL.Add('        from                     ');
  vTabPedidosProdutos.SQL.Add('            pedidos_produtos     ');
  vTabPedidosProdutos.SQL.Add('        where                    ');
  vTabPedidosProdutos.SQL.Add('            DataProducao is null ');
  vTabPedidosProdutos.Open;
  vTabPedidosProdutos.First;

  while not vTabPedidosProdutos.Eof do
  begin

    Application.ProcessMessages;

    lblStatusAjustaEstoque.Caption := 'Status: ' + IntToStr(vTabPedidosProdutos.RecNo) + ' de ' + IntToStr(vTabPedidosProdutos.RecordCount);
    lblStatusAjustaEstoque.Update;

    vTabAtualiza.Close;
    vTabPedidos.SQL.Clear;
    vTabPedidos.SQL.Add(' select DataProducao ');
    vTabPedidos.SQL.Add('        from ');
    vTabPedidos.SQL.Add('            pedidos ');
    vTabPedidos.SQL.Add('        where ');
    vTabPedidos.SQL.Add('            NPedido = ' + QuotedStr(vTabPedidosProdutos.FieldByName('NPedido').AsString));
    vTabPedidos.Open;
    vTabPedidos.First;

    if not vTabPedidos.FieldByName('DataProducao').IsNull then
    begin

      // altera
      vTabAtualiza.Close;
      vTabAtualiza.SQL.Clear;
      vTabAtualiza.SQL.Add(' select * from pedidos_produtos where ID = ' + QuotedStr(vTabPedidosProdutos.FieldByName('ID').AsString));
      vTabAtualiza.Open;
      vTabAtualiza.First;

      mmoHistorico.Lines.Add(' select * from pedidos_produtos where ID = ' + QuotedStr(vTabPedidosProdutos.FieldByName('ID').AsString));

      vTabAtualiza.Edit;
      vTabAtualiza.FieldByName('DataProducao').AsDateTime := vTabPedidos.FieldByName('DataProducao').AsDateTime;
      vTabAtualiza.Post;
      vTabAtualiza.ApplyUpdates;

      AtualizaEstoque(vTabAtualiza.FieldByName('CodigoProduto').AsString);

    end;

    vTabPedidosProdutos.Next;

  end;

end;

procedure TfmMenu.btnAtualizarTodoEstoqueClick(Sender: TObject);
begin
  inherited;

  tabProduto.Close;
  tabProduto.SQL.Add('SELECT * FROM produtos');
  tabProduto.Open;
  tabProduto.First;

  mmoAtualizarTodoEstoque.Lines.Clear;

  while not tabProduto.Eof do
  begin
    Application.ProcessMessages;

    lblAtualizarTodoEstoque.Caption := 'Status: ' + IntToStr(tabProduto.RecNo) + ' de ' + IntToStr(tabProduto.RecordCount);
    mmoAtualizarTodoEstoque.Lines.Add(tabProduto.FieldByName('CodigoProduto').AsString);

    AtualizaEstoque(tabProduto.FieldByName('CodigoProduto').AsString);

    tabProduto.Next;

  end;

end;

procedure TfmMenu.btnCalcularClick(Sender: TObject);
begin
  inherited;
  CalculaEstoque(edtQtdEstoque.Text)
end;

procedure TfmMenu.mniSolicitacoesMudancaClick(Sender: TObject);
var
  vFm: TfrmSolicitacaoMudanca;
begin
  inherited;

  vFm := TfrmSolicitacaoMudanca.Create(Self);

  vFm.Show;
end;

procedure TfmMenu.aptErrosException(Sender: TObject; E: Exception);
var
  mensagem: string;
  Pos1, Pos2: integer;
begin
  if Pos(UpperCase('is not a valid date'), UpperCase(E.Message)) <> 0 then
    mensagem := 'Data inválida, proceda a correção.'
  else if Pos(UpperCase('must have a value'), UpperCase(E.Message)) <> 0 then
  begin
    Pos1 := Pos('''', E.Message);
    mensagem := E.Message;
    Delete(mensagem, Pos1, 1);
    Pos2 := Pos('''', mensagem);
    mensagem := copy(E.Message, Pos1 + 1, Pos2 - Pos1);
    mensagem := 'É obrigatório o preenchimento do campo ' + mensagem + '!';
  end
  else if Pos(UpperCase('lost connection'), UpperCase(E.Message)) <> 0 then
  begin
    mensagem := 'Perdida a conexão com o servidor';

    StatusDesconectado;

    pnlReconectar.Left := fmMenu.Width div 2 - pnlReconectar.Width div 2;
    pnlReconectar.Top := fmMenu.Height div 2 - pnlReconectar.Height div 2;
    pnlReconectar.Visible := True;
  end
  else if Pos(UpperCase('mysql server has gone away'), UpperCase(E.Message)) <> 0 then
  begin
    mensagem := 'Servidor não responde';

    StatusDesconectado;

    pnlReconectar.Left := fmMenu.Width div 2 - pnlReconectar.Width div 2;
    pnlReconectar.Top := fmMenu.Height div 2 - pnlReconectar.Height div 2;
    pnlReconectar.Visible := True;
  end
  else if Pos(UpperCase('key violation'), UpperCase(E.Message)) <> 0 then
    mensagem := 'Houve violação de Chave. Registro já incluido.'
  else if Pos(UpperCase('is not a valid time'), UpperCase(E.Message)) <> 0 then
    mensagem := 'Hora inválida, proceda a correção.'
  else if Pos(UpperCase('is not a valid float'), UpperCase(E.Message)) <> 0 then
  begin
    Pos1 := Pos('''', E.Message);
    mensagem := E.Message;
    Delete(mensagem, Pos1, 1);
    Pos2 := Pos('''', mensagem);
    mensagem := copy(E.Message, Pos1 + 1, Pos2 - Pos1);
    mensagem := 'O valor ' + mensagem + ' não é válido.';
  end
  else if Pos(UpperCase('field value required'), UpperCase(E.Message)) <> 0 then
  begin
    Pos1 := Pos('column ', E.Message) + 7;
    Pos2 := Pos(',', E.Message);
    mensagem := copy(E.Message, Pos1, Pos2 - Pos1);
    mensagem := 'Campo ' + mensagem + ' deve ser preenchido!';
  end
  else if Pos(UpperCase('ATTEMPT TO STORE DUPLICATE VALUE'), UpperCase(E.Message)) <> 0 then
    mensagem := 'Não é permitido valor duplicado. '
  else if Pos(UpperCase('FOREIGN KEY'), UpperCase(E.Message)) <> 0 then
    mensagem := 'Operação não permitida, registro vinculado em outra tabela está faltando.'
  else if Pos('VIOLATION OF PRIMARY OR UNIQUE KEY CONSTRAINT', UpperCase(E.Message)) <> 0 then
    mensagem := 'Registro Duplicado' + #13#10 + Copy(UpperCase(E.Message), Pos('VIOLATION OF PRIMARY OR UNIQUE KEY CONSTRAINT', UpperCase(E.Message)) + 47, 100)
  else if (Pos(UpperCase('MUST APPLY UPDATES BEFORE REFRESHING DATA'),
    UpperCase(E.Message)) <> 0) then
    mensagem := 'É necessário aplicara as alterações antes de atualizar os dados.'
  else if (Pos(UpperCase('INVALID INPUT VALUE'), UpperCase(E.Message)) <> 0) then
    mensagem := 'Valor digitado não é valido conforme a máscara.'
  else if (Pos(UpperCase('CANNOT DELETE MASTER'), UpperCase(E.Message)) <> 0) then
    mensagem := 'Apague todas as informações relacionadas a esse registro antes de apagar.'
  else if (Pos(UpperCase('IS NOT A VALID INTEGER VALUE'), UpperCase(E.Message)) <> 0) then
    mensagem := 'Não é um valor inteiro válido para o campo.'
  else if (Pos(UpperCase('JPEG ERROR #42'), UpperCase(E.Message)) <> 0) then
    mensagem := 'Erro ao obter a imagem.'
  else if (Pos(UpperCase('CONNECTION CLOSED GRACEFULLY'), UpperCase(E.Message)) <> 0) then
    mensagem := 'A conexão com o banco de dados foi perdida. O aplicativo será finalizado'
  else if (Pos(UpperCase('SOFTWARE CAUSED CONNECTION'), UpperCase(E.Message)) <> 0) then
    mensagem := 'A conexão com o banco de dados foi perdida. O aplicativo será finalizado'
  else if (Pos(UpperCase('ERROR WHILE TRYING TO OPEN FILE'), UpperCase(E.Message)) <> 0) then
    mensagem := 'O banco de dados está em uso por outra aplicação. O aplicativo será finalizado.'
  else if (Pos(UpperCase('FILE WAS NOT FOUND'), UpperCase(E.Message)) <> 0) then
  begin
    Abort;
    Exit;
  end
  else
    mensagem := 'Ocorreu o seguinte erro: ' + #13 + UpperCase(E.Message);

  // Application.MessageBox(PChar(String(mensagem) + #13 + STring(UpperCase(E.Message)) ), 'Erro', MB_OK + MB_ICONERROR);
  Application.MessageBox(PChar(string(mensagem)), 'Erro', MB_OK + MB_ICONERROR);

  if (Pos(UpperCase('CONNECTION CLOSED GRACEFULLY'), UpperCase(E.Message)) <> 0)
    or
    (Pos(UpperCase('SOFTWARE CAUSED CONNECTION'), UpperCase(E.Message)) <> 0)
    or
    (Pos(UpperCase('ERROR WHILE TRYING TO OPEN FILE'), UpperCase(E.Message)) <> 0) then
  begin
    Application.Terminate;
  end;

  Abort;
end;

procedure TfmMenu.btn4Click(Sender: TObject);
begin
  inherited;

  StatusReconectando;

  if TestarConexao then
  begin
    zcnConexao.Connected := False;
    zcnConexao.Connected := True;

    ShowMessage('Conexão restabelecida com o servidor');

    StatusConectado;

    pnlReconectar.Visible := False;
  end
  else
  begin
    StatusDesconectado;

    ShowMessage('Servidor não encontrado');

  end;

end;

procedure TfmMenu.StatusConectado;
begin
  stbMenu.Panels[2].Text := 'Conectado a ' + GetIPFromHost(pubHostConfig.Host) + ':' + IntToStr(pubHostConfig.Port);
  stbMenu.Panels[2].PanelStyle.Font.Color := clGreen;
end;

procedure TfmMenu.StatusDesconectado;
begin
  stbMenu.Panels[2].Text := 'Desconectado de ' + pubHostConfig.Host;
  stbMenu.Panels[2].PanelStyle.Font.Color := clRed;
  stbMenu.Refresh;
end;

procedure TfmMenu.StatusReconectando;
begin
  stbMenu.Panels[2].Text := 'Tentando reconectar a ' + pubHostConfig.Host;
  stbMenu.Panels[2].PanelStyle.Font.Color := clBlue;
  stbMenu.Refresh;

end;

procedure TfmMenu.btnAdaptarNFEClick(Sender: TObject);
var
  vTabXML, vTabFaturamento: TZQuery;
  vProduto, vTipo, vArquivoXml, vArquivoPdf, vCstat, vHorario: string;
  vEstoque: Real;
  vXMLDoc: TXMLDocument;
  NodeRec0, NodeRec1, NodeRec2, NodeRec3, NodeRec4, NodeRec5, NodeRec6,
    NodeRec7: IXMLNode;
  NodeInfProt, NodeDet, NodeProduto, NodePrim, NodePai, NodeImposto, NodeICMS,
    NodeICMSX, NodeObsCont: IXMLNode;
begin
  inherited;
  vTabXML := TZQuery.Create(nil);
  vTabXML.Connection := zcnConexao;

  vTabFaturamento := TZQuery.Create(nil);
  vTabFaturamento.Connection := zcnConexao;

  vTabXML.Close;
  vTabXML.SQL.Clear;
  vTabXML.SQL.Add(' select NotaFiscal, Serie, TipoNota, CodigoEmpresa, Cancelada, XML ');
  vTabXML.SQL.Add('   from xml_nfe_clientes ');
  vTabXML.Open;
  vTabXML.First;

  while not vTabXML.Eof do
  begin
    Application.ProcessMessages;

    lblStatusNFE.Caption := 'Status: ' + IntToStr(vTabXML.RecNo) + ' de ' + IntToStr(vTabXML.RecordCount);
    lblStatusNFE.Refresh;

    vTabFaturamento.Close;
    vTabFaturamento.SQL.Clear;
    vTabFaturamento.SQL.Add(' SELECT * ');
    vTabFaturamento.SQL.Add('   FROM faturamento');
    vTabFaturamento.SQL.Add('  WHERE Fatura = ' + QuotedStr(vTabXML.FieldByName('NotaFiscal').AsString));
    vTabFaturamento.SQL.Add('    AND Serie = ' + QuotedStr(vTabXML.FieldByName('Serie').AsString));
    vTabFaturamento.SQL.Add('    AND CodigoEmpresa = ' + QuotedStr(vTabXML.FieldByName('CodigoEmpresa').AsString));
    vTabFaturamento.SQL.Add('    AND TipoNota = ' + QuotedStr(vTabXML.FieldByName('TipoNota').AsString));
    vTabFaturamento.Open;

    if vTabFaturamento.RecordCount = 1 then
    begin

      vHorario := FormatDateTime('hhnnss', Now);
      vArquivoXml := GetPathTempWindow + 're_xml_' + vHorario + '.xml';
      vArquivoPdf := GetPathTempWindow + 're_pdf_' + vHorario + '.pdf';

      if FileExists(vArquivoXml) then
        DeleteFile(vArquivoXml);
      if FileExists(vArquivoPdf) then
        DeleteFile(vArquivoPdf);

      (vTabXML.FieldByName('XML') as TBlobField).SaveToFile(vArquivoXml);

      if FileExists(vArquivoXml) then
      begin
        vXMLDoc := TXMLDocument.Create(self);
        vXMLDoc.LoadFromFile(vArquivoXml);

        NodeRec1 := vXMLDoc.DocumentElement;

        // Protocolo de Autorização de Uso
        NodeRec0 := NodeRec1.ChildNodes.FindNode('protNFe');

        NodeInfProt := NodeRec0.ChildNodes.FindNode('infProt');
        vCstat := NodeInfProt.ChildNodes['cStat'].Text;

        vTabFaturamento.Edit;
        vTabFaturamento.FieldByName('STATUS_TRANSMITIDA').AsString := 'S';
        vTabFaturamento.FieldByName('STATUS_EMAIL').AsString := 'S';
        vTabFaturamento.FieldByName('CHAVE_ACESSO_NFE').AsString := Trim(NodeInfProt.ChildNodes['chNFe'].Text);
        vTabFaturamento.FieldByName('PROTOCOLO_NFE').AsString := NodeInfProt.ChildNodes['nProt'].Text;
        vTabFaturamento.Post;
        vTabFaturamento.ApplyUpdates;

      end;

    end;

    vTabXML.Next;
  end;

end;

procedure TfmMenu.mniResumoPedidosClick(Sender: TObject);
var
  vRT: TrtResumoPedido;
begin
  inherited;
  vRT := TrtResumoPedido.Create(Self);
  vRT.Show;
end;

procedure TfmMenu.AppEventsHint(Sender: TObject);
begin
  inherited;
  DisplayHint(self);
end;

procedure TfmMenu.mniGrades1Click(Sender: TObject);
var vFM : TfmGrades;
begin
   vFM:=TfmGrades.Create(Self);
   vFM.Show;
end;


procedure TfmMenu.mniLinhas1Click(Sender: TObject);
var vFM : TfmLinhas;
begin
   vFM:=TfmLinhas.Create(Self);
   vFM.Show;
end;

procedure TfmMenu.mniColeo1Click(Sender: TObject);
var vFM : TfmGenericos;
begin
  inherited;
  pubTituloTela:='Coleções';
  pubTipoTela:='29';
  vFM:=TfmGenericos.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.mniSubGrupodeProdutos1Click(Sender: TObject);
var
  vFM: TfmSubGrupo;
begin
  vFM := TfmSubGrupo.Create(Self);
  vFM.Show;
end;

procedure TfmMenu.FormResize(Sender: TObject);
begin
  inherited;
  imgLogo.Left := Self.Width - imgLogo.Width - 10;
  imgLogo.Top := 0;
end;

procedure TfmMenu.mniao1Click(Sender: TObject);
var
  vFM: TfmLoteProducao;
begin
  vFM := TfmLoteProducao.Create(Self);
  vFM.Show;
end;

end.


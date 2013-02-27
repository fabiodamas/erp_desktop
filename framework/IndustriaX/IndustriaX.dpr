program IndustriaX;

uses
  MidasLib,
  Forms,
  uMenu in 'uMenu.pas' {fmMenu},
  uUsuarios in 'uUsuarios.pas' {fmUsuarios},
  uConfiguracaoBancoDados in 'uConfiguracaoBancoDados.pas' {fmConfiguracaoBancoDados},
  uLogin in '..\..\forms\logins\uLogin.pas' {fmLogin},
  uProdutos in 'uProdutos.pas' {fmProdutos},
  uMoldes in 'uMoldes.pas' {fmMoldes},
  uGenericos in 'uGenericos.pas' {fmGenericos},
  uClientes in 'uClientes.pas' {fmClientes},
  uCadastrarImagem in '..\..\forms\imagens\uCadastrarImagem.pas' {fmCadastrarImagem},
  uContatos in 'uContatos.pas' {fmContatos},
  uEmpresas in 'uEmpresas.pas' {fmEmpresas},
  uFuncionarios in 'uFuncionarios.pas' {fmFuncionarios},
  uUnidades in 'uUnidades.pas' {fmUnidades},
  uFormasPagto in 'uFormasPagto.pas' {fmFormasPagto},
  uTiposTabelasPrecos in 'uTiposTabelasPrecos.pas' {fmTiposTabelasPrecos},
  uCfop in 'uCfop.pas' {fmCfop},
  uCentroCusto in 'uCentroCusto.pas' {fmCentroCusto},
  uFornecedores in 'uFornecedores.pas' {fmFornecedores},
  uAtivos in 'uAtivos.pas' {fmAtivos},
  uTransportadoras in 'uTransportadoras.pas' {fmTransportadoras},
  uRegioes in 'uRegioes.pas' {fmRegioes},
  uSetorTrabalho in 'uSetorTrabalho.pas' {fmSetorTrabalho},
  uAproveitamento in 'uAproveitamento.pas' {fmAproveitamento},
  uLocalizarClientes in 'uLocalizarClientes.pas' {fmLocalizarClientes},
  gInjecoesClientes in 'gInjecoesClientes.pas' {gfInjecoesClientes},
  uPrecos in 'uPrecos.pas' {fmPrecos},
  uAproveitamentoLote in 'uAproveitamentoLote.pas' {fmAproveitamentoLote},
  uEnvioEmailLote in 'uEnvioEmailLote.pas' {fmEnvioEmailLote},
  uFormBase in '..\..\forms\abstratos\uFormBase.pas' {fmFormBase},
  uFormBaseConfig in '..\..\forms\abstratos\uFormBaseConfig.pas' {fmFormBaseConfig},
  uFormBaseAvancado in '..\..\forms\abstratos\uFormBaseAvancado.pas' {fmFormBaseAvancado},
  uFormBaseMenu in '..\..\forms\abstratos\uFormBaseMenu.pas' {fmFormBaseMenu},
  uFormBaseCadastro in '..\..\forms\cadastros\uFormBaseCadastro.pas' {fmFormBaseCadastro},
  uFuncoes in '..\..\funcoes\uFuncoes.pas',
  uFormBaseRelatorio in '..\..\forms\relatorios\uFormBaseRelatorio.pas' {fmFormBaseRelatorio},
  uConstantes in 'uConstantes.pas',
  uEnvioEmailIndividual in 'uEnvioEmailIndividual.pas' {fmEnvioEmailIndividual},
  uOrcamentosEnviadosEmail in 'uOrcamentosEnviadosEmail.pas' {fmOrcamentosEnviadosEmail},
  uOrcamentosVendas in 'uOrcamentosVendas.pas' {fmOrcamentosVendas},
  uPedidosVenda in 'uPedidosVenda.pas' {fmPedidosVenda},
  uFaturamento in 'uFaturamento.pas' {fmFaturamento},
  uRequisicaoProdutos in 'uRequisicaoProdutos.pas' {fmRequisicaoProdutos},
  uTabelaCorreio in 'uTabelaCorreio.pas' {fmTabelaCorreio},
  uRequisicaoCompras in 'uRequisicaoCompras.pas' {fmRequisicaoCompras},
  uConsultaRequisicaoCompras in 'uConsultaRequisicaoCompras.pas' {fmConsultaRequisicaoCompras},
  uOrcamentoCompras in 'uOrcamentoCompras.pas' {fmOrcamentoCompras},
  uConsultaOrcamentosCompras in 'uConsultaOrcamentosCompras.pas' {fmConsultaOrcamentosCompras},
  uPedidosCompra in 'uPedidosCompra.pas' {fmPedidosCompra},
  uOrdemProducaoEntrada in 'uOrdemProducaoEntrada.pas' {fmOrdemProducaoEntrada},
  uChecaConexaoRede in '..\..\forms\configuracoes\uChecaConexaoRede.pas' {fmChecaConexaoRede},
  uLocalizarGenerico in '..\..\forms\buscas\uLocalizarGenerico.pas' {fmLocalizarGenerico},
  uTipos in '..\..\classes\uTipos.pas',
  uCidades in '..\..\forms\comum\uCidades.pas' {fmCidades},
  uPaises in '..\..\forms\comum\uPaises.pas' {fmPaises},
  uCadastroEnderecos in '..\..\forms\comum\uCadastroEnderecos.pas' {fmCadastroEnderecos},
  uConfiguracaoSistema in 'uConfiguracaoSistema.pas' {fmConfiguracaoSistema},
  uCargos in 'uCargos.pas' {fmCargos},
  uLocalizarProdutos in 'uLocalizarProdutos.pas' {fmLocalizarProdutos},
  rRotulosClientes in 'rRotulosClientes.pas' {rtRotulosClientes},
  uLocalizarContatos in 'uLocalizarContatos.pas' {fmLocalizarContatos},
  rRotulosContatos in 'rRotulosContatos.pas' {rtRotulosContatos},
  rRotulosFornecedor in 'rRotulosFornecedor.pas' {rtRotulosFornecedor},
  uAuditoria in '..\..\classes\uAuditoria.pas',
  uUsuariosLogados in '..\..\forms\configuracoes\uUsuariosLogados.pas' {fmUsuariosLogados},
  uAcertoEstoque in 'uAcertoEstoque.pas' {fmAcertoEstoque},
  rOrdensProducaoPendentes in 'rOrdensProducaoPendentes.pas' {rtOrdensProducaoPendentes},
  rOrdensProducaoEmissao in 'rOrdensProducaoEmissao.pas' {rtOrdensProducaoEmissao},
  rReposicaoEstoque in 'rReposicaoEstoque.pas' {rtReposicaoEstoque},
  rEmissaoEstoque in 'rEmissaoEstoque.pas' {rtEmissaoEstoque},
  rReceberEmitidos in 'rReceberEmitidos.pas' {rtReceberEmitidos},
  uBancos in 'uBancos.pas' {fmBancos},
  uGerarPendentesTitulos in 'uGerarPendentesTitulos.pas' {fmGerarPendentesTitulos},
  uTitulosReceber in 'uTitulosReceber.pas' {fmTitulosReceber},
  rEmissaoCentroCusto in 'rEmissaoCentroCusto.pas' {rtEmissaoCentroCusto},
  rEmissaoCFOP in 'rEmissaoCFOP.pas' {rtEmissaoCFOP},
  rEmissaoClientes in 'rEmissaoClientes.pas' {rtEmissaoClientes},
  rEmissaoContatos in 'rEmissaoContatos.pas' {rtEmissaoContatos},
  rEmissaoSetores in 'rEmissaoSetores.pas' {rtEmissaoSetores},
  rEmissaoSetorClientes in 'rEmissaoSetorClientes.pas' {rtEmissaoSetorClientes},
  rEmissaoFormasPagto in 'rEmissaoFormasPagto.pas' {rtEmissaoFormasPagto},
  rEmissaoProdutos in 'rEmissaoProdutos.pas' {rtEmissaoProdutos},
  rEmissaoFaturamento in 'rEmissaoFaturamento.pas' {rtEmissaoFaturamento},
  rEmissaoOrcamentos in 'rEmissaoOrcamentos.pas' {rtEmissaoOrcamentos},
  rEmissaoTabelaPrecos in 'rEmissaoTabelaPrecos.pas' {rtEmissaoTabelaPrecos},
  uLocalizarTitulosReceber in 'uLocalizarTitulosReceber.pas' {fmLocalizarTitulosReceber},
  rReceberAberto in 'rReceberAberto.pas' {rtReceberAberto},
  rReceberRecebidos in 'rReceberRecebidos.pas' {rtReceberRecebidos},
  rMateriaPrima in 'rMateriaPrima.pas' {rtMateriaPrima},
  rInventarioProdutos in 'rInventarioProdutos.pas' {rtInventarioProdutos},
  rPedidosRecebidos in 'rPedidosRecebidos.pas' {rtPedidosRecebidos},
  uTitulosPagar in 'uTitulosPagar.pas' {fmTitulosPagar},
  uLocalizarTitulosPagar in 'uLocalizarTitulosPagar.pas' {fmLocalizarTitulosPagar},
  uNotaFiscalPaulista in 'uNotaFiscalPaulista.pas' {fmNotaFiscalPaulista},
  uNotaFiscalEletronica in 'uNotaFiscalEletronica.pas' {fmNotaFiscalEletronica},
  uNFeEnvioEmail in 'uNFeEnvioEmail.pas' {fmNFeEnvioEmail},
  rPagarEmitidos in 'rPagarEmitidos.pas' {rtPagarEmitidos},
  rPagarAberto in 'rPagarAberto.pas' {rtPagarAberto},
  rPagarPagos in 'rPagarPagos.pas' {rtPagarPagos},
  uLocalizarClientesContatos in 'uLocalizarClientesContatos.pas' {fmLocalizarClientesContatos},
  rRequisicaoCompras in 'rRequisicaoCompras.pas' {rtRequisicaoCompras},
  uReceberPedidoCompra in 'uReceberPedidoCompra.pas' {fmReceberPedidoCompra},
  rEnvioEmailOrcamento in 'rEnvioEmailOrcamento.pas' {rtEnvioEmailOrcamentos},
  rPedidoProducao in 'rPedidoProducao.pas' {rtPedidoProducao},
  rPedidoAdministracao in 'rPedidoAdministracao.pas' {rtPedidoAdministracao},
  uReEmissaoNFe in 'uReEmissaoNFe.pas' {fmReEmissaoNFe},
  rPedidoExpedicao in 'rPedidoExpedicao.pas' {rtPedidoExpedicao},
  rPedidoProducaoExpedicao in 'rPedidoProducaoExpedicao.pas' {rtPedidoProducaoExpedicao},
  uBaixaProducao in 'uBaixaProducao.pas' {fmBaixaProducao},
  uGerarPackingList in 'uGerarPackingList.pas' {fmGerarPackingList},
  rPackingList in 'rPackingList.pas' {rtPackingList},
  uGerarFaturamento in 'uGerarFaturamento.pas' {fmGerarFaturamento},
  uPedidosParticipacaoVendedores in 'uPedidosParticipacaoVendedores.pas' {fmPedidosParticipacaoVendedores},
  uRastrearEstoque in 'uRastrearEstoque.pas' {fmRastrearEstoque},
  uLocalizarPedidos in 'uLocalizarPedidos.pas' {fmLocalizarPedidos},
  rPedidosRecibo in 'rPedidosRecibo.pas' {rtPedidosRecibo},
  uObservacoes in 'uObservacoes.pas' {fmObservacoes},
  rPedidosPendentes in 'rPedidosPendentes.pas' {rtPedidosPendentes},
  rPedidosProdutos in 'rPedidosProdutos.pas' {rtPedidosProdutos},
  rPedidosRealizados in 'rPedidosRealizados.pas' {rtPedidosRealizados},
  uLocalizarTitulosRecebidos in 'uLocalizarTitulosRecebidos.pas' {fmLocalizarTitulosRecebidos},
  rAproveitamento in 'rAproveitamento.pas' {rtAproveitamento},
  uLocalizarTitulosPagos in 'uLocalizarTitulosPagos.pas' {fmLocalizarTitulosPagos},
  uLocalizarFaturamento in 'uLocalizarFaturamento.pas' {fmLocalizarFaturamento},
  uLocalizarCentroCusto in 'uLocalizarCentroCusto.pas' {fmLocalizarCentroCusto},
  gInjecoesDia in 'gInjecoesDia.pas' {gfInjecoesDia},
  uAlteracoesCodigos in 'uAlteracoesCodigos.pas' {fmAlteracoesCodigos},
  rPedidosOscilacoes in 'rPedidosOscilacoes.pas' {rtPedidosOscilacoes},
  uBaixaMultiplaTitulos in 'uBaixaMultiplaTitulos.pas' {fmBaixaMultiplaTitulos},
  rProdutosRealizados in 'rProdutosRealizados.pas' {rtProdutosRealizados},
  uLocalizarOrcamentos in 'uLocalizarOrcamentos.pas' {fmLocalizarOrcamentos},
  uIndicesFinanceiros in 'uIndicesFinanceiros.pas' {fmIndicesFinanceiros},
  rTopProdutosVendidos in 'rTopProdutosVendidos.pas' {rtTopProdutosVendidos},
  uLogUsuarios in '..\..\forms\configuracoes\uLogUsuarios.pas' {fmLogUsuarios},
  uHorariosTrabalho in 'uHorariosTrabalho.pas' {fmHorariosTrabalho},
  uGerarParticipacaoVendedores in 'uGerarParticipacaoVendedores.pas' {fmGerarParticipacaoVendedores},
  rFichaProducao in 'rFichaProducao.pas' {rtFichaProducao},
  uLocalizarPedidosCompras in 'uLocalizarPedidosCompras.pas' {fmLocalizarPedidosCompra},
  uPainelProducao in 'uPainelProducao.pas' {fmPainelProducao},
  gVendasPorEstado in 'gVendasPorEstado.pas' {gfVendasPorEstado},
  uContasBancarias in 'uContasBancarias.pas' {fmContasBancarias},
  uEmissaoBoletoBancario in 'uEmissaoBoletoBancario.pas' {fmEmissaoBoletoBancario},
  uRetornoBancoBrasil in 'uRetornoBancoBrasil.pas' {fmRetornoBancoBrasil},
  uRemessaBancoBrasil in 'uRemessaBancoBrasil.pas' {fmRemessaBancoBrasil},
  uIndicesCotacoes in 'uIndicesCotacoes.pas' {fmIndicesCotacoes},
  uLocalizarFuncionarios in 'uLocalizarFuncionarios.pas' {fmLocalizarFuncionarios},
  uFuncionariosDigital in 'uFuncionariosDigital.pas' {fmFuncionariosDigital},
  uLeituraDigital in 'uLeituraDigital.pas' {fmLeituraDigital},
  uLocalizarCFOP in 'uLocalizarCFOP.pas' {fmLocalizarCFOP},
  uRastreamentoPedido in 'uRastreamentoPedido.pas' {fmRastreamentoPedido},
  uCores in 'uCores.pas' {fmCores},
  uGerarProdutos in 'uGerarProdutos.pas' {fmGerarProdutos},
  uPerfilUsuarios in '..\..\forms\configuracoes\uPerfilUsuarios.pas' {fmPerfilUsuarios},
  gVendasAnualVendedores in 'gVendasAnualVendedores.pas' {gfVendasAnualVendedores},
  gVendasAnual in 'gVendasAnual.pas' {gfVendasAnual},
  uEnderecos in '..\..\classes\uEnderecos.pas',
  uProcessoNFe in 'uProcessoNFe.pas' {fmProcessoNFe},
  uDanfe in 'uDanfe.pas' {fmDanfe},
  uTriplicata in 'uTriplicata.pas' {fmTriplicata},
  rFichaTecnica in 'rFichaTecnica.pas' {rtFichaTecnica},
  uEtiquetasProdutos_TLP2844 in 'uEtiquetasProdutos_TLP2844.pas' {fmEtiquetasProdutos_TLP2844},
  rPedidosReceber in 'rPedidosReceber.pas' {rtPedidosReceber},
  rEtiquetasProdutos in 'rEtiquetasProdutos.pas' {rtEtiquetasProdutos},
  rRotuloLote in 'rRotuloLote.pas' {rtRotuloLote},
  HTMLHelpViewer in 'HTMLHelpViewer.pas',
  uHelpKeys in 'uHelpKeys.pas',
  uAlerta in 'uAlerta.pas' {frmAlerta},
  uMensagens in 'uMensagens.pas' {fmMensagens},
  uFinalizarPedido in 'uFinalizarPedido.pas' {frmFinalizarPedido},
  uFinaPediRelaExpe in 'uFinaPediRelaExpe.pas' {frmFinaPediRelaExpe},
  uFinaPediRelaAdmn in 'uFinaPediRelaAdmn.pas' {frmFinaPediRelaAdmn},
  uLocalizarOrdemProducao in 'uLocalizarOrdemProducao.pas' {fmLocalizarOrdemProducao},
  uSolicitacaoMudanca in 'uSolicitacaoMudanca.pas' {frmSolicitacaoMudanca},
  uStatusNotaFiscalEletronica in 'uStatusNotaFiscalEletronica.pas' {frmStatusNotaFiscalEletronica},
  rResumoPedido in 'rResumoPedido.pas' {rtResumoPedido},
  uConectando in 'uConectando.pas' {fmConectando},
  uDebugador in 'uDebugador.pas' {fmDebugador},
  uProducaoMediaHora in 'uProducaoMediaHora.pas' {fmProducaoMediaHora},
  uLinhas in 'uLinhas.pas' {fmLinhas},
  uGrades in 'uGrades.pas' {fmGrades},
  uSubGrupo in 'uSubGrupo.pas' {fmSubGrupo},
  uTutorial in 'uTutorial.pas' {fmTutorial},
  uComprar in 'uComprar.pas' {fmComprar},
  uLoteProducao in 'uLoteProducao.pas' {fmLoteProducao},
  uLocalizarLoteProducao in 'uLocalizarLoteProducao.pas' {fmLocalizarLoteProducao};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'SoftwarePI';
  Application.CreateForm(TfmMenu, fmMenu);
  Application.CreateForm(TfrmStatusNotaFiscalEletronica, frmStatusNotaFiscalEletronica);
  Application.CreateForm(TfmTutorial, fmTutorial);
  Application.Run;
end.
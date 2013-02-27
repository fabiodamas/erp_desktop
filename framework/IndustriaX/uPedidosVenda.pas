unit uPedidosVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, Menus, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Buttons, ExtCtrls, StdCtrls, Mask, ToolEdit,
  RXDBCtrl, DBCtrls, ComCtrls, Grids, DBGrids, CurrEdit, DBClient, Math,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxSpinEdit, cxDBEdit,
  cxGroupBox, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid;

type
  TfmPedidosVenda = class(TfmFormBaseCadastro)
    edtPedido: TEdit;
    Label1: TLabel;
    edtDataPedido: TDBDateEdit;
    Label2: TLabel;
    edtHoraPedido: TDBEdit;
    Label3: TLabel;
    edtOrcamento: TDBEdit;
    Label4: TLabel;
    edtDataPrevisao: TDBDateEdit;
    Label5: TLabel;
    edtDataProducao: TDBDateEdit;
    Label6: TLabel;
    edtDataEntrega: TDBDateEdit;
    Label7: TLabel;
    edtCodigoCliente: TDBEdit;
    Label8: TLabel;
    edtNomeCliente: TDBEdit;
    Label9: TLabel;
    btnClientesLocalizar: TBitBtn;
    edtRegimeTributario: TDBEdit;
    Label10: TLabel;
    edtContato: TDBComboBox;
    Label11: TLabel;
    edtCodigoResponsavel: TDBEdit;
    Label12: TLabel;
    edtResponsavel: TDBLookupComboBox;
    edtCodigoEmpresa: TDBEdit;
    Label13: TLabel;
    edtEmpresa: TDBLookupComboBox;
    edtTabelaPreco: TDBLookupComboBox;
    Label14: TLabel;
    edtNaturezaOperacao: TDBLookupComboBox;
    edtCsosn: TDBComboBox;
    Label16: TLabel;
    edtTransportadora: TDBLookupComboBox;
    Label17: TLabel;
    pgcPedidos: TPageControl;
    tbsProdutos: TTabSheet;
    tbsVenctos: TTabSheet;
    edtValorProdutos: TDBEdit;
    Label23: TLabel;
    edtValorFrete: TDBEdit;
    Label24: TLabel;
    edtValorAcrescimo: TDBEdit;
    Label25: TLabel;
    edtValorSeguro: TDBEdit;
    Label26: TLabel;
    edtValorDesconto: TDBEdit;
    Label27: TLabel;
    edtPercDesconto: TDBEdit;
    Label28: TLabel;
    edtValorTotal: TDBEdit;
    Label29: TLabel;
    edtFormasPagto: TDBLookupComboBox;
    Label30: TLabel;
    edtParcelas: TDBEdit;
    Label32: TLabel;
    edtVencto1: TDBDateEdit;
    Label33: TLabel;
    edtValor1: TDBEdit;
    Label34: TLabel;
    Label35: TLabel;
    edtVencto2: TDBDateEdit;
    edtValor2: TDBEdit;
    Label36: TLabel;
    Label37: TLabel;
    edtVencto3: TDBDateEdit;
    edtValor3: TDBEdit;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    edtVencto4: TDBDateEdit;
    edtValor4: TDBEdit;
    Label41: TLabel;
    edtVencto5: TDBDateEdit;
    edtValor5: TDBEdit;
    Label42: TLabel;
    edtVencto6: TDBDateEdit;
    Label43: TLabel;
    edtValor6: TDBEdit;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    edtVencto7: TDBDateEdit;
    edtValor7: TDBEdit;
    Label47: TLabel;
    edtVencto8: TDBDateEdit;
    edtValor8: TDBEdit;
    Label48: TLabel;
    edtVencto9: TDBDateEdit;
    Label49: TLabel;
    edtValor9: TDBEdit;
    Label50: TLabel;
    edtVencto12: TDBDateEdit;
    Label51: TLabel;
    edtValor12: TDBEdit;
    Label52: TLabel;
    edtValor11: TDBEdit;
    Label53: TLabel;
    edtVencto11: TDBDateEdit;
    Label54: TLabel;
    edtVencto10: TDBDateEdit;
    Label55: TLabel;
    Label56: TLabel;
    edtValor10: TDBEdit;
    tabPedidosProdutos: TZQuery;
    dtsPedidosProdutos: TDataSource;
    tabClientes: TZQuery;
    dtsClientes: TDataSource;
    tabResponsavel: TZQuery;
    dtsResponsavel: TDataSource;
    tabEmpresas: TZQuery;
    dtsEmpresa: TDataSource;
    tabTabelaPreco: TZQuery;
    dtsTabelaPreco: TDataSource;
    tabCFOP: TZQuery;
    dtsCFOP: TDataSource;
    tabTransportadoras: TZQuery;
    dtsTransportadoras: TDataSource;
    Label15: TLabel;
    tabChecagens: TZQuery;
    tabFormasPagto: TZQuery;
    dtsFormasPagto: TDataSource;
    tabPedidosVencto: TZQuery;
    dtsPedidosVenctos: TDataSource;
    Produo1: TMenuItem;
    Administrao1: TMenuItem;
    Expedio1: TMenuItem;
    ProduoExpedio1: TMenuItem;
    N1: TMenuItem;
    BaixadaProduo1: TMenuItem;
    PackingList1: TMenuItem;
    GerarFaturamento1: TMenuItem;
    N2: TMenuItem;
    tabCRT: TZQuery;
    dtsCRT: TDataSource;
    tabAuxiliarVenctos: TClientDataSet;
    dtsAuxiliarVenctos: TDataSource;
    tabAuxiliarVenctosDataVencto1: TDateField;
    tabAuxiliarVenctosDataVencto2: TDateField;
    tabAuxiliarVenctosDataVencto3: TDateField;
    tabAuxiliarVenctosDataVencto4: TDateField;
    tabAuxiliarVenctosDataVencto5: TDateField;
    tabAuxiliarVenctosDataVencto6: TDateField;
    tabAuxiliarVenctosDataVencto7: TDateField;
    tabAuxiliarVenctosDataVencto8: TDateField;
    tabAuxiliarVenctosDataVencto9: TDateField;
    tabAuxiliarVenctosDataVencto10: TDateField;
    tabAuxiliarVenctosDataVencto11: TDateField;
    tabAuxiliarVenctosDataVencto12: TDateField;
    tabAuxiliarVenctosValor1: TCurrencyField;
    tabAuxiliarVenctosValor2: TCurrencyField;
    tabAuxiliarVenctosValor3: TCurrencyField;
    tabAuxiliarVenctosValor4: TCurrencyField;
    tabAuxiliarVenctosValor5: TCurrencyField;
    tabAuxiliarVenctosValor6: TCurrencyField;
    tabAuxiliarVenctosValor7: TCurrencyField;
    tabAuxiliarVenctosValor8: TCurrencyField;
    tabAuxiliarVenctosValor9: TCurrencyField;
    tabAuxiliarVenctosValor10: TCurrencyField;
    tabAuxiliarVenctosValor11: TCurrencyField;
    tabAuxiliarVenctosValor12: TCurrencyField;
    TabSheet1: TTabSheet;
    edtObsProd: TDBMemo;
    TabSheet2: TTabSheet;
    edtObsAdm: TDBMemo;
    tbsObsExp: TTabSheet;
    edtObsExp: TDBMemo;
    tabChecagens2: TZQuery;
    tabAuxAtualiza: TClientDataSet;
    tabAuxAtualizaCodigoProduto: TStringField;
    N3: TMenuItem;
    ParticipaodeVendedores1: TMenuItem;
    edtCfop: TDBEdit;
    edtFatura: TDBEdit;
    Label31: TLabel;
    N4: TMenuItem;
    Recibo1: TMenuItem;
    RtulodoCliente1: TMenuItem;
    EtiquetasdosProdutos1: TMenuItem;
    tabParticipacao: TZQuery;
    N6: TMenuItem;
    Rastreamento1: TMenuItem;
    edtTotalItens: TDBEdit;
    Label57: TLabel;
    Label58: TLabel;
    edtOrdemCompra: TDBEdit;
    TabSheet3: TTabSheet;
    edtConstarACRotulo: TDBEdit;
    Label59: TLabel;
    edtConstarDadosAdNF: TDBMemo;
    Label60: TLabel;
    mniFinalizarPedido: TMenuItem;
    mniN7: TMenuItem;
    grpGrades: TcxGroupBox;
    lbl1: TLabel;
    edtGrade1: TcxSpinEdit;
    edtGrade2: TcxSpinEdit;
    lbl2: TLabel;
    edtGrade3: TcxSpinEdit;
    lbl3: TLabel;
    edtGrade4: TcxSpinEdit;
    lbl4: TLabel;
    edtGrade5: TcxSpinEdit;
    lbl5: TLabel;
    lbl6: TLabel;
    edtGrade6: TcxSpinEdit;
    lbl7: TLabel;
    edtGrade7: TcxSpinEdit;
    edtGrade8: TcxSpinEdit;
    lbl8: TLabel;
    edtGrade9: TcxSpinEdit;
    lbl9: TLabel;
    edtGrade10: TcxSpinEdit;
    lbl10: TLabel;
    edtGrade11: TcxSpinEdit;
    lbl11: TLabel;
    lbl12: TLabel;
    edtGrade12: TcxSpinEdit;
    edtGrade13: TcxSpinEdit;
    lbl13: TLabel;
    tabGrades: TZQuery;
    tabGradesCodigoGrade: TFloatField;
    cdsGradesDescricao: TStringField;
    dtsGrades: TDataSource;
    dbgPedidosProdutos: TcxGrid;
    tvwPedidosProdutos: TcxGridDBTableView;
    clmPedidosProdutosCodigoProduto: TcxGridDBColumn;
    clmPedidosProdutosDescricao: TcxGridDBColumn;
    clmPedidosProdutosQuantidade: TcxGridDBColumn;
    clmPedidosProdutosValor: TcxGridDBColumn;
    clmPedidosProdutosValorTotal: TcxGridDBColumn;
    clmPedidosProdutosGrade1: TcxGridDBColumn;
    clmPedidosProdutosGrade2: TcxGridDBColumn;
    clmPedidosProdutosGrade3: TcxGridDBColumn;
    clmPedidosProdutosGrade4: TcxGridDBColumn;
    clmPedidosProdutosGrade5: TcxGridDBColumn;
    clmPedidosProdutosGrade6: TcxGridDBColumn;
    clmPedidosProdutosGrade7: TcxGridDBColumn;
    clmPedidosProdutosGrade8: TcxGridDBColumn;
    clmPedidosProdutosGrade9: TcxGridDBColumn;
    clmPedidosProdutosGrade10: TcxGridDBColumn;
    clmPedidosProdutosGrade11: TcxGridDBColumn;
    clmPedidosProdutosGrade12: TcxGridDBColumn;
    clmPedidosProdutosGrade13: TcxGridDBColumn;
    lvlPedidosProdutos: TcxGridLevel;
    grpProduto: TcxGroupBox;
    lbl14: TLabel;
    edtCodigoProduto: TEdit;
    btnProdutoLocalizar: TBitBtn;
    lbl15: TLabel;
    edtDescricaoProdutos: TEdit;
    edtSaldo: TEdit;
    lbl16: TLabel;
    lbl17: TLabel;
    edtQuantidade: TCurrencyEdit;
    edtValor: TCurrencyEdit;
    lbl18: TLabel;
    btnProdutoAdicionar: TBitBtn;
    btnProdutoRemover: TBitBtn;
    chkUsarGrade: TCheckBox;
    cbbGrade: TcxLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtPedidoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtsBaseDataChange(Sender: TObject; Field: TField);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnProdutoAdicionarClick(Sender: TObject);
    procedure btnProdutoRemoverClick(Sender: TObject);
    procedure btnClientesLocalizarClick(Sender: TObject);
    procedure edtCodigoClienteExit(Sender: TObject);
    procedure btnProdutoLocalizarClick(Sender: TObject);
    procedure edtCodigoProdutoChange(Sender: TObject);
    procedure edtValorFreteExit(Sender: TObject);
    procedure edtValorAcrescimoExit(Sender: TObject);
    procedure edtValorSeguroExit(Sender: TObject);
    procedure edtValorDescontoExit(Sender: TObject);
    procedure edtPercDescontoExit(Sender: TObject);
    procedure edtFormasPagtoExit(Sender: TObject);
    procedure edtPedidoKeyPress(Sender: TObject; var Key: Char);
    procedure dtsClientesDataChange(Sender: TObject; Field: TField);
    procedure edtCodigoProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure ObservaesPedido1Click(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure Produo1Click(Sender: TObject);
    procedure Administrao1Click(Sender: TObject);
    procedure Expedio1Click(Sender: TObject);
    procedure ProduoExpedio1Click(Sender: TObject);
    procedure BaixadaProduo1Click(Sender: TObject);
    procedure btnOpcoesClick(Sender: TObject);
    procedure PackingList1Click(Sender: TObject);
    procedure GerarFaturamento1Click(Sender: TObject);
    procedure ParticipaodeVendedores1Click(Sender: TObject);
    procedure edtCfopExit(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure Recibo1Click(Sender: TObject);
    procedure RtulodoCliente1Click(Sender: TObject);
    procedure EtiquetasdosProdutos1Click(Sender: TObject);
    procedure edtNaturezaOperacaoExit(Sender: TObject);
    procedure edtNaturezaOperacaoEnter(Sender: TObject);
    procedure Rastreamento1Click(Sender: TObject);
    procedure mniFinalizarPedidoClick(Sender: TObject);
    procedure chkUsarGradeClick(Sender: TObject);
    procedure MudarValorGrade(Sender: TObject);
  private
    FTyping: Boolean;
    procedure AtualizaPedido;
    procedure AtualizaTotal;
    procedure AtualizaVenctos(pFormaPagto: real; pData: TDateTime; pTotal: real);
    procedure GravarProdutos(pPedido: real);
    procedure GravarVenctos(pPedido: real);
    procedure VenctosTrocaDataSource(pDataSource: TDataSource);
    function SeTotalDifVenctos: boolean;
    procedure AtualizaSaldoEstoque;
    procedure AtualizarTabelaCorreio(pPedido: real);
  public
    procedure Novo; override;
    procedure Editar; override;
    procedure Deletar; override;
    procedure Cancelar; override;
    function Checagens: Boolean; override;
    //    procedure AtualizarDataProducao;
  end;

var
  fmPedidosVenda: TfmPedidosVenda;

implementation

uses uFormBaseConfig, uMenu, uFuncoes, uLocalizarClientes,
  uLocalizarProdutos, rPedidoProducao, rPedidoAdministracao,
  rPedidoExpedicao, rPedidoProducaoExpedicao, uBaixaProducao,
  uGerarPackingList, uGerarFaturamento, uPedidosParticipacaoVendedores,
  uLocalizarPedidos, rPedidosRecibo, rRotulosClientes, uRastreamentoPedido,
  uEtiquetasProdutos_TLP2844, uFinalizarPedido;

{$R *.dfm}

{ TfmPedidosVenda }

procedure TfmPedidosVenda.Novo;
begin
  if Trim(edtPedido.Text) = '' then
  begin
    tabBase.FieldByName('NPedido').AsFloat := CodeGenerator('pedidos', 'NPedido');
  end
  else
  begin
    tabBase.FieldByName('NPedido').AsFloat := StrToFloat(edtPedido.Text);
  end;
  GravarProdutos(tabBase.FieldByName('NPedido').AsFloat);
  GravarVenctos(tabBase.FieldByName('NPedido').AsFloat);
  AtualizarTabelaCorreio(tabBase.FieldByName('NPedido').AsFloat);
end;

procedure TfmPedidosVenda.Editar;
begin
  GravarProdutos(tabBase.FieldByName('NPedido').AsFloat);
  GravarVenctos(tabBase.FieldByName('NPedido').AsFloat);
  AtualizarTabelaCorreio(tabBase.FieldByName('NPedido').AsFloat);
end;

procedure TfmPedidosVenda.Cancelar;
begin
end;

procedure TfmPedidosVenda.Deletar;
begin
  tabAuxAtualiza.EmptyDataSet;
  try
    tabChecagens.Close;
    tabChecagens.SQL.Clear;
    tabChecagens.SQL.Add('SELECT * FROM pedidos_produtos WHERE NPedido = ' + FloatToStr(tabBase.FieldByName('NPedido').AsFloat));
    tabChecagens.Open;
    tabChecagens.First;
    while not tabChecagens.Eof do
    begin
      tabAuxAtualiza.Append;
      tabAuxAtualizaCodigoProduto.Value := tabChecagens.FieldByName('CodigoProduto').AsString;
      tabAuxAtualiza.Post;
      tabChecagens.Delete;
      tabChecagens.ApplyUpdates;
      Continue;
    end;
  finally
    tabChecagens.Close;
  end;
  try
    tabChecagens.Close;
    tabChecagens.SQL.Clear;
    tabChecagens.SQL.Add('SELECT * FROM pedidos_vencimentos WHERE NPedido = ' + FloatToStr(tabBase.FieldByName('NPedido').AsFloat));
    tabChecagens.Open;
    tabChecagens.First;
    while not tabChecagens.Eof do
    begin
      tabChecagens.Delete;
      tabChecagens.ApplyUpdates;
      Continue;
    end;
  finally
    tabChecagens.Close;
  end;
  // pedidos participação
  try
    tabChecagens.Close;
    tabChecagens.SQL.Clear;
    tabChecagens.SQL.Add('SELECT * FROM pedidos_part_func WHERE NPedido = ' + FloatToStr(tabBase.FieldByName('NPedido').AsFloat));
    tabChecagens.Open;
    tabChecagens.First;
    while not tabChecagens.Eof do
    begin
      tabChecagens.Delete;
      tabChecagens.ApplyUpdates;
      Continue;
    end;
  finally
    tabChecagens.Close;
  end;
end;

function TfmPedidosVenda.Checagens: Boolean;
var
  vObrigatorio: string;
begin
  Result := False;
  if Trim(edtCodigoCliente.Text) = '' then
  begin
    ShowMessage('Obrigatório Preenchimento do Cliente');
    edtCodigoCliente.SetFocus;
    Result := True;
    exit;
  end;
  if Trim(edtDataPedido.Text) = '/  /' then
  begin
    ShowMessage('Obrigatório Preenchimento da Data do Pedido');
    edtDataPedido.SetFocus;
    Result := True;
    exit;
  end;
  if Trim(edtHoraPedido.Text) = '  :  :  ' then
  begin
    ShowMessage('Obrigatório Preenchimento da Hora do Pedido');
    edtHoraPedido.SetFocus;
    Result := True;
    exit;
  end;
  if Trim(edtCodigoResponsavel.Text) = '' then
  begin
    ShowMessage('Obrigatório Preenchimento do Responsável');
    edtCodigoResponsavel.SetFocus;
    Result := True;
    exit;
  end;
  if Trim(edtCodigoEmpresa.Text) = '' then
  begin
    ShowMessage('Obrigatório Preenchimento da Empresa');
    edtCodigoEmpresa.SetFocus;
    Result := True;
    exit;
  end;

  if edtTabelaPreco.KeyValue = null then
  begin
    ShowMessage('Obrigatório Preenchimento da Tabela de Preço');
    edtTabelaPreco.SetFocus;
    Result := True;
    exit;
  end;

  if tabBase.FieldByName('CFOP').IsNull then
  begin
    ShowMessage('Obrigatório Preenchimento do CFOP');
    edtNaturezaOperacao.SetFocus;
    Result := True;
    exit;
  end;

  if Trim(edtCsosn.Text) = '' then
  begin
    ShowMessage('Obrigatório Preenchimento da CSOSN');
    edtCsosn.SetFocus;
    Result := True;
    exit;
  end;

  if Trim(edtTransportadora.Text) = '' then
  begin
    ShowMessage('Obrigatório Preenchimento da Transportadora');
    edtTransportadora.SetFocus;
    Result := True;
    exit;
  end;

  if tabPedidosProdutos.RecordCount <= 0 then
  begin
    ShowMessage('Obrigatório Preenchimento dos Produtos');
    edtCodigoProduto.SetFocus;
    Result := True;
    exit;
  end;

  if Trim(edtFormasPagto.Text) = '' then
  begin
    ShowMessage('Obrigatório Preenchimento da Forma de Pagamento');
    pgcPedidos.ActivePage := tbsVenctos;
    edtFormasPagto.SetFocus;
    Result := True;
    exit;
  end;

  if SeTotalDifVenctos then
  begin
    ShowMessage('Valor dos Vencimentos Incompativel com o Valor Total do Pedido');
    pgcPedidos.ActivePage := tbsVenctos;
    edtValor1.SetFocus;
    Result := True;
    exit;
  end;

  tabChecagens2.Close;
  tabChecagens2.SQL.Clear;
  tabChecagens2.SQL.Add('SELECT POClientesEndNormal ');
  tabChecagens2.SQL.Add('FROM configuracoes_proprietario ');
  tabChecagens2.Open;

  if tabChecagens2.FieldByName('POClientesEndNormal').AsInteger = 1 then
  begin
    // Checar no Cadastro de Clientes
    try
      vObrigatorio := '';
      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT * FROM clientes WHERE CodigoCliente = ' + QuotedStr(edtCodigoCliente.Text));
      tabChecagens.Open;

      if Trim(tabChecagens.FieldByName('Estado').AsString) <> 'EX' then
      begin
        if tabChecagens.RecordCount > 0 then
        begin
          if Trim(tabChecagens.FieldByName('Cep').AsString) = '' then
          begin
            vObrigatorio := vObrigatorio + '* Cep não Informado.' + Chr(13);
          end;
          if Trim(tabChecagens.FieldByName('Endereco').AsString) = '' then
          begin
            vObrigatorio := vObrigatorio + '* Endereço não Informado.' + Chr(13);
          end;
          if Trim(tabChecagens.FieldByName('Numero').AsString) = '' then
          begin
            vObrigatorio := vObrigatorio + '* Numero não Informado.' + Chr(13);
          end;
          if Trim(tabChecagens.FieldByName('Bairro').AsString) = '' then
          begin
            vObrigatorio := vObrigatorio + '* Bairro não Informado.' + Chr(13);
          end;
          if Trim(tabChecagens.FieldByName('CodigoPais').AsString) = '' then
          begin
            vObrigatorio := vObrigatorio + '* País não Informado.' + Chr(13);
          end;
          if Trim(tabChecagens.FieldByName('Estado').AsString) = '' then
          begin
            vObrigatorio := vObrigatorio + '* Estado não Informado.' + Chr(13);
          end;
          if Trim(tabChecagens.FieldByName('CodigoCidade').AsString) = '' then
          begin
            vObrigatorio := vObrigatorio + '* Cidade não Informado.' + Chr(13);
          end;

          if Trim(vObrigatorio) <> '' then
          begin
            ShowMessage('Dados do Cliente que precisam ser Informados para correta emissão de Boleto / NFe: ' + Chr(13) + Chr(13) +
              'Código do Cliente: ' + edtCodigoCliente.Text + Chr(13) + Chr(13) +
              vObrigatorio);
            edtCodigoCliente.SetFocus;
            Result := True;
            exit;
          end;
        end;
      end;
    finally
      tabChecagens.Close;
    end;
  end;
  tabChecagens2.CLose;

  if tabBase.State = dsInsert then
  begin
    if Trim(edtPedido.Text) <> '' then
    begin
      if ExistsValue('NPedido', 'pedidos', edtPedido.Text) then
      begin
        ShowMessage('Pedido já Existente');
        edtPedido.SetFocus;
        Result := True;
        exit;
      end;
    end;
    if Trim(edtOrdemCompra.Text) <> '' then
    begin
      if ExistsValue('OrdemCompra', 'pedidos', edtOrdemCompra.Text) then
      begin
        ShowMessage('Ordem de Compra já Existente');
        edtOrdemCompra.SetFocus;
        Result := True;
        exit;
      end;
    end;
  end;
end;

procedure TfmPedidosVenda.FormCreate(Sender: TObject);
begin
  inherited;
  FTyping := False;
  SetFormStyle(fsMDIChild);
end;

procedure TfmPedidosVenda.FormShow(Sender: TObject);
begin
  inherited;

  pgcPedidos.ActivePageIndex := 0;

  edtCsosn.Items := GetCSOSN;

  tabGrades.SQL.Clear;
  tabGrades.SQL.Add(' select * from grades ');
  tabGrades.Open;

  tabAuxiliarVenctos.CreateDataSet;
  tabAuxiliarVenctos.EmptyDataSet;

  tabAuxAtualiza.CreateDataSet;
  tabAuxAtualiza.EmptyDataSet;

  tabPedidosProdutos.SQL.Clear;
  tabPedidosProdutos.Params.CreateParam(ftFloat, 'NPedido', ptUnknown);
  tabPedidosProdutos.SQL.Add('SELECT * FROM pedidos_produtos WHERE NPedido = :NPedido');
  tabPedidosProdutos.Open;

  tabTransportadoras.SQL.Add('SELECT Codigo,Nome FROM transportadoras ORDER BY Nome');
  tabTransportadoras.Open;

  tabCFOP.SQL.Add('SELECT * FROM cfop ORDER BY NaturezaOperacao');
  tabCFOP.Open;

  tabTabelaPreco.SQL.Add('SELECT * FROM tipos_tabela_preco ORDER BY Descricao');
  tabTabelaPreco.Open;

  tabEmpresas.SQL.Add('SELECT CodigoEmpresa,NomeFantasia FROM empresas ORDER BY NomeFantasia');
  tabEmpresas.Open;

  tabResponsavel.SQL.Add('SELECT Codigo,Nome FROM funcionarios ORDER BY Nome');
  tabResponsavel.Open;

  tabCRT.Params.CreateParam(ftFloat, 'CodigoCRT', ptUnknown);
  tabCRT.SQL.Add('SELECT * FROM genericos WHERE Codigo = :CodigoCRT');
  tabCRT.Open;

  tabClientes.Params.CreateParam(ftFloat, 'CodigoCliente', ptUnknown);
  tabClientes.SQL.Add('SELECT CodigoCliente,NomeFantasia,CodigoCRT FROM clientes WHERE CodigoCliente = :CodigoCliente');
  tabClientes.Open;

  tabFormasPagto.SQL.Add('SELECT * FROM formas_pagamento ORDER BY Descricao');
  tabFormasPagto.Open;

  tabPedidosVencto.Params.CreateParam(ftFloat, 'NPedido', ptUnknown);
  tabPedidosVencto.SQL.Add('SELECT * FROM pedidos_vencimentos WHERE NPedido = :NPedido');
  tabPedidosVencto.Open;

  tabBase.Params.CreateParam(ftFloat, 'NPedido', ptUnknown);
  tabBase.SQL.Add('SELECT * FROM pedidos WHERE NPedido > 0 ORDER BY Data DESC LIMIT 50');
  tabBase.Open;

  AtualizaPedido;
end;

procedure TfmPedidosVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tabBase.Close;
  tabPedidosProdutos.Close;
  tabClientes.Close;
  tabResponsavel.Close;
  tabEmpresas.Close;
  tabTabelaPreco.Close;
  tabCFOP.Close;
  tabTransportadoras.Close;
  tabFormasPagto.Close;
  tabPedidosVencto.Close;
  tabAuxiliarVenctos.Close;
  tabAuxAtualiza.Close;
  tabChecagens.Close;
  inherited;
end;

procedure TfmPedidosVenda.edtPedidoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if tabBase.State = dsBrowse then
  begin
    if Trim(edtPedido.Text) <> '' then
    begin
      FTyping := True;
      tabBase.Close;
      tabBase.SQL.Clear;
      tabBase.SQL.Add('SELECT * FROM pedidos WHERE NPedido = ' + edtPedido.Text);
      tabBase.Open;
      FTyping := False;
    end
    else
    begin
      FTyping := True;
      tabBase.Close;
      tabBase.SQL.Clear;
      tabBase.SQL.Add('SELECT * FROM pedidos WHERE NPedido = -1');
      tabBase.Open;
      FTyping := False;
    end;
  end;
end;

procedure TfmPedidosVenda.AtualizaPedido;
begin
  if FTyping = False then
  begin
    if not tabBase.FieldByName('NPedido').IsNull then
    begin
      edtPedido.Text := FloatToStr(tabBase.FieldByName('NPedido').AsFloat);
    end;
  end;
end;

procedure TfmPedidosVenda.dtsBaseDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if tabBase.State = dsBrowse then
  begin
    AtualizaPedido;

    tabPedidosProdutos.Close;
    tabPedidosProdutos.ParamByName('NPedido').AsFloat := tabBase.FieldByName('NPedido').AsFloat;
    tabPedidosProdutos.Open;

    tabPedidosVencto.Close;
    tabPedidosVencto.ParamByName('NPedido').AsFloat := tabBase.FieldByName('NPedido').AsFloat;
    tabPedidosVencto.Open;

    tabClientes.Close;
    tabClientes.ParamByName('CodigoCliente').Value := tabBase.FieldByName('CodigoCliente').Value;
    tabClientes.Open;

    // Pode-se agora alterar dados depois que o pedido foi entregue
    {
    if not tabBase.FieldByName('DataEntrega').IsNull then
    begin
      btnEditar.Enabled:=False;
     end
    else
    begin
      btnEditar.Enabled:=True;
    end;
    }
  end;
end;

procedure TfmPedidosVenda.btnNovoClick(Sender: TObject);
begin
  inherited;
  tabBase.FieldByName('Data').AsDateTime := Date;
  tabBase.FieldByName('Hora').AsDateTime := Now;

  // Limpar Tabelas com Parâmetro.
  tabPedidosProdutos.Close;
  tabPedidosProdutos.ParamByName('NPedido').AsFloat := tabBase.FieldByName('NPedido').AsFloat;
  tabPedidosProdutos.Open;

  tabPedidosVencto.Close;
  tabPedidosVencto.ParamByName('NPedido').AsFloat := -1;
  tabPedidosVencto.Open;

  tabClientes.Close;
  tabClientes.ParamByName('CodigoCliente').AsFloat := -1;
  tabClientes.Open;

  tabAuxiliarVenctos.EmptyDataSet;

  tvwPedidosProdutos.DataController.DataSource := dtsPedidosProdutos;

  VenctosTrocaDataSource(dtsAuxiliarVenctos);

  edtPedido.Text := '';
  edtDataPrevisao.SetFocus;
end;

procedure TfmPedidosVenda.btnEditarClick(Sender: TObject);
var
  vCnt: Integer;
begin
  inherited;
  edtPedido.Enabled := False;

  tabAuxiliarVenctos.EmptyDataSet;

  tabAuxiliarVenctos.Append;
  try
    for vCnt := 1 to 12 do
    begin
      if not tabPedidosVencto.FieldByName('DataVencto' + IntToStr(vCnt)).IsNull then
      begin
        tabAuxiliarVenctos.FieldByName('DataVencto' + IntToStr(vCnt)).AsDateTime := tabPedidosVencto.FieldByName('DataVencto' + IntToStr(vCnt)).AsDateTime;
        tabAuxiliarVenctos.FieldByName('Valor' + IntToStr(vCnt)).AsFloat := tabPedidosVencto.FieldByName('Valor' + IntToStr(vCnt)).AsFloat;
      end;
      VenctosTrocaDataSource(dtsAuxiliarVenctos);
    end;
  finally
    tabAuxiliarVenctos.Post;
  end;

  tabChecagens.Close;
end;

procedure TfmPedidosVenda.btnCancelarClick(Sender: TObject);
begin
  inherited;
  edtPedido.Enabled := True;
  tvwPedidosProdutos.DataController.DataSource := dtsPedidosProdutos;
  VenctosTrocaDataSource(dtsPedidosVenctos);

  tabBase.Close;
  tabBase.SQL.Clear;
  tabBase.SQL.Add('SELECT * FROM pedidos WHERE NPedido > 0 ORDER BY Data DESC LIMIT 50');
  tabBase.Open;
  tabBase.Last;

  AtualizaPedido;
end;

procedure TfmPedidosVenda.AtualizaTotal;
var
  vTotal, vProdutos, vQtdTotal: real;
begin
  vTotal := 0;
  vProdutos := 0;
  vQtdTotal := 0;
  tvwPedidosProdutos.DataController.DataSource := nil;
  try
    tabPedidosProdutos.First;
    while not tabPedidosProdutos.Eof do
    begin

      vProdutos := vProdutos + tabPedidosProdutos.FieldByName('ValorTotal').Value;
      vQtdTotal := vQtdTotal + tabPedidosProdutos.FieldByName('Quantidade').Value;

      tabPedidosProdutos.Next;
    end;
    tabPedidosProdutos.First;

    // Acréscimos
    vTotal := vTotal + vProdutos;
    vTotal := vTotal + tabBase.FieldByName('ValorFrete').AsFloat;
    vTotal := vTotal + tabBase.FieldByName('ValorAcrescimo').AsFloat;
    vTotal := vTotal + tabBase.FieldByName('ValorSeguro').AsFloat;
    // Descontos
    vTotal := vTotal - tabBase.FieldByName('ValorDesconto').AsFloat;

    tabBase.FieldByName('ValorProdutos').AsFloat := vProdutos;
    tabBase.FieldByName('ValorTotal').AsFloat := vTotal;
    tabBase.FieldByName('TotalItens').AsFloat := vQtdTotal;

    if not tabBase.FieldByName('CodigoFormaPagto').IsNull then
    begin
      AtualizaVenctos(tabBase.FieldByName('CodigoFormaPagto').AsFloat, edtDataPedido.Date, tabBase.FieldByName('ValorTotal').AsFloat);
    end;
  finally
    tvwPedidosProdutos.DataController.DataSource := dtsPedidosProdutos;
  end;
end;

procedure TfmPedidosVenda.GravarProdutos(pPedido: real);
begin

  tvwPedidosProdutos.DataController.DataSource := nil;
  try

    tabAuxAtualiza.EmptyDataSet;

    tabPedidosProdutos.First;

    while not tabPedidosProdutos.Eof do
    begin

      tabAuxAtualiza.Append;
      tabAuxAtualizaCodigoProduto.Value := tabPedidosProdutos.FieldByName('CodigoProduto').Value;
      tabAuxAtualiza.Post;

      tabPedidosProdutos.Edit;
      tabPedidosProdutos.FieldByName('NPedido').AsFloat := tabBase.FieldByName('NPedido').AsFloat;
      tabPedidosProdutos.Post;

      tabPedidosProdutos.Next;
    end;

    tabPedidosProdutos.ApplyUpdates;

    tabPedidosProdutos.Close;
    tabPedidosProdutos.ParamByName('NPedido').AsFloat := tabBase.FieldByName('NPedido').AsFloat;
    tabPedidosProdutos.Open;

    tabPedidosProdutos.First;
  finally
    tvwPedidosProdutos.DataController.DataSource := dtsPedidosProdutos;
  end;
end;

procedure TfmPedidosVenda.btnGravarClick(Sender: TObject);
begin
  Self.ActiveControl := nil;
  inherited;
  edtPedido.Enabled := True;
  AtualizaSaldoEstoque;
end;

procedure TfmPedidosVenda.btnProdutoAdicionarClick(Sender: TObject);
var
  vQuantidadeTotal: Integer;
begin
  inherited;
  if tabBase.State in [dsInsert, dsEdit] then
  begin

    if Trim(edtCodigoProduto.Text) = '' then
    begin
      ShowMessage('Obrigatório Preenchimento do Produto');
      edtCodigoProduto.SetFocus;
      exit;
    end;

    tabChecagens.Close;
    tabChecagens.SQL.Clear;
    tabChecagens.SQL.Add('SELECT CodigoProduto FROM produtos WHERE CodigoProduto = ' + QuotedStr(edtCodigoProduto.Text));
    tabChecagens.Open;

    if tabChecagens.RecordCount = 0 then
    begin
      ShowMessage('Produto não encontrado');
      edtCodigoProduto.SetFocus;
      exit;
    end;

    if edtQuantidade.Value <= 0 then
    begin
      ShowMessage('Obrigatório Preenchimento da Quantidade');

      if chkUsarGrade.Checked then
      begin
        edtGrade1.SetFocus;
      end
      else
      begin
        edtQuantidade.SetFocus;
      end;
      exit;
    end;

    if edtValor.Value <= 0 then
    begin
      ShowMessage('Obrigatório Preenchimento do Valor');
      edtValor.SetFocus;
      exit;
    end;

    if tabPedidosProdutos.Locate('CodigoProduto', edtCodigoProduto.Text, []) then
    begin
      ShowMessage('Produto já Incluido nesse Pedido');
      edtCodigoProduto.SetFocus;
      exit;
    end;

    tabPedidosProdutos.Append;

    tabPedidosProdutos.FieldByName('ID').Value := CodeGenerator('pedidos_produtos', 'ID');

    tabPedidosProdutos.FieldByName('CodigoProduto').Value := edtCodigoProduto.Text;
    tabPedidosProdutos.FieldByName('Descricao').Value := edtDescricaoProdutos.Text;
    tabPedidosProdutos.FieldByName('Quantidade').Value := edtQuantidade.Value;
    tabPedidosProdutos.FieldByName('Valor').Value := edtValor.Value;
    tabPedidosProdutos.FieldByName('ValorTotal').Value := edtQuantidade.Value * edtValor.Value;
    tabPedidosProdutos.FieldByName('Composto').Value := 0;

    tabPedidosProdutos.FieldByName('NPedido').AsFloat := tabBase.FieldByName('NPedido').AsFloat;

    if chkUsarGrade.Checked then
    begin
      vQuantidadeTotal := edtGrade1.Value +
        edtGrade2.Value +
        edtGrade3.Value +
        edtGrade4.Value +
        edtGrade5.Value +
        edtGrade6.Value +
        edtGrade7.Value +
        edtGrade8.Value +
        edtGrade9.Value +
        edtGrade10.Value +
        edtGrade11.Value +
        edtGrade12.Value +
        edtGrade13.Value;

      tabPedidosProdutos.FieldByName('Quantidade').Value := vQuantidadeTotal;

    end;

    tabPedidosProdutos.FieldByName('Grade1').AsFloat := edtGrade1.Value;
    tabPedidosProdutos.FieldByName('Grade2').AsFloat := edtGrade2.Value;
    tabPedidosProdutos.FieldByName('Grade3').AsFloat := edtGrade3.Value;
    tabPedidosProdutos.FieldByName('Grade4').AsFloat := edtGrade4.Value;
    tabPedidosProdutos.FieldByName('Grade5').AsFloat := edtGrade5.Value;
    tabPedidosProdutos.FieldByName('Grade6').AsFloat := edtGrade6.Value;
    tabPedidosProdutos.FieldByName('Grade7').AsFloat := edtGrade7.Value;
    tabPedidosProdutos.FieldByName('Grade8').AsFloat := edtGrade8.Value;
    tabPedidosProdutos.FieldByName('Grade9').AsFloat := edtGrade9.Value;
    tabPedidosProdutos.FieldByName('Grade10').AsFloat := edtGrade10.Value;
    tabPedidosProdutos.FieldByName('Grade11').AsFloat := edtGrade11.Value;
    tabPedidosProdutos.FieldByName('Grade12').AsFloat := edtGrade12.Value;
    tabPedidosProdutos.FieldByName('Grade13').AsFloat := edtGrade13.Value;

    if cbbGrade.EditValue <> null then
    begin
      tabPedidosProdutos.FieldByName('CodigoGrade').AsFloat := cbbGrade.EditValue;
    end;

    if chkUsarGrade.Checked then
      tabPedidosProdutos.FieldByName('UsarGrade').AsFloat := 1
    else
      tabPedidosProdutos.FieldByName('UsarGrade').AsFloat := 0
        ;

    tabPedidosProdutos.Post;
    tabPedidosProdutos.ApplyUpdates;

    edtCodigoProduto.Text := '';
    edtDescricaoProdutos.Text := '';
    edtQuantidade.Value := 0;
    edtValor.Value := 0;
    edtGrade1.Value := 0;
    edtGrade2.Value := 0;
    edtGrade3.Value := 0;
    edtGrade4.Value := 0;
    edtGrade5.Value := 0;
    edtGrade6.Value := 0;
    edtGrade7.Value := 0;
    edtGrade8.Value := 0;
    edtGrade9.Value := 0;
    edtGrade10.Value := 0;
    edtGrade11.Value := 0;
    edtGrade12.Value := 0;
    edtGrade13.Value := 0;
    edtSaldo.Text := '';

    AtualizaTotal;

    edtCodigoProduto.SetFocus;
  end;
end;

procedure TfmPedidosVenda.btnProdutoRemoverClick(Sender: TObject);
var
  vProduto: string;
begin
  inherited;
  if tabBase.State in [dsInsert, dsEdit] then
  begin
    if tabPedidosProdutos.RecordCount > 0 then
    begin

      if not tabPedidosProdutos.FieldByName('DataProducao').IsNull then
      begin
        raise Exception.Create('Produto já Baixado Parcialmente na Produção.');
        exit;
      end;

      if Application.MessageBox('Deseja Realmente Excluir o Produto?', PChar(Application.Title), 36) = 7 then
        exit;

      tabPedidosProdutos.Delete;

      AtualizaTotal;
    end;
  end;
end;

procedure TfmPedidosVenda.btnClientesLocalizarClick(Sender: TObject);
begin
  inherited;
  if tabBase.State in [dsInsert, dsEdit] then
  begin
    if not Assigned(fmLocalizarClientes) then
    begin
      Application.CreateForm(TfmLocalizarClientes, fmLocalizarClientes);
      fmLocalizarClientes.ShowModal;
    end;
    if Trim(fmMenu.pubTrans1) <> '' then
    begin
      tabBase.FieldByName('CodigoCliente').AsFloat := StrToFloat(fmMenu.pubTrans1);
    end;
    edtCodigoCliente.SetFocus;
  end;
end;

procedure TfmPedidosVenda.edtCodigoClienteExit(Sender: TObject);
begin
  inherited;
  if tabBase.State in [dsInsert] then
  begin
    if tabBase.FieldByName('CodigoCliente').AsFloat <> 0 then
    begin
      tabClientes.Close;
      tabClientes.ParamByName('CodigoCliente').Value := tabBase.FieldByName('CodigoCliente').Value;
      tabClientes.Open;

      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT * FROM clientes_contatos WHERE CodigoCliente = ' + FloatToStr(tabBase.FieldByName('CodigoCliente').AsFloat));
      tabChecagens.Open;
      if tabChecagens.RecordCount > 0 then
      begin
        edtContato.Items.Clear;
        tabChecagens.First;
        while not tabChecagens.Eof do
        begin
          edtContato.Items.Add(tabChecagens.FieldByName('Nome').AsString);
          tabChecagens.Next;
        end;
      end;
      tabChecagens.Close;
    end;
  end;
end;

procedure TfmPedidosVenda.btnProdutoLocalizarClick(Sender: TObject);
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
      edtCodigoProduto.Text := fmMenu.pubTrans1;
    end;
  end;
end;

procedure TfmPedidosVenda.edtCodigoProdutoChange(Sender: TObject);
begin
  inherited;
  if tabBase.State in [dsInsert, dsEdit] then
  begin
    if Trim(edtCodigoProduto.Text) <> '' then
    begin
      try
        tabChecagens.Close;
        tabChecagens.SQL.Clear;
        tabChecagens.SQL.Add('SELECT CodigoProduto,NomeTecnico, UsarGrade, CodigoGrade  FROM produtos WHERE CodigoProduto = ' + QuotedStr(edtCodigoProduto.Text));
        tabChecagens.Open;
        if tabChecagens.RecordCount > 0 then
        begin
          edtDescricaoProdutos.Text := tabChecagens.FieldByName('NomeTecnico').AsString;

          if tabChecagens.FieldByName('UsarGrade').AsInteger = 1 then
          begin
            chkUsarGrade.Checked := True;

            if tabChecagens.FieldByName('CodigoGrade').AsInteger <> 0 then
            begin
              cbbGrade.EditValue := tabChecagens.FieldByName('CodigoGrade').AsInteger;
            end
            else
            begin
              cbbGrade.EditValue := Null;
            end;

          end
          else
          begin
            chkUsarGrade.Checked := False;
            cbbGrade.EditValue := Null;
          end;

          // -- Verificar se possui referencia no cliente!
          if Trim(edtCodigoCliente.Text) <> '' then
          begin
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT * FROM clientes_referencia_produtos WHERE CodigoProduto = ' + QuotedStr(edtCodigoProduto.Text) + ' AND CodigoCliente = ' + edtCodigoCliente.Text);
            tabChecagens.Open;
            if tabChecagens.RecordCount > 0 then
            begin
              edtDescricaoProdutos.Text := edtDescricaoProdutos.Text + ' REF: ' + tabChecagens.FieldByName('ReferenciaCliente').AsString;
            end;
          end;

          tabChecagens.Close;
          tabChecagens.SQL.Clear;
          tabChecagens.SQL.Add('SELECT Disponivel FROM produtos_status_estoque WHERE CodigoProduto = ' + QuotedStr(edtCodigoProduto.Text));
          tabChecagens.Open;
          if tabChecagens.RecordCount = 1 then
          begin
            edtSaldo.Text := FloatToStr(tabChecagens.FieldByName('Disponivel').AsFloat);
          end
          else
          begin
            edtSaldo.Text := '';
          end;

          if edtTabelaPreco.KeyValue <> null then
          begin
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT ValorAtual FROM tabela_precos WHERE CodigoProduto = ' + QuotedStr(edtCodigoProduto.Text) + ' AND CodigoTabela = ' + FloatToStr(edtTabelaPreco.KeyValue));
            tabChecagens.Open;
            if tabChecagens.RecordCount > 0 then
            begin
              edtValor.Value := tabChecagens.FieldByName('ValorAtual').AsFloat;
            end
            else
            begin
              edtValor.Value := 0;
            end;
          end;

        end
        else
        begin
          edtDescricaoProdutos.Text := '';
          edtSaldo.Text := '';
          edtValor.Value := 0;
        end;
      finally
        tabChecagens.Close;
      end;
    end
    else
    begin
      edtDescricaoProdutos.Text := '';
      edtSaldo.Text := '';
      edtValor.Value := 0;
    end;
  end;
end;

procedure TfmPedidosVenda.edtValorFreteExit(Sender: TObject);
begin
  inherited;
  if tabBase.State in [dsInsert, dsEdit] then
    AtualizaTotal;
end;

procedure TfmPedidosVenda.edtValorAcrescimoExit(Sender: TObject);
begin
  inherited;
  if tabBase.State in [dsInsert, dsEdit] then
    AtualizaTotal;
end;

procedure TfmPedidosVenda.edtValorSeguroExit(Sender: TObject);
begin
  inherited;
  if tabBase.State in [dsInsert, dsEdit] then
    AtualizaTotal;
end;

procedure TfmPedidosVenda.edtValorDescontoExit(Sender: TObject);
begin
  inherited;
  if tabBase.State in [dsInsert, dsEdit] then
    AtualizaTotal;
end;

procedure TfmPedidosVenda.edtPercDescontoExit(Sender: TObject);
begin
  inherited;
  if tabBase.State in [dsInsert, dsEdit] then
    AtualizaTotal;
end;

procedure TfmPedidosVenda.edtFormasPagtoExit(Sender: TObject);
var
  vParcelas: Integer;
  vFormaPagto: real;
begin
  inherited;
  if tabBase.State in [dsInsert, dsEdit] then
  begin
    if Trim(edtFormasPagto.Text) <> '' then
    begin
      try
        tabChecagens.Close;
        tabChecagens.SQL.Clear;
        tabChecagens.SQL.Add('SELECT Codigo,Parcelas FROM formas_pagamento WHERE Codigo = ' + FloatToStr(tabBase.FieldByName('CodigoFormaPagto').AsFloat));
        tabChecagens.Open;
        vParcelas := tabChecagens.FieldByName('Parcelas').AsInteger;
        vFormaPagto := tabChecagens.FieldByName('Codigo').AsFloat;
        tabBase.FieldByName('Parcelas').AsInteger := vParcelas;
      finally
        tabChecagens.Close;
      end;
      if vParcelas > 0 then
      begin
        AtualizaVenctos(vFormaPagto, edtDataPedido.Date, tabBase.FieldByName('ValorTotal').AsFloat);
      end;
    end;
  end;
end;

procedure TfmPedidosVenda.edtPedidoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', Chr(8)]) then
    Key := #0;
end;

procedure TfmPedidosVenda.dtsClientesDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  tabCRT.Close;
  tabCRT.ParamByName('CodigoCRT').AsFloat := tabClientes.FieldByName('CodigoCRT').AsFloat;
  tabCRT.Open;
end;

procedure TfmPedidosVenda.VenctosTrocaDataSource(pDataSource: TDataSource);
var
  vCnt: Integer;
begin
  for vCnt := 1 to 12 do
  begin
    TDBDateEdit(FindComponent('edtVencto' + IntToStr(vCnt))).DataSource := pDataSource;
    TDBEdit(FindComponent('edtValor' + IntToStr(vCnt))).DataSource := pDataSource;
  end;
end;

procedure TfmPedidosVenda.GravarVenctos(pPedido: real);
var
  vCnt: Integer;
begin
  tabChecagens.Close;
  tabChecagens.SQL.Clear;
  tabChecagens.SQL.Add('DELETE FROM pedidos_vencimentos WHERE NPedido = ' + FloatToStr(pPedido));
  tabChecagens.ExecSQL;

  tabChecagens.Close;
  tabChecagens.SQL.Clear;
  tabChecagens.SQL.Add('SELECT * FROM pedidos_vencimentos WHERE 0');
  tabChecagens.Open;

  tabChecagens.Append;
  try
    for vCnt := 1 to 12 do
    begin
      tabChecagens.FieldByName('NPedido').AsFloat := pPedido;
      if not tabAuxiliarVenctos.FieldByName('DataVencto' + IntToStr(vCnt)).IsNull then
      begin
        tabChecagens.FieldByName('DataVencto' + IntToStr(vCnt)).AsDateTime := tabAuxiliarVenctos.FieldByName('DataVencto' + IntToStr(vCnt)).AsDateTime;
      end;
      tabChecagens.FieldByName('Valor' + IntToStr(vCnt)).AsFloat := tabAuxiliarVenctos.FieldByName('Valor' + IntToStr(vCnt)).AsFloat;
    end;
  finally
    tabChecagens.Post;
    tabChecagens.ApplyUpDates;
    tabChecagens.Close;
  end;

  tabPedidosVencto.Close;
  tabPedidosVencto.ParamByName('NPedido').AsFloat := pPedido;
  tabPedidosVencto.Open;
end;

procedure TfmPedidosVenda.AtualizaVenctos(pFormaPagto: real; pData: TDateTime; pTotal: real);
var
  vParcelas, vCnt: Integer;
begin
  try
    tabChecagens.Close;
    tabChecagens.SQL.Clear;
    tabChecagens.SQL.Add('SELECT Codigo,Parcelas FROM formas_pagamento WHERE Codigo = ' + FloatToStr(pFormaPagto));
    tabChecagens.Open;
    vParcelas := tabChecagens.FieldByName('Parcelas').AsInteger;

    if vParcelas > 0 then
    begin

      tabAuxiliarVenctos.Edit;
      for vCnt := 1 to 12 do
      begin
        tabAuxiliarVenctos.FieldByName('DataVencto' + IntToStr(vCnt)).Clear;
        tabAuxiliarVenctos.FieldByName('Valor' + IntToStr(vCnt)).AsFloat := 0;
      end;
      tabAuxiliarVenctos.Post;

      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT * FROM parcelas_pagto WHERE CodigoFormaPagto = ' + FloatToStr(pFormaPagto) + ' ORDER BY Parcela');
      tabChecagens.Open;
      tabAuxiliarVenctos.Edit;
      tabChecagens.First;
      while not tabChecagens.Eof do
      begin
        tabAuxiliarVenctos.FieldByName('DataVencto' + IntToStr(tabChecagens.FieldByName('Parcela').AsInteger)).AsDateTime := pData + tabChecagens.FieldByName('Dias').AsInteger;
        tabAuxiliarVenctos.FieldByName('Valor' + IntToStr(tabChecagens.FieldByName('Parcela').AsInteger)).AsFloat := (tabChecagens.FieldByName('PesoParcela').AsFloat * pTotal) / 100;
        tabChecagens.Next;
      end;
      tabAuxiliarVenctos.Post;
    end;
  finally
    tabChecagens.Close;
  end;
end;

function TfmPedidosVenda.SeTotalDifVenctos: boolean;
var
  vTotal: real;
  vCnt: Integer;
begin
  Result := True;
  vTotal := 0;

  for vCnt := 1 to 12 do
  begin
    vTotal := vTotal + tabAuxiliarVenctos.FieldByName('Valor' + IntToStr(vCnt)).AsFloat;
  end;

  if RoundReal(tabBase.FieldByName('ValorTotal').AsFloat, 2) = RoundReal(vTotal, 2) then
  begin
    Result := False;
  end;
end;

procedure TfmPedidosVenda.edtCodigoProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #32 then
    Key := #0
  else
    Key := UpCase(Key);
end;

procedure TfmPedidosVenda.ObservaesPedido1Click(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfmPedidosVenda.btnExcluirClick(Sender: TObject);
begin
  inherited;
  AtualizaSaldoEstoque;
end;

procedure TfmPedidosVenda.AtualizaSaldoEstoque;
begin
  tabAuxAtualiza.First;
  while not tabAuxAtualiza.Eof do
  begin
    fmMenu.AtualizaEstoque(tabAuxAtualizaCodigoProduto.Value);
    Application.ProcessMessages;
    tabAuxAtualiza.Next;
  end;
end;

procedure TfmPedidosVenda.Produo1Click(Sender: TObject);
var
  vRT: TrtPedidoProducao;
begin
  inherited;
  if Trim(edtPedido.Text) <> '' then
  begin
    fmMenu.pubTrans1 := edtPedido.Text;
    vRT := TrtPedidoProducao.Create(Self);
    vRT.Show;
  end;
end;

procedure TfmPedidosVenda.Administrao1Click(Sender: TObject);
var
  vRT: TrtPedidoAdministracao;
begin
  inherited;
  if Trim(edtPedido.Text) <> '' then
  begin
    fmMenu.pubTrans1 := edtPedido.Text;
    vRT := TrtPedidoAdministracao.Create(Self);
    vRT.Show;
  end;
end;

procedure TfmPedidosVenda.Expedio1Click(Sender: TObject);
var
  vRT: TrtPedidoExpedicao;
begin
  inherited;
  if Trim(edtPedido.Text) <> '' then
  begin
    fmMenu.pubTrans1 := edtPedido.Text;
    vRT := TrtPedidoExpedicao.Create(Self);
    vRT.Show;
  end;
end;

procedure TfmPedidosVenda.ProduoExpedio1Click(Sender: TObject);
var
  vRT: TrtPedidoProducaoExpedicao;
begin
  inherited;
  if Trim(edtPedido.Text) <> '' then
  begin
    fmMenu.pubTrans1 := edtPedido.Text;
    vRT := TrtPedidoProducaoExpedicao.Create(Self);
    vRT.Show;
  end;
end;

procedure TfmPedidosVenda.BaixadaProduo1Click(Sender: TObject);
var
  vFM: TfmBaixaProducao;
begin
  inherited;
  if Trim(edtPedido.Text) <> '' then
  begin
    fmMenu.pubTrans1 := edtPedido.Text;
    vFM := TfmBaixaProducao.Create(Self);
    vFM.Show;
  end;
end;

procedure TfmPedidosVenda.btnOpcoesClick(Sender: TObject);
begin
  if tabBase.FieldByName('DataProducao').IsNull then
  begin
    BaixadaProduo1.Enabled := True;
    GerarFaturamento1.Enabled := False;
    Rastreamento1.Enabled := False;
  end
  else
  begin
    BaixadaProduo1.Enabled := False;
    Rastreamento1.Enabled := False;
    if tabBase.FieldByName('DataEntrega').IsNull then
    begin
      GerarFaturamento1.Enabled := True;
      Rastreamento1.Enabled := False;
    end
    else
    begin
      GerarFaturamento1.Enabled := False;
      Rastreamento1.Enabled := True;
    end;
  end;

  // Habilita a opção de gerar a ordem de produção caso o usuário escolher algum pedido
  // mniOrdemProducaoAutomatica.Enabled := not (tabBase.RecordCount = 0);

  inherited;
end;

procedure TfmPedidosVenda.PackingList1Click(Sender: TObject);
var
  vFM: TfmGerarPackingList;
begin
  inherited;
  if Trim(edtPedido.Text) <> '' then
  begin
    fmMenu.pubTrans1 := edtPedido.Text;
    vFM := TfmGerarPackingList.Create(Self);
    vFM.Show;
  end;
end;

procedure TfmPedidosVenda.GerarFaturamento1Click(Sender: TObject);
var
  vFM: TfmGerarFaturamento;
begin
  inherited;
  if Trim(edtPedido.Text) <> '' then
  begin
    fmMenu.pubTrans1 := edtPedido.Text;
    vFM := TfmGerarFaturamento.Create(Self);
    vFM.Show;
  end;
end;

procedure TfmPedidosVenda.ParticipaodeVendedores1Click(Sender: TObject);
var
  vFM: TfmPedidosParticipacaoVendedores;
begin
  inherited;
  if Trim(edtPedido.Text) <> '' then
  begin
    fmMenu.pubTrans1 := edtPedido.Text;
    vFM := TfmPedidosParticipacaoVendedores.Create(Self);
    vFM.Show;
  end;
end;

procedure TfmPedidosVenda.edtCfopExit(Sender: TObject);
begin
  inherited;
  if tabBase.State in [dsInsert, dsEdit] then
  begin
    if Trim(edtCfop.Text) <> '' then
    begin
      tabBase.FieldByName('CFOP').AsString := FormatarCFOP(edtCfop.Text);
      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT * FROM cfop WHERE CFOP = ' + QuotedSTr(edtCfop.Text));
      tabChecagens.Open;
      tabChecagens.First;
      tabBase.FieldByName('CodigoCFOP').AsFloat := tabChecagens.FieldByName('CodigoCFOP').AsFloat;
      edtNaturezaOperacao.KeyValue := tabChecagens.FieldByName('CodigoCFOP').AsFloat;
    end;
  end;
end;

procedure TfmPedidosVenda.btnLocalizarClick(Sender: TObject);
begin
  inherited;
  if not Assigned(fmLocalizarPedidos) then
  begin
    Application.CreateForm(TfmLocalizarPedidos, fmLocalizarPedidos);
    fmLocalizarPedidos.ShowModal;
  end;
  if Trim(fmMenu.pubTrans1) <> '' then
  begin
    edtPedido.Text := fmMenu.pubTrans1;
    FTyping := True;
    tabBase.Close;
    tabBase.SQL.Clear;
    tabBase.SQL.Add('SELECT * FROM pedidos WHERE NPedido = ' + fmMenu.pubTrans1);
    tabBase.Open;
    FTyping := False;
  end;
end;

procedure TfmPedidosVenda.Recibo1Click(Sender: TObject);
var
  vFM: TrtPedidosRecibo;
begin
  inherited;
  if Trim(edtPedido.Text) <> '' then
  begin
    fmMenu.pubTrans1 := edtPedido.Text;
    vFM := TrtPedidosRecibo.Create(Self);
    vFM.Show;
  end;
end;

procedure TfmPedidosVenda.RtulodoCliente1Click(Sender: TObject);
var
  vRT: TrtRotulosClientes;
begin
  inherited;
  if Trim(edtCodigoCliente.Text) <> '' then
  begin
    fmMenu.pubTrans1 := edtCodigoCliente.Text;
    fmMenu.pubTrans2 := tabBase.FieldByName('QtdCaixas').AsString;
    vRT := TrtRotulosClientes.Create(Self);
    vRT.Show;
  end;
end;

procedure TfmPedidosVenda.EtiquetasdosProdutos1Click(Sender: TObject);
var
  vFM: TfmEtiquetasProdutos_TLP2844;
begin
  inherited;
  if Trim(edtPedido.Text) <> '' then
  begin
    fmMenu.pubTrans1 := edtPedido.Text;
    fmMenu.pubTrans2 := '1';
    vFM := TfmEtiquetasProdutos_TLP2844.Create(Self);
    vFM.Show;
  end;
end;

procedure TfmPedidosVenda.edtNaturezaOperacaoExit(Sender: TObject);
begin
  inherited;
  edtNaturezaOperacao.ListField := 'NaturezaOperacao';
  if tabBase.State in [dsInsert, dsEdit] then
  begin
    if Trim(edtNaturezaOperacao.Text) <> '' then
    begin
      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT * FROM cfop WHERE CodigoCfop = ' + FloatToStr(edtNaturezaOperacao.KeyValue));
      tabChecagens.Open;
      tabChecagens.First;
      tabBase.FieldByName('CFOP').AsString := tabChecagens.FieldByName('CFOP').AsString;
    end;
  end;
end;

procedure TfmPedidosVenda.edtNaturezaOperacaoEnter(Sender: TObject);
begin
  inherited;
  edtNaturezaOperacao.ListField := 'CFOP;NaturezaOperacao';
end;

procedure TfmPedidosVenda.Rastreamento1Click(Sender: TObject);
var
  vFM: TfmRastreamentoPedido;
begin
  inherited;
  if Trim(edtPedido.Text) <> '' then
  begin
    fmMenu.pubTrans1 := edtPedido.Text;
    vFM := TfmRastreamentoPedido.Create(Self);
    vFM.Show;
  end;
end;

procedure TfmPedidosVenda.AtualizarTabelaCorreio(pPedido: real);
var
  vTabTabela, vTabPropri: TZQuery;
begin
  vTabTabela := TZQuery.Create(nil);
  vTabPropri := TZQuery.Create(nil);
  try
    vTabTabela.Connection := fmMenu.zcnConexao;
    vTabPropri.Connection := fmMenu.zcnConexao;

    vTabPropri.Close;
    vTabPropri.SQL.Clear;
    vTabPropri.SQL.Add('SELECT CodigoTranspCorreios FROM configuracoes_proprietario ');
    vTabPropri.Open;

    if vTabPropri.FieldByName('CodigoTranspCorreios').AsFloat = tabBase.FieldByName('CodigoTransportadora').AsFloat then
    begin

      vTabTabela.Close;
      vTabTabela.SQL.Clear;
      vTabTabela.SQL.Add('SELECT * FROM tabela_correio ');
      vTabTabela.SQL.Add('WHERE Pedido = ' + QuotedStr(FloatToStr(pPedido)));
      vTabTabela.Open;

      if vTabTabela.RecordCount = 0 then
      begin
        vTabTabela.Append;
        vTabTabela.FieldByName('ID').AsFloat := CodeGenerator('tabela_correio', 'ID');
        vTabTabela.FieldByName('Pedido').AsFloat := pPedido;
      end
      else
      begin
        vTabTabela.Edit;
      end;
      vTabTabela.FieldByName('Data').AsDateTime := tabBase.FieldByName('Data').AsDateTime;
      vTabTabela.FieldByName('ValorCobrado').AsFloat := tabBase.FieldByName('ValorFrete').AsFloat;
      if vTabTabela.FieldByName('ValorCorreio').AsFloat > 0 then
      begin
        vTabTabela.FieldByName('ValorTotal').AsFloat := vTabTabela.FieldByName('ValorCobrado').AsFloat - vTabTabela.FieldByName('ValorCorreio').AsFloat;
      end
      else
      begin
        vTabTabela.FieldByName('ValorTotal').AsFloat := 0;
      end;

      vTabTabela.Post;
      vTabTabela.ApplyUpdates;

    end;
  finally
    vTabTabela.Close;
    vTabPropri.Close;
    vTabTabela.Free;
    vTabPropri.Free;
  end;
end;

procedure TfmPedidosVenda.mniFinalizarPedidoClick(Sender: TObject);
var
  vFM: TfrmFinalizarPedido;
begin
  inherited;

  if Trim(edtPedido.Text) <> '' then
  begin
    fmMenu.pubTrans1 := edtPedido.Text;
    vFm := TfrmFinalizarPedido.Create(Self);
  end;
end;

{
procedure TfmPedidosVenda.AtualizarDataProducao;
var vTabTemp: TZQuery;
var vPedido : string;
begin
  inherited;
  try
    // if not (tabBase.State in [dsInsert, dsEdit]) then begin
      if (tabBase.RecordCount > 0) then begin

        vTabTemp.Close;
        vTabTemp.SQL.Clear;
        vTabTemp.SQL.Add('SELECT * FROM pedido WHERE NPedido = ' + tabBase.FieldByName('NPedido').AsString);
        vTabTemp.Open;

        if vTabTemp.FieldByName('DataProducao').AsVariant <> tabBase.FieldByName('DataProducao').AsVariant  then begin
         vPedido := tabBase.FieldByName('NPedido').AsString;

         tabBase.Close;
         tabBase.ParamByName('NPedido').AsString := vPedido;
         tabBase.Open;
        end;
      end;
    // end;
  except

  end;

end;
}

procedure TfmPedidosVenda.chkUsarGradeClick(Sender: TObject);
begin
  inherited;
  grpGrades.Visible := chkUsarGrade.Checked;
  cbbGrade.Visible := chkUsarGrade.Checked;

  if chkUsarGrade.Checked then
  begin
    edtQuantidade.Enabled := False;
    edtQuantidade.Text := '';
  end
  else
  begin
    edtQuantidade.Enabled := True;
  end;

end;

procedure TfmPedidosVenda.MudarValorGrade(Sender: TObject);
var
  vQuantidadeTotal: integer;
begin
  inherited;

  if chkUsarGrade.Checked then
  begin
    vQuantidadeTotal := edtGrade1.Value +
      edtGrade2.Value +
      edtGrade3.Value +
      edtGrade4.Value +
      edtGrade5.Value +
      edtGrade6.Value +
      edtGrade7.Value +
      edtGrade8.Value +
      edtGrade9.Value +
      edtGrade10.Value +
      edtGrade11.Value +
      edtGrade12.Value +
      edtGrade13.Value;

      edtQuantidade.Text := IntToStr(vQuantidadeTotal);
  end;

end;

end.


{

Depois para imprimir use o comando ACBrNFe1.NotasFiscais.Items[i].XML.Imprimir;
Consultar uma NFe

Para consultar uma NFe, é possível consultar baseado na Chave da NFe ou carregando o XML da NFe já autorizada.
Exemplo usando a chave da NFe:
ACBrNFe1.WebServices.Consulta.NFeChave := self.NotasFiscais.Items[0].XML.NFeChave;
ACBrNFe1.WebServices.Consulta.Executar;

Exemplo carregando um XML:
ACBrNFe1.NotasFiscais.Clear;
ACBrNFe1.NotasFiscais.Add.XML.LoadFromFile(cPathArquivo);
ACBrNFe1.Consultar;
Cancelar uma NFe

Para cancelar uma NFe, e necessário informar a Chave da NFe, número do protocolo de autorização e uma justificativa para o cancelamento. O cancelamento também é possível ser realizado carregando um XML de uma NFe ou informando os campos citados acima.
Exemplo usando a Chave e Protocolo da NFe:
ACBrNFe1.WebServices.Cancelamento.NFeChave    := chNFe;
ACBrNFe1.WebServices.Cancelamento.Protocolo     := Protocolo;
ACBrNFe1.WebServices.Cancelamento.Justificativa := AJustificativa;

Exemplo carregando um XML
ACBrNFe1.NotasFiscais.Clear;
ACBrNFe1.NotasFiscais.Add.XML.LoadFromFile(cPathArquivo);
if not(InputQuery('WebServices Cancelamento', 'Justificativa', vAux)) then
   exit;
ACBrNFe1.Cancelamento(vAux);
Imprimir uma NFe baseado no XML

Para imprimir uma NFe baseado num XML, basta usar os comandos abaixo:
ACBrNFe1.NotasFiscais.Clear;
ACBrNFe1.NotasFiscais.Add.XML.LoadFromFile(cPathArquivo);
ACBrNFe1.NotasFiscais.Imprimir;
Validar uma NFe

Para validar o XML de uma NFe use os comandos abaixo:
ACBrNFe1.NotasFiscais.Clear;
ACBrNFe1.NotasFiscais.Add.XML.LoadFromFile(cPathArquivo);
ACBrNFe1.NotasFiscais.Valida;

Caso exista algum erro no arquivo, será criada uma exception mostrando a mensagem de erro.
Inutilizar uma faixa de numeração

Para inutilizar uma faixa de numeração da NFe, use o comando abaixo:
ACBrNFe1.WebServices.Inutiliza(CNPJ. Justificativa, Ano, Modelo, Serie, NumeroInicial, NumeroFinal);

}

unit uProcessoNFe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, Menus, StdCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ACBrNFe, Grids, DBGrids, DBClient, Mask,
  ToolEdit, Buttons, ComCtrls, ExtCtrls, ACBrNFeDANFEClass,
  ACBrNFeDANFERave, RpDefine, RpRave, ACBrNFeDANFeQRClass, StrUtils, ACBrUtil,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxButtons, cxControls,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxContainer, cxImage, cxCheckBox,
  cxImageComboBox, cxTextEdit, cxCalendar;

type
  TfmProcessoNFe = class(TfmFormBaseAvancado)
    ACBrNFe1: TACBrNFe;
    tabFatura: TZQuery;
    tabFaturaProdutos: TZQuery;
    tabFaturaVenctos: TZQuery;
    tabConfigPropri: TZQuery;
    tabClientes: TZQuery;
    MemoRetorno: TMemo;
    tabCFOP: TZQuery;
    tabAuxFatura: TClientDataSet;
    dtsAuxFatura: TDataSource;
    dtsFatura: TDataSource;
    tabAuxFaturaFatura: TStringField;
    tabAuxFaturaSerie: TStringField;
    tabAuxFaturaCodigoEmpresa: TFloatField;
    tabAuxFaturaData: TDateField;
    tabAuxFaturaSelecionar: TBooleanField;
    tabUnidades: TZQuery;
    dtsFaturaProdutos: TDataSource;
    tabTransportadoras: TZQuery;
    tabAuxFaturaDestinatario: TStringField;
    tabFornecedor: TZQuery;
    tabAuxFaturaTipo: TStringField;
    tabXML: TZQuery;
    tabDanfeEmails: TClientDataSet;
    tabDanfeEmailsChaveAcesso: TStringField;
    tabDanfeEmailsEmailXML: TStringField;
    tabDanfeEmailsEmailDanfe: TStringField;
    pnl1: TPanel;
    tabChecagens: TZQuery;
    strngfldAuxFaturaSTATUS_TRANSMITIDA: TStringField;
    strngfldAuxFaturaSTATUS_CANCELADO: TStringField;
    strngfldAuxFaturaSTATUS_INUTILIZADO: TStringField;
    strngfldAuxFaturaSTATUS_EMAIL: TStringField;
    strngfldAuxFaturaCHAVE_ACESSO_NFE: TStringField;
    strngfldAuxFaturaPROTOCOLO_NFE: TStringField;
    strngfldAuxFaturaCHAVE2: TStringField;
    strngfldAuxFaturaSTATUS_RETORNO: TStringField;
    mmoMensagem: TMemo;
    edtPastaXML: TDirectoryEdit;
    lbl4: TLabel;
    edtPastaDANFE: TDirectoryEdit;
    lbl5: TLabel;
    strngfldAuxFaturaJUSTIFICATIVA: TStringField;
    lblProducao: TLabel;
    strngfldAuxFaturaXML: TStringField;
    ACBrNFeDANFERave1: TACBrNFeDANFERave;
    mmoCartaoCorrecao: TMemo;
    grp1: TGroupBox;
    edtEmissaoFim: TDateEdit;
    lbl1: TLabel;
    edtEmissaoInicio: TDateEdit;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl6: TLabel;
    edtNotaInicial: TEdit;
    edtNotaFinal: TEdit;
    btnConsultar: TcxButton;
    pnl2: TPanel;
    btnTransmitir: TcxButton;
    btnEnviarEmail: TcxButton;
    btnGerarPDF: TcxButton;
    btnImprimir: TcxButton;
    btnCancelar: TcxButton;
    pgc1: TPageControl;
    ts1: TTabSheet;
    tsDetalheNota: TTabSheet;
    lbl7: TLabel;
    rbData: TRadioButton;
    rbNota: TRadioButton;
    btnCartaCorrecao: TcxButton;
    dbg1: TcxGrid;
    tvwGrid1DBTableView1: TcxGridDBTableView;
    lvlGrid1Level1: TcxGridLevel;
    tabEmpresa: TZQuery;
    strngfldAuxFaturaNomeFantasia: TStringField;
    imgLogo: TImage;
    tabDetalhamentoNota: TZQuery;
    dbgNotas: TcxGrid;
    tvwNotas: TcxGridDBTableView;
    clmNotasSelecionar: TcxGridDBColumn;
    clmNotasSTATUS_TRANSMITIDA: TcxGridDBColumn;
    clmNotasData: TcxGridDBColumn;
    clmNotasFatura: TcxGridDBColumn;
    clmNotasSerie: TcxGridDBColumn;
    clmNotasDestinatario: TcxGridDBColumn;
    clmNotasTipo: TcxGridDBColumn;
    clmNotasSTATUS_CANCELADO: TcxGridDBColumn;
    clmNotasSTATUS_INUTILIZADO: TcxGridDBColumn;
    clmNotasSTATUS_EMAIL: TcxGridDBColumn;
    clmNotasChaveNFe: TcxGridDBColumn;
    clmNotasNProt: TcxGridDBColumn;
    clmNotasJUSTIFICATIVA: TcxGridDBColumn;
    clmNotasNomeFantasia: TcxGridDBColumn;
    lvlNotas: TcxGridLevel;
    rvprjct1: TRvProject;
    btn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Novo(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnTransmitirClick(Sender: TObject);
    procedure Imprimir;
    procedure GerarPDF;
    procedure ACBrNFe1StatusChange(Sender: TObject);
    procedure btnSelecionarTodasClick(Sender: TObject);
    procedure btnBtnCancelamentoClick(Sender: TObject);
    procedure EnviarEmailNFE;
    procedure btnImprimirClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure AtualizaStatusNfe(const iCodigoNfe: string; const sCampoStatus,
      sJustificativa: string);
    function NaoPossuiSelecao(): Boolean;
    procedure btnCartaCorrecaoClick(Sender: TObject);
    procedure btnGerarPDFClick(Sender: TObject);
    procedure btnEnviarEmailClick(Sender: TObject);
    procedure tsDetalheNotaShow(Sender: TObject);
    procedure edtNotaInicialChange(Sender: TObject);
    procedure edtNotaFinalChange(Sender: TObject);
    procedure edtEmissaoInicioChange(Sender: TObject);
    procedure edtEmissaoFimChange(Sender: TObject);
    procedure tvwNotasCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure tvwNotasCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
  private
    procedure AtualizarNotas;
    procedure DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol:
      Integer;
      Column: TColumn; State: TGridDrawState);
  public
    { Public declarations }
  end;

var
  fmProcessoNFe: TfmProcessoNFe;

implementation

uses uFormBase, pcnConversao, uFuncoes, uEnderecos, pcnNFe, uConstantes,
  uDanfe, uStatusNotaFiscalEletronica, uMenu;

{$R *.dfm}

function GetTemporaryDir: string;
var
  pNetpath: array[0..MAX_path - 1] of Char;
  nlength: Cardinal;
begin
  nlength := MAX_path;
  FillChar(pNetpath, SizeOF(pNetpath), #0);
  GetTemppath(nlength, pNetpath);
  Result := StrPas(pNetpath);
end;

procedure TfmProcessoNFe.FormCreate(Sender: TObject);
begin
  inherited;
  // SetFormStyle(fsMDIChild);

  tabConfigPropri.Close;
  tabConfigPropri.SQL.Clear;
  tabConfigPropri.SQL.Add('SELECT * FROM configuracoes_proprietario');
  tabConfigPropri.Open;

  // ACBrNFe1.Configuracoes.Certificados.NumeroSerie := '1DFE6EE11FBB4B97';
  ACBrNFe1.Configuracoes.Certificados.NumeroSerie :=
    tabConfigPropri.FieldByName('NFeNumeroSerie').AsString;
  ACBrNFe1.Configuracoes.Geral.FormaEmissao := teNormal;

  ACBrNFe1.Configuracoes.Geral.PathSalvar := LoadPathNFeSalvar;
  ACBrNFe1.Configuracoes.Geral.PathSchemas :=
    ExtractFilePath(Application.ExeName) + 'Schemas';

  ACBrNFe1.Configuracoes.Geral.Salvar := False;
  ACBrNFe1.Configuracoes.WebServices.UF :=
    tabConfigPropri.FieldByName('Estado').AsString; // **********

  if tabConfigPropri.FieldByName('NFeTipoAmbiente').AsInteger = 0 then
  begin
    // Produção
    ACBrNFe1.Configuracoes.WebServices.Ambiente := taProducao;
    lblProducao.Caption := 'Ambiente: Produção';
    lblProducao.Font.Color := clGreen;
  end
  else
  begin
    // Homologação
    ACBrNFe1.Configuracoes.WebServices.Ambiente := taHomologacao;
    lblProducao.Caption := 'Ambiente: Homologação';
    lblProducao.Font.Color := clRed;
  end;

  ACBrNFe1.Configuracoes.WebServices.Visualizar := False;
  ACBrNFe1.Configuracoes.WebServices.ProxyHost := '';
  ACBrNFe1.Configuracoes.WebServices.ProxyPort := '';
  ACBrNFe1.Configuracoes.WebServices.ProxyUser := '';
  ACBrNFe1.Configuracoes.WebServices.ProxyPass := '';

  // ACBrNFe1.DANFE.TipoDANFE := tiRetrato;
  // ACBrNFe1.DANFE.Logo  := '';

  tabConfigPropri.Close;

end;

procedure TfmProcessoNFe.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tabFatura.Close;
  tabFaturaProdutos.Close;
  tabFaturaVenctos.Close;
  tabConfigPropri.Close;
  tabClientes.Close;
  tabCFOP.Close;
  tabAuxFatura.Close;
  tabUnidades.Close;
  tabTransportadoras.Close;
  tabFornecedor.Close;
  tabDanfeEmails.Close;
  tabChecagens.close;

  inherited;
end;

procedure TfmProcessoNFe.Novo(Sender: TObject);
var
  vChave: string;
begin
  inherited;

  if not (InputQuery('WebServices Consultar', 'Chave da NF-e:', vChave)) then
    exit;

  MemoRetorno.Lines.Clear;

  tabConfigPropri.Close;
  tabConfigPropri.SQL.Clear;
  tabConfigPropri.SQL.Add('SELECT * FROM configuracoes_proprietario');
  tabConfigPropri.Open;

  ACBrNFe1.Configuracoes.Certificados.NumeroSerie := '1DFE6EE11FBB4B97';
  // tabConfigPropri.FieldByName('NFeNumeroSerie').AsString;
  ACBrNFe1.Configuracoes.WebServices.UF :=
    tabConfigPropri.FieldByName('Estado').AsString; // **********
  ACBrNFe1.WebServices.Consulta.NFeChave := vChave;
  ACBrNFe1.WebServices.Consulta.Executar;
end;

procedure TfmProcessoNFe.FormShow(Sender: TObject);
var
  aBmp: TBitmap;
begin
  inherited;

  ACBrNFe1.Configuracoes.Geral.Salvar := False;
  ACBrNFeDANFERave1.RavFile := ExtractFilePath(Application.ExeName) +
    'NotaFiscalEletronica.rav';

  SavePathNFeSchemas;
  // SavePathNFeSalvar;

  edtPastaXML.Text := LoadConfigNFeXMLPath(GetPathProfileUser);
  edtPastaDANFE.Text := LoadConfigNFeDanfePath(GetPathProfileUser);

  ACBrNFe1.Configuracoes.Geral.PathSchemas :=
    ExtractFilePath(Application.ExeName) + 'Schemas';

  tabConfigPropri.Close;
  tabConfigPropri.SQL.Clear;
  tabConfigPropri.SQL.Add('SELECT * FROM configuracoes_proprietario');
  tabConfigPropri.Open;

  edtEmissaoInicio.Date := Date;
  edtEmissaoFim.Date := Date;

  tabAuxFatura.CreateDataSet;
  tabAuxFatura.EmptyDataSet;

  tabDanfeEmails.CreateDataSet;
  tabDanfeEmails.EmptyDataSet;

  tabUnidades.Params.CreateParam(ftString, 'CodigoProduto', ptUnknown);
  tabUnidades.SQL.Add('SELECT unidades.Sigla FROM produtos');
  tabUnidades.SQL.Add(' LEFT JOIN unidades ON unidades.Codigo = produtos.CodigoUnidade');
  tabUnidades.SQL.Add(' WHERE produtos.CodigoProduto = :CodigoProduto');
  tabUnidades.Open;

  tabFaturaProdutos.Params.CreateParam(ftString, 'Fatura', ptUnknown);
  tabFaturaProdutos.Params.CreateParam(ftString, 'Serie', ptUnknown);
  tabFaturaProdutos.Params.CreateParam(ftFloat, 'CodigoEmpresa', ptUnknown);
  tabFaturaProdutos.Params.CreateParam(ftFloat, 'TipoTela', ptUnknown);
  tabFaturaProdutos.SQL.Add('SELECT * FROM faturamento_produtos WHERE');
  tabFaturaProdutos.SQL.Add(' Fatura = :Fatura');
  tabFaturaProdutos.SQL.Add(' AND Serie = :Serie');
  tabFaturaProdutos.SQL.Add(' AND CodigoEmpresa = :CodigoEmpresa');
  tabFaturaProdutos.SQL.Add(' AND TipoTela = :TipoTela');
  tabFaturaProdutos.Open;

  tabFaturaVenctos.Params.CreateParam(ftString, 'Fatura', ptUnknown);
  tabFaturaVenctos.Params.CreateParam(ftString, 'Serie', ptUnknown);
  tabFaturaVenctos.Params.CreateParam(ftFloat, 'CodigoEmpresa', ptUnknown);
  tabFaturaVenctos.Params.CreateParam(ftFloat, 'TipoTela', ptUnknown);
  tabFaturaVenctos.SQL.Add('SELECT * FROM faturamento_vencimentos WHERE');
  tabFaturaVenctos.SQL.Add(' Fatura = :Fatura');
  tabFaturaVenctos.SQL.Add(' AND Serie = :Serie');
  tabFaturaVenctos.SQL.Add(' AND CodigoEmpresa = :CodigoEmpresa');
  tabFaturaVenctos.SQL.Add(' AND TipoTela = :TipoTela');
  tabFaturaVenctos.Open;

  tabClientes.Params.CreateParam(ftFloat, 'CodigoCliente', ptUnknown);
  tabClientes.SQL.Add('SELECT * FROM clientes WHERE CodigoCliente = :CodigoCliente');
  tabClientes.Open;

  tabCFOP.Params.CreateParam(ftFloat, 'CodigoCFOP', ptUnknown);
  tabCFOP.SQL.Add('SELECT * FROM cfop WHERE CodigoCFOP = :CodigoCFOP');
  tabCFOP.Open;

  tabTransportadoras.Params.CreateParam(ftFloat, 'CodigoTransportadora',
    ptUnknown);
  tabTransportadoras.SQL.Add('SELECT * FROM transportadoras WHERE Codigo = :CodigoTransportadora');
  tabTransportadoras.Open;

  tabFornecedor.Params.CreateParam(ftFloat, 'CodigoFornecedor', ptUnknown);
  tabFornecedor.SQL.Add('SELECT * FROM fornecedores WHERE CodigoFornecedor = :CodigoFornecedor');
  tabFornecedor.Open;

  tabXML.SQL.Clear;
  tabXML.Params.Clear;
  tabXML.Params.CreateParam(ftString, 'Fatura', ptUnknown);
  tabXML.Params.CreateParam(ftString, 'Serie', ptUnknown);
  tabXML.Params.CreateParam(ftFloat, 'CodigoEmpresa', ptUnknown);
  tabXML.Params.CreateParam(ftFloat, 'TipoNota', ptUnknown);
  tabXML.SQL.Add('SELECT * ');
  tabXML.SQL.Add('  FROM xml_nfe_clientes ');
  tabXML.SQL.Add(' WHERE NotaFiscal    = :Fatura ');
  tabXML.SQL.Add('   AND Serie         = :Serie ');
  tabXML.SQL.Add('   AND CodigoEmpresa = :CodigoEmpresa ');
  tabXML.SQL.Add('   AND TipoNota      = :TipoNota');
  tabXML.Open;

  tabEmpresa.Params.CreateParam(ftFloat, 'CodigoEmpresa', ptUnknown);
  tabEmpresa.SQL.Add('SELECT * FROM empresas WHERE CodigoEmpresa = :CodigoEmpresa');
  tabEmpresa.Open;

  tabFatura.SQL.Clear;
  tabFatura.Params.Clear;
  tabFatura.Params.CreateParam(ftString, 'Fatura', ptUnknown);
  tabFatura.Params.CreateParam(ftString, 'Serie', ptUnknown);
  tabFatura.Params.CreateParam(ftFloat, 'CodigoEmpresa', ptUnknown);
  tabFatura.Params.CreateParam(ftFloat, 'TipoTela', ptUnknown);
  tabFatura.SQL.Add(' select                                               ');
  tabFatura.SQL.Add('     f.*, x.XML xml2, x.ChaveNFE, x.NProt, x.DataRecbto  ');
  tabFatura.SQL.Add(' from                                                 ');
  tabFatura.SQL.Add('     faturamento f                                    ');
  tabFatura.SQL.Add('         left join                                    ');
  tabFatura.SQL.Add('     xml_nfe_clientes x ON x.NotaFiscal = f.fatura    ');
  tabFatura.SQL.Add('         and x.Serie = f.serie                        ');
  tabFatura.SQL.Add('         and x.TipoNota = f.tipotela                  ');
  tabFatura.SQL.Add('         and x.CodigoEmpresa = f.CodigoEmpresa        ');
  tabFatura.SQL.Add(' where ');
  tabFatura.SQL.Add(' f.Fatura            = :Fatura ');
  tabFatura.SQL.Add(' AND f.Serie         = :Serie ');
  tabFatura.SQL.Add(' AND f.CodigoEmpresa = :CodigoEmpresa ');
  tabFatura.SQL.Add(' AND f.TipoTela      = :TipoTela');
  tabFatura.Open;

  {
  tabDetalhamentoNota.Close;
  tabDetalhamentoNota.Params.Clear;
  tabDetalhamentoNota.Params.CreateParam(ftString, 'ChaveNFe', ptUnknown);
  tabDetalhamentoNota.Params.CreateParam(ftString, 'NProt', ptUnknown);
  tabDetalhamentoNota.SQL.Add(' SELECT * FROM detalhamento_nota WHERE ');
  tabDetalhamentoNota.SQL.Add(' ChaveNFe     = :ChaveNFe ');
  tabDetalhamentoNota.SQL.Add(' and NProt    = :NProt ');
  tabDetalhamentoNota.Open;
  }

  // dbgNotas.OnDrawColumnCell := DrawColumnCell;

  AtualizarNotas;
end;

procedure TfmProcessoNFe.AtualizarNotas;
var
  vTabFatura, vTabEmpresa: TZQuery;
  tmpxml, vChNFe, vNProt: string;
  n : integer;
begin
  vTabFatura := TZQuery.Create(nil);
  vTabFatura.Connection := fmMenu.zcnConexao;

  vTabEmpresa := TZQuery.Create(nil);
  vTabEmpresa.Connection := fmMenu.zcnConexao;

  tabAuxFatura.EmptyDataSet;
  vTabFatura.Close;
  vTabFatura.SQL.Clear;

  vTabFatura.SQL.Add(' select                                               ');
  vTabFatura.SQL.Add('     f.*, x.XML xml2, x.ChaveNFE, x.NProt, x.DataRecbto  ');
  vTabFatura.SQL.Add(' from                                                 ');
  vTabFatura.SQL.Add('     faturamento f                                    ');
  vTabFatura.SQL.Add('         left join                                    ');
  vTabFatura.SQL.Add('     xml_nfe_clientes x ON x.NotaFiscal = f.fatura    ');
  vTabFatura.SQL.Add('         and x.Serie = f.serie                        ');
  vTabFatura.SQL.Add('         and x.TipoNota = f.tipotela                  ');
  vTabFatura.SQL.Add('         and x.CodigoEmpresa = f.CodigoEmpresa        ');
  vTabFatura.SQL.Add(' where ');
  vTabFatura.SQL.Add('         (x.Cancelada=0  or  x.Cancelada is null) and ');

  if rbNota.Checked then
  begin
    if (Trim(edtNotaInicial.Text) = '') or (Trim(edtNotaFinal.Text) = '') then
    begin
      ShowMessage('Obrigatório Preenchimento do Intervalo das Notas');
      edtNotaInicial.SetFocus;
      exit;
    end;

    vTabFatura.SQL.Add(' Fatura >= ' + edtNotaInicial.Text);
    vTabFatura.SQL.Add(' and  Fatura <= ' + edtNotaFinal.Text);
    vTabFatura.SQL.Add(' AND DataCancelamento IS NULL');
    vTabFatura.SQL.Add(' ORDER BY Fatura');
  end
  else
  begin

    vTabFatura.SQL.Add(' Data >= ' + QuotedStr(FormatDateTime(sis_date_format, edtEmissaoInicio.Date)));
    vTabFatura.SQL.Add(' and  Data <= ' +
      QuotedStr(FormatDateTime(sis_date_format, edtEmissaoFim.Date)));
    vTabFatura.SQL.Add(' AND DataCancelamento IS NULL');
    vTabFatura.SQL.Add(' ORDER BY Data, Fatura');
  end;

  vTabFatura.Open;
  vTabFatura.First;

  while not vTabFatura.Eof do
  begin
    if vTabFatura.FieldByName('TipoTela').AsFloat = 1 then
    begin
      tabClientes.Close;
      tabClientes.ParamByName('CodigoCliente').AsFloat :=
        vTabFatura.FieldByName('CodigoConta').AsFloat;
      tabClientes.Open;
    end
    else if vTabFatura.FieldByName('TipoTela').AsFloat = 2 then
    begin
      tabFornecedor.Close;
      tabFornecedor.ParamByName('CodigoFornecedor').AsFloat :=
        vTabFatura.FieldByName('CodigoConta').AsFloat;
      tabFornecedor.Open;
    end;

    tabAuxFatura.Append;
    tabAuxFaturaFatura.Value := vTabFatura.FieldByName('Fatura').AsString;
    if vTabFatura.FieldByName('TipoTela').AsFloat = 1 then
    begin
      tabAuxFaturaDestinatario.Value :=
        tabClientes.FieldByName('NomeFantasia').AsString;
      tabAuxFaturaTipo.Value := 'Cliente';
    end
    else if vTabFatura.FieldByName('TipoTela').AsFloat = 2 then
    begin
      tabAuxFaturaDestinatario.Value :=
        tabFornecedor.FieldByName('NomeFantasia').AsString;
      tabAuxFaturaTipo.Value := 'Fornecedor';
    end;

    tabAuxFaturaSerie.Value := vTabFatura.FieldByName('Serie').AsString;

    vTabEmpresa.Close;
    vTabEmpresa.SQL.Clear;
    vTabEmpresa.SQL.Add(' SELECT NomeFantasia FROM empresas WHERE CodigoEmpresa =  ' + vTabFatura.FieldByName('CodigoEmpresa').AsString);
    vTabEmpresa.Open;
    tabAuxFatura.FieldByName('NomeFantasia').AsString := vTabEmpresa.FieldByName('NomeFantasia').AsString;
    vTabEmpresa.Close;

    tabAuxFaturaCodigoEmpresa.Value := vTabFatura.FieldByName('CodigoEmpresa').AsFloat;

    tabAuxFaturaData.Value := vTabFatura.FieldByName('Data').AsDateTime;
    tabAuxFaturaSelecionar.Value := False;

    if not vTabFatura.FieldByName('STATUS_CANCELADO').IsNull then
    begin
      tabAuxFatura.FieldByName('STATUS_CANCELADO').AsString := vTabFatura.FieldByName('STATUS_CANCELADO').AsString;
    end
    else
    begin
      tabAuxFatura.FieldByName('STATUS_CANCELADO').AsString := 'N';
    end;

    if not vTabFatura.FieldByName('STATUS_INUTILIZADO').IsNull then
    begin
      tabAuxFatura.FieldByName('STATUS_INUTILIZADO').AsString := vTabFatura.FieldByName('STATUS_INUTILIZADO').AsString;
    end
    else
    begin
      tabAuxFatura.FieldByName('STATUS_INUTILIZADO').AsString := 'N';
    end;

    if not vTabFatura.FieldByName('STATUS_EMAIL').IsNull then
    begin
      tabAuxFatura.FieldByName('STATUS_EMAIL').AsString := vTabFatura.FieldByName('STATUS_EMAIL').AsString;
    end
    else
    begin
      tabAuxFatura.FieldByName('STATUS_EMAIL').AsString := 'N';
    end;

    tabAuxFatura.FieldByName('JUSTIFICATIVA').AsString := vTabFatura.FieldByName('JUSTIFICATIVA').AsString;

    if vTabFatura.FieldByName('xml2').IsNull then
    begin
      tabAuxFatura.FieldByName('STATUS_TRANSMITIDA').AsString := 'N';
    end
    else
    begin
      tabAuxFatura.FieldByName('STATUS_TRANSMITIDA').AsString := 'S';

      // Gero a chave e o protocolo
      if vTabFatura.FieldByName('NProt').IsNull or vTabFatura.FieldByName('ChaveNFe').IsNull then
      begin
        tabXML.Close;
        tabXML.Parambyname('Fatura').AsString := tabAuxFaturaFatura.AsString;
        tabXML.Parambyname('Serie').AsString := tabAuxFaturaSerie.AsString;
        tabXML.Parambyname('CodigoEmpresa').AsFloat := tabAuxFaturaCodigoEmpresa.AsFloat;
        tabXML.Parambyname('TipoNota').AsFloat := Self.Tag;
        tabXML.Open;

        tmpxml := GetTemporaryDir + 'temp' + '.xml';

        if FileExists(tmpxml) then
        begin
          DeleteFile(tmpxml);
        end;

        TBlobField(vtabFatura.FieldByName('XML2')).SaveToFile(tmpxml);

        ACBrNFe1.NotasFiscais.Clear;
        ACBrNFe1.NotasFiscais.LoadFromFile(tmpxml);

        //**
        for n:=0 to ACBrNFe1.NotasFiscais.Count-1 do
        begin
          with ACBrNFe1.NotasFiscais.Items[n].NFe do
          begin
            vChNFe := procNFe.chNFe;
            vNProt := procNFe.nProt;
          end;
        end;

        tabXML.Edit;
        tabXML.FieldByName('ChaveNFe').AsString := vChNFe;
        tabXML.FieldByName('NProt').AsString    := vNProt;
        tabXML.Post;
        tabXML.ApplyUpdates;
      end;

      if vTabFatura.FieldByName('NProt').IsNull then
      begin
        tabAuxFatura.FieldByName('NProt').AsString := vNProt;
      end
      else
      begin
        tabAuxFatura.FieldByName('NProt').AsString := vTabFatura.FieldByName('NProt').AsString;
      end;

      if vTabFatura.FieldByName('ChaveNFe').IsNull then
      begin
        tabAuxFatura.FieldByName('ChaveNFe').AsString := vChNFe;
      end
      else
      begin
        tabAuxFatura.FieldByName('ChaveNFe').AsString := vTabFatura.FieldByName('ChaveNFe').AsString;
      end;

    end;

    tabAuxFatura.Post;

    vTabFatura.Next;
  end;

  tabAuxFatura.First;
end;

procedure TfmProcessoNFe.DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

end;

procedure TfmProcessoNFe.btnTransmitirClick(Sender: TObject);
var
  vItem, vCnt: Integer;
  vAprovTexto: string;
  vTMS: TStringStream;
begin
  inherited;

  try
    Screen.Cursor := crHourGlass;

    // Verifica se marcou alguma fatura
    if NaoPossuiSelecao then
    begin
      ShowMessage('Marque alguma Fatura');
      Exit;
    end;

    // Verifica se a pasta de armazenamento de XML existe
    if not DirectoryExists(edtPastaXML.Text) then
    begin
      ShowMessage('Pasta com os arquivos XML não existe');
      edtPastaXML.SetFocus;
      exit;
    end;

    // Verifica se a pasta de armazenamento de Danfe(pdf) existe
    if not DirectoryExists(edtPastaDANFE.Text) then
    begin
      ShowMessage('Pasta com os arquivos DANFE não existe');
      edtPastaDANFE.SetFocus;
      exit;
    end;

    try
      // Desativa controles
      tabAuxFatura.DisableControls;

      //Limpa a tela de status
      MemoRetorno.Lines.Clear;

      // Configurações padrão
      tabConfigPropri.Close;
      tabConfigPropri.SQL.Clear;
      tabConfigPropri.SQL.Add('SELECT * FROM configuracoes_proprietario');
      tabConfigPropri.Open;

      // Limpando notas fiscais
      ACBrNFe1.NotasFiscais.Clear;

      // Define o caminho da pasta de XML
      ACBrNFe1.Configuracoes.Geral.PathSalvar := edtPastaXML.Text;

      // Número de série
      ACBrNFe1.Configuracoes.Certificados.NumeroSerie := tabConfigPropri.FieldByName('NFeNumeroSerie').AsString;

      // Emissão normal
      ACBrNFe1.Configuracoes.Geral.FormaEmissao := teNormal;

      // UF destinatário
      ACBrNFe1.Configuracoes.WebServices.UF := tabConfigPropri.FieldByName('NFeUFDest').AsString;

      // Não visualizar PDF
      ACBrNFe1.Configuracoes.WebServices.Visualizar := False;

      // Primeiro registro
      tabAuxFatura.First;

      // Varre os registros e processa o selecionado
      while not tabAuxFatura.Eof do
      begin

        // Se a nota foi selecionada
        if tabAuxFaturaSelecionar.Value = True then
        begin

          // Procura a Nota Fiscal
          tabFatura.Close;
          tabFatura.Parambyname('Fatura').AsString := tabAuxFaturaFatura.AsString;
          tabFatura.Parambyname('Serie').AsString := tabAuxFaturaSerie.AsString;
          tabFatura.Parambyname('CodigoEmpresa').AsFloat := tabAuxFaturaCodigoEmpresa.AsFloat;
          tabFatura.Parambyname('TipoTela').AsFloat := Self.Tag;
          tabFatura.Open;

          // Se encontrou a nota
          if tabFatura.RecordCount = 1 then
          begin

            tabXML.Close;
            tabXML.Parambyname('Fatura').AsString := tabAuxFaturaFatura.AsString;
            tabXML.Parambyname('Serie').AsString := tabAuxFaturaSerie.AsString;
            tabXML.Parambyname('CodigoEmpresa').AsFloat := tabAuxFaturaCodigoEmpresa.AsFloat;
            tabXML.Parambyname('TipoNota').AsFloat := Self.Tag;
            tabXML.Open;

            if tabXML.RecordCount > 0 then
            begin
              MemoRetorno.Lines.Add('NFe já enviada... Fatura: ' + tabFatura.FieldByName('FATURA').AsString);
              
              if fmMenu.pubNomeComputador = 'FABIO-PC' then
              begin
                if Application.MessageBox('Deseja Realmente Excluir a transmissao?', PChar(Application.Title), 36) = mrYes then
                begin
                  tabXML.Delete;
                  tabXML.ApplyUpdates;
                end;
              end;

              tabAuxFatura.Next;
              continue;
            end;

            if tabFatura.FieldByName('TipoTela').AsFloat = 1 then
            begin
              tabClientes.Close;
              tabClientes.ParamByName('CodigoCliente').AsFloat :=
                tabFatura.FieldByName('CodigoConta').AsFloat;
              tabClientes.Open;
            end
            else if tabFatura.FieldByName('TipoTela').AsFloat = 2 then
            begin
              tabFornecedor.Close;
              tabFornecedor.ParamByName('CodigoFornecedor').AsFloat :=
                tabFatura.FieldByName('CodigoConta').AsFloat;
              tabFornecedor.Open;
            end;

            tabCFOP.Close;
            tabCFOP.ParamByName('CodigoCFOP').AsFloat :=
              tabFatura.FieldByName('CodigoCFOP').AsFloat;
            tabCFOP.Open;

            tabTransportadoras.Close;
            tabTransportadoras.ParamByName('CodigoTransportadora').AsFloat :=
              tabFatura.FieldByName('CodigoTransportadora').AsFloat;
            tabTransportadoras.Open;

            with ACBrNFe1.NotasFiscais.Add.NFE do
            begin

              Ide.natOp := tabCFOP.FieldByName('NaturezaOperacao').AsString;
              //Ide.cNF:=?; // * (não preencho, deixo o componente gerar um numero aleatório) *
              Ide.nNF := StrToInt(tabFatura.FieldByName('Fatura').AsString);
              Ide.modelo := 55;
              Ide.serie := StrToInt(tabFatura.FieldByName('Serie').AsString);
              Ide.dEmi := tabFatura.FieldByName('Data').AsDateTime;
              //Ide.dSaiEnt:= Date; // * (transportadora preenche manual)
              //Ide.hSaiEnt:= Now;  // * (transportadora preenche manual)

              if tabFatura.FieldByName('TipoNota').AsFloat = 1 then
              begin
                Ide.tpNF := tnSaida;
              end
              else if tabFatura.FieldByName('TipoNota').AsFloat = 2 then
              begin
                Ide.tpNF := tnEntrada;
              end;

              if tabFatura.FieldByName('NFEFormaPagto').AsString = '0' then
              begin
                Ide.indPag := ipVista;
              end
              else if tabFatura.FieldByName('NFEFormaPagto').AsString = '1' then
              begin
                Ide.indPag := ipPrazo;
              end
              else if tabFatura.FieldByName('NFEFormaPagto').AsString = '2' then
              begin
                Ide.indPag := ipOutras;
              end;

              case tabConfigPropri.FieldByName('NFeFormaEmissao').AsInteger of
                0: Ide.tpEmis := teNormal;
                1: Ide.tpEmis := teContingencia;
                2: Ide.tpEmis := teSCAN;
                3: Ide.tpEmis := teDPEC;
                4: Ide.tpEmis := teFSDA;
              end;

              tabConfigPropri.Close;
              tabConfigPropri.SQL.Clear;
              tabConfigPropri.SQL.Add('SELECT * FROM configuracoes_proprietario');
              tabConfigPropri.Open;

              if tabConfigPropri.FieldByName('NFeTipoAmbiente').AsInteger = 0 then
              begin
                // Produção
                Ide.tpAmb := taProducao;
              end
              else
              begin
                // Homologação
                Ide.tpAmb := taHomologacao;
              end;

              Ide.verProc := '2.0.0.0'; // * verificar o que preencher aqui *
              Ide.cUF :=
                GetCodigoUF(tabConfigPropri.FieldByName('Estado').AsString);
              Ide.cMunFG :=
                tabConfigPropri.FieldByName('CodigoCidade').AsInteger;
              Ide.finNFe := fnNormal; // / Normal / Complementar / Ajuste /

              Emit.CNPJCPF :=
                Desformatar(tabConfigPropri.FieldByName('CNPJ').AsString);
              Emit.IE :=
                Desformatar(tabConfigPropri.FieldByName('IE').AsString);
              Emit.xNome := tabConfigPropri.FieldByName('RazaoSocial').AsString;
              Emit.xFant :=
                tabConfigPropri.FieldByName('NomeFantasia').AsString;
              Emit.EnderEmit.fone :=
                tabConfigPropri.FieldByName('Telefone').AsString;
              Emit.EnderEmit.CEP :=
                StrToInt(Desformatar(tabConfigPropri.FieldByName('Cep').AsString));
              Emit.EnderEmit.xLgr :=
                tabConfigPropri.FieldByName('Endereco').AsString;
              Emit.EnderEmit.nro :=
                tabConfigPropri.FieldByName('Numero').AsString;
              Emit.EnderEmit.xCpl := '';
              Emit.EnderEmit.xBairro :=
                tabConfigPropri.FieldByName('Bairro').AsString;
              if Trim(tabConfigPropri.FieldByName('CodigoCidade').AsString) <> '' then
              begin
                Emit.EnderEmit.cMun :=
                  tabConfigPropri.FieldByName('CodigoCidade').AsInteger;
                Emit.EnderEmit.xMun :=
                  LocateCidade(tabConfigPropri.FieldByName('CodigoCidade').AsString);
              end;
              Emit.EnderEmit.UF :=
                tabConfigPropri.FieldByName('Estado').AsString;

              case tabConfigPropri.FieldByName('CRT').AsInteger of
                1: Emit.CRT := crtSimplesNacional;
                2: Emit.CRT := crtSimplesExcessoReceita;
                3: Emit.CRT := crtRegimeNormal;
              end;

              if tabFatura.FieldByName('TipoTela').AsFloat = 1 then
              begin
                Dest.CNPJCPF :=
                  Desformatar(tabClientes.FieldByName('CpfCnpj').AsString);
                if Desformatar(Trim(tabClientes.FieldByName('Cep').AsString)) <>
                  '' then
                begin
                  Dest.EnderDest.CEP :=
                    StrToInt(Desformatar(tabClientes.FieldByName('Cep').AsString));
                end;
                Dest.EnderDest.cPais :=
                  StrToInt(tabClientes.FieldByName('CodigoPais').AsString);
                Dest.EnderDest.xPais :=
                  LocatePais(tabClientes.FieldByName('CodigoPais').AsString);
                Dest.EnderDest.xLgr :=
                  tabClientes.FieldByName('Endereco').AsString;
                Dest.EnderDest.nro :=
                  tabClientes.FieldByName('Numero').AsString;
                Dest.EnderDest.xCpl :=
                  tabClientes.FieldByName('Complemento').AsString;
                Dest.EnderDest.xBairro :=
                  tabClientes.FieldByName('Bairro').AsString;
                Dest.EnderDest.UF := tabClientes.FieldByName('Estado').AsString;
                if Trim(tabClientes.FieldByName('CodigoCidade').AsString) <> '' then
                begin
                  Dest.EnderDest.cMun :=
                    tabClientes.FieldByName('CodigoCidade').AsInteger;
                  Dest.EnderDest.xMun :=
                    LocateCidade(tabClientes.FieldByName('CodigoCidade').AsString);
                end
                else if tabCFOP.FieldByName('CFOP').AsString[1] = '7' then
                begin
                  Dest.EnderDest.cMun := 9999999;
                  Dest.EnderDest.xMun := 'EXTERIOR';
                  Dest.EnderDest.UF := 'EX';
                end;
                Dest.EnderDest.fone :=
                  tabClientes.FieldByName('Telefone1').AsString;
                Dest.IE :=
                  Desformatar(tabClientes.FieldByName('IeRg').AsString);
                Dest.xNome := tabClientes.FieldByName('RazaoSocial').AsString;
                Dest.Email := tabClientes.FieldByName('EmailNfeXML').AsString;
              end
              else if tabFatura.FieldByName('TipoTela').AsFloat = 2 then
              begin
                Dest.CNPJCPF :=
                  Desformatar(tabFornecedor.FieldByName('CpfCnpj').AsString);
                if Desformatar(Trim(tabFornecedor.FieldByName('Cep').AsString))
                  <> '' then
                begin
                  Dest.EnderDest.CEP :=
                    StrToInt(Desformatar(tabFornecedor.FieldByName('Cep').AsString));
                end;
                Dest.EnderDest.cPais :=
                  StrToInt(tabFornecedor.FieldByName('CodigoPais').AsString);
                Dest.EnderDest.xPais :=
                  LocatePais(tabFornecedor.FieldByName('CodigoPais').AsString);
                Dest.EnderDest.xLgr :=
                  tabFornecedor.FieldByName('Endereco').AsString;
                Dest.EnderDest.nro :=
                  tabFornecedor.FieldByName('Numero').AsString;
                Dest.EnderDest.xCpl :=
                  tabFornecedor.FieldByName('Complemento').AsString;
                Dest.EnderDest.xBairro :=
                  tabFornecedor.FieldByName('Bairro').AsString;
                Dest.EnderDest.UF :=
                  tabFornecedor.FieldByName('Estado').AsString;
                if Trim(tabFornecedor.FieldByName('CodigoCidade').AsString) <> '' then
                begin
                  Dest.EnderDest.cMun :=
                    tabFornecedor.FieldByName('CodigoCidade').AsInteger;
                  Dest.EnderDest.xMun :=
                    LocateCidade(tabFornecedor.FieldByName('CodigoCidade').AsString);
                end
                else if tabCFOP.FieldByName('CFOP').AsString[1] = '7' then
                begin
                  Dest.EnderDest.cMun := 9999999;
                  Dest.EnderDest.xMun := 'EXTERIOR';
                  Dest.EnderDest.UF := 'EX';
                end;

                Dest.EnderDest.fone :=
                  tabFornecedor.FieldByName('Telefone1').AsString;
                Dest.IE :=
                  Desformatar(tabFornecedor.FieldByName('IeRg').AsString);
                Dest.xNome := tabFornecedor.FieldByName('RazaoSocial').AsString;
                Dest.Email := tabFornecedor.FieldByName('EmailNfeXML').AsString;
              end;

              vItem := 0;

              tabFaturaProdutos.Close;
              tabFaturaProdutos.ParamByName('Fatura').AsString := tabFatura.FieldByName('Fatura').AsString;
              tabFaturaProdutos.ParamByName('Serie').AsString := tabFatura.FieldByName('Serie').AsString;
              tabFaturaProdutos.ParamByName('CodigoEmpresa').AsFloat := tabFatura.FieldByName('CodigoEmpresa').AsFloat;
              tabFaturaProdutos.ParamByName('TipoTela').AsFloat := tabFatura.FieldByName('TipoTela').AsFloat;
              tabFaturaProdutos.Open;

              tabFaturaProdutos.First;
              while not tabFaturaProdutos.Eof do
              begin

                tabUnidades.Close;
                tabUnidades.ParamByName('CodigoProduto').AsString :=
                  tabFaturaProdutos.FieldByName('CodigoProduto').AsString;
                tabUnidades.Open;

                vItem := vItem + 1;

                //produtos
                with Det.Add do
                begin
                  Prod.nItem := vItem;
                  Prod.cProd :=
                    tabFaturaProdutos.FieldByName('CodigoProduto').AsString;
                  Prod.cEAN := '';
                  Prod.xProd :=
                    tabFaturaProdutos.FieldByName('Descricao').AsString;
                  Prod.NCM :=
                    Desformatar(tabFaturaProdutos.FieldByName('NCM').AsString);
                  Prod.EXTIPI := '';
                  Prod.CFOP :=
                    Desformatar(tabCFOP.FieldByName('CFOP').AsString);
                  Prod.cEANTrib := '';

                  Prod.uCom :=
                    UpperCase(RemoverAcentos(tabUnidades.FieldByName('Sigla').AsString));
                  Prod.qCom :=
                    tabFaturaProdutos.FieldByName('Quantidade').AsFloat;
                  Prod.vUnCom := tabFaturaProdutos.FieldByName('Valor').AsFloat;

                  Prod.uTrib :=
                    UpperCase(RemoverAcentos(tabUnidades.FieldByName('Sigla').AsString));
                  Prod.qTrib :=
                    tabFaturaProdutos.FieldByName('Quantidade').AsFloat;
                  Prod.vUnTrib :=
                    tabFaturaProdutos.FieldByName('Valor').AsFloat;

                  Prod.vProd :=
                    tabFaturaProdutos.FieldByName('ValorTotal').AsFloat;

                  if vItem = 1 then
                  begin
                    if tabFatura.FieldByName('ValorFrete').AsFloat > 0 then
                      Prod.vFrete := tabFatura.FieldByName('ValorFrete').AsFloat
                    else
                      Prod.vFrete := 0;
                    if tabFatura.FieldByName('ValorSeguro').AsFloat > 0 then
                      Prod.vSeg := tabFatura.FieldByName('ValorSeguro').AsFloat
                    else
                      Prod.vSeg := 0;
                    if tabFatura.FieldByName('ValorDesconto').AsFloat > 0 then
                      Prod.vDesc :=
                        tabFatura.FieldByName('ValorDesconto').AsFloat
                    else
                      Prod.vDesc := 0;
                  end;

                  infAdProd := '';

                  // CFOP Começados com "3" Importação
                  if tabCFOP.FieldByName('CFOP').AsString[1] = '3' then
                  begin
                    with Prod.DI.Add do
                    begin
                      nDi := tabFatura.FieldByName('NDI').AsString;
                      dDi := tabFatura.FieldByName('DataDI').AsDateTime;
                      xLocDesemb :=
                        tabFatura.FieldByName('LocalDesembaraco').AsString;
                      UFDesemb :=
                        tabFatura.FieldByName('UFDesembaraco').AsString;
                      dDesemb :=
                        tabFatura.FieldByName('DataDesembaraco').AsDateTime;
                      cExportador :=
                        tabFatura.FieldByName('CodigoExportador').AsString;
                      // Adições da Importação
                      with adi.Add do
                      begin
                        nAdicao := vItem;
                        nSeqAdi := vItem;
                        cFabricante := '';
                        vDescDI := 0;
                      end;
                    end;
                  end;

                  with Imposto.ICMS do
                  begin

                    {
                    CST := cst00;
                    orig := oeNacional;
                    modBC := dbiValorOperacao;
                    vBC := 100;
                    pICMS := 18;
                    vICMS := 18;
                    modBCST := dbisMargemValorAgregado;
                    pMVAST := 0;
                    pRedBCST:= 0;
                    vBCST := 0;
                    pICMSST := 0;
                    vICMSST := 0;
                    pRedBC := 0;
                    }

                    if Emit.CRT = crtSimplesNacional then
                    begin
                      if tabFatura.FieldByName('CSTCSOSN').AsString = '101' then
                      begin
                        CSOSN := csosn101;
                        orig := oeNacional;
                        pCredSN :=
                          tabConfigPropri.FieldByName('AliqAprov').AsFloat;
                        vCredICMSSN :=
                          (tabFaturaProdutos.FieldByName('ValorTotal').AsFloat *
                          tabConfigPropri.FieldByName('AliqAprov').AsFloat) /
                          100;

                        vAprovTexto := 'PERMITE O APROVEITAMENTO DO CREDITO DE ICMS NO VALOR DE '
                          +
                          FormatFloat(sis_curr_format, vCredICMSSN) +
                          ' CORRESPONDENTE A ALIQUOTA DE ' +
                          FloatToStr(tabConfigPropri.FieldByName('AliqAprov').AsFloat) + ' NOS TERMOS DO ARTIGO 23 DA LC 123/06.';
                      end
                      else if tabFatura.FieldByName('CSTCSOSN').AsString = '102' then
                      begin
                        CSOSN := csosn102;
                        orig := oeNacional;
                      end
                      else if tabFatura.FieldByName('CSTCSOSN').AsString = '103' then
                      begin
                        CSOSN := csosn103;
                        orig := oeNacional;
                      end
                      else if tabFatura.FieldByName('CSTCSOSN').AsString = '201' then
                      begin
                        CSOSN := csosn201;
                        orig := oeNacional;
                      end
                      else if tabFatura.FieldByName('CSTCSOSN').AsString = '202' then
                      begin
                        CSOSN := csosn202;
                        orig := oeNacional;
                      end
                      else if tabFatura.FieldByName('CSTCSOSN').AsString = '203' then
                      begin
                        CSOSN := csosn203;
                        orig := oeNacional;
                      end
                      else if tabFatura.FieldByName('CSTCSOSN').AsString = '300' then
                      begin
                        CSOSN := csosn300;
                        orig := oeNacional;
                      end
                      else if tabFatura.FieldByName('CSTCSOSN').AsString = '400' then
                      begin
                        CSOSN := csosn400;
                        orig := oeNacional;
                      end
                      else if tabFatura.FieldByName('CSTCSOSN').AsString = '500' then
                      begin
                        CSOSN := csosn500;
                        orig := oeNacional;
                      end
                      else if tabFatura.FieldByName('CSTCSOSN').AsString = '900' then
                      begin
                        CSOSN := csosn900;
                        orig := oeNacional;
                        //modBC:=0;
                        vBC := 0;
                        pRedBC := 0;
                        pICMS := 0;
                        vICMS := 0;
                        //modBCST:=0;
                        pMVAST := 0;
                        pRedBCST := 0;
                        vBCST := 0;
                        pICMSST := 0;
                        vICMSST := 0;
                        pCredSN := 0;
                        vCredICMSSN := 0;
                      end;
                    end
                    else if Emit.CRT = crtRegimeNormal then
                    begin

                    end
                    else if Emit.CRT = crtSimplesExcessoReceita then
                    begin

                    end;
                  end;

                  with Imposto.IPI do
                  begin
                    CST := ipi99;
                    clEnq := '999';
                    CNPJProd := '';
                    cSelo := '';
                    qSelo := 0;
                    cEnq := '';

                    vBC := 0;
                    qUnid := 0;
                    vUnid := 0;
                    pIPI := 0;
                    vIPI := 0;
                  end;

                  with Imposto.PIS do
                  begin
                    CST := pis99;
                    vBC := 0;
                    pPis := 0;
                    vPis := 0;
                  end;

                  with Imposto.COFINS do
                  begin
                    CST := cof99;
                    vBC := 0;
                    pCOFINS := 0;
                    vCOFINS := 0;
                  end;

                end;

                tabFaturaProdutos.Next;
              end;

              // Totais da Nota
              with Total.ICMSTot do
              begin
                vBC := 0;
                // ?  quando colocar ? e quando não ? tabFaturamento.FieldByName('ValorProdutos').AsFloat;
                vICMS := 0;
                vBCST := 0;
                vST := 0;
                vProd := tabFatura.FieldByName('ValorProdutos').AsFloat;
                vFrete := tabFatura.FieldByName('ValorFrete').AsFloat;
                vSeg := tabFatura.FieldByName('ValorSeguro').AsFloat;
                vDesc := tabFatura.FieldByName('ValorDesconto').AsFloat;
                vII := 0;
                vIPI := 0;
                vPIS := 0;
                vCOFINS := 0;
                vOutro := tabFatura.FieldByName('ValorAcrescimo').AsFloat;
                vNF := tabFatura.FieldByName('ValorTotal').AsFloat;
              end;

              // Transportadora
              with Transp do
              begin

                case tabFatura.FieldByName('FreteConta').AsInteger of
                  0: modFrete := mfContaEmitente;
                  1: modFrete := mfContaDestinatario;
                  2: modFrete := mfContaTerceiros;
                  9: modFrete := mfSemFrete;
                end;

                if tabFatura.FieldByName('CodigoTransportadora').AsFloat > 0 then
                begin
                  if tabTransportadoras.FieldByName('Nome').AsString = 'CLIENTE' then
                  begin
                    Transporta.CNPJCPF :=
                      Desformatar(tabClientes.FieldByName('CpfCnpj').AsString);
                    Transporta.xNome :=
                      tabClientes.FieldByName('RazaoSocial').AsString;
                    Transporta.IE :=
                      Desformatar(tabClientes.FieldByName('IeRg').AsString);
                    Transporta.xEnder :=
                      tabClientes.FieldByName('Endereco').AsString + ', ' +
                      tabClientes.FieldByName('Numero').AsString;
                    Transporta.xMun :=
                      LocateCidade(tabClientes.FieldByName('CodigoCidade').AsString);
                    Transporta.UF := tabClientes.FieldByName('Estado').AsString;
                  end
                  else if tabTransportadoras.FieldByName('Nome').AsString =
                    'FORNECEDOR' then
                  begin
                    Transporta.CNPJCPF :=
                      Desformatar(tabFornecedor.FieldByName('CpfCnpj').AsString);
                    Transporta.xNome :=
                      tabFornecedor.FieldByName('RazaoSocial').AsString;
                    Transporta.IE :=
                      Desformatar(tabFornecedor.FieldByName('IeRg').AsString);
                    Transporta.xEnder :=
                      tabFornecedor.FieldByName('Endereco').AsString + ', ' +
                      tabFornecedor.FieldByName('Numero').AsString;
                    Transporta.xMun :=
                      LocateCidade(tabFornecedor.FieldByName('CodigoCidade').AsString);
                    Transporta.UF :=
                      tabFornecedor.FieldByName('Estado').AsString;
                  end
                  else
                  begin
                    Transporta.CNPJCPF :=
                      Desformatar(tabTransportadoras.FieldByName('CNPJ').AsString);
                    Transporta.xNome :=
                      tabTransportadoras.FieldByName('Nome').AsString;
                    Transporta.IE :=
                      Desformatar(tabTransportadoras.FieldByName('IE').AsString);
                    Transporta.xEnder :=
                      tabTransportadoras.FieldByName('Endereco').AsString + ', '
                      +
                      tabTransportadoras.FieldByName('Numero').AsString;
                    Transporta.xMun :=
                      LocateCidade(tabTransportadoras.FieldByName('CodigoCidade').AsString);
                    Transporta.UF :=
                      tabTransportadoras.FieldByName('Estado').AsString;
                  end;
                  veicTransp.placa := '';
                  veicTransp.UF := '';
                  veicTransp.RNTC := '';
                end;

                with Vol.Add do
                begin
                  qVol := tabFatura.FieldByName('QtdVolumes').AsInteger;
                  esp := tabFatura.FieldByName('Especie').AsString;
                  marca := tabFatura.FieldByName('Marca').AsString;
                  nVol := '';
                  if Trim(tabFatura.FieldByName('PesoLiquido').AsString) <> '' then
                  begin
                    //pesoL:=StrToFloat(StringReplace(tabFatura.FieldByName('PesoLiquido').AsString, ',', '.', [rfReplaceAll]));
                    pesoL :=
                      StrToFloat(tabFatura.FieldByName('PesoLiquido').AsString);
                  end;
                  if Trim(tabFatura.FieldByName('PesoBruto').AsString) <> '' then
                  begin
                    //pesoB:=StrToFloat(StringReplace(tabFatura.FieldByName('PesoBruto').AsString, ',', '.', [rfReplaceAll]));
                    pesoB :=
                      StrToFloat(tabFatura.FieldByName('PesoBruto').AsString);
                  end;
                end;
              end;

              tabFaturaVenctos.Close;
              tabFaturaVenctos.ParamByName('Fatura').AsString := tabFatura.FieldByName('Fatura').AsString;
              tabFaturaVenctos.ParamByName('Serie').AsString := tabFatura.FieldByName('Serie').AsString;
              tabFaturaVenctos.ParamByName('CodigoEmpresa').AsFloat := tabFatura.FieldByName('CodigoEmpresa').AsFloat;
              tabFaturaVenctos.ParamByName('TipoTela').AsFloat := tabFatura.FieldByName('TipoTela').AsFloat;
              tabFaturaVenctos.Open;

              for vCnt := 1 to 12 do
              begin
                if tabFaturaVenctos.FieldByName('Valor' + IntToStr(vCnt)).AsFloat
                  > 0 then
                begin
                  with Cobr.Dup.Add do
                  begin
                    nDup := tabFaturaVenctos.FieldByName('Fatura').AsString + '-'
                      + IntToStr(vCnt);
                    dVenc := tabFaturaVenctos.FieldByName('DataVencto' +
                      IntToStr(vCnt)).AsDateTime;
                    vDup := tabFaturaVenctos.FieldByName('Valor' +
                      IntToStr(vCnt)).AsFloat;
                  end;
                end;
              end;

               InfAdic.infCpl := RemoverAcentos(Copy(tabConfigPropri.FieldByName('ObsNF1').AsString, 1, 76))+
                                 RemoverAcentos(Copy(tabConfigPropri.FieldByName('ObsNF2').AsString, 1, 76))+
                                 RemoverAcentos(Copy(tabConfigPropri.FieldByName('ObsNF3').AsString, 1, 76))+
                                 Copy(vAprovTexto,  1, 76)+
                                 Copy(vAprovTexto, 71, 76)+
                                 RemoverAcentos(Copy(tabFatura.FieldByName('Observacao').AsString, 1,   70)) +
                                 RemoverAcentos(Copy(tabFatura.FieldByName('Observacao').AsString, 71,  70)) +
                                 RemoverAcentos(Copy(tabFatura.FieldByName('Observacao').AsString, 141, 70)) +
                                 RemoverAcentos(Copy(tabFatura.FieldByName('Observacao').AsString, 211, 70)) +
                                 RemoverAcentos(Copy(tabFatura.FieldByName('Observacao').AsString, 281, 70)) +
                                 RemoverAcentos(Copy(tabFatura.FieldByName('Observacao').AsString, 351, 70)) +
                                 RemoverAcentos(Copy(tabFatura.FieldByName('Observacao').AsString, 421, 70)) +
                                 RemoverAcentos(Copy(tabFatura.FieldByName('Observacao').AsString, 491, 70)) +
                                 RemoverAcentos(Copy(tabFatura.FieldByName('Observacao').AsString, 561, 70)) +
                                 RemoverAcentos(Copy(tabFatura.FieldByName('Observacao').AsString, 631, 70)) ;

              with InfAdic.obsCont.Add do
              begin
                xCampo := 'CodigoEmpresa';
                xTexto := tabFatura.FieldByName('CodigoEmpresa').AsString;
              end;

              with InfAdic.obsCont.Add do
              begin
                tabChecagens.close;
                tabChecagens.SQL.Clear;
                tabChecagens.sql.Text := ' select ' +
                  '    Genericos.Descricao ' +
                  ' from ' +
                  '    titulos_receber ' +
                  '        inner join ' +
                  '    genericos ON titulos_receber.CodigoLocalizacao = genericos.Codigo ' +
                  '        LEFT JOIN ' +
                  '    clientes ON titulos_receber.CodigoConta = clientes.CodigoCliente ' +
                  ' where ' +
                  '    NotaFiscal = :FATURA      ' +
                  '    and CodigoConta = :CLIENTE ';
                tabChecagens.Parambyname('FATURA').AsString :=
                  tabFatura.FieldByName('Fatura').AsString;
                tabChecagens.Parambyname('CLIENTE').AsInteger :=
                  tabFatura.FieldByName('CodigoConta').AsInteger;
                tabChecagens.Open;

                xCampo := 'Localizacao';
                xTexto := tabChecagens.FieldByName('Descricao').AsString;
              end;

              // CFOP de Exportação começados com "7"
              if tabCFOP.FieldByName('CFOP').AsString[1] = '7' then
              begin
                with exporta do
                begin
                  UFembarq := tabFatura.FieldByName('UFEmbarque').AsString;
                  xLocEmbarq :=
                    RemoverAcentos(tabFatura.FieldByName('LocalEmbarque').AsString);
                end;
              end;
            end;
          end
          else
          begin
            MemoRetorno.Lines.Add('Fatura não encontrada. Fatura: ' +
              tabFatura.FieldByName('FATURA').AsString);
          end;
        end;

        tabAuxFatura.Next;
      end;

      if ACBrNFe1.NotasFiscais.Count = 0 then
      begin
        MemoRetorno.Lines.Add('Nenhuma NFe gerada');
        exit;
      end;

      try
        ACBrNFe1.NotasFiscais.GerarNFe;
      except
        on E: Exception do
        begin
          raise Exception.Create('Erro ao Gerar NFe' + Chr(13) + E.Message +
            Chr(13));
        end;
      end;

      try
        ACBrNFe1.NotasFiscais.Assinar;
      except
        on E: Exception do
        begin
          raise Exception.Create('Erro ao Assinar NFe' + Chr(13) + E.Message +
            Chr(13));
        end;
      end;

      try
        ACBrNFe1.NotasFiscais.Valida;
      except
        on E: Exception do
        begin
          raise Exception.Create('Erro ao Validar NFe' + Chr(13) + E.Message +
            Chr(13));
        end;
      end;

      // Duplicidade de NF-e

      try
        ACBrNFe1.Enviar(0, False);
      except
        on E: Exception do
        begin
          showmessage(E.ClassName);
          showmessage(E.Message);
        end;
      end;

      for vCnt := 0 to ACBrNFe1.NotasFiscais.Count - 1 do
      begin
        if ACBrNFe1.NotasFiscais.Items[vCnt].Confirmada then
        begin
          tabXML.Close;
          tabXML.Open;

          tabXML.Append;
          tabXML.FieldByName('Cancelada').AsInteger := 0;
          tabXML.FieldByName('NotaFiscal').AsString := StrZero(ACBrNFe1.NotasFiscais.Items[vCnt].NFe.Ide.nNF, 6);
          tabXML.FieldByName('Serie').AsString := StrZero(ACBrNFe1.NotasFiscais.Items[vCnt].NFe.Ide.serie, 3);
          tabXML.FieldByName('CodigoEmpresa').AsFloat := StrToFloat(ACBrNFe1.NotasFiscais.Items[vCnt].NFe.InfAdic.obsCont[0].xTexto);
          tabXML.FieldByName('ChaveNFe').AsString := ACBrNFe1.NotasFiscais.Items[vCnt].NFe.procNFe.chNFe;
          tabXML.FieldByName('DataRecbto').AsDateTime := ACBrNFe1.NotasFiscais.Items[vCnt].NFe.procNFe.dhRecbto;
          tabXML.FieldByName('NProt').AsString := ACBrNFe1.NotasFiscais.Items[vCnt].NFe.procNFe.nProt;

          if ACBrNFe1.NotasFiscais.Items[vCnt].NFe.Ide.tpNF = tnSaida then
          begin
            tabXML.FieldByName('TipoNota').AsFloat := 1;
          end
          else if ACBrNFe1.NotasFiscais.Items[vCnt].NFe.Ide.tpNF = tnEntrada then
          begin
            tabXML.FieldByName('TipoNota').AsFloat := 2;
          end;

          vTMS := TStringStream.Create(ACBrNFe1.NotasFiscais.Items[vCnt].XML);
          try
            ACBrNFe1.NotasFiscais.Items[vCnt].SaveToStream(vTMS);
            (tabXML.FieldByName('XML') as TBlobField).LoadFromStream(vTMS);
            (tabXML.FieldByName('XML') as TBlobField).SaveToFile(edtPastaXML.Text + '\' + ACBrNFe1.NotasFiscais.Items[vCnt].NFe.procNFe.chNFe + '.xml');
          finally
            vTMS.Free;
          end;

          tabXML.Post;
          tabXML.ApplyUpdates;

          // Define como transmitido
          try
            tabChecagens.close;
            tabChecagens.SQL.Clear;
            tabChecagens.sql.Text := 'UPDATE FATURAMENTO ' +
              ' SET STATUS_TRANSMITIDA = ''S'' ' +
              ' WHERE FATURA = ' + StrZero(ACBrNFe1.NotasFiscais.Items[vCnt].NFe.Ide.nNF, 6) +
              ' AND Serie = ' + StrZero(ACBrNFe1.NotasFiscais.Items[vCnt].NFe.Ide.serie, 3) +
              ' AND CodigoEmpresa = ' + ACBrNFe1.NotasFiscais.Items[vCnt].NFe.InfAdic.obsCont[0].xTexto +
              ' AND TipoNota = ' + IntToStr(Self.Tag);
            tabChecagens.ExecSQL;
            MemoRetorno.Lines.Add('Fatura: ' + StrZero(ACBrNFe1.NotasFiscais.Items[vCnt].NFe.Ide.nNF, 6) + '. Transmitida!');
          except
            MemoRetorno.Lines.Add('Erro atualizando a fatura ' + StrZero(ACBrNFe1.NotasFiscais.Items[vCnt].NFe.Ide.nNF, 6));
          end;
        end;

        {
        if not Assigned (fmDanfe) then begin
          Application.CreateForm(TfmDanfe, fmDanfe);
          fmDanfe.PrepararDanfe(ACBrNFe1);
          fmDanfe.ShowModal;
        end;
        }
      end;

      ACBrNFeDANFERave1.PathPDF := edtPastaDANFE.Text;
      ACBrNFe1.NotasFiscais.ImprimirPDF;

      AtualizarNotas

    finally
      tabAuxFatura.EnableControls;
    end;

  finally
    Screen.Cursor := crDefault;
  end;

end;

procedure TfmProcessoNFe.ACBrNFe1StatusChange(Sender: TObject);
begin
  inherited;
  case ACBrNFe1.Status of
    stIdle:
      begin
        if (frmStatusNotaFiscalEletronica <> nil) then
          frmStatusNotaFiscalEletronica.Hide;
      end;
    stNFeStatusServico:
      begin
        if (frmStatusNotaFiscalEletronica = nil) then
          frmStatusNotaFiscalEletronica :=
            TfrmStatusNotaFiscalEletronica.Create(Application);
        frmStatusNotaFiscalEletronica.lblStatus.Caption :=
          'Verificando Status do servico...';
        frmStatusNotaFiscalEletronica.Show;
        frmStatusNotaFiscalEletronica.BringToFront;
      end;
    stNFeRecepcao:
      begin
        if (frmStatusNotaFiscalEletronica = nil) then
          frmStatusNotaFiscalEletronica :=
            TfrmStatusNotaFiscalEletronica.Create(Application);
        frmStatusNotaFiscalEletronica.lblStatus.Caption :=
          'Enviando dados da NFe...';
        frmStatusNotaFiscalEletronica.Show;
        frmStatusNotaFiscalEletronica.BringToFront;
        AtualizaStatusNfe(tabFatura.FieldByName('FATURA').AsString,
          'STATUS_TRANSMITIDA', 'NULL');
      end;
    stNfeRetRecepcao:
      begin
        if (frmStatusNotaFiscalEletronica = nil) then
          frmStatusNotaFiscalEletronica :=
            TfrmStatusNotaFiscalEletronica.Create(Application);
        frmStatusNotaFiscalEletronica.lblStatus.Caption :=
          'Recebendo dados da NFe...';
        frmStatusNotaFiscalEletronica.Show;
        frmStatusNotaFiscalEletronica.BringToFront;
        AtualizaStatusNfe(tabFatura.FieldByName('FATURA').AsString,
          'STATUS_RETORNO', 'NULL');

      end;
    stNfeConsulta:
      begin
        if (frmStatusNotaFiscalEletronica = nil) then
          frmStatusNotaFiscalEletronica :=
            TfrmStatusNotaFiscalEletronica.Create(Application);
        frmStatusNotaFiscalEletronica.lblStatus.Caption := 'Consultando NFe...';
        frmStatusNotaFiscalEletronica.Show;
        frmStatusNotaFiscalEletronica.BringToFront;
      end;
    stNfeCancelamento:
      begin
        if (frmStatusNotaFiscalEletronica = nil) then
          frmStatusNotaFiscalEletronica :=
            TfrmStatusNotaFiscalEletronica.Create(Application);
        frmStatusNotaFiscalEletronica.lblStatus.Caption :=
          'Enviando cancelamento de NFe...';
        frmStatusNotaFiscalEletronica.Show;
        frmStatusNotaFiscalEletronica.BringToFront;
        // AtualizaStatusNfe(tabFatura.FieldByName('FATURA').AsString, 'STATUS_CANCELADO', '') ;
      end;
    stNfeInutilizacao:
      begin
        if (frmStatusNotaFiscalEletronica = nil) then
          frmStatusNotaFiscalEletronica :=
            TfrmStatusNotaFiscalEletronica.Create(Application);
        frmStatusNotaFiscalEletronica.lblStatus.Caption :=
          'Enviando pedido de Inutilização...';
        frmStatusNotaFiscalEletronica.Show;
        frmStatusNotaFiscalEletronica.BringToFront;
        AtualizaStatusNfe(tabFatura.FieldByName('FATURA').AsString,
          'STATUS_INUTILIZADO', '');

      end;
    stNFeRecibo:
      begin
        if (frmStatusNotaFiscalEletronica = nil) then
          frmStatusNotaFiscalEletronica :=
            TfrmStatusNotaFiscalEletronica.Create(Application);
        frmStatusNotaFiscalEletronica.lblStatus.Caption :=
          'Consultando Recibo de Lote...';
        frmStatusNotaFiscalEletronica.Show;
        frmStatusNotaFiscalEletronica.BringToFront;
      end;
    stNFeCadastro:
      begin
        if (frmStatusNotaFiscalEletronica = nil) then
          frmStatusNotaFiscalEletronica :=
            TfrmStatusNotaFiscalEletronica.Create(Application);
        frmStatusNotaFiscalEletronica.lblStatus.Caption :=
          'Consultando Cadastro...';
        frmStatusNotaFiscalEletronica.Show;
        frmStatusNotaFiscalEletronica.BringToFront;
      end;
    stNFeEnvDPEC:
      begin
        if (frmStatusNotaFiscalEletronica = nil) then
          frmStatusNotaFiscalEletronica :=
            TfrmStatusNotaFiscalEletronica.Create(Application);
        frmStatusNotaFiscalEletronica.lblStatus.Caption := 'Enviando DPEC...';
        frmStatusNotaFiscalEletronica.Show;
        frmStatusNotaFiscalEletronica.BringToFront;
      end;
    stNFeConsultaDPEC:
      begin
        if (frmStatusNotaFiscalEletronica = nil) then
          frmStatusNotaFiscalEletronica :=
            TfrmStatusNotaFiscalEletronica.Create(Application);
        frmStatusNotaFiscalEletronica.lblStatus.Caption :=
          'Consultando DPEC...';
        frmStatusNotaFiscalEletronica.Show;
        frmStatusNotaFiscalEletronica.BringToFront;
      end;
    stNFeEmail:
      begin
        if (frmStatusNotaFiscalEletronica = nil) then
          frmStatusNotaFiscalEletronica :=
            TfrmStatusNotaFiscalEletronica.Create(Application);
        frmStatusNotaFiscalEletronica.lblStatus.Caption := 'Enviando Email...';
        frmStatusNotaFiscalEletronica.Show;
        frmStatusNotaFiscalEletronica.BringToFront;
      end;
    stNFeCCe:
      begin
        if (frmStatusNotaFiscalEletronica = nil) then
          frmStatusNotaFiscalEletronica :=
            TfrmStatusNotaFiscalEletronica.Create(Application);
        frmStatusNotaFiscalEletronica.lblStatus.Caption :=
          'Enviando Carta de Correção...';
        frmStatusNotaFiscalEletronica.Show;
        frmStatusNotaFiscalEletronica.BringToFront;
      end;
  end;

  Application.ProcessMessages;
end;

procedure TfmProcessoNFe.btnSelecionarTodasClick(Sender: TObject);
begin
  inherited;
  tabAuxFatura.First;
  while not tabAuxFatura.Eof do
  begin
    tabAuxFatura.Edit;
    tabAuxFaturaSelecionar.Value := False;
    tabAuxFatura.Post;
    tabAuxFatura.Next;
  end;
  tabAuxFatura.First;
end;

procedure TfmProcessoNFe.btnBtnCancelamentoClick(Sender: TObject);
var
  tmpxml, vAux, idLote: string;
  bmLocalImportante: TBookmark;
begin
  if NaoPossuiSelecao then
  begin
    ShowMessage('Marque alguma Fatura');
    Exit;
  end;

  try
    tabAuxFatura.DisableControls;
    tabConfigPropri.Open;

    tabAuxFatura.First;
    while not tabAuxFatura.Eof do
    begin

      if tabAuxFaturaSelecionar.Value = True then
      begin
        tabFatura.Close;
        tabFatura.Parambyname('Fatura').AsString := tabAuxFaturaFatura.AsString;
        tabFatura.Parambyname('Serie').AsString := tabAuxFaturaSerie.AsString;
        tabFatura.Parambyname('CodigoEmpresa').AsFloat := tabAuxFaturaCodigoEmpresa.AsFloat;
        tabFatura.Parambyname('TipoTela').AsFloat := Self.Tag;
        tabFatura.Open;

        if tabFatura.RecordCount = 1 then
        begin
          if (trim(tabFatura.FieldByName('ChaveNFe').AsString) = '')
            and (trim(tabFatura.FieldByName('NProt').AsString) = '') then
          begin
            MemoRetorno.Lines.Add('NFE Inexistente. Impossível cancelar. Fatura: ' + tabFatura.FieldByName('FATURA').AsString);

            tabAuxFatura.Next;

            continue;
          end;

         vAux := 'Motivo de cancelamento deve ser maior que 15 caracteres';
         
         if not (InputQuery('Cancelamento', 'Digite a Justificativa', vAux)) then
          begin
            MemoRetorno.Lines.Add('Cancelamento não efetuado para Fatura: ' +
              tabFatura.FieldByName('FATURA').AsString);
            tabAuxFatura.Next;
            Continue;
          end;

          if Length(vAux) < 15 then
          begin
            MemoRetorno.Lines.Add('Motivo de cancelamento deve ser maior que 15 caracteres. Fatura: ' + tabFatura.FieldByName('FATURA').AsString);
            tabAuxFatura.Next;
            Continue;
          end;

          ACBrNFeDANFERave1.PathPDF := GetTemporaryDir;

          tmpxml := GetTemporaryDir + tabFatura.FieldByName('ChaveNFe').AsString + '.xml';

          TBlobField(tabFatura.FieldByName('XML2')).SaveToFile(tmpxml);

          idLote := '1';
          ACBrNFe1.NotasFiscais.Clear;
          ACBrNFe1.EnvEvento.EnvEventoNFe.Evento.Clear;
          ACBrNFe1.EnvEvento.EnvEventoNFe.idLote := StrToInt(idLote) ;

          ACBrNFe1.NotasFiscais.LoadFromFile(tmpxml);

          with ACBrNFe1.EnvEvento.EnvEventoNFe.Evento.Add do
          begin
           infEvento.dhEvento := now;
           infEvento.tpEvento := teCancelamento;
           infEvento.detEvento.xJust := vAux;
          end;
          ACBrNFe1.EnviarEventoNFe(StrToInt(idLote));

          // MemoResp.Lines.Text :=  UTF8Encode(ACBrNFe1.WebServices.EnvEvento.RetWS);
          // memoRespWS.Lines.Text :=  UTF8Encode(ACBrNFe1.WebServices.EnvEvento.RetornoWS);




          mmoCartaoCorrecao.Lines.Text := UTF8Encode(ACBrNFe1.WebServices.EnvEvento.RetornoWS);

          mmoCartaoCorrecao.Lines.SaveToFile(PathWithDelim(edtPastaXML.Text) + tabFatura.FieldByName('ChaveNFe').AsString + '-cancelamento.xml');

          ShowMessage('Cancelamento efetuado!!!' + #13 + 'Xml de Cancelamento salvo em: ' + #13 + PathWithDelim(edtPastaXML.Text) + tabFatura.FieldByName('ChaveNFe').AsString + '-cancelamento.xml');






          // Define como cancelado
          try
            tabChecagens.close;
            tabChecagens.SQL.Clear;
            tabChecagens.sql.Text := 'UPDATE FATURAMENTO ' +
              ' SET STATUS_CANCELADO = ''S'',  JUSTIFICATIVA = ''' + vAux + '''' +
              ' WHERE FATURA = ' + QuotedStr(tabFatura.FieldByName('Fatura').AsString) +
              ' AND Serie = ' + QuotedStr(tabFatura.FieldByName('Serie').AsString) +
              ' AND CodigoEmpresa = ' + QuotedStr(tabFatura.FieldByName('CodigoEmpresa').AsString) +
              ' AND TipoTela = ' + QuotedStr(tabFatura.FieldByName('TipoTela').AsString);
            tabChecagens.ExecSQL;
          except
            MemoRetorno.Lines.Add('Erro Cancelando a fatura ' + tabFatura.FieldByName('Fatura').AsString);
          end;

        end
        else
        begin
          MemoRetorno.Lines.Add('Fatura não encontrada. Fatura: ' +
            tabFatura.FieldByName('FATURA').AsString);
        end;
      end;
      tabAuxFatura.Next;

    end;

    btnConsultarClick(Self);

  finally
    tabAuxFatura.EnableControls;
  end;

end;

procedure TfmProcessoNFe.btnImprimirClick(Sender: TObject);
begin
  Imprimir;
end;

procedure TfmProcessoNFe.btnConsultarClick(Sender: TObject);
begin
  try
    inherited;
    Screen.Cursor := crHourGlass;

    if not DirectoryExists(edtPastaXML.Text) then
    begin
      ShowMessage('Pasta com os arquivos XML não existe');
      edtPastaXML.SetFocus;
      exit;
    end;

    // Se a pasta com os danfes naoe xistir
    if not DirectoryExists(edtPastaDANFE.Text) then
    begin
      ShowMessage('Pasta com os arquivos DANFE não existe');
      edtPastaDANFE.SetFocus;
      exit;
    end;

    AtualizarNotas;

    SaveConfigNFeXMLPath(edtPastaXML.Text, GetPathProfileUser);
    SaveConfigNFeDanfePath(edtPastaDANFE.Text, GetPathProfileUser);

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfmProcessoNFe.AtualizaStatusNfe(const iCodigoNfe: string;
  const sCampoStatus, sJustificativa: string);
var
  SQLTemp: string;
begin
  try
    try
      tabChecagens.close;
      tabChecagens.SQL.Clear;

      if trim(sJustificativa) = 'NULL' then
      begin
        SQLTemp := 'UPDATE FATURAMENTO ' +
          'SET ' + trim(sCampoStatus) + '=' + quotedstr('S') +
          ' WHERE FATURA = :CODNF';
        tabChecagens.SQL.Text := SQLTemp;
        tabChecagens.Parambyname('CODNF').AsString := iCodigoNfe;
        tabChecagens.ExecSQL;
        tabChecagens.Close;

        tabAuxFatura.Close;
        tabAuxFatura.Open;
      end;

    except
      showmessage('erro atualizando status da NFe');
    end;
  finally
    tabChecagens.Close;
  end;
end;

function TfmProcessoNFe.NaoPossuiSelecao: Boolean;
var
  bmLocalImportante: TBookmark;
  Marcado: Boolean;
begin
  Result := True;

  try
    bmLocalImportante := tabAuxFatura.GetBookMark;
    tabAuxFatura.DisableControls;

    tabAuxFatura.First;
    while not tabAuxFatura.Eof do
    begin

      if tabAuxFaturaSelecionar.Value = True then
      begin
        Result := False;
      end;

      tabAuxFatura.Next;
    end;

  finally
    tabAuxFatura.GotoBookmark(bmLocalImportante);
    tabAuxFatura.FreeBookmark(bmLocalImportante);
    tabAuxFatura.EnableControls;
  end;

end;

procedure TfmProcessoNFe.EnviarEmailNFE;
var
  sCaminhoXML, sCaminhoPDF, sEmail, vArquivoXml, vArquivoPDF, vParaXml, vArquivoXmlCmp, vMsg,
    vParaDanfe, vAssunto, vEmailRetorno, vResultados, vEmailXml, vNomeArquivoXml, vNomeArquivoXmlCmp, vNota: string;
  tempdata: string;
  CCXml, CCDanfe: Tstrings;
  bmLocalImportante: TBookmark;
  sListaPara: TStringList;
  vCont: Integer;
begin

  // Verifica se há algum item selecionado no grid
  if NaoPossuiSelecao then
  begin
    ShowMessage('Marque alguma Fatura');
    Exit;
  end;

  try
    // desativa controles visuais
    tabAuxFatura.DisableControls;

    // Abre a tabela de configuração
    tabConfigPropri.Close;
    tabConfigPropri.Open;

    // Varre item por item da grade
    tabAuxFatura.First;
    while not tabAuxFatura.Eof do
    begin

      // Se a fatura está selecionada
      if tabAuxFaturaSelecionar.Value = True then
      begin

        // Verifico se ela realmente existe
        tabFatura.Close;
        tabFatura.Parambyname('Fatura').AsString := tabAuxFaturaFatura.AsString;
        tabFatura.Parambyname('Serie').AsString := tabAuxFaturaSerie.AsString;
        tabFatura.Parambyname('CodigoEmpresa').AsFloat := tabAuxFaturaCodigoEmpresa.AsFloat;
        tabFatura.Parambyname('TipoTela').AsFloat := Self.Tag;
        tabFatura.Open;

        // Se encontrou a fatura
        if tabFatura.RecordCount = 1 then
        begin
          // Verifico se a fatura possui chave de acesso e protocolo
          if (trim(tabFatura.FieldByName('ChaveNFe').AsString) = '')
            and (trim(tabFatura.FieldByName('NProt').AsString) = '') then
          begin
            MemoRetorno.Lines.Add('NFE Inexistente. E-mail não enviado para a Fatura: ' + tabFatura.FieldByName('FATURA').AsString);

            tabAuxFatura.Next;

            continue;
          end;

          // Defino um caminho temporário para o pdf e o xml
          ACBrNFeDANFERave1.PathPDF := GetTemporaryDir;

          // Define onde o arquivo xml ficará
          vArquivoXml := GetTemporaryDir + tabFatura.FieldByName('ChaveNFe').AsString + '.xml';

          // Grava o arquivo em disco
          TBlobField(tabFatura.FieldByName('XML2')).SaveToFile(vArquivoXml);

          // Limpa as notas fiscais

          ACBrNFe1.NotasFiscais.Clear;

          ACBrNFeDANFERave1.PathPDF := GetTemporaryDir;
          ACBrNFe1.Configuracoes.Geral.PathSalvar := GetTemporaryDir;

          ACBrNFe1.NotasFiscais.LoadFromFile(vArquivoXml);
          ACBrNFe1.NotasFiscais.ImprimirPDF;

          // Local do PDF. Usado para envio no email
          vArquivoPDF := GetTemporaryDir + trim(tabFatura.FieldByName('ChaveNFe').AsString) + '.pdf';

          // Mensagem a ser enviada
          mmoMensagem.Clear;
          mmoMensagem.Text := tabConfigPropri.FieldByName('NFeMensagemEnvioEmail').AsString;

          // Pegamos os emails de envio XML e Danfe
          try
            tabChecagens.close;
            tabChecagens.SQL.Clear;
            tabChecagens.sql.Text := 'select clientes.EmailNFEXML,' +
              ' clientes.EmailNFEDanfe from ' +
              ' faturamento' +
              ' inner join clientes ON faturamento.CodigoConta = clientes.CodigoCliente ' +
              ' where fatura = :FATURA';
            tabChecagens.Parambyname('FATURA').AsString :=
              tabFatura.FieldByName('FATURA').AsString;
            tabChecagens.open;
          except
            MemoRetorno.Lines.Add('Erro enviando e-mail para fatura ' +
              tabFatura.FieldByName('FATURA').AsString);
            tabAuxFatura.Next;
            continue;
          end;

          // Se não encontrou cancelamos o envio do email
          if tabChecagens.RecordCount = 0 then
          begin
            MemoRetorno.Lines.Add('Erro enviando e-mail para fatura ' +
              tabFatura.FieldByName('FATURA').AsString);
            tabAuxFatura.Next;
            continue;
          end;

          // Cria uma lista de emails para o xml
          vParaXML := tabChecagens.FieldByName('EmailNFEXML').AsString;

          // Cria uma lista de emails para o danfe
          vParaDanfe := tabChecagens.FieldByName('EmailNFEDanfe').AsString;

          // Se os dois forem vazios, pula para a próxima fatura
          if (vParaXML = '') and (vParaDanfe = '') then
          begin
            MemoRetorno.Lines.Add('Erro enviando e-mail para fatura ' +
              tabFatura.FieldByName('FATURA').AsString +
              '. Sem email cadastrado para o Danfe e Xml');
            tabAuxFatura.Next;
            continue;
          end;

          vAssunto := 'NOTA FISCAL ELETRONICA - ARQUIVO DIGITAL';

          if Trim(tabConfigPropri.FieldByName('NFeEmailXML').AsString) <> '' then
          begin
            vEmailRetorno :=
              tabConfigPropri.FieldByName('NFeEmailXML').AsString;
          end;

          if fmMenu.pubNomeComputador = 'FABIO-PC' then
          begin
            vParaXML := 'fabio.damas@gmail.com';
            vParaDanfe := 'fabio.damas@gmail.com';
          end
          else
          begin


          end;

          // Se preenchido apenas o XML
          if (vParaXML <> '') then
          begin
            vResultados :=
              EnviarEmail(tabConfigPropri.FieldByName('SmtpHost').AsString,
              tabConfigPropri.FieldByName('SmtpUsername').AsString,
              tabConfigPropri.FieldByName('SmtpPassword').AsString,
              tabConfigPropri.FieldByName('RazaoSocial').AsString,
              vEmailRetorno, // vEmailRetorno,
              vParaXML,
              vAssunto + ' "XML" - ' + DateToStr(Date) + ' - NFE No: ' + tabFatura.FieldByName('Fatura').AsString,
              mmoMensagem.Text,
              vArquivoXml,
              '',
              '',
              25,
              False);



            if Trim(vResultados) = '' then
            begin
              MemoRetorno.Lines.Add('Enviado XML para: ' + vParaXML + ' - Fatura: ' + tabFatura.FieldByName('FATURA').AsString);

              // Define como enviado o email
              try
                tabChecagens.close;
                tabChecagens.SQL.Clear;
                tabChecagens.sql.Text := 'UPDATE FATURAMENTO ' +
                  ' SET STATUS_EMAIL = ''S'' ' +
                  ' WHERE FATURA = ' + QuotedStr(tabFatura.FieldByName('Fatura').AsString) +
                  ' AND Serie = ' + QuotedStr(tabFatura.FieldByName('Serie').AsString) +
                  ' AND CodigoEmpresa = ' + QuotedStr(tabFatura.FieldByName('CodigoEmpresa').AsString) +
                  ' AND TipoTela = ' + QuotedStr(tabFatura.FieldByName('TipoTela').AsString);
                tabChecagens.ExecSQL;
              except
                MemoRetorno.Lines.Add('Erro atualizando a fatura ' + tabFatura.FieldByName('Fatura').AsString);
              end;

            end
            else
            begin
              MemoRetorno.Lines.Add('Erro ao Enviar ' +
                tabFatura.FieldByName('Fatura').AsString + ' - Erro: ' +
                vResultados + ' ' + vArquivoXml + ' ' + vArquivoXmlCmp);
            end;

          end;

          if Trim(vParaDanfe) <> '' then
          begin
            vResultados :=
              EnviarEmail(tabConfigPropri.FieldByName('SmtpHost').AsString,
              tabConfigPropri.FieldByName('SmtpUsername').AsString,
              tabConfigPropri.FieldByName('SmtpPassword').AsString,
              tabConfigPropri.FieldByName('RazaoSocial').AsString,
              vEmailRetorno,
              vParaDanfe,
              vAssunto + ' "PDF" - ' + DateToStr(Date) + ' - NFE No: ' + tabFatura.FieldByName('Fatura').AsString,
              mmoMensagem.Text,
              vArquivoPDF,
              '',
              '',
              25,
              False);

            if Trim(vResultados) = '' then
            begin
              MemoRetorno.Lines.Add('Enviado Danfe para: ' + vParaDanfe + ' - Fatura: ' + tabFatura.FieldByName('FATURA').AsString);

              // Define como enviado o email
              try
                tabChecagens.close;
                tabChecagens.SQL.Clear;
                tabChecagens.sql.Text := 'UPDATE FATURAMENTO ' +
                  ' SET STATUS_EMAIL = ''S'' ' +
                  ' WHERE FATURA = ' + QuotedStr(tabFatura.FieldByName('Fatura').AsString) +
                  ' AND Serie = ' + QuotedStr(tabFatura.FieldByName('Serie').AsString) +
                  ' AND CodigoEmpresa = ' + QuotedStr(tabFatura.FieldByName('CodigoEmpresa').AsString) +
                  ' AND TipoTela = ' + QuotedStr(tabFatura.FieldByName('TipoTela').AsString);
                tabChecagens.ExecSQL;
              except
                MemoRetorno.Lines.Add('Erro atualizando a fatura ' + tabFatura.FieldByName('Fatura').AsString);
              end;
            end
            else
            begin
              MemoRetorno.Lines.Add('Erro ao Enviar ' + vNota + ' - Erro: ' +
                vResultados + ' ' + vArquivoPdf);
            end;
          end;

        end
        else
        begin
          MemoRetorno.Lines.Add('Fatura não encontrada. Fatura: ' +
            tabFatura.FieldByName('FATURA').AsString);
        end;
      end;
      tabAuxFatura.Next;

    end;

  finally
    tabAuxFatura.EnableControls;
  end;
end;

procedure TfmProcessoNFe.GerarPDF;
var
  tmpxml, pdf: string;
  bmLocalImportante: TBookmark;
begin
  if NaoPossuiSelecao then
  begin
    ShowMessage('Marque alguma Fatura');
    Exit;
  end;

  if not DirectoryExists(edtPastaXML.Text) then
  begin
    ShowMessage('Pasta com os arquivos XML não existe');
    edtPastaXML.SetFocus;
    exit;
  end;

  if not DirectoryExists(edtPastaDANFE.Text) then
  begin
    ShowMessage('Pasta com os arquivos DANFE não existe');
    edtPastaDANFE.SetFocus;
    exit;
  end;

  try
    tabAuxFatura.DisableControls;
    tabConfigPropri.Open;

    tabAuxFatura.First;
    while not tabAuxFatura.Eof do
    begin

      if tabAuxFaturaSelecionar.Value = True then
      begin
        tabFatura.Close;
        tabFatura.Parambyname('Fatura').AsString := tabAuxFaturaFatura.AsString;
        tabFatura.Parambyname('Serie').AsString := tabAuxFaturaSerie.AsString;
        tabFatura.Parambyname('CodigoEmpresa').AsFloat := tabAuxFaturaCodigoEmpresa.AsFloat;
        tabFatura.Parambyname('TipoTela').AsFloat := Self.Tag;
        tabFatura.Open;

        if tabFatura.RecordCount = 1 then
        begin
          tabXML.Close;
          tabXML.Parambyname('Fatura').AsString := tabAuxFaturaFatura.AsString;
          tabXML.Parambyname('Serie').AsString := tabAuxFaturaSerie.AsString;
          tabXML.Parambyname('CodigoEmpresa').AsFloat := tabAuxFaturaCodigoEmpresa.AsFloat;
          tabXML.Parambyname('TipoNota').AsFloat := Self.Tag;
          tabXML.Open;

          if tabXML.RecordCount = 0 then
          begin
            MemoRetorno.Lines.Add('NFE Inexistente. Fatura: ' + tabFatura.FieldByName('FATURA').AsString);

            tabAuxFatura.Next;

            continue;



          end;

          ACBrNFeDANFERave1.PathPDF := edtPastaDANFE.Text;

          tmpxml := edtPastaXML.Text + '\' + tabFatura.FieldByName('ChaveNFe').AsString + '.xml';

          if FileExists(tmpxml) then
          begin
            DeleteFile(tmpxml);
          end;

          pdf := edtPastaDANFE.Text + '\' + tabFatura.FieldByName('ChaveNFe').AsString + '.pdf';

          if FileExists(pdf) then
          begin
            DeleteFile(pdf);
          end;

          TBlobField(tabFatura.FieldByName('XML2')).SaveToFile(tmpxml);

          ACBrNFe1.NotasFiscais.Clear;
          ACBrNFe1.NotasFiscais.LoadFromFile(tmpxml);
          ACBrNFe1.NotasFiscais.ImprimirPDF;
          MemoRetorno.Lines.Add('PDF da fatura ' +
            tabFatura.FieldByName('FATURA').AsString +
            ' gerado com sucesso na pasta ' + edtPastaDANFE.Text);
          MemoRetorno.Lines.Add('XML da fatura ' +
            tabFatura.FieldByName('FATURA').AsString +
            ' gerado com sucesso na pasta ' + edtPastaXML.Text);
        end
        else
        begin
          MemoRetorno.Lines.Add('Fatura não encontrada. Fatura: ' +
            tabFatura.FieldByName('FATURA').AsString);
        end;
      end;
      tabAuxFatura.Next;

    end;

  finally
    tabAuxFatura.EnableControls;
  end;

end;

procedure TfmProcessoNFe.Imprimir;
var
  tmpxml: string;
  bmLocalImportante: TBookmark;
  vStream : TStringStream;
  vContador : Integer;
begin
  if NaoPossuiSelecao then
  begin
    ShowMessage('Marque alguma Fatura');
    Exit;
  end;

  // Apago as notas
  ACBrNFe1.NotasFiscais.Clear;

  vContador := 0;

  try
    tabAuxFatura.DisableControls;
    tabConfigPropri.Open;

    tabAuxFatura.First;


    while not tabAuxFatura.Eof do
    begin

      if tabAuxFaturaSelecionar.Value = True then
      begin
        tabFatura.Close;
        tabFatura.Parambyname('Fatura').AsString := tabAuxFaturaFatura.AsString;
        tabFatura.Parambyname('Serie').AsString := tabAuxFaturaSerie.AsString;
        tabFatura.Parambyname('CodigoEmpresa').AsFloat := tabAuxFaturaCodigoEmpresa.AsFloat;
        tabFatura.Parambyname('TipoTela').AsFloat := Self.Tag;
        tabFatura.Open;

        if tabFatura.RecordCount = 1 then
        begin
          if (trim(tabFatura.FieldByName('ChaveNFe').AsString) = '')
            and (trim(tabFatura.FieldByName('NProt').AsString) = '') then
          begin
            MemoRetorno.Lines.Add('NFE Inexistente. Danfe não impresso. Fatura: '
              + tabFatura.FieldByName('FATURA').AsString);

            tabAuxFatura.Next;

            continue;
          end;
          {
          // Defino uma pasta temporária para o PDF
          ACBrNFeDANFERave1.PathPDF := GetTemporaryDir;

          // Defino o caminho do XML
          tmpxml := GetTemporaryDir + tabFatura.FieldByName('ChaveNFe').AsString + '.xml';

          // Salvo o XML
          TBlobField(tabFatura.FieldByName('XML2')).SaveToFile(tmpxml);

          // Apago as notas
          ACBrNFe1.NotasFiscais.Clear;

          // Carrego o XML
          ACBrNFe1.NotasFiscais.LoadFromFile(tmpxml);

          // Mando imprimir
          ACBrNFe1.NotasFiscais.Imprimir;

          }

          vContador := vContador + 1;

          vStream := TStringStream.Create(tabFatura.FieldByName('XML2').AsString);

          // Salvo o XML
          TBlobField(tabFatura.FieldByName('XML2')).SaveToStream(vStream );

          // Carrego o XML
          ACBrNFe1.NotasFiscais.LoadFromStream(vStream);

          vStream.Free;

        end
        else
        begin
          MemoRetorno.Lines.Add('Fatura não encontrada. Fatura: ' +
            tabFatura.FieldByName('FATURA').AsString);
        end;
      end;

      tabAuxFatura.Next;

    end;

    if vContador > 0 then
    begin
      // Mando imprimir
      // DANFeRave.SystemPrinter.Copies:=aNumeroDeCopias;
      ACBrNFeDANFERave1.NumCopias := 3;
      ACBrNFe1.NotasFiscais.Imprimir;
    end;



  finally
    tabAuxFatura.EnableControls;
  end;

end;

procedure TfmProcessoNFe.btnCartaCorrecaoClick(Sender: TObject);
var
  Chave, idLote, codOrgao, CNPJ, nSeqEvento, Correcao: string;
begin
  if NaoPossuiSelecao then
  begin
    ShowMessage('Marque alguma Fatura');
    Exit;
  end;

  try
    tabAuxFatura.DisableControls;

    tabConfigPropri.Open;

    tabAuxFatura.First;
    while not tabAuxFatura.Eof do
    begin

      if tabAuxFaturaSelecionar.Value = True then
      begin
        tabFatura.Close;
        tabFatura.Parambyname('Fatura').AsString := tabAuxFaturaFatura.AsString;
        tabFatura.Parambyname('Serie').AsString := tabAuxFaturaSerie.AsString;
        tabFatura.Parambyname('CodigoEmpresa').AsFloat := tabAuxFaturaCodigoEmpresa.AsFloat;
        tabFatura.Parambyname('TipoTela').AsFloat := Self.Tag;
        tabFatura.Open;

        if tabFatura.RecordCount = 1 then
        begin
          if (trim(tabFatura.FieldByName('ChaveNFe').AsString) = '')
            and (trim(tabFatura.FieldByName('NProt').AsString) = '') then
          begin
            MemoRetorno.Lines.Add('NFE Inexistente. Fatura: ' +
              tabFatura.FieldByName('FATURA').AsString);

            tabAuxFatura.Next;

            continue;
          end;

          tabConfigPropri.Open;

          Chave := Trim(OnlyNumber(tabFatura.FieldByName('ChaveNFe').AsString));

          idLote := '1';

          {if not (InputQuery('WebServices Carta de Correção',
            'Identificador de controle do Lote de envio do Evento', idLote)) then
            exit;
          }
          codOrgao := copy(Chave, 1, 2);

          CNPJ := copy(Chave, 7, 14);

          nSeqEvento := '1';
          {if not (InputQuery('WebServices Carta de Correção',
            'Sequencial do evento para o mesmo tipo de evento', nSeqEvento)) then
            exit;
           }

          Correcao :=
            'Correção a ser considerada, texto livre. A correção mais recente substitui as anteriores.';
          if not (InputQuery('WebServices Carta de Correção',
            'Correção a ser considerada', Correcao)) then
            exit;

          ACBrNFe1.CartaCorrecao.CCe.Evento.Clear;
          ACBrNFe1.CartaCorrecao.CCe.idLote := StrToInt(idLote);

          with ACBrNFe1.CartaCorrecao.CCe.Evento.Add do
          begin
            infEvento.chNFe := Chave;
            infEvento.cOrgao := StrToInt(codOrgao);
            infEvento.CNPJ := CNPJ;
            infEvento.dhEvento := now;
            infEvento.tpEvento := 110110;
            infEvento.nSeqEvento := StrToInt(nSeqEvento);
            infEvento.versaoEvento := '1.00';
            infEvento.detEvento.descEvento := 'Carta de Correção';
            infEvento.detEvento.xCorrecao := Correcao;
          end;

          ACBrNFe1.EnviarCartaCorrecao(StrToInt(idLote));

          // MemoResp.Lines.Text := UTF8Encode(ACBrNFe1.WebServices.CartaCorrecao.RetWS);
          // memoRespWS.Lines.Text := UTF8Encode(ACBrNFe1.WebServices.CartaCorrecao.RetornoWS);
          //  ACBrNFe1.WebServices.CartaCorrecao.CCeRetorno.retEvento.Items[0].XXXX
          // LoadXML(MemoResp, WBResposta);

          mmoCartaoCorrecao.Lines.Text := UTF8Encode(ACBrNFe1.WebServices.CartaCorrecao.RetWS);
          mmoCartaoCorrecao.Lines.SaveToFile(PathWithDelim(edtPastaXML.Text) + Chave + '-carta-correcao.xml');
          ShowMessage('Carta de correção enviada!!!' + #13 + 'Xml da carta de correção salva em: ' + #13 + PathWithDelim(edtPastaXML.Text) + Chave + '-carta-correcao.xml');
        end
        else
        begin
          MemoRetorno.Lines.Add('Fatura não encontrada. Fatura: ' +
            tabFatura.FieldByName('FATURA').AsString);
        end;
      end;
      tabAuxFatura.Next;

    end;

  finally
    tabAuxFatura.EnableControls;
  end;

end;

procedure TfmProcessoNFe.btnGerarPDFClick(Sender: TObject);
begin
  inherited;
  GerarPDF;
end;

procedure TfmProcessoNFe.btnEnviarEmailClick(Sender: TObject);
begin
  inherited;
  EnviarEmailNFE;

  btnConsultarClick(Self);

end;

procedure TfmProcessoNFe.tsDetalheNotaShow(Sender: TObject);
begin
  inherited;
{  tabDetalhamentoNota.Close;
  tabDetalhamentoNota.ParamByName('ChaveNFe').AsString := tabAuxFatura.FieldByName('ChaveNFe').AsString;
  tabDetalhamentoNota.ParamByName('NProt').AsString := tabAuxFatura.FieldByName('NProt').AsString;
  tabDetalhamentoNota.Open;
  }
end;

procedure TfmProcessoNFe.edtNotaInicialChange(Sender: TObject);
begin
  inherited;
  rbNota.Checked := edtNotaInicial.Text <> '';
end;

procedure TfmProcessoNFe.edtNotaFinalChange(Sender: TObject);
begin
  inherited;
  rbNota.Checked := edtNotaFinal.Text <> '';
end;

procedure TfmProcessoNFe.edtEmissaoInicioChange(Sender: TObject);
begin
  inherited;
  rbData.Checked := True;
end;

procedure TfmProcessoNFe.edtEmissaoFimChange(Sender: TObject);
begin
  inherited;
  rbData.Checked := True;
end;

procedure TfmProcessoNFe.tvwNotasCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  {
  if Column.FieldName = 'Selecionar' then
  begin
    tabAuxFatura.Edit;
    if tabAuxFaturaSelecionar.Value = True then
    begin
      tabAuxFaturaSelecionar.Value := False;
    end
    else
    begin
      tabAuxFaturaSelecionar.Value := True;
    end;
    tabAuxFatura.Post;
  end;
  }
end;

procedure TfmProcessoNFe.tvwNotasCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if (AViewInfo.GridRecord.Values[clmNotasSTATUS_TRANSMITIDA.Index] = 'S') then
  begin
    ACanvas.Brush.Color := clGreen;
  end;

  if (AViewInfo.GridRecord.Values[clmNotasSTATUS_CANCELADO.Index] = 'S') then
  begin
    ACanvas.Brush.Color := clRed;
  end;
end;

end.


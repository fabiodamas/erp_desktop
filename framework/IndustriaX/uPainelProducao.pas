unit uPainelProducao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, Grids, DBGrids, ComCtrls, DB, DBClient,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, StdCtrls, Mask, ToolEdit,
  CurrEdit, Buttons, Menus, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  ExtCtrls, QuickRpt, Provider, cxContainer, cxProgressBar, dxPSGlbl,
  dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPScxPageControlProducer, dxSkinsdxBarPainter, dxPSCore, dxPScxCommon,
  dxPScxGrid6Lnk, cxSplitter, RXDBCtrl;

type
  TMinhaThread = class(TThread)
  public
    Contador: Integer;
    Stopped: boolean;
    procedure Execute; override;
    constructor Create(CreateSuspended: Boolean);
  end;

type
  TfmPainelProducao = class(TfmFormBaseAvancado)
    pgcPainelProducao: TPageControl;
    tbsPainel: TTabSheet;
    tbsMovimentos: TTabSheet;
    tabAuxSetores: TClientDataSet;
    tabRoteiro: TZQuery;
    tabAuxSetoresCodigoSetor: TFloatField;
    tabAuxSetoresSetor: TStringField;
    tabAuxOperacoes: TClientDataSet;
    dtsAuxOperacoes: TDataSource;
    tabAuxOperacoesInicio: TDateTimeField;
    tabAuxOperacoesTermino: TDateTimeField;
    tabAuxOperacoesOperacao: TStringField;
    tabOP: TZQuery;
    tabAuxOperacoesOrdemProducao: TStringField;
    edtCodigoBarrasOperacao: TEdit;
    tabChecagens: TZQuery;
    Label1: TLabel;
    tabAuxOperacoesDuracao: TStringField;
    tabAuxOperacoesQuantidade: TStringField;
    tabAuxOperacoesCodigoProduto: TStringField;
    grbInfoOP: TGroupBox;
    lblOrdemProducao: TLabel;
    lblSetor: TLabel;
    lblProduto: TLabel;
    grbPreencheOP: TGroupBox;
    lblResponsavel: TLabel;
    edtCodigoResponsavel1: TEdit;
    lblQuantidade: TLabel;
    edtQuantidade: TCurrencyEdit;
    lblPerdas: TLabel;
    edtPerdas: TCurrencyEdit;
    btnGravar: TBitBtn;
    lblCStatus: TLabel;
    lblStatus: TLabel;
    btnPausarTodas: TButton;
    tabAuxOperacoesSequencia: TIntegerField;
    tabAuxOperacoesData: TDateField;
    edtCodigoResponsavel2: TEdit;
    tabAuxOperacoesResponsavel1: TStringField;
    tabAuxOperacoesResponsavel2: TStringField;
    tvwPainel: TcxGridDBTableView;
    lvlPainel: TcxGridLevel;
    dbgPainel: TcxGrid;
    clmOrdemProducao: TcxGridDBColumn;
    clmCodigoProduto: TcxGridDBColumn;
    clmOperacao: TcxGridDBColumn;
    clmInicio: TcxGridDBColumn;
    clmTermino: TcxGridDBColumn;
    clmDuracao: TcxGridDBColumn;
    clmQuantidade: TcxGridDBColumn;
    clmResponsavel1: TcxGridDBColumn;
    clmResponsavel2: TcxGridDBColumn;
    stlCores: TcxStyleRepository;
    cstCorBranca: TcxStyle;
    cstCorAzul: TcxStyle;
    cstVerde: TcxStyle;
    cstVermelho: TcxStyle;
    tabPainel: TClientDataSet;
    dspPainel: TDataSetProvider;
    dtsPainel: TDataSource;
    clmTotal: TcxGridDBColumn;
    pnl1: TPanel;
    rdgProdutos: TRadioGroup;
    pbrBarra: TcxProgressBar;
    crpPainel: TdxComponentPrinter;
    grlPainel: TdxGridReportLink;
    btnImprimir: TButton;
    chkApenasAndamento: TCheckBox;
    tsProximaEtapa: TTabSheet;
    tabTodoRoteiroProdutivo: TZQuery;
    mmo1: TMemo;
    tabProximaEtapaAux: TClientDataSet;
    tabTodoRoteiroProdutivoOrdemProducao: TFloatField;
    strngfldProximaEtapaSetor: TStringField;
    strngfldProximaEtapaCodigoProduto: TStringField;
    tabTodoRoteiroProdutivoQtd: TFloatField;
    tabProximaEtapaAuxOrdemProducao: TFloatField;
    strngfldProximaEtapa1Setor: TStringField;
    strngfldProximaEtapa1CodigoProduto: TStringField;
    tabProximaEtapaAuxQtd: TFloatField;
    tabProximaEtapaAuxTotal: TFloatField;
    tabChecagens2: TZQuery;
    tabProximaEtapaAuxCodigoSetor: TFloatField;
    tabTodoRoteiroProdutivoCodigoSetor: TFloatField;
    tabProximaEtapaExibirAux: TClientDataSet;
    tab2: TFloatField;
    strngfld1: TStringField;
    strngfld2: TStringField;
    tab3: TFloatField;
    tab4: TFloatField;
    tab5: TFloatField;
    dtsProximaEtapaExibirAux: TDataSource;
    dtsProximaEtapaAux: TDataSource;
    strngfldProximaEtapaAuxProximoSetor: TStringField;
    tabChecagens3: TZQuery;
    dbgProximaEtapa: TcxGrid;
    tvwProximaEtapa: TcxGridDBTableView;
    lvlProximaEtapa: TcxGridLevel;
    clmProximaEtapaOrdemProducao: TcxGridDBColumn;
    clmProximaEtapaSetor: TcxGridDBColumn;
    clmProximaEtapaCodigoProduto: TcxGridDBColumn;
    clmProximaEtapaTotal: TcxGridDBColumn;
    clmProximaEtapaProximoSetor: TcxGridDBColumn;
    clmMediaPadraoHora: TcxGridDBColumn;
    clmMediaHora: TcxGridDBColumn;
    clmProdutividade: TcxGridDBColumn;
    tabPainelOrdemProducao: TFloatField;
    cdsPainelCodigoProduto: TStringField;
    tabPainelPeriodoInicial: TDateTimeField;
    tabPainelPeriodoFinal: TDateTimeField;
    tabPainelPerdas: TFloatField;
    tabPainelCodigoSetor: TFloatField;
    tabPainelQuantidade: TFloatField;
    tabPainelTotal: TFloatField;
    tabPainelCodigoResponsavel1: TFloatField;
    tabPainelCodigoResponsavel2: TFloatField;
    tabPainelProducaoPorHora: TFloatField;
    cdsPainelnome1: TStringField;
    cdsPainelnome2: TStringField;
    cdsPainelStatus: TStringField;
    cdsPainelprodutividade: TStringField;
    cdsPainelSetor: TStringField;
    tfdPainelDuracao: TTimeField;
    tabPainelMediaHora: TFloatField;
    lbl1: TLabel;
    lbl2: TLabel;
    edtDataInicial: TDateEdit;
    edtDataFinal: TDateEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCodigoBarrasOperacaoExit(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure pgcPainelProducaoChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure btnPausarTodasClick(Sender: TObject);
    procedure rdgProdutosClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure chkApenasAndamentoClick(Sender: TObject);
    procedure tvwProximaEtapaCustomDrawIndicatorCell(
      Sender: TcxGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxCustomGridIndicatorItemViewInfo; var ADone: Boolean);
    procedure tvwProximaEtapaCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure tsProximaEtapaShow(Sender: TObject);
    procedure ProximaEtapa;
    procedure tvwPainelCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure edtDataInicialAcceptDate(Sender: TObject;
      var ADate: TDateTime; var Action: Boolean);
    procedure edtDataInicialExit(Sender: TObject);
    procedure edtDataFinalExit(Sender: TObject);
  private
    Column: TcxGridDBColumn;
    FProduto: string;
    FOP, FSetor, FRespons1, FRespons2: real;
    procedure DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
      Column: TColumn; State: TGridDrawState);
    procedure CarregarRoteiro;
    procedure CompactarRegistros(pOP: real; pCodigoProduto: string; pCodSetor: real);
  public
    { Public declarations }
  end;

var
  fmPainelProducao: TfmPainelProducao;
  gb_ProximoGrupo: Boolean;
  gs_GrupoAnterior: string;
  gi_Contador: Integer;

implementation

uses uFormBase, uFuncoes, DateUtils, uConstantes;

{$R *.dfm}

procedure TfmPainelProducao.FormCreate(Sender: TObject);
begin
  inherited;
  SetFormStyle(fsMDIChild);
  // Column := clmProximaEtapaOrdemProducao;
end;

procedure TfmPainelProducao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tabRoteiro.Close;
  tabAuxSetores.Close;
  tabAuxOperacoes.Close;
  tabOP.Close;
  inherited;
end;

procedure TfmPainelProducao.DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
end;

procedure TfmPainelProducao.edtCodigoBarrasOperacaoExit(Sender: TObject);
var
  vOP, vSetor, vResp1: real;
  vProduto: string;
  vNulo: boolean;
  vQtd, vPerdas: real;
begin
  inherited;
  // Formação do Código de Barras:
  // 000000                (06 digitos - Ordem de Produção)
  // 000                   (03 digitos - Código Setor)
  // 000                   (03 digitos - Código Responsável)
  // Demais Caracteres     (Length()   - Código do Produto)

  lblProduto.Caption := '';
  lblSetor.Caption := '';
  lblOrdemProducao.Caption := '';
  lblStatus.Caption := '';

  FProduto := '';
  FOP := 0;
  FSetor := 0;
  FRespons1 := 0;
  FRespons2 := 0;

  // 000000000000
  if Trim(edtCodigoBarrasOperacao.Text) <> '' then
  begin
    vOP := StrToFloat(Copy(edtCodigoBarrasOperacao.Text, 1, 6));
    vSetor := StrToFloat(Copy(edtCodigoBarrasOperacao.Text, 7, 3));
    vResp1 := StrToFloat(Copy(edtCodigoBarrasOperacao.Text, 10, 3));
    vProduto := Copy(edtCodigoBarrasOperacao.Text, 13, Length(edtCodigoBarrasOperacao.Text));

    FProduto := vProduto;
    FOP := vOP;
    FSetor := vSetor;
    FRespons1 := vResp1;
    FRespons2 := 0;

    lblProduto.Caption := 'Código Produto: ' + vProduto;
    lblSetor.Caption := 'Setor: ' + FloatToStr(vSetor);
    lblOrdemProducao.Caption := 'Ordem de Produção: ' + FloatToStr(vOP);

    tabChecagens.Close;
    tabChecagens.SQL.Clear;
    tabChecagens.SQL.Add('SELECT * FROM ordem_producao ');
    tabChecagens.SQL.Add('WHERE OrdemProducao = ' + QuotedStr(FloatToStr(vOP)));
    tabChecagens.SQL.Add('AND DataTermino IS NULL');
    tabChecagens.Open;

    grbInfoOP.Visible := True;

    if tabChecagens.RecordCount = 0 then
    begin
      lblStatus.Caption := 'Ordem de Produção já finalizada.';
      lblStatus.Font.Color := clRed;
      edtCodigoBarrasOperacao.Text := '';
      edtCodigoBarrasOperacao.SetFocus;
      exit;
    end;

    tabChecagens.Close;
    tabChecagens.SQL.Clear;
    tabChecagens.SQL.Add('SELECT * FROM roteiro_produtivo ');
    tabChecagens.SQL.Add('WHERE OrdemProducao = ' + QuotedStr(FloatToStr(vOP)) + ' AND ');
    tabChecagens.SQL.Add('CodigoProduto = ' + QuotedStr(vProduto) + ' AND ');
    tabChecagens.SQL.Add('CodigoSetor = ' + QuotedStr(FloatToStr(vSetor)));
    tabChecagens.Open;

    if tabChecagens.RecordCount > 0 then
    begin
      tabOp.Close;
      tabOp.SQL.Clear;
      tabOp.SQL.Add('SELECT * FROM ordem_producao_produtos ');
      tabOp.SQL.Add('WHERE OrdemProducao = ' + QuotedStr(FloatToStr(vOP)));
      tabOp.SQL.Add('AND CodigoProduto = ' + QuotedStr(vProduto));
      tabOp.Open;

      vQtd := 0;
      vPerdas := 0;
      vNulo := True;
      tabChecagens.First;
      while not tabChecagens.Eof do
      begin

        // ** Períodos Completos **  \\
        if (not tabChecagens.FieldByName('PeriodoInicial').IsNull) and
          (not tabChecagens.FieldByName('PeriodoFinal').IsNull) then
        begin
          vQtd := vQtd + tabChecagens.FieldByName('Quantidade').AsFloat;
          vPerdas := vPerdas + tabChecagens.FieldByName('Perdas').AsFloat;
          tabChecagens.Next;
          Continue;
        end
        else
        begin
          if tabChecagens.FieldByName('PeriodoFinal').IsNull then
          begin
            vNulo := False;
            lblStatus.Caption := 'O.P aguardando quantidade para conclusão ou pausa.';
            lblStatus.Font.Color := clGreen;
            grbPreencheOP.Visible := True;
            edtCodigoResponsavel1.Text := FloatToStr(FRespons1);
            edtCodigoResponsavel2.Text := FloatToStr(FRespons2);
            edtCodigoBarrasOperacao.Text := '';
            edtPerdas.SetFocus;
            Break;
          end;
        end;

        tabChecagens.Next;
      end;

      // ** Produção Re-Iniciada **
      if vNulo = True then
      begin
        grbInfoOP.Visible := True;

        if (vQtd - vPerdas) >= tabOp.FieldByName('Quantidade').AsFloat then
        begin
          lblStatus.Caption := 'Setor de produção já finalizado';
          lblStatus.Font.Color := clRed;
          edtCodigoBarrasOperacao.Text := '';
          exit;
        end;

        tabChecagens.Append;
        tabChecagens.FieldByName('ID').AsFloat := CodeGenerator('roteiro_produtivo', 'ID');
        tabChecagens.FieldByName('OrdemProducao').AsFloat := vOP;
        tabChecagens.FieldByName('CodigoSetor').AsFloat := vSetor;
        tabChecagens.FieldByName('CodigoProduto').AsString := vProduto;
        tabChecagens.FieldByName('CodigoResponsavel1').AsFloat := vResp1;
        tabChecagens.FieldByName('PeriodoInicial').AsDateTime := Now;
        tabChecagens.Post;
        tabChecagens.ApplyUpdates;

        lblStatus.Caption := 'Produção Re-Iniciada';
        lblStatus.Font.Color := clGreen;
      end;
    end
    else
    begin
      // *********************** Iniciar Produção ***************************
      tabChecagens.Append;
      tabChecagens.FieldByName('ID').AsFloat := CodeGenerator('roteiro_produtivo', 'ID');
      tabChecagens.FieldByName('OrdemProducao').AsFloat := vOP;
      tabChecagens.FieldByName('CodigoSetor').AsFloat := vSetor;
      tabChecagens.FieldByName('CodigoProduto').AsString := vProduto;
      tabChecagens.FieldByName('CodigoResponsavel1').AsFloat := vResp1;
      tabChecagens.FieldByName('PeriodoInicial').AsDateTime := Now;
      tabChecagens.FieldByName('Quantidade').AsFloat := 0;
      tabChecagens.FieldByName('Perdas').AsFloat := 0;
      tabChecagens.Post;
      tabChecagens.ApplyUpdates;
      lblStatus.Caption := 'Produção Iniciada';
      lblStatus.Font.Color := clGreen;
      lblStatus.Visible := True;
    end;
    edtCodigoBarrasOperacao.Text := '';
    CarregarRoteiro;
  end;
end;

procedure TfmPainelProducao.btnGravarClick(Sender: TObject);
begin
  inherited;

  if (Trim(edtCodigoResponsavel1.Text) = '') or (StrToInt(edtCodigoResponsavel1.Text) <= 0) then
  begin
    ShowMessage('Obrigatório Preenchimento do Responsável');
    edtCodigoResponsavel1.SetFocus;
    exit;
  end;

  // * checagem se qtd informada não supera a qtd da OP e mais do que ja foi lançado.
  if edtQuantidade.Value > 0 then
  begin
    try
      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT SUM(Quantidade) AS Qtd');
      tabChecagens.SQL.Add('FROM roteiro_produtivo ');
      tabChecagens.SQL.Add('WHERE ');
      tabChecagens.SQL.Add('OrdemProducao = ' + QuotedStr(FloatToStr(FOP)) + ' AND ');
      tabChecagens.SQL.Add('CodigoProduto = ' + QuotedStr(FProduto) + ' AND ');
      tabChecagens.SQL.Add('CodigoSetor = ' + QuotedStr(FloatToStr(FSetor)));
      tabChecagens.Open;

      tabOP.Close;
      tabOP.SQL.Clear;
      tabOP.SQL.Add('SELECT SUM(Quantidade) AS Qtd ');
      tabOP.SQL.Add('FROM ordem_producao_produtos');
      tabOP.SQL.Add('WHERE OrdemProducao = ' + QuotedStr(FloatToStr(FOP)) + ' AND ');
      tabOp.SQL.Add('CodigoProduto = ' + QuotedStr(FProduto));
      tabOP.Open;

      if (tabChecagens.FieldByName('Qtd').AsFloat + edtQuantidade.Value) > tabOP.FieldByName('Qtd').AsFloat then
      begin
        if Application.MessageBox('Quantidade informada supera quantidade da O.P.' + Chr(13) +
          'Continuar mesmo assim?', PChar(Application.Title), 36) = 7 then
          exit;
      end;
    finally
      tabOP.Close;
      tabChecagens.Close;
    end;
  end;

  try
    tabChecagens.Close;
    tabChecagens.SQL.Clear;
    tabChecagens.SQL.Add('SELECT * FROM roteiro_produtivo ');
    tabChecagens.SQL.Add('WHERE OrdemProducao = ' + FloatToStr(FOP) + ' AND ');
    tabChecagens.SQL.Add('CodigoProduto = ' + QuotedStr(FProduto) + ' AND ');
    tabChecagens.SQL.Add('CodigoSetor = ' + FloatToStr(FSetor));
    tabChecagens.Open;

    tabChecagens.First;
    while not tabChecagens.Eof do
    begin
      // ** Períodos Completos **  \\
      if (not tabChecagens.FieldByName('PeriodoInicial').IsNull) and
        (not tabChecagens.FieldByName('PeriodoFinal').IsNull) then
      begin
        tabChecagens.Next;
        Continue;
      end
      else
      begin
        if tabChecagens.FieldByName('PeriodoFinal').IsNull then
        begin
          tabChecagens.Edit;
          tabChecagens.FieldByName('CodigoResponsavel1').AsFloat := StrToFloat(edtCodigoResponsavel1.Text);
          if Trim(edtCodigoResponsavel2.Text) <> '' then
          begin
            tabChecagens.FieldByName('CodigoResponsavel2').AsFloat := StrToFloat(edtCodigoResponsavel2.Text);
          end;
          tabChecagens.FieldByName('Perdas').AsFloat := edtPerdas.Value;
          tabChecagens.FieldByName('Quantidade').AsFloat := edtQuantidade.Value;
          tabChecagens.FieldByName('PeriodoFinal').AsDateTime := Now;
          tabChecagens.Post;
          tabChecagens.ApplyUpDates;
          Break;
        end;
      end;
      tabChecagens.Next;
    end;
  finally
    tabChecagens.Close;
    pgcPainelProducao.ActivePageIndex := 0;
    CarregarRoteiro;
  end;
end;

procedure TfmPainelProducao.CarregarRoteiro;
var
  Field: TIntegerField;
  hi, hf: TDateTime;
  ai, af: TDateTime;
  vMedia: Real;
  vDuracao: TTime;
begin
  Application.ProcessMessages;

  try
    tvwPainel.DataController.DataSource := nil;
    rdgProdutos.Enabled := False;
    btnPausarTodas.Enabled := False;
    tbsMovimentos.Enabled := False;
    chkApenasAndamento.Enabled := False;
    btnImprimir.Enabled := False;
    pbrBarra.Position := 1;

    tabRoteiro.Close;
    tabRoteiro.SQL.Clear;
    tabRoteiro.SQL.Add(' SELECT                           ');
    tabRoteiro.SQL.Add('     rp.OrdemProducao,                           ');
    tabRoteiro.SQL.Add('     rp.CodigoProduto,                           ');
    tabRoteiro.SQL.Add('     rp.PeriodoInicial,                           ');
    tabRoteiro.SQL.Add('     rp.PeriodoFinal,                           ');
    tabRoteiro.SQL.Add('     rp.Perdas,                           ');
    tabRoteiro.SQL.Add('     rp.CodigoSetor,                           ');
    tabRoteiro.SQL.Add('     rp.Quantidade,                           ');
    tabRoteiro.SQL.Add('     rp.Quantidade as Total,                           ');
    tabRoteiro.SQL.Add('     rp.CodigoResponsavel1,                           ');
    tabRoteiro.SQL.Add('     rp.CodigoResponsavel2,                           ');
    tabRoteiro.SQL.Add('     spp.ProducaoPorHora,                           ');
    tabRoteiro.SQL.Add('     f1.nome as nome1,                           ');
    tabRoteiro.SQL.Add('     f2.nome as nome2,                           ');
    tabRoteiro.SQL.Add('     f2.nome as Status,                           ');
    tabRoteiro.SQL.Add('     f2.nome as produtividade,                           ');
    tabRoteiro.SQL.Add('     genericos.Descricao AS Setor,                           ');
    tabRoteiro.SQL.Add('    TIMEDIFF(rp.PeriodoFinal, rp.PeriodoInicial) AS Duracao,                         ');
    tabRoteiro.SQL.Add('     ID as MediaHora                             ');
    tabRoteiro.SQL.Add(' FROM                           ');
    tabRoteiro.SQL.Add('     roteiro_produtivo AS rp                           ');
    tabRoteiro.SQL.Add('         LEFT JOIN                           ');
    tabRoteiro.SQL.Add('     genericos ON genericos.Codigo = rp.CodigoSetor                           ');
    tabRoteiro.SQL.Add('         LEFT JOIN                           ');
    tabRoteiro.SQL.Add('     funcionarios as f1 ON f1.Codigo = rp.CodigoResponsavel1                           ');
    tabRoteiro.SQL.Add('         LEFT JOIN                           ');
    tabRoteiro.SQL.Add('     funcionarios as f2 ON f2.Codigo = rp.CodigoResponsavel2                           ');
    tabRoteiro.SQL.Add('         LEFT JOIN                           ');
    tabRoteiro.SQL.Add('     sequencia_producao_produtos as spp on spp.CodigoProduto = rp.CodigoProduto and spp.CodigoSetor = rp.CodigoSetor ');
    tabRoteiro.SQL.Add(' WHERE                           ');
    tabRoteiro.SQL.Add('     exists( SELECT                           ');
    tabRoteiro.SQL.Add('             op.OrdemProducao                           ');
    tabRoteiro.SQL.Add('         FROM                           ');
    tabRoteiro.SQL.Add('             ordem_producao AS op                           ');
    tabRoteiro.SQL.Add('         WHERE                           ');

    if (Trim(edtDataInicial.Text) <> '/  /') and (Trim(edtDataFinal.Text) <> '/  /') then begin
     tabRoteiro.SQL.Add('Data >= '+QuotedStr(FormatDateTime(sis_date_format, edtDataInicial.Date))+' AND Data <= '+QuotedStr(FormatDateTime(sis_date_format, edtDataFinal.Date)) +  ' AND ');
    end;

    if rdgProdutos.ItemIndex = 0 then
    begin
      tabRoteiro.SQL.Add(' op.DataTermino IS NULL ');
      tabRoteiro.SQL.Add('                 and rp.OrdemProducao = op.OrdemProducao   ');
    end
    else if rdgProdutos.ItemIndex = 1 then
    begin
      tabRoteiro.SQL.Add(' op.DataTermino IS NOT NULL ');
      tabRoteiro.SQL.Add('                 and rp.OrdemProducao = op.OrdemProducao   ');
    end
    else if rdgProdutos.ItemIndex = 2 then
    begin
      tabRoteiro.SQL.Add('               rp.OrdemProducao = op.OrdemProducao   ');
    end;

    tabRoteiro.SQL.Add('         )                        ');

    if chkApenasAndamento.Checked then
    begin
      tabRoteiro.SQL.Add(' and rp.PeriodoFinal IS NULL ');
    end;

    mmo1.Lines.Text := tabRoteiro.SQL.Text;

    tabRoteiro.Open;

    pbrBarra.Properties.Max := tabRoteiro.RecordCount;

    tabPainel.Close;
    tabPainel.Open;

    tabPainel.First;

    while not tabPainel.Eof do
    begin
      Application.ProcessMessages;

      try
        tabChecagens.Close;
        tabChecagens.SQL.Clear;
        tabChecagens.SQL.Add('SELECT sum(Quantidade) as Qtd FROM ordem_producao_produtos ');
        tabChecagens.SQL.Add('WHERE OrdemProducao = ' + QuotedStr(tabPainel.FieldByName('OrdemProducao').AsString));
        tabChecagens.SQL.Add('AND CodigoProduto = ' + QuotedStr(tabPainel.FieldByName('CodigoProduto').AsString));

        tabChecagens.Open;

        if tabChecagens.RecordCount = 1 then
        begin
          tabPainel.Edit;
          tabPainel.FieldByName('Total').AsInteger := tabChecagens.FieldByName('Qtd').AsInteger;
          // tabPainel.FieldByName('Total').AsInteger := tabChecagens.FieldByName('Quantidade').AsInteger;

          // Calcula média por hora
          hi := tabPainel.FieldByName('PeriodoInicial').AsDateTime;
          hf := tabPainel.FieldByName('PeriodoFinal').AsDateTime;

          ai := StrToDateTime(DateToStr(hi) + ' 11:00:00');
          af := StrToDateTime(DateToStr(hf) + ' 12:30:00');

          tabPainel.FieldByName('Status').AsString := '';
          tabPainel.FieldByName('produtividade').AsString := '';

          vDuracao := tabRoteiro.FieldByName('PeriodoFinal').AsDateTime - tabRoteiro.FieldByName('PeriodoInicial').AsDateTime;

          // Inicio: Manha
          // Termino: Manha
          if (hi <= ai) and (hf <= ai) then
          begin
            tabPainel.FieldByName('Status').AsString := TimeToStr(vDuracao);
          end
            // Inicio: Manha
            // Termino: Almoço
          else if (hi <= ai) and ((hf >= ai) and (hf <= af)) then
          begin

            tabPainel.FieldByName('Status').AsString := TimeToStr(ai - hi);
          end
            // Inicio: Manha
            // Termino: Tarde
          else if (hi <= ai) and (hf >= af) then
          begin
            tabPainel.FieldByName('Status').AsString := TimeToStr((hf - hi) - (af - ai));
          end
            // ***********************************
            // Inicio: almoco
            // Termino: almoco
          else if ((hi >= ai) and (hi <= af)) and (hf <= af) then
          begin
            tabPainel.FieldByName('Status').AsString := '';
          end
            // Inicio: almoco
            // Termino: tarde
          else if ((hi >= ai) and (hi <= af)) and (hf > af) then
          begin
            tabPainel.FieldByName('Status').AsString := TimeToStr((hf - af));
          end
            // Inicio: tarde
            // Termino: tarde
          else if (hi >= ai) and (hf > af) then
          begin
            tabPainel.FieldByName('Status').AsString := TimeToStr(vDuracao);
          end;

          if (tabPainel.FieldByName('Status').AsString <> '') then
          begin
            vMedia := (tabPainel.FieldByName('Quantidade').AsFloat * 3600) / (StrToTime(tabPainel.FieldByName('Status').AsString) * 86400);

            tabPainel.FieldByName('MediaHora').AsFloat := StrToFloat(FormatFloat('###0.00', vMedia));
          end;

          if not tabPainel.FieldByName('PeriodoFinal').IsNull then
          begin
            if tabPainel.FieldByName('MediaHora').AsFloat > tabPainel.FieldByName('ProducaoPorHora').AsFloat then
            begin
              tabPainel.FieldByName('produtividade').AsString := 'Acima da Média'
            end
            else if tabPainel.FieldByName('MediaHora').AsFloat = tabPainel.FieldByName('ProducaoPorHora').AsFloat then
            begin
              tabPainel.FieldByName('produtividade').AsString := 'Na média'
            end
            else if tabPainel.FieldByName('MediaHora').AsFloat < tabPainel.FieldByName('ProducaoPorHora').AsFloat then
            begin
              tabPainel.FieldByName('produtividade').AsString := 'Abaixo da média';
            end;
          end;

          tabPainel.Post;

        end
        else
        begin
          tabPainel.Edit;
          tabPainel.FieldByName('Total').AsInteger := 0;
          tabPainel.Post;
        end;

      finally
        tabChecagens.Close;
      end;

      pbrBarra.Position := tabPainel.RecNo;

      tabPainel.Next;
    end;

    // tabAuxOperacoes.IndexFieldNames := 'Data;Sequencia'; // OrdemProducao;
  finally
    tvwPainel.DataController.DataSource := dtsPainel;
    pbrBarra.Position := 0;
    rdgProdutos.Enabled := True;
    btnPausarTodas.Enabled := True;
    tbsMovimentos.Enabled := True;
    chkApenasAndamento.Enabled := True;
    btnImprimir.Enabled := True;
  end;

end;

procedure TfmPainelProducao.pgcPainelProducaoChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  if pgcPainelProducao.ActivePageIndex = 0 then
  begin
    grbInfoOP.Visible := False;
    grbPreencheOP.Visible := False;
    edtCodigoBarrasOperacao.Text := '';
  end;
end;

procedure TfmPainelProducao.btnPausarTodasClick(Sender: TObject);
begin
  inherited;

  // Deseja realmente pausar todo o roteiro produtivo
  if Application.MessageBox('Deseja Realmente Pausar Todas as O.P.s ?', 'O.P.', 36) = 7 then
    exit;
  try
    // comando SQL
    tabChecagens.Close;
    tabChecagens.SQL.Clear;
    tabChecagens.SQL.Add('UPDATE roteiro_produtivo SET ');
    tabChecagens.SQL.Add('PeriodoFinal = ' + QuotedStr(FormatDateTime(sis_date_format + ' hh:nn:ss', Now)) + ', ');
    tabChecagens.SQL.Add('Quantidade = 0, ');
    tabChecagens.SQL.Add('Perdas = 0 ');
    tabChecagens.SQL.Add('WHERE ');
    tabChecagens.SQL.Add('PeriodoFinal IS NULL ');
    tabChecagens.ExecSQL;
  finally
    tabChecagens.Close;
  end;
  CarregarRoteiro;
end;

procedure TfmPainelProducao.CompactarRegistros(pOP: real;
  pCodigoProduto: string; pCodSetor: real);
begin

end;

procedure TfmPainelProducao.rdgProdutosClick(Sender: TObject);
begin
  inherited;
  CarregarRoteiro;
end;

{ TMinhaThread }

constructor TMinhaThread.Create(CreateSuspended: Boolean);
begin
  Stopped := False;
  Contador := 0;
end;

procedure TMinhaThread.Execute;
begin
  inherited;

  while not Stopped do
  begin
    Inc(Contador);
    Sleep(100);
  end;
end;

procedure TfmPainelProducao.FormShow(Sender: TObject);
begin
  inherited;

  edtDataInicial.Date := IncMonth(Date,-2);
  edtDataFinal.Date := Date;

  // Zera o produto, ordem de produção, setor, responsável 1, responsável 2
  FProduto := '';
  FOP := 0;
  FSetor := 0;
  FRespons1 := 0;
  FRespons2 := 0;

  // guia padrão
  pgcPainelProducao.ActivePageIndex := 0;

  // Cria o ClientDataSet responsável por mostrar um item do roteiro produtivo
  tabAuxSetores.CreateDataSet;
  tabAuxSetores.EmptyDataSet;
  tabAuxSetores.IndexFieldNames := 'CodigoSetor';

  tabAuxOperacoes.CreateDataSet;
  tabAuxOperacoes.EmptyDataSet;

  // Carrega o roteiro produtivo
  CarregarRoteiro;

  gi_Contador := 1;

end;

procedure TfmPainelProducao.btnImprimirClick(Sender: TObject);
begin
  inherited;
  if pgcPainelProducao.TabIndex = 0 then
  begin
    grlPainel.Component := dbgPainel;
  end
  else if pgcPainelProducao.TabIndex = 2 then
  begin
    grlPainel.Component := dbgProximaEtapa;
  end;
  
  crpPainel.Preview(True);
end;

procedure TfmPainelProducao.chkApenasAndamentoClick(Sender: TObject);
begin
  inherited;
  CarregarRoteiro;
end;

procedure TfmPainelProducao.tvwProximaEtapaCustomDrawIndicatorCell(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxCustomGridIndicatorItemViewInfo; var ADone: Boolean);

begin

end;

{
var
ls_GrupoAtual: string;
begin
ls_GrupoAtual := upperCase(AViewInfo.GridRecord.DisplayTexts[Column.Index]);

if gs_GrupoAnterior = '' then
begin
  gs_GrupoAnterior := ls_GrupoAtual;
  gi_Contador := 1;
end;

if gs_GrupoAnterior <> ls_GrupoAtual then
begin
  gb_ProximoGrupo := True;
  gs_GrupoAnterior := ls_GrupoAtual;
  gi_Contador := gi_Contador + 1;
end;

if (gi_Contador mod 2) = 0 then
begin
  ACanvas.Brush.Color := clRed;
end
else
begin
  ACanvas.Brush.Color := clGreen;
end;

end;
}

procedure TfmPainelProducao.tvwProximaEtapaCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  ls_GrupoAtual: string;
begin
  Exit;

  ls_GrupoAtual := upperCase(AViewInfo.GridRecord.DisplayTexts[Column.Index]);

  if gs_GrupoAnterior = '' then
  begin
    gs_GrupoAnterior := ls_GrupoAtual;
    gi_Contador := 1;
  end;

  if gs_GrupoAnterior <> ls_GrupoAtual then
  begin
    gb_ProximoGrupo := True;
    gs_GrupoAnterior := ls_GrupoAtual;
    gi_Contador := gi_Contador + 1;
  end;

  if (gi_Contador mod 2) = 0 then
  begin
    ACanvas.Brush.Color := clRed;
  end
  else
  begin
    ACanvas.Brush.Color := clGreen;
  end;

  ADone := True;
end;

procedure TfmPainelProducao.tsProximaEtapaShow(Sender: TObject);
begin
  inherited;
  ProximaEtapa;
end;

procedure TfmPainelProducao.ProximaEtapa;
var
  vOP, vRecNo_Atual, vRecNo_Novo: Real;
  vCD: string;
  bmLocalImportante: TBookmark;
begin
  inherited;

  with tabTodoRoteiroProdutivo do
  begin
    Close;

    // Pega todo o roteiro produtivo das ordens
    SQL.Clear;
    SQL.Add(' select                                                 ');
    SQL.Add('    OrdemProducao,                                      ');
    SQL.Add('    CodigoSetor,                                        ');
    SQL.Add('    genericos.Descricao AS Setor,                       ');
    SQL.Add('    CodigoProduto,                                      ');
    SQL.Add('    sum(Quantidade) as Qtd                              ');
    SQL.Add(' from                                                   ');
    SQL.Add('    roteiro_produtivo AS rp                             ');
    SQL.Add('        LEFT JOIN                                       ');
    SQL.Add('    genericos ON genericos.Codigo = rp.CodigoSetor      ');
    SQL.Add(' WHERE                           ');
    SQL.Add('     exists( SELECT                           ');
    SQL.Add('             op.OrdemProducao                           ');
    SQL.Add('         FROM                           ');
    SQL.Add('             ordem_producao AS op                           ');
    SQL.Add('         WHERE                           ');

    // Define se vamos pegar as ordens de producao terminadas
    if rdgProdutos.ItemIndex = 0 then
    begin
      SQL.Add(' op.DataTermino IS NULL ');
      SQL.Add('                 and rp.OrdemProducao = op.OrdemProducao   ');
    end

      // Define se vamos pegar as ordens de producao nao terminadas
    else if rdgProdutos.ItemIndex = 1 then
    begin
      SQL.Add(' op.DataTermino IS NOT NULL ');
      SQL.Add('                 and rp.OrdemProducao = op.OrdemProducao   ');
    end

      // pega todas as orddens de producao
    else if rdgProdutos.ItemIndex = 2 then
    begin
      SQL.Add('               rp.OrdemProducao = op.OrdemProducao   ');
    end;
    SQL.Add('         )                        ');
    SQL.Add(' group by OrdemProducao , CodigoSetor , CodigoProduto   ');
    SQL.Add(' order by ordemproducao desc;                           ');

    Open;
  end;

  // Prepara o ClientDataSet que pegará as próximas etapas
  tabProximaEtapaAux.Close;
  tabProximaEtapaAux.CreateDataSet;
  tabProximaEtapaAux.EmptyDataSet;

  // Desativa a visualização no grid
  tvwProximaEtapa.DataController.DataSource := nil;

  try
    // Apenas pego os setores que já terminaram
    tabTodoRoteiroProdutivo.First;

    // Varre todo o roteiro produtivo
    while not tabTodoRoteiroProdutivo.Eof do
    begin
      Application.ProcessMessages;

      // Pega os produtos da ordem de produção cadastrada no roteiro
      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT * FROM ordem_producao_produtos ');
      tabChecagens.SQL.Add('WHERE OrdemProducao = ' + QuotedStr(tabTodoRoteiroProdutivo.FieldByName('OrdemProducao').AsString));
      tabChecagens.SQL.Add('AND CodigoProduto = ' + QuotedStr(tabTodoRoteiroProdutivo.FieldByName('CodigoProduto').AsString));
      tabChecagens.Open;

      // Pego a sequencia do roteiro produtivo do produto
      tabChecagens2.Close;
      tabChecagens2.SQL.Clear;
      tabChecagens2.SQL.Add(' SELECT ');
      tabChecagens2.SQL.Add('    genericos.Descricao AS Setor, ');
      tabChecagens2.SQL.Add('    sequencia_producao_produtos.CodigoSetor, ');
      tabChecagens2.SQL.Add('    sequencia_producao_produtos.Sequencia AS Seq, ');
      tabChecagens2.SQL.Add('    sequencia_producao_produtos.CodigoProduto ');
      tabChecagens2.SQL.Add(' FROM ');
      tabChecagens2.SQL.Add('    sequencia_producao_produtos, ');
      tabChecagens2.SQL.Add('    genericos ');
      tabChecagens2.SQL.Add(' WHERE ');
      tabChecagens2.SQL.Add('    sequencia_producao_produtos.CodigoProduto = ' + QuotedStr(tabTodoRoteiroProdutivo.FieldByName('CodigoProduto').AsString));
      tabChecagens2.SQL.Add('    AND sequencia_producao_produtos.CodigoSetor = genericos.Codigo ');
      tabChecagens2.SQL.Add(' ORDER BY sequencia_producao_produtos.Sequencia ');
      tabChecagens2.Open;

      // Apenas pego o total se na ordem de producao for adicionado apenas um produto
      if tabChecagens.RecordCount = 1 then
      begin

        // Se a quantidade produzida for maior ou igual que quantidade a ser produzida, significa
        // que esse setor de producao já foi finalizado
        if tabTodoRoteiroProdutivo.FieldByName('Qtd').AsFloat >= tabChecagens.FieldByName('Quantidade').AsInteger then
        begin
          // Filtro apenas para as ordens de producao do roteiro produtivo atual
          tabProximaEtapaAux.Filter := 'OrdemProducao=' + FloatToStr(tabTodoRoteiroProdutivo.FieldByName('OrdemProducao').AsFloat);
          tabProximaEtapaAux.Filtered := True;

          // Se não há setor inserido, inserimos
          if tabProximaEtapaAux.RecordCount = 0 then
          begin
            // Adiciona o setor
            tabProximaEtapaAux.Append;
            tabProximaEtapaAux.FieldByName('OrdemProducao').Value := tabTodoRoteiroProdutivo.FieldByName('OrdemProducao').AsFloat;
            tabProximaEtapaAux.FieldByName('Setor').Value := tabTodoRoteiroProdutivo.FieldByName('Setor').AsString;
            tabProximaEtapaAux.FieldByName('CodigoProduto').Value := tabTodoRoteiroProdutivo.FieldByName('CodigoProduto').AsString;
            tabProximaEtapaAux.FieldByName('Qtd').Value := tabTodoRoteiroProdutivo.FieldByName('Qtd').AsFloat;
            tabProximaEtapaAux.FieldByName('Total').AsInteger := tabChecagens.FieldByName('Quantidade').AsInteger;
            tabProximaEtapaAux.FieldByName('CodigoSetor').Value := tabTodoRoteiroProdutivo.FieldByName('CodigoSetor').AsFloat;
            tabProximaEtapaAux.Post;
          end
          else
          begin
            // Se encontrou, verifica se esse setor é mais recente que o setor que vou adicionar
            tabChecagens2.Locate('CodigoSetor', tabProximaEtapaAux.FieldByName('CodigoSetor').AsString, []);
            vRecNo_Atual := tabChecagens2.RecNo;

            tabChecagens2.Locate('CodigoSetor', tabTodoRoteiroProdutivo.FieldByName('CodigoSetor').AsString, []);
            vRecNo_Novo := tabChecagens2.RecNo;

            // Se o novo setor é maior que o atual
            if vRecNo_Novo > vRecNo_Atual then
            begin
              // Excluo o atual
              tabProximaEtapaAux.Delete;

              // Adiciono o novo setor
              tabProximaEtapaAux.Append;
              tabProximaEtapaAux.FieldByName('OrdemProducao').Value := tabTodoRoteiroProdutivo.FieldByName('OrdemProducao').AsFloat;
              tabProximaEtapaAux.FieldByName('Setor').Value := tabTodoRoteiroProdutivo.FieldByName('Setor').AsString;
              tabProximaEtapaAux.FieldByName('CodigoProduto').Value := tabTodoRoteiroProdutivo.FieldByName('CodigoProduto').AsString;
              tabProximaEtapaAux.FieldByName('Qtd').Value := tabTodoRoteiroProdutivo.FieldByName('Qtd').AsFloat;
              tabProximaEtapaAux.FieldByName('Total').AsInteger := tabChecagens.FieldByName('Quantidade').AsInteger;
              tabProximaEtapaAux.FieldByName('CodigoSetor').Value := tabTodoRoteiroProdutivo.FieldByName('CodigoSetor').AsFloat;
              tabProximaEtapaAux.Post;
            end;

          end;

          // Tira o filtro de ordem de producao
          tabProximaEtapaAux.Filtered := False;

        end;

      end;

      tabTodoRoteiroProdutivo.Next;
    end;

    tabProximaEtapaExibirAux.Close;
    tabProximaEtapaExibirAux.CreateDataSet;
    tabProximaEtapaExibirAux.EmptyDataSet;
    tabProximaEtapaExibirAux.Open;

    tabProximaEtapaAux.First;

    // Pego os setores que já terminaram e adiciono o próximo setor
    while not tabProximaEtapaAux.Eof do
    begin

      // Pego a sequencia do roteiro produtivo
      tabChecagens2.Close;
      tabChecagens2.SQL.Clear;
      tabChecagens2.SQL.Add(' SELECT ');
      tabChecagens2.SQL.Add('    genericos.Descricao AS Setor, ');
      tabChecagens2.SQL.Add('    sequencia_producao_produtos.CodigoSetor, ');
      tabChecagens2.SQL.Add('    sequencia_producao_produtos.Sequencia AS Seq, ');
      tabChecagens2.SQL.Add('    sequencia_producao_produtos.CodigoProduto ');
      tabChecagens2.SQL.Add(' FROM ');
      tabChecagens2.SQL.Add('    sequencia_producao_produtos, ');
      tabChecagens2.SQL.Add('    genericos ');
      tabChecagens2.SQL.Add(' WHERE ');
      tabChecagens2.SQL.Add('    sequencia_producao_produtos.CodigoProduto = ' + QuotedStr(tabProximaEtapaAux.FieldByName('CodigoProduto').AsString));
      tabChecagens2.SQL.Add('    AND sequencia_producao_produtos.CodigoSetor = genericos.Codigo ');
      tabChecagens2.SQL.Add(' ORDER BY sequencia_producao_produtos.Sequencia ');
      tabChecagens2.Open;

      tabChecagens2.First;

      // Pego a ordem de producao e o código do produto
      vOP := tabProximaEtapaAux.FieldByName('OrdemProducao').AsFloat;
      vCD := tabProximaEtapaAux.FieldByName('CodigoProduto').AsString;

      // Marco o local atual
      bmLocalImportante := tabProximaEtapaAux.GetBookMark;

      // Varrendo a sequencia do roteiro produtivo do produto
      while not tabChecagens2.Eof do
      begin

        // Filtrando
        tabProximaEtapaAux.Filter := 'OrdemProducao=' + FloatToStr(vOP);
        tabProximaEtapaExibirAux.Filter := 'OrdemProducao=' + FloatToStr(vOP);
        tabProximaEtapaAux.Filtered := True;
        tabProximaEtapaExibirAux.Filtered := True;

        // Se não encontrou o setor
        if (not tabProximaEtapaAux.Locate('CodigoSetor', tabChecagens2.FieldByName('CodigoSetor').AsString, [])) then
        begin

          tabChecagens3.Close;
          tabChecagens3.SQL.Clear;
          tabChecagens3.SQL.Add(' SELECT ');
          tabChecagens3.SQL.Add('    genericos.Descricao AS Setor, ');
          tabChecagens3.SQL.Add('    sequencia_producao_produtos.CodigoSetor, ');
          tabChecagens3.SQL.Add('    sequencia_producao_produtos.Sequencia AS Seq, ');
          tabChecagens3.SQL.Add('    sequencia_producao_produtos.CodigoProduto ');
          tabChecagens3.SQL.Add(' FROM ');
          tabChecagens3.SQL.Add('    sequencia_producao_produtos, ');
          tabChecagens3.SQL.Add('    genericos ');
          tabChecagens3.SQL.Add(' WHERE ');
          tabChecagens3.SQL.Add('    sequencia_producao_produtos.CodigoProduto = ' + QuotedStr(vCD));
          tabChecagens3.SQL.Add('    AND sequencia_producao_produtos.CodigoSetor = genericos.Codigo ');
          tabChecagens3.SQL.Add(' ORDER BY sequencia_producao_produtos.Sequencia ');
          tabChecagens3.Open;

          // Se encontrou, verifica se esse setor é mais recente que o setor que vou adicionar
          tabChecagens3.Locate('CodigoSetor', tabProximaEtapaAux.FieldByName('CodigoSetor').AsString, []);
          vRecNo_Atual := tabChecagens3.RecNo;

          tabChecagens3.Locate('CodigoSetor', tabChecagens2.FieldByName('CodigoSetor').AsString, []);
          vRecNo_Novo := tabChecagens3.RecNo;

          // Se o novo setor é maior que o atual
          if vRecNo_Novo > vRecNo_Atual then
          begin
            tabProximaEtapaExibirAux.Append;
            tabProximaEtapaExibirAux.FieldByName('OrdemProducao').Value := vOP;
            tabProximaEtapaExibirAux.FieldByName('Setor').Value := tabChecagens2.FieldByName('Setor').AsString;
            tabProximaEtapaExibirAux.FieldByName('CodigoProduto').Value := vCD;
            tabProximaEtapaExibirAux.FieldByName('Qtd').Value := -1;
            tabProximaEtapaExibirAux.FieldByName('CodigoSetor').Value := tabChecagens2.FieldByName('CodigoSetor').AsString;
            tabProximaEtapaExibirAux.Post;

            tabProximaEtapaAux.Filtered := False;
            tabProximaEtapaExibirAux.Filtered := False;

            Break;

          end;

        end;

        tabProximaEtapaAux.Filtered := False;
        tabProximaEtapaExibirAux.Filtered := False;

        tabChecagens2.Next;
      end;

      tabProximaEtapaAux.GotoBookMark(bmLocalImportante);
      tabProximaEtapaAux.Next;
      Application.ProcessMessages;
    end;

    // Coloco o próximo setor no clientdataset que será exibido na tela
    tabProximaEtapaExibirAux.First;
    while not tabProximaEtapaExibirAux.Eof do
    begin

      if tabProximaEtapaAux.Locate('OrdemProducao', tabProximaEtapaExibirAux.FieldByName('OrdemProducao').AsInteger, []) then
      begin
        tabProximaEtapaAux.Edit;
        tabProximaEtapaAux.FieldByName('ProximoSetor').AsString := tabProximaEtapaExibirAux.FieldByName('Setor').AsString;
        tabProximaEtapaAux.Post;
      end;

      tabProximaEtapaExibirAux.Next;
    end;

  finally
    tabProximaEtapaAux.Filtered := False;
    tabProximaEtapaExibirAux.Filtered := False;
    tvwProximaEtapa.DataController.DataSource := dtsProximaEtapaAux;
  end;

  tabProximaEtapaAux.Open;
  tabProximaEtapaExibirAux.Open;

end;

procedure TfmPainelProducao.tvwPainelCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  if (AViewInfo.GridRecord.Values[clmProdutividade.Index] = 'Abaixo da média') then
  begin
    ACanvas.Brush.Color := $00ECECFF;
  end;
end;

procedure TfmPainelProducao.edtDataInicialAcceptDate(Sender: TObject;
  var ADate: TDateTime; var Action: Boolean);
begin
  inherited;

  CarregarRoteiro;
end;

procedure TfmPainelProducao.edtDataInicialExit(Sender: TObject);
begin
  inherited;
  CarregarRoteiro;

end;

procedure TfmPainelProducao.edtDataFinalExit(Sender: TObject);
begin
  inherited;
  CarregarRoteiro;
end;

end.


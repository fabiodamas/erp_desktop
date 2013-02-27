unit uSolicitacaoMudanca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Menus, Buttons, ExtCtrls, StdCtrls, Mask, DBCtrls, ComCtrls,
  Grids, DBGrids, ShellApi, cxGraphics, cxControls, cxLookAndFeels,
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
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxContainer, cxTextEdit, cxMemo, cxDBEdit,
  ToolEdit, RXDBCtrl, cxMaskEdit, cxDropDownEdit, cxCalendar, cxSpinEdit,
  cxTimeEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxImageComboBox, ImgList, ActnList, DBActns, SQLTimST, cxCheckComboBox,
  QRCtrls, QuickRpt, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd,
  dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxPScxPageControlProducer, dxSkinsdxBarPainter,
  dxPSCore, dxPScxCommon, dxPScxGrid6Lnk, ZAbstractConnection, ZConnection;

type
  TfrmSolicitacaoMudanca = class(TfmFormBaseCadastro)
    pgcSolicitacoes: TPageControl;
    tsSolicitacoesMudancas: TTabSheet;
    tsSolucao: TTabSheet;
    Rtulo1: TMenuItem;
    popEmail: TPopupMenu;
    EnviarEmail1: TMenuItem;
    dbgSolicitacaoMudanca: TcxGrid;
    tvwSolicitacaoMudanca: TcxGridDBTableView;
    lvlSolicitacaoMudanca: TcxGridLevel;
    clmUsuario: TcxGridDBColumn;
    clmDataRequisicao: TcxGridDBColumn;
    clmStatus: TcxGridDBColumn;
    clmTipo: TcxGridDBColumn;
    clmPrioridade: TcxGridDBColumn;
    clmNomeJanela: TcxGridDBColumn;
    clmTempoEstimado: TcxGridDBColumn;
    clmPrazoFinal: TcxGridDBColumn;
    clmHorasCorridas: TcxGridDBColumn;
    clmSinopse: TcxGridDBColumn;
    tsDetalhes: TTabSheet;
    grp4: TGroupBox;
    dbm1: TcxDBMemo;
    grp5: TGroupBox;
    edtEndereco1: TDBEdit;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    pnl1: TPanel;
    grp2: TGroupBox;
    grp3: TGroupBox;
    grp6: TGroupBox;
    grp7: TGroupBox;
    grp8: TGroupBox;
    cbb1: TcxDBComboBox;
    cbbTipo: TcxDBComboBox;
    cbb3: TcxDBComboBox;
    dbe1: TcxDBDateEdit;
    cxDBTimeEdit1: TcxDBTimeEdit;
    cxDBTimeEdit2: TcxDBTimeEdit;
    dbe2: TcxDBDateEdit;
    tabSolucao: TZQuery;
    dtsSolucao: TDataSource;
    lbl5: TLabel;
    cbb2: TcxDBLookupComboBox;
    dtsUsuarios: TDataSource;
    tabUsuarios: TZQuery;
    strngfldUsuariosUsuario: TStringField;
    strngfldUsuariosSenha: TStringField;
    tabUsuariosCodigoPerfil: TFloatField;
    mmfUsuariosTelas: TMemoField;
    grp9: TGroupBox;
    lbl7: TLabel;
    edtSinopse: TDBEdit;
    clmDescricao: TcxGridDBColumn;
    imgImagens: TcxImageList;
    aclSolucao: TActionList;
    dsiInsert: TDataSetInsert;
    dsdDelete: TDataSetDelete;
    dspPost: TDataSetPost;
    dscCancel: TDataSetCancel;
    tabChecagens: TZQuery;
    dseEdit: TDataSetEdit;
    grp10: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl20: TLabel;
    lbl6: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    edtDescricao2: TDBEdit;
    edtCodigoSolucao: TDBEdit;
    dbe3: TcxDBDateEdit;
    cxDBTimeEdit3: TcxDBTimeEdit;
    cxDBTimeEdit4: TcxDBTimeEdit;
    cxDBTimeEdit5: TcxDBTimeEdit;
    pnl2: TPanel;
    pnl3: TPanel;
    btnNovoSolucao: TSpeedButton;
    btnDelete: TSpeedButton;
    btnGravarSolucao: TSpeedButton;
    btnCancelaSolucao: TSpeedButton;
    btnExcluirSolucao: TSpeedButton;
    dbgSolucao: TcxGrid;
    tvwSolucao: TcxGridDBTableView;
    clmSolucaoCodigoSolucao: TcxGridDBColumn;
    clmSolucaoData: TcxGridDBColumn;
    clmSolucaoHoraInicial: TcxGridDBColumn;
    clmSolucaoHoraFinal: TcxGridDBColumn;
    clmSolucaoTotal: TcxGridDBColumn;
    clmSolucaoDescricao: TcxGridDBColumn;
    lvlSolucao: TcxGridLevel;
    tabBaseCodigoSolicitacoesMudancas: TFloatField;
    strngfldBaseCodigoUsuario: TStringField;
    strngfldBaseTipo: TStringField;
    strngfldBaseStatus: TStringField;
    strngfldBasePrioridade: TStringField;
    dfdBaseDataRequisicao: TDateField;
    strngfldBaseNomeJanela: TStringField;
    tfdBaseTempoEstimado: TTimeField;
    dfdBasePrazoFinal: TDateField;
    tfdBaseHorasCorridas: TTimeField;
    strngfldBaseDescricao: TStringField;
    strngfldBaseSinopse: TStringField;
    tabTotalHoras: TZQuery;
    tabTotalHorasCodigoSolicitacoesMudancas: TFloatField;
    strngfldTotalHorasCodigoUsuario: TStringField;
    strngfldTotalHorasTipo: TStringField;
    strngfldTotalHorasStatus: TStringField;
    strngfldTotalHorasPrioridade: TStringField;
    dfdTotalHorasDataRequisicao: TDateField;
    strngfldTotalHorasNomeJanela: TStringField;
    tfdTotalHorasTempoEstimado: TTimeField;
    dfdTotalHorasPrazoFinal: TDateField;
    tfdHorasCorridas: TTimeField;
    strngfldTotalHorasDescricao: TStringField;
    strngfldTotalHorasSinopse: TStringField;
    tabTotalHorasSolucao: TZQuery;
    tabTotalHorasSolucaoCodigoSolucao: TFloatField;
    tabTotalHorasSolucaoCodigoSolicitacoesMudancas: TFloatField;
    dfdTotalHorasSolucaoData: TDateField;
    tfdTotalHorasSolucaoHoraInicial: TTimeField;
    tfdTotalHorasSolucaoHoraFinal: TTimeField;
    tfdTotal: TTimeField;
    strngfldTotalHorasSolucaoDescricao: TStringField;
    tsTodasSolucoes: TTabSheet;
    dbgTodasSolucoes: TcxGrid;
    tvwTodasSolucoes: TcxGridDBTableView;
    lvlTodasSolucoes: TcxGridLevel;
    tabSolucaoCorrido: TZQuery;
    tabSolucaoCorridoCodigoSolucao: TFloatField;
    tabSolucaoCorridoCodigoSolicitacoesMudancas: TFloatField;
    dfdSolucaoCorridoData: TDateField;
    tfdSolucaoCorridoHoraInicial: TTimeField;
    tfdSolucaoCorridoHoraFinal: TTimeField;
    tfdSolucaoCorridoTotal: TTimeField;
    strngfldSolucaoCorridoDescricao: TStringField;
    dtsSolucaoCorrido: TDataSource;
    clmGridDBTableView1CodigoSolucao: TcxGridDBColumn;
    clmGridDBTableView1CodigoSolicitacoesMudancas: TcxGridDBColumn;
    clmGridDBTableView1Data: TcxGridDBColumn;
    clmGridDBTableView1HoraInicial: TcxGridDBColumn;
    clmGridDBTableView1HoraFinal: TcxGridDBColumn;
    clmGridDBTableView1Total: TcxGridDBColumn;
    clmGridDBTableView1Descricao: TcxGridDBColumn;
    pnl4: TPanel;
    btnInsert: TSpeedButton;
    btnEdit: TSpeedButton;
    btnPost: TSpeedButton;
    btnCancel: TSpeedButton;
    btnDelete1: TSpeedButton;
    aclSolucaoCorrido: TActionList;
    dsiInsertCorrido: TDataSetInsert;
    dsdDeleteCorrido: TDataSetDelete;
    dseEditCorrido: TDataSetEdit;
    dspPostCorrido: TDataSetPost;
    dscCancelCorrido: TDataSetCancel;
    stl2: TcxStyleRepository;
    cst2: TcxStyle;
    stlCores: TcxStyleRepository;
    cstCorBranca: TcxStyle;
    cstCorAzul: TcxStyle;
    edtCodigoSolicitacoesMudancas: TDBEdit;
    lbl8: TLabel;
    tabSolucaoCodigoSolucao: TFloatField;
    tabSolucaoCodigoSolicitacoesMudancas: TFloatField;
    dfdSolucaoData: TDateField;
    tfdSolucaoHoraInicial: TTimeField;
    tfdSolucaoHoraFinal: TTimeField;
    tfdSolucaoTotal: TTimeField;
    strngfldSolucaoDescricao: TStringField;
    lvlSolucaoDetalhe: TcxGridLevel;
    tvwSolucaoDetalhe: TcxGridDBTableView;
    clmSolicitacaoMudancaDBTableView3CodigoSolucao: TcxGridDBColumn;
    clmSolicitacaoMudancaDBTableView3CodigoSolicitacoesMudancas: TcxGridDBColumn;
    clmSolicitacaoMudancaDBTableView3Data: TcxGridDBColumn;
    clmSolicitacaoMudancaDBTableView3HoraInicial: TcxGridDBColumn;
    clmSolicitacaoMudancaDBTableView3HoraFinal: TcxGridDBColumn;
    clmSolicitacaoMudancaDBTableView3Total: TcxGridDBColumn;
    clmSolicitacaoMudancaDBTableView3Descricao: TcxGridDBColumn;
    crpImprimir: TdxComponentPrinter;
    grlSolicitacaoMudanca: TdxGridReportLink;
    pnl5: TPanel;
    btnVisualizar: TBitBtn;
    grlTodasSolucoes: TdxGridReportLink;
    pnl6: TPanel;
    btnVisualizarTodasSolucoes: TBitBtn;
    clmOrdemExecucao: TcxGridDBColumn;
    tabBaseOrdemExecucao: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure GerarImpressao(Impressora: Boolean = False);
    procedure dtsBaseDataChange(Sender: TObject; Field: TField);
    procedure tsSolucaoShow(Sender: TObject);
    procedure tabSolucaoNewRecord(DataSet: TDataSet);
    procedure cxDBTimeEdit4Exit(Sender: TObject);
    procedure tabBaseAfterInsert(DataSet: TDataSet);
    procedure tabSolucaoAfterPost(DataSet: TDataSet);
    procedure btnGravarSolucaoClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure tabSolucaoCorridoAfterDelete(DataSet: TDataSet);
    procedure tabSolucaoCorridoAfterPost(DataSet: TDataSet);
    procedure tabSolucaoCorridoNewRecord(DataSet: TDataSet);
    procedure tsTodasSolucoesShow(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnNovoSolucaoClick(Sender: TObject);
    procedure tvwSolicitacaoMudancaCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure tvwSolicitacaoMudancaDblClick(Sender: TObject);
    procedure tvwSolicitacaoMudancaCellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnVisualizarTodasSolucoesClick(Sender: TObject);
  private
    FTyping: boolean;
  public
    procedure Novo; override;
    procedure Editar; override;
    procedure Deletar; override;
    procedure Cancelar; override;
    function Checagens: Boolean; override;
  end;

var
  frmSolicitacaoMudanca: TfrmSolicitacaoMudanca;

implementation

uses uFormBaseConfig, uFuncoes, uMenu;

{$R *.dfm}

procedure TfrmSolicitacaoMudanca.Novo;
begin

end;

procedure TfrmSolicitacaoMudanca.Editar;
begin
end;

procedure TfrmSolicitacaoMudanca.Cancelar;
begin
end;

function TfrmSolicitacaoMudanca.Checagens: Boolean;
begin

end;

procedure TfrmSolicitacaoMudanca.Deletar;
begin
end;

procedure TfrmSolicitacaoMudanca.FormCreate(Sender: TObject);
begin
  inherited;
  SetFormStyle(fsMDIChild);
  FTyping := False;
end;

procedure TfrmSolicitacaoMudanca.FormShow(Sender: TObject);
begin
  pgcSolicitacoes.ActivePageIndex := 0;

  tabSolucao.Sql.Clear;
  tabSolucao.Params.CreateParam(ftFloat, 'CodigoSolicitacoesMudancas', ptUnknown);
  tabSolucao.SQL.Add('SELECT * FROM solucao WHERE CodigoSolicitacoesMudancas = :CodigoSolicitacoesMudancas');
  tabSolucao.Open;

  tabBase.Sql.Clear;
  tabBase.Params.CreateParam(ftFloat, 'CodigoSolicitacoesMudancas', ptUnknown);
  tabBase.SQL.Add('SELECT * FROM solicitacoes_mudancas order by OrdemExecucao');
  tabBase.Open;

  tabUsuarios.Close;
  tabUsuarios.SQL.Clear;
  tabUsuarios.SQL.Add('SELECT * FROM usuarios');
  tabUsuarios.Open;

  tabSolucaoCorrido.Open;

  inherited;
end;

procedure TfrmSolicitacaoMudanca.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tabBase.Close;
  tabSolucao.Close;
  inherited;
end;

procedure TfrmSolicitacaoMudanca.btnNovoClick(Sender: TObject);
begin
  pgcSolicitacoes.ActivePageIndex := 1;

  tabSolucao.Close;
  tabSolucao.ParamByName('CodigoSolicitacoesMudancas').AsFloat := -1;
  tabSolucao.Open;

  inherited;

  edtCodigoSolicitacoesMudancas.Text := '';

  edtSinopse.SetFocus;

  if Trim(edtCodigoSolicitacoesMudancas.Text) = '' then
  begin
    edtCodigoSolicitacoesMudancas.Text := FloatToStr(CodeGenerator('solicitacoes_mudancas', 'CodigoSolicitacoesMudancas'));
    tabBase.FieldByName('CodigoSolicitacoesMudancas').AsFloat := StrToFloat(edtCodigoSolicitacoesMudancas.Text);
  end
  else
  begin
    tabBase.FieldByName('CodigoSolicitacoesMudancas').AsFloat := StrToFloat(edtCodigoSolicitacoesMudancas.Text);
  end;

  tabBase.FieldByName('OrdemExecucao').AsFloat:=CodeGenerator('solicitacoes_mudancas', 'OrdemExecucao');
end;

procedure TfrmSolicitacaoMudanca.dtsBaseDataChange(Sender: TObject;
  Field: TField);
begin
  //  inherited;

  if tabBase.FieldByName('CodigoSolicitacoesMudancas').AsString <> '' then
  begin
    tabSolucao.Close;
    tabSolucao.ParamByName('CodigoSolicitacoesMudancas').AsString := tabBase.FieldByName('CodigoSolicitacoesMudancas').AsString;
    tabSolucao.Open;
  end;

  if tabBase.State in [dsEdit, dsInsert] then
  begin
    btnAnterior.Enabled := False;
    btnProximo.Enabled := False;
    btnNovo.Enabled := False;
    btnEditar.Enabled := False;
    btnExcluir.Enabled := False;
    btnLocalizar.Enabled := False;
    btnOpcoes.Enabled := False;
    btnFechar.Enabled := False;

    btnGravar.Enabled := True;
    btnCancelar.Enabled := True;
  end
  else if tabBase.State = dsBrowse then
  begin

    btnAnterior.Enabled := True;
    btnProximo.Enabled := True;
    btnNovo.Enabled := True;
    btnEditar.Enabled := True;
    btnExcluir.Enabled := True;
    btnLocalizar.Enabled := True;
    btnOpcoes.Enabled := True;
    btnFechar.Enabled := True;

    btnGravar.Enabled := False;
    btnCancelar.Enabled := False;
  end;

end;

procedure TfrmSolicitacaoMudanca.tsSolucaoShow(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmSolicitacaoMudanca.tabSolucaoNewRecord(DataSet: TDataSet);
begin
  inherited;
  tabSolucao.FieldByName('CodigoSolucao').AsFloat := CodeGenerator('solucao', 'CodigoSolucao');
  tabSolucao.FieldByName('CodigoSolicitacoesMudancas').AsString := tabBase.FieldByName('CodigoSolicitacoesMudancas').AsString;
  tabSolucao.FieldByName('Data').AsDateTime := Date;

  tabChecagens.close;
  tabChecagens.Sql.Clear;
  tabChecagens.SQL.Add('SELECT * FROM solucao order by CodigoSolucao desc');
  tabChecagens.Open;

  if tabChecagens.RecordCount > 0 then
  begin
    tabSolucao.FieldByName('HoraInicial').AsDateTime := tabChecagens.FieldByName('HoraFinal').AsDateTime;
  end
  else
  begin
    tabSolucao.FieldByName('HoraInicial').AsDateTime := Time;
  end;
end;

procedure TfrmSolicitacaoMudanca.cxDBTimeEdit4Exit(Sender: TObject);
begin
  inherited;
  if (tabSolucao.State in [dsEdit, dsInsert]) and (not tabSolucao.FieldByName('HoraInicial').IsNull) and (not tabSolucao.FieldByName('HoraFinal').IsNull) then
  begin
    tabSolucao.FieldByName('Total').AsDateTime := tabSolucao.FieldByName('HoraFinal').AsDateTime - tabSolucao.FieldByName('HoraInicial').AsDateTime;
  end;

end;

procedure TfrmSolicitacaoMudanca.tabBaseAfterInsert(DataSet: TDataSet);
begin
  inherited;
  tabBase.FieldByName('Tipo').AsString := 'Sugestão';
  tabBase.FieldByName('Status').AsString := 'Em Aberto';
  tabBase.FieldByName('Prioridade').AsString := 'Normal';
  tabBase.FieldByName('DataRequisicao').AsDateTime := Date;
end;

procedure TfrmSolicitacaoMudanca.tabSolucaoAfterPost(DataSet: TDataSet);
var
  vHorasCorridas: string;
begin
  inherited;

  // soma o total de horas trabalhadas e grava na tabela mestre
  tabTotalHoras.Close;
  tabTotalHoras.ParamByName('CodigoSolicitacoesMudancas').AsString := tabBase.FieldByName('CodigoSolicitacoesMudancas').AsString;
  tabTotalHoras.Open;

  tabTotalHorasSolucao.Close;
  tabTotalHorasSolucao.ParamByName('CodigoSolicitacoesMudancas').AsFloat := tabBase.FieldByName('CodigoSolicitacoesMudancas').AsFloat;
  tabTotalHorasSolucao.Open;

  tabTotalHoras.Edit;

  tfdHorasCorridas.AsVariant := StrToTime('00:00:00');
  while not tabTotalHorasSolucao.Eof do
  begin
    tfdHorasCorridas.AsVariant := tfdHorasCorridas.AsVariant + tfdTotal.AsVariant;
    tabTotalHorasSolucao.Next;
  end;

  tabTotalHoras.Post;
  tabTotalHoras.ApplyUpdates;
  tabSolucao.ApplyUpdates;

end;

procedure TfrmSolicitacaoMudanca.btnGravarSolucaoClick(Sender: TObject);
begin
  inherited;
  // Caso o usuário nao digitar a descricao da solucao, pegamos da tabela mestre
  if tabSolucao.FieldByName('Descricao').AsString = '' then
  begin
    tabSolucao.FieldByName('Descricao').AsString := tabBase.FieldByName('Sinopse').AsString;
  end;

  tabSolucao.Post;
end;

procedure TfrmSolicitacaoMudanca.btnPostClick(Sender: TObject);
begin
  inherited;

  tabSolucaoCorrido.Post;
end;

procedure TfrmSolicitacaoMudanca.tabSolucaoCorridoAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  tabSolucaoCorrido.ApplyUpdates;
end;

procedure TfrmSolicitacaoMudanca.tabSolucaoCorridoAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  tabSolucaoCorrido.ApplyUpdates;
end;

procedure TfrmSolicitacaoMudanca.tabSolucaoCorridoNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  tabSolucaoCorrido.FieldByName('CodigoSolucao').AsFloat := CodeGenerator('solucao', 'CodigoSolucao');
  tabSolucaoCorrido.FieldByName('Data').AsDateTime := Date;

  tabChecagens.close;
  tabChecagens.Sql.Clear;
  tabChecagens.SQL.Add('SELECT * FROM solucao order by CodigoSolucao desc');
  tabChecagens.Open;

  if tabChecagens.RecordCount > 0 then
  begin
    tabSolucaoCorrido.FieldByName('HoraInicial').AsDateTime := tabChecagens.FieldByName('HoraFinal').AsDateTime;
  end
  else
  begin
    tabSolucaoCorrido.FieldByName('HoraInicial').AsDateTime := Time;
  end;
end;

procedure TfrmSolicitacaoMudanca.tsTodasSolucoesShow(Sender: TObject);
begin
  inherited;

  if tabSolucaoCorrido.State in [dsBrowse] then
  begin
    tabSolucaoCorrido.Close;
    tabSolucaoCorrido.Open;
  end;

end;

procedure TfrmSolicitacaoMudanca.btnInsertClick(Sender: TObject);
begin
  inherited;
  tabSolucaoCorrido.Append;
end;

procedure TfrmSolicitacaoMudanca.btnNovoSolucaoClick(Sender: TObject);
begin
  inherited;
  tabSolucao.Append;
end;

procedure TfrmSolicitacaoMudanca.tvwSolicitacaoMudancaCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

  if (AViewInfo.GridRecord.Values[clmStatus.Index] = 'Em execução') then
    ACanvas.Brush.Color := clRed;
end;

procedure TfrmSolicitacaoMudanca.tvwSolicitacaoMudancaDblClick(
  Sender: TObject);
begin
  inherited;
  pgcSolicitacoes.ActivePage := tsDetalhes;
end;

procedure TfrmSolicitacaoMudanca.tvwSolicitacaoMudancaCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  pgcSolicitacoes.ActivePage := tsDetalhes;
  inherited;

end;

procedure TfrmSolicitacaoMudanca.GerarImpressao(Impressora: Boolean = False);
var
  vCnt, vCnt2: Integer;
begin

end;

procedure TfrmSolicitacaoMudanca.btnVisualizarClick(Sender: TObject);
begin
  inherited;
  crpImprimir.CurrentLink := grlSolicitacaoMudanca;
  crpImprimir.Preview(True);
end;

procedure TfrmSolicitacaoMudanca.btnVisualizarTodasSolucoesClick(
  Sender: TObject);
begin
  inherited;
  crpImprimir.CurrentLink := grlTodasSolucoes;
  crpImprimir.Preview(True);
end;

end.


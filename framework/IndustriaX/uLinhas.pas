unit uLinhas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Menus, Buttons, ExtCtrls, StdCtrls, Mask, DBCtrls, Grids,
  DBGrids, ImgList, cxGraphics, cxControls, cxLookAndFeels,
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
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  ComCtrls, DBActns, ActnList;

type
  TfmLinhas = class(TfmFormBaseCadastro)
    edtCodigo: TDBEdit;
    Label1: TLabel;
    edtDescricao: TDBEdit;
    Label2: TLabel;
    lbl1: TLabel;
    edtCodigoLinha: TDBEdit;
    pgcGrades: TPageControl;
    tsLista: TTabSheet;
    dbgLinha: TcxGrid;
    tvwLinhas: TcxGridDBTableView;
    lvlLinhas: TcxGridLevel;
    tsDetalhes: TTabSheet;
    grp1: TGroupBox;
    Label4: TLabel;
    lbl2: TLabel;
    edtDescricaoGrade: TDBEdit;
    edtCodigoGrade: TDBEdit;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    pnl1: TPanel;
    btnInsert: TSpeedButton;
    btnEdit: TSpeedButton;
    btnPost: TSpeedButton;
    btnCancel: TSpeedButton;
    btnDelete1: TSpeedButton;
    clmGradesCodigoLinha: TcxGridDBColumn;
    clmGradesCodigoExibicao: TcxGridDBColumn;
    clmGradesAbreviacao: TcxGridDBColumn;
    tabReferenciaDetalhes: TZQuery;
    dtsReferencia: TDataSource;
    aclGradeDetalhe: TActionList;
    dsiInsert: TDataSetInsert;
    dsdDelete: TDataSetDelete;
    dspPost: TDataSetPost;
    dscCancel: TDataSetCancel;
    dseEdit: TDataSetEdit;
    imgImagens: TcxImageList;
    tabReferenciaDetalhesCodigoReferencia: TFloatField;
    tabReferenciaDetalhesCodigoExibicao: TFloatField;
    tabReferenciaDetalhesCodigoLinha: TFloatField;
    tabReferenciaDetalhesDescricao: TWideStringField;
    clmGridDBTableView1CodigoExibicao: TcxGridDBColumn;
    clmGridDBTableView1Descricao: TcxGridDBColumn;
    lbl3: TLabel;
    edtCodigoExibicao: TDBEdit;
    tabBaseCodigoLinha: TFloatField;
    tabBaseCodigoExibicao: TFloatField;
    cdsBaseDescricao: TStringField;
    cdsBaseAbreviacao: TStringField;
    clmLinhasDescricao: TcxGridDBColumn;
    tvwLinhaDBTableView1: TcxGridDBTableView;
    lvlReferencias: TcxGridLevel;
    tvwReferencias: TcxGridDBTableView;
    clmReferenciasCodigoExibicao: TcxGridDBColumn;
    clmReferenciasDescricao: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure dtsBaseDataChange(Sender: TObject; Field: TField);
    procedure tabReferenciaDetalhesNewRecord(DataSet: TDataSet);
    procedure tvwLinhasDblClick(Sender: TObject);
    procedure tvwLinhasCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btnInsertClick(Sender: TObject);
  private
  public
    procedure Novo; override;
    procedure Editar; override;
    procedure Deletar; override;
    procedure Cancelar; override;
    function Checagens: Boolean; override;
  end;

var
  fmLinhas: TfmLinhas;

implementation

uses uFormBaseConfig, uMenu, uFuncoes, uTipos, uLocalizarGenerico;

{$R *.dfm}

procedure TfmLinhas.Cancelar;
begin
end;

procedure TfmLinhas.Editar;
begin
end;

function TfmLinhas.Checagens: Boolean;
begin
  Result := False;

  if Trim(edtDescricao.Text) = '' then
  begin
    ShowMessage('Obrigatório Preenchimento da Descrição');
    edtDescricao.SetFocus;
    Result := True;
    exit;
  end;
end;

procedure TfmLinhas.Deletar;
begin

end;

procedure TfmLinhas.FormCreate(Sender: TObject);
begin
  inherited;
  SetFormStyle(fsMDIChild);
end;

procedure TfmLinhas.Novo;
begin

end;

procedure TfmLinhas.FormShow(Sender: TObject);
begin
  pgcGrades.ActivePageIndex := 0;

  tabReferenciaDetalhes.Sql.Clear;
  tabReferenciaDetalhes.Params.CreateParam(ftFloat, 'CodigoLinha', ptUnknown);
  tabReferenciaDetalhes.SQL.Add('SELECT * FROM referencias where CodigoLinha=:CodigoLinha ');
  tabReferenciaDetalhes.Open;

  tabBase.Sql.Clear;
  tabBase.SQL.Add('select * from linhas');
  tabBase.Open;



  inherited;
end;

procedure TfmLinhas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tabBase.Close;
  tabReferenciaDetalhes.Close;
  inherited;
end;

procedure TfmLinhas.btnLocalizarClick(Sender: TObject);
var
  vParamLoc: TParametrosLocalizar;
begin
  inherited;
  vParamLoc.Table := 'linhas';
  vParamLoc.KeyField := 'CodigoLinha';
  vParamLoc.Field1 := 'Descricao';
  vParamLoc.Filter := '';
  if not Assigned(fmLocalizarGenerico) then
  begin
    Application.CreateForm(TfmLocalizarGenerico, fmLocalizarGenerico);
    fmLocalizarGenerico.LoadParams(vParamLoc);
    fmLocalizarGenerico.ShowModal;
  end;
  if Trim(fmMenu.pubTrans1) <> '' then
  begin
    tabBase.Locate('CodigoLinha', fmMenu.pubTrans1, []);
  end;
end;

procedure TfmLinhas.btnNovoClick(Sender: TObject);
begin
  inherited;
  tabBase.FieldByName('CodigoLinha').AsFloat := CodeGenerator('linhas', 'CodigoLinha');
  edtCodigoLinha.Text := tabBase.FieldByName('CodigoLinha').AsString + '000';

  tabReferenciaDetalhes.Close;
  tabReferenciaDetalhes.ParamByName('CodigoLinha').AsFloat := -1;
  tabReferenciaDetalhes.Open;

  edtDescricao.SetFocus;
end;

procedure TfmLinhas.dtsBaseDataChange(Sender: TObject; Field: TField);
begin
  // inherited;
  if tabBase.FieldByName('CodigoLinha').AsString <> '' then
  begin
    tabReferenciaDetalhes.Close;
    tabReferenciaDetalhes.ParamByName('CodigoLinha').AsString := tabBase.FieldByName('CodigoLinha').AsString;
    tabReferenciaDetalhes.Open;
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

procedure TfmLinhas.tabReferenciaDetalhesNewRecord(DataSet: TDataSet);
begin
  inherited;
  tabReferenciaDetalhes.FieldByName('CodigoReferencia').AsFloat := CodeGenerator('referencias', 'CodigoReferencia');
  tabReferenciaDetalhes.FieldByName('CodigoLinha').AsString := tabBase.FieldByName('CodigoLinha').AsString;
  tabReferenciaDetalhes.FieldByName('CodigoExibicao').AsString := tabBase.FieldByName('CodigoExibicao').AsString + tabReferenciaDetalhes.FieldByName('CodigoReferencia').AsString;

end;

procedure TfmLinhas.tvwLinhasDblClick(Sender: TObject);
begin
  inherited;
  pgcGrades.ActivePage := tsDetalhes;

end;

procedure TfmLinhas.tvwLinhasCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  pgcGrades.ActivePage := tsDetalhes;

end;

procedure TfmLinhas.btnInsertClick(Sender: TObject);
begin
  inherited;
  tabReferenciaDetalhes.Append;

end;

end.


unit uGrades;

interface

uses
Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Menus, Buttons, ExtCtrls, StdCtrls, Mask, DBCtrls, ComCtrls,
  Grids, DBGrids, uTipos, ShellApi, cxGraphics, cxControls, cxLookAndFeels,
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
  dxPSCore, dxPScxCommon, dxPScxGrid6Lnk, ZAbstractConnection, ZConnection ;

type
  TfmGrades = class(TfmFormBaseCadastro)
    pgcGrades: TPageControl;
    tsLista: TTabSheet;
    Rtulo1: TMenuItem;
    popEmail: TPopupMenu;
    EnviarEmail1: TMenuItem;
    dbgGrades: TcxGrid;
    tvwGrades: TcxGridDBTableView;
    lvlGrades: TcxGridLevel;
    tsDetalhes: TTabSheet;
    tabGradesDetalhes: TZQuery;
    dtsGradesDetalhes: TDataSource;
    imgImagens: TcxImageList;
    aclGradeDetalhe: TActionList;
    dsiInsert: TDataSetInsert;
    dsdDelete: TDataSetDelete;
    dspPost: TDataSetPost;
    dscCancel: TDataSetCancel;
    tabChecagens: TZQuery;
    dseEdit: TDataSetEdit;
    stlCores: TcxStyleRepository;
    cstCorBranca: TcxStyle;
    cstCorAzul: TcxStyle;
    lvlGradesDetalhes: TcxGridLevel;
    tvwGradesDetalhes: TcxGridDBTableView;
    tabBaseCodigoGrade: TFloatField;
    strngfldBaseDescricao: TStringField;
    clmGradesCodigoGrade: TcxGridDBColumn;
    clmGradesDescricao: TcxGridDBColumn;
    tabGradesDetalhesCodigoGradeDetalhe: TFloatField;
    tabGradesDetalhesCodigoGrade: TFloatField;
    strngfldGradesDetalhesDescrio: TStringField;
    tabGradesDetalhesPosicao: TFloatField;
    clmGradesDetalhesDescrio: TcxGridDBColumn;
    clmGradesDetalhesPosicao: TcxGridDBColumn;
    grp1: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    edtDescricaoGrade: TDBEdit;
    edtCodigoGrade: TDBEdit;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    pnl1: TPanel;
    btnInsert: TSpeedButton;
    btnEdit: TSpeedButton;
    btnPost: TSpeedButton;
    btnCancel: TSpeedButton;
    btnDelete1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure GerarImpressao(Impressora: Boolean = False);
    procedure dtsBaseDataChange(Sender: TObject; Field: TField);
    procedure tsNumeracaoShow(Sender: TObject);
    procedure tabGradesDetalhesNewRecord(DataSet: TDataSet);
    procedure btnGravarSolucaoClick(Sender: TObject);
    procedure tvwGradesDblClick(Sender: TObject);
    procedure tvwGradesCellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
  fmGrades: TfmGrades;

implementation

uses uFormBaseConfig, uMenu, uFuncoes, uConstantes, uLocalizarGenerico;

{$R *.dfm}

procedure TfmGrades.Novo;
begin
   if Trim(edtCodigoGrade.Text) = '' then begin
      edtCodigoGrade.Text := FloatToStr (CodeGenerator('grades', 'CodigoGrade'));
    end
   else begin
      tabBase.FieldByName('CodigoGrade').AsFloat:=StrToFloat(edtCodigoGrade.Text);
   end;
end;

procedure TfmGrades.Editar;
begin
end;

procedure TfmGrades.Cancelar;
begin
end;

function TfmGrades.Checagens: Boolean;
begin

end;

procedure TfmGrades.Deletar;
begin
end;

procedure TfmGrades.FormCreate(Sender: TObject);
begin
   inherited;
   FTyping:=False;
   SetFormStyle(fsMDIChild);
end;

procedure TfmGrades.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabBase.Close;
   tabGradesDetalhes.Close;
   inherited;
end;

procedure TfmGrades.btnNovoClick(Sender: TObject);
begin
   pgcGrades.ActivePageIndex:=1;
   
   tabGradesDetalhes.Close;
   tabGradesDetalhes.ParamByName('CodigoGrade').AsFloat:=-1;
   tabGradesDetalhes.Open;

   inherited;

   edtCodigoGrade.Text:='';

   edtDescricaoGrade.SetFocus;
end;

procedure TfmGrades.dtsBaseDataChange(Sender: TObject;
  Field: TField);
begin
//  inherited;

  if tabBase.FieldByName('CodigoGrade').AsString <> '' then
  begin
    tabGradesDetalhes.Close;
    tabGradesDetalhes.ParamByName('CodigoGrade').AsString:=tabBase.FieldByName('CodigoGrade').AsString;
    tabGradesDetalhes.Open;
  end;

   if tabBase.State in [dsEdit, dsInsert] then begin
      btnAnterior.Enabled:=False;
      btnProximo.Enabled:=False;
      btnNovo.Enabled:=False;
      btnEditar.Enabled:=False;
      btnExcluir.Enabled:=False;
      btnLocalizar.Enabled:=False;
      btnOpcoes.Enabled:=False;
      btnFechar.Enabled:=False;

      btnGravar.Enabled:=True;
      btnCancelar.Enabled:=True;
   end
   else if tabBase.State = dsBrowse then begin

      btnAnterior.Enabled:=True;
      btnProximo.Enabled:=True;
      btnNovo.Enabled:=True;
      btnEditar.Enabled:=True;
      btnExcluir.Enabled:=True;
      btnLocalizar.Enabled:=True;
      btnOpcoes.Enabled:=True;
      btnFechar.Enabled:=True;

      btnGravar.Enabled:=False;
      btnCancelar.Enabled:=False;
   end;



end;

procedure TfmGrades.tsNumeracaoShow(Sender: TObject);
begin
  inherited;
 //
end;

procedure TfmGrades.tabGradesDetalhesNewRecord(DataSet: TDataSet);
begin
  inherited;
  tabGradesDetalhes.FieldByName('CodigoGradeDetalhe').AsFloat               := CodeGenerator('grades_detalhes', 'CodigoGradeDetalhe');
  tabGradesDetalhes.FieldByName('CodigoGrade').AsString := tabBase.FieldByName('CodigoGrade').AsString;


end;

procedure TfmGrades.btnGravarSolucaoClick(Sender: TObject);
begin
  inherited;
  ActiveControl := nil;


  tabGradesDetalhes.Post;
end;

procedure TfmGrades.tvwGradesDblClick(
  Sender: TObject);
begin
  inherited;
  pgcGrades.ActivePage := tsDetalhes;
end;

procedure TfmGrades.tvwGradesCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  pgcGrades.ActivePage := tsDetalhes;
  inherited;

end;

procedure TfmGrades.GerarImpressao(Impressora: Boolean = False);
var  vCnt, vCnt2 : Integer;
begin

end;


procedure TfmGrades.btnLocalizarClick(Sender: TObject);
var vParamLoc: TParametrosLocalizar;
begin
   inherited;
   vParamLoc.Table:='grades';
   vParamLoc.KeyField:='CodigoGrade';
   vParamLoc.Field1:='Descricao';
   vParamLoc.Filter:='';
   if not Assigned (fmLocalizarGenerico) then begin
      Application.CreateForm(TfmLocalizarGenerico, fmLocalizarGenerico);
      fmLocalizarGenerico.LoadParams(vParamLoc);
      fmLocalizarGenerico.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      tabBase.Close;
      tabBase.ParamByName('CodigoGrade').Value:=fmMenu.pubTrans1;
      tabBase.Open;
   end;
end;

procedure TfmGrades.btnInsertClick(Sender: TObject);
var
  vPosicao : Integer;
begin
  inherited;

  vPosicao := tabGradesDetalhes.RecordCount;
  vPosicao := vPosicao + 1;

  tabGradesDetalhes.Append;

  tabGradesDetalhes.FieldByName('Posicao').AsString := IntToStr(vPosicao);
end;

procedure TfmGrades.FormShow(Sender: TObject);
begin
  inherited;
   pgcGrades.ActivePageIndex:=0;

   tabBase.Sql.Clear;
   tabBase.Params.CreateParam(ftFloat, 'CodigoGrade', ptUnknown);
   tabBase.SQL.Add('SELECT * FROM Grades where CodigoGrade = :CodigoGrade');
   tabBase.Open;

   tabGradesDetalhes.Sql.Clear;
   tabGradesDetalhes.Params.CreateParam(ftFloat, 'CodigoGrade', ptUnknown);
   tabGradesDetalhes.SQL.Add('SELECT * FROM grades_detalhes where CodigoGrade=:CodigoGrade ');
   tabGradesDetalhes.Open;

end;

end.

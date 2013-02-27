unit uLocalizarLoteProducao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, DBCtrls, Buttons, Grids, DBGrids,
  ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Menus,
  Mask, ToolEdit, RXDBCtrl, cxGraphics, cxControls, cxLookAndFeels,
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
  cxGridDBTableView, cxGrid, cxContainer, cxTextEdit, cxMaskEdit,
  cxSpinEdit, cxTimeEdit, DateUtils, uFuncoes;

type
  TfmLocalizarLoteProducao = class(TfmFormBaseAvancado)
    btnOK: TBitBtn;
    btnCancelar: TBitBtn;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl9: TLabel;
    lbl1: TLabel;
    edtOP: TEdit;
    lbl11: TLabel;
    tvwOrdemProducao: TcxGridDBTableView;
    lvlOrdemProducao: TcxGridLevel;
    dbgOrdemProducao: TcxGrid;
    tabClientes: TZQuery;
    dtsClientes: TDataSource;
    tabPaises: TZQuery;
    dtsPaises: TDataSource;
    tabCidades: TZQuery;
    dtsCidades: TDataSource;
    clmOrdemProducaoCodigoPedido: TcxGridDBColumn;
    clmOrdemProducaoContato: TcxGridDBColumn;
    clmOrdemProducaoData: TcxGridDBColumn;
    clmOrdemProducaoHora: TcxGridDBColumn;
    clmOrdemProducaoDataPrevisao: TcxGridDBColumn;
    clmOrdemProducaoDataTermino: TcxGridDBColumn;
    clmOrdemProducaoObservacoes: TcxGridDBColumn;
    clmOrdemProducaoRazaosocial: TcxGridDBColumn;
    clmOrdemProducaonome: TcxGridDBColumn;
    edtCodigoPedido: TEdit;
    edtData: TDateEdit;
    edtHora: TcxTimeEdit;
    edtDataPrevisao: TDateEdit;
    edtDataTermino: TDateEdit;
    lbl12: TLabel;
    edtCliente: TEdit;
    edtResponsavel: TEdit;
    edtObservacao: TEdit;
    btnExibirTodos: TBitBtn;
    tabLoteProducao: TZQuery;
    dtsLoteProducao: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edtOPKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoPedidoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDataKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtHoraKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDataPrevisaoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDataTerminoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoClienteKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtClienteKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoResponsavelKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtResponsavelKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNomeFantasiaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtContatoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnExibirTodosClick(Sender: TObject);
  private
    procedure LoadData(pTudo: boolean = False);
  public
    { Public declarations }
  end;

var
  fmLocalizarLoteProducao: TfmLocalizarLoteProducao;

implementation

uses uFormBaseConfig, uConstantes, uMenu, uLocalizarOrdemProducao;

{$R *.dfm}

procedure TfmLocalizarLoteProducao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tabClientes.Close;
  tabPaises.Close;
  tabCidades.Close;
  tabLoteProducao.Close;
  inherited;
  fmLocalizarLoteProducao := nil;
end;

procedure TfmLocalizarLoteProducao.FormCreate(Sender: TObject);
begin
  inherited;
  SetFormStyle(fsNormal);
end;

procedure TfmLocalizarLoteProducao.btnCancelarClick(Sender: TObject);
begin
  fmMenu.pubTrans1 := '';
  Close;
end;

procedure TfmLocalizarLoteProducao.FormShow(Sender: TObject);
begin
  inherited;

  edtOP.SetFocus;

  fmMenu.pubTrans1 := '';

  LoadData(True);
end;

procedure TfmLocalizarLoteProducao.btnOKClick(Sender: TObject);
begin
  if (tabLoteProducao.Active) and (tabLoteProducao.RecordCount > 0) then
  begin
    fmMenu.pubTrans1 := tabLoteProducao.FieldByName('CodigoLoteProducao').AsString;
    Close;
  end
  else
  begin
    ShowMessage('Selecione um Registro para Confirmar');
  end;
end;

procedure TfmLocalizarLoteProducao.LoadData(pTudo: boolean);
var
  vWhere: string;
begin
  vWhere := '';

  tabLoteProducao.SQL.Clear;
  tabLoteProducao.SQL.Add(' select distinct');
  tabLoteProducao.SQL.Add('     lote_producao.* ');

  if edtOP.text <> ''  then
  begin
    tabLoteProducao.SQL.Add(',  clientes.Razaosocial, funcionarios.nome ');
  end;

  tabLoteProducao.SQL.Add(' from ');
  tabLoteProducao.SQL.Add('     lote_producao, ');
  tabLoteProducao.SQL.Add('     lote_producao_pedidos ');

  if edtOP.text <> ''  then
  begin
    tabLoteProducao.SQL.Add(',     Ordem_Producao, ');
    tabLoteProducao.SQL.Add('     Clientes, ');
    tabLoteProducao.SQL.Add('     funcionarios ');
  end;



  vWhere := ' lote_producao_pedidos.CodigoLoteProducao = lote_producao.CodigoLoteProducao ';

  if edtOP.text <> ''  then
  begin
    vWhere :=  ' and lote_producao_pedidos.OrdemProducao  = Ordem_Producao.OrdemProducao ' +
            ' and clientes.CodigoCliente               = ordem_producao.CodigoCliente ' +
            ' and funcionarios.Codigo                  = ordem_producao.CodigoFuncionario ';
  end;
  
  if Trim(edtOP.Text) <> '' then
  begin
    if Trim(vWhere) <> '' then
      vWhere := vWhere + ' AND ';
    vWhere := vWhere + 'ordem_producao.OrdemProducao like ''%' + edtOP.Text + '%''';

    if Trim(edtCliente.Text) <> '' then
    begin
      if Trim(vWhere) <> '' then
        vWhere := vWhere + ' AND ';
      vWhere := vWhere + ' clientes.Razaosocial like ' + QuotedStr('%' + edtCliente.Text + '%');
    end;

    if Trim(edtResponsavel.Text) <> '' then
    begin
      if Trim(vWhere) <> '' then
        vWhere := vWhere + ' AND ';
      vWhere := vWhere + ' funcionarios.nome like ' + QuotedStr('%' + edtResponsavel.Text + '%');
    end;
  end;

  if Trim(edtCodigoPedido.Text) <> '' then
  begin
    if Trim(vWhere) <> '' then
      vWhere := vWhere + ' AND ';
    vWhere := vWhere + 'lote_producao_pedidos.CodigoPedido = ' + QuotedStr(edtCodigoPedido.Text);
  end;

  if (edtData.Text <> '  /  /    ') then
  begin
    if Trim(vWhere) <> '' then
      vWhere := vWhere + ' AND ';
    vWhere := vWhere + 'lote_producao.Data = ' + QuotedStr(ConverteData(edtData.Date));
  end;

  if (edtHora.Text <> '00:00:00') then
  begin
    if Trim(vWhere) <> '' then
      vWhere := vWhere + ' AND ';
    vWhere := vWhere + 'lote_producao.Hora = ' + QuotedStr(TimeToStr(edtHora.Time));
  end;

  if (edtDataPrevisao.Text <> '  /  /    ') then
  begin
    if Trim(vWhere) <> '' then
      vWhere := vWhere + ' AND ';
    vWhere := vWhere + 'lote_producao.DataPrevisao = ' + QuotedStr(ConverteData(edtDataPrevisao.Date));
  end;

  if (edtDataTermino.Text <> '  /  /    ') then
  begin
    if Trim(vWhere) <> '' then
      vWhere := vWhere + ' AND ';
    vWhere := vWhere + ' lote_producao.DataTermino = ' + QuotedStr(ConverteData(edtDataTermino.Date));
  end;

  if Trim(edtObservacao.Text) <> '' then
  begin
    if Trim(vWhere) <> '' then
      vWhere := vWhere + ' AND ';
    vWhere := vWhere + ' lote_producao.Observacoes LIKE ' + QuotedStr('%' + edtObservacao.Text + '%');
  end;

  tabLoteProducao.SQL.Add(' WHERE ');

  // Se é para exibir todos
  if pTudo = True then
  begin
    tabLoteProducao.SQL.Add(' lote_producao.CodigoLoteProducao > 0');
  end
  else
  begin
    // Se nao foi preenchido nada, nao mostramos nada
    if vWhere = '' then
    begin
      vWhere := ' lote_producao.CodigoLoteProducao = -1'
    end;

    tabLoteProducao.SQL.Add(vWhere);
  end;

  tabLoteProducao.SQL.Add(' ORDER BY lote_producao_pedidos.OrdemProducao DESC');

  tabLoteProducao.Open;
end;

procedure TfmLocalizarLoteProducao.edtCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', Chr(8)]) then
    Key := #0;
end;

procedure TfmLocalizarLoteProducao.edtOPKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  LoadData;
end;

procedure TfmLocalizarLoteProducao.edtCodigoPedidoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  LoadData;
end;

procedure TfmLocalizarLoteProducao.edtDataKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  LoadData;
end;

procedure TfmLocalizarLoteProducao.edtHoraKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  LoadData;
end;

procedure TfmLocalizarLoteProducao.edtDataPrevisaoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  LoadData;
end;

procedure TfmLocalizarLoteProducao.edtDataTerminoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  LoadData;
end;

procedure TfmLocalizarLoteProducao.edtCodigoClienteKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  LoadData;
end;

procedure TfmLocalizarLoteProducao.edtClienteKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  LoadData;
end;

procedure TfmLocalizarLoteProducao.edtCodigoResponsavelKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  LoadData;
end;

procedure TfmLocalizarLoteProducao.edtResponsavelKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  LoadData;
end;

procedure TfmLocalizarLoteProducao.edtNomeFantasiaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  LoadData;
end;

procedure TfmLocalizarLoteProducao.edtContatoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  LoadData;
end;

procedure TfmLocalizarLoteProducao.btnExibirTodosClick(Sender: TObject);
begin
  inherited;
  LoadData(True);
end;

end.


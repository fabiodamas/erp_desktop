unit uLoteProducao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, StdCtrls, Menus, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Buttons, ExtCtrls, ToolEdit, RXDBCtrl,
  DBCtrls, Mask, CurrEdit, Grids, DBGrids, ComCtrls, DBClient, jpeg,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  Provider, cxDBLookupComboBox;

type
  TfmLoteProducao = class(TfmFormBaseCadastro)
    tabClientes: TZQuery;
    dtsClientes: TDataSource;
    tabLoteProducaoPedidos: TZQuery;
    tabChecagens: TZQuery;
    tabFuncionarios: TZQuery;
    dtsFuncionarios: TDataSource;
    mniExcluirFichaProducao: TMenuItem;
    N1: TMenuItem;
    EmissodaOP1: TMenuItem;
    RelaodeOPsPendentes1: TMenuItem;
    tabSetor: TZQuery;
    dtsSetor: TDataSource;
    N2: TMenuItem;
    FichadeProduo1: TMenuItem;
    N3: TMenuItem;
    EtiquetasdeProdutos1: TMenuItem;
    pnl1: TPanel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl2: TLabel;
    edtCodigoLoteProducao: TEdit;
    edtData: TDBDateEdit;
    edtHora: TDBEdit;
    edtDataPrevisao: TDBDateEdit;
    edtDataTermino: TDBDateEdit;
    lbl3: TLabel;
    edtObservacao: TDBMemo;
    lbl6: TLabel;
    dbgFichaTecnica: TcxGrid;
    tvwFichaTecnica: TcxGridDBTableView;
    clmPosicao: TcxGridDBColumn;
    clmOrdemProducao: TcxGridDBColumn;
    clmPedido: TcxGridDBColumn;
    clmCliente: TcxGridDBColumn;
    clmPrazoEntrega: TcxGridDBColumn;
    clmQuantidade: TcxGridDBColumn;
    lvlFichaTecnica: TcxGridLevel;
    pnl2: TPanel;
    btnPedidoAdicionar: TBitBtn;
    lbl1: TLabel;
    lbl4: TLabel;
    btnPedidosLocalizar: TBitBtn;
    lbl5: TLabel;
    pnl3: TPanel;
    btnPedidoRemover: TBitBtn;
    edtCodigoResponsavel: TDBEdit;
    lbl12: TLabel;
    edtResponsavel: TDBLookupComboBox;
    edtCodigoFuncionario1: TDBEdit;
    edtCodigoLoteCompra: TDBEdit;
    dtsLoteProducaoPedidos: TDataSource;
    tabAuxiliarLotePedi: TClientDataSet;
    dtsAuxiliarLotePedi: TDataSource;
    tabLoteProducaoPedidosCodigoLoteProducaoPedidos: TFloatField;
    tabLoteProducaoPedidosCodigoLoteProducao: TFloatField;
    tabLoteProducaoPedidosCodigoPedido: TFloatField;
    tabLoteProducaoPedidosPosicao: TFloatField;
    tabLoteProducaoPedidosQuantidade: TFloatField;
    tabAuxiliarLotePediCodigoLoteProducaoPedidos: TFloatField;
    tabAuxiliarLotePediCodigoLoteProducao: TFloatField;
    tabAuxiliarLotePediCodigoPedido: TFloatField;
    tabAuxiliarLotePediPosicao: TFloatField;
    tabAuxiliarLotePediQuantidade: TFloatField;
    tabAuxAtualiza: TClientDataSet;
    tabAuxAtualizaCodigoPedido: TStringField;
    edtCodigoPedido: TEdit;
    edtClienteRazaoSocial: TEdit;
    edtPosicao: TEdit;
    tabLoteProducaoPedidosOrdemProducao: TFloatField;
    tabAuxiliarLotePediOrdemProducao: TFloatField;
    tabOrdemProducao: TZQuery;
    tabOrdemProducaoProdutos: TZQuery;
    tabPedidos: TZQuery;
    tabPedidosProdutos: TZQuery;
    mniGerarFichaProducao: TMenuItem;
    edtDataTermino1: TDBDateEdit;
    lbl13: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtsBaseDataChange(Sender: TObject; Field: TField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCodigoLoteProducaoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnPedidoAdicionarClick(Sender: TObject);
    procedure btnPedidoRemoverClick(Sender: TObject);
    procedure btnPedidosLocalizarClick(Sender: TObject);
    procedure edtCodigoLoteProducaoKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoPedidoKeyPress(Sender: TObject; var Key: Char);
    procedure btnOpcoesClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure edtCodigoPedidoChange(Sender: TObject);
    procedure mniGerarFichaProducaoClick(Sender: TObject);
    procedure mniExcluirFichaProducaoClick(Sender: TObject);
    procedure tabConfigPropriBeforePost(DataSet: TDataSet);
    procedure tabConfigPropriBeforeEdit(DataSet: TDataSet);
  private
    FTyping: boolean;
    procedure AtualizaLote;
    procedure GravarProdutos(pCodigoLoteProducao: real);
    procedure AtualizaCodigoLoteProducao;
  public
    procedure Novo; override;
    procedure Editar; override;
    procedure Deletar; override;
    procedure Cancelar; override;
    function Checagens: Boolean; override;
  end;

var
  fmLoteProducao: TfmLoteProducao;

implementation

uses uFormBaseConfig, uMenu, uFuncoes, uLocalizarClientes,
  uLocalizarProdutos, rOrdensProducaoPendentes, rOrdensProducaoEmissao,
  rFichaProducao, uEtiquetasProdutos_TLP2844, uLocalizarGenerico,
  uTipos, uLocalizarOrdemProducao, uLocalizarLoteProducao,
  uLocalizarPedidos;

{$R *.dfm}

{ TfmOrdemProducaoEntrada }

procedure TfmLoteProducao.Novo;
var
  vCodigo: Real;
begin
  if Trim(edtCodigoLoteProducao.Text) = '' then
  begin
    tabBase.FieldByName('CodigoLoteProducao').AsFloat := CodeGenerator('lote_producao', 'CodigoLoteProducao');
  end
  else
  begin
    tabBase.FieldByName('CodigoLoteProducao').AsFloat := StrToFloat(edtCodigoLoteProducao.Text);
  end;

  GravarProdutos(tabBase.FieldByName('CodigoLoteProducao').AsFloat);
end;

procedure TfmLoteProducao.Editar;
begin
  GravarProdutos(tabBase.FieldByName('CodigoLoteProducao').AsFloat);
end;

procedure TfmLoteProducao.Cancelar;
begin

end;

function TfmLoteProducao.Checagens: Boolean;
begin
  Result := False;

  if Trim(edtData.Text) = '/  /' then
  begin
    ShowMessage('Obrigatório Preenchimento da Data');
    edtData.SetFocus;
    Result := True;
    exit;
  end;

  if Trim(edtHora.Text) = '  :  :  ' then
  begin
    ShowMessage('Obrigatório Preenchimento da Hora');
    edtHora.SetFocus;
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

  if tabBase.State = dsInsert then
  begin
    if Trim(edtCodigoLoteProducao.Text) <> '' then
    begin
      if ExistsValue('CodigoLoteProducao', 'lote_producao', edtCodigoLoteProducao.Text) then
      begin
        ShowMessage('Número do Lote de Produção já existe');
        edtCodigoLoteProducao.SetFocus;
        Result := True;
        exit;
      end;
    end;
  end;

end;

procedure TfmLoteProducao.Deletar;
var
  vExcluirOP: TZQuery;
begin
  try
    vExcluirOP := TZQuery.Create(nil);
    vExcluirOP.Connection := fmMenu.zcnConexao;

    tabAuxAtualiza.EmptyDataSet;
    tabChecagens.Close;
    tabChecagens.SQL.Clear;
    tabChecagens.SQL.Add('SELECT * FROM lote_producao_pedidos WHERE CodigoLoteProducao = ' + FloatToStr(tabBase.FieldByName('CodigoLoteProducao').AsFloat));
    tabChecagens.Open;
    tabChecagens.First;
    while not tabChecagens.Eof do
    begin

      tabAuxAtualiza.Append;
      tabAuxAtualizaCodigoPedido.Value := tabChecagens.FieldByName('CodigoPedido').AsString;
      tabAuxAtualiza.Post;

      if tabChecagens.FieldByName('OrdemProducao').AsString <> '' then
      begin
        vExcluirOP.Close;
        vExcluirOP.SQL.Clear;
        vExcluirOP.SQL.Add('delete from ordem_producao_produtos where OrdemProducao = ' + tabChecagens.FieldByName('OrdemProducao').AsString);
        vExcluirOP.ExecSQL;

        vExcluirOP.Close;
        vExcluirOP.SQL.Clear;
        vExcluirOP.SQL.Add('delete from ordem_producao where OrdemProducao = ' + tabChecagens.FieldByName('OrdemProducao').AsString);
        vExcluirOP.ExecSQL;
      end;

      tabChecagens.Delete;
      tabChecagens.ApplyUpdates;
      Continue;
    end;
  finally
    tabChecagens.Close;
  end;
end;

procedure TfmLoteProducao.FormCreate(Sender: TObject);
begin
  inherited;
  FTyping := False;
  SetFormStyle(fsMDIChild);
end;

procedure TfmLoteProducao.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtCodigoLoteProducao.Text := '';
  tabBase.FieldByName('Data').AsDateTime := Date;
  tabBase.FieldByName('Hora').AsDateTime := Now;

  // Limpar Tabelas com Parâmetro.
  tabLoteProducaoPedidos.Close;
  tabLoteProducaoPedidos.ParamByName('CodigoLoteProducao').AsFloat := -1;
  tabLoteProducaoPedidos.Open;

  tabAuxiliarLotePedi.EmptyDataSet;

  tvwFichaTecnica.DataController.DataSource := dtsAuxiliarLotePedi;

  if tabBase.State = dsInsert then
  begin
    edtCodigoLoteProducao.Text := '';
  end;

  edtDataPrevisao.SetFocus;
end;

procedure TfmLoteProducao.FormShow(Sender: TObject);
begin
  inherited;

  tabConfigPropri.SQL.Clear;
  tabConfigPropri.SQL.Add('SELECT * FROM configuracoes_proprietario');
  tabConfigPropri.Open;

  tabLoteProducaoPedidos.SQL.Clear;
  tabLoteProducaoPedidos.Params.CreateParam(ftFloat, 'CodigoLoteProducao', ptUnknown);
  tabLoteProducaoPedidos.SQL.Add('SELECT * FROM lote_producao_pedidos WHERE CodigoLoteProducao = :CodigoLoteProducao');

  tabLoteProducaoPedidos.SQL.Clear;
  tabLoteProducaoPedidos.SQL.Add(' SELECT                                                            ');
  tabLoteProducaoPedidos.SQL.Add('     lpp.CodigoLoteProducaoPedidos,                                ');
  tabLoteProducaoPedidos.SQL.Add('     lpp.CodigoLoteProducao,                                       ');
  tabLoteProducaoPedidos.SQL.Add('     lpp.CodigoPedido,                                             ');
  tabLoteProducaoPedidos.SQL.Add('     lpp.Posicao,                                                  ');
  tabLoteProducaoPedidos.SQL.Add('     lpp.Quantidade,                                               ');
  tabLoteProducaoPedidos.SQL.Add('     lpp.OrdemProducao,                                            ');
  tabLoteProducaoPedidos.SQL.Add(' 	clientes.RazaoSocial                                             ');
  tabLoteProducaoPedidos.SQL.Add(' FROM                                                              ');
  tabLoteProducaoPedidos.SQL.Add('     lote_producao_pedidos lpp,                                    ');
  tabLoteProducaoPedidos.SQL.Add('     pedidos,                                                      ');
  tabLoteProducaoPedidos.SQL.Add('     clientes,                                                     ');
  tabLoteProducaoPedidos.SQL.Add(' 	   lote_producao                                                 ');
  tabLoteProducaoPedidos.SQL.Add(' where                                                             ');
  tabLoteProducaoPedidos.SQL.Add('     pedidos.Npedido = lpp.CodigoPedido                            ');
  tabLoteProducaoPedidos.SQL.Add('     and pedidos.CodigoCliente = clientes.CodigoCliente            ');
  tabLoteProducaoPedidos.SQL.Add(' 		 and lote_producao.CodigoLoteProducao = lpp.CodigoLoteProducao ');
  tabLoteProducaoPedidos.SQL.Add(' 		 and lpp.CodigoLoteProducao = :CodigoLoteProducao              ');
  tabLoteProducaoPedidos.Open;

  tabAuxAtualiza.CreateDataSet;
  tabAuxAtualiza.EmptyDataSet;

  tabFuncionarios.SQL.Clear;
  tabFuncionarios.SQL.Add('SELECT Codigo,Nome FROM funcionarios WHERE DataSaida IS NULL ORDER BY Nome');
  tabFuncionarios.Open;

  tabClientes.SQL.Clear;
  tabClientes.Params.CreateParam(ftFloat, 'CodigoCliente', ptUnknown);
  tabClientes.SQL.Add('SELECT CodigoCliente,NomeFantasia FROM clientes WHERE CodigoCliente =:CodigoCliente');
  tabClientes.Open;

  tabBase.SQL.Clear;
  tabBase.Params.CreateParam(ftFloat, 'CodigoLoteProducao', ptUnknown);
  tabBase.SQL.Add('SELECT * FROM lote_producao WHERE CodigoLoteProducao = :CodigoLoteProducao');
  tabBase.Open;

  tabAuxiliarLotePedi.CreateDataSet;
  tabAuxiliarLotePedi.EmptyDataSet;

  btnOpcoes.PopupMenu := popOpcoes;
end;

procedure TfmLoteProducao.dtsBaseDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if tabBase.State = dsBrowse then
  begin
    AtualizaLote;

    tabLoteProducaoPedidos.Close;
    tabLoteProducaoPedidos.ParamByName('CodigoLoteProducao').AsFloat := tabBase.FieldByName('CodigoLoteProducao').AsFloat;
    tabLoteProducaoPedidos.Open;

    AtualizaCodigoLoteProducao;

  end;
end;

procedure TfmLoteProducao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tabBase.Close;
  tabClientes.Close;
  tabLoteProducaoPedidos.Close;
  tabAuxiliarLotePedi.Close;
  tabFuncionarios.Close;
  tabConfigPropri.Close;
  tabAuxAtualiza.Close;
  tabSetor.Close;
  inherited;
end;

procedure TfmLoteProducao.GravarProdutos(pCodigoLoteProducao: real);
begin
  tabChecagens.Close;
  tabChecagens.SQL.Clear;
  tabChecagens.SQL.Add('DELETE FROM lote_producao_pedidos WHERE CodigoLoteProducao = ' + FloatToStr(pCodigoLoteProducao));
  tabChecagens.ExecSQL;

  tvwFichaTecnica.DataController.DataSource := nil;

  try
    tabChecagens.Close;
    tabChecagens.SQL.Clear;
    tabChecagens.SQL.Add('SELECT * FROM lote_producao_pedidos WHERE 0');
    tabChecagens.Open;

    // Varre item por item do lote
    tabAuxiliarLotePedi.First;
    while not tabAuxiliarLotePedi.Eof do
    begin
      Application.ProcessMessages;

      // Adiciona o pedido no lote de produção
      tabChecagens.Append;
      tabChecagens.FieldByName('CodigoLoteProducaoPedidos').AsFloat := CodeGenerator('lote_producao_pedidos', 'CodigoLoteProducaoPedidos');
      tabChecagens.FieldByName('CodigoLoteProducao').AsFloat := pCodigoLoteProducao;
      tabChecagens.FieldByName('CodigoPedido').AsFloat := tabAuxiliarLotePedi.FieldByName('CodigoPedido').AsFloat;
      tabChecagens.FieldByName('Posicao').AsFloat := tabAuxiliarLotePedi.FieldByName('Posicao').AsFloat;
      tabChecagens.FieldByName('Quantidade').AsFloat := tabAuxiliarLotePedi.FieldByName('Quantidade').AsFloat;
      tabChecagens.Post;
      tabChecagens.ApplyUpdates;

      tabAuxiliarLotePedi.Next;
    end;

    tabLoteProducaoPedidos.Close;
    tabLoteProducaoPedidos.ParamByName('CodigoLoteProducao').AsFloat := tabBase.FieldByName('CodigoLoteProducao').AsFloat;
    tabLoteProducaoPedidos.Open;
    tabLoteProducaoPedidos.First;
  finally
    tvwFichaTecnica.DataController.DataSource := dtsLoteProducaoPedidos;
  end;
end;

procedure TfmLoteProducao.edtCodigoLoteProducaoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if tabBase.State = dsBrowse then
  begin
    if Trim(edtCodigoLoteProducao.Text) <> '' then
    begin
      FTyping := True;
      tabBase.Close;
      tabBase.ParamByName('CodigoLoteProducao').AsFloat := StrToFloat(edtCodigoLoteProducao.Text);
      tabBase.Open;
      FTyping := False;
    end
    else
    begin
      FTyping := True;
      tabBase.Close;
      tabBase.ParamByName('CodigoLoteProducao').AsFloat := -1;
      tabBase.Open;
      FTyping := False;
    end;
  end;
end;

procedure TfmLoteProducao.AtualizaLote;
begin
  if FTyping = False then
  begin
    if not tabBase.FieldByName('CodigoLoteProducao').IsNull then
    begin
      edtCodigoLoteProducao.Text := FloatToStr(tabBase.FieldByName('CodigoLoteProducao').AsFloat);
    end;
  end;
end;

procedure TfmLoteProducao.btnEditarClick(Sender: TObject);
begin
  if not tabBase.FieldByName('DataTermino').IsNull then
  begin
    ShowMessage('Não é Possivel Alterar um Lote Terminado');
    exit;
  end;

  inherited;
  edtCodigoLoteProducao.Enabled := False;

  tabAuxiliarLotePedi.EmptyDataSet;

  tvwFichaTecnica.DataController.DataSource := nil;
  try
    tabLoteProducaoPedidos.First;
    while not tabLoteProducaoPedidos.Eof do
    begin

      tabAuxiliarLotePedi.Append;
      tabAuxiliarLotePedi.FieldByName('CodigoLoteProducaoPedidos').AsFloat := tabLoteProducaoPedidos.FieldByName('CodigoLoteProducaoPedidos').AsFloat;
      tabAuxiliarLotePedi.FieldByName('CodigoLoteProducao').AsFloat := tabLoteProducaoPedidos.FieldByName('CodigoLoteProducao').AsFloat;
      tabAuxiliarLotePedi.FieldByName('CodigoPedido').AsFloat := tabLoteProducaoPedidos.FieldByName('CodigoPedido').AsFloat;
      tabAuxiliarLotePedi.FieldByName('Posicao').AsFloat := tabLoteProducaoPedidos.FieldByName('Posicao').AsFloat;
      tabAuxiliarLotePedi.FieldByName('Quantidade').AsFloat := tabLoteProducaoPedidos.FieldByName('Quantidade').AsFloat;
      tabAuxiliarLotePedi.Post;

      tabLoteProducaoPedidos.Next;
    end;
  finally
    tvwFichaTecnica.DataController.DataSource := dtsAuxiliarLotePedi;
  end;

end;

procedure TfmLoteProducao.btnCancelarClick(Sender: TObject);
begin
  inherited;
  edtCodigoLoteProducao.Enabled := True;
  tvwFichaTecnica.DataController.DataSource := dtsLoteProducaoPedidos;
end;

procedure TfmLoteProducao.btnGravarClick(Sender: TObject);
begin
  inherited;
  edtCodigoLoteProducao.Enabled := True;
  tvwFichaTecnica.DataController.DataSource := nil;
  try

    {
    tabLoteProducaoPedidos.First;
    while not tabLoteProducaoPedidos.Eof do
    begin
      Application.ProcessMessages;
      fmMenu.AtualizaEstoque(tabLoteProducaoPedidos.FieldByName('CodigoProduto').AsString);
      tabLoteProducaoPedidos.Next;
    end;
    }

    {tabAuxAtualiza.First;
    while not tabAuxAtualiza.Eof do
    begin
      Application.ProcessMessages;
      fmMenu.AtualizaEstoque(tabAuxAtualizaCodigoProduto.Value);
      tabAuxAtualiza.Next;
    end;

    tabAuxAtualiza.EmptyDataSet;
    }
  finally
    tabLoteProducaoPedidos.First;
    tvwFichaTecnica.DataController.DataSource := dtsLoteProducaoPedidos;
  end;
end;

procedure TfmLoteProducao.btnPedidoAdicionarClick(
  Sender: TObject);
begin
  inherited;

  if tabBase.State in [dsInsert, dsEdit] then
  begin
    if Trim(edtCodigoPedido.Text) = '' then
    begin
      ShowMessage('Obrigatório Preenchimento do Pedido desejado');
      edtCodigoPedido.SetFocus;
      exit;
    end;

    tabAuxiliarLotePedi.Append;
    tabAuxiliarLotePedi.FieldByName('CodigoPedido').AsString := edtCodigoPedido.Text;
    tabAuxiliarLotePedi.FieldByName('Posicao').AsInteger := tabAuxiliarLotePedi.RecordCount + 1;
    //    tabAuxiliarLotePedi.FieldByName('CodigoLoteProducaoPedidos').AsString  := edtCodigoPedido.Text;
    //    tabAuxiliarLotePedi.FieldByName('CodigoLoteProducao').AsString := edtDescricaoProdutos.Text;

    tabChecagens.Close;
    tabChecagens.SQL.Clear;
    tabChecagens.SQL.Add('SELECT count(*) as Qtd FROM pedidos_produtos WHERE NPedido = ' + edtCodigoPedido.Text);
    tabChecagens.Open;

    if not tabChecagens.FieldByName('Qtd').IsNull then
    begin
      tabAuxiliarLotePedi.FieldByName('Quantidade').AsFloat := tabChecagens.FieldByName('Qtd').AsFloat;
    end;

    tabAuxiliarLotePedi.Post;

    edtCodigoPedido.Text := '';
    edtClienteRazaoSocial.Text := '';
    edtPosicao.Text := '';

    edtCodigoPedido.SetFocus;
  end;
end;

procedure TfmLoteProducao.btnPedidoRemoverClick(Sender: TObject);
begin
  inherited;
  if tabBase.State in [dsInsert, dsEdit] then
  begin
    if tabAuxiliarLotePedi.RecordCount > 0 then
    begin
      if Application.MessageBox('Deseja Realmente Excluir o Pedido do lote?', PChar(Application.Title), 36) = 7 then
        exit;
      // Guardo para Atualizar o Saldo do Estoque.
      tabAuxAtualiza.Append;
      tabAuxAtualizaCodigoPedido.AsFloat := tabAuxiliarLotePediCodigoPedido.AsFloat;
      tabAuxAtualiza.Post;
      tabAuxiliarLotePedi.Delete;
    end;
  end;
end;

procedure TfmLoteProducao.btnPedidosLocalizarClick(
  Sender: TObject);
begin
  inherited;
  if tabBase.State in [dsInsert, dsEdit] then
  begin
    if not Assigned(fmLocalizarPedidos) then
    begin
      Application.CreateForm(TfmLocalizarPedidos, fmLocalizarPedidos);
      fmLocalizarPedidos.ShowModal;
    end;

    if Trim(fmMenu.pubTrans1) <> '' then
    begin
      edtCodigoPedido.Text := fmMenu.pubTrans1;
      FTyping := True;

      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add(
        ' select ' +
        '    clientes.RazaoSocial' +
        ' from' +
        '    pedidos' +
        '        inner join' +
        '    clientes ON pedidos.CodigoCliente = clientes.CodigoCliente' +
        ' where ' +
        '  pedidos.NPedido = ' + edtCodigoPedido.Text
        );
      tabChecagens.Open;

      edtClienteRazaoSocial.Text := tabChecagens.FieldByName('RazaoSocial').AsString;

      FTyping := False;
    end;

  end;
end;

procedure TfmLoteProducao.edtCodigoLoteProducaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', Chr(8)]) then
    Key := #0;
end;

procedure TfmLoteProducao.edtCodigoPedidoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #32 then
    Key := #0
  else
    Key := UpCase(Key);
end;

procedure TfmLoteProducao.btnOpcoesClick(Sender: TObject);
begin
  if not tabBase.FieldByName('DataGeracaoOrdemProducao').IsNull then
  begin
    mniGerarFichaProducao.Enabled := False;
    mniExcluirFichaProducao.Enabled := True;
  end
  else
  begin
    mniGerarFichaProducao.Enabled := True;
    mniExcluirFichaProducao.Enabled := False;
  end;

  inherited;
end;

procedure TfmLoteProducao.btnExcluirClick(Sender: TObject);
begin
  inherited;
  tabAuxAtualiza.First;
  while not tabAuxAtualiza.Eof do
  begin
    tabChecagens.Close;
    tabChecagens.SQL.Clear;
    tabChecagens.SQL.Add('SELECT * FROM pedidos_produtos WHERE NPedido = ' + tabAuxAtualizaCodigoPedido.AsString);
    tabChecagens.Open;

    Application.ProcessMessages;
    fmMenu.AtualizaEstoque(tabChecagens.FieldByName('CodigoProduto').asString);
    tabAuxAtualiza.Next;
  end;
end;

procedure TfmLoteProducao.btnLocalizarClick(Sender: TObject);
begin
  if not Assigned(fmLocalizarLoteProducao) then
  begin
    Application.CreateForm(TfmLocalizarLoteProducao, fmLocalizarLoteProducao);

    fmLocalizarLoteProducao.ShowModal;
  end;

  if Trim(fmMenu.pubTrans1) <> '' then
  begin
    edtCodigoLoteProducao.Text := fmMenu.pubTrans1;

    tabBase.Close;
    tabBase.ParamByName('CodigoLoteProducao').Value := edtCodigoLoteProducao.Text;
    tabBase.Open;
  end;
end;

procedure TfmLoteProducao.edtCodigoPedidoChange(Sender: TObject);
begin
  inherited;
  if tabBase.State in [dsInsert, dsEdit] then
  begin
    if Trim(edtCodigoPedido.Text) <> '' then
    begin
      try

        tabChecagens.SQL.Clear;
        tabChecagens.SQL.Add(
          ' select ' +
          '    clientes.RazaoSocial' +
          ' from' +
          '    pedidos' +
          '        inner join' +
          '    clientes ON pedidos.CodigoCliente = clientes.CodigoCliente' +
          ' where ' +
          '  pedidos.NPedido = ' + edtCodigoPedido.Text
          );
        tabChecagens.Open;

        if tabChecagens.RecordCount > 0 then
        begin
          edtClienteRazaoSocial.Text := tabChecagens.FieldByName('RazaoSocial').AsString;
        end
        else
        begin
          edtClienteRazaoSocial.Text := '';
        end;

      finally
        tabChecagens.Close;
      end;
    end
    else
    begin
      edtClienteRazaoSocial.Text := '';
    end;
  end;
end;

procedure TfmLoteProducao.AtualizaCodigoLoteProducao;
begin
  if FTyping = False then
  begin
    if not tabBase.FieldByName('CodigoLoteProducao').IsNull then
    begin
      edtCodigoLoteProducao.Text := FloatToStr(tabBase.FieldByName('CodigoLoteProducao').AsFloat);
    end;
  end;
end;

procedure TfmLoteProducao.mniGerarFichaProducaoClick(Sender: TObject);
var
  vCodigo: Real;
begin
  inherited;

  // Varre item por item do lote

  tabLoteProducaoPedidos.First;

  while not tabLoteProducaoPedidos.Eof do
  begin
    Application.ProcessMessages;

    // Se o código foi preenchido
    if tabLoteProducaoPedidos.FieldByName('CodigoPedido').AsFloat <> 0 then
    begin

      tabBase.Edit;
      tabBase.FieldByName('DataGeracaoOrdemProducao').AsDateTime := Date;
      tabBase.Post;
      tabBase.ApplyUpDates;

      // Abre a Ordem de Produção
      tabOrdemProducao.SQL.Clear;
      tabOrdemProducao.SQL.Add('SELECT * FROM ordem_producao WHERE OrdemProducao = -1');
      tabOrdemProducao.Open;

      // Abre os produtos relacionados à ordem de produção
      tabOrdemProducaoProdutos.SQL.Clear;
      tabOrdemProducaoProdutos.SQL.Add('SELECT * FROM ordem_producao_produtos WHERE OrdemProducao = -1');
      tabOrdemProducaoProdutos.Open;

      tabPedidos.SQL.Clear;
      tabPedidos.SQL.Add('SELECT * FROM pedidos WHERE NPedido = ' + tabLoteProducaoPedidos.FieldByName('CodigoPedido').AsString);
      tabPedidos.Open;

      if tabPedidos.RecordCount > 0 then
      begin
        tabPedidosProdutos.SQL.Clear;
        tabPedidosProdutos.SQL.Add('SELECT * FROM pedidos_produtos WHERE NPedido = ' + tabLoteProducaoPedidos.FieldByName('CodigoPedido').AsString);
        tabPedidosProdutos.Open;

        tabPedidosProdutos.First;

        while not tabPedidosProdutos.Eof do
        begin
          // Atualizar a tabela
          tabConfigPropri.Close;
          tabConfigPropri.Open;

          // Pega o código
          vCodigo := tabConfigPropri.FieldByName('NumeroProducao').AsFloat + 1;

          // Atualiza a tabela
          tabChecagens.SQL.Clear;
          // tabChecagens.SQL.Clear;

          tabConfigPropri.Edit;
          tabConfigPropri.FieldByName('NumeroProducao').AsFloat := vCodigo;
          tabConfigPropri.Post;
          tabConfigPropri.ApplyUpdates;

          tabOrdemProducao.Append;
          tabOrdemProducao.FieldByName('OrdemProducao').AsFloat := vCodigo;
          tabOrdemProducao.FieldByName('Data').AsDateTime := Date;
          tabOrdemProducao.FieldByName('Hora').AsDateTime := Now;
          tabOrdemProducao.FieldByName('CodigoPedido').AsFloat := tabLoteProducaoPedidos.FieldByName('CodigoPedido').AsFloat;
          tabOrdemProducao.FieldByName('DataPrevisao').AsDateTime := edtDataPrevisao.Date;
          tabOrdemProducao.FieldByName('CodigoFuncionario').AsFloat := tabPedidos.FieldByName('CodigoFuncionario').AsFloat;
          tabOrdemProducao.FieldByName('CodigoCliente').AsFloat := tabPedidos.FieldByName('CodigoCliente').AsFloat;
          tabOrdemProducao.Post;
          tabOrdemProducao.ApplyUpdates;

          tabChecagens.Close;
          tabChecagens.SQL.Clear;
          tabChecagens.SQL.Add('DELETE FROM ordem_producao_produtos WHERE OrdemProducao = ' + FloatToStr(vCodigo));
          tabChecagens.ExecSQL;

          Application.ProcessMessages;
          tabOrdemProducaoProdutos.Append;
          tabOrdemProducaoProdutos.FieldByName('ID').AsFloat := CodeGenerator('ordem_producao_produtos', 'ID');
          tabOrdemProducaoProdutos.FieldByName('OrdemProducao').AsFloat := vCodigo;
          tabOrdemProducaoProdutos.FieldByName('CodigoProduto').AsString := tabPedidosProdutos.FieldByName('CodigoProduto').AsString;
          tabOrdemProducaoProdutos.FieldByName('Descricao').AsString := tabPedidosProdutos.FieldByName('Descricao').AsString;
          tabOrdemProducaoProdutos.FieldByName('Quantidade').AsFloat := tabPedidosProdutos.FieldByName('Quantidade').AsFloat;
          tabOrdemProducaoProdutos.Post;
          tabOrdemProducaoProdutos.ApplyUpdates;
        end;

      end;

      tabPedidos.Close;
      tabPedidosProdutos.Close;

    end;

    tabLoteProducaoPedidos.Next;
  end;

end;

procedure TfmLoteProducao.mniExcluirFichaProducaoClick(Sender: TObject);
begin
  inherited;
  tabBase.Edit;
  tabBase.FieldByName('DataGeracaoOrdemProducao').Clear;
  tabBase.Post;
end;

procedure TfmLoteProducao.tabConfigPropriBeforePost(DataSet: TDataSet);
begin
  // inherited;

end;

procedure TfmLoteProducao.tabConfigPropriBeforeEdit(DataSet: TDataSet);
begin
//  inherited;

end;

end.


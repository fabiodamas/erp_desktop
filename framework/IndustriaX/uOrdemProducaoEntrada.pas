unit uOrdemProducaoEntrada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, StdCtrls, Menus, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Buttons, ExtCtrls, ToolEdit, RXDBCtrl,
  DBCtrls, Mask, CurrEdit, Grids, DBGrids, ComCtrls, DBClient;

type
  TfmOrdemProducaoEntrada = class(TfmFormBaseCadastro)
    pgcOP: TPageControl;
    tbsProdutos: TTabSheet;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    btnProdutoAdicionar: TBitBtn;
    btnProdutoRemover: TBitBtn;
    dbgProdutos: TDBGrid;
    edtCodigoProduto: TEdit;
    btnProdutoLocalizar: TBitBtn;
    edtDescricaoProdutos: TEdit;
    edtSaldo: TEdit;
    edtQuantidade: TCurrencyEdit;
    edtOP: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtData: TDBDateEdit;
    Label3: TLabel;
    edtHora: TDBEdit;
    edtDataPrevisao: TDBDateEdit;
    Label4: TLabel;
    edtDataTermino: TDBDateEdit;
    Label5: TLabel;
    tbsObs: TTabSheet;
    Label12: TLabel;
    edtCodigoResponsavel: TDBEdit;
    edtResponsavel: TDBLookupComboBox;
    Label8: TLabel;
    Label9: TLabel;
    edtCodigoCliente: TDBEdit;
    edtNomeCliente: TDBEdit;
    btnClientesLocalizar: TBitBtn;
    edtObservacao: TDBMemo;
    edtContato: TDBComboBox;
    Label6: TLabel;
    tabClientes: TZQuery;
    dtsClientes: TDataSource;
    tabOrdemProducaoProdutos: TZQuery;
    dtsOrdemProducaoProdutos: TDataSource;
    tabChecagens: TZQuery;
    tabAuxiliarProdutos: TClientDataSet;
    tabAuxiliarProdutosCodigoProduto: TStringField;
    tabAuxiliarProdutosDescricao: TStringField;
    tabAuxiliarProdutosQuantidade: TFloatField;
    dtsAuxiliarProdutos: TDataSource;
    tabFuncionarios: TZQuery;
    dtsFuncionarios: TDataSource;
    EfetuarBaixa1: TMenuItem;
    N1: TMenuItem;
    EmissodaOP1: TMenuItem;
    RelaodeOPsPendentes1: TMenuItem;
    tabConfigPropri: TZQuery;
    tabAuxAtualiza: TClientDataSet;
    tabAuxAtualizaCodigoProduto: TStringField;
    tbsRoteiroProdutivo: TTabSheet;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    edtRPSetor: TDBLookupComboBox;
    Label15: TLabel;
    dbgRoteiroProdutivo: TDBGrid;
    edtRPReponsavel: TEdit;
    Label16: TLabel;
    btnAddRP: TBitBtn;
    tabRP: TZQuery;
    dtsRP: TDataSource;
    tabSetor: TZQuery;
    dtsSetor: TDataSource;
    edtRPQuantidade: TCurrencyEdit;
    edtRPPerdas: TCurrencyEdit;
    btnRemoverRP: TBitBtn;
    edtRPPeriodoInicial: TMaskEdit;
    edtRPPeriodoFinal: TMaskEdit;
    N2: TMenuItem;
    FichadeProduo1: TMenuItem;
    N3: TMenuItem;
    EtiquetasdeProdutos1: TMenuItem;
    lbl1: TLabel;
    edtCodigoFuncionario: TDBEdit;
    ts1: TTabSheet;
    edtObservacoes: TDBMemo;
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtsBaseDataChange(Sender: TObject; Field: TField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtOPKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnProdutoAdicionarClick(Sender: TObject);
    procedure btnProdutoRemoverClick(Sender: TObject);
    procedure btnClientesLocalizarClick(Sender: TObject);
    procedure edtCodigoClienteExit(Sender: TObject);
    procedure btnProdutoLocalizarClick(Sender: TObject);
    procedure edtCodigoProdutoChange(Sender: TObject);
    procedure edtOPKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure btnOpcoesClick(Sender: TObject);
    procedure RelaodeOPsPendentes1Click(Sender: TObject);
    procedure EmissodaOP1Click(Sender: TObject);
    procedure EfetuarBaixa1Click(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure dtsOrdemProducaoProdutosDataChange(Sender: TObject;
      Field: TField);
    procedure btnAddRPClick(Sender: TObject);
    procedure btnRemoverRPClick(Sender: TObject);
    procedure FichadeProduo1Click(Sender: TObject);
    procedure EtiquetasdeProdutos1Click(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
  private
    FTyping: boolean;
    procedure AtualizaOP;
    procedure GravarProdutos(pOrdemProducao: real);
  public
    procedure Novo; override;
    procedure Editar; override;
    procedure Deletar; override;
    procedure Cancelar; override;
    function Checagens: Boolean; override;
  end;

var
  fmOrdemProducaoEntrada: TfmOrdemProducaoEntrada;

implementation

uses uFormBaseConfig, uMenu, uFuncoes, uLocalizarClientes,
  uLocalizarProdutos, rOrdensProducaoPendentes, rOrdensProducaoEmissao,
  rFichaProducao, uEtiquetasProdutos_TLP2844, uLocalizarGenerico,
  uTipos, uLocalizarOrdemProducao;

{$R *.dfm}

{ TfmOrdemProducaoEntrada }

procedure TfmOrdemProducaoEntrada.Novo;
var
  vCodigo: Real;
begin
  if Trim(edtOP.Text) = '' then
  begin

    // Atualizar a tabela
    tabConfigPropri.Close;
    tabConfigPropri.Open;

    // Pega o código
    vCodigo := tabConfigPropri.FieldByName('NumeroProducao').AsFloat + 1;

    // Atualiza a tabela
    tabConfigPropri.Edit;
    tabConfigPropri.FieldByName('NumeroProducao').AsFloat := vCodigo;
    tabConfigPropri.Post;
    tabConfigPropri.ApplyUpdates;

    tabBase.FieldByName('OrdemProducao').AsFloat := vCodigo;
  end
  else
  begin
    tabBase.FieldByName('OrdemProducao').AsFloat := StrToFloat(edtOP.Text);
  end;

  GravarProdutos(tabBase.FieldByName('OrdemProducao').AsFloat);
end;

procedure TfmOrdemProducaoEntrada.Editar;
begin
  GravarProdutos(tabBase.FieldByName('OrdemProducao').AsFloat);
end;

procedure TfmOrdemProducaoEntrada.Cancelar;
begin
end;

function TfmOrdemProducaoEntrada.Checagens: Boolean;
begin
  Result := False;
  if Trim(edtCodigoCliente.Text) = '' then
  begin
    ShowMessage('Obrigatório Preenchimento do Cliente');
    edtCodigoCliente.SetFocus;
    Result := True;
    exit;
  end;
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
  if tabAuxiliarProdutos.RecordCount <= 0 then
  begin
    ShowMessage('Obrigatório Preenchimento dos Produtos');
    edtCodigoProduto.SetFocus;
    Result := True;
    exit;
  end;
  if tabBase.State = dsInsert then
  begin
    if Trim(edtOP.Text) <> '' then
    begin
      if ExistsValue('OrdemProducao', 'ordem_producao', edtOP.Text) then
      begin
        ShowMessage('Numero da O.P. já Existente');
        edtOP.SetFocus;
        Result := True;
        exit;
      end;
    end;
  end;
end;

procedure TfmOrdemProducaoEntrada.Deletar;
begin
  try
    tabAuxAtualiza.EmptyDataSet;
    tabChecagens.Close;
    tabChecagens.SQL.Clear;
    tabChecagens.SQL.Add('SELECT * FROM ordem_producao_produtos WHERE OrdemProducao = ' + FloatToStr(tabBase.FieldByName('OrdemProducao').AsFloat));
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
end;

procedure TfmOrdemProducaoEntrada.FormCreate(Sender: TObject);
begin
  inherited;
  FTyping := False;
  SetFormStyle(fsMDIChild);
end;

procedure TfmOrdemProducaoEntrada.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtOP.Text := '';
  tabBase.FieldByName('Data').AsDateTime := Date;
  tabBase.FieldByName('Hora').AsDateTime := Now;

  // Limpar Tabelas com Parâmetro.
  tabOrdemProducaoProdutos.Close;
  tabOrdemProducaoProdutos.ParamByName('OrdemProducao').AsFloat := -1;
  tabOrdemProducaoProdutos.Open;

  tabClientes.Close;
  tabClientes.ParamByName('CodigoCliente').AsFloat := -1;
  tabClientes.Open;

  tabAuxiliarProdutos.EmptyDataSet;

  dbgProdutos.DataSource := dtsAuxiliarProdutos;

  edtDataPrevisao.SetFocus;
end;

procedure TfmOrdemProducaoEntrada.FormShow(Sender: TObject);
begin
  inherited;

  pgcOP.ActivePageIndex := 0;

  edtRPPeriodoInicial.Text := FormatDateTime('dd/MM/yyyy_HH:mm:ss', Now);
  edtRPPeriodoFinal.Text := FormatDateTime('dd/MM/yyyy_HH:mm:ss', Now);

  tabAuxiliarProdutos.CreateDataSet;
  tabAuxiliarProdutos.EmptyDataSet;

  tabAuxAtualiza.CreateDataSet;
  tabAuxAtualiza.EmptyDataSet;

  tabRP.Params.CreateParam(ftFloat, 'OrdemProducao', ptUnknown);
  tabRP.Params.CreateParam(ftString, 'CodigoProduto', ptUnknown);
  tabRP.SQL.Add('SELECT roteiro_produtivo.CodigoProduto, LEFT(genericos.Descricao,30) AS Setor,');
  tabRP.SQL.Add('roteiro_produtivo.PeriodoInicial, roteiro_produtivo.PeriodoFinal, roteiro_produtivo.Quantidade,');
  tabRP.SQL.Add('roteiro_produtivo.Perdas, roteiro_produtivo.CodigoResponsavel1 AS Resp, roteiro_produtivo.ID');
  tabRP.SQL.Add('FROM roteiro_produtivo');
  tabRP.SQL.Add('LEFT JOIN genericos ON genericos.Codigo = roteiro_produtivo.CodigoSetor');
  tabRP.SQL.Add('WHERE roteiro_produtivo.OrdemProducao = :OrdemProducao AND roteiro_produtivo.CodigoProduto =:CodigoProduto');
  tabRP.Open;

  tabOrdemProducaoProdutos.Params.CreateParam(ftFloat, 'OrdemProducao', ptUnknown);
  tabOrdemProducaoProdutos.SQL.Add('SELECT * FROM ordem_producao_produtos WHERE OrdemProducao = :OrdemProducao');
  tabOrdemProducaoProdutos.Open;

  tabFuncionarios.SQL.Add('SELECT Codigo,Nome FROM funcionarios WHERE DataSaida IS NULL ORDER BY Nome');
  tabFuncionarios.Open;

  tabClientes.Params.CreateParam(ftFloat, 'CodigoCliente', ptUnknown);
  tabClientes.SQL.Add('SELECT CodigoCliente,NomeFantasia FROM clientes WHERE CodigoCliente =:CodigoCliente');
  tabClientes.Open;

  tabBase.Params.CreateParam(ftFloat, 'OrdemProducao', ptUnknown);
  tabBase.SQL.Add('SELECT * FROM ordem_producao WHERE OrdemProducao =:OrdemProducao');
  tabBase.Open;

  tabConfigPropri.SQL.Add('SELECT * FROM configuracoes_proprietario');
  tabConfigPropri.Open;

  tabSetor.SQL.Add('SELECT * FROM genericos WHERE Tipo = ' + QuotedStr('22') + ' ORDER BY Descricao');
  tabSetor.Open;
end;

procedure TfmOrdemProducaoEntrada.dtsBaseDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if tabBase.State = dsBrowse then
  begin
    AtualizaOP;

    tabOrdemProducaoProdutos.Close;
    tabOrdemProducaoProdutos.ParamByName('OrdemProducao').AsFloat := tabBase.FieldByName('OrdemProducao').AsFloat;
    tabOrdemProducaoProdutos.Open;

    tabClientes.Close;
    tabClientes.ParamByName('CodigoCliente').AsFloat := tabBase.FieldByName('CodigoCliente').AsFloat;
    tabClientes.Open;
  end;
end;

procedure TfmOrdemProducaoEntrada.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tabBase.Close;
  tabClientes.Close;
  tabOrdemProducaoProdutos.Close;
  tabAuxiliarProdutos.Close;
  tabFuncionarios.Close;
  tabConfigPropri.Close;
  tabAuxAtualiza.Close;
  tabRP.Close;
  tabSetor.Close;
  inherited;
end;

procedure TfmOrdemProducaoEntrada.GravarProdutos(pOrdemProducao: real);
begin
  tabChecagens.Close;
  tabChecagens.SQL.Clear;
  tabChecagens.SQL.Add('DELETE FROM ordem_producao_produtos WHERE OrdemProducao = ' + FloatToStr(pOrdemProducao));
  tabChecagens.ExecSQL;
  dbgProdutos.DataSource := nil;
  try
    tabChecagens.Close;
    tabChecagens.SQL.Clear;
    tabChecagens.SQL.Add('SELECT * FROM ordem_producao_produtos WHERE 0');
    tabChecagens.Open;

    tabAuxiliarProdutos.First;
    while not tabAuxiliarProdutos.Eof do
    begin

      Application.ProcessMessages;
      tabChecagens.Append;
      tabChecagens.FieldByName('ID').AsFloat := CodeGenerator('ordem_producao_produtos', 'ID');
      tabChecagens.FieldByName('OrdemProducao').AsFloat := pOrdemProducao;
      tabChecagens.FieldByName('CodigoProduto').AsString := tabAuxiliarProdutosCodigoProduto.Value;
      tabChecagens.FieldByName('Descricao').AsString := tabAuxiliarProdutosDescricao.Value;
      tabChecagens.FieldByName('Quantidade').AsFloat := tabAuxiliarProdutosQuantidade.Value;
      tabChecagens.Post;
      tabChecagens.ApplyUpdates;

      tabAuxiliarProdutos.Next;
    end;

    tabOrdemProducaoProdutos.Close;
    tabOrdemProducaoProdutos.ParamByName('OrdemProducao').AsFloat := tabBase.FieldByName('OrdemProducao').AsFloat;
    tabOrdemProducaoProdutos.Open;
    tabOrdemProducaoProdutos.First;
  finally
    dbgProdutos.DataSource := dtsOrdemProducaoProdutos;
  end;
end;

procedure TfmOrdemProducaoEntrada.edtOPKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if tabBase.State = dsBrowse then
  begin
    if Trim(edtOP.Text) <> '' then
    begin
      FTyping := True;
      tabBase.Close;
      tabBase.ParamByName('OrdemProducao').AsFloat := StrToFloat(edtOP.Text);
      tabBase.Open;
      FTyping := False;
    end
    else
    begin
      FTyping := True;
      tabBase.Close;
      tabBase.ParamByName('OrdemProducao').AsFloat := -1;
      tabBase.Open;
      FTyping := False;
    end;
  end;
end;

procedure TfmOrdemProducaoEntrada.AtualizaOP;
begin
  if FTyping = False then
  begin
    if not tabBase.FieldByName('OrdemProducao').IsNull then
    begin
      edtOP.Text := FloatToStr(tabBase.FieldByName('OrdemProducao').AsFloat);
    end;
  end;
end;

procedure TfmOrdemProducaoEntrada.btnEditarClick(Sender: TObject);
begin
  if not tabBase.FieldByName('DataTermino').IsNull then
  begin
    ShowMessage('Não é Possivel Alterar uma O.P Terminada');
    exit;
  end;

  inherited;
  edtOP.Enabled := False;

  tabAuxiliarProdutos.EmptyDataSet;

  dbgProdutos.DataSource := nil;
  try
    tabOrdemProducaoProdutos.First;
    while not tabOrdemProducaoProdutos.Eof do
    begin

      tabAuxiliarProdutos.Append;
      tabAuxiliarProdutosCodigoProduto.Value := tabOrdemProducaoProdutos.FieldByName('CodigoProduto').AsString;
      tabAuxiliarProdutosDescricao.Value := tabOrdemProducaoProdutos.FieldByName('Descricao').AsString;
      tabAuxiliarProdutosQuantidade.Value := tabOrdemProducaoProdutos.FieldByName('Quantidade').AsFloat;
      tabAuxiliarProdutos.Post;

      tabOrdemProducaoProdutos.Next;
    end;
  finally
    dbgProdutos.DataSource := dtsAuxiliarProdutos;
  end;
end;

procedure TfmOrdemProducaoEntrada.btnCancelarClick(Sender: TObject);
begin
  inherited;
  edtOP.Enabled := True;
  dbgProdutos.DataSource := dtsOrdemProducaoProdutos;
end;

procedure TfmOrdemProducaoEntrada.btnGravarClick(Sender: TObject);
begin
  inherited;
  edtOP.Enabled := True;
  dbgProdutos.DataSource := nil;
  try
    tabOrdemProducaoProdutos.First;
    while not tabOrdemProducaoProdutos.Eof do
    begin
      Application.ProcessMessages;
      fmMenu.AtualizaEstoque(tabOrdemProducaoProdutos.FieldByName('CodigoProduto').AsString);
      tabOrdemProducaoProdutos.Next;
    end;
    tabAuxAtualiza.First;
    while not tabAuxAtualiza.Eof do
    begin
      Application.ProcessMessages;
      fmMenu.AtualizaEstoque(tabAuxAtualizaCodigoProduto.Value);
      tabAuxAtualiza.Next;
    end;
    tabAuxAtualiza.EmptyDataSet;
  finally
    tabOrdemProducaoProdutos.First;
    dbgProdutos.DataSource := dtsOrdemProducaoProdutos;
  end;
end;

procedure TfmOrdemProducaoEntrada.btnProdutoAdicionarClick(
  Sender: TObject);
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
    if edtQuantidade.Value <= 0 then
    begin
      ShowMessage('Obrigatório Preenchimento da Quantidade');
      edtQuantidade.SetFocus;
      exit;
    end;

    tabAuxiliarProdutos.Append;
    tabAuxiliarProdutosCodigoProduto.Value := edtCodigoProduto.Text;
    tabAuxiliarProdutosDescricao.Value := edtDescricaoProdutos.Text;
    tabAuxiliarProdutosQuantidade.Value := edtQuantidade.Value;
    tabAuxiliarProdutos.Post;

    edtCodigoProduto.Text := '';
    edtDescricaoProdutos.Text := '';
    edtQuantidade.Value := 0;

    edtCodigoProduto.SetFocus;
  end;
end;

procedure TfmOrdemProducaoEntrada.btnProdutoRemoverClick(Sender: TObject);
begin
  inherited;
  if tabBase.State in [dsInsert, dsEdit] then
  begin
    if tabAuxiliarProdutos.RecordCount > 0 then
    begin
      if Application.MessageBox('Deseja Realmente Excluir o Produto?', PChar(Application.Title), 36) = 7 then
        exit;
      // Guardo para Atualizar o Saldo do Estoque.
      tabAuxAtualiza.Append;
      tabAuxAtualizaCodigoProduto.Value := tabAuxiliarProdutosCodigoProduto.Value;
      tabAuxAtualiza.Post;
      tabAuxiliarProdutos.Delete;
    end;
  end;
end;

procedure TfmOrdemProducaoEntrada.btnClientesLocalizarClick(
  Sender: TObject);
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

procedure TfmOrdemProducaoEntrada.edtCodigoClienteExit(Sender: TObject);
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

procedure TfmOrdemProducaoEntrada.btnProdutoLocalizarClick(
  Sender: TObject);
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

procedure TfmOrdemProducaoEntrada.edtCodigoProdutoChange(Sender: TObject);
begin
  inherited;
  if tabBase.State in [dsInsert, dsEdit] then
  begin
    if Trim(edtCodigoProduto.Text) <> '' then
    begin
      try
        tabChecagens.Close;
        tabChecagens.SQL.Clear;
        tabChecagens.SQL.Add('SELECT CodigoProduto,NomeTecnico FROM produtos WHERE CodigoProduto = ' + QuotedStr(edtCodigoProduto.Text));
        tabChecagens.Open;
        if tabChecagens.RecordCount > 0 then
        begin
          edtDescricaoProdutos.Text := tabChecagens.FieldByName('NomeTecnico').AsString;
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
        end
        else
        begin
          edtDescricaoProdutos.Text := '';
          edtSaldo.Text := '';
        end;
      finally
        tabChecagens.Close;
      end;
    end
    else
    begin
      edtDescricaoProdutos.Text := '';
      edtSaldo.Text := '';
    end;
  end;
end;

procedure TfmOrdemProducaoEntrada.edtOPKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', Chr(8)]) then
    Key := #0;
end;

procedure TfmOrdemProducaoEntrada.edtCodigoProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #32 then
    Key := #0
  else
    Key := UpCase(Key);
end;

procedure TfmOrdemProducaoEntrada.btnOpcoesClick(Sender: TObject);
begin
  if not tabBase.FieldByName('DataTermino').IsNull then
  begin
    EfetuarBaixa1.Enabled := False;
  end
  else
  begin
    EfetuarBaixa1.Enabled := True;
  end;
  inherited;
end;

procedure TfmOrdemProducaoEntrada.RelaodeOPsPendentes1Click(
  Sender: TObject);
var
  vRT: TrtOrdensProducaoPendentes;
begin
  inherited;
  vRT := TrtOrdensProducaoPendentes.Create(Self);
  vRT.Show;
end;

procedure TfmOrdemProducaoEntrada.EmissodaOP1Click(Sender: TObject);
var
  vRT: TrtOrdensProducaoEmissao;
begin
  inherited;
  if Trim(edtOP.Text) <> '' then
  begin
    fmMenu.pubTrans1 := edtOP.Text;
    vRT := TrtOrdensProducaoEmissao.Create(Self);
    vRT.Show;
  end;
end;

procedure TfmOrdemProducaoEntrada.EfetuarBaixa1Click(Sender: TObject);
begin
  inherited;
  if Trim(edtOP.Text) <> '' then
  begin
    tabBase.Edit;
    tabBase.FieldByName('DataTermino').AsDateTime := Date;
    tabBase.Post;
    tabBase.ApplyUpDates;

    dbgProdutos.DataSource := nil;
    try
      tabOrdemProducaoProdutos.First;
      while not tabOrdemProducaoProdutos.Eof do
      begin
        Application.ProcessMessages;
        fmMenu.AtualizaEstoque(tabOrdemProducaoProdutos.FieldByName('CodigoProduto').AsString);
        tabOrdemProducaoProdutos.Next;
      end;
      tabOrdemProducaoProdutos.First;
    finally
      dbgProdutos.DataSource := dtsOrdemProducaoProdutos;
    end;
  end;
end;

procedure TfmOrdemProducaoEntrada.btnExcluirClick(Sender: TObject);
begin
  inherited;
  tabAuxAtualiza.First;
  while not tabAuxAtualiza.Eof do
  begin
    Application.ProcessMessages;
    fmMenu.AtualizaEstoque(tabAuxAtualizaCodigoProduto.Value);
    tabAuxAtualiza.Next;
  end;
end;

procedure TfmOrdemProducaoEntrada.dtsOrdemProducaoProdutosDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  tabRP.Close;
  tabRP.ParamByName('OrdemProducao').AsFloat := tabOrdemProducaoProdutos.FieldByName('OrdemProducao').AsFloat;
  tabRP.ParamByName('CodigoProduto').AsString := tabOrdemProducaoProdutos.FieldByName('CodigoProduto').AsString;
  tabRP.Open;
end;

procedure TfmOrdemProducaoEntrada.btnAddRPClick(Sender: TObject);
begin
  inherited;
  if (Trim(edtOP.Text) <> '') and (Trim(tabOrdemProducaoProdutos.FieldByName('CodigoProduto').AsString) <> '') then
  begin
    if Trim(edtRPSetor.Text) = '' then
    begin
      ShowMessage('Obrigatório Preenchimento do Setor');
      edtRPSetor.SetFocus;
      exit;
    end;
    if Trim(edtRPReponsavel.Text) = '' then
    begin
      ShowMessage('Obrigatório Preenchimento do Responsável');
      edtRPReponsavel.SetFocus;
      exit;
    end;
    if Length(edtRPPeriodoInicial.Text) <> 19 then
    begin
      ShowMessage('Preenchimento Incorreto no Período de Datas');
      edtRPPeriodoInicial.SetFocus;
      exit;
    end;
    if Length(edtRPPeriodoFinal.Text) <> 19 then
    begin
      ShowMessage('Preenchimento Incorreto no Período de Datas');
      edtRPPeriodoFinal.SetFocus;
      exit;
    end;
    if StrToDateTime(edtRPPeriodoInicial.Text) > StrToDateTime(edtRPPeriodoInicial.Text) then
    begin
      ShowMessage('Preenchimento Incorreto no Período de Datas');
      edtRPPeriodoFinal.SetFocus;
      exit;
    end;

    if Trim(edtRPQuantidade.Text) = '' then
    begin
      ShowMessage('Obrigatório Preenchimento da Quantidade');
      edtRPQuantidade.SetFocus;
      exit;
    end;

    tabChecagens.Close;
    tabChecagens.SQL.Clear;
    tabChecagens.SQL.Add('SELECT SUM(Quantidade-Perdas) AS Tot');
    tabChecagens.SQL.Add('FROM roteiro_produtivo');
    tabChecagens.SQL.Add('WHERE OrdemProducao = ' + edtOP.Text);
    tabChecagens.SQL.Add('AND CodigoProduto = ' + QuotedStr(tabOrdemProducaoProdutos.FieldByName('CodigoProduto').AsString));
    tabChecagens.SQL.Add('AND CodigoSetor = ' + string(edtRPSetor.KeyValue));
    tabChecagens.Open;

    if (tabChecagens.FieldByName('Tot').AsFloat + edtRPQuantidade.Value) > tabOrdemProducaoProdutos.FieldByName('Quantidade').AsFloat then
    begin
      ShowMessage('Quantidade Informada maior que Produção');
      edtRPQuantidade.SetFocus;
      exit;
    end;

    tabChecagens.Close;
    tabChecagens.SQL.Clear;
    tabChecagens.SQL.Add('SELECT *');
    tabChecagens.SQL.Add('FROM roteiro_produtivo');
    tabChecagens.SQL.Add('WHERE 0');
    tabChecagens.Open;

    tabChecagens.Append;
    tabChecagens.FieldByName('ID').AsFloat := CodeGenerator('roteiro_produtivo', 'ID');
    tabChecagens.FieldByName('OrdemProducao').AsFloat := StrToFloat(edtOP.Text);
    tabChecagens.FieldByName('CodigoProduto').AsString := tabOrdemProducaoProdutos.FieldByName('CodigoProduto').AsString;
    tabChecagens.FieldByName('PeriodoInicial').AsDateTime := StrToDateTime(edtRPPeriodoInicial.Text);
    tabChecagens.FieldByName('PeriodoFinal').AsDateTime := StrToDateTime(edtRPPeriodoFinal.Text);
    tabChecagens.FieldByName('Quantidade').AsFloat := edtRPQuantidade.Value;
    tabChecagens.FieldByName('Perdas').AsFloat := edtRPPerdas.Value;
    tabChecagens.FieldByName('CodigoSetor').AsFloat := StrToFloat(edtRPSetor.KeyValue);
    tabChecagens.FieldByName('CodigoResponsavel1').AsFloat := StrToFloat(edtRPReponsavel.Text);
    tabChecagens.Post;
    tabChecagens.ApplyUpDates;

    edtRPSetor.KeyValue := NULL;
    edtRPReponsavel.Text := '';
    edtRPQuantidade.Value := 0;
    edtRPPerdas.Value;

    tabRP.Close;
    tabRP.ParamByName('OrdemProducao').AsFloat := tabOrdemProducaoProdutos.FieldByName('OrdemProducao').AsFloat;
    tabRP.ParamByName('CodigoProduto').AsString := tabOrdemProducaoProdutos.FieldByName('CodigoProduto').AsString;
    tabRP.Open;

    edtRPSetor.SetFocus;

    // select TIMEDIFF(HoraFinal, HoraInicial) AS Tot from roteiro_produtivo
  end;
end;

procedure TfmOrdemProducaoEntrada.btnRemoverRPClick(Sender: TObject);
begin
  inherited;
  if tabRP.RecordCount > 0 then
  begin
    if Application.MessageBox('Deseja Realmente Excluir o Roteiro Produtivo?', PChar(Application.Title), 36) = 7 then
      exit;
    tabChecagens.Close;
    tabChecagens.SQL.Clear;
    tabChecagens.SQL.Add('SELECT * FROM roteiro_produtivo WHERE ID = ' + tabRP.FieldByName('ID').AsString);
    tabChecagens.Open;
    if tabChecagens.RecordCount > 0 then
    begin
      tabChecagens.Delete;
      tabChecagens.ApplyUpdates;
    end;
    tabRP.Close;
    tabRP.ParamByName('OrdemProducao').AsFloat := tabOrdemProducaoProdutos.FieldByName('OrdemProducao').AsFloat;
    tabRP.ParamByName('CodigoProduto').AsString := tabOrdemProducaoProdutos.FieldByName('CodigoProduto').AsString;
    tabRP.Open;
  end;
end;

procedure TfmOrdemProducaoEntrada.FichadeProduo1Click(Sender: TObject);
var
  vRT: TrtFichaProducao;
begin
  inherited;
  if Trim(edtOP.Text) <> '' then
  begin
    fmMenu.pubTrans1 := edtOP.Text;
    vRT := TrtFichaProducao.Create(Self);
    vRT.Show;
  end;

end;

procedure TfmOrdemProducaoEntrada.EtiquetasdeProdutos1Click(
  Sender: TObject);
var
  vFM: TfmEtiquetasProdutos_TLP2844;
begin
  inherited;
  if Trim(edtOP.Text) <> '' then
  begin
    fmMenu.pubTrans1 := edtOP.Text;
    fmMenu.pubTrans2 := '2';
    vFM := TfmEtiquetasProdutos_TLP2844.Create(Self);
    vFM.Show;
  end;
end;

procedure TfmOrdemProducaoEntrada.btnLocalizarClick(Sender: TObject);
var
  vParams: TParametrosLocalizar;
begin
  if not Assigned(fmLocalizarOrdemProducao) then
  begin
    Application.CreateForm(TfmLocalizarOrdemProducao, fmLocalizarOrdemProducao);
    fmLocalizarOrdemProducao.ShowModal;
  end;

  if Trim(fmMenu.pubTrans1) <> '' then
  begin
    edtOP.Text := fmMenu.pubTrans1;
    tabBase.Close;
    tabBase.ParamByName('OrdemProducao').Value := edtOP.Text;
    tabBase.Open;
  end;
end;

end.


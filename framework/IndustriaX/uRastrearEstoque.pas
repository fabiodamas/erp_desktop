unit uRastrearEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, DB, Grids, DBGrids,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Buttons, Menus;

type
  TfmRastrearEstoque = class(TfmFormBaseAvancado)
    Label1: TLabel;
    edtCodigoProduto: TEdit;
    dbgOrdens: TDBGrid;
    Label2: TLabel;
    dtsOP: TDataSource;
    tabOP: TZQuery;
    btnRastrear: TBitBtn;
    dbgPedidos: TDBGrid;
    Label3: TLabel;
    tabPedidos: TZQuery;
    dtsPedidos: TDataSource;
    lblTotalOP: TLabel;
    lblTotalPedidos: TLabel;
    tabChecagens: TZQuery;
    Label4: TLabel;
    dbgMovimentosEntrada: TDBGrid;
    tabMovEntrada: TZQuery;
    dtsMovEntrada: TDataSource;
    lblTotMovEntrada: TLabel;
    lblTotMovSaida: TLabel;
    dbgMovimentosSaida: TDBGrid;
    tabMovSaida: TZQuery;
    dtsMovSaida: TDataSource;
    Label5: TLabel;
    Label6: TLabel;
    dbgAcertosSaidas: TDBGrid;
    lblTotAcertosSaida: TLabel;
    tabAcertosSaidas: TZQuery;
    dtsAcertosSaidas: TDataSource;
    Label7: TLabel;
    dbgAcertosEntradas: TDBGrid;
    lblTotAcertosEntrada: TLabel;
    tabAcertosEntradas: TZQuery;
    dtsAcertosEntradas: TDataSource;
    lblEstoque: TLabel;
    btnLocalizarProdutos: TBitBtn;
    btnAtualiza: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnRastrearClick(Sender: TObject);
    procedure edtCodigoProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnLocalizarProdutosClick(Sender: TObject);
    procedure btnAtualizaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmRastrearEstoque: TfmRastrearEstoque;

implementation

uses uFormBase, uMenu, uLocalizarProdutos;

{$R *.dfm}

procedure TfmRastrearEstoque.FormCreate(Sender: TObject);
begin
  inherited;
  SetFormStyle(fsMDIChild);
end;

procedure TfmRastrearEstoque.btnRastrearClick(Sender: TObject);
var vTotOp, vTotPed, vTotMovEnt, vTotMovSai, vTotAcerSai, vTotAcerEnt : real;
begin
  inherited;

  if Trim(edtCodigoProduto.Text) = '' then
  begin
    ShowMessage('Obrigatório Preenchimento do Código do Produto');
    edtCodigoProduto.SetFocus;
    exit;
  end;

  fmMenu.AtualizaEstoque(edtCodigoProduto.Text);
  
  dbgOrdens.DataSource:=nil;
  dbgPedidos.DataSource:=nil;
  dbgMovimentosEntrada.DataSource:=nil;
  dbgMovimentosSaida.DataSource:=nil;
  dbgAcertosSaidas.DataSource:=nil;
  dbgAcertosEntradas.DataSource:=nil;

  try

    lblEstoque.Visible:=False;

    tabOP.Close;
    tabOP.SQL.Clear;
    tabOP.SQL.Add('SELECT ordem_producao.OrdemProducao, ordem_producao.DataTermino, ordem_producao_produtos.CodigoProduto, ordem_producao_produtos.Quantidade');
    tabOP.SQL.Add('FROM ordem_producao');
    tabOP.SQL.Add('LEFT JOIN ordem_producao_produtos ON ordem_producao_produtos.OrdemProducao = ordem_producao.OrdemProducao');
    tabOP.SQL.Add('WHERE ordem_producao_produtos.CodigoProduto = '+QuotedStr(edtCodigoProduto.Text));
    tabOP.SQL.Add('AND ordem_producao.DataTermino IS NOT NULL');
    tabOP.SQL.Add('ORDER BY ordem_producao.DataTermino DESC');
    tabOP.Open;

    vTotOp:=0;

    tabOP.First;
    while not tabOP.Eof do
    begin
      vTotOp:=vTotOp + tabOP.FieldByName('Quantidade').AsFloat;
      tabOP.Next;
    end;

    lblTotalOP.Caption:='Total de Registros: '+IntToStr(tabOP.RecordCount)+' - Total: '+FloatToStr(vTotOp);

    tabPedidos.Close;
    tabPedidos.SQL.Clear;
    tabPedidos.SQL.Add('SELECT pedidos.NPedido, pedidos.DataProducao, pedidos_produtos.CodigoProduto, pedidos_produtos.Quantidade');
    tabPedidos.SQL.Add('FROM pedidos');
    tabPedidos.SQL.Add('LEFT JOIN pedidos_produtos ON pedidos_produtos.NPedido = pedidos.NPedido');
    tabPedidos.SQL.Add('WHERE pedidos_produtos.CodigoProduto = '+QuotedStr(edtCodigoProduto.Text));
    tabPedidos.SQL.Add('AND pedidos.DataProducao IS NOT NULL');
    tabPedidos.SQL.Add('ORDER BY pedidos.DataProducao DESC');
    tabPedidos.Open;

    vTotPed:=0;
    tabPedidos.First;
    while not tabPedidos.Eof do
    begin
      vTotPed:=vTotPed + tabPedidos.FieldByName('Quantidade').AsFloat;
      tabPedidos.Next;
    end;

    lblTotalPedidos.Caption:='Total de Registros: '+IntToStr(tabPedidos.RecordCount)+' - Total: '+FloatToStr(vTotPed);

    // --

    tabMovEntrada.Close;
    tabMovEntrada.SQL.Clear;
    tabMovEntrada.SQL.Add('SELECT CodigoProduto,Data,Quantidade,ReferenciaDesc ');
    tabMovEntrada.SQL.Add('FROM produtos_movimentos WHERE TipoMovimento = 1 ');
    tabMovEntrada.SQL.Add('AND CodigoProduto = '+QuotedStr(edtCodigoProduto.Text)+' ');
    tabMovEntrada.SQL.Add('ORDER BY Data DESC');
    tabMovEntrada.Open;

    vTotMovEnt:=0;
    tabMovEntrada.First;
    while not tabMovEntrada.Eof do
    begin
      vTotMovEnt:=vTotMovEnt + tabMovEntrada.FieldByName('Quantidade').AsFloat;
      tabMovEntrada.Next;
    end;

    lblTotMovEntrada.Caption:='Total de Registros: '+IntToStr(tabMovEntrada.RecordCount)+' - Total: '+FloatToStr(vTotMovEnt);

    // --

    tabMovSaida.Close;
    tabMovSaida.SQL.Clear;
    tabMovSaida.SQL.Add('SELECT CodigoProduto,Data,Quantidade,ReferenciaDesc ');
    tabMovSaida.SQL.Add('FROM produtos_movimentos WHERE TipoMovimento = 0 ');
    tabMovSaida.SQL.Add('AND CodigoProduto = '+QuotedStr(edtCodigoProduto.Text)+' ');
    tabMovSaida.SQL.Add('ORDER BY Data DESC');
    tabMovSaida.Open;

    vTotMovSai:=0;
    tabMovSaida.First;
    while not tabMovSaida.Eof do
    begin
      vTotMovSai:=vTotMovSai + tabMovSaida.FieldByName('Quantidade').AsFloat;
      tabMovSaida.Next;
    end;

    lblTotMovSaida.Caption:='Total de Registros: '+IntToStr(tabMovSaida.RecordCount)+' - Total: '+FloatToStr(vTotMovSai);

    // --

    tabAcertosSaidas.Close;
    tabAcertosSaidas.SQL.Clear;
    tabAcertosSaidas.SQL.Add('SELECT acertos_produtos.CodigoProduto,acertos.Data,acertos_produtos.Quantidade ');
    tabAcertosSaidas.SQL.Add('FROM acertos_produtos');
    tabAcertosSaidas.SQL.Add('LEFT JOIN acertos ON acertos.Documento = acertos_produtos.Documento ');
    tabAcertosSaidas.SQL.Add('WHERE acertos_produtos.TipoAcerto = 0 ');
    tabAcertosSaidas.SQL.Add('AND acertos_produtos.CodigoProduto = '+QuotedStr(edtCodigoProduto.Text)+' ');
    tabAcertosSaidas.SQL.Add('ORDER BY acertos.Data DESC');
    tabAcertosSaidas.Open;

    vTotAcerSai:=0;
    tabAcertosSaidas.First;
    while not tabAcertosSaidas.Eof do
    begin
      vTotAcerSai:=vTotAcerSai + tabAcertosSaidas.FieldByName('Quantidade').AsFloat;
      tabAcertosSaidas.Next;
    end;

    lblTotAcertosSaida.Caption:='Total de Registros: '+IntToStr(tabAcertosSaidas.RecordCount)+' - Total: '+FloatToStr(vTotAcerSai);

    // --

    tabAcertosEntradas.Close;
    tabAcertosEntradas.SQL.Clear;
    tabAcertosEntradas.SQL.Add('SELECT acertos_produtos.CodigoProduto,acertos.Data,acertos_produtos.Quantidade ');
    tabAcertosEntradas.SQL.Add('FROM acertos_produtos');
    tabAcertosEntradas.SQL.Add('LEFT JOIN acertos ON acertos.Documento = acertos_produtos.Documento ');
    tabAcertosEntradas.SQL.Add('WHERE acertos_produtos.TipoAcerto = 1 ');
    tabAcertosEntradas.SQL.Add('AND acertos_produtos.CodigoProduto = '+QuotedStr(edtCodigoProduto.Text)+' ');
    tabAcertosEntradas.SQL.Add('ORDER BY acertos.Data DESC');
    tabAcertosEntradas.Open;

    vTotAcerEnt:=0;
    tabAcertosEntradas.First;
    while not tabAcertosEntradas.Eof do
    begin
      vTotAcerEnt:=vTotAcerEnt + tabAcertosEntradas.FieldByName('Quantidade').AsFloat;
      tabAcertosEntradas.Next;
    end;

    lblTotAcertosEntrada.Caption:='Total de Registros: '+IntToStr(tabAcertosEntradas.RecordCount)+' - Total: '+FloatToStr(vTotAcerEnt);
    lblEstoque.Caption:='Estoque: '+FloatToStr( (vTotOp+vTotMovEnt+vTotAcerEnt) - (vTotPed+vTotMovSai+vTotAcerSai)  );
    lblEstoque.Visible:=True;
  finally
    dbgOrdens.DataSource:=dtsOP;
    dbgPedidos.DataSource:=dtsPedidos;
    dbgMovimentosEntrada.DataSource:=dtsMovEntrada;
    dbgMovimentosSaida.DataSource:=dtsMovSaida;
    dbgAcertosSaidas.DataSource:=dtsAcertosSaidas;
    dbgAcertosEntradas.DataSource:=dtsAcertosEntradas;
  end;
end; 

procedure TfmRastrearEstoque.edtCodigoProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #32 then Key:=#0 else Key:=UpCase(Key);
end;

procedure TfmRastrearEstoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tabOP.Close;
  tabPedidos.Close;
  tabChecagens.Close;
  tabMovEntrada.Close;
  tabMovSaida.Close;
  tabAcertosSaidas.Close;
  tabAcertosEntradas.Close;
  inherited; 
end;

procedure TfmRastrearEstoque.btnLocalizarProdutosClick(Sender: TObject);
begin
  inherited;
  if not Assigned (fmLocalizarProdutos) then
  begin
    Application.CreateForm(TfmLocalizarProdutos, fmLocalizarProdutos);
    fmLocalizarProdutos.ShowModal;
  end;
  if Trim(fmMenu.pubTrans1) <> '' then
  begin
    edtCodigoProduto.Text:=fmMenu.pubTrans1;
  end;
end;

procedure TfmRastrearEstoque.btnAtualizaClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.

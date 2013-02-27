unit uPedidosCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, Menus, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Buttons, ExtCtrls, StdCtrls, DBCtrls, Mask,
  ToolEdit, RXDBCtrl, CurrEdit, Grids, DBGrids, ComCtrls, DBClient;

type
  TfmPedidosCompra = class(TfmFormBaseCadastro)
    Label1: TLabel;
    edtPedido: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtDataPedido: TDBDateEdit;
    edtHoraPedido: TDBEdit;
    edtDataPrevisao: TDBDateEdit;
    Label4: TLabel;
    edtDataRecebimento: TDBDateEdit;
    Label5: TLabel;
    edtNotaFiscal: TDBEdit;
    Label6: TLabel;
    edtOrcamentoAprovado: TDBEdit;
    Label7: TLabel;
    edtCodigoFornecedor: TDBEdit;
    Label8: TLabel;
    btnFornecedorLocalizar: TBitBtn;
    edtFornecedor: TDBEdit;
    Label9: TLabel;
    edtContato: TDBComboBox;
    Label10: TLabel;
    edtCodigoResponsavel: TDBEdit;
    Label12: TLabel;
    edtResponsavel: TDBLookupComboBox;
    edtCodigoEmpresa: TDBEdit;
    Label13: TLabel;
    edtEmpresa: TDBLookupComboBox;
    edtCodigoCC: TDBEdit;
    Label14: TLabel;
    btnLocalizarCC: TBitBtn;
    edtCentroCusto: TDBEdit;
    Label15: TLabel;
    edtCodigoTransportadora: TDBEdit;
    Label16: TLabel;
    edtTransportadora: TDBLookupComboBox;
    edtQtdCaixas: TDBEdit;
    Label17: TLabel;
    edtConhecimento: TDBEdit;
    Label18: TLabel;
    pgcPedidos: TPageControl;
    tbsProdutos: TTabSheet;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    btnProdutoAdicionar: TBitBtn;
    btnProdutoRemover: TBitBtn;
    dbgProdutos: TDBGrid;
    edtCodigoProduto: TEdit;
    btnProdutoLocalizar: TBitBtn;
    edtDescricaoProdutos: TEdit;
    edtSaldo: TEdit;
    edtQuantidade: TCurrencyEdit;
    edtValor: TCurrencyEdit;
    tbsVenctos: TTabSheet;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    edtFormasPagto: TDBLookupComboBox;
    edtParcelas: TDBEdit;
    edtVencto1: TDBDateEdit;
    edtValor1: TDBEdit;
    edtVencto2: TDBDateEdit;
    edtValor2: TDBEdit;
    edtVencto3: TDBDateEdit;
    edtValor3: TDBEdit;
    edtVencto4: TDBDateEdit;
    edtValor4: TDBEdit;
    edtVencto5: TDBDateEdit;
    edtValor5: TDBEdit;
    edtVencto6: TDBDateEdit;
    edtValor6: TDBEdit;
    edtVencto7: TDBDateEdit;
    edtValor7: TDBEdit;
    edtVencto8: TDBDateEdit;
    edtValor8: TDBEdit;
    edtVencto9: TDBDateEdit;
    edtValor9: TDBEdit;
    edtVencto12: TDBDateEdit;
    edtValor12: TDBEdit;
    edtValor11: TDBEdit;
    edtVencto11: TDBDateEdit;
    edtVencto10: TDBDateEdit;
    edtValor10: TDBEdit;
    edtValorProdutos: TDBEdit;
    Label24: TLabel;
    edtValorFrete: TDBEdit;
    Label25: TLabel;
    edtValorAcrescimo: TDBEdit;
    Label26: TLabel;
    edtValorIpi: TDBEdit;
    Label27: TLabel;
    edtValorDesconto: TDBEdit;
    Label28: TLabel;
    edtTotalPedido: TDBEdit;
    Label57: TLabel;
    tbsObservacoes: TTabSheet;
    edtObservacoes: TDBMemo;
    tabFornecedor: TZQuery;
    dtsFornecedor: TDataSource;
    tabCFOP: TZQuery;
    dtsCFOP: TDataSource;
    tabTransportadora: TZQuery;
    dtsTransportadora: TDataSource;
    tabEmpresas: TZQuery;
    dtsEmpresas: TDataSource;
    tabCentroCusto: TZQuery;
    dtsCentroCusto: TDataSource;
    tabPedidosCompraProdutos: TZQuery;
    dtsPedidosCompraProdutos: TDataSource;
    tabAuxiliarProdutos: TClientDataSet;
    tabAuxiliarProdutosCodigoProduto: TStringField;
    tabAuxiliarProdutosDescricao: TStringField;
    tabAuxiliarProdutosQuantidade: TFloatField;
    tabAuxiliarProdutosValor: TCurrencyField;
    tabAuxiliarProdutosValorTotal: TCurrencyField;
    dtsAuxiliarProdutos: TDataSource;
    tabAuxiliarVenctos: TClientDataSet;
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
    dtsAuxiliarVenctos: TDataSource;
    tabChecagens: TZQuery;
    tabPedidosVencto: TZQuery;
    dtsPedidosVencto: TDataSource;
    tabFormasPagto: TZQuery;
    dtsFormasPagto: TDataSource;
    tabFuncionarios: TZQuery;
    dtsFuncionarios: TDataSource;
    Receber1: TMenuItem;
    tabUltimasCompras: TZQuery;
    tabTitulos: TZQuery;
    tabProdutosFornecedores: TZQuery;
    tabPedidosCompraProdutosID: TFloatField;
    tabPedidosCompraProdutosPedido: TFloatField;
    strngfldPedidosCompraProdutosCodigoProduto: TStringField;
    strngfldPedidosCompraProdutosDescricao: TStringField;
    tabPedidosCompraProdutosQuantidade: TFloatField;
    tabPedidosCompraProdutosValor: TFloatField;
    tabPedidosCompraProdutosValorTotal: TFloatField;
    dfdPedidosCompraProdutosDataBaixa: TDateField;
    tabPedidosCompraProdutosCodigoFornecedor: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dtsBaseDataChange(Sender: TObject; Field: TField);
    procedure btnNovoClick(Sender: TObject);
    procedure edtCodigoProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure edtPedidoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnProdutoAdicionarClick(Sender: TObject);
    procedure btnProdutoRemoverClick(Sender: TObject);
    procedure btnFornecedorLocalizarClick(Sender: TObject);
    procedure btnProdutoLocalizarClick(Sender: TObject);
    procedure edtCodigoProdutoChange(Sender: TObject);
    procedure edtValorFreteExit(Sender: TObject);
    procedure edtValorAcrescimoExit(Sender: TObject);
    procedure edtValorIpiExit(Sender: TObject);
    procedure edtValorDescontoExit(Sender: TObject);
    procedure edtPercDescExit(Sender: TObject);
    procedure edtFormasPagtoExit(Sender: TObject);
    procedure edtPedidoKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoCCExit(Sender: TObject);
    procedure btnLocalizarCCClick(Sender: TObject);
    procedure Receber1Click(Sender: TObject);
    procedure btnOpcoesClick(Sender: TObject);
    procedure edtCodigoFornecedorExit(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    FTyping : boolean;
    procedure AtualizaPedido;
    procedure GravarProdutos(pPedido: real);
    procedure GravarVenctos(pPedido: real);
    procedure AtualizaVenctos(pFormaPagto: real; pData: TDateTime; pTotal: real);
    function SeTotalDifVenctos : boolean;
    procedure VenctosTrocaDataSource(pDataSource: TDataSource);
    procedure AtualizaTotal;
  public
    procedure Novo; override;
    procedure Editar; override;
    procedure Deletar; override;
    procedure Cancelar; override;
    function Checagens: Boolean; override;
  end;

var
  fmPedidosCompra: TfmPedidosCompra;

implementation

uses uFormBaseConfig, uMenu, uFuncoes, uLocalizarGenerico, uTipos,
  uLocalizarProdutos, uReceberPedidoCompra, uLocalizarCentroCusto,
  uLocalizarPedidosCompras;

{$R *.dfm}

procedure TfmPedidosCompra.Novo;
begin
   if Trim(edtPedido.Text) = '' then begin
      tabBase.FieldByName('Pedido').AsFloat:=CodeGenerator('pedidos_compras', 'Pedido');
    end
   else begin
      tabBase.FieldByName('Pedido').AsFloat:=StrToFloat(edtPedido.Text);
   end;
   GravarProdutos(tabBase.FieldByName('Pedido').AsFloat);
   GravarVenctos(tabBase.FieldByName('Pedido').AsFloat);
end;

procedure TfmPedidosCompra.Editar;
begin
   GravarProdutos(tabBase.FieldByName('Pedido').AsFloat);
   GravarVenctos(tabBase.FieldByName('Pedido').AsFloat);
end;

procedure TfmPedidosCompra.Deletar;
begin
   try
      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT * FROM pedidos_compra_produtos WHERE Pedido = '+FloatToStr(tabBase.FieldByName('Pedido').AsFloat));
      tabChecagens.Open;
      tabChecagens.First;
      while not tabChecagens.Eof do begin
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
      tabChecagens.SQL.Add('SELECT * FROM pedidos_compra_vencimentos WHERE Pedido = '+FloatToStr(tabBase.FieldByName('Pedido').AsFloat));
      tabChecagens.Open;;
      tabChecagens.First;
      while not tabChecagens.Eof do begin
         tabChecagens.Delete;
         tabChecagens.ApplyUpdates;
         Continue;
      end;
   finally
      tabChecagens.Close;
   end;
end; 

procedure TfmPedidosCompra.Cancelar;
begin
end;

function TfmPedidosCompra.Checagens: Boolean;
begin
   Result:=False;
   if Trim(edtCodigoFornecedor.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Fornecedor');
      edtCodigoFornecedor.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtDataPedido.Text) = '/  /' then begin
      ShowMessage('Obrigatório Preenchimento da Data do Pedido');
      edtDataPedido.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtHoraPedido.Text) = '  :  :  ' then begin
      ShowMessage('Obrigatório Preenchimento da Hora do Pedido');
      edtHoraPedido.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtCodigoResponsavel.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Responsável');
      edtCodigoResponsavel.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtCodigoEmpresa.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Empresa');
      edtCodigoEmpresa.SetFocus;
      Result:=True;
      exit;
   end;
   if tabAuxiliarProdutos.RecordCount <= 0 then begin
      ShowMessage('Obrigatório Preenchimento dos Produtos');
      edtCodigoProduto.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtTransportadora.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Transportadora');
      edtTransportadora.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtFormasPagto.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Forma de Pagamento');
      pgcPedidos.ActivePage:=tbsVenctos;
      edtFormasPagto.SetFocus;
      Result:=True;
      exit;
   end;
   if SeTotalDifVenctos then begin
      ShowMessage('Valor dos Vencimentos Incompativel com o Valor Total do Pedido');
      pgcPedidos.ActivePage:=tbsVenctos;
      edtValor1.SetFocus;
      Result:=True;
      exit;
   end;
   if tabBase.State = dsInsert then begin
      if Trim(edtPedido.Text) <> '' then begin
         if ExistsValue('Pedido', 'pedidos_compras', edtPedido.Text) then begin
            ShowMessage('Pedido já Existente');
            edtPedido.SetFocus; 
            Result:=True; 
            exit;
         end;
      end;
   end;
end;

procedure TfmPedidosCompra.FormCreate(Sender: TObject);
begin
   inherited;
   FTyping:=False;
   SetFormStyle(fsMDIChild);
end;

procedure TfmPedidosCompra.FormShow(Sender: TObject);
begin
   inherited;

   pgcPedidos.ActivePageIndex:=0;

   tabFornecedor.Params.CreateParam(ftFloat, 'CodigoFornecedor', ptUnknown);
   tabFornecedor.SQL.Add('SELECT CodigoFornecedor,NomeFantasia FROM fornecedores WHERE CodigoFornecedor = :CodigoFornecedor');
   tabFornecedor.Open;

   tabCFOP.SQL.Add('SELECT * FROM cfop ORDER BY NaturezaOperacao');
   tabCFOP.Open;

   tabTransportadora.SQL.Add('SELECT Codigo,Nome FROM transportadoras ORDER BY Nome');
   tabTransportadora.Open;

   tabEmpresas.SQL.Add('SELECT CodigoEmpresa,NomeFantasia FROM empresas ORDER BY NomeFantasia');
   tabEmpresas.Open;

   tabCentroCusto.Params.CreateParam(ftString, 'CodigoCentroCusto', ptUnknown);
   tabCentroCusto.SQL.Add('SELECT Codigo,Descricao FROM centro_custo WHERE Codigo = :CodigoCentroCusto');
   tabCentroCusto.Open;

   tabPedidosCompraProdutos.Params.CreateParam(ftFloat, 'Pedido', ptUnknown);
   tabPedidosCompraProdutos.SQL.Clear;
   tabPedidosCompraProdutos.SQL.Add('SELECT * FROM pedidos_compra_produtos WHERE Pedido = :Pedido');
   tabPedidosCompraProdutos.Open;

   tabPedidosVencto.Params.CreateParam(ftFloat, 'Pedido', ptUnknown);
   tabPedidosVencto.SQl.Add('SELECT * FROM pedidos_compra_vencimentos WHERE Pedido = :Pedido');
   tabPedidosVencto.Open;

   tabBase.Params.CreateParam(ftFloat, 'Pedido', ptUnknown);
   tabBase.SQL.Add('SELECT * FROM pedidos_compras WHERE Pedido = :Pedido');
   tabBase.Open;

   tabFormasPagto.SQL.Add('SELECT * FROM formas_pagamento ORDER BY Descricao');
   tabFormasPagto.Open;

   tabFuncionarios.SQL.Add('SELECT Codigo,Nome FROM funcionarios ORDER BY Nome');
   tabFuncionarios.Open;

   tabAuxiliarProdutos.CreateDataSet;
   tabAuxiliarProdutos.EmptyDataSet;

   tabAuxiliarVenctos.CreateDataSet;
   tabAuxiliarVenctos.EmptyDataSet;
end;

procedure TfmPedidosCompra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabBase.Close;
   tabFornecedor.Close;
   tabCFOP.Close;
   tabTransportadora.Close;
   tabEmpresas.Close;
   tabCentroCusto.Close;
   tabPedidosCompraProdutos.Close;
   tabAuxiliarProdutos.Close;
   tabAuxiliarVenctos.Close;
   tabFormasPagto.Close;
   tabFuncionarios.Close;
   tabUltimasCompras.Close;
   tabTitulos.Close;
   tabChecagens.Close;
   tabProdutosFornecedores.Close;
   inherited;
end;

procedure TfmPedidosCompra.dtsBaseDataChange(Sender: TObject;
  Field: TField);
begin
   inherited;
   if tabBase.State = dsBrowse then begin

      AtualizaPedido;
      
      tabFornecedor.Close;
      tabFornecedor.ParamByName('CodigoFornecedor').AsFloat:=tabBase.FieldByName('CodigoFornecedor').AsFloat;
      tabFornecedor.Open;

      tabCentroCusto.Close;
      tabCentroCusto.ParamByName('CodigoCentroCusto').AsString:=tabBase.FieldByName('CodigoCentroCusto').AsString;
      tabCentroCusto.Open;

      tabPedidosCompraProdutos.Close;
      tabPedidosCompraProdutos.ParamByName('Pedido').AsFloat:=tabBase.FieldByName('Pedido').AsFloat;
      tabPedidosCompraProdutos.Open;

      tabPedidosVencto.Close;
      tabPedidosVencto.ParamByName('Pedido').AsFloat:=tabBase.FieldByName('Pedido').AsFloat;
      tabPedidosVencto.Open;
      
   end;
end;

procedure TfmPedidosCompra.btnNovoClick(Sender: TObject);
begin
   inherited;

   tabFornecedor.Close;
   tabFornecedor.ParamByName('CodigoFornecedor').AsFloat:=-1;
   tabFornecedor.Open;

   tabCentroCusto.Close;
   tabCentroCusto.ParamByName('CodigoCentroCusto').AsString:='';
   tabCentroCusto.Open;

   tabPedidosCompraProdutos.Close;
   tabPedidosCompraProdutos.ParamByName('Pedido').AsFloat:=-1;
   tabPedidosCompraProdutos.Open;

   tabAuxiliarProdutos.EmptyDataSet;
   tabAuxiliarVenctos.EmptyDataSet;

   dbgProdutos.DataSource:=dtsAuxiliarProdutos;

   VenctosTrocaDataSource(dtsAuxiliarVenctos);

   tabBase.FieldByName('Data').AsDateTime:=Date;
   tabBase.FieldByName('Hora').AsDateTime:=Now;

   edtPedido.Text:='';

   edtDataPrevisao.SetFocus;
end;

procedure TfmPedidosCompra.GravarProdutos(pPedido: real);
begin
   tabChecagens.Close;
   tabChecagens.SQL.Clear;
   tabChecagens.SQL.Add('DELETE FROM pedidos_compra_produtos WHERE Pedido = '+FloatToStr(pPedido));
   tabChecagens.ExecSQL;

   dbgProdutos.DataSource:=nil;
   try

      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT * FROM pedidos_compra_produtos WHERE 0');
      tabChecagens.Open;

      tabAuxiliarProdutos.First;
      while not tabAuxiliarProdutos.Eof do begin

         tabChecagens.Append;
         tabChecagens.FieldByName('ID').AsFloat:=CodeGenerator('pedidos_compra_produtos', 'ID');
         tabChecagens.FieldByName('Pedido').AsFloat:=pPedido;
         tabChecagens.FieldByName('CodigoProduto').AsString:=tabAuxiliarProdutosCodigoProduto.Value;
         tabChecagens.FieldByName('Descricao').AsString:=tabAuxiliarProdutosDescricao.Value;
         tabChecagens.FieldByName('Quantidade').AsFloat:=tabAuxiliarProdutosQuantidade.Value;
         tabChecagens.FieldByName('Valor').AsFloat:=tabAuxiliarProdutosValor.Value;
         tabChecagens.FieldByName('ValorTotal').AsFloat:=tabAuxiliarProdutosValorTotal.Value;
         tabChecagens.Post;
         tabChecagens.ApplyUpdates;

         tabAuxiliarProdutos.Next;
      end;

      tabPedidosCompraProdutos.Close;
      tabPedidosCompraProdutos.ParamByName('Pedido').AsFloat:=tabBase.FieldByName('Pedido').AsFloat;
      tabPedidosCompraProdutos.Open;
      tabPedidosCompraProdutos.First;
   finally
      dbgProdutos.DataSource:=dtsPedidosCompraProdutos;
   end; 
end;

procedure TfmPedidosCompra.GravarVenctos(pPedido: real);
var vCnt: Integer;
begin
   tabChecagens.Close;
   tabChecagens.SQL.Clear;
   tabChecagens.SQL.Add('DELETE FROM pedidos_compra_vencimentos WHERE Pedido = '+FloatToStr(pPedido));
   tabChecagens.ExecSQL;

   tabChecagens.Close;
   tabChecagens.SQL.Clear;
   tabChecagens.SQL.Add('SELECT * FROM pedidos_compra_vencimentos WHERE 0');
   tabChecagens.Open;

   tabChecagens.Append;
   try
      for vCnt:=1 to 12 do begin
         tabChecagens.FieldByName('Pedido').AsFloat:=pPedido;
         if not tabAuxiliarVenctos.FieldByName('DataVencto'+IntToStr(vCnt)).IsNull then begin
            tabChecagens.FieldByName('DataVencto'+IntToStr(vCnt)).AsDateTime:=tabAuxiliarVenctos.FieldByName('DataVencto'+IntToStr(vCnt)).AsDateTime;
         end;
         tabChecagens.FieldByName('Valor'+IntToStr(vCnt)).AsFloat:=tabAuxiliarVenctos.FieldByName('Valor'+IntToStr(vCnt)).AsFloat;
      end;
   finally
      tabChecagens.Post;
      tabChecagens.ApplyUpDates;
      tabChecagens.Close;
   end;

   tabPedidosVencto.Close;
   tabPedidosVencto.ParamByName('Pedido').AsFloat:=pPedido;
   tabPedidosVencto.Open;
end;

procedure TfmPedidosCompra.AtualizaVenctos(pFormaPagto: real;
  pData: TDateTime; pTotal: real);
var vParcelas: Integer;
begin
   try
      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT Codigo,Parcelas FROM formas_pagamento WHERE Codigo = '+FloatToStr(pFormaPagto));
      tabChecagens.Open;
      vParcelas:=tabChecagens.FieldByName('Parcelas').AsInteger;

      if vParcelas > 0 then begin
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT * FROM parcelas_pagto WHERE CodigoFormaPagto = '+FloatToStr(pFormaPagto)+' ORDER BY Parcela');
         tabChecagens.Open;
         tabAuxiliarVenctos.Edit;
         tabChecagens.First;
         while not tabChecagens.Eof do begin
            tabAuxiliarVenctos.FieldByName('DataVencto'+IntToStr(tabChecagens.FieldByName('Parcela').AsInteger)).AsDateTime:=pData + tabChecagens.FieldByName('Dias').AsInteger;
            tabAuxiliarVenctos.FieldByName('Valor'+IntToStr(tabChecagens.FieldByName('Parcela').AsInteger)).AsFloat:=(tabChecagens.FieldByName('PesoParcela').AsFloat * pTotal)/100;
            tabChecagens.Next;
         end;
         tabAuxiliarVenctos.Post;
      end;
   finally
      tabChecagens.Close;
   end;
end;

function TfmPedidosCompra.SeTotalDifVenctos: boolean;
var vTotal : real;
    vCnt : Integer;
begin
   Result:=True;
   vTotal:=0;

   for vCnt:=1 to 12 do begin
      vTotal:=vTotal + tabAuxiliarVenctos.FieldByName('Valor'+IntToStr(vCnt)).AsFloat;
   end;

   if RoundReal(tabBase.FieldByName('ValorTotal').AsFloat, 2) = RoundReal(vTotal, 2) then begin
      Result:=False;
   end;
end;

procedure TfmPedidosCompra.edtCodigoProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
   inherited;
   if Key = #32 then Key:=#0 else Key:=UpCase(Key);
end;

procedure TfmPedidosCompra.edtPedidoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   inherited;
   if tabBase.State = dsBrowse then begin
      if Trim(edtPedido.Text) <> '' then begin
         FTyping:=True;
         tabBase.Close;
	       tabBase.ParamByName('Pedido').AsFloat:=StrToFloat(edtPedido.Text);
         tabBase.Open;
         FTyping:=False;
       end
      else begin
         FTyping:=True;
         tabBase.Close;
   	     tabBase.ParamByName('Pedido').AsFloat:=-1;
         tabBase.Open;
         FTyping:=False;
      end;
   end;
end;

procedure TfmPedidosCompra.AtualizaPedido;
begin
   if FTyping = False then begin
      if not tabBase.FieldByName('Pedido').IsNull then begin
         edtPedido.Text:=FloatToStr(tabBase.FieldByName('Pedido').AsFloat);
      end;
   end;
end;

procedure TfmPedidosCompra.btnEditarClick(Sender: TObject);
var vCnt: Integer;
begin
   inherited;
   edtPedido.Enabled:=False;

   tabAuxiliarProdutos.EmptyDataSet;
   tabAuxiliarVenctos.EmptyDataSet;

   dbgProdutos.DataSource:=nil;
   try
      tabPedidosCompraProdutos.First;
      while not tabPedidosCompraProdutos.Eof do begin

         tabAuxiliarProdutos.Append;
         tabAuxiliarProdutosCodigoProduto.Value:=tabPedidosCompraProdutos.FieldByName('CodigoProduto').AsString;
         tabAuxiliarProdutosDescricao.Value:=tabPedidosCompraProdutos.FieldByName('Descricao').AsString;
         tabAuxiliarProdutosQuantidade.Value:=tabPedidosCompraProdutos.FieldByName('Quantidade').AsFloat;
         tabAuxiliarProdutosValor.Value:=tabPedidosCompraProdutos.FieldByName('Valor').AsFloat;
         tabAuxiliarProdutosValorTotal.Value:=tabPedidosCompraProdutos.FieldByName('ValorTotal').AsFloat;
         tabAuxiliarProdutos.Post;

         tabPedidosCompraProdutos.Next;
      end;
   finally
      dbgProdutos.DataSource:=dtsAuxiliarProdutos;
   end;

   tabAuxiliarVenctos.Append;
   try
      for vCnt:=1 to 12 do begin
         if not tabPedidosVencto.FieldByName('DataVencto'+IntToStr(vCnt)).IsNull then begin
            tabAuxiliarVenctos.FieldByName('DataVencto'+IntToStr(vCnt)).AsDateTime:=tabPedidosVencto.FieldByName('DataVencto'+IntToStr(vCnt)).AsDateTime;
            tabAuxiliarVenctos.FieldByName('Valor'+IntToStr(vCnt)).AsFloat:=tabPedidosVencto.FieldByName('Valor'+IntToStr(vCnt)).AsFloat;
         end;
         VenctosTrocaDataSource(dtsAuxiliarVenctos);
      end;
   finally
      tabAuxiliarVenctos.Post;
   end;
end;

procedure TfmPedidosCompra.VenctosTrocaDataSource(
  pDataSource: TDataSource);
var vCnt: Integer;
begin
   for vCnt:=1 to 12 do begin
      TDBDateEdit(FindComponent('edtVencto'+IntToStr(vCnt))).DataSource:=pDataSource;
      TDBEdit(FindComponent('edtValor'+IntToStr(vCnt))).DataSource:=pDataSource;
   end;
end;

procedure TfmPedidosCompra.btnCancelarClick(Sender: TObject);
begin
   inherited;
   edtPedido.Enabled:=True; 
   dbgProdutos.DataSource:=dtsPedidosCompraProdutos;
   VenctosTrocaDataSource(dtsPedidosVencto);
end;

procedure TfmPedidosCompra.AtualizaTotal;
var vTotal, vProdutos, vIPI: real;
begin
   vIPI:=0;
   vTotal:=0;
   vProdutos:=0;
   dbgProdutos.DataSource:=nil;
   try
      tabAuxiliarProdutos.First;
      while not tabAuxiliarProdutos.Eof do begin

         Application.ProcessMessages;

         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT PercIPI FROM produtos WHERE CodigoProduto = '+QuotedStr(tabAuxiliarProdutosCodigoProduto.Value));
            tabChecagens.Open;

            if tabChecagens.RecordCount > 0 then begin
               if tabChecagens.FieldByName('PercIPI').AsFloat > 0 then begin
                  vIPI:=vIPI + ((tabAuxiliarProdutosValor.Value * tabAuxiliarProdutosQuantidade.Value) * (tabChecagens.FieldByName('PercIPI').AsFloat / 100));
               end;
            end;
         finally
            tabChecagens.Close;
         end;

         vProdutos:=vProdutos + tabAuxiliarProdutosValorTotal.Value;

         tabAuxiliarProdutos.Next;
      end;
      tabAuxiliarProdutos.First;

      // Acréscimos
      vTotal:=vTotal + vProdutos;
      vTotal:=vTotal + tabBase.FieldByName('ValorFrete').AsFloat;
      vTotal:=vTotal + tabBase.FieldByName('ValorAcrescimo').AsFloat;
      vTotal:=vTotal + vIPI;
      // Descontos
      vTotal:=vTotal - tabBase.FieldByName('ValorDesconto').AsFloat; 

      tabBase.FieldByName('ValorProdutos').AsFloat:=vProdutos;
      tabBase.FieldByName('ValorTotal').AsFloat:=vTotal;
      tabBase.FieldByName('ValorIPI').AsFloat:=vIPI;

      if not tabBase.FieldByName('CodigoFormaPagto').IsNull then begin
         AtualizaVenctos(tabBase.FieldByName('CodigoFormaPagto').AsFloat, edtDataPedido.Date, tabBase.FieldByName('ValorTotal').AsFloat);
      end;
   finally
      dbgProdutos.DataSource:=dtsAuxiliarProdutos;
   end;
end;

procedure TfmPedidosCompra.btnGravarClick(Sender: TObject);
begin
   Self.ActiveControl := nil;
   inherited;
   edtPedido.Enabled:=True;
end;

procedure TfmPedidosCompra.btnProdutoAdicionarClick(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtCodigoProduto.Text) = '' then begin
         ShowMessage('Obrigatório Preenchimento do Produto');
         edtCodigoProduto.SetFocus;
         exit;
      end;

      if edtQuantidade.Value <= 0 then begin
         ShowMessage('Obrigatório Preenchimento da Quantidade');
         edtQuantidade.SetFocus;
         exit;
      end;

      if edtValor.Value <= 0 then begin
         ShowMessage('Obrigatório Preenchimento do Valor');
         edtValor.SetFocus;
         exit;
      end;

      tabAuxiliarProdutos.Append;
      tabAuxiliarProdutosCodigoProduto.Value:=edtCodigoProduto.Text;
      tabAuxiliarProdutosDescricao.Value:=edtDescricaoProdutos.Text;
      tabAuxiliarProdutosQuantidade.Value:=edtQuantidade.Value;
      tabAuxiliarProdutosValor.Value:=edtValor.Value;
      tabAuxiliarProdutosValorTotal.Value:=edtQuantidade.Value * edtValor.Value;
      tabAuxiliarProdutos.Post;

      edtCodigoProduto.Text:='';
      edtDescricaoProdutos.Text:='';
      edtQuantidade.Value:=0;
      edtValor.Value:=0;
      edtSaldo.Text:='';

      AtualizaTotal;

      edtCodigoProduto.SetFocus;
   end;
end;

procedure TfmPedidosCompra.btnProdutoRemoverClick(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if tabAuxiliarProdutos.RecordCount > 0 then begin
         if Application.MessageBox('Deseja Realmente Excluir o Produto?', PChar(Application.Title), 36) = 7 then exit;
         tabAuxiliarProdutos.Delete; 
         AtualizaTotal;
      end;
   end;
end;

procedure TfmPedidosCompra.btnFornecedorLocalizarClick(Sender: TObject);
var vParams: TParametrosLocalizar;
begin
   vParams.Table:='fornecedores'; 
   vParams.KeyField:='CodigoFornecedor';
   vParams.Field1:='NomeFantasia';
   if not Assigned (fmLocalizarGenerico) then begin
      Application.CreateForm(TfmLocalizarGenerico, fmLocalizarGenerico);
      fmLocalizarGenerico.LoadParams(vParams);
      fmLocalizarGenerico.ShowModal;
   end;   
   if Trim(fmMenu.pubTrans1) <> '' then begin
      tabBase.FieldByName('CodigoFornecedor').AsFloat:=StrToFloat(fmMenu.pubTrans1);
      tabFornecedor.Close;
      tabFornecedor.ParamByName('CodigoFornecedor').AsFloat:=StrToFloat(fmMenu.pubTrans1);
      tabFornecedor.Open;
      edtCodigoFornecedor.SetFocus;
   end;
end;

procedure TfmPedidosCompra.btnProdutoLocalizarClick(Sender: TObject);
begin
  inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if not Assigned (fmLocalizarProdutos) then begin
         Application.CreateForm(TfmLocalizarProdutos, fmLocalizarProdutos);
         fmLocalizarProdutos.ShowModal;
      end;
      if Trim(fmMenu.pubTrans1) <> '' then begin
         edtCodigoProduto.Text:=fmMenu.pubTrans1;
      end;
   end;
end;

procedure TfmPedidosCompra.edtCodigoProdutoChange(Sender: TObject);
var vIPI: real;
begin
   inherited; 
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtCodigoProduto.Text) <> '' then begin
         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT CodigoProduto,NomeTecnico,PercIPI FROM produtos WHERE CodigoProduto = '+QuotedStr(edtCodigoProduto.Text));
            tabChecagens.Open;
            if tabChecagens.RecordCount > 0 then begin
               edtDescricaoProdutos.Text:=tabChecagens.FieldByName('NomeTecnico').AsString;
               vIPI:=tabChecagens.FieldByName('PercIPI').AsFloat;
               tabChecagens.Close;
               tabChecagens.SQL.Clear;
               tabChecagens.SQL.Add('SELECT Disponivel FROM produtos_status_estoque WHERE CodigoProduto = '+QuotedStr(edtCodigoProduto.Text));
               tabChecagens.Open;
               if tabChecagens.RecordCount = 1 then begin
                  edtSaldo.Text:=FloatToStr(tabChecagens.FieldByName('Disponivel').AsFloat);
                end
               else begin
                  edtSaldo.Text:='';
               end;
               tabChecagens.Close;
               tabChecagens.SQL.Clear;
               tabChecagens.SQL.Add('SELECT ValorCompra FROM ultimas_compras WHERE CodigoProduto = '+QuotedStr(edtCodigoProduto.Text)+' ORDER BY DataCompra DESC LIMIT 1');
               tabChecagens.Open;
               if (tabChecagens.RecordCount > 0) and (vIPI > 0) then begin
                  edtValor.Value:=tabChecagens.FieldByName('ValorCompra').AsFloat + (tabChecagens.FieldByName('ValorCompra').AsFloat * (vIPI/100));
                end
               else begin
                  edtValor.Value:=tabChecagens.FieldByName('ValorCompra').AsFloat;
               end;
             end
            else begin
               edtDescricaoProdutos.Text:='';
               edtSaldo.Text:='';
               edtValor.Value:=0;
            end;
         finally
            tabChecagens.Close;
         end;
       end
      else begin
         edtDescricaoProdutos.Text:='';
         edtSaldo.Text:='';
         edtValor.Value:=0;
      end;
   end;
end;

procedure TfmPedidosCompra.edtValorFreteExit(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then AtualizaTotal;
end;

procedure TfmPedidosCompra.edtValorAcrescimoExit(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then AtualizaTotal;
end;

procedure TfmPedidosCompra.edtValorIpiExit(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then AtualizaTotal;
end;

procedure TfmPedidosCompra.edtValorDescontoExit(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then AtualizaTotal;
end;

procedure TfmPedidosCompra.edtPercDescExit(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then AtualizaTotal;
end;

procedure TfmPedidosCompra.edtFormasPagtoExit(Sender: TObject);
var vParcelas: Integer;
    vFormaPagto: real;
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtFormasPagto.Text) <> '' then begin
         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT Codigo,Parcelas FROM formas_pagamento WHERE Codigo = '+FloatToStr(tabBase.FieldByName('CodigoFormaPagto').AsFloat));
            tabChecagens.Open;
            vParcelas:=tabChecagens.FieldByName('Parcelas').AsInteger;
            vFormaPagto:=tabChecagens.FieldByName('Codigo').AsFloat;
            tabBase.FieldByName('Parcelas').AsInteger:=vParcelas;
         finally
            tabChecagens.Close;
         end;
         if vParcelas > 0 then begin
            AtualizaVenctos(vFormaPagto, edtDataPedido.Date, tabBase.FieldByName('ValorTotal').AsFloat);
         end;
      end;
   end;
end;

procedure TfmPedidosCompra.edtPedidoKeyPress(Sender: TObject;
  var Key: Char);
begin
   inherited;
   if not (Key in['0'..'9',Chr(8)]) then Key:=#0;
end;

procedure TfmPedidosCompra.edtCodigoCCExit(Sender: TObject);
begin
   inherited;
   if Trim(edtCodigoCC.Text) <> '' then begin
      tabCentroCusto.Close;
      tabCentroCusto.ParamByName('CodigoCentroCusto').AsString:=edtCodigoCC.Text;
      tabCentroCusto.Open;
   end;
end;

procedure TfmPedidosCompra.btnLocalizarCCClick(Sender: TObject);
begin
   inherited;
   if not Assigned (fmLocalizarCentroCusto) then begin
      Application.CreateForm(TfmLocalizarCentroCusto, fmLocalizarCentroCusto);
      fmLocalizarCentroCusto.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      tabBase.FieldByName('CodigoCentroCusto').AsString:=fmMenu.pubTrans1;
      tabCentroCusto.Close;
      tabCentroCusto.ParamByName('CodigoCentroCusto').AsString:=fmMenu.pubTrans1;
      tabCentroCusto.Open;
   end;
end;

procedure TfmPedidosCompra.Receber1Click(Sender: TObject);
var vNota: string;
    vLocalizacao: real;
    vCnt: Integer;
begin
   inherited;
   if Application.MessageBox('Confirmar Recebimento do Pedido', PChar(Application.Title), 36) = 7 then exit;

   if not Assigned (fmReceberPedidoCompra) then begin
      Application.CreateForm(TfmReceberPedidoCompra, fmReceberPedidoCompra);
      fmReceberPedidoCompra.ShowModal;
   end;

   if (Trim(fmMenu.pubTrans1) <> '') and (Trim(fmMenu.pubTrans2) <> '') then begin
      vNota:=fmMenu.pubTrans1;
      vLocalizacao:=StrToFloat(fmMenu.pubTrans2);


      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT * FROM produtos_movimentos WHERE 0');
      tabChecagens.Open;

      tabUltimasCompras.Close;
      tabUltimasCompras.SQL.Clear;
      tabUltimasCompras.SQL.Add('SELECT * FROM ultimas_compras WHERE 0');
      tabUltimasCompras.Open;

      tabTitulos.Close;
      tabTitulos.SQL.Clear;
      tabTitulos.SQL.Add('SELECT * FROM titulos_pagar WHERE 0');
      tabTitulos.Open;

      tabPedidosCompraProdutos.First;
      while not tabPedidosCompraProdutos.Eof do begin

         tabChecagens.Append;
         tabChecagens.FieldByName('Documento').AsFloat:=CodeGenerator('produtos_movimentos', 'Documento');
         tabChecagens.FieldByName('TipoMovimento').AsInteger:=1;
         tabChecagens.FieldByName('Data').AsDateTime:=Date;
         tabChecagens.FieldByName('CodigoProduto').AsString:=tabPedidosCompraProdutos.FieldByName('CodigoProduto').AsString;
         tabChecagens.FieldByName('Descricao').AsString:=tabPedidosCompraProdutos.FieldByName('Descricao').AsString;
         tabChecagens.FieldByName('Quantidade').AsFloat:=tabPedidosCompraProdutos.FieldByName('Quantidade').AsFloat;
         tabChecagens.FieldByName('Referencia').AsFloat:=tabBase.FieldByName('Pedido').AsFloat;
         tabChecagens.FieldByName('ReferenciaDesc').AsString:='Pedido de Compra';
         tabChecagens.Post;
         tabChecagens.ApplyUpdates;

         tabUltimasCompras.Append;
         tabUltimasCompras.FieldByName('ID').AsFloat:=CodeGenerator('ultimas_compras', 'ID');
         tabUltimasCompras.FieldByName('CodigoProduto').AsString:=tabPedidosCompraProdutos.FieldByName('CodigoProduto').AsString;;
         tabUltimasCompras.FieldByName('CodigoFornecedor').AsFloat:=tabBase.FieldByName('CodigoFornecedor').AsFloat;
         tabUltimasCompras.FieldByName('CodigoFuncionario').AsFloat:=tabBase.FieldByName('CodigoFuncionario').AsFloat;
         tabUltimasCompras.FieldByName('Documento').AsFloat:=tabBase.FieldByName('Pedido').AsFloat;
         tabUltimasCompras.FieldByName('DataCompra').AsDateTime:=tabBase.FieldByName('Data').AsDateTime;
         tabUltimasCompras.FieldByName('ValorCompra').AsFloat:=tabPedidosCompraProdutos.FieldByName('Valor').AsFloat;
         tabUltimasCompras.FieldByName('Quantidade').AsFloat:=tabPedidosCompraProdutos.FieldByName('Quantidade').AsFloat;
         tabUltimasCompras.Post;
         tabUltimasCompras.ApplyUpdates;

         tabProdutosFornecedores.Close;
         tabProdutosFornecedores.SQL.Clear;
         tabProdutosFornecedores.SQL.Add('SELECT * FROM produtos_fornecedores');
         tabProdutosFornecedores.SQL.Add('WHERE CodigoProduto = '+QuotedStr(tabPedidosCompraProdutos.FieldByName('CodigoProduto').AsString));
         tabProdutosFornecedores.SQL.Add('AND CodigoFornecedor = '+tabBase.FieldByName('CodigoFornecedor').AsString);
         tabProdutosFornecedores.Open;
         if tabProdutosFornecedores.RecordCount = 0 then begin
            tabProdutosFornecedores.Append;
            tabProdutosFornecedores.FieldByName('CodigoProduto').AsString:=tabPedidosCompraProdutos.FieldByName('CodigoProduto').AsString;
            tabProdutosFornecedores.FieldByName('CodigoFornecedor').AsFloat:=tabBase.FieldByName('CodigoFornecedor').AsFloat;
            tabProdutosFornecedores.Post;
            tabProdutosFornecedores.ApplyUpdates;
         end;

         tabPedidosCompraProdutos.Next;
      end;

      tabPedidosVencto.First;
      for vCnt:=1 to 12 do begin
         if not tabPedidosVencto.FieldByName('DataVencto'+IntToStr(vCnt)).IsNull then begin
            tabTitulos.Append;
            tabTitulos.FieldByName('Titulo').AsFloat:=CodeGenerator('titulos_pagar', 'Titulo');
            tabTitulos.FieldByName('CodigoConta').AsFloat:=tabBase.FieldByName('CodigoFornecedor').AsFloat;
            tabTitulos.FieldByName('Documento').AsFloat:=tabBase.FieldByName('Pedido').AsFloat;
            tabTitulos.FieldByName('Parcela').AsInteger:=vCnt;
            tabTitulos.FieldByName('TipoConta').AsString:='1';
            tabTitulos.FieldByName('CodigoCentroCusto').AsString:=tabBase.FieldByName('CodigoCentroCusto').AsString;
            tabTitulos.FieldByName('Observacao').AsString:=tabBase.FieldByName('Observacao').AsString;
            tabTitulos.FieldByName('DescricaoConta').Value:='Fornecedor';
            tabTitulos.FieldByName('ValorTotal').AsFloat:=tabPedidosVencto.FieldByName('Valor'+IntToStr(vCnt)).AsFloat;
            tabTitulos.FieldByName('DataVencimento').AsDateTime:=tabPedidosVencto.FieldByName('DataVencto'+IntToStr(vCnt)).AsDateTime;
            tabTitulos.FieldByName('NotaFiscal').AsString:=vNota;
            tabTitulos.FieldByName('DataEmissao').AsDateTime:=tabBase.FieldByName('Data').AsDateTime;
            tabTitulos.FieldByName('CodigoEmpresa').AsFloat:=tabBase.FieldByName('CodigoEmpresa').AsFloat;
            tabTitulos.FieldByName('CodigoLocalizacao').AsFloat:=vLocalizacao;
            tabTitulos.Post;
            tabTitulos.ApplyUpdates;
         end;
      end;

      tabBase.Edit;
      tabBase.FieldByName('DataRecebimento').AsDateTime:=Date;
      tabBase.FieldByName('NotaFiscal').AsString:=vNota;
      tabBase.Post;
      tabBase.ApplyUpdates;

      Application.ProcessMessages;

      tabPedidosCompraProdutos.First;
      while not tabPedidosCompraProdutos.Eof do begin
         fmMenu.AtualizaEstoque(tabPedidosCompraProdutos.FieldByName('CodigoProduto').AsString);
         Application.ProcessMessages;
         tabPedidosCompraProdutos.Next;
      end;

      tabChecagens.Close;
      tabUltimasCompras.Close;

      ShowMessage('Baixa Concluida com Sucesso.');
   end;
end;

procedure TfmPedidosCompra.btnOpcoesClick(Sender: TObject);
begin
   if tabBase.FieldByName('DataRecebimento').IsNull then begin
      Receber1.Enabled:=True;
    end
   else begin
      Receber1.Enabled:=False;
   end;
   inherited;
end;

procedure TfmPedidosCompra.edtCodigoFornecedorExit(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtCodigoFornecedor.Text) <> '' then begin
         tabFornecedor.Close;
         tabFornecedor.ParamByName('CodigoFornecedor').AsFloat:=StrToFloat(edtCodigoFornecedor.Text);
         tabFornecedor.Open;
      end;
   end;
end;

procedure TfmPedidosCompra.btnLocalizarClick(Sender: TObject);
begin
   inherited;
   if not Assigned (fmLocalizarPedidosCompra) then begin
      Application.CreateForm(TfmLocalizarPedidosCompra, fmLocalizarPedidosCompra);
      fmLocalizarPedidosCompra.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      tabBase.Close;
      tabBase.ParamByName('Pedido').AsFloat:=StrToFloat(fmMenu.pubTrans1);
      tabBase.Open;
   end;
end;

procedure TfmPedidosCompra.btnExcluirClick(Sender: TObject);
var vPedido : string;
    vtabPedidosCompraProdutos, vTabPediProdMovi,
    vTabPediCompProd, vTabUltimasCompras, vTabTitulos : TZQuery;
begin
  // Se não há registro não continua
  if tabBase.RecordCount = 0 then begin
    ShowMessage('Nenhum Registro Cadastrado');
    exit;
  end;

  // Pega o código do pedido
  vPedido := tabBase.FieldByName('Pedido').AsString;

  // Se não quer excluir, desaparece
  if Application.MessageBox('Deseja realmente Excluir o Registro?', PChar(Application.Title), 36) = 7 then exit;

  // produtos_movimentos
  vTabPediProdMovi            := TZQuery.Create(nil);
  vTabPediProdMovi.Connection := fmMenu.zcnConexao;
  vTabPediProdMovi.SQL.Add('Delete from produtos_movimentos where Referencia = ' + vPedido);
  vTabPediProdMovi.ExecSQL;

  // Seleciona todos os produtos da compra
  vTabPediCompProd            := TZQuery.Create(nil);
  vTabPediCompProd.Connection := fmMenu.zcnConexao;
  vTabPediCompProd.SQL.Add('SELECT * FROM pedidos_compra_produtos WHERE Pedido = ' + vPedido);
  vTabPediCompProd.Open;
  
  vTabPediCompProd.First;
  while not vTabPediCompProd.Eof do begin
    fmMenu.AtualizaEstoque(vTabPediCompProd.FieldByName('CodigoProduto').AsString);
    Application.ProcessMessages;
    vTabPediCompProd.Next;
  end;

  // Exclui ultimas_compras
  vTabUltimasCompras            := TZQuery.Create(nil);
  vTabUltimasCompras.Connection := fmMenu.zcnConexao;
  vTabUltimasCompras.SQL.Add('delete from ultimas_compras WHERE documento=' + vPedido);
  vTabUltimasCompras.ExecSQL;

  // Exclui titulos_pagar
  vTabTitulos            := TZQuery.Create(nil);
  vTabTitulos.Connection := fmMenu.zcnConexao;
  vTabTitulos.SQL.Add('SELECT * FROM titulos_pagar WHERE documento=' + vPedido);
  vTabTitulos.ExecSQL;

  // exclui pedidos_compra_produtos e pedidos_compra_vencimentos
  Deletar;

  tabBase.Delete;
  tabBase.ApplyUpdates;

  // inherited;
end;

end.

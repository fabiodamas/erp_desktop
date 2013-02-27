unit uGerarPackingList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, Grids, DBGrids, Mask, ToolEdit,
  CurrEdit, Buttons, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  DBClient, Menus;

type
  TfmGerarPackingList = class(TfmFormBaseAvancado)
    dbgProdutos: TDBGrid;
    Label1: TLabel;
    edtCaixaNumero: TEdit;
    Label2: TLabel;
    edtCodigo: TEdit;
    Label3: TLabel;
    dbgPackingList: TDBGrid;
    edtCodigoProduto: TEdit;
    edtDescricaoProduto: TEdit;
    edtQuantidadeProduto: TCurrencyEdit;
    btnProdutoAdicionar: TBitBtn;
    btnProdutoRemover: TBitBtn;
    btnConfirmar: TBitBtn;
    btnFechar: TBitBtn;
    tabPedidosProdutos: TZQuery;
    dtsPedidosProdutos: TDataSource;
    tabAuxPackingList: TClientDataSet;
    tabAuxPackingListCaixaNum: TIntegerField;
    tabAuxPackingListCodigoCaixa: TStringField;
    tabAuxPackingListCodigoProduto: TStringField;
    tabAuxPackingListDescricaoProduto: TStringField;
    tabAuxPackingListQuantidade: TFloatField;
    dtsAuxPackingList: TDataSource;
    tabPedidos: TZQuery;
    tabPackingList: TZQuery;
    tabPackingListProdutos: TZQuery;
    tabAuxCaixas: TClientDataSet;
    tabAuxCaixasCaixaNum: TIntegerField;
    tabAuxPackingListPeso: TFloatField;
    edtPeso: TCurrencyEdit;
    tabAuxProdutos: TClientDataSet;
    dtsAuxProdutos: TDataSource;
    tabAuxProdutosCodigoProduto: TStringField;
    tabAuxProdutosQuantidade: TFloatField;
    tabAuxProdutosDescricao: TStringField;
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgProdutosCellClick(Column: TColumn);
    procedure btnProdutoAdicionarClick(Sender: TObject);
    procedure btnProdutoRemoverClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    FPedido: string;
  public
    { Public declarations }
  end;

var
  fmGerarPackingList: TfmGerarPackingList;

implementation

uses uFormBase, uFuncoes, uMenu, rPackingList;

{$R *.dfm}

procedure TfmGerarPackingList.btnFecharClick(Sender: TObject);
begin
   inherited;
   Close;
end;

procedure TfmGerarPackingList.FormShow(Sender: TObject);
begin
   inherited;

   FPedido:=fmMenu.pubTrans1;

   tabAuxPackingList.CreateDataSet;
   tabAuxPackingList.EmptyDataSet;

   tabAuxProdutos.CreateDataSet;
   tabAuxProdutos.EmptyDataSet;
   tabAuxProdutos.IndexFieldNames:='CodigoProduto';

   tabAuxCaixas.CreateDataSet;
   tabAuxCaixas.EmptyDataSet;
   tabAuxCaixas.IndexFieldNames:='CaixaNum';

   if Trim(FPedido) <> '' then begin
      tabPedidosProdutos.SQL.Add('SELECT CodigoProduto, Descricao, Quantidade');
      tabPedidosProdutos.SQL.Add('FROM pedidos_produtos');
      tabPedidosProdutos.SQL.Add('WHERE NPedido = '+FPedido);
      tabPedidosProdutos.Open;

      tabPedidosProdutos.First;
      while not tabPedidosProdutos.Eof do begin

         tabAuxProdutos.Append;
         tabAuxProdutosCodigoProduto.Value:=tabPedidosProdutos.FieldByName('CodigoProduto').AsString;
         tabAuxProdutosDescricao.Value:=tabPedidosProdutos.FieldByName('Descricao').AsString;
         tabAuxProdutosQuantidade.Value:=tabPedidosProdutos.FieldByName('Quantidade').AsFloat;
         tabAuxProdutos.Post; 

         tabPedidosProdutos.Next; 
      end;

      tabPackingListProdutos.Close;
      tabPackingListProdutos.SQL.Clear;
      tabPackingListProdutos.SQL.Add('SELECT * FROM packing_list_produtos WHERE Pedido = '+FPedido);
      tabPackingListProdutos.Open;
      tabPackingListProdutos.First;
      while not tabPackingListProdutos.Eof do begin

         tabAuxPackingList.Append;
         tabAuxPackingListCaixaNum.Value:=tabPackingListProdutos.FieldByName('CaixaNum').AsInteger;
         tabAuxPackingListCodigoCaixa.Value:=tabPackingListProdutos.FieldByName('CodigoCaixa').AsString;
         tabAuxPackingListCodigoProduto.Value:=tabPackingListProdutos.FieldByName('CodigoProduto').AsString;
         tabAuxPackingListDescricaoProduto.Value:=tabPackingListProdutos.FieldByName('Descricao').AsString;
         tabAuxPackingListQuantidade.Value:=tabPackingListProdutos.FieldByName('Quantidade').AsFloat;
         tabAuxPackingListPeso.Value:=tabPackingListProdutos.FieldByName('Peso').AsFloat;
         tabAuxPackingList.Post;

         if tabAuxProdutos.FindKey([tabAuxPackingListCodigoProduto.Value]) then begin
            tabAuxProdutos.Edit;
            tabAuxProdutosQuantidade.Value:=tabAuxProdutosQuantidade.Value - tabAuxPackingListQuantidade.Value;
            tabAuxProdutos.Post;
            if tabAuxProdutosQuantidade.Value <= 0 then tabAuxProdutos.Delete;
         end;

         tabPackingListProdutos.Next;
      end;
   end;
end;

procedure TfmGerarPackingList.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TfmGerarPackingList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabPedidosProdutos.Close;
   tabAuxPackingList.Close;
   tabPedidos.Close;
   tabPackingList.Close;
   tabPackingListProdutos.Close;
   tabAuxCaixas.Close;
   tabAuxProdutos.Close;
   inherited;
end;

procedure TfmGerarPackingList.dbgProdutosCellClick(Column: TColumn);
begin
   inherited;
   edtCodigoProduto.Text:=tabAuxProdutosCodigoProduto.Value;
   edtDescricaoProduto.Text:=tabAuxProdutosDescricao.Value;
   edtQuantidadeProduto.Value:=tabAuxProdutosQuantidade.Value;
end;

procedure TfmGerarPackingList.btnProdutoAdicionarClick(Sender: TObject);
begin
   inherited;
   if Trim(edtCaixaNumero.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Numero da Caixa');
      edtCaixaNumero.SetFocus;
      exit;
   end;
   if Trim(edtCodigoProduto.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Código do Produto');
      edtCodigoProduto.SetFocus;
      exit;
   end;
   tabAuxPackingList.Append; 
   tabAuxPackingListCaixaNum.Value:=StrToInt(edtCaixaNumero.Text);
   tabAuxPackingListCodigoCaixa.Value:=edtCodigo.Text;
   tabAuxPackingListCodigoProduto.Value:=edtCodigoProduto.Text;
   tabAuxPackingListDescricaoProduto.Value:=edtDescricaoProduto.Text;
   tabAuxPackingListQuantidade.Value:=edtQuantidadeProduto.Value;
   tabAuxPackingListPeso.Value:=edtPeso.Value;
   tabAuxPackingList.Post;
   if tabAuxProdutos.FindKey([tabAuxPackingListCodigoProduto.Value]) then begin
      tabAuxProdutos.Edit;
      tabAuxProdutosQuantidade.Value:=tabAuxProdutosQuantidade.Value-tabAuxPackingListQuantidade.Value;
      tabAuxProdutos.Post;
      if tabAuxProdutosQuantidade.Value <= 0 then tabAuxProdutos.Delete;
   end; 
end;

procedure TfmGerarPackingList.btnProdutoRemoverClick(Sender: TObject);
var vProduto, vDesc : string;
    vQtd : real;
begin
   inherited;
   if tabAuxPackingList.RecordCount > 0 then begin
      if Application.MessageBox('Deseja Realmente Excluir o Produto?', PChar(Application.Title), 36) = 7 then exit;
      vProduto:=tabAuxPackingListCodigoProduto.Value;
      vDesc:=tabAuxPackingListDescricaoProduto.Value;
      vQtd:=tabAuxPackingListQuantidade.Value;
      tabAuxPackingList.Delete;
      if tabAuxProdutos.FindKey([vProduto]) then begin
         tabAuxProdutos.Edit;
         tabAuxProdutosQuantidade.Value:=tabAuxProdutosQuantidade.Value + vQtd; 
         tabAuxProdutos.Post;
       end
      else begin
         tabAuxProdutos.Append;
         tabAuxProdutosCodigoProduto.Value:=vProduto;
         tabAuxProdutosDescricao.Value:=vDesc;
         tabAuxProdutosQuantidade.Value:=tabAuxProdutosQuantidade.Value + vQtd;
         tabAuxProdutos.Post;
      end;
   end;
end;

procedure TfmGerarPackingList.btnConfirmarClick(Sender: TObject);
var vQtdProd, vQtdAux : real;
    vQtdCaixa : Integer;
    vRT: TrtPackingList;
begin
   inherited;
   vQtdProd:=0;
   vQtdAux:=0;
   vQtdCaixa:=0;
   tabAuxCaixas.EmptyDataSet;
   if tabAuxPackingList.RecordCount > 0 then begin

      tabAuxPackingList.First;
      while not tabAuxPackingList.Eof do begin
         vQtdAux:=vQtdAux + tabAuxPackingListQuantidade.Value;      
         tabAuxPackingList.Next;
      end;

      tabPedidosProdutos.First;
      while not tabPedidosProdutos.Eof do begin
         vQtdProd:=vQtdProd + tabPedidosProdutos.FieldByName('Quantidade').AsFloat;
         tabPedidosProdutos.Next;
      end;

      if RoundReal(vQtdProd, 2) <> RoundReal(vQtdAux, 2) then begin
         ShowMessage('Quantidades Incompativeis');
         exit;
      end;

      tabPedidos.Close;
      tabPedidos.SQL.Clear;
      tabPedidos.SQL.Add('SELECT * FROM pedidos WHERE NPedido = '+FPedido);
      tabPedidos.Open;

      tabPackingList.Close;
      tabPackingList.SQL.Clear;
      tabPackingList.SQL.Add('SELECT * FROM packing_list WHERE Pedido = '+FPedido);
      tabPackingList.Open;

      if tabPackingList.RecordCount = 0 then begin
         tabPackingList.Append;
         tabPackingList.FieldByName('Pedido').AsFloat:=StrToFloat(FPedido);
       end
      else begin
         tabPackingList.Edit;
      end;

      tabPackingList.FieldByName('Data').AsDateTime:=Date;
      tabPackingList.FieldByName('Hora').AsDateTime:=Now;
      tabPackingList.FieldByName('CodigoCliente').AsFloat:=tabPedidos.FieldByName('CodigoCliente').AsFloat;
      tabPackingList.FieldByName('CodigoTransportadora').AsFloat:=tabPedidos.FieldByName('CodigoTransportadora').AsFloat;
      tabPackingList.FieldByName('ValorDesconto').AsFloat:=tabPedidos.FieldByName('ValorDesconto').AsFloat;
      tabPackingList.FieldByName('ValorProdutos').AsFloat:=tabPedidos.FieldByName('ValorProdutos').AsFloat;
      tabPackingList.FieldByName('ValorTotal').AsFloat:=tabPedidos.FieldByName('ValorTotal').AsFloat;
      tabPackingList.Post;
      tabPackingList.ApplyUpDates;

      tabPackingListProdutos.Close;
      tabPackingListProdutos.SQL.Clear;
      tabPackingListProdutos.SQL.Add('DELETE FROM packing_list_produtos WHERE Pedido = '+FPedido);
      tabPackingListProdutos.ExecSQL;

      tabPackingListProdutos.Close;
      tabPackingListProdutos.SQL.Clear;
      tabPackingListProdutos.SQL.Add('SELECT * FROM packing_list_produtos WHERE 0');
      tabPackingListProdutos.Open;

      tabAuxPackingList.First;
      while not tabAuxPackingList.Eof do begin

         tabPackingListProdutos.Append;
         tabPackingListProdutos.FieldByName('ID').AsFloat:=CodeGenerator('packing_list_produtos', 'ID');
         tabPackingListProdutos.FieldByName('Pedido').AsFloat:=StrToFloat(FPedido);
         tabPackingListProdutos.FieldByName('CodigoProduto').AsString:=tabAuxPackingListCodigoProduto.Value;
         tabPackingListProdutos.FieldByName('CaixaNum').AsInteger:=tabAuxPackingListCaixaNum.Value;
         tabPackingListProdutos.FieldByName('Quantidade').AsFloat:=tabAuxPackingListQuantidade.Value;
         tabPackingListProdutos.FieldByName('Descricao').AsString:=tabAuxPackingListDescricaoProduto.Value;
         tabPackingListProdutos.FieldByName('CodigoCaixa').AsString:=tabAuxPackingListCodigoCaixa.Value;
         tabPackingListProdutos.FieldByName('Peso').AsFloat:=tabAuxPackingListPeso.Value; 
         tabPackingListProdutos.Post;
         tabPackingListProdutos.ApplyUpDates; 

         if not tabAuxCaixas.FindKey([tabAuxPackingListCaixaNum.Value]) then begin
            vQtdCaixa:= vQtdCaixa + 1;
            tabAuxCaixas.Append;
            tabAuxCaixasCaixaNum.Value:=tabAuxPackingListCaixaNum.Value;
            tabAuxCaixas.Post;
         end;

         tabAuxPackingList.Next;
      end; 

      tabPedidos.Edit;
      tabPedidos.FieldByName('QtdCaixas').AsInteger:=vQtdCaixa;
      tabPedidos.Post;
      tabPedidos.ApplyUpdates;

      if Application.MessageBox('Visualizar Packing List?', PChar(Application.Title), 36) = 7 then begin
         Close;
       end
      else begin
         fmMenu.pubTrans1:=FPedido;
         vRT:=TrtPackingList.Create(Self);
         vRT.Show;
      end;
   end;
end;

end.

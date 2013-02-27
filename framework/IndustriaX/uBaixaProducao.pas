unit uBaixaProducao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, Grids, DBGrids, StdCtrls, Buttons, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, Menus;

type
  TfmBaixaProducao = class(TfmFormBaseAvancado)
    dbgBaixa: TDBGrid;
    btnBaixar: TBitBtn;
    btnFechar: TBitBtn;
    tabBase: TZQuery;
    dtsBase: TDataSource;
    tabAuxProdutos: TClientDataSet;
    dtsAuxProdutos: TDataSource;
    tabAuxProdutosCodigoProduto: TStringField;
    tabAuxProdutosDescricao: TStringField;
    tabAuxProdutosQuantidade: TFloatField;
    tabAuxProdutosStatus: TStringField;
    tabPedidos: TZQuery;
    tabPedidosProdutos: TZQuery;
    dtsPedidos: TDataSource;
    tabAuxProdutosSelecionar: TBooleanField;
    btnSelecionarTodos: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBaixarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure btnSelecionarTodosClick(Sender: TObject);
    procedure dbgBaixaCellClick(Column: TColumn);
  private
    FPedido: string;
  public
    procedure DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  end;

var
  fmBaixaProducao: TfmBaixaProducao;

implementation

uses uFormBase, uMenu;

{$R *.dfm}

procedure TfmBaixaProducao.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TfmBaixaProducao.FormShow(Sender: TObject);
begin
   inherited;

   dbgBaixa.OnDrawColumnCell:=DrawColumnCell;

   FPedido:=fmMenu.pubTrans1;
   tabAuxProdutos.CreateDataSet;
   tabAuxProdutos.EmptyDataSet;
   if Trim(FPedido) <> '' then begin
      tabBase.SQL.Add('SELECT * ');
      tabBase.SQL.Add('FROM pedidos_produtos');
      tabBase.SQL.Add('WHERE pedidos_produtos.NPedido = '+FPedido);
      tabBase.SQL.Add('AND pedidos_produtos.DataProducao IS NULL');      
      tabBase.Open;
      tabBase.First;
      while not tabBase.Eof do begin
         Application.ProcessMessages;
         tabAuxProdutos.Append;
         tabAuxProdutosCodigoProduto.Value:=tabBase.FieldByName('CodigoProduto').AsString;
         tabAuxProdutosDescricao.Value:=tabBase.FieldByName('Descricao').AsString;
         tabAuxProdutosQuantidade.Value:=tabBase.FieldByName('Quantidade').AsFloat;
         tabAuxProdutosSelecionar.Value:=False;
         tabAuxProdutos.Post;
         tabBase.Next;
      end;
   end;
   tabAuxProdutos.First;
end;

procedure TfmBaixaProducao.btnBaixarClick(Sender: TObject);
var vBaixaTotal : boolean;
begin
   inherited;
   if tabAuxProdutos.RecordCount > 0 then begin
      //dbgBaixa.DataSource:=nil;
      try
         vBaixaTotal:=True;

         tabAuxProdutos.First;
         while not tabAuxProdutos.Eof do begin

            Application.ProcessMessages;

            if tabAuxProdutosSelecionar.Value = True then begin

               tabAuxProdutos.Edit;
               if tabAuxProdutosQuantidade.Value <= fmMenu.CalculaEstoque(tabAuxProdutosCodigoProduto.Value) then begin
                  tabAuxProdutosStatus.Value:='Baixado.';

                  tabPedidosProdutos.Close;
                  tabPedidosProdutos.SQL.Clear;
                  tabPedidosProdutos.SQL.Add('SELECT * FROM pedidos_produtos WHERE NPedido = '+QuotedStr(FPedido)+' AND CodigoProduto = '+QuotedStr(tabAuxProdutosCodigoProduto.Value));      
                  tabPedidosProdutos.Open;

                  tabPedidosProdutos.First;
                  while not tabPedidosProdutos.Eof do begin

                     Application.ProcessMessages;                     
                     tabPedidosProdutos.Edit;
                     tabPedidosProdutos.FieldByName('DataProducao').AsDateTime:=Date;
                     tabPedidosProdutos.Post;
                     tabPedidosProdutos.ApplyUpdates;
                     fmMenu.AtualizaEstoque(tabPedidosProdutos.FieldByName('CodigoProduto').AsString);

                     tabPedidosProdutos.Next;
                  end;
                end
               else begin
                  vBaixaTotal:=False;
                  tabAuxProdutosStatus.Value:='Sem Saldo (Não Baixado).';
               end;
               tabAuxProdutos.Post;
             end
            else begin
               vBaixaTotal:=False;
               tabAuxProdutos.Edit;
               tabAuxProdutosStatus.Value:='(Não Baixado)';
               tabAuxProdutos.Post; 
            end;

            tabAuxProdutos.Next;
         end;

         if vBaixaTotal = True then begin
            try
               tabPedidos.Close;
               tabPedidos.SQL.Clear;
               tabPedidos.SQL.Add('SELECT * FROM pedidos WHERE NPedido = '+FPedido);
               tabPedidos.Open;

               tabPedidos.Edit;
               tabPedidos.FieldByName('DataProducao').AsDateTime:=Date;
               tabPedidos.FieldByName('HoraProducao').AsDateTime:=Now;
               tabPedidos.Post;
               tabPedidos.ApplyUpDates; 

               tabPedidosProdutos.Close;
               tabPedidosProdutos.SQL.Clear;
               tabPedidosProdutos.SQL.Add('SELECT * FROM pedidos_produtos WHERE NPedido = '+FPedido);
               tabPedidosProdutos.Open;
               
               tabPedidosProdutos.First;
               while not tabPedidosProdutos.Eof do begin 

                  if tabPedidosProdutos.FieldByName('DataProducao').IsNull then begin
                     tabPedidosProdutos.Edit; 
                     tabPedidosProdutos.FieldByName('DataProducao').AsDateTime:=Date;
                     tabPedidosProdutos.POst;
                     tabPedidosProdutos.ApplyUpdates;
                  end;
                  
                  Application.ProcessMessages;
                  fmMenu.AtualizaEstoque(tabPedidosProdutos.FieldByName('CodigoProduto').AsString);
               
                  tabPedidosProdutos.Next;
               end;
            finally
               tabPedidosProdutos.Close; 
               tabPedidos.Close;
            end;

            ShowMessage('Pedido '+FPedido+' Baixado com Sucesso.');
            Close;  
         end;
      finally
      end;
   end;
end;

procedure TfmBaixaProducao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabAuxProdutos.Close;
   tabBase.Close;
   tabPedidos.Close;
   inherited;
end;

procedure TfmBaixaProducao.btnFecharClick(Sender: TObject);
begin
   inherited;
   Close;
end;

procedure TfmBaixaProducao.btnSelecionarTodosClick(Sender: TObject);
begin
   inherited;
   tabAuxProdutos.First;
   while not tabAuxProdutos.Eof do begin

      tabAuxProdutos.Edit;
      tabAuxProdutosSelecionar.Value:=True;
      tabAuxProdutos.Post;

      tabAuxProdutos.Next;
   end;
end;

procedure TfmBaixaProducao.dbgBaixaCellClick(Column: TColumn);
begin
   inherited;
   if Column.FieldName = 'Selecionar' then begin
      tabAuxProdutos.Edit;
      if tabAuxProdutosSelecionar.Value = True then begin
         tabAuxProdutosSelecionar.Value:=False;
       end
      else begin
         tabAuxProdutosSelecionar.Value:=True;
      end;
      tabAuxProdutos.Post;
   end;
end;

procedure TfmBaixaProducao.DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var vCheck : Integer;
    R : TRect;
begin
   inherited;
   if Column.FieldName = 'Selecionar' then begin
      dbgBaixa.Canvas.FillRect(Rect);
      if tabAuxProdutosSelecionar.Value = True then vCheck := DFCS_CHECKED else vCheck := 0;
      R:=Rect;
      InflateRect(R, -2, -2); {Diminue o tamanho do CheckBox}
      DrawFrameControl(dbgBaixa.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or vCheck);
   end;
end;

end.

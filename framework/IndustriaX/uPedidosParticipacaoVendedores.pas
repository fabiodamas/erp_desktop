unit uPedidosParticipacaoVendedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, StdCtrls, DBCtrls, Grids, DBGrids, Buttons, Mask, ToolEdit,
  CurrEdit;

type
  TfmPedidosParticipacaoVendedores = class(TfmFormBaseAvancado)
    tabPedidos: TZQuery;
    Label1: TLabel;
    edtPedido: TEdit;
    edtVendedor: TDBLookupComboBox;
    Label2: TLabel;
    tabVendedores: TZQuery;
    dtsVendedores: TDataSource;
    dbgParticipacao: TDBGrid;
    dtsPedidos: TDataSource;
    btnRemover: TBitBtn;
    btnAdicionar: TBitBtn;
    edtObservacao: TEdit;
    Label3: TLabel;
    edtValorDesconto: TCurrencyEdit;
    Label4: TLabel;
    tabChecagens: TZQuery;
    btnFechar: TBitBtn;
    edtCodigoVendedor: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure edtVendedorCloseUp(Sender: TObject);
    procedure edtCodigoVendedorExit(Sender: TObject);
    procedure edtPedidoChange(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  fmPedidosParticipacaoVendedores: TfmPedidosParticipacaoVendedores;

implementation

uses uFormBase, uMenu;

{$R *.dfm}

procedure TfmPedidosParticipacaoVendedores.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TfmPedidosParticipacaoVendedores.FormShow(Sender: TObject);
begin
   inherited;

   tabPedidos.Params.CreateParam(ftFloat, 'NPedido', ptUnknown);
   tabPedidos.SQL.Add('SELECT pedidos_part_func.NPedido, pedidos_part_func.ValorDesconto, pedidos_part_func.CodigoFuncionario AS CodVend, funcionarios.Nome As Vendedor, pedidos_part_func.Observacao');
   tabPedidos.SQL.Add('FROM pedidos_part_func');
   tabPedidos.SQL.Add('LEFT JOIN funcionarios ON funcionarios.Codigo = pedidos_part_func.CodigoFuncionario');
   tabPedidos.SQL.Add('WHERE pedidos_part_func.NPedido = :NPedido');
   tabPedidos.Open;

   edtPedido.Text:=fmMenu.pubTrans1;

   tabVendedores.SQL.Add('SELECT Codigo,Nome FROM funcionarios WHERE DataSaida IS NULL ORDER BY Nome');
   tabVendedores.Open;
end;

procedure TfmPedidosParticipacaoVendedores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabPedidos.Close;
   tabVendedores.Close;
   inherited;
end;

procedure TfmPedidosParticipacaoVendedores.btnAdicionarClick(
  Sender: TObject);
begin
   inherited;
   if Trim(edtVendedor.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Vendedor');
      edtVendedor.SetFocus;
      exit;
   end;
   try
      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT * FROM pedidos_part_func WHERE NPedido = '+edtPedido.Text+' AND CodigoFuncionario = '+FloatToStr(edtVendedor.KeyValue));
      tabChecagens.Open;

      if tabChecagens.RecordCount = 1 then begin
         ShowMessage('Vendedor já Incluido no Pedido');
         exit;
       end
      else begin
         tabChecagens.Append;
         tabChecagens.FieldByName('NPedido').AsFloat:=StrToFloat(edtPedido.Text);
         tabChecagens.FieldByName('CodigoFuncionario').AsFloat:=StrToFloat(edtVendedor.KeyValue);
         tabChecagens.FieldByName('ValorDesconto').AsFloat:=edtValorDesconto.Value;
         tabChecagens.FieldByName('Observacao').AsString:=edtObservacao.Text;
         tabChecagens.Post;
         tabChecagens.ApplyUpdates;

         edtVendedor.KeyValue:=NULL;
         edtObservacao.Text:='';
         edtValorDesconto.Value:=0;

         tabPedidos.Close;
         tabPedidos.ParamByName('NPedido').AsFloat:=StrToFloat(edtPedido.Text);
         tabPedidos.Open;

         edtCodigoVendedor.SetFocus;
      end;
   finally
      tabChecagens.Close;
   end;
end;

procedure TfmPedidosParticipacaoVendedores.btnRemoverClick(
  Sender: TObject);
begin
   inherited;
   if tabPedidos.RecordCount > 0 then begin
      if Application.MessageBox('Deseja Realmente Excluir a Participação?', PChar(Application.Title), 36) = 7 then exit;
      try
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT * FROM pedidos_part_func WHERE NPedido = '+edtPedido.Text+' AND CodigoFuncionario = '+tabPedidos.FieldByName('CodVend').AsString);
         tabChecagens.Open;

         if tabChecagens.RecordCount > 0 then begin
            tabChecagens.Delete;
            tabChecagens.ApplyUpdates;

            tabPedidos.Refresh;
         end;
      finally
         tabChecagens.Close;
      end;
   end;
end;

procedure TfmPedidosParticipacaoVendedores.btnFecharClick(Sender: TObject);
begin
   inherited;
   Close;
end;

procedure TfmPedidosParticipacaoVendedores.edtVendedorCloseUp(
  Sender: TObject);
begin
   inherited;
   if Trim(edtVendedor.Text) <> '' then begin
      edtCodigoVendedor.Text:=FloatToStr(edtVendedor.KeyValue);
   end;
end;

procedure TfmPedidosParticipacaoVendedores.edtCodigoVendedorExit(
  Sender: TObject);
begin
   inherited;
   if Trim(edtCodigoVendedor.Text) <> '' then begin
      edtVendedor.KeyValue:=StrToFloat(edtCodigoVendedor.Text);
   end;
end;

procedure TfmPedidosParticipacaoVendedores.edtPedidoChange(
  Sender: TObject);
begin
   inherited;
   if Trim(edtPedido.Text) <> '' then begin
      tabPedidos.Close;
      tabPedidos.ParamByName('NPedido').AsFloat:=StrToFloat(edtPedido.Text);
      tabPedidos.Open;
    end
   else begin
      tabPedidos.Close;
      tabPedidos.ParamByName('NPedido').AsFloat:=0;
      tabPedidos.Open;
   end;
end;

end.

unit uOrcamentoCompras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, DBCtrls, ComCtrls, Grids,
  DBGrids, Mask, ToolEdit, CurrEdit, Buttons, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, DBClient, Menus;

type
  TfmOrcamentoCompras = class(TfmFormBaseAvancado)
    Label1: TLabel;
    edtRequisicao: TEdit;
    Label2: TLabel;
    edtResponsavel: TDBLookupComboBox;
    pgcOrcamentosCompras: TPageControl;
    tbsLancamentos: TTabSheet;
    dbgProdutos: TDBGrid;
    tbsOrcamentos: TTabSheet;
    btnAdicionarOrcamento: TBitBtn;
    dbgOrcamentos: TDBGrid;
    tabResponsavel: TZQuery;
    dtsResponsavel: TDataSource;
    tabChecagens: TZQuery;
    edtOrcamento: TEdit;
    Label3: TLabel;
    edtCodigoFornecedor: TEdit;
    Label4: TLabel;
    edtNomeFornecedor: TEdit;
    btnLocalizarFornecedor: TBitBtn;
    tabAuxProdutos: TClientDataSet;
    tabAuxProdutosCodigoProduto: TStringField;
    tabAuxProdutosDescricao: TStringField;
    tabAuxProdutosQuantidade: TFloatField;
    tabAuxProdutosValor: TCurrencyField;
    dtsAuxProdutos: TDataSource;
    tabRequisicoes: TZQuery;
    dtsRequisicoes: TDataSource;
    tabOrcamentosCompras: TZQuery;
    dtsOrcamentosCompras: TDataSource;
    tabRequisicoesProdutos: TZQuery;
    tabOrcamentosComprasProdutos: TZQuery;
    tabLista: TZQuery;
    dtsLista: TDataSource;
    tabAuxProdutosTotal: TCurrencyField;
    btnOpcoes: TBitBtn;
    popOpcoes: TPopupMenu;
    EmissoFornecedores1: TMenuItem;
    EmissoAprovao1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtRequisicaoExit(Sender: TObject);
    procedure edtCodigoFornecedorChange(Sender: TObject);
    procedure btnLocalizarFornecedorClick(Sender: TObject);
    procedure edtOrcamentoExit(Sender: TObject);
    procedure dtsRequisicoesDataChange(Sender: TObject; Field: TField);
    procedure dtsOrcamentosComprasDataChange(Sender: TObject;
      Field: TField);
    procedure btnAdicionarOrcamentoClick(Sender: TObject);
    procedure tabAuxProdutosCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmOrcamentoCompras: TfmOrcamentoCompras;

implementation

uses uFormBaseConfig, uMenu, uLocalizarGenerico, uTipos, uFuncoes;

{$R *.dfm}

procedure TfmOrcamentoCompras.FormCreate(Sender: TObject);
begin
   // inherited; // * preciso alterar o grid *
   SetFormStyle(fsMDIChild);
end;

procedure TfmOrcamentoCompras.FormShow(Sender: TObject);
begin
   tabLista.Params.CreateParam(ftFloat, 'Documento', ptUnknown);
   tabLista.SQL.Clear;
   tabLista.SQL.Add('SELECT orcamentos_compras_produtos.Orcamento, orcamentos_compras_produtos.CodigoFornecedor,');
   tabLista.SQL.Add('fornecedores.NomeFantasia As Fornecedor, SUM(orcamentos_compras_produtos.Valor*orcamentos_compras_produtos.Quantidade) AS Total');
   tabLista.SQL.Add('FROM orcamentos_compras_produtos');
   tabLista.SQL.Add('LEFT JOIN fornecedores ON orcamentos_compras_produtos.CodigoFornecedor = fornecedores.CodigoFornecedor');
   tabLista.SQL.Add('WHERE orcamentos_compras_produtos.Documento = :Documento');
   tabLista.SQL.Add('GROUP BY orcamentos_compras_produtos.Orcamento, orcamentos_compras_produtos.CodigoFornecedor, fornecedores.NomeFantasia');
   tabLista.Open;

   tabResponsavel.SQL.Add('SELECT Codigo,Nome FROM funcionarios ORDER BY Nome');
   tabResponsavel.Open;

   tabRequisicoesProdutos.Params.CreateParam(ftFloat, 'Documento', ptUnknown);
   tabRequisicoesProdutos.SQL.Add('SELECT * FROM requisicao_compras_produtos WHERE Documento = :Documento');
   tabRequisicoesProdutos.Open;

   tabRequisicoes.Params.CreateParam(ftFloat, 'Documento', ptUnknown);
   tabRequisicoes.SQL.Add('SELECT * FROM requisicao_compras WHERE Documento = :Documento');
   tabRequisicoes.Open;

   tabOrcamentosComprasProdutos.Params.CreateParam(ftFloat, 'Documento', ptUnknown);
   tabOrcamentosComprasProdutos.Params.CreateParam(ftFloat, 'Orcamento', ptUnknown);
   tabOrcamentosComprasProdutos.SQL.Add('SELECT * FROM orcamentos_compras_produtos WHERE Documento = :Documento AND Orcamento = :Orcamento');
   tabOrcamentosComprasProdutos.Open;

   tabAuxProdutos.CreateDataSet;
   tabAuxProdutos.EmptyDataSet;

   inherited; 
end;

procedure TfmOrcamentoCompras.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabResponsavel.Close;
   tabRequisicoes.Close;
   tabRequisicoesProdutos.Close;
   tabAuxProdutos.Close;
   tabOrcamentosCompras.Close;
   tabOrcamentosComprasProdutos.Close;
   tabLista.Close;
   inherited;
end;

procedure TfmOrcamentoCompras.edtRequisicaoExit(Sender: TObject);
begin
   inherited;
   if Trim(edtRequisicao.Text) <> '' then begin
      tabRequisicoes.Close;
      tabRequisicoes.ParamByName('Documento').AsFloat:=StrToFloat(edtRequisicao.Text);
      tabRequisicoes.Open;

      tabLista.Close;
      tabLista.ParamByName('Documento').AsFloat:=StrToFloat(edtRequisicao.Text);
      tabLista.Open;
   end;
end;

procedure TfmOrcamentoCompras.edtCodigoFornecedorChange(Sender: TObject);
begin
   inherited;
   try
      if Trim(edtCodigoFornecedor.Text) <> '' then begin
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT NomeFantasia FROM fornecedores WHERE CodigoFornecedor = '+edtCodigoFornecedor.Text);
         tabChecagens.Open;
         if tabChecagens.RecordCount > 0 then begin
            edtNomeFornecedor.Text:=tabChecagens.FieldByName('NomeFantasia').AsString;
          end
         else begin
            edtNomeFornecedor.Text:='';
         end;
       end
      else begin
         edtNomeFornecedor.Text:='';
      end;
   finally
      tabChecagens.Close;
   end;
end;

procedure TfmOrcamentoCompras.btnLocalizarFornecedorClick(Sender: TObject);
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
      edtCodigoFornecedor.Text:=fmMenu.pubTrans1;
   end;
end;

procedure TfmOrcamentoCompras.edtOrcamentoExit(Sender: TObject);
begin
   inherited;
   if (Trim(edtOrcamento.Text) <> '') and (Trim(edtRequisicao.Text) <> '') then begin

      tabAuxProdutos.EmptyDataSet;

      tabOrcamentosCompras.Close;
      tabOrcamentosCompras.SQL.Clear;
      tabOrcamentosCompras.SQL.Add('SELECT * FROM orcamentos_compras WHERE Documento = '+edtRequisicao.Text+' AND Orcamento = '+edtOrcamento.Text);
      tabOrcamentosCompras.Open;

      if tabOrcamentosCompras.RecordCount > 0 then begin

         tabOrcamentosComprasProdutos.First;
         edtCodigoFornecedor.Text:=FloatToStr(tabOrcamentosComprasProdutos.FieldByName('CodigoFornecedor').AsFloat);
         while not tabOrcamentosComprasProdutos.Eof do begin

            tabAuxProdutos.Append;
            tabAuxProdutosCodigoProduto.Value:=tabOrcamentosComprasProdutos.FieldByName('CodigoProduto').AsString;
            tabAuxProdutosDescricao.Value:=tabOrcamentosComprasProdutos.FieldByName('Descricao').AsString;
            tabAuxProdutosQuantidade.Value:=tabOrcamentosComprasProdutos.FieldByName('Quantidade').AsFloat;
            tabAuxProdutosValor.Value:=tabOrcamentosComprasProdutos.FieldByName('Valor').AsFloat;
            tabAuxProdutos.Post;

            tabOrcamentosComprasProdutos.Next;
         end;
       end
      else begin
         tabRequisicoesProdutos.First;
         while not tabRequisicoesProdutos.Eof do begin

            tabAuxProdutos.Append;
            tabAuxProdutosCodigoProduto.Value:=tabRequisicoesProdutos.FieldByName('CodigoProduto').AsString;
            tabAuxProdutosDescricao.Value:=tabRequisicoesProdutos.FieldByName('Descricao').AsString;
            tabAuxProdutosQuantidade.Value:=tabRequisicoesProdutos.FieldByName('Quantidade').AsFloat;
            tabAuxProdutosValor.Value:=tabRequisicoesProdutos.FieldByName('Valor').AsFloat;
            tabAuxProdutos.Post;

            tabRequisicoesProdutos.Next;
         end;
      end;
   end;
end;

procedure TfmOrcamentoCompras.dtsRequisicoesDataChange(Sender: TObject;
  Field: TField);
begin
   inherited;
   tabRequisicoesProdutos.Close;
   tabRequisicoesProdutos.ParamByName('Documento').AsFloat:=tabRequisicoes.FieldByName('Documento').AsFloat;
   tabRequisicoesProdutos.Open;
end;

procedure TfmOrcamentoCompras.dtsOrcamentosComprasDataChange(
  Sender: TObject; Field: TField);
begin
   inherited;
   tabOrcamentosComprasProdutos.Close;
   tabOrcamentosComprasProdutos.ParamByName('Documento').AsFloat:=tabOrcamentosCompras.FieldByName('Documento').AsFloat;
   tabOrcamentosComprasProdutos.ParamByName('Orcamento').AsFloat:=tabOrcamentosCompras.FieldByName('Orcamento').AsFloat;
   tabOrcamentosComprasProdutos.Open;
end;

procedure TfmOrcamentoCompras.btnAdicionarOrcamentoClick(Sender: TObject);
begin
   inherited;
   if Trim(edtRequisicao.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Requisição');
      edtRequisicao.SetFocus;
      exit;
   end;
   if Trim(edtOrcamento.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Orçamento');
      edtOrcamento.SetFocus;
      exit;
   end;
   if Trim(edtCodigoFornecedor.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Fornecedor');
      edtCodigoFornecedor.SetFocus;
      exit;
   end;
   if tabAuxProdutos.RecordCount = 0 then begin
      ShowMessage('Obrigatório Preenchimento dos Produtos');
      exit;
   end;
   tabOrcamentosCompras.Close;
   tabOrcamentosCompras.SQL.Clear;
   tabOrcamentosCompras.SQL.Add('SELECT * FROM orcamentos_compras WHERE Documento = '+edtRequisicao.Text+' AND Orcamento = '+edtOrcamento.Text);
   tabOrcamentosCompras.Open;
   
   if tabOrcamentosCompras.RecordCount > 0 then begin
      tabOrcamentosCompras.Edit;
    end
   else begin
      tabOrcamentosCompras.Append; 
      tabOrcamentosCompras.FieldByname('Documento').AsFloat:=StrToFloat(edtRequisicao.Text);
      tabOrcamentosCompras.FieldByname('Orcamento').AsFloat:=StrToFloat(edtOrcamento.Text);
   end;
   tabOrcamentosCompras.FieldByname('CodigoFuncionario').AsFloat:=edtResponsavel.KeyValue;
   tabOrcamentosCompras.Post;
   tabOrcamentosCompras.ApplyUpdates;

   tabOrcamentosComprasProdutos.First;   
   while not tabOrcamentosComprasProdutos.Eof do begin
      if tabOrcamentosComprasProdutos.FieldByName('Orcamento').AsString = edtOrcamento.Text then begin
         tabOrcamentosComprasProdutos.Delete;
         tabOrcamentosComprasProdutos.ApplyUpdates;
         Continue;
      end;
      tabOrcamentosComprasProdutos.Next;
   end;

   tabAuxProdutos.First;
   while not tabAuxProdutos.Eof do begin

      tabOrcamentosComprasProdutos.Append;
      tabOrcamentosComprasProdutos.FieldByName('ID').AsFloat:=CodeGenerator('orcamentos_compras_produtos', 'ID');
      tabOrcamentosComprasProdutos.FieldByName('Documento').AsFloat:=StrToFloat(edtRequisicao.Text);
      tabOrcamentosComprasProdutos.FieldByName('Orcamento').AsFloat:=StrToFloat(edtOrcamento.Text);
      tabOrcamentosComprasProdutos.FieldByName('CodigoFornecedor').AsFloat:=StrToFloat(edtCodigoFornecedor.Text);
      tabOrcamentosComprasProdutos.FieldByName('CodigoProduto').AsString:=tabAuxProdutosCodigoProduto.Value;
      tabOrcamentosComprasProdutos.FieldByName('Descricao').AsString:=tabAuxProdutosDescricao.Value;
      tabOrcamentosComprasProdutos.FieldByName('Quantidade').AsFloat:=tabAuxProdutosQuantidade.Value;
      tabOrcamentosComprasProdutos.FieldByName('Valor').AsFloat:=tabAuxProdutosValor.Value;
      tabOrcamentosComprasProdutos.Post;
      tabOrcamentosComprasProdutos.ApplyUpDates; 
   
      tabAuxProdutos.Next;
   end;

   tabAuxProdutos.EmptyDataSet;

   edtOrcamento.Text:='';
   edtCodigoFornecedor.Text:='';

   tabLista.Close;
   tabLista.ParamByName('Documento').AsFloat:=StrToFloat(edtRequisicao.Text);
   tabLista.Open;
end;

procedure TfmOrcamentoCompras.tabAuxProdutosCalcFields(DataSet: TDataSet);
begin
   inherited;
   tabAuxProdutosTotal.Value:=tabAuxProdutosQuantidade.Value * tabAuxProdutosValor.Value; 
end;

end.

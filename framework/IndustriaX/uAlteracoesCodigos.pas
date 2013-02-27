unit uAlteracoesCodigos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Menus;

type
  TfmAlteracoesCodigos = class(TfmFormBaseAvancado)
    edtTabela: TComboBox;
    Label1: TLabel;
    edtOrigem: TEdit;
    Label2: TLabel;
    edtDestino: TEdit;
    Label3: TLabel;
    btnOK: TButton;
    tabUpDate: TZQuery;
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    procedure UpdateTabela(pTabela, pCampo, pOrigem, pDestino: string);
  public
    { Public declarations }
  end;

var
  fmAlteracoesCodigos: TfmAlteracoesCodigos;

implementation

uses uFormBase, uMenu;

{$R *.dfm}

procedure TfmAlteracoesCodigos.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TfmAlteracoesCodigos.btnOKClick(Sender: TObject);
begin
   inherited;

   if Trim(edtOrigem.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Origem');
      edtOrigem.SetFocus;
      exit;
   end;
   if Trim(edtDestino.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Destino');
      edtDestino.SetFocus; 
      exit;      
   end;

   if edtTabela.Text = 'Centro de Custo' then begin
      UpdateTabela('faturamento', 'CodigoCentroCusto', edtOrigem.Text, edtDestino.Text);
      UpdateTabela('pedidos_compras', 'CodigoCentroCusto', edtOrigem.Text, edtDestino.Text);
      UpdateTabela('titulos_pagar', 'CodigoCentroCusto', edtOrigem.Text, edtDestino.Text);
      UpdateTabela('titulos_receber', 'CodigoCentroCusto', edtOrigem.Text, edtDestino.Text);
      ShowMessage('Centro de Custo Atualizado com Sucesso.');
   end;
   if edtTabela.Text = 'Produtos' then begin
      UpdateTabela('acertos_produtos', 'CodigoProduto', edtOrigem.Text, edtDestino.Text);
      UpdateTabela('aproveitamento', 'CodigoProduto', edtOrigem.Text, edtDestino.Text);
      UpdateTabela('faturamento_produtos', 'CodigoProduto', edtOrigem.Text, edtDestino.Text);
      UpdateTabela('orcamentos_compras_produtos', 'CodigoProduto', edtOrigem.Text, edtDestino.Text);
      UpdateTabela('orcamentos_produtos', 'CodigoProduto', edtOrigem.Text, edtDestino.Text);
      UpdateTabela('ordem_producao_produtos', 'CodigoProduto', edtOrigem.Text, edtDestino.Text);
      UpdateTabela('packing_list_produtos', 'CodigoProduto', edtOrigem.Text, edtDestino.Text);
      UpdateTabela('pedidos_compra_produtos', 'CodigoProduto', edtOrigem.Text, edtDestino.Text);
      UpdateTabela('pedidos_produtos', 'CodigoProduto', edtOrigem.Text, edtDestino.Text);
      UpdateTabela('produtos', 'CodigoProduto', edtOrigem.Text, edtDestino.Text);
      UpdateTabela('produtos_fornecedores', 'CodigoProduto', edtOrigem.Text, edtDestino.Text);
      UpdateTabela('produtos_fotos', 'CodigoProduto', edtOrigem.Text, edtDestino.Text);
      UpdateTabela('produtos_movimentos', 'CodigoProduto', edtOrigem.Text, edtDestino.Text);
      UpdateTabela('produtos_status_estoque', 'CodigoProduto', edtOrigem.Text, edtDestino.Text);
      UpdateTabela('requisicao_compras_produtos', 'CodigoProduto', edtOrigem.Text, edtDestino.Text);
      UpdateTabela('sequencia_producao_produtos', 'CodigoProduto', edtOrigem.Text, edtDestino.Text);
      UpdateTabela('tabela_precos', 'CodigoProduto', edtOrigem.Text, edtDestino.Text);
      UpdateTabela('ultimas_compras', 'CodigoProduto', edtOrigem.Text, edtDestino.Text);
      UpdateTabela('clientes_referencia_produtos', 'CodigoProduto', edtOrigem.Text, edtDestino.Text);
      ShowMessage('Produtos Atualizado com Sucesso.');
   end;
end;

procedure TfmAlteracoesCodigos.UpdateTabela(pTabela, pCampo, pOrigem,
pDestino: string);
begin
   tabUpDate.Close;
   tabUpDate.SQL.Clear;
   tabUpDate.SQL.Add('UPDATE '+pTabela+' SET '+pCampo+' = '+QuotedStr(pDestino));
   tabUpDate.SQL.Add('WHERE '+pCampo+' = '+QuotedStr(pOrigem)); 
   tabUpDate.ExecSQL;
   Application.ProcessMessages;
end;

end.

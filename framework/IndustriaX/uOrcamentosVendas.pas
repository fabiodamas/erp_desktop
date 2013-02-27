unit uOrcamentosVendas;

interface  

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, Menus, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Buttons, ExtCtrls, StdCtrls, Mask, ToolEdit,
  RXDBCtrl, DBCtrls, CurrEdit, Grids, DBGrids, DBClient, QRPDFFilter;

type
  TfmOrcamentosVendas = class(TfmFormBaseCadastro)
    Label1: TLabel;
    edtOrcamento: TEdit;
    edtData: TDBDateEdit;
    Label2: TLabel;
    edtCodigoCliente: TDBEdit;
    edtNomeCliente: TDBEdit;
    edtDataPedido: TDBDateEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btnClientesLocalizar: TBitBtn;
    edtContato: TDBComboBox;
    Label6: TLabel;
    edtTabelaPreco: TDBLookupComboBox;
    Label7: TLabel;
    edtResponsavel: TDBLookupComboBox;
    edtCodigoResponsavel: TDBEdit;
    Label9: TLabel;
    edtEmpresa: TDBLookupComboBox;
    edtCodigoEmpresa: TDBEdit;
    Label8: TLabel;
    btnProdutoAdicionar: TBitBtn;
    btnProdutoRemover: TBitBtn;
    Label10: TLabel;
    edtCodigoProduto: TEdit;
    btnProdutoLocalizar: TBitBtn;
    edtDescricaoProdutos: TEdit;
    Label11: TLabel;
    edtSaldo: TEdit;
    Label12: TLabel;
    edtQuantidade: TCurrencyEdit;
    Label13: TLabel;
    edtValor: TCurrencyEdit;
    Label14: TLabel;
    dbgProdutos: TDBGrid;
    Label15: TLabel;
    edtTransportadora: TDBLookupComboBox;
    edtCodigoTransportadora: TDBEdit;
    Label16: TLabel;
    edtFormaPagto: TDBLookupComboBox;
    edtCodigoFormaPagto: TDBEdit;
    edtParcelas: TDBEdit;
    Label17: TLabel;
    edtPrazoEntrega: TDBEdit;
    Label18: TLabel;
    edtValorProdutos: TDBEdit;
    Label19: TLabel;
    edtValorFrete: TDBEdit;
    Label20: TLabel;
    edtValorAcrescimo: TDBEdit;
    Label21: TLabel;
    edtValorSeguro: TDBEdit;
    Label22: TLabel;
    edtValorDesconto: TDBEdit;
    Label23: TLabel;
    edtPercDesconto: TDBEdit;
    Label24: TLabel;
    edtTotalOrcamento: TDBEdit;
    Label25: TLabel;
    edtObservacoes: TDBMemo;
    Label26: TLabel;
    Label27: TLabel;
    edtHora: TDBEdit;
    tabClientes: TZQuery;
    dtsClientes: TDataSource;
    tabTabelaPreco: TZQuery;
    dtsTabelaPreco: TDataSource;
    tabFuncionarios: TZQuery;
    dtsFuncionarios: TDataSource;
    tabEmpresa: TZQuery;
    dtsEmpresa: TDataSource;
    tabTransportadora: TZQuery;
    dtsTransportadora: TDataSource;
    tabFormasPagto: TZQuery;
    dtsFormasPagto: TDataSource;
    tabOrcamentosProdutos: TZQuery;
    dtsOrcamentosProdutos: TDataSource;
    tabClientesContatos: TZQuery;
    dtsClientesContatos: TDataSource;
    tabChecagens: TZQuery;
    tabAuxiliarProdutos: TClientDataSet;
    tabAuxiliarProdutosCodigoProduto: TStringField;
    tabAuxiliarProdutosDescricao: TStringField;
    tabAuxiliarProdutosQuantidade: TFloatField;
    tabAuxiliarProdutosValor: TCurrencyField;
    dtsAuxiliarProdutos: TDataSource;
    tabAuxiliarProdutosValorTotal: TCurrencyField;
    Emisso1: TMenuItem;
    GerarPedido1: TMenuItem;
    EnviarporEmail1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtsBaseDataChange(Sender: TObject; Field: TField);
    procedure btnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEditarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnClientesLocalizarClick(Sender: TObject);
    procedure edtCodigoClienteExit(Sender: TObject);
    procedure edtOrcamentoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnProdutoLocalizarClick(Sender: TObject);
    procedure btnProdutoAdicionarClick(Sender: TObject);
    procedure btnProdutoRemoverClick(Sender: TObject);
    procedure edtCodigoProdutoChange(Sender: TObject);
    procedure edtValorFreteExit(Sender: TObject);
    procedure edtValorAcrescimoExit(Sender: TObject);
    procedure edtValorSeguroExit(Sender: TObject);
    procedure edtValorDescontoExit(Sender: TObject);
    procedure edtPercDescontoExit(Sender: TObject);
    procedure EnviarporEmail1Click(Sender: TObject);
    procedure GerarPedido1Click(Sender: TObject);
    procedure edtOrcamentoKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure Emisso1Click(Sender: TObject);
    procedure btnOpcoesClick(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
  private
    FTyping : Boolean;
    procedure AtualizaOrcamento;
    procedure GravarProdutos(fOrcamento: real);
    procedure AtualizaTotal;
  public
    procedure Novo; override;
    procedure Editar; override;
    procedure Deletar; override;
    procedure Cancelar; override;
    function Checagens: Boolean; override;
  end;

var
  fmOrcamentosVendas: TfmOrcamentosVendas;

implementation

uses uFormBaseConfig, uMenu, uConstantes, uFuncoes, uLocalizarClientes,
  uLocalizarProdutos, uTipos, rEmissaoOrcamentos, rEnvioEmailOrcamento,
  uLocalizarOrcamentos;

{$R *.dfm}

procedure TfmOrcamentosVendas.Novo;
begin
   if Trim(edtOrcamento.Text) = '' then begin
      tabBase.FieldByName('Orcamento').AsFloat:=CodeGenerator('orcamentos', 'Orcamento');
    end
   else begin
      tabBase.FieldByName('Orcamento').AsFloat:=StrToFloat(edtOrcamento.Text);
   end;
   GravarProdutos(tabBase.FieldByName('Orcamento').AsFloat);
end;

procedure TfmOrcamentosVendas.Editar;
begin
   GravarProdutos(tabBase.FieldByName('Orcamento').AsFloat);
end;

procedure TfmOrcamentosVendas.Cancelar;
begin
end;

procedure TfmOrcamentosVendas.Deletar;
begin
   try
      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT * FROM orcamentos_produtos WHERE Orcamento = '+FloatToStr(tabBase.FieldByName('Orcamento').AsFloat));
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

function TfmOrcamentosVendas.Checagens: Boolean;
begin
   Result:=False;
   if Trim(edtCodigoCliente.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Cliente');
      edtCodigoCliente.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtData.Text) = '/  /' then begin
      ShowMessage('Obrigatório Preenchimento da Data do Orçamento');
      edtData.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtHora.Text) = '  :  :  ' then begin
      ShowMessage('Obrigatório Preenchimento da Hora do Orçamento');
      edtHora.SetFocus;
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
   if Trim(edtCodigoTransportadora.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Transportadora');
      edtCodigoTransportadora.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtCodigoFormaPagto.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Forma de Pagamento');
      edtCodigoFormaPagto.SetFocus;
      Result:=True;
      exit;
   end;
   if tabBase.State = dsInsert then begin
      if Trim(edtOrcamento.Text) <> '' then begin
         if ExistsValue('Orcamento', 'orcamentos', edtOrcamento.Text) then begin
            ShowMessage('Orçamento já Existente');
            edtOrcamento.SetFocus; 
            Result:=True; 
            exit;
         end;
      end;
   end;
end;

procedure TfmOrcamentosVendas.FormCreate(Sender: TObject);
begin
   inherited;
   FTyping:=False;
   SetFormStyle(fsMDIChild);
end;

procedure TfmOrcamentosVendas.FormShow(Sender: TObject);
begin
   inherited;

   tabAuxiliarProdutos.CreateDataSet;
   tabAuxiliarProdutos.EmptyDataSet;
   tabAuxiliarProdutos.IndexFieldNames:='CodigoProduto';

   tabOrcamentosProdutos.Params.CreateParam(ftFloat, 'Orcamento', ptUnknown);
   tabOrcamentosProdutos.SQL.Add('SELECT * FROM orcamentos_produtos WHERE Orcamento = :Orcamento');
   tabOrcamentosProdutos.Open;

   tabClientes.Params.CreateParam(ftFloat, 'CodigoCliente', ptUnknown);
   tabClientes.SQL.Add('SELECT CodigoCliente,NomeFantasia FROM clientes WHERE CodigoCliente = :CodigoCliente');
   tabClientes.Open;

   tabBase.Params.CreateParam(ftFloat, 'Orcamento', ptUnknown);
   tabBase.SQL.Add('SELECT * FROM orcamentos WHERE Orcamento = :Orcamento');
   tabBase.Open;

   tabFuncionarios.SQL.Add('SELECT Codigo,Nome FROM funcionarios ORDER BY Nome');
   tabFuncionarios.Open;

   tabTabelaPreco.SQL.Add('SELECT * FROM tipos_tabela_preco ORDER BY Descricao');
   tabTabelaPreco.Open;

   tabEmpresa.SQL.Add('SELECT * FROM empresas ORDER BY NomeFantasia');
   tabEmpresa.Open;

   tabTransportadora.SQL.Add('SELECT * FROM transportadoras ORDER BY Nome');
   tabTransportadora.Open;

   tabFormasPagto.SQL.Add('SELECT * FROM formas_pagamento ORDER BY Descricao');
   tabFormasPagto.Open;
end;

procedure TfmOrcamentosVendas.dtsBaseDataChange(Sender: TObject;
  Field: TField);
begin
   if tabBase.State = dsBrowse then begin
      AtualizaOrcamento;

      tabOrcamentosProdutos.Close;
      tabOrcamentosProdutos.ParamByName('Orcamento').Value:=tabBase.FieldByName('Orcamento').Value;
      tabOrcamentosProdutos.Open;

      tabClientes.Close;
      tabClientes.ParamByName('CodigoCliente').Value:=tabBase.FieldByName('CodigoCliente').Value;
      tabClientes.Open;
   end;
end;

procedure TfmOrcamentosVendas.btnNovoClick(Sender: TObject);
begin
   inherited;
   tabOrcamentosProdutos.Close;
   tabOrcamentosProdutos.ParamByName('Orcamento').Value:=-1;
   tabOrcamentosProdutos.Open;

   tabClientes.Close;
   tabClientes.ParamByName('CodigoCliente').Value:=-1;
   tabClientes.Open;

   tabAuxiliarProdutos.EmptyDataSet;

   dbgProdutos.DataSource:=dtsAuxiliarProdutos;

   tabBase.FieldByName('Data').AsDateTime:=Date;
   tabBase.FieldByName('Hora').AsDateTime:=Now;

   try
      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT TextoOrcamento FROM configuracoes_proprietario');
      tabChecagens.Open;
      tabBase.FieldByName('Observacao').AsString:=tabChecagens.FieldByName('TextoOrcamento').AsString;
   finally
      tabChecagens.Close;
   end;

   edtOrcamento.Text:='';
   edtCodigoCliente.SetFocus; 
end;

procedure TfmOrcamentosVendas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabBase.Close;
   tabClientes.Close;
   tabFuncionarios.Close;
   tabTabelaPreco.Close;
   tabEmpresa.Close;
   tabTransportadora.Close;
   tabFormasPagto.Close;
   tabOrcamentosProdutos.Close;
   tabAuxiliarProdutos.Close;
   inherited;
end;

procedure TfmOrcamentosVendas.AtualizaOrcamento;
begin
   if FTyping = False then begin
      if not tabBase.FieldByName('Orcamento').IsNull then begin
         edtOrcamento.Text:=FloatToStr(tabBase.FieldByName('Orcamento').AsFloat);
      end;
   end;
end;

procedure TfmOrcamentosVendas.btnEditarClick(Sender: TObject);
begin
   if not tabBase.FieldByName('DataPedido').IsNull then begin
      ShowMessage('Não é Possivel Alterar um Orçamento Transformado');
      exit;
   end;
   inherited;
   edtOrcamento.Enabled:=False;

   tabAuxiliarProdutos.EmptyDataSet; 

   dbgProdutos.DataSource:=nil;
   try
      tabOrcamentosProdutos.First;
      while not tabOrcamentosProdutos.Eof do begin

         tabAuxiliarProdutos.Append;
         tabAuxiliarProdutosCodigoProduto.Value:=tabOrcamentosProdutos.FieldByName('CodigoProduto').AsString;
         tabAuxiliarProdutosDescricao.Value:=tabOrcamentosProdutos.FieldByName('Descricao').AsString;
         tabAuxiliarProdutosQuantidade.Value:=tabOrcamentosProdutos.FieldByName('Quantidade').AsFloat;
         tabAuxiliarProdutosValor.Value:=tabOrcamentosProdutos.FieldByName('Valor').AsFloat;
         tabAuxiliarProdutosValorTotal.Value:=tabOrcamentosProdutos.FieldByName('ValorTotal').AsFloat;
         tabAuxiliarProdutos.Post;

         tabOrcamentosProdutos.Next;
      end;
   finally
      tabAuxiliarProdutos.First;
      dbgProdutos.DataSource:=dtsAuxiliarProdutos;
   end;
end;

procedure TfmOrcamentosVendas.btnGravarClick(Sender: TObject);
begin
   inherited;
   edtOrcamento.Enabled:=True;
   dbgProdutos.DataSource:=dtsOrcamentosProdutos;
end;

procedure TfmOrcamentosVendas.btnCancelarClick(Sender: TObject);
begin
   inherited;
   edtOrcamento.Enabled:=True;
   dbgProdutos.DataSource:=dtsOrcamentosProdutos;
end;

procedure TfmOrcamentosVendas.btnClientesLocalizarClick(Sender: TObject);
begin
   if tabBase.State in [dsInsert, dsEdit] then begin
      if not Assigned (fmLocalizarClientes) then begin
         Application.CreateForm(TfmLocalizarClientes, fmLocalizarClientes);
         fmLocalizarClientes.ShowModal;
      end;
      if Trim(fmMenu.pubTrans1) <> '' then begin
         tabBase.FieldByName('CodigoCliente').AsFloat:=StrToFloat(fmMenu.pubTrans1);
         tabClientes.Close;
         tabClientes.ParamByName('CodigoCliente').AsFloat:=StrToFloat(fmMenu.pubTrans1);
         tabClientes.Open; 
      end;
      edtCodigoCliente.SetFocus; 
   end;
end;

procedure TfmOrcamentosVendas.edtCodigoClienteExit(Sender: TObject);
begin
   if tabBase.State in [dsInsert] then begin
      if tabBase.FieldByName('CodigoCliente').AsFloat <> 0 then begin
         tabClientes.Close;
         tabClientes.ParamByName('CodigoCliente').AsFloat:=StrToFloat(edtCodigoCliente.Text);
         tabClientes.Open;
         tabClientesContatos.Close;
         tabClientesContatos.SQL.Clear;
         tabClientesContatos.SQL.Add('SELECT * FROM clientes_contatos WHERE CodigoCliente = '+edtCodigoCliente.Text);
         tabClientesContatos.Open;
         if tabClientesContatos.RecordCount > 0 then begin
            tabClientesContatos.First;
            while not tabClientesContatos.Eof do begin
               edtContato.Items.Add(tabClientesContatos.FieldByName('Nome').AsString);
               tabClientesContatos.Next;
            end;
         end;
         tabClientesContatos.Close;  
      end;
   end;
end;

procedure TfmOrcamentosVendas.edtOrcamentoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   inherited;
   if tabBase.State = dsBrowse then begin
      if Trim(edtOrcamento.Text) <> '' then begin
         FTyping:=True;
         tabBase.Close;
	       tabBase.ParamByName('Orcamento').AsFloat:=StrToFloat(edtOrcamento.Text);
         tabBase.Open;
         FTyping:=False;
       end
      else begin
         FTyping:=True;
         tabBase.Close;
         tabBase.ParamByName('Orcamento').AsFloat:=-1;
         tabBase.Open;
         FTyping:=False;
      end;
   end;
end;

procedure TfmOrcamentosVendas.btnProdutoLocalizarClick(Sender: TObject);
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

procedure TfmOrcamentosVendas.btnProdutoAdicionarClick(Sender: TObject);
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

      if tabAuxiliarProdutos.FindKey([edtCodigoProduto.Text]) then begin
         ShowMessage('Produto já Incluido no Orçamento');
         edtCodigoProduto.SetFocus; 
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

procedure TfmOrcamentosVendas.btnProdutoRemoverClick(Sender: TObject);
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

procedure TfmOrcamentosVendas.edtCodigoProdutoChange(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtCodigoProduto.Text) <> '' then begin
         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT CodigoProduto,NomeTecnico FROM produtos WHERE CodigoProduto = '+QuotedStr(edtCodigoProduto.Text));
            tabChecagens.Open;
            if tabChecagens.RecordCount > 0 then begin
               edtDescricaoProdutos.Text:=tabChecagens.FieldByName('NomeTecnico').AsString;
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
               tabChecagens.SQL.Add('SELECT ValorAtual FROM tabela_precos WHERE CodigoProduto = '+QuotedStr(edtCodigoProduto.Text)+' AND CodigoTabela = '+FloatToStr(edtTabelaPreco.KeyValue));
               tabChecagens.Open;
               if tabChecagens.RecordCount > 0 then begin
                  edtValor.Value:=tabChecagens.FieldByName('ValorAtual').AsFloat;
                end
               else begin
                  edtValor.Value:=0;
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

procedure TfmOrcamentosVendas.GravarProdutos(fOrcamento: real);
begin
   tabChecagens.Close;
   tabChecagens.SQL.Clear;
   tabChecagens.SQL.Add('DELETE FROM orcamentos_produtos WHERE Orcamento = '+FloatToStr(fOrcamento));
   tabChecagens.ExecSQL;

   dbgProdutos.DataSource:=nil;
   try
      tabAuxiliarProdutos.First;
      while not tabAuxiliarProdutos.Eof do begin

         tabOrcamentosProdutos.Append;
         tabOrcamentosProdutos.FieldByName('Orcamento').AsFloat:=fOrcamento;
         tabOrcamentosProdutos.FieldByName('CodigoProduto').AsString:=tabAuxiliarProdutosCodigoProduto.Value;
         tabOrcamentosProdutos.FieldByName('Descricao').AsString:=tabAuxiliarProdutosDescricao.Value;
         tabOrcamentosProdutos.FieldByName('Quantidade').AsFloat:=tabAuxiliarProdutosQuantidade.Value;
         tabOrcamentosProdutos.FieldByName('Valor').AsFloat:=tabAuxiliarProdutosValor.Value;
         tabOrcamentosProdutos.FieldByName('ValorTotal').AsFloat:=tabAuxiliarProdutosValorTotal.Value;
         tabOrcamentosProdutos.Post;
         tabOrcamentosProdutos.ApplyUpdates;

         tabAuxiliarProdutos.Next;
      end;

      tabOrcamentosProdutos.First;
   finally
      dbgProdutos.DataSource:=dtsOrcamentosProdutos;
   end;
end;

procedure TfmOrcamentosVendas.AtualizaTotal;
var vTotal, vProdutos: real;
begin
   vTotal:=0;
   vProdutos:=0;
   dbgProdutos.DataSource:=nil;
   try
      tabAuxiliarProdutos.First;
      while not tabAuxiliarProdutos.Eof do begin

         vProdutos:=vProdutos + tabAuxiliarProdutosValorTotal.Value;

         tabAuxiliarProdutos.Next;
      end;
      tabAuxiliarProdutos.First;

      // Acréscimos
      vTotal:=vTotal + vProdutos;
      vTotal:=vTotal + tabBase.FieldByName('ValorFrete').AsFloat;
      vTotal:=vTotal + tabBase.FieldByName('ValorAcrescimo').AsFloat;
      vTotal:=vTotal + tabBase.FieldByName('ValorSeguro').AsFloat;
      // Descontos
      vTotal:=vTotal - tabBase.FieldByName('ValorDesconto').AsFloat;

      tabBase.FieldByName('ValorProdutos').AsFloat:=vProdutos;
      tabBase.FieldByName('ValorTotal').AsFloat:=vTotal;
   finally
      dbgProdutos.DataSource:=dtsAuxiliarProdutos;
   end;
end;

procedure TfmOrcamentosVendas.edtValorFreteExit(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then AtualizaTotal;
end;

procedure TfmOrcamentosVendas.edtValorAcrescimoExit(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then AtualizaTotal;
end;

procedure TfmOrcamentosVendas.edtValorSeguroExit(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then AtualizaTotal;
end;

procedure TfmOrcamentosVendas.edtValorDescontoExit(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then AtualizaTotal;
end;

procedure TfmOrcamentosVendas.edtPercDescontoExit(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then AtualizaTotal;
end;

procedure TfmOrcamentosVendas.EnviarporEmail1Click(Sender: TObject);
var vFM: TrtEnvioEmailOrcamentos;
begin
   inherited;
   if Trim(edtOrcamento.Text) <> '' then begin
      fmMenu.pubTrans1:=edtOrcamento.Text;
      vFM:=TrtEnvioEmailOrcamentos.Create(Self);
      vFM.Show;
   end;
end;

procedure TfmOrcamentosVendas.GerarPedido1Click(Sender: TObject);
var vPedido: real;
begin
   inherited;
   if tabBase.RecordCount > 0 then begin
      if Trim(edtOrcamento.Text) <> '' then begin
         if Application.MessageBox('Deseja Realmente Gerar o Pedido?', PChar(Application.Title), 36) = 7 then exit;
         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT * FROM pedidos WHERE 0');
            tabChecagens.Open;

            tabChecagens.Append;
            vPedido:=CodeGenerator('pedidos', 'NPedido');
            tabChecagens.FieldByName('NPedido').AsFloat:=vPedido;
            tabChecagens.FieldByName('Orcamento').AsFloat:=tabBase.FieldByName('Orcamento').AsFloat;
            tabChecagens.FieldByName('CodigoCliente').AsFloat:=tabBase.FieldByName('CodigoCliente').AsFloat;
            tabChecagens.FieldByName('CodigoEmpresa').AsFloat:=tabBase.FieldByName('CodigoEmpresa').AsFloat;
            tabChecagens.FieldByName('CodigoTabPreco').AsFloat:=tabBase.FieldByName('CodigoTabPreco').AsFloat;
            tabChecagens.FieldByName('CodigoFuncionario').AsFloat:=tabBase.FieldByName('CodigoFuncionario').AsFloat;
            tabChecagens.FieldByName('CodigoFormaPagto').AsFloat:=tabBase.FieldByName('CodigoFormaPagto').AsFloat;
            tabChecagens.FieldByName('Data').AsDateTime:=Date;
            tabChecagens.FieldByName('Hora').AsDateTime:=Now;
            tabChecagens.FieldByName('PercDesconto').AsFloat:=tabBase.FieldByName('PercDesconto').AsFloat;
            tabChecagens.FieldByName('ValorProdutos').AsFloat:=tabBase.FieldByName('ValorProdutos').AsFloat;
            tabChecagens.FieldByName('ValorDesconto').AsFloat:=tabBase.FieldByName('ValorDesconto').AsFloat;
            tabChecagens.FieldByName('ValorFrete').AsFloat:=tabBase.FieldByName('ValorFrete').AsFloat;
            tabChecagens.FieldByName('ValorAcrescimo').AsFloat:=tabBase.FieldByName('ValorAcrescimo').AsFloat;
            tabChecagens.FieldByName('ValorSeguro').AsFloat:=tabBase.FieldByName('ValorSeguro').AsFloat;
            tabChecagens.FieldByName('ValorTotal').AsFloat:=tabBase.FieldByName('ValorTotal').AsFloat;
            tabChecagens.FieldByName('Contato').AsString:=tabBase.FieldByName('Contato').AsString;
            tabChecagens.FieldByName('CodigoTransportadora').AsFloat:=tabBase.FieldByName('CodigoTransportadora').AsFloat;
            tabChecagens.FieldByName('Parcelas').AsInteger:=tabBase.FieldByName('Parcelas').AsInteger;
            tabChecagens.Post;
            tabChecagens.ApplyUpdates;
         finally
            tabChecagens.Close;
         end;

         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT * FROM pedidos_produtos WHERE 0');
            tabChecagens.Open;

            tabOrcamentosProdutos.First;
            while not tabOrcamentosProdutos.Eof do begin

               tabChecagens.Append;
               tabChecagens.FieldByName('ID').AsFloat:=CodeGenerator('pedidos_produtos', 'ID');
               tabChecagens.FieldByName('NPedido').AsFloat:=vPedido;
               tabChecagens.FieldByName('CodigoProduto').AsString:=tabOrcamentosProdutos.FieldByName('CodigoProduto').AsString;
               tabChecagens.FieldByName('Descricao').AsString:=tabOrcamentosProdutos.FieldByName('Descricao').AsString;
               tabChecagens.FieldByName('Quantidade').AsFloat:=tabOrcamentosProdutos.FieldByName('Quantidade').AsFloat;
               tabChecagens.FieldByName('Valor').AsFloat:=tabOrcamentosProdutos.FieldByName('Valor').AsFloat;
               tabChecagens.FieldByName('ValorTotal').AsFloat:=tabOrcamentosProdutos.FieldByName('ValorTotal').AsFloat;
               tabChecagens.FieldByName('Reservado').AsFloat:=0;
               tabChecagens.FieldByName('PedidoProduzir').AsFloat:=0;
               tabChecagens.FieldByName('Composto').AsInteger:=0;
               tabChecagens.FieldByName('Referencia').AsString:='';
               tabChecagens.Post;
               tabChecagens.ApplyUpdates;

               tabOrcamentosProdutos.Next;
            end;

            ShowMessage('Pedido '+ FloatToStr(vPedido) +' Gerado com Sucesso');

            tabBase.Edit;
            tabBase.FieldByName('DataPedido').AsDateTime:=Date;
            tabBase.FieldByName('Observacao').AsString:=tabBase.FieldByName('Observacao').AsString + Chr(13) + 'ORÇAMENTO TRANSFORMADO NO PEDIDO: '+FloatToStr(vPedido)+' EM '+FormatDateTime('dd/MM/yyyy', Date);
            tabBase.Post; 
            tabBase.ApplyUpDates;

            // Atualizar Estoque:
            tabOrcamentosProdutos.First;
            while not tabOrcamentosProdutos.Eof do begin
               Application.ProcessMessages;
               fmMenu.AtualizaEstoque(tabOrcamentosProdutos.FieldByName('CodigoProduto').AsString);
               tabOrcamentosProdutos.Next;
            end; 
         finally
            tabChecagens.Close;
         end;
      end;
   end;
end;

procedure TfmOrcamentosVendas.edtOrcamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
   inherited;
   if not (Key in['0'..'9',Chr(8)]) then Key:=#0;
end;

procedure TfmOrcamentosVendas.edtCodigoProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
   inherited;
   if Key = #32 then Key:=#0 else Key:=UpCase(Key);
end;

procedure TfmOrcamentosVendas.Emisso1Click(Sender: TObject);
var vRT : TrtEmissaoOrcamentos;
begin
   inherited;
   if Trim(edtOrcamento.Text) <> '' then begin
      fmMenu.pubTrans1:=edtOrcamento.Text;
      vRT:=TrtEmissaoOrcamentos.Create(Self);
      vRT.Show;
   end;
end;

procedure TfmOrcamentosVendas.btnOpcoesClick(Sender: TObject);
begin
   if not tabBase.FieldByName('DataPedido').IsNull then begin
      GerarPedido1.Enabled:=False;
    end
   else begin
      GerarPedido1.Enabled:=True; 
   end;
   inherited; 
end;

procedure TfmOrcamentosVendas.edtValorExit(Sender: TObject);
begin
   inherited;   
   if tabBase.State in [dsInsert, dsEdit] then begin
      btnProdutoAdicionar.Click;
   end; 
end;

procedure TfmOrcamentosVendas.btnLocalizarClick(Sender: TObject);
begin
   inherited;
   if not Assigned (fmLocalizarOrcamentos) then begin
      Application.CreateForm(TfmLocalizarOrcamentos, fmLocalizarOrcamentos);
      fmLocalizarOrcamentos.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      tabBase.Close;
      tabBase.ParamByName('Orcamento').AsFloat:=StrToFloat(fmMenu.pubTrans1);
      tabBase.Open;
   end;
end;

end.

unit uGerarProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, Menus, Grids, DBGrids, StdCtrls, ExtCtrls,
  DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, DBCtrls,
  Buttons;

type
  TfmGerarProdutos = class(TfmFormBaseAvancado)
    pnlPasso1: TPanel;
    edtDescricaoProduto: TEdit; 
    Label1: TLabel;
    dbgCores: TDBGrid;
    tabCores: TZQuery;
    dtsAuxCores: TDataSource;
    tabAuxCores: TClientDataSet;
    tabAuxCoresSelecionar: TBooleanField;
    tabAuxCoresCor: TStringField;
    tabAuxCoresAbreviado: TStringField;
    tabAuxProdutos: TClientDataSet;
    dtsAuxProdutos: TDataSource;
    tabAuxProdutosDescricao: TStringField;
    tabAuxProdutosCor: TStringField;
    tabAuxProdutosCodigoCor: TFloatField;
    edtNMolde: TEdit;
    Label3: TLabel;
    edtMolde: TEdit;
    Label4: TLabel;
    tabAuxProdutosCodigoProduto: TStringField;
    ckbProdutoAcabado: TCheckBox;
    edtGrupo: TDBLookupComboBox;
    Label5: TLabel;
    edtModelo: TDBLookupComboBox;
    Label6: TLabel;
    edtUnidade: TDBLookupComboBox;
    Label7: TLabel;
    edtNCM: TEdit;
    Label8: TLabel;
    edtObservacao: TMemo;
    Label9: TLabel;
    edtCodigoCliente: TEdit;
    Label10: TLabel;
    edtNomeCliente: TEdit;
    edtReferenciaCliente: TEdit;
    Label11: TLabel;
    btnLocalizarCliente: TBitBtn;
    Label12: TLabel;
    tabGrupos: TZQuery;
    dtsGrupos: TDataSource;
    tabModelos: TZQuery;
    dtsModelos: TDataSource;
    tabUnidades: TZQuery;
    dtsUnidades: TDataSource;
    tabChecagens: TZQuery;
    btnPasso1Proximo: TButton;
    pnlPasso2: TPanel;
    btnPasso2Proximo: TButton;
    dbgTabelasPreco: TDBGrid;
    dtsAuxTiposTabela: TDataSource;
    tabAuxTiposTabela: TClientDataSet;
    tabAuxTiposTabelaCodigo: TFloatField;
    tabAuxTiposTabelaDescricao: TStringField;
    btnPasso2Anterior: TButton;
    tabAuxTiposTabelaSelecionar: TBooleanField;
    tabTiposTabelasPreco: TZQuery;
    tabAuxProdutosCodigoGrupo: TFloatField;
    tabAuxProdutosCodigoModelo: TFloatField;
    tabAuxProdutosCodigoUnidade: TFloatField;
    tabAuxProdutosProdutoAcabado: TIntegerField;
    tabAuxProdutosNCM: TStringField;
    tabAuxProdutosCodigoCLiente: TFloatField;
    tabAuxProdutosReferenciaCliente: TStringField;
    tabAuxProdutosObservacoes: TStringField;
    pnlPasso3: TPanel;
    btnPasso3Proximo: TButton;
    dbgPrecoProdutos: TDBGrid;
    btnPasso3Anterior: TButton;
    dtsAuxTabelaPreco: TDataSource;
    tabAuxTabelaPreco: TClientDataSet;
    tabAuxTabelaPrecoTabela: TStringField;
    tabAuxTabelaPrecoValor: TCurrencyField;
    tabAuxTabelaPrecoCodigoTabela: TFloatField;
    tabAuxTabelaPrecoCodigoProduto: TStringField;
    Label2: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    pnlPasso4: TPanel;
    Label15: TLabel;
    btnPasso4Gravar: TButton;
    btnPaso4Anterior: TButton;
    dbgProdutosGerados: TDBGrid;
    tabAuxCoresCodigoCor: TFloatField;
    tabAuxProdutosAtualizaPreco: TBooleanField;
    btnAddCor: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgCoresCellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCodigoClienteChange(Sender: TObject);
    procedure btnLocalizarClienteClick(Sender: TObject);
    procedure edtReferenciaClienteExit(Sender: TObject);
    procedure edtCodigoClienteExit(Sender: TObject);
    procedure btnPasso1ProximoClick(Sender: TObject);
    procedure btnPasso2AnteriorClick(Sender: TObject);
    procedure dbgTabelasPrecoCellClick(Column: TColumn);
    procedure btnPasso2ProximoClick(Sender: TObject);
    procedure btnPasso3AnteriorClick(Sender: TObject);
    procedure btnPasso3ProximoClick(Sender: TObject);
    procedure btnPaso4AnteriorClick(Sender: TObject);
    procedure btnPasso4GravarClick(Sender: TObject);
    procedure btnAddCorClick(Sender: TObject);
  private
    procedure AtualizarCores;
    procedure DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
    Column: TColumn; State: TGridDrawState);
    procedure GerarProdutos;
    procedure SelecionarPainel(pPanel: TPanel);
  public
    { Public declarations }
  end;

var
  fmGerarProdutos: TfmGerarProdutos;

implementation

uses uFormBase, uMenu, uLocalizarClientes;

{$R *.dfm}

procedure TfmGerarProdutos.AtualizarCores;
begin
   tabAuxCores.EmptyDataSet;
   tabCores.First;
   while not tabCores.Eof do begin  
      tabAuxCores.Append;
      tabAuxCoresSelecionar.Value:=False;
      tabAuxCoresCor.Value:=tabCores.FieldByName('Descricao').AsString;
      tabAuxCoresAbreviado.Value:=tabCores.FieldByName('Abreviacao').AsString;
      tabAuxCoresCodigoCor.Value:=tabCores.FieldByName('Codigo').AsFloat;
      tabAuxCores.Post;
      tabCores.Next;
   end;
   tabAuxCores.First;
end;

procedure TfmGerarProdutos.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TfmGerarProdutos.FormShow(Sender: TObject);
begin
   inherited;

   // Preciso fugir a regra e alterar esse dbgrid (RS)
   dbgPrecoProdutos.ReadOnly:=False;
   dbgPrecoProdutos.Options:=[dgTitles,dgEditing,dgIndicator,dgColLines,dgColumnResize,dgRowLines,dgTabs];

   edtNMolde.Text:=fmMenu.pubTrans1;
   edtMolde.Text:=fmMenu.pubTrans2;

   dbgCores.OnDrawColumnCell:=DrawColumnCell;
   dbgTabelasPreco.OnDrawColumnCell:=DrawColumnCell;

   tabCores.SQL.Add('SELECT * FROM cores ORDER BY Descricao');
   tabCores.Open;

   tabGrupos.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('1')+' ORDER BY Descricao');
   tabGrupos.Open;

   tabModelos.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('9')+' ORDER BY Descricao');
   tabModelos.Open;

   tabUnidades.SQL.Add('SELECT * FROM unidades ORDER BY Descricao'); 
   tabUnidades.Open;

   tabAuxCores.CreateDataSet;
   tabAuxCores.EmptyDataSet;

   tabAuxProdutos.CreateDataSet;
   tabAuxProdutos.EmptyDataSet;
   tabAuxProdutos.IndexFieldNames:='CodigoProduto'; 

   tabAuxTiposTabela.CreateDataSet;
   tabAuxTiposTabela.EmptyDataSet;

   tabAuxTabelaPreco.CreateDataSet;
   tabAuxTabelaPreco.EmptyDataSet;
   dtsAuxTabelaPreco.OnStateChange:=NIL; // Preciso altera-lo, se conforme (RS) 

   tabTiposTabelasPreco.SQL.Add('SELECT * FROM tipos_tabela_preco ORDER BY Descricao');
   tabTiposTabelasPreco.Open;
   tabTiposTabelasPreco.First;
   while not tabTiposTabelasPreco.Eof do begin

      tabAuxTiposTabela.Append;
      tabAuxTiposTabelaSelecionar.Value:=False;
      tabAuxTiposTabelaCodigo.Value:=tabTiposTabelasPreco.FieldByName('Codigo').AsFloat;
      tabAuxTiposTabelaDescricao.Value:=tabTiposTabelasPreco.FieldByName('Descricao').AsString;
      tabAuxTiposTabela.Post;
      
      tabTiposTabelasPreco.Next;
   end;
   tabAuxTiposTabela.First;

   AtualizarCores; 
end;

procedure TfmGerarProdutos.dbgCoresCellClick(Column: TColumn);
begin
   inherited;
   if Column.FieldName = 'Selecionar' then begin
      tabAuxCores.Edit;
      if tabAuxCoresSelecionar.Value = True then begin
         tabAuxCoresSelecionar.Value:=False;
       end
      else begin
         tabAuxCoresSelecionar.Value:=True;
      end;
      tabAuxCores.Post;
   end;
end; 

procedure TfmGerarProdutos.DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var vCheck : Integer;
    R : TRect;
begin
   inherited;
   if (Sender as TDBGrid).DataSource <> nil then begin
      if Column.FieldName = 'Selecionar' then begin
         (Sender as TDBGrid).Canvas.FillRect(Rect);
         if Column.Field.Value = True then vCheck := DFCS_CHECKED else vCheck := 0; 
         //if tabAuxCoresSelecionar.Value = True then vCheck := DFCS_CHECKED else vCheck := 0;
         R:=Rect;
         InflateRect(R, -2, -2); {Diminue o tamanho do CheckBox}
         DrawFrameControl((Sender as TDBGrid).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or vCheck);
      end;  
   end;
end;

procedure TfmGerarProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   inherited;
   tabAuxCores.Close;
   tabAuxProdutos.Close;
   tabGrupos.Close;
   tabCores.Close;
   tabModelos.Close;
   tabUnidades.Close;
   tabAuxTiposTabela.Close;
   tabTiposTabelasPreco.Close;
   tabAuxTabelaPreco.Close; 
end;

procedure TfmGerarProdutos.GerarProdutos;
var vPos: Integer;
    vDescricao: string;
    vBookMark : TBookmark;
const cCor = '%COR%';
begin
   if tabAuxCores.State = dsBrowse then begin

      tabAuxProdutos.EmptyDataSet;
      vBookMark:=tabAuxCores.GetBookmark;
      dbgCores.DataSource:=nil;

      try
         tabAuxCores.First;
         while not tabAuxCores.Eof do begin

            if tabAuxCoresSelecionar.Value = True then begin
               tabAuxProdutos.Append;

               vDescricao:=edtDescricaoProduto.Text;
               vPos:=Pos(cCor, vDescricao);

               if vPos > 0 then begin
                  vDescricao:=StringReplace(vDescricao, cCor, tabAuxCoresCor.Value, [rfReplaceAll]);
               end;

               tabAuxProdutosDescricao.Value:=vDescricao;
               tabAuxProdutosCor.Value:=tabAuxCoresCor.Value;
               tabAuxProdutosCodigoProduto.Value:=edtNMolde.Text+tabAuxCoresAbreviado.Value;
               tabAuxProdutosCodigoCor.Value:=tabAuxCoresCodigoCor.Value;
               if Trim(edtGrupo.Text) <> '' then begin
                  tabAuxProdutosCodigoGrupo.Value:=edtGrupo.KeyValue;
               end;
               if Trim(edtModelo.Text) <> '' then begin
                  tabAuxProdutosCodigoModelo.Value:=edtModelo.KeyValue;
               end;
               if Trim(edtUnidade.Text) <> '' then begin
                  tabAuxProdutosCodigoUnidade.Value:=edtUnidade.KeyValue;
               end;
               if ckbProdutoAcabado.Checked then begin
                  tabAuxProdutosProdutoAcabado.Value:=1;
                end
               else begin
                  tabAuxProdutosProdutoAcabado.Value:=0;
               end;
               tabAuxProdutosNCM.Value:=edtNCM.Text;
               if Trim(edtCodigoCliente.Text) <> '' then begin
                  tabAuxProdutosCodigoCLiente.Value:=StrToFloat(edtCodigoCliente.Text);
               end;
               tabAuxProdutosReferenciaCliente.Value:=edtReferenciaCliente.Text;
               tabAuxProdutosObservacoes.Value:=edtObservacao.Text;
               tabAuxProdutosAtualizaPreco.Value:=False;
               tabAuxProdutos.Post;
            end;

            tabAuxCores.Next;
         end;
      finally
         dbgCores.DataSource:=dtsAuxCores;
         tabAuxCores.GotoBookmark(vBookMark);
         tabAuxCores.FreeBookmark(vBookMark);
      end;
   end;
end;

procedure TfmGerarProdutos.edtCodigoClienteChange(Sender: TObject);
begin
   inherited;
   if Trim(edtCodigoCliente.Text) <> '' then begin
      try
         tabChecagens.Close;
         tabChecagens.SQL.Clear;;
         tabChecagens.SQL.Add('SELECT NomeFantasia FROM clientes WHERE CodigoCliente = '+QuotedStr(edtCodigoCliente.Text));
         tabChecagens.Open;

         if tabChecagens.RecordCount = 1 then begin
            edtNomeCliente.Text:=tabChecagens.FieldByName('NomeFantasia').AsString;
          end
         else begin
            edtNomeCliente.Text:='';
         end;
      finally
         tabChecagens.Close;
      end;
    end
   else begin
      edtNomeCliente.Text:='';
   end;
end;

procedure TfmGerarProdutos.btnLocalizarClienteClick(Sender: TObject);
begin
   inherited;
   if not Assigned (fmLocalizarClientes) then begin
      Application.CreateForm(TfmLocalizarClientes, fmLocalizarClientes);
      fmLocalizarClientes.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edtCodigoCliente.Text:=fmMenu.pubTrans1;
   end;
end;

procedure TfmGerarProdutos.edtReferenciaClienteExit(Sender: TObject);
begin
   inherited;
   if Trim(edtReferenciaCliente.Text) <> '' then begin
      edtObservacao.Text:=edtObservacao.Text + ' REFERENCIA: ' +edtReferenciaCliente.Text;
   end;
end;

procedure TfmGerarProdutos.edtCodigoClienteExit(Sender: TObject);
begin
   inherited; 
   if Trim(edtCodigoCliente.Text) <> '' then begin 
      edtObservacao.Text:=edtObservacao.Text + ' CLIENTE: '+edtCodigoCliente.Text + ' = ' +edtNomeCliente.Text;
   end;
end;

procedure TfmGerarProdutos.btnPasso1ProximoClick(Sender: TObject);
begin
   inherited;
   GerarProdutos;
   SelecionarPainel(pnlPasso2);
end;

procedure TfmGerarProdutos.btnPasso2AnteriorClick(Sender: TObject);
begin
   inherited;
   SelecionarPainel(pnlPasso1);
end;

procedure TfmGerarProdutos.dbgTabelasPrecoCellClick(Column: TColumn);
begin
   inherited;
   if Column.FieldName = 'Selecionar' then begin
      tabAuxTiposTabela.Edit;
      if tabAuxTiposTabelaSelecionar.Value = True then begin
         tabAuxTiposTabelaSelecionar.Value:=False;
       end
      else begin
         tabAuxTiposTabelaSelecionar.Value:=True;
      end;
      tabAuxTiposTabela.Post;
   end;
end;

procedure TfmGerarProdutos.btnPasso2ProximoClick(Sender: TObject);
begin
   inherited;
   //
   tabAuxTabelaPreco.EmptyDataSet;

   tabAuxTiposTabela.First;
   while not tabAuxTiposTabela.Eof do begin

      if tabAuxTiposTabelaSelecionar.Value = True then begin
         tabAuxProdutos.First;
         while not tabAuxProdutos.Eof do begin

            tabAuxTabelaPreco.Append;
            tabAuxTabelaPrecoTabela.Value:=tabAuxTiposTabelaDescricao.Value;
            tabAuxTabelaPrecoValor.Value:=0;
            tabAuxTabelaPrecoCodigoTabela.Value:=tabAuxTiposTabelaCodigo.Value;
            tabAuxTabelaPrecoCodigoProduto.Value:=tabAuxProdutosCodigoProduto.Value;
            tabAuxTabelaPreco.Post;

            tabAuxProdutos.Next;
         end;
      end;

      tabAuxTiposTabela.Next;
   end;

   SelecionarPainel(pnlPasso3);
end;

procedure TfmGerarProdutos.SelecionarPainel(pPanel: TPanel);
begin
   pPanel.Top:=51;
   pPanel.Left:=8;
   pPanel.BringToFront;
end;

procedure TfmGerarProdutos.btnPasso3AnteriorClick(Sender: TObject);
begin
   inherited;
   SelecionarPainel(pnlPasso2);
end;

procedure TfmGerarProdutos.btnPasso3ProximoClick(Sender: TObject);
begin
   inherited;
   SelecionarPainel(pnlPasso4);
end;

procedure TfmGerarProdutos.btnPaso4AnteriorClick(Sender: TObject);
begin
   inherited;
   SelecionarPainel(pnlPasso3);
end;

procedure TfmGerarProdutos.btnPasso4GravarClick(Sender: TObject);
var vMsg: string;
begin
   inherited;
   vMsg:='';
   if tabAuxProdutos.RecordCount > 0 then begin

      tabAuxProdutos.First;
      while not tabAuxProdutos.Eof do begin

         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT * FROM produtos WHERE CodigoProduto = '+QuotedStr(tabAuxProdutosCodigoProduto.Value));
         tabChecagens.Open;

         if tabChecagens.RecordCount = 0 then begin
            tabChecagens.Append;
            tabChecagens.FieldByName('CodigoProduto').AsString:=tabAuxProdutosCodigoProduto.Value;
            tabChecagens.FieldByName('NomeTecnico').AsString:=tabAuxProdutosDescricao.Value;
            tabChecagens.FieldByName('CodigoGrupo').AsFloat:=tabAuxProdutosCodigoGrupo.Value;
            tabChecagens.FieldByName('CodigoModelo').AsFloat:=tabAuxProdutosCodigoModelo.Value;
            tabChecagens.FieldByName('CodigoCor').AsFloat:=tabAuxProdutosCodigoCor.Value;
            tabChecagens.FieldByName('CodigoUnidade').AsFloat:=tabAuxProdutosCodigoUnidade.Value;
            tabChecagens.FieldByName('ProdutoAcabado').AsInteger:=tabAuxProdutosProdutoAcabado.Value;
            tabChecagens.FieldByName('NCM').AsString:=tabAuxProdutosNCM.Value;
            tabChecagens.FieldByName('Observacao').AsString:=tabAuxProdutosObservacoes.Value;
            tabChecagens.Post;
            tabChecagens.ApplyUpdates;

            tabAuxProdutos.Edit;
            tabAuxProdutosAtualizaPreco.Value:=True;
            tabAuxProdutos.Post;

            if (Trim(tabAuxProdutosReferenciaCliente.Value) <> '') and 
               (tabAuxProdutosCodigoCLiente.Value > 0) then begin 
               tabChecagens.Close;
               tabChecagens.SQL.Clear;
               tabChecagens.SQL.Add('SELECT * FROM clientes_referencia_produtos WHERE ');
               tabChecagens.SQL.Add('CodigoCliente = '+QuotedStr(FloatToStr(tabAuxProdutosCodigoCLiente.Value))+' AND ');
               tabChecagens.SQL.Add('CodigoProduto = '+QuotedStr(tabAuxProdutosCodigoProduto.Value)+' AND ');
               tabChecagens.SQL.Add('ReferenciaCliente = '+QuotedStr(tabAuxProdutosReferenciaCliente.Value));
               tabChecagens.Open;

               if tabChecagens.RecordCount = 0 then begin
                  tabChecagens.Append;
                  tabChecagens.FieldByName('CodigoCliente').AsFloat:=tabAuxProdutosCodigoCLiente.Value;
                  tabChecagens.FieldByName('CodigoProduto').AsString:=tabAuxProdutosCodigoProduto.Value;
                  tabChecagens.FieldByName('ReferenciaCliente').AsString:=tabAuxProdutosReferenciaCliente.Value;
                  tabChecagens.Post;
                  tabChecagens.ApplyUpdates;
               end;
            end;
          end
         else begin
            vMsg:=vMsg+'(Aviso) Produto '+tabAuxProdutosCodigoProduto.Value+' ja existente no cadastro. '+Chr(13);
         end;

         tabAuxProdutos.Next;
      end;

      // Atualiza Preços.
      if tabAuxTabelaPreco.RecordCount > 0 then begin
         tabAuxTabelaPreco.First;
         while not tabAuxTabelaPreco.Eof do begin

            if tabAuxTabelaPrecoValor.Value > 0 then begin
               if tabAuxProdutos.FindKey([tabAuxTabelaPrecoCodigoProduto.Value]) then begin
                  if tabAuxProdutosAtualizaPreco.Value = True then begin
                     tabChecagens.Close;
                     tabChecagens.SQL.Clear;
                     tabChecagens.SQL.Add('SELECT * FROM tabela_precos WHERE ');
                     tabChecagens.SQL.Add('CodigoProduto = '+QuotedStr(tabAuxTabelaPrecoCodigoProduto.Value)+' AND ');
                     tabChecagens.SQL.Add('CodigoTabela = '+QuotedStr(FloatToStr(tabAuxTabelaPrecoCodigoTabela.Value)));
                     tabChecagens.Open;
                     if tabChecagens.RecordCount = 0 then begin
                        tabChecagens.Append;
                        tabChecagens.FieldByName('CodigoProduto').AsString:=tabAuxTabelaPrecoCodigoProduto.Value;
                        tabChecagens.FieldByName('CodigoTabela').AsFloat:=tabAuxTabelaPrecoCodigoTabela.Value;
                      end
                     else begin
                        tabChecagens.Edit;
                     end;
                     tabChecagens.FieldByName('ValorAtual').AsFloat:=tabAuxTabelaPrecoValor.Value;
                     tabChecagens.FieldByName('DataReajuste').AsDateTime:=Date;
                     tabChecagens.Post;
                     tabChecagens.ApplyUpdates;
                  end;
               end;
            end;

            tabAuxTabelaPreco.Next;
         end; 
      end;
    end
   else begin
      vMsg:=vMsg+' Nenhum produto gerado.';
   end;

   if Trim(vMsg) = '' then begin
      ShowMessage('Produtos Gerados com Sucesso.');
    end
   else begin
      ShowMessage(vMsg); 
   end;
end;

procedure TfmGerarProdutos.btnAddCorClick(Sender: TObject);
begin
   inherited;
   edtDescricaoProduto.Text:=edtDescricaoProduto.Text + '%COR%';
   edtDescricaoProduto.SetFocus;
   edtDescricaoProduto.SelStart:=Length(edtDescricaoProduto.Text);
end;

end.

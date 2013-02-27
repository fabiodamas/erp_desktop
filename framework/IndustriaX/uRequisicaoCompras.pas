unit uRequisicaoCompras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, Menus, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Buttons, ExtCtrls, StdCtrls, DBCtrls, Mask,
  ToolEdit, RXDBCtrl, CurrEdit, Grids, DBGrids, ComCtrls, DBClient;

type
  TfmRequisicaoCompras = class(TfmFormBaseCadastro)
    edtRequisicao: TEdit;
    Label1: TLabel;
    edtData: TDBDateEdit;
    Label2: TLabel;
    edtHora: TDBEdit;
    Label3: TLabel;
    edtCodigoResponsavel: TDBEdit;
    Label4: TLabel;
    edtResponsavel: TDBLookupComboBox;
    edtDataPrazo: TDBDateEdit;
    Label5: TLabel;
    edtDataBaixa: TDBDateEdit;
    Label6: TLabel;
    pgcRequisicao: TPageControl;
    tbsProdutos: TTabSheet;
    Label18: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    btnProdutoAdicionar: TBitBtn;
    btnProdutoRemover: TBitBtn;
    dbgProdutos: TDBGrid;
    edtCodigoProduto: TEdit;
    btnProdutoLocalizar: TBitBtn;
    edtDescricaoProdutos: TEdit;
    edtQuantidade: TCurrencyEdit;
    edtValor: TCurrencyEdit;
    Emisso1: TMenuItem;
    tabReqProdutos: TZQuery;
    dtsReqProdutos: TDataSource;
    tabChecagens: TZQuery;
    tabAuxProdutos: TClientDataSet;
    dtsAuxProdutos: TDataSource;
    tabAuxProdutosCodigoProduto: TStringField;
    tabAuxProdutosDescricao: TStringField;
    tabAuxProdutosQuantidade: TFloatField;
    tabAuxProdutosValor: TCurrencyField;
    tabAuxProdutosValorTotal: TCurrencyField;
    tabFuncionarios: TZQuery;
    dtsFuncionarios: TDataSource;
    N1: TMenuItem;
    Baixa1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure edtCodigoProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure edtRequisicaoKeyPress(Sender: TObject; var Key: Char);
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dtsBaseDataChange(Sender: TObject; Field: TField);
    procedure btnEditarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtRequisicaoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnProdutoAdicionarClick(Sender: TObject);
    procedure btnProdutoRemoverClick(Sender: TObject);
    procedure edtCodigoProdutoChange(Sender: TObject);
    procedure btnProdutoLocalizarClick(Sender: TObject);
    procedure Baixa1Click(Sender: TObject);
    procedure btnOpcoesClick(Sender: TObject);
    procedure Emisso1Click(Sender: TObject);
  private
    FTyping : boolean;
    FDocumento: string;
    procedure GravarProdutos(fDocumento: real);
    procedure AtualizaDocumento;
  public
    procedure Novo; override;
    procedure Editar; override;
    procedure Deletar; override;
    procedure Cancelar; override;
    function Checagens: Boolean; override;
  end;

var
  fmRequisicaoCompras: TfmRequisicaoCompras;

implementation

uses uFormBaseConfig, uMenu, uFuncoes, uLocalizarProdutos,
  rRequisicaoCompras;

{$R *.dfm}

procedure TfmRequisicaoCompras.Novo;
begin
   if Trim(edtRequisicao.Text) = '' then begin
      tabBase.FieldByName('Documento').AsFloat:=CodeGenerator('requisicao_compras', 'Documento');
    end
   else begin
      tabBase.FieldByName('Documento').AsFloat:=StrToFloat(edtRequisicao.Text);
   end;
   GravarProdutos(tabBase.FieldByName('Documento').AsFloat);
end;

procedure TfmRequisicaoCompras.Editar;
begin
   GravarProdutos(tabBase.FieldByName('Documento').AsFloat);
end;

procedure TfmRequisicaoCompras.Cancelar;
begin
end;

function TfmRequisicaoCompras.Checagens: Boolean;
begin
   Result:=False;
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
   if tabAuxProdutos.RecordCount <= 0 then begin
      ShowMessage('Obrigatório Preenchimento dos Produtos');
      edtCodigoProduto.SetFocus;
      Result:=True;
      exit;
   end;
   if tabBase.State = dsInsert then begin
      if Trim(edtRequisicao.Text) <> '' then begin
         if ExistsValue('Documento', 'requisicao_compras', edtRequisicao.Text) then begin
            ShowMessage('Documento já Existente');
            edtRequisicao.SetFocus; 
            Result:=True; 
            exit;
         end;
      end;
   end;
end;

procedure TfmRequisicaoCompras.Deletar;
begin
   try
      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT * FROM requisicao_compras_produtos WHERE Documento = '+FloatToStr(tabBase.FieldByName('Documento').AsFloat));
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

procedure TfmRequisicaoCompras.FormCreate(Sender: TObject);
begin
   inherited;
   FTyping:=False;
   SetFormStyle(fsMDIChild);
end;

procedure TfmRequisicaoCompras.edtCodigoProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
   inherited;
   if Key = #32 then Key:=#0 else Key:=UpCase(Key);
end;

procedure TfmRequisicaoCompras.edtRequisicaoKeyPress(Sender: TObject;
  var Key: Char);
begin
   inherited;
   if not (Key in['0'..'9',Chr(8)]) then Key:=#0;
end;

procedure TfmRequisicaoCompras.btnNovoClick(Sender: TObject);
begin
   inherited;

   tabReqProdutos.Close;
   tabReqProdutos.ParamByName('Documento').AsFloat:=-1;
   tabReqProdutos.Open; 

   tabAuxProdutos.EmptyDataSet;
   dbgProdutos.DataSource:=dtsAuxProdutos;  

   edtRequisicao.Text:='';
   tabBase.FieldByName('DataRequisicao').AsDateTime:=Date;
   tabBase.FieldByName('HoraRequisicao').AsDateTime:=Now;
end;

procedure TfmRequisicaoCompras.FormShow(Sender: TObject);
begin
   inherited;

   if Trim(fmMenu.pubTrans1) <> '' then begin
      FDocumento:=fmMenu.pubTrans1;
   end;

   tabAuxProdutos.CreateDataSet;
   tabAuxProdutos.EmptyDataSet;

   tabReqProdutos.Params.CreateParam(ftFloat, 'Documento', ptUnknown);
   tabReqProdutos.SQL.Add('SELECT * FROM requisicao_compras_produtos WHERE Documento = :Documento');
   tabReqProdutos.Open;

   tabFuncionarios.SQL.Add('SELECT Codigo,Nome FROM funcionarios ORDER BY Nome');
   tabFuncionarios.Open;

   tabBase.Params.CreateParam(ftFloat, 'Documento', ptUnknown);
   tabBase.SQL.Add('SELECT * FROM requisicao_compras WHERE Documento = :Documento');
   tabBase.Open;

   if Trim(FDocumento) <> '' then begin
      tabBase.Close;
      tabBase.ParamByName('Documento').AsFloat:=StrToFloat(FDocumento);
      tabBase.Open;
   end;
end;

procedure TfmRequisicaoCompras.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabBase.Close;
   tabReqProdutos.Close;
   tabAuxProdutos.Close;
   tabFuncionarios.Close;
   inherited;
end;

procedure TfmRequisicaoCompras.GravarProdutos(fDocumento: real);
begin
   tabChecagens.Close;
   tabChecagens.SQL.Clear;
   tabChecagens.SQL.Add('DELETE FROM requisicao_compras_produtos WHERE Documento = '+FloatToStr(fDocumento));
   tabChecagens.ExecSQL;

   tabChecagens.Close;
   tabChecagens.SQL.Clear;
   tabChecagens.SQL.Add('SELECT * FROM requisicao_compras_produtos WHERE 0');
   tabChecagens.Open; 

   dbgProdutos.DataSource:=nil;
   try
      tabAuxProdutos.First;
      while not tabAuxProdutos.Eof do begin

         tabChecagens.Append;
         tabChecagens.FieldByName('ID').AsFloat:=CodeGenerator('requisicao_compras_produtos', 'ID');
         tabChecagens.FieldByName('Documento').AsFloat:=fDocumento;
         tabChecagens.FieldByName('CodigoProduto').AsString:=tabAuxProdutosCodigoProduto.Value;
         tabChecagens.FieldByName('Descricao').AsString:=tabAuxProdutosDescricao.Value;
         tabChecagens.FieldByName('Quantidade').AsFloat:=tabAuxProdutosQuantidade.Value;
         tabChecagens.FieldByName('Valor').AsFloat:=tabAuxProdutosValor.Value;
         tabChecagens.FieldByName('ValorTotal').AsFloat:=tabAuxProdutosValorTotal.Value;
         tabChecagens.Post;
         tabChecagens.ApplyUpdates;

         tabAuxProdutos.Next;
      end;

      tabReqProdutos.Close;
      tabReqProdutos.ParamByName('Documento').AsFloat:=fDocumento;
      tabReqProdutos.Open;
   finally
      tabChecagens.Close;
      dbgProdutos.DataSource:=dtsReqProdutos;
   end;
end;

procedure TfmRequisicaoCompras.dtsBaseDataChange(Sender: TObject;
  Field: TField);
begin
   inherited;
   if tabBase.State = dsBrowse then begin
      AtualizaDocumento;

      tabReqProdutos.Close;
      tabReqProdutos.ParamByName('Documento').AsFloat:=tabBase.FieldByName('Documento').AsFloat;
      tabReqProdutos.Open;
   end;
end;

procedure TfmRequisicaoCompras.btnEditarClick(Sender: TObject);
begin
   inherited;
   edtRequisicao.Enabled:=False;

   tabAuxProdutos.EmptyDataSet;

   dbgProdutos.DataSource:=nil;
   try
      tabReqProdutos.First;
      while not tabReqProdutos.Eof do begin

         tabAuxProdutos.Append;
         tabAuxProdutosCodigoProduto.Value:=tabReqProdutos.FieldByName('CodigoProduto').AsString;
         tabAuxProdutosDescricao.Value:=tabReqProdutos.FieldByName('Descricao').AsString;
         tabAuxProdutosQuantidade.Value:=tabReqProdutos.FieldByName('Quantidade').AsFloat;
         tabAuxProdutosValor.Value:=tabReqProdutos.FieldByName('Valor').AsFloat;
         tabAuxProdutosValorTotal.Value:=tabReqProdutos.FieldByName('ValorTotal').AsFloat;
         tabAuxProdutos.Post;

         tabReqProdutos.Next;
      end;
   finally
      tabAuxProdutos.First;
      dbgProdutos.DataSource:=dtsAuxProdutos;
   end;
end;

procedure TfmRequisicaoCompras.btnGravarClick(Sender: TObject);
begin
   inherited;
   edtRequisicao.Enabled:=True;
   dbgProdutos.DataSource:=dtsReqProdutos;
end;

procedure TfmRequisicaoCompras.btnCancelarClick(Sender: TObject);
begin
   inherited;
   edtRequisicao.Enabled:=True;
   dbgProdutos.DataSource:=dtsReqProdutos;
end;

procedure TfmRequisicaoCompras.edtRequisicaoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   inherited;
   if tabBase.State = dsBrowse then begin
      if Trim(edtRequisicao.Text) <> '' then begin
         FTyping:=True;
         tabBase.Close;
	       tabBase.ParamByName('Documento').AsFloat:=StrToFloat(edtRequisicao.Text);
         tabBase.Open;
         FTyping:=False;
       end
      else begin
         FTyping:=True;
         tabBase.Close;
         tabBase.ParamByName('Documento').AsFloat:=-1;
         tabBase.Open;
         FTyping:=False;
      end;
   end;
end;

procedure TfmRequisicaoCompras.btnProdutoAdicionarClick(Sender: TObject);
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
      tabAuxProdutos.Append;
      tabAuxProdutosCodigoProduto.Value:=edtCodigoProduto.Text;
      tabAuxProdutosDescricao.Value:=edtDescricaoProdutos.Text;
      tabAuxProdutosQuantidade.Value:=edtQuantidade.Value;
      tabAuxProdutosValor.Value:=edtValor.Value;
      tabAuxProdutosValorTotal.Value:=edtQuantidade.Value * edtValor.Value;
      tabAuxProdutos.Post;

      edtCodigoProduto.Text:='';
      edtDescricaoProdutos.Text:='';
      edtQuantidade.Value:=0;
      edtValor.Value:=0;

      edtCodigoProduto.SetFocus;
   end;
end;

procedure TfmRequisicaoCompras.btnProdutoRemoverClick(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if tabAuxProdutos.RecordCount > 0 then begin
         if Application.MessageBox('Deseja Realmente Excluir o Produto?', PChar(Application.Title), 36) = 7 then exit;
         tabAuxProdutos.Delete;
      end;
   end;
end;

procedure TfmRequisicaoCompras.edtCodigoProdutoChange(Sender: TObject);
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
             end
            else begin
               edtDescricaoProdutos.Text:='';
            end;
         finally
            tabChecagens.Close;
         end;
       end
      else begin
         edtDescricaoProdutos.Text:='';
      end;
   end;
end;

procedure TfmRequisicaoCompras.btnProdutoLocalizarClick(Sender: TObject);
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

procedure TfmRequisicaoCompras.AtualizaDocumento;
begin
   if FTyping = False then begin
      if not tabBase.FieldByName('Documento').IsNull then begin
         edtRequisicao.Text:=FloatToStr(tabBase.FieldByName('Documento').AsFloat);
      end;
   end;
end;

procedure TfmRequisicaoCompras.Baixa1Click(Sender: TObject);
begin
   inherited;
   if tabBase.State = dsBrowse then begin
      if tabBase.FieldByName('DataBaixa').IsNull then begin
         tabBase.Edit;
         tabBase.FieldByName('DataBaixa').AsDateTime:=Date;
         tabBase.Post;
         tabBase.ApplyUpdates;
         Baixa1.Enabled:=False;
      end;
   end;
end;

procedure TfmRequisicaoCompras.btnOpcoesClick(Sender: TObject);
begin
   if tabBase.FieldByName('DataBaixa').IsNull then begin
      Baixa1.Enabled:=True;
    end
   else begin
      Baixa1.Enabled:=False;
   end;
   inherited;
end;

procedure TfmRequisicaoCompras.Emisso1Click(Sender: TObject);
var vRT: TrtRequisicaoCompras;
begin
   inherited;
   if Trim(edtRequisicao.Text) <> '' then begin
      vRT:=TrtRequisicaoCompras.Create(Self);
      vRT.Show;
   end;
end;

end.

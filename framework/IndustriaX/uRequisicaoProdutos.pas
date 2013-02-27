unit uRequisicaoProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, ComCtrls, StdCtrls, Mask, ToolEdit,
  DBCtrls, Buttons, CurrEdit, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset;

type
  TfmRequisicaoProdutos = class(TfmFormBaseAvancado)
    Label1: TLabel;
    edtData: TDateEdit;
    Label2: TLabel;
    edtResponsavel: TDBLookupComboBox;
    Label3: TLabel;
    edtCodigoProduto: TEdit;
    btnProdutoLocalizar: TBitBtn;
    edtDescricaoProduto: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    edtDisponivel: TEdit;
    edtEmpenho: TEdit;
    Label6: TLabel;
    lblTipoMovimento: TLabel;
    edtTipoMovimento: TCurrencyEdit;
    edtObservacoes: TMemo;
    Label7: TLabel;
    btnConfirmar: TBitBtn;
    btnFechar: TBitBtn;
    tabResponsavel: TZQuery;
    dtsResponsavel: TDataSource;
    tabChecagens: TZQuery;
    edtCodigoResponsavel: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnProdutoLocalizarClick(Sender: TObject);
    procedure edtCodigoProdutoChange(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure edtCodigoResponsavelExit(Sender: TObject);
    procedure edtResponsavelCloseUp(Sender: TObject);
    procedure edtCodigoProdutoKeyPress(Sender: TObject; var Key: Char);
  private
    FTipoMovimento: string[1];
  public
    { Public declarations }
  end;

var
  fmRequisicaoProdutos: TfmRequisicaoProdutos;

implementation

uses uFormBaseConfig, uMenu, uLocalizarProdutos, uFuncoes;

{$R *.dfm}

procedure TfmRequisicaoProdutos.FormCreate(Sender: TObject);
begin
   FTipoMovimento:=fmMenu.pubTrans1;
   if FTipoMovimento = '1' then begin
      lblTipoMovimento.Caption:='Entrada';
    end
   else if FTipoMovimento = '2' then begin
      lblTipoMovimento.Caption:='Saída';
   end;
   Caption:='Produtos Requisição de '+lblTipoMovimento.Caption;
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TfmRequisicaoProdutos.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfmRequisicaoProdutos.FormShow(Sender: TObject);
begin
   inherited;
   edtData.Date:=Date;
   tabResponsavel.SQL.Add('SELECT Codigo,Nome,DataSaida FROM funcionarios WHERE DataSaida IS NULL ORDER BY Nome');
   tabResponsavel.Open;
end;

procedure TfmRequisicaoProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabResponsavel.Close;
   inherited;
end;

procedure TfmRequisicaoProdutos.btnProdutoLocalizarClick(Sender: TObject);
begin
   inherited;
   if not Assigned (fmLocalizarProdutos) then begin
      Application.CreateForm(TfmLocalizarProdutos, fmLocalizarProdutos);
      fmLocalizarProdutos.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edtCodigoProduto.Text:=fmMenu.pubTrans1;
   end;
end;

procedure TfmRequisicaoProdutos.edtCodigoProdutoChange(Sender: TObject);
begin
   inherited;
   if Trim(edtCodigoProduto.Text) <> '' then begin
      try
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT CodigoProduto,NomeTecnico FROM produtos WHERE CodigoProduto = '+QuotedStr(edtCodigoProduto.Text));
         tabChecagens.Open;
         if tabChecagens.RecordCount = 1 then begin
            edtDescricaoProduto.Text:=tabChecagens.FieldByName('NomeTecnico').AsString;
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT CodigoProduto,Empenho,Disponivel FROM produtos_status_estoque WHERE CodigoProduto = '+QuotedStr(edtCodigoProduto.Text));
            tabChecagens.Open;
            if tabChecagens.RecordCount = 1 then begin
               edtDisponivel.Text:=FloatToStr(tabChecagens.FieldByName('Disponivel').AsFloat);
               edtEmpenho.Text:=FloatToStr(tabChecagens.FieldByName('Empenho').AsFloat);
             end
            else begin
               edtDisponivel.Text:='';
               edtEmpenho.Text:='';
            end;
          end
         else begin
            edtDescricaoProduto.Text:='';
         end;
      finally
         tabChecagens.Close;
      end;
    end
   else begin
      edtDescricaoProduto.Text:='';
      edtDisponivel.Text:='';
      edtEmpenho.Text:='';
   end;
end;

procedure TfmRequisicaoProdutos.btnConfirmarClick(Sender: TObject);
begin
   inherited;
   if Trim(edtData.Text) = '/  /' then begin
      ShowMessage('Obrigatório Preenchimento da Data');
      edtData.SetFocus;
      exit;
   end;
   if Trim(edtCodigoResponsavel.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Responsável');
      edtCodigoResponsavel.SetFocus;
      exit;
   end;
   if Trim(edtCodigoProduto.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Produto');
      edtCodigoProduto.SetFocus;
      exit;
   end;
   if edtTipoMovimento.Value <= 0 then begin
      ShowMessage(Format('Obrigatório Preenchimento Quantidade da %s', [lblTipoMovimento.Caption]));
      edtTipoMovimento.SetFocus;
      exit;
   end;
   if FTipoMovimento = '2' then begin
      if RoundReal(fmMenu.CalculaEstoque(edtCodigoProduto.Text), 2) < RoundReal(edtTipoMovimento.Value, 2) then begin
         ShowMessage('Saldo Insuficiente');
         edtTipoMovimento.SetFocus;
         exit;
      end;
   end;
   try
      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT * FROM produtos_movimentos WHERE 0');
      tabChecagens.Open;

      tabChecagens.Append;
      tabChecagens.FieldByName('Documento').AsFloat:=CodeGenerator('produtos_movimentos', 'Documento');
      if FTipoMovimento = '1' then begin
         tabChecagens.FieldByName('TipoMovimento').AsInteger:=1;
       end                                        // Entrada
      else begin
         tabChecagens.FieldByName('TipoMovimento').AsInteger:=0;
      end;                                        // Saída
      tabChecagens.FieldByName('Data').AsDateTime:=edtData.Date;
      tabChecagens.FieldByName('CodigoProduto').AsString:=edtCodigoProduto.Text;
      tabChecagens.FieldByName('Descricao').AsString:=edtDescricaoProduto.Text;
      tabChecagens.FieldByName('Quantidade').AsFloat:=edtTipoMovimento.Value;
      tabChecagens.Post;
      tabChecagens.ApplyUpDates;

      fmMenu.AtualizaEstoque(edtCodigoProduto.Text);

      ShowMessage(lblTipoMovimento.Caption+' Concluída com Sucesso');
   finally
      tabChecagens.Close;
      edtCodigoProduto.Text:='';
      edtTipoMovimento.Value:=0;
      edtCodigoProduto.SetFocus;
   end;
end;

procedure TfmRequisicaoProdutos.edtCodigoResponsavelExit(Sender: TObject);
begin
   inherited;
   if Trim(edtCodigoResponsavel.Text) <> '' then begin
      try
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT Codigo FROM funcionarios WHERE Codigo = '+edtCodigoResponsavel.Text);
         tabChecagens.Open;
         if tabChecagens.RecordCount = 1 then begin
            edtResponsavel.KeyValue:=tabChecagens.FieldByName('Codigo').AsFloat;
          end
         else begin
            edtResponsavel.KeyValue:=NULL;
         end;
      finally
         tabChecagens.Close;
      end;
    end
   else begin
      edtResponsavel.KeyValue:=NULL;
   end;
end;

procedure TfmRequisicaoProdutos.edtResponsavelCloseUp(Sender: TObject);
begin
   inherited;
   if Trim(edtResponsavel.Text) <> '' then begin
      edtCodigoResponsavel.Text:=FloatToStr(edtResponsavel.KeyValue);
   end;
end;

procedure TfmRequisicaoProdutos.edtCodigoProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
   inherited;
   if Key = #32 then Key:=#0 else Key:=UpCase(Key);
end;

end.

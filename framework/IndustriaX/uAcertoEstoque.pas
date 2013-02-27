unit uAcertoEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, CurrEdit, Buttons, DBCtrls, Mask,
  ToolEdit, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TfmAcertoEstoque = class(TfmFormBaseAvancado)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblTipoMovimento: TLabel;
    Label7: TLabel;
    edtData: TDateEdit;
    edtResponsavel: TDBLookupComboBox;
    edtCodigoProduto: TEdit;
    btnProdutoLocalizar: TBitBtn;
    edtDescricaoProduto: TEdit;
    edtDisponivel: TEdit;
    edtEmpenho: TEdit;
    edtAcerto: TCurrencyEdit;
    edtObservacoes: TMemo;
    btnConfirmar: TBitBtn;
    btnFechar: TBitBtn;
    edtCodigoResponsavel: TEdit;
    tabResponsavel: TZQuery;
    dtsResponsavel: TDataSource;
    tabChecagens: TZQuery;
    edtHora: TEdit;
    Label8: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnProdutoLocalizarClick(Sender: TObject);
    procedure edtCodigoProdutoChange(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure edtCodigoResponsavelExit(Sender: TObject);
    procedure edtResponsavelCloseUp(Sender: TObject);
    procedure edtCodigoResponsavelKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAcertoEstoque: TfmAcertoEstoque;

implementation

uses uFormBase, uLocalizarProdutos, uMenu, uFuncoes;

{$R *.dfm}

procedure TfmAcertoEstoque.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TfmAcertoEstoque.btnFecharClick(Sender: TObject);
begin
   inherited;
   Close;
end;

procedure TfmAcertoEstoque.FormShow(Sender: TObject);
begin
   inherited;
   edtData.Date:=Date;
   edtHora.Text:=FormatDateTime('hh:nn:ss', Now);
   tabResponsavel.SQL.Add('SELECT Codigo,Nome,DataSaida FROM funcionarios WHERE DataSaida IS NULL ORDER BY Nome');
   tabResponsavel.Open;
end;

procedure TfmAcertoEstoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabResponsavel.Close;
   inherited;
end;

procedure TfmAcertoEstoque.btnProdutoLocalizarClick(Sender: TObject);
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

procedure TfmAcertoEstoque.edtCodigoProdutoChange(Sender: TObject);
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

procedure TfmAcertoEstoque.btnConfirmarClick(Sender: TObject);
var vDocumento, vSaldo, vEntradas, vSaidas: real;
begin
  inherited;
   if Trim(edtData.Text) = '/  /' then begin
      ShowMessage('Obrigatório Preenchimento da Data');
      edtData.SetFocus;
      exit;
   end;
   if Trim(edtHora.Text) = ':  :' then begin
      ShowMessage('Obrigatório Preenchimento da Hora');
      edtHora.SetFocus;
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
   if edtAcerto.Value <= 0 then begin
      ShowMessage('Obrigatório Preenchimento do Acerto');
      edtAcerto.SetFocus;
      exit;
   end;
   vEntradas:=0;
   vSaidas:=0;
   try
      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT * FROM acertos WHERE 0');
      tabChecagens.Open;

      tabChecagens.Append;
      vDocumento:=CodeGenerator('acertos', 'Documento');
      tabChecagens.FieldByName('Documento').AsFloat:=vDocumento;
      tabChecagens.FieldByName('Data').AsDateTime:=edtData.Date;
      tabChecagens.FieldByName('Hora').AsDateTime:=StrToTime(edtHora.Text);
      tabChecagens.FieldByName('CodigoFuncionario').AsFloat:=StrToFloat(edtCodigoResponsavel.Text);
      tabChecagens.Post;
      tabChecagens.ApplyUpdates;

      vSaldo:=fmMenu.CalculaEstoque(edtCodigoProduto.Text);

      if vSaldo <= 0 then begin   // -2, -1, 0
         vEntradas:=Abs(vSaldo)+edtAcerto.Value;
       end
      else begin                 // 1, 2, 3
         if edtAcerto.Value > vSaldo then begin
            vEntradas:=edtAcerto.Value-vSaldo;
          end
         else begin
            vSaidas:=vSaldo-edtAcerto.Value;
         end;
      end;

      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT * FROM acertos_produtos WHERE 0');
      tabChecagens.Open;

      if vEntradas > 0 then begin
         tabChecagens.Append;
         tabChecagens.FieldByName('Documento').AsFloat:=vDocumento;
         tabChecagens.FieldByName('CodigoProduto').AsString:=edtCodigoProduto.Text;
         tabChecagens.FieldByName('Descricao').AsString:=edtDescricaoProduto.Text;
         tabChecagens.FieldByName('Quantidade').AsFloat:=vEntradas;
         tabChecagens.FieldByName('TipoAcerto').AsInteger:=1;
         tabChecagens.Post;
         tabChecagens.ApplyUpdates;
      end;

      if vSaidas > 0 then begin
         tabChecagens.Append;
         tabChecagens.FieldByName('Documento').AsFloat:=vDocumento;
         tabChecagens.FieldByName('CodigoProduto').AsString:=edtCodigoProduto.Text;
         tabChecagens.FieldByName('Descricao').AsString:=edtDescricaoProduto.Text;
         tabChecagens.FieldByName('Quantidade').AsFloat:=vSaidas;
         tabChecagens.FieldByName('TipoAcerto').AsInteger:=0;
         tabChecagens.Post;
         tabChecagens.ApplyUpdates;
      end;

      fmMenu.AtualizaEstoque(edtCodigoProduto.Text);

      edtCodigoProduto.Text:='';
      edtAcerto.Value:=0;

      Showmessage('Acerto Concluido com Sucesso');

      edtCodigoProduto.SetFocus;

   finally
      tabChecagens.Close;
   end;
end;

procedure TfmAcertoEstoque.edtCodigoResponsavelExit(Sender: TObject);
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

procedure TfmAcertoEstoque.edtResponsavelCloseUp(Sender: TObject);
begin
  inherited;
   if Trim(edtResponsavel.Text) <> '' then begin
      edtCodigoResponsavel.Text:=FloatToStr(edtResponsavel.KeyValue);
   end;
end;

procedure TfmAcertoEstoque.edtCodigoResponsavelKeyPress(Sender: TObject;
  var Key: Char);
begin
   inherited;
   if Key = #32 then Key:=#0 else Key:=UpCase(Key);
end;

end.

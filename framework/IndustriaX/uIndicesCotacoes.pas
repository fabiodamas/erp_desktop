unit uIndicesCotacoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, Menus, Grids, DBGrids, StdCtrls, DBCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Buttons;

type
  TfmIndicesCotacoes = class(TfmFormBaseAvancado)
    edtCotacao: TComboBox;
    Label1: TLabel;
    dbgCotacoes: TDBGrid;
    edtIndice: TDBLookupComboBox;
    Label2: TLabel;
    tabIndices: TZQuery;
    dtsIndices: TDataSource;
    btnCotacaoAdicionar: TBitBtn;
    btnCotacaoRemover: TBitBtn;
    tabCotacoes: TZQuery;
    dtsCotacoes: TDataSource;
    tabChecagens: TZQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCotacaoAdicionarClick(Sender: TObject);
    procedure btnCotacaoRemoverClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmIndicesCotacoes: TfmIndicesCotacoes;

implementation

uses uFormBase, uFuncoes;

{$R *.dfm}

procedure TfmIndicesCotacoes.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild); 
end;

procedure TfmIndicesCotacoes.FormShow(Sender: TObject);
begin
   inherited;
   edtCotacao.Items:=GetCotacoesUpdates;

   tabIndices.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('20'));
   tabIndices.Open;

   tabCotacoes.SQL.Add('SELECT * FROM indices_cotacoes');
   tabCotacoes.Open;
end;

procedure TfmIndicesCotacoes.FormClose(Sender: TObject;
  var Action: TCloseAction); 
begin
   tabIndices.Close;
   tabCotacoes.Close;
   tabChecagens.Close; 
   inherited;
end;

procedure TfmIndicesCotacoes.btnCotacaoAdicionarClick(Sender: TObject);
begin
   inherited;
   if Trim(edtCotacao.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Cotação');
      edtCotacao.SetFocus;
      exit;
   end;
   if Trim(edtIndice.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Indice');
      edtIndice.SetFocus;
      exit;
   end;

   tabChecagens.Close;
   tabChecagens.SQL.Clear;
   tabChecagens.SQL.Add('SELECT * FROM indices_cotacoes ');
   tabChecagens.SQL.Add('WHERE Cotacao = '+QuotedStr(edtCotacao.Text));
   tabChecagens.Open;

   if tabChecagens.RecordCount = 1 then begin
      ShowMessage('Cotação já Cadastrada');
      exit;
   end;

   tabCotacoes.Append;
   tabCotacoes.FieldByName('Cotacao').AsString:=edtCotacao.Text;
   tabCotacoes.FieldByName('Indice').AsFloat:=StrToFloat(edtIndice.KeyValue);
   tabCotacoes.Post;
   tabCotacoes.ApplyUpDates;

   edtCotacao.ItemIndex:=-1;
   edtIndice.KeyValue:=NULL;  

   edtCotacao.SetFocus;
end;

procedure TfmIndicesCotacoes.btnCotacaoRemoverClick(Sender: TObject);
begin
   inherited;
   if tabCotacoes.RecordCount > 0 then begin
      if Application.MessageBox('Deseja Realmente Excluir?', PChar(Application.Title), 36) = 7 then exit;
      tabCotacoes.Delete;
      tabCotacoes.ApplyUpdates;
   end;
end;

end.

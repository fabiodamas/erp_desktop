unit uAproveitamentoLote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, Mask, ToolEdit, Buttons, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBCtrls;

type
  TfmAproveitamentoLote = class(TfmFormBaseAvancado)
    edtCodigoCliente: TEdit;
    Label1: TLabel;
    edtData: TDateEdit;
    Label2: TLabel;
    edtNumeroCavidades: TEdit;
    Label3: TLabel;
    edtInjecoes: TEdit;
    Label4: TLabel;
    btnOK: TBitBtn;
    btnFechar: TBitBtn;
    tabAprov: TZQuery;
    dtsAprov: TDataSource;
    tabChecagens: TZQuery;
    btnLocalizarCliente: TBitBtn;
    edtPerdas: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    edtCodigoProduto: TEdit;
    btnLocalizarProdutos: TBitBtn;
    edtCliente: TEdit;
    edtProduto: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnLocalizarClienteClick(Sender: TObject);
    procedure edtCodigoClienteChange(Sender: TObject);
    procedure edtCodigoProdutoChange(Sender: TObject);
    procedure btnLocalizarProdutosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAproveitamentoLote: TfmAproveitamentoLote;

implementation

uses uFormBaseConfig, uFuncoes, uMenu, uLocalizarClientes,
     uLocalizarProdutos;

{$R *.dfm}

procedure TfmAproveitamentoLote.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TfmAproveitamentoLote.FormShow(Sender: TObject);
begin
   inherited;

   tabAprov.SQL.Add('SELECT * FROM aproveitamento WHERE 0');
   tabAprov.Open;
end;

procedure TfmAproveitamentoLote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabAprov.Close;
   inherited;
end;

procedure TfmAproveitamentoLote.btnFecharClick(Sender: TObject);
begin
   Close; 
end;

procedure TfmAproveitamentoLote.btnOKClick(Sender: TObject);
var vAprov : Integer;
    vID: real;
begin
   if Trim(edtNumeroCavidades.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Numero de Cavidades');
      edtNumeroCavidades.SetFocus;
      exit;
   end;
   if Trim(edtInjecoes.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Numero de Injeções');
      edtInjecoes.SetFocus;
      exit;
   end;
   if Trim(edtPerdas.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento das Perdas');
      edtPerdas.SetFocus;
      exit;
   end;
   if Trim(edtData.Text) = '/  /' then begin
      ShowMessage('Obrigatório Preenchimento da Data');
      edtData.SetFocus;
      exit;
   end;
   if Trim(edtCodigoCliente.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Cliente');
      edtCodigoCliente.SetFocus;
      exit;
   end;
   if Trim(edtCodigoProduto.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Produto');
      edtCodigoProduto.SetFocus;
      exit;
   end; 

   tabAprov.Append; 

   vID:=CodeGenerator('aproveitamento', 'ID');
   tabAprov.FieldByName('ID').AsFloat:=vID;
   tabAprov.FieldByName('Data').AsDateTime:=edtData.Date;
   tabAprov.FieldByName('CodigoCliente').AsFloat:=StrToFloat(edtCodigoCliente.Text);
   tabAprov.FieldByName('CodigoProduto').AsString:=edtCodigoProduto.Text;
   tabAprov.FieldByName('PecasInjetadas').AsInteger:=StrToInt(edtNumeroCavidades.Text) * StrToInt(edtInjecoes.Text);
   tabAprov.FieldByName('Perdas').AsInteger:=StrToInt(edtPerdas.Text);

   vAprov:=(StrToInt(edtNumeroCavidades.Text) * StrToInt(edtInjecoes.Text)) - StrToInt(edtPerdas.Text);

   tabAprov.Post;
   tabAprov.ApplyUpdates;

   tabChecagens.Close;
   tabChecagens.SQL.Clear;
   tabChecagens.SQL.Add('SELECT * FROM produtos_movimentos WHERE 0');
   tabChecagens.Open;

   tabChecagens.Append;
   tabChecagens.FieldByName('Documento').AsFloat:=CodeGenerator('produtos_movimentos', 'Documento');
   tabChecagens.FieldByName('TipoMovimento').AsFloat:=1;
   tabChecagens.FieldByName('Data').AsDateTime:=edtData.Date;
   tabChecagens.FieldByName('CodigoProduto').AsString:=edtCodigoProduto.Text;
   tabChecagens.FieldByName('Quantidade').AsFloat:=vAprov;
   tabChecagens.FieldByName('Referencia').AsFloat:=vID;
   tabChecagens.FieldByName('ReferenciaDesc').AsString:='Aproveitamento';
   tabChecagens.Post;
   tabChecagens.ApplyUpDates;

   fmMenu.AtualizaEstoque(edtCodigoProduto.Text); 
   
   edtPerdas.Text:='';
   edtInjecoes.Text:=''; 
   edtInjecoes.SetFocus;

   ShowMessage('Gravado com Sucesso');
end;

procedure TfmAproveitamentoLote.btnLocalizarClienteClick(Sender: TObject);
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

procedure TfmAproveitamentoLote.edtCodigoClienteChange(Sender: TObject);
begin
   inherited; 
   if Trim(edtCodigoCliente.Text) <> '' then begin
      try
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT CodigoCliente, NomeFantasia FROM clientes WHERE CodigoCliente = '+edtCodigoCliente.Text);
         tabChecagens.Open;
         if tabChecagens.RecordCount > 0 then begin
            edtCliente.Text:=tabChecagens.FieldByName('NomeFantasia').AsString;
          end
         else begin
            edtCliente.Text:='';
         end;
      finally
         tabChecagens.Close;
      end;
    end
   else begin
      edtCliente.Text:='';
   end;
end;  

procedure TfmAproveitamentoLote.edtCodigoProdutoChange(Sender: TObject);
begin
   inherited;
   if Trim(edtCodigoProduto.Text) <> '' then begin 
      try
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT CodigoProduto, NomeTecnico FROM produtos WHERE CodigoProduto = '+QuotedStr(edtCodigoProduto.Text));
         tabChecagens.Open;
         if tabChecagens.RecordCount > 0 then begin
            edtProduto.Text:=tabChecagens.FieldByName('NomeTecnico').AsString;
          end
         else begin
            edtProduto.Text:='';
         end;
      finally
         tabChecagens.Close;
      end;
    end
   else begin
      edtProduto.Text:=''; 
   end;
end;

procedure TfmAproveitamentoLote.btnLocalizarProdutosClick(Sender: TObject);
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

end.

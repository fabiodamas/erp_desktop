unit uConsultaOrcamentosCompras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, ExtCtrls, Grids, DBGrids,
  Buttons, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TfmConsultaOrcamentosCompras = class(TfmFormBaseAvancado)
    Label1: TLabel;
    edtRequisicao: TEdit;
    rdgStatus: TRadioGroup;
    dbgOrcamentos: TDBGrid;
    btnConsultar: TBitBtn;
    btnAprovar: TBitBtn;
    btnFechar: TBitBtn;
    tabBase: TZQuery;
    dtsBase: TDataSource;
    tabChecagens: TZQuery;
    procedure FormCreate(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAprovarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmConsultaOrcamentosCompras: TfmConsultaOrcamentosCompras;

implementation

uses uFormBaseConfig, uMenu;

{$R *.dfm}

procedure TfmConsultaOrcamentosCompras.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TfmConsultaOrcamentosCompras.btnConsultarClick(Sender: TObject);
var vWhere : string;
begin
   inherited;
   vWhere:='';

   tabBase.Close;
   tabBase.SQL.Clear;
   tabBase.SQL.Add('SELECT orcamentos_compras_produtos.Orcamento, fornecedores.NomeFantasia As Fornecedor,');
   tabBase.SQL.Add('orcamentos_compras_produtos.CodigoProduto, orcamentos_compras_produtos.Descricao,');
   tabBase.SQL.Add('orcamentos_compras_produtos.Quantidade, orcamentos_compras_produtos.Valor, orcamentos_compras_produtos.Documento');
   tabBase.SQL.Add('FROM orcamentos_compras_produtos');
   tabBase.SQL.Add('LEFT JOIN fornecedores ON fornecedores.CodigoFornecedor = orcamentos_compras_produtos.CodigoFornecedor');

   if Trim(edtRequisicao.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'Documento = '+edtRequisicao.Text;
   end;

   case rdgStatus.ItemIndex of
      1: begin
         if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
         vWhere:=vWhere + 'Aprovado = 0';
      end;
      2: begin
         if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
         vWhere:=vWhere + 'Aprovado = 1';
      end;
   end;

   if Trim(vWhere) <> '' then begin
      tabBase.SQL.Add('WHERE');
      tabBase.SQL.Add(vWhere);
   end;

   tabBase.Open;
end;

procedure TfmConsultaOrcamentosCompras.btnFecharClick(Sender: TObject);
begin
   inherited;
   Close;
end;

procedure TfmConsultaOrcamentosCompras.FormShow(Sender: TObject);
begin
   inherited;
   btnConsultar.Click;
end;

procedure TfmConsultaOrcamentosCompras.btnAprovarClick(Sender: TObject);
begin
  inherited;
   if tabBase.RecordCount > 0 then begin
      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT * FROM orcamentos_compras_produtos WHERE Documento = '+FloatToStr(tabBase.FieldByName('Documento').AsFloat));
      tabChecagens.SQL.Add('AND Orcamento = '+FloatToStr(tabBase.FieldByName('Orcamento').AsFloat));
      tabChecagens.Open;
      tabChecagens.First;
      while not tabChecagens.Eof do begin

         tabChecagens.Edit;
         tabChecagens.FieldByName('Aprovado').AsInteger:=1;
         tabChecagens.Post;
         tabChecagens.ApplyUpdates;

         tabChecagens.Next;
      end;
      tabChecagens.Close;
      btnConsultar.Click;
      ShowMessage('Orçamento Aprovado');
   end;
end;

end.

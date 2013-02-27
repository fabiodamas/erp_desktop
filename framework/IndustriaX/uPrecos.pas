unit uPrecos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, StdCtrls, Mask, DBCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Menus, Buttons, ExtCtrls,
  Grids, DBGrids, ToolEdit, RXDBCtrl;

type
  TfmPrecos = class(TfmFormBaseCadastro)
    Label2: TLabel;
    edtProduto: TDBEdit;
    Label1: TLabel;
    edtTabela: TDBEdit;
    edtPrecoAtual: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtCodigoProduto: TDBEdit;
    Label5: TLabel;
    edtCodigoTabela: TDBEdit;
    dbgPrecos: TDBGrid;
    btnLocalizarProduto: TBitBtn;
    btnLocalizarTabela: TBitBtn;
    tabProdutos: TZQuery;
    dtsProdutos: TDataSource;
    tabTipoTabelas: TZQuery;
    dtsTipoTabelas: TDataSource;
    tabChecagens: TZQuery;
    edtDataAjuste: TDBDateEdit;
    Label30: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure dtsBaseDataChange(Sender: TObject; Field: TField);
    procedure btnLocalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Novo; override;
    procedure Editar; override;
    procedure Deletar; override;
    procedure Cancelar; override;
    function Checagens: Boolean; override;
  end;

var
  fmPrecos: TfmPrecos;

implementation

uses uMenu, uFormBaseConfig, uLocalizarProdutos;

{$R *.dfm}

procedure TfmPrecos.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TfmPrecos.FormShow(Sender: TObject);
begin
   inherited;

   tabProdutos.Params.CreateParam(ftString, 'CodigoProduto', ptUnknown);
   tabProdutos.SQL.Add('SELECT * FROM produtos WHERE CodigoProduto = :CodigoProduto');
   tabProdutos.Open;

   tabTipoTabelas.Params.CreateParam(ftString, 'CodigoTabela', ptUnknown);
   tabTipoTabelas.SQL.Add('SELECT * FROM tipos_tabela_preco WHERE Codigo = :CodigoTabela');
   tabTipoTabelas.Open;

   tabBase.SQL.Add('SELECT * FROM tabela_precos');
   tabBase.Open;
end;

procedure TfmPrecos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabBase.Close;
   tabProdutos.Close;
   tabTipoTabelas.Close;
   inherited;
end;

procedure TfmPrecos.Editar;
begin
end;

procedure TfmPrecos.Cancelar;
begin
end;

function TfmPrecos.Checagens: Boolean;
begin
   Result:=False;
   if Trim(edtCodigoProduto.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Produto');
      edtCodigoProduto.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtCodigoTabela.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Tabela de Preço');
      edtCodigoTabela.SetFocus;
      Result:=True; 
      exit;
   end;
   if edtPrecoAtual.Text = '' then begin
      ShowMessage('Obrigatório Preenchimento do Preço Atual');
      edtPrecoAtual.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtDataAjuste.Text) = '/  /' then begin
      ShowMessage('Obrigatório Preenchimento da Data do Ajuste');
      edtDataAjuste.SetFocus;
      Result:=True; 
      exit;
   end;
   if tabBase.State in [dsInsert] then begin
      try
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT CodigoProduto, CodigoTabela FROM tabela_precos WHERE CodigoProduto = '+QuotedStr(edtCodigoProduto.Text)+' AND CodigoTabela = '+edtCodigoTabela.Text);
         tabChecagens.Open;
         if tabChecagens.RecordCount > 0 then begin
            ShowMessage('Preço do Produto nessa Tabela já Existe');
            edtCodigoProduto.SetFocus;
            Result:=True;
            exit;
         end;
      finally
         tabChecagens.Close;
      end;
   end;
end;

procedure TfmPrecos.Deletar;
begin
end;

procedure TfmPrecos.Novo;
begin
end;

procedure TfmPrecos.btnNovoClick(Sender: TObject);
begin
   inherited;
   tabBase.FieldByName('DataReajuste').AsDateTime:=Date;
   edtCodigoProduto.SetFocus;
end;

procedure TfmPrecos.dtsBaseDataChange(Sender: TObject; Field: TField);
begin
   inherited;
   tabProdutos.Close;
   tabProdutos.ParamByName('CodigoProduto').AsString:=tabBase.FieldByName('CodigoProduto').AsString;
   tabProdutos.Open;

   tabTipoTabelas.Close;
   tabTipoTabelas.ParamByName('CodigoTabela').AsFloat:=tabBase.FieldByName('CodigoTabela').AsFloat;
   tabTipoTabelas.Open;
end;

procedure TfmPrecos.btnLocalizarClick(Sender: TObject);
begin
   inherited;
   if not Assigned (fmLocalizarProdutos) then begin
      Application.CreateForm(TfmLocalizarProdutos, fmLocalizarProdutos);
      fmLocalizarProdutos.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      tabBase.Close;
      tabBase.SQL.Clear;
      tabBase.SQL.Add('SELECT * FROM tabela_precos WHERE CodigoProduto = '+QuotedStr(fmMenu.pubTrans1));
      tabBase.Open;
      AfterOpen(tabBase);
   end;
end;

end.

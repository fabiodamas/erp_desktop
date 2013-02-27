unit uTabelaCorreio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, Menus, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Buttons, ExtCtrls, DBCtrls, StdCtrls, Mask,
  ToolEdit, RXDBCtrl, Grids, DBGrids;

type
  TfmTabelaCorreio = class(TfmFormBaseCadastro)
    edtData: TDBDateEdit;
    Label2: TLabel;
    edtPedido: TDBEdit;
    Label3: TLabel;
    edtValorCobrado: TDBEdit;
    Label1: TLabel;
    edtValorCorreio: TDBEdit;
    Label4: TLabel;
    dbgTabelaCorreio: TDBGrid;
    edtConhecimento: TDBEdit;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
  private
    procedure AtualizaTotal;
    procedure AtualizaConhecimento(pPedido: real; pConhecimento: string);
  public
    procedure Novo; override;
    procedure Editar; override;
    procedure Deletar; override;
    procedure Cancelar; override;
    function Checagens: Boolean; override;
  end;

var
  fmTabelaCorreio: TfmTabelaCorreio;

implementation

uses uFormBaseConfig, uMenu, uFuncoes;

{$R *.dfm}

procedure TfmTabelaCorreio.Novo;
begin
  tabBase.FieldByName('ID').AsFloat:=CodeGenerator('tabela_correio', 'ID');
  AtualizaTotal;
  AtualizaConhecimento(tabBase.FieldByName('Pedido').AsFloat, tabBase.FieldByName('Conhecimento').AsString); 
end;

procedure TfmTabelaCorreio.Editar;
begin
  AtualizaTotal;
  AtualizaConhecimento(tabBase.FieldByName('Pedido').AsFloat, tabBase.FieldByName('Conhecimento').AsString);
end;

procedure TfmTabelaCorreio.Cancelar;
begin
end;

function TfmTabelaCorreio.Checagens: Boolean;
begin
  Result:=False;
  if Trim(edtData.Text) = '/  /' then
  begin
    ShowMessage('Obrigatório Preenchimento da Data');
    edtData.SetFocus;
    Result:=True;
    exit;
  end;
  if Trim(edtPedido.Text) = '' then
  begin
    ShowMessage('Obrigatório Preenchimento do Pedido');
    edtPedido.SetFocus;
    Result:=True;
    exit;
  end;   
end;

procedure TfmTabelaCorreio.Deletar;
begin
end;

procedure TfmTabelaCorreio.FormCreate(Sender: TObject);
begin
  inherited;
  SetFormStyle(fsMDIChild);
end;

procedure TfmTabelaCorreio.FormShow(Sender: TObject);
begin
  inherited;
  tabBase.SQL.Add('SELECT * FROM tabela_correio ');
  tabBase.SQL.Add('ORDER BY Data DESC ');
  tabBase.Open;
end;

procedure TfmTabelaCorreio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tabBase.Close;
  inherited;
end;

procedure TfmTabelaCorreio.btnNovoClick(Sender: TObject);
begin
  inherited;
  tabBase.FieldByName('Data').AsDateTime:=Date;
  edtPedido.SetFocus;
end;

procedure TfmTabelaCorreio.AtualizaTotal;
begin
  tabBase.FieldByName('ValorTotal').AsFloat:=tabBase.FieldByName('ValorCorreio').AsFloat-tabBase.FieldByName('ValorCobrado').AsFloat
end;

procedure TfmTabelaCorreio.AtualizaConhecimento(pPedido: real; pConhecimento: string);
var vTabPedido: TZQuery;
begin
  vTabPedido:=TZQuery.Create(nil);
  try
    vTabPedido.Connection:=fmMenu.zcnConexao;
    if Trim(pConhecimento) <> '' then
    begin
      vTabPedido.Close;
      vTabPedido.SQL.Clear;
      vTabPedido.SQL.Add('SELECT * FROM pedidos WHERE NPedido = '+QuotedStr(FloatToStr(pPedido)));
      vTabPedido.Open;

      if vTabPedido.RecordCount = 1 then
      begin
        vTabPedido.Edit;
        vTabPedido.FieldByName('Conhecimento').AsString:=pConhecimento;
        vTabPedido.Post;
        vTabPedido.ApplyUpdates;
      end;
    end;
  finally
    vTabPedido.Close;
    vTabPedido.Free;
  end;
end;

end.

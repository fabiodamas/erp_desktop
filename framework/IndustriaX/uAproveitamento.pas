unit uAproveitamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Menus, Buttons, ExtCtrls, ToolEdit, RXDBCtrl, StdCtrls, Mask,
  DBCtrls, QRCtrls, QuickRpt, Grids, DBGrids;

type
  TfmAproveitamento = class(TfmFormBaseCadastro)
    edtCodigoCliente: TDBEdit;
    Label1: TLabel;
    edtNomeCliente: TDBEdit;
    Label2: TLabel;
    edtPecasInjetadas: TDBEdit;
    Label3: TLabel;
    edtPerdas: TDBEdit;
    Label4: TLabel;
    edtAproveitamento: TEdit;
    edtData: TDBDateEdit;
    Label5: TLabel;
    Label6: TLabel;
    Estatisticas1: TMenuItem;
    FichadePreenchimento1: TMenuItem;
    tabClientes: TZQuery;
    dtsClientes: TDataSource;
    btnLocalizarCliente: TBitBtn;
    LanaremLote1: TMenuItem;
    dbgAproveitamento: TDBGrid;
    RelaodeAproveitamento1: TMenuItem;
    Label7: TLabel;
    Label8: TLabel;
    edtCodigoProduto: TDBEdit;
    edtProduto: TDBEdit;
    btnLocalizarProdutos: TBitBtn;
    tabProdutos: TZQuery;
    dtsProdutos: TDataSource;
    N1: TMenuItem;
    EstatsticaporDia1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLocalizarClienteClick(Sender: TObject);
    procedure Estatisticas1Click(Sender: TObject);
    procedure LanaremLote1Click(Sender: TObject);
    procedure RelaodeAproveitamento1Click(Sender: TObject);
    procedure btnLocalizarProdutosClick(Sender: TObject);
    procedure EstatsticaporDia1Click(Sender: TObject);
    procedure dtsBaseDataChange(Sender: TObject; Field: TField);
    procedure btnNovoClick(Sender: TObject);
  private
    procedure AtualizaAproveitamento;
  public
    procedure Novo; override;
    procedure Editar; override;
    procedure Deletar; override;
    procedure Cancelar; override;
    function Checagens: Boolean; override;
  end;

var
  fmAproveitamento: TfmAproveitamento;

implementation

uses uMenu, uConstantes, uFormBaseConfig, uFuncoes, uLocalizarClientes,
     gInjecoesClientes, uAproveitamentoLote, rAproveitamento, uLocalizarProdutos,
     gInjecoesDia;

{$R *.dfm}

procedure TfmAproveitamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabBase.Close;
   tabClientes.Close;
   inherited;
end;

procedure TfmAproveitamento.FormShow(Sender: TObject);
begin
   inherited;

   tabClientes.Params.CreateParam(ftFloat, 'CodigoCliente', ptUnknown);
   tabClientes.SQL.Add('SELECT CodigoCliente,NomeFantasia FROM clientes WHERE CodigoCliente = :CodigoCliente');
   tabClientes.Open;

   tabProdutos.Params.CreateParam(ftFloat, 'CodigoProduto', ptUnknown);
   tabProdutos.SQL.Add('SELECT CodigoProduto,NomeTecnico FROM produtos WHERE CodigoProduto = :CodigoProduto');
   tabProdutos.Open;

   tabBase.SQL.Add('SELECT * FROM aproveitamento ORDER BY Data DESC '+db_limite_cmd+' '+IntToStr(db_limite_registros));
   tabBase.Open;
end;

procedure TfmAproveitamento.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TfmAproveitamento.Editar;
begin
end;

procedure TfmAproveitamento.Cancelar;
begin
end;

function TfmAproveitamento.Checagens: Boolean;
begin
   Result:=False;
   if Trim(edtData.Text) = '/  /' then begin
      Showmessage('Obrigatório Preenchimento da Data');
      edtData.SetFocus;
      Result:=true;
      exit;
   end;
   if tabBase.FieldByName('PecasInjetadas').AsInteger <= 0 then begin
      Showmessage('Obrigatório Preenchimento das Peças Injetadas');
      edtPecasInjetadas.SetFocus;
      Result:=true;
      exit;
   end;
   if tabBase.FieldByName('Perdas').AsInteger > tabBase.FieldByName('PecasInjetadas').AsInteger then begin
      Showmessage('Perda Superior a Peças Injetadas');
      edtPerdas.SetFocus;
      Result:=true;
      exit;
   end;
end;

procedure TfmAproveitamento.Deletar;
begin
end;

procedure TfmAproveitamento.Novo;
begin
   tabBase.FieldByName('ID').AsFloat:=CodeGenerator('aproveitamento', 'ID');
end;

procedure TfmAproveitamento.AtualizaAproveitamento;
begin
   edtAproveitamento.Text:=IntToStr(tabBase.FieldByName('PecasInjetadas').AsInteger-tabBase.FieldByName('Perdas').AsInteger);
end;

procedure TfmAproveitamento.btnLocalizarClienteClick(Sender: TObject);
begin
   if tabBase.State in [dsInsert, dsEdit] then begin
      if not Assigned (fmLocalizarClientes) then begin
         Application.CreateForm(TfmLocalizarClientes, fmLocalizarClientes);
         fmLocalizarClientes.ShowModal;
      end;
      if Trim(fmMenu.pubTrans1) <> '' then begin 
         tabBase.FieldByName('CodigoCliente').AsFloat:=StrToFloat(fmMenu.pubTrans1);
      end;
   end;
end;

procedure TfmAproveitamento.Estatisticas1Click(Sender: TObject);
var vRT : TgfInjecoesClientes;
begin
   vRT:=TgfInjecoesClientes.Create(Self);
   vRT.Show;
end;

procedure TfmAproveitamento.LanaremLote1Click(Sender: TObject);
var vFrm: TfmAproveitamentoLote;
begin
   vFrm:=TfmAproveitamentoLote.Create(Self);
   vFrm.Show;
end;

procedure TfmAproveitamento.RelaodeAproveitamento1Click(Sender: TObject);
var vRT: TrtAproveitamento;
begin
   inherited;
   vRT:=TrtAproveitamento.Create(Self);
   vRT.Show;
end;

procedure TfmAproveitamento.btnLocalizarProdutosClick(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin 
      if not Assigned (fmLocalizarProdutos) then begin
         Application.CreateForm(TfmLocalizarProdutos, fmLocalizarProdutos);
         fmLocalizarProdutos.ShowModal;
      end;
      if Trim(fmMenu.pubTrans1) <> '' then begin
         tabBase.FieldByName('CodigoProduto').AsString:=fmMenu.pubTrans1;
      end;
   end;
end;

procedure TfmAproveitamento.EstatsticaporDia1Click(Sender: TObject);
var vGF: TgfInjecoesDia;
begin
   inherited;
   vGF:=TgfInjecoesDia.Create(Self);
   vGF.Show;
end;

procedure TfmAproveitamento.dtsBaseDataChange(Sender: TObject;
  Field: TField);
begin
   inherited;
   tabClientes.Close;
   tabClientes.ParamByName('CodigoCliente').AsFloat:=tabBase.FieldByName('CodigoCliente').AsFloat;
   tabClientes.Open;

   tabProdutos.Close;
   tabProdutos.ParamByName('CodigoProduto').AsString:=tabBase.FieldByName('CodigoProduto').AsString;
   tabProdutos.Open;

   AtualizaAproveitamento;
end;

procedure TfmAproveitamento.btnNovoClick(Sender: TObject);
begin
   inherited;
   tabBase.FieldByName('Data').AsDateTime:=Date;
   edtCodigoCliente.SetFocus;
end;

end.

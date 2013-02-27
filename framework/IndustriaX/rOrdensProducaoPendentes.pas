unit rOrdensProducaoPendentes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls;

type
  TrtOrdensProducaoPendentes = class(TfmFormBaseRelatorio)
    edtCodigoCliente: TEdit;
    lblCodigo: TLabel;
    Label2: TLabel;
    rdgOrdemEmissao: TRadioGroup;
    tabBase: TZQuery;
    dtsBase: TDataSource;
    pndDialogo: TPrintDialog;
    qrpOP: TQuickRep;
    QRSubDetail1: TQRSubDetail;
    btnLocalizaCliente: TBitBtn;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    qrlSignature: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    Label1: TLabel;
    Label3: TLabel;
    edtCodigoProduto: TEdit;
    btnLocalizaProduto: TBitBtn;
    edtDescricaoProduto: TEdit;
    edtNomeCliente: TEdit;
    QRShape1: TQRShape;
    qrlTitulo: TQRLabel;
    QRSysData1: TQRSysData;
    qrlTotal: TQRLabel;
    QRShape2: TQRShape;
    tabChecagens: TZQuery;
    QRSysData2: TQRSysData;
    rdgTipoOP: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnLocalizaClienteClick(Sender: TObject);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure edtCodigoClienteChange(Sender: TObject);
    procedure edtCodigoProdutoChange(Sender: TObject);
    procedure btnLocalizaProdutoClick(Sender: TObject);
    procedure edtCodigoProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoClienteKeyPress(Sender: TObject; var Key: Char);
    procedure qrpOPBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    procedure GerarImpressao(Impressora: Boolean = False);
  public
  end;

var
   vTotQtd: real;

implementation

uses uFormBase, uMenu, uFuncoes, uLocalizarClientes, uLocalizarProdutos;

{$R *.dfm}

procedure TrtOrdensProducaoPendentes.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TrtOrdensProducaoPendentes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabBase.Close;
   inherited;
end;

procedure TrtOrdensProducaoPendentes.btnVisualizarClick(Sender: TObject);
begin
   inherited;
   GerarImpressao();
end;

procedure TrtOrdensProducaoPendentes.GerarImpressao(Impressora: Boolean = False);
begin
   qrlTitulo.Caption:='Ordens de Produção';

   tabBase.Close;
   tabBase.SQL.Clear;
   tabBase.SQL.Add('SELECT ordem_producao.Data, ordem_producao.OrdemProducao,');
   tabBase.SQL.Add('ordem_producao_produtos.CodigoProduto, ordem_producao_produtos.Descricao, ordem_producao_produtos.Quantidade');
   tabBase.SQL.Add('FROM ordem_producao, ordem_producao_produtos');
   tabBase.SQL.Add('WHERE ordem_producao.OrdemProducao = ordem_producao_produtos.OrdemProducao');
   
   case rdgTipoOP.ItemIndex of
      1: begin
         qrlTitulo.Caption:='Ordens de Produção Baixadas';
         tabBase.SQL.Add('AND ordem_producao.DataTermino IS NOT NULL');
      end;
      2: begin
         qrlTitulo.Caption:='Ordens de Produção Pendentes';
         tabBase.SQL.Add('AND ordem_producao.DataTermino IS NULL');
      end; 
   end;

   if Trim(edtCodigoCliente.Text) <> '' then begin
      tabBase.SQL.Add('AND ordem_producao.CodigoCliente = '+edtCodigoCliente.Text);
   end;
   if Trim(edtCodigoProduto.Text) <> '' then begin
      tabBase.SQL.Add('AND ordem_producao_produtos.CodigoProduto = '+QuotedStr(edtCodigoProduto.Text));
   end;
   
   tabBase.SQL.Add('ORDER BY');
   case rdgOrdemEmissao.ItemIndex of
      0: tabBase.SQL.Add('ordem_producao.Data');
      1: tabBase.SQL.Add('ordem_producao_produtos.CodigoProduto');
      2: tabBase.SQL.Add('ordem_producao.OrdemProducao');
      3: tabBase.SQL.Add('ordem_producao_produtos.Descricao');
      4: tabBase.SQL.Add('ordem_producao_produtos.Quantidade'); 
   end;
   tabBase.Open;

   vTotQtd:=0;

   if Impressora = True then begin
      if pndDialogo.Execute then begin
         qrpOP.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
         qrpOP.Print;
      end;
    end
   else begin
      qrpOP.PreviewModal;
   end;
end;

procedure TrtOrdensProducaoPendentes.btnImprimirClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(True);   
end;

procedure TrtOrdensProducaoPendentes.btnLocalizaClienteClick(Sender: TObject);
begin
   if not Assigned (fmLocalizarClientes) then begin
      Application.CreateForm(TfmLocalizarClientes, fmLocalizarClientes);
      fmLocalizarClientes.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edtCodigoCliente.Text:=fmMenu.pubTrans1;
   end;
end;

procedure TrtOrdensProducaoPendentes.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   inherited;
   vTotQtd:=vTotQtd+ tabBase.FieldByName('Quantidade').AsFloat;
   qrlTotal.Caption:='Total Qtd: '+FloatToStr(vTotQtd);
end;

procedure TrtOrdensProducaoPendentes.edtCodigoClienteChange(
  Sender: TObject);
begin
   inherited;
   if Trim(edtCodigoCliente.Text) <> '' then begin
      try
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT CodigoCliente, NomeFantasia FROM clientes WHERE CodigoCliente = '+edtCodigoCliente.Text);
         tabChecagens.Open;
         if tabChecagens.RecordCount > 0 then begin
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

procedure TrtOrdensProducaoPendentes.edtCodigoProdutoChange(
  Sender: TObject);
begin
   inherited;
   if Trim(edtCodigoProduto.Text) <> '' then begin
      try
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT CodigoProduto, NomeTecnico FROM produtos WHERE CodigoProduto = '+QuotedStr(edtCodigoProduto.Text));
         tabChecagens.Open;
         if tabChecagens.RecordCount > 0 then begin
            edtDescricaoProduto.Text:=tabChecagens.FieldByName('NomeTecnico').AsString;
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
   end;
end;

procedure TrtOrdensProducaoPendentes.btnLocalizaProdutoClick(
  Sender: TObject);
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

procedure TrtOrdensProducaoPendentes.edtCodigoProdutoKeyPress(
  Sender: TObject; var Key: Char);
begin
   inherited;
   if Key = #32 then Key:=#0 else Key:=UpCase(Key);
end;

procedure TrtOrdensProducaoPendentes.edtCodigoClienteKeyPress(
  Sender: TObject; var Key: Char);
begin
   inherited;
   if not (Key in['0'..'9',Chr(8)]) then Key:=#0;
end;

procedure TrtOrdensProducaoPendentes.qrpOPBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   inherited;
   vTotQtd:=0;
end;

end.

unit rProdutosRealizados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls, ToolEdit;

type
  TrtProdutosRealizados = class(TfmFormBaseRelatorio)
    tabBase: TZQuery;
    pndDialogo: TPrintDialog;
    qrpPedidosProdutos: TQuickRep;
    QRSubDetail1: TQRSubDetail;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    qrlSignature: TQRLabel;
    QRDBText3: TQRDBText;
    QRShape1: TQRShape;
    qrlTitulo: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape2: TQRShape;
    QRSysData2: TQRSysData;
    QRDBText7: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    qrlEmail: TQRLabel;
    qrlSite: TQRLabel;
    dtsBase: TDataSource;
    Label14: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    edtCodigoProduto: TEdit;
    btnLocalizarProduto: TBitBtn;
    edtProduto: TEdit;
    edtDataInicial: TDateEdit;
    edtDataFinal: TDateEdit;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    tabChecagens: TZQuery;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    Label1: TLabel;
    edtCodigoFuncionario: TEdit;
    btnLocalizarFuncionario: TBitBtn;
    edtNomeFuncionario: TEdit;
    qrlTotal: TQRLabel;
    Label3: TLabel;
    edtCodigoCliente: TEdit;
    btnLocalizaCliente: TBitBtn;
    edtNomeCliente: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCodigoProdutoChange(Sender: TObject);
    procedure btnLocalizarProdutoClick(Sender: TObject);
    procedure edtCodigoFuncionarioChange(Sender: TObject);
    procedure btnLocalizarFuncionarioClick(Sender: TObject);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrpPedidosProdutosBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure edtCodigoClienteChange(Sender: TObject);
    procedure btnLocalizaClienteClick(Sender: TObject);
  private
     procedure GerarImpressao(Impressora: Boolean = False);
  public
  end;

var
   vQtd,vEmpenho,vFaltas : real;

implementation

uses uFormBase, uMenu, uFuncoes, uConstantes, uLocalizarProdutos,
     uLocalizarFuncionarios, uTipos, DateUtils, uLocalizarClientes;

{$R *.dfm}

procedure TrtProdutosRealizados.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TrtProdutosRealizados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabBase.Close;
   inherited;
end;

procedure TrtProdutosRealizados.btnVisualizarClick(Sender: TObject);
begin
   inherited;
   GerarImpressao();
end;

procedure TrtProdutosRealizados.GerarImpressao(Impressora: Boolean = False);
var vWhere: string;
begin
   vWhere:='pedidos.DataEntrega IS NOT NULL AND pedidos.NPedido > 0';

   qrlTitulo.Caption:='Produtos Realizados';

   tabBase.Close;
   tabBase.SQL.Clear;
   tabBase.SQL.Add('SELECT pedidos.NPedido, pedidos.DataEntrega, pedidos_produtos.CodigoProduto, pedidos_produtos.Descricao AS Produto,');
   tabBase.SQL.Add('pedidos_produtos.Quantidade, produtos_status_estoque.Empenho, produtos_status_estoque.Faltas');
   tabBase.SQL.Add('FROM pedidos_produtos');
   tabBase.SQL.Add('LEFT JOIN pedidos ON pedidos_produtos.NPedido = pedidos.NPedido');
   tabBase.SQL.Add('LEFT JOIN produtos_status_estoque ON produtos_status_estoque.CodigoProduto = pedidos_produtos.CodigoProduto');

   if Trim(edtCodigoProduto.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Produto: '+edtCodigoProduto.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'pedidos_produtos.CodigoProduto = '+QuotedStr(edtCodigoProduto.Text);
   end;
   if Trim(edtCodigoFuncionario.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Responsável: '+edtNomeFuncionario.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'pedidos.CodigoFuncionario = '+edtCodigoFuncionario.Text; 
   end;
   if Trim(edtCodigoCliente.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Cliente: '+edtNomeCliente.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'pedidos.CodigoCliente = '+edtCodigoCliente.Text; 
   end;
   if (Trim(edtDataInicial.Text) <> '/  /') and (Trim(edtDataFinal.Text) <> '/  /') then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Período: '+edtDataInicial.Text+' a '+edtDataFinal.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';   
      vWhere:=vWhere + 'DataEntrega >= '+QuotedStr(FormatDateTime(sis_date_format, edtDataInicial.Date))+' AND DataEntrega <= '+QuotedStr(FormatDateTime(sis_date_format, edtDataFinal.Date));
   end;

   if Trim(vWhere) <> '' then begin 
      tabBase.SQL.Add('WHERE');
      tabBase.SQL.Add(vWhere);
   end;

   tabBase.SQL.Add('ORDER BY pedidos.DataEntrega, pedidos.NPedido');
   tabBase.Open;

   vQtd:=0;
   vEmpenho:=0;
   vFaltas:=0;

   if Impressora = True then begin
      if pndDialogo.Execute then begin
         qrpPedidosProdutos.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
         qrpPedidosProdutos.Print;
      end;
    end
   else begin
      qrpPedidosProdutos.PreviewModal;
   end;
end;

procedure TrtProdutosRealizados.btnImprimirClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(True);
end;

procedure TrtProdutosRealizados.FormShow(Sender: TObject);
begin
   inherited;
   edtDataInicial.Date:=StartOfTheMonth(Date);
   edtDataFinal.Date:=EndOfTheMonth(Date);
end;

procedure TrtProdutosRealizados.edtCodigoProdutoChange(Sender: TObject);
begin
   inherited;
   try
      if Trim(edtCodigoProduto.Text) <> '' then begin
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT NomeTecnico FROM produtos WHERE CodigoProduto = '+QuotedStr(edtCodigoProduto.Text));
         tabChecagens.Open;
         if tabChecagens.RecordCount > 0 then begin
            edtProduto.Text:=tabChecagens.FieldByName('NomeTecnico').AsString;
          end
         else begin
            edtProduto.Text:='';
         end;
       end
      else begin
         edtProduto.Text:='';
      end;
   finally
      tabChecagens.Close;
   end;
end;

procedure TrtProdutosRealizados.btnLocalizarProdutoClick(Sender: TObject);
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

procedure TrtProdutosRealizados.edtCodigoFuncionarioChange(Sender: TObject);
begin
   inherited;
   try
      if Trim(edtCodigoFuncionario.Text) <> '' then begin
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT Nome FROM funcionarios WHERE Codigo = '+QuotedStr(edtCodigoFuncionario.Text));
         tabChecagens.Open;
         if tabChecagens.RecordCount > 0 then begin
            edtNomeFuncionario.Text:=tabChecagens.FieldByName('Nome').AsString;
          end
         else begin
            edtNomeFuncionario.Text:='';
         end;
       end
      else begin
         edtNomeFuncionario.Text:='';
      end;
   finally
      tabChecagens.Close;
   end;
end;

procedure TrtProdutosRealizados.btnLocalizarFuncionarioClick(Sender: TObject);
begin
   inherited;
   if not Assigned (fmLocalizarFuncionarios) then begin
      Application.CreateForm(TfmLocalizarFuncionarios, fmLocalizarFuncionarios);
      fmLocalizarFuncionarios.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edtCodigoFuncionario.Text:=fmMenu.pubTrans1;
   end;
end;

procedure TrtProdutosRealizados.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   inherited;
   vQtd:=vQtd + tabBase.FieldByName('Quantidade').AsFloat;
   vEmpenho:=vEmpenho + tabBase.FieldByName('Empenho').AsFloat;
   vFaltas:=vFaltas + tabBase.FieldByName('Faltas').AsFloat;
   qrlTotal.Caption:='Qtd: '+FloatToStr(vQtd)+' - Empenho: '+FloatToStr(vEmpenho)+' Faltas: '+FloatToStr(vFaltas);
end;

procedure TrtProdutosRealizados.qrpPedidosProdutosBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   inherited;
   vQtd:=0;
   vEmpenho:=0;
   vFaltas:=0;
end;

procedure TrtProdutosRealizados.edtCodigoClienteChange(Sender: TObject);
begin
   inherited;
   try
      if Trim(edtCodigoCliente.Text) <> '' then begin
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT NomeFantasia FROM clientes WHERE CodigoCliente = '+QuotedStr(edtCodigoCliente.Text));
         tabChecagens.Open;
         if tabChecagens.RecordCount > 0 then begin
            edtNomeCliente.Text:=tabChecagens.FieldByName('NomeFantasia').AsString;
          end
         else begin
            edtNomeCliente.Text:='';
         end;
       end
      else begin
         edtNomeCliente.Text:='';
      end;
   finally
      tabChecagens.Close; 
   end;
end;

procedure TrtProdutosRealizados.btnLocalizaClienteClick(Sender: TObject);
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

end.

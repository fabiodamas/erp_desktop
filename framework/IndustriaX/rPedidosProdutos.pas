unit rPedidosProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls, ToolEdit;

type
  TrtPedidosProdutos = class(TfmFormBaseRelatorio) 
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
    lblDataInicial: TLabel;
    lblDataFinal: TLabel;
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
    rdgPeriodoDatas: TRadioGroup;
    Label2: TLabel;
    edtCodigoEmpresa: TEdit;
    btnLocalizarEmpresa: TBitBtn;
    edtNomeEmpresa: TEdit;
    QRLabel6: TQRLabel;
    QRDBText8: TQRDBText;
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
    procedure rdgPeriodoDatasClick(Sender: TObject);
    procedure edtCodigoEmpresaChange(Sender: TObject);
    procedure btnLocalizarEmpresaClick(Sender: TObject);
  private
     procedure GerarImpressao(Impressora: Boolean = False);
  public
  end;

var
   vQtd, vEmpenho, vFaltas : real;

implementation

uses uFormBase, uMenu, uFuncoes, uConstantes, uLocalizarProdutos,
     uLocalizarFuncionarios, uTipos, uLocalizarGenerico;

{$R *.dfm}

procedure TrtPedidosProdutos.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TrtPedidosProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabBase.Close;
   inherited;
end;

procedure TrtPedidosProdutos.btnVisualizarClick(Sender: TObject);
begin
   inherited;
   GerarImpressao();
end;

procedure TrtPedidosProdutos.GerarImpressao(Impressora: Boolean = False);
var vWhere: string;
begin
   vWhere:='pedidos.DataProducao IS NULL AND pedidos.NPedido > 0';

   qrlTitulo.Caption:='Pedidos Produtos';

   tabBase.Close;
   tabBase.SQL.Clear;
   tabBase.SQL.Add('SELECT pedidos.NPedido, pedidos.Data, pedidos.DataPrevisao, pedidos_produtos.CodigoProduto, pedidos_produtos.Descricao AS Produto,');
   tabBase.SQL.Add('pedidos_produtos.Quantidade, produtos_status_estoque.Empenho, produtos_status_estoque.Faltas');
   tabBase.SQL.Add('FROM pedidos');
   tabBase.SQL.Add('LEFT JOIN pedidos_produtos ON pedidos_produtos.NPedido = pedidos.NPedido');
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
   if Trim(edtCodigoEmpresa.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Empresa: '+edtNomeEmpresa.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'pedidos.CodigoEmpresa = '+edtCodigoEmpresa.Text;
   end;
   if (Trim(edtDataInicial.Text) <> '/  /') and (Trim(edtDataFinal.Text) <> '/  /') then begin
      case rdgPeriodoDatas.ItemIndex of
         0: begin
            qrlTitulo.Caption:=qrlTitulo.Caption + ' - Período Emissão: '+edtDataInicial.Text+' a '+edtDataFinal.Text;
            if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
            vWhere:=vWhere + 'Data >= '+QuotedStr(FormatDateTime(sis_date_format, edtDataInicial.Date))+' AND Data <= '+QuotedStr(FormatDateTime(sis_date_format, edtDataFinal.Date));
         end;
         1: begin
            qrlTitulo.Caption:=qrlTitulo.Caption + ' - Período Previsão: '+edtDataInicial.Text+' a '+edtDataFinal.Text;
            if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
            vWhere:=vWhere + 'DataPrevisao >= '+QuotedStr(FormatDateTime(sis_date_format, edtDataInicial.Date))+' AND DataPrevisao <= '+QuotedStr(FormatDateTime(sis_date_format, edtDataFinal.Date));
         end;
      end;
   end;

   if Trim(vWhere) <> '' then begin
      tabBase.SQL.Add('WHERE');
      tabBase.SQL.Add(vWhere);
   end;

   tabBase.SQL.Add('ORDER BY pedidos.Data, pedidos.NPedido');
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

procedure TrtPedidosProdutos.btnImprimirClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(True);
end;

procedure TrtPedidosProdutos.FormShow(Sender: TObject);
begin
   inherited;
//
end;

procedure TrtPedidosProdutos.edtCodigoProdutoChange(Sender: TObject);
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

procedure TrtPedidosProdutos.btnLocalizarProdutoClick(Sender: TObject);
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

procedure TrtPedidosProdutos.edtCodigoFuncionarioChange(Sender: TObject);
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

procedure TrtPedidosProdutos.btnLocalizarFuncionarioClick(Sender: TObject);
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

procedure TrtPedidosProdutos.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   inherited;
   vQtd:=vQtd + tabBase.FieldByName('Quantidade').AsFloat;
   vEmpenho:=vEmpenho + tabBase.FieldByName('Empenho').AsFloat;
   vFaltas:=vFaltas + tabBase.FieldByName('Faltas').AsFloat;
   qrlTotal.Caption:='Qtd: '+FloatToStr(vQtd)+' - Empenho: '+FloatToStr(vEmpenho)+' Faltas: '+FloatToStr(vFaltas);
end;

procedure TrtPedidosProdutos.qrpPedidosProdutosBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   inherited;
   vQtd:=0;
   vEmpenho:=0;
   vFaltas:=0;
end;

procedure TrtPedidosProdutos.rdgPeriodoDatasClick(Sender: TObject);
begin
   inherited;
   case rdgPeriodoDatas.ItemIndex of
      0: begin
         lblDataInicial.Caption:='Data Emissão - Inicial';
         lblDataFinal.Caption:='Data Emissão - Final'
      end;
      1: begin
         lblDataInicial.Caption:='Data Previsão - Inicial';
         lblDataFinal.Caption:='Data Previsão - Final';
      end;
   end;
end;

procedure TrtPedidosProdutos.edtCodigoEmpresaChange(Sender: TObject);
begin
   inherited;
   try
      if Trim(edtCodigoEmpresa.Text) <> '' then begin
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT NomeFantasia FROM empresas WHERE CodigoEmpresa = '+QuotedStr(edtCodigoEmpresa.Text));
         tabChecagens.Open;
         if tabChecagens.RecordCount > 0 then begin
            edtNomeEmpresa.Text:=tabChecagens.FieldByName('NomeFantasia').AsString;
          end
         else begin
            edtNomeEmpresa.Text:='';
         end;
       end
      else begin
         edtNomeEmpresa.Text:='';
      end;
   finally
      tabChecagens.Close;
   end;
end;

procedure TrtPedidosProdutos.btnLocalizarEmpresaClick(Sender: TObject);
var vParamLoc : TParametrosLocalizar;
begin
   inherited;
   vParamLoc.Table:='empresas';
   vParamLoc.KeyField:='CodigoEmpresa';
   vParamLoc.Field1:='NomeFantasia';
   vParamLoc.Filter:='';
   if not Assigned (fmLocalizarGenerico) then begin
      Application.CreateForm(TfmLocalizarGenerico, fmLocalizarGenerico);
      fmLocalizarGenerico.Caption:='Localizar Empresas';
      fmLocalizarGenerico.LoadParams(vParamLoc);
      fmLocalizarGenerico.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edtCodigoEmpresa.Text:=fmMenu.pubTrans1;
   end;
end;

end.

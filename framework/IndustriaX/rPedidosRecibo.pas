unit rPedidosRecibo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls;

type
  TrtPedidosRecibo = class(TfmFormBaseRelatorio)
    tabPedidos: TZQuery;
    pndDialogo: TPrintDialog;
    qrpRecibo: TQuickRep;
    QRSubDetail1: TQRSubDetail;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    qrlSignature: TQRLabel;
    QRDBText3: TQRDBText;
    QRShape1: TQRShape;
    QRSysData1: TQRSysData;
    QRShape2: TQRShape;
    QRSysData2: TQRSysData;
    QRDBText7: TQRDBText;
    edtObservacoes: TMemo;
    Label1: TLabel;
    dtsPedidos: TDataSource;
    tabPedidosProdutos: TZQuery;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    tabClientes: TZQuery;
    tabTitulos: TZQuery;
    QRCompositeReport1: TQRCompositeReport;
    ckbVias: TCheckBox;
    QRLabel3: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel1: TQRLabel;
    qrlCliente1: TQRLabel;
    QRLabel2: TQRLabel;
    qrlEndereco1: TQRLabel;
    QRLabel4: TQRLabel;
    qrlTelefone1: TQRLabel;
    QRShape3: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape4: TQRShape;
    tabConfigPropri: TZQuery;
    tabVendedores: TZQuery;
    tabFormasPagto: TZQuery;
    qrlTitulo: TQRLabel;
    QRShape9: TQRShape;
    SummaryBand1: TQRBand;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel13: TQRLabel;
    qrmObservacao: TQRMemo;
    QRLabel11: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel19: TQRLabel;
    QRShape6: TQRShape;
    QRLabel14: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel18: TQRLabel;
    qrmGarantia: TQRMemo;
    QRLabel23: TQRLabel;
    QRDBText10: TQRDBText;
    QRShape8: TQRShape;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QRCompositeReport1AddReports(Sender: TObject);
  private
    FPedido: string;
    procedure GerarImpressao(Impressora: Boolean = False);
  public
  end;

implementation

uses uFormBase, uMenu, uFuncoes, rEmissaoCentroCusto;

{$R *.dfm}

procedure TrtPedidosRecibo.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TrtPedidosRecibo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabPedidos.Close;
   tabPedidosProdutos.Close;
   tabClientes.Close;
   tabTitulos.Close;
   tabConfigPropri.Close;
   tabVendedores.Close;
   tabFormasPagto.Close;
   inherited;
end;

procedure TrtPedidosRecibo.btnVisualizarClick(Sender: TObject);
begin
   inherited;
   GerarImpressao();
end;

procedure TrtPedidosRecibo.GerarImpressao(Impressora: Boolean = False);
begin
   qrmObservacao.Lines.Text:=edtObservacoes.Lines.Text;
   qrmGarantia.Lines.Clear;
   qrmGarantia.Lines.Add(tabConfigPropri.FieldByName('Garantia1').AsString);
   qrmGarantia.Lines.Add(tabConfigPropri.FieldByName('Garantia2').AsString);   
   //qrmFormaPagto.Lines.Text:=tabConfigPropri.FieldByName('FormasPagto').AsString;   
   qrlCliente1.Caption:=tabClientes.FieldByName('CodigoCliente').AsString + ' - ' + tabClientes.FieldByName('NomeFantasia').AsString;
   qrlEndereco1.Caption:=tabClientes.FieldByName('Endereco').AsString + ', ' + tabClientes.FieldByName('Numero').AsString;
   qrlTelefone1.Caption:=tabClientes.FieldByName('Telefone1').AsString;

   if Impressora = True then begin
      if pndDialogo.Execute then begin
         QRCompositeReport1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
         QRCompositeReport1.Print;
      end;
    end
   else begin
      QRCompositeReport1.Preview;
   end;
end;

procedure TrtPedidosRecibo.btnImprimirClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(True);
end;

procedure TrtPedidosRecibo.FormShow(Sender: TObject);
begin
   inherited;
   FPedido:=fmMenu.pubTrans1;

   tabPedidos.Close;
   tabPedidos.SQL.Clear;
   tabPedidos.SQL.Add('SELECT * FROM pedidos WHERE NPedido = '+FPedido);
   tabPedidos.Open;

   tabPedidosProdutos.Close;
   tabPedidosProdutos.SQL.Clear;
   tabPedidosProdutos.SQL.Add('SELECT * FROM pedidos_produtos WHERE NPedido = '+FPedido);
   tabPedidosProdutos.Open;

   tabClientes.Close;
   tabClientes.SQL.Clear;
   tabClientes.SQL.Add('SELECT * FROM clientes WHERE CodigoCliente = '+tabPedidos.FieldByName('CodigoCliente').AsString);
   tabClientes.Open;

   tabTitulos.Close;
   tabTitulos.SQL.Clear;
   tabTitulos.SQL.Add('SELECT * FROM titulos_receber WHERE Documento = '+tabPedidos.FieldByName('NPedido').AsString+' AND CodigoConta = '+tabPedidos.FieldByName('CodigoCliente').AsString);
   tabTitulos.Open;

   tabConfigPropri.Close;
   tabConfigPropri.SQL.Clear;
   tabConfigPropri.SQL.Add('SELECT FormasPagto, Garantia1, Garantia2 FROM configuracoes_proprietario');
   tabConfigPropri.Open;

   tabVendedores.Close;
   tabVendedores.SQL.Clear;
   tabVendedores.SQL.Add('SELECT Nome FROM funcionarios WHERE Codigo = '+tabPedidos.FieldByName('CodigoFuncionario').AsString);
   tabVendedores.Open;

   tabFormasPagto.Close;
   tabFormasPagto.SQL.Clear;
   tabFormasPagto.SQL.Add('SELECT * FROM formas_pagamento WHERE Codigo = '+tabPedidos.FieldByName('CodigoFormaPagto').AsString);
   tabFormasPagto.Open;
end;

procedure TrtPedidosRecibo.QRCompositeReport1AddReports(Sender: TObject);
begin
   inherited;
   QRCompositeReport1.Reports.Clear;

   QRCompositeReport1.Reports.Add(qrpRecibo);

   if ckbVias.Checked then begin
      QRCompositeReport1.Reports.Add(qrpRecibo);
   end;
end;

end.

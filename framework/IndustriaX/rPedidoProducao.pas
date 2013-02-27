unit rPedidoProducao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls;

type
  TrtPedidoProducao = class(TfmFormBaseRelatorio)
    tabBase: TZQuery;
    pndDialogo: TPrintDialog;
    qrpPedidoProducao: TQuickRep;
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
    Label1: TLabel;
    qrlCliente: TQRLabel;
    QRLabel5: TQRLabel;
    edtPedido: TEdit;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    tabClientes: TZQuery;
    dtsClientes: TDataSource;
    dtsBase: TDataSource;
    QRShape3: TQRShape;
    QRSubDetail2: TQRSubDetail;
    QRLabel19: TQRLabel;
    QRSysData5: TQRSysData;
    QRLabel3: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel27: TQRLabel;
    QRDBText5: TQRDBText;
    QRShape9: TQRShape;
    QRShape4: TQRShape;
    QRLabel6: TQRLabel;
    QRShape18: TQRShape;
    QRLabel7: TQRLabel;
    QRShape20: TQRShape;
    QRLabel8: TQRLabel;
    QRShape21: TQRShape;
    QRLabel9: TQRLabel;
    QRShape22: TQRShape;
    QRLabel10: TQRLabel;
    QRShape23: TQRShape;
    QRLabel11: TQRLabel;
    QRShape24: TQRShape;
    QRLabel12: TQRLabel;
    QRShape5: TQRShape;
    QRLabel13: TQRLabel;
    QRShape36: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape19: TQRShape;
    QRShape25: TQRShape;
    qrlSedex: TQRLabel;
    qrlTransportadora: TQRLabel;
    qrlOutros: TQRLabel;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText14: TQRDBText;
    rdgTransporte: TRadioGroup;
    Label2: TLabel;
    edtOutros: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure GerarImpressao(Impressora: Boolean = False);
  public
  end;

implementation

uses uFormBase, uMenu, uFuncoes;

{$R *.dfm}

procedure TrtPedidoProducao.FormCreate(Sender: TObject);
begin
  inherited;
  SetFormStyle(fsMDIChild);
end;

procedure TrtPedidoProducao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tabBase.Close;
  tabClientes.Close;
  inherited;
end;

procedure TrtPedidoProducao.btnVisualizarClick(Sender: TObject);
begin
  inherited;
  GerarImpressao();
end;

procedure TrtPedidoProducao.GerarImpressao(Impressora: Boolean = False);
begin
  if Trim(edtPedido.Text) = '' then
  begin
    ShowMessage('Obrigatório Preenchimento do Pedido');
    edtPedido.SetFocus;
    exit;
  end;

  tabBase.Close;
  tabBase.SQL.Clear;
  tabBase.SQL.Add('SELECT pedidos_produtos.CodigoProduto, pedidos_produtos.Descricao,');
  tabBase.SQL.Add('pedidos_produtos.Quantidade AS Pedido');
  tabBase.SQL.Add('FROM pedidos_produtos');
  tabBase.SQL.Add('WHERE NPedido = '+edtPedido.Text);
  tabBase.Open;

  tabClientes.Close;
  tabClientes.SQL.Clear;
  tabClientes.SQL.Add('SELECT clientes.CodigoCliente,clientes.NomeFantasia, pedidos.NPedido,');
  tabClientes.SQL.Add('pedidos.DataEntrega, pedidos.ObsPro');
  tabClientes.SQL.Add('FROM pedidos');
  tabClientes.SQL.Add('LEFT JOIN clientes ON pedidos.CodigoCliente = clientes.CodigoCliente');
  tabClientes.SQL.Add('WHERE pedidos.NPedido = '+edtPedido.Text);
  tabClientes.Open;
  qrlCliente.Caption:='Cliente: '+FloatToStr(tabClientes.FieldByName('CodigoCliente').AsFloat)+' - '+tabClientes.FieldByName('NomeFantasia').AsString;

  qrlTitulo.Caption:='Pedido de Produção: '+edtPedido.Text;

  case rdgTransporte.ItemIndex of
    0: begin
      qrlTransportadora.Caption:='(  X  ) TRANSPORTADORA';
      qrlSedex.Caption:='(     ) SEDEX';
      qrlOutros.Caption:='(     ) OUTROS: ____________________';
      qrlTransportadora.Font.Style:=[fsBold];
      qrlSedex.Font.Style:=[];
      qrlOutros.Font.Style:=[];
    end;
    1: begin
       qrlTransportadora.Caption:='(     ) TRANSPORTADORA';
         qrlSedex.Caption:='(  X  ) SEDEX';
         qrlOutros.Caption:='(     ) OUTROS: ____________________';
         qrlTransportadora.Font.Style:=[];
         qrlSedex.Font.Style:=[fsBold];
         qrlOutros.Font.Style:=[];
      end;
      2: begin
         qrlTransportadora.Caption:='(     ) TRANSPORTADORA';
         qrlSedex.Caption:='(     ) SEDEX';
         qrlOutros.Caption:='(  X  ) OUTROS: '+edtOutros.Text;
         qrlTransportadora.Font.Style:=[];
         qrlSedex.Font.Style:=[];
         qrlOutros.Font.Style:=[fsBold];
      end;
   end;

   if Impressora = True then begin
      if pndDialogo.Execute then begin
         qrpPedidoProducao.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
         qrpPedidoProducao.Print;
      end;
    end
   else begin
      qrpPedidoProducao.PreviewModal;
   end;
end;

procedure TrtPedidoProducao.btnImprimirClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(True);
end;

procedure TrtPedidoProducao.FormShow(Sender: TObject);
begin
   inherited;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edtPedido.Text:=fmMenu.pubTrans1;
   end;
end;

end.

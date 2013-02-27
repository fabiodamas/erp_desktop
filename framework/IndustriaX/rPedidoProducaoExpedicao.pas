unit rPedidoProducaoExpedicao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls, uFinalizarPedido;

type
  TrtPedidoProducaoExpedicao = class(TfmFormBaseRelatorio)
    tabPedidos: TZQuery;
    pndDialogo: TPrintDialog;
    qrpPedidoExpedicao: TQuickRep; 
    QRSubDetail1: TQRSubDetail;
    QRBand1: TQRBand;
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
    edtPedido: TEdit;
    tabClientes: TZQuery;
    dtsClientes: TDataSource;
    dtsPedidos: TDataSource;
    QRShape3: TQRShape;
    QRSubDetail2: TQRSubDetail;
    QRShape4: TQRShape;
    Label2: TLabel;
    rdgEndRotulo: TRadioGroup;
    edtRotuloAc: TEdit;
    qrlCodigoNomeGrupo: TQRLabel;
    QRShape26: TQRShape;
    QRDBText2: TQRDBText;
    QRLabel16: TQRLabel;
    QRShape31: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText4: TQRDBText;
    tabPedidosProdutos: TZQuery;
    tabUnidades: TZQuery;
    QRShape6: TQRShape;
    QRLabel2: TQRLabel;
    QRShape5: TQRShape;
    QRLabel3: TQRLabel;
    QRDBText8: TQRDBText;
    tabChecagens: TZQuery;
    tabVendedor: TZQuery;
    QRDBText1: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape18: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape36: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape10: TQRShape;
    QRLabel14: TQRLabel;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape19: TQRShape;
    QRShape27: TQRShape;
    QRShape22: TQRShape;
    QRLabel8: TQRLabel;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape37: TQRShape;
    QRShape40: TQRShape;
    qrlRotAC: TQRLabel;
    qrlRotCodNome: TQRLabel;
    qrlRotEndNum: TQRLabel;
    qrlRotBairroComp: TQRLabel;
    qrlRotCidadeEstadoPais: TQRLabel;
    qrlRotCep: TQRLabel;
    qrlRotRazao: TQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtsPedidosDataChange(Sender: TObject; Field: TField);
  private
  public
     procedure GerarImpressao(Impressora: Boolean = False);
  end;

implementation

uses uFormBase, uMenu, uFuncoes, uConstantes, uEnderecos, uFinaPediRelaExpe;

{$R *.dfm}

procedure TrtPedidoProducaoExpedicao.FormCreate(Sender: TObject);
begin
   inherited;
   // Se a finalizacao de pedido nao está aberta, deixamos o form como filho
   if not FormExiste('frmFinalizarPedido') then
   begin
    SetFormStyle(fsMDIChild);
   end;
end;

procedure TrtPedidoProducaoExpedicao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabPedidos.Close;
   tabClientes.Close;
   tabPedidosProdutos.Close;
   tabVendedor.Close;
   inherited;
end;

procedure TrtPedidoProducaoExpedicao.btnVisualizarClick(Sender: TObject);
begin
   inherited;
   GerarImpressao();
end;

procedure TrtPedidoProducaoExpedicao.GerarImpressao(Impressora: Boolean = False);
var  vCnt, vCnt2 : Integer;
begin
   if Trim(edtPedido.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Pedido');
      edtPedido.SetFocus;
      exit;
   end;

   tabPedidos.Close;
   tabPedidos.SQL.Clear;
   tabPedidos.SQL.Add('SELECT * FROM pedidos');
   tabPedidos.SQL.Add('WHERE NPedido = '+edtPedido.Text);
   tabPedidos.Open;

   tabPedidosProdutos.Close;
   tabPedidosProdutos.SQL.Clear;
   tabPedidosProdutos.SQL.Add('SELECT pedidos_produtos.*, unidades.Sigla AS Unidade FROM pedidos_produtos ');
   tabPedidosProdutos.SQL.Add('LEFT JOIN produtos ON produtos.CodigoProduto = pedidos_produtos.CodigoProduto');
   tabPedidosProdutos.SQL.Add('LEFT JOIN unidades ON unidades.Codigo = produtos.CodigoUnidade');
   tabPedidosProdutos.SQL.Add('WHERE NPedido = '+edtPedido.Text+' AND Composto = 0');
   tabPedidosProdutos.Open;

   tabClientes.Close;
   tabClientes.SQL.Clear; 
   tabClientes.SQL.Add('SELECT clientes.*, genericos.Descricao AS Grupo FROM clientes ');
   tabClientes.SQL.Add('LEFT JOIN genericos ON genericos.Codigo = clientes.CodigoGrupo');
   tabClientes.SQL.Add('WHERE CodigoCliente = '+tabPedidos.FieldByName('CodigoCliente').AsString);
   tabClientes.Open;

   qrlTitulo.Caption:='Pedido de Produção / Expedição: '+edtPedido.Text;

   qrlCodigoNomeGrupo.Caption:='Código: '+FloatToStr(tabClientes.FieldByName('CodigoCliente').AsFloat)+
                     ' - '+tabClientes.FieldByName('NomeFantasia').AsString+
                     ' - Grupo: '+tabClientes.FieldByName('Grupo').AsString;

   qrlRotAC.Caption:='A/C: '+edtRotuloAc.Text;
   qrlRotCodNome.Caption:=tabClientes.FieldByName('CodigoCliente').AsString + ' - ' + tabClientes.FieldByName('NomeFantasia').AsString;
   qrlRotRazao.Caption:=tabClientes.FieldByName('RazaoSocial').AsString;
   case rdgEndRotulo.ItemIndex of
      0: begin
         qrlRotEndNum.Caption:=tabClientes.FieldByName('Endereco').AsString+', '+tabClientes.FieldByName('Numero').AsString;
         qrlRotBairroComp.Caption:=tabClientes.FieldByName('Bairro').AsString+' - '+tabClientes.FieldByName('Complemento').AsString;
         qrlRotCidadeEstadoPais.Caption:=LocateCidade(tabClientes.FieldByName('CodigoCidade').AsString)+' - '+tabClientes.FieldByName('Estado').AsString+' - '+LocatePais(tabClientes.FieldByName('CodigoPais').AsString);
         qrlRotCep.Caption:=tabClientes.FieldByName('Cep').AsString;
      end;
      1: begin
         qrlRotEndNum.Caption:=tabClientes.FieldByName('CobrancaEndereco').AsString+', '+tabClientes.FieldByName('CobrancaNumero').AsString;
         qrlRotBairroComp.Caption:=tabClientes.FieldByName('CobrancaBairro').AsString+' - '+tabClientes.FieldByName('CobrancaComplemento').AsString;
         qrlRotCidadeEstadoPais.Caption:=LocateCidade(tabClientes.FieldByName('CobrancaCodigoCidade').AsString)+' - '+tabClientes.FieldByName('CobrancaEstado').AsString+' - '+LocatePais(tabClientes.FieldByName('CobrancaCodigoPais').AsString);
         qrlRotCep.Caption:=tabClientes.FieldByName('CobrancaCep').AsString;
      end;
      2: begin
         qrlRotEndNum.Caption:=tabClientes.FieldByName('EntregaEndereco').AsString+', '+tabClientes.FieldByName('EntregaNumero').AsString;
         qrlRotBairroComp.Caption:=tabClientes.FieldByName('EntregaBairro').AsString+' - '+tabClientes.FieldByName('EntregaComplemento').AsString;
         qrlRotCidadeEstadoPais.Caption:=LocateCidade(tabClientes.FieldByName('EntregaCodigoCidade').AsString)+' - '+tabClientes.FieldByName('EntregaEstado').AsString+' - '+LocatePais(tabClientes.FieldByName('EntregaCodigoPais').AsString);
         qrlRotCep.Caption:=tabClientes.FieldByName('EntregaCep').AsString;
      end;
   end;
   
   if Impressora = True then begin
    // Se a finalização do pedido está aberta
    if FormExiste('frmFinalizarPedido') then
    begin
      // Definimos as impressoras de destino e imprimidos
      for vCnt:= 0 to frmFinaPediRelaExpe.lstImpressorasSelecionadas.Count-1 do
      begin

        for vCnt2:=0 to (Printer.Printers.Count-1) do
        begin
            if Trim(Printer.Printers.Strings[vCnt2]) =  Trim(frmFinaPediRelaExpe.lstImpressorasSelecionadas.Items[vCnt]) then
            begin
             qrpPedidoExpedicao.PrinterSettings.PrinterIndex := vCnt2;
             qrpPedidoExpedicao.Print;
             Break;
            end;
        end;

      end;
    end
    else
    begin
      if pndDialogo.Execute then begin
         qrpPedidoExpedicao.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
         qrpPedidoExpedicao.Print;
      end;
    end;

   end
   else begin
      qrpPedidoExpedicao.PreviewModal;
   end;
end;

procedure TrtPedidoProducaoExpedicao.btnImprimirClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(True);
end;

procedure TrtPedidoProducaoExpedicao.FormShow(Sender: TObject);
begin
   inherited;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edtPedido.Text:=fmMenu.pubTrans1;
   end;
   tabVendedor.Params.CreateParam(ftFloat, 'CodigoFuncionario', ptUnknown);
   tabVendedor.SQL.Add('SELECT Codigo,Nome FROM funcionarios WHERE Codigo = :CodigoFuncionario');
   tabVendedor.Open;
end;

procedure TrtPedidoProducaoExpedicao.dtsPedidosDataChange(Sender: TObject;
  Field: TField);
begin
   inherited;
   tabVendedor.Close;
   tabVendedor.ParamByName('CodigoFuncionario').AsFloat:=tabPedidos.FieldByName('CodigoFuncionario').AsFloat;
   tabVendedor.Open;
end;

end.

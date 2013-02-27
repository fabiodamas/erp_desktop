unit rPedidoExpedicao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls;

type
  TrtPedidoExpedicao = class(TfmFormBaseRelatorio)
    tabPedidos: TZQuery;
    pndDialogo: TPrintDialog;
    qrpPedidoExpedicao: TQuickRep;
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
    edtPedido: TEdit;
    tabClientes: TZQuery;
    dtsClientes: TDataSource;
    dtsPedidos: TDataSource;
    QRShape3: TQRShape;
    QRSubDetail2: TQRSubDetail;
    QRShape4: TQRShape;
    Label2: TLabel;
    rdgTransporte: TRadioGroup;
    edtTransporteOutros: TEdit;
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
    qrlSedex: TQRLabel;
    qrlOutros: TQRLabel;
    qrlTransportadora: TQRLabel;
    tabChecagens: TZQuery;
    QRShape8: TQRShape;
    QRLabel12: TQRLabel;
    QRShape9: TQRShape;
    QRLabel13: TQRLabel;
    tabVendedor: TZQuery;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape7: TQRShape;
    QRShape10: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtsPedidosDataChange(Sender: TObject; Field: TField);
    procedure rdgTransporteClick(Sender: TObject);
  private
  public
     procedure GerarImpressao(Impressora: Boolean = False);
  end;

implementation

uses uFormBase, uMenu, uFuncoes, uConstantes, uFinaPediRelaExpe;

{$R *.dfm}

procedure TrtPedidoExpedicao.FormCreate(Sender: TObject);
begin
   inherited;
   // Se a finalizacao de pedido nao está aberta, deixamos o form como filho
   if not FormExiste('frmFinalizarPedido') then
   begin
    SetFormStyle(fsMDIChild);
   end;
end;

procedure TrtPedidoExpedicao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabPedidos.Close;
   tabClientes.Close;
   tabPedidosProdutos.Close;
   tabVendedor.Close;
   inherited;
end;

procedure TrtPedidoExpedicao.btnVisualizarClick(Sender: TObject);
begin
   inherited;
   GerarImpressao();
end;

procedure TrtPedidoExpedicao.GerarImpressao(Impressora: Boolean = False);
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
   tabPedidos.SQL.Add(' WHERE NPedido = '+edtPedido.Text);
   tabPedidos.Open;

   // Grava Informações da Tela.
   tabPedidos.Edit;
   tabPedidos.FieldByName('OpcoesExp').AsString:=IntToStr(rdgTransporte.ItemIndex)+';'+edtTransporteOutros.Text+';';
   tabPedidos.Post;
   tabPedidos.ApplyUpDates;
   //  = 0,1,1,Teste,1

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

   qrlTitulo.Caption:='Pedido de Expedição: '+edtPedido.Text;

   qrlCodigoNomeGrupo.Caption:='Código: '+FloatToStr(tabClientes.FieldByName('CodigoCliente').AsFloat)+
                     ' - '+tabClientes.FieldByName('NomeFantasia').AsString+
                     ' - Grupo: '+tabClientes.FieldByName('Grupo').AsString;

   case rdgTransporte.ItemIndex of
      0: begin
         qrlTransportadora.Caption:='Transportadora ( X )';
         qrlSedex.Caption:='Sedex (  )';
         qrlOutros.Caption:='Outros (  )';
         qrlTransportadora.Font.Style:=[fsBold];
         qrlSedex.Font.Style:=[];
         qrlOutros.Font.Style:=[];
      end;
      1: begin
         qrlTransportadora.Caption:='Transportadora (   )';
         qrlSedex.Caption:='Sedex ( X )';
         qrlOutros.Caption:='Outros (  )';
         qrlTransportadora.Font.Style:=[];
         qrlSedex.Font.Style:=[fsBold];
         qrlOutros.Font.Style:=[];
      end;
      2: begin
         qrlTransportadora.Caption:='Transportadora (   )';
         qrlSedex.Caption:='Sedex (   )';
         qrlOutros.Caption:='Outros ( X ) '+edtTransporteOutros.Text;
         qrlTransportadora.Font.Style:=[];
         qrlSedex.Font.Style:=[];
         qrlOutros.Font.Style:=[fsBold];
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

procedure TrtPedidoExpedicao.btnImprimirClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(True);
end;

procedure TrtPedidoExpedicao.FormShow(Sender: TObject);
var vStringList: TStringList;
    vCnt : Integer;
begin
   inherited;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edtPedido.Text:=fmMenu.pubTrans1;
      vStringList:=TStringList.Create;
      try
         vStringList.Clear;
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT OpcoesAdm FROM pedidos WHERE NPedido = '+edtPedido.Text);
         tabChecagens.Open;

         if Trim(tabChecagens.FieldByName('OpcoesAdm').AsString) <> '' then begin
            ExtractStrings([';'], [' '], Pchar(tabChecagens.FieldByName('OpcoesAdm').AsString), vStringList);
         end;

         for vCnt:=0 to (vStringList.Count-1) do begin
            if vCnt = 0 then begin
               if Trim(vStringList.Strings[vCnt]) <> '' then begin
                  rdgTransporte.ItemIndex:=StrToInt(vStringList.Strings[vCnt]);
               end;
            end;
            if vCnt = 1 then begin
               if Trim(vStringList.Strings[vCnt]) <> '' then begin
                  edtTransporteOutros.Text:=vStringList.Strings[vCnt];
               end;
            end;
         end;

      finally
         vStringList.Free;
         tabChecagens.Close;
      end;
   end;

   tabVendedor.Params.CreateParam(ftFloat, 'CodigoFuncionario', ptUnknown);
   tabVendedor.SQL.Add('SELECT Codigo,Nome FROM funcionarios WHERE Codigo = :CodigoFuncionario');
   tabVendedor.Open;   
end;

procedure TrtPedidoExpedicao.dtsPedidosDataChange(Sender: TObject;
  Field: TField);
begin
   inherited;
   tabVendedor.Close;
   tabVendedor.ParamByName('CodigoFuncionario').AsFloat:=tabPedidos.FieldByName('CodigoFuncionario').AsFloat;
   tabVendedor.Open;
end;

procedure TrtPedidoExpedicao.rdgTransporteClick(Sender: TObject);
begin
   inherited;
   if rdgTransporte.ItemIndex = 2 then begin
      edtTransporteOutros.Enabled:=True;
    end
   else begin
      edtTransporteOutros.Enabled:=False;
   end;
end;

end.

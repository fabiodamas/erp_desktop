unit rPedidoAdministracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls, uFinalizarPedido;

type
  TrtPedidoAdministracao = class(TfmFormBaseRelatorio)
    tabPedidos: TZQuery;
    pndDialogo: TPrintDialog;
    qrpPedidoAdministracao: TQuickRep;
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
    QRDBText1: TQRDBText;
    tabClientes: TZQuery;
    dtsClientes: TDataSource;
    dtsPedidos: TDataSource;
    QRShape3: TQRShape;
    QRSubDetail2: TQRSubDetail;
    QRShape4: TQRShape;
    Label2: TLabel;
    rdgDetalhesPagto: TRadioGroup;
    rdgFreteConta: TRadioGroup;
    rdgTransporte: TRadioGroup;
    rdgPeso: TRadioGroup;
    edtTransporteOutros: TEdit;
    qrlCnpjCpf: TQRLabel;
    qrlTelefones: TQRLabel;
    qrlCepComplemento: TQRLabel;
    qrlEnderecoNumBairroCidadeEstado: TQRLabel;
    qrlCodigoNomeGrupo: TQRLabel;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRLabel1: TQRLabel;
    qrlEnd2: TQRLabel;
    qrlComp2: TQRLabel;
    QRShape28: TQRShape;
    QRLabel5: TQRLabel;
    QRShape29: TQRShape;
    qrlComp3: TQRLabel;
    qrlEnd3: TQRLabel;
    QRDBText2: TQRDBText;
    QRShape30: TQRShape;
    QRLabel16: TQRLabel;
    QRShape31: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    tabPedidosProdutos: TZQuery;
    tabUnidades: TZQuery;
    QRShape6: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText19: TQRDBText;
    QRShape5: TQRShape;
    QRLabel3: TQRLabel;
    QRShape7: TQRShape;
    QRLabel4: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel6: TQRLabel;
    qrlDeposito: TQRLabel;
    qrlFaturamento: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    qrlSedex: TQRLabel;
    QRLabel23: TQRLabel;
    qrlBox1: TQRLabel;
    qrlBox2: TQRLabel;
    qrlBox3: TQRLabel;
    qrlBox4: TQRLabel;
    qrlOutros: TQRLabel;
    qrlTransportadora: TQRLabel;
    qrlEmitente: TQRLabel;
    qrlDestinatario: TQRLabel;
    tabChecagens: TZQuery;
    QRShape8: TQRShape;
    QRLabel12: TQRLabel;
    QRShape9: TQRShape;
    QRLabel13: TQRLabel;
    QRDBText9: TQRDBText;
    tabPedidosVenctos: TZQuery;
    tabVendedor: TZQuery;
    qrlVencimentos: TQRMemo;
    QRDBText10: TQRDBText;
    tabFormasPagto: TZQuery;
    qrlDataPrevisao: TQRLabel;
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

uses uFormBase, uMenu, uFuncoes, uConstantes, uEnderecos,
  uFinaPediRelaAdmn;

{$R *.dfm}

procedure TrtPedidoAdministracao.FormCreate(Sender: TObject);
begin
   inherited;
   // Se a finalizacao de pedido nao está aberta, deixamos o form como filho
   if not FormExiste('frmFinalizarPedido') then
   begin
    SetFormStyle(fsMDIChild);
   end;
end;

procedure TrtPedidoAdministracao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabPedidos.Close;
   tabClientes.Close;
   tabPedidosProdutos.Close;
   tabPedidosVenctos.Close;
   tabVendedor.Close;
   tabFormasPagto.Close;
   inherited;
end;

procedure TrtPedidoAdministracao.btnVisualizarClick(Sender: TObject);
begin
   inherited;
   GerarImpressao();
end;

procedure TrtPedidoAdministracao.GerarImpressao(Impressora: Boolean = False);
var vCnt, vCnt2: Integer;
begin
   if Trim(edtPedido.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Pedido');
      edtPedido.SetFocus;
      exit;
   end;

   tabPedidos.Close;
   tabPedidos.SQL.Clear;
   tabPedidos.SQL.Add('SELECT * FROM pedidos ');
   tabPedidos.SQL.Add('WHERE NPedido = '+edtPedido.Text);
   tabPedidos.Open;

   // Grava Informações da Tela.
   tabPedidos.Edit;
   tabPedidos.FieldByName('OpcoesAdm').AsString:=IntToStr(rdgDetalhesPagto.ItemIndex)+';'+
   IntToStr(rdgFreteConta.ItemIndex)+';'+IntToStr(rdgTransporte.ItemIndex)+';'+edtTransporteOutros.Text+';'+
   IntToStr(rdgPeso.ItemIndex)+';';
   tabPedidos.Post;
   tabPedidos.ApplyUpDates;
   //  = 0,1,1,Teste,1

   vCnt:=0;
   qrlVencimentos.Lines.Clear;
   tabPedidosVenctos.Close;
   tabPedidosVenctos.SQL.Clear;
   tabPedidosVenctos.SQL.Add('SELECT * FROM pedidos_vencimentos WHERE NPedido = '+edtPedido.Text);
   tabPedidosVenctos.Open;
   tabPedidosVenctos.First;
   while not tabPedidosVenctos.Eof do begin

      vCnt:=vCnt + 1; 
      qrlVencimentos.Lines.Add(IntToStr(vCnt) + '° Vencto ' + FormatDateTime('dd/MM/yyyy', tabPedidosVenctos.FieldByName('DataVencto'+IntToStr(vCnt)).AsDateTime) + '    ' +
      IntToStr(vCnt) + '° Valor ' + FormatFloat(sis_curr_format, tabPedidosVenctos.FieldByName('Valor'+IntToStr(vCnt)).AsFloat));

      tabPedidosVenctos.Next;
   end;

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

   tabFormasPagto.Close;
   tabFormasPagto.SQL.Clear;
   tabFormasPagto.SQL.Add('SELECT * FROM formas_pagamento WHERE Codigo = '+tabPedidos.FieldByName('CodigoFormaPagto').AsString);
   tabFormasPagto.Open;

   qrlTitulo.Caption:='Pedido de Administração: '+edtPedido.Text;

   qrlCodigoNomeGrupo.Caption:='Código: '+FloatToStr(tabClientes.FieldByName('CodigoCliente').AsFloat)+
                     ' - '+tabClientes.FieldByName('NomeFantasia').AsString+
                     ' - Grupo: '+tabClientes.FieldByName('Grupo').AsString; 

   if tabClientes.FieldByName('TipoCliente').AsInteger = 1 then begin
      qrlCnpjCpf.Caption:='CNPJ: '+tabClientes.FieldByName('CpfCnpj').AsString+' IE: '+tabClientes.FieldByName('IeRg').AsString;
    end
   else begin 
      qrlCnpjCpf.Caption:='CPF: '+tabClientes.FieldByName('CpfCnpj').AsString+' RG: '+tabClientes.FieldByName('IeRg').AsString;
   end;

   qrlEnderecoNumBairroCidadeEstado.Caption:='Endereço:  '+tabClientes.FieldByName('Endereco').AsString+
                     ', '+tabClientes.FieldByName('Numero').AsString+' - Bairro: '+TrimRight(tabClientes.FieldByName('Bairro').AsString)+
                     ' - Cidade: '+LocateCidade(tabClientes.FieldByName('CodigoCidade').AsString)+' - '+tabClientes.FieldByName('Estado').AsString;

   qrlTelefones.Caption:='Telefones: ' + tabClientes.FieldByName('Telefone1').AsString + '   ' + tabClientes.FieldByName('Telefone2').AsString + '   ' + tabClientes.FieldByName('Telefone3').AsString + '   ' + tabClientes.FieldByName('Telefone4').AsString;

   // Se a data de previsão não for vazia
   if not tabPedidos.FieldByName('DataPrevisao').IsNull then
   begin
    qrlDataPrevisao.Caption := 'Previsão: ' + DateToStr(tabPedidos.FieldByName('DataPrevisao').AsDateTime);
   end
   // Caso contrário colocamos apenas o texto previsão
   else
   begin
    qrlDataPrevisao.Caption := 'Previsão: ';
   end;

   qrlCepComplemento.Caption:='Cep: '+tabClientes.FieldByName('Cep').AsString + ' - Complemento: ' + tabClientes.FieldByName('Complemento').AsString;

   qrlEnd2.Caption:='Endereço: '+tabClientes.FieldByName('EntregaEndereco').AsString+
                     ', '+tabClientes.FieldByName('EntregaNumero').AsString+' - Bairro: '+TrimRight(tabClientes.FieldByName('EntregaBairro').AsString)+
                     ' - Cidade: '+LocateCidade(tabClientes.FieldByName('EntregaCodigoCidade').AsString)+' - '+tabClientes.FieldByName('EntregaEstado').AsString;

   qrlComp2.Caption:='Cep: '+tabClientes.FieldByName('EntregaCep').AsString + ' - Complemento: ' + tabClientes.FieldByName('EntregaComplemento').AsString;

   qrlEnd3.Caption:='Endereço: '+tabClientes.FieldByName('CobrancaEndereco').AsString+
                     ', '+tabClientes.FieldByName('CobrancaNumero').AsString+' - Bairro: '+TrimRight(tabClientes.FieldByName('CobrancaBairro').AsString)+
                     ' - Cidade: '+LocateCidade(tabClientes.FieldByName('CobrancaCodigoCidade').AsString)+' - '+tabClientes.FieldByName('CobrancaEstado').AsString;

   qrlComp3.Caption:='Cep: '+tabClientes.FieldByName('CobrancaCep').AsString + ' - Complemento: ' + tabClientes.FieldByName('CobrancaComplemento').AsString;

   case rdgDetalhesPagto.ItemIndex of
      0: begin
         qrlDeposito.Caption:='Depósito ( X )';
         qrlFaturamento.Caption:='Faturamento (  )';
         qrlDeposito.Font.Style:=[fsBold];
         qrlFaturamento.Font.Style:=[];
      end;
      1: begin
         qrlDeposito.Caption:='Depósito (   )';
         qrlFaturamento.Caption:='Faturamento ( X )';
         qrlFaturamento.Font.Style:=[fsBold];
         qrlDeposito.Font.Style:=[];
      end;
   end;

   case rdgFreteConta.ItemIndex of
      0: begin
         qrlEmitente.Caption:='Emitente ( X )';
         qrlDestinatario.Caption:='Destinatário (   )';
         qrlEmitente.Font.Style:=[fsBold];
         qrlDestinatario.Font.Style:=[];
      end;
      1: begin
         qrlEmitente.Caption:='Emitente (   )';
         qrlDestinatario.Caption:='Destinatário ( X )';
         qrlEmitente.Font.Style:=[];
         qrlDestinatario.Font.Style:=[fsBold];
      end;
   end;

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

   case rdgPeso.ItemIndex of
      0: begin
         qrlBox1.Caption:='Box 1 ( X )';
         qrlBox2.Caption:='Box 2 (   )';
         qrlBox3.Caption:='Box 3 (   )';
         qrlBox4.Caption:='Box 4 (   )';
      end;
      1: begin
         qrlBox1.Caption:='Box 1 (   )';
         qrlBox2.Caption:='Box 2 ( X )';
         qrlBox3.Caption:='Box 3 (   )';
         qrlBox4.Caption:='Box 4 (   )';
      end;
      2: begin
         qrlBox1.Caption:='Box 1 (   )';
         qrlBox2.Caption:='Box 2 (   )';
         qrlBox3.Caption:='Box 3 ( X )';
         qrlBox4.Caption:='Box 4 (   )';
      end;
      3: begin
         qrlBox1.Caption:='Box 1 (   )';
         qrlBox2.Caption:='Box 2 (   )';
         qrlBox3.Caption:='Box 3 (   )';
         qrlBox4.Caption:='Box 4 ( X )';
      end;
   end;

   if Impressora = True then begin
    // Se a finalização do pedido está aberta
    if FormExiste('frmFinalizarPedido') then
    begin
      // Definimos as impressoras de destino e imprimidos
      for vCnt:= 0 to  frmFinaPediRelaAdmn.lstImpressorasSelecionadas.Count-1 do
      begin

        for vCnt2:=0 to (Printer.Printers.Count-1) do
        begin
            if Trim(Printer.Printers.Strings[vCnt2]) =  Trim(frmFinaPediRelaAdmn.lstImpressorasSelecionadas.Items[vCnt]) then
            begin
             qrpPedidoAdministracao.PrinterSettings.PrinterIndex := vCnt2;
             qrpPedidoAdministracao.Print;
             Break;
            end;
        end;

      end;
    end
    else
    begin
      if pndDialogo.Execute then begin
         qrpPedidoAdministracao.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
         qrpPedidoAdministracao.Print;
      end;
    end;

   end
   else begin
      qrpPedidoAdministracao.PreviewModal;
   end;
end;

procedure TrtPedidoAdministracao.btnImprimirClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(True);
end;

procedure TrtPedidoAdministracao.FormShow(Sender: TObject);
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
                  rdgDetalhesPagto.ItemIndex:=StrToInt(vStringList.Strings[vCnt]);
               end;
            end;
            if vCnt = 1 then begin
               if Trim(vStringList.Strings[vCnt]) <> '' then begin
                  rdgFreteConta.ItemIndex:=StrToInt(vStringList.Strings[vCnt]);
               end;
            end;
            if vCnt = 2 then begin
               if Trim(vStringList.Strings[vCnt]) <> '' then begin
                  rdgTransporte.ItemIndex:=StrToInt(vStringList.Strings[vCnt]);
               end;
            end;
            if vCnt = 3 then begin
               if Trim(vStringList.Strings[vCnt]) <> '' then begin
                  edtTransporteOutros.Text:=vStringList.Strings[vCnt];
               end;
            end;
            if vCnt = 4 then begin
               if Trim(vStringList.Strings[vCnt]) <> '' then begin
                  rdgPeso.ItemIndex:=StrToInt(vStringList.Strings[vCnt]);
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

procedure TrtPedidoAdministracao.dtsPedidosDataChange(Sender: TObject;
  Field: TField);
begin
   inherited;
   tabVendedor.Close;
   tabVendedor.ParamByName('CodigoFuncionario').AsFloat:=tabPedidos.FieldByName('CodigoFuncionario').AsFloat;
   tabVendedor.Open;
end;

procedure TrtPedidoAdministracao.rdgTransporteClick(Sender: TObject);
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

unit rPedidosRecebidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls, ToolEdit, Gauges;

type
  TrtPedidosRecebidos = class(TfmFormBaseRelatorio)
    tabBase: TZQuery;
    pndDialogo: TPrintDialog;
    qrpPedidosRecebidos: TQuickRep;
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
    rdgOrdemEmissao: TRadioGroup;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    tabChecagens: TZQuery;
    qrlEndereco: TQRLabel;
    qrlUF: TQRLabel;
    qrlBairro: TQRLabel;
    qrlEmail: TQRLabel;
    qrlSite: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    edtCodigoCliente: TEdit;
    Label1: TLabel;
    edtNomeCliente: TEdit;
    btnLocalizaCliente: TBitBtn;
    edtCodigoResponsavel: TEdit;
    Label2: TLabel;
    edtNomeResponsavel: TEdit;
    btnLocalizaResponsavel: TBitBtn;
    edtCodigoEmpresa: TEdit;
    Label3: TLabel;
    edtNomeEmpresa: TEdit;
    btnLocalizaEmpresa: TBitBtn;
    edtDataInicial: TDateEdit;
    Label10: TLabel;
    edtDataFinal: TDateEdit;
    Label4: TLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    tabTitulosReceber: TZQuery;
    dtsBase: TDataSource;
    tabAuxRecebidos: TClientDataSet;
    tabAuxRecebidosEmissao: TDateField;
    tabAuxRecebidosPedido: TFloatField;
    tabAuxRecebidosNotaFiscal: TStringField;
    tabAuxRecebidosParcela: TIntegerField;
    tabAuxRecebidosDataLiquida: TDateField;
    tabAuxRecebidosCliente: TStringField;
    gagProgresso: TGauge;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    tabAuxRecebidosValorRecebido: TCurrencyField;
    tabAuxRecebidosValorLiquido: TCurrencyField;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    tabAuxRecebidosBanco: TFloatField;
    tabAuxRecebidosVendedor: TFloatField;
    tabAuxRecebidosObservacoes: TStringField;
    qrpResVendedor: TQuickRep;
    QRSubDetail2: TQRSubDetail;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRBand4: TQRBand;
    QRShape3: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRBand6: TQRBand;
    QRLabel19: TQRLabel;
    QRSysData3: TQRSysData;
    QRShape4: TQRShape;
    QRSysData4: TQRSysData;
    tabAuxVendedor: TClientDataSet;
    tabAuxVendedorCodVend: TFloatField;
    tabAuxVendedorNomeVendedor: TStringField;
    tabAuxVendedorValorRecebido: TCurrencyField;
    tabAuxVendedorValorLiquido: TCurrencyField;
    qrpResBanco: TQuickRep;
    QRSubDetail3: TQRSubDetail;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRBand7: TQRBand;
    QRShape5: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRBand9: TQRBand;
    QRLabel15: TQRLabel;
    QRSysData5: TQRSysData;
    QRShape6: TQRShape;
    QRSysData6: TQRSysData;
    tabAuxBanco: TClientDataSet;
    tabAuxBancoCodBanco: TFloatField;
    tabAuxBancoNomeBanco: TStringField;
    tabAuxBancoValorRecebido: TCurrencyField;
    tabAuxBancoValorLiquido: TCurrencyField;
    qrcPedidosRecebidos: TQRCompositeReport;
    SummaryBand1: TQRBand;
    qrlTotal: TQRLabel;
    SummaryBand2: TQRBand;
    qrlTotalVendedor: TQRLabel;
    SummaryBand3: TQRBand;
    qrlTotalBanco: TQRLabel;
    tabParticipacao: TZQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnLocalizaClienteClick(Sender: TObject);
    procedure edtCodigoClienteChange(Sender: TObject);
    procedure edtCodigoResponsavelChange(Sender: TObject);
    procedure edtCodigoEmpresaChange(Sender: TObject);
    procedure btnLocalizaResponsavelClick(Sender: TObject);
    procedure btnLocalizaEmpresaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtsBaseDataChange(Sender: TObject; Field: TField);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrcPedidosRecebidosAddReports(Sender: TObject);
    procedure qrcPedidosRecebidosFinished(Sender: TObject);
    procedure qrpPedidosRecebidosBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrpResVendedorBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrpResBancoBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
     procedure GerarImpressao(Impressora: Boolean = False);
  public
  end;

var vTotRecebido, vTotLiquido: real;  

implementation

uses uFormBase, uMenu, uFuncoes, uLocalizarClientes, uLocalizarGenerico, uTipos,
     uConstantes, DateUtils, uLocalizarFuncionarios;

{$R *.dfm}

procedure TrtPedidosRecebidos.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TrtPedidosRecebidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabBase.Close;
   tabTitulosReceber.Close;
   tabAuxRecebidos.Close;
   tabAuxVendedor.Close;
   tabAuxBanco.Close;
   tabParticipacao.Close;
   tabChecagens.Close;
   inherited;
end;

procedure TrtPedidosRecebidos.btnVisualizarClick(Sender: TObject);
begin
   inherited;
   GerarImpressao();
end;

procedure TrtPedidosRecebidos.GerarImpressao(Impressora: Boolean = False);
var vWhere, vObsOscilacao: string;
    vValorLiquido, vDesconto, vCodVend, vOscilacao : real;
begin
   qrlTitulo.Caption:='Pedidos Recebidos';

   tabAuxRecebidos.EmptyDataSet;
   tabAuxVendedor.EmptyDataSet;
   tabAuxBanco.EmptyDataSet;

   vWhere:='';

   tabBase.Close;
   tabBase.SQL.Clear;
   tabBase.SQL.Add('SELECT * ');
   tabBase.SQL.Add('FROM titulos_receber_liquidacoes');

   if (Trim(edtDataInicial.Text) <> '/  /') and (Trim(edtDataFinal.Text) <> '/  /') then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Período: '+edtDataInicial.Text + ' a '+ edtDataFinal.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'DataLiquida >= ' + QuotedStr(FormatDateTime(sis_date_format, edtDataInicial.Date)) + ' AND DataLiquida <= ' + QuotedStr(FormatDateTime(sis_date_format, edtDataFinal.Date));
   end;

   if Trim(vWhere) <> '' then begin
      tabBase.SQL.Add('WHERE');
      tabBase.SQL.Add(vWhere);
   end;

   if Trim(edtCodigoCliente.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Cliente: '+edtNomeCliente.Text;
   end;

   if Trim(edtCodigoResponsavel.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Responsável: '+edtNomeResponsavel.Text;
   end;

   if Trim(edtCodigoEmpresa.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Empresa: '+edtNomeEmpresa.Text;
   end;

   tabBase.Open;

   gagProgresso.MaxValue:=tabBase.RecordCount;

   tabBase.First;
   while not tabBase.Eof do begin

      gagProgresso.Progress:=tabBase.RecNo;
      Application.ProcessMessages;

      if tabTitulosReceber.FieldByName('PedidoVenda').AsInteger <> 1 then begin
         tabBase.Next;
         Continue;
      end;

      if Trim(edtCodigoCliente.Text) <> '' then begin
         if tabTitulosReceber.FieldByName('CodigoConta').AsFloat <> StrToFloat(edtCodigoCliente.Text) then begin
            tabBase.Next;
            Continue;
         end;
      end;

      if Trim(edtCodigoEmpresa.Text) <> '' then begin
         if tabTitulosReceber.FieldByName('CodigoEmpresa').AsFloat <> StrToFloat(edtCodigoEmpresa.Text) then begin
            tabBase.Next;
            Continue;
         end;
      end;

      vDesconto:=0;
      //vFrete:=0;
      vValorLiquido:=0;

      if tabTitulosReceber.FieldByName('Documento').AsFloat = 14465 then
      begin
        Sleep(5)
      end;

      try
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT ValorProdutos,Parcelas,ValorDesconto,ValorFrete,CodigoFuncionario FROM pedidos WHERE NPedido = '+FloatToStr(tabTitulosReceber.FieldByName('Documento').AsFloat)+' AND CodigoCliente = '+FloatToStr(tabTitulosReceber.FieldByName('CodigoConta').AsFloat));
         tabChecagens.Open; 

         vCodVend:=tabChecagens.FieldByName('CodigoFuncionario').AsFloat;

         if tabChecagens.FieldByName('ValorDesconto').AsFloat > 0 then begin
            vDesconto:=RoundReal(tabChecagens.FieldByName('ValorDesconto').AsFloat/tabChecagens.FieldByName('Parcelas').AsInteger, 2);
         end;

         //if tabChecagens.FieldByName('ValorFrete').AsFloat > 0 then begin
         //   vDesconto:=RoundReal(tabChecagens.FieldByName('ValorFrete').AsFloat/tabChecagens.FieldByName('Parcelas').AsInteger, 2);
         //end;

         if (tabChecagens.FieldByName('ValorProdutos').AsFloat > 0) and (tabChecagens.FieldByName('Parcelas').AsInteger > 0) then begin
            vValorLiquido:=RoundReal((tabChecagens.FieldByName('ValorProdutos').AsFloat/tabChecagens.FieldByName('Parcelas').AsInteger), 2);
         end;

         vValorLiquido:=vValorLiquido - vDesconto;
         //vValorLiquido:=vValorLiquido - vFrete;
      finally
         tabChecagens.Close;
      end;

      if Trim(edtCodigoResponsavel.Text) <> '' then begin
         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT * FROM pedidos_part_func WHERE CodigoFuncionario = '+edtCodigoResponsavel.Text+' AND NPedido = '+tabTitulosReceber.FieldByName('Documento').AsString);
            tabChecagens.Open;
            if tabChecagens.RecordCount <= 0 then begin
               tabBase.Next;
               Continue;
            end;
         finally
            tabChecagens.Close;
         end;
      end;

      vOscilacao:=0;
      vObsOscilacao:='';
      
      tabParticipacao.Close;
      tabParticipacao.SQL.Clear;
      tabParticipacao.SQL.Add('SELECT * FROM pedidos_part_func');
      tabParticipacao.SQL.Add('WHERE NPedido = '+tabTitulosReceber.FieldByName('Documento').AsString); 
      tabParticipacao.Open; 
      if tabParticipacao.RecordCount > 0 then begin
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT NPedido,Parcelas FROM pedidos WHERE NPedido = '+tabTitulosReceber.FieldByName('Documento').AsString);
         tabChecagens.Open;
         if tabChecagens.FieldByName('Parcelas').AsInteger > 0 then begin
            vOscilacao:=RoundReal(tabParticipacao.FieldByName('ValorDesconto').AsFloat / tabChecagens.FieldByName('Parcelas').AsInteger, 2);
          end
         else begin
            vOscilacao:=tabParticipacao.FieldByName('ValorDesconto').AsFloat; 
         end;
         vObsOscilacao:=tabParticipacao.FieldByName('Observacao').AsString;  
      end;
      tabAuxRecebidos.Append;
      tabAuxRecebidosEmissao.Value:=tabTitulosReceber.FieldByName('DataEmissao').AsDateTime;
      tabAuxRecebidosDataLiquida.Value:=tabBase.FieldByName('DataLiquida').AsDateTime;
      tabAuxRecebidosPedido.Value:=tabTitulosReceber.FieldByName('Documento').AsFloat;
      tabAuxRecebidosNotaFiscal.Value:=tabTitulosReceber.FieldByName('NotaFiscal').AsString;
      tabAuxRecebidosParcela.Value:=tabTitulosReceber.FieldByName('Parcela').AsInteger;
      tabAuxRecebidosValorRecebido.Value:=tabBase.FieldByName('ValorLiquida').AsFloat;
      tabAuxRecebidosBanco.Value:=tabBase.FieldByName('TipoLiquida').AsFloat;
      tabAuxRecebidosObservacoes.Value:=tabBase.FieldByName('Observacao').AsString + ' ' + vObsOscilacao; 

      try
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT * FROM bancos WHERE Codigo = '+FloatToStr(tabAuxRecebidosBanco.Value));
         tabChecagens.Open;

         if tabChecagens.FieldByName('SemValorComercial').AsInteger = 1 then begin
            tabAuxRecebidosValorLiquido.Value:=0; // **  
          end
         else begin
            tabAuxRecebidosValorLiquido.Value:=(vValorLiquido - vOscilacao); 
         end; 
      finally
         tabChecagens.Close;
      end;

      tabAuxRecebidosVendedor.Value:=vCodVend;

      try
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT NomeFantasia FROM clientes WHERE CodigoCliente = '+FloatToStr(tabTitulosReceber.FieldByName('CodigoConta').AsFloat));
         tabChecagens.Open;
         tabAuxRecebidosCliente.Value:=tabChecagens.FieldByName('NomeFantasia').AsString;
      finally
         tabChecagens.Close;
      end;
      
      tabAuxRecebidos.Post;

      // --

      if tabAuxVendedor.FindKey([tabAuxRecebidosVendedor.Value]) then begin
         tabAuxVendedor.Edit;
         tabAuxVendedorValorRecebido.Value:=tabAuxVendedorValorRecebido.Value + tabAuxRecebidosValorRecebido.Value;
         tabAuxVendedorValorLiquido.Value:=tabAuxVendedorValorLiquido.Value + tabAuxRecebidosValorLiquido.Value;
       end
      else begin
         tabAuxVendedor.Append;
         tabAuxVendedorCodVend.Value:=tabAuxRecebidosVendedor.Value;
         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT Nome FROM funcionarios WHERE Codigo = '+FloatToStr(tabAuxVendedorCodVend.Value));
            tabChecagens.Open;
            tabAuxVendedorNomeVendedor.Value:=tabChecagens.FieldByName('Nome').AsString;
         finally
            tabChecagens.Close;
         end;
         tabAuxVendedorValorRecebido.Value:=tabAuxRecebidosValorRecebido.Value;
         tabAuxVendedorValorLiquido.Value:=tabAuxRecebidosValorLiquido.Value;
      end;

      tabAuxVendedor.Post;

      // --

      if tabAuxBanco.FindKey([tabAuxRecebidosBanco.Value]) then begin
         tabAuxBanco.Edit;
         tabAuxBancoValorRecebido.Value:=tabAuxBancoValorRecebido.Value + tabAuxRecebidosValorRecebido.Value;
         tabAuxBancoValorLiquido.Value:=tabAuxBancoValorLiquido.Value + tabAuxRecebidosValorLiquido.Value;
       end
      else begin
         tabAuxBanco.Append;
         tabAuxBancoCodBanco.Value:=tabAuxRecebidosBanco.Value;
         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT Descricao FROM bancos WHERE Codigo = '+FloatToStr(tabAuxBancoCodBanco.Value));
            tabChecagens.Open;
            tabAuxBancoNomeBanco.Value:=tabChecagens.FieldByName('Descricao').AsString;
         finally
            tabChecagens.Close;
         end;
         tabAuxBancoValorRecebido.Value:=tabAuxRecebidosValorRecebido.Value;
         tabAuxBancoValorLiquido.Value:=tabAuxRecebidosValorLiquido.Value;
      end;

      tabAuxBanco.Post;

      // --

      tabBase.Next;
   end;

   gagProgresso.Progress:=0;

   case rdgOrdemEmissao.ItemIndex of
      0: tabAuxRecebidos.IndexFieldNames:='Emissao';
      1: tabAuxRecebidos.IndexFieldNames:='Pedido';
      2: tabAuxRecebidos.IndexFieldNames:='NotaFiscal';
      3: tabAuxRecebidos.IndexFieldNames:='DataLiquida';
   end;

   qrlTitulo.Caption:='Pedidos Recebidos';

   if Trim(edtCodigoResponsavel.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Responsável: '+edtNomeResponsavel.Text;
   end;
   if (Trim(edtDataInicial.Text) <> '/  /') and (Trim(edtDataFinal.Text) <> '/  /') then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Período: '+edtDataInicial.Text+' a '+edtDataFinal.Text;
   end;

   vTotRecebido:=0;
   vTotLiquido:=0;

   if Impressora = True then begin
      if pndDialogo.Execute then begin
         qrcPedidosRecebidos.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
         qrcPedidosRecebidos.Print;
      end;
    end
   else begin
      qrcPedidosRecebidos.Preview; 
   end;
end;

procedure TrtPedidosRecebidos.btnImprimirClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(True);
end;

procedure TrtPedidosRecebidos.btnLocalizaClienteClick(Sender: TObject);
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

procedure TrtPedidosRecebidos.edtCodigoClienteChange(Sender: TObject);
begin
   inherited;
   if Trim(edtCodigoCliente.Text) <> '' then begin
      try
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT NomeFantasia FROM clientes WHERE CodigoCliente = '+edtCodigoCliente.Text);
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

procedure TrtPedidosRecebidos.edtCodigoResponsavelChange(Sender: TObject);
begin
   inherited;
   if Trim(edtCodigoResponsavel.Text) <> '' then begin
      try
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT Nome FROM funcionarios WHERE Codigo = '+edtCodigoResponsavel.Text);
         tabChecagens.Open;
         if tabChecagens.RecordCount > 0 then begin
            edtNomeResponsavel.Text:=tabChecagens.FieldByName('Nome').AsString;
          end
         else begin
            edtNomeResponsavel.Text:='';
         end;
      finally
         tabChecagens.Close;
      end;
    end
   else begin
      edtNomeResponsavel.Text:='';
   end;  
end;

procedure TrtPedidosRecebidos.edtCodigoEmpresaChange(Sender: TObject);
begin
   inherited;
   if Trim(edtCodigoEmpresa.Text) <> '' then begin
      try
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT NomeFantasia FROM empresas WHERE CodigoEmpresa = '+edtCodigoEmpresa.Text);
         tabChecagens.Open;
         if tabChecagens.RecordCount > 0 then begin
            edtNomeEmpresa.Text:=tabChecagens.FieldByName('NomeFantasia').AsString;
          end
         else begin
            edtNomeEmpresa.Text:='';
         end;
      finally
         tabChecagens.Close;
      end;
    end
   else begin
      edtNomeEmpresa.Text:='';
   end;  
end;

procedure TrtPedidosRecebidos.btnLocalizaResponsavelClick(Sender: TObject);
begin
   inherited;
   if not Assigned (fmLocalizarFuncionarios) then begin
      Application.CreateForm(TfmLocalizarFuncionarios, fmLocalizarFuncionarios);
      fmLocalizarFuncionarios.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edtCodigoResponsavel.Text:=fmMenu.pubTrans1;
   end;
end;

procedure TrtPedidosRecebidos.btnLocalizaEmpresaClick(Sender: TObject);
var vParamLoc: TParametrosLocalizar;
begin
   inherited;
   vParamLoc.Table:='empresas';
   vParamLoc.KeyField:='CodigoEmpresa';
   vParamLoc.Field1:='NomeFantasia';
   vParamLoc.Filter:='';
   if not Assigned (fmLocalizarGenerico) then begin
      Application.CreateForm(TfmLocalizarGenerico, fmLocalizarGenerico);
      fmLocalizarGenerico.LoadParams(vParamLoc);
      fmLocalizarGenerico.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edtCodigoEmpresa.Text:=fmMenu.pubTrans1;
   end;
end;

procedure TrtPedidosRecebidos.FormShow(Sender: TObject);
begin
   inherited;
   edtDataInicial.Date:=StartOfTheMonth(Date);
   edtDataFinal.Date:=EndOfTheMonth(Date);

   tabAuxRecebidos.CreateDataSet;
   tabAuxRecebidos.EmptyDataSet;

   tabAuxVendedor.CreateDataSet;
   tabAuxVendedor.EmptyDataSet;
   tabAuxVendedor.IndexFieldNames:='CodVend';

   tabAuxBanco.CreateDataSet;
   tabAuxBanco.EmptyDataSet;
   tabAuxBanco.IndexFieldNames:='CodBanco'; 

   tabTitulosReceber.Params.CreateParam(ftFloat, 'Titulo', ptUnknown);
   tabTitulosReceber.SQL.Add('SELECT DataEmissao, Documento, NotaFiscal, Parcela,');
   tabTitulosReceber.SQL.Add('CodigoConta, CodigoEmpresa, PedidoVenda');
   tabTitulosReceber.SQL.Add('FROM titulos_receber');
   tabTitulosReceber.SQL.Add('WHERE Titulo =:Titulo');
   tabTitulosReceber.Open;
end;

procedure TrtPedidosRecebidos.dtsBaseDataChange(Sender: TObject;
  Field: TField);
begin
   inherited;
   tabTitulosReceber.Close;
   tabTitulosReceber.ParamByName('Titulo').AsFloat:=tabBase.FieldByName('Titulo').AsFloat;
   tabTitulosReceber.Open;
end;

procedure TrtPedidosRecebidos.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   inherited;
   vTotRecebido:=vTotRecebido + tabAuxRecebidosValorRecebido.Value;
   vTotLiquido:=vTotLiquido + tabAuxRecebidosValorLiquido.Value;
   qrlTotal.Caption:='Recebido: '+FormatFloat(sis_curr_format, vTotRecebido)+' - Liquido: '+FormatFloat(sis_curr_format, vTotLiquido);    
end;

procedure TrtPedidosRecebidos.QRSubDetail2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   inherited; 
   vTotRecebido:=vTotRecebido + tabAuxVendedorValorRecebido.Value;
   vTotLiquido:=vTotLiquido + tabAuxVendedorValorLiquido.Value;
   qrlTotalVendedor.Caption:='Recebido: '+FormatFloat(sis_curr_format, vTotRecebido)+' - Liquido: '+FormatFloat(sis_curr_format, vTotLiquido);
end;

procedure TrtPedidosRecebidos.QRSubDetail3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   inherited;
   vTotRecebido:=vTotRecebido + tabAuxBancoValorRecebido.Value;
   vTotLiquido:=vTotLiquido + tabAuxBancoValorLiquido.Value;
   qrlTotalBanco.Caption:='Recebido: '+FormatFloat(sis_curr_format, vTotRecebido)+' - Liquido: '+FormatFloat(sis_curr_format, vTotLiquido);
end;

procedure TrtPedidosRecebidos.qrcPedidosRecebidosAddReports(
  Sender: TObject);
begin
   inherited;
   qrcPedidosRecebidos.Reports.Add(qrpPedidosRecebidos);
   qrcPedidosRecebidos.Reports.Add(qrpResVendedor);
   qrcPedidosRecebidos.Reports.Add(qrpResBanco);
end;

procedure TrtPedidosRecebidos.qrcPedidosRecebidosFinished(Sender: TObject);
begin
   inherited;
   vTotRecebido:=0;
   vTotLiquido:=0;
end;

procedure TrtPedidosRecebidos.qrpPedidosRecebidosBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   inherited;
   vTotRecebido:=0;
   vTotLiquido:=0;
end;

procedure TrtPedidosRecebidos.qrpResVendedorBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   inherited;
   vTotRecebido:=0;
   vTotLiquido:=0;
end;

procedure TrtPedidosRecebidos.qrpResBancoBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   inherited;
   vTotRecebido:=0;
   vTotLiquido:=0;
end;

end.

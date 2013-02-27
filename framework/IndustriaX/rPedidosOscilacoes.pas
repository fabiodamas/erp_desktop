unit rPedidosOscilacoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls, ToolEdit, Gauges;

type
  TrtPedidosOscilacoes = class(TfmFormBaseRelatorio)
    tabPedidos: TZQuery;
    pndDialogo: TPrintDialog;
    qrpPedidosOscilacoes: TQuickRep;
    QRBand1: TQRBand;
    QRBand3: TQRBand;
    qrlSignature: TQRLabel;
    QRShape1: TQRShape;
    qrlTitulo: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape2: TQRShape;
    QRSysData2: TQRSysData;
    tabParticipacao: TZQuery;
    Label2: TLabel;
    Label3: TLabel;
    edtEntregaInicial: TDateEdit;
    edtEntregaFinal: TDateEdit;
    Label1: TLabel;
    edtCodigoEmpresa: TEdit;
    btnLocalizarEmpresa: TBitBtn;
    edtEmpresa: TEdit;
    gagProgresso: TGauge;
    Label4: TLabel;
    edtCodigoCliente: TEdit;
    btnLocalizarCliente: TBitBtn;
    edtCliente: TEdit;
    Label5: TLabel;
    edtCodigoResponsavel: TEdit;
    btnLocalizarResponsavel: TBitBtn;
    edtResponsavel: TEdit;
    tabChecagens: TZQuery;
    tabAuxOscilacoes: TClientDataSet;
    tabAuxOscilacoesPedido: TFloatField;
    tabAuxOscilacoesCliente: TStringField;
    tabAuxOscilacoesDataEntrega: TDateField;
    tabAuxOscilacoesFatura: TStringField;
    tabAuxOscilacoesLocalizacao: TStringField;
    tabAuxOscilacoesCodigoLocalizacao: TFloatField;
    tabAuxOscilacoesCCusto: TStringField;
    tabAuxOscilacoesDesconto: TCurrencyField;
    tabAuxOscilacoesOscilacao: TCurrencyField;
    tabAuxOscilacoesValorLiquido: TCurrencyField;
    tabAuxOscilacoesObservacao: TStringField;
    qrcOscilacoes: TQRCompositeReport;
    QRSubDetail2: TQRSubDetail;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    rdgOrdemEmissao: TRadioGroup;
    tabAuxOscilacoesVendedor: TStringField;
    tabAuxLocCC: TClientDataSet;
    tabAuxLocCCCodigoLoc: TFloatField;
    tabAuxLocCCLocalizacao: TStringField;
    tabAuxLocCCCodigoCC: TStringField;
    tabAuxLocCCCCusto: TStringField;
    tabAuxLocCCDesconto: TCurrencyField;
    tabAuxLocCCOscilacao: TCurrencyField;
    tabAuxLocCCValorLiquido: TCurrencyField;
    qrpLocCC: TQuickRep;
    QRBand2: TQRBand;
    QRShape3: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRBand4: TQRBand;
    QRLabel24: TQRLabel;
    QRSysData3: TQRSysData;
    QRShape4: TQRShape;
    QRSysData4: TQRSysData;
    QRSubDetail1: TQRSubDetail;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    tabAuxOscilacoesDescCC: TStringField;
    SummaryBand1: TQRBand;
    qrlTotal: TQRLabel;
    SummaryBand2: TQRBand;
    qrlTotLocCC: TQRLabel;
    qrpLocalizacao: TQuickRep;
    QRBand5: TQRBand;
    QRShape5: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel23: TQRLabel;
    QRBand6: TQRBand;
    QRLabel25: TQRLabel;
    QRSysData5: TQRSysData;
    QRShape6: TQRShape;
    QRSysData6: TQRSysData;
    QRSubDetail3: TQRSubDetail;
    QRDBText3: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRBand7: TQRBand;
    qrlTotLocalizacao: TQRLabel;
    tabAuxLoc: TClientDataSet;
    tabAuxLocCodigoLoc: TFloatField;
    tabAuxLocLocalizacao: TStringField;
    tabAuxLocDesconto: TCurrencyField;
    tabAuxLocOscilacao: TCurrencyField;
    tabAuxLocValorLiquido: TCurrencyField;
    qrpCentroCusto: TQuickRep;
    QRBand8: TQRBand;
    QRShape7: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRBand9: TQRBand;
    QRLabel30: TQRLabel;
    QRSysData7: TQRSysData;
    QRShape8: TQRShape;
    QRSysData8: TQRSysData;
    QRSubDetail4: TQRSubDetail;
    QRDBText4: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRBand10: TQRBand;
    qrlTotCentroCusto: TQRLabel;
    tabAuxCC: TClientDataSet;
    tabAuxCCDesconto: TCurrencyField;
    tabAuxCCOscilacao: TCurrencyField;
    tabAuxCCValorLiquido: TCurrencyField;
    tabAuxCCCodigoCC: TStringField;
    tabAuxCCCCusto: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure edtCodigoEmpresaChange(Sender: TObject);
    procedure edtCodigoClienteChange(Sender: TObject);
    procedure edtCodigoResponsavelChange(Sender: TObject);
    procedure btnLocalizarEmpresaClick(Sender: TObject);
    procedure btnLocalizarClienteClick(Sender: TObject);
    procedure btnLocalizarResponsavelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qrcOscilacoesAddReports(Sender: TObject);
    procedure QRSubDetail2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrcOscilacoesFinished(Sender: TObject);
    procedure QRSubDetail3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrpPedidosOscilacoesBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrpLocCCBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrpLocalizacaoBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrpCentroCustoBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
     procedure GerarImpressao(Impressora: Boolean = False);
  public
  end;

var vDesconto, vOscilacao, vValorLiquido: real;

implementation

uses uFormBase, uMenu, uFuncoes, uConstantes, uLocalizarGenerico, uTipos,
     uLocalizarClientes, DateUtils, uLocalizarFuncionarios;

{$R *.dfm}

procedure TrtPedidosOscilacoes.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TrtPedidosOscilacoes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabPedidos.Close;
   tabParticipacao.Close;
   tabAuxOscilacoes.Close;
   tabAuxLocCC.Close;
   tabAuxLoc.Close;
   tabAuxCC.Close;
   inherited;
end;

procedure TrtPedidosOscilacoes.btnVisualizarClick(Sender: TObject);
begin
   inherited;
   GerarImpressao();
end;

procedure TrtPedidosOscilacoes.GerarImpressao(Impressora: Boolean = False);
var vWhere: string;
begin
   tabAuxOscilacoes.EmptyDataSet;
   tabAuxLocCC.EmptyDataSet;
   tabAuxLoc.EmptyDataSet;
   tabAuxCC.EmptyDataSet;

   vWhere:='pedidos.DataEntrega IS NOT NULL AND pedidos.NPedido > 0'; 

   qrlTitulo.Caption:='Pedidos Oscilações';

   tabPedidos.Close;
   tabPedidos.SQL.Clear;
   tabPedidos.SQL.Add('SELECT pedidos.NPedido, pedidos.DataEntrega, pedidos.Fatura,');
   tabPedidos.SQL.Add('pedidos.CodigoCliente, pedidos.ValorDesconto, pedidos.ValorProdutos,');   
   tabPedidos.SQL.Add('clientes.NomeFantasia AS Cliente, funcionarios.Nome AS Vendedor');
   tabPedidos.SQL.Add('FROM pedidos');
   tabPedidos.SQL.Add('LEFT JOIN clientes ON pedidos.CodigoCliente = clientes.CodigoCliente');
   tabPedidos.SQL.Add('LEFT JOIN funcionarios ON pedidos.CodigoFuncionario = funcionarios.Codigo');

   if (Trim(edtEntregaInicial.Text) <> '/  /') and (Trim(edtEntregaFinal.Text) <> '/  /') then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Período Entrega: '+edtEntregaInicial.Text + ' a ' + edtEntregaFinal.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'pedidos.DataEntrega >= '+QuotedStr(FormatDateTime(sis_date_format, edtEntregaInicial.Date))+' AND pedidos.DataEntrega <= '+QuotedStr(FormatDateTime(sis_date_format, edtEntregaFinal.Date));
   end;

   if Trim(edtCodigoEmpresa.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Empresa: '+edtEmpresa.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'pedidos.CodigoEmpresa = '+edtCodigoEmpresa.Text;
   end;

   if Trim(edtCodigoCliente.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Cliente: '+edtCliente.Text; 
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'pedidos.CodigoCliente = '+edtCodigoCliente.Text;
   end;

   if Trim(edtCodigoResponsavel.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Responsável: '+edtResponsavel.Text;   
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'pedidos.CodigoFuncionario = '+edtCodigoResponsavel.Text;
   end;   

   if Trim(vWhere) <> '' then begin
      tabPedidos.SQL.Add('WHERE');
      tabPedidos.SQL.Add(vWhere);
   end;

   tabPedidos.Open;

   gagProgresso.MaxValue:=tabPedidos.RecordCount;

   tabPedidos.First;
   while not tabPedidos.Eof do begin

      gagProgresso.Progress:=tabPedidos.RecNo;
      Application.ProcessMessages;

      tabParticipacao.Close;
      tabParticipacao.SQL.Clear;
      tabParticipacao.SQL.Add('SELECT * FROM pedidos_part_func');
      tabParticipacao.SQL.Add('WHERE NPedido = '+tabPedidos.FieldByName('NPedido').AsString);
      tabParticipacao.Open;

      tabAuxOscilacoes.Append;
      if tabParticipacao.RecordCount > 0 then begin
         tabAuxOscilacoesOscilacao.Value:=tabParticipacao.FieldByName('ValorDesconto').AsFloat;
         tabAuxOscilacoesObservacao.Value:=tabParticipacao.FieldByName('Observacao').AsString;
      end;

      tabAuxOscilacoesPedido.Value:=tabPedidos.FieldByName('NPedido').AsFloat;
      tabAuxOscilacoesCliente.Value:=tabPedidos.FieldByName('Cliente').AsString;
      tabAuxOscilacoesVendedor.Value:=tabPedidos.FieldByName('Vendedor').AsString;
      if not tabPedidos.FieldByName('DataEntrega').IsNull then begin
         tabAuxOscilacoesDataEntrega.Value:=tabPedidos.FieldByName('DataEntrega').AsDateTime;
      end;
      tabAuxOscilacoesFatura.Value:=tabPedidos.FieldByName('Fatura').AsString;

      try 
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT titulos_receber.CodigoLocalizacao, titulos_receber.CodigoCentroCusto,');
         tabChecagens.SQL.Add('genericos.Descricao AS Localizacao, centro_custo.Descricao AS DescCC');
         tabChecagens.SQL.Add('FROM titulos_receber');
         tabChecagens.SQL.Add('LEFT JOIN genericos ON titulos_receber.CodigoLocalizacao = genericos.Codigo');
         tabChecagens.SQL.Add('LEFT JOIN centro_custo ON titulos_receber.CodigoCentroCusto = centro_custo.Codigo');         
         tabChecagens.SQL.Add('WHERE ');
         tabChecagens.SQL.Add('titulos_receber.Documento = '+tabPedidos.FieldByName('NPedido').AsString);
         tabChecagens.SQL.Add('AND titulos_receber.CodigoConta = '+tabPedidos.FieldByName('CodigoCliente').AsString);
         tabChecagens.SQL.Add('AND titulos_receber.PedidoVenda = 1');
         tabChecagens.Open;
         if tabChecagens.RecordCount > 0 then begin
            tabAuxOscilacoesCodigoLocalizacao.Value:=tabChecagens.FieldByName('CodigoLocalizacao').AsFloat;
            tabAuxOscilacoesLocalizacao.Value:=tabChecagens.FieldByName('Localizacao').AsString;
            tabAuxOscilacoesCCusto.Value:=tabChecagens.FieldByName('CodigoCentroCusto').AsString;
            tabAuxOscilacoesDescCC.Value:=tabChecagens.FieldByName('DescCC').AsString;
         end;
      finally
         tabChecagens.Close;
      end;

      tabAuxOscilacoesDesconto.Value:=tabPedidos.FieldByName('ValorDesconto').AsFloat;
      tabAuxOscilacoesValorLiquido.Value:=(tabPedidos.FieldByName('ValorProdutos').AsFloat-tabPedidos.FieldByName('ValorDesconto').AsFloat)-tabAuxOscilacoesOscilacao.Value;
      tabAuxOscilacoes.Post;

      if tabAuxLocCC.FindKey([tabAuxOscilacoesCodigoLocalizacao.Value, tabAuxOscilacoesCCusto.Value]) then begin
         tabAuxLocCC.Edit;
         tabAuxLocCCDesconto.Value:=tabAuxLocCCDesconto.Value + tabAuxOscilacoesDesconto.Value;
         tabAuxLocCCOscilacao.Value:=tabAuxLocCCOscilacao.Value + tabAuxOscilacoesOscilacao.Value;
         tabAuxLocCCValorLiquido.Value:=tabAuxLocCCValorLiquido.Value + tabAuxOscilacoesValorLiquido.Value;
       end
      else begin
         tabAuxLocCC.Append;
         tabAuxLocCCCodigoLoc.Value:=tabAuxOscilacoesCodigoLocalizacao.Value;
         tabAuxLocCCCodigoCC.Value:=tabAuxOscilacoesCCusto.Value;
         tabAuxLocCCCCusto.Value:=tabAuxOscilacoesDescCC.Value;
         tabAuxLocCCLocalizacao.Value:=tabAuxOscilacoesLocalizacao.Value;
         tabAuxLocCCDesconto.Value:=tabAuxOscilacoesDesconto.Value;
         tabAuxLocCCOscilacao.Value:=tabAuxOscilacoesOscilacao.Value;
         tabAuxLocCCValorLiquido.Value:=tabAuxOscilacoesValorLiquido.Value;
      end;
      tabAuxLocCC.Post;

      if tabAuxLoc.FindKey([tabAuxOscilacoesCodigoLocalizacao.Value]) then begin
         tabAuxLoc.Edit;
         tabAuxLocDesconto.Value:=tabAuxLocDesconto.Value + tabAuxOscilacoesDesconto.Value;
         tabAuxLocOscilacao.Value:=tabAuxLocOscilacao.Value + tabAuxOscilacoesOscilacao.Value;
         tabAuxLocValorLiquido.Value:=tabAuxLocValorLiquido.Value + tabAuxOscilacoesValorLiquido.Value;
       end
      else begin
         tabAuxLoc.Append;
         tabAuxLocCodigoLoc.Value:=tabAuxOscilacoesCodigoLocalizacao.Value;
         tabAuxLocLocalizacao.Value:=tabAuxOscilacoesLocalizacao.Value;
         tabAuxLocDesconto.Value:=tabAuxOscilacoesDesconto.Value;
         tabAuxLocOscilacao.Value:=tabAuxOscilacoesOscilacao.Value;
         tabAuxLocValorLiquido.Value:=tabAuxOscilacoesValorLiquido.Value; 
      end;
      tabAuxLoc.Post;

      if tabAuxCC.FindKey([tabAuxOscilacoesCCusto.Value]) then begin
         tabAuxCC.Edit;
         tabAuxCCDesconto.Value:=tabAuxCCDesconto.Value + tabAuxOscilacoesDesconto.Value;
         tabAuxCCOscilacao.Value:=tabAuxCCOscilacao.Value + tabAuxOscilacoesOscilacao.Value;
         tabAuxCCValorLiquido.Value:=tabAuxCCValorLiquido.Value + tabAuxOscilacoesValorLiquido.Value;
       end
      else begin
         tabAuxCC.Append;
         tabAuxCCCodigoCC.Value:=tabAuxOscilacoesCCusto.Value;
         tabAuxCCCCusto.Value:=tabAuxOscilacoesDescCC.Value;
         tabAuxCCDesconto.Value:=tabAuxOscilacoesDesconto.Value;
         tabAuxCCOscilacao.Value:=tabAuxOscilacoesOscilacao.Value;
         tabAuxCCValorLiquido.Value:=tabAuxOscilacoesValorLiquido.Value;
      end;
      tabAuxCC.Post; 

      tabPedidos.Next;
   end;

   gagProgresso.Progress:=0;

   case rdgOrdemEmissao.ItemIndex of
      0: tabAuxOscilacoes.IndexFieldNames:='Pedido';
      1: tabAuxOscilacoes.IndexFieldNames:='Fatura';
      2: tabAuxOscilacoes.IndexFieldNames:='DataEntrega'; 
   end;

   tabAuxOscilacoes.First;

   vDesconto:=0;
   vOscilacao:=0;
   vValorLiquido:=0;

   if Impressora = True then begin
      if pndDialogo.Execute then begin
         qrcOscilacoes.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
         qrcOscilacoes.Print;
      end;
    end
   else begin
      qrcOscilacoes.Preview;
   end;
end;

procedure TrtPedidosOscilacoes.btnImprimirClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(True);
end;

procedure TrtPedidosOscilacoes.edtCodigoEmpresaChange(Sender: TObject);
begin
   inherited;
   try
      if Trim(edtCodigoEmpresa.Text) <> '' then begin
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT CodigoEmpresa,NomeFantasia FROM empresas WHERE CodigoEmpresa = '+edtCodigoEmpresa.Text);
         tabChecagens.Open;
         if tabChecagens.RecordCount > 0 then begin
            edtEmpresa.Text:=tabChecagens.FieldByName('NomeFantasia').AsString;
          end
         else begin
            edtEmpresa.Text:='';
         end;
       end
      else begin
         edtEmpresa.Text:='';
      end;
   finally
      tabChecagens.Close;
   end;
end;

procedure TrtPedidosOscilacoes.edtCodigoClienteChange(Sender: TObject);
begin
   inherited;
   try
      if Trim(edtCodigoCliente.Text) <> '' then begin
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT CodigoCliente,NomeFantasia FROM clientes WHERE CodigoCliente = '+edtCodigoCliente.Text);
         tabChecagens.Open;
         if tabChecagens.RecordCount > 0 then begin
            edtCliente.Text:=tabChecagens.FieldByName('NomeFantasia').AsString;
          end
         else begin
            edtCliente.Text:='';
         end;
       end
      else begin
         edtCliente.Text:='';
      end;
   finally
      tabChecagens.Close;
   end;
end;

procedure TrtPedidosOscilacoes.edtCodigoResponsavelChange(Sender: TObject);
begin
   inherited;
   try
      if Trim(edtCodigoResponsavel.Text) <> '' then begin
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT Codigo,Nome FROM funcionarios WHERE Codigo = '+edtCodigoResponsavel.Text);
         tabChecagens.Open;
         if tabChecagens.RecordCount > 0 then begin
            edtResponsavel.Text:=tabChecagens.FieldByName('Nome').AsString;
          end
         else begin
            edtResponsavel.Text:='';
         end;
       end
      else begin
         edtResponsavel.Text:='';
      end;
   finally
      tabChecagens.Close;
   end;
end;

procedure TrtPedidosOscilacoes.btnLocalizarEmpresaClick(Sender: TObject);
var vParamLoc: TParametrosLocalizar;
begin
   inherited;
   vParamLoc.Table:='empresas';
   vParamLoc.KeyField:='CodigoEmpresa';
   vParamLoc.Field1:='NomeFantasia';
   if not Assigned (fmLocalizarGenerico) then begin
      Application.CreateForm(TfmLocalizarGenerico, fmLocalizarGenerico);
      fmLocalizarGenerico.LoadParams(vParamLoc);
      fmLocalizarGenerico.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edtCodigoEmpresa.Text:=fmMenu.pubTrans1;
   end;
end;

procedure TrtPedidosOscilacoes.btnLocalizarClienteClick(Sender: TObject);
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

procedure TrtPedidosOscilacoes.btnLocalizarResponsavelClick(
  Sender: TObject);
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

procedure TrtPedidosOscilacoes.FormShow(Sender: TObject);
begin
   inherited;
   tabAuxOscilacoes.CreateDataSet;
   tabAuxOscilacoes.EmptyDataSet;

   tabAuxLocCC.CreateDataSet;
   tabAuxLocCC.EmptyDataSet;
   tabAuxLocCC.IndexFieldNames:='CodigoLoc;CodigoCC';

   tabAuxLoc.CreateDataSet;
   tabAuxLoc.EmptyDataSet;
   tabAuxLoc.IndexFieldNames:='CodigoLoc';

   tabAuxCC.CreateDataSet;
   tabAuxCC.EmptyDataSet;
   tabAuxCC.IndexFieldNames:='CodigoCC';

   edtEntregaInicial.Date:=StartOfTheMonth(Date);
   edtEntregaFinal.Date:=EndOfTheMonth(Date);
end;

procedure TrtPedidosOscilacoes.qrcOscilacoesAddReports(Sender: TObject);
begin
   inherited;
   qrcOscilacoes.Reports.Add(qrpPedidosOscilacoes);
   qrcOscilacoes.Reports.Add(qrpLocCC);
   qrcOscilacoes.Reports.Add(qrpLocalizacao);
   qrcOscilacoes.Reports.Add(qrpCentroCusto);
end;

procedure TrtPedidosOscilacoes.QRSubDetail2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   inherited;
   vDesconto:=vDesconto + tabAuxOscilacoesDesconto.Value;
   vOscilacao:=vOscilacao + tabAuxOscilacoesOscilacao.Value;
   vValorLiquido:=vValorLiquido + tabAuxOscilacoesValorLiquido.Value;
   qrlTotal.Caption:='Desconto: '+FormatFloat(sis_curr_format, vDesconto)+' - Oscilação: '+FormatFloat(sis_curr_format, vOscilacao)+' - Valor Liquido: '+FormatFloat(sis_curr_format, vValorLiquido);
end;

procedure TrtPedidosOscilacoes.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   inherited;
   vDesconto:=vDesconto + tabAuxLocCCDesconto.Value;
   vOscilacao:=vOscilacao + tabAuxLocCCOscilacao.Value;
   vValorLiquido:=vValorLiquido + tabAuxLocCCValorLiquido.Value;   
   qrlTotLocCC.Caption:='Desconto: '+FormatFloat(sis_curr_format, vDesconto)+' - Oscilação: '+FormatFloat(sis_curr_format, vOscilacao)+' - Valor Liquido: '+FormatFloat(sis_curr_format, vValorLiquido);
end;

procedure TrtPedidosOscilacoes.qrcOscilacoesFinished(Sender: TObject);
begin
   inherited;
   vDesconto:=0;
   vOscilacao:=0;
   vValorLiquido:=0;
end;

procedure TrtPedidosOscilacoes.QRSubDetail3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   inherited;
   vDesconto:=vDesconto + tabAuxLocDesconto.Value;
   vOscilacao:=vOscilacao + tabAuxLocOscilacao.Value;
   vValorLiquido:=vValorLiquido + tabAuxLocValorLiquido.Value;
   qrlTotLocalizacao.Caption:='Desconto: '+FormatFloat(sis_curr_format, vDesconto)+' - Oscilação: '+FormatFloat(sis_curr_format, vOscilacao)+' - Valor Liquido: '+FormatFloat(sis_curr_format, vValorLiquido);
end;

procedure TrtPedidosOscilacoes.QRSubDetail4BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   inherited;
   vDesconto:=vDesconto + tabAuxCCDesconto.Value;
   vOscilacao:=vOscilacao + tabAuxCCOscilacao.Value;
   vValorLiquido:=vValorLiquido + tabAuxCCValorLiquido.Value;   
   qrlTotCentroCusto.Caption:='Desconto: '+FormatFloat(sis_curr_format, vDesconto)+' - Oscilação: '+FormatFloat(sis_curr_format, vOscilacao)+' - Valor Liquido: '+FormatFloat(sis_curr_format, vValorLiquido);
end;

procedure TrtPedidosOscilacoes.qrpPedidosOscilacoesBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   inherited;
   vDesconto:=0;
   vOscilacao:=0;
   vValorLiquido:=0;
end;

procedure TrtPedidosOscilacoes.qrpLocCCBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   inherited;
   vDesconto:=0;
   vOscilacao:=0;
   vValorLiquido:=0;
end;

procedure TrtPedidosOscilacoes.qrpLocalizacaoBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   inherited;
   vDesconto:=0;
   vOscilacao:=0;
   vValorLiquido:=0;
end;

procedure TrtPedidosOscilacoes.qrpCentroCustoBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   inherited;
   vDesconto:=0;
   vOscilacao:=0;
   vValorLiquido:=0;
end;

end.

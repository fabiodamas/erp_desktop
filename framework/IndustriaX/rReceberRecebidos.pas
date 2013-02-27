unit rReceberRecebidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls, ToolEdit, Gauges, Grids, DBGrids;

type
  TrtReceberRecebidos = class(TfmFormBaseRelatorio)
    tabBase: TZQuery;
    pndDialogo: TPrintDialog;
    qrpReceberRecebidos: TQuickRep;
    QRSubDetail1: TQRSubDetail;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    qrlSignature: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRShape1: TQRShape;
    qrlTitulo: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape2: TQRShape;
    tabChecagens: TZQuery;
    QRSysData2: TQRSysData;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    edtBanco: TDBLookupComboBox;
    Label1: TLabel;
    edtEmpresa: TDBLookupComboBox;
    Label2: TLabel;
    rdgOrdemEmissao: TRadioGroup;
    tabBancos: TZQuery;
    dtsBancos: TDataSource;
    tabEmpresas: TZQuery;
    dtsEmpresas: TDataSource;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    Label3: TLabel;
    Label4: TLabel;
    edtDataInicial: TDateEdit;
    edtDataFinal: TDateEdit;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    qrpResEmpBanco: TQuickRep;
    QRSubDetail2: TQRSubDetail;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText23: TQRDBText;
    QRBand5: TQRBand;
    QRBand6: TQRBand;
    QRLabel32: TQRLabel;
    QRSysData3: TQRSysData;
    QRShape4: TQRShape;
    QRSysData4: TQRSysData;
    gagProgresso: TGauge;
    tabAuxRecebidos: TClientDataSet;
    tabAuxRecebidosEmissao: TDateField;
    tabAuxRecebidosDocumento: TFloatField;
    tabAuxRecebidosNotaFiscal: TStringField;
    tabAuxRecebidosParcela: TIntegerField;
    tabAuxRecebidosData: TDateField;
    tabAuxRecebidosCodigoConta: TFloatField;
    tabAuxRecebidosNomeFantasia: TStringField;
    tabAuxRecebidosValorTitulo: TCurrencyField;
    tabAuxRecebidosValorDesconto: TCurrencyField;
    tabAuxRecebidosValorAcrescimo: TCurrencyField;
    tabAuxRecebidosCC: TStringField;
    tabAuxRecebidosEmp: TFloatField;
    tabAuxBancosResp: TClientDataSet;
    QRDBText20: TQRDBText;
    qrpResEmpresa: TQuickRep;
    QRSubDetail4: TQRSubDetail;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRBand11: TQRBand;
    QRBand12: TQRBand;
    QRLabel40: TQRLabel;
    QRSysData7: TQRSysData;
    QRShape8: TQRShape;
    QRSysData8: TQRSysData;
    tabAuxRecebidosPedidoVenda: TIntegerField;
    qrpResBancoResp: TQuickRep;
    QRSubDetail5: TQRSubDetail;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRBand14: TQRBand;
    QRBand15: TQRBand;
    QRLabel48: TQRLabel;
    QRSysData9: TQRSysData;
    QRShape10: TQRShape;
    QRSysData10: TQRSysData;
    QRDBText46: TQRDBText;
    QRDBText47: TQRDBText;
    tabAuxRecebidosBanco: TFloatField;
    tabAuxRecebidosVencto: TDateField;
    tabAuxBancosRespCodResp: TFloatField;
    tabAuxBancosRespNomeResp: TStringField;
    tabAuxBancosRespCodBanco: TFloatField;
    tabAuxBancosRespDescBanco: TStringField;
    tabAuxRecebidosCodResp: TFloatField;
    tabAuxBancosRespValorTitulo: TCurrencyField;
    tabAuxBancosRespValorDesconto: TCurrencyField;
    tabAuxBancosRespValorAcrescimo: TCurrencyField;
    tabAuxResEmpresa: TClientDataSet;
    tabAuxResEmpresaCodEmp: TFloatField;
    tabAuxResEmpresaNomeEmp: TStringField;
    tabAuxResEmpresaValorTitulo: TCurrencyField;
    tabAuxResEmpresaValorDesconto: TCurrencyField;
    tabAuxResEmpresaValorAcrescimo: TCurrencyField;
    QRDBText13: TQRDBText;
    QRDBText22: TQRDBText;
    tabAuxEmpBanco: TClientDataSet;
    tabAuxEmpBancoValorTitulo: TCurrencyField;
    tabAuxEmpBancoValorDesconto: TCurrencyField;
    tabAuxEmpBancoValorAcrescimo: TCurrencyField;
    tabAuxEmpBancoCodEmp: TFloatField;
    tabAuxEmpBancoNomeEmp: TStringField;
    tabAuxEmpBancoCodBanco: TFloatField;
    tabAuxEmpBancoNomeBanco: TStringField;
    qrcRecebidos: TQRCompositeReport;
    QRShape9: TQRShape;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel43: TQRLabel;
    QRShape7: TQRShape;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel35: TQRLabel;
    QRShape3: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    tabAuxRecebidosValorRecebido: TCurrencyField;
    tabAuxBancosRespValorRecebido: TCurrencyField;
    tabAuxResEmpresaValorRecebido: TCurrencyField;
    tabAuxEmpBancoValorRecebido: TCurrencyField;
    QRLabel20: TQRLabel;
    QRDBText19: TQRDBText;
    SummaryBand1: TQRBand;
    qrlTotalReceberEmitidos: TQRLabel;
    SummaryBand2: TQRBand;
    qrlTotalEmpBanco: TQRLabel;
    SummaryBand3: TQRBand;
    qrlTotalEmpresa: TQRLabel;
    QRBand7: TQRBand;
    qrlTotalRespBanco: TQRLabel;
    edtCodigoBanco: TEdit;
    edtCodigoEmpresa: TEdit;
    tabAuxRecebidosTitulo: TFloatField;
    qrpResBanco: TQuickRep;
    QRSubDetail3: TQRSubDetail;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRBand4: TQRBand;
    QRShape5: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRBand8: TQRBand;
    QRLabel30: TQRLabel;
    QRSysData5: TQRSysData;
    QRShape6: TQRShape;
    QRSysData6: TQRSysData;
    QRBand9: TQRBand;
    qrlTotalBanco: TQRLabel;
    tabAuxBancos: TClientDataSet;
    tabAuxBancosCodBanco: TFloatField;
    tabAuxBancosDescBanco: TStringField;
    tabAuxBancosValorTitulo: TCurrencyField;
    tabAuxBancosValorDesconto: TCurrencyField;
    tabAuxBancosValorAcrescimo: TCurrencyField;
    tabAuxBancosValorRecebido: TCurrencyField;
    mmo1: TMemo;
    dtsAuxBancos: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrcRecebidosAddReports(Sender: TObject);
    procedure qrcRecebidosFinished(Sender: TObject);
    procedure QRSubDetail2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure edtCodigoBancoChange(Sender: TObject);
    procedure edtBancoCloseUp(Sender: TObject);
    procedure edtCodigoEmpresaChange(Sender: TObject);
    procedure edtEmpresaCloseUp(Sender: TObject);
    procedure qrpReceberRecebidosBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrpResEmpBancoBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrpResEmpresaBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrpResBancoRespBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrpResBancoBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRSubDetail3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
     procedure GerarImpressao(Impressora: Boolean = False);
  public
  end;

var vValorTitulo, vValorDesconto, vValorAcrescimo, vValorRecebido : real;  

implementation

uses uFormBase, uMenu, uFuncoes, uConstantes, DateUtils;

{$R *.dfm}

procedure TrtReceberRecebidos.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TrtReceberRecebidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabBancos.Close;
   tabEmpresas.Close;
   tabBase.Close;
   tabAuxRecebidos.Close;
   tabAuxBancosResp.Close;
   tabAuxResEmpresa.Close; 
   tabAuxEmpBanco.Close;
   tabAuxBancos.Close;
   inherited;
end;

procedure TrtReceberRecebidos.btnVisualizarClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(); 
end;

procedure TrtReceberRecebidos.GerarImpressao(Impressora: Boolean = False);
var vWhere : string;
    vCodResp: real;
    vRepetido : boolean;
begin
   qrlTitulo.Caption:='Recebidos';

   vWhere:='';

   tabAuxRecebidos.EmptyDataSet;
   tabAuxBancosResp.EmptyDataSet;
   tabAuxResEmpresa.EmptyDataSet;
   tabAuxEmpBanco.EmptyDataSet;
   tabAuxBancos.EmptyDataSet;

   tabBase.Close;
   tabBase.SQL.Clear;
   tabBase.SQL.Add('SELECT');
   tabBase.SQL.Add('titulos_receber.DataEmissao,');
   tabBase.SQL.Add('titulos_receber.Documento,');
   tabBase.SQL.Add('titulos_receber.NotaFiscal,');
   tabBase.SQL.Add('titulos_receber.ValorTotal,');
   tabBase.SQL.Add('titulos_receber.Parcela,');
   tabBase.SQL.Add('titulos_receber.CodigoConta,');
   tabBase.SQL.Add('titulos_receber.CodigoEmpresa,');
   tabBase.SQL.Add('titulos_receber.CodigoResponsavel,');
   tabBase.SQL.Add('titulos_receber.CodigoCentroCusto,');
   tabBase.SQL.Add('titulos_receber.CodigoLocalizacao,');
   tabBase.SQL.Add('titulos_receber.ValorDesconto,');
   tabBase.SQL.Add('titulos_receber.ValorAcrescimo,');
   tabBase.SQL.Add('titulos_receber.ValorImposto,');   
   tabBase.SQL.Add('titulos_receber.PedidoVenda,');
   tabBase.SQL.Add('titulos_receber.DataVencimento,');
   tabBase.SQL.Add('titulos_receber.DataPagamento,');
   tabBase.SQL.Add('clientes.NomeFantasia,');
   tabBase.SQL.Add('titulos_receber_liquidacoes.Titulo,'); 
   tabBase.SQL.Add('titulos_receber_liquidacoes.ValorLiquida,');
   tabBase.SQL.Add('titulos_receber_liquidacoes.DataLiquida,');
   tabBase.SQL.Add('titulos_receber_liquidacoes.TipoLiquida');
   tabBase.SQL.Add('FROM titulos_receber_liquidacoes');
   tabBase.SQL.Add('LEFT JOIN titulos_receber ON titulos_receber.Titulo = titulos_receber_liquidacoes.Titulo');
   tabBase.SQL.Add('LEFT JOIN clientes ON titulos_receber.CodigoConta = clientes.CodigoCliente');

   if Trim(edtBanco.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Banco: '+edtBanco.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'titulos_receber_liquidacoes.TipoLiquida = '+FloatToStr(edtBanco.KeyValue);
   end;
   if Trim(edtEmpresa.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Empresa: '+edtEmpresa.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'titulos_receber.CodigoEmpresa = '+FloatToStr(edtEmpresa.KeyValue);
   end;
   if (Trim(edtDataInicial.Text) <> '/  /') and (Trim(edtDataFinal.Text) <> '/  /') then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Período: '+edtDataInicial.Text+ ' a '+edtDataFinal.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'titulos_receber_liquidacoes.DataLiquida >= '+QuotedStr(FormatDateTime(sis_date_format, edtDataInicial.Date))+' AND '+
                       'titulos_receber_liquidacoes.DataLiquida <= '+QuotedStr(FormatDateTime(sis_date_format, edtDataFinal.Date));
   end;

   if Trim(vWhere) <> '' then begin
      tabBase.SQL.Add('WHERE');
      tabBase.SQL.Add(vWhere);
   end;

   tabBase.Open;

   gagProgresso.MaxValue:=tabBase.RecordCount;

   tabAuxRecebidos.IndexFieldNames:='Titulo';

   tabBase.First;
   while not tabBase.Eof do begin

      gagProgresso.Progress:=tabBase.RecNo;
      Application.ProcessMessages;

      vCodResp:=tabBase.FieldByName('CodigoResponsavel').AsFloat;

      if tabBase.FieldByName('PedidoVenda').AsInteger = 1 then begin
         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT DataEntrega,CodigoFuncionario FROM pedidos');
            tabChecagens.SQL.Add('WHERE NPedido = '+FloatToStr(tabBase.FieldByName('Documento').AsFloat));
            tabChecagens.SQL.Add('AND CodigoCliente = '+FloatToStr(tabBase.FieldByName('CodigoConta').AsFloat));
            tabChecagens.Open;
            if tabChecagens.RecordCount > 0 then begin

               vCodResp:=tabChecagens.FieldByName('CodigoFuncionario').AsFloat;

               if tabChecagens.FieldByName('DataEntrega').IsNull then begin
                  tabBase.Next;
                  Continue;
               end;
            end;
         finally
            tabChecagens.Close;
         end;
      end;

      if tabAuxRecebidos.FindKey([tabBase.FieldByName('Titulo').AsFloat]) then begin
         vRepetido:=True;
       end
      else begin
         vRepetido:=False;
      end;

      tabAuxRecebidos.Append;
      tabAuxRecebidosTitulo.Value:=tabBase.FieldByName('Titulo').AsFloat;
      tabAuxRecebidosEmissao.Value:=tabBase.FieldByName('DataEmissao').AsDateTime;
      tabAuxRecebidosDocumento.Value:=tabBase.FieldByName('Documento').AsFloat;
      tabAuxRecebidosNotaFiscal.Value:=tabBase.FieldByName('NotaFiscal').AsString;
      tabAuxRecebidosParcela.Value:=tabBase.FieldByName('Parcela').AsInteger;
      tabAuxRecebidosCodigoConta.Value:=tabBase.FieldByName('CodigoConta').asFloat;
      tabAuxRecebidosNomeFantasia.Value:=tabBase.FieldByName('NomeFantasia').AsString;
      if vRepetido = False then begin   
         tabAuxRecebidosValorTitulo.Value:=tabBase.FieldByName('ValorTotal').AsFloat;
         tabAuxRecebidosValorDesconto.Value:=tabBase.FieldByName('ValorDesconto').AsFloat;
         tabAuxRecebidosValorAcrescimo.Value:=tabBase.FieldByName('ValorAcrescimo').AsFloat + tabBase.FieldByName('ValorImposto').AsFloat;
      end; 
      tabAuxRecebidosValorRecebido.Value:=tabBase.FieldByName('ValorLiquida').AsFloat;
      tabAuxRecebidosCC.Value:=tabBase.FieldByName('CodigoCentroCusto').AsString;
      tabAuxRecebidosBanco.Value:=tabBase.FieldByName('TipoLiquida').AsFloat;
      tabAuxRecebidosEmp.Value:=tabBase.FieldByName('CodigoEmpresa').AsFloat;
      tabAuxRecebidosPedidoVenda.Value:=tabBase.FieldByName('PedidoVenda').AsInteger;
      tabAuxRecebidosData.Value:=tabBase.FieldByName('DataLiquida').AsDateTime;
      tabAuxRecebidosCodResp.Value:=vCodResp;
      tabAuxRecebidosVencto.Value:=tabBase.FieldByName('DataVencimento').AsDateTime;

      tabAuxRecebidos.Post;

      tabBase.Next;
   end;

   gagProgresso.Progress:=0;

   vValorTitulo:=0;
   vValorDesconto:=0;
   vValorAcrescimo:=0;
   vValorRecebido:=0;

   gagProgresso.MaxValue:=tabAuxRecebidos.RecordCount;

   tabAuxRecebidos.First;
   while not tabAuxRecebidos.Eof do begin

      gagProgresso.Progress:=tabAuxRecebidos.RecNo;
      Application.ProcessMessages;

      // Responsavel/Bancos
      if tabAuxBancosResp.FindKey([tabAuxRecebidosBanco.Value, tabAuxRecebidosCodResp.Value]) then begin
         tabAuxBancosResp.Edit;
         tabAuxBancosRespValorDesconto.Value:=tabAuxBancosRespValorDesconto.Value   + tabAuxRecebidosValorDesconto.Value;
         tabAuxBancosRespValorAcrescimo.Value:=tabAuxBancosRespValorAcrescimo.Value + tabAuxRecebidosValorAcrescimo.Value;
         tabAuxBancosRespValorTitulo.Value:=tabAuxBancosRespValorTitulo.Value       + tabAuxRecebidosValorTitulo.Value;
         tabAuxBancosRespValorRecebido.Value:=tabAuxBancosRespValorRecebido.Value   + tabAuxRecebidosValorRecebido.Value;
       end
      else begin
         tabAuxBancosResp.Append;
         tabAuxBancosRespCodResp.Value:=tabAuxRecebidosCodResp.Value;
         tabAuxBancosRespCodBanco.Value:=tabAuxRecebidosBanco.Value;
         tabAuxBancosRespValorDesconto.Value:=tabAuxRecebidosValorDesconto.Value;
         tabAuxBancosRespValorAcrescimo.Value:=tabAuxRecebidosValorAcrescimo.Value;
         tabAuxBancosRespValorTitulo.Value:=tabAuxRecebidosValorTitulo.Value;
         tabAuxBancosRespValorRecebido.Value:=tabAuxRecebidosValorRecebido.Value;

         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT Descricao FROM bancos WHERE Codigo = '+FloatToStr(tabAuxRecebidosBanco.Value));
            tabChecagens.Open;
            if tabChecagens.RecordCount > 0 then begin
               tabAuxBancosRespDescBanco.Value:=tabChecagens.FieldByName('Descricao').AsString;
            end;
         finally
            tabChecagens.Close;
         end;

         if tabAuxRecebidosPedidoVenda.Value = 1 then begin
            try
               tabChecagens.Close;
               tabChecagens.SQL.Clear;
               tabChecagens.SQL.Add('SELECT Nome FROM funcionarios WHERE Codigo = '+FloatToStr(tabAuxRecebidosCodResp.Value));
               tabChecagens.Open;
               if tabChecagens.RecordCount > 0 then begin
                  tabAuxBancosRespNomeResp.Value:=tabChecagens.FieldByName('Nome').AsString;
               end;
            finally
               tabChecagens.Close;
            end;
          end
         else begin
            try
               tabChecagens.Close;
               tabChecagens.SQL.Clear;
               tabChecagens.SQL.Add('SELECT Descricao FROM genericos WHERE Codigo = '+FloatToStr(tabAuxRecebidosCodResp.Value));
               tabChecagens.Open;
               if tabChecagens.RecordCount > 0 then begin
                  tabAuxBancosRespNomeResp.Value:=tabChecagens.FieldByName('Descricao').AsString;
               end;
            finally
               tabChecagens.Close;
            end;
         end;
      end;
      tabAuxBancosResp.Post;

      // Responsavel/Empresa
      if tabAuxResEmpresa.FindKey([tabAuxRecebidosEmp.Value]) then begin
         tabAuxResEmpresa.Edit;
         tabAuxResEmpresaValorDesconto.Value:=tabAuxResEmpresaValorDesconto.Value   + tabAuxRecebidosValorDesconto.Value;
         tabAuxResEmpresaValorAcrescimo.Value:=tabAuxResEmpresaValorAcrescimo.Value + tabAuxRecebidosValorAcrescimo.Value;
         tabAuxResEmpresaValorTitulo.Value:=tabAuxResEmpresaValorTitulo.Value       + tabAuxRecebidosValorTitulo.Value;
         tabAuxResEmpresaValorRecebido.Value:=tabAuxResEmpresaValorRecebido.Value + tabAuxRecebidosValorRecebido.Value;
       end
      else begin
         tabAuxResEmpresa.Append;
         tabAuxResEmpresaCodEmp.Value:=tabAuxRecebidosEmp.Value;
         tabAuxResEmpresaValorDesconto.Value:=tabAuxRecebidosValorDesconto.Value;
         tabAuxResEmpresaValorAcrescimo.Value:=tabAuxRecebidosValorAcrescimo.Value;
         tabAuxResEmpresaValorTitulo.Value:=tabAuxRecebidosValorTitulo.Value;
         tabAuxResEmpresaValorRecebido.Value:=tabAuxRecebidosValorRecebido.Value;

         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT NomeFantasia FROM empresas WHERE CodigoEmpresa = '+FloatToStr(tabAuxRecebidosEmp.Value));
            tabChecagens.Open;
            if tabChecagens.RecordCount > 0 then begin
               tabAuxResEmpresaNomeEmp.Value:=tabChecagens.FieldByName('NomeFantasia').AsString;
            end;
         finally
            tabChecagens.Close;
         end;
      end;
      tabAuxResEmpresa.Post;

      // Empresa / Banco
      if tabAuxEmpBanco.FindKey([tabAuxRecebidosEmp.Value, tabAuxRecebidosBanco.Value]) then begin
         tabAuxEmpBanco.Edit;
         tabAuxEmpBancoValorDesconto.Value:=tabAuxEmpBancoValorDesconto.Value   + tabAuxRecebidosValorDesconto.Value;
         tabAuxEmpBancoValorAcrescimo.Value:=tabAuxEmpBancoValorAcrescimo.Value + tabAuxRecebidosValorAcrescimo.Value;
         tabAuxEmpBancoValorTitulo.Value:=tabAuxEmpBancoValorTitulo.Value       + tabAuxRecebidosValorTitulo.Value;
         tabAuxEmpBancoValorRecebido.Value:=tabAuxEmpBancoValorRecebido.Value + tabAuxRecebidosValorRecebido.Value;
       end
      else begin
         tabAuxEmpBanco.Append;
         tabAuxEmpBancoCodEmp.Value:=tabAuxRecebidosEmp.Value;
         tabAuxEmpBancoCodBanco.Value:=tabAuxRecebidosBanco.Value;
         tabAuxEmpBancoValorDesconto.Value:=tabAuxRecebidosValorDesconto.Value;
         tabAuxEmpBancoValorAcrescimo.Value:=tabAuxRecebidosValorAcrescimo.Value;
         tabAuxEmpBancoValorTitulo.Value:=tabAuxRecebidosValorTitulo.Value;
         tabAuxEmpBancoValorRecebido.Value:=tabAuxRecebidosValorRecebido.Value;

         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT NomeFantasia FROM empresas WHERE CodigoEmpresa = '+FloatToStr(tabAuxRecebidosEmp.Value));
            tabChecagens.Open;
            if tabChecagens.RecordCount > 0 then begin
               tabAuxEmpBancoNomeEmp.Value:=tabChecagens.FieldByName('NomeFantasia').AsString;
            end;
         finally
            tabChecagens.Close;
         end;

         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT Descricao FROM bancos WHERE Codigo = '+FloatToStr(tabAuxRecebidosBanco.Value));
            tabChecagens.Open;
            if tabChecagens.RecordCount > 0 then begin
               tabAuxEmpBancoNomeBanco.Value:=tabChecagens.FieldByName('Descricao').AsString;
            end;
         finally
            tabChecagens.Close;
         end;
      end;
      tabAuxEmpBanco.Post;

      // Banco
      if tabAuxBancos.FindKey([tabAuxRecebidosBanco.Value]) then begin
         tabAuxBancos.Edit;
         tabAuxBancosValorDesconto.Value:=tabAuxBancosValorDesconto.Value   + tabAuxRecebidosValorDesconto.Value;
         tabAuxBancosValorAcrescimo.Value:=tabAuxBancosValorAcrescimo.Value + tabAuxRecebidosValorAcrescimo.Value;
         tabAuxBancosValorTitulo.Value:=tabAuxBancosValorTitulo.Value       + tabAuxRecebidosValorTitulo.Value;
         tabAuxBancosValorRecebido.Value:=tabAuxBancosValorRecebido.Value   + tabAuxRecebidosValorRecebido.Value;
       end
      else begin
         tabAuxBancos.Append;
         tabAuxBancosCodBanco.Value:=tabAuxRecebidosBanco.Value;
         tabAuxBancosValorDesconto.Value:=tabAuxRecebidosValorDesconto.Value;
         tabAuxBancosValorAcrescimo.Value:=tabAuxRecebidosValorAcrescimo.Value;
         tabAuxBancosValorTitulo.Value:=tabAuxRecebidosValorTitulo.Value;
         tabAuxBancosValorRecebido.Value:=tabAuxRecebidosValorRecebido.Value;

         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT Descricao FROM bancos WHERE Codigo = '+FloatToStr(tabAuxRecebidosBanco.Value));
            tabChecagens.Open;
            if tabChecagens.RecordCount > 0 then begin
               tabAuxBancosDescBanco.Value:=tabChecagens.FieldByName('Descricao').AsString;
            end;
         finally
            tabChecagens.Close;
         end;
      end;
      tabAuxBancos.Post;

      tabAuxRecebidos.Next;
   end;

   gagProgresso.Progress:=0;

   case rdgOrdemEmissao.ItemIndex of
      0: tabAuxRecebidos.IndexFieldNames:='CC;Vencto';
      1: tabAuxRecebidos.IndexFieldNames:='Vencto;CC';
      2: tabAuxRecebidos.IndexFieldNames:='Data';
      3: tabAuxRecebidos.IndexFieldNames:='NotaFiscal';
   end;

   tabAuxRecebidos.First;

   mmo1.Lines.Add(tabBase.SQL.Text);


   if Impressora = True then begin
      if pndDialogo.Execute then begin
         qrcRecebidos.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
         qrcRecebidos.Print;
      end;
    end
   else begin
      qrcRecebidos.Preview;
   end;

end;

procedure TrtReceberRecebidos.btnImprimirClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(True); 
end;

procedure TrtReceberRecebidos.FormShow(Sender: TObject);
begin
   inherited;
   tabBancos.SQL.Add('SELECT * FROM bancos ORDER BY Descricao');
   tabBancos.Open;

   tabEmpresas.SQL.Add('SELECT * FROM empresas ORDER BY NomeFantasia');
   tabEmpresas.Open;

   tabAuxRecebidos.CreateDataSet;
   tabAuxRecebidos.EmptyDataSet;

   tabAuxBancosResp.CreateDataSet;
   tabAuxBancosResp.EmptyDataSet;
   tabAuxBancosResp.IndexFieldNames:='CodBanco;CodResp';

   tabAuxResEmpresa.CreateDataSet;
   tabAuxResEmpresa.EmptyDataSet;
   tabAuxResEmpresa.IndexFieldNames:='CodEmp';

   tabAuxEmpBanco.CreateDataSet;
   tabAuxEmpBanco.EmptyDataSet;
   tabAuxEmpBanco.IndexFieldNames:='CodEmp;CodBanco';

   tabAuxBancos.CreateDataSet;
   tabAuxBancos.EmptyDataSet;
   tabAuxBancos.IndexFieldNames:='CodBanco';

   edtDataInicial.Date:=StartOfTheMonth(Date);
   edtDataFinal.Date:=EndOfTheMonth(Date);
end;

procedure TrtReceberRecebidos.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   inherited;
   vValorTitulo:=vValorTitulo       + tabAuxRecebidosValorTitulo.Value;
   vValorDesconto:=vValorDesconto   + tabAuxRecebidosValorDesconto.Value;
   vValorAcrescimo:=vValorAcrescimo + tabAuxRecebidosValorAcrescimo.Value;
   vValorRecebido:=vValorRecebido   + tabAuxRecebidosValorRecebido.Value;

   qrlTotalReceberEmitidos.Caption:='Valor Titulo: '    +FormatFloat(sis_curr_format, vValorTitulo)    +
                                 ' - Valor Desconto: '  +FormatFloat(sis_curr_format, vValorDesconto)  +
                                 ' - Valor Acréscimo: ' +FormatFloat(sis_curr_format, vValorAcrescimo) +
                                 ' - Valor Recebido: '  +FormatFloat(sis_curr_format, vValorRecebido);
end;

procedure TrtReceberRecebidos.qrcRecebidosAddReports(Sender: TObject);
begin
   inherited;
   qrcRecebidos.Reports.Add(qrpReceberRecebidos);
   qrcRecebidos.Reports.Add(qrpResBancoResp);
   qrcRecebidos.Reports.Add(qrpResEmpresa);
   qrcRecebidos.Reports.Add(qrpResEmpBanco);
   qrcRecebidos.Reports.Add(qrpResBanco);
end;

procedure TrtReceberRecebidos.qrcRecebidosFinished(Sender: TObject);
begin
   inherited;
   vValorTitulo:=0;
   vValorDesconto:=0;
   vValorAcrescimo:=0;
   vValorRecebido:=0;
end;

procedure TrtReceberRecebidos.QRSubDetail2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   inherited;
   vValorTitulo:=vValorTitulo + tabAuxEmpBancoValorTitulo.Value;
   vValorDesconto:=vValorDesconto + tabAuxEmpBancoValorDesconto.Value;
   vValorAcrescimo:=vValorAcrescimo + tabAuxEmpBancoValorAcrescimo.Value;
   vValorRecebido:=vValorRecebido + tabAuxEmpBancoValorRecebido.Value;

   qrlTotalEmpBanco.Caption:='Valor Titulo: '    +FormatFloat(sis_curr_format, vValorTitulo)    +
                                 ' - Valor Desconto: '  +FormatFloat(sis_curr_format, vValorDesconto)  +
                                 ' - Valor Acréscimo: ' +FormatFloat(sis_curr_format, vValorAcrescimo) +
                                 ' - Valor Recebido: '  +FormatFloat(sis_curr_format, vValorRecebido);
end;

procedure TrtReceberRecebidos.QRSubDetail4BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   inherited;
   vValorTitulo:=vValorTitulo + tabAuxResEmpresaValorTitulo.Value;
   vValorDesconto:=vValorDesconto + tabAuxResEmpresaValorDesconto.Value;
   vValorAcrescimo:=vValorAcrescimo + tabAuxResEmpresaValorAcrescimo.Value;
   vValorRecebido:=vValorRecebido + tabAuxResEmpresaValorRecebido.Value;

   qrlTotalEmpresa.Caption:='Valor Titulo: '    +FormatFloat(sis_curr_format, vValorTitulo)    +
                                 ' - Valor Desconto: '  +FormatFloat(sis_curr_format, vValorDesconto)  +
                                 ' - Valor Acréscimo: ' +FormatFloat(sis_curr_format, vValorAcrescimo) +
                                 ' - Valor Recebido: '  +FormatFloat(sis_curr_format, vValorRecebido);
end;

procedure TrtReceberRecebidos.QRSubDetail5BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   inherited;
   vValorTitulo:=vValorTitulo + tabAuxBancosRespValorTitulo.Value;
   vValorDesconto:=vValorDesconto + tabAuxBancosRespValorDesconto.Value;
   vValorAcrescimo:=vValorAcrescimo + tabAuxBancosRespValorAcrescimo.Value;
   vValorRecebido:=vValorRecebido + tabAuxBancosRespValorRecebido.Value;

   qrlTotalRespBanco.Caption:='Valor Titulo: '          +FormatFloat(sis_curr_format, vValorTitulo)    +
                                 ' - Valor Desconto: '  +FormatFloat(sis_curr_format, vValorDesconto)  +
                                 ' - Valor Acréscimo: ' +FormatFloat(sis_curr_format, vValorAcrescimo) +
                                 ' - Valor Recebido: '  +FormatFloat(sis_curr_format, vValorRecebido);
end;

procedure TrtReceberRecebidos.edtCodigoBancoChange(Sender: TObject);
begin
  inherited;
   if Trim(edtCodigoBanco.Text) <> '' then begin
      edtBanco.KeyValue:=StrToFloat(edtCodigoBanco.Text);
   end;
end;

procedure TrtReceberRecebidos.edtBancoCloseUp(Sender: TObject);
begin
  inherited;
   if Trim(edtBanco.Text) <> '' then begin
      edtCodigoBanco.Text:=String(edtBanco.KeyValue);
   end;
end;

procedure TrtReceberRecebidos.edtCodigoEmpresaChange(Sender: TObject);
begin
  inherited;
   if Trim(edtCodigoEmpresa.Text) <> '' then begin
      edtEmpresa.KeyValue:=StrToFloat(edtCodigoEmpresa.Text);
   end;
end;

procedure TrtReceberRecebidos.edtEmpresaCloseUp(Sender: TObject);
begin
  inherited;
   if Trim(edtEmpresa.Text) <> '' then begin
      edtCodigoEmpresa.Text:=String(edtEmpresa.KeyValue);
   end;
end;

procedure TrtReceberRecebidos.qrpReceberRecebidosBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   inherited;
   vValorTitulo:=0;
   vValorDesconto:=0;
   vValorAcrescimo:=0;
   vValorRecebido:=0;
end;

procedure TrtReceberRecebidos.qrpResEmpBancoBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   inherited;
   vValorTitulo:=0;
   vValorDesconto:=0;
   vValorAcrescimo:=0;
   vValorRecebido:=0;
end;

procedure TrtReceberRecebidos.qrpResEmpresaBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   inherited;
   vValorTitulo:=0;
   vValorDesconto:=0;
   vValorAcrescimo:=0;
   vValorRecebido:=0;
end;

procedure TrtReceberRecebidos.qrpResBancoRespBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   inherited;
   vValorTitulo:=0;
   vValorDesconto:=0;
   vValorAcrescimo:=0;
   vValorRecebido:=0;
end;

procedure TrtReceberRecebidos.qrpResBancoBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   inherited;
   vValorTitulo:=0;
   vValorDesconto:=0;
   vValorAcrescimo:=0;
   vValorRecebido:=0;
end;

procedure TrtReceberRecebidos.QRSubDetail3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   inherited;
   vValorTitulo:=vValorTitulo + tabAuxBancosValorTitulo.Value;
   vValorDesconto:=vValorDesconto + tabAuxBancosValorDesconto.Value;
   vValorAcrescimo:=vValorAcrescimo + tabAuxBancosValorAcrescimo.Value;
   vValorRecebido:=vValorRecebido + tabAuxBancosValorRecebido.Value;

   qrlTotalBanco.Caption:='Valor Titulo: '          +FormatFloat(sis_curr_format, vValorTitulo)    +
                                 ' - Valor Desconto: '  +FormatFloat(sis_curr_format, vValorDesconto)  +
                                 ' - Valor Acréscimo: ' +FormatFloat(sis_curr_format, vValorAcrescimo) +
                                 ' - Valor Recebido: '  +FormatFloat(sis_curr_format, vValorRecebido);
end;

end.

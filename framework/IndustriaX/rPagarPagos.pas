unit rPagarPagos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls, ToolEdit, Gauges;

type
  TrtPagarPagos = class(TfmFormBaseRelatorio)
    tabBase: TZQuery;
    pndDialogo: TPrintDialog;
    qrpPagarPagos: TQuickRep;
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
    gagProgresso: TGauge;
    tabAuxPagos: TClientDataSet;
    tabAuxPagosEmissao: TDateField;
    tabAuxPagosDocumento: TFloatField;
    tabAuxPagosNotaFiscal: TStringField;
    tabAuxPagosParcela: TIntegerField;
    tabAuxPagosData: TDateField;
    tabAuxPagosCodigoConta: TFloatField;
    tabAuxPagosNomeFantasia: TStringField;
    tabAuxPagosValorTitulo: TCurrencyField;
    tabAuxPagosValorDesconto: TCurrencyField;
    tabAuxPagosValorAcrescimo: TCurrencyField;
    tabAuxPagosCC: TStringField;
    tabAuxPagosEmp: TFloatField;
    tabAuxPagosPedidoVenda: TIntegerField;
    tabAuxPagosBanco: TFloatField;
    tabAuxPagosVencto: TDateField;
    tabAuxPagosCodResp: TFloatField;
    tabFornecedor: TZQuery;
    tabFuncionario: TZQuery;
    tabTransportadoras: TZQuery;
    tabBancosRel: TZQuery;
    dtsBase: TDataSource;
    qrpResCC: TQuickRep;
    QRSubDetail2: TQRSubDetail;
    QRDBText13: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRBand5: TQRBand;
    QRBand6: TQRBand;
    QRLabel30: TQRLabel;
    QRSysData3: TQRSysData;
    QRShape4: TQRShape;
    QRSysData4: TQRSysData;
    tabAuxPagosFase: TIntegerField;
    tabAuxResCC: TClientDataSet;
    tabAuxResCCCodCC: TStringField;
    tabAuxResCCDescCC: TStringField;
    tabAuxResCCValorTitulo: TCurrencyField;
    tabAuxResCCValorDesconto: TCurrencyField;
    tabAuxResCCValorAcrescimo: TCurrencyField;
    qrpResBanco: TQuickRep;
    QRSubDetail3: TQRSubDetail;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText26: TQRDBText;
    QRBand8: TQRBand;
    QRBand9: TQRBand;
    QRLabel27: TQRLabel;
    QRSysData5: TQRSysData;
    QRShape6: TQRShape;
    QRSysData6: TQRSysData;
    tabAuxResBanco: TClientDataSet;
    tabAuxResBancoValorTitulo: TCurrencyField;
    tabAuxResBancoValorDesconto: TCurrencyField;
    tabAuxResBancoValorAcrescimo: TCurrencyField;
    tabAuxResBancoCodBanco: TFloatField;
    tabAuxResBancoNomeBanco: TStringField;
    qrpResBancoEmp: TQuickRep;
    QRSubDetail4: TQRSubDetail;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRBand11: TQRBand;
    QRBand12: TQRBand;
    QRLabel35: TQRLabel;
    QRSysData7: TQRSysData;
    QRShape8: TQRShape;
    QRSysData8: TQRSysData;
    tabAuxResBancoEmp: TClientDataSet;
    tabAuxResBancoEmpValorTitulo: TCurrencyField;
    tabAuxResBancoEmpValorDesconto: TCurrencyField;
    tabAuxResBancoEmpValorAcrescimo: TCurrencyField;
    tabAuxResBancoEmpCodBanco: TFloatField;
    tabAuxResBancoEmpNomeBanco: TStringField;
    tabAuxResBancoEmpCodEmp: TFloatField;
    tabAuxResBancoEmpNomeEmp: TStringField;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    qrpResCCEmp: TQuickRep;
    QRSubDetail5: TQRSubDetail;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRBand14: TQRBand;
    QRBand15: TQRBand;
    QRLabel44: TQRLabel;
    QRSysData9: TQRSysData;
    QRShape10: TQRShape;
    QRSysData10: TQRSysData;
    tabAuxResCCEmp: TClientDataSet;
    tabAuxResCCEmpValorTitulo: TCurrencyField;
    tabAuxResCCEmpValorDesconto: TCurrencyField;
    tabAuxResCCEmpValorAcrescimo: TCurrencyField;
    tabAuxResCCEmpCodEmp: TFloatField;
    tabAuxResCCEmpNomeEmp: TStringField;
    tabAuxResCCEmpCodCC: TStringField;
    tabAuxResCCEmpDescCC: TStringField;
    SummaryBand1: TQRBand;
    qrlTotalPagarEmitidos: TQRLabel;
    tabAuxResCCValorPago: TCurrencyField;
    qrcPagos: TQRCompositeReport;
    tabAuxPagosValorPago: TCurrencyField;
    tabAuxResBancoValorPago: TCurrencyField;
    tabAuxResBancoEmpValorPago: TCurrencyField;
    tabAuxResCCEmpValorPago: TCurrencyField;
    SummaryBand2: TQRBand;
    qrlTotalCC: TQRLabel;
    SummaryBand3: TQRBand;
    qrlTotalBanco: TQRLabel;
    SummaryBand4: TQRBand;
    qrlTotalBancoEmp: TQRLabel;
    SummaryBand5: TQRBand;
    qrlTotalCCEmp: TQRLabel;
    QRShape3: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape5: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape7: TQRShape;
    QRLabel29: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRShape9: TQRShape;
    QRLabel38: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    edtCodigoBanco: TEdit;
    edtCodigoEmpresa: TEdit;
    tabAuxPagosTitulo: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure dtsBaseDataChange(Sender: TObject; Field: TField);
    procedure QRSubDetail2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrcPagosAddReports(Sender: TObject);
    procedure qrcPagosFinished(Sender: TObject);
    procedure edtCodigoBancoChange(Sender: TObject);
    procedure edtBancoCloseUp(Sender: TObject);
    procedure edtCodigoEmpresaChange(Sender: TObject);
    procedure edtEmpresaCloseUp(Sender: TObject);
    procedure qrpPagarPagosBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrpResCCBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrpResBancoBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrpResBancoEmpBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrpResCCEmpBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    procedure GerarImpressao(Impressora: Boolean = False);
  public
  end;

var vValorTitulo,
    vValorDesconto,
    vValorAcrescimo,
    vValorPago : real;  

implementation

uses uFormBase, uMenu, uFuncoes, uConstantes, DateUtils;

{$R *.dfm}

procedure TrtPagarPagos.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TrtPagarPagos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabBancos.Close;
   tabEmpresas.Close;
   tabBase.Close;
   tabAuxPagos.Close;
   tabFornecedor.Close;
   tabFuncionario.Close;
   tabTransportadoras.Close;
   tabBancosRel.Close;
   tabAuxResCC.Close;
   tabAuxResBanco.Close;
   tabAuxResBancoEmp.Close;
   tabAuxResCCEmp.Close;
   inherited;
end;

procedure TrtPagarPagos.btnVisualizarClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(); 
end;

procedure TrtPagarPagos.GerarImpressao(Impressora: Boolean = False);
var vWhere : string;
    vRepetido : boolean;
begin
   if (Trim(edtDataInicial.Text) = '/  /') or (Trim(edtDataFinal.Text) = '/  /') then begin
      ShowMessage('Obrigatório Preenchimento do Período de Datas');
      edtDataInicial.SetFocus;
      exit;
   end;

   qrlTitulo.Caption:='Pagos';

   vWhere:='';

   tabAuxPagos.EmptyDataSet;
   tabAuxResCC.EmptyDataSet;
   tabAuxResBanco.EmptyDataSet;
   tabAuxResBancoEmp.EmptyDataSet;
   tabAuxResCCEmp.EmptyDataSet;

   tabBase.Close;
   tabBase.SQL.Clear;
   tabBase.SQL.Add('SELECT');
   tabBase.SQL.Add('titulos_pagar.DataEmissao,');
   tabBase.SQL.Add('titulos_pagar.Documento,');
   tabBase.SQL.Add('titulos_pagar.NotaFiscal,');
   tabBase.SQL.Add('titulos_pagar.Parcela,');
   tabBase.SQL.Add('titulos_pagar.CodigoConta,');
   tabBase.SQL.Add('titulos_pagar.ValorTotal,');
   tabBase.SQL.Add('titulos_pagar.TipoConta,');
   tabBase.SQL.Add('titulos_pagar.CodigoEmpresa,');
   tabBase.SQL.Add('titulos_pagar.CodigoResponsavel,');
   tabBase.SQL.Add('titulos_pagar.CodigoCentroCusto,');
   tabBase.SQL.Add('titulos_pagar.CodigoLocalizacao,');
   tabBase.SQL.Add('titulos_pagar.ValorDesconto,');
   tabBase.SQL.Add('titulos_pagar.ValorAcrescimo,');
   tabBase.SQL.Add('titulos_pagar.DataVencimento,');
   tabBase.SQL.Add('titulos_pagar_liquidacoes.Titulo,');
   tabBase.SQL.Add('titulos_pagar_liquidacoes.DataLiquida,');
   tabBase.SQL.Add('titulos_pagar_liquidacoes.TipoLiquida,');
   tabBase.SQL.Add('titulos_pagar_liquidacoes.ValorLiquida');
   tabBase.SQL.Add('FROM titulos_pagar_liquidacoes');
   tabBase.SQL.Add('LEFT JOIN titulos_pagar ON titulos_pagar_liquidacoes.Titulo = titulos_pagar.Titulo');

   if Trim(edtBanco.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'titulos_pagar_liquidacoes.TipoLiquida = '+FloatToStr(edtBanco.KeyValue);
   end;
   if Trim(edtEmpresa.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Empresa: '+edtEmpresa.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'titulos_pagar.CodigoEmpresa = '+FloatToStr(edtEmpresa.KeyValue);
   end;
   if (Trim(edtDataInicial.Text) <> '/  /') and (Trim(edtDataFinal.Text) <> '/  /') then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Período: '+edtDataInicial.Text+ ' a '+ edtDataFinal.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'titulos_pagar_liquidacoes.DataLiquida >= '+QuotedStr(FormatDateTime(sis_date_format, edtDataInicial.Date))+' AND '+
                       'titulos_pagar_liquidacoes.DataLiquida <= '+QuotedStr(FormatDateTime(sis_date_format, edtDataFinal.Date));
   end;

   if Trim(vWhere) <> '' then begin 
      tabBase.SQL.Add('WHERE');
      tabBase.SQL.Add(vWhere);
   end;

   tabBase.Open;

   gagProgresso.MaxValue:=tabBase.RecordCount;

   tabAuxPagos.IndexFieldNames:='Titulo';

   tabBase.First;
   while not tabBase.Eof do begin

      gagProgresso.Progress:=tabBase.RecNo;
      Application.ProcessMessages;

      if tabAuxPagos.FindKey([tabBase.FieldByName('Titulo').AsFloat]) then begin
         vRepetido:=True;
       end
      else begin
         vRepetido:=False;
      end;

      tabAuxPagos.Append;
      tabAuxPagosTitulo.Value:=tabBase.FieldByName('Titulo').AsFloat;
      tabAuxPagosEmissao.Value:=tabBase.FieldByName('DataEmissao').AsDateTime;
      tabAuxPagosDocumento.Value:=tabBase.FieldByName('Documento').AsFloat;
      tabAuxPagosNotaFiscal.Value:=tabBase.FieldByName('NotaFiscal').AsString;
      tabAuxPagosParcela.Value:=tabBase.FieldByName('Parcela').AsInteger;
      tabAuxPagosCodigoConta.Value:=tabBase.FieldByName('CodigoConta').asFloat;
      if vRepetido = False then begin
         tabAuxPagosValorTitulo.Value:=tabBase.FieldByName('ValorTotal').AsFloat;
         tabAuxPagosValorDesconto.Value:=tabBase.FieldByName('ValorDesconto').AsFloat;
         tabAuxPagosValorAcrescimo.Value:=tabBase.FieldByName('ValorAcrescimo').AsFloat;
      end;
      tabAuxPagosValorPago.Value:=tabBase.FieldByName('ValorLiquida').AsFloat;
      tabAuxPagosCC.Value:=tabBase.FieldByName('CodigoCentroCusto').AsString;
      tabAuxPagosBanco.Value:=tabBase.FieldByName('TipoLiquida').AsFloat;
      tabAuxPagosEmp.Value:=tabBase.FieldByName('CodigoEmpresa').AsFloat;
      tabAuxPagosData.Value:=tabBase.FieldByName('DataLiquida').AsDateTime;
      tabAuxPagosCodResp.Value:=tabBase.FieldByName('CodigoResponsavel').AsFloat;
      tabAuxPagosVencto.Value:=tabBase.FieldByName('DataVencimento').AsDateTime;

      if tabBase.FieldByName('TipoConta').AsString = '1' then begin
         // fornecedor
         tabAuxPagosNomeFantasia.Value:=tabFornecedor.FieldByName('NomeFantasia').AsString;
       end
      else if tabBase.FieldByName('TipoConta').AsString = '2' then begin
         // funcionario
         tabAuxPagosNomeFantasia.Value:=tabFuncionario.FieldByName('Nome').AsString;
       end
      else if tabBase.FieldByName('TipoConta').AsString = '3' then begin
         // transportadora
         tabAuxPagosNomeFantasia.Value:=tabTransportadoras.FieldByName('Nome').AsString;
       end
      else if tabBase.FieldByName('TipoConta').AsString = '4' then begin
         // banco
         tabAuxPagosNomeFantasia.Value:=tabBancosRel.FieldByName('Descricao').AsString;
      end;

      if tabAuxPagosEmissao.Value < edtDataInicial.Date then begin
         tabAuxPagosFase.Value:=1;
       end
      else begin
         tabAuxPagosFase.Value:=2;
      end;

      tabAuxPagos.Post;

      tabBase.Next;
   end;

   gagProgresso.Progress:=0;

   gagProgresso.MaxValue:=tabAuxPagos.RecordCount;

   tabAuxPagos.First;
   while not tabAuxPagos.Eof do begin

      gagProgresso.Progress:=tabAuxPagos.RecNo;
      Application.ProcessMessages;

      if tabAuxResCC.FindKey([tabAuxPagosCC.Value]) then begin
         tabAuxResCC.Edit;
         tabAuxResCCValorTitulo.Value:=tabAuxResCCValorTitulo.Value       + tabAuxPagosValorTitulo.Value;
         tabAuxResCCValorDesconto.Value:=tabAuxResCCValorDesconto.Value   + tabAuxPagosValorDesconto.Value;
         tabAuxResCCValorAcrescimo.Value:=tabAuxResCCValorAcrescimo.Value + tabAuxPagosValorAcrescimo.Value;
         tabAuxResCCValorPago.Value:=tabAuxResCCValorPago.Value           + tabAuxPagosValorPago.Value;
       end
      else begin
         tabAuxResCC.Append;
         tabAuxResCCCodCC.Value:=tabAuxPagosCC.Value;
         tabAuxResCCValorTitulo.Value:=tabAuxPagosValorTitulo.Value;
         tabAuxResCCValorDesconto.Value:=tabAuxPagosValorDesconto.Value;
         tabAuxResCCValorAcrescimo.Value:=tabAuxPagosValorAcrescimo.Value;
         tabAuxResCCValorPago.Value:=tabAuxPagosValorPago.Value;

         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT Descricao FROM centro_custo WHERE Codigo = '+QuotedStr(tabAuxResCCCodCC.Value));
            tabChecagens.Open;
            tabAuxResCCDescCC.Value:=tabChecagens.FieldByName('Descricao').AsString;
         finally 
            tabChecagens.Close;
         end;
      end;
      tabAuxResCC.Post;

      // --
      if tabAuxResBanco.FindKey([tabAuxPagosBanco.Value]) then begin
         tabAuxResBanco.Edit;
         tabAuxResBancoValorTitulo.Value:=tabAuxResBancoValorTitulo.Value       + tabAuxPagosValorTitulo.Value;
         tabAuxResBancoValorDesconto.Value:=tabAuxResBancoValorDesconto.Value   + tabAuxPagosValorDesconto.Value;
         tabAuxResBancoValorAcrescimo.Value:=tabAuxResBancoValorAcrescimo.Value + tabAuxPagosValorAcrescimo.Value;
         tabAuxResBancoValorPago.Value:=tabAuxResBancoValorPago.Value           + tabAuxPagosValorPago.Value;
       end
      else begin
         tabAuxResBanco.Append;
         tabAuxResBancoCodBanco.Value:=tabAuxPagosBanco.Value;
         tabAuxResBancoValorTitulo.Value:=tabAuxPagosValorTitulo.Value;
         tabAuxResBancoValorDesconto.Value:=tabAuxPagosValorDesconto.Value;
         tabAuxResBancoValorAcrescimo.Value:=tabAuxPagosValorAcrescimo.Value;
         tabAuxResBancoValorPago.Value:=tabAuxPagosValorPago.Value;

         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT Descricao FROM bancos WHERE Codigo = '+FloatToStr(tabAuxResBancoCodBanco.Value));
            tabChecagens.Open;
            tabAuxResBancoNomeBanco.Value:=tabChecagens.FieldByName('Descricao').AsString;
         finally
            tabChecagens.Close;
         end;
      end;

      tabAuxResBanco.Post;

      // ----

      if tabAuxResBancoEmp.FindKey([tabAuxPagosBanco.Value, tabAuxPagosEmp.Value]) then begin
         tabAuxResBancoEmp.Edit;
         tabAuxResBancoEmpValorTitulo.Value:=tabAuxResBancoEmpValorTitulo.Value       + tabAuxPagosValorTitulo.Value;
         tabAuxResBancoEmpValorDesconto.Value:=tabAuxResBancoEmpValorDesconto.Value   + tabAuxPagosValorDesconto.Value;
         tabAuxResBancoEmpValorAcrescimo.Value:=tabAuxResBancoEmpValorAcrescimo.Value + tabAuxPagosValorAcrescimo.Value;
         tabAuxResBancoEmpValorPago.Value:=tabAuxResBancoEmpValorPago.Value + tabAuxPagosValorPago.Value;
       end
      else begin
         tabAuxResBancoEmp.Append;
         tabAuxResBancoEmpCodBanco.Value:=tabAuxPagosBanco.Value;
         tabAuxResBancoEmpCodEmp.Value:=tabAuxPagosEmp.Value;
         tabAuxResBancoEmpValorTitulo.Value:=tabAuxPagosValorTitulo.Value;
         tabAuxResBancoEmpValorDesconto.Value:=tabAuxPagosValorDesconto.Value;
         tabAuxResBancoEmpValorAcrescimo.Value:=tabAuxPagosValorAcrescimo.Value;
         tabAuxResBancoEmpValorPago.Value:=tabAuxPagosValorPago.Value;

         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT Descricao FROM bancos WHERE Codigo = '+FloatToStr(tabAuxResBancoEmpCodBanco.Value));
            tabChecagens.Open;
            tabAuxResBancoEmpNomeBanco.Value:=tabChecagens.FieldByName('Descricao').AsString;
         finally
            tabChecagens.Close;
         end;

         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT NomeFantasia FROM empresas WHERE CodigoEmpresa = '+FloatToStr(tabAuxResBancoEmpCodEmp.Value));
            tabChecagens.Open;
            tabAuxResBancoEmpNomeEmp.Value:=tabChecagens.FieldByName('NomeFantasia').AsString;
         finally
            tabChecagens.Close;
         end;            

      end;
      tabAuxResBancoEmp.Post;

      // ---

      if tabAuxResCCEmp.FindKey([tabAuxPagosCC.Value, tabAuxPagosEmp.Value]) then begin
         tabAuxResCCEmp.Edit;
         tabAuxResCCEmpValorTitulo.Value:=tabAuxResCCEmpValorTitulo.Value       + tabAuxPagosValorTitulo.Value;
         tabAuxResCCEmpValorDesconto.Value:=tabAuxResCCEmpValorDesconto.Value   + tabAuxPagosValorDesconto.Value;
         tabAuxResCCEmpValorAcrescimo.Value:=tabAuxResCCEmpValorAcrescimo.Value + tabAuxPagosValorAcrescimo.Value;
         tabAuxResCCEmpValorPago.Value:=tabAuxResCCEmpValorPago.Value + tabAuxPagosValorPago.Value;
       end
      else begin
         tabAuxResCCEmp.Append;
         tabAuxResCCEmpCodCC.Value:=tabAuxPagosCC.Value;
         tabAuxResCCEmpCodEmp.Value:=tabAuxPagosEmp.Value;
         tabAuxResCCEmpValorTitulo.Value:=tabAuxPagosValorTitulo.Value;
         tabAuxResCCEmpValorDesconto.Value:=tabAuxPagosValorDesconto.Value;
         tabAuxResCCEmpValorAcrescimo.Value:=tabAuxPagosValorAcrescimo.Value;
         tabAuxResCCEmpValorPago.Value:=tabAuxPagosValorPago.Value;

         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT Descricao FROM centro_custo WHERE Codigo = '+QuotedStr(tabAuxResCCEmpCodCC.Value));
            tabChecagens.Open;
            tabAuxResCCEmpDescCC.Value:=tabChecagens.FieldByName('Descricao').AsString;
         finally
            tabChecagens.Close;
         end;

         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT NomeFantasia FROM empresas WHERE CodigoEmpresa = '+FloatToStr(tabAuxResCCEmpCodEmp.Value));
            tabChecagens.Open;
            tabAuxResCCEmpNomeEmp.Value:=tabChecagens.FieldByName('NomeFantasia').AsString;
         finally
            tabChecagens.Close;
         end;            

      end;
      tabAuxResCCEmp.Post;

      tabAuxPagos.Next;
   end;

   gagProgresso.Progress:=0;

   vValorTitulo:=0;
   vValorDesconto:=0;
   vValorAcrescimo:=0;
   vValorPago:=0;

   case rdgOrdemEmissao.ItemIndex of
      0: tabAuxPagos.IndexFieldNames:='Fase;CC;Vencto';
      1: tabAuxPagos.IndexFieldNames:='Fase;Vencto;CC';
   end;

   if Impressora = True then begin
      if pndDialogo.Execute then begin
         qrcPagos.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
         qrcPagos.Print;
      end;
    end
   else begin
      qrcPagos.Preview;
   end;  
end;

procedure TrtPagarPagos.btnImprimirClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(True); 
end;

procedure TrtPagarPagos.FormShow(Sender: TObject);
begin
   inherited;
   tabBancos.SQL.Add('SELECT * FROM bancos ORDER BY Descricao');
   tabBancos.Open;

   tabEmpresas.SQL.Add('SELECT * FROM empresas ORDER BY NomeFantasia');
   tabEmpresas.Open;

   tabFornecedor.Params.CreateParam(ftFloat, 'CodigoFornecedor', ptUnknown);
   tabFornecedor.SQL.Add('SELECT CodigoFornecedor,NomeFantasia FROM fornecedores WHERE CodigoFornecedor = :CodigoFornecedor');
   tabFornecedor.Open;

   tabFuncionario.Params.CreateParam(ftFloat, 'CodigoFuncionario', ptUnknown);
   tabFuncionario.SQL.Add('SELECT Codigo,Nome FROM funcionarios WHERE Codigo = :CodigoFuncionario');
   tabFuncionario.Open;

   tabTransportadoras.Params.CreateParam(ftFloat, 'CodigoTransportadora', ptUnknown);
   tabTransportadoras.SQL.Add('SELECT Codigo,Nome FROM transportadoras WHERE Codigo = :CodigoTransportadora');
   tabTransportadoras.Open;

   tabBancosRel.Params.CreateParam(ftFloat, 'CodigoBanco', ptUnknown);
   tabBancosRel.SQL.Add('SELECT Codigo,Descricao FROM bancos WHERE Codigo = :CodigoBanco');
   tabBancosRel.Open;

   tabAuxPagos.CreateDataSet;
   tabAuxPagos.EmptyDataSet;

   tabAuxResCC.CreateDataSet;
   tabAuxResCC.EmptyDataSet;
   tabAuxResCC.IndexFieldNames:='CodCC';

   tabAuxResBanco.CreateDataSet;
   tabAuxResBanco.EmptyDataSet;
   tabAuxResBanco.IndexFieldNames:='CodBanco';

   tabAuxResBancoEmp.CreateDataSet;
   tabAuxResBancoEmp.EmptyDataSet;
   tabAuxResBancoEmp.IndexFieldNames:='CodBanco;CodEmp';

   tabAuxResCCEmp.CreateDataSet;
   tabAuxResCCEmp.EmptyDataSet;
   tabAuxResCCEmp.IndexFieldNames:='CodCC;CodEmp';

   edtDataInicial.Date:=StartOfTheMonth(Date);
   edtDataFinal.Date:=EndOfTheMonth(Date);
end;

procedure TrtPagarPagos.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   inherited;
   vValorTitulo:=vValorTitulo       + tabAuxPagosValorTitulo.Value;
   vValorDesconto:=vValorDesconto   + tabAuxPagosValorDesconto.Value;
   vValorAcrescimo:=vValorAcrescimo + tabAuxPagosValorAcrescimo.Value;
   vValorPago:=vValorPago         + tabAuxPagosValorPago.Value;
   qrlTotalPagarEmitidos.Caption:='Valor Titulo: '+FormatFloat(sis_curr_format, vValorTitulo)+
                                 ' - Valor Desconto: '+FormatFloat(sis_curr_format, vValorDesconto)+
                                 ' - Valor Acréscimo: '+FormatFloat(sis_curr_format, vValorAcrescimo)+
                                 ' - Valor Pago: '+FormatFloat(sis_curr_format, vValorPago);
end;

procedure TrtPagarPagos.dtsBaseDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if tabBase.FieldByName('TipoConta').AsString = '1' then begin
      // fornecedor
      tabFornecedor.Close;
      tabFornecedor.ParamByName('CodigoFornecedor').AsFloat:=tabBase.FieldByName('CodigoConta').AsFloat;
      tabFornecedor.Open;
    end
   else if tabBase.FieldByName('TipoConta').AsString = '2' then begin
      // funcionario
      tabFuncionario.Close;
      tabFuncionario.ParamByName('CodigoFuncionario').AsFloat:=tabBase.FieldByName('CodigoConta').AsFloat;
      tabFuncionario.Open;
    end
   else if tabBase.FieldByName('TipoConta').AsString = '3' then begin
      // transportadora
      tabTransportadoras.Close;
      tabTransportadoras.ParamByName('CodigoTransportadora').AsFloat:=tabBase.FieldByName('CodigoConta').AsFloat;
      tabTransportadoras.Open;
    end
   else if tabBase.FieldByName('TipoConta').AsString = '4' then begin
      // banco
      tabBancosRel.Close;
      tabBancosRel.ParamByName('CodigoBanco').AsFloat:=tabBase.FieldByName('CodigoConta').AsFloat;
      tabBancosRel.Open;
   end;
end;

procedure TrtPagarPagos.QRSubDetail2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   inherited;
   vValorTitulo:=vValorTitulo       + tabAuxResCCValorTitulo.Value;
   vValorDesconto:=vValorDesconto   + tabAuxResCCValorDesconto.Value;
   vValorAcrescimo:=vValorAcrescimo + tabAuxResCCValorAcrescimo.Value;
   vValorPago:=vValorPago           + tabAuxResCCValorPago.Value;
   qrlTotalCC.Caption:='Valor Titulo: '+FormatFloat(sis_curr_format, vValorTitulo)+
                                 ' - Valor Desconto: '+FormatFloat(sis_curr_format, vValorDesconto)+
                                 ' - Valor Acréscimo: '+FormatFloat(sis_curr_format, vValorAcrescimo)+
                                 ' - Valor Pago: '+FormatFloat(sis_curr_format, vValorPago);

end;

procedure TrtPagarPagos.QRSubDetail3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   inherited;
   vValorTitulo:=vValorTitulo       + tabAuxResBancoValorTitulo.Value;
   vValorDesconto:=vValorDesconto   + tabAuxResBancoValorDesconto.Value;
   vValorAcrescimo:=vValorAcrescimo + tabAuxResBancoValorAcrescimo.Value;
   vValorPago:=vValorPago           + tabAuxResBancoValorPago.Value;
   qrlTotalBanco.Caption:='Valor Titulo: '+FormatFloat(sis_curr_format, vValorTitulo)+
                                 ' - Valor Desconto: '+FormatFloat(sis_curr_format, vValorDesconto)+
                                 ' - Valor Acréscimo: '+FormatFloat(sis_curr_format, vValorAcrescimo)+
                                 ' - Valor Pago: '+FormatFloat(sis_curr_format, vValorPago);


end;

procedure TrtPagarPagos.QRSubDetail4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   inherited;
   vValorTitulo:=vValorTitulo       + tabAuxResBancoEmpValorTitulo.Value;
   vValorDesconto:=vValorDesconto   + tabAuxResBancoEmpValorDesconto.Value;
   vValorAcrescimo:=vValorAcrescimo + tabAuxResBancoEmpValorAcrescimo.Value;
   vValorPago:=vValorPago           + tabAuxResBancoEmpValorPago.Value;
   qrlTotalBancoEmp.Caption:='Valor Titulo: '+FormatFloat(sis_curr_format, vValorTitulo)+
                                 ' - Valor Desconto: '+FormatFloat(sis_curr_format, vValorDesconto)+
                                 ' - Valor Acréscimo: '+FormatFloat(sis_curr_format, vValorAcrescimo)+
                                 ' - Valor Pago: '+FormatFloat(sis_curr_format, vValorPago);
end;

procedure TrtPagarPagos.QRSubDetail5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   inherited;
   vValorTitulo:=vValorTitulo       + tabAuxResCCEmpValorTitulo.Value;
   vValorDesconto:=vValorDesconto   + tabAuxResCCEmpValorDesconto.Value;
   vValorAcrescimo:=vValorAcrescimo + tabAuxResCCEmpValorAcrescimo.Value;
   vValorPago:=vValorPago          + tabAuxResCCEmpValorPago.Value;
   qrlTotalCCEmp.Caption:='Valor Titulo: '+FormatFloat(sis_curr_format, vValorTitulo)+
                                 ' - Valor Desconto: '+FormatFloat(sis_curr_format, vValorDesconto)+
                                 ' - Valor Acréscimo: '+FormatFloat(sis_curr_format, vValorAcrescimo)+
                                 ' - Valor Pago: '+FormatFloat(sis_curr_format, vValorPago);

end;

procedure TrtPagarPagos.qrcPagosAddReports(Sender: TObject);
begin
   inherited;
   qrcPagos.Reports.Add(qrpPagarPagos);
   qrcPagos.Reports.Add(qrpResCC);
   qrcPagos.Reports.Add(qrpResBanco);
   qrcPagos.Reports.Add(qrpResBancoEmp);
   qrcPagos.Reports.Add(qrpResCCEmp);
end;

procedure TrtPagarPagos.qrcPagosFinished(Sender: TObject);
begin
   inherited;
   vValorTitulo:=0;
   vValorDesconto:=0;
   vValorAcrescimo:=0;
   vValorPago:=0;
end;

procedure TrtPagarPagos.edtCodigoBancoChange(Sender: TObject);
begin
   inherited;
   if Trim(edtCodigoBanco.Text) <> '' then begin
      edtBanco.KeyValue:=StrToFloat(edtCodigoBanco.Text);
   end;
end;

procedure TrtPagarPagos.edtBancoCloseUp(Sender: TObject);
begin
   inherited;
   if Trim(edtBanco.Text) <> '' then begin
      edtCodigoBanco.Text:=String(edtBanco.KeyValue);
   end;
end;

procedure TrtPagarPagos.edtCodigoEmpresaChange(Sender: TObject);
begin
   inherited;
   if Trim(edtCodigoEmpresa.Text) <> '' then begin
      edtEmpresa.KeyValue:=StrToFloat(edtCodigoEmpresa.Text);
   end;
end;

procedure TrtPagarPagos.edtEmpresaCloseUp(Sender: TObject);
begin
   inherited;
   if Trim(edtEmpresa.Text) <> '' then begin
      edtCodigoEmpresa.Text:=String(edtEmpresa.KeyValue);
   end;
end;

procedure TrtPagarPagos.qrpPagarPagosBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   inherited;
   vValorTitulo:=0;
   vValorDesconto:=0;
   vValorAcrescimo:=0;
   vValorPago:=0;
end;

procedure TrtPagarPagos.qrpResCCBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   inherited;
   vValorTitulo:=0;
   vValorDesconto:=0;
   vValorAcrescimo:=0;
   vValorPago:=0;
end;

procedure TrtPagarPagos.qrpResBancoBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   inherited;
   vValorTitulo:=0;
   vValorDesconto:=0;
   vValorAcrescimo:=0;
   vValorPago:=0;
end;

procedure TrtPagarPagos.qrpResBancoEmpBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   inherited;
   vValorTitulo:=0;
   vValorDesconto:=0;
   vValorAcrescimo:=0;
   vValorPago:=0;
end;

procedure TrtPagarPagos.qrpResCCEmpBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   inherited;
   vValorTitulo:=0;
   vValorDesconto:=0;
   vValorAcrescimo:=0;
   vValorPago:=0;
end;

end.

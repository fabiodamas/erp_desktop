unit rReceberEmitidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls, ToolEdit, Gauges;

type
  TrtReceberEmitidos = class(TfmFormBaseRelatorio)
    tabBase: TZQuery;
    pndDialogo: TPrintDialog;
    qrpReceberEmitidos: TQuickRep;
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
    QRLabel11: TQRLabel;
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
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    qrpResCC: TQuickRep;
    QRSubDetail2: TQRSubDetail;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText23: TQRDBText;
    QRBand4: TQRBand;
    QRShape3: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel25: TQRLabel;
    QRBand6: TQRBand;
    QRLabel32: TQRLabel;
    QRSysData3: TQRSysData;
    QRShape4: TQRShape;
    QRSysData4: TQRSysData;
    gagProgresso: TGauge;
    tabAuxEmitidos: TClientDataSet;
    tabAuxEmitidosEmissao: TDateField;
    tabAuxEmitidosDocumento: TFloatField;
    tabAuxEmitidosNotaFiscal: TStringField;
    tabAuxEmitidosParcela: TIntegerField;
    tabAuxEmitidosData: TDateField;
    tabAuxEmitidosCodigoConta: TFloatField;
    tabAuxEmitidosNomeFantasia: TStringField;
    tabAuxEmitidosValorTitulo: TCurrencyField;
    tabAuxEmitidosValorDesconto: TCurrencyField;
    tabAuxEmitidosValorAcrescimo: TCurrencyField;
    tabAuxEmitidosValorCalculado: TCurrencyField;
    tabAuxEmitidosCC: TStringField;
    tabAuxEmitidosLoc: TFloatField;
    tabAuxEmitidosEmp: TFloatField;
    tabAuxEmitidosResp: TFloatField;
    tabAuxEmitidosValorLiquidado: TCurrencyField;
    tabAuxCC: TClientDataSet;
    tabAuxCCValorTotal: TCurrencyField;
    tabAuxCCValorDesconto: TCurrencyField;
    tabAuxCCValorAcrescimo: TCurrencyField;
    tabAuxCCValorTitulo: TCurrencyField;
    tabAuxCCCodCC: TStringField;
    tabAuxCCDescCC: TStringField;
    tabAuxCCValorLiquidado: TCurrencyField;
    QRLabel18: TQRLabel;
    QRDBText20: TQRDBText;
    qrpResLocEmp: TQuickRep;
    QRSubDetail3: TQRSubDetail;
    QRDBText22: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRBand7: TQRBand;
    QRShape5: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRBand9: TQRBand;
    QRLabel30: TQRLabel;
    QRSysData5: TQRSysData;
    QRShape6: TQRShape;
    QRSysData6: TQRSysData;
    QRLabel31: TQRLabel;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    tabAuxLocEmp: TClientDataSet;
    tabAuxLocEmpCodEmp: TFloatField;
    tabAuxLocEmpNomeEmp: TStringField;
    tabAuxLocEmpCodLoc: TFloatField;
    tabAuxLocEmpDescLoc: TStringField;
    tabAuxLocEmpValorTotal: TCurrencyField;
    tabAuxLocEmpValorDesconto: TCurrencyField;
    tabAuxLocEmpValorAcrescimo: TCurrencyField;
    tabAuxLocEmpValorTitulo: TCurrencyField;
    tabAuxLocEmpValorLiquidado: TCurrencyField;
    qrpResVendedor: TQuickRep;
    QRSubDetail4: TQRSubDetail;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRBand10: TQRBand;
    QRShape7: TQRShape;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRBand12: TQRBand;
    QRLabel40: TQRLabel;
    QRSysData7: TQRSysData;
    QRShape8: TQRShape;
    QRSysData8: TQRSysData;
    tabAuxVendedor: TClientDataSet;
    tabAuxVendedorCodVend: TFloatField;
    tabAuxVendedorNomeVende: TStringField;
    tabAuxVendedorValorTotal: TCurrencyField;
    tabAuxVendedorValorDesconto: TCurrencyField;
    tabAuxVendedorValorAcrescimo: TCurrencyField;
    tabAuxVendedorValorTitulo: TCurrencyField;
    tabAuxVendedorValorLiquidado: TCurrencyField;
    tabAuxEmitidosPedidoVenda: TIntegerField;
    qrpResVendCC: TQuickRep;
    QRSubDetail5: TQRSubDetail;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRBand13: TQRBand;
    QRShape9: TQRShape;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRBand15: TQRBand;
    QRLabel48: TQRLabel;
    QRSysData9: TQRSysData;
    QRShape10: TQRShape;
    QRSysData10: TQRSysData;
    QRLabel49: TQRLabel;
    QRDBText46: TQRDBText;
    QRDBText47: TQRDBText;
    tabAuxVendCC: TClientDataSet;
    tabAuxVendCCValorTotal: TCurrencyField;
    tabAuxVendCCValorDesconto: TCurrencyField;
    tabAuxVendCCValorAcrescimo: TCurrencyField;
    tabAuxVendCCValorTitulo: TCurrencyField;
    tabAuxVendCCValorLiquidado: TCurrencyField;
    tabAuxVendCCCodVend: TFloatField;
    tabAuxVendCCNomeVende: TStringField;
    tabAuxVendCCCodCC: TStringField;
    tabAuxVendCCDescCC: TStringField;
    qrpResLocalizacao: TQuickRep;
    QRSubDetail6: TQRSubDetail;
    QRDBText48: TQRDBText;
    QRDBText49: TQRDBText;
    QRDBText50: TQRDBText;
    QRDBText51: TQRDBText;
    QRDBText52: TQRDBText;
    QRDBText53: TQRDBText;
    QRDBText54: TQRDBText;
    QRBand16: TQRBand;
    QRShape11: TQRShape;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRBand18: TQRBand;
    QRLabel57: TQRLabel;
    QRSysData11: TQRSysData;
    QRShape12: TQRShape;
    QRSysData12: TQRSysData;
    tabAuxLoc: TClientDataSet;
    tabAuxLocValorTotal: TCurrencyField;
    tabAuxLocValorDesconto: TCurrencyField;
    tabAuxLocValorAcrescimo: TCurrencyField;
    tabAuxLocValorTitulo: TCurrencyField;
    tabAuxLocValorLiquidado: TCurrencyField;
    tabAuxLocCodLoc: TFloatField;
    tabAuxLocDescLoc: TStringField;
    qrpResCCEmp: TQuickRep;
    QRSubDetail7: TQRSubDetail;
    QRDBText57: TQRDBText;
    QRDBText58: TQRDBText;
    QRDBText59: TQRDBText;
    QRDBText60: TQRDBText;
    QRDBText61: TQRDBText;
    QRDBText62: TQRDBText;
    QRDBText63: TQRDBText;
    QRBand19: TQRBand;
    QRShape13: TQRShape;
    QRLabel58: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRBand21: TQRBand;
    QRLabel66: TQRLabel;
    QRSysData13: TQRSysData;
    QRShape14: TQRShape;
    QRSysData14: TQRSysData;
    QRLabel59: TQRLabel;
    QRDBText55: TQRDBText;
    QRDBText56: TQRDBText;
    tabAuxCCEmp: TClientDataSet;
    tabAuxCCEmpValorTotal: TCurrencyField;
    tabAuxCCEmpValorDesconto: TCurrencyField;
    tabAuxCCEmpValorAcrescimo: TCurrencyField;
    tabAuxCCEmpValorTitulo: TCurrencyField;
    tabAuxCCEmpValorLiquidado: TCurrencyField;
    tabAuxCCEmpCodCC: TStringField;
    tabAuxCCEmpDescCC: TStringField;
    tabAuxCCEmpCodEmp: TFloatField;
    tabAuxCCEmpNomeEmp: TStringField;
    qrcReceberEmitidos: TQRCompositeReport;
    SummaryBand1: TQRBand;
    qrlTotalReceberEmitidos: TQRLabel;
    SummaryBand2: TQRBand;
    qrlTotalLocalizacao: TQRLabel;
    SummaryBand3: TQRBand;
    qrlTotalResVendCC: TQRLabel;
    SummaryBand4: TQRBand;
    qrlTotalCC: TQRLabel;
    SummaryBand5: TQRBand;
    qrlTotalVendedor: TQRLabel;
    SummaryBand6: TQRBand;
    qrlTotalLocEmp: TQRLabel;
    SummaryBand7: TQRBand;
    qrlTotalCCEmp: TQRLabel;
    Label5: TLabel;
    edtVendedor: TDBLookupComboBox;
    tabResponsavel: TZQuery;
    dtsResponsavel: TDataSource;
    edtCodigoVendedor: TEdit;
    Label6: TLabel;
    edtResponsavel: TDBLookupComboBox;
    edtCodigoResponsavel: TEdit;
    tabVendedor: TZQuery;
    dtsVendedor: TDataSource;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail6BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail7BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrcReceberEmitidosAddReports(Sender: TObject);
    procedure qrcReceberEmitidosFinished(Sender: TObject);
    procedure edtCodigoVendedorChange(Sender: TObject);
    procedure edtVendedorCloseUp(Sender: TObject);
    procedure edtCodigoResponsavelChange(Sender: TObject);
    procedure edtResponsavelCloseUp(Sender: TObject);
    procedure qrpResLocalizacaoBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrpResCCEmpBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrpReceberEmitidosBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrpResVendCCBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrpResCCBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrpResVendedorBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrpResLocEmpBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
     procedure GerarImpressao(Impressora: Boolean = False);
  public
  end;

var vValorTitulo, vValorDesconto, vValorAcrescimo, vValorTotal, vValorLiquidado : real;  

implementation

uses uFormBase, uMenu, uFuncoes, uConstantes, DateUtils;

{$R *.dfm}

procedure TrtReceberEmitidos.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TrtReceberEmitidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabBancos.Close;
   tabEmpresas.Close;
   tabBase.Close;
   tabAuxEmitidos.Close;
   tabAuxCC.Close;
   tabAuxLocEmp.Close;
   tabAuxVendedor.Close;
   tabAuxVendCC.Close;
   tabAuxLoc.Close;
   tabAuxCCEmp.Close;
   tabResponsavel.Close;
   tabVendedor.Close;
   inherited;
end;

procedure TrtReceberEmitidos.btnVisualizarClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(); 
end;

procedure TrtReceberEmitidos.GerarImpressao(Impressora: Boolean = False);
var vWhere : string;
    vCodigoResponsavel : real;
begin
   qrlTitulo.Caption:='Receber Emitidos';

   vWhere:='';

   tabAuxEmitidos.EmptyDataSet;
   tabAuxCC.EmptyDataSet;
   tabAuxLocEmp.EmptyDataSet;
   tabAuxVendedor.EmptyDataSet;
   tabAuxVendCC.EmptyDataSet;
   tabAuxLoc.EmptyDataSet;
   tabAuxCCEmp.EmptyDataSet;

   tabBase.Close;
   tabBase.SQL.Clear;

//   * Não consegui fazer por query, só consigo relacionar os que tem pendentes, perco os titulos que nao foram
//   liquidados nenhuma vez. (RS) 27/08/11
  
//   tabBase.SQL.Add('SELECT titulos_receber.DataEmissao, titulos_receber.Documento, titulos_receber.NotaFiscal,');
//   tabBase.SQL.Add('titulos_receber.Parcela, titulos_receber.CodigoConta, clientes.NomeFantasia, titulos_receber.ValorTotal,');
//   tabBase.SQL.Add('titulos_receber.CodigoEmpresa, titulos_receber.CodigoResponsavel, titulos_receber.CodigoCentroCusto,');
//   tabBase.SQL.Add('titulos_receber.ValorDesconto, titulos_receber.ValorAcrescimo,');
//   tabBase.SQL.Add('IF(titulos_receber.DataPagamento IS NULL, titulos_receber.DataVencimento, titulos_receber.DataPagamento) AS DataVP');
//   tabBase.SQL.Add(',');
//   tabBase.SQL.Add('IF(titulos_receber.DataPagamento IS NULL, ((titulos_receber.ValorTotal-titulos_receber.ValorDesconto)+titulos_receber.ValorAcrescimo)-SUM(titulos_receber_liquidacoes.ValorLiquida), SUM(titulos_receber_liquidacoes.ValorLiquida)) AS ValorCalculado');
//   tabBase.SQL.Add('FROM titulos_receber');
//   tabBase.SQL.Add('LEFT JOIN clientes ON titulos_receber.CodigoConta = clientes.CodigoCliente');
//   tabBase.SQL.Add('INNER JOIN titulos_receber_liquidacoes ON titulos_receber_liquidacoes.Titulo = titulos_receber.Titulo');

   tabBase.SQL.Add('SELECT titulos_receber.DataEmissao, titulos_receber.Documento, titulos_receber.NotaFiscal, titulos_receber.Triplicata, ');
   tabBase.SQL.Add('titulos_receber.Parcela, titulos_receber.CodigoConta, clientes.NomeFantasia, titulos_receber.ValorTotal,');
   tabBase.SQL.Add('titulos_receber.CodigoEmpresa, titulos_receber.CodigoResponsavel, titulos_receber.CodigoCentroCusto,');
   tabBase.SQL.Add('titulos_receber.CodigoLocalizacao, titulos_receber.ValorDesconto, titulos_receber.ValorAcrescimo, titulos_receber.ValorImposto,');
   tabBase.SQL.Add('titulos_receber.PedidoVenda, titulos_receber.DataVencimento, titulos_receber.DataPagamento,');
   if Trim(edtBanco.Text) <> '' then begin
      tabBase.SQL.Add('(SELECT SUM(titulos_receber_liquidacoes.ValorLiquida) FROM titulos_receber_liquidacoes WHERE titulos_receber_liquidacoes.Titulo = titulos_receber.Titulo AND titulos_receber_liquidacoes.TipoLiquida = '+ FloatToStr(edtBanco.KeyValue) +') AS ValorLiquidado');
    end
   else begin
      tabBase.SQL.Add('(SELECT SUM(titulos_receber_liquidacoes.ValorLiquida) FROM titulos_receber_liquidacoes WHERE titulos_receber_liquidacoes.Titulo = titulos_receber.Titulo) AS ValorLiquidado');
   end;
   tabBase.SQL.Add('FROM titulos_receber');
   tabBase.SQL.Add('LEFT JOIN clientes ON titulos_receber.CodigoConta = clientes.CodigoCliente');

   if Trim(edtBanco.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Banco: '+edtBanco.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'titulos_receber.TipoLiquida = '+FloatToStr(edtBanco.KeyValue);
   end;
   if Trim(edtEmpresa.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Empresa: '+edtEmpresa.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'titulos_receber.CodigoEmpresa = '+FloatToStr(edtEmpresa.KeyValue);
   end;
   if (Trim(edtDataInicial.Text) <> '/  /') and (Trim(edtDataFinal.Text) <> '/  /') then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Período: '+edtDataInicial.Text+ ' a '+edtDataFinal.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'titulos_receber.DataEmissao >= '+QuotedStr(FormatDateTime(sis_date_format, edtDataInicial.Date))+' AND '+
                       'titulos_receber.DataEmissao <= '+QuotedStr(FormatDateTime(sis_date_format, edtDataFinal.Date));
   end;

   if Trim(vWhere) <> '' then begin
      tabBase.SQL.Add('WHERE');
      tabBase.SQL.Add(vWhere);
   end;

   tabBase.Open;

   gagProgresso.MaxValue:=tabBase.RecordCount;

   tabBase.First;
   while not tabBase.Eof do begin  

      gagProgresso.Progress:=tabBase.RecNo;
      Application.ProcessMessages;

      vCodigoResponsavel:=tabBase.FieldByName('CodigoResponsavel').AsFloat;

      // Triplicatas.
      if tabBase.FieldByName('Triplicata').AsInteger = 1 then
      begin
        tabBase.Next; 
        Continue;
      end;

      if tabBase.FieldByName('PedidoVenda').AsInteger = 1 then begin

         if Trim(edtCodigoResponsavel.Text) <> '' then begin
            tabBase.Next;
            Continue;
         end;

         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT CodigoFuncionario,DataEntrega FROM pedidos');
            tabChecagens.SQL.Add('WHERE NPedido = '+FloatToStr(tabBase.FieldByName('Documento').AsFloat));
            tabChecagens.SQL.Add('AND CodigoCliente = '+FloatToStr(tabBase.FieldByName('CodigoConta').AsFloat));
            tabChecagens.Open;
            if tabChecagens.RecordCount > 0 then begin
               vCodigoResponsavel:=tabChecagens.FieldByName('CodigoFuncionario').AsFloat;
               if tabChecagens.FieldByName('DataEntrega').IsNull then begin
                  tabBase.Next;
                  Continue;
               end;

               if Trim(edtCodigoVendedor.Text) <> '' then begin
                  if vCodigoResponsavel <> StrToFloat(edtCodigoVendedor.Text) then begin
                     tabBase.Next;
                     Continue;
                  end;
               end;
            end;
         finally
            tabChecagens.Close;
         end;
       end
      else begin

         if Trim(edtCodigoVendedor.Text) <> '' then begin 
            tabBase.Next; 
            Continue;
         end;

         if Trim(edtCodigoResponsavel.Text) <> '' then begin
            if vCodigoResponsavel <> StrToFloat(edtCodigoResponsavel.Text) then begin
               tabBase.Next;
               Continue;
            end;
         end;
      end;

      tabAuxEmitidos.Append;
      tabAuxEmitidosEmissao.Value:=tabBase.FieldByName('DataEmissao').AsDateTime;
      tabAuxEmitidosDocumento.Value:=tabBase.FieldByName('Documento').AsFloat;
      tabAuxEmitidosNotaFiscal.Value:=tabBase.FieldByName('NotaFiscal').AsString;
      tabAuxEmitidosParcela.Value:=tabBase.FieldByName('Parcela').AsInteger;
      tabAuxEmitidosCodigoConta.Value:=tabBase.FieldByName('CodigoConta').asFloat;
      tabAuxEmitidosNomeFantasia.Value:=tabBase.FieldByName('NomeFantasia').AsString;
      tabAuxEmitidosValorTitulo.Value:=tabBase.FieldByName('ValorTotal').AsFloat;
      tabAuxEmitidosValorDesconto.Value:=tabBase.FieldByName('ValorDesconto').AsFloat;
      tabAuxEmitidosValorAcrescimo.Value:=tabBase.FieldByName('ValorAcrescimo').AsFloat + tabBase.FieldByName('ValorImposto').AsFloat;
      tabAuxEmitidosValorLiquidado.Value:=tabBase.FieldByName('ValorLiquidado').AsFloat;
      tabAuxEmitidosCC.Value:=tabBase.FieldByName('CodigoCentroCusto').AsString;
      tabAuxEmitidosLoc.Value:=tabBase.FieldByName('CodigoLocalizacao').AsFloat;
      tabAuxEmitidosEmp.Value:=tabBase.FieldByName('CodigoEmpresa').AsFloat;
      tabAuxEmitidosResp.Value:=vCodigoResponsavel;
      tabAuxEmitidosPedidoVenda.Value:=tabBase.FieldByName('PedidoVenda').AsInteger;

      if tabBase.FieldByName('DataPagamento').IsNull then begin
         tabAuxEmitidosData.Value:=tabBase.FieldByName('DataVencimento').AsDateTime;
         tabAuxEmitidosValorCalculado.Value:=((tabAuxEmitidosValorTitulo.Value-tabAuxEmitidosValorDesconto.Value)+tabAuxEmitidosValorAcrescimo.Value)-tabAuxEmitidosValorLiquidado.Value;
       end
      else begin
         tabAuxEmitidosData.Value:=tabBase.FieldByName('DataPagamento').AsDateTime;
         tabAuxEmitidosValorCalculado.Value:=tabAuxEmitidosValorLiquidado.Value;
      end;
      
      tabAuxEmitidos.Post;

      // - resumo centro custo

      if tabAuxCC.FindKey([tabAuxEmitidosCC.Value]) then begin
         tabAuxCC.Edit;
         tabAuxCCValorTotal.Value:=tabAuxCCValorTotal.Value + tabAuxEmitidosValorCalculado.Value;
         tabAuxCCValorDesconto.Value:=tabAuxCCValorDesconto.Value + tabAuxEmitidosValorDesconto.Value;
         tabAuxCCValorAcrescimo.Value:=tabAuxCCValorAcrescimo.Value + tabAuxEmitidosValorAcrescimo.Value;
         tabAuxCCValorTitulo.Value:=tabAuxCCValorTitulo.Value + tabAuxEmitidosValorTitulo.Value;
         tabAuxCCValorLiquidado.Value:=tabAuxCCValorLiquidado.Value + tabAuxEmitidosValorLiquidado.Value;
       end
      else begin
         tabAuxCC.Append;
         tabAuxCCCodCC.Value:=tabAuxEmitidosCC.Value;
         tabAuxCCValorTotal.Value:=tabAuxEmitidosValorCalculado.Value;
         tabAuxCCValorDesconto.Value:=tabAuxEmitidosValorDesconto.Value;
         tabAuxCCValorAcrescimo.Value:=tabAuxEmitidosValorAcrescimo.Value;
         tabAuxCCValorTitulo.Value:=tabAuxEmitidosValorTitulo.Value;
         tabAuxCCValorLiquidado.Value:=tabAuxEmitidosValorLiquidado.Value;

         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT Descricao FROM centro_custo WHERE Codigo = '+QuotedStr(tabAuxCCCodCC.Value));
            tabChecagens.Open;
            if tabChecagens.RecordCount > 0 then begin
               tabAuxCCDescCC.Value:=tabChecagens.FieldByName('Descricao').AsString;
            end;
         finally
            tabChecagens.Close;
         end;
      end;

      tabAuxCC.Post;

      // ----

      // -- Localização / Empresa

      if tabAuxLocEmp.FindKey([tabAuxEmitidosLoc.Value, tabAuxEmitidosEmp.Value]) then begin
         tabAuxLocEmp.Edit;
         tabAuxLocEmpValorTotal.Value:=tabAuxLocEmpValorTotal.Value         + tabAuxEmitidosValorCalculado.Value;
         tabAuxLocEmpValorDesconto.Value:=tabAuxLocEmpValorDesconto.Value   + tabAuxEmitidosValorDesconto.Value;
         tabAuxLocEmpValorAcrescimo.Value:=tabAuxLocEmpValorAcrescimo.Value + tabAuxEmitidosValorAcrescimo.Value;
         tabAuxLocEmpValorTitulo.Value:=tabAuxLocEmpValorTitulo.Value       + tabAuxEmitidosValorTitulo.Value;
         tabAuxLocEmpValorLiquidado.Value:=tabAuxLocEmpValorLiquidado.Value + tabAuxEmitidosValorLiquidado.Value;
       end
      else begin
         tabAuxLocEmp.Append;
         tabAuxLocEmpCodEmp.Value:=tabAuxEmitidosEmp.Value;
         tabAuxLocEmpCodLoc.Value:=tabAuxEmitidosLoc.Value;
         tabAuxLocEmpValorTotal.Value:=tabAuxEmitidosValorCalculado.Value;
         tabAuxLocEmpValorDesconto.Value:=tabAuxEmitidosValorDesconto.Value;
         tabAuxLocEmpValorAcrescimo.Value:=tabAuxEmitidosValorAcrescimo.Value;
         tabAuxLocEmpValorTitulo.Value:=tabAuxEmitidosValorTitulo.Value;
         tabAuxLocEmpValorLiquidado.Value:=tabAuxEmitidosValorLiquidado.Value;

         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT Descricao FROM genericos WHERE Codigo = '+FloatToStr(tabAuxLocEmpCodLoc.Value));
            tabChecagens.Open;
            if tabChecagens.RecordCount > 0 then begin
               tabAuxLocEmpDescLoc.Value:=tabChecagens.FieldByName('Descricao').AsString;
            end;
         finally
            tabChecagens.Close;
         end;

         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT NomeFantasia FROM empresas WHERE CodigoEmpresa = '+FloatToStr(tabAuxLocEmpCodEmp.Value));
            tabChecagens.Open;
            if tabChecagens.RecordCount > 0 then begin
               tabAuxLocEmpNomeEmp.Value:=tabChecagens.FieldByName('NomeFantasia').AsString;
            end;
         finally
            tabChecagens.Close;
         end;
      end;

      tabAuxLocEmp.Post;

      // --

      // - Resumo por Vendedor

      if tabAuxVendedor.FindKey([tabAuxEmitidosResp.Value]) then begin
         tabAuxVendedor.Edit;
         tabAuxVendedorValorTotal.Value:=tabAuxVendedorValorTotal.Value         + tabAuxEmitidosValorCalculado.Value;
         tabAuxVendedorValorDesconto.Value:=tabAuxVendedorValorDesconto.Value   + tabAuxEmitidosValorDesconto.Value;
         tabAuxVendedorValorAcrescimo.Value:=tabAuxVendedorValorAcrescimo.Value + tabAuxEmitidosValorAcrescimo.Value;
         tabAuxVendedorValorTitulo.Value:=tabAuxVendedorValorTitulo.Value       + tabAuxEmitidosValorTitulo.Value;
         tabAuxVendedorValorLiquidado.Value:=tabAuxVendedorValorLiquidado.Value + tabAuxEmitidosValorLiquidado.Value;
       end
      else begin
         tabAuxVendedor.Append;
         tabAuxVendedorCodVend.Value:=tabAuxEmitidosResp.Value;
         tabAuxVendedorValorTotal.Value:=tabAuxEmitidosValorCalculado.Value;
         tabAuxVendedorValorDesconto.Value:=tabAuxEmitidosValorDesconto.Value;
         tabAuxVendedorValorAcrescimo.Value:=tabAuxEmitidosValorAcrescimo.Value;
         tabAuxVendedorValorTitulo.Value:=tabAuxEmitidosValorTitulo.Value;
         tabAuxVendedorValorLiquidado.Value:=tabAuxEmitidosValorLiquidado.Value;

         if tabAuxEmitidosPedidoVenda.Value = 1 then begin
            try
               tabChecagens.Close;
               tabChecagens.SQL.Clear;
               tabChecagens.SQL.Add('SELECT Nome FROM funcionarios WHERE Codigo = '+FloatToStr(tabAuxVendedorCodVend.Value));
               tabChecagens.Open;
               if tabChecagens.RecordCount > 0 then begin
                  tabAuxVendedorNomeVende.Value:=tabChecagens.FieldByName('Nome').AsString;
               end;
            finally
               tabChecagens.Close;
            end;
          end
         else begin
            try
               tabChecagens.Close;
               tabChecagens.SQL.Clear;
               tabChecagens.SQL.Add('SELECT Descricao FROM genericos WHERE Codigo = '+FloatToStr(tabAuxVendedorCodVend.Value));
               tabChecagens.Open;
               if tabChecagens.RecordCount > 0 then begin
                  tabAuxVendedorNomeVende.Value:=tabChecagens.FieldByName('Descricao').AsString;
               end;
            finally
               tabChecagens.Close;
            end;
         end;
      end;

      tabAuxVendedor.Post;

      // ---

      // -- Vendedor e Centro Custo

      if tabAuxVendCC.FindKey([tabAuxEmitidosResp.Value, tabAuxEmitidosCC.Value]) then begin
         tabAuxVendCC.Edit;
         tabAuxVendCCValorTotal.Value:=tabAuxVendCCValorTotal.Value         + tabAuxEmitidosValorCalculado.Value;
         tabAuxVendCCValorDesconto.Value:=tabAuxVendCCValorDesconto.Value   + tabAuxEmitidosValorDesconto.Value;
         tabAuxVendCCValorAcrescimo.Value:=tabAuxVendCCValorAcrescimo.Value + tabAuxEmitidosValorAcrescimo.Value;
         tabAuxVendCCValorTitulo.Value:=tabAuxVendCCValorTitulo.Value       + tabAuxEmitidosValorTitulo.Value;
         tabAuxVendCCValorLiquidado.Value:=tabAuxVendCCValorLiquidado.Value + tabAuxEmitidosValorLiquidado.Value;
       end
      else begin
         tabAuxVendCC.Append;
         tabAuxVendCCCodVend.Value:=tabAuxEmitidosResp.Value;
         tabAuxVendCCCodCC.Value:=tabAuxEmitidosCC.Value;
         tabAuxVendCCValorTotal.Value:=tabAuxEmitidosValorCalculado.Value;
         tabAuxVendCCValorDesconto.Value:=tabAuxEmitidosValorDesconto.Value;
         tabAuxVendCCValorAcrescimo.Value:=tabAuxEmitidosValorAcrescimo.Value;
         tabAuxVendCCValorTitulo.Value:=tabAuxEmitidosValorTitulo.Value;
         tabAuxVendCCValorLiquidado.Value:=tabAuxEmitidosValorLiquidado.Value;

         if tabAuxEmitidosPedidoVenda.Value = 1 then begin
            try
               tabChecagens.Close;
               tabChecagens.SQL.Clear;
               tabChecagens.SQL.Add('SELECT Nome FROM funcionarios WHERE Codigo = '+FloatToStr(tabAuxVendCCCodVend.Value));
               tabChecagens.Open;
               if tabChecagens.RecordCount > 0 then begin
                  tabAuxVendCCNomeVende.Value:=tabChecagens.FieldByName('Nome').AsString;
               end;
            finally
               tabChecagens.Close;
            end;
          end
         else begin
            try
               tabChecagens.Close;
               tabChecagens.SQL.Clear;
               tabChecagens.SQL.Add('SELECT Descricao FROM genericos WHERE Codigo = '+FloatToStr(tabAuxVendCCCodVend.Value));
               tabChecagens.Open;
               if tabChecagens.RecordCount > 0 then begin
                  tabAuxVendCCNomeVende.Value:=tabChecagens.FieldByName('Descricao').AsString;
               end;
            finally
               tabChecagens.Close;
            end;
         end;

         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT Descricao FROM centro_custo WHERE Codigo = '+QuotedStr(tabAuxVendCCCodCC.Value));
            tabChecagens.Open;
            if tabChecagens.RecordCount > 0 then begin
               tabAuxVendCCDescCC.Value:=tabChecagens.FieldByName('Descricao').AsString;
            end;
         finally
            tabChecagens.Close;
         end;
      end;

      tabAuxVendCC.Post;

      // --

      // -- Resumo por Localização

      if tabAuxLoc.FindKey([tabAuxEmitidosLoc.Value]) then begin
         tabAuxLoc.Edit;
         tabAuxLocValorTotal.Value:=tabAuxLocValorTotal.Value         + tabAuxEmitidosValorCalculado.Value;
         tabAuxLocValorDesconto.Value:=tabAuxLocValorDesconto.Value   + tabAuxEmitidosValorDesconto.Value;
         tabAuxLocValorAcrescimo.Value:=tabAuxLocValorAcrescimo.Value + tabAuxEmitidosValorAcrescimo.Value;
         tabAuxLocValorTitulo.Value:=tabAuxLocValorTitulo.Value       + tabAuxEmitidosValorTitulo.Value;
         tabAuxLocValorLiquidado.Value:=tabAuxLocValorLiquidado.Value + tabAuxEmitidosValorLiquidado.Value;
       end
      else begin
         tabAuxLoc.Append;
         tabAuxLocCodLoc.Value:=tabAuxEmitidosLoc.Value;
         tabAuxLocValorTotal.Value:=tabAuxEmitidosValorCalculado.Value;
         tabAuxLocValorDesconto.Value:=tabAuxEmitidosValorDesconto.Value;
         tabAuxLocValorAcrescimo.Value:=tabAuxEmitidosValorAcrescimo.Value;
         tabAuxLocValorTitulo.Value:=tabAuxEmitidosValorTitulo.Value;
         tabAuxLocValorLiquidado.Value:=tabAuxEmitidosValorLiquidado.Value;
            
         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT Descricao FROM genericos WHERE Codigo = '+FloatToStr(tabAuxLocCodLoc.Value));
            tabChecagens.Open;
            if tabChecagens.RecordCount > 0 then begin
               tabAuxLocDescLoc.Value:=tabChecagens.FieldByName('Descricao').AsString;
            end;
         finally
            tabChecagens.Close;
         end;
      end;

      tabAuxLoc.Post;

      // ---

      // -- Centro de Custo e Empresa

      if tabAuxCCEmp.FindKey([tabAuxEmitidosEmp.Value, tabAuxEmitidosCC.Value]) then begin
         tabAuxCCEmp.Edit;
         tabAuxCCEmpValorTotal.Value:=tabAuxCCEmpValorTotal.Value         + tabAuxEmitidosValorCalculado.Value;
         tabAuxCCEmpValorDesconto.Value:=tabAuxCCEmpValorDesconto.Value   + tabAuxEmitidosValorDesconto.Value;
         tabAuxCCEmpValorAcrescimo.Value:=tabAuxCCEmpValorAcrescimo.Value + tabAuxEmitidosValorAcrescimo.Value;
         tabAuxCCEmpValorTitulo.Value:=tabAuxCCEmpValorTitulo.Value       + tabAuxEmitidosValorTitulo.Value;
         tabAuxCCEmpValorLiquidado.Value:=tabAuxCCEmpValorLiquidado.Value + tabAuxEmitidosValorLiquidado.Value;
       end
      else begin
         tabAuxCCEmp.Append;
         tabAuxCCEmpCodEmp.Value:=tabAuxEmitidosEmp.Value;
         tabAuxCCEmpCodCC.Value:=tabAuxEmitidosCC.Value;
         tabAuxCCEmpValorTotal.Value:=tabAuxEmitidosValorCalculado.Value;
         tabAuxCCEmpValorDesconto.Value:=tabAuxEmitidosValorDesconto.Value;
         tabAuxCCEmpValorAcrescimo.Value:=tabAuxEmitidosValorAcrescimo.Value;
         tabAuxCCEmpValorTitulo.Value:=tabAuxEmitidosValorTitulo.Value;
         tabAuxCCEmpValorLiquidado.Value:=tabAuxEmitidosValorLiquidado.Value;
            
         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT Descricao FROM centro_custo WHERE Codigo = '+QuotedStr(tabAuxCCEmpCodCC.Value));
            tabChecagens.Open;
            if tabChecagens.RecordCount > 0 then begin
               tabAuxCCEmpDescCC.Value:=tabChecagens.FieldByName('Descricao').AsString;
            end;
         finally
            tabChecagens.Close;
         end;

         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT NomeFantasia FROM empresas WHERE CodigoEmpresa = '+FloatToStr(tabAuxCCEmpCodEmp.Value));
            tabChecagens.Open;
            if tabChecagens.RecordCount > 0 then begin
               tabAuxCCEmpNomeEmp.Value:=tabChecagens.FieldByName('NomeFantasia').AsString;
            end;
         finally
            tabChecagens.Close;
         end;            
      end;

      tabAuxCCEmp.Post;

      // ---

      tabBase.Next;
   end;

   gagProgresso.Progress:=0;

   vValorTitulo:=0;
   vValorDesconto:=0;
   vValorAcrescimo:=0;
   vValorTotal:=0;
   vValorLiquidado:=0;

   case rdgOrdemEmissao.ItemIndex of
      0: tabAuxEmitidos.IndexFieldNames:='CC;Documento';
      1: tabAuxEmitidos.IndexFieldNames:='NotaFiscal';
      2: tabAuxEmitidos.IndexFieldNames:='Data'; 
   end;

   if Impressora = True then begin
      if pndDialogo.Execute then begin
         qrcReceberEmitidos.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
         qrcReceberEmitidos.Print;
      end;
    end
   else begin
      qrcReceberEmitidos.Preview;
// ** -- **

//      if IsZoomed(qrcReceberEmitidos)

   end;
end;

procedure TrtReceberEmitidos.btnImprimirClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(True); 
end;

procedure TrtReceberEmitidos.FormShow(Sender: TObject);
begin
   inherited;

   edtDataInicial.Date:=StartOfTheMonth(Date);
   edtDataFinal.Date:=EndOfTheMonth(Date);

   tabBancos.SQL.Add('SELECT * FROM bancos ORDER BY Descricao');
   tabBancos.Open;

   tabEmpresas.SQL.Add('SELECT * FROM empresas ORDER BY NomeFantasia');
   tabEmpresas.Open;

   tabVendedor.SQL.Add('SELECT Codigo,Nome FROM funcionarios WHERE DataSaida IS NULL ORDER BY Nome');
   tabVendedor.Open;

   tabResponsavel.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('21')+' ORDER BY Descricao');
   tabResponsavel.Open;

   tabAuxEmitidos.CreateDataSet;
   tabAuxEmitidos.EmptyDataSet;

   tabAuxCC.CreateDataSet;
   tabAuxCC.EmptyDataSet;
   tabAuxCC.IndexFieldNames:='CodCC';

   tabAuxLocEmp.CreateDataSet;
   tabAuxLocEmp.EmptyDataSet;
   tabAuxLocEmp.IndexFieldNames:='CodLoc;CodEmp';

   tabAuxVendedor.CreateDataSet;
   tabAuxVendedor.EmptyDataSet;
   tabAuxVendedor.IndexFieldNames:='CodVend';

   tabAuxVendCC.CreateDataSet;
   tabAuxVendCC.EmptyDataSet;
   tabAuxVendCC.IndexFieldNames:='CodVend;CodCC';

   tabAuxLoc.CreateDataSet;
   tabAuxLoc.EmptyDataSet;
   tabAuxLoc.IndexFieldNames:='CodLoc';

   tabAuxCCEmp.CreateDataSet;
   tabAuxCCEmp.EmptyDataSet;
   tabAuxCCEmp.IndexFieldNames:='CodEmp;CodCC'; 
end;

procedure TrtReceberEmitidos.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   inherited;
   vValorTitulo:=vValorTitulo + tabAuxEmitidosValorTitulo.Value;
   vValorDesconto:=vValorDesconto + tabAuxEmitidosValorDesconto.Value;
   vValorAcrescimo:=vValorAcrescimo + tabAuxEmitidosValorAcrescimo.Value;
   vValorTotal:=vValorTotal + tabAuxEmitidosValorCalculado.Value;
   qrlTotalReceberEmitidos.Caption:='Valor Titulo: '+FormatFloat(sis_curr_format, vValorTitulo)+
                                 ' - Valor Desconto: '+FormatFloat(sis_curr_format, vValorDesconto)+
                                 ' - Valor Acréscimo: '+FormatFloat(sis_curr_format, vValorAcrescimo)+
                                 ' - Valor Total: '+FormatFloat(sis_curr_format, vValorTotal);
end;

procedure TrtReceberEmitidos.QRSubDetail5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   inherited;
   vValorTitulo:=vValorTitulo       + tabAuxVendCCValorTitulo.Value;
   vValorDesconto:=vValorDesconto   + tabAuxVendCCValorDesconto.Value;
   vValorAcrescimo:=vValorAcrescimo + tabAuxVendCCValorAcrescimo.Value;
   vValorTotal:=vValorTotal         + tabAuxVendCCValorTotal.Value;
   vValorLiquidado:=vValorLiquidado + tabAuxVendCCValorLiquidado.Value;
   qrlTotalResVendCC.Caption:='Valor Titulo: '+FormatFloat(sis_curr_format, vValorTitulo)+
                                 ' - Valor Desconto: '+FormatFloat(sis_curr_format, vValorDesconto)+
                                 ' - Valor Liquidado: '+FormatFloat(sis_curr_format, vValorLiquidado)+
                                 ' - Valor Acréscimo: '+FormatFloat(sis_curr_format, vValorAcrescimo)+
                                 ' - Valor Total: '+FormatFloat(sis_curr_format, vValorTotal);
end;

procedure TrtReceberEmitidos.QRSubDetail2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
   vValorTitulo:=vValorTitulo       + tabAuxCCValorTitulo.Value;
   vValorDesconto:=vValorDesconto   + tabAuxCCValorDesconto.Value;
   vValorAcrescimo:=vValorAcrescimo + tabAuxCCValorAcrescimo.Value;
   vValorTotal:=vValorTotal         + tabAuxCCValorTotal.Value;
   vValorLiquidado:=vValorLiquidado + tabAuxCCValorLiquidado.Value;
   qrlTotalCC.Caption:='Valor Titulo: '+FormatFloat(sis_curr_format, vValorTitulo)+
                                 ' - Valor Desconto: '+FormatFloat(sis_curr_format, vValorDesconto)+
                                 ' - Valor Liquidado: '+FormatFloat(sis_curr_format, vValorLiquidado)+
                                 ' - Valor Acréscimo: '+FormatFloat(sis_curr_format, vValorAcrescimo)+
                                 ' - Valor Total: '+FormatFloat(sis_curr_format, vValorTotal);

end;

procedure TrtReceberEmitidos.QRSubDetail4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   inherited;
   vValorTitulo:=vValorTitulo       + tabAuxVendedorValorTitulo.Value;
   vValorDesconto:=vValorDesconto   + tabAuxVendedorValorDesconto.Value;
   vValorAcrescimo:=vValorAcrescimo + tabAuxVendedorValorAcrescimo.Value;
   vValorTotal:=vValorTotal         + tabAuxVendedorValorTotal.Value;
   vValorLiquidado:=vValorLiquidado + tabAuxVendedorValorLiquidado.Value;
   qrlTotalVendedor.Caption:='Valor Titulo: '+FormatFloat(sis_curr_format, vValorTitulo)+
                                 ' - Valor Desconto: '+FormatFloat(sis_curr_format, vValorDesconto)+
                                 ' - Valor Liquidado: '+FormatFloat(sis_curr_format, vValorLiquidado)+
                                 ' - Valor Acréscimo: '+FormatFloat(sis_curr_format, vValorAcrescimo)+
                                 ' - Valor Total: '+FormatFloat(sis_curr_format, vValorTotal);


end;

procedure TrtReceberEmitidos.QRSubDetail6BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   inherited;
   vValorTitulo:=vValorTitulo       + tabAuxLocValorTitulo.Value;
   vValorDesconto:=vValorDesconto   + tabAuxLocValorDesconto.Value;
   vValorAcrescimo:=vValorAcrescimo + tabAuxLocValorAcrescimo.Value;
   vValorTotal:=vValorTotal         + tabAuxLocValorTotal.Value;
   vValorLiquidado:=vValorLiquidado + tabAuxLocValorLiquidado.Value;
   qrlTotalLocalizacao.Caption:='Valor Titulo: '+FormatFloat(sis_curr_format, vValorTitulo)+
                                 ' - Valor Desconto: '+FormatFloat(sis_curr_format, vValorDesconto)+
                                 ' - Valor Liquidado: '+FormatFloat(sis_curr_format, vValorLiquidado)+
                                 ' - Valor Acréscimo: '+FormatFloat(sis_curr_format, vValorAcrescimo)+
                                 ' - Valor Total: '+FormatFloat(sis_curr_format, vValorTotal);



end;

procedure TrtReceberEmitidos.QRSubDetail3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   inherited;
   vValorTitulo:=vValorTitulo       + tabAuxLocEmpValorTitulo.Value;
   vValorDesconto:=vValorDesconto   + tabAuxLocEmpValorDesconto.Value;
   vValorAcrescimo:=vValorAcrescimo + tabAuxLocEmpValorAcrescimo.Value;
   vValorTotal:=vValorTotal         + tabAuxLocEmpValorTotal.Value;
   vValorLiquidado:=vValorLiquidado + tabAuxLocEmpValorLiquidado.Value;
   qrlTotalLocEmp.Caption:='Valor Titulo: '            +FormatFloat(sis_curr_format, vValorTitulo)+
                                 ' - Valor Desconto: ' +FormatFloat(sis_curr_format, vValorDesconto)+
                                 ' - Valor Liquidado: '+FormatFloat(sis_curr_format, vValorLiquidado)+
                                 ' - Valor Acréscimo: '+FormatFloat(sis_curr_format, vValorAcrescimo)+
                                 ' - Valor Total: '    +FormatFloat(sis_curr_format, vValorTotal);


end;

procedure TrtReceberEmitidos.QRSubDetail7BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   inherited;
   vValorTitulo:=vValorTitulo       + tabAuxCCEmpValorTitulo.Value;
   vValorDesconto:=vValorDesconto   + tabAuxCCEmpValorDesconto.Value;
   vValorAcrescimo:=vValorAcrescimo + tabAuxCCEmpValorAcrescimo.Value;
   vValorTotal:=vValorTotal         + tabAuxCCEmpValorTotal.Value;
   vValorLiquidado:=vValorLiquidado + tabAuxCCEmpValorLiquidado.Value;
   qrlTotalCCEmp.Caption:='Valor Titulo: '            +FormatFloat(sis_curr_format, vValorTitulo)+
                                 ' - Valor Desconto: ' +FormatFloat(sis_curr_format, vValorDesconto)+
                                 ' - Valor Liquidado: '+FormatFloat(sis_curr_format, vValorLiquidado)+
                                 ' - Valor Acréscimo: '+FormatFloat(sis_curr_format, vValorAcrescimo)+
                                 ' - Valor Total: '    +FormatFloat(sis_curr_format, vValorTotal);

end;

procedure TrtReceberEmitidos.qrcReceberEmitidosAddReports(Sender: TObject);
begin
   inherited;
   qrcReceberEmitidos.Reports.Add(qrpReceberEmitidos);
   qrcReceberEmitidos.Reports.Add(qrpResCC);
   qrcReceberEmitidos.Reports.Add(qrpResLocEmp);
   qrcReceberEmitidos.Reports.Add(qrpResVendedor);
   qrcReceberEmitidos.Reports.Add(qrpResVendCC);
   qrcReceberEmitidos.Reports.Add(qrpResLocalizacao);
   qrcReceberEmitidos.Reports.Add(qrpResCCEmp);
end;

procedure TrtReceberEmitidos.qrcReceberEmitidosFinished(Sender: TObject);
begin
   inherited;
   vValorTitulo:=0;
   vValorDesconto:=0;
   vValorAcrescimo:=0;
   vValorTotal:=0;
   vValorLiquidado:=0;
end;

procedure TrtReceberEmitidos.edtCodigoVendedorChange(Sender: TObject);
begin
   inherited;
   if Trim(edtCodigoVendedor.Text) <> '' then begin
      try
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT Codigo FROM funcionarios WHERE Codigo = '+edtCodigoVendedor.Text);
         tabChecagens.Open;

         if tabChecagens.RecordCount > 0 then begin
            edtVendedor.KeyValue:=tabChecagens.FieldByName('Codigo').AsFloat;
          end
         else begin
            edtVendedor.KeyValue:=NULL;
         end;
      finally
         tabChecagens.Close;
      end;
    end
   else begin
      edtVendedor.KeyValue:=NULL;
   end;
end;

procedure TrtReceberEmitidos.edtVendedorCloseUp(Sender: TObject);
begin
   inherited;
   if Trim(edtVendedor.Text) <> '' then begin
      edtCodigoVendedor.Text:=String(edtVendedor.KeyValue);
    end
   else begin
      edtCodigoVendedor.Text:='';
   end;
end;

procedure TrtReceberEmitidos.edtCodigoResponsavelChange(Sender: TObject);
begin
   inherited;
   if Trim(edtCodigoResponsavel.Text) <> '' then begin
      try
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT Codigo FROM genericos WHERE Codigo = '+edtCodigoResponsavel.Text + ' AND Tipo = '+QuotedStr('21'));
         tabChecagens.Open;
         if tabChecagens.RecordCount > 0 then begin
            edtResponsavel.KeyValue:=tabChecagens.FieldByName('Codigo').AsFloat;
          end
         else begin
            edtResponsavel.KeyValue:=NULL;
         end;
      finally
         tabChecagens.Close;
      end;
    end
   else begin
      edtResponsavel.KeyValue:=NULL; 
   end;
end;

procedure TrtReceberEmitidos.edtResponsavelCloseUp(Sender: TObject);
begin
   inherited;
   if Trim(edtResponsavel.Text) <> '' then begin
      edtCodigoResponsavel.Text:=String(edtResponsavel.KeyValue);
    end
   else begin
      edtCodigoResponsavel.Text:='';
   end;
end;

procedure TrtReceberEmitidos.qrpResLocalizacaoBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   inherited;
   vValorTitulo:=0;
   vValorDesconto:=0;
   vValorAcrescimo:=0;
   vValorTotal:=0;
   vValorLiquidado:=0;
end;

procedure TrtReceberEmitidos.qrpResCCEmpBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   inherited;
   vValorTitulo:=0;
   vValorDesconto:=0;
   vValorAcrescimo:=0;
   vValorTotal:=0; 
   vValorLiquidado:=0;
end;

procedure TrtReceberEmitidos.qrpReceberEmitidosBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   inherited;
   vValorTitulo:=0;
   vValorDesconto:=0;
   vValorAcrescimo:=0;
   vValorTotal:=0;
   vValorLiquidado:=0;
end;

procedure TrtReceberEmitidos.qrpResVendCCBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   inherited;
   vValorTitulo:=0;
   vValorDesconto:=0;
   vValorAcrescimo:=0;
   vValorTotal:=0;
   vValorLiquidado:=0;
end;

procedure TrtReceberEmitidos.qrpResCCBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   inherited;
   vValorTitulo:=0;
   vValorDesconto:=0;
   vValorAcrescimo:=0;
   vValorTotal:=0;
   vValorLiquidado:=0;
end;

procedure TrtReceberEmitidos.qrpResVendedorBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   inherited;
   vValorTitulo:=0;
   vValorDesconto:=0;
   vValorAcrescimo:=0;
   vValorTotal:=0;
   vValorLiquidado:=0;
end;

procedure TrtReceberEmitidos.qrpResLocEmpBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   inherited;
   vValorTitulo:=0;
   vValorDesconto:=0;
   vValorAcrescimo:=0;
   vValorTotal:=0;
   vValorLiquidado:=0;
end;

end.

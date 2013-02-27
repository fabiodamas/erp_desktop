unit rPagarEmitidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls, ToolEdit, Gauges;

type
  TrtPagarEmitidos = class(TfmFormBaseRelatorio)
    tabBase: TZQuery;
    pndDialogo: TPrintDialog;
    qrpPagarEmitidos: TQuickRep;
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
    QRDBText15: TQRDBText;
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
    tabAuxEmitidosPedidoVenda: TIntegerField;
    qrpResCCusto: TQuickRep;
    QRSubDetail5: TQRSubDetail;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRBand13: TQRBand;
    QRShape9: TQRShape;
    QRLabel41: TQRLabel;
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
    Label5: TLabel;
    edtCC: TDBLookupComboBox;
    tabCC: TZQuery;
    dtsCC: TDataSource;
    tabFornecedor: TZQuery;
    dtsBase: TDataSource;
    tabFuncionario: TZQuery;
    tabTransportadoras: TZQuery;
    tabBancosRel: TZQuery;
    tabAuxCC: TClientDataSet;
    tabAuxCCCodCC: TStringField;
    tabAuxCCDescCC: TStringField;
    tabAuxCCValorTitulo: TCurrencyField;
    tabAuxCCValorDesconto: TCurrencyField;
    tabAuxCCValorLiquidado: TCurrencyField;
    tabAuxCCValorAcrescimo: TCurrencyField;
    tabAuxCCValorTotal: TCurrencyField;
    qrpResEmpCC: TQuickRep;
    QRSubDetail2: TQRSubDetail;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRBand4: TQRBand;
    QRShape3: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRBand6: TQRBand;
    QRLabel21: TQRLabel;
    QRSysData3: TQRSysData;
    QRShape4: TQRShape;
    QRSysData4: TQRSysData;
    QRLabel23: TQRLabel;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    tabAuxEmpCC: TClientDataSet;
    tabAuxEmpCCCodCC: TStringField;
    tabAuxEmpCCDescCC: TStringField;
    tabAuxEmpCCValorTitulo: TCurrencyField;
    tabAuxEmpCCValorDesconto: TCurrencyField;
    tabAuxEmpCCValorLiquidado: TCurrencyField;
    tabAuxEmpCCValorAcrescimo: TCurrencyField;
    tabAuxEmpCCValorTotal: TCurrencyField;
    tabAuxEmpCCCodEmp: TFloatField;
    tabAuxEmpCCNomeEmp: TStringField;
    qrpResCCInd: TQuickRep;
    QRSubDetail3: TQRSubDetail;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRBand7: TQRBand;
    QRShape5: TQRShape;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel30: TQRLabel;
    QRBand8: TQRBand;
    QRBand9: TQRBand;
    QRLabel31: TQRLabel;
    QRSysData5: TQRSysData;
    QRShape6: TQRShape;
    QRSysData6: TQRSysData;
    tabAuxCCInd: TClientDataSet;
    tabAuxCCIndCodCC: TStringField;
    tabAuxCCIndDescCC: TStringField;
    tabAuxCCIndValorTitulo: TCurrencyField;
    tabAuxCCIndValorDesconto: TCurrencyField;
    tabAuxCCIndValorLiquidado: TCurrencyField;
    tabAuxCCIndValorAcrescimo: TCurrencyField;
    tabAuxCCIndValorTotal: TCurrencyField;
    edtCodCC: TEdit;
    SummaryBand1: TQRBand;
    qrlTotalPagarEmitidos: TQRLabel;
    SummaryBand2: TQRBand;
    qrlTotalResCC: TQRLabel;
    SummaryBand3: TQRBand;
    qrlTotalEmpCC: TQRLabel;
    qrcPagarEmitidos: TQRCompositeReport;
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
    procedure QRSubDetail5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure edtCodCCChange(Sender: TObject);
    procedure edtCCCloseUp(Sender: TObject);
    procedure qrcPagarEmitidosFinished(Sender: TObject);
    procedure qrcPagarEmitidosAddReports(Sender: TObject);
    procedure qrpPagarEmitidosBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrpResCCustoBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrpResEmpCCBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrpResCCIndBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
     procedure GerarImpressao(Impressora: Boolean = False);
  public
  end;

var vValorTitulo, vValorDesconto, vValorAcrescimo, vValorTotal, vValorLiquidado : real;  

implementation

uses uFormBase, uMenu, uFuncoes, uConstantes, DateUtils;

{$R *.dfm}

procedure TrtPagarEmitidos.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TrtPagarEmitidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabBancos.Close;
   tabEmpresas.Close;
   tabBase.Close;
   tabAuxEmitidos.Close;
   tabCC.Close;
   tabFornecedor.Close;
   tabFuncionario.Close;
   tabTransportadoras.Close;
   tabBancosRel.Close;
   tabAuxCC.Close;
   tabAuxEmpCC.Close;
   tabAuxCCInd.Close;
   inherited;
end;

procedure TrtPagarEmitidos.btnVisualizarClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(); 
end;

procedure TrtPagarEmitidos.GerarImpressao(Impressora: Boolean = False);
var vWhere : string;
begin
   qrlTitulo.Caption:='Pagar Emitidos';

   vWhere:='';

   tabAuxEmitidos.EmptyDataSet;
   tabAuxCC.EmptyDataSet;
   tabAuxEmpCC.EmptyDataSet;
   tabAuxCCInd.EmptyDataSet;

   tabBase.Close;
   tabBase.SQL.Clear;
   tabBase.SQL.Add('SELECT titulos_pagar.DataEmissao, titulos_pagar.Documento, titulos_pagar.NotaFiscal,');
   tabBase.SQL.Add('titulos_pagar.Parcela, titulos_pagar.CodigoConta, titulos_pagar.ValorTotal, titulos_pagar.TipoConta,');
   tabBase.SQL.Add('titulos_pagar.CodigoEmpresa, titulos_pagar.CodigoResponsavel, titulos_pagar.CodigoCentroCusto,');
   tabBase.SQL.Add('titulos_pagar.CodigoLocalizacao, titulos_pagar.ValorDesconto, titulos_pagar.ValorAcrescimo,');
   tabBase.SQL.Add('titulos_pagar.DataVencimento, titulos_pagar.DataPagamento,');
   if Trim(edtBanco.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption+' - Banco: '+edtBanco.Text;
      tabBase.SQL.Add('(SELECT SUM(titulos_pagar_liquidacoes.ValorLiquida) FROM titulos_pagar_liquidacoes WHERE titulos_pagar_liquidacoes.Titulo = titulos_pagar.Titulo AND titulos_pagar_liquidacoes.TipoLiquida = '+ FloatToStr(edtBanco.KeyValue) +') AS ValorLiquidado');
    end
   else begin
      tabBase.SQL.Add('(SELECT SUM(titulos_pagar_liquidacoes.ValorLiquida) FROM titulos_pagar_liquidacoes WHERE titulos_pagar_liquidacoes.Titulo = titulos_pagar.Titulo) AS ValorLiquidado');
   end;
   tabBase.SQL.Add('FROM titulos_pagar');

   if Trim(edtBanco.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'titulos_pagar.TipoLiquida = '+FloatToStr(edtBanco.KeyValue);
   end;
   if Trim(edtEmpresa.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption+' - Empresa: '+edtEmpresa.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'titulos_pagar.CodigoEmpresa = '+FloatToStr(edtEmpresa.KeyValue);
   end;
   if (Trim(edtDataInicial.Text) <> '/  /') and (Trim(edtDataFinal.Text) <> '/  /') then begin
      qrlTitulo.Caption:=qrlTitulo.Caption+' - Período: '+edtDataInicial.Text+' a '+edtDataFinal.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'titulos_pagar.DataEmissao >= '+QuotedStr(FormatDateTime(sis_date_format, edtDataInicial.Date))+' AND '+
                       'titulos_pagar.DataEmissao <= '+QuotedStr(FormatDateTime(sis_date_format, edtDataFinal.Date));
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

      tabAuxEmitidos.Append;
      tabAuxEmitidosEmissao.Value:=tabBase.FieldByName('DataEmissao').AsDateTime;
      tabAuxEmitidosDocumento.Value:=tabBase.FieldByName('Documento').AsFloat;
      tabAuxEmitidosNotaFiscal.Value:=tabBase.FieldByName('NotaFiscal').AsString;
      tabAuxEmitidosParcela.Value:=tabBase.FieldByName('Parcela').AsInteger;
      tabAuxEmitidosCodigoConta.Value:=tabBase.FieldByName('CodigoConta').asFloat;
      tabAuxEmitidosValorTitulo.Value:=tabBase.FieldByName('ValorTotal').AsFloat;
      tabAuxEmitidosValorDesconto.Value:=tabBase.FieldByName('ValorDesconto').AsFloat;
      tabAuxEmitidosValorAcrescimo.Value:=tabBase.FieldByName('ValorAcrescimo').AsFloat;
      tabAuxEmitidosValorLiquidado.Value:=tabBase.FieldByName('ValorLiquidado').AsFloat;
      tabAuxEmitidosCC.Value:=tabBase.FieldByName('CodigoCentroCusto').AsString;
      tabAuxEmitidosLoc.Value:=tabBase.FieldByName('CodigoLocalizacao').AsFloat;
      tabAuxEmitidosEmp.Value:=tabBase.FieldByName('CodigoEmpresa').AsFloat;
      tabAuxEmitidosResp.Value:=tabBase.FieldByName('Codigoresponsavel').AsFloat;

      if tabBase.FieldByName('DataPagamento').IsNull then begin
         tabAuxEmitidosData.Value:=tabBase.FieldByName('DataVencimento').AsDateTime;
         tabAuxEmitidosValorCalculado.Value:=((tabAuxEmitidosValorTitulo.Value-tabAuxEmitidosValorDesconto.Value)+tabAuxEmitidosValorAcrescimo.Value)-tabAuxEmitidosValorLiquidado.Value;
       end
      else begin
         tabAuxEmitidosData.Value:=tabBase.FieldByName('DataPagamento').AsDateTime;
         tabAuxEmitidosValorCalculado.Value:=tabAuxEmitidosValorLiquidado.Value;
      end;

      if tabBase.FieldByName('TipoConta').AsString = '1' then begin
         // fornecedor
         tabAuxEmitidosNomeFantasia.Value:=tabFornecedor.FieldByName('NomeFantasia').AsString;
       end
      else if tabBase.FieldByName('TipoConta').AsString = '2' then begin
         // funcionario
         tabAuxEmitidosNomeFantasia.Value:=tabFuncionario.FieldByName('Nome').AsString;
       end
      else if tabBase.FieldByName('TipoConta').AsString = '3' then begin
         // transportadora
         tabAuxEmitidosNomeFantasia.Value:=tabTransportadoras.FieldByName('Nome').AsString;
       end
      else if tabBase.FieldByName('TipoConta').AsString = '4' then begin
         // banco
         tabAuxEmitidosNomeFantasia.Value:=tabBancosRel.FieldByName('Descricao').AsString;
      end;
      
      tabAuxEmitidos.Post;

      // --

      if tabAuxCC.FindKey([tabAuxEmitidosCC.Value]) then begin
         tabAuxCC.Edit;
         tabAuxCCValorTitulo.Value:=tabAuxCCValorTitulo.Value + tabAuxEmitidosValorTitulo.Value;
         tabAuxCCValorDesconto.Value:=tabAuxCCValorDesconto.Value + tabAuxEmitidosValorDesconto.Value;
         tabAuxCCValorLiquidado.Value:=tabAuxCCValorLiquidado.Value + tabAuxEmitidosValorLiquidado.Value;
         tabAuxCCValorAcrescimo.Value:=tabAuxCCValorAcrescimo.Value + tabAuxEmitidosValorAcrescimo.Value;
         tabAuxCCValorTotal.Value:=tabAuxCCValorTotal.Value + tabAuxEmitidosValorCalculado.Value;            
       end
      else begin
         tabAuxCC.Append;
         tabAuxCCCodCC.Value:=tabAuxEmitidosCC.Value;
         tabAuxCCValorTitulo.Value:=tabAuxEmitidosValorTitulo.Value;
         tabAuxCCValorDesconto.Value:=tabAuxEmitidosValorDesconto.Value;
         tabAuxCCValorLiquidado.Value:=tabAuxEmitidosValorLiquidado.Value;
         tabAuxCCValorAcrescimo.Value:=tabAuxEmitidosValorAcrescimo.Value;
         tabAuxCCValorTotal.Value:=tabAuxEmitidosValorCalculado.Value;
         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT Descricao FROM centro_custo WHERE Codigo = '+QuotedStr(tabAuxCCCodCC.Value));
            tabChecagens.Open;
            tabAuxCCDescCC.Value:=tabChecagens.FieldByName('Descricao').AsString;
         finally
            tabChecagens.Close;
         end;
      end;

      tabAuxCC.Post;

      // --

      if tabAuxEmpCC.FindKey([tabAuxEmitidosEmp.Value, tabAuxEmitidosCC.Value]) then begin
         tabAuxEmpCC.Edit;
         tabAuxEmpCCValorTitulo.Value:=tabAuxEmpCCValorTitulo.Value + tabAuxEmitidosValorTitulo.Value;
         tabAuxEmpCCValorDesconto.Value:=tabAuxEmpCCValorDesconto.Value + tabAuxEmitidosValorDesconto.Value;
         tabAuxEmpCCValorLiquidado.Value:=tabAuxEmpCCValorLiquidado.Value + tabAuxEmitidosValorLiquidado.Value;
         tabAuxEmpCCValorAcrescimo.Value:=tabAuxEmpCCValorAcrescimo.Value + tabAuxEmitidosValorAcrescimo.Value;
         tabAuxEmpCCValorTotal.Value:=tabAuxEmpCCValorTotal.Value + tabAuxEmitidosValorCalculado.Value;
       end
      else begin
         tabAuxEmpCC.Append;
         tabAuxEmpCCCodCC.Value:=tabAuxEmitidosCC.Value;
         tabAuxEmpCCCodEmp.Value:=tabAuxEmitidosEmp.Value;
         tabAuxEmpCCValorTitulo.Value:=tabAuxEmitidosValorTitulo.Value;
         tabAuxEmpCCValorDesconto.Value:=tabAuxEmitidosValorDesconto.Value;
         tabAuxEmpCCValorLiquidado.Value:=tabAuxEmitidosValorLiquidado.Value;
         tabAuxEmpCCValorAcrescimo.Value:=tabAuxEmitidosValorAcrescimo.Value;
         tabAuxEmpCCValorTotal.Value:=tabAuxEmitidosValorCalculado.Value;

         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT Descricao FROM centro_custo WHERE Codigo = '+QuotedStr(tabAuxEmpCCCodCC.Value));
            tabChecagens.Open;
            tabAuxEmpCCDescCC.Value:=tabChecagens.FieldByName('Descricao').AsString;
         finally
            tabChecagens.Close;
         end;

         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT NomeFantasia FROM empresas WHERE CodigoEmpresa = '+FloatToStr(tabAuxEmpCCCodEmp.Value));
            tabChecagens.Open;
            tabAuxEmpCCNomeEmp.Value:=tabChecagens.FieldByName('NomeFantasia').AsString;
         finally
            tabChecagens.Close;
         end;
      end;

      tabAuxEmpCC.Post;

      // --
      if Trim(edtCodCC.Text) <> '' then begin

         if tabAuxEmitidosCC.Value <> String(edtCC.KeyValue) then begin
            tabBase.Next;
            Continue;
         end;

         if tabAuxCCInd.FindKey([tabAuxEmitidosCC.Value]) then begin
            tabAuxCCInd.Edit;
            tabAuxCCIndValorTitulo.Value:=tabAuxCCIndValorTitulo.Value + tabAuxEmitidosValorTitulo.Value;
            tabAuxCCIndValorDesconto.Value:=tabAuxCCIndValorDesconto.Value + tabAuxEmitidosValorDesconto.Value;
            tabAuxCCIndValorLiquidado.Value:=tabAuxCCIndValorLiquidado.Value + tabAuxEmitidosValorLiquidado.Value;
            tabAuxCCIndValorAcrescimo.Value:=tabAuxCCIndValorAcrescimo.Value + tabAuxEmitidosValorAcrescimo.Value;
            tabAuxCCIndValorTotal.Value:=tabAuxCCIndValorTotal.Value + tabAuxEmitidosValorCalculado.Value;
          end
         else begin
            tabAuxCCInd.Append;
            tabAuxCCIndCodCC.Value:=tabAuxEmitidosCC.Value;
            tabAuxCCIndValorTitulo.Value:=tabAuxEmitidosValorTitulo.Value;
            tabAuxCCIndValorDesconto.Value:=tabAuxEmitidosValorDesconto.Value;
            tabAuxCCIndValorLiquidado.Value:=tabAuxEmitidosValorLiquidado.Value;
            tabAuxCCIndValorAcrescimo.Value:=tabAuxEmitidosValorAcrescimo.Value;
            tabAuxCCIndValorTotal.Value:=tabAuxEmitidosValorCalculado.Value;

            try
               tabChecagens.Close;
               tabChecagens.SQL.Clear;
               tabChecagens.SQL.Add('SELECT Descricao FROM centro_custo WHERE Codigo = '+QuotedStr(tabAuxCCIndCodCC.Value));
               tabChecagens.Open;
               tabAuxCCIndDescCC.Value:=tabChecagens.FieldByName('Descricao').AsString;
            finally
               tabChecagens.Close;
            end;
         end;

         tabAuxCCInd.Post;

      end;
      // --

      tabBase.Next;
   end;

   gagProgresso.Progress:=0;

   vValorTitulo:=0;
   vValorDesconto:=0;
   vValorAcrescimo:=0;
   vValorTotal:=0;
   vValorLiquidado:=0;

   case rdgOrdemEmissao.ItemIndex of
      0: tabAuxEmitidos.IndexFieldNames:='Data;Parcela';
      1: tabAuxEmitidos.IndexFieldNames:='CC;Data';
   end;

   if Impressora = True then begin
      if pndDialogo.Execute then begin
         qrcPagarEmitidos.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
         qrcPagarEmitidos.Print;
      end;
    end
   else begin
      qrcPagarEmitidos.Preview;
   end;  
end;

procedure TrtPagarEmitidos.btnImprimirClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(True); 
end;

procedure TrtPagarEmitidos.FormShow(Sender: TObject);
begin
   inherited;
   tabBancos.SQL.Add('SELECT * FROM bancos ORDER BY Descricao');
   tabBancos.Open;

   tabEmpresas.SQL.Add('SELECT * FROM empresas ORDER BY NomeFantasia');
   tabEmpresas.Open;

   tabCC.SQL.Add('SELECT * FROM centro_custo ORDER BY Descricao');
   tabCC.Open;

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

   tabAuxEmitidos.CreateDataSet;
   tabAuxEmitidos.EmptyDataSet;

   tabAuxCC.CreateDataSet;
   tabAuxCC.EmptyDataSet;
   tabAuxCC.IndexFieldNames:='CodCC';

   tabAuxEmpCC.CreateDataSet;
   tabAuxEmpCC.EmptyDataSet;
   tabAuxEmpCC.IndexFieldNames:='CodEmp;CodCC';

   tabAuxCCInd.CreateDataSet;
   tabAuxCCInd.EmptyDataSet;
   tabAuxCCInd.IndexFieldNames:='CodCC';

   edtDataInicial.Date:=StartOfTheMonth(Date);
   edtDataFinal.Date:=EndOfTheMonth(Date);
end;

procedure TrtPagarEmitidos.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   inherited;
   vValorTitulo:=vValorTitulo + tabAuxEmitidosValorTitulo.Value;
   vValorDesconto:=vValorDesconto + tabAuxEmitidosValorDesconto.Value;
   vValorAcrescimo:=vValorAcrescimo + tabAuxEmitidosValorAcrescimo.Value;
   vValorTotal:=vValorTotal + tabAuxEmitidosValorCalculado.Value;
   qrlTotalPagarEmitidos.Caption:='Valor Titulo: '+FormatFloat(sis_curr_format, vValorTitulo)+
                                 ' - Valor Desconto: '+FormatFloat(sis_curr_format, vValorDesconto)+
                                 ' - Valor Acréscimo: '+FormatFloat(sis_curr_format, vValorAcrescimo)+
                                 ' - Valor Total: '+FormatFloat(sis_curr_format, vValorTotal);
end;

procedure TrtPagarEmitidos.dtsBaseDataChange(Sender: TObject;
  Field: TField);
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

procedure TrtPagarEmitidos.QRSubDetail2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   inherited;
   vValorTitulo:=vValorTitulo + tabAuxEmpCCValorTitulo.Value;
   vValorDesconto:=vValorDesconto + tabAuxEmpCCValorDesconto.Value;
   vValorAcrescimo:=vValorAcrescimo + tabAuxEmpCCValorAcrescimo.Value;
   vValorTotal:=vValorTotal + tabAuxEmpCCValorTotal.Value;
   qrlTotalEmpCC.Caption:='Valor Titulo: '+FormatFloat(sis_curr_format, vValorTitulo)+
                                 ' - Valor Desconto: '+FormatFloat(sis_curr_format, vValorDesconto)+
                                 ' - Valor Acréscimo: '+FormatFloat(sis_curr_format, vValorAcrescimo)+
                                 ' - Valor Total: '+FormatFloat(sis_curr_format, vValorTotal);
end;

procedure TrtPagarEmitidos.QRSubDetail5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   inherited;
   vValorTitulo:=vValorTitulo + tabAuxCCValorTitulo.Value;
   vValorDesconto:=vValorDesconto + tabAuxCCValorDesconto.Value;
   vValorAcrescimo:=vValorAcrescimo + tabAuxCCValorAcrescimo.Value;
   vValorTotal:=vValorTotal + tabAuxCCValorTotal.Value;
   qrlTotalResCC.Caption:='Valor Titulo: '+FormatFloat(sis_curr_format, vValorTitulo)+
                                 ' - Valor Desconto: '+FormatFloat(sis_curr_format, vValorDesconto)+
                                 ' - Valor Acréscimo: '+FormatFloat(sis_curr_format, vValorAcrescimo)+
                                 ' - Valor Total: '+FormatFloat(sis_curr_format, vValorTotal);
end;

procedure TrtPagarEmitidos.edtCodCCChange(Sender: TObject);
begin
   inherited;
   if Trim(edtCodCC.Text) <> '' then begin
      try
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT Codigo FROM centro_custo WHERE Codigo = '+QuotedStr(edtCodCC.Text));
         tabChecagens.Open;
         if tabChecagens.RecordCount > 0 then begin
            edtCC.KeyValue:=edtCodCC.Text;
          end
         else begin
            edtCC.KeyValue:=NULL;
         end;
      finally
         tabChecagens.Close;
      end;
    end
   else begin
      edtCC.KeyValue:=NULL;
   end;
end;

procedure TrtPagarEmitidos.edtCCCloseUp(Sender: TObject);
begin
   inherited;
   if Trim(edtCC.Text) <> '' then begin
      edtCodCC.Text:=String(edtCC.KeyValue);
   end;
end;

procedure TrtPagarEmitidos.qrcPagarEmitidosFinished(Sender: TObject);
begin
   inherited;
   vValorTitulo:=0;
   vValorDesconto:=0;
   vValorAcrescimo:=0;
   vValorTotal:=0;
   vValorLiquidado:=0;
end;

procedure TrtPagarEmitidos.qrcPagarEmitidosAddReports(Sender: TObject);
begin
   inherited;
   qrcPagarEmitidos.Reports.Add(qrpPagarEmitidos);
   qrcPagarEmitidos.Reports.Add(qrpResCCusto);
   qrcPagarEmitidos.Reports.Add(qrpResEmpCC);
   if Trim(edtCodCC.Text) <> '' then begin
      qrcPagarEmitidos.Reports.Add(qrpResCCInd);
   end;
end;

procedure TrtPagarEmitidos.qrpPagarEmitidosBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   inherited;
   vValorTitulo:=0;
   vValorDesconto:=0;
   vValorAcrescimo:=0;
   vValorTotal:=0;
   vValorLiquidado:=0;
end;

procedure TrtPagarEmitidos.qrpResCCustoBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   inherited;
   vValorTitulo:=0;
   vValorDesconto:=0;
   vValorAcrescimo:=0;
   vValorTotal:=0;
   vValorLiquidado:=0;
end;

procedure TrtPagarEmitidos.qrpResEmpCCBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   inherited;
   vValorTitulo:=0;
   vValorDesconto:=0;
   vValorAcrescimo:=0;
   vValorTotal:=0;
   vValorLiquidado:=0;
end;

procedure TrtPagarEmitidos.qrpResCCIndBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   inherited;
   vValorTitulo:=0;
   vValorDesconto:=0;
   vValorAcrescimo:=0;
   vValorTotal:=0;
   vValorLiquidado:=0; 
end;

end.

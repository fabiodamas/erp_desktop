unit rReceberAberto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls, ToolEdit, Gauges;

type
  TrtReceberAberto = class(TfmFormBaseRelatorio)
    tabBase: TZQuery;
    pndDialogo: TPrintDialog;
    qrpReceberAberto: TQuickRep;
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
    edtEmpresa: TDBLookupComboBox;
    Label2: TLabel;
    rdgOrdemEmissao: TRadioGroup;
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
    gagProgresso: TGauge;
    tabAuxAberto: TClientDataSet;
    tabAuxAbertoEmissao: TDateField;
    tabAuxAbertoDocumento: TFloatField;
    tabAuxAbertoNotaFiscal: TStringField;
    tabAuxAbertoParcela: TIntegerField;
    tabAuxAbertoData: TDateField;
    tabAuxAbertoCodigoConta: TFloatField;
    tabAuxAbertoNomeFantasia: TStringField;
    tabAuxAbertoValorTitulo: TCurrencyField;
    tabAuxAbertoValorLiquidado: TCurrencyField;
    qrpResLocEmp: TQuickRep;
    QRSubDetail3: TQRSubDetail;
    QRDBText22: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText26: TQRDBText;
    QRBand7: TQRBand;
    QRShape5: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel26: TQRLabel;
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
    tabAuxAbertoPedidoVenda: TIntegerField;
    qrpResLocalizacao: TQuickRep;
    QRSubDetail6: TQRSubDetail;
    QRDBText48: TQRDBText;
    QRDBText49: TQRDBText;
    QRDBText51: TQRDBText;
    QRBand16: TQRBand;
    QRShape11: TQRShape;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel53: TQRLabel;
    QRBand18: TQRBand;
    QRLabel57: TQRLabel;
    QRSysData11: TQRSysData;
    QRShape12: TQRShape;
    QRSysData12: TQRSysData;
    tabAuxLoc: TClientDataSet;
    tabAuxLocValorTotal: TCurrencyField;
    tabAuxLocCodLoc: TFloatField;
    tabAuxLocDescLoc: TStringField;
    tabAuxAbertoCCusto: TStringField;
    tabAuxAbertoResponsavel: TFloatField;
    tabAuxAbertoEmpresa: TFloatField;
    tabAuxAbertoLocalizacao: TFloatField;
    tabAuxAbertoValorDesconto: TCurrencyField;
    tabAuxAbertoValorAcrescimo: TCurrencyField;
    tabAuxAbertoValorCalculado: TCurrencyField;
    tabAuxAbertoFase: TIntegerField;
    qrpResEmp: TQuickRep;
    QRSubDetail2: TQRSubDetail;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText16: TQRDBText;
    QRBand4: TQRBand;
    QRShape3: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRBand6: TQRBand;
    QRLabel20: TQRLabel;
    QRSysData3: TQRSysData;
    QRShape4: TQRShape;
    QRSysData4: TQRSysData;
    tabAuxEmpresa: TClientDataSet;
    tabAuxEmpresaCodEmp: TFloatField;
    tabAuxEmpresaNomeEmp: TStringField;
    tabAuxEmpresaValorTotal: TCurrencyField;
    SummaryBand1: TQRBand;
    qrlTotalReceberEmitidos: TQRLabel;
    SummaryBand2: TQRBand;
    qrlTotalLocEmp: TQRLabel;
    SummaryBand3: TQRBand;
    qrlTotalLocalizacao: TQRLabel;
    SummaryBand4: TQRBand;
    qrlTotalEmpresa: TQRLabel;
    qrcReceberAberto: TQRCompositeReport;
    mmo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail6BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrcReceberAbertoAddReports(Sender: TObject);
    procedure qrcReceberAbertoFinished(Sender: TObject);
    procedure qrpReceberAbertoBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrpResLocEmpBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrpResLocalizacaoBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrpResEmpBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
     procedure GerarImpressao(Impressora: Boolean = False);
  public
  end;

var vValorTotal : real;  

implementation

uses uFormBase, uMenu, uFuncoes, uConstantes, DateUtils;

{$R *.dfm}

procedure TrtReceberAberto.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TrtReceberAberto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabEmpresas.Close;
   tabBase.Close;
   tabAuxAberto.Close;
   tabAuxLocEmp.Close;
   tabAuxLoc.Close;
   tabAuxEmpresa.Close;
   inherited;
end;

procedure TrtReceberAberto.btnVisualizarClick(Sender: TObject);
begin
   inherited;
   GerarImpressao();
end;

procedure TrtReceberAberto.GerarImpressao(Impressora: Boolean = False);
var vWhere : string;
    vCodigoResponsavel: real;
begin
   qrlTitulo.Caption:='Receber Em Aberto';

   vWhere:='titulos_receber.DataPagamento IS NULL';

   tabAuxAberto.EmptyDataSet;
   tabAuxLocEmp.EmptyDataSet;
   tabAuxLoc.EmptyDataSet;
   tabAuxEmpresa.EmptyDataSet;

   tabBase.Close;
   tabBase.SQL.Clear;
   tabBase.SQL.Add('SELECT titulos_receber.DataEmissao, titulos_receber.Documento, titulos_receber.NotaFiscal,');
   tabBase.SQL.Add('titulos_receber.Parcela, titulos_receber.CodigoConta, clientes.NomeFantasia, titulos_receber.ValorTotal,');
   tabBase.SQL.Add('titulos_receber.CodigoEmpresa, titulos_receber.CodigoResponsavel, titulos_receber.CodigoCentroCusto,');
   tabBase.SQL.Add('titulos_receber.CodigoLocalizacao, titulos_receber.ValorDesconto, titulos_receber.ValorAcrescimo, titulos_receber.ValorImposto,');
   tabBase.SQL.Add('titulos_receber.PedidoVenda, titulos_receber.DataVencimento, titulos_receber.DataPagamento,');
   tabBase.SQL.Add('(SELECT SUM(titulos_receber_liquidacoes.ValorLiquida) FROM titulos_receber_liquidacoes WHERE titulos_receber_liquidacoes.Titulo = titulos_receber.Titulo) AS ValorLiquidado');
   tabBase.SQL.Add('FROM titulos_receber');
   tabBase.SQL.Add('LEFT JOIN clientes ON titulos_receber.CodigoConta = clientes.CodigoCliente');

   if Trim(edtEmpresa.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Empresa: '+edtEmpresa.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'titulos_receber.CodigoEmpresa = '+FloatToStr(edtEmpresa.KeyValue);
   end;
   if (Trim(edtDataInicial.Text) <> '/  /') and (Trim(edtDataFinal.Text) <> '/  /') then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Período: '+edtDataInicial.Text+ ' a '+edtDataFinal.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'titulos_receber.DataVencimento >= '+QuotedStr(FormatDateTime(sis_date_format, edtDataInicial.Date))+' AND '+
                       'titulos_receber.DataVencimento <= '+QuotedStr(FormatDateTime(sis_date_format, edtDataFinal.Date));
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

      if tabBase.FieldByName('PedidoVenda').AsInteger = 1 then begin
         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT DataEntrega,CodigoFuncionario FROM pedidos');
            tabChecagens.SQL.Add('WHERE NPedido = '+FloatToStr(tabBase.FieldByName('Documento').AsFloat));
            tabChecagens.SQL.Add('AND CodigoCliente = '+FloatToStr(tabBase.FieldByName('CodigoConta').AsFloat));
            tabChecagens.Open;
            if tabChecagens.RecordCount > 0 then begin

               vCodigoResponsavel:=tabChecagens.FieldByName('CodigoFuncionario').AsFloat;

               if tabChecagens.FieldByName('DataEntrega').IsNull then begin
                  tabBase.Next;
                  Continue;
               end;
            end;
         finally
            tabChecagens.Close;
         end;
      end;

      tabAuxAberto.Append;
      tabAuxAbertoEmissao.Value:=tabBase.FieldByName('DataEmissao').AsDateTime;
      tabAuxAbertoDocumento.Value:=tabBase.FieldByName('Documento').AsFloat;
      tabAuxAbertoNotaFiscal.Value:=tabBase.FieldByName('NotaFiscal').AsString;
      tabAuxAbertoParcela.Value:=tabBase.FieldByName('Parcela').AsInteger;
      tabAuxAbertoCodigoConta.Value:=tabBase.FieldByName('CodigoConta').asFloat;
      tabAuxAbertoNomeFantasia.Value:=tabBase.FieldByName('NomeFantasia').AsString;
      tabAuxAbertoValorTitulo.Value:=tabBase.FieldByName('ValorTotal').AsFloat;
      tabAuxAbertoValorLiquidado.Value:=tabBase.FieldByName('ValorLiquidado').AsFloat;
      tabAuxAbertoCCusto.Value:=tabBase.FieldByName('CodigoCentroCusto').AsString;
      tabAuxAbertoLocalizacao.Value:=tabBase.FieldByName('CodigoLocalizacao').AsFloat;
      tabAuxAbertoEmpresa.Value:=tabBase.FieldByName('CodigoEmpresa').AsFloat;
      tabAuxAbertoResponsavel.Value:=vCodigoResponsavel;
      tabAuxAbertoPedidoVenda.Value:=tabBase.FieldByName('PedidoVenda').AsInteger;
      tabAuxAbertoData.Value:=tabBase.FieldByName('DataVencimento').AsDateTime;
      tabAuxAbertoValorDesconto.Value:=tabBase.FieldByName('ValorDesconto').AsFloat;
      tabAuxAbertoValorAcrescimo.Value:=tabBase.FieldByName('ValorAcrescimo').AsFloat + tabBase.FieldByName('ValorImposto').AsFloat;
      tabAuxAbertoValorCalculado.Value:=((tabAuxAbertoValorTitulo.Value-tabAuxAbertoValorDesconto.Value)+tabAuxAbertoValorAcrescimo.Value)-tabAuxAbertoValorLiquidado.Value;

      if tabAuxAbertoEmissao.Value < edtDataInicial.Date then begin
         tabAuxAbertoFase.Value:=1;
       end
      else begin
         tabAuxAbertoFase.Value:=2;
      end;

      tabAuxAberto.Post;

      // --

      if tabAuxLocEmp.FindKey([tabAuxAbertoLocalizacao.Value, tabAuxAbertoEmpresa.Value]) then begin
         tabAuxLocEmp.Edit;
         tabAuxLocEmpValorTotal.Value:=tabAuxLocEmpValorTotal.Value         + tabAuxAbertoValorCalculado.Value;
       end
      else begin
         tabAuxLocEmp.Append;
         tabAuxLocEmpCodEmp.Value:=tabAuxAbertoEmpresa.Value;
         tabAuxLocEmpCodLoc.Value:=tabAuxAbertoLocalizacao.Value;
         tabAuxLocEmpValorTotal.Value:=tabAuxAbertoValorCalculado.Value;

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

      if tabAuxLoc.FindKey([tabAuxAbertoLocalizacao.Value]) then begin
         tabAuxLoc.Edit;
         tabAuxLocValorTotal.Value:=tabAuxLocValorTotal.Value         + tabAuxAbertoValorCalculado.Value;
       end
      else begin
         tabAuxLoc.Append;
         tabAuxLocCodLoc.Value:=tabAuxAbertoLocalizacao.Value;
         tabAuxLocValorTotal.Value:=tabAuxAbertoValorCalculado.Value;

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

      // --

      if tabAuxEmpresa.FindKey([tabAuxAbertoEmpresa.Value]) then begin
         tabAuxEmpresa.Edit;
         tabAuxEmpresaValorTotal.Value:=tabAuxEmpresaValorTotal.Value + tabAuxAbertoValorCalculado.Value;
       end
      else begin
         tabAuxEmpresa.Append;
         tabAuxEmpresaCodEmp.Value:=tabAuxAbertoEmpresa.Value;
         tabAuxEmpresaValorTotal.Value:=tabAuxAbertoValorCalculado.Value;

         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT NomeFantasia FROM empresas WHERE CodigoEmpresa = '+FloatToStr(tabAuxEmpresaCodEmp.Value));
            tabChecagens.Open;
            if tabChecagens.RecordCount > 0 then begin
               tabAuxEmpresaNomeEmp.Value:=tabChecagens.FieldByName('NomeFantasia').AsString;
            end;
         finally
            tabChecagens.Close;
         end;
      end;

      tabAuxEmpresa.Post;

      // --

      tabBase.Next;
   end;

   gagProgresso.Progress:=0;

   vValorTotal:=0;

   case rdgOrdemEmissao.ItemIndex of
      0: tabAuxAberto.IndexFieldNames:='Fase;CCusto;Data';
      1: tabAuxAberto.IndexFieldNames:='Fase;Data';
   end;

   if Impressora = True then begin
      if pndDialogo.Execute then begin
         qrcReceberAberto.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
         qrcReceberAberto.Print;
      end;
    end
   else begin
      qrcReceberAberto.Preview;
   end;

   mmo1.Text := tabBase.SQL.Text;
end;

procedure TrtReceberAberto.btnImprimirClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(True);
end;

procedure TrtReceberAberto.FormShow(Sender: TObject);
begin
   inherited;

   edtDataInicial.Date:=StartOfTheMonth(Date);
   edtDataFinal.Date:=EndOfTheMonth(Date);

   tabEmpresas.SQL.Add('SELECT * FROM empresas ORDER BY NomeFantasia');
   tabEmpresas.Open;

   tabAuxAberto.CreateDataSet;
   tabAuxAberto.EmptyDataSet;

   tabAuxLocEmp.CreateDataSet;
   tabAuxLocEmp.EmptyDataSet;
   tabAuxLocEmp.IndexFieldNames:='CodLoc;CodEmp';

   tabAuxLoc.CreateDataSet;
   tabAuxLoc.EmptyDataSet;
   tabAuxLoc.IndexFieldNames:='CodLoc';

   tabAuxEmpresa.CreateDataSet;
   tabAuxEmpresa.EmptyDataSet;
   tabAuxEmpresa.IndexFieldNames:='CodEmp';
end;

procedure TrtReceberAberto.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   inherited;
   vValorTotal:=vValorTotal + tabAuxAbertoValorCalculado.Value;
   qrlTotalReceberEmitidos.Caption:='Valor Total: '+FormatFloat(sis_curr_format, vValorTotal);
end;

procedure TrtReceberAberto.QRSubDetail6BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   inherited;
   vValorTotal:=vValorTotal         + tabAuxLocValorTotal.Value;
   qrlTotalLocalizacao.Caption:='Valor Total: '+FormatFloat(sis_curr_format, vValorTotal);
end;

procedure TrtReceberAberto.QRSubDetail3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   inherited;
   vValorTotal:=vValorTotal + tabAuxLocEmpValorTotal.Value;
   qrlTotalLocEmp.Caption:='Valor Total: '+FormatFloat(sis_curr_format, vValorTotal);
end;

procedure TrtReceberAberto.QRSubDetail2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   inherited;
   vValorTotal:=vValorTotal + tabAuxEmpresaValorTotal.Value;
   qrlTotalEmpresa.Caption:='Valor Total: '+FormatFloat(sis_curr_format, vValorTotal);
end;

procedure TrtReceberAberto.qrcReceberAbertoAddReports(Sender: TObject);
begin
   inherited;
   qrcReceberAberto.Reports.Add(qrpReceberAberto);
   qrcReceberAberto.Reports.Add(qrpResLocEmp);
   qrcReceberAberto.Reports.Add(qrpResLocalizacao);
   qrcReceberAberto.Reports.Add(qrpResEmp);
end;

procedure TrtReceberAberto.qrcReceberAbertoFinished(Sender: TObject);
begin
   inherited;
   vValorTotal:=0;
end;

procedure TrtReceberAberto.qrpReceberAbertoBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   inherited;
   vValorTotal:=0;
end;

procedure TrtReceberAberto.qrpResLocEmpBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   inherited;
   vValorTotal:=0;
end;

procedure TrtReceberAberto.qrpResLocalizacaoBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   inherited;
   vValorTotal:=0;
end;

procedure TrtReceberAberto.qrpResEmpBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   inherited;
   vValorTotal:=0;
end;

end.

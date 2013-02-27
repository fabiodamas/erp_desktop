unit rPagarAberto;

interface 

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls, ToolEdit, Gauges;

type
  TrtPagarAberto = class(TfmFormBaseRelatorio)
    tabBase: TZQuery;
    pndDialogo: TPrintDialog;
    qrpPagarAberto: TQuickRep;
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
    QRLabel9: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    Label3: TLabel;
    Label4: TLabel;
    edtDataInicial: TDateEdit;
    edtDataFinal: TDateEdit;
    QRDBText8: TQRDBText;
    QRDBText11: TQRDBText;
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
    tabAuxAbertoPedidoVenda: TIntegerField;
    qrlTotalPagarEmitidos: TQRLabel;
    tabAuxAbertoCCusto: TStringField;
    tabAuxAbertoResponsavel: TFloatField;
    tabAuxAbertoEmpresa: TFloatField;
    tabAuxAbertoLocalizacao: TFloatField;
    tabAuxAbertoValorDesconto: TCurrencyField;
    tabAuxAbertoValorAcrescimo: TCurrencyField;
    tabAuxAbertoValorCalculado: TCurrencyField;
    tabAuxAbertoFase: TIntegerField;
    tabFornecedor: TZQuery;
    tabFuncionario: TZQuery;
    tabTransportadoras: TZQuery;
    tabBancosRel: TZQuery;
    dtsBase: TDataSource;
    qrpResCCEmp: TQuickRep;
    QRSubDetail2: TQRSubDetail;
    QRDBText12: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRBand4: TQRBand;
    QRShape3: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel19: TQRLabel;
    QRBand6: TQRBand;
    QRLabel24: TQRLabel;
    QRSysData3: TQRSysData;
    QRShape4: TQRShape;
    QRSysData4: TQRSysData;
    tabAuxCCEmp: TClientDataSet;
    tabAuxCCEmpCodCC: TStringField;
    tabAuxCCEmpDescCC: TStringField;
    tabAuxCCEmpTotalAberto: TCurrencyField;
    tabAuxCCEmpCodEmp: TFloatField;
    tabAuxCCEmpDescEmp: TStringField;
    qrpResCC: TQuickRep;
    QRSubDetail3: TQRSubDetail;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText19: TQRDBText;
    QRBand7: TQRBand;
    QRShape5: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRBand9: TQRBand;
    QRLabel20: TQRLabel;
    QRSysData5: TQRSysData;
    QRShape6: TQRShape;
    QRSysData6: TQRSysData;
    tabAuxCC: TClientDataSet;
    tabAuxCCCodCC: TStringField;
    tabAuxCCDescCC: TStringField;
    tabAuxCCTotalAberto: TCurrencyField;
    qrpResEmp: TQuickRep;
    QRSubDetail4: TQRSubDetail;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRBand10: TQRBand;
    QRShape7: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRBand12: TQRBand;
    QRLabel23: TQRLabel;
    QRSysData7: TQRSysData;
    QRShape8: TQRShape;
    QRSysData8: TQRSysData;
    tabAuxEmp: TClientDataSet;
    tabAuxEmpTotalAberto: TCurrencyField;
    tabAuxEmpCodEmp: TFloatField;
    tabAuxEmpNomeEmp: TStringField;
    SummaryBand1: TQRBand;
    qrlTotalCCEmp: TQRLabel;
    SummaryBand2: TQRBand;
    qrlTotalCC: TQRLabel;
    SummaryBand3: TQRBand;
    qrlTotalEmp: TQRLabel;
    qrcPagarAberto: TQRCompositeReport;
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
    procedure qrcPagarAbertoAddReports(Sender: TObject);
    procedure qrcPagarAbertoFinished(Sender: TObject);
    procedure qrpPagarAbertoBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrpResCCEmpBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrpResCCBeforePrint(Sender: TCustomQuickRep;
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

procedure TrtPagarAberto.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TrtPagarAberto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabEmpresas.Close;
   tabBase.Close;
   tabAuxAberto.Close;
   tabFornecedor.Close;
   tabFuncionario.Close;
   tabTransportadoras.Close;
   tabBancosRel.Close;
   tabAuxCCEmp.Close;
   tabAuxCC.Close;
   tabAuxEmp.Close;
   inherited;
end;

procedure TrtPagarAberto.btnVisualizarClick(Sender: TObject);
begin
   inherited;
   GerarImpressao();
end;

procedure TrtPagarAberto.GerarImpressao(Impressora: Boolean = False);
var vWhere : string;
begin
   qrlTitulo.Caption:='Pagar Em Aberto';

   vWhere:='titulos_pagar.DataPagamento IS NULL';

   tabAuxAberto.EmptyDataSet;
   tabAuxCCEmp.EmptyDataSet;
   tabAuxCC.EmptyDataSet;
   tabAuxEmp.EmptyDataSet;

   tabBase.Close;
   tabBase.SQL.Clear;

   tabBase.SQL.Add('SELECT titulos_pagar.DataEmissao, titulos_pagar.Documento, titulos_pagar.NotaFiscal,');
   tabBase.SQL.Add('titulos_pagar.Parcela, titulos_pagar.CodigoConta, titulos_pagar.ValorTotal, titulos_pagar.TipoConta,');
   tabBase.SQL.Add('titulos_pagar.CodigoEmpresa, titulos_pagar.CodigoResponsavel, titulos_pagar.CodigoCentroCusto,');
   tabBase.SQL.Add('titulos_pagar.CodigoLocalizacao, titulos_pagar.ValorDesconto, titulos_pagar.ValorAcrescimo,');
   tabBase.SQL.Add('titulos_pagar.DataVencimento, titulos_pagar.DataPagamento,');
   tabBase.SQL.Add('(SELECT SUM(titulos_pagar_liquidacoes.ValorLiquida) FROM titulos_pagar_liquidacoes WHERE titulos_pagar_liquidacoes.Titulo = titulos_pagar.Titulo) AS ValorLiquidado');
   tabBase.SQL.Add('FROM titulos_pagar');

   if Trim(edtEmpresa.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Empresa: '+ edtEmpresa.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'titulos_pagar.CodigoEmpresa = '+FloatToStr(edtEmpresa.KeyValue);
   end;
   if (Trim(edtDataInicial.Text) <> '/  /') and (Trim(edtDataFinal.Text) <> '/  /') then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Período: '+ edtDataInicial.Text + ' a '+ edtDataFinal.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'titulos_pagar.DataVencimento >= '+QuotedStr(FormatDateTime(sis_date_format, edtDataInicial.Date))+' AND '+
                       'titulos_pagar.DataVencimento <= '+QuotedStr(FormatDateTime(sis_date_format, edtDataFinal.Date));
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

      tabAuxAberto.Append;
      tabAuxAbertoEmissao.Value:=tabBase.FieldByName('DataEmissao').AsDateTime;
      tabAuxAbertoDocumento.Value:=tabBase.FieldByName('Documento').AsFloat;
      tabAuxAbertoNotaFiscal.Value:=tabBase.FieldByName('NotaFiscal').AsString;
      tabAuxAbertoParcela.Value:=tabBase.FieldByName('Parcela').AsInteger;
      tabAuxAbertoCodigoConta.Value:=tabBase.FieldByName('CodigoConta').asFloat;
      tabAuxAbertoValorTitulo.Value:=tabBase.FieldByName('ValorTotal').AsFloat;
      tabAuxAbertoValorLiquidado.Value:=tabBase.FieldByName('ValorLiquidado').AsFloat;
      tabAuxAbertoCCusto.Value:=tabBase.FieldByName('CodigoCentroCusto').AsString;
      tabAuxAbertoLocalizacao.Value:=tabBase.FieldByName('CodigoLocalizacao').AsFloat;
      tabAuxAbertoEmpresa.Value:=tabBase.FieldByName('CodigoEmpresa').AsFloat;
      tabAuxAbertoResponsavel.Value:=tabBase.FieldByName('CodigoResponsavel').AsFloat;
      tabAuxAbertoData.Value:=tabBase.FieldByName('DataVencimento').AsDateTime;
      tabAuxAbertoValorDesconto.Value:=tabBase.FieldByName('ValorDesconto').AsFloat;
      tabAuxAbertoValorAcrescimo.Value:=tabBase.FieldByName('ValorAcrescimo').AsFloat;
      tabAuxAbertoValorCalculado.Value:=((tabAuxAbertoValorTitulo.Value-tabAuxAbertoValorDesconto.Value)+tabAuxAbertoValorAcrescimo.Value)-tabAuxAbertoValorLiquidado.Value;

      if tabBase.FieldByName('TipoConta').AsString = '1' then begin
         // fornecedor
         tabAuxAbertoNomeFantasia.Value:=tabFornecedor.FieldByName('NomeFantasia').AsString;
       end
      else if tabBase.FieldByName('TipoConta').AsString = '2' then begin
         // funcionario
         tabAuxAbertoNomeFantasia.Value:=tabFuncionario.FieldByName('Nome').AsString;
       end
      else if tabBase.FieldByName('TipoConta').AsString = '3' then begin
         // transportadora
         tabAuxAbertoNomeFantasia.Value:=tabTransportadoras.FieldByName('Nome').AsString;
       end
      else if tabBase.FieldByName('TipoConta').AsString = '4' then begin
         // banco
         tabAuxAbertoNomeFantasia.Value:=tabBancosRel.FieldByName('Descricao').AsString;
      end;

      if tabAuxAbertoEmissao.Value < edtDataInicial.Date then begin
         tabAuxAbertoFase.Value:=1;
       end
      else begin
         tabAuxAbertoFase.Value:=2;
      end;

      tabAuxAberto.Post;

      if tabAuxCCEmp.FindKey([tabAuxAbertoEmpresa.Value, tabAuxAbertoCCusto.Value]) then begin
         tabAuxCCEmp.Edit;
         tabAuxCCEmpTotalAberto.Value:=tabAuxCCEmpTotalAberto.Value + tabAuxAbertoValorCalculado.Value;
       end
      else begin
         tabAuxCCEmp.Append;
         tabAuxCCEmpCodCC.Value:=tabAuxAbertoCCusto.Value;
         tabAuxCCEmpCodEmp.Value:=tabAuxAbertoEmpresa.Value;
         tabAuxCCEmpTotalAberto.Value:=tabAuxAbertoValorCalculado.Value;

         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT Descricao FROM centro_custo WHERE Codigo = '+QuotedStr(tabAuxCCEmpCodCC.Value));
            tabChecagens.Open;
            tabAuxCCEmpDescCC.Value:=tabChecagens.FieldByName('Descricao').AsString;
         finally
            tabChecagens.Close;
         end;

         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT NomeFantasia FROM empresas WHERE CodigoEmpresa = '+FloatToStr(tabAuxCCEmpCodEmp.Value));
            tabChecagens.Open;
            tabAuxCCEmpDescEmp.Value:=tabChecagens.FieldByName('NomeFantasia').AsString;  
         finally 
            tabChecagens.Close;
         end;

      end;

      tabAuxCCEmp.Post;

      // --

      if tabAuxCC.FindKey([tabAuxAbertoCCusto.Value]) then begin
         tabAuxCC.Edit;
         tabAuxCCTotalAberto.Value:=tabAuxCCTotalAberto.Value + tabAuxAbertoValorCalculado.Value;
       end
      else begin
         tabAuxCC.Append;
         tabAuxCCCodCC.Value:=tabAuxAbertoCCusto.Value;
         tabAuxCCTotalAberto.Value:=tabAuxAbertoValorCalculado.Value;

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

      if tabAuxEmp.FindKey([tabAuxAbertoEmpresa.Value]) then begin
         tabAuxEmp.Edit;
         tabAuxEmpTotalAberto.Value:=tabAuxEmpTotalAberto.Value + tabAuxAbertoValorCalculado.Value;
       end
      else begin
         tabAuxEmp.Append;
         tabAuxEmpCodEmp.Value:=tabAuxAbertoEmpresa.Value;
         tabAuxEmpTotalAberto.Value:=tabAuxAbertoValorCalculado.Value;

         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT NomeFantasia FROM empresas WHERE CodigoEmpresa = '+FloatToStr(tabAuxEmpCodEmp.Value));
            tabChecagens.Open;
            tabAuxEmpNomeEmp.Value:=tabChecagens.FieldByName('NomeFantasia').AsString;
         finally
            tabChecagens.Close;
         end;

      end;

      tabAuxEmp.Post;

      tabBase.Next;
   end;

   gagProgresso.Progress:=0;

   vValorTotal:=0; 

   case rdgOrdemEmissao.ItemIndex of
      0: tabAuxAberto.IndexFieldNames:='Emissao;Data;Parcela';
      1: tabAuxAberto.IndexFieldNames:='Emissao;CCusto;Data';
   end;

   if Impressora = True then begin
      if pndDialogo.Execute then begin
         qrcPagarAberto.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
         qrcPagarAberto.Print;
      end;
    end
   else begin
      qrcPagarAberto.Preview;
   end;   
end;

procedure TrtPagarAberto.btnImprimirClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(True); 
end;

procedure TrtPagarAberto.FormShow(Sender: TObject);
begin
   inherited; 

   edtDataInicial.Date:=StartOfTheMonth(Date); 
   edtDataFinal.Date:=EndOfTheMonth(Date);

   tabEmpresas.SQL.Add('SELECT * FROM empresas ORDER BY NomeFantasia');
   tabEmpresas.Open;

   tabAuxAberto.CreateDataSet;
   tabAuxAberto.EmptyDataSet;

   tabAuxCCEmp.CreateDataSet;
   tabAuxCCEmp.EmptyDataSet;
   tabAuxCCEmp.IndexFieldNames:='CodEmp;CodCC';

   tabAuxCC.CreateDataSet;
   tabAuxCC.EmptyDataSet;
   tabAuxCC.IndexFieldNames:='CodCC';

   tabAuxEmp.CreateDataSet;
   tabAuxEmp.EmptyDataSet;
   tabAuxEmp.IndexFieldNames:='CodEmp';

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
end;

procedure TrtPagarAberto.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   inherited;
   vValorTotal:=vValorTotal + tabAuxAbertoValorCalculado.Value;
   qrlTotalPagarEmitidos.Caption:='Valor Total: '+FormatFloat(sis_curr_format, vValorTotal);
end;

procedure TrtPagarAberto.dtsBaseDataChange(Sender: TObject; Field: TField);
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
      tabBancosRel.Open;
      tabBancosRel.ParamByName('CodigoBanco').AsFloat:=tabBase.FieldByName('CodigoConta').AsFloat;
      tabBancosRel.Open;
   end;
end; 

procedure TrtPagarAberto.QRSubDetail2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   inherited;
   vValorTotal:=vValorTotal + tabAuxCCEmpTotalAberto.Value;
   qrlTotalCCEmp.Caption:='Total em Aberto: '+FormatFloat(sis_curr_format, vValorTotal);
end;

procedure TrtPagarAberto.QRSubDetail3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   inherited;
   vValorTotal:=vValorTotal + tabAuxCCTotalAberto.Value;
   qrlTotalCC.Caption:='Total em Aberto: '+FormatFloat(sis_curr_format, vValorTotal);
end;

procedure TrtPagarAberto.QRSubDetail4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   inherited;
   vValorTotal:=vValorTotal + tabAuxEmpTotalAberto.Value;
   qrlTotalEmp.Caption:='Total em Aberto: '+FormatFloat(sis_curr_format, vValorTotal);
end;

procedure TrtPagarAberto.qrcPagarAbertoAddReports(Sender: TObject);
begin
   inherited;
   qrcPagarAberto.Reports.Add(qrpPagarAberto);
   qrcPagarAberto.Reports.Add(qrpResCCEmp);
   qrcPagarAberto.Reports.Add(qrpResCC);
   qrcPagarAberto.Reports.Add(qrpResEmp);
end;

procedure TrtPagarAberto.qrcPagarAbertoFinished(Sender: TObject);
begin
   inherited;
   vValorTotal:=0;
end;

procedure TrtPagarAberto.qrpPagarAbertoBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   inherited;
   vValorTotal:=0;
end;

procedure TrtPagarAberto.qrpResCCEmpBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   inherited;
   vValorTotal:=0;
end;

procedure TrtPagarAberto.qrpResCCBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   inherited;
   vValorTotal:=0;
end;

procedure TrtPagarAberto.qrpResEmpBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   inherited;
   vValorTotal:=0;
end;

end.

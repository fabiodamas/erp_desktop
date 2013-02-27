unit uDanfe;

interface 

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, ToolEdit, Buttons, Gauges, Mask,
  DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QRCtrls,
  QuickRpt, ExtCtrls, xmldom, XMLIntf, msxmldom, XMLDoc, QRPDFFilter,
  qrBarcode, Menus, ACBrNFe, pcnConversao, Printers;

type
  TfmDanfe = class(TfmFormBaseAvancado)
    qrpDanfe: TQuickRep;
    QRSubDetail1: TQRSubDetail;
    QRLabel64: TQRLabel;
    QRDBText37: TQRDBText;
    QRLabel18: TQRLabel;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRLabel31: TQRLabel;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRLabel32: TQRLabel;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRLabel33: TQRLabel;
    QRShape37: TQRShape;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRShape54: TQRShape;
    QRShape55: TQRShape;
    QRLabel71: TQRLabel;
    QRShape56: TQRShape;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRShape65: TQRShape;
    QRShape66: TQRShape;
    QRShape67: TQRShape;
    QRShape68: TQRShape;
    QRShape69: TQRShape;
    QRShape70: TQRShape;
    QRShape71: TQRShape;
    QRShape72: TQRShape;
    QRShape73: TQRShape;
    QRShape74: TQRShape;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    QRDBText47: TQRDBText;
    QRDBText48: TQRDBText;
    QRDBText49: TQRDBText;
    QRDBText50: TQRDBText;
    QRShape101: TQRShape;
    QRShape102: TQRShape;
    QRShape103: TQRShape;
    QRShape104: TQRShape;
    QRShape105: TQRShape;
    QRShape106: TQRShape;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    qrsProdutos: TQRSubDetail;
    qrdCodigoProduto: TQRDBText;
    qrdProduto: TQRDBText;
    qrdNCM: TQRDBText;
    qrdCST: TQRDBText;
    QRDBText55: TQRDBText;
    QRDBText56: TQRDBText;
    QRDBText57: TQRDBText;
    QRDBText58: TQRDBText;
    QRDBText59: TQRDBText;
    QRDBText60: TQRDBText;
    QRDBText61: TQRDBText;
    QRDBText62: TQRDBText;
    QRDBText63: TQRDBText;
    QRDBText64: TQRDBText;
    tabDanfe: TClientDataSet;
    dtsDanfe: TDataSource;
    tabDanfeProdutos: TClientDataSet;
    QRShape1: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel81: TQRLabel;
    QRShape108: TQRShape;
    QRLabel82: TQRLabel;
    QRShape107: TQRShape;
    QRLabel87: TQRLabel;
    QRShape61: TQRShape;
    QRLabel88: TQRLabel;
    QRShape111: TQRShape;
    QRLabel90: TQRLabel;
    QRShape112: TQRShape;
    QRLabel91: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRShape114: TQRShape;
    QRShape75: TQRShape;
    QRShape113: TQRShape;
    QRDBText52: TQRDBText;
    QRDBText71: TQRDBText;
    QRDBText72: TQRDBText;
    QRDBText73: TQRDBText;
    QRDBText74: TQRDBText;
    QRDBText75: TQRDBText;
    QRDBText76: TQRDBText;
    QRDBText77: TQRDBText;
    QRDBText78: TQRDBText;
    QRDBText79: TQRDBText;
    QRDBText80: TQRDBText;
    QRDBText81: TQRDBText;
    QRDBText82: TQRDBText;
    QRDBText83: TQRDBText;
    QRDBText84: TQRDBText;
    QRDBText85: TQRDBText;
    QRDBText86: TQRDBText;
    QRDBText87: TQRDBText;
    tabDanfeNumeroNota: TStringField;
    tabDanfeNatOp: TStringField;
    tabDanfeTipoNF: TStringField;
    tabDanfeEmitRazao: TStringField;
    tabDanfeEmitFantasia: TStringField;
    tabDanfeEmitCNPJ: TStringField;
    tabDanfeEmitLgr: TStringField;
    tabDanfeEmitNro: TStringField;
    tabDanfeChaveAcesso: TStringField;
    tabDanfeChaveAcessoFmt: TStringField;
    tabDanfeProtocoloAutorizacao: TStringField;
    tabDanfeNumeroNotaFmt: TStringField;
    tabDanfeSerieNota: TStringField;
    tabDanfeEmissao: TStringField;
    tabDanfeEmitIE: TStringField;
    tabDanfeEmitIM: TStringField;
    tabDanfeRecebemos: TStringField;
    tabDanfeEmitFone: TStringField;
    tabDanfeEmitEndCompleto: TStringField;
    tabDanfeDestCNPJCPF: TStringField;
    tabDanfeDestRazao: TStringField;
    tabDanfeDestEmail: TStringField;
    tabDanfeDestEndereco: TStringField;
    tabDanfeDestBairro: TStringField;
    tabDanfeDestCep: TStringField;
    tabDanfeDestCidade: TStringField;
    tabDanfeDestUF: TStringField;
    tabDanfeDestFone: TStringField;
    tabDanfeDestIE: TStringField;
    tabDanfeValorBC: TCurrencyField;
    tabDanfeValorICMS: TCurrencyField;
    tabDanfeValorBCST: TCurrencyField;
    tabDanfeValorST: TCurrencyField;
    tabDanfeValorProdutos: TCurrencyField;
    tabDanfeValorFrete: TCurrencyField;
    tabDanfeValorSeguro: TCurrencyField;
    tabDanfeValorDesconto: TCurrencyField;
    tabDanfeValorII: TCurrencyField;
    tabDanfeValorIPI: TCurrencyField;
    tabDanfeValorPIS: TCurrencyField;
    tabDanfeValorCOFINS: TCurrencyField;
    tabDanfeValorODA: TCurrencyField;
    tabDanfeValorTotalNF: TCurrencyField;
    tabDanfeValorTotalServico: TCurrencyField;
    tabDanfeValorBCISSQN: TCurrencyField;
    tabDanfeValorTotalISSQN: TCurrencyField;
    tabDanfeTranspFreteConta: TStringField;
    tabDanfeTranspRazao: TStringField;
    tabDanfeTranspCNPJ: TStringField;
    tabDanfeTranspEndereco: TStringField;
    tabDanfeTranspCidade: TStringField;
    tabDanfeTranspUF: TStringField;
    tabDanfeTranspIE: TStringField;
    tabDanfeVolEspecie: TStringField;
    tabDanfeVolMarca: TStringField;
    tabDanfeVolQuantidade: TIntegerField;
    tabDanfeVolNumeracao: TStringField;
    tabDanfeInfCpl: TMemoField;
    tabDanfeInfAdFisco: TMemoField;
    tabDanfeProdutosCodigoProduto: TStringField;
    tabDanfeProdutosDescricao: TStringField;
    tabDanfeProdutosNCM: TStringField;
    tabDanfeProdutosCFOP: TStringField;
    tabDanfeProdutosUN: TStringField;
    tabDanfeTranspCodigoANTT: TStringField;
    tabDanfeTranspPlacaVeic: TStringField;
    tabDanfeTranspPlacaUF: TStringField;
    tabDanfeProdutosBCICMS: TFloatField;
    tabDanfeProdutosValorICMS: TCurrencyField;
    tabDanfeProdutosValorIPI: TCurrencyField;
    tabDanfeProdutosAliICMS: TFloatField;
    tabDanfeProdutosAliqIPI: TFloatField;
    tabDanfeProdutosCST: TStringField;
    tabDanfeFatNum1: TStringField;
    tabDanfeFatNum2: TStringField;
    tabDanfeFatNum3: TStringField;
    tabDanfeFatNum4: TStringField;
    tabDanfeFatNum5: TStringField;
    tabDanfeFatNum6: TStringField;
    tabDanfeFatValor1: TStringField;
    tabDanfeFatValor2: TStringField;
    tabDanfeFatValor3: TStringField;
    tabDanfeFatValor4: TStringField;
    tabDanfeFatValor5: TStringField;
    tabDanfeFatValor6: TStringField;
    tabDanfeFatVencto1: TStringField;
    tabDanfeFatVencto2: TStringField;
    tabDanfeFatVencto3: TStringField;
    tabDanfeFatVencto4: TStringField;
    tabDanfeFatVencto5: TStringField;
    tabDanfeFatvencto6: TStringField;
    tabDanfeProdutosChaveAcesso: TStringField;
    btnVisualizar: TBitBtn;
    btnImprimir: TBitBtn;
    btnFechar: TBitBtn;
    btnEmail: TBitBtn;
    tabDanfeVolPesoL: TStringField;
    tabDanfeVolPesoB: TStringField;
    tabDanfeProdutosQuantidade: TStringField;
    tabDanfeProdutosValorUnitario: TStringField;
    tabDanfeProdutosValorProdutos: TStringField;
    QRBand1: TQRBand;
    QRShape6: TQRShape;
    qriLogoDanfe: TQRImage;
    QRShape12: TQRShape;
    QRLabel6: TQRLabel;
    QRShape8: TQRShape;
    QRLabel89: TQRLabel;
    qrsCodigoBarras: TQRAsBarcode;
    QRLabel2: TQRLabel;
    QRShape9: TQRShape;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    qrlPagina: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape13: TQRShape;
    QRDBText6: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText10: TQRDBText;
    QRShape10: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel14: TQRLabel;
    QRShape99: TQRShape;
    QRShape16: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText13: TQRDBText;
    QRShape15: TQRShape;
    QRLabel5: TQRLabel;
    QRShape11: TQRShape;
    QRShape100: TQRShape;
    QRShape7: TQRShape;
    QRShape14: TQRShape;
    qrdRecebemos: TQRDBText;
    QRShape4: TQRShape;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel12: TQRLabel;
    QRShape97: TQRShape;
    QRLabel11: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRShape98: TQRShape;
    qrsDiv3: TQRShape;
    qrsDiv2: TQRShape;
    qrsDiv1: TQRShape;
    qrsDiv4: TQRShape;
    qrsDiv5: TQRShape;
    qrsDiv6: TQRShape;
    qrsDiv7: TQRShape;
    qrsDiv8: TQRShape;
    qrsDiv9: TQRShape;
    qrsDiv10: TQRShape;
    qrsDiv11: TQRShape;
    qrsDiv12: TQRShape;
    qrsDiv13: TQRShape;
    qrsDiv14: TQRShape;
    qrsDiv15: TQRShape;
    qrbISSQNDadosAd: TQRBand;
    QRLabel77: TQRLabel;
    QRLabel83: TQRLabel;
    QRDBText65: TQRDBText;
    QRLabel84: TQRLabel;
    QRDBText66: TQRDBText;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRDBText69: TQRDBText;
    QRLabel80: TQRLabel;
    QRDBText70: TQRDBText;
    QRDBText67: TQRDBText;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRDBText68: TQRDBText;
    QRShape96: TQRShape;
    QRShape95: TQRShape;
    QRShape94: TQRShape;
    QRShape115: TQRShape;
    QRShape87: TQRShape;
    QRShape88: TQRShape;
    QRShape91: TQRShape;
    QRShape89: TQRShape;
    QRShape90: TQRShape;
    QRShape93: TQRShape;
    QRShape116: TQRShape;
    QRShape92: TQRShape;
    QRLabel95: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape38: TQRShape;
    tabDanfeInfoCplCont: TMemoField;
    QRShape119: TQRShape;
    QRShape120: TQRShape;
    pndDialogo: TPrintDialog;
    tabDanfeCodigoConta: TFloatField;
    tabDanfeTipoTela: TIntegerField;
    tabConfigPropri: TZQuery;
    tabDanfeXML: TBlobField;
    gagProgresso: TGauge;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrpDanfeBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrbISSQNDadosAdBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure qrsProdutosBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    FChaveNFe: string;
    FPagina, FTotalPaginas: Integer;
  public
    procedure PrepararDanfe(pACBrNFe: TACBrNFe);
  end;

var
  fmDanfe: TfmDanfe;
  vImprime : string;

implementation

uses uFormBase, uFuncoes, uConstantes, ACBrNFeNotasFiscais, pcnNFe;

{$R *.dfm}

procedure TfmDanfe.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsNormal);
end;

procedure TfmDanfe.btnFecharClick(Sender: TObject);
begin
   inherited;
   Close;
end;

procedure TfmDanfe.PrepararDanfe(pACBrNFe: TACBrNFe);
var vCnt, vCntDet, vCntDup : Integer;
    vTMS : TStringStream;
begin
   vImprime:='Imprimir';

   if not tabDanfe.Active then begin
      tabDanfe.CreateDataSet;
      tabDanfeProdutos.CreateDataSet;
   end;

   tabDanfe.EmptyDataSet;
   tabDanfeProdutos.EmptyDataSet;

   for vCnt:=0 to (pACBrNFe.NotasFiscais.Count-1) do begin
      if pACBrNFe.NotasFiscais.Items[vCnt].NFe.procNFe.cStat = 100 then begin 
         tabDanfe.Append;
         tabDanfeChaveAcesso.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.procNFe.chNFe;
         tabDanfeChaveAcessoFmt.Value:=Copy(tabDanfeChaveAcesso.Value, 1, 4)+' '+Copy(tabDanfeChaveAcesso.Value, 5, 4)+' '+Copy(tabDanfeChaveAcesso.Value, 9, 4)+' '+Copy(tabDanfeChaveAcesso.Value, 13, 4)+' '+Copy(tabDanfeChaveAcesso.Value, 17, 4)+' '+Copy(tabDanfeChaveAcesso.Value, 21, 4)+' '+Copy(tabDanfeChaveAcesso.Value, 25, 4)+' '+Copy(tabDanfeChaveAcesso.Value, 29, 4)+' '+Copy(tabDanfeChaveAcesso.Value, 33, 4)+' '+Copy(tabDanfeChaveAcesso.Value, 37, 4)+' '+Copy(tabDanfeChaveAcesso.Value, 41, 4);
         tabDanfeProtocoloAutorizacao.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.procNFe.nProt+' - '+FormatDateTime('dd/MM/yyyy hh:nn', pACBrNFe.NotasFiscais.Items[vCnt].NFe.procNFe.dhRecbto);
         tabDanfeNumeroNota.Value:='Nº '+StrZero(pACBrNFe.NotasFiscais.Items[vCnt].NFe.Ide.nNF, 9);
         tabDanfeNumeroNotaFmt.Value:=StrZero(pACBrNFe.NotasFiscais.Items[vCnt].NFe.Ide.nNF, 10);
         tabDanfeSerieNota.Value:='SÉRIE: '+StrZero(pACBrNFe.NotasFiscais.Items[vCnt].NFe.Ide.serie, 3);
         tabDanfeNatOp.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Ide.natOp;
         if pACBrNFe.NotasFiscais.Items[vCnt].NFe.Ide.tpNF = tnSaida then begin
            tabDanfeTipoNF.Value:='1';
          end
         else if pACBrNFe.NotasFiscais.Items[vCnt].NFe.Ide.tpNF = tnEntrada then begin
            tabDanfeTipoNF.Value:='2';
         end;
         tabDanfeEmissao.Value:=FormatDateTime('dd/MM/yyyy', pACBrNFe.NotasFiscais.Items[vCnt].NFe.Ide.dEmi);
         tabDanfeEmitRazao.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Emit.xNome;
         tabDanfeEmitFantasia.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Emit.xFant;
         tabDanfeEmitCNPJ.Value:=FormatarCNPJ(pACBrNFe.NotasFiscais.Items[vCnt].NFe.Emit.CNPJCPF);
         tabDanfeEmitIE.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Emit.IE;
         tabDanfeEmitIM.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Emit.IM;
         tabDanfeRecebemos.Value:='RECEBEMOS DE '+pACBrNFe.NotasFiscais.Items[vCnt].NFe.Emit.xNome+' OS PRODUTOS/SERVIÇOS CONSTANTES DA NOTA FISCAL AO LADO';
         tabDanfeEmitFone.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Emit.EnderEmit.fone;
         tabDanfeEmitEndCompleto.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Emit.EnderEmit.xLgr + ', '+
                                        pACBrNFe.NotasFiscais.Items[vCnt].NFe.Emit.EnderEmit.nro  + ' - '+
                                        pACBrNFe.NotasFiscais.Items[vCnt].NFe.Emit.EnderEmit.xCpl + ' - '+
                                        pACBrNFe.NotasFiscais.Items[vCnt].NFe.Emit.EnderEmit.xBairro + ' - '+
                                        pACBrNFe.NotasFiscais.Items[vCnt].NFe.Emit.EnderEmit.xMun + ' - '+
                                        pACBrNFe.NotasFiscais.Items[vCnt].NFe.Emit.EnderEmit.UF + ' - '+
                                        IntToStr(pACBrNFe.NotasFiscais.Items[vCnt].NFe.Emit.EnderEmit.CEP)+' - '+
                                        pACBrNFe.NotasFiscais.Items[vCnt].NFe.Emit.EnderEmit.fone;

                                        
         if Length(Trim(Desformatar(pACBrNFe.NotasFiscais.Items[vCnt].NFe.Dest.CNPJCPF))) = 14 then begin
            tabDanfeDestCNPJCPF.Value:=FormatarCNPJ(pACBrNFe.NotasFiscais.Items[vCnt].NFe.Dest.CNPJCPF);
          end
         else begin
            tabDanfeDestCNPJCPF.Value:=FormatarCPF(pACBrNFe.NotasFiscais.Items[vCnt].NFe.Dest.CNPJCPF);
         end;
         
         tabDanfeDestRazao.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Dest.xNome;
         tabDanfeDestEmail.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Dest.Email;
         tabDanfeDestEndereco.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Dest.EnderDest.xLgr+', '+pACBrNFe.NotasFiscais.Items[vCnt].NFe.Dest.EnderDest.nro;
         tabDanfeDestBairro.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Dest.EnderDest.xBairro;
         tabDanfeDestCep.Value:=FormatarCep(IntToStr(pACBrNFe.NotasFiscais.Items[vCnt].NFe.Dest.EnderDest.CEP));
         tabDanfeDestCidade.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Dest.EnderDest.xMun;
         tabDanfeDestUF.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Dest.EnderDest.UF;
         tabDanfeDestIE.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Dest.IE;
         tabDanfeDestFone.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Dest.EnderDest.fone;

         // ICMS
         tabDanfeValorBC.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Total.ICMSTot.vBC;
         tabDanfeValorICMS.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Total.ICMSTot.vICMS;
         tabDanfeValorBCST.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Total.ICMSTot.vBCST;
         tabDanfeValorST.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Total.ICMSTot.vST;
         tabDanfeValorProdutos.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Total.ICMSTot.vProd;
         tabDanfeValorFrete.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Total.ICMSTot.vFrete;
         tabDanfeValorSeguro.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Total.ICMSTot.vSeg;
         tabDanfeValorDesconto.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Total.ICMSTot.vDesc;
         tabDanfeValorII.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Total.ICMSTot.vII;
         tabDanfeValorIPI.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Total.ICMSTot.vIPI;
         tabDanfeValorPIS.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Total.ICMSTot.vPIS;
         tabDanfeValorCOFINS.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Total.ICMSTot.vCOFINS;
         tabDanfeValorODA.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Total.ICMSTot.vOutro;
         tabDanfeValorTotalNF.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Total.ICMSTot.vNF;

         // ISSQN 
         if tabDanfeValorTotalServico.Value > 0 then begin
            tabDanfeValorTotalServico.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Total.ISSQNtot.vServ;
            tabDanfeValorBCISSQN.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Total.ISSQNtot.vBC;
            tabDanfeValorTotalISSQN.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Total.ISSQNtot.vISS;
            tabDanfeValorPIS.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Total.ISSQNtot.vPIS;
            tabDanfeValorCOFINS.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Total.ISSQNtot.vCOFINS;
         end;

         case pACBrNFe.NotasFiscais.Items[vCnt].NFe.Transp.modFrete of
            mfContaEmitente: tabDanfeTranspFreteConta.Value:='0 - Emit.';
            mfContaDestinatario: tabDanfeTranspFreteConta.Value:='1 - Dest./Rem.';
            mfContaTerceiros: tabDanfeTranspFreteConta.Value:='2 - Terceiros';
            mfSemFrete: tabDanfeTranspFreteConta.Value:='9 - Sem Frete';
         end;

         tabDanfeTranspRazao.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Transp.Transporta.xNome;
         if Length(Trim(Desformatar(pACBrNFe.NotasFiscais.Items[vCnt].NFe.Transp.Transporta.CNPJCPF))) = 14 then begin
            tabDanfeTranspCNPJ.Value:=FormatarCNPJ(pACBrNFe.NotasFiscais.Items[vCnt].NFe.Transp.Transporta.CNPJCPF);
          end
         else begin
            tabDanfeTranspCNPJ.Value:=FormatarCPF(pACBrNFe.NotasFiscais.Items[vCnt].NFe.Transp.Transporta.CNPJCPF);
         end;
         tabDanfeTranspEndereco.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Transp.Transporta.xEnder;
         tabDanfeTranspCidade.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Transp.Transporta.xMun;
         tabDanfeTranspUF.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Transp.Transporta.UF;
         tabDanfeTranspIE.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Transp.Transporta.IE;

         tabDanfeVolQuantidade.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Transp.Vol.Items[0].qVol;
         tabDanfeVolEspecie.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Transp.Vol.Items[0].esp;
         tabDanfeVolMarca.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Transp.Vol.Items[0].marca;
         tabDanfeVolNumeracao.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Transp.Vol.Items[0].nVol;
         tabDanfeVolPesoL.Value:=FormatFloat('#,###0.000', pACBrNFe.NotasFiscais.Items[vCnt].NFe.Transp.Vol.Items[0].pesoL);
         tabDanfeVolPesoB.Value:=FormatFloat('#,###0.000', pACBrNFe.NotasFiscais.Items[vCnt].NFe.Transp.Vol.Items[0].pesoB);

         tabDanfeInfCpl.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.InfAdic.infCpl;
         tabDanfeInfAdFisco.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.InfAdic.infAdFisco;

         for vCntDup:=0 to (pACBrNFe.NotasFiscais.Items[vCnt].NFe.Cobr.Dup.Count-1) do begin 
            if vCntDup+1 > 12 then break;
            tabDanfe.FieldByName('FatNum'+IntToStr(vCntDup+1)).AsString:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Cobr.Dup.Items[vCntDup].nDup;
            tabDanfe.FieldByName('FatValor'+IntToStr(vCntDup+1)).AsString:=FormatFloat(sis_curr_format, pACBrNFe.NotasFiscais.Items[vCnt].NFe.Cobr.Dup.Items[vCntDup].vDup);
            tabDanfe.FieldByName('FatVencto'+IntToStr(vCntDup+1)).AsDateTime:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Cobr.Dup.Items[vCntDup].dVenc;
         end; 

         vTMS:=TStringStream.Create(pACBrNFe.NotasFiscais.Items[vCnt].XML);
         try
            pACBrNFe.NotasFiscais.Items[vCnt].SaveToStream(vTMS);
            (tabDanfe.FieldByName('XML') as TBlobField).LoadFromStream(vTMS);
         finally
            vTMS.Free;
         end;

         tabDanfeTipoTela.Value:=StrToInt(pACBrNFe.NotasFiscais.Items[vCnt].NFe.InfAdic.obsCont[1].xTexto);  
         tabDanfeCodigoConta.Value:=StrToFloat(pACBrNFe.NotasFiscais.Items[vCnt].NFe.InfAdic.obsCont[2].xTexto); 
         tabDanfe.Post;

         for vCntDet:=0 to (pACBrNFe.NotasFiscais.Items[vCnt].NFe.Det.Count-1) do begin
            tabDanfeProdutos.Append;
            tabDanfeProdutosChaveAcesso.Value:=tabDanfeChaveAcesso.Value;
            tabDanfeProdutosCodigoProduto.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Det.Items[vCntDet].Prod.cProd;
            tabDanfeProdutosDescricao.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Det.Items[vCntDet].Prod.xProd;
            tabDanfeProdutosNCM.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Det.Items[vCntDet].Prod.NCM;
            tabDanfeProdutosCFOP.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Det.Items[vCntDet].Prod.CFOP;
            tabDanfeProdutosUN.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Det.Items[vCntDet].Prod.uTrib;   // ? uCom ou uTrib ?
            tabDanfeProdutosQuantidade.Value:=FormatFloat('#,####0.0000', pACBrNFe.NotasFiscais.Items[vCnt].NFe.Det.Items[vCntDet].Prod.qTrib);   // ? qCom ou qTrib ?
            tabDanfeProdutosValorUnitario.Value:=FormatFloat('#,####0.0000', pACBrNFe.NotasFiscais.Items[vCnt].NFe.Det.Items[vCntDet].Prod.vUnTrib); // ? vUnCom ou vUnTrib
            tabDanfeProdutosValorProdutos.Value:=FormatFloat('#,##0.00', pACBrNFe.NotasFiscais.Items[vCnt].NFe.Det.Items[vCntDet].Prod.vProd);
            if pACBrNFe.NotasFiscais.Items[vCnt].NFe.Det.Items[vCntDet].Imposto.ICMS.CSOSN <> csosnVazio then begin
               tabDanfeProdutosCST.Value:=OrigToStr(pACBrNFe.NotasFiscais.Items[vCnt].NFe.Det.Items[vCntDet].Imposto.ICMS.orig) + CSOSNIcmsToStr(pACBrNFe.NotasFiscais.Items[vCnt].NFe.Det.Items[vCntDet].Imposto.ICMS.CSOSN);
             end
            else begin
               tabDanfeProdutosCST.Value:=OrigToStr(pACBrNFe.NotasFiscais.Items[vCnt].NFe.Det.Items[vCntDet].Imposto.ICMS.orig) + CSTICMSToStr(pACBrNFe.NotasFiscais.Items[vCnt].NFe.Det.Items[vCntDet].Imposto.ICMS.CST);
            end;
            if pACBrNFe.NotasFiscais.Items[vCnt].NFe.Det.Items[vCntDet].Imposto.ICMS.vICMS > 0 then begin
               tabDanfeProdutosBCICMS.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Det.Items[vCntDet].Imposto.ICMS.vBC;
               tabDanfeProdutosAliICMS.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Det.Items[vCntDet].Imposto.ICMS.pICMS;
               tabDanfeProdutosValorICMS.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Det.Items[vCntDet].Imposto.ICMS.vICMS;
            end;
            if pACBrNFe.NotasFiscais.Items[vCnt].NFe.Det.Items[vCntDet].Imposto.IPI.vIPI > 0 then begin
               tabDanfeProdutosAliqIPI.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Det.Items[vCntDet].Imposto.IPI.pIPI;
               tabDanfeProdutosValorIPI.Value:=pACBrNFe.NotasFiscais.Items[vCnt].NFe.Det.Items[vCntDet].Imposto.IPI.vIPI;
            end;
            tabDanfeProdutos.Post;
         end;
      end;
   end;

   if tabDanfe.RecordCount > 0 then begin
      tabDanfeProdutos.IndexFieldNames:='ChaveAcesso';
      tabDanfeProdutos.MasterFields:='ChaveAcesso';
      tabDanfeProdutos.MasterSource:=dtsDanfe;
      tabDanfe.First;
      FPagina:=0;
      FChaveNFe:=tabDanfeChaveAcesso.Value;
    end
   else begin
      raise Exception.Create('Nenhum XML Carregado.');
   end; 
end;

procedure TfmDanfe.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   tabDanfeProdutos.Close;
   tabDanfe.Close;
   tabConfigPropri.Close; 
end;

procedure TfmDanfe.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var vBool: boolean;
begin
   inherited;
   if FChaveNFe <> tabDanfeChaveAcesso.Value then begin
      FChaveNFe:=tabDanfeChaveAcesso.Value;
      FPagina:=1;
    end
   else begin
      FPagina:=FPagina + 1;
   end;

   if (tabDanfeProdutos.RecordCount > 5) and (tabDanfeProdutos.RecordCount < 50) then begin
      FTotalPaginas:=2;
    end
   else if tabDanfeProdutos.RecordCount <= 5 then begin
      FTotalPaginas:=1;
    end
   else begin
      FTotalPaginas:=3;
   end;

   qrlPagina.Caption:=Format('Página %d de %d', [FPagina, FTotalPaginas]);

   if FPagina = 1 then begin
      vBool:=True;
    end
   else begin
      vBool:=False;
   end;

   // Recibo Topo do Danfe
   qrdRecebemos.Enabled:=vBool;
   QRLabel1.Enabled:=vBool;
   QRLabel11.Enabled:=vBool;
   QRLabel12.Enabled:=vBool;
   QRDBText1.Enabled:=vBool;
   QRDBText2.Enabled:=vBool;
   QRShape98.Enabled:=vBool;
   QRShape119.Enabled:=vBool;
   QRShape120.Enabled:=vBool;
   QRShape3.Enabled:=vBool;
   QRShape4.Enabled:=vBool;
   QRShape2.Enabled:=vBool;
   QRShape97.Enabled:=vBool;   
end;

procedure TfmDanfe.qrpDanfeBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   inherited;
   qrsCodigoBarras.Text:=tabDanfeChaveAcesso.Value;
end;

procedure TfmDanfe.qrbISSQNDadosAdBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var vBool: Boolean;
begin
   inherited;
   if FPagina = 1 then begin
      vBool:=True;
    end
   else begin
      vBool:=False;
   end;

   // Calculo do ISSQN e Dados Adicionais
   QRLabel77.Enabled:=vBool;
   QRShape87.Enabled:=vBool;
   QRLabel83.Enabled:=vBool;
   QRLabel84.Enabled:=vBool;
   QRLabel85.Enabled:=vBool;
   QRLabel86.Enabled:=vBool;
   QRLabel78.Enabled:=vBool;
   QRLabel79.Enabled:=vBool;
   QRLabel80.Enabled:=vBool;
   QRDBText69.Enabled:=vBool;
   QRDBText70.Enabled:=vBool;
   QRShape94.Enabled:=vBool;
   QRShape95.Enabled:=vBool;
   QRShape96.Enabled:=vBool;
   QRShape116.Enabled:=vBool;
   QRShape91.Enabled:=vBool;
   QRShape115.Enabled:=vBool;
   QRShape88.Enabled:=vBool;
   QRShape89.Enabled:=vBool;
   QRShape90.Enabled:=vBool;
   QRShape92.Enabled:=vBool;
   QRShape93.Enabled:=vBool;
end;

procedure TfmDanfe.btnVisualizarClick(Sender: TObject);
begin
   inherited;
   vImprime:='Visualizar';
   btnImprimir.Click;
end;

procedure TfmDanfe.btnEmailClick(Sender: TObject);
begin
   inherited;
   vImprime:='Email';
   btnImprimir.Click;
end;

procedure TfmDanfe.btnImprimirClick(Sender: TObject);
var vEmailXML, vEmailDanfe: string;
    vArquivoXml, vArquivoDanfe : string;
    vChaveAcesso: string;
begin
   inherited;

   tabConfigPropri.Close;
   tabConfigPropri.SQL.Clear;
   tabConfigPropri.SQL.Add('SELECT * FROM configuracoes_proprietario');
   tabConfigPropri.Open;

   if vImprime = 'Visualizar' then begin
      qrpDanfe.Preview;
    end
   else if vImprime = 'Email' then begin

      gagProgresso.MaxValue:=tabDanfe.RecordCount;

      tabDanfe.IndexFieldNames:='ChaveAcesso';

      tabDanfe.First;
      while not tabDanfe.Eof do begin

         gagProgresso.Progress:=tabDanfe.RecNo;
         Application.ProcessMessages;

         vChaveAcesso:=tabDanfeChaveAcesso.Value;

         // Envio do XML
         ShowMessage(GetEmailNFeXML(tabDanfeTipoTela.Value, tabDanfeCodigoConta.Value));
         vEmailXML:='renan.nacional@hotmail.com';
         vArquivoXml:=GetPathTempWindow+'xml_'+FormatDateTime('hhnnss', Now)+'.xml';

         if FileExists(vArquivoXml) then DeleteFile(vArquivoXml);

         (tabDanfe.FieldByName('XML') as TBlobField).SaveToFile(vArquivoXml);

         if Trim(vEmailXML) <> '' then begin
            EnviarEmail(tabConfigPropri.FieldByName('SmtpHost').AsString,
                        tabConfigPropri.FieldByName('SmtpUsername').AsString,
                        tabConfigPropri.FieldByName('SmtpPassword').AsString,
                        tabConfigPropri.FieldByName('RazaoSocial').AsString,
                        tabConfigPropri.FIeldByName('NFeEmailXML').AsString,
                        vEmailXML,
                        tabConfigPropri.FieldByName('NFeAssuntoEnvioEmail').AsString,
                        tabConfigPropri.FieldByName('NFeMensagemEnvioEmail').AsString,
                        vArquivoXml,
                        '',
                        '',
                        tabConfigPropri.FieldByName('SmtpPorta').AsInteger,
                        False);
         end;

         tabDanfe.Filter:='ChaveAcesso = '+QuotedStr(vChaveAcesso);
         tabDanfe.Filtered:=True;

         // Envio do DANFE  
         ShowMessage(GetEmailNFeDanfe(tabDanfeTipoTela.Value, tabDanfeCodigoConta.Value));
         vEmailDanfe:='renan.nacional@hotmail.com';
         vArquivoDanfe:=GetPathTempWindow+'danfe_'+FormatDateTime('hhnnss', Now)+'.pdf';

         if FileExists(vArquivoDanfe) then DeleteFile(vArquivoDanfe);

         qrpDanfe.Prepare;
         qrpDanfe.ExportToFilter(TQRPDFExportFilter.Create(vArquivoDanfe));

         if Trim(vEmailDanfe) <> '' then begin
            EnviarEmail(tabConfigPropri.FieldByName('SmtpHost').AsString,
                        tabConfigPropri.FieldByName('SmtpUsername').AsString,
                        tabConfigPropri.FieldByName('SmtpPassword').AsString,
                        tabConfigPropri.FieldByName('RazaoSocial').AsString,
                        tabConfigPropri.FIeldByName('NFeEmailXML').AsString,
                        vEmailDanfe,
                        tabConfigPropri.FieldByName('NFeAssuntoEnvioEmail').AsString,
                        tabConfigPropri.FieldByName('NFeMensagemEnvioEmail').AsString,
                        vArquivoDanfe,
                        '',
                        '',
                        tabConfigPropri.FieldByName('SmtpPorta').AsInteger,
                        False);
         end;

         tabDanfe.Filter:='';
         tabDanfe.Filtered:=False;
         tabDanfe.FindKey([vChaveAcesso]);

         tabDanfe.Next;
      end;

      gagProgresso.Progress:=0;
    end
   else if vImprime = 'Imprimir' then begin
      if pndDialogo.Execute then begin
         qrpDanfe.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
         qrpDanfe.PrinterSettings.Copies:=Printer.Copies;
         qrpDanfe.Print;
      end;
   end;

   vImprime:='Imprimir';
end;

procedure TfmDanfe.qrsProdutosBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var vCnt : Integer;  
begin
   inherited;
   for vCnt:=1 to 15 do begin
      TQRShape(FindComponent('qrsDiv'+IntToStr(vCnt))).Top:=-5;
      TQRShape(FindComponent('qrsDiv'+IntToStr(vCnt))).Height:=330;
   end;
end;

end.

unit uReEmissaoNFe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, Buttons, DB, DBClient, QRCtrls,
  QuickRpt, ExtCtrls, xmldom, XMLIntf, msxmldom, XMLDoc, QRPDFFilter,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Printers, qrBarcode,
  Menus;

type
  TfmReEmissaoNFe = class(TfmFormBaseAvancado)  
    Label1: TLabel; 
    edtNota: TEdit;
    Label2: TLabel;
    edtSerie: TEdit;
    edtEmpresa: TEdit;
    Label3: TLabel;
    edtTipoNota: TEdit;
    Label4: TLabel;
    edtAssunto: TEdit;
    Label5: TLabel;
    edtMsg: TMemo;
    Label6: TLabel;
    btnVisualizar: TBitBtn;
    btnImprimir: TBitBtn;
    btnFechar: TBitBtn;
    btnEmail: TBitBtn;
    tabProdutosDanfe: TClientDataSet;
    tabProdutosDanfeCodigo: TStringField;
    tabProdutosDanfeDescricao: TStringField;
    tabProdutosDanfeNCM: TStringField;
    tabProdutosDanfeCFOP: TStringField;
    tabProdutosDanfeUN: TStringField;
    tabProdutosDanfeQuantidade: TStringField;
    tabProdutosDanfeValor_Unitario: TStringField;
    tabProdutosDanfeValor_Total: TStringField;
    tabProdutosDanfeBC_ICMS: TStringField;
    tabProdutosDanfeValor_ICMS: TStringField;
    tabProdutosDanfeValor_IPI: TStringField;
    tabProdutosDanfeAliq_ICMS: TStringField;
    tabProdutosDanfeAliq_IPI: TStringField;
    tabProdutosDanfeCST: TStringField;
    tabProdutosDanfeChave_Acesso_NFe: TStringField;
    tabDanfe: TClientDataSet;
    tabDanfeNumero_Nota: TStringField;
    tabDanfeSerie_Nota: TStringField;
    tabDanfeNatureza_Operacao: TStringField;
    tabDanfeTipo_NF: TStringField;
    tabDanfeEmitente_Razao: TStringField;
    tabDanfeEmitente_Fantasia: TStringField;
    tabDanfeEmitente_CNPJ: TStringField;
    tabDanfeEmitente_Dados_Endereco: TStringField;
    tabDanfeRecebemos_De: TStringField;
    tabDanfeChave_Acesso_NFe: TStringField;
    tabDanfeProtocolo_Autorizacao_Uso: TStringField;
    tabDanfeEmitente_IE: TStringField;
    tabDanfeDest_Razao: TStringField;
    tabDanfeDest_CNPJ: TStringField;
    tabDanfeDest_Endereco: TStringField;
    tabDanfeDest_Bairro: TStringField;
    tabDanfeDest_Cep: TStringField;
    tabDanfeDest_Cidade: TStringField;
    tabDanfeDest_UF: TStringField;
    tabDanfeDest_IE: TStringField;
    tabDanfeData_Emissao: TStringField;
    tabDanfeEmitente_Fone: TStringField;
    tabDanfeDest_Fone: TStringField;
    tabDanfeBC_ICMS: TStringField;
    tabDanfeValor_ICMS: TStringField;
    tabDanfeBC_ICMS_ST: TStringField;
    tabDanfeValor_Total_Produtos: TStringField;
    tabDanfeValor_ICMS_ST: TStringField;
    tabDanfeValor_Frete: TStringField;
    tabDanfeValor_Seguro: TStringField;
    tabDanfeValor_Desconto: TStringField;
    tabDanfeValor_ODA: TStringField;
    tabDanfeValor_IPI: TStringField;
    tabDanfeValor_Total_Nota: TStringField;
    tabDanfeTransp_Razao: TStringField;
    tabDanfeTransp_Cod_Antt: TStringField;
    tabDanfeTransp_Placa_Veiculo: TStringField;
    tabDanfeTransp_Placa_UF: TStringField;
    tabDanfeTransp_CNPJ: TStringField;
    tabDanfeTransp_Endereco: TStringField;
    tabDanfeTransp_Cidade: TStringField;
    tabDanfeTransp_End_UF: TStringField;
    tabDanfeTransp_IE: TStringField;
    tabDanfeVol_Quantidade: TStringField;
    tabDanfeVol_Especie: TStringField;
    tabDanfeVol_Marca: TStringField;
    tabDanfeVol_Numeracao: TStringField;
    tabDanfeVol_Peso_Bruto: TStringField;
    tabDanfeVol_Peso_Liquido: TStringField;
    tabDanfeValor_Total_Servico: TStringField;
    tabDanfeBC_ISSQN: TStringField;
    tabDanfeValor_Total_ISSQN: TStringField;
    tabDanfeEmitente_IM: TStringField;
    tabDanfeInf_Cpl: TMemoField;
    tabDanfeInf_AdFisco: TMemoField;
    tabDanfeChave_Acesso_NFe_Fmt: TStringField;
    tabDanfeNumero_Nota_Fmt: TStringField;
    tabDanfeValor_II: TStringField;
    tabDanfeValor_PIS: TStringField;
    tabDanfeValor_COFINS: TStringField;
    tabDanfeTransp_Frete_Conta: TStringField;
    tabDanfeDest_Email: TStringField;
    dtsDanfe: TDataSource;
    dtsProdutosDanfe: TDataSource;
    tabXML: TZQuery;
    pndDialogo: TPrintDialog;
    dtsXML: TDataSource;
    tabClientes: TZQuery;
    tabFornecedores: TZQuery;
    tabConfigPropri: TZQuery;
    tabDanfeFatNum1: TStringField;
    tabDanfeFatNum2: TStringField;
    tabDanfeFatNum3: TStringField;
    tabDanfeFatNum4: TStringField;
    tabDanfeFatNum5: TStringField;
    tabDanfeFatNum6: TStringField;
    qrpDanfe: TQuickRep;
    QRSubDetail1: TQRSubDetail;
    QRLabel64: TQRLabel;
    QRDBText37: TQRDBText;
    QRShape451: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel1: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel2: TQRLabel;
    QRShape10: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape11: TQRShape;
    QRLabel5: TQRLabel;
    QRShape12: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape13: TQRShape;
    qrl_numero_paginas: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape14: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
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
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    qri_logo_rel: TQRImage;
    QRDBText8: TQRDBText;
    QRShape97: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
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
    QRShape38: TQRShape;
    QRShape98: TQRShape;
    QRShape99: TQRShape;
    QRShape100: TQRShape;
    QRShape101: TQRShape;
    QRShape102: TQRShape;
    QRShape103: TQRShape;
    QRShape104: TQRShape;
    QRShape105: TQRShape;
    QRShape106: TQRShape;
    QRLabel89: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    qrsCodigoBarras: TQRAsBarcode;
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
    QRSubDetail2: TQRSubDetail;
    QRDBText51: TQRDBText;
    qrd_descricao: TQRDBText;
    QRDBText53: TQRDBText;
    QRDBText54: TQRDBText;
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
    qrs_3: TQRShape;
    QRShape76: TQRShape;
    QRShape77: TQRShape;
    QRShape78: TQRShape;
    QRShape79: TQRShape;
    QRShape80: TQRShape;
    QRShape81: TQRShape;
    QRShape82: TQRShape;
    QRShape83: TQRShape;
    QRShape84: TQRShape;
    QRShape85: TQRShape;
    QRShape86: TQRShape;
    qrs_2: TQRShape;
    qrs_1: TQRShape;
    QRShape109: TQRShape;
    QRSubDetail3: TQRSubDetail;
    QRLabel77: TQRLabel;
    QRShape87: TQRShape;
    QRShape88: TQRShape;
    QRLabel78: TQRLabel;
    QRShape89: TQRShape;
    QRShape90: TQRShape;
    QRShape91: TQRShape;
    QRShape92: TQRShape;
    QRShape93: TQRShape;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRShape94: TQRShape;
    QRShape95: TQRShape;
    QRShape96: TQRShape;
    QRDBText65: TQRDBText;
    QRDBText66: TQRDBText;
    QRDBText67: TQRDBText;
    QRDBText68: TQRDBText;
    QRDBText69: TQRDBText;
    QRDBText70: TQRDBText;
    QRShape110: TQRShape;
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
    QRLabel95: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape115: TQRShape;
    QRShape116: TQRShape;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    FCancelamento : string;
    FTipoTela: string;
  public
    { Public declarations }
  end;

var
  fmReEmissaoNFe: TfmReEmissaoNFe;
  vImprimir : string;

implementation

uses uFormBase, uMenu, uFuncoes;

{$R *.dfm}

procedure TfmReEmissaoNFe.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TfmReEmissaoNFe.FormShow(Sender: TObject);
begin
   inherited;

   vImprimir:='Imprimir';
   edtNota.Text:=fmMenu.pubTrans1;
   edtSerie.Text:=fmMenu.pubTrans2;
   edtEmpresa.Text:=fmMenu.pubTrans3;
   edtTipoNota.Text:=fmMenu.pubTrans4;
   FCancelamento:=fmMenu.pubTrans5;
   FTipoTela:=fmMenu.pubTrans6;

   tabDanfe.CreateDataSet;
   tabDanfe.EmptyDataSet;

   tabProdutosDanfe.CreateDataSet;
   tabProdutosDanfe.EmptyDataSet;

   tabConfigPropri.SQL.Add('SELECT * FROM configuracoes_proprietario');
   tabConfigPropri.Open;

   edtAssunto.Text:=tabConfigPropri.FieldByName('NFeAssuntoEnvioEmail').AsString;
   edtMsg.Text:=tabConfigPropri.FieldByName('NFeMensagemEnvioEmail').AsString;   
end;

procedure TfmReEmissaoNFe.btnVisualizarClick(Sender: TObject);
begin
   inherited;
   vImprimir:='Visualizar';
   btnImprimir.Click;
end;

procedure TfmReEmissaoNFe.btnImprimirClick(Sender: TObject);
var vXMLDoc: TXMLDocument;
    NodeRec0, NodeRec1, NodeRec2, NodeRec3, NodeRec4, NodeRec5, NodeRec6, NodeRec7 : IXMLNode;
    NodeRec8, NodeRec9, NodeRec10, NodeRec11, NodeRec12, NodeRec13, NodeISSQNTot, NodeInfAdic : IXMLNode;
    NodeInfProt, NodeDet, NodeProduto, NodePrim, NodePai, NodeImposto, NodeICMS, NodeICMSX, NodeObsCont : IXMLNode;
    vNoCobr, vNoDup : IXMLNode;
    vMotivo, vMsg, vNota, vResultados, vAssunto, vSerie : string;
    vArquivoXml, vArquivoPdf, vCstat, vHorario, vResultadoEmail, vEmailXml, vEmailDanfe, vEmailRetorno : string;
    vCancelada : boolean;
    vCodEmpresa, vTipoNota, vTipoTela : string;
    vCnt : Integer; 
begin
   if vImprimir = 'Email' then begin
      if Trim(edtAssunto.Text) = '' then begin
         ShowMessage('Obrigatório Preenchimento do Assunto');
         edtAssunto.SetFocus;
         exit;
      end;
      if Trim(edtMsg.Text) = '' then begin
         ShowMessage('Obrigatório Preenchimento da Mensagem');
         edtMsg.SetFocus;
         exit;
      end;
   end;

   // Clientes
   tabXML.Close;
   tabXML.SQL.Clear;
   if FTipoTela = '1' then begin
      tabXML.SQL.Add('SELECT NotaFiscal, Serie, Cancelada, XML');
      tabXML.SQL.Add('FROM xml_nfe_clientes');
      tabXML.SQL.Add('WHERE NotaFiscal = '+QuotedStr(edtNota.Text));
      tabXML.SQL.Add('AND Serie = '+QuotedStr(edtSerie.Text));
      tabXML.SQL.Add('AND CodigoEmpresa = '+edtEmpresa.Text);
      tabXML.SQL.Add('AND TipoNota = '+QuotedStr(edtTipoNota.Text));
      tabXML.SQL.Add('AND Cancelada = 0');
    end
   // Fornecedores
   else if FTipoTela = '2' then begin
      tabXML.SQL.Add('SELECT NotaFiscal, Serie, Cancelada, XML');
      tabXML.SQL.Add('FROM xml_nfe_fornecedores');
      tabXML.SQL.Add('WHERE NotaFiscal = '+QuotedStr(edtNota.Text));
      tabXML.SQL.Add('AND Serie = '+QuotedStr(edtSerie.Text));
      tabXML.SQL.Add('AND CodigoEmpresa = '+edtEmpresa.Text);
      tabXML.SQL.Add('AND TipoNota = '+QuotedStr(edtTipoNota.Text));
      tabXML.SQL.Add('AND Cancelada = 0');
   end;

   tabXML.Open;

   if tabXML.RecordCount = 0 then begin 
      ShowMessage('Nenhuma Nota Encontrada');
      exit;
   end;

   if tabXML.RecordCount > 1 then begin 
      ShowMessage('Mais de uma Nota Encontrada');
      exit;
   end;   

   vMotivo:='';
   vMsg:='';
   vCancelada:=False;
   vEmailXml:='';
   vEmailDanfe:='';
   vEmailRetorno:='';

   if tabXML.RecordCount = 1 then begin

       //PegaTempDir

      vHorario:=FormatDateTime('hhnnss', Now);
      vArquivoXml:=GetPathTempWindow+'re_xml_'+vHorario+'.xml';
      vArquivoPdf:=GetPathTempWindow+'re_pdf_'+vHorario+'.pdf';

      if FileExists(vArquivoXml) then DeleteFile(vArquivoXml);
      if FileExists(vArquivoPdf) then DeleteFile(vArquivoPdf);
      
      (tabXML.FieldByName('XML') as TBlobField).SaveToFile(vArquivoXml);

      tabProdutosDanfe.IndexFieldNames:='Chave_Acesso_NFe';
      tabProdutosDanfe.MasterFields:='';
      tabProdutosDanfe.MasterSource:=nil;

      tabDanfe.EmptyDataSet;
      tabProdutosDanfe.EmptyDataSet;

      if FileExists(vArquivoXml) then begin

         vXMLDoc := TXMLDocument.Create(self);
         vXMLDoc.LoadFromFile(vArquivoXml);

         try try

            NodeRec1 := vXMLDoc.DocumentElement;

            // Protocolo de Autorização de Uso
            NodeRec0:= NodeRec1.ChildNodes.FindNode('protNFe');

            // Existe a Tag "protNFe" no XML - continua
            if NodeRec0 <> Nil then begin

               NodeInfProt:=NodeRec0.ChildNodes.FindNode('infProt');

               vCstat:=NodeInfProt.ChildNodes['cStat'].Text;

               // NFe Autorizada para Uso - continua
               if vCstat = '100' then begin

                  NodeRec2:= NodeRec1.ChildNodes.FindNode('NFe');
                  NodeRec3:= NodeRec2.ChildNodes.FindNode('infNFe');
                  NodeRec4:= NodeRec3.ChildNodes.FindNode('ide');

                  tabDanfe.Append;

                  tabDanfeChave_Acesso_NFe.Value:=Trim(NodeInfProt.ChildNodes['chNFe'].Text);
                  tabDanfeChave_Acesso_NFe_Fmt.Value:=Copy(tabDanfeChave_Acesso_NFe.Value, 1, 4)+' '+Copy(tabDanfeChave_Acesso_NFe.Value, 5, 4)+' '+Copy(tabDanfeChave_Acesso_NFe.Value, 9, 4)+' '+Copy(tabDanfeChave_Acesso_NFe.Value, 13, 4)+' '+Copy(tabDanfeChave_Acesso_NFe.Value, 17, 4)+' '+Copy(tabDanfeChave_Acesso_NFe.Value, 21, 4)+' '+Copy(tabDanfeChave_Acesso_NFe.Value, 25, 4)+' '+Copy(tabDanfeChave_Acesso_NFe.Value, 29, 4)+' '+Copy(tabDanfeChave_Acesso_NFe.Value, 33, 4)+' '+Copy(tabDanfeChave_Acesso_NFe.Value, 37, 4)+' '+Copy(tabDanfeChave_Acesso_NFe.Value, 41, 4);
                  tabDanfeProtocolo_Autorizacao_Uso.Value:=NodeInfProt.ChildNodes['nProt'].Text+' - '+Copy(NodeInfProt.ChildNodes['dhRecbto'].Text, 9, 2)+'/'+Copy(NodeInfProt.ChildNodes['dhRecbto'].Text, 6, 2)+'/'+Copy(NodeInfProt.ChildNodes['dhRecbto'].Text, 1, 4)+' '+Copy(NodeInfProt.ChildNodes['dhRecbto'].Text, 12, 2)+':'+Copy(NodeInfProt.ChildNodes['dhRecbto'].Text, 15, 2);

                  vNota:=NodeRec4.ChildNodes['nNF'].Text;
                  vSerie:=StrZero(NodeRec4.ChildNodes['serie'].Text, 3);

                  tabDanfeNumero_Nota.Value := 'Nº ' + StrZero( NodeRec4.ChildNodes['nNF'].Text, 9);
                  tabDanfeNumero_Nota_Fmt.Value:=StrZero( NodeRec4.ChildNodes['nNF'].Text, 10);
                  tabDanfeSerie_Nota.Value := 'SÉRIE: ' + NodeRec4.ChildNodes['serie'].Text;

                  tabDanfeNatureza_Operacao.Value := NodeRec4.ChildNodes['natOp'].Text;
                  tabDanfeTipo_NF.Value := NodeRec4.ChildNodes['tpNF'].Text;
                  tabDanfeData_Emissao.Value :=Copy(NodeRec4.ChildNodes['dEmi'].Text, 9, 2)+'/'+Copy(NodeRec4.ChildNodes['dEmi'].Text, 6, 2)+'/'+Copy(NodeRec4.ChildNodes['dEmi'].Text, 1, 4);

                  NodeRec5:= NodeRec3.ChildNodes.FindNode('emit');
                  tabDanfeEmitente_Razao.Value:=Copy(Trim(NodeRec5.ChildNodes['xNome'].Text), 1, 50); // ***
                  tabDanfeEmitente_Fantasia.Value:=Trim(NodeRec5.ChildNodes['xFant'].Text);
                  tabDanfeEmitente_CNPJ.Value:=FormatarCNPJ(Trim(NodeRec5.ChildNodes['CNPJ'].Text));
                  tabDanfeEmitente_IE.Value:=Trim(NodeRec5.ChildNodes['IE'].Text);
                  tabDanfeEmitente_IM.Value:=Trim(NodeRec5.ChildNodes['IM'].Text);
                  tabDanfeRecebemos_De.Value:='RECEBEMOS DE '+NodeRec5.ChildNodes['xNome'].Text+' OS PRODUTOS/SERVIÇOS CONSTANTES DA NOTA FISCAL AO LADO';

                  NodeRec6:= NodeRec5.ChildNodes.FindNode('enderEmit');
                  tabDanfeEmitente_Fone.Value:=Trim(NodeRec6.ChildNodes['fone'].Text);
                  tabDanfeEmitente_Dados_Endereco.Value:=NodeRec6.ChildNodes['xLgr'].Text+', '+NodeRec6.ChildNodes['nro'].Text+' - '+NodeRec6.ChildNodes['xCpl'].Text+' - '+NodeRec6.ChildNodes['xBairro'].Text+' - '+NodeRec6.ChildNodes['xMun'].Text+' - '+NodeRec6.ChildNodes['UF'].Text+' - '+FormatarCEP(Trim(NodeRec6.ChildNodes['CEP'].Text)+' - '+tabDanfeEmitente_Fone.Value);

                  NodeRec7:=NodeRec3.ChildNodes.FindNode('dest');
                  if Trim(NodeRec7.ChildNodes['CNPJ'].Text) <> '' then begin
                     tabDanfeDest_CNPJ.Value:=FormatarCNPJ(Trim(NodeRec7.ChildNodes['CNPJ'].Text));
                   end
                  else if Trim(NodeRec7.ChildNodes['CPF'].Text) <> '' then begin
                     tabDanfeDest_CNPJ.Value:=FormatarCPF(Trim(NodeRec7.ChildNodes['CPF'].Text));
                  end;
                  tabDanfeDest_Email.Value:=Trim(NodeRec7.ChildNodes['email'].Text);

                  tabDanfeDest_Razao.Value:=Trim(NodeRec7.ChildNodes['xNome'].Text);

                  NodeRec8:=NodeRec7.ChildNodes.FindNode('enderDest');
                  tabDanfeDest_Endereco.Value:=Trim(NodeRec8.ChildNodes['xLgr'].Text);
                  tabDanfeDest_Bairro.Value:=Trim(NodeRec8.ChildNodes['xBairro'].Text);
                  tabDanfeDest_Cep.Value:=FormatarCEP(Trim(NodeRec8.ChildNodes['CEP'].Text));
                  tabDanfeDest_Cidade.Value:=Trim(NodeRec8.ChildNodes['xMun'].Text);
                  tabDanfeDest_UF.Value:=Trim(NodeRec8.ChildNodes['UF'].Text);
                  tabDanfeDest_IE.Value:=Trim(NodeRec8.ChildNodes['IE'].Text);
                  tabDanfeDest_Fone.Value:=Trim(NodeRec8.ChildNodes['fone'].Text);
                  
                  NodeRec9:=NodeRec3.ChildNodes.FindNode('total');
                  NodeRec10:=NodeRec9.ChildNodes.FindNode('ICMSTot');
                  if Trim(NodeRec10.ChildNodes['vBC'].Text) <> '' then begin
                     tabDanfeBC_ICMS.Value:=FormatFloat('#,##0.00', StrToFloat(StringReplace( NodeRec10.ChildNodes['vBC'].Text, '.', ',', [])));
                  end;
                  if Trim(NodeRec10.ChildNodes['vICMS'].Text) <> '' then begin
                     tabDanfeValor_ICMS.Value:=FormatFloat('#,##0.00', StrToFloat(StringReplace( NodeRec10.ChildNodes['vICMS'].Text, '.', ',', [])));
                  end;
                  if Trim(NodeRec10.ChildNodes['vBCST'].Text) <> '' then begin
                     tabDanfeBC_ICMS_ST.Value:=FormatFloat('#,##0.00', StrToFloat(StringReplace( NodeRec10.ChildNodes['vBCST'].Text, '.', ',', [])));
                  end;
                  if Trim(NodeRec10.ChildNodes['vST'].Text) <> '' then begin
                     tabDanfeValor_ICMS_ST.Value:=FormatFloat('#,##0.00', StrToFloat(StringReplace( NodeRec10.ChildNodes['vST'].Text, '.', ',', [])));
                  end;
                  if Trim(NodeRec10.ChildNodes['vProd'].Text) <> '' then begin
                     tabDanfeValor_Total_Produtos.Value:=FormatFloat('#,##0.00', StrToFloat(StringReplace( NodeRec10.ChildNodes['vProd'].Text, '.', ',', [])));
                  end;
                  if Trim(NodeRec10.ChildNodes['vFrete'].Text) <> '' then begin
                     tabDanfeValor_Frete.Value:=FormatFloat('#,##0.00', StrToFloat(StringReplace( NodeRec10.ChildNodes['vFrete'].Text, '.', ',', [])));
                  end;
                  if Trim(NodeRec10.ChildNodes['vSeg'].Text) <> '' then begin
                     tabDanfeValor_Seguro.Value:=FormatFloat('#,##0.00', StrToFloat(StringReplace( NodeRec10.ChildNodes['vSeg'].Text, '.', ',', [])));
                  end;
                  if Trim(NodeRec10.ChildNodes['vDesc'].Text) <> '' then begin
                     tabDanfeValor_Desconto.Value:=FormatFloat('#,##0.00', StrToFloat(StringReplace( NodeRec10.ChildNodes['vDesc'].Text, '.', ',', [])));
                  end;
                  if Trim(NodeRec10.ChildNodes['vII'].Text) <> '' then begin
                     tabDanfeValor_II.Value:=FormatFloat('#,##0.00', StrToFloat(StringReplace( NodeRec10.ChildNodes['vII'].Text, '.', ',', [])));
                  end;
                  if Trim(NodeRec10.ChildNodes['vIPI'].Text) <> '' then begin
                     tabDanfeValor_IPI.Value:=FormatFloat('#,##0.00', StrToFloat(StringReplace( NodeRec10.ChildNodes['vIPI'].Text, '.', ',', [])));
                  end;
                  if Trim(NodeRec10.ChildNodes['vPIS'].Text) <> '' then begin
                     tabDanfeValor_PIS.Value:=FormatFloat('#,##0.00', StrToFloat(StringReplace( NodeRec10.ChildNodes['vPIS'].Text, '.', ',', [])));
                  end;
                  if Trim(NodeRec10.ChildNodes['vCOFINS'].Text) <> '' then begin
                     tabDanfeValor_COFINS.Value:=FormatFloat('#,##0.00', StrToFloat(StringReplace( NodeRec10.ChildNodes['vCOFINS'].Text, '.', ',', [])));
                  end;
                  if Trim(NodeRec10.ChildNodes['vOutro'].Text) <> '' then begin
                     tabDanfeValor_ODA.Value:=FormatFloat('#,##0.00', StrToFloat(StringReplace( NodeRec10.ChildNodes['vOutro'].Text, '.', ',', [])));
                  end;
                  if Trim(NodeRec10.ChildNodes['vNF'].Text) <> '' then begin
                     tabDanfeValor_Total_Nota.Value:=FormatFloat('#,##0.00', StrToFloat(StringReplace(NodeRec10.ChildNodes['vNF'].Text, '.', ',', [])));
                  end;

                  NodeISSQNTot:=NodeRec9.ChildNodes.FindNode('ISSQNtot');
                  if NodeISSQNTot <> nil then begin
                     if Trim(NodeISSQNTot.ChildNodes['vServ'].Text) <> '' then begin
                        tabDanfeValor_Total_Servico.Value := FormatFloat('#,##0.00', StrToFloat(StringReplace(NodeISSQNTot.ChildNodes['vServ'].Text, '.', ',', [])));
                     end;
                     if Trim(NodeISSQNTot.ChildNodes['vBC'].Text) <> '' then begin
                        tabDanfeBC_ISSQN.Value := FormatFloat('#,##0.00', StrToFloat(StringReplace(NodeISSQNTot.ChildNodes['vBC'].Text, '.', ',', [])));
                     end;
                     if Trim(NodeISSQNTot.ChildNodes['vISS'].Text) <> '' then begin
                        tabDanfeValor_Total_ISSQN.Value := FormatFloat('#,##0.00', StrToFloat(StringReplace(NodeISSQNTot.ChildNodes['vISS'].Text, '.', ',', [])));
                     end;
                  end;

                  NodeRec11:=NodeRec3.ChildNodes.FindNode('transp');

                  if Trim(NodeRec11.ChildNodes['modFrete'].Text) = '0' then begin
                     tabDanfeTransp_Frete_Conta.Value:=Trim(NodeRec11.ChildNodes['modFrete'].Text)+' - Emit.';
                   end
                  else if Trim(NodeRec11.ChildNodes['modFrete'].Text) = '1' then begin
                     tabDanfeTransp_Frete_Conta.Value:=Trim(NodeRec11.ChildNodes['modFrete'].Text)+' - Dest./Rem.';
                   end
                  else if Trim(NodeRec11.ChildNodes['modFrete'].Text) = '2' then begin
                     tabDanfeTransp_Frete_Conta.Value:=Trim(NodeRec11.ChildNodes['modFrete'].Text)+' - Terceiros';
                   end
                  else if Trim(NodeRec11.ChildNodes['modFrete'].Text) = '9' then begin
                     tabDanfeTransp_Frete_Conta.Value:=Trim(NodeRec11.ChildNodes['modFrete'].Text)+' - Sem Frete';
                  end;

                  NodeRec12:=NodeRec11.ChildNodes.FindNode('transporta');
                  if NodeRec12 <> Nil then begin
                     tabDanfeTransp_Razao.Value:=NodeRec12.ChildNodes['xNome'].Text;
                     tabDanfeTransp_CNPJ.Value:=NodeRec12.ChildNodes['CNPJ'].Text;
                     tabDanfeTransp_Endereco.Value:=NodeRec12.ChildNodes['xEnder'].Text;
                     tabDanfeTransp_Cidade.Value:=NodeRec12.ChildNodes['xMun'].Text;
                     tabDanfeTransp_End_UF.Value:=NodeRec12.ChildNodes['UF'].Text;
                     tabDanfeTransp_IE.Value:=NodeRec12.ChildNodes['IE'].Text;
                  end;

                  NodeRec13:=NodeRec11.ChildNodes.FindNode('vol');
                  if NodeRec13 <> Nil then begin

                        if NodeRec13.ChildNodes.FindNode('pesoL') <> nil then
                        begin
                          tabDanfeVol_Peso_Liquido.Value:=FormatFloat('#,###0.000', StrToFloat(StringReplace( NodeRec13.ChildNodes['pesoL'].Text, '.', ',', [])));
                        end;

                        if NodeRec13.ChildNodes.FindNode('pesoB') <> nil then
                        begin
                          tabDanfeVol_Peso_Bruto.Value:=FormatFloat('#,###0.000', StrToFloat(StringReplace( NodeRec13.ChildNodes['pesoB'].Text, '.', ',', [])));
                        end;

                        if NodeRec13.ChildNodes.FindNode('nVol') <> nil then
                        begin
                          tabDanfeVol_Numeracao.Value:=NodeRec13.ChildNodes['nVol'].Text;
                        end;

                        if NodeRec13.ChildNodes.FindNode('esp') <> nil then
                        begin
                          tabDanfeVol_Especie.Value:=NodeRec13.ChildNodes['esp'].Text;
                        end;

                        if NodeRec13.ChildNodes.FindNode('marca') <> nil then
                        begin
                          tabDanfeVol_Marca.Value:=NodeRec13.ChildNodes['marca'].Text;
                        end;

                        if NodeRec13.ChildNodes.FindNode('qVol') <> nil then
                        begin
                          tabDanfeVol_Quantidade.Value:=NodeRec13.ChildNodes['qVol'].Text;
                        end;
                  end;
                  NodeInfAdic:= NodeRec3.ChildNodes.FindNode('infAdic');
                  if NodeInfAdic <> Nil then begin
                     tabDanfeInf_Cpl.Value:=NodeInfAdic.ChildNodes['infCpl'].Text;
                     tabDanfeInf_AdFisco.Value:=NodeInfAdic.ChildNodes['infAdFisco'].Text;

                     NodeObsCont := NodeInfAdic.ChildNodes.FindNode('obsCont');

                     NodeObsCont.ChildNodes.First;
                     while NodeObsCont <> nil do begin

                        if NodeObsCont.ChildNodes[0].NodeName = 'xTexto' then begin
                           if Trim(vCodEmpresa) = '' then begin
                              vCodEmpresa:=NodeObsCont.ChildNodes[0].Text;
                            end
                           else if Trim(vTipoTela) = '' then begin
                              vTipoTela:=NodeObsCont.ChildNodes[0].Text;
                            end
                           else if Trim(vTipoNota) = '' then begin
                              vTipoNota:=NodeObsCont.ChildNodes[0].Text;
                           end;
                        end;

                        NodeObsCont := NodeObsCont.NextSibling;
                     end;
                  end;
                  if  tabDanfe.State in [dsInsert] then tabDanfe.Post;

                  NodePrim := vXMLDoc.DocumentElement.ChildNodes.FindNode('NFe');
                  NodePai := NodePrim.ChildNodes.FindNode('infNFe');
                  NodeDet := NodePai.ChildNodes.FindNode('det');

                  while NodeDet <> nil do begin

                     NodeProduto  := NodeDet.ChildNodes['prod'];
                     NodeProduto.ChildNodes.First;

                     while NodeProduto <> nil do begin

                        if Trim(NodeProduto.ChildNodes['cProd'].text) <> '' then begin
                           tabProdutosDanfe.Append;
                           tabProdutosDanfeChave_Acesso_NFe.Value:=tabDanfeChave_Acesso_NFe.Value;
                           tabProdutosDanfeCodigo.Value:=Trim(NodeProduto.ChildNodes['cProd'].text);
                           tabProdutosDanfeDescricao.Value:=Trim(NodeProduto.ChildNodes['xProd'].text);
                           tabProdutosDanfeNCM.Value:=Trim(NodeProduto.ChildNodes['NCM'].text);
                           tabProdutosDanfeCFOP.Value:=Trim(NodeProduto.ChildNodes['CFOP'].text);
                           tabProdutosDanfeUN.Value:=Trim(NodeProduto.ChildNodes['uCom'].text);

                           if Trim(NodeProduto.ChildNodes['qCom'].text) <> '' then begin
                              tabProdutosDanfeQuantidade.Value:=FormatFloat('#,####0.0000', StrToFloat(StringReplace( NodeProduto.ChildNodes['qCom'].text, '.', ',', [])));
                           end;
                           tabProdutosDanfeValor_Unitario.Value:=Trim(NodeProduto.ChildNodes['vUnCom'].text);
                           if Trim(NodeProduto.ChildNodes['vProd'].text) <> '' then begin
                              tabProdutosDanfeValor_Total.Value:=FormatFloat('#,##0.00', StrToFloat(StringReplace( NodeProduto.ChildNodes['vProd'].text, '.', ',', [])));
                           end;
                           tabProdutosDanfeBC_ICMS.Value:='';
                           tabProdutosDanfeValor_ICMS.Value:='';
                           tabProdutosDanfeValor_IPI.Value:='';
                           tabProdutosDanfeAliq_ICMS.Value:='';
                           tabProdutosDanfeAliq_IPI.Value:='';
                        end;

                        NodeProduto := NodeProduto.NextSibling;
                     end;

                     NodeImposto:=NodeDet.ChildNodes['imposto'];
                     NodeImposto.ChildNodes.First;

                     NodeICMS:=NodeImposto.ChildNodes['ICMS'];
                     NodeICMS.ChildNodes.First;

                     // ICMS00
                     NodeICMSX:=NodeICMS.ChildNodes['ICMS00'];

                     if NodeICMSX <> nil then begin
                        NodeICMSX.ChildNodes.First;
                        if Trim(NodeICMSX.ChildNodes['CST'].Text) <> '' then begin
                           tabProdutosDanfeCST.Value:=Trim(StrZero(NodeICMSX.ChildNodes['CST'].Text, 3));
                        end;
                        if Trim(NodeICMSX.ChildNodes['vBC'].Text) <> '' then begin
                           tabProdutosDanfeBC_ICMS.Value:=FormatFloat('#,##0.00', StrToFloat(StringReplace( NodeICMSX.ChildNodes['vBC'].Text, '.', ',', [])));
                        end;
                        if Trim(NodeICMSX.ChildNodes['vICMS'].Text) <> '' then begin
                           tabProdutosDanfeValor_ICMS.Value:=FormatFloat('#,##0.00', StrToFloat(StringReplace( NodeICMSX.ChildNodes['vICMS'].Text, '.', ',', [])));
                        end;
                        if Trim(NodeICMSX.ChildNodes['pICMS'].Text) <> '' then begin
                           tabProdutosDanfeAliq_ICMS.Value:=FormatFloat('#,##0.00', StrToFloat(StringReplace( NodeICMSX.ChildNodes['pICMS'].Text, '.', ',', [])));
                        end;
                     end;

                     // ICMS10
                     NodeICMSX:=NodeICMS.ChildNodes['ICMS10'];

                     if NodeICMSX <> nil then begin
                        NodeICMSX.ChildNodes.First;
                        if Trim(NodeICMSX.ChildNodes['CST'].Text) <> '' then begin
                           tabProdutosDanfeCST.Value:=StrZero(NodeICMSX.ChildNodes['CST'].Text, 3);
                        end;
                        if Trim(NodeICMSX.ChildNodes['vBC'].Text) <> '' then begin
                           tabProdutosDanfeBC_ICMS.Value:=FormatFloat('#,##0.00', StrToFloat(StringReplace( NodeICMSX.ChildNodes['vBC'].Text, '.', ',', [])));
                        end;
                        if Trim(NodeICMSX.ChildNodes['vICMS'].Text) <> '' then begin
                           tabProdutosDanfeValor_ICMS.Value:=FormatFloat('#,##0.00', StrToFloat(StringReplace( NodeICMSX.ChildNodes['vICMS'].Text, '.', ',', [])));
                        end;
                        if Trim(NodeICMSX.ChildNodes['pICMS'].Text) <> '' then begin
                           tabProdutosDanfeAliq_ICMS.Value:=FormatFloat('#,##0.00', StrToFloat(StringReplace( NodeICMSX.ChildNodes['pICMS'].Text, '.', ',', [])));
                        end;
                     end;

                     // ICMS20
                     NodeICMSX:=NodeICMS.ChildNodes['ICMS20'];

                     if NodeICMSX <> nil then begin
                        NodeICMSX.ChildNodes.First;
                        if Trim(NodeICMSX.ChildNodes['CST'].Text) <> '' then begin
                           tabProdutosDanfeCST.Value:=StrZero(NodeICMSX.ChildNodes['CST'].Text, 3);
                        end;
                        if Trim(NodeICMSX.ChildNodes['vBC'].Text) <> '' then begin
                           tabProdutosDanfeBC_ICMS.Value:=FormatFloat('#,##0.00', StrToFloat(StringReplace(  NodeICMSX.ChildNodes['vBC'].Text, '.', ',', [])));
                        end;
                        if Trim(NodeICMSX.ChildNodes['vICMS'].Text) <> '' then begin
                           tabProdutosDanfeValor_ICMS.Value:=FormatFloat('#,##0.00', StrToFloat(StringReplace( NodeICMSX.ChildNodes['vICMS'].Text, '.', ',', [])));
                        end;
                        if Trim(NodeICMSX.ChildNodes['pICMS'].Text) <> '' then begin
                           tabProdutosDanfeAliq_ICMS.Value:=FormatFloat('#,##0.00', StrToFloat(StringReplace(  NodeICMSX.ChildNodes['pICMS'].Text, '.', ',', [])));
                        end;
                     end;

                     // ICMS30
                     NodeICMSX:=NodeICMS.ChildNodes['ICMS30'];

                     if NodeICMSX <> nil then begin
                        NodeICMSX.ChildNodes.First;
                        if Trim(NodeICMSX.ChildNodes['CST'].Text) <> '' then begin
                           tabProdutosDanfeCST.Value:=StrZero(NodeICMSX.ChildNodes['CST'].Text, 3);
                        end;
                     end;

                     // ICMS40
                     NodeICMSX:=NodeICMS.ChildNodes['ICMS40'];

                     if NodeICMSX <> nil then begin
                        NodeICMSX.ChildNodes.First;
                        if Trim(NodeICMSX.ChildNodes['CST'].Text) <> '' then begin
                           tabProdutosDanfeCST.Value:=StrZero(NodeICMSX.ChildNodes['CST'].Text, 3);
                        end;
                     end;

                     // ICMS51
                     NodeICMSX:=NodeICMS.ChildNodes['ICMS51'];

                     if NodeICMSX <> nil then begin
                        NodeICMSX.ChildNodes.First;
                        if Trim(NodeICMSX.ChildNodes['CST'].Text) <> '' then begin
                           tabProdutosDanfeCST.Value:=StrZero(NodeICMSX.ChildNodes['CST'].Text, 3);
                        end;
                        if Trim(NodeICMSX.ChildNodes['vBC'].Text) <> '' then begin
                           tabProdutosDanfeBC_ICMS.Value:=FormatFloat('#,##0.00', StrToFloat(StringReplace( NodeICMSX.ChildNodes['vBC'].Text, '.', ',', [])));
                        end;
                        if Trim(NodeICMSX.ChildNodes['vICMS'].Text) <> '' then begin
                           tabProdutosDanfeValor_ICMS.Value:=FormatFloat('#,##0.00', StrToFloat(StringReplace( NodeICMSX.ChildNodes['vICMS'].Text, '.', ',', [])));
                        end;
                        if Trim(NodeICMSX.ChildNodes['pICMS'].Text) <> '' then begin
                           tabProdutosDanfeAliq_ICMS.Value:=FormatFloat('#,##0.00', StrToFloat(StringReplace( NodeICMSX.ChildNodes['pICMS'].Text, '.', ',', [])));
                        end;
                     end;

                     // ICMS60
                     NodeICMSX:=NodeICMS.ChildNodes['ICMS60'];

                     if NodeICMSX <> nil then begin
                        NodeICMSX.ChildNodes.First;
                        if Trim(NodeICMSX.ChildNodes['CST'].Text) <> '' then begin
                           tabProdutosDanfeCST.Value:=StrZero(NodeICMSX.ChildNodes['CST'].Text, 3);
                        end;
                     end;

                     // ICMS70
                     NodeICMSX:=NodeICMS.ChildNodes['ICMS70'];

                     if NodeICMSX <> nil then begin
                        NodeICMSX.ChildNodes.First;
                        if Trim(NodeICMSX.ChildNodes['CST'].Text) <> '' then begin
                           tabProdutosDanfeCST.Value:=StrZero(NodeICMSX.ChildNodes['CST'].Text, 3);
                        end;
                        if Trim(NodeICMSX.ChildNodes['vBC'].Text) <> '' then begin
                           tabProdutosDanfeBC_ICMS.Value:=FormatFloat('#,##0.00', StrToFloat(StringReplace( NodeICMSX.ChildNodes['vBC'].Text, '.', ',', [])));
                        end;
                        if Trim(NodeICMSX.ChildNodes['vICMS'].Text) <> '' then begin
                           tabProdutosDanfeValor_ICMS.Value:=FormatFloat('#,##0.00', StrToFloat(StringReplace( NodeICMSX.ChildNodes['vICMS'].Text, '.', ',', [])));
                        end;
                        if Trim(NodeICMSX.ChildNodes['pICMS'].Text) <> '' then begin
                           tabProdutosDanfeAliq_ICMS.Value:=FormatFloat('#,##0.00', StrToFloat(StringReplace( NodeICMSX.ChildNodes['pICMS'].Text, '.', ',', [])));
                        end;
                     end;

                     // ICMS90
                     NodeICMSX:=NodeICMS.ChildNodes['ICMS90'];

                     if NodeICMSX <> nil then begin
                        NodeICMSX.ChildNodes.First;
                        if Trim(NodeICMSX.ChildNodes['CST'].Text) <> '' then begin
                           tabProdutosDanfeCST.Value:=StrZero(NodeICMSX.ChildNodes['CST'].Text, 3);
                        end;
                        if Trim(NodeICMSX.ChildNodes['vBC'].Text) <> '' then begin
                           tabProdutosDanfeBC_ICMS.Value:=FormatFloat('#,##0.00', StrToFloat(StringReplace( NodeICMSX.ChildNodes['vBC'].Text, '.', ',', [])));
                        end;
                        if Trim(NodeICMSX.ChildNodes['vICMS'].Text) <> '' then begin
                           tabProdutosDanfeValor_ICMS.Value:=FormatFloat('#,##0.00', StrToFloat(StringReplace( NodeICMSX.ChildNodes['vICMS'].Text, '.', ',', [])));
                        end;
                        if Trim(NodeICMSX.ChildNodes['pICMS'].Text) <> '' then begin
                           tabProdutosDanfeAliq_ICMS.Value:=FormatFloat('#,##0.00', StrToFloat(StringReplace( NodeICMSX.ChildNodes['pICMS'].Text, '.', ',', [])));
                        end;
                     end;

                     // ICMSSN101
                     NodeICMSX:=NodeICMS.ChildNodes['ICMSSN101'];

                     if NodeICMSX <> nil then begin
                        NodeICMSX.ChildNodes.First;

                        if Trim(NodeICMSX.ChildNodes['CSOSN'].Text) <> '' then begin
                           tabProdutosDanfeCST.Value:=StrZero(NodeICMSX.ChildNodes['CSOSN'].Text, 4);
                        end;
                     end;

                     // ICMSSN102
                     NodeICMSX:=NodeICMS.ChildNodes['ICMSSN102'];

                     if NodeICMSX <> nil then begin
                        NodeICMSX.ChildNodes.First;

                        if Trim(NodeICMSX.ChildNodes['CSOSN'].Text) <> '' then begin
                           tabProdutosDanfeCST.Value:=StrZero(NodeICMSX.ChildNodes['CSOSN'].Text, 4);
                        end;
                     end;

                     // ICMSSN202
                     NodeICMSX:=NodeICMS.ChildNodes['ICMSSN202'];

                     if NodeICMSX <> nil then begin
                        NodeICMSX.ChildNodes.First;

                        if Trim(NodeICMSX.ChildNodes['CSOSN'].Text) <> '' then begin
                           tabProdutosDanfeCST.Value:=StrZero(NodeICMSX.ChildNodes['CSOSN'].Text, 4);
                        end;
                     end;

                     // ICMSSN500
                     NodeICMSX:=NodeICMS.ChildNodes['ICMSSN500'];

                     if NodeICMSX <> nil then begin
                        NodeICMSX.ChildNodes.First;

                        if Trim(NodeICMSX.ChildNodes['CSOSN'].Text) <> '' then begin
                           tabProdutosDanfeCST.Value:=StrZero(NodeICMSX.ChildNodes['CSOSN'].Text, 4);
                        end;
                     end;

                     // ICMSSN900
                     NodeICMSX:=NodeICMS.ChildNodes['ICMSSN900'];

                     if NodeICMSX <> nil then begin
                        NodeICMSX.ChildNodes.First;

                        if Trim(NodeICMSX.ChildNodes['CSOSN'].Text) <> '' then begin
                           tabProdutosDanfeCST.Value:=StrZero(NodeICMSX.ChildNodes['CSOSN'].Text, 4);
                        end;
                     end;

                     if tabProdutosDanfe.State in [dsInsert] then tabProdutosDanfe.Post;

                     NodeDet := NodeDet.NextSibling;
                  end;
                  // -- Duplicatas --

                  vCnt:=0;

                  vNoCobr := NodeRec3.ChildNodes.FindNode('cobr');

                  vNoDup := vNoCobr.ChildNodes['dup'];
                  vNoDup.ChildNodes.First;
                  repeat

                     vCnt:=vCnt + 1;

                     if Trim(vNoDup.ChildNodes['nDup'].Text) <> '' then begin
                        tabDanfe.Edit;
                        tabDanfe.FieldByName('FatNum'+IntToStr(vCnt)).AsString:=vNoDup.ChildNodes['nDup'].Text;
                        tabDanfe.FieldByName('FatVencto'+IntToStr(vCnt)).AsString:=Copy(vNoDup.ChildNodes['dVenc'].Text, 9, 2)+'/'+Copy(vNoDup.ChildNodes['dVenc'].Text, 6, 2)+'/'+Copy(vNoDup.ChildNodes['dVenc'].Text, 1, 4);
                        tabDanfe.FieldByName('FatValor'+IntToStr(vCnt)).AsString:='R$ '+vNoDup.ChildNodes['vDup'].Text;
                        tabDanfe.Post;
                     end;

                     vNoDup := vNoDup.NextSibling;
                  until vNoDup = nil;

                  // -- Duplicatas --
               end;

               qrpDanfe.Prepare;
               qrpDanfe.ExportToFilter(TQRPDFExportFilter.Create(vArquivoPdf));

               vCancelada:=False;
             end
            else begin
               vArquivoPdf:='';
               NodeRec2:= NodeRec1.ChildNodes.FindNode('cancNFe');
               if NodeRec2 <> nil then begin
                  NodeRec3:= NodeRec2.ChildNodes.FindNode('infCanc');
                  vNota := NodeRec3.ChildNodes['chNFe'].Text;
                  vNota := StrZero(IntToStr(StrToInt(Copy(vNota, 26, 9))), 10);
                  vSerie := StrZero(IntToStr(StrToInt(Copy(vNota, 23, 3))), 3);
                  vMotivo := NodeRec3.ChildNodes['xJust'].Text;
                  vCancelada:=True;
               end;
            end;
         except
            on E: Exception do begin
               ShowMessage(E.Message);
            end;
         end;
         finally
            vXMLDoc.Free;
         end;

         vMsg:='';
         vResultados:='';
         vNota:=StrZero(vNota, 6);

         if vCancelada = True then begin
            vAssunto:='CANCELAMENTO DA NOTA FISCAL '+vNota+'.';
            vMsg:='MOTIVO DO CANCELAMENTO: '+vMotivo;
          end
         else begin
            vAssunto:=edtAssunto.Text+' NFE No: '+vNota;
            vMsg:=edtMsg.Text;
         end;

         if vImprimir = 'Visualizar' then begin
            qrpDanfe.PreviewModal;
          end
         else if vImprimir = 'Imprimir' then begin
            if pndDialogo.Execute = True then begin
               qrpDanfe.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
               qrpDanfe.PrinterSettings.Copies:=Printer.Copies;
               qrpDanfe.Print;
            end;
          end
         else if vImprimir = 'Email' then begin

            vResultadoEmail:='';

            vEmailRetorno:=tabConfigPropri.FIeldByName('NFeEmailXML').AsString;

            if FTipoTela = '1' then begin
               tabClientes.Close;
               tabClientes.SQL.Clear;
               tabClientes.SQL.Add('SELECT clientes.EmailNFeXML, clientes.EmailNFeDanfe');
               tabClientes.SQL.Add('FROM faturamento');
               tabClientes.SQL.Add('LEFT JOIN clientes ON clientes.CodigoCliente = faturamento.CodigoConta');
               tabClientes.SQL.Add('WHERE faturamento.Fatura = '+QuotedStr(edtNota.Text));
               tabClientes.SQL.Add('AND faturamento.Serie = '+QuotedStr(edtSerie.Text));
               tabClientes.SQL.Add('AND faturamento.CodigoEmpresa = '+edtEmpresa.Text);
               tabClientes.SQL.Add('AND faturamento.TipoNota = '+QuotedStr(edtTipoNota.Text));
               tabClientes.SQL.Add('AND faturamento.DataCancelamento IS NULL');
               tabClientes.SQL.Add('AND faturamento.TipoTela = '+FTipoTela);
               tabClientes.Open;
               vEmailXml:=tabClientes.FieldByName('EmailNFeXML').AsString;
               vEmailDanfe:=tabClientes.FieldByName('EmailNFeDanfe').AsString;
             end
            else if FTipoTela = '2' then begin
               tabFornecedores.Close;
               tabFornecedores.SQL.Clear;
               tabFornecedores.SQL.Add('SELECT forncedores.EmailNFeXML, forncedores.EmailNFeDanfe');
               tabFornecedores.SQL.Add('FROM faturamento');
               tabFornecedores.SQL.Add('LEFT JOIN fornecedores ON fornecedores.CodigoFornecedor = faturamento.CodigoConta');
               tabFornecedores.SQL.Add('WHERE faturamento.Fatura = '+QuotedStr(edtNota.Text));
               tabFornecedores.SQL.Add('AND faturamento.Serie = '+QuotedStr(edtSerie.Text));
               tabFornecedores.SQL.Add('AND faturamento.CodigoEmpresa = '+edtEmpresa.Text);
               tabFornecedores.SQL.Add('AND faturamento.TipoNota = '+QuotedStr(edtTipoNota.Text));
               tabFornecedores.SQL.Add('AND faturamento.DataCancelamento IS NULL'); 
               tabFornecedores.SQL.Add('AND faturamento.TipoTela = '+FTipoTela);
               tabFornecedores.Open;            
               vEmailXml:=tabFornecedores.FieldByName('EmailNFeXML').AsString;
               vEmailDanfe:=tabFornecedores.FieldByName('EmailNFeDanfe').AsString;
            end;

            if Trim(vEmailXml) <> '' then begin
               vResultados:=EnviarEmail(tabConfigPropri.FieldByName('SmtpHost').AsString,
                                          tabConfigPropri.FieldByName('SmtpUsername').AsString,
                                          tabConfigPropri.FieldByName('SmtpPassword').AsString,
                                          tabConfigPropri.FieldByName('RazaoSocial').AsString,
                                          vEmailRetorno,
                                          vEmailXml,
                                          vAssunto,
                                          vMsg,
                                          vArquivoXml,
                                          '',
                                          '',
                                          tabConfigPropri.FieldByName('SmtpPorta').AsInteger,
                                          False);
               vResultadoEmail:=vResultadoEmail+vEmailXml+' ';
            end;
            if Trim(vEmailDanfe) <> '' then begin
               vResultados:=EnviarEmail(tabConfigPropri.FieldByName('SmtpHost').AsString,
                                          tabConfigPropri.FieldByName('SmtpUsername').AsString,
                                          tabConfigPropri.FieldByName('SmtpPassword').AsString,
                                          tabConfigPropri.FieldByName('RazaoSocial').AsString,
                                          vEmailRetorno,
                                          vEmailDanfe,
                                          vAssunto,
                                          vMsg,
                                          vArquivoPdf,
                                          '',
                                          '',
                                          tabConfigPropri.FieldByName('SmtpPorta').AsInteger,
                                          False);
               vResultadoEmail:=vResultadoEmail+vEmailDanfe+' ';
            end;

            if (Trim(vEmailXml) = '') and (Trim(vEmailDanfe) = '') then vResultadoEmail:=vResultadoEmail+'(NENHUM EMAIL ENVIADO)';
            
            if Trim(vResultadoEmail) <> '' then begin
               ShowMessage('Enviado Para: '+vResultadoEmail);
            end;
         end;
      end;
   end;

   tabProdutosDanfe.MasterSource:=dtsDanfe;
   tabProdutosDanfe.IndexFieldNames:='Chave_Acesso_NFe';
   tabProdutosDanfe.MasterFields:='Chave_Acesso_NFe';

   vImprimir:='Imprimir';
end;

procedure TfmReEmissaoNFe.btnEmailClick(Sender: TObject);
begin
   inherited;
   vImprimir:='Email';
   btnImprimir.Click;
end;

procedure TfmReEmissaoNFe.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabDanfe.Close;
   tabProdutosDanfe.Close;
   tabClientes.Close;
   tabFornecedores.Close;
   tabXML.CLose;
   tabConfigPropri.Close; 
   inherited;
end;

procedure TfmReEmissaoNFe.btnFecharClick(Sender: TObject);
begin
   inherited;
   Close;
end;

procedure TfmReEmissaoNFe.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   inherited;
   qrsCodigoBarras.Text:=tabDanfeChave_Acesso_NFe.Value; 
end;

end.

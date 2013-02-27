unit uFaturamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, Menus, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Buttons, ExtCtrls, StdCtrls, Mask, ToolEdit,
  RXDBCtrl, DBCtrls, ComCtrls, CurrEdit, Grids, DBGrids, ImgList, DBClient,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox;

type
  TfmFaturamento = class(TfmFormBaseCadastro)
    Label1: TLabel;
    edtNotaFiscal: TEdit;
    edtDataNota: TDBDateEdit;
    Label2: TLabel;
    edtPedido: TDBEdit;
    Label3: TLabel;
    edtCodigo: TDBEdit;
    Label4: TLabel;
    edtNome: TDBEdit;
    lblTipoNome: TLabel;
    btnTipoLocalizar: TBitBtn;
    edtDataCancelamento: TDBDateEdit;
    Label6: TLabel;
    edtTransportadora: TDBLookupComboBox;
    Label7: TLabel;
    edtTabelaPreco: TDBLookupComboBox;
    Label9: TLabel;
    edtEmpresa: TDBLookupComboBox;
    Label10: TLabel;
    pgcFaturamento: TPageControl;
    tbsProdutos: TTabSheet;
    dbrTipoMovimento: TDBRadioGroup;
    tbsVenctos: TTabSheet;
    edtSerie: TDBEdit;
    Label11: TLabel;
    tbsVolumes: TTabSheet;
    tbsNFe: TTabSheet;
    pgcImpExp: TPageControl;
    tbsImportacao: TTabSheet;
    tbsExportacao: TTabSheet;
    Label18: TLabel;
    edtCodigoProduto: TEdit;
    btnProdutoAdicionar: TBitBtn;
    btnProdutoRemover: TBitBtn;
    dbgProdutos: TDBGrid;
    btnProdutoLocalizar: TBitBtn;
    edtDescricaoProdutos: TEdit;
    Label19: TLabel;
    edtQuantidade: TCurrencyEdit;
    Label21: TLabel;
    Label22: TLabel;
    edtValor: TCurrencyEdit;
    Label12: TLabel;
    edtValorProdutos: TDBEdit;
    edtValorIpi: TDBEdit;
    Label13: TLabel;
    edtValorFrete: TDBEdit;
    Label14: TLabel;
    edtValorAcrescimo: TDBEdit;
    Label15: TLabel;
    edtValorSeguro: TDBEdit;
    Label16: TLabel;
    edtValorTotal: TDBEdit;
    Label17: TLabel;
    edtValorDesconto: TDBEdit;
    Label23: TLabel;
    edtPercDesconto: TDBEdit;
    Label24: TLabel;
    edtObservacoes: TDBMemo;
    Label25: TLabel;
    edtResponsavel: TDBLookupComboBox;
    Label26: TLabel;
    edtCsosn: TDBComboBox;
    Label27: TLabel;
    edtAliqIcms: TCurrencyEdit;
    Label5: TLabel;
    Label30: TLabel;
    edtFormasPagto: TDBLookupComboBox;
    Label32: TLabel;
    edtParcelas: TDBEdit;
    Label33: TLabel;
    edtVencto1: TDBDateEdit;
    Label35: TLabel;
    edtVencto2: TDBDateEdit;
    Label37: TLabel;
    edtVencto3: TDBDateEdit;
    edtValor3: TDBEdit;
    Label38: TLabel;
    edtValor2: TDBEdit;
    Label36: TLabel;
    edtValor1: TDBEdit;
    Label34: TLabel;
    Label39: TLabel;
    edtVencto4: TDBDateEdit;
    Label41: TLabel;
    edtVencto5: TDBDateEdit;
    Label43: TLabel;
    edtVencto6: TDBDateEdit;
    edtValor6: TDBEdit;
    Label44: TLabel;
    edtValor5: TDBEdit;
    Label42: TLabel;
    edtValor4: TDBEdit;
    Label40: TLabel;
    Label45: TLabel;
    edtVencto7: TDBDateEdit;
    Label47: TLabel;
    edtVencto8: TDBDateEdit;
    Label49: TLabel;
    edtVencto9: TDBDateEdit;
    edtValor9: TDBEdit;
    Label50: TLabel;
    edtValor8: TDBEdit;
    Label48: TLabel;
    edtValor7: TDBEdit;
    Label46: TLabel;
    Label55: TLabel;
    edtVencto10: TDBDateEdit;
    Label54: TLabel;
    edtVencto11: TDBDateEdit;
    Label51: TLabel;
    edtVencto12: TDBDateEdit;
    edtValor12: TDBEdit;
    Label52: TLabel;
    edtValor11: TDBEdit;
    Label53: TLabel;
    edtValor10: TDBEdit;
    Label56: TLabel;
    edtPesoLiquido: TDBEdit;
    Label20: TLabel;
    edtPesoBruto: TDBEdit;
    Label28: TLabel;
    edtMarca: TDBEdit;
    Label29: TLabel;
    edtEspecie: TDBEdit;
    Label31: TLabel;
    edtQtdVolumes: TDBEdit;
    Label57: TLabel;
    edtUfEmbarque: TDBComboBox;
    Label58: TLabel;
    edtLocalEmbarque: TDBEdit;
    Label59: TLabel;
    edtNdi: TDBEdit;
    Label60: TLabel;
    edtDataRegistroNdi: TDBDateEdit;
    Label61: TLabel;
    edtLocalDesembaraco: TDBEdit;
    Label62: TLabel;
    edtUfDesembaraco: TDBComboBox;
    Label63: TLabel;
    edtDataDesembaraco: TDBDateEdit;
    Label64: TLabel;
    edtCodigoExportador: TDBEdit;
    Label65: TLabel;
    tabConta: TZQuery;
    dtsConta: TDataSource;
    tabTransportadoras: TZQuery;
    dtsTransportadoras: TDataSource;
    tabCFOP: TZQuery;
    dtsCFOP: TDataSource;
    tabTabelaPreco: TZQuery;
    dtsTabelaPreco: TDataSource;
    tabEmpresas: TZQuery;
    dtsEmpresas: TDataSource;
    tabFaturaProdutos: TZQuery;
    dtsFaturaProdutos: TDataSource;
    tabFormasPagto: TZQuery;
    dtsFormasPagto: TDataSource;
    edtNCM: TEdit;
    Label66: TLabel;
    tabFaturaVenctos: TZQuery;
    dtsFaturaVenctos: TDataSource;
    tabAuxiliarProdutos: TClientDataSet;
    tabAuxiliarProdutosCodigoProduto: TStringField;
    tabAuxiliarProdutosDescricao: TStringField;
    tabAuxiliarProdutosQuantidade: TFloatField;
    tabAuxiliarProdutosValor: TCurrencyField;
    tabAuxiliarProdutosValorTotal: TCurrencyField;
    dtsAuxiliarProdutos: TDataSource;
    tabAuxiliarProdutosNCM: TStringField;
    tabChecagens: TZQuery;
    tabAuxiliarVenctos: TClientDataSet;
    tabAuxiliarVenctosDataVencto1: TDateField;
    tabAuxiliarVenctosDataVencto2: TDateField;
    tabAuxiliarVenctosDataVencto3: TDateField;
    tabAuxiliarVenctosDataVencto4: TDateField;
    tabAuxiliarVenctosDataVencto5: TDateField;
    tabAuxiliarVenctosDataVencto6: TDateField;
    tabAuxiliarVenctosDataVencto7: TDateField;
    tabAuxiliarVenctosDataVencto8: TDateField;
    tabAuxiliarVenctosDataVencto9: TDateField;
    tabAuxiliarVenctosDataVencto10: TDateField;
    tabAuxiliarVenctosDataVencto11: TDateField;
    tabAuxiliarVenctosDataVencto12: TDateField;
    tabAuxiliarVenctosValor1: TCurrencyField;
    tabAuxiliarVenctosValor2: TCurrencyField;
    tabAuxiliarVenctosValor3: TCurrencyField;
    tabAuxiliarVenctosValor4: TCurrencyField;
    tabAuxiliarVenctosValor5: TCurrencyField;
    tabAuxiliarVenctosValor6: TCurrencyField;
    tabAuxiliarVenctosValor7: TCurrencyField;
    tabAuxiliarVenctosValor8: TCurrencyField;
    tabAuxiliarVenctosValor9: TCurrencyField;
    tabAuxiliarVenctosValor10: TCurrencyField;
    tabAuxiliarVenctosValor11: TCurrencyField;
    tabAuxiliarVenctosValor12: TCurrencyField;
    dtsAuxiliarVenctos: TDataSource;
    tabFuncionarios: TZQuery;
    dtsFuncionarios: TDataSource;
    CancelarNotaFiscal1: TMenuItem;
    ReEmissodaNFe1: TMenuItem;
    dbrFormaPagto: TDBRadioGroup;
    tabXML: TZQuery;
    tabChecagens2: TZQuery;
    edtUnidade: TEdit;
    Label67: TLabel;
    tabAuxiliarProdutosUnidade: TStringField;
    dbrFreteConta: TDBRadioGroup;
    N1: TMenuItem;
    DefinirAnoBase1: TMenuItem;
    N2: TMenuItem;
    ransmitirNota1: TMenuItem;
    tabCFOPCodigoCFOP: TFloatField;
    strngfldCFOPCFOP: TStringField;
    strngfldCFOPNaturezaOperacao: TStringField;
    strngfldCFOPCFOP_DESC: TStringField;
    cbbNatureza: TcxDBLookupComboBox;
    lbl1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtNotaFiscalKeyPress(Sender: TObject; var Key: Char);
    procedure edtNotaFiscalKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtsBaseDataChange(Sender: TObject; Field: TField);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnProdutoAdicionarClick(Sender: TObject);
    procedure btnProdutoRemoverClick(Sender: TObject);
    procedure btnTipoLocalizarClick(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure btnProdutoLocalizarClick(Sender: TObject);
    procedure edtCodigoProdutoChange(Sender: TObject);
    procedure edtValorIpiExit(Sender: TObject);
    procedure edtValorFreteExit(Sender: TObject);
    procedure edtValorAcrescimoExit(Sender: TObject);
    procedure edtValorSeguroExit(Sender: TObject);
    procedure edtValorDescontoExit(Sender: TObject);
    procedure edtPercDescontoExit(Sender: TObject);
    procedure edtFormasPagtoExit(Sender: TObject);
    procedure edtNotaFiscalExit(Sender: TObject);
    procedure edtCodigoProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure btnOpcoesClick(Sender: TObject);
    procedure ReEmissodaNFe1Click(Sender: TObject);
    procedure CancelarNotaFiscal1Click(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure edtCFOPExit(Sender: TObject);
    procedure edtNaturezaExit(Sender: TObject);
    procedure edtNaturezaEnter(Sender: TObject);
    procedure edtSerieExit(Sender: TObject);
    procedure DefinirAnoBase1Click(Sender: TObject);
    procedure ransmitirNota1Click(Sender: TObject);
    procedure cbbNaturezaEnter(Sender: TObject);
  private
    FTipoTela: real;
    FTipoConta: string;
    FTyping: boolean;
    FAnoBase: string;
    procedure GravarProdutos(pFatura, pSerie: string; pCodigoEmpresa: real);
    procedure GravarVenctos(pFatura, pSerie: string; pCodigoEmpresa: real);
    procedure AtualizaFatura;
    procedure AtualizaTotal; 
    function SeTotalDifVenctos: boolean;
    procedure VenctosTrocaDataSource(pDataSource: TDataSource);
    procedure AtualizaVenctos(pFormaPagto: real; pData: TDateTime; pTotal: real);
  public
    procedure Novo; override;
    procedure Editar; override;
    procedure Deletar; override;
    procedure Cancelar; override;
    function Checagens: Boolean; override;
  end;

var
  fmFaturamento: TfmFaturamento;

implementation

uses uFormBaseConfig, uMenu, uFuncoes, uTipos, uLocalizarClientes,
     uLocalizarGenerico, uLocalizarProdutos, uReEmissaoNFe, uConstantes,
     DateUtils, uLocalizarFaturamento, uProcessoNFe;

{$R *.dfm}

procedure TfmFaturamento.Novo;
begin
   tabBase.FieldByName('Fatura').AsString:=edtNotaFiscal.Text;
   tabBase.FieldByName('TipoTela').AsFloat:=FTipoTela;
   GravarProdutos(edtNotaFiscal.Text, edtSerie.Text, StrToFloat(edtEmpresa.KeyValue));
   GravarVenctos (edtNotaFiscal.Text, edtSerie.Text, StrToFloat(edtEmpresa.KeyValue));
end;

procedure TfmFaturamento.Editar;
begin
   GravarProdutos(edtNotaFiscal.Text, edtSerie.Text, StrToFloat(edtEmpresa.KeyValue));
   GravarVenctos (edtNotaFiscal.Text, edtSerie.Text, StrToFloat(edtEmpresa.KeyValue));
end;

procedure TfmFaturamento.Cancelar;
begin
end;

procedure TfmFaturamento.Deletar;
begin
   try
      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT * FROM faturamento_produtos WHERE Fatura = '+QuotedStr(tabBase.FieldByName('Fatura').AsString)+' AND Serie = '+QuotedStr(tabBase.FieldByName('Serie').AsString)+' AND CodigoEmpresa = '+FloatToStr(tabBase.FieldByName('CodigoEmpresa').AsFloat)+' AND TipoTela = '+FloatToStr(FTipoTela));
      tabChecagens.Open;;
      tabChecagens.First;
      while not tabChecagens.Eof do begin
         tabChecagens.Delete;
         tabChecagens.ApplyUpdates;
         Continue;
      end;
   finally
      tabChecagens.Close;
   end;
   try
      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT * FROM faturamento_vencimentos WHERE Fatura = '+QuotedStr(tabBase.FieldByName('Fatura').AsString)+' AND Serie = '+QuotedStr(tabBase.FieldByName('Serie').AsString)+' AND CodigoEmpresa = '+FloatToStr(tabBase.FieldByName('CodigoEmpresa').AsFloat)+' AND TipoTela = '+FloatToStr(FTipoTela));
      tabChecagens.Open;;
      tabChecagens.First;
      while not tabChecagens.Eof do begin
         tabChecagens.Delete;
         tabChecagens.ApplyUpdates;
         Continue;
      end;
   finally
      tabChecagens.Close;
   end;
end;

function TfmFaturamento.Checagens: Boolean;
begin
   Result:=False;
   if Trim(edtCodigo.Text) = '' then begin
      ShowMessage(Format('Obrigatório Preenchimento do %s', [FTipoConta]));
      edtCodigo.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtDataNota.Text) = '/  /' then begin
      ShowMessage('Obrigatório Preenchimento da Data da Nota');
      edtDataNota.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtResponsavel.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Responsável');
      edtResponsavel.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtEmpresa.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Empresa');
      edtEmpresa.SetFocus;
      Result:=True;
      exit;
   end;
   if tabAuxiliarProdutos.RecordCount <= 0 then begin
      ShowMessage('Obrigatório Preenchimento dos Produtos');
      edtCodigoProduto.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtTransportadora.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Transportadora');
      edtTransportadora.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtFormasPagto.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Forma de Pagamento');
      pgcFaturamento.ActivePage:=tbsVenctos;
      edtFormasPagto.SetFocus;
      Result:=True;
      exit;
   end;
   if SeTotalDifVenctos then begin
      ShowMessage('Valor dos Vencimentos Incompativel com o Valor Total do Pedido');
      pgcFaturamento.ActivePage:=tbsVenctos;
      edtValor1.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtSerie.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Série');
      edtSerie.SetFocus;
      Result:=True;
      exit;
   end;
   if tabBase.State = dsInsert then begin
      if Trim(edtNotaFiscal.Text) <> '' then begin
         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT Fatura, Serie, CodigoEmpresa, TipoTela');
            tabChecagens.SQL.Add('FROM faturamento');
            tabChecagens.SQL.Add('WHERE Fatura = '+QuotedStr(edtNotaFiscal.Text));
            tabChecagens.SQL.Add('AND Serie = '+QuotedStr(edtSerie.Text));
            tabChecagens.SQL.Add('AND CodigoEmpresa = '+FloatToStr(tabBase.FieldByName('CodigoEmpresa').AsFloat));
            tabChecagens.SQL.Add('AND TipoTela = '+FloatToStr(FTipoTela));
            tabChecagens.Open;
            if tabChecagens.RecordCount > 0 then begin
               ShowMessage('Faturamento já Existente');
               edtNotaFiscal.SetFocus;
               Result:=True;
               exit;
            end;
         finally
            tabChecagens.Close;
         end;
      end;
   end;   
end;

procedure TfmFaturamento.GravarProdutos(pFatura, pSerie: string; pCodigoEmpresa: real);
begin
   tabChecagens.Close;
   tabChecagens.SQL.Clear;
   tabChecagens.SQL.Add('DELETE FROM faturamento_produtos WHERE Fatura = '+QuotedStr(pFatura)+' AND Serie = '+QuotedStr(pSerie)+' AND CodigoEmpresa = '+FloatToStr(pCodigoEmpresa)+' AND TipoTela = '+FloatToStr(FTipoTela));
   tabChecagens.ExecSQL;

   dbgProdutos.DataSource:=nil;
   try
      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT * FROM faturamento_produtos WHERE 0');
      tabChecagens.Open;

      tabAuxiliarProdutos.First;
      while not tabAuxiliarProdutos.Eof do begin

         tabChecagens.Append;
         tabChecagens.FieldByName('ID').AsFloat:=CodeGenerator('faturamento_produtos', 'ID');
         tabChecagens.FieldByName('TipoTela').AsFloat:=FTipoTela; 
         tabChecagens.FieldByName('Fatura').AsString:=pFatura;
         tabChecagens.FieldByName('Serie').AsString:=pSerie;
         tabChecagens.FieldByName('CodigoEmpresa').AsFloat:=pCodigoEmpresa;
         tabChecagens.FieldByName('CodigoProduto').AsString:=tabAuxiliarProdutosCodigoProduto.Value;
         tabChecagens.FieldByName('Descricao').AsString:=tabAuxiliarProdutosDescricao.Value;
         tabChecagens.FieldByName('Quantidade').AsFloat:=tabAuxiliarProdutosQuantidade.Value;
         tabChecagens.FieldByName('Valor').AsFloat:=tabAuxiliarProdutosValor.Value;
         tabChecagens.FieldByName('ValorTotal').AsFloat:=tabAuxiliarProdutosValorTotal.Value;
         tabChecagens.FieldByName('NCM').AsString:=tabAuxiliarProdutosNCM.Value;
         tabChecagens.FieldByName('Unidade').AsString:=tabAuxiliarProdutosUnidade.Value;
         tabChecagens.Post;
         tabChecagens.ApplyUpdates;

         tabAuxiliarProdutos.Next;
      end;

      tabFaturaProdutos.Close;
      tabFaturaProdutos.ParamByName('Fatura').AsString:=tabBase.FieldByName('Fatura').AsString;
      tabFaturaProdutos.ParamByName('Serie').AsString:=tabBase.FieldByName('Serie').AsString;
      tabFaturaProdutos.ParamByName('CodigoEmpresa').AsFloat:=tabBase.FieldByName('CodigoEmpresa').AsFloat;
      tabFaturaProdutos.ParamByName('TipoTela').AsFloat:=FTipoTela;
      tabFaturaProdutos.Open;
      tabFaturaProdutos.First;
   finally
      dbgProdutos.DataSource:=dtsFaturaProdutos;
   end;
end;

procedure TfmFaturamento.GravarVenctos(pFatura, pSerie: string; pCodigoEmpresa: real);
var vCnt: Integer;
begin
   tabChecagens.Close;
   tabChecagens.SQL.Clear;
   tabChecagens.SQL.Add('DELETE FROM faturamento_vencimentos WHERE Fatura = '+QuotedStr(pFatura)+' AND Serie = '+QuotedStr(pSerie)+' AND CodigoEmpresa = '+FloatToStr(pCodigoEmpresa)+' AND TipoTela = '+FloatToStr(FTipoTela));
   tabChecagens.ExecSQL;

   tabChecagens.Close;
   tabChecagens.SQL.Clear;
   tabChecagens.SQL.Add('SELECT * FROM faturamento_vencimentos WHERE 0');
   tabChecagens.Open;

   tabChecagens.Append;
   try
      for vCnt:=1 to 12 do begin
         tabChecagens.FieldByName('Fatura').AsString:=pFatura;
         tabChecagens.FieldByName('Serie').AsString:=pSerie;
         tabChecagens.FieldByName('CodigoEmpresa').AsFloat:=pCodigoEmpresa;
         tabChecagens.FieldByName('TipoTela').AsFloat:=FTipoTela;
         if not tabAuxiliarVenctos.FieldByName('DataVencto'+IntToStr(vCnt)).IsNull then begin
            tabChecagens.FieldByName('DataVencto'+IntToStr(vCnt)).AsDateTime:=tabAuxiliarVenctos.FieldByName('DataVencto'+IntToStr(vCnt)).AsDateTime;
         end;
         tabChecagens.FieldByName('Valor'+IntToStr(vCnt)).AsFloat:=tabAuxiliarVenctos.FieldByName('Valor'+IntToStr(vCnt)).AsFloat;
      end;
   finally
      tabChecagens.Post;
      tabChecagens.ApplyUpDates;
      tabChecagens.Close;
   end;

   tabFaturaVenctos.Close;
   tabFaturaVenctos.ParamByName('Fatura').AsString:=pFatura;
   tabFaturaVenctos.ParamByName('Serie').AsString:=pSerie;
   tabFaturaVenctos.ParamByName('CodigoEmpresa').AsFloat:=pCodigoEmpresa;
   tabFaturaVenctos.ParamByName('TipoTela').AsFloat:=FTipoTela; 
   tabFaturaVenctos.Open;  
end;

function TfmFaturamento.SeTotalDifVenctos: boolean;
var vTotal : real;
    vCnt : Integer;
begin
   Result:=True;
   vTotal:=0;

   for vCnt:=1 to 12 do begin
      vTotal:=vTotal + tabAuxiliarVenctos.FieldByName('Valor'+IntToStr(vCnt)).AsFloat;
   end;

   if RoundReal(tabBase.FieldByName('ValorTotal').AsFloat, 2) = RoundReal(vTotal, 2) then begin
      Result:=False;
   end;
end;

procedure TfmFaturamento.VenctosTrocaDataSource(pDataSource: TDataSource);
var vCnt: Integer;
begin
   for vCnt:=1 to 12 do begin
      TDBDateEdit(FindComponent('edtVencto'+IntToStr(vCnt))).DataSource:=pDataSource;
      TDBEdit(FindComponent('edtValor'+IntToStr(vCnt))).DataSource:=pDataSource;
   end;
end;

procedure TfmFaturamento.AtualizaTotal;
var vTotal, vProdutos: real;
begin
   vTotal:=0;
   vProdutos:=0;
   dbgProdutos.DataSource:=nil;
   try
      tabAuxiliarProdutos.First;
      while not tabAuxiliarProdutos.Eof do begin

         vProdutos:=vProdutos + tabAuxiliarProdutosValorTotal.Value;

         tabAuxiliarProdutos.Next;
      end;
      tabAuxiliarProdutos.First;

      // Acréscimos
      vTotal:=vTotal + vProdutos;
      vTotal:=vTotal + tabBase.FieldByName('ValorFrete').AsFloat;
      vTotal:=vTotal + tabBase.FieldByName('ValorAcrescimo').AsFloat;
      vTotal:=vTotal + tabBase.FieldByName('ValorSeguro').AsFloat;
      vTotal:=vTotal + tabBase.FieldByName('ValorIPI').AsFloat;
      // Descontos
      vTotal:=vTotal - tabBase.FieldByName('ValorDesconto').AsFloat;

      tabBase.FieldByName('ValorProdutos').AsFloat:=vProdutos;
      tabBase.FieldByName('ValorTotal').AsFloat:=vTotal;

      if not tabBase.FieldByName('CodigoFormaPagto').IsNull then begin
         AtualizaVenctos(tabBase.FieldByName('CodigoFormaPagto').AsFloat, edtDataNota.Date, tabBase.FieldByName('ValorTotal').AsFloat);
      end;
   finally
      dbgProdutos.DataSource:=dtsAuxiliarProdutos;
   end;
end;

procedure TfmFaturamento.AtualizaVenctos(pFormaPagto: real; pData: TDateTime; pTotal: real);
var vParcelas: Integer;
begin
   try
      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT Codigo,Parcelas FROM formas_pagamento WHERE Codigo = '+FloatToStr(pFormaPagto));
      tabChecagens.Open;
      vParcelas:=tabChecagens.FieldByName('Parcelas').AsInteger;

      if vParcelas > 0 then begin
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT * FROM parcelas_pagto WHERE CodigoFormaPagto = '+FloatToStr(pFormaPagto)+' ORDER BY Parcela');
         tabChecagens.Open;
         tabAuxiliarVenctos.Edit;
         tabChecagens.First;
         while not tabChecagens.Eof do begin
            tabAuxiliarVenctos.FieldByName('DataVencto'+IntToStr(tabChecagens.FieldByName('Parcela').AsInteger)).AsDateTime:=pData + tabChecagens.FieldByName('Dias').AsInteger;
            tabAuxiliarVenctos.FieldByName('Valor'+IntToStr(tabChecagens.FieldByName('Parcela').AsInteger)).AsFloat:=(tabChecagens.FieldByName('PesoParcela').AsFloat * pTotal)/100;
            tabChecagens.Next;
         end;
         tabAuxiliarVenctos.Post;
      end;
   finally
      tabChecagens.Close;
   end;
end;

procedure TfmFaturamento.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TfmFaturamento.FormShow(Sender: TObject);
begin
   inherited;

   edtCsosn.Items:=GetCSOSN;

   FTyping:=False;
   FTipoTela:=StrToFloat(fmMenu.pubTrans1);
   FAnoBase:=FormatDateTime('yyyy', StartOfTheYear(Date));

   if FTipoTela = 1 then begin
      FTipoConta:='Cliente';
      Caption:=Caption + ' - Clientes';
      lblTipoNome.Caption:='Cliente';
    end
   else if FTipoTela = 2 then begin
      FTipoConta:='Fornecedor';
      Caption:=Caption + ' - Fornecedores';
      lblTipoNome.Caption:='Fornecedor';
   end;

   pgcFaturamento.ActivePageIndex:=0;

   tabAuxiliarProdutos.CreateDataSet;
   tabAuxiliarProdutos.EmptyDataSet;

   tabAuxiliarVenctos.CreateDataSet;
   tabAuxiliarVenctos.EmptyDataSet;

   tabFaturaProdutos.Params.CreateParam(ftString, 'Fatura', ptUnknown);
   tabFaturaProdutos.Params.CreateParam(ftString, 'Serie', ptUnknown);
   tabFaturaProdutos.Params.CreateParam(ftFloat, 'CodigoEmpresa', ptUnknown);
   tabFaturaProdutos.Params.CreateParam(ftFloat, 'TipoTela', ptUnknown);
   tabFaturaProdutos.SQL.Add('SELECT CodigoProduto,Descricao,Unidade,NCM,Quantidade,Valor,ValorTotal FROM faturamento_produtos WHERE Fatura = :Fatura AND Serie = :Serie AND CodigoEmpresa = :CodigoEmpresa AND TipoTela = :TipoTela');
   tabFaturaProdutos.Open;

   tabFaturaVenctos.Params.CreateParam(ftString, 'Fatura', ptUnknown);
   tabFaturaVenctos.Params.CreateParam(ftString, 'Serie', ptUnknown);
   tabFaturaVenctos.Params.CreateParam(ftFloat, 'CodigoEmpresa', ptUnknown);
   tabFaturaVenctos.Params.CreateParam(ftFloat, 'TipoTela', ptUnknown);
   tabFaturaVenctos.SQL.Add('SELECT * FROM faturamento_vencimentos WHERE Fatura = :Fatura AND Serie = :Serie AND CodigoEmpresa = :CodigoEmpresa AND TipoTela = :TipoTela');
   tabFaturaVenctos.Open;
 
   tabFormasPagto.SQL.Add('SELECT * FROM formas_pagamento ORDER BY Descricao');
   tabFormasPagto.Open;

   tabTabelaPreco.SQL.Add('SELECT * FROM tipos_tabela_preco ORDER BY Descricao');
   tabTabelaPreco.Open;

   tabTransportadoras.SQL.Add('SELECT Codigo,Nome FROM transportadoras ORDER BY Nome');
   tabTransportadoras.Open;

   tabEmpresas.SQL.Add('SELECT CodigoEmpresa,NomeFantasia FROM empresas ORDER BY NomeFantasia');
   tabEmpresas.Open;

   tabFuncionarios.SQL.Add('SELECT Codigo,Nome FROM funcionarios ORDER BY Nome'); 
   tabFuncionarios.Open;

   tabCFOP.SQL.Add('SELECT CodigoCfop, Cfop, NaturezaOperacao, concat(CFOP, '' - '',NaturezaOperacao) as CFOP_DESC FROM cfop  ORDER BY NaturezaOperacao');
   tabCFOP.Open;

   tabConta.Params.CreateParam(ftFloat, 'CodigoConta', ptUnknown);
   if FTipoTela = 1 then begin
      tabConta.SQL.Add('SELECT CodigoCliente,NomeFantasia FROM clientes WHERE CodigoCliente = :CodigoConta');
    end
   else if FTipoTela = 2 then begin
      tabConta.SQL.Add('SELECT CodigoFornecedor,NomeFantasia FROM fornecedores WHERE CodigoFornecedor = :CodigoConta');
   end;
   tabConta.Open;    

   tabBase.Params.CreateParam(ftString, 'Fatura', ptUnknown);
   tabBase.Params.CreateParam(ftFloat, 'TipoTela', ptUnknown);
   tabBase.Params.CreateParam(ftDate, 'DataBase', ptUnknown);
   tabBase.SQL.Add('SELECT * FROM faturamento WHERE Fatura = :Fatura AND TipoTela = :TipoTela AND Data > :DataBase');
   tabBase.Open;
end;

procedure TfmFaturamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabBase.Close;
   tabConta.Close;
   tabCFOP.Close;
   tabEmpresas.Close;
   tabTransportadoras.Close;
   tabTabelaPreco.Close;
   tabFaturaProdutos.Close;
   tabFaturaVenctos.Close;
   tabFormasPagto.Close;
   tabAuxiliarProdutos.Close;
   tabFuncionarios.Close;
   tabChecagens.Close;
   inherited;
end;

procedure TfmFaturamento.edtNotaFiscalKeyPress(Sender: TObject;
  var Key: Char);
begin
   inherited;
   if not (Key in['0'..'9',Chr(8)]) then Key:=#0;
end;

procedure TfmFaturamento.edtNotaFiscalKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var vDataBaseS : string;
    vDataBaseD : TDate;
begin
   inherited;
   if tabBase.State = dsBrowse then begin
      if (Trim(edtNotaFiscal.Text) <> '') and (Length(edtNotaFiscal.Text) = 6) then begin
         vDataBaseS:='01/01/'+FAnoBase;
         vDataBaseD:=StrToDateDef(vDataBaseS, StrToDate('01/01/'+FormatDateTime('yyyy', Date)));
         FTyping:=True;
         tabBase.Close;
         tabBase.ParamByName('Fatura').AsString:=edtNotaFiscal.Text;
         tabBase.ParamByName('TipoTela').AsFloat:=FTipoTela;
         tabBase.ParamByName('DataBase').AsDateTime:=vDataBaseD;
         tabBase.Open;
         FTyping:=False;
       end
      else begin
         FTyping:=True;
         if tabBase.RecordCount > 0 then begin
            tabBase.Close;
            tabBase.ParamByName('Fatura').AsString:='';
            tabBase.Open;
         end;
         FTyping:=False;
      end;
   end;
end;

procedure TfmFaturamento.AtualizaFatura;
begin
   if FTyping = False then begin
      if not tabBase.FieldByName('Fatura').IsNull then begin
         edtNotaFiscal.Text:=tabBase.FieldByName('Fatura').AsString;
      end;
   end;
end;

procedure TfmFaturamento.dtsBaseDataChange(Sender: TObject; Field: TField);
begin
   inherited;
   if tabBase.State = dsBrowse then begin
      AtualizaFatura;

      tabFaturaProdutos.Close;
      tabFaturaProdutos.ParamByName('Fatura').AsString:=tabBase.FieldByName('Fatura').AsString;
      tabFaturaProdutos.ParamByName('Serie').AsString:=tabBase.FieldByName('Serie').AsString;
      tabFaturaProdutos.ParamByName('CodigoEmpresa').AsFloat:=tabBase.FieldByName('CodigoEmpresa').AsFloat;
      tabFaturaProdutos.ParamByName('TipoTela').AsFloat:=FTipoTela;
      tabFaturaProdutos.Open;

      tabFaturaVenctos.Close;
      tabFaturaVenctos.ParamByName('Fatura').AsString:=tabBase.FieldByName('Fatura').AsString;
      tabFaturaVenctos.ParamByName('Serie').AsString:=tabBase.FieldByName('Serie').AsString;
      tabFaturaVenctos.ParamByName('CodigoEmpresa').AsFloat:=tabBase.FieldByName('CodigoEmpresa').AsFloat;
      tabFaturaVenctos.ParamByName('TipoTela').AsFloat:=FTipoTela;
      tabFaturaVenctos.Open;

      tabConta.Close;
      tabConta.ParamByName('CodigoConta').AsFloat:=tabBase.FieldByName('CodigoConta').AsFloat;
      tabConta.Open;
   end;
end;

procedure TfmFaturamento.btnNovoClick(Sender: TObject);
begin
   inherited;
   tabBase.FieldByName('Data').AsDateTime:=Date;

   // Limpar Tabelas com Parâmetro.
   tabFaturaProdutos.Close;
   tabFaturaProdutos.ParamByName('Fatura').AsString:='';
   tabFaturaProdutos.Open;

   tabFaturaVenctos.Close;
   tabFaturaVenctos.ParamByName('Fatura').AsString:='';
   tabFaturaVenctos.Open;

   tabConta.Close;
   tabConta.ParamByName('CodigoConta').AsFloat:=-1;
   tabConta.Open;

   tabAuxiliarProdutos.EmptyDataSet;
   tabAuxiliarVenctos.EmptyDataSet;
   
   dbgProdutos.DataSource:=dtsAuxiliarProdutos;

   VenctosTrocaDataSource(dtsAuxiliarVenctos);

   edtNotaFiscal.Text:='';
   edtNotaFiscal.SetFocus;
end;

procedure TfmFaturamento.btnEditarClick(Sender: TObject);
var vCnt: Integer;
begin
   inherited;

   edtNotaFiscal.Enabled:=False;
   edtSerie.Enabled:=False;
   edtEmpresa.Enabled:=False;

   tabAuxiliarProdutos.EmptyDataSet;
   tabAuxiliarVenctos.EmptyDataSet;

   dbgProdutos.DataSource:=nil;
   try
      tabFaturaProdutos.First;
      while not tabFaturaProdutos.Eof do begin

         tabAuxiliarProdutos.Append;
         tabAuxiliarProdutosCodigoProduto.Value:=tabFaturaProdutos.FieldByName('CodigoProduto').AsString;
         tabAuxiliarProdutosDescricao.Value:=tabFaturaProdutos.FieldByName('Descricao').AsString;
         tabAuxiliarProdutosQuantidade.Value:=tabFaturaProdutos.FieldByName('Quantidade').AsFloat;
         tabAuxiliarProdutosValor.Value:=tabFaturaProdutos.FieldByName('Valor').AsFloat;
         tabAuxiliarProdutosNCM.Value:=tabFaturaProdutos.FieldByName('NCM').AsString;
         tabAuxiliarProdutosUnidade.Value:=tabFaturaProdutos.FieldByName('Unidade').AsString;
         tabAuxiliarProdutosValorTotal.Value:=tabFaturaProdutos.FieldByName('ValorTotal').AsFloat;
         tabAuxiliarProdutos.Post;

         tabFaturaProdutos.Next;
      end;
   finally
      dbgProdutos.DataSource:=dtsAuxiliarProdutos;
   end;

   tabAuxiliarVenctos.Append;
   try
      for vCnt:=1 to 12 do begin
         if not tabFaturaVenctos.FieldByName('DataVencto'+IntToStr(vCnt)).IsNull then begin
            tabAuxiliarVenctos.FieldByName('DataVencto'+IntToStr(vCnt)).AsDateTime:=tabFaturaVenctos.FieldByName('DataVencto'+IntToStr(vCnt)).AsDateTime;
            tabAuxiliarVenctos.FieldByName('Valor'+IntToStr(vCnt)).AsFloat:=tabFaturaVenctos.FieldByName('Valor'+IntToStr(vCnt)).AsFloat;
         end;
         VenctosTrocaDataSource(dtsAuxiliarVenctos);
      end;
   finally
      tabAuxiliarVenctos.Post;
   end;
end;

procedure TfmFaturamento.btnCancelarClick(Sender: TObject);
begin
   inherited;
   edtNotaFiscal.Enabled:=True;
   edtSerie.Enabled:=True;
   edtEmpresa.Enabled:=True;
   dbgProdutos.DataSource:=dtsFaturaProdutos;
   VenctosTrocaDataSource(dtsFaturaVenctos);
   AtualizaFatura;
end;

procedure TfmFaturamento.btnGravarClick(Sender: TObject);
begin
   inherited;
   edtNotaFiscal.Enabled:=True;
   edtSerie.Enabled:=True;
   edtEmpresa.Enabled:=True;
end;

procedure TfmFaturamento.btnProdutoAdicionarClick(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtCodigoProduto.Text) = '' then begin
         ShowMessage('Obrigatório Preenchimento do Produto');
         edtCodigoProduto.SetFocus;
         exit;
      end;

//      if edtQuantidade.Value <= 0 then begin
//         ShowMessage('Obrigatório Preenchimento da Quantidade');
//         edtQuantidade.SetFocus;
//         exit;
//      end;

//      if edtValor.Value <= 0 then begin
//         ShowMessage('Obrigatório Preenchimento do Valor');
//         edtValor.SetFocus;
//         exit;
//      end;

      tabAuxiliarProdutos.Append;
      tabAuxiliarProdutosCodigoProduto.Value:=edtCodigoProduto.Text;
      tabAuxiliarProdutosDescricao.Value:=edtDescricaoProdutos.Text;
      tabAuxiliarProdutosQuantidade.Value:=edtQuantidade.Value;
      tabAuxiliarProdutosValor.Value:=edtValor.Value;
      tabAuxiliarProdutosValorTotal.Value:=edtQuantidade.Value * edtValor.Value;
      tabAuxiliarProdutosNCM.Value:=edtNCM.Text;
      tabAuxiliarProdutosUnidade.Value:=edtUnidade.Text;
      tabAuxiliarProdutos.Post;

      edtCodigoProduto.Text:='';
      edtDescricaoProdutos.Text:='';
      edtNCM.Text:='';
      edtUnidade.Text:='';
      edtQuantidade.Value:=0;
      edtValor.Value:=0;

      AtualizaTotal;

      edtCodigoProduto.SetFocus;
   end;
end;

procedure TfmFaturamento.btnProdutoRemoverClick(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if tabAuxiliarProdutos.RecordCount > 0 then begin
         if Application.MessageBox('Deseja Realmente Excluir o Produto?', PChar(Application.Title), 36) = 7 then exit;
         tabAuxiliarProdutos.Delete;
         AtualizaTotal;
      end;
   end;
end;                      

procedure TfmFaturamento.btnTipoLocalizarClick(Sender: TObject);
var vParLoc: TParametrosLocalizar;
begin
  inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if FTipoTela = 1 then begin
         if not Assigned (fmLocalizarClientes) then begin
            Application.CreateForm(TfmLocalizarClientes, fmLocalizarClientes);
            fmLocalizarClientes.ShowModal;
         end;
       end
      else begin
         vParLoc.Table:='fornecedores';
         vParLoc.KeyField:='CodigoFornecedor';
         vParLoc.Field1:='NomeFantasia';
         vParLoc.Filter:='';
         if not Assigned (fmLocalizarGenerico) then begin
            Application.CreateForm(TfmLocalizarGenerico, fmLocalizarGenerico);
            fmLocalizarGenerico.LoadParams(vParLoc);
            fmLocalizarGenerico.ShowModal;
         end;
      end;
      if Trim(fmMenu.pubTrans1) <> '' then begin
         tabBase.FieldByName('CodigoConta').AsFloat:=StrToFloat(fmMenu.pubTrans1);
      end;
      edtCodigo.SetFocus;
   end;
end;

procedure TfmFaturamento.edtCodigoExit(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert] then begin
      if tabBase.FieldByName('CodigoConta').AsFloat <> 0 then begin
         tabConta.Close;
         tabConta.ParamByName('CodigoConta').Value:=tabBase.FieldByName('CodigoConta').Value;
         tabConta.Open;
      end;
   end;
end;

procedure TfmFaturamento.btnProdutoLocalizarClick(Sender: TObject);
begin
  inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if not Assigned (fmLocalizarProdutos) then begin
         Application.CreateForm(TfmLocalizarProdutos, fmLocalizarProdutos);
         fmLocalizarProdutos.ShowModal;
      end;
      if Trim(fmMenu.pubTrans1) <> '' then begin
         edtCodigoProduto.Text:=fmMenu.pubTrans1;
      end;
   end;
end;

procedure TfmFaturamento.edtCodigoProdutoChange(Sender: TObject);
var vCodigoUnidade: string;
begin
  inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtCodigoProduto.Text) <> '' then begin
         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT CodigoProduto,NomeTecnico,NCM,CodigoUnidade FROM produtos WHERE CodigoProduto = '+QuotedStr(edtCodigoProduto.Text));
            tabChecagens.Open;
            if tabChecagens.RecordCount > 0 then begin
               edtDescricaoProdutos.Text:=tabChecagens.FieldByName('NomeTecnico').AsString;
               edtNCM.Text:=tabChecagens.FieldByName('NCM').AsString;
               vCodigoUnidade:=tabChecagens.FieldByName('CodigoUnidade').AsString;

               if Trim(vCodigoUnidade) <> '' then begin
                  tabChecagens.Close;
                  tabChecagens.SQL.Clear;
                  tabChecagens.SQL.Add('SELECT * FROM unidades WHERE Codigo = '+vCodigoUnidade);
                  tabChecagens.Open;
                  if tabChecagens.RecordCount > 0 then begin
                     edtUnidade.Text:=tabChecagens.FieldByName('Sigla').AsString;
                  end;
               end;

               if Trim(edtTabelaPreco.Text) <> '' then begin
                  tabChecagens.Close;
                  tabChecagens.SQL.Clear;
                  tabChecagens.SQL.Add('SELECT ValorAtual FROM tabela_precos WHERE CodigoProduto = '+QuotedStr(edtCodigoProduto.Text)+' AND CodigoTabela = '+FloatToStr(edtTabelaPreco.KeyValue));
                  tabChecagens.Open;
                  if tabChecagens.RecordCount > 0 then begin
                     edtValor.Value:=tabChecagens.FieldByName('ValorAtual').AsFloat;
                   end
                  else begin
                     edtValor.Value:=0;
                  end;
               end;
             end
            else begin
               edtDescricaoProdutos.Text:='';
               edtValor.Value:=0;
               edtNCM.Text:='';
               edtUnidade.Text:='';
            end;
         finally
            tabChecagens.Close; 
         end;
       end
      else begin
         edtDescricaoProdutos.Text:='';
         edtValor.Value:=0;
         edtNCM.Text:=''; 
         edtUnidade.Text:='';
      end;
   end;
end;

procedure TfmFaturamento.edtValorIpiExit(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then AtualizaTotal;
end;

procedure TfmFaturamento.edtValorFreteExit(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then AtualizaTotal;
end;

procedure TfmFaturamento.edtValorAcrescimoExit(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then AtualizaTotal;
end;

procedure TfmFaturamento.edtValorSeguroExit(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then AtualizaTotal;
end;

procedure TfmFaturamento.edtValorDescontoExit(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then AtualizaTotal;
end;

procedure TfmFaturamento.edtPercDescontoExit(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then AtualizaTotal;
end;

procedure TfmFaturamento.edtFormasPagtoExit(Sender: TObject);
var vParcelas: Integer;
    vFormaPagto: real;
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtFormasPagto.Text) <> '' then begin
         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT Codigo,Parcelas FROM formas_pagamento WHERE Codigo = '+FloatToStr(tabBase.FieldByName('CodigoFormaPagto').AsFloat));
            tabChecagens.Open;
            vParcelas:=tabChecagens.FieldByName('Parcelas').AsInteger;
            vFormaPagto:=tabChecagens.FieldByName('Codigo').AsFloat;
            tabBase.FieldByName('Parcelas').AsInteger:=vParcelas;
         finally
            tabChecagens.Close;
         end;
         if vParcelas > 0 then begin
            AtualizaVenctos(vFormaPagto, edtDataNota.Date, tabBase.FieldByName('ValorTotal').AsFloat);
         end;
      end;
   end;
end;

procedure TfmFaturamento.edtNotaFiscalExit(Sender: TObject);
begin
   inherited;
   if tabBase.State = dsInsert then begin
      if Trim(edtNotaFiscal.Text) <> '' then begin
         edtNotaFiscal.Text:=StrZero(edtNotaFiscal.Text, 6);
      end;
   end;
end;

procedure TfmFaturamento.edtCodigoProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
   inherited;
   if Key = #32 then Key:=#0 else Key:=UpCase(Key);
end;

procedure TfmFaturamento.btnOpcoesClick(Sender: TObject);
begin
   if tabBase.FieldByName('DataCancelamento').IsNull then begin
      CancelarNotaFiscal1.Enabled:=True; 
    end
   else begin
      CancelarNotaFiscal1.Enabled:=False;
   end; 
   inherited;
end;

procedure TfmFaturamento.ReEmissodaNFe1Click(Sender: TObject);
var vFM : TfmReEmissaoNFe;
begin
   inherited;
   if tabBase.RecordCount > 0 then begin
      if (Trim(tabBase.FieldByName('Fatura').AsString) <> '') and
         (Trim(tabBase.FieldByName('Serie').AsString) <> '') and
         (tabBase.FieldByName('CodigoEmpresa').AsFloat <> 0) then begin

         try
            tabXML.Close;
            tabXML.SQL.Clear;
            if FTipoTela = 1 then begin
               tabXML.SQL.Add('SELECT NotaFiscal, Serie, Cancelada');
               tabXML.SQL.Add('FROM xml_nfe_clientes');
               tabXML.SQL.Add('WHERE NotaFiscal = '+QuotedStr(tabBase.FieldByName('Fatura').AsString));
               tabXML.SQL.Add('AND Serie = '+QuotedStr(tabBase.FieldByName('Serie').AsString));
               tabXML.SQL.Add('AND CodigoEmpresa = '+FloatToStr(tabBase.FieldByName('CodigoEmpresa').AsFloat));
               tabXML.SQL.Add('AND TipoNota = '+QuotedStr(tabBase.FieldByName('TipoNota').AsString));
               tabXML.SQL.Add('AND Cancelada = 0');
             end
            else if FTipoTela = 2 then begin
               tabXML.SQL.Add('SELECT NotaFiscal, Serie, Cancelada');
               tabXML.SQL.Add('FROM xml_nfe_fornecedores');
               tabXML.SQL.Add('WHERE NotaFiscal = '+QuotedStr(StrZero(tabBase.FieldByName('Fatura').AsString, 6)));
               tabXML.SQL.Add('AND Serie = '+QuotedStr(StrZero(tabBase.FieldByName('Serie').AsString, 3)));
               tabXML.SQL.Add('AND CodigoEmpresa = '+FloatToStr(tabBase.FieldByName('CodigoEmpresa').AsFloat));
               tabXML.SQL.Add('AND TipoNota = '+QuotedStr(tabBase.FieldByName('TipoNota').AsString));
               tabXML.SQL.Add('AND Cancelada = 0');
            end;
            tabXML.Open;
            if tabXML.RecordCount > 0 then begin
               fmMenu.pubTrans1:=tabBase.FieldByName('Fatura').AsString;
               fmMenu.pubTrans2:=tabBase.FieldByName('Serie').AsString;
               fmMenu.pubTrans3:=tabBase.FieldByName('CodigoEmpresa').AsString;
               fmMenu.pubTrans4:=tabBase.FieldByName('TipoNota').AsString;
               fmMenu.pubTrans5:='0';
               fmMenu.pubTrans6:=FloatToStr(FTipoTela);
               vFM:=TfmReEmissaoNFe.Create(Self);
               vFM.Show;
             end
            else begin
               ShowMessage('NFe sem XML Vinculado');
            end;
         finally
            tabXML.Close;
         end;
      end;
   end;
end;

procedure TfmFaturamento.CancelarNotaFiscal1Click(Sender: TObject);
begin
   inherited;
   if tabBase.RecordCount > 0 then begin
      if Application.MessageBox(Pchar('Confirmar Cancelamento da Fatura '+tabBase.FieldByName('Fatura').AsString), 'Cancelamento da Fatura', 36) = 7 then exit;
      tabBase.Edit;
      tabBase.FieldByName('DataCancelamento').AsDateTime:=Date;
      tabBase.Post;
      tabBase.ApplyUpdates;
      // Se é cliente, pergunta se estorna pedido!
      if FTipoTela = 1 then begin
         if (Trim(tabBase.FieldByName('NPedido').AsString) <> '') and (Trim(tabBase.FieldByName('Fatura').AsString) <> '') then begin
            if Application.MessageBox(PChar('Deseja Estornar o Pedido: '+tabBase.FieldByName('NPedido').AsString+' Referente a Fatura: '+tabBase.FieldByName('Fatura').AsString), 'Estorno do Pedido', 36) = 7 then exit;
            try
               tabChecagens.Close;
               tabChecagens.SQL.Clear;
               tabChecagens.SQL.Add('SELECT * FROM pedidos WHERE NPedido = '+tabBase.FieldByName('NPedido').AsString);
               tabChecagens.Open;
               if tabChecagens.RecordCount > 0 then begin
                  tabChecagens.Edit;
                  tabChecagens.FieldByName('DataEntrega').Clear;
                  tabChecagens.Post;
                  tabChecagens.ApplyUpdates;

                  // Excluir Títulos
                  try
                     tabChecagens2.Close;
                     tabChecagens2.SQL.Clear;
                     tabChecagens2.SQL.Add('SELECT * FROM titulos_receber WHERE Documento = '+tabBase.FieldByName('NPedido').AsString);
                     tabChecagens2.SQL.Add('AND CodigoConta = '+tabBase.FieldByName('CodigoConta').AsString);
                     tabChecagens2.SQL.Add('AND NotaFiscal = '+QuotedStr(tabBase.FieldByName('Fatura').AsString));
                     tabChecagens2.SQL.Add('AND PedidoVenda = 1');
                     tabChecagens2.SQL.Add('AND DataEmissao = '+QuotedStr(FormatDateTime(sis_date_format, tabBase.FieldByName('Data').AsDateTime)));
                     tabChecagens2.Open;  

                     tabChecagens2.First;
                     while not tabChecagens2.Eof do begin
                        tabChecagens2.Delete;
                        tabChecagens2.ApplyUpdates;
                        Continue;
                     end;
                  finally  
                     tabChecagens2.Close; 
                  end;
                  ShowMessage('Pedido '+tabBase.FieldByName('NPedido').AsString+' Estornado com Sucesso.');
               end;
            finally
               tabChecagens.Close;
            end;
         end;
      end;     
   end;
end;

procedure TfmFaturamento.btnExcluirClick(Sender: TObject);
var vPedido, vFatura, vCodCli : string;
    vDataEmissao: TDate;
begin
   vPedido:=tabBase.FieldByName('NPedido').AsString;
   vFatura:=tabBase.FieldByName('Fatura').AsString;
   vCodCli:=tabBase.FieldByName('CodigoConta').AsString;
   vDataEmissao:=tabBase.FieldByName('Data').AsDateTime;
   inherited;
   // Se é cliente, pergunta se estorna pedido!
   if FTipoTela = 1 then begin
      if (Trim(vPedido) <> '') and (Trim(vFatura) <> '') then begin
         if Application.MessageBox(PChar('Deseja Estornar o Pedido: '+vPedido+' Referente a Fatura: '+vFatura), 'Estorno do Pedido', 36) = 7 then exit;
         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT * FROM pedidos WHERE NPedido = '+QuotedStr(vPedido));
            tabChecagens.Open;
            if tabChecagens.RecordCount > 0 then begin
               tabChecagens.Edit;
               tabChecagens.FieldByName('DataEntrega').Clear;
               tabChecagens.FieldByName('Fatura').AsString:='';
               tabChecagens.Post;
               tabChecagens.ApplyUpdates;

               // Pedidos Produtos
               tabChecagens2.Close;
               tabChecagens2.SQL.Clear;
               tabChecagens2.SQL.Add('SELECT * FROM pedidos_produtos WHERE NPedido = '+QuotedStr(vPedido));
               tabChecagens2.Open;

               tabChecagens2.First;
               while not tabChecagens2.Eof do begin

                  tabChecagens2.Edit;
                  tabChecagens2.FieldByName('DataProducao').Clear;
                  tabChecagens2.Post;
                  tabChecagens2.ApplyUpDates;
               
                  tabChecagens2.Next;
               end;
               // ------------------

               // Excluir Títulos
               try
                  tabChecagens2.Close;
                  tabChecagens2.SQL.Clear;
                  tabChecagens2.SQL.Add('SELECT * FROM titulos_receber WHERE Documento = '+vPedido);
                  tabChecagens2.SQL.Add('AND CodigoConta = '+vCodCli);
                  tabChecagens2.SQL.Add('AND NotaFiscal = '+QuotedStr(vFatura));
                  tabChecagens2.SQL.Add('AND PedidoVenda = 1');
                  tabChecagens2.SQL.Add('AND DataEmissao = '+QuotedStr(FormatDateTime(sis_date_format, vDataEmissao)));
                  tabChecagens2.Open;  

                  tabChecagens2.First;
                  while not tabChecagens2.Eof do begin
                     tabChecagens2.Delete;
                     tabChecagens2.ApplyUpdates;
                     Continue;
                  end;
               finally
                  tabChecagens2.Close;
               end;

               // * Atualizar o Estoque *
               try
                  tabChecagens2.Close;
                  tabChecagens2.SQL.Clear;
                  tabChecagens2.SQL.Add('SELECT * FROM pedidos_produtos WHERE NPedido = '+QuotedStr(vPedido));
                  tabChecagens2.Open;

                  tabChecagens2.First;
                  while not tabChecagens2.Eof do begin
                     Application.ProcessMessages;
                     fmMenu.AtualizaEstoque(tabChecagens2.FieldByName('CodigoProduto').AsString);             
                     tabChecagens2.Next;
                  end;
               finally
                  tabChecagens2.Close; 
               end;

               ShowMessage('Pedido '+vPedido+' Estornado com Sucesso.');
            end;
         finally
            tabChecagens.Close;
         end;
      end;
   end;
end;

procedure TfmFaturamento.btnLocalizarClick(Sender: TObject);
var vDataBaseS : string;
    vDataBaseD : TDate;
begin
   inherited;
   if not Assigned (fmLocalizarFaturamento) then begin
      Application.CreateForm(TfmLocalizarFaturamento, fmLocalizarFaturamento);
      if FTipoTela = 1 then begin
         fmLocalizarFaturamento.pubTipo:='1';
       end
      else begin
         fmLocalizarFaturamento.pubTipo:='2';
      end;
      fmLocalizarFaturamento.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      vDataBaseS:='01/01/'+fmMenu.pubTrans2;
      vDataBaseD:=StrToDateDef(vDataBaseS, StrToDate('01/01/'+FormatDateTime('yyyy', Date)));
      FTyping:=True;
      tabBase.Close;
      tabBase.ParamByName('Fatura').AsString:=fmMenu.pubTrans1;
      tabBase.ParamByName('TipoTela').AsFloat:=FTipoTela;
      tabBase.ParamByName('DataBase').AsDateTime:=vDataBaseD;
      tabBase.Open;
      FTyping:=False;
      AtualizaFatura;
   end;
   Application.ProcessMessages;
end;

procedure TfmFaturamento.edtCFOPExit(Sender: TObject);
begin
   inherited;
   {
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtCfop.Text) <> '' then begin
         tabBase.FieldByName('CFOP').AsString:=FormatarCFOP(edtCfop.Text);
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT * FROM cfop WHERE CFOP = '+QuotedSTr(edtCfop.Text));
         tabChecagens.Open;
         tabChecagens.First;
         tabBase.FieldByName('CodigoCFOP').AsFloat:=tabChecagens.FieldByName('CodigoCFOP').AsFloat;
         // edtNatureza.KeyValue:=tabChecagens.FieldByName('CodigoCFOP').AsFloat;
      end;
   end;
   }
end;

procedure TfmFaturamento.edtNaturezaExit(Sender: TObject);
begin
   inherited;
   {
   edtNatureza.ListField:='NaturezaOperacao';

   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtNatureza.Text) <> '' then begin
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT * FROM cfop WHERE CodigoCfop = '+FloatToStr(edtNatureza.KeyValue));
         tabChecagens.Open;
         tabChecagens.First;
         tabBase.FieldByName('CFOP').AsString:=tabChecagens.FieldByName('CFOP').AsString;
      end;
   end;
   } 
end;

procedure TfmFaturamento.edtNaturezaEnter(Sender: TObject);
begin
   inherited; 
   // edtNatureza.ListField:='CFOP;NaturezaOperacao'; 
end;

procedure TfmFaturamento.edtSerieExit(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtSerie.Text) <> '' then begin 
         tabBase.FieldByName('Serie').AsString:=StrZero(tabBase.FieldByName('Serie').AsString, 3);
      end;
   end;
end;

procedure TfmFaturamento.DefinirAnoBase1Click(Sender: TObject);
begin
   inherited;
   FAnoBase:=InputBox('Definir Ano Base', 'Ano Base', FAnoBase);
end;

procedure TfmFaturamento.ransmitirNota1Click(Sender: TObject);
var vFM : TfmProcessoNFe;
begin
   inherited;
   vFM:=TfmProcessoNFe.Create(Self);
   vFM.Tag := Self.Tag;
   vFM.ShowModal;
end;

procedure TfmFaturamento.cbbNaturezaEnter(Sender: TObject);
begin
  inherited;
  cbbNatureza.SelStart := 1;
  
  if cbbNatureza.Text<> '' then
  begin
    cbbNatureza.SelLength := Length(cbbNatureza.Text);
  end;
end;

end.


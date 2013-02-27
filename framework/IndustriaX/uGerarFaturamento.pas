unit uGerarFaturamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, Mask, ToolEdit, Grids, DBGrids,
  Buttons, ExtCtrls, CurrEdit, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, DBClient, ComCtrls, Menus;

type
  TfmGerarFaturamento = class(TfmFormBaseAvancado)
    Label11: TLabel;
    Label2: TLabel;
    Label13: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label19: TLabel;
    Label8: TLabel;
    edtPedido: TEdit;
    edtHora: TEdit;
    edtCodigoCFOP: TEdit;
    edtCodigoCC: TEdit;
    edtCodigoFormasPagto: TEdit;
    btnLocalizarCFOP: TBitBtn;
    btnLocalizarCC: TBitBtn;
    btnLocalizarFormasPagto: TBitBtn;
    edtCFOP: TEdit;
    edtCentroCusto: TEdit;
    edtFormasPagto: TEdit;
    dbgTitulos: TDBGrid;
    edtData: TDateEdit;
    edtObservacao: TMemo;
    edtParcelas: TEdit;
    edtVencto1: TDateEdit;
    edtCodigoLocalizacao: TEdit;
    btnLocalizarLocalizacao: TBitBtn;
    edtLocalizacao: TEdit;
    edtNotaFiscal: TEdit;
    Label4: TLabel;
    Bevel1: TBevel;
    edtCodigoTransportadora: TEdit;
    Label9: TLabel;
    btnLocalizarTransportadora: TBitBtn;
    edtTransportadora: TEdit;
    edtPesoLiquido: TEdit;
    Label10: TLabel;
    edtPesoBruto: TEdit;
    Label12: TLabel;
    edtQtdCaixas: TEdit;
    Label14: TLabel;
    edtMarca: TEdit;
    Label15: TLabel;
    edtEspecie: TEdit;
    Label16: TLabel;
    edtFreteConta: TComboBox;
    Label17: TLabel;
    edtSerie: TEdit;
    Label18: TLabel;
    edtFormaPagto: TComboBox;
    Label20: TLabel;
    edtValorProdutos: TCurrencyEdit;
    Label21: TLabel;
    edtValorFrete: TCurrencyEdit;
    Label22: TLabel;
    edtValorDesconto: TCurrencyEdit;
    Label23: TLabel;
    edtValorAcrescimo: TCurrencyEdit;
    Label24: TLabel;
    edtValorSeguro: TCurrencyEdit;
    Label25: TLabel;
    edtValorTotal: TCurrencyEdit;
    Label26: TLabel;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    tabChecagens: TZQuery;
    tabAuxParcelas: TClientDataSet;
    dtsAuxParcelas: TDataSource;
    tabAuxParcelasParcela: TIntegerField;
    tabAuxParcelasVencimento: TDateField;
    tabAuxParcelasValor: TCurrencyField;
    tabPedidosVenctos: TZQuery;
    tabPedidos: TZQuery;
    tabFormasPagto: TZQuery;
    tabParcelasPagto: TZQuery;
    dtsFormasPagto: TDataSource;
    tabFatura: TZQuery;
    tabFaturaProdutos: TZQuery;
    tabFaturaVenctos: TZQuery;
    tabPedidosProdutos: TZQuery;
    tabTitulos: TZQuery;
    tabConfigPropri: TZQuery;
    pgcExpImp: TPageControl;
    tbsExportacao: TTabSheet;
    tbsImportacao: TTabSheet;
    Label27: TLabel;
    edtUFEmbarque: TComboBox;
    edtLocalEmbarque: TEdit;
    Label28: TLabel;
    Label29: TLabel;
    edtNDI: TEdit;
    edtDataRegistroNDI: TDateEdit;
    lblDataFinal: TLabel;
    edtLocalDesembaraco: TEdit;
    Label30: TLabel;
    edtUFDesembaraco: TComboBox;
    Label31: TLabel;
    edtDataDesembaraco: TDateEdit;
    Label32: TLabel;
    edtCodigoExportador: TEdit;
    Label33: TLabel;
    tabPackingList: TZQuery;
    tabAuxPesos: TClientDataSet;
    tabAuxPesosCaixaNum: TIntegerField;
    tabAuxPesosPeso: TFloatField;
    procedure btnLocalizarCFOPClick(Sender: TObject);
    procedure btnLocalizarCCClick(Sender: TObject);
    procedure btnLocalizarFormasPagtoClick(Sender: TObject);
    procedure btnLocalizarLocalizacaoClick(Sender: TObject);
    procedure btnLocalizarTransportadoraClick(Sender: TObject);
    procedure edtCodigoCFOPChange(Sender: TObject);
    procedure edtCodigoCCChange(Sender: TObject);
    procedure edtCodigoFormasPagtoChange(Sender: TObject);
    procedure edtCodigoLocalizacaoChange(Sender: TObject);
    procedure edtCodigoTransportadoraChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dtsFormasPagtoDataChange(Sender: TObject; Field: TField);
    procedure btnConfirmarClick(Sender: TObject);
    procedure edtNotaFiscalExit(Sender: TObject);
    procedure edtValorFreteExit(Sender: TObject);
    procedure edtValorDescontoExit(Sender: TObject);
    procedure edtValorAcrescimoExit(Sender: TObject);
    procedure edtValorSeguroExit(Sender: TObject);
  private
    procedure AtualizaValores;
    function ProximaNota: string;
  public
    { Public declarations }
  end;

var
  fmGerarFaturamento: TfmGerarFaturamento;
  vCancela: Boolean;

implementation

uses uTipos, uLocalizarGenerico, uMenu, uFormBase, uFuncoes, uConstantes,
  DateUtils, uLocalizarCentroCusto, uLocalizarCFOP;

{$R *.dfm}

procedure TfmGerarFaturamento.btnLocalizarCFOPClick(Sender: TObject);
begin
   inherited;
   if not Assigned (fmLocalizarCfop) then begin
      Application.CreateForm(TfmLocalizarCfop, fmLocalizarCfop);
      fmLocalizarCfop.ShowModal; 
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edtCodigoCFOP.Text:=fmMenu.pubTrans1;
   end;
end;

procedure TfmGerarFaturamento.btnLocalizarCCClick(Sender: TObject);
begin
   inherited;
   if not Assigned (fmLocalizarCentroCusto) then begin
      Application.CreateForm(TfmLocalizarCentroCusto, fmLocalizarCentroCusto);
      fmLocalizarCentroCusto.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edtCodigoCC.Text:=fmMenu.pubTrans1;
   end;
end;

procedure TfmGerarFaturamento.btnLocalizarFormasPagtoClick(
  Sender: TObject);
var vParamLoc: TParametrosLocalizar;
begin
   inherited;
   vParamLoc.Table:='formas_pagamento';
   vParamLoc.KeyField:='Codigo';
   vParamLoc.Field1:='Descricao';
   if not Assigned (fmLocalizarGenerico) then begin
      Application.CreateForm(TfmLocalizarGenerico, fmLocalizarGenerico);
      fmLocalizarGenerico.LoadParams(vParamLoc);
      fmLocalizarGenerico.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edtCodigoFormasPagto.Text:=fmMenu.pubTrans1;
   end;
end;

procedure TfmGerarFaturamento.btnLocalizarLocalizacaoClick(
  Sender: TObject);
var vParamLoc: TParametrosLocalizar;
begin
   inherited;
   vParamLoc.Table:='genericos';
   vParamLoc.KeyField:='Codigo';
   vParamLoc.Field1:='Descricao';
   vParamLoc.Filter:='Tipo = '+QuotedStr('7');
   if not Assigned (fmLocalizarGenerico) then begin
      Application.CreateForm(TfmLocalizarGenerico, fmLocalizarGenerico);
      fmLocalizarGenerico.LoadParams(vParamLoc);
      fmLocalizarGenerico.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edtCodigoLocalizacao.Text:=fmMenu.pubTrans1;
   end;
end;

procedure TfmGerarFaturamento.btnLocalizarTransportadoraClick(
  Sender: TObject);
var vParamLoc: TParametrosLocalizar;
begin
   inherited;
   vParamLoc.Table:='transportadoras';
   vParamLoc.KeyField:='Codigo';
   vParamLoc.Field1:='Nome';
   if not Assigned (fmLocalizarGenerico) then begin
      Application.CreateForm(TfmLocalizarGenerico, fmLocalizarGenerico);
      fmLocalizarGenerico.LoadParams(vParamLoc);
      fmLocalizarGenerico.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edtCodigoTransportadora.Text:=fmMenu.pubTrans1;
   end;
end;

procedure TfmGerarFaturamento.edtCodigoCFOPChange(Sender: TObject);
begin
   inherited;
   try
      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT * FROM cfop WHERE CodigoCFOP = '+edtCodigoCFOP.Text);
      tabChecagens.Open;
      if tabChecagens.RecordCount > 0 then begin
         edtCFOP.Text:=tabChecagens.FieldByName('NaturezaOperacao').AsString;
       end
      else begin
         edtCFOP.Text:='';
      end;
   finally
      tabChecagens.Close;
   end;
end;

procedure TfmGerarFaturamento.edtCodigoCCChange(Sender: TObject);
begin
   inherited;
   try
      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT * FROM centro_custo WHERE Codigo = '+QuotedStr(edtCodigoCC.Text));
      tabChecagens.Open; 
      if tabChecagens.RecordCount > 0 then begin
         edtCentroCusto.Text:=tabChecagens.FieldByName('Descricao').AsString;
       end
      else begin
         edtCentroCusto.Text:='';
      end;
   finally
      tabChecagens.Close;
   end;
end;

procedure TfmGerarFaturamento.edtCodigoFormasPagtoChange(Sender: TObject);
begin
   inherited;
   AtualizaValores;
end;

procedure TfmGerarFaturamento.edtCodigoLocalizacaoChange(Sender: TObject);
begin
   inherited;
   try
      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT * FROM genericos WHERE Codigo = '+edtCodigoLocalizacao.Text+' AND Tipo = '+QuotedStr('7'));
      tabChecagens.Open;
      if tabChecagens.RecordCount > 0 then begin
         edtLocalizacao.Text:=tabChecagens.FieldByName('Descricao').AsString;
       end
      else begin
         edtLocalizacao.Text:='';
      end;
   finally
      tabChecagens.Close;
   end;
end;

procedure TfmGerarFaturamento.edtCodigoTransportadoraChange(
  Sender: TObject);
begin
   inherited;
   try
      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT Codigo,Nome FROM transportadoras WHERE Codigo = '+edtCodigoTransportadora.Text);
      tabChecagens.Open;
      if tabChecagens.RecordCount > 0 then begin
         edtTransportadora.Text:=tabChecagens.FieldByName('Nome').AsString;
       end
      else begin
         edtTransportadora.Text:=''; 
      end;
   finally
      tabChecagens.Close;
   end;
end;

procedure TfmGerarFaturamento.btnCancelarClick(Sender: TObject);
begin
   inherited;
   Close;
end;

procedure TfmGerarFaturamento.FormShow(Sender: TObject);
var vPesoBruto, vPesoLiquido : double;
begin
   inherited;

   tabAuxPesos.CreateDataSet;
   tabAuxPesos.EmptyDataSet;

   edtPedido.Text:=fmMenu.pubTrans1;
   edtHora.Text:=FormatDateTime('hh:nn:ss', Now);
   edtData.Date:=Date;
   edtSerie.Text:='001';
   edtNotaFiscal.Text:=ProximaNota;

   tabAuxParcelas.CreateDataSet;
   tabAuxParcelas.EmptyDataSet;

   tabConfigPropri.SQL.Add('SELECT Especie, Marca FROM configuracoes_proprietario');
   tabConfigPropri.Open;

   edtEspecie.Text:=tabConfigPropri.FieldByName('Especie').AsString;
   edtMarca.Text:=tabConfigPropri.FieldByName('Marca').AsString;

   tabParcelasPagto.Params.CreateParam(ftFloat, 'CodigoFormaPagto', ptUnknown);
   tabParcelasPagto.SQL.Add('SELECT * FROM parcelas_pagto WHERE CodigoFormaPagto = :CodigoFormaPagto');
   tabParcelasPagto.Open;

   if Trim(edtPedido.Text) <> '' then begin

      tabPedidos.Close;
      tabPedidos.SQL.Clear;
      tabPedidos.SQL.Add('SELECT * FROM pedidos WHERE NPedido = '+edtPedido.Text);
      tabPedidos.Open;

      tabPedidosProdutos.Close;
      tabPedidosProdutos.SQL.Clear;
      tabPedidosProdutos.SQL.Add('SELECT * FROM pedidos_produtos WHERE NPedido = '+edtPedido.Text);
      tabPedidosProdutos.Open;

      if not tabPedidos.FieldByName('CodigoCFOP').IsNull then begin
         edtCodigoCFOP.Text:=tabPedidos.FieldByName('CodigoCFOP').AsString;
      end;

      if not tabPedidos.FieldByName('CodigoTransportadora').IsNull then begin
         edtCodigoTransportadora.Text:=tabPedidos.FieldByName('CodigoTransportadora').AsString;
      end;

      if not tabPedidos.FieldByName('QtdCaixas').IsNull then begin
         edtQtdCaixas.Text:=tabPedidos.FieldByName('QtdCaixas').AsString;
      end;

      edtValorProdutos.Value:=tabPedidos.FieldByName('ValorProdutos').AsFloat;
      edtValorFrete.Value:=tabPedidos.FieldByName('ValorFrete').AsFloat;
      edtValorDesconto.Value:=tabPedidos.FieldByName('ValorDesconto').AsFloat;
      edtValorAcrescimo.Value:=tabPedidos.FieldByName('ValorAcrescimo').AsFloat;
      edtValorSeguro.Value:=tabPedidos.FieldByName('ValorSeguro').AsFloat;
      edtValorTotal.Value:=tabPedidos.FieldByName('ValorTotal').AsFloat;
      edtObservacao.Text:=tabPedidos.FieldByName('ConstarDadosAdNota').AsString; 

      if not tabPedidos.FieldByName('CodigoFormaPagto').IsNull then begin
         edtCodigoFormasPagto.Text:=tabPedidos.FieldByName('CodigoFormaPagto').AsString;
      end;

      tabPackingList.Close;
      tabPackingList.SQL.Clear;
      tabPackingList.SQL.Add('SELECT * FROM packing_list_produtos');
      tabPackingList.SQL.Add('WHERE Pedido = '+QuotedStr(edtPedido.Text));
      tabPackingList.SQL.Add('ORDER BY CodigoCaixa');
      tabPackingList.Open; 

      tabAuxPesos.EmptyDataSet;
      tabAuxPesos.IndexFieldNames:='CaixaNum';

      tabPackingList.First;
      while not tabPackingList.Eof do begin

         if not tabAuxPesos.FindKey([tabPackingList.FieldByName('CaixaNum').AsInteger]) then begin
            tabAuxPesos.Append;
            tabAuxPesosCaixaNum.Value:=tabPackingList.FieldByName('CaixaNum').AsInteger;
            tabAuxPesosPeso.Value:=tabPackingList.FieldByName('Peso').AsFloat;
            tabAuxPesos.Post;
         end;

         tabPackingList.Next;
      end;

      vPesoBruto:=0;
      tabAuxPesos.First;
      while not tabAuxPesos.Eof do begin
         vPesoBruto:=vPesoBruto + tabAuxPesosPeso.Value;     
         tabAuxPesos.Next;
      end; 

      if vPesoBruto > 0 then begin 
         edtPesoBruto.Text:=FormatFloat('0.000', vPesoBruto);  
         vPesoLiquido:=(vPesoBruto * 5) / 100;
         vPesoLiquido:=vPesoBruto - vPesoLiquido;
         edtPesoLiquido.Text:=FormatFloat('0.000', vPesoLiquido); 
      end;   
   end;
end;

procedure TfmGerarFaturamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabAuxParcelas.Close;
   tabPedidos.Close;
   tabPedidosVenctos.Close;
   tabPedidosProdutos.Close;
   tabFormasPagto.Close;
   tabParcelasPagto.Close;
   tabFatura.Close;
   tabFaturaProdutos.Close;
   tabFaturaVenctos.Close;
   tabTitulos.Close;
   tabConfigPropri.Close;
   tabPackingList.Close;
   tabAuxPesos.Close;
   inherited;
end;

procedure TfmGerarFaturamento.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
   vCancela:=True;
end;

procedure TfmGerarFaturamento.AtualizaValores;
var vCnt : integer;
begin
   if Trim(edtCodigoFormasPagto.Text) <> '' then begin

      tabFormasPagto.Close;
      tabFormasPagto.SQL.Clear;
      tabFormasPagto.SQL.Add('SELECT * FROM formas_pagamento WHERE Codigo = '+edtCodigoFormasPagto.Text);
      tabFormasPagto.Open;

      if tabFormasPagto.RecordCount > 0 then begin

         edtFormasPagto.Text:=tabFormasPagto.FieldByName('Descricao').AsString;
         edtParcelas.Text:=tabFormasPagto.FieldByName('Parcelas').AsString;

         edtValorTotal.Value:=(edtValorProdutos.Value-edtValorDesconto.Value) + edtValorFrete.Value + edtValorAcrescimo.Value + edtValorSeguro.Value;

         tabParcelasPagto.First;
         edtVencto1.Date:=edtData.Date+tabParcelasPagto.FieldByName('Dias').AsInteger;

         dbgTitulos.DataSource:=nil;
         try
            tabAuxParcelas.EmptyDataSet;


            for vCnt:=1 to tabFormasPagto.FieldByName('Parcelas').AsInteger do begin
               tabAuxParcelas.Append;
               tabAuxParcelasParcela.Value:=vCnt;
               tabAuxParcelasVencimento.Value:=edtData.Date + tabParcelasPagto.FieldByName('Dias').AsInteger;
               tabAuxParcelasValor.Value:=(edtValorTotal.Value * tabParcelasPagto.FieldByName('PesoParcela').AsFloat) / 100;
               tabAuxParcelas.Post;
               tabParcelasPagto.Next;
            end;
         finally
            dbgTitulos.DataSource:=dtsAuxParcelas;
         end;
      end;
   end;
end;

procedure TfmGerarFaturamento.dtsFormasPagtoDataChange(Sender: TObject;
  Field: TField);
begin
   inherited;
   tabParcelasPagto.Close;
   tabParcelasPagto.ParamByName('CodigoFormaPagto').AsFloat:=tabFormasPagto.FieldByName('Codigo').AsFloat;
   tabParcelasPagto.Open;
end;

function TfmGerarFaturamento.ProximaNota: string;
var vFaturaInt : Integer;
begin
   tabChecagens.Close;
   tabChecagens.SQL.Clear; // TipoTela = 1 AND  "Não faço diferença de notas de clientes/fornecedores emitidas, não pode repetir!.
   tabChecagens.SQL.Add('SELECT MAX(Fatura) AS vMaxFat FROM faturamento WHERE Data > '+QuotedSTr(FormatDateTime(sis_date_format, StartOfTheYear(Date))));
   tabChecagens.Open;

   if not tabChecagens.FieldByName('vMaxFat').IsNull then begin
      vFaturaInt:=StrToInt('0'+tabChecagens.FieldByName('vMaxFat').AsString);
      vFaturaInt:=vFaturaInt + 1;
      Result:=StrZero(vFaturaInt, 6);
    end
   else begin
      vFaturaInt:=1;
      Result:=StrZero(vFaturaInt, 6);
   end;
end;

procedure TfmGerarFaturamento.btnConfirmarClick(Sender: TObject);
var vCnt: Integer;
    vNota: string;
begin
   inherited;
   if Trim(edtData.Text) = '/  /' then begin
      ShowMessage('Obrigatório Preenchimento da Data');
      edtData.SetFocus;
      exit;
   end;
   if Trim(edtCodigoCFOP.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do CFOP');
      edtCodigoCFOP.SetFocus;
      exit;
   end;
   if Trim(edtCodigoCC.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Centro de Custo');
      edtCodigoCC.SetFocus;
      exit;
   end;
   if Trim(edtCodigoFormasPagto.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Forma de Pagamento');
      edtCodigoFormasPagto.SetFocus;
      exit;
   end;
   if Trim(edtCodigoLocalizacao.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Localização');
      edtCodigoLocalizacao.SetFocus;
      exit;
   end;
   if Trim(edtCodigoTransportadora.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Transportadora');
      edtCodigoTransportadora.SetFocus;
      exit;
   end;
   if Trim(edtNotaFiscal.Text) <> '' then begin
      if Trim(edtQtdCaixas.Text) = '' then begin
         ShowMessage('Obrigatório Preenchimento da Qtd de Caixas');
         edtQtdCaixas.SetFocus;
         exit; 
      end;
   end;

   vNota:='';

   if Trim(edtNotaFiscal.Text) <> '' then begin
      tabFatura.Close;
      tabFatura.SQL.Clear;
      tabFatura.SQL.Add('SELECT * FROM faturamento WHERE 0');
      tabFatura.Open;

      vNota:=edtNotaFiscal.Text;

      tabFatura.Append;
      tabFatura.FieldByName('Fatura').AsString:=edtNotaFiscal.Text;
      tabFatura.FieldByName('Serie').AsString:=edtSerie.Text;
      tabFatura.FieldByName('CodigoEmpresa').AsFloat:=tabPedidos.FieldByName('CodigoEmpresa').AsFloat;
      tabFatura.FieldByName('TipoTela').AsFloat:=1;
      tabFatura.FieldByName('NPedido').AsFloat:=tabPedidos.FieldByName('NPedido').AsFloat;
      tabFatura.FieldByName('CodigoConta').AsFloat:=tabPedidos.FieldByName('CodigoCliente').AsFloat;
      tabFatura.FieldByName('Data').AsDateTime:=edtData.Date;
      tabFatura.FieldByName('ValorProdutos').AsFloat:=edtValorProdutos.Value;
      tabFatura.FieldByName('ValorDesconto').AsFloat:=edtValorDesconto.Value;
      tabFatura.FieldByName('ValorTotal').AsFloat:=edtValorTotal.Value;
      tabFatura.FieldByName('CodigoFuncionario').AsFloat:=tabPedidos.FieldByName('CodigoFuncionario').AsFloat;
      tabFatura.FieldByName('Observacao').AsString:=edtObservacao.Text;
      tabFatura.FieldByName('TipoNota').AsFloat:=1;
      tabFatura.FieldByName('CodigoTabPreco').AsFloat:=tabPedidos.FieldByName('CodigoTabPreco').AsFloat;
      tabFatura.FieldByName('CodigoFormaPagto').AsFloat:=tabPedidos.FieldByName('CodigoFormaPagto').AsFloat;
      tabFatura.FieldByName('Parcelas').AsInteger:=StrToInt(edtParcelas.Text);
      tabFatura.FieldByName('CodigoCFOP').AsFloat:=StrToFloat(edtCodigoCFOP.Text);
      tabFatura.FieldByName('CodigoTransportadora').AsFloat:=StrToFloat(edtCodigoTransportadora.Text);
      tabFatura.FieldByName('PesoLiquido').AsString:=edtPesoLiquido.Text;
      tabFatura.FieldByName('PesoBruto').AsString:=edtPesoBruto.Text;
      tabFatura.FieldByName('Marca').AsString:=edtMarca.Text;
      tabFatura.FieldByName('Especie').AsString:=edtEspecie.Text;
      case edtFreteConta.ItemIndex of
         0: tabFatura.FieldByName('FreteConta').AsInteger:=0;
         1: tabFatura.FieldByName('FreteConta').AsInteger:=1;
         2: tabFatura.FieldByName('FreteConta').AsInteger:=2;
         3: tabFatura.FieldByName('FreteConta').AsInteger:=9;
      end;
      if Trim(edtQtdCaixas.Text) <> '' then begin
         tabFatura.FieldByName('QtdVolumes').AsInteger:=StrToInt(edtQtdCaixas.Text);
      end;
      tabFatura.FieldByName('ValorFrete').AsFloat:=edtValorFrete.Value;
      tabFatura.FieldByName('CodigoCentroCusto').AsString:=edtCodigoCC.Text;
      tabFatura.FieldByName('ValorAcrescimo').AsFloat:=edtValorAcrescimo.Value;
      tabFatura.FieldByName('ValorSeguro').AsFloat:=edtValorSeguro.Value;
      case edtFormaPagto.ItemIndex of
         0: tabFatura.FieldByName('NFEFormaPagto').AsString:='0';
         1: tabFatura.FieldByName('NFEFormaPagto').AsString:='1';
         2: tabFatura.FieldByName('NFEFormaPagto').AsString:='2';
      end;
      tabFatura.FieldByName('NFEFmtImpDANFE').AsInteger:=1;
      tabFatura.FieldByName('NFEIdentAmbiente').AsInteger:=1;
      tabFatura.FieldByName('CSTCSOSN').AsString:=tabPedidos.FieldByName('CSTCSOSN').AsString;
      // Exportação
      tabFatura.FieldByName('UFEmbarque').AsString:=edtUFEmbarque.Text;
      tabFatura.FieldByName('LocalEmbarque').AsString:=edtLocalEmbarque.Text;
      // Importação
      tabFatura.FieldByName('NDI').AsString:=edtNDI.Text;
      if Trim(edtDataRegistroNDI.Text) <> '/  /' then begin
         tabFatura.FieldByName('DataDI').AsDateTime:=edtDataRegistroNDI.Date;
      end;
      tabFatura.FieldByName('LocalDesembaraco').AsString:=edtLocalDesembaraco.Text;
      tabFatura.FieldByName('UFDesembaraco').AsString:=edtUFDesembaraco.Text;
      if Trim(edtDataDesembaraco.Text) <> '/  /' then begin
         tabFatura.FieldByName('DataDesembaraco').AsDateTime:=edtDataDesembaraco.Date;
      end;
      tabFatura.FieldByName('CodigoExportador').AsString:=edtCodigoExportador.Text;
      tabFatura.Post; 
      tabFatura.ApplyUpdates; 

      tabFaturaProdutos.Close;
      tabFaturaProdutos.SQL.Clear;
      tabFaturaProdutos.SQL.Add('SELECT * FROM faturamento_produtos WHERE 0');
      tabFaturaProdutos.Open;

      tabPedidosProdutos.First;
      while not tabPedidosProdutos.Eof do begin

         tabFaturaProdutos.Append;
         tabFaturaProdutos.FieldByName('ID').AsFloat:=CodeGenerator('faturamento_produtos', 'ID');
         tabFaturaProdutos.FieldByName('Fatura').AsString:=edtNotaFiscal.Text;
         tabFaturaProdutos.FieldByName('Serie').AsString:=edtSerie.Text;
         tabFaturaProdutos.FieldByName('TipoTela').AsFloat:=1;
         tabFaturaProdutos.FieldByName('CodigoEmpresa').AsFloat:=tabPedidos.FieldByName('CodigoEmpresa').AsFloat;
         tabFaturaProdutos.FieldByName('CodigoProduto').AsString:=tabPedidosProdutos.FieldByName('CodigoProduto').AsString;
         tabFaturaProdutos.FieldByName('Quantidade').AsFloat:=tabPedidosProdutos.FieldByName('Quantidade').AsFloat;
         tabFaturaProdutos.FieldByName('Valor').AsFloat:=tabPedidosProdutos.FieldByName('Valor').AsFloat;
         tabFaturaProdutos.FieldByName('ValorTotal').AsFloat:=tabPedidosProdutos.FieldByName('ValorTotal').AsFloat;
         tabFaturaProdutos.FieldByName('Descricao').AsString:=tabPedidosProdutos.FieldByName('Descricao').AsString;
         tabFaturaProdutos.FieldByName('Composto').AsInteger:=tabPedidosProdutos.FieldByName('Composto').AsInteger;
         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT NCM FROM produtos WHERE CodigoProduto = '+QuotedStr(tabPedidosProdutos.FieldByName('CodigoProduto').AsString));
            tabChecagens.Open;
            tabFaturaProdutos.FieldByName('NCM').AsString:=tabChecagens.FieldByName('NCM').AsString;
         finally
            tabChecagens.Close;
         end;

         tabFaturaProdutos.Post;
         tabFaturaProdutos.ApplyUpdates; 

         tabPedidosProdutos.Next;
      end;

      tabFaturaVenctos.Close;
      tabFaturaVenctos.SQL.Clear;
      tabFaturaVenctos.SQL.Add('SELECT * FROM faturamento_vencimentos WHERE 0');
      tabFaturaVenctos.Open;

      tabFaturaVenctos.Append;
      tabFaturaVenctos.FieldByName('Fatura').AsString:=edtNotaFiscal.Text;
      tabFaturaVenctos.FieldByName('Serie').AsString:=edtSerie.Text;
      tabFaturaVenctos.FieldByName('CodigoEmpresa').AsFloat:=tabPedidos.FieldByName('CodigoEmpresa').AsFloat;
      tabFaturaVenctos.FieldByName('TipoTela').AsFloat:=1;

      vCnt:=0;
      tabAuxParcelas.First;
      while not tabAuxParcelas.Eof do begin
         vCnt:=vCnt + 1;
         tabFaturaVenctos.FieldByName('Valor'+IntToStr(vCnt)).AsFloat:=tabAuxParcelasValor.Value;
         if not tabAuxParcelasVencimento.IsNull then begin
            tabFaturaVenctos.FieldByName('DataVencto'+IntToStr(vCnt)).AsDateTime:=tabAuxParcelasVencimento.Value;
         end;

         tabAuxParcelas.Next;
      end;
      tabFaturaVenctos.Post;
      tabFaturaVenctos.ApplyUpDates;
   end;

   vCnt:=0;
   tabAuxParcelas.First;
   while not tabAuxParcelas.Eof do begin
      vCnt:=vCnt + 1;
      
      // Títulos
      tabTitulos.Close;
      tabTitulos.SQL.Clear;
      tabTitulos.SQL.Add('SELECT * FROM titulos_receber WHERE 0'); 
      tabTitulos.Open; 

      tabTitulos.Append;
      tabTitulos.FieldByName('Titulo').AsFloat:=CodeGenerator('titulos_receber', 'Titulo');
      tabTitulos.FieldByName('Documento').AsFloat:=tabPedidos.FieldByName('NPedido').AsFloat;
      tabTitulos.FieldByName('CodigoConta').AsFloat:=tabPedidos.FieldByName('CodigoCliente').AsFloat;
      tabTitulos.FieldByName('Parcela').AsInteger:=vCnt;
      tabTitulos.FieldByName('TipoConta').AsString:='1';
      tabTitulos.FieldByName('CodigoLocalizacao').AsFloat:=StrToFloat(edtCodigoLocalizacao.Text);
      tabTitulos.FieldByName('CodigoEmpresa').AsFloat:=tabPedidos.FieldByName('CodigoEmpresa').AsFloat;
      tabTitulos.FieldByName('ValorTotal').AsFloat:=tabAuxParcelasValor.Value;
      tabTitulos.FieldByName('DataEmissao').AsDateTime:=edtData.Date;  
      tabTitulos.FieldByName('DataVencimento').AsDateTime:=tabAuxParcelasVencimento.Value;
      tabTitulos.FieldByName('NotaFiscal').AsString:=edtNotaFiscal.Text;
      tabTitulos.FieldByName('CodigoCentroCusto').AsString:=edtCodigoCC.Text;
      tabTitulos.FieldByName('Observacao').AsString:=edtObservacao.Text;
      tabTitulos.FieldByName('Serie').AsString:=edtSerie.Text;
      tabTitulos.FieldByName('PedidoVenda').AsInteger:=1;// '1' Gerado atraves de pedido de venda, '0' gerado avuslo
      tabTitulos.FieldByName('ImpressoBoleto').AsString:='Não';
      tabTitulos.FieldByName('GeradoRemessa').AsString:='Não';
      tabTitulos.Post;
      tabTitulos.ApplyUpdates;

      tabAuxParcelas.Next; 
   end; 

   tabPedidos.Edit;
   tabPedidos.FieldByName('CodigoCFOP').AsFloat:=StrToFloat(edtCodigoCFOP.Text);
   tabPedidos.FieldByName('CodigoTransportadora').AsFloat:=StrToFloat(edtCodigoTransportadora.Text);
   tabPedidos.FieldByName('CodigoFormaPagto').AsFloat:=StrToFloat(edtCodigoFormasPagto.Text);
   if Trim(edtQtdCaixas.Text) <> '' then begin
      tabPedidos.FieldByName('QtdCaixas').AsInteger:=StrToInt(edtQtdCaixas.Text); 
   end;
   tabPedidos.FieldByName('ValorProdutos').AsFloat:=edtValorProdutos.Value;
   tabPedidos.FieldByName('ValorFrete').AsFloat:=edtValorFrete.Value;
   tabPedidos.FieldByName('ValorDesconto').AsFloat:=edtValorDesconto.Value;
   tabPedidos.FieldByName('ValorAcrescimo').AsFloat:=edtValorAcrescimo.Value;
   tabPedidos.FieldByName('ValorSeguro').AsFloat:=edtValorSeguro.Value;
   tabPedidos.FieldByName('ValorTotal').AsFloat:=edtValorTotal.Value;
   tabPedidos.FieldByName('DataEntrega').AsDateTime:=Date;
   tabPedidos.FieldByName('Fatura').AsString:=vNota;
   tabPedidos.Post;
   tabPedidos.ApplyUpdates; 

   if Trim(edtNotaFiscal.Text) <> '' then begin
      ShowMessage('Gerado Fatura Numero: '+edtNotaFiscal.Text);
    end
   else begin
      ShowMessage('Pedido Finalizado SEM Fatura');  
   end;
   Close;
end;

procedure TfmGerarFaturamento.edtNotaFiscalExit(Sender: TObject);
begin
   inherited;
   if Trim(edtNotaFiscal.Text) <> '' then begin
      edtNotaFiscal.Text:=StrZero(edtNotaFiscal.Text, 6);
   end;
end;

procedure TfmGerarFaturamento.edtValorFreteExit(Sender: TObject);
begin
   inherited;
   AtualizaValores;
end;

procedure TfmGerarFaturamento.edtValorDescontoExit(Sender: TObject);
begin
   inherited;
   AtualizaValores;
end;

procedure TfmGerarFaturamento.edtValorAcrescimoExit(Sender: TObject);
begin
   inherited;
   AtualizaValores;
end;

procedure TfmGerarFaturamento.edtValorSeguroExit(Sender: TObject);
begin
   inherited;
   AtualizaValores;
end;

end.

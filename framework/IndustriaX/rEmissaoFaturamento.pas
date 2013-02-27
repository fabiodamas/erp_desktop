unit rEmissaoFaturamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls, ToolEdit;

type
  TrtEmissaoFaturamento = class(TfmFormBaseRelatorio)
    tabBase: TZQuery;
    pndDialogo: TPrintDialog;
    qrpFaturamento: TQuickRep;
    QRSubDetail1: TQRSubDetail;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    qrlSignature: TQRLabel;
    QRDBText3: TQRDBText;
    QRShape1: TQRShape;
    qrlTitulo: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape2: TQRShape;
    QRSysData2: TQRSysData;
    QRDBText7: TQRDBText;
    rdgOrdemEmissao: TRadioGroup;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    Label3: TLabel;
    Label4: TLabel;
    edtDataInicial: TDateEdit;
    edtDataFinal: TDateEdit;
    rdgTipoNota: TRadioGroup;
    rdgTipoMovimento: TRadioGroup;
    rdgStatusNota: TRadioGroup;
    qrlTotal: TQRLabel;
    Label1: TLabel;
    edtCodigoVendedor: TEdit;
    edtVendedor: TEdit;
    Label2: TLabel;
    edtCodigoCentroCusto: TEdit;
    edtCentroCusto: TEdit;
    btnLocalizarVendedor: TBitBtn;
    btnLocalizarCentroCusto: TBitBtn;
    tabChecagens: TZQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure edtCodigoVendedorChange(Sender: TObject);
    procedure edtCodigoCentroCustoChange(Sender: TObject);
    procedure btnLocalizarCentroCustoClick(Sender: TObject);
    procedure btnLocalizarVendedorClick(Sender: TObject);
    procedure qrpFaturamentoBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
     procedure GerarImpressao(Impressora: Boolean = False);
  public
  end;

var vProdutos, vDesconto, vFrete, vAcrescimo, vSeguro, vIPI, vTotal: real;

implementation

uses uFormBase, uMenu, uFuncoes, uConstantes, uLocalizarFuncionarios, uTipos,
     uLocalizarCentroCusto;

{$R *.dfm}

procedure TrtEmissaoFaturamento.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TrtEmissaoFaturamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabBase.Close;
   inherited;
end;

procedure TrtEmissaoFaturamento.btnVisualizarClick(Sender: TObject);
begin
   inherited;
   GerarImpressao();
end;

procedure TrtEmissaoFaturamento.GerarImpressao(Impressora: Boolean = False);
var vWhere : string;
begin
   vWhere:='';

   tabBase.Close;
   tabBase.SQL.Clear;
   tabBase.SQL.Add('SELECT faturamento.Fatura, faturamento.Data, faturamento.ValorProdutos,');
   tabBase.SQL.Add('faturamento.ValorDesconto, faturamento.ValorFrete, faturamento.ValorAcrescimo,');
   tabBase.SQL.Add('faturamento.ValorSeguro, faturamento.ValorIPI, faturamento.ValorTotal,');
   tabBase.SQL.Add('IF(faturamento.TipoTela = 1, clientes.NomeFantasia, fornecedores.NomeFantasia) AS Nome');
   tabBase.SQL.Add('FROM faturamento');
   tabBase.SQL.Add('LEFT JOIN fornecedores ON faturamento.CodigoConta = fornecedores.CodigoFornecedor');
   tabBase.SQL.Add('LEFT JOIN clientes ON faturamento.CodigoConta = clientes.CodigoCliente');

   qrlTitulo.Caption:='Faturamento';

   case rdgTipoNota.ItemIndex of
      1: begin
         if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
         vWhere:=vWhere + 'faturamento.TipoTela = 1';
      end;
      2: begin
         if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
         vWhere:=vWhere + 'faturamento.TipoTela = 2';
      end;
   end;

   case rdgTipoMovimento.ItemIndex of
      1: begin
         if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
         vWhere:=vWhere + 'faturamento.TipoNota = 2';
      end;
      2: begin
         if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
         vWhere:=vWhere + 'faturamento.TipoNota = 1';
      end;
   end;

   case rdgStatusNota.ItemIndex of
      1: begin
         if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
         vWhere:=vWhere + 'faturamento.DataCancelamento IS NULL';
      end;
      2: begin
         if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
         vWhere:=vWhere + 'faturamento.DataCancelamento IS NOT NULL';
      end;
   end;

   if (Trim(edtDataInicial.Text) <> '/  /') and (Trim(edtDataFinal.Text) <> '/  /') then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Período: '+edtDataInicial.Text+' a '+edtDataFinal.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'faturamento.Data >= '+QuotedStr(FormatDateTime(sis_date_format, edtDataInicial.Date))+' AND Data <= '+QuotedStr(FormatDateTime(sis_date_format, edtDataFinal.Date));
   end;

   if Trim(edtCodigoVendedor.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Vendedor: '+edtVendedor.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'faturamento.CodigoFuncionario = '+edtCodigoVendedor.Text;
   end;

   if Trim(edtCodigoCentroCusto.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - C.Custo: '+edtCentroCusto.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'faturamento.CodigoCentroCusto = '+QuotedStr(edtCodigoCentroCusto.Text);
   end;

   if Trim(vWhere) <> '' then begin
      tabBase.SQL.Add('WHERE');
      tabBase.SQL.Add(vWhere);
   end;

   tabBase.SQL.Add('ORDER BY');
   case rdgOrdemEmissao.ItemIndex of
      0: tabBase.SQL.Add('Data,TipoTela');
      1: tabBase.SQL.Add('Fatura,TipoTela');
   end;

   tabBase.Open;

   vProdutos:=0;
   vDesconto:=0;
   vFrete:=0;
   vAcrescimo:=0;
   vSeguro:=0;
   vIPI:=0;
   vTotal:=0; 

   if Impressora = True then begin
      if pndDialogo.Execute then begin
         qrpFaturamento.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
         qrpFaturamento.Print;
      end;
    end
   else begin
      qrpFaturamento.PreviewModal;
   end;
end;

procedure TrtEmissaoFaturamento.btnImprimirClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(True);
end;

procedure TrtEmissaoFaturamento.QRSubDetail1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
   inherited;
   vProdutos :=vProdutos  + tabBase.FieldByName('ValorProdutos').AsFloat;
   vDesconto :=vDesconto  + tabBase.FieldByName('ValorDesconto').AsFloat;
   vFrete    :=vFrete     + tabBase.FieldByName('ValorFrete').AsFloat;
   vAcrescimo:=vAcrescimo + tabBase.FieldByName('ValorAcrescimo').AsFloat;
   vSeguro   :=vSeguro    + tabBase.FieldByName('ValorSeguro').AsFloat;
   vIPI      :=vIPI       + tabBase.FieldByName('ValorIPI').AsFloat;
   vTotal    :=vTotal     + tabBase.FieldByName('ValorTotal').AsFloat;

   qrlTotal.Caption:='Produtos: '+FormatFloat(sis_curr_format, vProdutos)+
                 ' - Descontos: '+FormatFloat(sis_curr_format, vDesconto)+
                 ' - Frete: '    +FormatFloat(sis_curr_format, vFrete)+
                 ' - Acréscimo: '+FormatFloat(sis_curr_format, vAcrescimo)+
                 ' - Seguro: '   +FormatFloat(sis_curr_format, vSeguro)+
                 ' - IPI: '      +FormatFloat(sis_curr_format, vIPI)+
                 ' - Total: '    +FormatFloat(sis_curr_format, vTotal);
end;

procedure TrtEmissaoFaturamento.edtCodigoVendedorChange(Sender: TObject);
begin
   inherited;
   if Trim(edtCodigoVendedor.Text) <> '' then begin
      try
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT Nome FROM funcionarios WHERE Codigo = '+QuotedStr(edtCodigoVendedor.Text));
         tabChecagens.Open;

         if tabChecagens.RecordCount > 0 then begin
            edtVendedor.Text:=tabChecagens.FieldByName('Nome').AsString;
          end
         else begin
            edtVendedor.Text:='';  
         end;
      finally
         tabChecagens.Close;
      end;
    end
   else begin
      edtVendedor.Text:='';
   end;
end;

procedure TrtEmissaoFaturamento.edtCodigoCentroCustoChange(
  Sender: TObject);
begin
   inherited;
   if Trim(edtCodigoCentroCusto.Text) <> '' then begin
      try
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT Descricao FROM centro_custo WHERE Codigo = '+QuotedStr(edtCodigoCentroCusto.Text));
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
    end
   else begin
      edtCentroCusto.Text:='';
   end;
end;

procedure TrtEmissaoFaturamento.btnLocalizarCentroCustoClick(
  Sender: TObject);
begin
   inherited;
   if not Assigned (fmLocalizarCentroCusto) then begin
      Application.CreateForm(TfmLocalizarCentroCusto, fmLocalizarCentroCusto);
      fmLocalizarCentroCusto.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edtCodigoCentroCusto.Text:=fmMenu.pubTrans1;
   end;
end;

procedure TrtEmissaoFaturamento.btnLocalizarVendedorClick(Sender: TObject);
begin
   inherited;
   if not Assigned (fmLocalizarFuncionarios) then begin
      Application.CreateForm(TfmLocalizarFuncionarios, fmLocalizarFuncionarios);
      fmLocalizarFuncionarios.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edtCodigoVendedor.Text:=fmMenu.pubTrans1;
   end;
end;

procedure TrtEmissaoFaturamento.qrpFaturamentoBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   inherited;
   vProdutos:=0;
   vDesconto:=0;
   vFrete:=0;
   vAcrescimo:=0;
   vSeguro:=0;
   vIPI:=0;
   vTotal:=0;
end;

end.

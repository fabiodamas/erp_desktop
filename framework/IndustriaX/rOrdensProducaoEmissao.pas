unit rOrdensProducaoEmissao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls;

type
  TrtOrdensProducaoEmissao = class(TfmFormBaseRelatorio)
    tabBase: TZQuery;
    pndDialogo: TPrintDialog;
    qrpOP: TQuickRep;
    QRSubDetail1: TQRSubDetail;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    qrlSignature: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRShape1: TQRShape;
    qrlTitulo: TQRLabel;
    QRSysData1: TQRSysData;
    qrlTotal: TQRLabel;
    QRShape2: TQRShape;
    tabChecagens: TZQuery;
    edtOP: TEdit;
    Label1: TLabel;
    QRSysData2: TQRSysData;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRSubDetail2: TQRSubDetail;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    tabAuxProdutos: TClientDataSet;
    tabAuxProdutosCodigoProduto: TStringField;
    tabAuxProdutosDescricao: TStringField;
    tabAuxProdutosProduzir: TFloatField;
    QRLabel14: TQRLabel;
    QRDBText7: TQRDBText;
    qrl1: TQRLabel;
    QRDBText8: TQRDBText;
    tabChecagens2: TZQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtOPKeyPress(Sender: TObject; var Key: Char);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrpOPBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    FOP: string;
  public
    procedure GerarImpressao(Impressora: Boolean = False);
  end;

var
   vTotQtd: real;

implementation

uses uFormBase, uMenu, uFuncoes, uFinaPediRelaExpe;

{$R *.dfm}

procedure TrtOrdensProducaoEmissao.FormCreate(Sender: TObject);
begin
   inherited;
   // Se a finalizacao de pedido nao está aberta, deixamos o form como filho
   if not FormExiste('frmFinalizarPedido') then
   begin
    SetFormStyle(fsMDIChild);
   end;
   
end;

procedure TrtOrdensProducaoEmissao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabBase.Close;
   tabAuxProdutos.Close;
   inherited;
end;

procedure TrtOrdensProducaoEmissao.btnVisualizarClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(); 
end;

procedure TrtOrdensProducaoEmissao.GerarImpressao(Impressora: Boolean = False);
var
  vCnt, vCnt2 : Integer;
  vQtd : Integer;
begin
   if Trim(edtOP.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Numero da O.P.');
      edtOP.SetFocus;
      exit;
   end;

   tabAuxProdutos.EmptyDataSet; 

   tabBase.Close;
   tabBase.SQL.Clear;
   tabBase.SQL.Add('SELECT ordem_producao.Data, ordem_producao.OrdemProducao, clientes.NomeFantasia, ordem_producao.DataPrevisao, ordem_producao.Observacoes, ordem_producao.CodigoPedido');
   tabBase.SQL.Add('FROM ordem_producao, clientes');
   tabBase.SQL.Add('WHERE ordem_producao.OrdemProducao = '+edtOP.Text);
   tabBase.SQL.Add('AND ordem_producao.CodigoCliente = clientes.CodigoCliente');
   tabBase.Open;

   try
      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT * FROM ordem_producao_produtos WHERE OrdemProducao = '+edtOP.Text);
      tabChecagens.Open;

      tabChecagens.First;
      while not tabChecagens.Eof do begin

        try
          tabChecagens2.Close;
          tabChecagens2.SQL.Clear;
          tabChecagens2.Params.Clear;
          tabChecagens2.Params.CreateParam(ftString, 'CodigoProduto', ptUnknown);
          tabChecagens2.SQL.Add(' SELECT ');
          tabChecagens2.SQL.Add('    produtos.CodigoProduto, ');
          tabChecagens2.SQL.Add('    COALESCE(unidades.quantidade, 1) Quantidade, ');
          tabChecagens2.SQL.Add('    Unidades.Sigla ');
          tabChecagens2.SQL.Add(' FROM ');
          tabChecagens2.SQL.Add('    produtos ');
          tabChecagens2.SQL.Add('        left join ');
          tabChecagens2.SQL.Add('    unidades ON produtos.CodigoUnidade = unidades.Codigo ');
          tabChecagens2.SQL.Add(' where ');
          tabChecagens2.SQL.Add('    produtos.CodigoProduto = :CodigoProduto ');
          tabChecagens2.ParamByName('CodigoProduto').AsString := tabChecagens.FieldByName('CodigoProduto').AsString;
          tabChecagens2.Open;

          vQtd := 1;

          if tabChecagens2.RecordCount > 0 then
          begin
            vQtd := tabChecagens2.FieldByName('Quantidade').AsInteger;
          end;

          tabAuxProdutos.Append;
          tabAuxProdutosCodigoProduto.Value := tabChecagens.FieldByName('CodigoProduto').AsString;
          tabAuxProdutosDescricao.Value     := tabChecagens.FieldByName('Descricao').AsString;
          tabAuxProdutosProduzir.Value      := tabChecagens.FieldByName('Quantidade').AsFloat * vQtd;
          tabAuxProdutos.Post;

        finally
          tabChecagens2.Close;
        end;

        tabChecagens.Next;
      end;

      tabAuxProdutos.First;

   finally
      tabChecagens.Close;
   end;   

   vTotQtd:=0;

   qrlTitulo.Caption:='Ordem de Produção - '+edtOP.Text;

   if Impressora = True then begin
    // Se a finalização do pedido está aberta
    if FormExiste('frmFinalizarPedido') then
    begin
      // Definimos as impressoras de destino e imprimidos
      for vCnt:= 0 to frmFinaPediRelaExpe.lstImpressorasSelecionadas.Count-1 do
      begin

        for vCnt2:=0 to (Printer.Printers.Count-1) do
        begin
            if Trim(Printer.Printers.Strings[vCnt2]) =  Trim(frmFinaPediRelaExpe.lstImpressorasSelecionadas.Items[vCnt]) then
            begin
             qrpOP.PrinterSettings.PrinterIndex := vCnt2;
             qrpOP.Print;
             Break;
            end;
        end;

      end;
    end
    else
    begin
      if pndDialogo.Execute then begin
         qrpOP.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
         qrpOP.Print;
      end;
    end;

   end
   else begin
      qrpOP.PreviewModal;
   end;
end;

procedure TrtOrdensProducaoEmissao.btnImprimirClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(True); 
end;

procedure TrtOrdensProducaoEmissao.FormShow(Sender: TObject);
begin
   inherited;
   FOP:=fmMenu.pubTrans1;
   edtOP.Text:=FOP;

   tabAuxProdutos.CreateDataSet;
   tabAuxProdutos.EmptyDataSet;
end;

procedure TrtOrdensProducaoEmissao.edtOPKeyPress(Sender: TObject;
  var Key: Char);
begin
   inherited;
   if not (Key in['0'..'9',Chr(8)]) then Key:=#0;
end;

procedure TrtOrdensProducaoEmissao.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
   vTotQtd:=vTotQtd+ tabAuxProdutosProduzir.Value;
   qrlTotal.Caption:='Total Qtd: '+FloatToStr(vTotQtd);
end;

procedure TrtOrdensProducaoEmissao.qrpOPBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   inherited;
   vTotQtd:=0;
end;

end.

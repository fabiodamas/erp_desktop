unit rMateriaPrima;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls, Gauges;

type
  TrtMateriaPrima = class(TfmFormBaseRelatorio)
    tabBase: TZQuery;
    pndDialogo: TPrintDialog;
    qrpMP: TQuickRep;
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
    Label1: TLabel;
    edtGrupo: TDBLookupComboBox;
    Label2: TLabel;
    edtMoeda: TDBLookupComboBox;
    edtGrupoRemover: TDBLookupComboBox;
    Label5: TLabel;
    tabGrupos: TZQuery;
    dtsGrupos: TDataSource;
    tabTiposIndices: TZQuery;
    dtsTiposIndices: TDataSource;
    qrlEndereco: TQRLabel;
    qrdPais: TQRDBText;
    qrlPais: TQRLabel;
    qrlEmail: TQRLabel;
    qrlTotal: TQRLabel;
    Label9: TLabel;
    edtNaoMoeda: TDBLookupComboBox;
    lstGrupos: TListBox;
    btnGrupoAdicionar: TBitBtn;
    btnGrupoRemover: TBitBtn;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    tabAuxMP: TClientDataSet;
    tabAuxMPCodigo: TStringField;
    tabAuxMPMateriaPrima: TStringField;
    tabAuxMPMoeda: TStringField;
    tabAuxMPUnidade: TStringField;
    tabAuxMPEstoque: TFloatField;
    tabAuxMPPreco: TCurrencyField;
    tabAuxMPTotal: TCurrencyField;
    gagProgresso: TGauge;
    tabAuxMPQtdMoeda: TFloatField;
    tabChecagens: TZQuery;
    rdgStatusEstoque: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGrupoAdicionarClick(Sender: TObject);
    procedure btnGrupoRemoverClick(Sender: TObject);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrpMPBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    procedure GerarImpressao(Impressora: Boolean = False);
  public
  end;

var vEstoque, vPreco, vTotal: real;

implementation

uses uFormBase, uMenu, uFuncoes, uConstantes;

{$R *.dfm}

procedure TrtMateriaPrima.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TrtMateriaPrima.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabBase.Close;
   tabGrupos.Close;
   tabTiposIndices.Close;
   tabAuxMP.Close;
   inherited;
end;

procedure TrtMateriaPrima.btnVisualizarClick(Sender: TObject);
begin
   inherited;
   GerarImpressao();
end;

procedure TrtMateriaPrima.GerarImpressao(Impressora: Boolean = False);
var vWhere: string;
    vCnt : integer;
    vIndice, vCodigoMoeda: real;
begin
   vWhere:='';

   tabAuxMP.EmptyDataSet;

   tabBase.Close;
   tabBase.SQL.Clear;
   tabBase.SQL.Add('SELECT produtos.CodigoProduto AS Codigo, produtos.NomeTecnico AS MateriaPrima, produtos.CodigoMoeda,');
   tabBase.SQL.Add('mo.Descricao AS Moeda, un.Sigla AS Unidade, es.Estoque AS Estoque, produtos.QtdMoeda');
   tabBase.SQL.Add('FROM produtos');
   tabBase.SQL.Add('LEFT JOIN genericos AS mo ON produtos.CodigoMoeda = mo.Codigo');
   tabBase.SQL.Add('LEFT JOIN unidades AS un ON produtos.CodigoUnidade = un.Codigo');
   tabBase.SQL.Add('LEFT JOIN produtos_status_estoque AS es ON produtos.CodigoProduto = es.CodigoProduto');                    

   if Trim(edtGrupo.Text) <> '' then begin   
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND '; 
      vWhere:=vWhere + 'produtos.CodigoGrupo = '+FloatToStr(edtGrupo.KeyValue);
   end; 

   if Trim(edtMoeda.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'produtos.CodigoMoeda = '+FloatToStr(edtMoeda.KeyValue);
   end;

   if Trim(edtNaoMoeda.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'produtos.CodigoMoeda <> '+FloatToStr(edtNaoMoeda.KeyValue);
   end;

   if lstGrupos.Items.Count > 0 then begin
      for vCnt:=0 to (lstGrupos.Items.Count-1) do begin
         if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND '; 
         vWhere:=vWhere + '(produtos.CodigoGrupo <> '+FloatToStr(StrToFloat(Copy(lstGrupos.Items.Strings[vCnt], 1, 6)))+')';
      end;
   end;

   case rdgStatusEstoque.ItemIndex of 
      1: begin
         if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
         vWhere:=vWhere + 'es.Estoque > 0';
      end;
      2: begin
         if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
         vWhere:=vWhere + 'es.Estoque <= 0';
      end;
   end;
   
   if Trim(vWhere) <> '' then begin
      tabBase.SQL.Add('WHERE');
      tabBase.SQL.Add(vWhere);
   end;

   tabBase.SQL.Add('ORDER BY');
   case rdgOrdemEmissao.ItemIndex of
      0: tabBase.SQL.Add('produtos.CodigoProduto');
      1: tabBase.SQL.Add('produtos.NomeTecnico');
   end;

   tabBase.Open;

   gagProgresso.MaxValue:=tabBase.RecordCount;
    
   tabBase.First;
   while not tabBase.Eof do begin

      gagProgresso.Progress:=tabBase.RecNo;
      Application.ProcessMessages;

      tabAuxMP.Append;
      tabAuxMPCodigo.Value:=tabBase.FieldByName('Codigo').AsString;
      tabAuxMPMateriaPrima.Value:=tabBase.FieldByName('MateriaPrima').AsString;
      tabAuxMPMoeda.Value:=tabBase.FieldByName('Moeda').AsString;
      tabAuxMPUnidade.Value:=tabBase.FieldByName('Unidade').AsString;
      tabAuxMPEstoque.Value:=tabBase.FieldByName('Estoque').AsFloat;

      if tabBase.FieldByName('QtdMoeda').AsFloat > 0 then begin
         vCodigoMoeda:=tabBase.FieldByName('CodigoMoeda').AsFloat; 
         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT * FROM indices_financeiros WHERE Codigo = '+ FloatToStr(vCodigoMoeda) +' ORDER BY Data DESC');
            tabChecagens.Open; 
            tabChecagens.First; 
            vIndice:=tabChecagens.FieldByName('Valor').AsFloat;
         finally
            tabChecagens.Close;
         end;
         tabAuxMPPreco.Value:=tabBase.FieldByName('QtdMoeda').AsFloat * vIndice;  
       end
      else begin
         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT ValorCompra FROM ultimas_compras WHERE CodigoProduto = '+QuotedStr(tabAuxMPCodigo.Value)+' ORDER BY DataCompra DESC '+db_limite_cmd+' 1');
            tabChecagens.Open;
            tabAuxMPPreco.Value:=tabChecagens.FieldByName('ValorCompra').AsFloat;
         finally
            tabChecagens.Close; 
         end; 
      end;

      tabAuxMPTotal.Value:=tabAuxMPPreco.Value * tabAuxMPEstoque.Value;
      tabAuxMPQtdMoeda.Value:=tabBase.FieldByName('QtdMoeda').AsFloat;
      tabAuxMP.Post; 
   
      tabBase.Next;
   end;

   gagProgresso.Progress:=0;

   vEstoque:=0; 
   vPreco:=0;
   vTotal:=0;

   if Impressora = True then begin
      if pndDialogo.Execute then begin
         qrpMP.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
         qrpMP.Print;
      end;
    end
   else begin
      qrpMP.PreviewModal;
   end;
end;

procedure TrtMateriaPrima.btnImprimirClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(True);
end;

procedure TrtMateriaPrima.FormShow(Sender: TObject);
begin
   inherited;

   tabAuxMP.CreateDataSet;
   tabAuxMP.EmptyDataSet;

   tabGrupos.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('1')+' ORDER BY Descricao');
   tabGrupos.Open;

   tabTiposIndices.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('20')+' ORDER BY Descricao');
   tabTiposIndices.Open;
end;

procedure TrtMateriaPrima.btnGrupoAdicionarClick(Sender: TObject);
begin
   inherited;
   if Trim(edtGrupoRemover.Text) <> '' then begin
      lstGrupos.Items.Add(StrZero(edtGrupoRemover.KeyValue, 6) + ' - ' + edtGrupoRemover.Text);
      edtGrupoRemover.KeyValue:=NULL;
   end;
end;

procedure TrtMateriaPrima.btnGrupoRemoverClick(Sender: TObject);
begin
   inherited;
   if lstGrupos.Items.Count > 0 then begin
      lstGrupos.Items.Delete(lstGrupos.ItemIndex);
   end;
end;

procedure TrtMateriaPrima.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   inherited;
   vEstoque:=vEstoque + tabAuxMPEstoque.Value;
   vPreco:=vPreco + tabAuxMPPreco.Value;
   vTotal:=vTotal + tabAuxMPTotal.Value;
   qrlTotal.Caption:='Estoque: '+FloatToStr(vEstoque)+' - Preço: '+FormatFloat(sis_curr_format, vPreco)+' - Total: '+FormatFloat(sis_curr_format, vTotal);
end;

procedure TrtMateriaPrima.qrpMPBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   inherited;
   vEstoque:=0;
   vPreco:=0;
   vTotal:=0;
end;

end.

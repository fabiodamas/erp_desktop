unit rTopProdutosVendidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls, Gauges;

type
  TrtTopProdutosVendidos = class(TfmFormBaseRelatorio)
    tabPedidos: TZQuery;
    pndDialogo: TPrintDialog;
    qrpTopProdutos: TQuickRep;
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
    dtsPedidos: TDataSource;
    QRDBText2: TQRDBText;
    QRLabel16: TQRLabel;
    QRShape31: TQRShape;
    qrlAno2: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText4: TQRDBText;
    qrlAno3: TQRLabel;
    QRDBText1: TQRDBText;
    qrlAno1: TQRLabel;
    QRDBText5: TQRDBText;
    tabAuxTop: TClientDataSet;
    tabAuxTopCodigoProduto: TStringField;
    tabAuxTopDescricao: TStringField;
    tabAuxTopQtd1: TFloatField;
    tabAuxTopQtd2: TFloatField;
    tabAuxTopQtd3: TFloatField;
    Label1: TLabel;
    edtAnoBase: TEdit;
    tabAuxTopAno1: TStringField;
    tabAuxTopAno2: TStringField;
    tabAuxTopAno3: TStringField;
    gagProgresso: TGauge;
    tabProdutos: TZQuery;
    Label2: TLabel;
    edtGrupo: TDBLookupComboBox;
    tabGrupos: TZQuery;
    dtsGrupos: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtsPedidosDataChange(Sender: TObject; Field: TField);
  private
     procedure GerarImpressao(Impressora: Boolean = False);
  public
  end;

implementation

uses uFormBase, uMenu, uFuncoes, uConstantes;

{$R *.dfm}

procedure TrtTopProdutosVendidos.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TrtTopProdutosVendidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabPedidos.Close;
   tabAuxTop.Close;
   tabGrupos.Close;
   inherited;
end;

procedure TrtTopProdutosVendidos.btnVisualizarClick(Sender: TObject);
begin
   inherited;
   GerarImpressao();
end;

procedure TrtTopProdutosVendidos.GerarImpressao(Impressora: Boolean = False);
var vAno : Integer;
begin
   if Trim(edtAnoBase.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Ano Base');
      edtAnoBase.SetFocus;
      exit;
   end;

   qrlTitulo.Caption:='Top Produtos Vendidos';

   tabAuxTop.EmptyDataSet;

   vAno:=StrToInt(edtAnoBase.Text);

   qrlAno1.Caption:=IntToStr(vAno);
   qrlAno2.Caption:=IntToStr(vAno-1);
   qrlAno3.Caption:=IntToStr(vAno-2);

   tabPedidos.Close;
   tabPedidos.SQL.Clear;
   tabPedidos.SQL.Add('SELECT pedidos_produtos.CodigoProduto, SUM(pedidos_produtos.Quantidade) AS QTD,');
   tabPedidos.SQL.Add('EXTRACT(YEAR FROM pedidos.DataEntrega) AS Ano');
   tabPedidos.SQL.Add('FROM pedidos_produtos');
   tabPedidos.SQL.Add('LEFT JOIN pedidos ON pedidos.NPedido = pedidos_produtos.NPedido');
   tabPedidos.SQL.Add('LEFT JOIN produtos ON produtos.CodigoProduto = pedidos_produtos.CodigoProduto');
   tabPedidos.SQL.Add('WHERE pedidos.DataEntrega IS NOT NULL AND pedidos.NPedido > 0');
   tabPedidos.SQL.Add('AND (EXTRACT(YEAR FROM pedidos.DataEntrega) = '+QuotedStr(IntToStr(vAno)));
   tabPedidos.SQL.Add('OR   EXTRACT(YEAR FROM pedidos.DataEntrega) = '+QuotedStr(IntToStr(vAno-1)));
   tabPedidos.SQL.Add('OR   EXTRACT(YEAR FROM pedidos.DataEntrega) = '+QuotedStr(IntToStr(vAno-2)));
   tabPedidos.SQL.Add(')');
   if Trim(edtGrupo.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Grupo: '+edtGrupo.Text;
      tabPedidos.SQL.Add('AND produtos.CodigoGrupo = '+String(edtGrupo.KeyValue));
   end;
   tabPedidos.SQL.Add('GROUP BY pedidos_produtos.CodigoProduto, Ano'); 
   tabPedidos.SQL.Add('ORDER BY Ano,QTD DESC');
   tabPedidos.Open;

   gagProgresso.MaxValue:=tabPedidos.RecordCount;
   tabAuxTop.IndexFieldNames:='CodigoProduto';

   tabPedidos.First;
   while not tabPedidos.Eof do begin

      gagProgresso.Progress:=tabPedidos.RecNo;
      Application.ProcessMessages;

      if tabAuxTop.FindKey([tabPedidos.FieldByName('CodigoProduto').AsString]) then begin
         tabAuxTop.Edit;
         if tabPedidos.FieldByName('Ano').AsString = IntToStr(vAno) then begin
            tabAuxTopQtd1.Value:=tabAuxTopQtd1.Value + tabPedidos.FieldByName('QTD').AsFloat;
          end
         else if tabPedidos.FieldByName('Ano').AsString = IntToStr(vAno-1) then begin
            tabAuxTopQtd2.Value:=tabAuxTopQtd2.Value + tabPedidos.FieldByName('QTD').AsFloat;
          end
         else if tabPedidos.FieldByName('Ano').AsString = IntToStr(vAno-2) then begin
            tabAuxTopQtd3.Value:=tabAuxTopQtd3.Value + tabPedidos.FieldByName('QTD').AsFloat;
         end;
       end
      else begin
         tabAuxTop.Append;
         tabAuxTopCodigoProduto.Value:=tabPedidos.FieldByName('CodigoProduto').AsString;
         tabAuxTopDescricao.Value:=tabProdutos.FieldByName('NomeTecnico').AsString;
         if tabPedidos.FieldByName('Ano').AsString = IntToStr(vAno) then begin
            tabAuxTopQtd1.Value:=tabPedidos.FieldByName('QTD').AsFloat;
          end
         else if tabPedidos.FieldByName('Ano').AsString = IntToStr(vAno-1) then begin
            tabAuxTopQtd2.Value:=tabPedidos.FieldByName('QTD').AsFloat;
          end
         else if tabPedidos.FieldByName('Ano').AsString = IntToStr(vAno-2) then begin
            tabAuxTopQtd3.Value:=tabPedidos.FieldByName('QTD').AsFloat;
         end;
      end;
      tabAuxTop.Post;

      tabPedidos.Next;
   end;

   gagProgresso.Progress:=0;
   tabAuxTop.IndexName:='indQtdDesc';

   if Impressora = True then begin
      if pndDialogo.Execute then begin
         qrpTopProdutos.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
         qrpTopProdutos.Print;
      end;
    end
   else begin
      qrpTopProdutos.PreviewModal;
   end;
end;

procedure TrtTopProdutosVendidos.btnImprimirClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(True);
end;

procedure TrtTopProdutosVendidos.FormShow(Sender: TObject);
begin
   inherited; 
   edtAnoBase.Text:=FormatDateTime('yyyy', Date);

   tabAuxTop.CreateDataSet;
   tabAuxTop.EmptyDataSet;

   tabProdutos.Params.CreateParam(ftString, 'CodigoProduto', ptUnknown);
   tabProdutos.SQL.Add('SELECT CodigoProduto,NomeTecnico FROM produtos WHERE CodigoProduto = :CodigoProduto');
   tabProdutos.Open;

   tabGrupos.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('1')); 
   tabGrupos.Open;
end;

procedure TrtTopProdutosVendidos.dtsPedidosDataChange(Sender: TObject;
  Field: TField);
begin
   inherited;
   if tabPedidos.Active then begin
      tabProdutos.Close;
      tabProdutos.ParamByName('CodigoProduto').AsString:=tabPedidos.FieldByName('CodigoProduto').AsString;
      tabProdutos.Open;
   end;
end;

end.

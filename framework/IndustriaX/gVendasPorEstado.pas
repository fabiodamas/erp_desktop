unit gVendasPorEstado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, TeEngine, Series, ExtCtrls, TeeProcs, Chart,
  StdCtrls, Buttons, Mask, ToolEdit, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Gauges, DBClient, teeprevi, Menus;

type
  TgfVendasPorEstado = class(TfmFormBaseAvancado)
    crtGrafico: TChart;
    btnOK: TBitBtn;
    edtDataInicial: TDateEdit;
    Label1: TLabel;
    edtDataFinal: TDateEdit;
    Label2: TLabel;
    tabPedidos: TZQuery;
    dtsPedidos: TDataSource;
    tabAuxiliar: TClientDataSet;
    btnImprimir: TBitBtn;
    tabAuxiliarEstado: TStringField;
    tabAuxiliarValor: TCurrencyField;
    gagProgresso: TGauge;
    Series1: TBarSeries;
    edtCodigoEmpresa: TEdit;
    edtNomeEmpresa: TEdit;
    Label3: TLabel;
    btnLocalizarEmpresa: TBitBtn;
    tabChecagens: TZQuery;
    rdgTipoGrafico: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnImprimirClick(Sender: TObject);
    procedure edtCodigoEmpresaChange(Sender: TObject);
    procedure btnLocalizarEmpresaClick(Sender: TObject);
    procedure rdgTipoGraficoClick(Sender: TObject);
  private
    procedure AtualizaGrafico;
  public
    { Public declarations }
  end;

var
  gfVendasPorEstado: TgfVendasPorEstado;

implementation

uses uFormBaseConfig, DateUtils, uMenu, uFuncoes, uConstantes,
     uLocalizarGenerico, uTipos;

{$R *.dfm}

procedure TgfVendasPorEstado.FormCreate(
  Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TgfVendasPorEstado.btnOKClick(
  Sender: TObject);
begin
   if (Trim(edtDataInicial.Text) = '/  /') or (Trim(edtDataFinal.Text) = '/  /') then begin
      ShowMessage('Obrigatório Preenchimento do Período de Datas');
      edtDataInicial.SetFocus;
      exit;
   end;
   AtualizaGrafico;  
end;

procedure TgfVendasPorEstado.FormShow(
  Sender: TObject);
begin
   inherited;

   tabAuxiliar.CreateDataSet;
   tabAuxiliar.EmptyDataSet;

   edtDataInicial.Date:=StartOfTheMonth(Date); 
   edtDataFinal.Date:=EndOfTheMonth(Date); 

   btnOk.Click;
end;

procedure TgfVendasPorEstado.AtualizaGrafico; 
var vSQL : string;
begin
   vSQL:='pedidos.DataEntrega IS NOT NULL ';
   vSQL:=vSQL+'AND clientes.Estado IS NOT NULL AND clientes.Estado <> '+QuotedStr('EX');
   vSQL:=vSQL+'AND clientes.Estado <> '+QuotedStr('');
   vSQL:=vSQL+'AND pedidos.NPedido > 0';     

   tabAuxiliar.EmptyDataSet;  

   crtGrafico.Title.Text.Clear;
   crtGrafico.Title.Text.Add('Vendas por Estado'); 

   if (Trim(edtDataInicial.Text) <> '/  /') and (Trim(edtDataFinal.Text) <> '/  /') then begin
      if Trim(vSQL) <> '' then vSQL:=vSQL+' AND ';
      vSQL:=vSQL+'DataEntrega >= '+QuotedStr(FormatDateTime(sis_date_format, edtDataInicial.Date))+' AND DataEntrega <= '+QuotedStr(FormatDateTime(sis_date_format, edtDataFinal.Date));
      crtGrafico.Title.Text.Add('Período: '+edtDataInicial.Text+' a '+edtDataFinal.Text);
   end;

   if Trim(edtCodigoEmpresa.Text) <> '' then begin
      if Trim(vSQL) <> '' then vSQL:=vSQL+' AND '; 
      vSQL:=vSQL+'CodigoEmpresa = '+edtCodigoEmpresa.Text;
      crtGrafico.Title.Text.Add('Empresa: '+edtNomeEmpresa.Text);
   end;

   tabPedidos.Close;
   tabPedidos.SQL.Clear; 
   tabPedidos.SQL.Add('SELECT SUM(pedidos.ValorTotal) AS VlrTotal, clientes.Estado');
   tabPedidos.SQL.Add('FROM pedidos ');
   tabPedidos.SQL.Add('LEFT JOIN clientes ON clientes.CodigoCliente = pedidos.CodigoCliente');
   tabPedidos.SQL.Add('WHERE ');
   tabPedidos.SQL.Add(vSQL);
   tabPedidos.SQL.Add('GROUP BY clientes.Estado');
   tabPedidos.SQL.Add('ORDER BY VlrTotal DESC');
   tabPedidos.Open; 

   gagProgresso.MaxValue:=tabPedidos.RecordCount;

   tabPedidos.First; 
   while not tabPedidos.Eof do begin    

      gagProgresso.Progress:=tabPedidos.RecNo;
      Application.ProcessMessages;

      tabAuxiliar.Append;
      tabAuxiliarEstado.Value:=tabPedidos.FieldByName('Estado').AsString;
      tabAuxiliarValor.Value:=tabPedidos.FieldByName('VlrTotal').AsFloat;
      tabAuxiliar.Post;

      tabPedidos.Next; 
   end;

   gagProgresso.Progress:=0;
   crtGrafico.Series[0].Clear;

   tabAuxiliar.First;
   while not tabAuxiliar.Eof do begin
      crtGrafico.Series[0].Add(tabAuxiliarValor.Value, tabAuxiliarEstado.Value);
      tabAuxiliar.Next;
   end;
end;

procedure TgfVendasPorEstado.FormClose(
  Sender: TObject; var Action: TCloseAction);
begin
   tabAuxiliar.Close;
   tabPedidos.Close;  
   inherited;
end;

procedure TgfVendasPorEstado.btnImprimirClick( 
  Sender: TObject);   
begin
   inherited; 
   ChartPreview(Self, crtGrafico);
end;

procedure TgfVendasPorEstado.edtCodigoEmpresaChange(Sender: TObject);
begin
   inherited;
   if Trim(edtCodigoEmpresa.Text) <> '' then begin
      try
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT NomeFantasia FROM empresas WHERE CodigoEmpresa = '+edtCodigoEmpresa.Text);
         tabChecagens.Open;
         if tabChecagens.RecordCount > 0 then begin
            edtNomeEmpresa.Text:=tabChecagens.FieldByName('NomeFantasia').AsString;
          end
         else begin
            edtNomeEmpresa.Text:='';
         end;
      finally
         tabChecagens.Close;
      end;
    end
   else begin
      edtNomeEmpresa.Text:=''; 
   end; 
end;

procedure TgfVendasPorEstado.btnLocalizarEmpresaClick(Sender: TObject);
var vParamLoc : TParametrosLocalizar; 
begin
   inherited;
   vParamLoc.Table:='empresas';
   vParamLoc.KeyField:='CodigoEmpresa';
   vParamLoc.Field1:='NomeFantasia';
   vParamLoc.Filter:='';
   if not Assigned (fmLocalizarGenerico) then begin
      Application.CreateForm(TfmLocalizarGenerico, fmLocalizarGenerico);
      fmLocalizarGenerico.LoadParams(vParamLoc);
      fmLocalizarGenerico.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edtCodigoEmpresa.Text:=fmMenu.pubTrans1;
   end;
end;

procedure TgfVendasPorEstado.rdgTipoGraficoClick(Sender: TObject);
var vSeries :TChartSeries;
begin
   inherited;
   vSeries:=crtGrafico.Series[0];
   case rdgTipoGrafico.ItemIndex of 
      0: ChangeSeriesType(vSeries, TBarSeries); 
      1: ChangeSeriesType(vSeries, TPieSeries); 
   end;  
end;

end.

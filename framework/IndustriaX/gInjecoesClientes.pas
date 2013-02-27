unit gInjecoesClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, TeEngine, Series, ExtCtrls, TeeProcs, Chart,
  StdCtrls, Buttons, Mask, ToolEdit, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Gauges, DBClient, Menus;

type
  TgfInjecoesClientes = class(TfmFormBaseAvancado)
    crtGrafico: TChart;
    btnOK: TBitBtn;
    Series2: TBarSeries;
    edtDataInicial: TDateEdit;
    Label1: TLabel;
    edtDataFinal: TDateEdit;
    Label2: TLabel;
    edtCodigoCliente: TEdit;
    Label3: TLabel;
    edtNomeCliente: TEdit;
    Label4: TLabel;
    btnLocalizaCliente: TBitBtn;
    tabAproveitamento: TZQuery;
    dtsAproveitamento: TDataSource;
    tabAuxiliar: TClientDataSet;
    tabAuxiliarPerdas: TIntegerField;
    tabClientes: TZQuery;
    Series1: TBarSeries;
    Series3: TBarSeries;
    tabAuxiliarCodigoCliente: TFloatField;
    tabAuxiliarPecasInjetadas: TIntegerField;
    tabAuxiliarNomeCliente: TStringField;
    lblTotalPerdas: TLabel;
    lblTotalAproveitamento: TLabel;
    lblTotalPercPerdas: TLabel;
    lblTotalProduzido: TLabel;
    btnImprimir: TBitBtn;
    pndDialogo: TPrintDialog;
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCodigoClienteChange(Sender: TObject);
    procedure btnLocalizaClienteClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    procedure AtualizaGrafico;
  public
    { Public declarations }
  end;

var
  gfInjecoesClientes: TgfInjecoesClientes;

implementation

uses uFormBaseConfig, DateUtils, uMenu, uLocalizarClientes, uFuncoes,
     uConstantes;

{$R *.dfm}

procedure TgfInjecoesClientes.FormCreate(
  Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TgfInjecoesClientes.btnOKClick(
  Sender: TObject);
begin
   AtualizaGrafico;
end;

procedure TgfInjecoesClientes.FormShow(
  Sender: TObject);
begin
   inherited;

   tabAuxiliar.CreateDataSet;
   tabAuxiliar.EmptyDataSet;
   tabAuxiliar.IndexFieldNames:='CodigoCliente';

   edtDataInicial.Date:=StartOfTheMonth(Date);
   edtDataFinal.Date:=EndOfTheMonth(Date);

   btnOk.Click;
end;

procedure TgfInjecoesClientes.AtualizaGrafico;
var vSQL : string;
    vTotPares, vPerc, vTotalPerdas, vAprov : real;
    vLPerdas,
    vLAproveitamento,
    vLPercPerdas: real;
begin
   vSQL:='';
   tabAuxiliar.EmptyDataSet;

   crtGrafico.Title.Text.Clear;
   crtGrafico.Title.Text.Add('Aproveitamento e Perdas em PARES');

   if (Trim(edtDataInicial.Text) <> '/  /') and (Trim(edtDataFinal.Text) <> '/  /') then begin
      if Trim(vSQL) <> '' then vSQL:=vSQL+' AND ';
      vSQL:=vSQL+'Data >= '+QuotedStr(FormatDateTime(sis_date_format, edtDataInicial.Date))+' AND Data <= '+QuotedStr(FormatDateTime(sis_date_format, edtDataFinal.Date));
      crtGrafico.Title.Text.Add('Período: '+edtDataInicial.Text+' a '+edtDataFinal.Text);
   end;

   if Trim(edtCodigoCliente.Text) <> '' then begin
      if Trim(vSQL) <> '' then vSQL:=vSQL+' AND ';
      vSQL:=vSQL+'CodigoCliente = '+edtCodigoCliente.Text;
   end;

   tabAproveitamento.Close;
   tabAproveitamento.SQL.Clear;

   if Trim(vSQL) <> '' then begin
      tabAproveitamento.SQL.Add('SELECT * ');
      tabAproveitamento.SQL.Add('FROM aproveitamento WHERE');
      tabAproveitamento.SQL.Add(vSQL);
    end
   else begin
      tabAproveitamento.SQL.Add('SELECT * FROM aproveitamento');
   end;

   tabAproveitamento.Open;

   tabAproveitamento.First;
   while not tabAproveitamento.Eof do begin

      if tabAuxiliar.FindKey([tabAproveitamento.FieldByName('CodigoCliente').AsFloat]) then begin
         tabAuxiliar.Edit;
         tabAuxiliarPecasInjetadas.Value:=tabAuxiliarPecasInjetadas.Value + tabAproveitamento.FieldByName('PecasInjetadas').AsInteger;
         tabAuxiliarPerdas.Value:=tabAuxiliarPerdas.Value + tabAproveitamento.FieldByName('Perdas').AsInteger;
       end
      else begin
         tabAuxiliar.Append;
         tabAuxiliarCodigoCliente.Value:=tabAproveitamento.FieldByName('CodigoCliente').AsFloat;
         tabAuxiliarPecasInjetadas.Value:=tabAproveitamento.FieldByName('PecasInjetadas').AsInteger;
         tabAuxiliarPerdas.Value:=tabAproveitamento.FieldByName('Perdas').AsInteger;
         tabClientes.Close;
         tabClientes.SQL.Clear;
         tabClientes.SQL.Add('SELECT CodigoCliente,NomeFantasia FROM clientes WHERE CodigoCliente = '+FloatToStr(tabAuxiliarCodigoCliente.Value));
         tabClientes.Open;
         tabAuxiliarNomeCliente.Value:=tabClientes.FieldByName('NomeFantasia').AsString;
      end;
      tabAuxiliar.Post;

      tabAproveitamento.Next;
   end;

   crtGrafico.Series[0].Clear;
   crtGrafico.Series[1].Clear;
   crtGrafico.Series[2].Clear;

   vLPerdas:=0;
   vLAproveitamento:=0;
   vLPercPerdas:=0;

   tabAuxiliar.First;
   while not tabAuxiliar.Eof do begin

      vTotPares:=RoundReal(tabAuxiliarPecasInjetadas.Value/2, 2);
      vTotalPerdas:=RoundReal(tabAuxiliarPerdas.Value/2, 2);
      vAprov:=vTotPares - vTotalPerdas;
      vPerc:=RoundReal((vTotalPerdas*100)/vTotPares, 2); 

      vLPerdas:=vLPerdas + vTotalPerdas;
      vLAproveitamento:=vLAproveitamento + vAprov;
      vLPercPerdas:=vLPercPerdas + vPerc;

      crtGrafico.Series[0].Add(vTotalPerdas, Copy(tabAuxiliarNomeCliente.Value, 10, 10), clRed);
      crtGrafico.Series[1].Add(vAprov, '', clGreen);
      crtGrafico.Series[2].Add(vPerc, '', clRed);

      tabAuxiliar.Next;
   end;

   lblTotalPerdas.Caption:='Total Perdas: '+FloatToStr(vLPerdas); 
   lblTotalAproveitamento.Caption:='Total Aprov.: '+FloatToStr(vLAproveitamento);
   if (vLPerdas > 0) and (vLAproveitamento > 0) then begin
      lblTotalPercPerdas.Caption:='% Perdas: '+FloatToStr(RoundReal((vLPerdas*100)/(vLAproveitamento+vLPerdas), 2));
   end;
   lblTotalProduzido.Caption:='Total Produzido: '+FloatToStr(vLPerdas+vLAproveitamento);
end;

procedure TgfInjecoesClientes.FormClose(
  Sender: TObject; var Action: TCloseAction);
begin
   tabAuxiliar.Close;
   tabAproveitamento.Close;
   tabClientes.Close;
   inherited;
end;

procedure TgfInjecoesClientes.edtCodigoClienteChange(
  Sender: TObject);
begin
   if Trim(edtCodigoCliente.Text) <> '' then begin
      tabClientes.Close;
      tabClientes.SQL.Clear;
      tabClientes.SQL.Add('SELECT CodigoCliente,NomeFantasia FROM clientes WHERE CodigoCliente = '+edtCodigoCliente.Text);
      tabClientes.Open;
      if tabClientes.RecordCount > 0 then begin
         edtNomeCliente.Text:=tabClientes.FieldByName('NomeFantasia').AsString;
       end
      else begin
         edtNomeCliente.Text:=''; 
      end;
    end
   else begin
      edtNomeCliente.Text:='';
   end;
end;

procedure TgfInjecoesClientes.btnLocalizaClienteClick(
  Sender: TObject);
begin
   if not Assigned (fmLocalizarClientes) then begin
      Application.CreateForm(TfmLocalizarClientes, fmLocalizarClientes);
      fmLocalizarClientes.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edtCodigoCliente.Text:=fmMenu.pubTrans1;
   end;
end;

procedure TgfInjecoesClientes.FormResize(Sender: TObject);
begin
   inherited;
   lblTotalPerdas.Left:=ClientWidth - 127;
   lblTotalAproveitamento.Left:=ClientWidth - 127;
   lblTotalPercPerdas.Left:=ClientWidth - 127;
   lblTotalProduzido.Left:=ClientWidth - 127;
end;

procedure TgfInjecoesClientes.btnImprimirClick(
  Sender: TObject);
begin
   inherited;
   if pndDialogo.Execute then begin
      crtGrafico.PrintLandscape;
   end;
end;

end.

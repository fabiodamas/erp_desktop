unit rEstatisticasAproveitamentoPerdas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, TeEngine, Series, ExtCtrls, TeeProcs, Chart,
  StdCtrls, Buttons, Mask, ToolEdit, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Gauges, DBClient;

type
  TgfEstatisticasAproveitamentoPerdas = class(TfmFormBaseAvancado)
    crt_aprov_perdas: TChart;
    btn_ok: TBitBtn;
    Series2: TBarSeries;
    edt_data_inicial: TDateEdit;
    Label1: TLabel;
    edt_data_final: TDateEdit;
    Label2: TLabel;
    edt_codigo_cliente: TEdit;
    Label3: TLabel;
    edt_nome_cliente: TEdit;
    Label4: TLabel;
    btn_localiza_cliente: TBitBtn;
    tab_aproveitamento: TZQuery;
    dts_aproveitamento: TDataSource;
    gag_processa: TGauge;
    tab_auxiliar: TClientDataSet;
    tab_auxiliarPerdas: TIntegerField;
    tab_clientes: TZQuery;
    Series1: TBarSeries;
    Series3: TBarSeries;
    tab_auxiliarCodigoCliente: TFloatField;
    tab_auxiliarPecasInjetadas: TIntegerField;
    tab_auxiliarNomeCliente: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btn_okClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edt_codigo_clienteChange(Sender: TObject);
    procedure btn_localiza_clienteClick(Sender: TObject);
  private
    procedure AtualizaGrafico;
  public
    { Public declarations }
  end;

var
  gfEstatisticasAproveitamentoPerdas: TgfEstatisticasAproveitamentoPerdas;

implementation

uses uFormBaseConfig, DateUtils, uMenu, uLocalizarClientes, uFuncoes,
     uConstantes;

{$R *.dfm}

procedure TgfEstatisticasAproveitamentoPerdas.FormCreate(
  Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TgfEstatisticasAproveitamentoPerdas.btn_okClick(
  Sender: TObject);
begin
   AtualizaGrafico;
end;

procedure TgfEstatisticasAproveitamentoPerdas.FormShow(
  Sender: TObject);
begin
   inherited;

   tab_auxiliar.CreateDataSet;
   tab_auxiliar.EmptyDataSet;
   tab_auxiliar.IndexFieldNames:='CodigoCliente';

   edt_data_inicial.Date:=StartOfTheMonth(Date);
   edt_data_final.Date:=EndOfTheMonth(Date);

   btn_ok.Click;
end;

procedure TgfEstatisticasAproveitamentoPerdas.AtualizaGrafico;
var vSQL : string;
    vTotPares, vPerc, vTotalPerdas, vAprov : real;
begin
   vSQL:='';
   tab_auxiliar.EmptyDataSet;

   if (Trim(edt_data_inicial.Text) <> '/  /') and (Trim(edt_data_final.Text) <> '/  /') then begin
      if Trim(vSQL) <> '' then vSQL:=vSQL+' AND ';
      vSQL:=vSQL+'Data >= '+QuotedStr(FormatDateTime(sis_date_format, edt_data_inicial.Date))+' AND Data <= '+QuotedStr(FormatDateTime(sis_date_format, edt_data_final.Date));
   end;

   if Trim(edt_codigo_cliente.Text) <> '' then begin
      if Trim(vSQL) <> '' then vSQL:=vSQL+' AND ';
      vSQL:=vSQL+'CodigoCliente = '+edt_codigo_cliente.Text;
   end;

   tab_aproveitamento.Close;
   tab_aproveitamento.SQL.Clear;

   if Trim(vSQL) <> '' then begin
      tab_aproveitamento.SQL.Add('SELECT * ');
      tab_aproveitamento.SQL.Add('FROM aproveitamento WHERE');
      tab_aproveitamento.SQL.Add(vSQL);
    end
   else begin
      tab_aproveitamento.SQL.Add('SELECT * FROM aproveitamento');
   end;

   tab_aproveitamento.Open;

   tab_aproveitamento.First;
   while not tab_aproveitamento.Eof do begin

      if tab_auxiliar.FindKey([tab_aproveitamento.FieldByName('CodigoCliente').AsFloat]) then begin
         tab_auxiliar.Edit;
         tab_auxiliarPecasInjetadas.Value:=tab_auxiliarPecasInjetadas.Value + tab_aproveitamento.FieldByName('PecasInjetadas').AsInteger;
         tab_auxiliarPerdas.Value:=tab_auxiliarPerdas.Value + tab_aproveitamento.FieldByName('Perdas').AsInteger;
       end
      else begin
         tab_auxiliar.Append;
         tab_auxiliarCodigoCliente.Value:=tab_aproveitamento.FieldByName('CodigoCliente').AsFloat;
         tab_auxiliarPecasInjetadas.Value:=tab_aproveitamento.FieldByName('PecasInjetadas').AsInteger;
         tab_auxiliarPerdas.Value:=tab_aproveitamento.FieldByName('Perdas').AsInteger;
         tab_clientes.Close;
         tab_clientes.SQL.Clear;
         tab_clientes.SQL.Add('SELECT CodigoCliente,NomeFantasia FROM clientes WHERE CodigoCliente = '+FloatToStr(tab_auxiliarCodigoCliente.Value));
         tab_clientes.Open;
         tab_auxiliarNomeCliente.Value:=tab_clientes.FieldByName('NomeFantasia').AsString;
      end;
      tab_auxiliar.Post;

      tab_aproveitamento.Next;
   end;

   crt_aprov_perdas.Series[0].Clear;
   crt_aprov_perdas.Series[1].Clear;
   crt_aprov_perdas.Series[2].Clear;

   tab_auxiliar.First;
   while not tab_auxiliar.Eof do begin

      vTotPares:=RoundReal(tab_auxiliarPecasInjetadas.Value/2, 2);
      vTotalPerdas:=RoundReal(tab_auxiliarPerdas.Value/2, 2);
      vAprov:=vTotPares - vTotalPerdas;
      vPerc:=RoundReal((vTotalPerdas*100)/vTotPares, 2);

      crt_aprov_perdas.Series[0].Add(vTotalPerdas, Copy(tab_auxiliarNomeCliente.Value, 10, Length(tab_auxiliarNomeCliente.Value)), clRed);
      crt_aprov_perdas.Series[1].Add(vAprov, '', clGreen);
      crt_aprov_perdas.Series[2].Add(vPerc, '', clRed);

      tab_auxiliar.Next;
   end;
end;

procedure TgfEstatisticasAproveitamentoPerdas.FormClose(
  Sender: TObject; var Action: TCloseAction);
begin
   tab_auxiliar.Close;
   tab_aproveitamento.Close;
   tab_clientes.Close;
   inherited;
end;

procedure TgfEstatisticasAproveitamentoPerdas.edt_codigo_clienteChange(
  Sender: TObject);
begin
   if Trim(edt_codigo_cliente.Text) <> '' then begin
      tab_clientes.Close;
      tab_clientes.SQL.Clear;
      tab_clientes.SQL.Add('SELECT CodigoCliente,NomeFantasia FROM clientes WHERE CodigoCliente = '+edt_codigo_cliente.Text);
      tab_clientes.Open;
      if tab_clientes.RecordCount > 0 then begin
         edt_nome_cliente.Text:=tab_clientes.FieldByName('NomeFantasia').AsString;
       end
      else begin
         edt_nome_cliente.Text:=''; 
      end;
    end
   else begin
      edt_nome_cliente.Text:='';
   end;
end;

procedure TgfEstatisticasAproveitamentoPerdas.btn_localiza_clienteClick(
  Sender: TObject);
begin
   if not Assigned (fmLocalizarClientes) then begin
      Application.CreateForm(TfmLocalizarClientes, fmLocalizarClientes);
      fmLocalizarClientes.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edt_codigo_cliente.Text:=fmMenu.pubTrans1;
   end;
end;

end.

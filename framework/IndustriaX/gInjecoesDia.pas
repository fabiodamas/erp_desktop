unit gInjecoesDia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, TeEngine, Series, ExtCtrls, TeeProcs, Chart,
  StdCtrls, Buttons, Mask, ToolEdit, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Gauges, DBClient, Menus;

type
  TgfInjecoesDia = class(TfmFormBaseAvancado)
    crtGrafico: TChart;
    btnOK: TBitBtn;
    Series2: TBarSeries;
    edtDataInicial: TDateEdit;
    Label1: TLabel;
    edtDataFinal: TDateEdit;
    Label2: TLabel;
    edtCodigoProduto: TEdit;
    Label3: TLabel;
    edtNomeProduto: TEdit;
    Label4: TLabel;
    btnLocalizaProduto: TBitBtn;
    tabAproveitamento: TZQuery;
    dtsAproveitamento: TDataSource;
    tabAuxiliar: TClientDataSet;
    Series1: TBarSeries;
    Series3: TBarSeries;
    tabAuxiliarData: TDateField;
    tabAuxiliarCodigoProduto: TStringField;
    tabAuxiliarInjecoes: TIntegerField;
    tabAuxiliarPerdas: TIntegerField;
    tabAuxiliarAproveitamento: TIntegerField;
    tabChecagens: TZQuery;
    btnImprimir: TBitBtn;
    pndDialogo: TPrintDialog;
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCodigoProdutoChange(Sender: TObject);
    procedure btnLocalizaProdutoClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    procedure AtualizaGrafico;
  public
    { Public declarations }
  end;

var
  gfInjecoesDia: TgfInjecoesDia;

implementation

uses uFormBaseConfig, DateUtils, uMenu, uLocalizarClientes, uFuncoes,
     uConstantes, uLocalizarProdutos;

{$R *.dfm}

procedure TgfInjecoesDia.FormCreate(
  Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TgfInjecoesDia.btnOKClick(
  Sender: TObject);
begin
   AtualizaGrafico;
end;

procedure TgfInjecoesDia.FormShow(
  Sender: TObject);
begin
   inherited;

   tabAuxiliar.CreateDataSet;
   tabAuxiliar.EmptyDataSet;
   tabAuxiliar.IndexFieldNames:='Data';

   edtDataInicial.Date:=StartOfTheWeek(Date);
   edtDataFinal.Date:=EndOfTheWeek(Date);

   btnOk.Click;
end;

procedure TgfInjecoesDia.AtualizaGrafico;
var vSQL : string;
    vPerdas, vAprov, vProduz: integer;
begin
   vSQL:='';
   tabAuxiliar.EmptyDataSet;

   crtGrafico.Title.Text.Clear;
   crtGrafico.Title.Text.Add('Aproveitamento e Perdas em UNIDADES');

   if (Trim(edtDataInicial.Text) <> '/  /') and (Trim(edtDataFinal.Text) <> '/  /') then begin
      if Trim(vSQL) <> '' then vSQL:=vSQL+' AND ';
      vSQL:=vSQL+'Data >= '+QuotedStr(FormatDateTime(sis_date_format, edtDataInicial.Date))+' AND Data <= '+QuotedStr(FormatDateTime(sis_date_format, edtDataFinal.Date));
      crtGrafico.Title.Text.Add('Período: '+edtDataInicial.Text+' a '+edtDataFinal.Text);
   end;

   if Trim(edtCodigoProduto.Text) <> '' then begin
      if Trim(vSQL) <> '' then vSQL:=vSQL+' AND ';
      vSQL:=vSQL+'CodigoProduto = '+QuotedStr(edtCodigoProduto.Text);
      crtGrafico.Title.Text.Add('Produto: '+edtCodigoProduto.Text);
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

      if tabAuxiliar.FindKey([tabAproveitamento.FieldByName('Data').AsDateTime]) then begin
         tabAuxiliar.Edit;
         tabAuxiliarInjecoes.Value:=tabAuxiliarInjecoes.Value             + tabAproveitamento.FieldByName('PecasInjetadas').AsInteger;
         tabAuxiliarPerdas.Value:=tabAuxiliarPerdas.Value                 + tabAproveitamento.FieldByName('Perdas').AsInteger;
         tabAuxiliarAproveitamento.Value:=tabAuxiliarAproveitamento.Value + (tabAproveitamento.FieldByName('PecasInjetadas').AsInteger-tabAproveitamento.FieldByName('Perdas').AsInteger);
       end
      else begin
         tabAuxiliar.Append;
         tabAuxiliarData.Value:=tabAproveitamento.FieldByName('Data').AsDateTime;
         tabAuxiliarCodigoProduto.Value:=tabAproveitamento.FieldByName('CodigoProduto').AsString;
         tabAuxiliarInjecoes.Value:=tabAproveitamento.FieldByName('PecasInjetadas').AsInteger;
         tabAuxiliarPerdas.Value:=tabAproveitamento.FieldByName('Perdas').AsInteger;
         tabAuxiliarAproveitamento.Value:=(tabAproveitamento.FieldByName('PecasInjetadas').AsInteger-tabAproveitamento.FieldByName('Perdas').AsInteger);
      end;
      tabAuxiliar.Post;

      tabAproveitamento.Next;
   end;

   crtGrafico.Series[0].Clear;
   crtGrafico.Series[1].Clear;
   crtGrafico.Series[2].Clear;

   vPerdas:=0;
   vAprov:=0;
   vProduz:=0;

   tabAuxiliar.First;
   while not tabAuxiliar.Eof do begin

      crtGrafico.Series[0].Add(tabAuxiliarInjecoes.Value, FormatDateTime('dd/MM/yyyy', tabAuxiliarData.Value), clYellow);
      crtGrafico.Series[1].Add(tabAuxiliarAproveitamento.Value, '', clGreen);
      crtGrafico.Series[2].Add(tabAuxiliarPerdas.Value, '', clRed);
      vPerdas:=vPerdas + tabAuxiliarPerdas.Value;
      vAprov:=vAprov + tabAuxiliarAproveitamento.Value;
      vProduz:=vProduz + tabAuxiliarInjecoes.Value;

      tabAuxiliar.Next;
   end;

   crtGrafico.Foot.Text.Clear;
   crtGrafico.Foot.Text.Add('Total Produzido: '+FloatToStr(vProduz)+
                            ' - Total Perdas: '+FloatToStr(vPerdas)+
                            ' - Total Aproveitamento: '+FloatToStr(vAprov));
end;

procedure TgfInjecoesDia.FormClose(
  Sender: TObject; var Action: TCloseAction);
begin
   tabAuxiliar.Close;
   tabAproveitamento.Close;
   inherited;
end;

procedure TgfInjecoesDia.edtCodigoProdutoChange(
  Sender: TObject);
begin
   if Trim(edtCodigoProduto.Text) <> '' then begin
      try
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT CodigoProduto,NomeTecnico FROM produtos WHERE CodigoProduto = '+edtCodigoProduto.Text);
         tabChecagens.Open;
         if tabChecagens.RecordCount > 0 then begin
            edtNomeProduto.Text:=tabChecagens.FieldByName('NomeTecnico').AsString;
          end
         else begin
            edtNomeProduto.Text:='';
         end;
      finally
         tabChecagens.Close;
      end;
    end
   else begin
      edtNomeProduto.Text:='';
   end;
end;

procedure TgfInjecoesDia.btnLocalizaProdutoClick(Sender: TObject);
begin
   inherited;
   if not Assigned (fmLocalizarProdutos) then begin
      Application.CreateForm(TfmLocalizarProdutos, fmLocalizarProdutos);
      fmLocalizarProdutos.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edtCodigoProduto.Text:=fmMenu.pubTrans1;
   end;
end;

procedure TgfInjecoesDia.btnImprimirClick(Sender: TObject);
begin
   inherited;
   if pndDialogo.Execute then begin
      crtGrafico.PrintLandscape;
   end;
end;

end.

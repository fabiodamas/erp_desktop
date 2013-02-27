unit uPainelGerencial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, Menus, ComCtrls, TeEngine, Series, ExtCtrls,
  TeeProcs, Chart, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TfmPainelGerencial = class(TfmFormBaseAvancado)
    pgcPainelGerencial: TPageControl;
    tbsVendas: TTabSheet;
    pgcVendas: TPageControl;
    tbsVendasMensal: TTabSheet;
    tbsVendasAnual: TTabSheet;
    chtVendasMensal: TChart;
    Series1: TBarSeries;
    tabVendas: TZQuery;
    chtVendasVendedorMensal: TChart;
    tabChecagens: TZQuery;
    Series2: TFastLineSeries;
    Series3: TFastLineSeries;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    procedure VendasMensal;
    procedure VendasVendedorMensal;
  public
    { Public declarations }
  end;

var
  fmPainelGerencial: TfmPainelGerencial;

implementation

uses uFormBase, uMenu, uFuncoes;

{$R *.dfm}

procedure TfmPainelGerencial.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TfmPainelGerencial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   inherited;
   tabVendas.Close;
   tabChecagens.Close;
end;

procedure TfmPainelGerencial.VendasMensal;
begin
   chtVendasMensal.Series[0].Clear;
   tabVendas.Close;
   tabVendas.SQL.Clear;
   tabVendas.SQL.Add('SELECT SUM(ValorTotal) AS VlrTot, EXTRACT(MONTH FROM DataEntrega) AS Mes');
   tabVendas.SQL.Add('FROM pedidos');
   tabVendas.SQL.Add('WHERE NPedido > 0 ');
   tabVendas.SQL.Add('AND DataEntrega IS NOT NULL ');
   tabVendas.SQL.Add('AND EXTRACT(YEAR FROM DataEntrega) = '+QuotedStr(FormatDateTime('yyyy', Date)));
   tabVendas.SQL.Add('GROUP BY Mes');
   tabVendas.Open;
   tabVendas.First;
   while not tabVendas.Eof do begin
      chtVendasMensal.Series[0].Add(tabVendas.FieldByName('VlrTot').AsFloat, ExtractMonthByNum(StrToInt(tabVendas.FieldByName('Mes').AsString)));
      tabVendas.Next;
   end;
end;

procedure TfmPainelGerencial.FormShow(Sender: TObject);
begin
   inherited;
   VendasMensal;
   VendasVendedorMensal;
end;

procedure TfmPainelGerencial.VendasVendedorMensal;
var vNomeFunc : string;
//    vSeries: TChartSeries;
begin
   //chtVendasVendedorMensal.Series[0].Clear;

//   vSeries:=TChartSeries.Create(chtVendasVendedorMensal);

//   chtVendasVendedorMensal.AddSeries(vSeries);

   tabVendas.Close;
   tabVendas.SQL.Clear;
   tabVendas.SQL.Add('SELECT SUM(ValorTotal) AS VlrTot, CodigoFuncionario ');
   tabVendas.SQL.Add('FROM pedidos ');
   tabVendas.SQL.Add('WHERE NPedido > 0 ');
   tabVendas.SQL.Add('AND DataEntrega IS NOT NULL ');
   tabVendas.SQL.Add('AND EXTRACT(YEAR FROM DataEntrega) = '+QuotedStr(FormatDateTime('yyyy', Date))+' ');
   tabVendas.SQL.Add('GROUP BY CodigoFuncionario');
   tabVendas.Open;
   tabVendas.First;
   while not tabVendas.Eof do begin 

      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT Nome FROM funcionarios WHERE Codigo = '+tabVendas.FieldByName('CodigoFuncionario').AsString);
      tabChecagens.Open;

      if Trim(tabChecagens.FieldByName('Nome').AsString) <> '' then begin
         vNomeFunc:=Copy(tabChecagens.FieldByName('Nome').AsString, 1, 15);
       end
      else begin
         vNomeFunc:='(Não Encontrado)'; 
      end;

      chtVendasVendedorMensal.Series[0].Add(tabVendas.FieldByName('VlrTot').AsFloat, vNomeFunc);

      tabVendas.Next;
   end;
end;

end.

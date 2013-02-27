unit gVendasAnual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, Menus, ExtCtrls, TeeProcs, TeEngine, Chart,
  Series, StdCtrls, Buttons, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, DBClient, Grids, DBGrids, DBCtrls, teeprevi, Spin;

type
  TgfVendasAnual = class(TfmFormBaseAvancado)
    chtGrafico: TChart;
    btnAtualizar: TBitBtn;
    tabVendas: TZQuery;
    tabChecagens: TZQuery;
    Label1: TLabel;
    edtAnoBase: TEdit;
    btnImprimir: TBitBtn;
    edtIntervalo: TSpinEdit;
    Label3: TLabel;
    edtTamanhoFonte: TSpinEdit;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    FVendedoresBar: TBarSeries;
    procedure PrepararGrafico;
  public
    { Public declarations }
  end;

var
  gfVendasAnual: TgfVendasAnual;

implementation

uses uFormBase, uMenu, uFuncoes, uConstantes; 

{$R *.dfm}

procedure TgfVendasAnual.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TgfVendasAnual.btnAtualizarClick(Sender: TObject);
begin
   inherited;
   PrepararGrafico;
end;

procedure TgfVendasAnual.FormShow(Sender: TObject);
begin
   inherited;
   FVendedoresBar:=TBarSeries.Create(Self);
   edtAnoBase.Text:=FormatDateTime('yyyy', Date);
   btnAtualizar.Click;
end;

procedure TgfVendasAnual.PrepararGrafico;
begin
   chtGrafico.FreeAllSeries;

   tabVendas.Close;
   tabVendas.SQL.Clear;
   tabVendas.SQL.Add('SELECT SUM(ValorTotal) AS TOT, EXTRACT(MONTH FROM DataEntrega) AS MES ');
   tabVendas.SQL.Add('FROM pedidos ');
   tabVendas.SQL.Add('WHERE DataEntrega IS NOT NULL AND EXTRACT(YEAR FROM DataEntrega) = '+QuotedStr(edtAnoBase.Text));
   tabVendas.SQL.Add('AND NPedido > 0');
   tabVendas.SQL.Add('GROUP BY MES');
   tabVendas.SQL.Add('ORDER BY MES');      
   tabVendas.Open;

   FVendedoresBar:=TBarSeries.Create(Self);
   FVendedoresBar.ParentChart := chtGrafico;
   FVendedoresBar.Title := 'Vendas Anual';
   chtGrafico.Series[0].ColorEachPoint:=True;

   tabVendas.First;
   while not tabVendas.Eof do begin

      chtGrafico.Series[0].Add(tabVendas.FieldByName('TOT').AsFloat, MesExtenso(tabVendas.FieldByName('MES').AsInteger));

      tabVendas.Next;
   end;

   chtGrafico.Title.Text.Clear;
   chtGrafico.Title.Text.Add('Vendas Anual - Ano: '+edtAnoBase.Text);
   chtGrafico.LeftAxis.Automatic:=True;
   chtGrafico.LeftAxis.Increment:=edtIntervalo.Value;
   chtGrafico.LeftAxis.LabelsSeparation:=0; // <---- influência no Increment "default 10"
   chtGrafico.LeftAxis.LabelsFont.Size:=edtTamanhoFonte.Value; // "default 8"
end;

procedure TgfVendasAnual.btnImprimirClick(Sender: TObject);
begin
   inherited;
   ChartPreview(Self, chtGrafico); 
end;

end.

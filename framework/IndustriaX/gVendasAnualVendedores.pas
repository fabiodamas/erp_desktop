unit gVendasAnualVendedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, Menus, ExtCtrls, TeeProcs, TeEngine, Chart,
  Series, StdCtrls, Buttons, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, DBClient, Grids, DBGrids, DBCtrls, teeprevi, Spin;

type
  TgfVendasAnualVendedores = class(TfmFormBaseAvancado)
    chtGrafico: TChart;
    btnAtualizar: TBitBtn;
    tabVendas: TZQuery;
    tabChecagens: TZQuery;
    tabAuxVendas: TClientDataSet;
    tabAuxVendasCodigoVendedor: TFloatField;
    tabAuxVendasMes: TIntegerField;
    tabAuxVendasAno: TIntegerField;
    tabAuxVendasValor: TCurrencyField;
    Label1: TLabel;
    edtAnoBase: TEdit;
    dtsAuxVendas: TDataSource;
    tabAuxVendedores: TClientDataSet;
    tabAuxVendedoresCodigoVendedor: TFloatField;
    tabAuxVendedoresNomeVendedor: TStringField;
    edtDepartamento: TDBLookupComboBox;
    Label2: TLabel;
    tabDepartamento: TZQuery;
    dtsDepartamento: TDataSource;
    btnImprimir: TBitBtn;
    edtIntervalo: TSpinEdit;
    Label3: TLabel;
    edtTamanhoFonte: TSpinEdit;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnImprimirClick(Sender: TObject);
  private
    FVendedoresBar: TLineSeries;
    procedure PrepararGrafico;
  public
    { Public declarations }
  end;

var
  gfVendasAnualVendedores: TgfVendasAnualVendedores;

implementation

uses uFormBase, uMenu, uFuncoes, uConstantes; 

{$R *.dfm}

procedure TgfVendasAnualVendedores.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TgfVendasAnualVendedores.btnAtualizarClick(Sender: TObject);
begin
   inherited;
   PrepararGrafico;
end;

procedure TgfVendasAnualVendedores.FormShow(Sender: TObject);
begin
   inherited;
   FVendedoresBar:=TLineSeries.Create(Self);

   tabAuxVendas.CreateDataSet;
   tabAuxVendas.EmptyDataSet;

   tabAuxVendedores.CreateDataSet;
   tabAuxVendedores.EmptyDataSet;
   tabAuxVendedores.IndexFieldNames:='CodigoVendedor';

   tabDepartamento.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('3')+' ORDER BY Descricao');
   tabDepartamento.Open;

   edtAnoBase.Text:=FormatDateTime('yyyy', Date);  

   btnAtualizar.Click;
end;

procedure TgfVendasAnualVendedores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   inherited;
   tabAuxVendas.Close;
   tabAuxVendedores.Close;
   tabDepartamento.Close;
end;

procedure TgfVendasAnualVendedores.PrepararGrafico;
var vCnt: Integer;
    vNome : string;
begin
   tabAuxVendas.EmptyDataSet;
   tabAuxVendedores.EmptyDataSet;

   chtGrafico.FreeAllSeries;  

   tabAuxVendas.IndexFieldNames:='CodigoVendedor;Mes;Ano';

   tabVendas.Close;
   tabVendas.SQL.Clear;
   tabVendas.SQL.Add('SELECT pedidos.CodigoFuncionario, ');
   tabVendas.SQL.Add('SUM(pedidos.ValorTotal) AS TOT, ');
   tabVendas.SQL.Add('EXTRACT(MONTH FROM pedidos.DataEntrega) AS MES, ');
   tabVendas.SQL.Add('EXTRACT(YEAR FROM pedidos.DataEntrega) AS ANO ');
   tabVendas.SQL.Add('FROM pedidos ');
   tabVendas.SQL.Add('LEFT JOIN funcionarios ON funcionarios.Codigo = pedidos.CodigoFuncionario');
   tabVendas.SQL.Add('WHERE pedidos.DataEntrega IS NOT NULL AND EXTRACT(YEAR FROM pedidos.DataEntrega) = '+QuotedStr(edtAnoBase.Text));
   tabVendas.SQL.Add('AND pedidos.NPedido > 0 AND funcionarios.DataSaida IS NULL');

   if Trim(edtDepartamento.Text) <> '' then begin
      tabVendas.SQL.Add('AND funcionarios.CodigoDepto = '+QuotedStr(String(edtDepartamento.KeyValue)));
   end;

   tabVendas.SQL.Add('GROUP BY pedidos.CodigoFuncionario, MES, ANO');
   tabVendas.Open;

   tabVendas.First; 
   while not tabVendas.Eof do begin

      if not tabAuxVendedores.FindKey([tabVendas.FieldByName('CodigoFuncionario').AsFloat]) then begin
         tabAuxVendedores.Append;
         tabAuxVendedoresCodigoVendedor.Value:=tabVendas.FieldByName('CodigoFuncionario').AsFloat;

         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT Nome FROM funcionarios WHERE Codigo = '+QuotedStr(FloatToStr(tabVendas.FieldByName('CodigoFuncionario').AsFloat)));
            tabChecagens.Open;
            //tabAuxVendedoresNomeVendedor.Value:=
            vNome:=Copy(tabChecagens.FieldByName('Nome').AsString, 1, Pos(' ', tabChecagens.FieldByName('Nome').AsString));
            if Trim(vNome) = 'ZDESLIGADO' then begin
               vNome:=Copy(tabChecagens.FieldByName('Nome').AsString, 14, Pos(' ', tabChecagens.FieldByName('Nome').AsString));  
            end;

            tabAuxVendedoresNomeVendedor.Value:=vNome;
         finally
            tabChecagens.Close;
         end;
         tabAuxVendedores.Post;
      end;

      if tabAuxVendas.FindKey([tabVendas.FieldByName('CodigoFuncionario').AsFloat, tabVendas.FieldByName('Mes').AsString, tabVendas.FieldByName('Ano').AsString]) then begin
         tabAuxVendas.Edit;
         tabAuxVendasValor.Value:=tabAuxVendasValor.Value + tabVendas.FieldByName('TOT').AsFloat;
       end
      else begin
         tabAuxVendas.Append;
         tabAuxVendasCodigoVendedor.Value:=tabVendas.FieldByName('CodigoFuncionario').AsFloat;
         tabAuxVendasMes.Value:=StrToInt(tabVendas.FieldByName('MES').AsString);
         tabAuxVendasAno.Value:=StrToInt(tabVendas.FieldByName('ANO').AsString);
         tabAuxVendasValor.Value:=tabVendas.FieldByName('TOT').AsFloat;
      end;

      tabAuxVendas.Post;
   
      tabVendas.Next;
   end;

   tabAuxVendas.IndexFieldNames:='CodigoVendedor;Mes';

   // * Cria Gráficos *
   tabAuxVendedores.First;
   while not tabAuxVendedores.Eof do begin

      FVendedoresBar:=TLineSeries.Create(Self);
      FVendedoresBar.ParentChart := chtGrafico;
      FVendedoresBar.Title := tabAuxVendedoresNomeVendedor.Value;

      for vCnt:=1 to 12 do begin
         if not tabAuxVendas.FindKey([tabAuxVendedoresCodigoVendedor.Value, vCnt]) then begin
            tabAuxVendas.Append;
            tabAuxVendasCodigoVendedor.Value:=tabAuxVendedoresCodigoVendedor.Value;
            tabAuxVendasMes.Value:=vCnt;
            tabAuxVendasAno.Value:=StrToInt(edtAnoBase.Text);
            tabAuxVendasValor.Value:=0;
            tabAuxVendas.Post;
         end;

         FVendedoresBar.Add(tabAuxVendasValor.Value, MesExtenso(tabAuxVendasMes.Value));
      end;

      tabAuxVendedores.Next;
   end;

   chtGrafico.Title.Text.Clear;
   chtGrafico.Title.Text.Add('Vendas Anual por Vendedores - Ano: '+edtAnoBase.Text);

   chtGrafico.LeftAxis.Automatic:=False;
   chtGrafico.LeftAxis.AutomaticMaximum:=False;
   chtGrafico.LeftAxis.AutomaticMinimum:=False; 

   tabAuxVendas.IndexFieldNames:='Valor'; 

   tabAuxVendas.First;
   chtGrafico.LeftAxis.Minimum:=tabAuxVendasValor.Value;

   tabAuxVendas.Last;
   chtGrafico.LeftAxis.Maximum:=tabAuxVendasValor.Value;

   chtGrafico.LeftAxis.Increment:=edtIntervalo.Value;
   chtGrafico.LeftAxis.LabelsSeparation:=0; // <---- influência no Increment "default 10"
   chtGrafico.LeftAxis.LabelsFont.Size:=edtTamanhoFonte.Value; // "default 8"
end;

procedure TgfVendasAnualVendedores.btnImprimirClick(Sender: TObject);
begin
   inherited;
   ChartPreview(Self, chtGrafico);
end;

end.

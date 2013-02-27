unit uBaixaMultiplaTitulos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, DB, DBClient, Grids, DBGrids, StdCtrls,
  Buttons, CurrEdit, ExtCtrls, DBCtrls, Mask, ToolEdit, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, CheckLst, Menus;

type
  TfmBaixaMultiplaTitulos = class(TfmFormBaseAvancado)
    lblDataInicial: TLabel;
    edtDataVencto: TDateEdit;
    edtLocalizacao: TDBLookupComboBox;
    Label4: TLabel;
    Bevel1: TBevel;
    Label17: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    Label16: TLabel;
    Label25: TLabel;
    edtLiqData: TDateEdit;
    edtLiqTipo: TDBLookupComboBox;
    edtLiqDesconto: TCurrencyEdit;
    edtLiqAcrescimo: TCurrencyEdit;
    tabAuxTitulos: TClientDataSet;
    dtsAuxTitulos: TDataSource;
    btnFechar: TBitBtn;
    tabTitulos: TZQuery;
    tabAuxTitulosDocumento: TFloatField;
    tabAuxTitulosParcela: TIntegerField;
    tabAuxTitulosData: TDateField;
    tabAuxTitulosValorTotal: TCurrencyField;
    tabAuxTitulosTitulo: TFloatField;
    tabAuxTitulosValorLiquidado: TCurrencyField;
    tabAuxTitulosCodigoConta: TFloatField;
    btnAlterar: TBitBtn;
    tabLocalizacao: TZQuery;
    dtsLocalizacao: TDataSource;
    tabChecagens: TZQuery;
    btnLiquidar: TBitBtn;
    tabAuxTitulosValorDesconto: TCurrencyField;
    tabAuxTitulosValorAcrescimo: TCurrencyField;
    tabAuxTitulosPercentual: TFloatField;
    lblTotal: TLabel;
    lblDesconto: TLabel;
    lblAcrescimo: TLabel;
    tabBancos: TZQuery;
    dtsBancos: TDataSource;
    tabLiquidacoes: TZQuery;
    tabAuxTitulosValorLiquidar: TCurrencyField;
    edtCodigoBanco: TEdit;
    dbgTitulos: TDBGrid;
    tabAuxTitulosBaixar: TBooleanField;
    tabAuxTitulosNome: TStringField;
    tabAuxTitulosNotaFiscal: TStringField;
    btnSelecionarTodos: TBitBtn;
    edtNumeroCheque: TEdit;
    Label1: TLabel;
    edtNotaFiscal: TEdit;
    Label2: TLabel;
    ckbSinalizar: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure edtLiqDescontoExit(Sender: TObject);
    procedure edtLiqAcrescimoExit(Sender: TObject);
    procedure btnLiquidarClick(Sender: TObject);
    procedure edtLiqTipoCloseUp(Sender: TObject);
    procedure edtCodigoBancoChange(Sender: TObject);
    procedure dbgTitulosCellClick(Column: TColumn);
    procedure btnSelecionarTodosClick(Sender: TObject);
  private
    FTitulo: string;
    FTabelaTitulo: string;
    FTabelaTituloLiquidacoes: string;
    procedure CalcularPercentual;
    procedure AtualizaValores;
    procedure DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  public
    { Public declarations }
  end;

var
  fmBaixaMultiplaTitulos: TfmBaixaMultiplaTitulos;

implementation

uses uFormBase, uMenu, uFuncoes, uConstantes;

{$R *.dfm}

procedure TfmBaixaMultiplaTitulos.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TfmBaixaMultiplaTitulos.FormShow(Sender: TObject);
var vStringList: TStringList;
    vCnt : integer;
    vWhere : string;
begin
   inherited;

   dbgTitulos.OnDrawColumnCell:=DrawColumnCell;

   if Trim(fmMenu.pubTrans2) = '2' then begin
      FTitulo:='Pagar';
      FTabelaTitulo:='titulos_pagar';
      FTabelaTituloLiquidacoes:='titulos_pagar_liquidacoes';
    end
   else begin
      FTitulo:='Receber';
      FTabelaTitulo:='titulos_receber';
      FTabelaTituloLiquidacoes:='titulos_receber_liquidacoes';
   end;

   dbgTitulos.Columns[5].Title.Caption:='Valor'+FTitulo;

   Caption:=Caption + ' ' + FTitulo;

   tabAuxTitulos.CreateDataSet;
   tabAuxTitulos.EmptyDataSet;
   tabAuxTitulos.IndexFieldNames:='Titulo';

   tabLocalizacao.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('7')+' ORDER BY Descricao');
   tabLocalizacao.Open;

   tabBancos.SQL.Add('SELECT * FROM bancos ORDER BY Descricao');
   tabBancos.Open;

   vWhere:='';
   vStringList:=TStringList.Create;
   
   try
      ExtractStrings([';'], [' '], PAnsiChar(fmMenu.pubTrans1), vStringList);

      tabTitulos.Close;
      tabTitulos.SQL.Clear;
      tabTitulos.SQL.Add('SELECT '+FTabelaTitulo+'.Titulo, '+FTabelaTitulo+'.Documento, '+FTabelaTitulo+'.TipoConta, ');
      tabTitulos.SQL.Add(FTabelaTitulo+'.NotaFiscal, '+ FTabelaTitulo+'.Parcela,');
      tabTitulos.SQL.Add(FTabelaTitulo+'.DataVencimento, '+ FTabelaTitulo+'.ValorTotal,');
      tabTitulos.SQL.Add(FTabelaTitulo+'.CodigoConta, '+ FTabelaTitulo+'.ValorDesconto, ' + FTabelaTitulo+'.ValorAcrescimo,');
      if FTitulo = 'Receber' then begin
         tabTitulos.SQL.Add(FTabelaTitulo+'.ValorImposto,');
      end;
      tabTitulos.SQL.Add('(SELECT SUM(ValorLiquida) FROM '+FTabelaTituloLiquidacoes+' AS liq WHERE liq.Titulo = '+ FTabelaTitulo +'.Titulo) AS ValorLiquidado');
      tabTitulos.SQL.Add('FROM '+FTabelaTitulo);

      for vCnt:=0 to (vStringList.Count-1) do begin
         if (Trim(vStringList.Strings[vCnt]) <> '') and (Trim(vStringList.Strings[vCnt]) <> ';') then begin
            if Trim(vWhere) <> '' then vWhere:=vWhere + ' OR ';
            vWhere:=vWhere + '(Titulo = '+Trim(vStringList.Strings[vCnt])+')';
         end;
      end;
      tabTitulos.SQL.Add('WHERE');
      tabTitulos.SQL.Add(vWhere);
      tabTitulos.Open;

      tabTitulos.First;
      while not tabTitulos.Eof do begin

         tabAuxTitulos.Append;
         tabAuxTitulosTitulo.Value:=tabTitulos.FieldByName('Titulo').AsFloat;
         tabAuxTitulosDocumento.Value:=tabTitulos.FieldByName('Documento').AsFloat;
         tabAuxTitulosNotaFiscal.Value:=tabTitulos.FieldByName('NotaFiscal').AsString;
         tabAuxTitulosParcela.Value:=tabTitulos.FieldByName('Parcela').AsInteger;
         tabAuxTitulosData.Value:=tabTitulos.FieldByName('DataVencimento').AsDateTime;
         tabAuxTitulosCodigoConta.Value:=tabTitulos.FieldByName('CodigoConta').AsFloat;
         tabAuxTitulosValorLiquidado.Value:=tabTitulos.FieldByName('ValorLiquidado').AsFloat;
         // * Atenção * O Desconto/Acréscimo que aparece na grade NÃO é o Desconto/Acréscimo do Título
         // e sim, da Liquidação Parcial!

         if FTitulo = 'Receber' then begin
            tabAuxTitulosValorTotal.Value:=(tabTitulos.FieldByName('ValorTotal').AsFloat-tabTitulos.FieldByName('ValorDesconto').AsFloat)+tabTitulos.FieldByName('ValorAcrescimo').AsFloat+tabTitulos.FieldByName('ValorImposto').AsFloat;
          end
         else begin
            tabAuxTitulosValorTotal.Value:=(tabTitulos.FieldByName('ValorTotal').AsFloat-tabTitulos.FieldByName('ValorDesconto').AsFloat)+tabTitulos.FieldByName('ValorAcrescimo').AsFloat;
         end;

         tabAuxTitulosValorTotal.Value:=tabAuxTitulosValorTotal.Value - tabAuxTitulosValorLiquidado.Value;
         tabAuxTitulosValorDesconto.Value:=0;
         tabAuxTitulosValorAcrescimo.Value:=0;

         if FTitulo = 'Receber' then begin
            try
               tabChecagens.Close;
               tabChecagens.SQL.Clear;
               tabChecagens.SQL.Add('SELECT NomeFantasia FROM clientes WHERE CodigoCliente = '+FloatToStr(tabAuxTitulosCodigoConta.Value));
               tabChecagens.Open;
               tabAuxTitulosNome.Value:=tabChecagens.FieldByName('NomeFantasia').AsString;
            finally
               tabChecagens.Close;
            end;
          end
         else begin
            try
               tabChecagens.Close;
               tabChecagens.SQL.Clear;
               if tabTitulos.FieldByName('TipoConta').AsString = '1' then begin
                  tabChecagens.SQL.Add('SELECT NomeFantasia FROM fornecedores WHERE CodigoFornecedor = '+FloatToStr(tabAuxTitulosCodigoConta.Value));
                  tabChecagens.Open;
                  tabAuxTitulosNome.Value:=tabChecagens.FieldByName('NomeFantasia').AsString;
                end
               else if tabTitulos.FieldByName('TipoConta').AsString = '2' then begin
                  tabChecagens.SQL.Add('SELECT Nome FROM funcionarios WHERE Codigo = '+FloatToStr(tabAuxTitulosCodigoConta.Value));
                  tabChecagens.Open;
                  tabAuxTitulosNome.Value:=tabChecagens.FieldByName('Nome').AsString;
                end
               else if tabTitulos.FieldByName('TipoConta').AsString = '3' then begin
                  tabChecagens.SQL.Add('SELECT Nome FROM transportadoras WHERE Codigo = '+FloatToStr(tabAuxTitulosCodigoConta.Value));
                  tabChecagens.Open;
                  tabAuxTitulosNome.Value:=tabChecagens.FieldByName('Nome').AsString;
                end
               else if tabTitulos.FieldByName('TipoConta').AsString = '4' then begin
                  tabChecagens.SQL.Add('SELECT Descricao FROM bancos WHERE Codigo = '+FloatToStr(tabAuxTitulosCodigoConta.Value));
                  tabChecagens.Open;
                  tabAuxTitulosNome.Value:=tabChecagens.FieldByName('Nome').AsString;
               end;
            finally
               tabChecagens.Close;
            end;
         end;

         tabAuxTitulos.Post;

         tabTitulos.Next;
      end;

      edtLiqData.Date:=Date;
   finally
      vStringList.Free;
   end;
end;

procedure TfmBaixaMultiplaTitulos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabAuxTitulos.Close;
   tabTitulos.Close;
   tabLocalizacao.Close;
   tabBancos.Close;
   tabChecagens.Close;
   tabLiquidacoes.Close;
   inherited;
end;

procedure TfmBaixaMultiplaTitulos.btnFecharClick(Sender: TObject);
begin
   inherited;
   Close;
end;

procedure TfmBaixaMultiplaTitulos.btnAlterarClick(Sender: TObject);
begin
   inherited;
   if (Trim(edtDataVencto.Text) <> '/  /') or (Trim(edtLocalizacao.Text) <> '') then begin
      tabAuxTitulos.First;
      while not tabAuxTitulos.Eof do begin

         if tabAuxTitulosBaixar.Value = True then begin
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT * FROM '+FTabelaTitulo+' WHERE Titulo = '+FloatToStr(tabAuxTitulosTitulo.Value));
            tabChecagens.Open;

            if tabChecagens.RecordCount > 0 then begin
               tabChecagens.Edit;
               if Trim(edtLocalizacao.Text) <> '' then begin
                  tabChecagens.FieldByName('CodigoLocalizacao').AsFloat:=StrToFloat(edtLocalizacao.KeyValue);
               end;
               if Trim(edtDataVencto.Text) <> '/  /' then begin
                  tabChecagens.FieldByName('DataVencimento').AsDateTime:=edtDataVencto.Date;
               end;
               if Trim(edtNumeroCheque.Text) <> '' then begin
                  tabChecagens.FieldByName('NumeroCheque').AsString:=edtNumeroCheque.Text;
               end;
               if Trim(edtNotaFiscal.Text) <> '' then begin
                  tabChecagens.FieldByName('NotaFiscal').AsString:=edtNotaFiscal.Text;
               end;
               if ckbSinalizar.Checked then begin
                  tabChecagens.FieldByName('Sinalizado').AsInteger:=1;
                end
               else begin
                  tabChecagens.FieldByName('Sinalizado').AsInteger:=0;
               end;
               tabChecagens.Post;
               tabChecagens.ApplyUpdates;
            end;
         end;

         tabAuxTitulos.Next;
      end;
      ShowMessage('Títulos Alterados com Sucesso.');
   end;
end;

procedure TfmBaixaMultiplaTitulos.CalcularPercentual;
var vTotPerc : real;
begin

   if tabAuxTitulos.RecordCount > 0 then begin

         vTotPerc:=0;
         tabAuxTitulos.First;
         while not tabAuxTitulos.Eof do begin
            if tabAuxTitulosBaixar.Value = True then begin
               vTotPerc:=vTotPerc + tabAuxTitulosValorTotal.Value;
            end;
            tabAuxTitulos.Next;
         end;
         tabAuxTitulos.First;
         while not tabAuxTitulos.Eof do begin
            tabAuxTitulos.Edit;
            if tabAuxTitulosBaixar.Value = True then begin
               tabAuxTitulosPercentual.Value:=RoundReal((tabAuxTitulosValorTotal.Value * 100) / vTotPerc, 2);
             end
            else begin
               tabAuxTitulosPercentual.Value:=0;
            end;
            tabAuxTitulos.Post;

            tabAuxTitulos.Next;
         end;

   end;

end;

procedure TfmBaixaMultiplaTitulos.AtualizaValores;
var vTotal: real;
begin
   if tabAuxTitulos.RecordCount > 0 then begin
      CalcularPercentual;
      vTotal:=0;

      tabAuxTitulos.First;
      while not tabAuxTitulos.Eof do begin

         tabAuxTitulos.Edit;
         if tabAuxTitulosBaixar.Value = True then begin
            if edtLiqDesconto.Value > 0 then begin
               tabAuxTitulosValorDesconto.Value:=(tabAuxTitulosPercentual.Value / 100) * edtLiqDesconto.Value;
            end;
            if edtLiqAcrescimo.Value > 0 then begin
               tabAuxTitulosValorAcrescimo.Value:=(tabAuxTitulosPercentual.Value / 100) * edtLiqAcrescimo.Value;
            end;
            tabAuxTitulosValorLiquidar.Value:=(tabAuxTitulosValorTotal.Value-tabAuxTitulosValorDesconto.Value)+tabAuxTitulosValorAcrescimo.Value;

            vTotal:=vTotal + tabAuxTitulosValorLiquidar.Value;
          end
         else begin
            tabAuxTitulosValorLiquidar.Value:=0;
            tabAuxTitulosValorAcrescimo.Value:=0;
            tabAuxTitulosValorDesconto.Value:=0;
         end;
         tabAuxTitulos.Post;

         tabAuxTitulos.Next;
      end;

      lblTotal.Caption:='Total a '+FTitulo+': '+FormatFloat(sis_curr_format, vTotal);
      lblDesconto.Caption:='Desconto: '+FormatFloat(sis_curr_format, edtLiqDesconto.Value);
      lblAcrescimo.Caption:='Acréscimo: '+FormatFloat(sis_curr_format, edtLiqAcrescimo.Value);
   end;
end;

procedure TfmBaixaMultiplaTitulos.edtLiqDescontoExit(Sender: TObject);
begin
   inherited;
   AtualizaValores;
end;

procedure TfmBaixaMultiplaTitulos.edtLiqAcrescimoExit(Sender: TObject);
begin
   inherited;
   AtualizaValores;
end;

procedure TfmBaixaMultiplaTitulos.btnLiquidarClick(Sender: TObject);
begin
   inherited;

   if Trim(edtLiqData.Text) = '/  /' then begin
      ShowMessage('Obrigatório Preenchimento da Data de Liquidação');
      edtLiqData.SetFocus;
      exit;
   end;

   if Trim(edtCodigoBanco.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Banco');
      edtCodigoBanco.SetFocus;
      exit;
   end;

   tabAuxTitulos.First;
   while not tabAuxTitulos.Eof do begin

      if tabAuxTitulosBaixar.Value = True then begin
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT * FROM '+ FTabelaTitulo+' WHERE Titulo = '+FloatToStr(tabAuxTitulosTitulo.Value));
         tabChecagens.Open;

         if tabChecagens.RecordCount > 0 then begin
            tabChecagens.Edit;
            if tabAuxTitulosValorDesconto.Value > 0 then begin
               tabChecagens.FieldByName('ValorDesconto').AsFloat:=tabChecagens.FieldByName('ValorDesconto').AsFloat + tabAuxTitulosValorDesconto.Value;
            end;
            if tabAuxTitulosValorAcrescimo.Value > 0 then begin
               tabChecagens.FieldByName('ValorAcrescimo').AsFloat:=tabChecagens.FieldByName('ValorAcrescimo').AsFloat + tabAuxTitulosValorAcrescimo.Value;
            end;
            tabChecagens.FieldByName('DataPagamento').AsDateTime:=edtLiqData.Date;
            tabChecagens.Post;
            tabChecagens.ApplyUpdates;

            tabLiquidacoes.Close;
            tabLiquidacoes.SQL.Clear;
            tabLiquidacoes.SQL.Add('SELECT * FROM '+FTabelaTituloLiquidacoes+' WHERE 0');
            tabLiquidacoes.Open;

            tabLiquidacoes.Append;
            tabLiquidacoes.FieldByName('ID').AsFloat:=CodeGenerator(FTabelaTituloLiquidacoes, 'ID');
            tabLiquidacoes.FieldByName('Titulo').AsFloat:=tabAuxTitulosTitulo.Value;
            tabLiquidacoes.FieldByName('TipoLiquida').AsFloat:=StrToFloat(edtLiqTipo.KeyValue);
            tabLiquidacoes.FieldByName('DataLiquida').AsDateTime:=edtLiqData.Date;
            tabLiquidacoes.FieldByName('ValorLiquida').AsFloat:=tabAuxTitulosValorLiquidar.Value;
            tabLiquidacoes.Post;
            tabLiquidacoes.ApplyUpdates;

            tabAuxTitulos.Delete;
            Continue;
         end;
      end;

      tabAuxTitulos.Next;
   end;
   ShowMessage('Títulos Liquidados com Sucesso.');
   if tabAuxTitulos.RecordCount = 0 then Close;
end;

procedure TfmBaixaMultiplaTitulos.edtLiqTipoCloseUp(Sender: TObject);
begin
   inherited;
   if Trim(edtLiqTipo.Text) <> '' then begin
      edtCodigoBanco.Text:=String(edtLiqTipo.KeyValue);
    end
   else begin
      edtCodigoBanco.Text:='';
   end;
end;

procedure TfmBaixaMultiplaTitulos.edtCodigoBancoChange(Sender: TObject);
begin
   inherited;
   if Trim(edtCodigoBanco.Text) <> '' then begin
      edtLiqTipo.KeyValue:=StrToFloat(edtCodigoBanco.Text);
    end
   else begin
      edtLiqTipo.KeyValue:=NULL;
   end;
end;

procedure TfmBaixaMultiplaTitulos.DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var vCheck : Integer;
    R : TRect;
begin
   inherited;
   if Column.FieldName = 'Baixar' then begin
      dbgTitulos.Canvas.FillRect(Rect);
      if tabAuxTitulosBaixar.Value = True then vCheck := DFCS_CHECKED else vCheck := 0;
      R:=Rect;
      InflateRect(R, -2, -2); {Diminue o tamanho do CheckBox}
      DrawFrameControl(dbgTitulos.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or vCheck);
   end;
end;

procedure TfmBaixaMultiplaTitulos.dbgTitulosCellClick(Column: TColumn);
var
  Bookmark1 : TBookmark;
begin
   inherited;
   if Column.FieldName = 'Baixar' then begin
      try
         Bookmark1 := tabAuxTitulos.GetBookmark;
         tabAuxTitulos.DisableControls;

         tabAuxTitulos.Edit;

         if tabAuxTitulosBaixar.Value = True then begin
            tabAuxTitulosBaixar.Value:=False;
          end
         else begin
            tabAuxTitulosBaixar.Value:=True;
         end;
         
         tabAuxTitulos.Post;

         AtualizaValores;

      finally
         tabAuxTitulos.GotoBookmark (Bookmark1);
         tabAuxTitulos.FreeBookmark (Bookmark1);
         tabAuxTitulos.EnableControls;
      end;
   end;
end;

procedure TfmBaixaMultiplaTitulos.btnSelecionarTodosClick(Sender: TObject);
begin
  inherited;
  dbgTitulos.DataSource:=nil;
  try
     tabAuxTitulos.First;
     while not tabAuxTitulos.Eof do begin
        tabAuxTitulos.Edit;
        tabAuxTitulosBaixar.Value:=True;
        tabAuxTitulos.Post;
        tabAuxTitulos.Next;
     end;
     AtualizaValores;
  finally
     dbgTitulos.DataSource:=dtsAuxTitulos;
  end;
end;

end.

unit uProducaoMediaHora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, ExtCtrls, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  DBClient, Provider, Buttons, cxContainer, cxProgressBar;

type
  TfmProducaoMediaHora = class(TForm)
    pnl1: TPanel;
    dbgPainel: TcxGrid;
    tvwPainel: TcxGridDBTableView;
    clmCodigoProduto: TcxGridDBColumn;
    clmOperacao: TcxGridDBColumn;
    clmInicio: TcxGridDBColumn;
    clmTermino: TcxGridDBColumn;
    clmQuantidade: TcxGridDBColumn;
    clmResponsavel1: TcxGridDBColumn;
    lvlPainel: TcxGridLevel;
    btnColetarMedias: TButton;
    rdgProdutos: TRadioGroup;
    tabRoteiro: TZQuery;
    tabPainel: TClientDataSet;
    dtsPainel: TDataSource;
    tabChecagens: TZQuery;
    mmo1: TMemo;
    pnl2: TPanel;
    lbl2: TLabel;
    edtCodigoProduto: TEdit;
    btnProdutoLocalizar: TBitBtn;
    edtDescricaoProdutos: TEdit;
    lbl3: TLabel;
    lbl1: TLabel;
    edtCodigoFuncionario: TEdit;
    btnFuncionarioLocalizar: TBitBtn;
    edtFuncionario: TEdit;
    lbl4: TLabel;
    clmStatus: TcxGridDBColumn;
    clmMediaHora: TcxGridDBColumn;
    tabPainelOrdemProducao: TFloatField;
    cdsPainelCodigoProduto: TStringField;
    tabPainelPeriodoInicial: TDateTimeField;
    tabPainelPeriodoFinal: TDateTimeField;
    tabPainelPerdas: TFloatField;
    tabPainelCodigoSetor: TFloatField;
    tabPainelQuantidade: TFloatField;
    tabPainelTotal: TFloatField;
    tabPainelCodigoResponsavel1: TFloatField;
    tabPainelCodigoResponsavel2: TFloatField;
    cdsPainelnome1: TStringField;
    cdsPainelnome2: TStringField;
    cdsPainelStatus: TStringField;
    tabPainelMediaHora: TFloatField;
    cdsPainelSetor: TStringField;
    tfdPainelDuracao: TTimeField;
    pbrBarra: TcxProgressBar;
    btnInserirMedias: TButton;
    pnlBarra: TPanel;
    btn3: TButton;
    procedure CarregarRoteiro;
    procedure btnColetarMediasClick(Sender: TObject);
    procedure ExportViewToExcel(AView: TcxGridDBTableView);
    procedure btn3Click(Sender: TObject);
    procedure btnProdutoLocalizarClick(Sender: TObject);
    procedure edtCodigoProdutoChange(Sender: TObject);
    procedure edtCodigoFuncionarioChange(Sender: TObject);
    procedure btnFuncionarioLocalizarClick(Sender: TObject);
    procedure edtCodigoProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure btnInserirMediasClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmProducaoMediaHora: TfmProducaoMediaHora;

implementation

{$R *.dfm}

uses cxGridExportLink, uLocalizarProdutos, uMenu, uLocalizarFuncionarios,
  Math, uFuncoes, DateUtils;

procedure TfmProducaoMediaHora.CarregarRoteiro;
var
  Field: TIntegerField;
  hi, hf: TDateTime;
  ai, af: TDateTime;
  vMedia: Real;
  vDuracao: TTime;
begin
  Application.ProcessMessages;
  try

    try
      tvwPainel.DataController.DataSource := nil;

      pbrBarra.Position := 1;
      pbrBarra.Update;
      pnlBarra.Caption := 'Coletando roteiro produtivo...';
      pnlBarra.Update;

      tabRoteiro.Close;
      tabRoteiro.SQL.Clear;
      tabRoteiro.SQL.Add(' SELECT                           ');
      tabRoteiro.SQL.Add('     rp.ID,                           ');
      tabRoteiro.SQL.Add('     rp.OrdemProducao,                           ');
      tabRoteiro.SQL.Add('     rp.CodigoProduto,                           ');
      tabRoteiro.SQL.Add('     rp.PeriodoInicial,                           ');
      tabRoteiro.SQL.Add('     rp.PeriodoFinal,                           ');
      tabRoteiro.SQL.Add('     rp.Perdas,                           ');
      tabRoteiro.SQL.Add('     rp.CodigoSetor,                           ');
      tabRoteiro.SQL.Add('     rp.Quantidade,                           ');
      tabRoteiro.SQL.Add('     rp.Quantidade as Total,                           ');
      tabRoteiro.SQL.Add('     rp.CodigoResponsavel1,                           ');
      tabRoteiro.SQL.Add('     rp.CodigoResponsavel2,                           ');
      tabRoteiro.SQL.Add('     f1.nome as nome1,                           ');
      tabRoteiro.SQL.Add('     f2.nome as nome2,                           ');
      tabRoteiro.SQL.Add('     f2.nome as Status,                           ');
      tabRoteiro.SQL.Add('     ID as MediaHora,                             ');
      tabRoteiro.SQL.Add('     genericos.Descricao AS Setor                           ');
      tabRoteiro.SQL.Add(' FROM                           ');
      tabRoteiro.SQL.Add('     roteiro_produtivo AS rp                           ');
      tabRoteiro.SQL.Add('         LEFT JOIN                           ');
      tabRoteiro.SQL.Add('     genericos ON genericos.Codigo = rp.CodigoSetor                           ');
      tabRoteiro.SQL.Add('         LEFT JOIN                           ');
      tabRoteiro.SQL.Add('     funcionarios as f1 ON f1.Codigo = rp.CodigoResponsavel1                           ');
      tabRoteiro.SQL.Add('         LEFT JOIN                           ');
      tabRoteiro.SQL.Add('     funcionarios as f2 ON f2.Codigo = rp.CodigoResponsavel2                           ');
      tabRoteiro.SQL.Add(' WHERE    ');
      tabRoteiro.SQL.Add(' rp.Quantidade <> 0  and rp.PeriodoInicial is not null and rp.PeriodoFinal is not null and ');

      if Trim(edtCodigoProduto.Text) <> '' then
      begin
        tabRoteiro.SQL.Add(' rp.CodigoProduto = ' + QuotedStr(edtCodigoProduto.Text) + ' and ');
      end;

      if Trim(edtCodigoFuncionario.Text) <> '' then
      begin
        tabRoteiro.SQL.Add(' rp.CodigoResponsavel1 = ' + QuotedStr(edtCodigoFuncionario.Text) + ' and ');
      end;

      tabRoteiro.SQL.Add('     exists( SELECT                           ');
      tabRoteiro.SQL.Add('             op.OrdemProducao                           ');
      tabRoteiro.SQL.Add('         FROM                           ');
      tabRoteiro.SQL.Add('             ordem_producao AS op                           ');
      tabRoteiro.SQL.Add('         WHERE                          ');

      if rdgProdutos.ItemIndex = 0 then
      begin
        tabRoteiro.SQL.Add(' op.DataTermino IS NULL ');
        tabRoteiro.SQL.Add('                 and rp.OrdemProducao = op.OrdemProducao   ');
      end
      else if rdgProdutos.ItemIndex = 1 then
      begin
        tabRoteiro.SQL.Add(' op.DataTermino IS NOT NULL ');
        tabRoteiro.SQL.Add('                 and rp.OrdemProducao = op.OrdemProducao   ');
      end
      else if rdgProdutos.ItemIndex = 2 then
      begin
        tabRoteiro.SQL.Add('               rp.OrdemProducao = op.OrdemProducao   ');
      end;

      tabRoteiro.SQL.Add('         )                        ');
      tabRoteiro.SQL.Add('order by rp.CodigoProduto, rp.CodigoResponsavel1  ');
      // tabRoteiro.SQL.Add('order by rp.id  ');

      tabRoteiro.Open;

      tabPainel.EmptyDataSet;
      tabPainel.Close;
      tabPainel.Open;

      tabRoteiro.First;

      pbrBarra.Properties.Max := tabRoteiro.RecordCount;
      pnlBarra.Caption := 'Calculando médias...';
      pnlBarra.Update;

      while not tabRoteiro.Eof do
      begin

        Application.ProcessMessages;
        try

          tabPainel.Insert;
          tabPainel.FieldByName('CodigoProduto').AsString := tabRoteiro.FieldByName('CodigoProduto').AsString;
          tabPainel.FieldByName('MediaHora').AsFloat := tabRoteiro.FieldByName('MediaHora').AsFloat;
          tabPainel.FieldByName('nome1').AsString := tabRoteiro.FieldByName('nome1').AsString;
          tabPainel.FieldByName('Setor').AsString := tabRoteiro.FieldByName('Setor').AsString;
          tabPainel.FieldByName('PeriodoInicial').AsDateTime := tabRoteiro.FieldByName('PeriodoInicial').AsDateTime;
          tabPainel.FieldByName('PeriodoFinal').AsDateTime := tabRoteiro.FieldByName('PeriodoFinal').AsDateTime;
          tabPainel.FieldByName('CodigoSetor').AsInteger := tabRoteiro.FieldByName('CodigoSetor').AsInteger;
          tabPainel.FieldByName('CodigoResponsavel1').AsInteger := tabRoteiro.FieldByName('CodigoResponsavel1').AsInteger;
          tabPainel.FieldByName('Quantidade').AsInteger := tabRoteiro.FieldByName('Quantidade').AsInteger;
          tabPainel.FieldByName('Status').AsString := tabRoteiro.FieldByName('Status').AsString;
          tabPainel.FieldByName('OrdemProducao').AsFloat := tabRoteiro.FieldByName('OrdemProducao').AsFloat;
          tabPainel.FieldByName('CodigoProduto').AsString := tabRoteiro.FieldByName('CodigoProduto').AsString;

          tabChecagens.Close;
          tabChecagens.SQL.Clear;
          tabChecagens.SQL.Add('SELECT sum(Quantidade) as Qtd FROM ordem_producao_produtos ');
          tabChecagens.SQL.Add('WHERE OrdemProducao = ' + QuotedStr(tabPainel.FieldByName('OrdemProducao').AsString));
          tabChecagens.SQL.Add('AND CodigoProduto = ' + QuotedStr(tabPainel.FieldByName('CodigoProduto').AsString));

          tabChecagens.Open;

          vDuracao := tabRoteiro.FieldByName('PeriodoFinal').AsDateTime - tabRoteiro.FieldByName('PeriodoInicial').AsDateTime;

          if tabChecagens.RecordCount = 1 then
          begin
            tabPainel.FieldByName('Total').AsInteger := tabChecagens.FieldByName('Qtd').AsInteger;
          end
          else
          begin
            tabPainel.FieldByName('Total').AsInteger := 0;
          end;

          hi := tabPainel.FieldByName('PeriodoInicial').AsDateTime;
          hf := tabPainel.FieldByName('PeriodoFinal').AsDateTime;

          ai := StrToDateTime(DateToStr(hi) + ' 11:00:00');
          af := StrToDateTime(DateToStr(hf) + ' 12:30:00');

          // Inicio: Manha
          // Termino: Manha
          if (hi <= ai) and (hf <= ai) then
          begin
            tabPainel.FieldByName('Status').AsString := TimeToStr(vDuracao);
          end
            // Inicio: Manha
            // Termino: Almoço
          else if (hi <= ai) and ((hf >= ai) and (hf <= af)) then
          begin

            tabPainel.FieldByName('Status').AsString := TimeToStr(ai - hi);
          end
            // Inicio: Manha
            // Termino: Tarde
          else if (hi <= ai) and (hf >= af) then
          begin
            tabPainel.FieldByName('Status').AsString := TimeToStr((hf - hi) - (af - ai));
          end
            // ***********************************
            // Inicio: almoco
            // Termino: almoco
          else if ((hi >= ai) and (hi <= af)) and (hf <= af) then
          begin
            tabPainel.FieldByName('Status').AsString := '';
          end
            // Inicio: almoco
            // Termino: tarde
          else if ((hi >= ai) and (hi <= af)) and (hf > af) then
          begin
            tabPainel.FieldByName('Status').AsString := TimeToStr((hf - af));
          end
            // Inicio: tarde
            // Termino: tarde
          else if (hi >= ai) and (hf > af) then
          begin
            tabPainel.FieldByName('Status').AsString := TimeToStr(vDuracao);
          end;

          if (tabPainel.FieldByName('Status').AsString <> '') then
          begin
            vMedia := (tabPainel.FieldByName('Quantidade').AsFloat * 3600) / (StrToTime(tabPainel.FieldByName('Status').AsString) * 86400);

            tabPainel.FieldByName('MediaHora').AsFloat := StrToFloat(FormatFloat('###0.00', vMedia));
          end;

          tabPainel.Post;

        finally
          tabChecagens.Close;
        end;

        pbrBarra.Position := tabRoteiro.RecNo;
        pbrBarra.Update;
        tabRoteiro.Next;
      end;

      // tabAuxOperacoes.IndexFieldNames := 'Data;Sequencia'; // OrdemProducao;
    finally
      tvwPainel.DataController.DataSource := dtsPainel;
      pbrBarra.Position := 0;
      pbrBarra.Update;
      pnlBarra.Caption := '';
      pnlBarra.Update;
      tabPainel.Open
    end;

  except
    showmessage(tabPainel.FieldByName('OrdemProducao').AsString);
  end;

end;

procedure TfmProducaoMediaHora.btnColetarMediasClick(Sender: TObject);
begin
  CarregarRoteiro;
end;

procedure TfmProducaoMediaHora.ExportViewToExcel(
  AView: TcxGridDBTableView);
var
  Grid: TcxGrid;
  Level: TcxGridLevel;
  View: TcxGridDBTableView;
begin
  Grid := TcxGrid.Create(self);
  Level := Grid.Levels.Add;
  View := Grid.CreateView(TcxGridDBTableView) as TcxGridDBTableView;
  View.DataController.DataSource := AView.DataController.DataSource;
  View.DataController.CreateAllItems();

  Level.GridView := View;
  ExportGridToExcel('C:\1.xls', dbgPainel);
  FreeAndNil(View);
  FreeAndNil(Grid);
end;

procedure TfmProducaoMediaHora.btn3Click(Sender: TObject);
begin
  ExportViewToExcel(TcxGridDBTableView(dbgPainel.FocusedView.PatternGridView));
end;

procedure TfmProducaoMediaHora.btnProdutoLocalizarClick(Sender: TObject);
begin
  inherited;
  if not Assigned(fmLocalizarProdutos) then
  begin
    Application.CreateForm(TfmLocalizarProdutos, fmLocalizarProdutos);
    fmLocalizarProdutos.ShowModal;
  end;
  if Trim(fmMenu.pubTrans1) <> '' then
  begin
    edtCodigoProduto.Text := fmMenu.pubTrans1;
  end;
end;

procedure TfmProducaoMediaHora.edtCodigoProdutoChange(Sender: TObject);
begin
  inherited;
  if Trim(edtCodigoProduto.Text) <> '' then
  begin
    try
      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT CodigoProduto,NomeTecnico FROM produtos WHERE CodigoProduto = ' + QuotedStr(edtCodigoProduto.Text));
      tabChecagens.Open;

      if tabChecagens.RecordCount > 0 then
      begin
        edtDescricaoProdutos.Text := tabChecagens.FieldByName('NomeTecnico').AsString;
      end
      else
      begin
        edtDescricaoProdutos.Text := '';
      end;
    finally
      tabChecagens.Close;
    end;
  end
  else
  begin
    edtDescricaoProdutos.Text := '';
  end;
end;

procedure TfmProducaoMediaHora.edtCodigoFuncionarioChange(Sender: TObject);
begin
  inherited;
  try
    if Trim(edtCodigoFuncionario.Text) <> '' then
    begin
      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT Nome FROM funcionarios WHERE Codigo = ' + edtCodigoFuncionario.Text);
      tabChecagens.Open;
      if tabChecagens.RecordCount > 0 then
      begin
        edtFuncionario.Text := tabChecagens.FieldByName('Nome').AsString;
      end
      else
      begin
        edtFuncionario.Text := '';
      end;
    end
    else
    begin
      edtFuncionario.Text := '';
    end;
  finally
    tabChecagens.Close;
  end;
end;

procedure TfmProducaoMediaHora.btnFuncionarioLocalizarClick(Sender: TObject);
begin
  inherited;
  if not Assigned(fmLocalizarFuncionarios) then
  begin
    Application.CreateForm(TfmLocalizarFuncionarios, fmLocalizarFuncionarios);
    fmLocalizarFuncionarios.ShowModal;
  end;
  if Trim(fmMenu.pubTrans1) <> '' then
  begin
    edtCodigoFuncionario.Text := fmMenu.pubTrans1;
  end;
end;

procedure TfmProducaoMediaHora.edtCodigoProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #32 then
    Key := #0
  else
    Key := UpCase(Key);
end;

procedure TfmProducaoMediaHora.btnInserirMediasClick(Sender: TObject);
var
  vTabMediProd, vAtuaRote: TZQuery;
  vTotalBarra: integer;
  vProgresso: integer;
begin
  try
    tvwPainel.DataController.DataSource := nil;
    Application.ProcessMessages;

    vAtuaRote := TZQuery.Create(nil);
    vAtuaRote.Connection := fmMenu.zcnConexao;

    vTabMediProd := TZQuery.Create(nil);
    vTabMediProd.Connection := fmMenu.zcnConexao;

    vTabMediProd.SQL.Clear;
    vTabMediProd.SQL.Add('delete from media_produtiva');
    vTabMediProd.ExecSQL;

    vTabMediProd.SQL.Clear;
    vTabMediProd.SQL.Add('select * from media_produtiva');
    vTabMediProd.Open;

    tabPainel.First;

    pbrBarra.Position := 1;
    pbrBarra.Update;
    vTotalBarra := tabPainel.RecordCount * 2;
    pbrBarra.Properties.Max := vTotalBarra;
    pnlBarra.Caption := 'Coletando dados para agrupamento...';
    pnlBarra.Update;

    vProgresso := 0;

    while not tabPainel.Eof do
    begin
      Application.ProcessMessages;

      vTabMediProd.Insert;
      vTabMediProd.FieldByName('ID').AsFloat := CodeGenerator('media_produtiva', 'ID');
      vTabMediProd.FieldByName('CodigoProduto').AsString := tabPainel.FieldByName('CodigoProduto').AsString;
      vTabMediProd.FieldByName('CodigoSetor').AsFloat := tabPainel.FieldByName('CodigoSetor').AsFloat;
      vTabMediProd.FieldByName('CodigoResponsavel1').AsFloat := tabPainel.FieldByName('CodigoResponsavel1').AsFloat;
      vTabMediProd.FieldByName('PeriodoInicial').AsDateTime := tabPainel.FieldByName('PeriodoInicial').AsDateTime;
      vTabMediProd.FieldByName('PeriodoFinal').AsDateTime := tabPainel.FieldByName('PeriodoFinal').AsDateTime;
      vTabMediProd.FieldByName('Quantidade').AsFloat := tabPainel.FieldByName('Quantidade').AsFloat;

      if tabPainel.FieldByName('Status').AsString <> '' then
      begin
        vTabMediProd.FieldByName('Duracao').AsDateTime := tabPainel.FieldByName('Status').AsDateTime;
      end;

      vTabMediProd.FieldByName('MediaFinal').AsFloat := tabPainel.FieldByName('MediaHora').AsFloat;

      vTabMediProd.Post;

      pbrBarra.Position := vProgresso;
      pbrBarra.Update;
      vProgresso := vProgresso + 1;

      tabPainel.Next;
    end;

    vTabMediProd.Close;
    vTabMediProd.SQL.Clear;
    vTabMediProd.SQL.Add(' select                                              ');
    vTabMediProd.SQL.Add('    codigoproduto, codigosetor, avg(MediaFinal) MediaHora  ');
    vTabMediProd.SQL.Add(' from                                            ');
    vTabMediProd.SQL.Add('    media_produtiva                              ');
    vTabMediProd.SQL.Add(' group by codigoproduto , codigosetor;           ');
    vTabMediProd.Open;
    vTabMediProd.First;

    pnlBarra.Caption := 'Inserindo médias nos roteiros...';
    pnlBarra.Update;

    while not vTabMediProd.Eof do
    begin
      Application.ProcessMessages;

      vAtuaRote.Close;
      vAtuaRote.SQL.Clear;
      vAtuaRote.SQL.Add(' update sequencia_producao_produtos set ProducaoPorHora = ' +

        QuotedStr(
        TrocaVirgPPto(FormatFloat('###0.00', StrToCurr(vTabMediProd.FieldByName('MediaHora').AsString))

        )));
      vAtuaRote.SQL.Add(' where CodigoProduto = ' + QuotedStr(vTabMediProd.FieldByName('CodigoProduto').AsString));
      vAtuaRote.SQL.Add(' and   CodigoSetor   = ' + QuotedStr(vTabMediProd.FieldByName('CodigoSetor').AsString));

      mmo1.Lines.Text := vAtuaRote.SQL.Text;

      vAtuaRote.ExecSQL;

      pbrBarra.Position := vProgresso;
      pbrBarra.Update;
      vProgresso := vProgresso + 1;

      vTabMediProd.Next;
    end;

  finally
    pbrBarra.Position := vTotalBarra;
    pbrBarra.Position := 0;
    tvwPainel.DataController.DataSource := dtsPainel;
    pbrBarra.Update;
    pnlBarra.Caption := '';
    pnlBarra.Update;
  end;

end;

procedure TfmProducaoMediaHora.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=caFree; 
end;

end.


unit uEtiquetasProdutos_TLP2844;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, Menus, StdCtrls, Buttons, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, Grids, DBGrids,
  DBCtrls;

type
  TfmEtiquetasProdutos_TLP2844 = class(TfmFormBaseAvancado)
    btnImprimir: TBitBtn;
    grbItens: TGroupBox;
    ckbCodigoProduto: TCheckBox;
    ckbDescricaoProduto: TCheckBox;
    edtTipo: TEdit;
    lblTipo: TLabel;
    ckbReferencia: TCheckBox;
    ckbCliente: TCheckBox;
    edtQtdPEtiq: TEdit;
    Label2: TLabel;
    tabTipo: TZQuery;
    tabTipoProdutos: TZQuery;
    edtImpressora: TComboBox;
    Label3: TLabel;
    ckbTipo: TCheckBox;
    ckbOrdemCompra: TCheckBox;
    ckbLote: TCheckBox;
    ckbCodigoBarras: TCheckBox;
    btnFechar: TBitBtn;
    tabClientes: TZQuery;
    dtsTipo: TDataSource;
    tabReferencias: TZQuery;
    dtsTipoProdutos: TDataSource;
    ckbQtdItens: TCheckBox;
    tabAuxEtiquetas: TClientDataSet;
    grbAvulsa: TGroupBox;
    edtAvCodigoProduto: TEdit;
    Label1: TLabel;
    Label4: TLabel;
    edtAvDescricaoProduto: TEdit;
    Label5: TLabel;
    edtAvReferencia: TEdit;
    Label6: TLabel;
    edtAvCliente: TEdit;
    btnLocalizarProdutos: TBitBtn;
    btnLocalizarClientes: TBitBtn;
    lblAvTipo: TLabel;
    edtAvTipo: TEdit;
    Label8: TLabel;
    edtAvOc: TEdit;
    Label9: TLabel;
    edtAvLote: TEdit;
    Label10: TLabel;
    edtAvQtdEtiquetas: TEdit;
    btnTipo: TButton;
    tabChecagens: TZQuery;
    tabAuxEtiquetasDescricao: TStringField;
    tabAuxEtiquetasCodigoProduto: TStringField;
    tabAuxEtiquetasReferencia: TStringField;
    tabAuxEtiquetasCodigoCliente: TFloatField;
    tabAuxEtiquetasNomeCliente: TStringField;
    tabAuxEtiquetasOrdemCompra: TStringField;
    tabAuxEtiquetasLote: TStringField;
    tabAuxEtiquetasCodigoBarras: TStringField;
    edtAvCodigoCliente: TEdit;
    tabAuxEtiquetasTipo: TStringField;
    Label11: TLabel;
    edtAvQtdItens: TEdit;
    edtAvUnidade: TDBLookupComboBox;
    tabUnidades: TZQuery;
    dtsUnidades: TDataSource;
    tabAuxEtiquetasUnidade: TStringField;
    tabAuxEtiquetasQtdItens: TStringField;
    pndImpressao: TPrintDialog;
    procedure btnImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure dtsTipoDataChange(Sender: TObject; Field: TField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dtsTipoProdutosDataChange(Sender: TObject; Field: TField);
    procedure btnTipoClick(Sender: TObject);
    procedure btnLocalizarProdutosClick(Sender: TObject);
    procedure btnLocalizarClientesClick(Sender: TObject);
    procedure edtAvCodigoProdutoChange(Sender: TObject);
    procedure edtAvQtdEtiquetasExit(Sender: TObject);
    procedure edtAvCodigoClienteChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FTipo: string[1]; // '1' Pedido, '2' / Ordem de Produção.
  public
    { Public declarations }
  end;

var
  fmEtiquetasProdutos_TLP2844: TfmEtiquetasProdutos_TLP2844;

implementation

uses uFuncoes, uMenu, Math, uFormBase, uLocalizarProdutos,
  uLocalizarClientes;

{$R *.dfm}

procedure TfmEtiquetasProdutos_TLP2844.btnImprimirClick(Sender: TObject);
var vArquivo: TStringList;
    vQtd, vQtdPEti : Integer;
    vResto: real;
    vTextFile: TextFile;
    vCnt : Integer;
    vCodigoBarras: string;
    vQuantidadeTotal: real;
begin
  inherited;

  if Trim(edtTipo.Text) = '' then
  begin
    if FTipo = '1' then
    begin
       ShowMessage('Obrigatório Preenchimento do Pedido');
     end
    else if FTipo = '2' then
    begin
       ShowMessage('Obrigatório Preenchimento da Ordem de Produção');
    end;
    edtTipo.SetFocus;
    exit;
  end;

  if Trim(edtQtdPEtiq.Text) = '' then
  begin
    ShowMessage('Obrigatório Preenchimento da Qtd por Etiquetas');
    edtQtdPEtiq.SetFocus;
    exit;
  end;

  if Trim(edtImpressora.Text) = '' then
  begin
    ShowMessage('Obrigatório Preechimento da Impressora');
    edtImpressora.SetFocus;
    exit; 
  end;

  //if pndImpressao.Execute then begin

  vQtdPEti:=StrToInt(edtQtdPEtiq.Text);

  if vQtdPEti <= 0 then
  begin
    raise Exception.Create('Valor Inválido');
  end;

  if FTipo = '1' then
  begin
    tabTipo.Close;
    tabTipo.SQL.Clear;
    tabTipo.SQL.Add('SELECT * FROM pedidos WHERE NPedido = '+QuotedStr(edtTipo.Text));
    tabTipo.Open;

    tabTipoProdutos.Close;
    tabTipoProdutos.SQL.Clear;
    tabTipoProdutos.SQL.Add('SELECT * FROM pedidos_produtos WHERE NPedido = '+QuotedStr(edtTipo.Text));
    tabTipoProdutos.Open;
   end
  else if FTipo = '2' then
  begin
    tabTipo.Close;
    tabTipo.SQL.Clear;
    tabTipo.SQL.Add('SELECT * FROM ordem_producao WHERE OrdemProducao = '+QuotedStr(edtTipo.Text));
    tabTipo.Open;

    tabTipoProdutos.Close;
    tabTipoProdutos.SQL.Clear;
    tabTipoProdutos.SQL.Add('SELECT * FROM ordem_producao_produtos WHERE OrdemProducao = '+QuotedStr(edtTipo.Text));
    tabTipoProdutos.Open;
  end;

  vArquivo:=TStringList.Create;
  try
    vArquivo.Clear;
    vArquivo.Add('I8,A,001');
    vArquivo.Add('Q759,024'); // altura "dots"
    vArquivo.Add('q831');     // largura "dots"
    vArquivo.Add('rN');
    vArquivo.Add('S4');
    vArquivo.Add('D7');
    vArquivo.Add('ZT');
    vArquivo.Add('JF');
    vArquivo.Add('OD');
    vArquivo.Add('R267,0');
    vArquivo.Add('f100');

    tabAuxEtiquetas.EmptyDataSet;

    if btnTipo.Caption = 'Avulsa' then
    begin

      tabTipoProdutos.First;
      while not tabTipoProdutos.Eof do
      begin

        vQtd:=Floor(tabTipoProdutos.FieldByName('Quantidade').AsFloat/vQtdPEti);

        vResto:=tabTipoProdutos.FieldByName('Quantidade').AsInteger mod vQtdPEti;
        if vResto > 0 then
        begin
          vQtd:=vQtd + 1;
        end;

        vQuantidadeTotal:=tabTipoProdutos.FieldByName('Quantidade').AsFloat;

        for vCnt:=1 to vQtd do
        begin

          tabAuxEtiquetas.Append;

          //   100                750
          if vQuantidadeTotal <= vQtdPEti then
          begin
            // (.quantidade total.)
            tabAuxEtiquetasQtdItens.Value:=FloatToStr(vQuantidadeTotal);
            vQuantidadeTotal:=0;
           end
          else
          begin
            // restos
            vQuantidadeTotal:=vQuantidadeTotal - vQtdPEti;
            tabAuxEtiquetasQtdItens.Value:=IntToStr(vQtdPEti);
          end;

          tabAuxEtiquetasCodigoProduto.Value:=tabTipoProdutos.FieldByName('CodigoProduto').AsString;

          try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT unidades.Descricao ');
            tabChecagens.SQL.Add('FROM produtos ');
            tabChecagens.SQL.Add('LEFT JOIN unidades ON produtos.CodigoUnidade = unidades.Codigo ');
            tabChecagens.SQL.Add('WHERE produtos.CodigoProduto = '+QuotedStr(tabTipoProdutos.FieldByName('CodigoProduto').AsString));
            tabChecagens.Open;
            if tabChecagens.RecordCount = 1 then
            begin
              tabAuxEtiquetasUnidade.Value:=tabChecagens.FieldByName('Descricao').AsString;
            end;
          finally
            tabChecagens.Close; 
          end;

          tabAuxEtiquetasDescricao.Value:=RemoverAcentos(tabTipoProdutos.FieldByName('Descricao').AsString);
          tabAuxEtiquetasReferencia.Value:=tabReferencias.FieldByName('ReferenciaCliente').AsString;
          tabAuxEtiquetasCodigoCliente.Value:=tabTipo.FieldByName('CodigoCliente').AsFloat;
          tabAuxEtiquetasNomeCliente.Value:=tabClientes.FieldByName('NomeFantasia').AsString;
          tabAuxEtiquetasOrdemCompra.Value:=tabTipo.FieldByName('OrdemCompra').AsString;
          if FTipo = '1' then
          begin
            tabAuxEtiquetasTipo.Value:=tabTipo.FieldByName('NPedido').AsString;
            //tabAuxEtiquetasLote.Value:=tabTipo.FieldByName('Lote').AsString;
           end
          else if FTipo = '2' then
          begin
            tabAuxEtiquetasTipo.Value:=tabTipo.FieldByName('OrdemProducao').AsString;
          end;
          tabAuxEtiquetasCodigoBarras.Value:='';

          tabAuxEtiquetas.Post;
        end;

        tabTipoProdutos.Next;
      end;
     end
    else
    begin
      for vCnt:=1 to StrToInt(edtAvQtdEtiquetas.Text) do
      begin
        tabAuxEtiquetas.Append;
        tabAuxEtiquetasCodigoProduto.Value:=edtAvCodigoProduto.Text;
        tabAuxEtiquetasDescricao.Value:=Copy(edtAvDescricaoProduto.Text, 1, 40);
        tabAuxEtiquetasReferencia.Value:=edtAvReferencia.Text;
        tabAuxEtiquetasCodigoCliente.Value:=StrToFloat(edtAvCodigoCliente.Text);
        tabAuxEtiquetasNomeCliente.Value:=edtAvCliente.Text;
        tabAuxEtiquetasTipo.Value:=edtAvTipo.Text;
        tabAuxEtiquetasOrdemCompra.Value:=edtAvOc.Text;
        tabAuxEtiquetasLote.Value:=edtAvLote.Text;
        tabAuxEtiquetasQtdItens.Value:=edtAvQtdItens.Text;
        if Trim(edtAvUnidade.Text) <> '' then
        begin
          tabAuxEtiquetasUnidade.Value:=edtAvUnidade.Text;
        end;
        tabAuxEtiquetas.Post;
      end;
    end;

    tabAuxEtiquetas.First;
    while not tabAuxEtiquetas.Eof do
    begin
      
      vArquivo.Add('N');        // limpa buffer

      if ckbCodigoBarras.Checked then
      begin
        if Trim(tabAuxEtiquetasCodigoBarras.Value) <> '' then
        begin
          //vArquivo.Add('GW38,105,8,402,'); // código de barras (incompleto). só imprime em modo gráfico.
          vCodigoBarras:='ABCDEF12345';
          vArquivo.Add('B93,85,1,1A,3,9,55,N,"'+tabAuxEtiquetasCodigoBarras.Value+'"');
        end;
      end;

      vArquivo.Add('A259,28,1,1,1,1,N,"Codigo Produto"');
      vArquivo.Add('A238,29,1,1,2,1,N,"'+tabAuxEtiquetasCodigoProduto.Value+'"');
      vArquivo.Add('A259,198,1,1,1,1,N,"Descricao"');
      vArquivo.Add('A238,196,1,1,2,1,N,"'+Copy(tabAuxEtiquetasDescricao.Value, 1, 40)+'"');

      if ckbReferencia.Checked then
      begin
        if Trim(tabAuxEtiquetasReferencia.Value) <> '' then
        begin
          vArquivo.Add('A259,618,1,1,1,1,N,"Referencia"');
          vArquivo.Add('A238,618,1,1,2,1,N,"'+tabAuxEtiquetasReferencia.Value+'"');
        end;
      end;

      if ckbCliente.Checked then
      begin
        vArquivo.Add('A206,30,1,1,1,1,N,"Cliente"');
        vArquivo.Add('A183,30,1,1,2,1,N,"'+FloatToStr(tabAuxEtiquetasCodigoCliente.Value)+'"');
        vArquivo.Add('A182,98,1,1,2,1,N,"'+tabAuxEtiquetasNomeCliente.Value+'"');
      end;

      if ckbTipo.Checked then
      begin
        if Trim(tabAuxEtiquetasTipo.Value) <> '' then
        begin
          vArquivo.Add('A147,30,1,1,1,1,N,"Pedido"');
          vArquivo.Add('A126,30,1,1,2,1,N,"'+tabAuxEtiquetasTipo.Value+'"');
        end;
      end;

      if FTipo = '1' then
      begin
        if ckbOrdemCompra.Checked then
        begin
          if Trim(tabAuxEtiquetasOrdemCompra.Value) <> '' then
          begin
            vArquivo.Add('A147,157,1,1,1,1,N,"Ordem de Compra"');
            vArquivo.Add('A126,157,1,1,2,1,N,"'+tabAuxEtiquetasOrdemCompra.Value+'"');
          end;
        end;
      end;

      if ckbQtdItens.Checked then
      begin
        if (Trim(tabAuxEtiquetasUnidade.Value) <> '') and (Trim(tabAuxEtiquetasQtdItens.Value) <> '') then
        begin
          vArquivo.Add('A147,508,1,1,1,1,N,"Qtd:'+RemoverAcentos(tabAuxEtiquetasUnidade.Value)+'"'); // mudar esse valor para tabela de Unidades.
          vArquivo.Add('A126,508,1,1,2,1,N,"'+tabAuxEtiquetasQtdItens.Value+'"');
        end;
      end;

      if ckbLote.Checked then
      begin
        if Trim(tabAuxEtiquetasLote.Value) <> '' then
        begin
          vArquivo.Add('A147,618,1,1,1,1,N,"Lote"');
          vArquivo.Add('A126,618,1,1,2,1,N,"'+tabAuxEtiquetasLote.Value+'"');
        end;
      end;

      vArquivo.Add('P1'); // qtd de cópias; 

      tabAuxEtiquetas.Next;
    end;

    AssignFile(vTextFile, edtImpressora.Text);
    ReWrite(vTextFile);

    for vCnt:=0 to vArquivo.Count-1 do
    begin
      Writeln(vTextFile, vArquivo.Strings[vCnt]);
    end;

    CloseFile(vTextFile);

    ShowMessage('Etiquetas Impressas com Sucesso.');
  finally
    vArquivo.Free;
  end;

  //end;
end;

procedure TfmEtiquetasProdutos_TLP2844.FormCreate(Sender: TObject);
begin
  inherited;
  SetFormStyle(fsMDIChild);
end;

procedure TfmEtiquetasProdutos_TLP2844.FormShow(Sender: TObject);
begin
  inherited;

  CarregarImpressoras(edtImpressora);
  edtImpressora.Items.Add('LPT1');

  grbItens.Top:=58;
  grbItens.Left:=8;
  grbItens.Visible:=True;

  grbAvulsa.Top:=58;
  grbAvulsa.Left:=8;
  grbAvulsa.Visible:=False;

  tabAuxEtiquetas.CreateDataSet; 
  tabAuxEtiquetas.EmptyDataSet;

  if Trim(fmMenu.pubTrans1) <> '' then
  begin
    edtTipo.Text:=fmMenu.pubTrans1;
    FTipo:=fmMenu.pubTrans2;
  end;

  if FTipo = '1' then
  begin
    lblTipo.Caption:='Nº Pedido';
    ckbTipo.Caption:='Pedido';
    ckbOrdemCompra.Enabled:=True;
    ckbOrdemCompra.Checked:=True;
    lblAvTipo.Caption:='Ped.:';
   end
  else if FTipo = '2' then
  begin
    lblTipo.Caption:='Nº O.P.';
    ckbTipo.Caption:='Ordem de Produção';
    ckbOrdemCompra.Enabled:=False;
    ckbOrdemCompra.Checked:=False;
    lblAvTipo.Caption:='O.P.:';
  end;

  tabClientes.Params.CreateParam(ftFloat, 'CodigoCliente', ptUnknown);
  tabClientes.SQL.Add('SELECT * FROM clientes WHERE CodigoCliente = :CodigoCliente');
  tabClientes.Open;

  tabReferencias.Params.CreateParam(ftFloat, 'CodigoCliente', ptUnknown);
  tabReferencias.Params.CreateParam(ftString, 'CodigoProduto', ptUnknown);
  tabReferencias.SQL.Add('SELECT * FROM clientes_referencia_produtos WHERE');
  tabReferencias.SQL.Add('CodigoCliente = :CodigoCliente AND CodigoProduto = :CodigoProduto');
  tabReferencias.Open;

  tabUnidades.SQL.Add('SELECT * FROM unidades ORDER BY Descricao');
  tabUnidades.Open;
end;

procedure TfmEtiquetasProdutos_TLP2844.btnFecharClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmEtiquetasProdutos_TLP2844.dtsTipoDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  tabClientes.Close;
  tabClientes.ParamByName('CodigoCliente').AsFloat:=tabTipo.FieldByName('CodigoCliente').AsFloat;
  tabClientes.Open;
end;

procedure TfmEtiquetasProdutos_TLP2844.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tabTipo.CLose;
  tabTipoProdutos.Close;
  tabClientes.Close;
  tabReferencias.Close;
  tabAuxEtiquetas.Close;
  tabUnidades.Close;
  inherited;
end;

procedure TfmEtiquetasProdutos_TLP2844.dtsTipoProdutosDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  tabReferencias.Close;
  tabReferencias.ParamByName('CodigoCliente').AsFloat:=tabTipo.FieldByName('CodigoCliente').AsFloat;
  tabReferencias.ParamByName('CodigoProduto').AsString:=tabTipoProdutos.FieldByName('CodigoProduto').AsString;
  tabReferencias.Open;
end;

procedure TfmEtiquetasProdutos_TLP2844.btnTipoClick(Sender: TObject);
begin
  inherited;
  if btnTipo.Caption = 'Avulsa' then
  begin
    btnTipo.Caption:='Normal';
    grbItens.Visible:=False;
    grbAvulsa.Visible:=True;
    // ---------------------
    ckbReferencia.Checked:=True;
    ckbCliente.Checked:=True;
    ckbTipo.Checked:=True;
    ckbOrdemCompra.Checked:=True;
    ckbLote.Checked:=True;
    ckbCodigoBarras.Checked:=True;
    ckbQtdItens.Checked:=True;
   end
  else if btnTipo.Caption = 'Normal' then
  begin
    btnTipo.Caption:='Avulsa'; 
    grbItens.Visible:=True;
    grbAvulsa.Visible:=False;
  end;
end;

procedure TfmEtiquetasProdutos_TLP2844.btnLocalizarProdutosClick(
  Sender: TObject);
begin
  inherited;
  if not Assigned (fmLocalizarProdutos) then
  begin
    Application.CreateForm(TfmLocalizarProdutos, fmLocalizarProdutos);
    fmLocalizarProdutos.ShowModal;
  end;
  if Trim(fmMenu.pubTrans1) <> '' then
  begin
    edtAvCodigoProduto.Text:=fmMenu.pubTrans1;
  end;
end;

procedure TfmEtiquetasProdutos_TLP2844.btnLocalizarClientesClick(
  Sender: TObject);
begin
  inherited;
  if not Assigned (fmLocalizarClientes) then
  begin
    Application.CreateForm(TfmLocalizarClientes, fmLocalizarClientes);
    fmLocalizarClientes.ShowModal;
  end;
  if Trim(fmMenu.pubTrans1) <> '' then
  begin
    try
      edtAvCodigoCliente.Text:=fmMenu.pubTrans1;

      tabChecagens.Close;
      tabChecagens.SQL.Clear; 
      tabChecagens.SQL.Add('SELECT NomeFantasia FROM clientes WHERE CodigoCliente = '+QuotedStr(fmMenu.pubTrans1));
      tabChecagens.Open;

      edtAvCliente.Text:=tabChecagens.FieldByName('NomeFantasia').AsString;
    finally
      tabChecagens.Close;
    end;
  end;
end;

procedure TfmEtiquetasProdutos_TLP2844.edtAvCodigoProdutoChange(
  Sender: TObject);
begin
  inherited;
  if Trim(edtAvCodigoProduto.Text) <> '' then
  begin
    tabChecagens.Close;
    tabChecagens.SQL.Clear;
    tabChecagens.SQL.Add('SELECT NomeTecnico FROM produtos WHERE CodigoProduto = '+QuotedStr(edtAvCodigoProduto.Text));
    tabChecagens.Open;
    if tabChecagens.RecordCount = 1 then
    begin
      edtAvDescricaoProduto.Text:=tabChecagens.FieldByName('NomeTecnico').AsString;
      try
        tabChecagens.Close;
        tabChecagens.SQL.Clear;
        tabChecagens.SQL.Add('SELECT * FROM clientes_referencia_produtos ');
        tabChecagens.SQL.Add('WHERE CodigoCliente = '+QuotedStr(edtAvCodigoCliente.Text)+' AND CodigoProduto = '+QuotedStr(edtAvCodigoProduto.Text));
        tabChecagens.Open;
        if tabChecagens.RecordCount = 1 then
        begin
          edtAvReferencia.Text:=tabChecagens.FieldByName('ReferenciaCliente').AsString;
         end
        else
        begin
          edtAvReferencia.Text:='';
        end;
      finally
        tabChecagens.Close;
      end;
     end
    else
    begin
      edtAvDescricaoProduto.Text:='';
      edtAvReferencia.Text:='';
    end;
  end;
end;

procedure TfmEtiquetasProdutos_TLP2844.edtAvQtdEtiquetasExit(
  Sender: TObject);
begin
  inherited;
  if Trim(edtAvQtdEtiquetas.Text) = '' then
  begin
    ShowMessage('Obrigatório Preenchimento da Quantidade de Etiquetas');
    edtAvQtdEtiquetas.SetFocus;
    exit;
  end;
  if StrToInt(edtAvQtdEtiquetas.Text) <= 0 then
  begin
    Exception.Create('Preenchimento Incorreto da Quantidade de Etiquetas');
    edtAvQtdEtiquetas.SetFocus;
    exit;
  end;
end;

procedure TfmEtiquetasProdutos_TLP2844.edtAvCodigoClienteChange(
  Sender: TObject);
begin
  inherited;
  if Trim(edtAvCodigoCliente.Text) <> '' then
  begin
    try
      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT NomeFantasia FROM clientes WHERE CodigoCliente = '+QuotedStr(edtAvCodigoCliente.Text));
      tabChecagens.Open;
      if tabChecagens.RecordCount = 1 then
      begin
        edtAvCliente.Text:=tabChecagens.FieldByName('NomeFantasia').AsString;
       end
      else
      begin
        edtAvCliente.Text:='';
      end;
    finally
      tabChecagens.Close;
    end;
   end
  else
  begin
    edtAvCliente.Text:='';
  end;
end;

procedure TfmEtiquetasProdutos_TLP2844.Button1Click(Sender: TObject);
//var vArquivo: TStringList;
//    vCnt : Integer;
//    vTextFile: TextFile;
begin
  inherited;
  { * teste com etiquetas fornecidas pela destake 
  vArquivo:=TStringList.Create;
  try
    vArquivo.Add('I8,A,001');
    vArquivo.Add('Q308,024');
    vArquivo.Add('q831');
    vArquivo.Add('rN');
    vArquivo.Add('S4');
    vArquivo.Add('D7');
    vArquivo.Add('ZT');
    vArquivo.Add('JF');
    vArquivo.Add('OD');
    vArquivo.Add('R72,0');
    vArquivo.Add('f100');
    vArquivo.Add('N');
    vArquivo.Add('A554,43,0,1,1,1,N,"Referencia"');
    vArquivo.Add('A191,43,0,1,1,1,N,"Descricao"');
    vArquivo.Add('A32,123,0,1,1,2,N,"4521 - CLIENTE DE TESTE DE IMPRESSAO"');
    vArquivo.Add('A554,162,0,1,1,1,N,"Lote"');
    vArquivo.Add('A32,162,0,1,1,1,N,"Ordem Compra"');
    vArquivo.Add('A554,101,0,1,1,1,N,"Pedido"');
    vArquivo.Add('A191,64,0,1,1,2,N,"MANDIBULA EDENTULA"');
    vArquivo.Add('A32,101,0,1,1,1,N,"Cliente"');
    vArquivo.Add('A32,184,0,1,1,2,N,"2363, 2123, 125487, 012032, 124523"');
    vArquivo.Add('A554,184,0,1,1,2,N,"002"');
    vArquivo.Add('A554,64,0,1,1,2,N,"4010FC"');
    vArquivo.Add('A554,123,0,1,1,2,N,"12125"');
    vArquivo.Add('A32,43,0,1,1,1,N,"Codigo Produto"');
    vArquivo.Add('A32,64,0,1,1,2,N,"4010"');
    vArquivo.Add('P10');

    AssignFile(vTextFile, edtImpressora.Text);
    ReWrite(vTextFile);

    for vCnt:=0 to vArquivo.Count-1 do
    begin
      Writeln(vTextFile, vArquivo.Strings[vCnt]);
    end;

    CloseFile(vTextFile);
  finally
    vArquivo.Free;

    ShowMessage('Impresso com Sucesso!');
  end;
  }
end;

end.

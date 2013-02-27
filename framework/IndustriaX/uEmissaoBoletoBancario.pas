unit uEmissaoBoletoBancario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, Menus, StdCtrls, Buttons, gbCobranca, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Grids, DBGrids, Mask,
  ToolEdit, CurrEdit, ExtCtrls, DBClient, DBCtrls;

type
  TfmEmissaoBoletoBancario = class(TfmFormBaseAvancado)
    Label1: TLabel;
    edtContaCodigo: TEdit;
    edtContaDescricao: TEdit;
    Label2: TLabel;
    btnContaLocalizar: TBitBtn;
    btnVisualizar: TBitBtn;
    tabClientes: TZQuery;
    dtsClientes: TDataSource;
    tabContasBancarias: TZQuery;
    dtsContasBancarias: TDataSource;
    dbgTitulos: TDBGrid;
    Label3: TLabel;
    btnImprimir: TBitBtn;
    tabChecagens: TZQuery;
    tabConfigPropri: TZQuery;
    btnFechar: TBitBtn;
    btnSelecionarTodos: TBitBtn;
    rdgEnderecoCliente: TRadioGroup;
    tabAuxTitulos: TClientDataSet;
    dtsAuxTitulos: TDataSource;
    tabAuxTitulosDocumento: TFloatField;
    tabAuxTitulosCodigoConta: TFloatField;
    tabAuxTitulosVencimento: TDateField;
    tabAuxTitulosValorTotal: TCurrencyField;
    tabAuxTitulosImpresso: TStringField;
    tabAuxTitulosRemessa: TStringField;
    tabAuxTitulosNossoNumero: TStringField;
    tabAuxTitulosSelecionar: TBooleanField;
    edtLocalizacao: TDBLookupComboBox;
    Label4: TLabel;
    tabAuxTitulosNotaFiscal: TStringField;
    tabAuxTitulosParcela: TIntegerField;
    tabAuxTitulosTitulo: TFloatField;
    tabTitulos: TZQuery;
    tabLocalizacao: TZQuery;
    dtsLocalizacao: TDataSource;
    edtDataEmissao: TDateEdit;
    Label5: TLabel;
    tabAuxTitulosInstrucoes: TMemoField;
    rdgOpcoesEmail: TRadioGroup;
    btnEmail: TBitBtn;
    GroupBox1: TGroupBox;
    chkPagamentoRealizado: TCheckBox;
    chkApenasBoletosJaImpressos: TCheckBox;
    chkExibirNaoVencida: TCheckBox;
    procedure btnContaLocalizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtContaCodigoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure edtLocalizacaoExit(Sender: TObject);
    procedure dbgTitulosCellClick(Column: TColumn);
    procedure btnSelecionarTodosClick(Sender: TObject);
    procedure edtDataEmissaoExit(Sender: TObject);
    procedure rdgOpcoesEmailClick(Sender: TObject);
    procedure chkPagamentoRealizadoClick(Sender: TObject);
    procedure chkApenasBoletosJaImpressosClick(Sender: TObject);
    procedure chkExibirNaoVencidaClick(Sender: TObject);
  private
    procedure PrepararBoleto;
    function GerarNossoNumero: string;
    procedure CarregaTitulos;
    procedure DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  public
    { Public declarations }
  end;

var
  fmEmissaoBoletoBancario: TfmEmissaoBoletoBancario;
  vImprimir: boolean;

implementation

uses uLocalizarGenerico, uMenu, uTipos, uFormBase, uFuncoes, uConstantes,
  uEnderecos;

{$R *.dfm}

procedure TfmEmissaoBoletoBancario.PrepararBoleto;
var
  gbTitulo: TgbTitulo;
  vJurosDia: real;
  vPathBoleto: string;
  vErros: string;
begin
  if Trim(edtContaCodigo.Text) = '' then
  begin
    ShowMessage('Obrigatório Preenchimento da Conta Bancária');
    edtContaCodigo.SetFocus;
    exit;
  end;

  if tabAuxTitulos.RecordCount = 0 then
  begin
    ShowMessage('Não existem Títulos para a Emissão do Boleto');
    exit;
  end;

  tabContasBancarias.Close;
  tabContasBancarias.SQL.Clear;
  tabContasBancarias.SQL.Add('SELECT * FROM contas_bancarias WHERE ID = ' + edtContaCodigo.Text);
  tabContasBancarias.Open;

  tabAuxTitulos.First;
  while not tabAuxTitulos.Eof do
  begin

    if tabAuxTitulosSelecionar.Value = True then
    begin

      tabClientes.Close;
      tabClientes.SQL.Clear;
      tabClientes.SQL.Add('SELECT * FROM clientes WHERE CodigoCliente = ' + FloatToStr(tabAuxTitulosCodigoConta.Value));
      tabClientes.Open;

      tabTitulos.Close;
      tabTitulos.SQL.Clear;
      tabTitulos.SQL.Add('SELECT * FROM titulos_receber WHERE Titulo = ' + QuotedStr(FloatToStr(tabAuxTitulosTitulo.Value)));
      tabTitulos.Open;

      // Gera Nosso Numero
      if Trim(tabAuxTitulosNossoNumero.Value) = '' then
      begin
        tabTitulos.Edit;
        tabTitulos.FieldByName('NossoNumero').AsString := GerarNossoNumero;
        tabTitulos.Post;
        tabTitulos.ApplyUpdates;

        tabAuxTitulos.Edit;
        tabAuxTitulosNossoNumero.Value := tabTitulos.FieldByName('NossoNumero').AsString;
        tabAuxTitulos.Post;
      end;

      if Trim(tabAuxTitulosNossoNumero.Value) <> '' then
      begin

        gbTitulo := TgbTitulo.Create(nil);
        try
          gbTitulo.Cedente.Nome := tabConfigPropri.FieldByName('RazaoSocial').AsString;
          gbTitulo.Cedente.ContaBancaria.Banco.Codigo := tabContasBancarias.FieldByName('CodigoBanco').AsString;
          gbTitulo.Cedente.ContaBancaria.CodigoAgencia := tabContasBancarias.FieldByName('CodigoAgencia').AsString;
          gbTitulo.Cedente.ContaBancaria.DigitoAgencia := tabContasBancarias.FieldByName('DigitoAgencia').AsString;
          gbTitulo.Cedente.ContaBancaria.NumeroConta := tabContasBancarias.FieldByName('NumeroConta').AsString;
          gbTitulo.Cedente.ContaBancaria.DigitoConta := tabContasBancarias.FieldByName('DigitoConta').AsString;
          gbTitulo.Cedente.CodigoCedente := tabContasBancarias.FieldByName('NumeroConta').AsString;
          gbTitulo.Cedente.DigitoCodigoCedente := tabContasBancarias.FieldByName('DigitoConta').AsString;
          gbTitulo.Cedente.TipoInscricao := tiPessoaJuridica;
          gbTitulo.Cedente.NumeroCPFCGC := tabConfigPropri.FieldByName('Cnpj').AsString;
          gbTitulo.Cedente.Endereco.Rua := tabConfigPropri.FieldByName('Endereco').AsString + ', ' + tabConfigPropri.FieldByName('Numero').AsString;
          gbTitulo.Cedente.Endereco.CEP := Desformatar(tabConfigPropri.FieldByName('Cep').AsString);
          gbTitulo.Cedente.Endereco.Estado := tabConfigPropri.FieldByName('Estado').AsString;
          gbTitulo.Cedente.Endereco.EMail := tabConfigPropri.FieldByName('Email').AsString;
          gbTitulo.Cedente.Endereco.Cidade := LocateCidade(tabConfigPropri.FieldByName('CodigoCidade').AsString);
          gbTitulo.Carteira := tabContasBancarias.FieldByName('Carteira').AsString;
          gbTitulo.DataDocumento := tabTitulos.FieldByName('DataEmissao').AsDateTime; // troquei por "Date"
          gbTitulo.DataVencimento := tabAuxTitulosVencimento.Value;

          try
            // Verifica se apenas um boleto por Nota.
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT * FROM titulos_receber ');
            tabChecagens.SQL.Add('WHERE Documento = ' + QuotedStr(FloatToStr(tabAuxTitulosDocumento.Value)));
            tabChecagens.SQL.Add('AND NotaFiscal = ' + QuotedStr(tabAuxTitulosNotaFiscal.Value));
            tabChecagens.SQL.Add('AND PedidoVenda = 1');
            tabChecagens.Open;

            if tabChecagens.RecordCount = 1 then
            begin
              gbTitulo.NumeroDocumento := tabAuxTitulosNotaFiscal.Value;
            end
            else
            begin
              gbTitulo.NumeroDocumento := tabAuxTitulosNotaFiscal.Value + '-' + IntToStr(tabAuxTitulosParcela.Value);
            end;
          finally
            tabChecagens.Close;
          end;

          gbTitulo.Convenio := tabContasBancarias.FieldByName('Convenio').AsString;
          gbTitulo.Sacado.Nome := tabClientes.FieldByName('RazaoSocial').AsString;

          case rdgEnderecoCliente.ItemIndex of
            0:
              begin
                gbTitulo.Sacado.Endereco.Rua := tabClientes.FieldByName('Endereco').AsString;
                gbTitulo.Sacado.Endereco.Numero := tabClientes.FieldByName('Numero').AsString;
                gbTitulo.Sacado.Endereco.Bairro := tabClientes.FieldByName('Bairro').AsString;
                gbTitulo.Sacado.Endereco.CEP := Desformatar(tabClientes.FieldByName('Cep').AsString);
                gbTitulo.Sacado.Endereco.Cidade := LocateCidade(tabClientes.FieldByName('CodigoCidade').AsString);
                gbTitulo.Sacado.Endereco.Estado := tabClientes.FieldByName('Estado').AsString;
              end;
            1:
              begin
                gbTitulo.Sacado.Endereco.Rua := tabClientes.FieldByName('EntregaEndereco').AsString;
                gbTitulo.Sacado.Endereco.Numero := tabClientes.FieldByName('EntregaNumero').AsString;
                gbTitulo.Sacado.Endereco.Bairro := tabClientes.FieldByName('EntregaBairro').AsString;
                gbTitulo.Sacado.Endereco.CEP := Desformatar(tabClientes.FieldByName('EntregaCep').AsString);
                gbTitulo.Sacado.Endereco.Cidade := LocateCidade(tabClientes.FieldByName('EntregaCodigoCidade').AsString);
                gbTitulo.Sacado.Endereco.Estado := tabClientes.FieldByName('EntregaEstado').AsString;
              end;
            2:
              begin
                gbTitulo.Sacado.Endereco.Rua := tabClientes.FieldByName('CobrancaEndereco').AsString;
                gbTitulo.Sacado.Endereco.Numero := tabClientes.FieldByName('CobrancaNumero').AsString;
                gbTitulo.Sacado.Endereco.Bairro := tabClientes.FieldByName('CobrancaBairro').AsString;
                gbTitulo.Sacado.Endereco.CEP := Desformatar(tabClientes.FieldByName('CobrancaCep').AsString);
                gbTitulo.Sacado.Endereco.Cidade := LocateCidade(tabClientes.FieldByName('CobrancaCodigoCidade').AsString);
                gbTitulo.Sacado.Endereco.Estado := tabClientes.FieldByName('CobrancaEstado').AsString;
              end;
          end;

          if tabClientes.FieldByName('TipoCliente').AsString = '1' then
          begin
            gbTitulo.Sacado.TipoInscricao := tiPessoaJuridica;
          end
          else
          begin
            gbTitulo.Sacado.TipoInscricao := tiPessoaFisica;
          end;
          gbTitulo.Sacado.NumeroCPFCGC := Desformatar(tabClientes.FieldByName('CpfCnpj').AsString);
          gbTitulo.ValorDocumento := tabAuxTitulosValorTotal.Value;

          vJurosDia := (tabAuxTitulosValorTotal.Value * 1) / 100;
          vJurosDia := vJurosDia / 30;
          vJurosDia := RoundReal(vJurosDia, 2);

          gbTitulo.Instrucoes.Clear;

          if Trim(tabAuxTitulosInstrucoes.Text) <> '' then
          begin
            gbTitulo.Instrucoes.Add(tabAuxTitulosInstrucoes.Value);
            gbTitulo.Instrucoes.Add('');
          end;

          gbTitulo.Instrucoes.Add('Juros.....: 1,00% ao mês - (' + FormatFloat(sis_curr_format, vJurosDia) + ' ao dia)');
          gbTitulo.Instrucoes.Add('Multa.....: 2,00% após 1 dia corrido do vencimento');
          gbTitulo.Instrucoes.Add('PROTESTO AUTOMATICO 15 DIAS CORRIDOS APOS VENCIMENTO');
          gbTitulo.Instrucoes.Add('APOS VENCIMENTO RETIRE BOLETO ATUALIZADO ATRAVES DO SITE');
          gbTitulo.Instrucoes.Add('WWW.BB.COM.BR');
          gbTitulo.Instrucoes.Add('PAGAMENTO SOMENTE NO BOLETO, DEPOSITOS EM CONTA NAO SERAO CONSIDERADOS');

          gbTitulo.NossoNumero := tabAuxTitulosNossoNumero.Value;
          gbTitulo.SeuNumero := tabAuxTitulosNossoNumero.Value;

          if vImprimir = True then
          begin
            // pndPrinter.Execute!
            gbTitulo.Imprimir;

            // Impressão e Envio por Email
            if rdgOpcoesEmail.ItemIndex = 2 then
            begin

              vPathBoleto := GetPathTempWindow + 'boleto_' + FormatDateTime('hhnnss', Now) + '.pdf';
              gbTitulo.GerarPDF(vPathBoleto);

              vErros := vErros + EnviarEmail(tabConfigPropri.FieldByName('SmtpHost').AsString,
                tabConfigPropri.FieldByName('SmtpUsername').AsString,
                tabConfigPropri.FieldByName('SmtpPassword').AsString,
                tabConfigPropri.FieldByName('RazaoSocial').AsString,
                'renan.nacional@hotmail.com', {email retorno}
                'renan.nacional@hotmail.com', {email destino}
                'Boleto de Cobrança Data: ' + FormatDateTime('dd/MM/yyyy', Date) + ' Hora: ' + FormatDateTime('hh:nn:ss', Now),
                'Mensagem',
                vPathBoleto,
                '',
                '',
                tabConfigPropri.FieldByName('SmtpPorta').AsInteger,
                False);

              if Trim(vErros) <> '' then
              begin
                vErros := vErros + Chr(13);
              end;
            end;

            tabTitulos.Edit;
            tabTitulos.FieldByName('ImpressoBoleto').AsString := 'Sim';
            tabTitulos.FieldByName('DataBoleto').AsDateTime := Date;
            tabTitulos.FieldByName('CodigoContaBancaria').AsFloat := StrToFloat(edtContaCodigo.Text);
            tabTitulos.Post;
            tabTitulos.ApplyUpdates;
          end
          else
          begin
            gbTitulo.Visualizar;
          end;

          vImprimir := True;

        finally
          gbTitulo.Free;
        end;
      end;
    end;

    tabAuxTitulos.Next;
  end;

  CarregaTitulos;

  if Trim(vErros) <> '' then
  begin
    ShowMessage(vErros);
  end;
end;

procedure TfmEmissaoBoletoBancario.btnContaLocalizarClick(
  Sender: TObject);
var
  vParamLoc: TParametrosLocalizar;
begin
  inherited;
  vParamLoc.Table := 'contas_bancarias';
  vParamLoc.KeyField := 'ID';
  vParamLoc.Field1 := 'Descricao';
  vParamLoc.Filter := '';
  if not Assigned(fmLocalizarGenerico) then
  begin
    Application.CreateForm(TfmLocalizarGenerico, fmLocalizarGenerico);
    fmLocalizarGenerico.LoadParams(vParamLoc);
    fmLocalizarGenerico.ShowModal;
  end;
  if Trim(fmMenu.pubTrans1) <> '' then
  begin
    edtContaCodigo.Text := fmMenu.pubTrans1;
  end;
end;

procedure TfmEmissaoBoletoBancario.FormCreate(Sender: TObject);
begin
  inherited;
  vImprimir := True;
  SetFormStyle(fsMDIChild);
end;

procedure TfmEmissaoBoletoBancario.edtContaCodigoChange(Sender: TObject);
begin
  inherited;
  if Trim(edtContaCodigo.Text) <> '' then
  begin
    try
      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT Descricao FROM contas_bancarias WHERE ID = ' + edtContaCodigo.Text);
      tabChecagens.Open;
      if tabChecagens.RecordCount > 0 then
      begin
        edtContaDescricao.Text := tabChecagens.FieldByName('Descricao').AsString;
      end
      else
      begin
        edtContaDescricao.Text := '';
      end;
    finally
      tabChecagens.Close;
    end;
  end
  else
  begin
    edtContaDescricao.Text := '';
  end;
end;

procedure TfmEmissaoBoletoBancario.FormShow(Sender: TObject);
begin
  inherited;

  vImprimir := True;

  edtDataEmissao.Date := Date;

  dbgTitulos.OnDrawColumnCell := DrawColumnCell;

  tabAuxTitulos.CreateDataSet;
  tabAuxTitulos.EmptyDataSet;
  tabAuxTitulos.IndexFieldNames := 'NotaFiscal';

  tabConfigPropri.SQL.Add('SELECT * FROM configuracoes_proprietario');
  tabConfigPropri.Open;

  try
    tabChecagens.Close;
    tabChecagens.SQL.Clear;
    tabChecagens.SQL.Add('SELECT * FROM contas_bancarias');
    tabChecagens.Open;
    if tabChecagens.RecordCount = 1 then
    begin
      edtContaCodigo.Text := tabChecagens.FieldByName('ID').AsString;
    end;
  finally
    tabChecagens.Close;
  end;

  tabLocalizacao.SQL.Add('SELECT * FROM genericos WHERE Tipo = ' + QuotedStr('7') + ' ORDER BY Descricao');
  tabLocalizacao.Open;

  if Trim(tabConfigPropri.FieldByName('LocalizacaoBB').AsString) <> '' then
  begin
    edtLocalizacao.KeyValue := tabConfigPropri.FieldByName('LocalizacaoBB').AsFloat;
  end;

  CarregaTitulos;
end;

procedure TfmEmissaoBoletoBancario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tabConfigPropri.Close;
  tabClientes.Close;
  tabContasBancarias.Close;
  tabChecagens.Close;
  tabAuxTitulos.Close;
  tabTitulos.Close;
  tabLocalizacao.Close;
  inherited;
end;

procedure TfmEmissaoBoletoBancario.btnFecharClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmEmissaoBoletoBancario.btnImprimirClick(Sender: TObject);
begin
  inherited;
  PrepararBoleto;
end;

procedure TfmEmissaoBoletoBancario.btnVisualizarClick(Sender: TObject);
begin
  inherited;
  vImprimir := False;
  btnImprimir.Click;
end;

function TfmEmissaoBoletoBancario.GerarNossoNumero: string;
var
  vNNFloat: real;
begin
  try
    tabChecagens.Close;
    tabChecagens.SQL.Clear;
    tabChecagens.SQL.Add('SELECT MAX(NossoNumero) AS vMaxNN FROM titulos_receber');
    tabChecagens.Open;
    if (not tabChecagens.FieldByName('vMaxNN').IsNull) and (Trim(tabChecagens.FieldByName('vMaxNN').AsString) <> '') then
    begin
      vNNFloat := StrToFloat(tabChecagens.FieldByName('vMaxNN').AsString);
      vNNFloat := vNNFloat + 1;
      Result := StrZero(vNNFloat, 10);
    end
    else
    begin
      vNNFloat := 1;
      Result := StrZero(vNNFloat, 10);
    end;
  finally
    tabChecagens.Close;
  end;
end;

procedure TfmEmissaoBoletoBancario.CarregaTitulos;
begin
  tabAuxTitulos.EmptyDataSet;

  tabTitulos.Close;
  tabTitulos.SQL.Clear;
  tabTitulos.SQL.Add('SELECT * ');
  tabTitulos.SQL.Add('FROM titulos_receber ');
  tabTitulos.SQL.Add('WHERE PedidoVenda = 1 '); // Gerado a partir de pedidos de venda

  if chkPagamentoRealizado.Checked then
  begin
    tabTitulos.SQL.Add('AND DataPagamento IS NOT NULL ');
  end
  else
  begin
    tabTitulos.SQL.Add('AND DataPagamento IS NULL ');
  end;

  tabTitulos.SQL.Add('AND NotaFiscal <> ' + QuotedStr(''));

  if chkExibirNaoVencida.Checked then
  begin
    tabTitulos.SQL.Add('AND DataVencimento < ' + QuotedStr(FormatDateTime(sis_date_format, Date)));
  end
  else
  begin
    tabTitulos.SQL.Add('AND DataVencimento >= ' + QuotedStr(FormatDateTime(sis_date_format, Date)));
  end;

  if chkApenasBoletosJaImpressos.Checked then
  begin
    tabTitulos.SQL.Add('AND ImpressoBoleto = ' + QuotedStr('Sim'));
  end
  else
  begin
    tabTitulos.SQL.Add('AND ImpressoBoleto = ' + QuotedStr('Não'));
  end;

  if Trim(edtLocalizacao.Text) <> '' then
  begin
    tabTitulos.SQL.Add('AND CodigoLocalizacao = ' + QuotedStr(string(edtLocalizacao.KeyValue)));
  end;

  if Trim(edtDataEmissao.Text) <> '/  /' then
  begin
    tabTitulos.SQL.Add('AND DataEmissao = ' + QuotedStr(FormatDateTime(sis_date_format, edtDataEmissao.Date)));
  end;

  tabTitulos.Open;

  tabTitulos.First;
  while not tabTitulos.Eof do
  begin

    tabAuxTitulos.Append;
    tabAuxTitulosDocumento.Value := tabTitulos.FieldByName('Documento').AsFloat;
    tabAuxTitulosNotaFiscal.Value := tabTitulos.FieldByName('NotaFiscal').AsString;
    tabAuxTitulosCodigoConta.Value := tabTitulos.FieldByName('CodigoConta').AsFloat;
    tabAuxTitulosVencimento.Value := tabTitulos.FieldByName('DataVencimento').AsDateTime;
    tabAuxTitulosValorTotal.Value := tabTitulos.FieldByName('ValorTotal').AsFloat;
    tabAuxTitulosImpresso.Value := tabTitulos.FieldByName('ImpressoBoleto').AsString;
    tabAuxTitulosRemessa.Value := tabTitulos.FieldByName('GeradoRemessa').AsString;
    tabAuxTitulosNossoNumero.Value := tabTitulos.FieldByName('NossoNumero').AsString;
    tabAuxTitulosParcela.Value := tabTitulos.FieldByName('Parcela').AsInteger;
    tabAuxTitulosTitulo.Value := tabTitulos.FieldByName('Titulo').AsFloat;
    tabAuxTitulosInstrucoes.Value := tabTitulos.FieldByName('Instrucoes').AsString;
    tabAuxTitulos.Post;

    tabTitulos.Next;
  end;

  tabTitulos.First;
end;

procedure TfmEmissaoBoletoBancario.edtLocalizacaoExit(Sender: TObject);
begin
  inherited;
  CarregaTitulos;
end;

procedure TfmEmissaoBoletoBancario.dbgTitulosCellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'Selecionar' then
  begin
    tabAuxTitulos.Edit;
    if tabAuxTitulosSelecionar.Value = True then
    begin
      tabAuxTitulosSelecionar.Value := False;
    end
    else
    begin
      tabAuxTitulosSelecionar.Value := True;
    end;
    tabAuxTitulos.Post;
  end;
end;

procedure TfmEmissaoBoletoBancario.DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  vCheck: Integer;
  R: TRect;
begin
  inherited;
  if dbgTitulos.DataSource <> nil then
  begin
    if Column.FieldName = 'Selecionar' then
    begin
      dbgTitulos.Canvas.FillRect(Rect);
      if tabAuxTitulosSelecionar.Value = True then
        vCheck := DFCS_CHECKED
      else
        vCheck := 0;
      R := Rect;
      InflateRect(R, -2, -2); {Diminue o tamanho do CheckBox}
      DrawFrameControl(dbgTitulos.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or vCheck);
    end;
  end;
end;

procedure TfmEmissaoBoletoBancario.btnSelecionarTodosClick(
  Sender: TObject);
begin
  inherited;
  tabAuxTitulos.First;
  while not tabAuxTitulos.Eof do
  begin
    tabAuxTitulos.Edit;
    tabAuxTitulosSelecionar.Value := True;
    tabAuxTitulos.Post;
    tabAuxTitulos.Next;
  end;
  tabAuxTitulos.First;
end;

procedure TfmEmissaoBoletoBancario.edtDataEmissaoExit(Sender: TObject);
begin
  inherited;
  CarregaTitulos;
end;

procedure TfmEmissaoBoletoBancario.rdgOpcoesEmailClick(Sender: TObject);
begin
  inherited;
  btnEmail.Enabled := True;
  btnImprimir.Enabled := True;
  case rdgOpcoesEmail.ItemIndex of
    0: btnEmail.Enabled := False;
    1:
      begin
        btnEmail.Enabled := True;
        btnImprimir.Enabled := False;
      end;
    2: btnEmail.Enabled := False;
  end;
end;

procedure TfmEmissaoBoletoBancario.chkPagamentoRealizadoClick(
  Sender: TObject);
begin
  inherited;

  CarregaTitulos;
end;

procedure TfmEmissaoBoletoBancario.chkApenasBoletosJaImpressosClick(
  Sender: TObject);
begin
  inherited;

  CarregaTitulos;
end;

procedure TfmEmissaoBoletoBancario.chkExibirNaoVencidaClick(
  Sender: TObject);
begin
  inherited;

  CarregaTitulos;
end;

end.


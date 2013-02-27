unit rPedidosReceber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls, ToolEdit, Gauges;

type
  TrtPedidosReceber = class(TfmFormBaseRelatorio)
    tabBase: TZQuery;
    pndDialogo: TPrintDialog;
    qrpPedidosReceber: TQuickRep;
    QRSubDetail1: TQRSubDetail;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    qrlSignature: TQRLabel;
    QRDBText3: TQRDBText;
    QRShape1: TQRShape;
    qrlTitulo: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape2: TQRShape;
    QRSysData2: TQRSysData;
    QRDBText7: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    qrlBairro: TQRLabel;
    qrdBairro: TQRDBText;
    qrlTotal: TQRLabel;
    dtsBase: TDataSource;
    Label14: TLabel;
    Label11: TLabel;
    edtCodigoCliente: TEdit;
    btnLocalizarClientes: TBitBtn;
    edtCliente: TEdit;
    edtCodigoFuncionario: TEdit;
    btnLocalizarResponsavel: TBitBtn;
    edtFuncionario: TEdit;
    QRLabel1: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    tabChecagens: TZQuery;
    Label1: TLabel;
    edtCodigoEmpresa: TEdit;
    btnLocalizarEmpresa: TBitBtn;
    edtNomeEmpresa: TEdit;
    tabAuxPedidos: TClientDataSet;
    tabAuxPedidosPedido: TFloatField;
    tabAuxPedidosCodigoCliente: TFloatField;
    tabAuxPedidosNomeCliente: TStringField;
    tabAuxPedidosEmissao: TDateField;
    tabAuxPedidosResponsavel: TStringField;
    tabAuxPedidosValorReceber: TCurrencyField;
    tabRecebidos: TZQuery;
    gagProgresso: TGauge;
    QRLabel4: TQRLabel;
    QRDBText6: TQRDBText;
    tabAuxPedidosParcela: TIntegerField;
    QRLabel6: TQRLabel;
    QRDBText8: TQRDBText;
    tabAuxPedidosNotaFiscal: TStringField;
    QRLabel7: TQRLabel;
    QRDBText9: TQRDBText;
    tabAuxPedidosDataVencto: TDateField;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    tabAuxPedidosObservacoes: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure edtCodigoClienteChange(Sender: TObject);
    procedure edtCodigoFuncionarioChange(Sender: TObject);
    procedure btnLocalizarClientesClick(Sender: TObject);
    procedure btnLocalizarResponsavelClick(Sender: TObject);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure btnLocalizarEmpresaClick(Sender: TObject);
    procedure edtCodigoEmpresaChange(Sender: TObject);
    procedure qrpPedidosReceberBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormShow(Sender: TObject);
    procedure dtsBaseDataChange(Sender: TObject; Field: TField);
  private
     procedure GerarImpressao(Impressora: Boolean = False);
  public
  end;

var
   vReceber: real;

implementation

uses uFormBase, uMenu, uFuncoes, uConstantes, uLocalizarClientes,
     uLocalizarFuncionarios, uTipos, uLocalizarGenerico;

{$R *.dfm}

procedure TrtPedidosReceber.FormCreate(Sender: TObject);
begin
  inherited;
  SetFormStyle(fsMDIChild);
end;

procedure TrtPedidosReceber.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tabBase.Close;
  tabAuxPedidos.Close;
  tabRecebidos.Close;
  inherited;
end;

procedure TrtPedidosReceber.btnVisualizarClick(Sender: TObject);
begin
  inherited;
  GerarImpressao();
end;

procedure TrtPedidosReceber.GerarImpressao(Impressora: Boolean = False);
var vWhere: string;
    vDesconto: real;
    vObservacao: string;
    vDepto: real;
    vTotalParcelas: Integer;
    vDescPedido: real;
begin
  tabAuxPedidos.EmptyDataSet;
  vWhere:='tr.PedidoVenda = 1 AND tr.DataPagamento IS NULL';
  qrlTitulo.Caption:='Pedidos Receber';

  tabBase.Close;
  tabBase.SQL.Clear;
  tabBase.SQL.Add('SELECT tr.*, pd.CodigoFuncionario AS CodFunc, pd.ValorProdutos, ');
  tabBase.SQL.Add('pd.Parcelas AS TotalParcelas, pd.ValorDesconto AS DescPedido ');
  tabBase.SQL.Add('FROM titulos_receber as tr');
  tabBase.SQL.Add('LEFT JOIN pedidos as pd ON pd.NPedido = tr.Documento'); 

  if Trim(edtCodigoCliente.Text) <> '' then
  begin
    qrlTitulo.Caption:=qrlTitulo.Caption + ' - Cliente: '+edtCliente.Text;
    if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
    vWhere:=vWhere + 'tr.CodigoConta = '+edtCodigoCliente.Text;
  end;
  if Trim(edtCodigoFuncionario.Text) <> '' then
  begin
    qrlTitulo.Caption:=qrlTitulo.Caption + ' - Responsável: '+edtFuncionario.Text;
  //  if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
  //  vWhere:=vWhere + 'pd.CodigoFuncionario = '+edtCodigoFuncionario.Text;
  end;
  if Trim(edtCodigoEmpresa.Text) <> '' then
  begin
    qrlTitulo.Caption:=qrlTitulo.Caption + ' - Empresa: '+edtNomeEmpresa.Text;
    if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
    vWhere:=vWhere + 'tr.CodigoEmpresa = '+edtCodigoEmpresa.Text;
  end;
   
  if Trim(vWhere) <> '' then
  begin
    tabBase.SQL.Add('WHERE');
    tabBase.SQL.Add(vWhere);
  end;

  tabBase.SQL.Add('ORDER BY tr.DataVencimento'); 
  tabBase.Open;

  vDepto:=0;

  if Trim(edtCodigoFuncionario.Text) <> '' then
  begin
    try
      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT CodigoDepto FROM funcionarios WHERE Codigo = '+QuotedStr(edtCodigoFuncionario.Text));
      tabChecagens.Open;

      if tabChecagens.RecordCount = 1 then
      begin
        vDepto:=tabChecagens.FieldByName('CodigoDepto').AsFloat;
      end;
    finally
      tabChecagens.Close;
    end;
  end;

  gagProgresso.MaxValue:=tabBase.RecordCount;

  tabBase.First;
  while not tabBase.Eof do 
  begin

    gagProgresso.Progress:=tabBase.RecNo;
    Application.ProcessMessages;

    if Trim(edtCodigoFuncionario.Text) <> '' then
    begin
      // * Checagens 1 - Mesmo Depto e Funcionário esta Ativo.
      try
        tabChecagens.Close;
        tabChecagens.SQL.Clear;
        tabChecagens.SQL.Add('SELECT CodigoDepto FROM funcionarios ');
        tabChecagens.SQL.Add('WHERE Codigo = '+QuotedStr(tabBase.FieldByName('CodFunc').AsString));
        tabChecagens.SQL.Add('AND CodigoDepto = '+QuotedStr(FloatToStr(vDepto)));
        tabChecagens.SQL.Add('AND DataSaida IS NULL');
        tabChecagens.Open;

        if tabChecagens.RecordCount <= 0 then begin
          tabBase.Next;
          Continue;
         end
        else
        begin
          tabChecagens.Close;
          tabChecagens.SQL.Clear;
          tabChecagens.SQL.Add('SELECT * FROM pedidos_part_func ');
          tabChecagens.SQL.Add('WHERE NPedido = '+QuotedStr(tabBase.FieldByName('Documento').AsString));
          tabChecagens.SQL.Add('AND CodigoFuncionario = '+QuotedStr(edtCodigoFuncionario.Text));
          tabChecagens.Open;

          if tabChecagens.RecordCount <= 0 then
          begin
            tabBase.Next;
            Continue;
          end;
        end;
      finally
        tabChecagens.Close;
      end;
    end;

    vDesconto:=0;
    vObservacao:='';

    // * Checagens 2 - Esta na Participação do pedido em questão.
    try
      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT * FROM pedidos_part_func ');
      tabChecagens.SQL.Add('WHERE NPedido = '+QuotedStr(tabBase.FieldByName('Documento').AsString));
      tabChecagens.SQL.Add('AND CodigoFuncionario = '+QuotedStr(tabBase.FieldByName('CodFunc').AsString));
      tabChecagens.Open;

      if tabChecagens.RecordCount > 0 then
      begin
        vDesconto:=tabChecagens.FieldByName('ValorDesconto').AsFloat;
        vObservacao:=tabChecagens.FieldByName('Observacao').AsString;
       end
      else
      begin
        tabBase.Next;
        Continue;
      end;
    finally
      tabChecagens.Close;
    end;

    tabAuxPedidos.Append;
    tabAuxPedidosPedido.Value:=tabBase.FieldByName('Documento').AsFloat;
    tabAuxPedidosCodigoCliente.Value:=tabBase.FieldByName('CodigoConta').AsFloat;

    try
      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT NomeFantasia FROM clientes WHERE CodigoCliente = '+QuotedStr(tabBase.FieldByName('CodigoConta').AsString));
      tabChecagens.Open;
      if tabChecagens.RecordCount = 1 then
      begin
        tabAuxPedidosNomeCliente.Value:=tabChecagens.FieldByName('NomeFantasia').AsString;
      end;
    finally
      tabChecagens.Close;
    end;

    if tabBase.FieldByName('Documento').AsFloat = 14698 then begin
      Sleep(10);
    end;

    tabAuxPedidosEmissao.Value:=tabBase.FieldByName('DataEmissao').AsDateTime;

    vTotalParcelas:=tabBase.FieldByName('TotalParcelas').AsInteger;

    if vTotalParcelas <= 0 then vTotalParcelas:=tabBase.FieldByName('Parcela').AsInteger;

    vDescPedido:=RoundReal(tabBase.FieldByName('DescPedido').AsFloat/vTotalParcelas, 2);

    if tabBase.FieldByName('Parcela').AsInteger = 1 then
    begin
      tabAuxPedidosValorReceber.Value:=RoundReal((( tabBase.FieldByName('ValorProdutos').AsFloat - tabRecebidos.FieldByName('VlrLiq').AsFloat -
      tabBase.FieldByName('ValorDesconto').AsFloat - vDesconto ) + tabBase.FieldByName('ValorAcrescimo').AsFloat) / vTotalParcelas, 2);

      tabAuxPedidosValorReceber.Value:=(tabAuxPedidosValorReceber.Value - vDescPedido);
     end
    else
    begin
      tabAuxPedidosValorReceber.Value:=RoundReal((( tabBase.FieldByName('ValorProdutos').AsFloat - tabRecebidos.FieldByName('VlrLiq').AsFloat -
      tabBase.FieldByName('ValorDesconto').AsFloat) + tabBase.FieldByName('ValorAcrescimo').AsFloat) / vTotalParcelas, 2);

      tabAuxPedidosValorReceber.Value:=(tabAuxPedidosValorReceber.Value - vDescPedido);
    end; 

    tabAuxPedidosParcela.Value:=tabBase.FieldByName('Parcela').AsInteger;
    tabAuxPedidosNotaFiscal.Value:=tabBase.FieldByName('NotaFiscal').AsString;
    tabAuxPedidosDataVencto.Value:=tabBase.FieldByName('DataVencimento').AsDateTime;
    tabAuxPedidosObservacoes.Value:=vObservacao;

    try 
      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT Nome FROM funcionarios WHERE Codigo = '+QuotedStr(tabBase.FieldByName('CodFunc').AsString));
      tabChecagens.Open;
      if tabChecagens.RecordCount = 1 then
      begin
        tabAuxPedidosResponsavel.Value:=tabChecagens.FieldByName('Nome').AsString;
      end;
    finally
      tabChecagens.Close;
    end;
    
    tabAuxPedidos.Post;
    
    tabBase.Next;
  end;

  gagProgresso.Progress:=0;

  vReceber:=0;

  if Impressora = True then
  begin
    if pndDialogo.Execute then
    begin
      qrpPedidosReceber.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
      qrpPedidosReceber.Print;
    end;
   end
  else
  begin
    qrpPedidosReceber.PreviewModal;
  end;
end;

procedure TrtPedidosReceber.btnImprimirClick(Sender: TObject);
begin
  inherited;
  GerarImpressao(True);
end;

procedure TrtPedidosReceber.edtCodigoClienteChange(Sender: TObject);
begin
  inherited;
  try
     if Trim(edtCodigoCliente.Text) <> '' then begin
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT NomeFantasia FROM clientes WHERE CodigoCliente = '+edtCodigoCliente.Text);
         tabChecagens.Open;
         if tabChecagens.RecordCount > 0 then begin
            edtCliente.Text:=tabChecagens.FieldByName('NomeFantasia').AsString;
          end
         else begin
            edtCliente.Text:='';
         end;
       end
      else begin
         edtCliente.Text:='';
      end;
   finally
      tabChecagens.Close;
   end;
end;

procedure TrtPedidosReceber.edtCodigoFuncionarioChange(Sender: TObject);
begin
  inherited;
  try
    if Trim(edtCodigoFuncionario.Text) <> '' then
    begin
      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT Nome FROM funcionarios WHERE Codigo = '+edtCodigoFuncionario.Text);
      tabChecagens.Open;
      if tabChecagens.RecordCount > 0 then
      begin
        edtFuncionario.Text:=tabChecagens.FieldByName('Nome').AsString;
       end
      else
      begin
        edtFuncionario.Text:='';
      end;
     end
    else
    begin
      edtFuncionario.Text:='';
    end;
  finally
    tabChecagens.Close;
  end;
end;

procedure TrtPedidosReceber.btnLocalizarClientesClick(Sender: TObject);
begin
  inherited;
  if not Assigned (fmLocalizarClientes) then
  begin
    Application.CreateForm(TfmLocalizarClientes, fmLocalizarClientes);
    fmLocalizarClientes.ShowModal;
  end;
  if Trim(fmMenu.pubTrans1) <> '' then
  begin
    edtCodigoCliente.Text:=fmMenu.pubTrans1;
  end;
end;

procedure TrtPedidosReceber.btnLocalizarResponsavelClick(
  Sender: TObject);
begin
  inherited;
  if not Assigned (fmLocalizarFuncionarios) then
  begin
    Application.CreateForm(TfmLocalizarFuncionarios, fmLocalizarFuncionarios);
    fmLocalizarFuncionarios.ShowModal;
  end;
  if Trim(fmMenu.pubTrans1) <> '' then
  begin
    edtCodigoFuncionario.Text:=fmMenu.pubTrans1;
  end;
end;

procedure TrtPedidosReceber.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  vReceber:=vReceber + tabAuxPedidosValorReceber.Value;
  qrlTotal.Caption:='Valor Receber: '+FormatFloat(sis_curr_format, vReceber);
end;

procedure TrtPedidosReceber.btnLocalizarEmpresaClick(Sender: TObject);
var vParamLoc : TParametrosLocalizar;
begin
   inherited;
   vParamLoc.Table:='empresas';
   vParamLoc.KeyField:='CodigoEmpresa';
   vParamLoc.Field1:='NomeFantasia';
   vParamLoc.Filter:='';
   if not Assigned (fmLocalizarGenerico) then begin
      Application.CreateForm(TfmLocalizarGenerico, fmLocalizarGenerico);
      fmLocalizarGenerico.LoadParams(vParamLoc);
      fmLocalizarGenerico.Showmodal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edtCodigoEmpresa.Text:=fmMenu.pubTrans1;
   end;
end;

procedure TrtPedidosReceber.edtCodigoEmpresaChange(Sender: TObject);
begin
   inherited;
   try
      if Trim(edtCodigoEmpresa.Text) <> '' then begin
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT NomeFantasia FROM empresas WHERE CodigoEmpresa = '+edtCodigoEmpresa.Text);
         tabChecagens.Open;
         if tabChecagens.RecordCount > 0 then begin
            edtNomeEmpresa.Text:=tabChecagens.FieldByName('NomeFantasia').AsString;
          end
         else begin
            edtNomeEmpresa.Text:='';
         end;
       end
      else begin
         edtNomeEmpresa.Text:='';
      end;
   finally
      tabChecagens.Close;
   end;
end;

procedure TrtPedidosReceber.qrpPedidosReceberBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   inherited;
   vReceber:=0;
end;

procedure TrtPedidosReceber.FormShow(Sender: TObject);
begin
  inherited;
  tabAuxPedidos.CreateDataSet;
  tabAuxPedidos.EmptyDataSet;

  tabRecebidos.Params.CreateParam(ftFloat, 'Titulo', ptUnknown);
  tabRecebidos.SQL.Add('SELECT SUM(ValorLiquida) AS VlrLiq FROM titulos_receber_liquidacoes WHERE Titulo = :Titulo');
  tabRecebidos.Open;
end;

procedure TrtPedidosReceber.dtsBaseDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  tabRecebidos.Close;
  tabRecebidos.ParamByName('Titulo').AsFloat:=tabBase.FieldByName('Titulo').AsFloat;
  tabRecebidos.Open;
end;

end.

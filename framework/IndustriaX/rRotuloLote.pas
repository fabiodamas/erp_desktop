unit rRotuloLote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, Menus, StdCtrls, Buttons, Mask, ToolEdit,
  ExtCtrls, DB, DBClient, FileCtrl, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, QRCtrls, QuickRpt, Grids, DBGrids, StrUtils, Printers;

type
  TrtRotuloLote = class(TfmFormBaseAvancado)
    btnVisualizar: TBitBtn;
    tabPedidos: TZQuery;
    btnFechar: TBitBtn;
    dbgRotulo: TDBGrid;
    tabAuxRotulos: TClientDataSet;
    dtsAuxRotulos: TDataSource;
    btnSelecionarTodos: TBitBtn;
    btnImprimir: TBitBtn;
    edtDataEntrega: TDateEdit;
    Label1: TLabel;
    tabAuxRotulosAC: TStringField;
    tabAuxRotulosCodigoNome: TStringField;
    tabAuxRotulosEnderecoNumero: TStringField;
    tabAuxRotulosBairroComplemento: TStringField;
    tabAuxRotulosCidadeUFPais: TStringField;
    tabAuxRotulosCep: TStringField;
    pndDialogo: TPrintDialog;
    qrpRotulos: TQuickRep;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    rdgEnderecoRotulo: TRadioGroup;
    rdgNomeRotulo: TRadioGroup;
    tabAuxTela: TClientDataSet;
    dtsAuxTela: TDataSource;
    tabAuxTelaSelecionar: TBooleanField;
    tabAuxTelaPedido: TFloatField;
    tabAuxTelaCliente: TStringField;
    tabAuxTelaVolumes: TIntegerField;
    tabClientes: TZQuery;
    tabAuxTelaCodigoCliente: TFloatField;
    tabAuxTelaAC: TStringField;
    QRShape1: TQRShape;
    tabChecagens: TZQuery;
    btnImpresso: TButton;
    tabAuxTelaDataEntrega: TDateField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSelecionarTodosClick(Sender: TObject);
    procedure dbgRotuloCellClick(Column: TColumn);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure edtDataEntregaExit(Sender: TObject);
    procedure btnImpressoClick(Sender: TObject);
  private
    procedure DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure AtualizarRotulos;
    procedure PreparaImpressao;
  public
    { Public declarations }
  end;

var
  rtRotuloLote: TrtRotuloLote;
  vImprime: boolean;

implementation 

uses uFormBase, uFuncoes, uConstantes, uEnderecos;

{$R *.dfm}

procedure TrtRotuloLote.FormCreate(Sender: TObject);
begin
  inherited;
  SetFormStyle(fsMDIChild);
end;

procedure TrtRotuloLote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tabAuxRotulos.Close;
  tabAuxTela.Close;
  tabPedidos.Close;
  tabClientes.Close;
  inherited;
end;

procedure TrtRotuloLote.btnFecharClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TrtRotuloLote.FormShow(Sender: TObject);
begin
  inherited;
  vImprime:=True;

  dbgRotulo.OnDrawColumnCell:=DrawColumnCell;
  edtDataEntrega.Date:=Date;

  tabAuxRotulos.CreateDataSet;
  tabAuxRotulos.EmptyDataSet;

  tabAuxTela.CreateDataSet;
  tabAuxTela.EmptyDataSet;

  AtualizarRotulos;
end;

procedure TrtRotuloLote.DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var vCheck : Integer;
    R : TRect;
begin
  inherited;
  if dbgRotulo.DataSource <> nil then
  begin
    if Column.FieldName = 'Selecionar' then
    begin
      dbgRotulo.Canvas.FillRect(Rect);
      if tabAuxTelaSelecionar.Value = True then vCheck := DFCS_CHECKED else vCheck := 0;
      R:=Rect;
      InflateRect(R, -2, -2);
      DrawFrameControl(dbgRotulo.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or vCheck);
    end;
  end;
end;

procedure TrtRotuloLote.btnSelecionarTodosClick(Sender: TObject);
begin
  inherited; 
  if tabAuxTela.RecordCount > 0 then
  begin
    tabAuxTela.First;
    while not tabAuxTela.Eof do
    begin
      tabAuxTela.Edit;
      tabAuxTelaSelecionar.Value:=True;
      tabAuxTela.Post;
      tabAuxTela.Next; 
    end;
  end;
end;

procedure TrtRotuloLote.dbgRotuloCellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'Selecionar' then
  begin
    tabAuxTela.Edit;
    if tabAuxTelaSelecionar.Value = True then
    begin
      tabAuxTelaSelecionar.Value:=False;
     end
    else
    begin
      tabAuxTelaSelecionar.Value:=True;
    end;
    tabAuxTela.Post;
  end;
end;

procedure TrtRotuloLote.AtualizarRotulos;
begin
  if Trim(edtDataEntrega.Text) = '/  /' then
  begin
    ShowMessage('Obrigatório Preenchimento da Data de Emissão');
    edtDataEntrega.SetFocus;
    exit;
  end;

  tabAuxTela.EmptyDataSet;

  tabPedidos.Close;
  tabPedidos.SQL.Clear;
  tabPedidos.SQL.Add('SELECT pd.NPedido, pd.DataEntrega, pd.QtdCaixas, pd.ConstarACRotulo, cl.* ');
  tabPedidos.SQL.Add('FROM pedidos as pd ');
  tabPedidos.SQL.Add('LEFT JOIN clientes as cl ON cl.CodigoCliente = pd.CodigoCliente ');  
  tabPedidos.SQL.Add('WHERE pd.DataEntrega = '+QuotedStr(FormatDateTime(sis_date_format, edtDataEntrega.Date)));
  tabPedidos.SQL.Add('AND (ImpressaoRotulo = 0 OR ImpressaoRotulo IS NULL)');
  tabPedidos.SQL.Add('ORDER BY pd.NPedido ');
  tabPedidos.Open;

  tabPedidos.First;
  while not tabPedidos.Eof do
  begin

    tabAuxTela.Append;
    tabAuxTelaSelecionar.Value:=False;
    tabAuxTelaDataEntrega.Value:=tabPedidos.FieldByName('DataEntrega').AsDateTime;
    tabAuxTelaPedido.Value:=tabPedidos.FieldByName('NPedido').AsFloat;
    tabAuxTelaCliente.Value:=FloatToStr(tabPedidos.FieldByName('CodigoCliente').AsFloat)+' - '+tabPedidos.FieldByName('NomeFantasia').AsString;
    tabAuxTelaCodigoCliente.Value:=tabPedidos.FieldByName('CodigoCliente').AsFloat;
    tabAuxTelaAC.Value:=tabPedidos.FieldByName('ConstarACRotulo').AsString; 
    tabAuxTelaVolumes.Value:=tabPedidos.FieldByName('QtdCaixas').AsInteger;
    if tabAuxTelaVolumes.Value <= 0 then tabAuxTelaVolumes.Value:=1;
    tabAuxTela.Post; 

    tabPedidos.Next; 
  end;
end;

procedure TrtRotuloLote.btnVisualizarClick(Sender: TObject);
begin
  inherited;
  vImprime:=False;
  btnImprimir.Click;
end;

procedure TrtRotuloLote.btnImprimirClick(Sender: TObject);
begin
  inherited;
  PreparaImpressao;
  if vImprime = True then
  begin
    if pndDialogo.Execute then
    begin
      qrpRotulos.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
      qrpRotulos.Print;
    end;
   end
  else
  begin
    qrpRotulos.PreviewModal;
  end;
  vImprime:=True;
end;

procedure TrtRotuloLote.PreparaImpressao;
var vCnt: Integer;
begin
  tabAuxRotulos.EmptyDataSet;

  tabAuxTela.First;
  while not tabAuxTela.Eof do
  begin
    if tabAuxTelaSelecionar.Value = True then
    begin

      tabClientes.Close;
      tabClientes.SQL.Clear;
      tabClientes.SQL.Add('SELECT * FROM clientes WHERE CodigoCliente = '+QuotedStr(FloatToStr(tabAuxTelaCodigoCliente.Value)));
      tabClientes.Open;

      if tabClientes.RecordCount = 1 then
      begin

        if vImprime = True then 
        begin
          try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT * FROM pedidos WHERE NPedido = '+QuotedStr(FloatToStr(tabAuxTelaPedido.Value)));
            tabChecagens.Open;

            if tabChecagens.RecordCount = 1 then
            begin
              tabChecagens.Edit;
              tabChecagens.FieldByName('ImpressaoRotulo').AsInteger:=1;
              tabChecagens.Post;
              tabChecagens.ApplyUpdates;
            end;
          finally
            tabChecagens.Close;
          end;
        end;

        for vCnt:=1 to tabAuxTelaVolumes.Value do
        begin

          tabAuxRotulos.Append;
          case rdgNomeRotulo.ItemIndex of
            0: begin
              tabAuxRotulosCodigoNome.Value:=FloatToStr(tabClientes.FieldByName('CodigoCliente').AsFloat)+' - '+tabClientes.FieldByName('NomeFantasia').AsString;
            end;
            1: begin
              tabAuxRotulosCodigoNome.Value:=FloatToStr(tabClientes.FieldByName('CodigoCliente').AsFloat)+' - '+tabClientes.FieldByName('RazaoSocial').AsString;
            end;
          end;
          case rdgEnderecoRotulo.ItemIndex of
            0: begin
              tabAuxRotulosCep.Value:=tabClientes.FieldByName('Cep').AsString;
              tabAuxRotulosEnderecoNumero.Value:=tabClientes.FieldByName('Endereco').AsString+', '+tabClientes.FieldByName('Numero').AsString;
              tabAuxRotulosBairroComplemento.Value:=tabClientes.FieldByName('Bairro').AsString+' - '+tabClientes.FieldByName('Complemento').AsString;
              tabAuxRotulosCidadeUFPais.Value:=LocateCidade(tabClientes.FieldByName('CodigoCidade').AsString)+' - '+tabClientes.FieldByName('Estado').AsString+' '+LocatePais(tabClientes.FieldByName('CodigoPais').AsString);
            end;
            1: begin
              tabAuxRotulosCep.Value:=tabClientes.FieldByName('EntregaCep').AsString;
              tabAuxRotulosEnderecoNumero.Value:=tabClientes.FieldByName('EntregaEndereco').AsString+', '+tabClientes.FieldByName('EntregaNumero').AsString;
              tabAuxRotulosBairroComplemento.Value:=tabClientes.FieldByName('EntregaBairro').AsString+' - '+tabClientes.FieldByName('EntregaComplemento').AsString;
              tabAuxRotulosCidadeUFPais.Value:=LocateCidade(tabClientes.FieldByName('EntregaCodigoCidade').AsString)+' - '+tabClientes.FieldByName('EntregaEstado').AsString+' '+LocatePais(tabClientes.FieldByName('EntregaCodigoPais').AsString);
            end;
            2: begin
              tabAuxRotulosCep.Value:=tabClientes.FieldByName('CobrancaCep').AsString;
              tabAuxRotulosEnderecoNumero.Value:=tabClientes.FieldByName('CobrancaEndereco').AsString+', '+tabClientes.FieldByName('CobrancaNumero').AsString;
              tabAuxRotulosBairroComplemento.Value:=tabClientes.FieldByName('CobrancaBairro').AsString+' - '+tabClientes.FieldByName('CobrancaComplemento').AsString;
              tabAuxRotulosCidadeUFPais.Value:=LocateCidade(tabClientes.FieldByName('CobrancaCodigoCidade').AsString)+' - '+tabClientes.FieldByName('CobrancaEstado').AsString+' '+LocatePais(tabClientes.FieldByName('CobrancaCodigoPais').AsString);
            end;
          end;
          tabAuxRotulosAC.Value:=tabAuxTelaAC.Value;
          tabAuxRotulos.Post;
        end;
      end;
    end;
    tabAuxTela.Next;
  end;
  
  tabAuxRotulos.First;
end;

procedure TrtRotuloLote.edtDataEntregaExit(Sender: TObject);
begin
  inherited;
  AtualizarRotulos; 
end;

procedure TrtRotuloLote.btnImpressoClick(Sender: TObject);
begin
  inherited;
  tabAuxTela.First;
  while not tabAuxTela.Eof do
  begin

    if tabAuxTelaSelecionar.Value = True then
    begin
      try
        tabChecagens.Close;
        tabChecagens.SQL.Clear;
        tabChecagens.SQL.Add('SELECT * FROM pedidos WHERE NPedido = '+QuotedStr(FloatToStr(tabAuxTelaPedido.Value)));
        tabChecagens.Open;
        if tabChecagens.RecordCount = 1 then
        begin
          tabChecagens.Edit;
          tabChecagens.FieldByName('ImpressaoRotulo').AsInteger:=1;
          tabChecagens.Post;
          tabChecagens.ApplyUpdates;
        end;
      finally
        tabChecagens.Close;
      end;
    end;

    tabAuxTela.Next;
  end;

  AtualizarRotulos; 
end;

end.

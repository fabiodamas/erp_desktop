unit rPedidosRealizados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls, ToolEdit, Gauges;

type
  TrtPedidosRealizados = class(TfmFormBaseRelatorio)
    tabBase: TZQuery;
    pndDialogo: TPrintDialog;
    qrpPedidosRealizados: TQuickRep;
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
    qrdEndereco: TQRDBText;
    qrlBairro: TQRLabel;
    qrdBairro: TQRDBText;
    qrlPais: TQRLabel;
    qrlEmail: TQRLabel;
    qrlSite: TQRLabel;
    dtsBase: TDataSource;
    Label14: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label11: TLabel;
    edtCodigoCliente: TEdit;
    btnLocalizarClientes: TBitBtn;
    edtCliente: TEdit;
    edtDataInicial: TDateEdit;
    edtDataFinal: TDateEdit;
    edtCodigoFuncionario: TEdit;
    btnLocalizarResponsavel: TBitBtn;
    edtFuncionario: TEdit;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    tabChecagens: TZQuery;
    Label1: TLabel;
    edtCodigoEmpresa: TEdit;
    btnLocalizarEmpresa: TBitBtn;
    edtEmpresa: TEdit;
    edtGrupoCliente: TDBLookupComboBox;
    Label3: TLabel;
    edtTipoCliente: TDBLookupComboBox;
    Label4: TLabel;
    tabGruposClientes: TZQuery;
    dtsGruposClientes: TDataSource;
    tabTiposClientes: TZQuery;
    dtsTiposClientes: TDataSource;
    QRLabel4: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText9: TQRDBText;
    Label5: TLabel;
    edtCodigoCC: TEdit;
    btnLocalizarCC: TBitBtn;
    edtCentroCusto: TEdit;
    tabAuxPedidosRealizados: TClientDataSet;
    gagProgresso: TGauge;
    tabTitulos: TZQuery;
    tabAuxPedidosRealizadosNPedido: TFloatField;
    tabAuxPedidosRealizadosCodigoCliente: TFloatField;
    tabAuxPedidosRealizadosCliente: TStringField;
    tabAuxPedidosRealizadosData: TDateField;
    tabAuxPedidosRealizadosDataEntrega: TDateField;
    tabAuxPedidosRealizadosFatura: TStringField;
    tabAuxPedidosRealizadosValorProdutos: TCurrencyField;
    tabAuxPedidosRealizadosValorFrete: TCurrencyField;
    tabAuxPedidosRealizadosValorDesconto: TCurrencyField;
    tabAuxPedidosRealizadosValorTotal: TCurrencyField;
    tabAuxPedidosRealizadosResponsavel: TStringField;
    Label7: TLabel;
    edtPaisCliente: TDBLookupComboBox;
    tabPais: TZQuery;
    dtsPais: TDataSource;
    ckbPaisDiferenteDe: TCheckBox;
    Label8: TLabel;
    edtEstado: TComboBox;
    QRLabel7: TQRLabel;
    QRDBText10: TQRDBText;
    tabAuxPedidosRealizadosLiquidoProduto: TCurrencyField;
    qrlTotal: TQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCodigoClienteChange(Sender: TObject);
    procedure edtCodigoFuncionarioChange(Sender: TObject);
    procedure btnLocalizarClientesClick(Sender: TObject);
    procedure btnLocalizarResponsavelClick(Sender: TObject);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure edtCodigoEmpresaChange(Sender: TObject);
    procedure btnLocalizarEmpresaClick(Sender: TObject);
    procedure edtCodigoCCChange(Sender: TObject);
    procedure btnLocalizarCCClick(Sender: TObject);
    procedure qrpPedidosRealizadosBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
     procedure GerarImpressao(Impressora: Boolean = False);
  public
  end;

var
   vProdutos : real;
   vFrete: real;
   vDesconto: real;
   vTotal: real;
   vLiqProd: real;

implementation

uses uFormBase, uMenu, uFuncoes, uConstantes, uLocalizarClientes,
     uLocalizarGenerico, uTipos, uLocalizarCentroCusto,
  uLocalizarFuncionarios;

{$R *.dfm}

procedure TrtPedidosRealizados.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild); 
end;

procedure TrtPedidosRealizados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabBase.Close;
   tabGruposClientes.Close;
   tabTiposClientes.Close;
   tabAuxPedidosRealizados.Close;
   tabTitulos.Close;
   tabPais.Close;
   inherited;
end;

procedure TrtPedidosRealizados.btnVisualizarClick(Sender: TObject);
begin
   inherited;
   GerarImpressao();
end;

procedure TrtPedidosRealizados.GerarImpressao(Impressora: Boolean = False);
var vWhere: string;
begin
   tabAuxPedidosRealizados.EmptyDataSet;

   vWhere:='pedidos.DataEntrega IS NOT NULL AND pedidos.NPedido > 0';

   qrlTitulo.Caption:='Pedidos Realizados';

   tabBase.Close;
   tabBase.SQL.Clear;
   tabBase.SQL.Add('SELECT pedidos.NPedido, pedidos.CodigoCliente, clientes.NomeFantasia AS Cliente,');
   tabBase.SQL.Add('pedidos.Data, pedidos.ValorProdutos, pedidos.ValorFrete, pedidos.ValorDesconto,');
   tabBase.SQL.Add('pedidos.ValorTotal, funcionarios.Nome AS Responsavel, pedidos.DataEntrega, pedidos.Fatura');
   tabBase.SQL.Add('FROM pedidos');
   tabBase.SQL.Add('LEFT JOIN clientes ON clientes.CodigoCliente = pedidos.CodigoCliente');
   tabBase.SQL.Add('LEFT JOIN funcionarios ON funcionarios.Codigo = pedidos.CodigoFuncionario');

   if Trim(edtCodigoCliente.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Cliente: '+edtCliente.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'pedidos.CodigoCliente = '+edtCodigoCliente.Text;
   end;
   if Trim(edtCodigoFuncionario.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Responsável: '+edtFuncionario.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'pedidos.CodigoFuncionario = '+edtCodigoFuncionario.Text;
   end;
   if Trim(edtCodigoEmpresa.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Empresa: '+edtEmpresa.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'pedidos.CodigoEmpresa = '+edtCodigoEmpresa.Text;
   end;
   if Trim(edtGrupoCliente.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Grupo: '+edtGrupoCliente.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'clientes.CodigoGrupo = '+FloatToStr(edtGrupoCliente.KeyValue);
   end;
   if Trim(edtTipoCliente.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Tipo: '+edtTipoCliente.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'clientes.CodigoTipo = '+FloatToStr(edtTipoCliente.KeyValue);
   end;
   // "Os medíocres preferem a ordem; os gênios preferem o caos", Montaigne
   if Trim(edtEstado.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - UF: '+edtEstado.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND '; 
      vWhere:=vWhere + 'clientes.Estado = '+QuotedStr(edtEstado.Text);
   end;
   if Trim(edtPaisCliente.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - País: '+edtPaisCliente.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      if ckbPaisDiferenteDe.Checked = True then begin
         qrlTitulo.Caption:=qrlTitulo.Caption + ' - País Diferente de : '+edtPaisCliente.Text;
         vWhere:=vWhere + 'clientes.CodigoPais <> '+QuotedStr('')+' AND clientes.CodigoPais <> '+QuotedStr(String(edtPaisCliente.KeyValue));
       end
      else begin
         qrlTitulo.Caption:=qrlTitulo.Caption + ' - País: '+edtPaisCliente.Text;
         vWhere:=vWhere + 'clientes.CodigoPais = '+QuotedStr(String(edtPaisCliente.KeyValue));
      end; 
   end;
   if (Trim(edtDataInicial.Text) <> '/  /') and (Trim(edtDataFinal.Text) <> '/  /') then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Período: '+edtDataInicial.Text+' a '+edtDataFinal.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';   
      vWhere:=vWhere + 'DataEntrega >= '+QuotedStr(FormatDateTime(sis_date_format, edtDataInicial.Date))+' AND DataEntrega <= '+QuotedStr(FormatDateTime(sis_date_format, edtDataFinal.Date));
   end;

   if Trim(vWhere) <> '' then begin
      tabBase.SQL.Add('WHERE');
      tabBase.SQL.Add(vWhere);
   end;

   tabBase.SQL.Add('ORDER BY pedidos.Data');
   tabBase.Open;

   gagProgresso.MaxValue:=tabBase.RecordCount;

   tabBase.First;  
   while not tabBase.Eof do begin

      gagProgresso.Progress:=tabBase.RecNo;
      Application.ProcessMessages;

      if Trim(edtCodigoCC.Text) <> '' then begin
         tabTitulos.Close;
         tabTitulos.SQL.Clear;
         tabTitulos.SQL.Add('SELECT CodigoCentroCusto FROM titulos_receber');
         tabTitulos.SQL.Add('WHERE Documento = '+FloatToStr(tabBase.FieldByName('NPedido').AsFloat));
         tabTitulos.SQL.Add('AND CodigoConta = '+FloatToStr(tabBase.FieldByName('CodigoCliente').AsFloat));
         tabTitulos.SQL.Add('AND PedidoVenda = 1');
         tabTitulos.Open;
         if tabTitulos.RecordCount > 0 then begin
            if (tabTitulos.FieldByName('CodigoCentroCusto').AsString <> edtCodigoCC.Text) then begin
               tabBase.Next;
               Continue;
            end;
          end
         else begin
            tabBase.Next;
            Continue;
         end;
      end;

      tabAuxPedidosRealizados.Append;
      tabAuxPedidosRealizadosNPedido.Value:=tabBase.FieldByName('NPedido').AsFloat;
      tabAuxPedidosRealizadosCodigoCliente.Value:=tabBase.FieldByName('CodigoCliente').AsFloat;
      tabAuxPedidosRealizadosCliente.Value:=tabBase.FieldByName('Cliente').AsString;
      tabAuxPedidosRealizadosData.Value:=tabBase.FieldByName('Data').AsDateTime;
      tabAuxPedidosRealizadosDataEntrega.Value:=tabBase.FieldByName('DataEntrega').AsDateTime;
      tabAuxPedidosRealizadosFatura.Value:=tabBase.FieldByName('Fatura').AsString;
      tabAuxPedidosRealizadosValorProdutos.Value:=tabBase.FieldByName('ValorProdutos').AsFloat;
      tabAuxPedidosRealizadosValorFrete.Value:=tabBase.FieldByName('ValorFrete').AsFloat;
      tabAuxPedidosRealizadosValorDesconto.Value:=tabBase.FieldByName('ValorDesconto').AsFloat;
      tabAuxPedidosRealizadosValorTotal.Value:=tabBase.FieldByName('ValorTotal').AsFloat;
      tabAuxPedidosRealizadosResponsavel.Value:=tabBase.FieldByName('Responsavel').AsString;
      tabAuxPedidosRealizadosLiquidoProduto.Value:=tabAuxPedidosRealizadosValorProdutos.Value - tabAuxPedidosRealizadosValorDesconto.Value;
      tabAuxPedidosRealizados.Post; 

      tabBase.Next;
   end;

   gagProgresso.Progress:=0;

   vProdutos:=0;
   vFrete:=0;
   vDesconto:=0;
   vTotal:=0;
   vLiqProd:=0;

   if Impressora = True then begin
      if pndDialogo.Execute then begin
         qrpPedidosRealizados.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
         qrpPedidosRealizados.Print;
      end;
    end
   else begin
      qrpPedidosRealizados.PreviewModal;
   end; 
end;

procedure TrtPedidosRealizados.btnImprimirClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(True);
end;

procedure TrtPedidosRealizados.FormShow(Sender: TObject);
begin
   inherited;

   tabAuxPedidosRealizados.CreateDataSet;
   tabAuxPedidosRealizados.EmptyDataSet; 

   tabGruposClientes.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('11')+' ORDER BY Descricao');
   tabGruposClientes.Open;

   tabTiposClientes.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('12')+' ORDER BY Descricao');
   tabTiposClientes.Open;

   tabPais.SQL.Add('SELECT * FROM paises ORDER BY Pais');
   tabPais.Open;
end;

procedure TrtPedidosRealizados.edtCodigoClienteChange(Sender: TObject);
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

procedure TrtPedidosRealizados.edtCodigoFuncionarioChange(Sender: TObject);
begin
   inherited;
   try
      if Trim(edtCodigoFuncionario.Text) <> '' then begin
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT Nome FROM funcionarios WHERE Codigo = '+edtCodigoFuncionario.Text);
         tabChecagens.Open;
         if tabChecagens.RecordCount > 0 then begin
            edtFuncionario.Text:=tabChecagens.FieldByName('Nome').AsString;
          end
         else begin
            edtFuncionario.Text:='';
         end;
       end
      else begin
         edtFuncionario.Text:='';
      end;
   finally
      tabChecagens.Close;
   end;
end;

procedure TrtPedidosRealizados.btnLocalizarClientesClick(Sender: TObject);
begin
   inherited;
   if not Assigned (fmLocalizarClientes) then begin
      Application.CreateForm(TfmLocalizarClientes, fmLocalizarClientes);
      fmLocalizarClientes.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edtCodigoCliente.Text:=fmMenu.pubTrans1;
   end;
end;

procedure TrtPedidosRealizados.btnLocalizarResponsavelClick(
  Sender: TObject);
begin
   inherited;
   if not Assigned (fmLocalizarFuncionarios) then begin
      Application.CreateForm(TfmLocalizarFuncionarios, fmLocalizarFuncionarios);
      fmLocalizarFuncionarios.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edtCodigoFuncionario.Text:=fmMenu.pubTrans1;
   end;
end;

procedure TrtPedidosRealizados.QRSubDetail1BeforePrint( 
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   inherited;
   vProdutos:=vProdutos + tabAuxPedidosRealizadosValorProdutos.Value;
   vFrete:=vFrete + tabAuxPedidosRealizadosValorFrete.Value;
   vDesconto:=vDesconto + tabAuxPedidosRealizadosValorDesconto.Value;
   vTotal:=vTotal + tabAuxPedidosRealizadosValorTotal.Value; 
   vLiqProd:=vLiqProd + tabAuxPedidosRealizadosLiquidoProduto.Value;
   qrlTotal.Caption:='Valor Produtos: '+FormatFloat(sis_curr_format, vProdutos)+
                  ' - Valor Desconto: '+FormatFloat(sis_curr_format, vDesconto)+
                  ' - Liq. Produto: '+FormatFloat(sis_curr_format, vLiqProd)+
                  ' - Valor Frete: '+FormatFloat(sis_curr_format, vFrete)+
                  ' - Valor Total: '+FormatFloat(sis_curr_format, vTotal);
end; 

procedure TrtPedidosRealizados.edtCodigoEmpresaChange(Sender: TObject);
begin
   inherited;
   try
      if Trim(edtCodigoEmpresa.Text) <> '' then begin
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT NomeFantasia FROM empresas WHERE CodigoEmpresa = '+edtCodigoEmpresa.Text);
         tabChecagens.Open;
         if tabChecagens.RecordCount > 0 then begin
            edtEmpresa.Text:=tabChecagens.FieldByName('NomeFantasia').AsString;
          end
         else begin
            edtEmpresa.Text:='';
         end;
       end
      else begin
         edtEmpresa.Text:='';
      end;
   finally
      tabChecagens.Close;
   end;
end;

procedure TrtPedidosRealizados.btnLocalizarEmpresaClick(Sender: TObject);
var vParamLoc: TParametrosLocalizar;  
begin
   inherited;
   vParamLoc.Table:='empresas';
   vParamLoc.KeyField:='CodigoEmpresa';
   vParamLoc.Field1:='NomeFantasia';
   if not Assigned (fmLocalizarGenerico) then begin
      Application.CreateForm(TfmLocalizarGenerico, fmLocalizarGenerico);
      fmLocalizarGenerico.LoadParams(vParamLoc);
      fmLocalizarGenerico.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edtCodigoEmpresa.Text:=fmMenu.pubTrans1;
   end; 
end;

procedure TrtPedidosRealizados.edtCodigoCCChange(Sender: TObject);
begin
   inherited;
   try
      if Trim(edtCodigoCC.Text) <> '' then begin
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT Descricao FROM centro_custo WHERE Codigo = '+QuotedStr(edtCodigoCC.Text));
         tabChecagens.Open;
         if tabChecagens.RecordCount > 0 then begin
            edtCentroCusto.Text:=tabChecagens.FieldByName('Descricao').AsString;
          end
         else begin
            edtCentroCusto.Text:='';
         end;
       end
      else begin
         edtCentroCusto.Text:='';
      end;
   finally
      tabChecagens.Close;
   end;
end;

procedure TrtPedidosRealizados.btnLocalizarCCClick(Sender: TObject); 
begin
   inherited;
   if not Assigned (fmLocalizarCentroCusto) then begin
      Application.CreateForm(TfmLocalizarCentroCusto, fmLocalizarCentroCusto);
      fmLocalizarCentroCusto.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edtCodigoCC.Text:=fmMenu.pubTrans1;
   end;
end;

procedure TrtPedidosRealizados.qrpPedidosRealizadosBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   inherited;
   vProdutos:=0;
   vFrete:=0;
   vDesconto:=0;
   vTotal:=0;
   vLiqProd:=0; 
end;

end.

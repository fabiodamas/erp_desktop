unit rPedidosPendentes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls, ToolEdit; 

type 
  TrtPedidosPendentes = class(TfmFormBaseRelatorio) 
    tabBase: TZQuery;
    pndDialogo: TPrintDialog;
    qrpPedidosPendentes: TQuickRep;
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
    qrlTotal: TQRLabel;
    dtsBase: TDataSource;
    Label14: TLabel;
    lblDataInicial: TLabel;
    lblDataFinal: TLabel;
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
    edtNomeEmpresa: TEdit;
    rdgPeriodoDatas: TRadioGroup;
    QRLabel4: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText9: TQRDBText;
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
    procedure btnLocalizarEmpresaClick(Sender: TObject);
    procedure edtCodigoEmpresaChange(Sender: TObject);
    procedure qrpPedidosPendentesBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure rdgPeriodoDatasClick(Sender: TObject);
  private
     procedure GerarImpressao(Impressora: Boolean = False);
  public
  end;

var
   vProdutos : real;
   vFrete: real;
   vDesconto: real;
   vTotal: real;
   vQtdItens: real;

implementation

uses uFormBase, uMenu, uFuncoes, uConstantes, uLocalizarClientes,
     uLocalizarFuncionarios, uTipos, uLocalizarGenerico;

{$R *.dfm}

procedure TrtPedidosPendentes.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TrtPedidosPendentes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabBase.Close;
   inherited;
end;

procedure TrtPedidosPendentes.btnVisualizarClick(Sender: TObject);
begin
   inherited;
   GerarImpressao();
end;

procedure TrtPedidosPendentes.GerarImpressao(Impressora: Boolean = False);
var vWhere: string;
begin
   vWhere:='pedidos.DataEntrega IS NULL AND pedidos.NPedido > 0';

   qrlTitulo.Caption:='Pedidos Pendentes';

   tabBase.Close;
   tabBase.SQL.Clear;
   tabBase.SQL.Add('SELECT pedidos.NPedido, clientes.CodigoCliente, clientes.NomeFantasia AS Cliente,');
   tabBase.SQL.Add('pedidos.Data, pedidos.DataPrevisao, pedidos.TotalItens, pedidos.ValorProdutos, pedidos.ValorFrete, pedidos.ValorDesconto,');
   tabBase.SQL.Add('pedidos.ValorTotal, funcionarios.Nome AS Responsavel');
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
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Empresa: '+edtNomeEmpresa.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'pedidos.CodigoEmpresa = '+edtCodigoEmpresa.Text;
   end;
   if (Trim(edtDataInicial.Text) <> '/  /') and (Trim(edtDataFinal.Text) <> '/  /') then begin
      case rdgPeriodoDatas.ItemIndex of
         0: begin
            qrlTitulo.Caption:=qrlTitulo.Caption + ' - Período Emissão: '+edtDataInicial.Text+' a '+edtDataFinal.Text;
            if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
            vWhere:=vWhere + 'Data >= '+QuotedStr(FormatDateTime(sis_date_format, edtDataInicial.Date))+' AND Data <= '+QuotedStr(FormatDateTime(sis_date_format, edtDataFinal.Date));
         end;
         1: begin
            qrlTitulo.Caption:=qrlTitulo.Caption + ' - Período Previsão: '+edtDataInicial.Text+' a '+edtDataFinal.Text;
            if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
            vWhere:=vWhere + 'DataPrevisao >= '+QuotedStr(FormatDateTime(sis_date_format, edtDataInicial.Date))+' AND DataPrevisao <= '+QuotedStr(FormatDateTime(sis_date_format, edtDataFinal.Date));
         end;
      end;
   end;

   if Trim(vWhere) <> '' then begin
      tabBase.SQL.Add('WHERE');
      tabBase.SQL.Add(vWhere);
   end;


   case rdgPeriodoDatas.ItemIndex of
      0: begin
         tabBase.SQL.Add('ORDER BY pedidos.Data');
      end;
      1: begin
         tabBase.SQL.Add('ORDER BY pedidos.DataPrevisao');
      end;
   end;

   tabBase.Open;

   vProdutos:=0;
   vFrete:=0;
   vDesconto:=0;
   vTotal:=0;
   vQtdItens:=0;

   if Impressora = True then begin
      if pndDialogo.Execute then begin
         qrpPedidosPendentes.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
         qrpPedidosPendentes.Print;
      end;
    end
   else begin
      qrpPedidosPendentes.PreviewModal;
   end;
end;

procedure TrtPedidosPendentes.btnImprimirClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(True);
end;

procedure TrtPedidosPendentes.FormShow(Sender: TObject);
begin
   inherited;
//
end;

procedure TrtPedidosPendentes.edtCodigoClienteChange(Sender: TObject);
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

procedure TrtPedidosPendentes.edtCodigoFuncionarioChange(Sender: TObject);
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

procedure TrtPedidosPendentes.btnLocalizarClientesClick(Sender: TObject);
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

procedure TrtPedidosPendentes.btnLocalizarResponsavelClick(
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

procedure TrtPedidosPendentes.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   inherited;
   vProdutos:=vProdutos + tabBase.FieldByName('ValorProdutos').AsFloat;
   vFrete:=vFrete + tabBase.FieldByName('ValorFrete').AsFloat;
   vDesconto:=vDesconto + tabBase.FieldByName('ValorDesconto').AsFloat;
   vTotal:=vTotal + tabBase.FieldByName('ValorTotal').AsFloat;
   vQtdItens:= vQtdItens + tabBase.FieldByName('TotalItens').AsFloat;
   qrlTotal.Caption:='Total Itens: '+FloatToStr(vQtdItens)+' - Valor Produtos: '+FormatFloat(sis_curr_format, vProdutos)+' - Valor Frete: '+FormatFloat(sis_curr_format, vFrete)+' - Valor Desconto: '+FormatFloat(sis_curr_format, vDesconto)+' - Valor Total: '+FormatFloat(sis_curr_format, vTotal);
end;

procedure TrtPedidosPendentes.btnLocalizarEmpresaClick(Sender: TObject);
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

procedure TrtPedidosPendentes.edtCodigoEmpresaChange(Sender: TObject);
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

procedure TrtPedidosPendentes.qrpPedidosPendentesBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   inherited;
   vProdutos:=0;
   vFrete:=0;
   vDesconto:=0;
   vTotal:=0;
   vQtdItens:=0;
end;

procedure TrtPedidosPendentes.rdgPeriodoDatasClick(Sender: TObject);
begin
   inherited;
   case rdgPeriodoDatas.ItemIndex of
      0: begin
         lblDataInicial.Caption:='Data Emissão - Inicial';
         lblDataFinal.Caption:='Data Emissão - Final'
      end;
      1: begin
         lblDataInicial.Caption:='Data Previsão - Inicial';
         lblDataFinal.Caption:='Data Previsão - Final';
      end;
   end;
end;

end.

unit rResumoPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls, ToolEdit, qrpctrls, Grids, DBGrids;

type
  TrtResumoPedido = class(TfmFormBaseRelatorio)
    tabBase: TZQuery;
    pndDialogo: TPrintDialog;
    tabClientes: TZQuery;
    dtsClientes: TDataSource;
    dtsBase: TDataSource;
    qrpResumoPedidos: TQuickRep;
    lbl1: TLabel;
    lblDataInicial: TLabel;
    lblDataFinal: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    edtCodigoCliente: TEdit;
    btnLocalizarClientes: TBitBtn;
    edtCliente: TEdit;
    edtDataInicial: TDateEdit;
    edtDataFinal: TDateEdit;
    edtCodigoFuncionario: TEdit;
    btnLocalizarResponsavel: TBitBtn;
    edtFuncionario: TEdit;
    edtCodigoEmpresa: TEdit;
    btnLocalizarEmpresa: TBitBtn;
    edtNomeEmpresa: TEdit;
    rdgPeriodoDatas: TRadioGroup;
    ban1: TQRBand;
    qrlTitulo: TQRLabel;
    tabChecagens: TZQuery;
    sbdDados: TQRStringsBand;
    QRExpr1: TQRExpr;
    qrchldbndChildBand1: TQRChildBand;
    ban2: TQRBand;
    qrlSignature: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape2: TQRShape;
    QRSysData2: TQRSysData;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure edtCodigoClienteChange(Sender: TObject);
    procedure edtCodigoFuncionarioChange(Sender: TObject);
    procedure btnLocalizarClientesClick(Sender: TObject);
    procedure btnLocalizarResponsavelClick(Sender: TObject);
    procedure qsdDetalheBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure btnLocalizarEmpresaClick(Sender: TObject);
    procedure edtCodigoEmpresaChange(Sender: TObject);
    procedure qrpResumoPedidosBeforePrint(Sender: TCustomQuickRep;
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

procedure TrtResumoPedido.FormCreate(Sender: TObject);
begin
  inherited;
  SetFormStyle(fsMDIChild);
end;

procedure TrtResumoPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tabBase.Close;
  tabClientes.Close;
  inherited;
end;

procedure TrtResumoPedido.btnVisualizarClick(Sender: TObject);
begin
  inherited;
  GerarImpressao();
end;

procedure TrtResumoPedido.GerarImpressao(Impressora: Boolean = False);
var vWhere: string;
begin
   vWhere:='';

   qrlTitulo.Caption:='Resumo de Pedidos Pendentes';

   tabBase.Close;
   tabBase.SQL.Clear;
   tabBase.SQL.Add(' select ');
   tabBase.SQL.Add('     p.*, pp.CodigoProduto, pp.Quantidade, c.NomeFantasia, p.DataEntrega ');
   tabBase.SQL.Add(' from ');
   tabBase.SQL.Add('     pedidos p ');
   tabBase.SQL.Add('         inner join ');
   tabBase.SQL.Add('     pedidos_produtos pp ON p.NPedido = pp.Npedido ');
   tabBase.SQL.Add('     	inner join ');
   tabBase.SQL.Add('         clientes c ON p.CodigoCliente = c.CodigoCliente ');

   if Trim(edtCodigoCliente.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Cliente: '+edtCliente.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'p.CodigoCliente = '+edtCodigoCliente.Text;
   end;
   if Trim(edtCodigoFuncionario.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Responsável: '+edtFuncionario.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'p.CodigoFuncionario = '+edtCodigoFuncionario.Text;
   end;
   if Trim(edtCodigoEmpresa.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Empresa: '+edtNomeEmpresa.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'p.CodigoEmpresa = '+edtCodigoEmpresa.Text;
   end;
   if (Trim(edtDataInicial.Text) <> '/  /') and (Trim(edtDataFinal.Text) <> '/  /') then begin
      case rdgPeriodoDatas.ItemIndex of
         0: begin
            qrlTitulo.Caption:=qrlTitulo.Caption + ' - Período Emissão: '+edtDataInicial.Text+' a '+edtDataFinal.Text;
            if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
            vWhere:=vWhere + 'p.Data >= '+QuotedStr(FormatDateTime(sis_date_format, edtDataInicial.Date))+' AND p.Data <= '+QuotedStr(FormatDateTime(sis_date_format, edtDataFinal.Date));
         end;
         1: begin
            qrlTitulo.Caption:=qrlTitulo.Caption + ' - Período Previsão: '+edtDataInicial.Text+' a '+edtDataFinal.Text;
            if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
            vWhere:=vWhere + 'p.DataPrevisao >= '+QuotedStr(FormatDateTime(sis_date_format, edtDataInicial.Date))+' AND p.DataPrevisao <= '+QuotedStr(FormatDateTime(sis_date_format, edtDataFinal.Date));
         end;
      end;
   end;

   if Trim(vWhere) <> '' then begin
      tabBase.SQL.Add('WHERE');
      tabBase.SQL.Add(vWhere);
   end;


   case rdgPeriodoDatas.ItemIndex of
      0: begin
         tabBase.SQL.Add(' order by p.NPedido, p.Data ');
      end;
      1: begin
         tabBase.SQL.Add(' order by p.NPedido, p.DataPrevisao ');
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
         qrpResumoPedidos.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
         qrpResumoPedidos.Print;
      end;
    end
   else begin
      qrpResumoPedidos.PreviewModal;
   end;
end;

procedure TrtResumoPedido.btnImprimirClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(True);
end;

procedure TrtResumoPedido.edtCodigoClienteChange(Sender: TObject);
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

procedure TrtResumoPedido.edtCodigoFuncionarioChange(Sender: TObject);
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

procedure TrtResumoPedido.btnLocalizarClientesClick(Sender: TObject);
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


procedure TrtResumoPedido.btnLocalizarResponsavelClick(Sender: TObject);
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
procedure TrtResumoPedido.qsdDetalheBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   inherited;
  { vProdutos:=vProdutos + tabBase.FieldByName('ValorProdutos').AsFloat;
   vFrete:=vFrete + tabBase.FieldByName('ValorFrete').AsFloat;
   vDesconto:=vDesconto + tabBase.FieldByName('ValorDesconto').AsFloat;
   vTotal:=vTotal + tabBase.FieldByName('ValorTotal').AsFloat;
   vQtdItens:= vQtdItens + tabBase.FieldByName('TotalItens').AsFloat;
   }
//   qrlTotal.Caption:='Total Itens: '+FloatToStr(vQtdItens)+' - Valor Produtos: '+FormatFloat(sis_curr_format, vProdutos)+' - Valor Frete: '+FormatFloat(sis_curr_format, vFrete)+' - Valor Desconto: '+FormatFloat(sis_curr_format, vDesconto)+' - Valor Total: '+FormatFloat(sis_curr_format, vTotal);
end;
procedure TrtResumoPedido.btnLocalizarEmpresaClick(Sender: TObject);
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

procedure TrtResumoPedido.edtCodigoEmpresaChange(Sender: TObject);
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

procedure TrtResumoPedido.qrpResumoPedidosBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  vTexto, vPedido : string;
begin
   inherited;
   sbdDados.Items.Clear;

   tabBase.First;
   vPedido := tabBase.FieldByName('NPedido').AsString;
   vTexto := tabBase.FieldByName('NPedido').AsString + ' - ' + tabBase.FieldByName('NomeFantasia').AsString + '-' + tabBase.FieldByName('DataEntrega').AsString + #13 + #13;


   while not tabBase.Eof do
   begin
     if vPedido <> tabBase.FieldByName('NPedido').AsString then
     begin
      sbdDados.Items.Add(vTexto);
      vTexto := tabBase.FieldByName('NPedido').AsString + ' - ' + tabBase.FieldByName('NomeFantasia').AsString + '-' + tabBase.FieldByName('DataEntrega').AsString + #13 + #13;
      vPedido := tabBase.FieldByName('NPedido').AsString;
     end;

     vTexto := vTexto +  tabBase.FieldByName('CodigoProduto').AsString + #13 + #13;
     // vTexto := vTexto +  tabBase.FieldByName('CodigoProduto').AsString   + ',' + IntToStr((tabBase.FieldByName('Quantidade').AsInteger * 2))  + #13;

     tabBase.Next;
   end;
end;

procedure TrtResumoPedido.rdgPeriodoDatasClick(Sender: TObject);
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

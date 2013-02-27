unit uLocalizarTitulosRecebidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, DBCtrls, Buttons, Grids, DBGrids,
  Mask, ToolEdit, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  Gauges, DBClient, QRCtrls, QuickRpt, ExtCtrls, Printers, Menus;

type
  TfmLocalizarTitulosRecebidos = class(TfmFormBaseAvancado) 
    Label4: TLabel;
    edtLocalizacao: TDBLookupComboBox;
    Label6: TLabel;
    edtCodigoCliente: TEdit;
    Label1: TLabel;
    edtCodigoEmpresa: TEdit;
    edtNomeCliente: TEdit;
    edtNomeEmpresa: TEdit;
    btnLocalizaCliente: TBitBtn;
    btnLocalizaEmpresa: TBitBtn;
    Label5: TLabel;
    edtCodigoCC: TEdit;
    edtDescricaoCC: TEdit;
    btnLocalizaCC: TBitBtn;
    Label2: TLabel;
    edtDocumento: TEdit;
    Label3: TLabel;
    edtNotaFiscal: TEdit;
    dbgTitulos: TDBGrid;
    lblDataInicial: TLabel;
    lblDataFinal: TLabel;
    edtDataInicial: TDateEdit;
    edtDataFinal: TDateEdit;
    edtHistorico: TEdit;
    Label9: TLabel;
    edtNumeroCheque: TEdit;
    Label10: TLabel;
    btnIr: TBitBtn;
    btnTodos: TBitBtn;
    btnConsultar: TBitBtn;
    btnFechar: TBitBtn;
    dtsTitulos: TDataSource;
    tabTitulos: TZQuery;
    tabLocalizacao: TZQuery;
    dtsLocalizacao: TDataSource;
    tabChecagens: TZQuery;
    lblNumeroTitulos: TLabel;
    lblTotalReceber: TLabel;
    gagProgresso: TGauge;
    tabAuxTitulos: TClientDataSet;
    tabAuxTitulosDocumento: TFloatField;
    tabAuxTitulosNotaFiscal: TStringField;
    tabAuxTitulosNome: TStringField;
    tabAuxTitulosParcela: TIntegerField;
    tabAuxTitulosData: TDateField;
    tabAuxTitulosValorTotal: TCurrencyField;
    tabAuxTitulosTitulo: TFloatField;
    tabAuxTitulosValorLiquidado: TCurrencyField;
    dtsAuxTitulos: TDataSource;
    Label7: TLabel;
    edtCodigoBanco: TEdit;
    edtBanco: TEdit;
    btnLocalizarBanco: TBitBtn;
    btnVisualizar: TBitBtn;
    btnImprimir: TBitBtn;
    pndDialogo: TPrintDialog;
    qrpRecebidos: TQuickRep;
    QRSubDetail1: TQRSubDetail;
    QRDBText3: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    qrlTitulo: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    qrlSignature: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape2: TQRShape;
    QRSysData2: TQRSysData;
    qrlTotal: TQRLabel;
    tabAuxTitulosCodigoConta: TFloatField;
    ckbSinalizado: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnTodosClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCodigoClienteChange(Sender: TObject);
    procedure edtCodigoEmpresaChange(Sender: TObject);
    procedure edtCodigoCCChange(Sender: TObject);
    procedure btnLocalizaClienteClick(Sender: TObject);
    procedure btnLocalizaEmpresaClick(Sender: TObject);
    procedure btnLocalizaCCClick(Sender: TObject);
    procedure btnIrClick(Sender: TObject);
    procedure dbgTitulosDblClick(Sender: TObject);
    procedure edtCodigoBancoChange(Sender: TObject);
    procedure btnLocalizarBancoClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
  public
  end;

var
  fmLocalizarTitulosRecebidos: TfmLocalizarTitulosRecebidos;
  vTotal: real;

implementation

uses uFormBase, uMenu, uConstantes, uLocalizarClientes, uLocalizarGenerico, uTipos,
     uTitulosReceber, DateUtils, uLocalizarCentroCusto;

{$R *.dfm}

procedure TfmLocalizarTitulosRecebidos.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TfmLocalizarTitulosRecebidos.btnConsultarClick(Sender: TObject);
var vWhere: string;
    vTotal: real;
begin
   inherited;

   vTotal:=0;
   vWhere:='';
   tabAuxTitulos.EmptyDataSet;

   if Trim(edtDocumento.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'titulos_receber.Documento = '+edtDocumento.Text;
   end;

   if Trim(edtNotaFiscal.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'titulos_receber.NotaFiscal = '+QuotedStr(edtNotaFiscal.Text);
   end;

   if Trim(edtLocalizacao.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'titulos_receber.CodigoLocalizacao = '+FloatToStr(edtLocalizacao.KeyValue);
   end;

   if Trim(edtCodigoCliente.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'titulos_receber.CodigoConta = '+edtCodigoCliente.Text;
   end;

   if Trim(edtCodigoEmpresa.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'titulos_receber.CodigoEmpresa = '+edtCodigoEmpresa.Text;
   end;

   if Trim(edtCodigoCC.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'titulos_receber.CodigoCentroCusto = '+QuotedStr(edtCodigoCC.Text);
   end;

   if Trim(edtHistorico.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'titulos_receber.Historico LIKE '+QuotedStr('%'+edtCodigoCC.Text+'%');
   end;

   if Trim(edtNumeroCheque.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'titulos_receber.NumeroCheque = '+QuotedStr(edtNumeroCheque.Text);
   end;

   if Trim(edtCodigoBanco.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';   
      vWhere:=vWhere + 'titulos_receber_liquidacoes.TipoLiquida = '+edtCodigoBanco.Text;
   end;

   if (Trim(edtDataInicial.Text) <> '/  /') and (Trim(edtDataFinal.Text) <> '/  /') then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'titulos_receber_liquidacoes.DataLiquida >= '+QuotedStr(FormatDateTime(sis_date_format, edtDataInicial.Date))+' AND titulos_receber_liquidacoes.DataLiquida <= '+QuotedStr(FormatDateTime(sis_date_format, edtDataFinal.Date));
   end;

   if ckbSinalizado.Checked then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'titulos_receber_liquidacoes.Sinalizado = 1';
   end; 

   dbgTitulos.DataSource:=nil;
   lblNumeroTitulos.Caption:='Aguarde...';
   btnIr.Enabled:=False;
   btnTodos.Enabled:=False;
   btnConsultar.Enabled:=False;
   btnFechar.Enabled:=False;
   Application.ProcessMessages;

   try
      tabTitulos.Close;
      tabTitulos.SQL.Clear;
      tabTitulos.SQL.Add('SELECT titulos_receber.Documento, titulos_receber.NotaFiscal, clientes.NomeFantasia AS Nome,');
      tabTitulos.SQL.Add('titulos_receber.Parcela, titulos_receber.ValorTotal, titulos_receber.Titulo, titulos_receber.CodigoConta,');
      tabTitulos.SQL.Add('titulos_receber.ValorTotal, titulos_receber.ValorDesconto, titulos_receber.ValorAcrescimo,');
      tabTitulos.SQL.Add('titulos_receber_liquidacoes.ValorLiquida AS Liquidado,');
      tabTitulos.SQL.Add('titulos_receber_liquidacoes.DataLiquida AS Data');
      tabTitulos.SQL.Add('FROM titulos_receber_liquidacoes');
      tabTitulos.SQL.Add('LEFT JOIN titulos_receber ON titulos_receber.Titulo = titulos_receber_liquidacoes.Titulo');      
      tabTitulos.SQL.Add('LEFT JOIN clientes ON titulos_receber.CodigoConta = clientes.CodigoCliente');
      if Trim(vWhere) <> '' then begin
         tabTitulos.SQL.Add('WHERE');
         tabTitulos.SQL.Add(vWhere);
      end;

      tabTitulos.Open;

      gagProgresso.MaxValue:=tabTitulos.RecordCount;

      tabTitulos.First;
      while not tabTitulos.Eof do begin 

         gagProgresso.Progress:=tabTitulos.RecNo;
         Application.ProcessMessages;

         tabAuxTitulos.Append;
         tabAuxTitulosDocumento.Value:=tabTitulos.FieldByName('Documento').AsFloat;
         tabAuxTitulosNotaFiscal.Value:=tabTitulos.FieldByName('NotaFiscal').AsString;
         tabAuxTitulosNome.Value:=tabTitulos.FieldByName('Nome').AsString;
         tabAuxTitulosParcela.Value:=tabTitulos.FieldByName('Parcela').AsInteger;
         tabAuxTitulosData.Value:=tabTitulos.FieldByName('Data').AsDateTime;
         tabAuxTitulosTitulo.Value:=tabTitulos.FieldByName('Titulo').AsFloat;
         tabAuxTitulosValorTotal.Value:=tabTitulos.FieldByName('Liquidado').AsFloat;
         tabAuxTitulosCodigoConta.Value:=tabTitulos.FieldByName('CodigoConta').AsFloat;
         tabAuxTitulos.Post;

         vTotal:=vTotal + tabAuxTitulosValorTotal.Value;  

         tabTitulos.Next;
      end;

      lblNumeroTitulos.Caption:='Nº de Títulos: '+FloatToStr(tabAuxTitulos.RecordCount);
      lblTotalReceber.Caption:='Total Recebido: '+FormatFloat(sis_curr_format, vTotal);

      tabAuxTitulos.IndexFieldNames:='Data';
      tabAuxTitulos.First;
   finally
      dbgTitulos.DataSource:=dtsAuxTitulos;
      gagProgresso.Progress:=0;
      btnIr.Enabled:=True;
      btnTodos.Enabled:=True;
      btnConsultar.Enabled:=True;
      btnFechar.Enabled:=True;      
   end;
end;

procedure TfmLocalizarTitulosRecebidos.FormShow(Sender: TObject);
begin
   inherited;

   edtNotaFiscal.SetFocus;

   tabAuxTitulos.CreateDataSet;
   tabAuxTitulos.EmptyDataSet;

   tabLocalizacao.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('7')+' ORDER BY Descricao');
   tabLocalizacao.Open;
end;

procedure TfmLocalizarTitulosRecebidos.btnTodosClick(Sender: TObject);
begin
   inherited;
   if Application.MessageBox('Essa Operação pode Demorar um Pouco, Deseja Continuar?', PChar(Application.Title), 36) = 7 then exit;
   edtDocumento.Text:='';
   edtNotaFiscal.Text:='';
   edtLocalizacao.KeyValue:=NULL;
   edtCodigoCliente.Text:='';
   edtCodigoEmpresa.Text:='';
   edtCodigoCC.Text:='';
   edtDataInicial.Clear;
   edtDataFinal.Clear;
   edtHistorico.Text:='';
   edtNumeroCheque.Text:='';
   btnConsultar.Click;
end;

procedure TfmLocalizarTitulosRecebidos.btnFecharClick(Sender: TObject);
begin
   inherited;
   Close;
end;

procedure TfmLocalizarTitulosRecebidos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabLocalizacao.Close;
   tabTitulos.Close;
   tabAuxTitulos.Close;
   inherited;
end;

procedure TfmLocalizarTitulosRecebidos.edtCodigoClienteChange(
  Sender: TObject);
begin
   inherited;
   if Trim(edtCodigoCliente.Text) <> '' then begin
      try
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT CodigoCliente,NomeFantasia FROM clientes WHERE CodigoCliente = '+edtCodigoCliente.Text);
         tabChecagens.Open;
         if tabChecagens.RecordCount > 0 then begin
            edtNomeCliente.Text:=tabChecagens.FieldByName('NomeFantasia').AsString;
          end
         else begin
            edtNomeCliente.Text:='';
         end;
      finally
         tabChecagens.Close;
      end;
    end
   else begin
      edtNomeCliente.Text:='';
   end;
end;

procedure TfmLocalizarTitulosRecebidos.edtCodigoEmpresaChange(
  Sender: TObject);
begin
   inherited;
   if Trim(edtCodigoEmpresa.Text) <> '' then begin
      try
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT CodigoEmpresa,NomeFantasia FROM empresas WHERE CodigoEmpresa = '+edtCodigoEmpresa.Text);
         tabChecagens.Open;
         if tabChecagens.RecordCount > 0 then begin
            edtNomeEmpresa.Text:=tabChecagens.FieldByName('NomeFantasia').AsString;
          end
         else begin
            edtNomeEmpresa.Text:='';
         end;
      finally
         tabChecagens.Close;
      end;
    end
   else begin
      edtNomeEmpresa.Text:='';
   end;
end;

procedure TfmLocalizarTitulosRecebidos.edtCodigoCCChange(Sender: TObject);
begin
   inherited;
   if Trim(edtCodigoCC.Text) <> '' then begin
      try
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT Codigo,Descricao FROM centro_custo WHERE Codigo = '+QuotedStr(edtCodigoCC.Text));
         tabChecagens.Open;
         if tabChecagens.RecordCount > 0 then begin
            edtDescricaoCC.Text:=tabChecagens.FieldByName('Descricao').AsString;
          end
         else begin
            edtDescricaoCC.Text:='';
         end;
      finally
         tabChecagens.Close;
      end;
    end
   else begin
      edtDescricaoCC.Text:='';
   end;
end;

procedure TfmLocalizarTitulosRecebidos.btnLocalizaClienteClick(
  Sender: TObject);
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

procedure TfmLocalizarTitulosRecebidos.btnLocalizaEmpresaClick(
  Sender: TObject);
var vParamLoc: TParametrosLocalizar;  
begin
   inherited;
   vParamLoc.Table:='empresas';
   vParamLoc.KeyField:='CodigoEmpresa';
   vParamLoc.Field1:='NomeFantasia';
   vParamLoc.Filter:='';
   if not Assigned (fmLocalizarGenerico) then begin
      Application.CreateForm(TfmLocalizarGenerico, fmLocalizarGenerico);
      fmLocalizarGenerico.LoadParams(vParamLoc);
      fmLocalizarGenerico.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edtCodigoEmpresa.Text:=fmMenu.pubTrans1;
   end;
end;

procedure TfmLocalizarTitulosRecebidos.btnLocalizaCCClick(Sender: TObject); 
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

procedure TfmLocalizarTitulosRecebidos.btnIrClick(Sender: TObject);
var vFM : TfmTitulosReceber;
begin
   inherited;
   if tabAuxTitulos.RecordCount > 0 then begin
      if not tabAuxTitulosTitulo.IsNull then begin
         fmMenu.pubTrans1:=FloatToStr(tabAuxTitulosTitulo.Value);
         fmMenu.pubTrans2:='2';
         vFM:=TfmTitulosReceber.Create(Self);
         vFM.Show;
      end;
   end;
end;

procedure TfmLocalizarTitulosRecebidos.dbgTitulosDblClick(Sender: TObject);
begin
   inherited;
   btnIr.Click;
end;

procedure TfmLocalizarTitulosRecebidos.edtCodigoBancoChange(Sender: TObject);
begin
   inherited;
   if Trim(edtCodigoBanco.Text) <> '' then begin
      try
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT Codigo,Descricao FROM bancos WHERE Codigo = '+edtCodigoBanco.Text);
         tabChecagens.Open;
         if tabChecagens.RecordCount > 0 then begin
            edtBanco.Text:=tabChecagens.FieldByName('Descricao').AsString;
          end
         else begin
            edtBanco.Text:='';
         end;
      finally
         tabChecagens.Close;
      end;
    end
   else begin
      edtBanco.Text:=''; 
   end;
end;

procedure TfmLocalizarTitulosRecebidos.btnLocalizarBancoClick(
  Sender: TObject);
var vParamLoc: TParametrosLocalizar;  
begin
   inherited;
   vParamLoc.Table:='bancos';
   vParamLoc.KeyField:='Codigo';
   vParamLoc.Field1:='Descricao';
   vParamLoc.Filter:='';
   if not Assigned (fmLocalizarGenerico) then begin
      Application.CreateForm(TfmLocalizarGenerico, fmLocalizarGenerico);
      fmLocalizarGenerico.LoadParams(vParamLoc);
      fmLocalizarGenerico.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edtCodigoBanco.Text:=fmMenu.pubTrans1;
   end; 
end;

procedure TfmLocalizarTitulosRecebidos.btnVisualizarClick(Sender: TObject);
begin
   inherited;
   vTotal:=0;
   if tabAuxTitulos.RecordCount > 0 then begin
      qrpRecebidos.PreviewModal;
   end;
end;

procedure TfmLocalizarTitulosRecebidos.btnImprimirClick(Sender: TObject);
begin
   inherited;
   vTotal:=0;
   if tabAuxTitulos.RecordCount > 0 then begin
      if pndDialogo.Execute then begin
         qrpRecebidos.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
         qrpRecebidos.Print;
      end;
   end;
end;

procedure TfmLocalizarTitulosRecebidos.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   inherited;
   vTotal:=vTotal + tabAuxTitulosValorTotal.Value;
   qrlTotal.Caption:='Total: '+FormatFloat(sis_curr_format, vTotal);
end;

end.

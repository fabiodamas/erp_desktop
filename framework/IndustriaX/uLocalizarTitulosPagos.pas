unit uLocalizarTitulosPagos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, DBCtrls, Buttons, Grids, DBGrids,
  Mask, ToolEdit, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  DBClient, Gauges, QRCtrls, QuickRpt, ExtCtrls, Printers, Menus;

type
  TfmLocalizarTitulosPagos = class(TfmFormBaseAvancado)
    Label4: TLabel;
    edtLocalizacao: TDBLookupComboBox;
    lblTipoConta: TLabel;
    edtCodigoConta: TEdit;
    Label1: TLabel;
    edtCodigoEmpresa: TEdit;
    edtNomeConta: TEdit;
    edtNomeEmpresa: TEdit;
    btnLocalizaConta: TBitBtn;
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
    lblTotalPagar: TLabel;
    tabAuxTitulos: TClientDataSet;
    dtsAuxTitulos: TDataSource;
    tabAuxTitulosDocumento: TFloatField;
    tabAuxTitulosNotaFiscal: TStringField;
    tabAuxTitulosNome: TStringField;
    tabAuxTitulosParcela: TIntegerField;
    tabAuxTitulosData: TDateField;
    tabAuxTitulosValorTotal: TCurrencyField;
    gagProgresso: TGauge;
    tabAuxTitulosTitulo: TFloatField;
    tabAuxTitulosValorLiquidado: TCurrencyField;
    tabFornecedor: TZQuery;
    tabTransportadoras: TZQuery;
    tabFuncionarios: TZQuery;
    tabBancos: TZQuery;
    edtTipoConta: TComboBox;
    Label6: TLabel;
    Label7: TLabel;
    edtCodigoBanco: TEdit;
    edtBanco: TEdit;
    btnLocalizarBanco: TBitBtn;
    qrpPagos: TQuickRep;
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
    btnVisualizar: TBitBtn;
    btnImprimir: TBitBtn;
    pndDialogo: TPrintDialog;
    tabAuxTitulosCodigoConta: TFloatField;
    ckbSinalizado: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnTodosClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCodigoContaChange(Sender: TObject);
    procedure edtCodigoEmpresaChange(Sender: TObject);
    procedure edtCodigoCCChange(Sender: TObject);
    procedure btnLocalizaContaClick(Sender: TObject);
    procedure btnLocalizaEmpresaClick(Sender: TObject);
    procedure btnLocalizaCCClick(Sender: TObject);
    procedure btnIrClick(Sender: TObject);
    procedure dbgTitulosDblClick(Sender: TObject);
    procedure dtsTitulosDataChange(Sender: TObject; Field: TField);
    procedure edtTipoContaCloseUp(Sender: TObject);
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
  fmLocalizarTitulosPagos: TfmLocalizarTitulosPagos;
  vTotal: real;

implementation

uses uFormBase, uMenu, uConstantes, uLocalizarGenerico, uTipos,
     uTitulosPagar, DateUtils, uLocalizarCentroCusto,
  uLocalizarFuncionarios;

{$R *.dfm}

procedure TfmLocalizarTitulosPagos.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TfmLocalizarTitulosPagos.btnConsultarClick(Sender: TObject);
var vWhere: string;
    vTotal: real;
begin
   inherited;

   vTotal:=0;
   vWhere:='';
   tabAuxTitulos.EmptyDataSet;

   if Trim(edtDocumento.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'titulos_pagar.Documento = '+edtDocumento.Text;
   end;

   if Trim(edtNotaFiscal.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'titulos_pagar.NotaFiscal = '+QuotedStr(edtNotaFiscal.Text);
   end;

   if Trim(edtLocalizacao.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'titulos_pagar.CodigoLocalizacao = '+FloatToStr(edtLocalizacao.KeyValue);
   end;

   if Trim(edtCodigoConta.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'titulos_pagar.CodigoConta = '+edtCodigoConta.Text;
   end;

   if Trim(edtCodigoEmpresa.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'titulos_pagar.CodigoEmpresa = '+edtCodigoEmpresa.Text;
   end;

   if Trim(edtCodigoCC.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'titulos_pagar.CodigoCentroCusto = '+QuotedStr(edtCodigoCC.Text);
   end;

   if Trim(edtHistorico.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'titulos_pagar.Historico LIKE '+QuotedStr('%'+edtCodigoCC.Text+'%');
   end;

   if Trim(edtNumeroCheque.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'titulos_pagar.NumeroCheque = '+QuotedStr(edtNumeroCheque.Text);
   end;

   if Trim(edtCodigoBanco.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';   
      vWhere:=vWhere + 'titulos_pagar_liquidacoes.TipoLiquida = '+edtCodigoBanco.Text;
   end;

   if (Trim(edtDataInicial.Text) <> '/  /') and (Trim(edtDataFinal.Text) <> '/  /') then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'titulos_pagar_liquidacoes.DataLiquida >= '+QuotedStr(FormatDateTime(sis_date_format, edtDataInicial.Date))+' AND titulos_pagar_liquidacoes.DataLiquida <= '+QuotedStr(FormatDateTime(sis_date_format, edtDataFinal.Date));
   end;

   if ckbSinalizado.Checked then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + '((titulos_pagar_liquidacoes.Sinalizado = 1) or (titulos_pagar.Sinalizado=1) )';
   end;

   case edtTipoConta.ItemIndex of
      1: begin
         if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
         vWhere:=vWhere + 'TipoConta = '+QuotedStr('1');
      end;
      2: begin
         if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
         vWhere:=vWhere + 'TipoConta = '+QuotedStr('2');
      end;
      3: begin
         if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
         vWhere:=vWhere + 'TipoConta = '+QuotedStr('3');
      end;
      4: begin
         if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
         vWhere:=vWhere + 'TipoConta = '+QuotedStr('4');
      end;
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
      tabTitulos.SQL.Add('SELECT titulos_pagar.Documento, titulos_pagar.NotaFiscal,');
      tabTitulos.SQL.Add('titulos_pagar.Parcela, titulos_pagar.TipoConta, titulos_pagar.Titulo,');
      tabTitulos.SQL.Add('titulos_pagar.CodigoConta,');
      tabTitulos.SQL.Add('titulos_pagar_liquidacoes.ValorLiquida, titulos_pagar_liquidacoes.TipoLiquida,');
      tabTitulos.SQL.Add('titulos_pagar_liquidacoes.DataLiquida AS Data');
      tabTitulos.SQL.Add('FROM titulos_pagar_liquidacoes');
      tabTitulos.SQL.Add('LEFT JOIN titulos_pagar ON titulos_pagar_liquidacoes.Titulo = titulos_pagar.Titulo');      

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
         tabAuxTitulosTitulo.Value:=tabTitulos.FieldByName('Titulo').AsFloat;
         tabAuxTitulosDocumento.Value:=tabTitulos.FieldByName('Documento').AsFloat;
         tabAuxTitulosNotaFiscal.Value:=tabTitulos.FieldByName('NotaFiscal').AsString;
         tabAuxTitulosParcela.Value:=tabTitulos.FieldByName('Parcela').AsInteger;
         tabAuxTitulosData.Value:=tabTitulos.FieldByName('Data').AsDateTime;
         tabAuxTitulosValorTotal.Value:=tabTitulos.FieldByName('ValorLiquida').AsFloat;
         tabAuxTitulosCodigoConta.Value:=tabTitulos.FieldByName('CodigoConta').AsFloat;
         if tabTitulos.FieldByName('TipoConta').AsString = '1' then begin
            tabAuxTitulosNome.Value:=tabFornecedor.FieldByName('NomeFantasia').AsString;
          end
         else if tabTitulos.FieldByName('TipoConta').AsString = '2' then begin
            tabAuxTitulosNome.Value:=tabFuncionarios.FieldByName('Nome').AsString;
          end
         else if tabTitulos.FieldByName('TipoConta').AsString = '3' then begin
            tabAuxTitulosNome.Value:=tabTransportadoras.FieldByName('Nome').AsString;
          end
         else if tabTitulos.FieldByName('TipoConta').AsString = '4' then begin
            tabAuxTitulosNome.Value:=tabBancos.FieldByName('Descricao').AsString;
         end;
         tabAuxTitulos.Post;

         vTotal:=vTotal + tabAuxTitulosValorTotal.Value;

         tabTitulos.Next;
      end;

      lblNumeroTitulos.Caption:='N� de T�tulos: '+FloatToStr(tabAuxTitulos.RecordCount);
      lblTotalPagar.Caption:='Total Pago: '+FormatFloat(sis_curr_format, vTotal);

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

procedure TfmLocalizarTitulosPagos.FormShow(Sender: TObject);
begin
   inherited;

   edtDocumento.SetFocus; 

   tabLocalizacao.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('7')+' ORDER BY Descricao');
   tabLocalizacao.Open;

   tabFornecedor.Params.CreateParam(ftFloat, 'CodigoConta', ptUnknown);
   tabFornecedor.SQL.Add('SELECT CodigoFornecedor, NomeFantasia FROM fornecedores WHERE CodigoFornecedor =:CodigoConta');
   tabFornecedor.Open;

   tabTransportadoras.Params.CreateParam(ftFloat, 'CodigoConta', ptUnknown);
   tabTransportadoras.SQL.Add('SELECT Codigo,Nome FROM transportadoras WHERE Codigo =:CodigoConta');
   tabTransportadoras.Open;

   tabFuncionarios.Params.CreateParam(ftFloat, 'CodigoConta', ptUnknown);
   tabFuncionarios.SQL.Add('SELECT Codigo,Nome FROM funcionarios WHERE Codigo =:CodigoConta');
   tabFuncionarios.Open;

   tabBancos.Params.CreateParam(ftFloat, 'CodigoConta', ptUnknown);
   tabBancos.SQL.Add('SELECT Codigo,Descricao FROM bancos WHERE Codigo = :CodigoConta');
   tabBancos.Open;

   tabAuxTitulos.CreateDataSet;
   tabAuxTitulos.EmptyDataSet;
end;

procedure TfmLocalizarTitulosPagos.btnTodosClick(Sender: TObject);
begin
   inherited;
   if Application.MessageBox('Essa Opera��o pode Demorar um Pouco, Deseja Continuar?', PChar(Application.Title), 36) = 7 then exit;
   edtDocumento.Text:='';
   edtNotaFiscal.Text:='';
   edtLocalizacao.KeyValue:=NULL;
   edtCodigoConta.Text:='';
   edtCodigoEmpresa.Text:='';
   edtCodigoCC.Text:='';
   edtDataInicial.Clear;
   edtDataFinal.Clear;
   edtHistorico.Text:='';
   edtNumeroCheque.Text:='';
   btnConsultar.Click;
end;

procedure TfmLocalizarTitulosPagos.btnFecharClick(Sender: TObject);
begin
   inherited;
   Close;
end;

procedure TfmLocalizarTitulosPagos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabLocalizacao.Close;
   tabTitulos.Close;
   tabAuxTitulos.Close;
   tabFornecedor.Close;
   tabTransportadoras.Close;
   tabFuncionarios.Close;
   tabBancos.Close;
   inherited;
end;

procedure TfmLocalizarTitulosPagos.edtCodigoContaChange(
  Sender: TObject);
begin
   inherited;
   if Trim(edtTipoConta.Text) = '' then exit;
   if Trim(edtCodigoConta.Text) <> '' then begin
      try
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         if edtTipoConta.Text = 'Fornecedor' then begin
            tabChecagens.SQL.Add('SELECT CodigoFornecedor,NomeFantasia FROM fornecedores WHERE CodigoFornecedor = '+edtCodigoConta.Text);
            tabChecagens.Open;
            if tabChecagens.RecordCount > 0 then begin
               edtNomeConta.Text:=tabChecagens.FieldByName('NomeFantasia').AsString;
             end
            else begin
               edtNomeConta.Text:='';
            end;
          end
         else if edtTipoConta.Text = 'Funcion�rio' then begin
            tabChecagens.SQL.Add('SELECT Codigo,Nome FROM funcionarios WHERE Codigo = '+edtCodigoConta.Text);
            tabChecagens.Open;
            if tabChecagens.RecordCount > 0 then begin
               edtNomeConta.Text:=tabChecagens.FieldByName('Nome').AsString;
             end
            else begin
               edtNomeConta.Text:='';
            end;
          end
         else if edtTipoConta.Text = 'Transportadora' then begin
            tabChecagens.SQL.Add('SELECT Codigo,Nome FROM transportadoras WHERE Codigo = '+edtCodigoConta.Text);
            tabChecagens.Open;
            if tabChecagens.RecordCount > 0 then begin
               edtNomeConta.Text:=tabChecagens.FieldByName('Nome').AsString;
             end
            else begin
               edtNomeConta.Text:='';
            end;
          end
         else if edtTipoConta.Text = 'Banco' then begin
            tabChecagens.SQL.Add('SELECT Codigo,Descricao FROM bancos WHERE Codigo = '+edtCodigoConta.Text);
            tabChecagens.Open;
            if tabChecagens.RecordCount > 0 then begin
               edtNomeConta.Text:=tabChecagens.FieldByName('Descricao').AsString;
             end
            else begin
               edtNomeConta.Text:='';
            end;
         end;
      finally
         tabChecagens.Close;
      end;
    end
   else begin
      edtNomeConta.Text:='';
   end;
end;

procedure TfmLocalizarTitulosPagos.edtCodigoEmpresaChange(
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

procedure TfmLocalizarTitulosPagos.edtCodigoCCChange(Sender: TObject);
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

procedure TfmLocalizarTitulosPagos.btnLocalizaContaClick(
  Sender: TObject);
var vParamLoc: TParametrosLocalizar;  
begin
   inherited;
   if Trim(edtTipoConta.Text) = '' then exit;
   if edtTipoConta.Text = 'Fornecedor' then begin
      vParamLoc.Table:='fornecedores';
      vParamLoc.KeyField:='CodigoFornecedor';
      vParamLoc.Field1:='NomeFantasia';
      vParamLoc.Filter:='';
    end
   else if edtTipoConta.Text = 'Funcion�rio' then begin 
      if not Assigned (fmLocalizarFuncionarios) then begin
         Application.CreateForm(TfmLocalizarFuncionarios, fmLocalizarFuncionarios);
         fmLocalizarFuncionarios.ShowModal;
      end;
    end
   else if edtTipoConta.Text = 'Transportadora' then begin
      vParamLoc.Table:='transportadoras';
      vParamLoc.KeyField:='Codigo';
      vParamLoc.Field1:='Nome';
      vParamLoc.Filter:='';
    end
   else if edtTipoConta.Text = 'Banco' then begin
      vParamLoc.Table:='bancos';
      vParamLoc.KeyField:='Codigo';
      vParamLoc.Field1:='Descricao';
      vParamLoc.Filter:='';
   end;
   if edtTipoConta.Text <> 'Funcion�rio' then begin
      if not Assigned (fmLocalizarGenerico) then begin
         Application.CreateForm(TfmLocalizarGenerico, fmLocalizarGenerico);
         fmLocalizarGenerico.LoadParams(vParamLoc);
         fmLocalizarGenerico.ShowModal;
      end;
   end; 
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edtCodigoConta.Text:=fmMenu.pubTrans1;
   end;
end;

procedure TfmLocalizarTitulosPagos.btnLocalizaEmpresaClick(
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

procedure TfmLocalizarTitulosPagos.btnLocalizaCCClick(Sender: TObject);
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

procedure TfmLocalizarTitulosPagos.btnIrClick(Sender: TObject);
var vFM : TfmTitulosPagar;
begin
   inherited;
   if tabAuxTitulos.RecordCount > 0 then begin
      if not tabAuxTitulosTitulo.IsNull then begin
         fmMenu.pubTrans1:=FloatToStr(tabAuxTitulosTitulo.Value);
         fmMenu.pubTrans2:='2';
         fmMenu.pubTituloPagar:=nil; 
         vFM:=TfmTitulosPagar.Create(Self);
         vFM.Show; 
      end;
   end;
end;

procedure TfmLocalizarTitulosPagos.dbgTitulosDblClick(Sender: TObject);
begin
   inherited;
   btnIr.Click;
end;

procedure TfmLocalizarTitulosPagos.dtsTitulosDataChange(Sender: TObject;
  Field: TField);
begin
   inherited;
   if tabTitulos.FieldByName('TipoConta').AsString = '1' then begin
      tabFornecedor.Close;
      tabFornecedor.ParamByName('CodigoConta').AsFloat:=tabTitulos.FieldByName('CodigoConta').AsFloat;
      tabFornecedor.Open;
    end
   else if tabTitulos.FieldByName('TipoConta').AsString = '2' then begin
      tabFuncionarios.Close;
      tabFuncionarios.ParamByName('CodigoConta').AsFloat:=tabTitulos.FieldByName('CodigoConta').AsFloat;
      tabFuncionarios.Open;
    end
   else if tabTitulos.FieldByName('TipoConta').AsString = '3' then begin
      tabTransportadoras.Close;
      tabTransportadoras.ParamByName('CodigoConta').AsFloat:=tabTitulos.FieldByName('CodigoConta').AsFloat;
      tabTransportadoras.Open;
    end
   else if tabTitulos.FieldByName('TipoConta').AsString = '4' then begin
      tabBancos.Close;
      tabBancos.ParamByName('CodigoConta').AsFloat:=tabTitulos.FieldByName('CodigoConta').AsFloat;
      tabBancos.Open;
   end;
end;

procedure TfmLocalizarTitulosPagos.edtTipoContaCloseUp(Sender: TObject);
begin
   inherited;
   edtCodigoConta.Text:='';
   case edtTipoConta.ItemIndex of 
      1: lblTipoConta.Caption:='Fornecedor';
      2: lblTipoConta.Caption:='Funcion�rio';
      3: lblTipoConta.Caption:='Transportadora';
      4: lblTipoConta.Caption:='Banco'; 
   end;
end;

procedure TfmLocalizarTitulosPagos.edtCodigoBancoChange(Sender: TObject);
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

procedure TfmLocalizarTitulosPagos.btnLocalizarBancoClick(Sender: TObject);
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

procedure TfmLocalizarTitulosPagos.btnVisualizarClick(Sender: TObject);
begin
   inherited;
   vTotal:=0;
   if tabAuxTitulos.RecordCount > 0 then begin
      qrpPagos.PreviewModal;
   end;
end;

procedure TfmLocalizarTitulosPagos.btnImprimirClick(Sender: TObject);
begin
   inherited;
   vTotal:=0;
   if tabAuxTitulos.RecordCount > 0 then begin
      if pndDialogo.Execute then begin
         qrpPagos.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
         qrpPagos.Print;
      end;
   end;
end;

procedure TfmLocalizarTitulosPagos.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   inherited;
   vTotal:=vTotal + tabAuxTitulosValorTotal.Value;
   qrlTotal.Caption:='Total: '+FormatFloat(sis_curr_format, vTotal);
end;

end.

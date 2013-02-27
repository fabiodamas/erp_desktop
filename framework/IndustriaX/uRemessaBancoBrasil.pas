unit uRemessaBancoBrasil;

interface 

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, Menus, StdCtrls, Buttons, Mask, ToolEdit,
  ExtCtrls, DB, DBClient, FileCtrl, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, QRCtrls, QuickRpt, Grids, DBGrids, StrUtils;

type
  TfmRemessaBancoBrasil = class(TfmFormBaseAvancado) 
    btnGerar: TBitBtn;
    tabTitulos: TZQuery;
    btnFechar: TBitBtn;
    dbgTitulos: TDBGrid;
    dtsTitulos: TDataSource;
    tabContaBancaria: TZQuery;
    tabClientes: TZQuery;
    tabAuxTitulos: TClientDataSet;
    dtsAuxTitulos: TDataSource;
    tabAuxTitulosSelecionar: TBooleanField;
    tabAuxTitulosDocumento: TFloatField;
    tabAuxTitulosParcela: TIntegerField;
    tabAuxTitulosValorTotal: TCurrencyField;
    tabAuxTitulosTitulo: TFloatField;
    tabAuxTitulosCodigoConta: TFloatField;
    tabAuxTitulosNome: TStringField;
    tabAuxTitulosNotaFiscal: TStringField;
    tabChecagens: TZQuery;
    btnSelecionarTodos: TBitBtn;
    tabConfigPropri: TZQuery;
    tabAuxTitulosDataVencimento: TDateField;
    tabAuxTitulosNossoNumero: TStringField;
    tabAuxTitulosDataEmissao: TDateField;
    SaveDialog1: TSaveDialog;
    tabRemessa: TZQuery;
    lblTotalEnviado: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGerarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSelecionarTodosClick(Sender: TObject);
    procedure dtsAuxTitulosDataChange(Sender: TObject; Field: TField);
    procedure dbgTitulosCellClick(Column: TColumn);
  private
    procedure AtualizarTitulos;
    procedure DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  public
    { Public declarations }
  end;

var
  fmRemessaBancoBrasil: TfmRemessaBancoBrasil; 

implementation 

uses uFormBase, uFuncoes, uConstantes, uEnderecos;

{$R *.dfm}

procedure TfmRemessaBancoBrasil.FormCreate(Sender: TObject); 
begin
   inherited;
   SetFormStyle(fsMDIChild);   
end;

procedure TfmRemessaBancoBrasil.FormClose(Sender: TObject; 
  var Action: TCloseAction);
begin
   tabTitulos.Close;
   tabContaBancaria.Close; 
   tabClientes.Close;
   tabAuxTitulos.Close;
   tabConfigPropri.Close;
   tabRemessa.Close;
   inherited;
end;

procedure TfmRemessaBancoBrasil.btnGerarClick(Sender: TObject);
var vRemessa : TStringList;
    vNumeroSequencial, vNumeroRemessa : Integer;
    vNumeroDocumento : string;
    vTotalQtdLote, vTotalQtdArquivo, vNumeroTitulos : Integer;
    vFileName, vPath : string;
    vValorTotal : real;
    vTotalGerado: real;
begin
   inherited;

   if tabAuxTitulos.RecordCount = 0 then begin
      ShowMessage('Não existem títulos para a geração da remessa.');
      exit;
   end;

   try
      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT MAX(NumeroRemessa) AS MAX_REM FROM remessas_geradas ');
      tabChecagens.SQL.Add('WHERE CodigoConta = 1');
      tabChecagens.Open;

      if tabChecagens.FieldByName('MAX_REM').AsInteger > 0 then begin
         vNumeroRemessa:=tabChecagens.FieldByName('MAX_REM').AsInteger + 1;
       end
      else begin
         vNumeroRemessa:=1;
      end;

   finally
      tabChecagens.Close;
   end;

   vRemessa:=TStringList.Create;
   try
      vRemessa.Clear;

      vNumeroSequencial:=0;
      vNumeroTitulos:=0;
      vValorTotal:=0;
      vTotalGerado:=0;
      vTotalQtdArquivo:=1;

      // Header do Arquivo
      vRemessa.Add('001' + '0000' + '0' + Replicar(' ', 9) + '2' +
      StrZero(Desformatar(tabConfigPropri.FieldByName('Cnpj').AsString), 14) +
      StrZero(tabContaBancaria.FieldByName('Convenio').AsString, 9) + '0014' +
      StrZero(tabContaBancaria.FieldByName('Carteira').AsString, 2) +
      StrZero(tabContaBancaria.FieldByName('VariacaoCarteira').AsString, 3)+Replicar(' ', 2)+
      StrZero(tabContaBancaria.FieldByName('CodigoAgencia').AsString, 5) +
      StrZero(tabContaBancaria.FieldByName('DigitoAgencia').AsString, 1) +
      StrZero(tabContaBancaria.FieldByName('NumeroConta').AsString, 12) +
      StrZero(tabContaBancaria.FieldByName('DigitoConta').AsString, 1) + ' ' +
      Copy(tabConfigPropri.FieldByName('RazaoSocial').AsString+Replicar(' ', 30), 1, 30) +
      Copy('BANCO DO BRASIL S.A.'+Replicar(' ', 30), 1, 30) +
      Replicar(' ', 10) + '1' + FormatDateTime('ddmmyyyy', Now) + FormatDateTime('hhmmss', Now) +
      StrZero('0', 6) + '030' + '00000' + Replicar(' ', 20) + Replicar(' ', 20) +
      Replicar(' ', 29));

      // Header do Lote
      vTotalQtdLote:=1;
      vTotalQtdArquivo:=vTotalQtdArquivo + 1; 

      vRemessa.Add('001' + '0001' + '1' + 'R' + '01' + '00' + '042' + ' ' + '2' +
      StrZero(Desformatar(tabConfigPropri.FieldByName('Cnpj').AsString), 15) +
      StrZero(tabContaBancaria.FieldByName('Convenio').AsString, 9) + '0014' +
      StrZero(tabContaBancaria.FieldByName('Carteira').AsString, 2) +
      StrZero(tabContaBancaria.FieldByName('VariacaoCarteira').AsString, 3) + '  ' {Mudar aqui quando for produção} +
      StrZero(tabContaBancaria.FieldByName('CodigoAgencia').AsString, 5) +
      StrZero(tabContaBancaria.FieldByName('DigitoAgencia').AsString, 1) +
      StrZero(tabContaBancaria.FieldByName('NumeroConta').AsString, 12) +
      StrZero(tabContaBancaria.FieldByName('DigitoConta').AsString, 1) + ' ' +
      Copy(tabConfigPropri.FieldByName('RazaoSocial').AsString+Replicar(' ', 30), 1, 30) +
      Replicar(' ', 40) + Replicar(' ', 40) + StrZero(vNumeroRemessa, 8) + FormatDateTime('ddmmyyyy', Now) +
      Replicar('0', 8) + Replicar(' ', 33)); 

      tabAuxTitulos.First;
      while not tabAuxTitulos.Eof do begin 

         if tabAuxTitulosSelecionar.Value = True then begin

            vNumeroTitulos:=vNumeroTitulos + 1;
            vNumeroSequencial:=vNumeroSequencial + 1;
            vValorTotal:=vValorTotal + tabAuxTitulosValorTotal.Value;
            vTotalGerado:=vTotalGerado + tabAuxTitulosValorTotal.Value;

            if Trim(tabAuxTitulosNotaFiscal.Value) <> '' then begin
               vNumeroDocumento:=tabAuxTitulosNotaFiscal.Value + '-' + IntToStr(tabAuxTitulosParcela.Value);
             end
            else begin
               vNumeroDocumento:=FloatToStr(tabAuxTitulosDocumento.Value) + '-' + IntToStr(tabAuxTitulosParcela.Value);
            end; 

            // Segmento "P"
            vTotalQtdLote:=vTotalQtdLote + 1;
            vTotalQtdArquivo:=vTotalQtdArquivo + 1;

            vRemessa.Add('001' + '0001' + '3' + StrZero(vNumeroSequencial, 5) + 'P' +
                         ' ' + '01' +
                         StrZero(tabContaBancaria.FieldByName('CodigoAgencia').AsString, 5) +
                         StrZero(tabContaBancaria.FieldByName('DigitoAgencia').AsString, 1) +
                         StrZero(tabContaBancaria.FieldByName('NumeroConta').AsString, 12) +
                         StrZero(tabContaBancaria.FieldByName('DigitoConta').AsString, 1) + ' ' +
                         Copy( StrZero(tabContaBancaria.FieldByName('Convenio').AsString, 7) + tabAuxTitulosNossoNumero.Value + Replicar(' ', 20), 1, 20) +
                         '1' + '1' + '1' + '2' + '2' + Copy(vNumeroDocumento+Replicar(' ', 15), 1, 15) +                                                   
                         FormatDateTime('ddmmyyyy', tabAuxTitulosDataVencimento.Value) +
                         StrZero(Round(tabAuxTitulosValorTotal.Value * 100), 15) + '00000' + ' ' +
                         '02' + 'N' + FormatDateTime('ddmmyyyy', tabAuxTitulosDataEmissao.Value) +
                         '2' + '00000000' + '000000000000100' + '0' + '00000000' + '000000000000000' +
                         '000000000000000' + '000000000000000' + Copy(tabAuxTitulosNossoNumero.Value+Replicar(' ', 25), 1, 25) +
                         '1' + StrZero(tabContaBancaria.FieldByName('DiasProtesto').AsString, 2) {Dias Protesto} +
                         '2' + '000' + '09' + StrZero(tabContaBancaria.FieldByName('NumeroContrato').AsString, 10) +
                         ' ');

            vNumeroSequencial:=vNumeroSequencial + 1;

            // Segmento "Q"                     
            vTotalQtdLote:=vTotalQtdLote + 1;
            vTotalQtdArquivo:=vTotalQtdArquivo + 1;

            vRemessa.Add('001' + '0001' + '3' + StrZero(vNumeroSequencial, 5) + 'Q' +
                         ' ' + '01' + IfThen(tabClientes.FieldByName('TipoCliente').AsInteger = 1, '2', '1') +
                         StrZero(Desformatar(tabClientes.FieldByName('CpfCnpj').AsString), 15) +
                         Copy(tabClientes.FieldByName('RazaoSocial').AsString+Replicar(' ', 40), 1, 40) +
                         Copy(tabClientes.FieldByName('Endereco').AsString + ' ' + tabClientes.FieldByName('Numero').AsString + Replicar(' ', 40), 1, 40) + 
                         Copy(tabClientes.FieldByName('Bairro').AsString + Replicar(' ', 15), 1, 15) +
                         StrZero(Desformatar(tabClientes.FieldByName('Cep').AsString), 8) +
                         Copy(LocateCidade(tabClientes.FieldByName('CodigoCidade').AsString)+Replicar(' ', 15), 1, 15) +
                         Copy(tabClientes.FieldByName('Estado').AsString+Replicar(' ', 2), 1, 2) +
                         '0' + Replicar('0', 15) + Replicar(' ', 40) + '000' + Replicar(' ', 20) + Replicar(' ', 8));

            vNumeroSequencial:=vNumeroSequencial + 1;

            // Segmento "R" 
            vTotalQtdLote:=vTotalQtdLote + 1;
            vTotalQtdArquivo:=vTotalQtdArquivo + 1;

            vRemessa.Add('001' + '0001' + '3' + StrZero(vNumeroSequencial, 5) + 'R' +
                         ' ' + '01' + '0' + '00000000' + '000000000000000' + '0' + '00000000' +
                         '000000000000000' + '2' {Cod. Multa} +
                         FormatDateTime('ddmmyyyy', tabAuxTitulosDataVencimento.Value + 1) +
                         '000000000000200' {Valor/Percentual Multa} + Replicar(' ', 10) + // 99
                         Replicar(' ', 40) + Replicar(' ', 40) + Replicar('0', 20) +  // 199
                         '00000000' + '   ' + '     ' + ' ' + Replicar(' ', 12) +
                         ' ' + ' ' + ' ' + Replicar(' ', 9));
         end;

         tabAuxTitulos.Next;
      end;

      vTotalQtdLote:=vTotalQtdLote + 1;
      vTotalQtdArquivo:=vTotalQtdArquivo + 1;

      // Trailer de Lote
      vRemessa.Add('001' + '0001' + '5' + Replicar(' ', 9) + StrZero(vTotalQtdLote, 6) +
                   Replicar('0', 92) + Replicar(' ', 125));

      vTotalQtdArquivo:=vTotalQtdArquivo + 1;

      // Trailer do Arquivo  
      vRemessa.Add('001' + '9999' + '9' + Replicar(' ', 9) + '000001' {Apenas 1 Lote} +
                   StrZero(vTotalQtdArquivo, 6) + '000000' + Replicar(' ', 205));

   finally

      vPath:=LoadConfigBBRemessaPath(GetPathProfileUser);

      if Trim(vPath) <> '' then begin
         if DirectoryExists(vPath) then begin
            SaveDialog1.InitialDir:=vPath;
         end;
      end;

      SaveDialog1.DefaultExt:='.REM';
      SaveDialog1.Title:='Salvando Remessa B.B.';

      vFileName:='CNAB240_' +
                 tabContaBancaria.FieldByName('CodigoAgencia').AsString + '_' +
                 tabContaBancaria.FieldByName('NumeroConta').AsString   + '_' +
                 FormatDateTime('ddmmyyyy', Date) + '_' +
                 IntToStr(vNumeroRemessa) + '.REM';

      SaveDialog1.FileName:=vFileName;

      if SaveDialog1.Execute then begin
         vRemessa.SaveToFile(SaveDialog1.FileName);

         tabAuxTitulos.First;
         while not tabAuxTitulos.Eof do begin
            if tabAuxTitulosSelecionar.Value = True then begin 
               tabChecagens.Close;
               tabChecagens.SQL.Clear;
               tabChecagens.SQL.Add('SELECT * FROM titulos_receber WHERE Titulo = '+FloatToStr(tabAuxTitulosTitulo.Value));
               tabChecagens.Open;
               if tabChecagens.RecordCount = 1 then begin
                  tabChecagens.Edit;
                  tabChecagens.FieldByName('GeradoRemessa').AsString:='Sim';
                  tabChecagens.FieldByName('NumeroRemessa').AsString:=IntToStr(vNumeroRemessa);
                  tabChecagens.Post;
                  tabChecagens.ApplyUpdates;
               end;
            end;
            tabAuxTitulos.Next;
         end;

         tabRemessa.Close;
         tabRemessa.SQL.Clear;
         tabRemessa.SQL.Add('SELECT * FROM remessas_geradas WHERE 0');
         tabRemessa.Open;

         tabRemessa.Append;
         tabRemessa.FieldByName('ID').AsFloat:=CodeGenerator('remessas_geradas', 'ID');
         tabRemessa.FieldByName('CodigoConta').AsFloat:=1;
         tabRemessa.FieldByName('NumeroRemessa').AsString:=IntToStr(vNumeroRemessa);
         tabRemessa.FieldByName('DataGeracao').AsDateTime:=Date;
         tabRemessa.FieldByName('Formato').AsString:='CNAB240';
         tabRemessa.FieldByName('QtdTitulos').AsInteger:=vNumeroTitulos;
         tabRemessa.FieldByName('ValorTotal').AsFloat:=vValorTotal;
         tabRemessa.Post;
         tabRemessa.ApplyUpDates;

         SaveConfigBBRemessaPath(vFileName, GetPathProfileUser);
         AtualizarTitulos;

         lblTotalEnviado.Caption:='Gerado: '+FormatFloat(sis_curr_format, vTotalGerado);
      end;
      
      vRemessa.Free; 
   end;
end;

procedure TfmRemessaBancoBrasil.btnFecharClick(Sender: TObject);
begin
   inherited;
   Close;
end;

procedure TfmRemessaBancoBrasil.AtualizarTitulos;
begin
   tabAuxTitulos.EmptyDataSet;

   tabTitulos.Close;
   tabTitulos.SQL.Clear;
   tabTitulos.SQL.Add('SELECT * ');
   tabTitulos.SQL.Add('FROM titulos_receber');
   tabTitulos.SQL.Add('WHERE NossoNumero IS NOT NULL ');
   tabTitulos.SQL.Add('AND NossoNumero <> '+QuotedStr(''));
   tabTitulos.SQL.Add('AND GeradoRemessa = '+QuotedStr('Não'));
   tabTitulos.Open;

   tabTitulos.First;
   while not tabTitulos.Eof do begin

      Application.ProcessMessages;

      tabAuxTitulos.Append;
      tabAuxTitulosTitulo.Value:=tabTitulos.FieldByName('Titulo').AsFloat;
      tabAuxTitulosDocumento.Value:=tabTitulos.FieldByName('Documento').AsFloat;
      tabAuxTitulosNotaFiscal.Value:=tabTitulos.FieldByName('NotaFiscal').AsString;
      tabAuxTitulosParcela.Value:=tabTitulos.FieldByName('Parcela').AsInteger;
      tabAuxTitulosDataVencimento.Value:=tabTitulos.FieldByName('DataVencimento').AsDateTime;
      tabAuxTitulosCodigoConta.Value:=tabTitulos.FieldByName('CodigoConta').AsFloat;
      tabAuxTitulosValorTotal.Value:=tabTitulos.FieldByName('ValorTotal').AsFloat;
      tabAuxTitulosNossoNumero.Value:=tabTitulos.FieldByName('NossoNumero').AsString;
      tabAuxTitulosDataEmissao.Value:=tabTitulos.FieldByName('DataEmissao').AsDateTime;

      try
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT NomeFantasia FROM clientes WHERE CodigoCliente = '+FloatToStr(tabAuxTitulosCodigoConta.Value));
         tabChecagens.Open;
         tabAuxTitulosNome.Value:=tabChecagens.FieldByName('NomeFantasia').AsString;
      finally
         tabChecagens.Close;
      end;
      tabAuxTitulos.Post;

      tabTitulos.Next; 
   end;
end;

procedure TfmRemessaBancoBrasil.FormShow(Sender: TObject);
begin
   inherited;
   dbgTitulos.OnDrawColumnCell:=DrawColumnCell;

   tabClientes.Params.CreateParam(ftFloat, 'CodigoCliente', ptUnknown);
   tabClientes.SQL.Add('SELECT * FROM clientes WHERE CodigoCliente = :CodigoCliente');
   tabClientes.Open;

   tabAuxTitulos.CreateDataSet;
   tabAuxTitulos.EmptyDataSet;

   tabContaBancaria.SQL.Add('SELECT * FROM contas_bancarias ');
   tabContaBancaria.SQL.Add('WHERE ID = 1'); // *** banco do Brasil ***
   tabContaBancaria.Open;

   tabConfigPropri.SQL.Add('SELECT RazaoSocial,Cnpj FROM configuracoes_proprietario');
   tabConfigPropri.Open; 

   AtualizarTitulos; 
end;

procedure TfmRemessaBancoBrasil.DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var vCheck : Integer;
    R : TRect;
begin
   inherited;
   if dbgTitulos.DataSource <> nil then begin
      if Column.FieldName = 'Selecionar' then begin
         dbgTitulos.Canvas.FillRect(Rect);
         if tabAuxTitulosSelecionar.Value = True then vCheck := DFCS_CHECKED else vCheck := 0;
         R:=Rect;
         InflateRect(R, -2, -2); {Diminue o tamanho do CheckBox}
         DrawFrameControl(dbgTitulos.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or vCheck);
      end;
   end;
end;

procedure TfmRemessaBancoBrasil.btnSelecionarTodosClick(Sender: TObject);
begin
   inherited;
   if tabAuxTitulos.RecordCount > 0 then begin
      try
         //dbgTitulos.DataSource:=nil;
         tabAuxTitulos.First;
         while not tabAuxTitulos.Eof do begin

            tabAuxTitulos.Edit;
            tabAuxTitulosSelecionar.Value:=True;
            tabAuxTitulos.Post;
      
            tabAuxTitulos.Next;
         end;
      finally
         //dbgTitulos.DataSource:=dtsAuxTitulos;
      end; 
   end;
end;

procedure TfmRemessaBancoBrasil.dtsAuxTitulosDataChange(Sender: TObject;
  Field: TField);
begin
   inherited;
   if tabAuxTitulos.Active = True then begin 
      tabClientes.Close;
      tabClientes.ParamByName('CodigoCliente').AsFloat:=tabAuxTitulosCodigoConta.Value;
      tabClientes.Open;
   end;
end;

procedure TfmRemessaBancoBrasil.dbgTitulosCellClick(Column: TColumn); 
begin
   inherited;
   if Column.FieldName = 'Selecionar' then begin
      tabAuxTitulos.Edit;
      if tabAuxTitulosSelecionar.Value = True then begin
         tabAuxTitulosSelecionar.Value:=False;
       end
      else begin
         tabAuxTitulosSelecionar.Value:=True;
      end;
      tabAuxTitulos.Post;
   end;
end;

end.

unit uRetornoBancoBrasil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, Menus, StdCtrls, Buttons, Mask, ToolEdit,
  ExtCtrls, DB, DBClient, FileCtrl, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, QRCtrls, QuickRpt;

type
  TfmRetornoBancoBrasil = class(TfmFormBaseAvancado)
    btnVisualizar: TBitBtn;
    edtDiretorioArquivos: TDirectoryEdit;
    rdgLayout: TRadioGroup;
    tabAuxRetorno: TClientDataSet;
    tabAuxRetornoNumeroDocumento: TStringField;
    tabAuxRetornoSeuNumero: TStringField;
    tabAuxRetornoCarteira: TStringField;
    tabAuxRetornoNossoNumero: TStringField;
    tabAuxRetornoDataVencimento: TDateField;
    flbArquivos: TFileListBox;
    edtLoadFile: TMemo;
    edtExtensao: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    tabTitulos: TZQuery;
    tabAuxRetornoValorRecebido: TCurrencyField;
    tabAuxRetornoDataCredito: TDateField;
    btnGravar: TBitBtn;
    dtsAuxRetorno: TDataSource;
    qrpRetorno: TQuickRep;
    QRSubDetail1: TQRSubDetail;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    qrlTitulo: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    qrlSignature: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape2: TQRShape;
    QRSysData2: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    qrlTotal: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    tabAuxRetornoAbatimento: TCurrencyField;
    tabAuxRetornoDescontos: TCurrencyField;
    QRDBText6: TQRDBText;
    tabTitulosLiquidacoes: TZQuery;
    tabContasBancarias: TZQuery;
    QRLabel8: TQRLabel;
    QRDBText8: TQRDBText;
    tabAuxRetornoMoraJuros: TCurrencyField;
    btnFechar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edtDiretorioArquivosChange(Sender: TObject);
    procedure edtExtensaoChange(Sender: TObject);
    procedure flbArquivosClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrpRetornoBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure btnFecharClick(Sender: TObject);
  private
    procedure LerRetorno240(pRetorno: TStringList);
  public
    { Public declarations }
  end;

var
  fmRetornoBancoBrasil: TfmRetornoBancoBrasil;
  vTotalCredito: real;
  vTotalAbatimento: real;
  vTotalDesconto : real;

implementation 

uses uFormBase, uConstantes, uFuncoes;

{$R *.dfm}

procedure TfmRetornoBancoBrasil.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TfmRetornoBancoBrasil.LerRetorno240(pRetorno: TStringList);
var vTempData, vLinha, vCedente, vCNPJCPF,
    vSeuNumero, vNumeroDocumento, vCarteira, vNossoNumero : String;
    vContLinha : Integer;
    vVencimento, vDataCredito, vDataOcorrencia : TDate;
    vValorDocumento, vValorDespesaCobranca, vValorIOF, vValorAbatimento,
    vValorDesconto, vValorMoraJuros, vValorOutrosCreditos, vValorRecebido : real;
begin
   tabAuxRetorno.EmptyDataSet;
   vContLinha := 0;

   if Copy(pRetorno.Strings[0], 1, 3) <> '001' then begin
      raise Exception.Create('Arquivo não é um arquivo de retorno do Banco do Brasil.');
   end;

   vCedente:=Trim(Copy(pRetorno[0], 73, 30));
   vCNPJCPF:=Copy(pRetorno[0], 19, 14); 

   for vContLinha:=1 to (pRetorno.Count-2) do begin

      vLinha := pRetorno[vContLinha];

      if Copy(vLinha, 8, 1) <> '3' then begin 
         // verifica se o registro (linha) é um registro detalhe (segmento J)
         Continue;
      end;

      if Copy(vLinha, 14, 1) = 'T' then begin
         vSeuNumero:=Copy(vLinha, 106, 25);
         vNumeroDocumento:=Copy(vLinha, 59, 15);
         vCarteira:=Copy(vLinha, 58, 1);
         vTempData:=Copy(vLinha, 74, 2) + '/'+ Copy(vLinha, 76, 2)+'/'+Copy(vLinha, 78, 4);
         if vTempData <> '00/00/0000' then begin 
            vVencimento:=StrToDateTimeDef(vTempData, 0); // 'DDMMYY'
         end; 
         vValorDocumento:=StrToFloatDef(Copy(vLinha, 82, 15), 0) / 100;
         vNossoNumero:=Copy(vLinha, 38, 20);
         vValorDespesaCobranca := StrToFloatDef(Copy(vLinha, 199, 15), 0) / 100;
       end
      else begin // segmento U
         vValorIOF            := StrToFloatDef(copy(vLinha, 63,  15), 0) / 100;
         vValorAbatimento     := StrToFloatDef(copy(vLinha, 48,  15), 0) / 100;
         vValorDesconto       := StrToFloatDef(copy(vLinha, 33,  15), 0) / 100;
         vValorMoraJuros      := StrToFloatDef(copy(vLinha, 18,  15), 0) / 100;
         vValorOutrosCreditos := StrToFloatDef(copy(vLinha, 108, 15), 0) / 100;
         vValorRecebido       := StrToFloatDef(copy(vLinha, 78,  15), 0) / 100;
         vTempData := Copy(vLinha, 138, 2)+'/'+copy(vLinha, 140, 2)+'/'+copy(vLinha, 142, 4);
         if vTempData <> '00/00/0000' then begin
            vDataOcorrencia := StrToDateTimeDef(vTempData, 0); //'DDMMYY'  
         end;
         vTempData := Copy(vLinha, 146, 2)+'/'+copy(vLinha, 148, 2)+'/'+copy(vLinha, 150, 4);
         if vTempData <> '00/00/0000' then begin
            vDataCredito := StrToDateTimeDef(vTempData, 0);
         end;

         if (vDataCredito <> 0) and (vValorRecebido > 0) then begin 
            tabAuxRetorno.Append;
            tabAuxRetornoNumeroDocumento.Value:=vNumeroDocumento;
            tabAuxRetornoSeuNumero.Value:=vSeuNumero;
            tabAuxRetornoCarteira.Value:=vCarteira;
            tabAuxRetornoNossoNumero.Value:=vNossoNumero; 
            if not VarIsNull(vVencimento) then begin
               tabAuxRetornoDataVencimento.Value:=vVencimento;
            end; 
            tabAuxRetornoValorRecebido.Value:=vValorRecebido;
            if vDataCredito <> 0 then begin
               tabAuxRetornoDataCredito.Value:=vDataCredito;
            end;
            tabAuxRetornoAbatimento.Value:=vValorAbatimento;
            tabAuxRetornoDescontos.Value:=vValorDesconto;
            tabAuxRetornoMoraJuros.Value:=vValorMoraJuros;
            tabAuxRetorno.Post;
         end;
      end;
   end;

   if tabAuxRetorno.RecordCount > 0 then begin
      btnGravar.Enabled:=True;
    end
   else begin
      btnGravar.Enabled:=False;
   end;
end;

procedure TfmRetornoBancoBrasil.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabAuxRetorno.Close;
   tabTitulos.Close;
   tabTitulosLiquidacoes.Close;
   tabContasBancarias.Close;
   inherited;
end;

procedure TfmRetornoBancoBrasil.FormShow(Sender: TObject);
var vPath : string;
begin
   inherited;
   tabAuxRetorno.CreateDataSet;
   tabAuxRetorno.EmptyDataSet;

   tabContasBancarias.SQL.Add('SELECT * FROM contas_bancarias WHERE ID = 1');
   tabContasBancarias.Open;

   vPath:=LoadConfigBBRetornoPath(GetPathProfileUser);

   if Trim(vPath) <> '' then begin
      if DirectoryExists(vPath) then begin
         edtDiretorioArquivos.Text:=vPath;
      end;
   end;
end;

procedure TfmRetornoBancoBrasil.edtDiretorioArquivosChange( 
  Sender: TObject);
begin
   inherited;
   if DirectoryExists(edtDiretorioArquivos.Text) then begin
      flbArquivos.Mask:=edtExtensao.Text;
      flbArquivos.ApplyFilePath(edtDiretorioArquivos.Text);  
   end;   
end;

procedure TfmRetornoBancoBrasil.edtExtensaoChange(Sender: TObject);
begin
   inherited;
   if DirectoryExists(edtDiretorioArquivos.Text) then begin
      flbArquivos.Mask:=edtExtensao.Text;
      flbArquivos.ApplyFilePath(edtDiretorioArquivos.Text); 
   end;
end;

procedure TfmRetornoBancoBrasil.flbArquivosClick(Sender: TObject);
var vPath : string;
begin
   inherited;
   vPath:=edtDiretorioArquivos.Text + '\' + flbArquivos.Items.Strings[flbArquivos.ItemIndex];
   if FileExists(vPath) then begin
      edtLoadFile.Lines.Clear;
      edtLoadFile.Lines.LoadFromFile(vPath);
   end;
end;

procedure TfmRetornoBancoBrasil.btnGravarClick(Sender: TObject);
var vBaixas, vParc, vPos : Integer;
    vDoc, vOrigem, vDestino : string;
begin
   inherited;
   vBaixas:=0;
   tabAuxRetorno.First;
   while not tabAuxRetorno.Eof do begin
      
      tabTitulos.Close;
      tabTitulos.SQL.Clear;

      if Trim(tabAuxRetornoSeuNumero.Value) <> '' then begin
         tabTitulos.SQL.Add('SELECT * FROM titulos_receber ');
         tabTitulos.SQL.Add('WHERE NossoNumero = '+QuotedStr(tabAuxRetornoSeuNumero.Value));
         tabTitulos.SQL.Add('AND DataPagamento IS NULL ');
         tabTitulos.SQL.Add('AND PedidoVenda = 1 ');
       end
      else begin
         vParc:=0;
         vPos:=Pos('-', tabAuxRetornoNumeroDocumento.Value);
         if vPos > 0 then begin
            vDoc:=Copy(tabAuxRetornoNumeroDocumento.Value, 1, vPos-1);
            vParc:=StrToInt(Copy(tabAuxRetornoNumeroDocumento.Value, vPos+1, Length(tabAuxRetornoNumeroDocumento.Value)));
          end
         else begin
            vParc:=1;
            vDoc:=tabAuxRetornoNumeroDocumento.Value;  
         end;
         tabTitulos.SQL.Add('SELECT * FROM titulos_receber ');
         tabTitulos.SQL.Add('WHERE NotaFiscal = '+QuotedStr(vDoc));
         tabTitulos.SQL.Add('AND Parcela = '+QuotedStr(IntToStr(vParc)));
         tabTitulos.SQL.Add('AND PedidoVenda = 1 '); 
         tabTitulos.SQL.Add('AND DataPagamento IS NULL ');           
      end;

      tabTitulos.Open;
      
      if tabTitulos.RecordCount = 1 then begin

         // Coloca o Acréscimo (Juros) se houver.
         if tabAuxRetornoMoraJuros.Value > 0 then begin
            tabTitulos.Edit;
            tabTitulos.FieldByName('ValorAcrescimo').AsFloat:=tabTitulos.FieldByName('ValorAcrescimo').AsFloat + tabAuxRetornoMoraJuros.Value; 
            tabTitulos.Post;
            tabTitulos.ApplyUpdates; 
         end;

         tabTitulosLiquidacoes.Close;
         tabTitulosLiquidacoes.SQL.Clear;
         tabTitulosLiquidacoes.SQL.Add('SELECT * FROM titulos_receber_liquidacoes WHERE 0');
         tabTitulosLiquidacoes.Open;

         tabTitulosLiquidacoes.Append;
         tabTitulosLiquidacoes.FieldByName('ID').AsFloat:=CodeGenerator('titulos_receber_liquidacoes', 'ID');
         tabTitulosLiquidacoes.FieldByName('Titulo').AsFloat:=tabTitulos.FieldByName('Titulo').AsFloat;
         tabTitulosLiquidacoes.FieldByName('TipoLiquida').AsFloat:=tabContasBancarias.FieldByName('CodigoBancoRetorno').AsFloat; // ???????
         tabTitulosLiquidacoes.FieldByName('DataLiquida').AsDateTime:=tabAuxRetornoDataCredito.Value;
         tabTitulosLiquidacoes.FieldByName('ValorLiquida').AsFloat:=tabAuxRetornoValorRecebido.Value;
         tabTitulosLiquidacoes.Post;
         tabTitulosLiquidacoes.ApplyUpDates;  

         tabTitulosLiquidacoes.Close;   
         tabTitulosLiquidacoes.SQL.Clear;
         tabTitulosLiquidacoes.SQL.Add('SELECT SUM(ValorLiquida) AS VlrTot ');
         tabTitulosLiquidacoes.SQL.Add('FROM titulos_receber_liquidacoes ');
         tabTitulosLiquidacoes.SQL.Add('WHERE Titulo = '+QuotedStr(tabTitulos.FieldByName('Titulo').AsString));
         tabTitulosLiquidacoes.Open;

         if RoundReal(tabTitulosLiquidacoes.FieldByName('VlrTot').AsFloat, 2) >=
            RoundReal((tabTitulos.FieldByName('ValorTotal').AsFloat-tabTitulos.FieldByName('ValorDesconto').AsFloat)+tabTitulos.FieldByName('ValorAcrescimo').AsFloat, 2) then begin
            tabTitulos.Edit;
            tabTitulos.FieldByName('DataPagamento').AsDateTime:=tabAuxRetornoDataCredito.Value;  
            tabTitulos.Post;
            tabTitulos.ApplyUpDates; 
            vBaixas:=vBaixas + 1;
         end;
      end; 
      
      tabAuxRetorno.Next; 
   end;

   SaveConfigBBRetornoPath(edtDiretorioArquivos.Text, GetPathProfileUser);

   if vBaixas > 0 then begin
      ShowMessage('Qtd de Baixas Efetuadas: '+IntToStr(vBaixas)+'.');
      // Copiar o arquivo processado para ..\Processados
      vOrigem:=edtDiretorioArquivos.Text + '\' + flbArquivos.Items.Strings[flbArquivos.ItemIndex];
      vDestino:=edtDiretorioArquivos.Text+'\Processados\' + flbArquivos.Items.Strings[flbArquivos.ItemIndex];
      if not DirectoryExists(edtDiretorioArquivos.Text+'\Processados\') then begin
         ForceDirectories(edtDiretorioArquivos.Text+'\Processados\');
      end;
      MoveFile(PChar(vOrigem), PChar(vDestino));
      edtDiretorioArquivosChange(Self);    
      // ---------------------------------------------------------------
    end
   else begin
      ShowMessage('Nenhuma Baixa Efetuada.');
   end;
end;

procedure TfmRetornoBancoBrasil.btnVisualizarClick(Sender: TObject);
var vList : TStringList;
begin
   inherited;
   if flbArquivos.ItemIndex >= 0 then begin
      vList:=TStringList.Create;
      try
         vList.AddStrings(edtLoadFile.Lines);
         LerRetorno240(vList);
         if tabAuxRetorno.RecordCount > 0 then begin
            qrlTitulo.Caption:='Retorno Banco do Brasil - Arquivo: '+flbArquivos.Items.Strings[flbArquivos.ItemIndex];
            vTotalCredito:=0;
            vTotalAbatimento:=0;
            vTotalDesconto:=0;
            qrpRetorno.Preview;
          end
         else begin
            ShowMessage('Nenhum Retorno no Arquivo: ' +flbArquivos.Items.Strings[flbArquivos.ItemIndex]);
         end;
      finally
         vList.Free;
      end;
   end;
end;

procedure TfmRetornoBancoBrasil.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   inherited;
   vTotalAbatimento:=vTotalAbatimento + tabAuxRetornoAbatimento.Value;
   vTotalDesconto:=vTotalDesconto + tabAuxRetornoDescontos.Value;
   vTotalCredito:=vTotalCredito + tabAuxRetornoValorRecebido.Value;
   qrlTotal.Caption:='Total Abatimento: '+FormatFloat(sis_curr_format, vTotalAbatimento)+' - Total Desconto: '+FormatFloat(sis_curr_format, vTotalDesconto)+' - Total Recebido: '+FormatFloat(sis_curr_format, vTotalCredito);
end;

procedure TfmRetornoBancoBrasil.qrpRetornoBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   inherited;
   vTotalCredito:=0;
   vTotalAbatimento:=0;  
   vTotalDesconto:=0;
end;

procedure TfmRetornoBancoBrasil.btnFecharClick(Sender: TObject);
begin
   inherited;
   Close;
end;

end.

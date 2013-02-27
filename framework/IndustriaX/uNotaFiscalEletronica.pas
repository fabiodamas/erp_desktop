unit uNotaFiscalEletronica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, ToolEdit, Buttons, Gauges, Mask,
  DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Menus;

type
  TfmNotaFiscalEletronica = class(TfmFormBaseAvancado)
    lblDataFinal: TLabel;
    edtDataAtual: TDateEdit;
    Label1: TLabel;
    gagProgresso: TGauge;
    btnGerarArquivo: TBitBtn;
    btnFechar: TBitBtn;
    edtPasta: TDirectoryEdit;
    edtNotaInicial: TEdit;
    edtNotaFinal: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    dtsFatura: TDataSource;
    tabFatura: TZQuery;
    tabFaturaProdutos: TZQuery;
    tabCFOP: TZQuery;
    tabClientes: TZQuery;
    tabConfigPropri: TZQuery;
    tabProdutos: TZQuery;
    dtsFaturaProdutos: TDataSource;
    dtsProdutos: TDataSource;
    tabUnidades: TZQuery;
    edtPreenchimentos: TMemo;
    tabTransportadora: TZQuery;
    tabVenctosFatura: TZQuery;
    tabFornecedores: TZQuery;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnGerarArquivoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtsFaturaDataChange(Sender: TObject; Field: TField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dtsFaturaProdutosDataChange(Sender: TObject; Field: TField);
    procedure dtsProdutosDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmNotaFiscalEletronica: TfmNotaFiscalEletronica;

implementation

uses uFormBase, uFuncoes, uConstantes, uEnderecos;

{$R *.dfm}

procedure TfmNotaFiscalEletronica.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TfmNotaFiscalEletronica.btnFecharClick(Sender: TObject);
begin
   inherited;
   Close;
end;

procedure TfmNotaFiscalEletronica.btnGerarArquivoClick(Sender: TObject);
var vStringList: TStringList;
    vArquivo : string;
    vQtdNotas, vQtdProd, vCnt: integer;
    vTipoNota: string;
    vDestRazao, vDestIE, vDestEmail, vDestCpfCnpj, vDestEnd, vDestNum,
    vDestCompl, vDestBairro, vDestCodMun, vDestCidade, vDestEstado, vDestCep,
    vDestCodPais, vDestPais, vDestTelefone: string;
    vDesconto, vFrete, vSeguro: string;
    vTipoConta: boolean;
    vAprov : real;
    vAprovTexto: string;
    vPesoL, vPesoB: string;
    vNCM, vUnidade: string;
begin
   inherited;

   if (Trim(edtNotaInicial.Text) = '') and (Trim(edtNotaFinal.Text) = '') then begin
      ShowMessage('Obrigatório Preenchimento do Período das Notas');
      edtNotaInicial.SetFocus;
      exit;
   end;

   if (Trim(edtDataAtual.Text) = '/  /') then begin
      ShowMessage('Obrigatório Preenchimento da Data Atual');
      edtDataAtual.SetFocus;
      exit;
   end;

   if Trim(edtPasta.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Pasta de Destino');
      edtPasta.SetFocus;
      exit;
   end;

   vQtdNotas:=0;
   //vAprov:=0;
   edtPreenchimentos.Lines.Clear;
   vStringList:=TStringList.Create;

   tabFatura.Close;
   tabFatura.SQL.Clear;
   tabFatura.SQL.Add('SELECT * ');
   tabFatura.SQL.Add('FROM faturamento');
   tabFatura.SQL.Add('WHERE Data = '+QuotedStr(FormatDateTime(sis_date_format, edtDataAtual.Date)));
   tabFatura.Open;

   gagProgresso.MaxValue:=tabFatura.RecordCount;  

   vStringList.Clear;

   // * Importante para a Formatação *
   DecimalSeparator:='.';

   try
      tabFatura.First;
      while not tabFatura.Eof do begin

         gagProgresso.Progress:=tabFatura.RecNo;
         Application.ProcessMessages;

         if (tabFatura.FieldByName('Fatura').AsInteger < StrToInt(edtNotaInicial.Text)) or
            (tabFatura.FieldByName('Fatura').AsInteger > StrToInt(edtNotaFinal.Text)) then begin
            tabFatura.Next;
            Continue;
         end;

         if tabFatura.FieldByName('TipoNota').AsFloat = 1 then begin
            vTipoNota:='1';                   // No Emissor: 0 Entrada, 1 Saida
          end                                 // No Sistema: 1 Saída,   2 Entrada
         else if tabFatura.FieldByName('TipoNota').AsFloat = 2 then begin
            vTipoNota:='0';
         end;

         vStringList.Add('A|2.00|'); 
         vStringList.Add('B|'   + CodigoEstado(tabConfigPropri.FieldByName('Estado').AsString) + '|' + '|' + RemoverAcentos( tabCFOP.FieldByName('NaturezaOperacao').AsString) + '|' + tabFatura.FieldByName('NFEFormaPagto').AsString + '|55|' + tabFatura.FieldByName('Serie').AsString + '|' + tabFatura.FieldByName('Fatura').AsString + '|' + FormatDateTime('yyyy-MM-dd', tabFatura.FieldByName('Data').AsDateTime) + '|' + '|' + '|' + vTipoNota + '|' + tabConfigPropri.FieldByName('CodigoCidade').AsString + '|1|1||1|1|3||');
         vStringList.Add('C|'   + RemoverAcentos(tabConfigPropri.FieldByName('RazaoSocial').AsString) + '|' + RemoverAcentos(tabConfigPropri.FieldByName('NomeFantasia').AsString) + '|' + Desformatar(tabConfigPropri.FieldByName('IE').AsString) + '|' + '|' + '|' + '|' + IntToStr(tabConfigPropri.FieldByName('CRT').AsInteger) + '|');
         vStringList.Add('C02|' + Desformatar(tabConfigPropri.FieldByName('CNPJ').AsString) + '|');
         vStringList.Add('C05|' + RemoverAcentos(tabConfigPropri.FieldByName('Endereco').AsString) + '|' + tabConfigPropri.FieldByName('Numero').AsString + '|' + '|' + RemoverAcentos(tabConfigPropri.FieldByName('Bairro').AsString) + '|' + tabConfigPropri.FieldByName('CodigoCidade').AsString + '|' + LocateCidade(tabConfigPropri.FieldByName('CodigoCidade').AsString) + '|' + tabConfigPropri.FieldByName('Estado').AsString + '|' + Desformatar(tabConfigPropri.FieldByName('Cep').AsString) + '|' + tabConfigPropri.FieldByName('CodigoPais').AsString + '|' + LocatePais(tabConfigPropri.FieldByName('CodigoPais').AsString) + '|' + Desformatar(tabConfigPropri.FieldByName('Telefone').AsString) + '|');

         if tabFatura.FieldByName('TipoTela').AsFloat = 1 then begin
            // Cliente
            if tabClientes.FieldByName('TipoCliente').AsInteger = 1 then begin
               vTipoConta:=True;
               vDestIE:=Desformatar(tabClientes.FieldByName('IeRG').AsString);
             end
            else begin
               vTipoConta:=False;
               vDestIE:='ISENTO'; 
            end;
            vDestCpfCnpj:=Desformatar(tabClientes.FieldByName('CpfCnpj').AsString);
            vDestRazao:=Copy(RemoverAcentos(tabClientes.FieldByName('RazaoSocial').AsString), 1, 60);
            vDestEmail:=tabClientes.FieldByName('EmailNfeXML').AsString;
            vDestEnd:=RemoverAcentos(tabClientes.FieldByName('Endereco').AsString);
            vDestNum:=RemoverAcentos(tabClientes.FieldByName('Numero').AsString);
            vDestCompl:=RemoverAcentos(tabClientes.FieldByName('Complemento').AsString);
            vDestBairro:=RemoverAcentos(tabClientes.FieldByName('Bairro').AsString);
            vDestCodMun:=tabClientes.FieldByName('CodigoCidade').AsString;
            vDestCidade:=LocateCidade(tabClientes.FieldByName('CodigoCidade').AsString);
            vDestEstado:=tabClientes.FieldByName('Estado').AsString;
            vDestCep:=Trim(Desformatar(tabClientes.FieldByName('Cep').AsString));
            vDestCodPais:=tabClientes.FieldByName('CodigoPais').AsString;
            vDestPais:=LocatePais(tabClientes.FieldByName('CodigoPais').AsString);
            vDestTelefone:=Desformatar(Trim(tabClientes.FieldByName('Telefone1').AsString));
          end
         else begin
            // Fornecedor
            if tabFornecedores.FieldByName('TipoFornecedor').AsInteger = 1 then begin
               vTipoConta:=True;
               vDestIE:=Desformatar(tabFornecedores.FieldByName('IeRG').AsString);
             end
            else begin
               vTipoConta:=False;
               vDestIE:='ISENTO';
            end;
            vDestCpfCnpj:=Desformatar(tabFornecedores.FieldByName('CpfCnpj').AsString);
            vDestRazao:=Copy(RemoverAcentos(tabFornecedores.FieldByName('RazaoSocial').AsString), 1, 60);
            vDestEmail:=tabFornecedores.FieldByName('EmailNfeXML').AsString;
            vDestEnd:=RemoverAcentos(tabFornecedores.FieldByName('Endereco').AsString);
            vDestNum:=RemoverAcentos(tabFornecedores.FieldByName('Numero').AsString);
            vDestCompl:=RemoverAcentos(tabFornecedores.FieldByName('Complemento').AsString);
            vDestBairro:=RemoverAcentos(tabFornecedores.FieldByName('Bairro').AsString);
            vDestCodMun:=tabFornecedores.FieldByName('CodigoCidade').AsString;
            vDestCidade:=LocateCidade(tabFornecedores.FieldByName('CodigoCidade').AsString);
            vDestEstado:=tabFornecedores.FieldByName('Estado').AsString;
            vDestCep:=Trim(Desformatar(tabFornecedores.FieldByName('Cep').AsString));
            vDestCodPais:=tabFornecedores.FieldByName('CodigoPais').AsString;
            vDestPais:=LocatePais(tabFornecedores.FieldByName('CodigoPais').AsString);
            vDestTelefone:=Desformatar(Trim(tabFornecedores.FieldByName('Telefone1').AsString));
         end;

         try
           if tabCFOP.FieldByName('CFOP').AsString[1] = '7' then begin
              vDestEstado:='EX';
              vDestCodMun:='9999999';
              vDestCidade:='Exterior';
              vDestCep:='';
           end;
         except
          ShowMessage('Problema no CFOP');
         end;

         vStringList.Add('E|' + vDestRazao + '|' + vDestIE + '|' + '|' + vDestEmail + '|');

         if vTipoConta = True then begin
            vStringList.Add('E02|' + vDestCpfCnpj + '|');
          end
         else begin
            vStringList.Add('E03|' + vDestCpfCnpj + '|');
         end;

         vStringList.Add('E05|' + vDestEnd + '|' + vDestNum + '|' + vDestCompl +
         '|' + vDestBairro + '|' + vDestCodMun + '|' + vDestCidade + '|' + vDestEstado +
         '|' + vDestCep + '|' + vDestCodPais + '|' + vDestPais + '|' + vDestTelefone + '|');

         vQtdProd:=0;
         
         tabFaturaProdutos.First;
         while not tabFaturaProdutos.Eof do begin  

            vQtdProd:=vQtdProd + 1;

            if Trim(tabFaturaProdutos.FieldByName('NCM').AsString) <> '' then begin
               vNCM:=Desformatar(tabFaturaProdutos.FieldByName('NCM').AsString);
             end
            else begin
               vNCM:=Desformatar(tabProdutos.FieldByName('NCM').AsString);
            end;

            if Trim(tabFaturaProdutos.FieldByName('Unidade').AsString) <> '' then begin
               vUnidade:=RemoverAcentos(tabFaturaProdutos.FieldByName('Unidade').AsString);
             end
            else begin
               vUnidade:=RemoverAcentos(tabUnidades.FieldByName('Sigla').AsString);
            end;

            vStringList.Add('H|' + IntToStr(vQtdProd) + '|' + '|');

            if tabFatura.FieldByName('ValorDesconto').AsFloat > 0 then vDesconto:=FormatFloat('0.00', tabFatura.FieldByName('ValorDesconto').AsFloat) else vDesconto:='';
            if tabFatura.FieldByName('ValorFrete').AsFloat    > 0 then vFrete:=FormatFloat('0.00', tabFatura.FieldByName('ValorFrete').AsFloat) else vFrete:='';
            if tabFatura.FieldByName('ValorSeguro').AsFloat   > 0 then vSeguro:=FormatFloat('0.00', tabFatura.FieldByName('ValorSeguro').AsFloat) else vSeguro:='';

            if vQtdProd = 1 then begin
               vStringList.Add('I|' + tabFaturaProdutos.FieldByName('CodigoProduto').AsString + '|' + '|' +
               RemoverAcentos(tabFaturaProdutos.FieldByName('Descricao').AsString) + '|' +
               vNCM + '|' + tabProdutos.FieldByName('EXTIPI').AsString + '|' +
               Desformatar(tabCFOP.FieldByName('CFOP').AsString) + '|' + vUnidade + '|' +
               FormatFloat('0.0000', tabFaturaProdutos.FieldByName('Quantidade').AsFloat) + '|' +
               FormatFloat('0.0000', tabFaturaProdutos.FieldByName('Valor').AsFloat)      + '|' +
               FormatFloat('0.00', tabFaturaProdutos.FieldByName('ValorTotal').AsFloat)   + '|' + '|' +
               vUnidade + '|' +
               FormatFloat('0.0000', tabFaturaProdutos.FieldByName('Quantidade').AsFloat) + '|' +
               FormatFloat('0.0000', tabFaturaProdutos.FieldByName('Valor').AsFloat) + '|' +
               vFrete + '|' + vSeguro + '|' + vDesconto + '|' + '|1|');
             end
            else begin
               vStringList.Add('I|' + tabFaturaProdutos.FieldByName('CodigoProduto').AsString  + '|' + '|' + 
               RemoverAcentos(tabFaturaProdutos.FieldByName('Descricao').AsString) + '|' + 
               vNCM + '|' + tabProdutos.FieldByName('EXTIPI').AsString + '|' + 
               Desformatar(tabCFOP.FieldByName('CFOP').AsString) + '|' + vUnidade + '|' +
               FormatFloat('0.0000', tabFaturaProdutos.FieldByName('Quantidade').AsFloat) + '|' +
               FormatFloat('0.0000', tabFaturaProdutos.FieldByName('Valor').AsFloat) + '|' +
               FormatFloat('0.00', tabFaturaProdutos.FieldByName('ValorTotal').AsFloat) + '|' + '|' +
               vUnidade + '|' +
               FormatFloat('0.0000', tabFaturaProdutos.FieldByName('Quantidade').AsFloat) + '|' +
               FormatFloat('0.0000', tabFaturaProdutos.FieldByName('Valor').AsFloat) + '|||||1|');
            end;

            // Importação
            if tabCFOP.FieldByName('CFOP').AsString[1] = '3' then begin
               if Trim(tabFatura.FieldByName('NDI').AsString) = ''              then edtPreenchimentos.Lines.Add('NDI Não Informado - Fatura: '+tabFatura.FieldByName('Fatura').AsString);
               if tabFatura.FieldByName('DataDI').IsNull                        then edtPreenchimentos.Lines.Add('Data Registro da DI Não Informado - Fatura: '+tabFatura.FieldByName('Fatura').AsString);
               if Trim(tabFatura.FieldByName('LocalDesembaraco').AsString) = '' then edtPreenchimentos.Lines.Add('Local de Desembaraço Não Informado - Fatura: '+tabFatura.FieldByName('Fatura').AsString);
               if Trim(tabFatura.FieldByName('UFDesembaraco').AsString) = ''    then edtPreenchimentos.Lines.Add('UF de Desembaraço Não Informado - Fatura: '+tabFatura.FieldByName('Fatura').AsString);
               if tabFatura.FieldByName('DataDesembaraco').IsNull               then edtPreenchimentos.Lines.Add('Data de Desembaraço Não Informado - Fatura: '+tabFatura.FieldByName('Fatura').AsString);
               if Trim(tabFatura.FieldByName('CodigoExportador').AsString) = '' then edtPreenchimentos.Lines.Add('Código do Exportador Não Informado - Fatura: '+tabFatura.FieldByName('Fatura').AsString);
               vStringList.Add('I18|'+ tabFatura.FieldByName('NDI').AsString + '|' +
               FormatDateTime('yyyy-MM-dd', tabFatura.FieldByName('DataDI').AsDateTime) + '|' +
               tabFatura.FieldByName('LocalDesembaraco').AsString +'|'+
               tabFatura.FieldByName('UFDesembaraco').AsString +'|'+
               FormatDateTime('yyyy-MM-dd', tabFatura.FieldByName('DataDesembaraco').AsDateTime) + '|' +
               tabFatura.FieldByName('CodigoExportador').AsString + '|'); 
               vStringList.Add('I25|'+ IntToStr(vQtdProd) + '|' + IntToStr(vQtdProd) + '|' + vNCM +'|' +'|');
            end;

            vStringList.Add('M|');
            vStringList.Add('N|');

            if tabFatura.FieldByName('CSTCSOSN').AsString = '101' then begin
               if (vQtdProd = 1) then begin
                  vStringList.Add('N10c|0|101|'+ FormatFloat('0.00', tabConfigPropri.FieldByName('AliqAprov').AsFloat) + '|' +
                  FormatFloat('0.00', (tabFaturaProdutos.FieldByName('ValorTotal').AsFloat * tabConfigPropri.FieldByName('AliqAprov').AsFloat) / 100) + '|');
                end
               else begin 
                  vStringList.Add('N10c|0|101|'+ FormatFloat('0.00', tabConfigPropri.FieldByName('AliqAprov').AsFloat) + '|' +
                  FormatFloat('0.00', (tabFaturaProdutos.FieldByName('ValorTotal').AsFloat * tabConfigPropri.FieldByName('AliqAprov').AsFloat) / 100) + '|');
               end;
             end
            else if tabFatura.FieldByName('CSTCSOSN').AsString = '102' then begin
               vStringList.Add('N10d|0|102|');
             end
            else if tabFatura.FieldByName('CSTCSOSN').AsString = '201' then begin
               vStringList.Add('N10d|0|201|');
             end
            else if tabFatura.FieldByName('CSTCSOSN').AsString = '202' then begin
               // vStringList.Add('N10d|0|102|'); colocar o 202
             end 
            else if tabFatura.FieldByName('CSTCSOSN').AsString = '300' then begin
               vStringList.Add('N10d|0|300|');
             end
            else if tabFatura.FieldByName('CSTCSOSN').AsString = '400' then begin
               vStringList.Add('N10d|0|400|');
             end
            else if tabFatura.FieldByName('CSTCSOSN').AsString = '900' then begin
               vStringList.Add('N10h|0|900||||||||||||||');
            end;

            // IPI - 99 Outras Operações
            vStringList.Add('O|||||999|'); 
            vStringList.Add('O07|99|0.00|');
            vStringList.Add('O10|0.00|0.00|'); 

            // PIS - Grupo de PIS não tributado
            vStringList.Add('Q|');
            vStringList.Add('Q05|99|0.00|');
            vStringList.Add('Q07|0.00|0.00|');

            // COFINS - Grupo de COFINS não tributado
            vStringList.Add('S|');
            vStringList.Add('S05|99|0.00|');
            vStringList.Add('S07|0.00|0.00|');

            tabFaturaProdutos.Next;
         end;

         if tabCFOP.FieldByName('CFOP').AsString[1] <> '7' then begin 
            if Trim(vDestCep) = '' then begin
               edtPreenchimentos.Lines.Add('Cliente: '+tabFatura.FieldByName('CodigoConta').AsString+' sem CEP.');
            end;
         end;

         vStringList.Add('W|'); 
         vStringList.Add('W02|' + FormatFloat('0.00', tabFatura.FieldByName('ValorProdutos').AsFloat) +
         '|0.00|0.00|0.00|' + FormatFloat('0.00', tabFatura.FieldByName('ValorProdutos').AsFloat) + '|' +
         FormatFloat('0.00', tabFatura.FieldByName('ValorFrete').AsFloat) + '|' +
         FormatFloat('0.00', tabFatura.FieldByName('ValorSeguro').AsFloat) + '|' +
         FormatFloat('0.00', tabFatura.FieldByName('ValorDesconto').AsFloat) +
         '|0.00|0.00|0.00|0.00|' + FormatFloat('0.00', tabFatura.FieldByName('ValorAcrescimo').AsFloat) + '|' +
         FormatFloat('0.00', tabFatura.FieldByName('ValorTotal').AsFloat) + '|');

         case tabFatura.FieldByName('FreteConta').AsInteger of
            0: vStringList.Add('X|0|'); // emitente
            1: vStringList.Add('X|1|'); // destinatario / remetente
            2: vStringList.Add('X|2|'); // terceiros
            9: vStringList.Add('X|9|'); // sem Frete
         end; 

         if (tabTransportadora.FieldByName('Nome').AsString = 'CLIENTE') or
            (tabTransportadora.FieldByName('Nome').AsString = 'FORNECEDOR') then begin
            vStringList.Add('X03|' + Copy(vDestRazao, 1, 60) + '|' + vDestIE + '|' + vDestEnd + '|' +
            vDestEstado + '|' + vDestCidade + '|');
            if vTipoConta = True then begin
               vStringList.Add('X04|' + vDestCpfCnpj + '|');
             end
            else begin
               vStringList.Add('X05|' + vDestCpfCnpj + '|');
            end;
          end
         else begin 
            vStringList.Add('X03|'+Copy(RemoverAcentos(tabTransportadora.FieldByName('Nome').AsString), 1, 60) + '|' +
            Desformatar(tabTransportadora.FieldByName('IE').AsString) + '|' + RemoverAcentos(tabTransportadora.FieldByName('Endereco').AsString) + '|' +
            tabTransportadora.FieldByName('Estado').AsString + '|' + LocateCidade(tabTransportadora.FieldByName('CodigoCidade').AsString) + '|');
            if Length(Desformatar(tabTransportadora.FieldByName('Cnpj').AsString)) = 14 then begin
               vStringList.Add('X04|' + Desformatar(tabTransportadora.FieldByName('Cnpj').AsString) + '|');
             end
            else begin
               vStringList.Add('X05|' + Desformatar(tabTransportadora.FieldByName('Cnpj').AsString) + '|');
            end;
         end;

         vPesoL:=StringReplace(tabFatura.FieldByName('PesoLiquido').AsString, ',', '.', [rfReplaceAll]);
         vPesoB:=StringReplace(tabFatura.FieldByName('PesoBruto').AsString, ',', '.', [rfReplaceAll]);

         // Volume
         vStringList.Add('X26|' + tabFatura.FieldByName('QtdVolumes').AsString + '|' +
         tabFatura.FieldByName('Especie').AsString + '|' + tabFatura.FieldByName('Marca').AsString + '|' + '|' +
         vPesoL + '|' + vPesoB);

         // Cobrança
         vStringList.Add('Y|'); 

         if tabFatura.FieldByName('ValorDesconto').AsFloat > 0 then begin
            vStringList.Add('Y02|' + tabFatura.FieldByName('Fatura').AsString + '|' + FormatFloat('0.00', tabFatura.FieldByName('ValorProdutos').AsFloat + tabFatura.FieldByName('ValorFrete').AsFloat + tabFatura.FieldByName('ValorSeguro').AsFloat + tabFatura.FieldByName('ValorAcrescimo').AsFloat) + '|' + FormatFloat('0.00', tabFatura.FieldByName('ValorDesconto').AsFloat) + '|' + FormatFloat('0.00', tabFatura.FieldByName('ValorTotal').AsFloat) + '|');
          end
         else begin 
            vStringList.Add('Y02|' + tabFatura.FieldByName('Fatura').AsString + '|' + FormatFloat('0.00', tabFatura.FieldByName('ValorProdutos').AsFloat + tabFatura.FieldByName('ValorFrete').AsFloat + tabFatura.FieldByName('ValorSeguro').AsFloat + tabFatura.FieldByName('ValorAcrescimo').AsFloat) + '|' + '|' + FormatFloat('0.00', tabFatura.FieldByName('ValorTotal').AsFloat) + '|');
         end;

         for vCnt:=1 to 12 do begin
            if tabVenctosFatura.FieldByName('Valor'+IntToStr(vCnt)).AsFloat > 0 then begin
               vStringList.Add('Y07|' + tabFatura.FieldByName('Fatura').AsString + '-' + IntToStr(vCnt) + '|' + FormatDateTime('yyyy-MM-dd', tabVenctosFatura.FieldByName('DataVencto'+IntToStr(vCnt)).AsDateTime) + '|' + FormatFloat('0.00', tabVenctosFatura.FieldByName('Valor'+IntToStr(vCnt)).AsFloat)+'|');
            end;
         end;

         vAprovTexto:='';   

         if tabFatura.FieldByName('CSTCSOSN').AsString = '101' then begin
            vAprov:=(tabFatura.FieldByName('ValorTotal').AsFloat * tabConfigPropri.FieldByName('AliqAprov').AsFloat) / 100;
            vAprovTexto:='PERMITE O APROVEITAMENTO DO CREDITO DE ICMS NO VALOR DE ' +
            FormatFloat('R$ #,##0.00', vAprov)+' CORRESPONDENTE A ALIQUOTA DE ' +
            FloatToStr(tabConfigPropri.FieldByName('AliqAprov').AsFloat) + ' NOS TERMOS DO ARTIGO 23 DA LC 123/06.';
         end; 

         vStringList.Add('Z|'+'|'+

         RemoverAcentos(Copy(tabConfigPropri.FieldByName('ObsNF1').AsString, 1, 76))+
         RemoverAcentos(Copy(tabConfigPropri.FieldByName('ObsNF2').AsString, 1, 76))+
         RemoverAcentos(Copy(tabConfigPropri.FieldByName('ObsNF3').AsString, 1, 76))+
         Copy(vAprovTexto,  1, 76)+
         Copy(vAprovTexto, 71, 76)+

         // Observações 
         RemoverAcentos(Copy(tabFatura.FieldByName('Observacao').AsString, 1,   70)) + 
         RemoverAcentos(Copy(tabFatura.FieldByName('Observacao').AsString, 71,  70)) +
         RemoverAcentos(Copy(tabFatura.FieldByName('Observacao').AsString, 141, 70)) +
         RemoverAcentos(Copy(tabFatura.FieldByName('Observacao').AsString, 211, 70)) +
         RemoverAcentos(Copy(tabFatura.FieldByName('Observacao').AsString, 281, 70)) +
         RemoverAcentos(Copy(tabFatura.FieldByName('Observacao').AsString, 351, 70)) +
         RemoverAcentos(Copy(tabFatura.FieldByName('Observacao').AsString, 421, 70)) +
         RemoverAcentos(Copy(tabFatura.FieldByName('Observacao').AsString, 491, 70)) +
         RemoverAcentos(Copy(tabFatura.FieldByName('Observacao').AsString, 561, 70)) +
         RemoverAcentos(Copy(tabFatura.FieldByName('Observacao').AsString, 631, 70)) + '|');

         vStringList.Add('Z04|CodigoEmpresa|' + FloatToStr(tabFatura.FieldByName('CodigoEmpresa').AsFloat) + '|');
         vStringList.Add('Z04|TipoTela|' + FloatToStr(tabFatura.FieldByName('TipoTela').AsFloat) + '|'); // 1 Cliente, 2 Fornecedor
         vStringList.Add('Z04|TipoNota|' + FloatToStr(tabFatura.FieldByName('TipoNota').AsFloat) + '|'); // 1 Saida, 2 Entrada

         // Exportação
         if tabCFOP.FieldByName('CFOP').AsString[1] = '7' then begin
            vStringList.Add('ZA|'+tabFatura.FieldByName('UFEmbarque').AsString + '|' + RemoverAcentos(tabFatura.FieldByName('LocalEmbarque').AsString) + '|');
         end;

         vQtdNotas:=vQtdNotas + 1; 

         tabFatura.Next;
      end;

      vStringList.Insert(0, 'NOTAFISCAL|'+IntToStr(vQtdNotas));
      
      vArquivo:=edtPasta.Text + '\NFE.txt'; 
      vStringList.SaveToFile(vArquivo);

      ShowMessage('Arquivo Salvo com Sucesso: ' + vArquivo + Chr(13) +
                  'Numero de Notas Geradas: ' + IntToStr(vQtdNotas));

      SaveConfigNFeTxtPath(edtPasta.Text, GetPathProfileUser);
   finally
      gagProgresso.Progress:=0;   
      DecimalSeparator:=',';
      vStringList.Free;
   end;
end;

procedure TfmNotaFiscalEletronica.FormShow(Sender: TObject);
begin
   inherited;

   edtPasta.Text:=LoadConfigNFeTxtPath(GetPathProfileUser);

   edtDataAtual.Date:=Date;

   tabCFOP.Params.CreateParam(ftFloat, 'CodigoCFOP', ptUnknown);
   tabCFOP.SQL.Add('SELECT * FROM cfop WHERE CodigoCFOP = :CodigoCFOP');
   tabCFOP.Open;

   tabClientes.Params.CreateParam(ftFloat, 'CodigoCliente', ptUnknown);
   tabClientes.SQL.Add('SELECT * FROM clientes WHERE CodigoCliente = :CodigoCliente');
   tabClientes.Open;

   tabFornecedores.Params.CreateParam(ftFloat, 'CodigoFornecedor', ptUnknown);
   tabFornecedores.SQL.Add('SELECT * FROM fornecedores WHERE CodigoFornecedor = :CodigoFornecedor');
   tabFornecedores.Open;

   tabUnidades.Params.CreateParam(ftFloat, 'CodigoUnidade', ptUnknown);
   tabUnidades.SQL.Add('SELECT Codigo,Sigla FROM unidades WHERE Codigo = :CodigoUnidade');
   tabUnidades.Open;

   tabProdutos.Params.CreateParam(ftString, 'CodigoProduto', ptUnknown);
   tabProdutos.SQL.Add('SELECT CodigoProduto, EXTIPI, CodigoUnidade, NCM'); 
   tabProdutos.SQL.Add('FROM produtos');
   tabProdutos.SQL.Add('WHERE CodigoProduto = :CodigoProduto');
   tabProdutos.Open;

   tabFaturaProdutos.Params.CreateParam(ftString, 'Fatura', ptUnknown);
   tabFaturaProdutos.Params.CreateParam(ftString, 'Serie', ptUnknown);
   tabFaturaProdutos.Params.CreateParam(ftFloat, 'CodigoEmpresa', ptUnknown);
   tabFaturaProdutos.Params.CreateParam(ftFloat, 'TipoTela', ptUnknown);
   tabFaturaProdutos.SQL.Add('SELECT * FROM faturamento_produtos WHERE Fatura = :Fatura AND Serie = :Serie AND CodigoEmpresa = :CodigoEmpresa AND TipoTela = :TipoTela');
   tabFaturaProdutos.Open;

   tabTransportadora.Params.CreateParam(ftFloat, 'CodigoTransportadora', ptUnknown);
   tabTransportadora.SQL.Add('SELECT * FROM transportadoras WHERE Codigo = :CodigoTransportadora');
   tabTransportadora.Open;

   tabConfigPropri.SQL.Add('SELECT * FROM configuracoes_proprietario');
   tabConfigPropri.Open;

   tabVenctosFatura.Params.CreateParam(ftString, 'Fatura', ptUnknown);
   tabVenctosFatura.Params.CreateParam(ftString, 'Serie', ptUnknown);
   tabVenctosFatura.Params.CreateParam(ftFloat, 'CodigoEmpresa', ptUnknown);
   tabVenctosFatura.Params.CreateParam(ftFloat, 'TipoTela', ptUnknown);
   tabVenctosFatura.SQL.Add('SELECT * FROM faturamento_vencimentos WHERE Fatura = :Fatura AND Serie = :Serie AND CodigoEmpresa = :CodigoEmpresa AND TipoTela = :TipoTela');
   tabVenctosFatura.Open;
end;

procedure TfmNotaFiscalEletronica.dtsFaturaDataChange(Sender: TObject;
  Field: TField);
begin
   inherited;
   tabFaturaProdutos.Close;
   tabFaturaProdutos.ParamByName('Fatura').AsString:=tabFatura.FieldByName('Fatura').AsString;
   tabFaturaProdutos.ParamByName('Serie').AsString:=tabFatura.FieldByName('Serie').AsString;
   tabFaturaProdutos.ParamByName('CodigoEmpresa').AsFloat:=tabFatura.FieldByName('CodigoEmpresa').AsFloat;
   tabFaturaProdutos.ParamByName('TipoTela').AsFloat:=tabFatura.FieldByName('TipoTela').AsFloat;
   tabFaturaProdutos.Open;

   tabVenctosFatura.Close;
   tabVenctosFatura.ParamByName('Fatura').AsString:=tabFatura.FieldByName('Fatura').AsString;
   tabVenctosFatura.ParamByName('Serie').AsString:=tabFatura.FieldByName('Serie').AsString;
   tabVenctosFatura.ParamByName('CodigoEmpresa').AsFloat:=tabFatura.FieldByName('CodigoEmpresa').AsFloat;
   tabVenctosFatura.ParamByName('TipoTela').AsFloat:=tabFatura.FieldByName('TipoTela').AsFloat;
   tabVenctosFatura.Open;

   tabCFOP.Close;
   tabCFOP.ParamByName('CodigoCFOP').AsFloat:=tabFatura.FieldByName('CodigoCFOP').AsFloat;
   tabCFOP.Open;

   tabClientes.Close;
   tabClientes.ParamByName('CodigoCliente').AsFloat:=tabFatura.FieldByName('CodigoConta').AsFloat;
   tabClientes.Open;

   tabFornecedores.Close;
   tabFornecedores.ParamByName('CodigoFornecedor').AsFloat:=tabFatura.FieldByName('CodigoConta').AsFloat;
   tabFornecedores.Open;

   tabTransportadora.Close;
   tabTransportadora.ParamByName('CodigoTransportadora').AsFloat:=tabFatura.FieldByName('CodigoTransportadora').AsFloat;
   tabTransportadora.Open;
end;

procedure TfmNotaFiscalEletronica.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabFatura.Close;
   tabFaturaProdutos.Close;
   tabCFOP.Close;
   tabClientes.Close;
   tabConfigPropri.Close;
   tabProdutos.Close;
   tabUnidades.Close;
   tabTransportadora.Close;
   tabVenctosFatura.Close;
   tabFornecedores.Close;
   inherited;
end;

procedure TfmNotaFiscalEletronica.dtsFaturaProdutosDataChange(
  Sender: TObject; Field: TField);
begin
   inherited;
   tabProdutos.Close;
   tabProdutos.ParamByName('CodigoProduto').AsString:=tabFaturaProdutos.FieldByName('CodigoProduto').AsString;
   tabProdutos.Open;
end;

procedure TfmNotaFiscalEletronica.dtsProdutosDataChange(Sender: TObject;
  Field: TField);
begin
   inherited;
   tabUnidades.Close; 
   tabUnidades.ParamByName('CodigoUnidade').AsFloat:=tabProdutos.FieldByName('CodigoUnidade').AsFloat;
   tabUnidades.Open;
end;

end.

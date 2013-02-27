unit uNotaFiscalPaulista;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, Mask, ToolEdit, Buttons, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Gauges, Menus;

type
  TfmNotaFiscalPaulista = class(TfmFormBaseAvancado)
    lblDataInicial: TLabel;
    lblDataFinal: TLabel;
    edtDataInicial: TDateEdit;
    edtDataFinal: TDateEdit;
    Label1: TLabel;
    btnGerarArquivo: TBitBtn;
    btnFechar: TBitBtn;
    dtsFatura: TDataSource;
    tabFatura: TZQuery;
    gagProgresso: TGauge;
    tabFaturaProdutos: TZQuery;
    tabConfigProp: TZQuery;
    tabCFOP: TZQuery;
    tabClientes: TZQuery;
    edtPasta: TDirectoryEdit;
    procedure btnFecharClick(Sender: TObject);
    procedure btnGerarArquivoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtsFaturaDataChange(Sender: TObject; Field: TField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmNotaFiscalPaulista: TfmNotaFiscalPaulista;

implementation

uses uConstantes, uFuncoes, uFormBase, uEnderecos;

{$R *.dfm}

procedure TfmNotaFiscalPaulista.btnFecharClick(Sender: TObject);
begin
   inherited;
   Close;
end;

procedure TfmNotaFiscalPaulista.btnGerarArquivoClick(Sender: TObject);
const
    cSeparator : string[1] = '|';

var v20, v30, v40, v50: Integer;
    vStringList: TStringList;
    vString: string;
    vEnd, vNumero, vCidade, vEstado, vBairro, vCep : string;
    vTotal: real;
    vArquivo: string;
begin
   inherited;

   if (Trim(edtDataInicial.Text) = '/  /') and (Trim(edtDataFinal.Text) = '/  /') then begin
      ShowMessage('Obrigatório Preenchimento do Período de Datas');
      edtDataInicial.SetFocus;
      exit;
   end;

   if Trim(edtPasta.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Pasta de Destino');
      edtPasta.SetFocus;
      exit;
   end;

   v20:=0;
   v30:=0;
   v40:=0;
   v50:=0;

   vStringList:=TStringList.Create;

   tabFatura.Close;
   tabFatura.SQL.Clear;
   tabFatura.SQL.Add('SELECT * ');
   tabFatura.SQL.Add('FROM faturamento');
   tabFatura.SQL.Add('WHERE Data >= '+QuotedStr(FormatDateTime(sis_date_format, edtDataInicial.Date))+' AND Data <= '+QuotedStr(FormatDateTime(sis_date_format, edtDataFinal.Date)));
   tabFatura.Open;

   gagProgresso.MaxValue:=tabFatura.RecordCount;

   vStringList.Clear;
   vStringList.Add('10' + cSeparator + '1,00' + cSeparator + Desformatar(tabConfigProp.FieldByName('CNPJ').AsString) +
   cSeparator + edtDataInicial.Text + cSeparator + edtDataFinal.Text);

   try
      tabFatura.First;
      while not tabFatura.Eof do begin

         gagProgresso.Progress:=tabFatura.RecNo;
         Application.ProcessMessages;

         vString:='20' + cSeparator;
         vString:=vString + 'I' + cSeparator + cSeparator + tabCFOP.FieldByName('NaturezaOperacao').AsString;
         vString:=vString + cSeparator + '1' + cSeparator + tabFatura.FieldByName('Fatura').AsString + cSeparator;
         vString:=vString + FormatDateTime(sis_date_format, tabFatura.FieldByName('Data').AsDateTime) + ' ';
         vString:=vString + FormatDateTime(sis_time_format, Now) + cSeparator;
         vString:=vString + FormatDateTime(sis_date_format, tabFatura.FieldByName('Data').AsDateTime) + ' ';
         vString:=vString + FormatDateTime(sis_time_format, Now) + cSeparator;
         vString:=vString + cSeparator + '1' + cSeparator + tabCFOP.FieldByName('CFOP').AsString;
         vString:=vString + cSeparator + cSeparator + cSeparator + Desformatar(tabClientes.FieldByName('CpfCnpj').AsString);
         vString:=vString + cSeparator + Copy(tabClientes.FieldByName('RazaoSocial').AsString, 1, 60); 

         vEnd:=RemoverAcentos(tabClientes.FieldByName('Endereco').AsString);

         // Exterior
         if Trim(tabClientes.FieldByName('CodigoPais').AsString) <> '1058' then begin
            vCep:='00000000';
            vBairro:='EXTERIOR';
            vNumero:='EX';
            vCidade:='EXTERIOR';
            vEstado:='EX';
          end
         else begin
            vNumero:=tabClientes.FieldByName('Numero').AsString;
            vCidade:=LocateCidade(tabClientes.FieldByName('CodigoCidade').AsString);
            vEstado:=tabClientes.FieldByName('Estado').AsString;
            vBairro:=RemoverAcentos(tabClientes.FieldByName('Bairro').AsString);
            vCep:=Desformatar(tabClientes.FieldByName('Cep').AsString);
         end;

         vString:=vString + cSeparator + vEnd + cSeparator + vNumero + cSeparator;
         vString:=vString + cSeparator + vBairro + cSeparator + vCidade + cSeparator;
         vString:=vString + vEstado + cSeparator + vCep + cSeparator + cSeparator + cSeparator + cSeparator;

         vStringList.Add(vString);

         v20:=v20 + 1;

         tabFaturaProdutos.First;
         while not tabFaturaProdutos.Eof do begin

            vString:='30' + cSeparator + tabFaturaProdutos.FieldByName('CodigoProduto').AsString;
            vString:=vString + cSeparator + tabFaturaProdutos.FieldByName('Descricao').AsString;
            vString:=vString + cSeparator + cSeparator + 'UN' + cSeparator + FormatFloat('###0.0000', tabFaturaProdutos.FieldByName('Quantidade').AsFloat);
            vString:=vString + cSeparator + FormatFloat('###0.0000', tabFaturaProdutos.FieldByName('Valor').AsFloat);
            vString:=vString + cSeparator + FormatFloat('###0.00', tabFaturaProdutos.FieldByName('ValorTotal').AsFloat);
            vString:=vString + cSeparator + '041' + cSeparator + FormatFloat('###0.00', 0);
            vString:=vString + cSeparator + cSeparator + cSeparator;
            
            vStringList.Add(vString);
            
            v30:=v30 + 1;

            tabFaturaProdutos.Next;
         end;

         vString:='40' + cSeparator + FormatFloat('###0.00', tabFatura.FieldByName('ValorProdutos').AsFloat);
         vString:=vString + cSeparator + '0,00|0,00|0,00|'+FormatFloat('###0.00', tabFatura.FieldByName('ValorProdutos').AsFloat);
         vString:=vString + cSeparator + FormatFloat('###0.00', tabFatura.FieldByName('ValorFrete').AsFloat);
         vString:=vString + cSeparator + FormatFloat('###0.00', tabFatura.FieldByName('ValorSeguro').AsFloat);
         vString:=vString + cSeparator + FormatFloat('###0.00', tabFatura.FieldByName('ValorDesconto').AsFloat);
         vString:=vString + cSeparator + '0,00';
         vString:=vString + cSeparator + FormatFloat('###0.00', tabFatura.FieldByName('ValorAcrescimo').AsFloat);

         vTotal:=(tabFatura.FieldByName('ValorProdutos').AsFloat + tabFatura.FieldByName('ValorFrete').AsFloat +
         tabFatura.FieldByName('ValorSeguro').AsFloat + tabFatura.FieldByName('ValorAcrescimo').AsFloat) - tabFatura.FieldByName('ValorDesconto').AsFloat;

         vString:=vString + cSeparator + FormatFloat('###0.00', vTotal);         
         vString:=vString + cSeparator + '0,00' + cSeparator + '0,00' + cSeparator + '0,00' + cSeparator;
         
         vStringList.Add(vString);
         
         v40:=v40 + 1;

         vString:='50' + cSeparator ;

         if tabFatura.FieldByName('FreteConta').AsInteger = 1 then begin
            vString:=vString + '0';
          end
         else if tabFatura.FieldByName('FreteConta').AsInteger = 2 then begin
            vString:=vString + '1';
          end
         else begin
            vString:=vString + '0';
         end;

         vString:=vString + cSeparator + cSeparator + cSeparator + cSeparator +
         cSeparator + cSeparator + cSeparator + cSeparator + cSeparator + cSeparator +
         cSeparator + cSeparator + cSeparator + cSeparator;
         
         vStringList.Add(vString);
         v50:=v50 + 1;

         tabFatura.Next;
      end;

      vString:='90' + cSeparator + StrZero(v20, 5) + cSeparator + StrZero(v30, 5) +
      cSeparator + StrZero(v40, 5) + cSeparator + StrZero(v50, 5) + cSeparator + '00000';
      vStringList.Add(vString); 

      vArquivo:=edtPasta.Text + '\' + FormatDateTime('ddMMyyyyhhnnss', Now) + '.txt'; 
      vStringList.SaveToFile(vArquivo);

      ShowMessage('Arquivo Salvo com Sucesso: '+vArquivo);
   finally
      gagProgresso.Progress:=0;   
      vStringList.Free;
   end;
end;

procedure TfmNotaFiscalPaulista.FormShow(Sender: TObject);
begin
   inherited;

   tabConfigProp.SQL.Add('SELECT CNPJ FROM configuracoes_proprietario');
   tabConfigProp.Open;

   tabCFOP.Params.CreateParam(ftFloat, 'CodigoCFOP', ptUnknown);
   tabCFOP.SQL.Add('SELECT * FROM cfop WHERE CodigoCFOP = :CodigoCFOP');
   tabCFOP.Open;

   tabClientes.Params.CreateParam(ftFloat, 'CodigoCliente', ptUnknown);
   tabClientes.SQL.Add('SELECT * FROM clientes WHERE CodigoCliente = :CodigoCliente');
   tabClientes.Open;

   tabFaturaProdutos.Params.CreateParam(ftString, 'Fatura', ptUnknown);
   tabFaturaProdutos.Params.CreateParam(ftString, 'Serie', ptUnknown);
   tabFaturaProdutos.Params.CreateParam(ftFloat, 'CodigoEmpresa', ptUnknown);
   tabFaturaProdutos.Params.CreateParam(ftFloat, 'TipoTela', ptUnknown);
   tabFaturaProdutos.SQL.Add('SELECT * FROM faturamento_produtos WHERE Fatura = :Fatura AND Serie = :Serie AND CodigoEmpresa = :CodigoEmpresa AND TipoTela = :TipoTela');
   tabFaturaProdutos.Open;
end;

procedure TfmNotaFiscalPaulista.dtsFaturaDataChange(Sender: TObject;
  Field: TField);
begin
   inherited;
   tabFaturaProdutos.Close;
   tabFaturaProdutos.ParamByName('Fatura').AsString:=tabFatura.FieldByName('Fatura').AsString;
   tabFaturaProdutos.ParamByName('Serie').AsString:=tabFatura.FieldByName('Serie').AsString;
   tabFaturaProdutos.ParamByName('CodigoEmpresa').AsFloat:=tabFatura.FieldByName('CodigoEmpresa').AsFloat;
   tabFaturaProdutos.ParamByName('TipoTela').AsFloat:=tabFatura.FieldByName('TipoTela').AsFloat;
   tabFaturaProdutos.Open;

   tabCFOP.Close;
   tabCFOP.ParamByName('CodigoCFOP').AsFloat:=tabFatura.FieldByName('CodigoCFOP').AsFloat;
   tabCFOP.Open;

   tabClientes.Close;
   tabClientes.ParamByName('CodigoCliente').AsFloat:=tabFatura.FieldByName('CodigoConta').AsFloat;
   tabClientes.Open;
end;

procedure TfmNotaFiscalPaulista.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabConfigProp.Close;
   tabFatura.Close;
   tabFaturaProdutos.Close;
   tabCFOP.Close;
   tabClientes.Close;
   inherited;
end;

procedure TfmNotaFiscalPaulista.FormCreate(Sender: TObject);
begin
   inherited; 
   SetFormStyle(fsMDIChild);
end;

end.

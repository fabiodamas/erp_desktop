unit uConfiguracaoBancoDados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, Buttons, ZConnection, DB,
  ZAbstractRODataset, ZAbstractDataset, ZAbstractTable, ZDataset, ComCtrls,
  Menus, ZAbstractConnection;

type
  TfmConfiguracaoBancoDados = class(TfmFormBaseAvancado)
    btnOK: TBitBtn;
    zcnConfigura: TZConnection;
    btnCancelar: TBitBtn;
    tabQuery: TZQuery;
    stpAvisos: TStatusBar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtServidor: TEdit;
    Label4: TLabel;
    edtPorta: TEdit;
    tabBackup: TZQuery;
    tabDefault: TZQuery;
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
  private
    FErros: integer;
    FMensagem: string;
    FAdm: boolean;
    function RenameTable(fNewName, fOldName : string): Boolean;
    function CreateTable(fSQL: TStringList): boolean;
    function DropTable(fTableName: string): boolean;
    function TableExists(fTableName: string): boolean;
    function RetornaDados(fTableName: string): boolean;
  public
    { Public declarations }
  end;

var
  fmConfiguracaoBancoDados: TfmConfiguracaoBancoDados;
  vOrigem  : TStringList;
  vDestino : TStringList;

const
  cNomenTabTmp    = 'tmp_';
  cFloatTypeNoDec = 'FLOAT(15,0)';
  cFloatType2Dec  = 'FLOAT(15,2)';
  cFloatType3Dec  = 'FLOAT(15,3)';
  cFloatType4Dec  = 'FLOAT(15,4)';
  cFloatType5Dec  = 'FLOAT(15,5)';  
  cDoubleType2Dec = 'DOUBLE(15,2) NULL DEFAULT 0';
  cDoubleType3Dec = 'DOUBLE(15,3) NULL DEFAULT 0';
  cDoubleType4Dec = 'DOUBLE(15,4) NULL DEFAULT 0';
  cDoubleType5Dec = 'DOUBLE(15,5) NULL DEFAULT 0';    

implementation

uses uFormBaseConfig, uConstantes, uMenu, uFuncoes, uTipos;

{$R *.dfm}

function TfmConfiguracaoBancoDados.RenameTable(fNewName, fOldName: string): Boolean;
begin
   Result:=True;
   try
      tabQuery.Close;
      tabQuery.SQL.Clear;
      tabQuery.SQL.Add('RENAME TABLE ' + fOldName + ' TO '+ fNewName);
      tabQuery.ExecSQL;
   except
      FMensagem:=FMensagem+'Err: Rename Table '+fOldName+Chr(13);
      FErros:=FErros + 1;
      Result:=False;
   end;
   Application.ProcessMessages;
end;

function TfmConfiguracaoBancoDados.CreateTable(fSQL: TStringList): boolean;
begin
   Result:=True;
   try
      tabQuery.Close;
      tabQuery.SQL.Clear;
      tabQuery.SQL:=fSQL;
      tabQuery.ExecSQL;
   except
      FMensagem:=FMensagem+'Err: Create Table '+Copy(fSQL.Text, 14, 10)+Chr(13);
      FErros:=FErros + 1;
      Result:=False;
   end;
   Application.ProcessMessages;
end;

function TfmConfiguracaoBancoDados.DropTable(fTableName: string): boolean;
begin
   Result:=True;
   try
      tabQuery.Close;
      tabQuery.SQL.Clear;
      tabQuery.SQL.Add('DROP TABLE IF EXISTS '+fTableName);
      tabQuery.ExecSQL;
   except
      FMensagem:=FMensagem+'Err: Drop Table '+fTableName+Chr(13);
      FErros:=FErros + 1;
      Result:=False;
   end;
   Application.ProcessMessages;
end;

function TfmConfiguracaoBancoDados.RetornaDados(fTableName: string): boolean;
var vCnt1 : integer;
    vFields : TStringList;
begin
   Result:=True;

   vFields:=TStringList.Create;

   try try
      if not TableExists(cNomenTabTmp+fTableName) then begin 
         Result:=True;
         exit;
      end;

      tabBackup.Close;
      tabBackup.SQL.Clear;
      tabBackup.SQL.Add('SELECT * FROM '+cNomenTabTmp+fTableName+' WHERE 0');
      tabBackup.Open;

      tabDefault.Close;
      tabDefault.SQL.Clear; 
      tabDefault.SQL.Add('SELECT * FROM '+fTableName+' WHERE 0');  
      tabDefault.Open;  

      vFields.Clear;   

      for vCnt1:=0 to tabDefault.FieldDefs.Count-1 do begin
         if tabBackup.FindField(tabDefault.FieldDefs.Items[vCnt1].Name) <> nil then begin
            vFields.Add(tabDefault.FieldDefs.Items[vCnt1].Name);
         end;
      end;  

      if vFields.Count > 0 then begin
         tabQuery.Close;
         tabQuery.SQL.Clear;
         tabQuery.SQL.Add('INSERT INTO '+fTableName);
         tabQuery.SQL.Add('(');
         for vCnt1:=0 to vFields.Count-1 do begin
            if vCnt1 = vFields.Count-1 then begin
               tabQuery.SQL.Add(vFields.Strings[vCnt1]+')');
             end
            else begin
               tabQuery.SQL.Add(vFields.Strings[vCnt1]+', ');
            end;
         end;

         tabQuery.SQL.Add('SELECT ');  

         for vCnt1:=0 to vFields.Count-1 do begin
            if vCnt1 = vFields.Count-1 then begin
               tabQuery.SQL.Add(vFields.Strings[vCnt1]+' ');
             end
            else begin
               tabQuery.SQL.Add(vFields.Strings[vCnt1]+', ');
            end;
         end;

         tabQuery.SQL.Add('FROM '+cNomenTabTmp+fTableName);

         tabQuery.ExecSQL;
      end;
   except
      FMensagem:=FMensagem+'Err: Retorna Dados '+fTableName+Chr(13);
      FErros:=FErros + 1;
      Result:=False;
   end;
   finally
      vFields.Free;
      tabDefault.Close;
      tabBackup.Close;
      tabQuery.Close;
      Application.ProcessMessages;
   end;
end;

function TfmConfiguracaoBancoDados.TableExists(fTableName: string): boolean;
begin
   Result:=False;
   try try
      tabQuery.Close;
      tabQuery.SQL.Clear;
      tabQuery.SQL.Add('SHOW TABLES LIKE '+QuotedStr('%'+fTableName+'%'));
      tabQuery.Open;

      tabQuery.First;
      while not tabQuery.Eof do begin
         if tabQuery.FieldByName(tabQuery.FieldDefs.Items[0].Name).AsString = fTableName then begin
            Result:=True;
            exit;
         end;
         tabQuery.Next;
      end;
   except
      FMensagem:=FMensagem+'Err: Show Table '+fTableName+Chr(13);
      FErros:=FErros + 1;
      Result:=False;
   end;
   finally
      tabQuery.Close;
      Application.ProcessMessages;
   end;
end;

procedure TfmConfiguracaoBancoDados.btnOKClick(
  Sender: TObject);
var vNomeArquivo : string;
    vCnt : Integer;
    vSQLCreate: TStringList;
    vHostConfig: THostConfig;
begin
   if Trim(edtServidor.Text)='' then begin
      ShowMessage('Obrigatório Preenchimento do Servidor');
      edtServidor.SetFocus;
      exit;
   end;

   if (Copy(edtServidor.Text, 1, 1) = '@') and (fmMenu.pubUsuario = corp_adm_user) then begin
      FAdm:=True;
      edtServidor.Text:=Copy(edtServidor.Text, 2, Length(edtServidor.Text));
   end;
   
   FMensagem:='';
   btnOK.Enabled:=False;
   btnCancelar.Enabled:=False;  

   try

      if Trim(edtPorta.Text) = '' then begin
         edtPorta.Text:=IntToStr(db_porta);
      end;

      vHostConfig.Host:=GetIPFromHost(edtServidor.Text);
      vHostConfig.Port:=StrToInt(edtPorta.Text);
      vHostConfig.User:=db_usuario;
      vHostConfig.Password:=db_senha;

      fmMenu.zcnConexao.Connected:=False;

      try
         zcnConfigura.LoginPrompt:=False;
         zcnConfigura.Protocol:=db_protocolo;
         zcnConfigura.Database:=db_nome;
         zcnConfigura.HostName:=GetIPFromHost(edtServidor.Text);
         // zcnConfigura.HostName:=edtServidor.Text;
         zcnConfigura.User:=db_usuario;
         zcnConfigura.Password:=db_senha;
         zcnConfigura.Port:=StrToInt(edtPorta.Text);
         zcnConfigura.Connected:=True;
      except
         on E: Exception do begin
            FErros:=FErros + 1;
            ShowMessage('Impossível conectar ao servidor');
            Exit;
         end;
      end;

      Application.ProcessMessages;
      vOrigem:=TStringList.Create;
      vDestino:=TStringList.Create;

      // Verifica arquivo .INI para path do Sistema (se Existe)
      if FileExists(ExtractFilePath(Application.ExeName)+sis_nome_abrv+'.ini') then begin
         DeleteFile(ExtractFilePath(Application.ExeName)+sis_nome_abrv+'.ini');
      end;

      // Salva Arquivo .INI
      vOrigem.Add(GetIPFromHost(edtServidor.Text));
      vOrigem.Add(edtPorta.Text);
      vOrigem.Add(db_usuario);
      vOrigem.Add(db_senha);
      vOrigem.SaveToFile(ExtractFilePath(Application.ExeName)+sis_nome_abrv+'.ini');
      vOrigem.Clear;

      Application.ProcessMessages;   

      if FAdm = True then begin
         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='clientes';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);

         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('CodigoCliente '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('RazaoSocial VARCHAR(100), ');
            vSQLCreate.Add('NomeFantasia VARCHAR(100), ');
            vSQLCreate.Add('Endereco VARCHAR(100), ');
            vSQLCreate.Add('Numero VARCHAR(10), ');
            vSQLCreate.Add('Complemento VARCHAR(50), ');
            vSQLCreate.Add('Bairro VARCHAR(30), ');
            vSQLCreate.Add('Cep VARCHAR(15), ');
            vSQLCreate.Add('Estado VARCHAR(30), ');
            vSQLCreate.Add('CodigoPais VARCHAR(5), ');
            vSQLCreate.Add('CodigoCidade VARCHAR(7), ');
            vSQLCreate.Add('EntregaEndereco VARCHAR(100), ');
            vSQLCreate.Add('EntregaNumero VARCHAR(10), ');
            vSQLCreate.Add('EntregaComplemento VARCHAR(50), ');
            vSQLCreate.Add('EntregaBairro VARCHAR(30), ');
            vSQLCreate.Add('EntregaCep VARCHAR(15), ');
            vSQLCreate.Add('EntregaEstado VARCHAR(30), ');
            vSQLCreate.Add('EntregaCodigoPais VARCHAR(5), ');
            vSQLCreate.Add('EntregaCodigoCidade VARCHAR(7), ');
            vSQLCreate.Add('CobrancaEndereco VARCHAR(100), ');
            vSQLCreate.Add('CobrancaNumero VARCHAR(10), ');
            vSQLCreate.Add('CobrancaComplemento VARCHAR(50), ');
            vSQLCreate.Add('CobrancaBairro VARCHAR(30), ');
            vSQLCreate.Add('CobrancaCep VARCHAR(15), ');
            vSQLCreate.Add('CobrancaEstado VARCHAR(30), ');
            vSQLCreate.Add('CobrancaCodigoPais VARCHAR(5), ');
            vSQLCreate.Add('CobrancaCodigoCidade VARCHAR(7), ');
            vSQLCreate.Add('TipoCliente SMALLINT, '); // 0 - Física, 1 - Jurídica
            vSQLCreate.Add('CpfCnpj VARCHAR(18), ');
            vSQLCreate.Add('IeRg VARCHAR(18), ');
            vSQLCreate.Add('Telefone1 VARCHAR(18), ');
            vSQLCreate.Add('Telefone2 VARCHAR(18), ');
            vSQLCreate.Add('Telefone3 VARCHAR(18), ');
            vSQLCreate.Add('Telefone4 VARCHAR(18), ');
            vSQLCreate.Add('Fax1 VARCHAR(18), ');
            vSQLCreate.Add('Fax2 VARCHAR(18), ');
            vSQLCreate.Add('Celular1 VARCHAR(18), ');
            vSQLCreate.Add('Celular2 VARCHAR(18), ');
            vSQLCreate.Add('DataCadastro DATE, ');
            vSQLCreate.Add('DataNascto DATE, ');
            vSQLCreate.Add('Site VARCHAR(60), ');
            vSQLCreate.Add('Contato VARCHAR(60), ');
            vSQLCreate.Add('CodigoGrupo '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoTipo '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoStatus '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('DataTransforma DATE, ');
            vSQLCreate.Add('EmailSkype VARCHAR(60), ');
            vSQLCreate.Add('TelSkype VARCHAR(60),');
            vSQLCreate.Add('SetorNormal '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('Setor VARCHAR(5), ');
            vSQLCreate.Add('Observacao1 TEXT, ');
            vSQLCreate.Add('Observacao2 TEXT, ');
            vSQLCreate.Add('ObsFinanceiro1 TEXT, ');
            vSQLCreate.Add('ObsFinanceiro2 TEXT, ');
            vSQLCreate.Add('MSN VARCHAR(60), ');
            vSQLCreate.Add('ConheceuPor VARCHAR(60), ');
            vSQLCreate.Add('EmailNfeXML VARCHAR(100), ');
            vSQLCreate.Add('EmailNfeDanfe VARCHAR(100), ');
            vSQLCreate.Add('CodigoCRT '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('PRIMARY KEY (CodigoCliente) ');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='contatos';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;  

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('CodigoContato '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('RazaoSocial VARCHAR(100), ');
            vSQLCreate.Add('NomeFantasia VARCHAR(100), ');
            vSQLCreate.Add('Endereco VARCHAR(100), ');
            vSQLCreate.Add('Numero VARCHAR(10), ');
            vSQLCreate.Add('Complemento VARCHAR(50), ');
            vSQLCreate.Add('Bairro VARCHAR(30), ');
            vSQLCreate.Add('Cep VARCHAR(15), ');
            vSQLCreate.Add('Estado VARCHAR(30), ');
            vSQLCreate.Add('CodigoPais VARCHAR(5), ');
            vSQLCreate.Add('CodigoCidade VARCHAR(7), ');
            vSQLCreate.Add('EntregaEndereco VARCHAR(100), ');
            vSQLCreate.Add('EntregaNumero VARCHAR(10), ');
            vSQLCreate.Add('EntregaComplemento VARCHAR(50), ');
            vSQLCreate.Add('EntregaBairro VARCHAR(30), ');
            vSQLCreate.Add('EntregaCep VARCHAR(15), ');
            vSQLCreate.Add('EntregaEstado VARCHAR(30), ');
            vSQLCreate.Add('EntregaCodigoPais VARCHAR(5), ');
            vSQLCreate.Add('EntregaCodigoCidade VARCHAR(7), ');
            vSQLCreate.Add('CobrancaEndereco VARCHAR(100), ');
            vSQLCreate.Add('CobrancaNumero VARCHAR(10), ');
            vSQLCreate.Add('CobrancaComplemento VARCHAR(50), ');
            vSQLCreate.Add('CobrancaBairro VARCHAR(30), ');
            vSQLCreate.Add('CobrancaCep VARCHAR(15), ');
            vSQLCreate.Add('CobrancaEstado VARCHAR(30), ');
            vSQLCreate.Add('CobrancaCodigoPais VARCHAR(5), ');
            vSQLCreate.Add('CobrancaCodigoCidade VARCHAR(7), ');
            vSQLCreate.Add('TipoContato SMALLINT, '); // Física, Jurídica
            vSQLCreate.Add('CpfCnpj VARCHAR(18), ');
            vSQLCreate.Add('IeRg VARCHAR(18), ');
            vSQLCreate.Add('Telefone1 VARCHAR(18), ');
            vSQLCreate.Add('Telefone2 VARCHAR(18), ');
            vSQLCreate.Add('Telefone3 VARCHAR(18), ');
            vSQLCreate.Add('Telefone4 VARCHAR(18), ');
            vSQLCreate.Add('Fax1 VARCHAR(18), ');
            vSQLCreate.Add('Fax2 VARCHAR(18), ');
            vSQLCreate.Add('Celular1 VARCHAR(18), ');
            vSQLCreate.Add('Celular2 VARCHAR(18), ');
            vSQLCreate.Add('DataCadastro DATE, ');
            vSQLCreate.Add('DataNascto DATE, ');
            vSQLCreate.Add('Site VARCHAR(60), ');
            vSQLCreate.Add('Contato VARCHAR(60), ');
            vSQLCreate.Add('CodigoGrupo '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoTipo '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoStatus '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('DataTransforma DATE, ');
            vSQLCreate.Add('EmailSkype VARCHAR(60), ');
            vSQLCreate.Add('TelSkype VARCHAR(60),');
            vSQLCreate.Add('SetorNormal '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('Setor VARCHAR(5), ');
            vSQLCreate.Add('Observacao1 TEXT, ');
            vSQLCreate.Add('Observacao2 TEXT, ');
            vSQLCreate.Add('ObsFinanceiro1 TEXT, ');
            vSQLCreate.Add('ObsFinanceiro2 TEXT, ');
            vSQLCreate.Add('MSN VARCHAR(60), ');
            vSQLCreate.Add('ConheceuPor VARCHAR(60), ');
            vSQLCreate.Add('EmailNfeXML VARCHAR(100), ');
            vSQLCreate.Add('EmailNfeDanfe VARCHAR(100), ');
            vSQLCreate.Add('CodigoCRT '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('PRIMARY KEY (CodigoContato) ');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --   
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='fornecedores';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);

         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('CodigoFornecedor '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('RazaoSocial VARCHAR(100), ');
            vSQLCreate.Add('NomeFantasia VARCHAR(100), ');
            vSQLCreate.Add('Endereco VARCHAR(100), ');
            vSQLCreate.Add('Numero VARCHAR(10), ');
            vSQLCreate.Add('Complemento VARCHAR(50), ');
            vSQLCreate.Add('Bairro VARCHAR(30), ');
            vSQLCreate.Add('Cep VARCHAR(15), ');
            vSQLCreate.Add('Estado VARCHAR(30), ');
            vSQLCreate.Add('CodigoPais VARCHAR(5), ');
            vSQLCreate.Add('CodigoCidade VARCHAR(7), ');
            vSQLCreate.Add('DepositoEndereco VARCHAR(100), ');
            vSQLCreate.Add('DepositoNumero VARCHAR(10), ');
            vSQLCreate.Add('DepositoComplemento VARCHAR(50), ');
            vSQLCreate.Add('DepositoBairro VARCHAR(30), ');
            vSQLCreate.Add('DepositoCep VARCHAR(15), ');
            vSQLCreate.Add('DepositoEstado VARCHAR(30), ');
            vSQLCreate.Add('DepositoCodigoPais VARCHAR(5), ');
            vSQLCreate.Add('DepositoCodigoCidade VARCHAR(7), ');
            vSQLCreate.Add('CorrespoEndereco VARCHAR(100), ');
            vSQLCreate.Add('CorrespoNumero VARCHAR(10), ');
            vSQLCreate.Add('CorrespoComplemento VARCHAR(50), ');
            vSQLCreate.Add('CorrespoBairro VARCHAR(30), ');
            vSQLCreate.Add('CorrespoCep VARCHAR(15), ');
            vSQLCreate.Add('CorrespoEstado VARCHAR(30), ');
            vSQLCreate.Add('CorrespoCodigoPais VARCHAR(5), ');
            vSQLCreate.Add('CorrespoCodigoCidade VARCHAR(7), ');
            vSQLCreate.Add('TipoFornecedor SMALLINT, ');
            vSQLCreate.Add('CpfCnpj VARCHAR(18), ');
            vSQLCreate.Add('IeRg VARCHAR(18), ');
            vSQLCreate.Add('Telefone1 VARCHAR(18), ');
            vSQLCreate.Add('Telefone2 VARCHAR(18), ');
            vSQLCreate.Add('Telefone3 VARCHAR(18), ');
            vSQLCreate.Add('Telefone4 VARCHAR(18), ');
            vSQLCreate.Add('Fax1 VARCHAR(18), ');
            vSQLCreate.Add('Fax2 VARCHAR(18), ');
            vSQLCreate.Add('Celular1 VARCHAR(18), ');
            vSQLCreate.Add('Celular2 VARCHAR(18), ');
            vSQLCreate.Add('DataCadastro DATE, ');
            vSQLCreate.Add('DataNascto DATE, ');
            vSQLCreate.Add('Site VARCHAR(60), ');
            vSQLCreate.Add('Contato VARCHAR(60), ');
            vSQLCreate.Add('CodigoGrupo '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoTipo '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoStatus '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('DataTransforma DATE, ');
            vSQLCreate.Add('EmailSkype VARCHAR(60), ');
            vSQLCreate.Add('TelSkype VARCHAR(60),');
            vSQLCreate.Add('SetorNormal '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('Setor VARCHAR(5), ');
            vSQLCreate.Add('Observacao1 TEXT, ');
            vSQLCreate.Add('Observacao2 TEXT, ');
            vSQLCreate.Add('ObsFinanceiro1 TEXT, ');
            vSQLCreate.Add('ObsFinanceiro2 TEXT, ');
            vSQLCreate.Add('MSN VARCHAR(60), ');
            vSQLCreate.Add('ConheceuPor VARCHAR(60), ');
            vSQLCreate.Add('EmailNfeXML VARCHAR(100), ');
            vSQLCreate.Add('EmailNfeDanfe VARCHAR(100), ');
            vSQLCreate.Add('CodigoCRT '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('PRIMARY KEY (CodigoFornecedor) ');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;      
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='usuarios';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);

         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' ('); 
            vSQLCreate.Add('Usuario VARCHAR(20) NOT NULL, ');
            vSQLCreate.Add('Senha VARCHAR(30) NOT NULL, ');
            vSQLCreate.Add('CodigoPerfil '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('Telas TEXT, ');
            vSQLCreate.Add('PRIMARY KEY (Usuario) ');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;      
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='empresas';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);

         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('CodigoEmpresa '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('RazaoSocial VARCHAR(100), ');
            vSQLCreate.Add('NomeFantasia VARCHAR(100), ');
            vSQLCreate.Add('Endereco VARCHAR(60), ');
            vSQLCreate.Add('CodigoCidade VARCHAR(7), '); 
            vSQLCreate.Add('Telefone VARCHAR(20), '); 
            vSQLCreate.Add('Fax VARCHAR(20), ');
            vSQLCreate.Add('Cep VARCHAR(15), ');
            vSQLCreate.Add('Bairro VARCHAR(20), ');
            vSQLCreate.Add('CNPJ VARCHAR(18), ');
            vSQLCreate.Add('Email VARCHAR(60), ');
            vSQLCreate.Add('Site VARCHAR(60), ');
            vSQLCreate.Add('Estado VARCHAR(2), ');
            vSQLCreate.Add('IE VARCHAR(18), ');
            vSQLCreate.Add('TextoObsOrcamento VARCHAR(70), '); 
            vSQLCreate.Add('Numero VARCHAR(10), ');
            vSQLCreate.Add('ObsNotaFiscal VARCHAR(200), ');
            vSQLCreate.Add('SMTPServidor VARCHAR(50), ');
            vSQLCreate.Add('SMTPUsuario VARCHAR(60), ');
            vSQLCreate.Add('SMTPSenha VARCHAR(20), ');
            vSQLCreate.Add('SMTPPorta SMALLINT, ');
            vSQLCreate.Add('POPServidor VARCHAR(50), ');
            vSQLCreate.Add('Garantia1 VARCHAR(150), ');
            vSQLCreate.Add('Garantia2 VARCHAR(150), ');
            vSQLCreate.Add('FormaPagto1 VARCHAR(150), ');
            vSQLCreate.Add('FormaPagto2 VARCHAR(150), ');
            vSQLCreate.Add('TextoNota2 VARCHAR(80), ');
            vSQLCreate.Add('TextoNota3 VARCHAR(80), ');
            vSQLCreate.Add('NFeEnvioAssunto VARCHAR(50), ');
            vSQLCreate.Add('NFeEnvioMSG TEXT, ');
            vSQLCreate.Add('NFeCaminhoExportaTXT VARCHAR(255), ');
            vSQLCreate.Add('NFeCaminhoExportaXML VARCHAR(255), ');
            vSQLCreate.Add('NFECaminhoExportaPDF VARCHAR(255), ');
            vSQLCreate.Add('AliqAproveitamento '+cFloatType2Dec+', ');
            vSQLCreate.Add('EmailRetornoNFe VARCHAR(50), ');
            vSQLCreate.Add('PISTipo VARCHAR(3), ');
            vSQLCreate.Add('COFINSTipo VARCHAR(3), ');
            vSQLCreate.Add('IPITipo VARCHAR(3), ');
            vSQLCreate.Add('CRT SMALLINT, ');
            vSQLCreate.Add('IM VARCHAR(15), ');
            vSQLCreate.Add('CNAEFiscal VARCHAR(7), ');
            vSQLCreate.Add('CodigoPais VARCHAR(4), ');
            vSQLCreate.Add('Complemento VARCHAR(30), ');
            vSQLCreate.Add('PRIMARY KEY (CodigoEmpresa) ');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;       
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='genericos';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);

         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('Codigo '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Descricao VARCHAR(60), ');
            vSQLCreate.Add('Tipo VARCHAR(2), ');
            vSQLCreate.Add('PRIMARY KEY (Codigo)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;      
         finally
            vSQLCreate.Free;
         end;

         // Tipos de Genéricos:
         // 1  - Grupos
         // 2  - SubGrupos --------------------> (Nao usa mais)
         // 3  - Departamento
         // 4  - Tipos de Vendas
         // 5  - Tipos de Liquidação
         // 6  - Tipos de Orçamento
         // 7  - Localização dos Titulos
         // 8  - Cores  -----------------------> (Não usa mais)
         // 9  - Modelos
         // 10 - Situação Cheque
         // 11 - Grupos de Clientes
         // 12 - Tipos de Clientes
         // 13 - Status de Clientes
         // 14 - Status de Funcionários
         // 15 - Assuntos
         // 16 - Resultados
         // 17 - Tipos de NF
         // 18 - Status Pedido
         // 19 - Moedas -----------------------> (Não usa mais, estava conflitando com "Tipos de Indices Financeiros")
         // 20 - Tipos de Indices Financeiros
         // 21 - Responsavel Titulos
         // 22 - Setor de Trabalho
         // 23 - Classificação de Produtos ----> (Nao usa Mais)
         // 24 - Regime Tributário
         // 25 - Grau Parentesco (Funcionarios Dependentes)
         // 26 - Estado Civil (Funcionários)
         // 27 - Tipos de Ausências.
         // 28 - Tipos de Advertências.

         // --  
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='produtos_status_estoque';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);

         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('CodigoProduto VARCHAR(20) NOT NULL, ');
            vSQLCreate.Add('Estoque '+cFloatType2Dec+', ');
            vSQLCreate.Add('Faltas '+cFloatType2Dec+', ');
            vSQLCreate.Add('Empenho '+cFloatType2Dec+', ');
            vSQLCreate.Add('Interno '+cFloatType2Dec+', ');
            vSQLCreate.Add('Disponivel '+cFloatType2Dec+', ');
            vSQLCreate.Add('PRIMARY KEY (CodigoProduto)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='tipos_tabela_preco';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);

         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('Codigo '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Descricao VARCHAR(50), ');
            vSQLCreate.Add('PRIMARY KEY (Codigo)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='tabela_precos';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;
         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('CodigoProduto VARCHAR(20) NOT NULL, ');
            vSQLCreate.Add('CodigoTabela '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('ValorAtual '+cDoubleType2Dec+', ');
            vSQLCreate.Add('DataReajuste DATE, ');
            vSQLCreate.Add('PRIMARY KEY (CodigoProduto, CodigoTabela)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='produtos_fotos';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);

         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('ID '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('CodigoProduto VARCHAR(20) NOT NULL, ');
            vSQLCreate.Add('Foto LONGBLOB NOT NULL, ');
            vSQLCreate.Add('PRIMARY KEY (ID)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='unidades';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);

         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('Codigo '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Sigla VARCHAR(5), ');
            vSQLCreate.Add('Descricao VARCHAR(50), ');
            vSQLCreate.Add('Quantidade ' + cFloatTypeNoDec + ' NULL, ');
            vSQLCreate.Add('PRIMARY KEY (Codigo)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='ultimas_compras';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('ID '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('CodigoProduto VARCHAR(20), ');
            vSQLCreate.Add('CodigoFornecedor '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoFuncionario '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('Documento '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('DataCompra DATE, ');
            vSQLCreate.Add('ValorCompra '+cDoubleType2Dec+', ');
            vSQLCreate.Add('Quantidade '+cFloatType2Dec+', ');
            vSQLCreate.Add('PRIMARY KEY (ID)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;
  
         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='produtos';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
 
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('CodigoProduto VARCHAR(20) NOT NULL, ');
            vSQLCreate.Add('NomeTecnico VARCHAR(100), ');
            vSQLCreate.Add('NomeIngles VARCHAR(100), ');
            vSQLCreate.Add('Peso '+cFloatType3Dec+', ');
            vSQLCreate.Add('CodigoGrupo '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoSubGrupo '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoModelo '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoUnidade '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoClassificacao '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoMoeda '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('PontoReposicao '+cFloatType2Dec+', ');
            vSQLCreate.Add('Endereco VARCHAR(50), '); 
            vSQLCreate.Add('NCM VARCHAR(10), ');
            vSQLCreate.Add('EXTIPI VARCHAR(2), ');
            vSQLCreate.Add('EntraTabelaEstoque SMALLINT, ');
            vSQLCreate.Add('TempoFabricacao VARCHAR(30), ');
            vSQLCreate.Add('TempoCompras VARCHAR(30), ');
            vSQLCreate.Add('PercIPI '+cFloatType2Dec+', ');
            vSQLCreate.Add('ValorIPI '+cDoubleType2Dec+', '); // ** sem uso desde 21/11/11 (RS)
            vSQLCreate.Add('QtdMoeda '+cFloatType2Dec+', '); 
            vSQLCreate.Add('Observacao TEXT, ');
            vSQLCreate.Add('DescricaoDetalhada TEXT, ');
            vSQLCreate.Add('DescricaoIngles TEXT, ');
            vSQLCreate.Add('NMolde VARCHAR(20), ');
            vSQLCreate.Add('EntraTabelaPreco SMALLINT, ');
            vSQLCreate.Add('CodigoCor '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('ProdutoAcabado SMALLINT, ');
            vSQLCreate.Add('ValorCustoProduto '+cDoubleType2Dec+', ');
            vSQLCreate.Add('PercAdicionalCusto '+cFloatType2Dec+', '); // ** mudei para float 18/01/12 (RS)
            vSQLCreate.Add('ValorAdicionalObs TEXT, ');
            vSQLCreate.Add('PRIMARY KEY (CodigoProduto) ');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='orcamentos';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear; 
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('Orcamento '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('CodigoCliente '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoEmpresa '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoTabPreco '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoFuncionario '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoCFOP '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoFormaPagto '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('Data DATE, ');
            vSQLCreate.Add('Hora TIME, ');
            vSQLCreate.Add('PercDesconto '+cFloatType2Dec+', ');
            vSQLCreate.Add('ValorProdutos '+cDoubleType2Dec+', ');
            vSQLCreate.Add('ValorDesconto '+cDoubleType2Dec+', ');
            vSQLCreate.Add('ValorFrete '+cDoubleType2Dec+', ');
            vSQLCreate.Add('ValorAcrescimo '+cDoubleType2Dec+', ');
            vSQLCreate.Add('ValorSeguro '+cDoubleType2Dec+', ');
            vSQLCreate.Add('ValorTotal '+cDoubleType2Dec+', ');
            vSQLCreate.Add('NPedido '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('DataPedido DATE, ');
            vSQLCreate.Add('Contato VARCHAR(50), ');
            vSQLCreate.Add('CodigoTransportadora '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('FreteIncluido SMALLINT, ');
            vSQLCreate.Add('TipoOrcamento '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('Observacao TEXT, ');
            vSQLCreate.Add('PrazoEntrega VARCHAR(60), ');
            vSQLCreate.Add('Parcelas SMALLINT, ');         
            vSQLCreate.Add('PRIMARY KEY (Orcamento) ');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='orcamentos_produtos';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);

         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('Orcamento '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('CodigoProduto VARCHAR(20), ');
            vSQLCreate.Add('Descricao VARCHAR(50), ');
            vSQLCreate.Add('Quantidade '+cFloatType2Dec+', ');
            vSQLCreate.Add('Valor '+cDoubleType2Dec+', ');
            vSQLCreate.Add('ValorTotal '+cDoubleType2Dec+', ');
            vSQLCreate.Add('PRIMARY KEY (Orcamento, CodigoProduto) ');  
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='pedidos';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('NPedido '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Orcamento '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('Venda '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoCliente '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoEmpresa '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoTabPreco '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoFuncionario '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoCFOP '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoFormaPagto '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('Data DATE, ');
            vSQLCreate.Add('Hora TIME, ');
            vSQLCreate.Add('PercDesconto '+cFloatType2Dec+', ');
            vSQLCreate.Add('ValorProdutos '+cDoubleType2Dec+', ');
            vSQLCreate.Add('ValorDesconto '+cDoubleType2Dec+', ');
            vSQLCreate.Add('ValorFrete '+cDoubleType2Dec+', ');
            vSQLCreate.Add('ValorAcrescimo '+cDoubleType2Dec+', ');
            vSQLCreate.Add('ValorSeguro '+cDoubleType2Dec+', ');
            vSQLCreate.Add('ValorTotal '+cDoubleType2Dec+', ');
            vSQLCreate.Add('StatusPedido '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('DataPrevisao DATE, ');
            vSQLCreate.Add('DataEntrega DATE, ');
            vSQLCreate.Add('Contato VARCHAR(50), ');
            vSQLCreate.Add('CodigoTransportadora '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('FretePago SMALLINT, ');
            vSQLCreate.Add('ObsPro TEXT, ');
            vSQLCreate.Add('ObsAdm TEXT, ');
            vSQLCreate.Add('ObsExp TEXT, ');
            vSQLCreate.Add('QtdCaixas SMALLINT, ');
            vSQLCreate.Add('Parcelas SMALLINT, ');
            vSQLCreate.Add('DataProducao DATE, ');
            vSQLCreate.Add('Extorno SMALLINT, ');
            vSQLCreate.Add('CodigoTransporte SMALLINT, ');
            vSQLCreate.Add('OutrosTransporte VARCHAR(30), ');
            // Pedido de Administração
            vSQLCreate.Add('OpcoesAdm VARCHAR(100), ');
            // Pedido de Expedição
            vSQLCreate.Add('OpcoesExp VARCHAR(100), ');
            // Pedido de Produção / Expedição
            vSQLCreate.Add('OpcoesProdExp VARCHAR(100), ');
            // Pedido de Produção
            vSQLCreate.Add('OpcoesProd VARCHAR(100), ');
            // Exportação
            vSQLCreate.Add('UFEmbarque VARCHAR(2), ');
            vSQLCreate.Add('LocalEmbarque VARCHAR(60), ');
            vSQLCreate.Add('CSTCSOSN VARCHAR(5), ');
            vSQLCreate.Add('CFOP VARCHAR(5), ');
            vSQLCreate.Add('Fatura VARCHAR(20), ');
            vSQLCreate.Add('TotalItens '+cFloatType2Dec+', '); 
            vSQLCreate.Add('Conhecimento VARCHAR(20), ');
            vSQLCreate.Add('OrdemCompra VARCHAR(20), '); 
            vSQLCreate.Add('HoraProducao TIME, ');
            vSQLCreate.Add('ConstarACRotulo VARCHAR(30), ');
            vSQLCreate.Add('ConstarDadosAdNota TEXT, ');
            vSQLCreate.Add('ImpressaoRotulo TINYINT, ');
            vSQLCreate.Add('PRIMARY KEY (NPedido) ');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='titulos_receber';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('Titulo '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Documento '+cFloatTypeNoDec+' NOT NULL, ');     
            vSQLCreate.Add('CodigoConta '+cFloatTypeNoDec+' NOT NULL, ');   // - Código do Cliente
            vSQLCreate.Add('Parcela SMALLINT, ');
            vSQLCreate.Add('TipoConta VARCHAR(2), ');               // 1 - Cliente
            vSQLCreate.Add('CodigoLocalizacao '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoEmpresa '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoResponsavel '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('ValorTotal '+cDoubleType2Dec+', ');
            vSQLCreate.Add('DataEmissao DATE, ');
            vSQLCreate.Add('DataVencimento DATE, ');
            vSQLCreate.Add('DataPagamento DATE, ');
            vSQLCreate.Add('DataBoleto DATE, ');
            vSQLCreate.Add('ValorDesconto '+cDoubleType2Dec+', ');
            vSQLCreate.Add('ValorAcrescimo '+cDoubleType2Dec+', ');
            vSQLCreate.Add('NossoNumero VARCHAR(30), ');
            vSQLCreate.Add('NotaFiscal VARCHAR(20), ');
            vSQLCreate.Add('TipoLiquida '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('Historico VARCHAR(255), ');
            vSQLCreate.Add('CodigoCentroCusto VARCHAR(20), ');
            vSQLCreate.Add('Observacao TEXT, ');
            vSQLCreate.Add('NumeroCheque VARCHAR(30), ');
            vSQLCreate.Add('Serie VARCHAR(3), ');
            vSQLCreate.Add('PedidoVenda SMALLINT, '); // '1' Gerado atraves de pedido de venda, '0' gerado avuslo
            vSQLCreate.Add('ValorImposto '+cDoubleType2Dec+', ');
            vSQLCreate.Add('ImpressoBoleto VARCHAR(3), '); // Sim, Não
            vSQLCreate.Add('GeradoRemessa VARCHAR(3), '); // Sim, Não
            vSQLCreate.Add('CodigoContaBancaria '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('NumeroRemessa VARCHAR(10), ');
            vSQLCreate.Add('Sinalizado SMALLINT, ');
            vSQLCreate.Add('Instrucoes TEXT, ');
            vSQLCreate.Add('Triplicata SMALLINT, ');              
            vSQLCreate.Add('PRIMARY KEY (Titulo) ');    
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='titulos_pagar';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);

         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('Titulo '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Documento '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('CodigoConta '+cFloatTypeNoDec+' NOT NULL, ');   // - Código do Fornecedor, Código do Funcionário, Código do Banco, etc...
            vSQLCreate.Add('Parcela SMALLINT, ');
            vSQLCreate.Add('TipoConta VARCHAR(2), ');               // 1 - Fornecedor, 2 - Funcionário, 3 - Transportadora, 4 - Banco
            vSQLCreate.Add('CodigoLocalizacao '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoEmpresa '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoResponsavel '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('ValorTotal '+cDoubleType2Dec+', ');
            vSQLCreate.Add('DataEmissao DATE, ');
            vSQLCreate.Add('DataVencimento DATE, ');
            vSQLCreate.Add('DataPagamento DATE, ');
            vSQLCreate.Add('DataBoleto DATE, ');
            vSQLCreate.Add('ValorDesconto '+cDoubleType2Dec+', ');
            vSQLCreate.Add('ValorAcrescimo '+cDoubleType2Dec+', ');
            vSQLCreate.Add('NossoNumero VARCHAR(30), ');
            vSQLCreate.Add('NotaFiscal VARCHAR(20), ');
            vSQLCreate.Add('TipoLiquida '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('Historico VARCHAR(255), ');
            vSQLCreate.Add('CodigoCentroCusto VARCHAR(20), ');
            vSQLCreate.Add('Observacao TEXT, ');
            vSQLCreate.Add('NumeroCheque VARCHAR(30), ');
            vSQLCreate.Add('Serie VARCHAR(3), ');
            vSQLCreate.Add('DescricaoConta VARCHAR(20), '); // Fornecedor, Funcionário, Transportadora, Banco
            vSQLCreate.Add('Sinalizado SMALLINT, ');
            vSQLCreate.Add('PRIMARY KEY (Titulo)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='titulos_receber_liquidacoes';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros); 
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('ID '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Titulo '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('TipoLiquida '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('DataLiquida DATE, ');
            vSQLCreate.Add('ValorLiquida '+cDoubleType2Dec+', ');         
            vSQLCreate.Add('Observacao TEXT, ');
            vSQLCreate.Add('Sinalizado SMALLINT, ');            
            vSQLCreate.Add('PRIMARY KEY (ID) ');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;      

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='titulos_pagar_liquidacoes';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('ID '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Titulo '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('TipoLiquida '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('DataLiquida DATE, ');
            vSQLCreate.Add('ValorLiquida '+cDoubleType2Dec+', ');         
            vSQLCreate.Add('Observacao TEXT, ');
            vSQLCreate.Add('Sinalizado SMALLINT, '); 
            vSQLCreate.Add('PRIMARY KEY (ID) '); 
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end; 
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='cfop';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('CodigoCFOP '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('CFOP VARCHAR(5), ');
            vSQLCreate.Add('NaturezaOperacao VARCHAR(100), ');
            vSQLCreate.Add('PRIMARY KEY (CodigoCFOP) ');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='pedidos_compras';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('Pedido '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Data DATE, ');
            vSQLCreate.Add('Hora TIME, ');
            vSQLCreate.Add('DataPrevisao DATE, ');
            vSQLCreate.Add('CodigoTabelaPreco '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('DataRecebimento DATE, ');
            vSQLCreate.Add('CodigoCFOP '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoFornecedor '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('Contato VARCHAR(30), ');
            vSQLCreate.Add('Conhecimento VARCHAR(30), ');
            vSQLCreate.Add('Observacao TEXT, ');
            vSQLCreate.Add('CodigoFuncionario '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoTransportadora '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('FretePagoCliente SMALLINT, ');
            vSQLCreate.Add('QtdCaixas '+cFloatType2Dec+', ');
            vSQLCreate.Add('ValorIPI '+cDoubleType2Dec+', ');
            vSQLCreate.Add('ValorFrete '+cDoubleType2Dec+', ');
            vSQLCreate.Add('ValorDesconto '+cDoubleType2Dec+', ');
            vSQLCreate.Add('ValorProdutos '+cDoubleType2Dec+', ');
            vSQLCreate.Add('ValorTotal '+cDoubleType2Dec+', ');
            vSQLCreate.Add('CodigoFormaPagto '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('Parcelas SMALLINT, ');
            vSQLCreate.Add('CodigoCentroCusto VARCHAR(20), ');
            vSQLCreate.Add('NotaFiscal VARCHAR(20), ');
            vSQLCreate.Add('CodigoEmpresa '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('DataCancelamento DATE, ');
            vSQLCreate.Add('ValorAcrescimo '+cDoubleType2Dec+', ');
            vSQLCreate.Add('Requisicao '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('PRIMARY KEY (Pedido) ');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='pedidos_compra_produtos';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('ID '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Pedido '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('CodigoProduto VARCHAR(20) NOT NULL, ');
            vSQLCreate.Add('Descricao VARCHAR(50), ');
            vSQLCreate.Add('Quantidade '+cFloatType4Dec+', ');
            vSQLCreate.Add('Valor '+cDoubleType4Dec+', ');
            vSQLCreate.Add('ValorTotal '+cDoubleType4Dec+', ');
            vSQLCreate.Add('DataBaixa DATE, ');
            vSQLCreate.Add('CodigoFornecedor '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('PRIMARY KEY (ID) ');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='bancos';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('Codigo '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Descricao VARCHAR(30) NOT NULL, ');
            vSQLCreate.Add('Agencia VARCHAR(6), ');
            vSQLCreate.Add('Banco VARCHAR(4), ');
            vSQLCreate.Add('Conta VARCHAR(20), ');
            vSQLCreate.Add('SemValorComercial SMALLINT, ');            
            vSQLCreate.Add('PRIMARY KEY (Codigo) ');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='lancamentos_cheques';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('ID '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('CodigoBanco '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('ValorCheque '+cDoubleType2Dec+', ');
            vSQLCreate.Add('DataCheque DATE, ');
            vSQLCreate.Add('DataVencto DATE, ');
            vSQLCreate.Add('CodigoSituacao '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('Sacado VARCHAR(40), ');
            vSQLCreate.Add('Destino VARCHAR(40), ');
            vSQLCreate.Add('NumeroCheque SMALLINT, ');
            vSQLCreate.Add('DataBaixa DATE, ');
            vSQLCreate.Add('CodigoCliente '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('ValorJuros '+cDoubleType2Dec+', ');
            vSQLCreate.Add('ValorLiquido '+cDoubleType2Dec+', ');
            vSQLCreate.Add('DiasCheque SMALLINT, ');
            vSQLCreate.Add('PRIMARY KEY (ID) ');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='transportadoras';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('Codigo '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Nome VARCHAR(50), ');
            vSQLCreate.Add('Endereco VARCHAR(50), ');
            vSQLCreate.Add('Bairro VARCHAR(30), ');
            vSQLCreate.Add('Cep VARCHAR(15), ');
            vSQLCreate.Add('Estado VARCHAR(2), ');
            vSQLCreate.Add('Cnpj VARCHAR(18), ');
            vSQLCreate.Add('IE VARCHAR(18), ');
            vSQLCreate.Add('Telefone1 VARCHAR(18), ');
            vSQLCreate.Add('Telefone2 VARCHAR(18), ');
            vSQLCreate.Add('Telefone3 VARCHAR(18), ');
            vSQLCreate.Add('Telefone4 VARCHAR(18), ');
            vSQLCreate.Add('Fax1 VARCHAR(18), ');
            vSQLCreate.Add('Fax2 VARCHAR(18), ');
            vSQLCreate.Add('Celular1 VARCHAR(18), ');
            vSQLCreate.Add('Celular2 VARCHAR(18), ');
            vSQLCreate.Add('Observacao TEXT, ');
            vSQLCreate.Add('Site VARCHAR(60), ');
            vSQLCreate.Add('Numero VARCHAR(10), ');
            vSQLCreate.Add('CodigoCidade VARCHAR(7), ');
            vSQLCreate.Add('CodigoPais VARCHAR(5), ');
            vSQLCreate.Add('EmailNFE VARCHAR(100), ');
            vSQLCreate.Add('Complemento VARCHAR(30), ');
            vSQLCreate.Add('PRIMARY KEY (Codigo) ');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='clientes_emails';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear; 
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('ID '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('CodigoCliente '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('Descricao VARCHAR(60), ');
            vSQLCreate.Add('Email VARCHAR(100), ');
            vSQLCreate.Add('PRIMARY KEY (ID) ');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='fornecedores_emails';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('ID '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('CodigoFornecedor '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('Descricao VARCHAR(60), ');
            vSQLCreate.Add('Email VARCHAR(100), ');
            vSQLCreate.Add('PRIMARY KEY (ID) ');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='transportadoras_emails';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('ID '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('CodigoTransportadora '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('Descricao VARCHAR(60), ');
            vSQLCreate.Add('Email VARCHAR(100), ');
            vSQLCreate.Add('PRIMARY KEY (ID) ');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='contatos_emails';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);

         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('ID '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('CodigoContato '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('Descricao VARCHAR(60), ');
            vSQLCreate.Add('Email VARCHAR(100), ');
            vSQLCreate.Add('PRIMARY KEY (ID) ');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='formas_pagamento';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('Codigo '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Descricao VARCHAR(50), ');
            vSQLCreate.Add('Parcelas SMALLINT, ');
            vSQLCreate.Add('PRIMARY KEY (Codigo) ');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='parcelas_pagto';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('ID '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('CodigoFormaPagto '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Parcela SMALLINT, ');
            vSQLCreate.Add('Dias SMALLINT, ');
            vSQLCreate.Add('PesoParcela '+cFloatType2Dec+', ');
            vSQLCreate.Add('PRIMARY KEY (ID) ');
            vSQLCreate.Add(')'); 
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='funcionarios';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);

         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('Codigo '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Nome VARCHAR(50), ');
            vSQLCreate.Add('Endereco VARCHAR(50), ');
            vSQLCreate.Add('CodigoCidade VARCHAR(7), '); 
            vSQLCreate.Add('Bairro VARCHAR(30), ');
            vSQLCreate.Add('Cep VARCHAR(15), ');
            vSQLCreate.Add('Estado VARCHAR(2), ');
            vSQLCreate.Add('CodigoPais VARCHAR(5), ');
            vSQLCreate.Add('CPF VARCHAR(18), ');
            vSQLCreate.Add('RG VARCHAR(18), ');
            vSQLCreate.Add('Telefone1 VARCHAR(18), ');
            vSQLCreate.Add('Telefone2 VARCHAR(18), ');
            vSQLCreate.Add('FoneEmpresa VARCHAR(18), ');
            vSQLCreate.Add('Celular1 VARCHAR(18), ');
            vSQLCreate.Add('Celular2 VARCHAR(18), ');
            vSQLCreate.Add('Observacao TEXT, ');
            vSQLCreate.Add('DataAdmissao DATE, ');
            vSQLCreate.Add('DataSaida DATE, ');
            vSQLCreate.Add('DataNascto DATE, ');
            vSQLCreate.Add('CodigoCargo '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoStatus '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoDepto '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('Numero VARCHAR(10), ');
            vSQLCreate.Add('EmailEmpresa VARCHAR(60), ');
            vSQLCreate.Add('Usuario VARCHAR(20), ');
            vSQLCreate.Add('NomePai VARCHAR(60), ');
            vSQLCreate.Add('NomeMae VARCHAR(60), ');
            vSQLCreate.Add('Complemento VARCHAR(30), ');
            vSQLCreate.Add('DBAgencia VARCHAR(30), ');
            vSQLCreate.Add('DBConta VARCHAR(30), ');
            vSQLCreate.Add('DBBanco VARCHAR(30), ');
            vSQLCreate.Add('DBObservacao TEXT, ');
            vSQLCreate.Add('CodigoEstCivil '+cFloatTypeNoDec+', ');                        
            vSQLCreate.Add('PRIMARY KEY (Codigo) ');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='funcionarios_emails';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('ID '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('CodigoFuncionario '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('Descricao VARCHAR(60), ');
            vSQLCreate.Add('Email VARCHAR(100), ');
            vSQLCreate.Add('PRIMARY KEY (ID) ');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='cargos';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);

         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('Codigo '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Descricao VARCHAR(50), ');
            vSQLCreate.Add('ValorSalario '+cDoubleType2Dec+', ');
            vSQLCreate.Add('PRIMARY KEY (Codigo) ');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;
         
         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='clientes_contatos';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('ID '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('CodigoCliente '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Nome VARCHAR(60) NOT NULL, ');
            vSQLCreate.Add('PRIMARY KEY (ID) ');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='contatos_contatos';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('ID '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('CodigoContato '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Nome VARCHAR(60) NOT NULL, ');
            vSQLCreate.Add('PRIMARY KEY (ID) ');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='transportadoras_contatos';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('ID '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('CodigoTransportadora '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Nome VARCHAR(60) NOT NULL, ');
            vSQLCreate.Add('PRIMARY KEY (ID) ');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='fornecedores_contatos';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('ID '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('CodigoFornecedor '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Nome VARCHAR(60) NOT NULL, ');
            vSQLCreate.Add('PRIMARY KEY (ID) ');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='faturamento';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('Fatura VARCHAR(30) NOT NULL, ');
            vSQLCreate.Add('Serie VARCHAR(3) NOT NULL, ');
            vSQLCreate.Add('CodigoEmpresa '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('TipoTela '+cFloatTypeNoDec+' NOT NULL, ');// 1 - Cliente | 2 - Fornecedor
            vSQLCreate.Add('NPedido '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoConta '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('Data DATE, ');
            vSQLCreate.Add('ValorProdutos '+cDoubleType2Dec+', ');
            vSQLCreate.Add('ValorDesconto '+cDoubleType2Dec+', ');
            vSQLCreate.Add('ValorIPI '+cDoubleType2Dec+', ');
            vSQLCreate.Add('ValorTotal '+cDoubleType2Dec+', ');
            vSQLCreate.Add('PercDesc '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoFuncionario '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('Observacao TEXT, ');
            vSQLCreate.Add('TipoNota '+cFloatTypeNoDec+', ');// 1 - Saída | 2 - Entrada
            vSQLCreate.Add('CodigoTabPreco '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoFormaPagto '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('Parcelas SMALLINT, ');
            vSQLCreate.Add('CodigoCFOP '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoTransportadora '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('PesoLiquido VARCHAR(10), ');
            vSQLCreate.Add('PesoBruto VARCHAR(10), ');
            vSQLCreate.Add('Marca VARCHAR(20), ');
            vSQLCreate.Add('Especie VARCHAR(20), ');
            vSQLCreate.Add('FreteConta SMALLINT, ');  
            vSQLCreate.Add('FreteIncluido SMALLINT, ');
            vSQLCreate.Add('QtdVolumes SMALLINT, ');
            vSQLCreate.Add('ValorFrete '+cDoubleType2Dec+', ');
            vSQLCreate.Add('CodigoCentroCusto VARCHAR(20), ');
            vSQLCreate.Add('ValorAcrescimo '+cDoubleType2Dec+', ');
            vSQLCreate.Add('DataCancelamento DATE, ');
            vSQLCreate.Add('ValorSeguro '+cDoubleType2Dec+', ');
            vSQLCreate.Add('NFEFormaPagto VARCHAR(1), ');// (0 = Pagto A Vista, 1 = Pagamento a Prazo, 2 = Outros)
            vSQLCreate.Add('NFEFmtImpDANFE VARCHAR(1), ');// ( 1 = Retrato, 2 = Paisagem )
            vSQLCreate.Add('NFEIdentAmbiente VARCHAR(1), ');// (1 = Produção, 2 = Homologação)
            vSQLCreate.Add('UFEmbarque VARCHAR(2), ');
            vSQLCreate.Add('LocalEmbarque VARCHAR(60), ');
            vSQLCreate.Add('NDI VARCHAR(10), ');
            vSQLCreate.Add('DataDI DATE, ');
            vSQLCreate.Add('LocalDesembaraco VARCHAR(60), ');
            vSQLCreate.Add('UFDesembaraco VARCHAR(2), ');
            vSQLCreate.Add('DataDesembaraco DATE, ');
            vSQLCreate.Add('CodigoExportador VARCHAR(60), ');
            vSQLCreate.Add('CSTCSOSN VARCHAR(5), ');
            vSQLCreate.Add('CFOP VARCHAR(5), ');              
            vSQLCreate.Add('PRIMARY KEY (Fatura, Serie, CodigoEmpresa, TipoTela) ');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end; 

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='faturamento_produtos';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('ID '+cFloatTypeNoDec+' NOT NULL, ');   
            vSQLCreate.Add('Fatura VARCHAR(30) NOT NULL, ');
            vSQLCreate.Add('Serie VARCHAR(3) NOT NULL, ');
            vSQLCreate.Add('TipoTela '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('CodigoEmpresa '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('CodigoProduto VARCHAR(20), ');
            vSQLCreate.Add('Quantidade '+cFloatType3Dec+', ');
            vSQLCreate.Add('Valor '+cDoubleType2Dec+', ');
            vSQLCreate.Add('AliqICMS '+cFloatType2Dec+', ');
            vSQLCreate.Add('ValorTotal '+cDoubleType2Dec+', ');
            vSQLCreate.Add('Descricao VARCHAR(100), ');
            vSQLCreate.Add('Composto SMALLINT, ');
            vSQLCreate.Add('NCM VARCHAR(30), ');
            vSQLCreate.Add('AliqIPI '+cFloatType2Dec+', ');
            vSQLCreate.Add('AliqPIS '+cFloatType2Dec+', ');
            vSQLCreate.Add('AliqCOFINS '+cFloatType2Dec+', ');
            vSQLCreate.Add('PercReducaoBC '+cFloatType2Dec+', ');
            vSQLCreate.Add('Unidade VARCHAR(3), '); 
            vSQLCreate.Add('PRIMARY KEY (ID) ');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='faturamento_vencimentos';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('Fatura VARCHAR(30) NOT NULL, ');
            vSQLCreate.Add('Serie VARCHAR(3) NOT NULL, ');
            vSQLCreate.Add('CodigoEmpresa '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('TipoTela '+cFloatTypeNoDec+' NOT NULL, ');
            for vCnt:=1 to 12 do begin
               vSQLCreate.Add('Valor'+IntToStr(vCnt)+' '+cDoubleType2Dec+', ');
               vSQLCreate.Add('DataVencto'+IntToStr(vCnt)+' DATE, ');
            end;
            vSQLCreate.Add('PRIMARY KEY (Fatura, Serie, CodigoEmpresa, TipoTela)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='pedidos_produtos';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('ID '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('NPedido '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('CodigoProduto VARCHAR(20) NOT NULL, ');
            vSQLCreate.Add('Descricao VARCHAR(60), ');
            vSQLCreate.Add('Quantidade '+cFloatType2Dec+', ');
            vSQLCreate.Add('Valor '+cDoubleType2Dec+', ');
            vSQLCreate.Add('ValorTotal '+cDoubleType2Dec+', ');
            vSQLCreate.Add('Reservado '+cFloatType2Dec+', ');
            vSQLCreate.Add('PedidoProduzir '+cFloatType2Dec+', ');
            vSQLCreate.Add('Composto SMALLINT, ');
            vSQLCreate.Add('DataProducao DATE, ');
            vSQLCreate.Add('Referencia VARCHAR(20), ');
            vSQLCreate.Add('PRIMARY KEY (ID)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='pedidos_vencimentos';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('NPedido '+cFloatTypeNoDec+' NOT NULL, ');
            for vCnt:=1 to 12 do begin
               vSQLCreate.Add('Valor' + IntToStr(vCnt) + ' ' + cDoubleType2Dec+', ');
               vSQLCreate.Add('DataVencto' + IntToStr(vCnt) + ' DATE, ');
            end;
            vSQLCreate.Add('PRIMARY KEY (NPedido)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='cep';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('Cep VARCHAR(15), ');
            vSQLCreate.Add('Cidade VARCHAR(50), ');
            vSQLCreate.Add('Bairro VARCHAR(50), ');
            vSQLCreate.Add('Estado VARCHAR(2), ');
            vSQLCreate.Add('Endereco VARCHAR(50), ');
            vSQLCreate.Add('CodigoCidade VARCHAR(7),');            
            vSQLCreate.Add('PRIMARY KEY (Cep)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='centro_custo';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('Codigo VARCHAR(20), ');
            vSQLCreate.Add('Familia VARCHAR(20), ');
            vSQLCreate.Add('Descricao VARCHAR(100), ');
            vSQLCreate.Add('PRIMARY KEY (Codigo)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='ordem_producao';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo); 
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE ' +vNomeArquivo+' (');
            vSQLCreate.Add('OrdemProducao '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoCliente '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoPedido ' +cFloatTypeNoDec+', ');
            vSQLCreate.Add('Contato VARCHAR(50), ');
            vSQLCreate.Add('Data DATE, ');
            vSQLCreate.Add('Hora TIME, ');
            vSQLCreate.Add('DataPrevisao DATE, ');
            vSQLCreate.Add('DataTermino DATE, ');
            vSQLCreate.Add('CodigoFuncionario '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('Observacoes TEXT, ');
            vSQLCreate.Add('PRIMARY KEY (OrdemProducao)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='ordem_producao_produtos';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('ID '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('OrdemProducao '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoProduto VARCHAR(20), ');
            vSQLCreate.Add('Quantidade '+cFloatType2Dec+', ');
            vSQLCreate.Add('Descricao VARCHAR(50), ');
            vSQLCreate.Add('PRIMARY KEY (ID)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='packing_list';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('Pedido '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Data DATE, ');
            vSQLCreate.Add('Hora TIME, ');
            vSQLCreate.Add('CodigoCliente '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoTransportadora '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('ValorDesconto '+cDoubleType2Dec+', ');
            vSQLCreate.Add('ValorProdutos '+cDoubleType2Dec+', ');
            vSQLCreate.Add('ValorTotal '+cDoubleType2Dec+', ');
            vSQLCreate.Add('PRIMARY KEY (Pedido)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='packing_list_produtos';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('ID '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Pedido '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('CodigoProduto VARCHAR(20), ');
            vSQLCreate.Add('Descricao VARCHAR(60), ');
            vSQLCreate.Add('Quantidade '+cFloatType2Dec+', ');
            vSQLCreate.Add('CaixaNum SMALLINT, ');
            vSQLCreate.Add('CodigoCaixa VARCHAR(15), ');
            vSQLCreate.Add('Peso '+cFloatType3Dec+', ');                                     
            vSQLCreate.Add('PRIMARY KEY (ID)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='pedidos_compra_vencimentos';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('Pedido '+cFloatTypeNoDec+' NOT NULL, ');
            for vCnt:=1 to 12 do begin
               vSQLCreate.Add('Valor'      +IntToStr(vCnt)+' DOUBLE, ');
               vSQLCreate.Add('DataVencto'+IntToStr(vCnt)+' DATE, ');
            end;
            vSQLCreate.Add('PRIMARY KEY (Pedido)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;
         
         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='indices_financeiros';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('Codigo '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Valor '+cDoubleType4Dec+' NOT NULL, ');
            vSQLCreate.Add('Data DATE NOT NULL, ');
            vSQLCreate.Add('PRIMARY KEY (Codigo, Data)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='orcamentos_enviados_email';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('ID '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Usuario VARCHAR(20) NOT NULL, ');
            vSQLCreate.Add('Data DATE, ');
            vSQLCreate.Add('Hora TIME, ');
            vSQLCreate.Add('Orcamento '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('DeNome VARCHAR(100), ');
            vSQLCreate.Add('DeEmail VARCHAR(60), ');
            vSQLCreate.Add('ParaNome VARCHAR(100), ');
            vSQLCreate.Add('ParaEmail VARCHAR(60), ');
            vSQLCreate.Add('Assunto VARCHAR(50), ');
            vSQLCreate.Add('Mensagem TEXT, ');
            vSQLCreate.Add('PRIMARY KEY (ID)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='setor';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros); 
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('Codigo '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Setor VARCHAR(5) NOT NULL, ');
            vSQLCreate.Add('Bairro VARCHAR(50), ');
            vSQLCreate.Add('CodigoCidade VARCHAR(7), ');
            vSQLCreate.Add('Estado VARCHAR(2), ');
            vSQLCreate.Add('PRIMARY KEY (Codigo)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='tabela_pesos';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('CodigoTabelaPeso '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('CodigoTransportadora '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('PesoInicial '+cFloatType3Dec+', ');
            vSQLCreate.Add('PesoFinal '+cFloatType3Dec+', ');
            vSQLCreate.Add('Valor '+cDoubleType2Dec+', ');
            vSQLCreate.Add('PRIMARY KEY (CodigoTabelaPeso, CodigoTransportadora)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='estados';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('CodigoEstado '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Descricao VARCHAR(10) NOT NULL, ');
            vSQLCreate.Add('PRIMARY KEY (CodigoEstado)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='estados_pesos';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('CodigoEstado '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('CodigoTabelaPeso '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('CodigoTransportadora '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('PRIMARY KEY (CodigoEstado, CodigoTabelaPeso, CodigoTransportadora)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='tabela_correio';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('ID '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Data DATE, ');
            vSQLCreate.Add('Pedido '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('ValorCobrado '+cDoubleType2Dec+', ');
            vSQLCreate.Add('ValorCorreio '+cDoubleType2Dec+', ');
            vSQLCreate.Add('ValorTotal '+cDoubleType2Dec+', ');            
            vSQLCreate.Add('Conhecimento VARCHAR(20), ');
            vSQLCreate.Add('PRIMARY KEY (ID)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='pedidos_part_func';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('NPedido '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('CodigoFuncionario '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Observacao TEXT, ');
            vSQLCreate.Add('ValorDesconto '+cDoubleType2Dec+', ');
            vSQLCreate.Add('PRIMARY KEY (NPedido, CodigoFuncionario)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='cidades';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('CodigoCidade VARCHAR(7) NOT NULL, ');
            vSQLCreate.Add('Cidade VARCHAR(30), ');
            vSQLCreate.Add('Estado VARCHAR(30), ');
            vSQLCreate.Add('UF VARCHAR(2), ');
            vSQLCreate.Add('CodigoPais VARCHAR(5), ');
            vSQLCreate.Add('PRIMARY KEY (CodigoCidade)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='paises';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('CodigoPais VARCHAR(5) NOT NULL, ');
            vSQLCreate.Add('Pais VARCHAR(60), ');
            vSQLCreate.Add('PRIMARY KEY (CodigoPais)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='moldes';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('NMolde VARCHAR(20) NOT NULL, ');
            vSQLCreate.Add('Endereco VARCHAR(60), ');
            vSQLCreate.Add('DataFabricacao DATE, ');
            vSQLCreate.Add('Tipo VARCHAR(30), ');
            vSQLCreate.Add('Peso VARCHAR(10), ');
            vSQLCreate.Add('CodigoSetor '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('Descricao VARCHAR(60), ');
            vSQLCreate.Add('CodigoGrupo '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoCor '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('NumeroCavidades VARCHAR(10), ');
            vSQLCreate.Add('MoldeTipoCaixa VARCHAR(20), ');
            vSQLCreate.Add('Observacoes TEXT, ');
            vSQLCreate.Add('NMoldeCliente VARCHAR(30), ');
            vSQLCreate.Add('PRIMARY KEY (NMolde)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally 
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='ativos';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('Codigo '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Nome VARCHAR(50), ');
            vSQLCreate.Add('Marca VARCHAR(50), ');
            vSQLCreate.Add('Modelo VARCHAR(50), ');
            vSQLCreate.Add('Voltagem VARCHAR(50), ');
            vSQLCreate.Add('NumeroSerie VARCHAR(50), ');
            vSQLCreate.Add('Procedencia VARCHAR(50), ');
            vSQLCreate.Add('Importador VARCHAR(50), ');
            vSQLCreate.Add('Composicao TEXT, ');
            vSQLCreate.Add('DataAquisicao DATE, ');
            vSQLCreate.Add('NotaFiscal VARCHAR(20), ');
            vSQLCreate.Add('Valor '+cDoubleType2Dec+', ');
            vSQLCreate.Add('Garantia VARCHAR(20), ');
            vSQLCreate.Add('CodigoFornecedor '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoSetor '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoResponsavel '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('PRIMARY KEY (Codigo)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='ativos_manutencao';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('ID '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('CodigoAtivo '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('Data DATE, ');
            vSQLCreate.Add('NF VARCHAR(20), ');
            vSQLCreate.Add('CodigoFornecedor '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('Valor '+cDoubleType2Dec+', ');
            vSQLCreate.Add('PrazoGarantia VARCHAR(20), ');
            vSQLCreate.Add('TipoMovimento VARCHAR(1), '); // 1 Entrada ; 2 Saída
            vSQLCreate.Add('DescricaoMovimento VARCHAR(10), ');
            vSQLCreate.Add('Observacao TEXT, ');
            vSQLCreate.Add('PRIMARY KEY (ID)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='moldes_operacoes';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('ID '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('NMolde VARCHAR(20), ');
            vSQLCreate.Add('Data DATE, ');
            vSQLCreate.Add('Documento '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('TipoMovimento VARCHAR(1), '); // 1 Entrada ; 2 Saída
            vSQLCreate.Add('DescricaoMovimento VARCHAR(10), ');
            vSQLCreate.Add('QtdPecas '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoSetor '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoResponsavel '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoCliente '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('Observacao TEXT, ');
            vSQLCreate.Add('PRIMARY KEY (ID)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='moldes_manutencoes';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('ID '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('NMolde VARCHAR(20), ');
            vSQLCreate.Add('Data DATE, ');
            vSQLCreate.Add('Documento VARCHAR(20), ');
            vSQLCreate.Add('TipoMovimento VARCHAR(1), '); // 1 Entrada ; 2 Saída
            vSQLCreate.Add('DescricaoMovimento VARCHAR(10), ');
            vSQLCreate.Add('CodigoSetor '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoResponsavel '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('QtdPecas '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('PRIMARY KEY (ID)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='acertos';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('Documento '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Data DATE, ');
            vSQLCreate.Add('Hora TIME, ');
            vSQLCreate.Add('CodigoFuncionario '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('PRIMARY KEY (Documento)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='acertos_produtos';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('Documento '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('CodigoProduto VARCHAR(20), ');
            vSQLCreate.Add('Descricao VARCHAR(60), ');
            vSQLCreate.Add('Quantidade '+cFloatType2Dec+', ');
            vSQLCreate.Add('TipoAcerto SMALLINT, ');// 0 - Saída, 1 - Entrada
            vSQLCreate.Add('PRIMARY KEY (Documento,CodigoProduto,TipoAcerto)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='requisicao_compras';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('Documento '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('DataRequisicao DATE, ');
            vSQLCreate.Add('CodigoFuncionario '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('DataBaixa DATE, ');
            vSQLCreate.Add('HoraRequisicao DATE, ');
            vSQLCreate.Add('DataPrazo DATE, ');
            vSQLCreate.Add('PRIMARY KEY (Documento)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='requisicao_compras_produtos';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('ID '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('Documento '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoProduto VARCHAR(20), ');
            vSQLCreate.Add('Descricao VARCHAR(50), ');
            vSQLCreate.Add('Quantidade '+cFloatType3Dec+', ');
            vSQLCreate.Add('Valor '+cDoubleType2Dec+', ');
            vSQLCreate.Add('ValorTotal '+cDoubleType2Dec+', ');
            vSQLCreate.Add('PRIMARY KEY (ID)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='orcamentos_compras';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('Documento '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('Orcamento '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoFuncionario '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('PRIMARY KEY (Documento, Orcamento)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // -- 
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='orcamentos_compras_produtos';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('ID '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Documento '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('Orcamento '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoFornecedor '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoProduto VARCHAR(20), ');
            vSQLCreate.Add('Descricao VARCHAR(50), ');
            vSQLCreate.Add('Quantidade '+cFloatType2Dec+', ');
            vSQLCreate.Add('Valor '+cDoubleType2Dec+', ');
            vSQLCreate.Add('Aprovado SMALLINT, ');
            vSQLCreate.Add('PRIMARY KEY (ID)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // -- 
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='xml_nfe_clientes';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         {

          Nota          -> 000002
          Serie         -> 001
          TipoNota      -> 1 - Saída, 2 - Entrada
          CodigoEmpresa -> 1
          Cancelada     -> 0 - Não, 1 - Sim
          XML           -> (Blob contendo XML)
          ChaveNFe      -> 

         }

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('NotaFiscal VARCHAR(20) NOT NULL, ');
            vSQLCreate.Add('Serie VARCHAR(10) NOT NULL, ');
            vSQLCreate.Add('TipoNota VARCHAR(1) NOT NULL, '); // 1 - Saída | 2 - Entrada
            vSQLCreate.Add('CodigoEmpresa '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Cancelada SMALLINT, ');
            vSQLCreate.Add('XML BLOB, ');
            vSQLCreate.Add('ChaveNFe VARCHAR(50), ');
            vSQLCreate.Add('DataRecbto Date, ');
            vSQLCreate.Add('NProt VARCHAR(30), ');
            vSQLCreate.Add('DigVal VARCHAR(50), ');
            vSQLCreate.Add('cStat SMALLINT, ');
            vSQLCreate.Add('xMotivo VARCHAR(30), ');
            vSQLCreate.Add('verAplic VARCHAR(15), ');
            vSQLCreate.Add('PRIMARY KEY (NotaFiscal, Serie, CodigoEmpresa, TipoNota, Cancelada)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='xml_nfe_fornecedores';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);

         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('NotaFiscal VARCHAR(20) NOT NULL, ');
            vSQLCreate.Add('Serie VARCHAR(10) NOT NULL, ');
            vSQLCreate.Add('TipoNota VARCHAR(1) NOT NULL, '); // 1 - Saída | 2 - Entrada
            vSQLCreate.Add('CodigoEmpresa '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Cancelada SMALLINT, ');
            vSQLCreate.Add('XML BLOB, ');
            vSQLCreate.Add('PRIMARY KEY (NotaFiscal, Serie, CodigoEmpresa, TipoNota, Cancelada)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free; 
         end;

         // -- 
         vSQLCreate:=TStringList.Create; 
         vNomeArquivo:='sequencia_producao_produtos';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('CodigoProduto VARCHAR(20) NOT NULL, ');
            vSQLCreate.Add('CodigoSetor '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Sequencia SMALLINT, ');
            vSQLCreate.Add('ObsProducao TEXT, ');
            vSQLCreate.Add('CodigoFuncionario '+cFloatTypeNoDec+', ');            
            vSQLCreate.Add('PRIMARY KEY (CodigoProduto, CodigoSetor)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='status_producao';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('Pedido '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('Ficha VARCHAR(20), ');
            vSQLCreate.Add('CodigoSetor '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('Data DATE, ');
            vSQLCreate.Add('PRIMARY KEY (Pedido, Ficha, CodigoSetor)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='aproveitamento';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('ID '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('Data DATE, ');
            vSQLCreate.Add('CodigoCliente '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('PecasInjetadas SMALLINT, ');
            vSQLCreate.Add('Perdas SMALLINT, ');
            vSQLCreate.Add('CodigoProduto VARCHAR(20), ');            
            vSQLCreate.Add('PRIMARY KEY (ID)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='produtos_fornecedores';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('CodigoProduto VARCHAR(20) NOT NULL, ');
            vSQLCreate.Add('CodigoFornecedor '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('PRIMARY KEY (CodigoProduto, CodigoFornecedor)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='configuracoes_proprietario';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
   
         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('Chave VARCHAR(20) NOT NULL, ');
            vSQLCreate.Add('NomeFantasia VARCHAR(60) NOT NULL, ');
            vSQLCreate.Add('RazaoSocial VARCHAR(60) NOT NULL, ');
            vSQLCreate.Add('Endereco VARCHAR(60), ');
            vSQLCreate.Add('Numero VARCHAR(10), ');
            vSQLCreate.Add('Cep VARCHAR(15), ');
            vSQLCreate.Add('SmtpHost VARCHAR(40), ');
            vSQLCreate.Add('SmtpUsername VARCHAR(40), ');
            vSQLCreate.Add('SmtpPassword VARCHAR(20), ');
            vSQLCreate.Add('SmtpPorta SMALLINT, ');
            vSQLCreate.Add('NFeEmailXML VARCHAR(60), ');
            vSQLCreate.Add('NFeEmailDANFE VARCHAR(60), ');
            vSQLCreate.Add('OrcEmail VARCHAR(60), ');
            vSQLCreate.Add('TextoOrcamento VARCHAR(60), ');
            vSQLCreate.Add('CodigoCidade VARCHAR(7), ');
            vSQLCreate.Add('Bairro VARCHAR(50), ');
            vSQLCreate.Add('Telefone VARCHAR(20), ');
            vSQLCreate.Add('Fax VARCHAR(20), ');
            vSQLCreate.Add('Estado VARCHAR(2), ');
            vSQLCreate.Add('Site VARCHAR(60), ');
            vSQLCreate.Add('Email VARCHAR(60), ');
            vSQLCreate.Add('LogoPequeno BLOB, ');
            vSQLCreate.Add('CNPJ VARCHAR(20), ');
            vSQLCreate.Add('IE VARCHAR(20), ');
            vSQLCreate.Add('AliqAprov '+cFloatType2Dec+',');
            vSQLCreate.Add('CRT SMALLINT, ');
            vSQLCreate.Add('ObsNF1 VARCHAR(200), ');
            vSQLCreate.Add('ObsNF2 VARCHAR(200), ');
            vSQLCreate.Add('ObsNF3 VARCHAR(200), ');
            vSQLCreate.Add('CodigoPais VARCHAR(5), ');
            vSQLCreate.Add('NFeAssuntoEnvioEmail VARCHAR(60), ');
            vSQLCreate.Add('NFeMensagemEnvioEmail TEXT, ');
            vSQLCreate.Add('NumeroProducao '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('Marca VARCHAR(30), ');
            vSQLCreate.Add('Especie VARCHAR(30), ');
            vSQLCreate.Add('FormasPagto VARCHAR(255), ');
            vSQLCreate.Add('Garantia1 VARCHAR(255), ');
            vSQLCreate.Add('Garantia2 VARCHAR(255), ');
            vSQLCreate.Add('NumeroReceber '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('NumeroPagar '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('CodigoGrupoMP '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('POClientesEndNormal SMALLINT, ');
            vSQLCreate.Add('NFeFormatoDanfe SMALLINT, '); // 0 - Retrato / 1 - Paisagem
            vSQLCreate.Add('NFeFormaEmissao SMALLINT, '); // 0 - Normal / 1 - Contingência / 2 - SCAN / 3 - DPEC / 4 - FSDA
            vSQLCreate.Add('NFeNumeroSerie VARCHAR(60), ');
            vSQLCreate.Add('NFeCaminhoCertificado VARCHAR(255), ');
            vSQLCreate.Add('NFeSenhaCertificado VARCHAR(20), ');
            vSQLCreate.Add('NFeUFDest VARCHAR(2), ');
            vSQLCreate.Add('NFeTipoAmbiente SMALLINT, '); // 0 - Produção / 1 - Homologação
            vSQLCreate.Add('CodigoTranspCorreios '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('PRIMARY KEY (Chave)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='clientes_historicos';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);

         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('ID '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('CodigoCliente '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('CodigoFuncionario '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('CodigoDepto '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Historico TEXT, ');
            vSQLCreate.Add('Data DATE, ');
            vSQLCreate.Add('PRIMARY KEY (ID)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='funcionarios_dependentes';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);

         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('ID '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('CodigoFuncionario '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Nome VARCHAR(60), ');
            vSQLCreate.Add('CodigoParentesco '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('DataNascto DATE, ');
            vSQLCreate.Add('PRIMARY KEY (ID)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='usuarios_logados';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);

         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('Usuario VARCHAR(20) NOT NULL, ');
            vSQLCreate.Add('Computador VARCHAR(30), ');
            vSQLCreate.Add('DataLogin DATETIME, ');
            vSQLCreate.Add('DataLogoff DATETIME, ');
            vSQLCreate.Add('PRIMARY KEY (Usuario)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='produtos_movimentos'; 
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);

         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('Documento '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('TipoMovimento SMALLINT, '); // 0 - Saída, 1 - Entrada
            vSQLCreate.Add('Data DATE, ');
            vSQLCreate.Add('CodigoProduto VARCHAR(20), ');
            vSQLCreate.Add('Descricao VARCHAR(60), ');
            vSQLCreate.Add('Quantidade '+cFloatType4Dec+', ');
            vSQLCreate.Add('Referencia '+cFloatType2Dec+', '); // Documento de Referencia
            vSQLCreate.Add('ReferenciaDesc VARCHAR(30), '); // 'Pedido de Compra'
            vSQLCreate.Add('PRIMARY KEY (Documento,TipoMovimento)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='usuarios_perfil';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);

         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' ('); 
            vSQLCreate.Add('CodigoPerfil '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Descricao VARCHAR(60), ');
            vSQLCreate.Add('Telas TEXT, ');
            vSQLCreate.Add('PRIMARY KEY (CodigoPerfil) ');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;      
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='log_arquivos';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);

         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('ID '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Usuario VARCHAR(20), ');
            vSQLCreate.Add('TipoAlteracao VARCHAR(1), '); // 1 = Inclusão, 2 = Edição, 3 = Exclusão
            vSQLCreate.Add('DataAlteracao DATETIME, ');
            vSQLCreate.Add('Tabela VARCHAR(40), ');
            vSQLCreate.Add('ChavesCampos VARCHAR(255), ');
            vSQLCreate.Add('ChavesValores VARCHAR(255), ');
            vSQLCreate.Add('Campo VARCHAR(40), ');
            vSQLCreate.Add('ValorNovo VARCHAR(255), ');
            vSQLCreate.Add('ValorAntigo VARCHAR(255), ');
            vSQLCreate.Add('Computador VARCHAR(30), ');            
            vSQLCreate.Add('PRIMARY KEY (ID) ');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='clientes_referencia_produtos';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);

         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('CodigoCliente '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('CodigoProduto VARCHAR(20) NOT NULL, ');
            vSQLCreate.Add('ReferenciaCliente VARCHAR(20) NOT NULL, ');            
            vSQLCreate.Add('PRIMARY KEY (CodigoCliente, CodigoProduto, ReferenciaCliente)');  
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='contatos_historicos';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);

         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('ID '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('CodigoContato '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('CodigoFuncionario '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('CodigoDepto '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Historico TEXT, ');
            vSQLCreate.Add('Data DATE, ');
            vSQLCreate.Add('PRIMARY KEY (ID)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='moldes_fotos';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);

         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('ID '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('CodigoMolde VARCHAR(20) NOT NULL, ');
            vSQLCreate.Add('Foto LONGBLOB NOT NULL, ');
            vSQLCreate.Add('PRIMARY KEY (ID)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='funcionarios_ausencias';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);

         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('ID '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('CodigoFuncionario '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('DataInicial Date,');
            vSQLCreate.Add('DataFinal Date,');
            vSQLCreate.Add('CodigoAusencia '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('PRIMARY KEY (ID)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='produtos_ficha_tecnica';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);

         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('CodigoPrincipal VARCHAR(20) NOT NULL, ');
            vSQLCreate.Add('CodigoProduto VARCHAR(20) NOT NULL, ');
            vSQLCreate.Add('Descricao VARCHAR(100), ');
            vSQLCreate.Add('Quantidade '+cFloatType5Dec+',');
            vSQLCreate.Add('ValorCusto '+cDoubleType4Dec+',');
            vSQLCreate.Add('CodigoUnidade '+cFloatTypeNoDec+',');
            vSQLCreate.Add('PRIMARY KEY (CodigoPrincipal, CodigoProduto)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='roteiro_produtivo';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);

         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('ID '+cFloatTypeNoDec+' NOT NULL, ');            
            vSQLCreate.Add('OrdemProducao '+cFloatTypeNoDec+',');
            vSQLCreate.Add('CodigoProduto VARCHAR(20),');
            vSQLCreate.Add('PeriodoInicial DATETIME,');
            vSQLCreate.Add('PeriodoFinal DATETIME,');
            vSQLCreate.Add('Quantidade '+cFloatType2Dec+',');
            vSQLCreate.Add('Perdas '+cFloatType2Dec+',');
            vSQLCreate.Add('CodigoSetor '+cFloatTypeNoDec+',');
            vSQLCreate.Add('CodigoResponsavel '+cFloatTypeNoDec+',');
            vSQLCreate.Add('PRIMARY KEY (ID)'); 
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free; 
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='horarios_trabalho';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);

         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('Semana VARCHAR(3) NOT NULL,');
            vSQLCreate.Add('Entrada1 TIME,');
            vSQLCreate.Add('Saida1 TIME,');
            vSQLCreate.Add('Entrada2 TIME,');
            vSQLCreate.Add('Saida2 TIME,');
            vSQLCreate.Add('Sequencia SMALLINT,');
            vSQLCreate.Add('DayOfWeek SMALLINT,');                                    
            vSQLCreate.Add('PRIMARY KEY (Semana)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo); 
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='ativos_fotos';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);

         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('CodigoAtivo '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Foto LONGBLOB NOT NULL, ');
            vSQLCreate.Add('PRIMARY KEY (CodigoAtivo)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free; 
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='contas_bancarias';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);

         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('ID '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Descricao VARCHAR(60), ');            
            vSQLCreate.Add('CodigoBanco VARCHAR(3), ');         // Obs: B.B. Usa
            vSQLCreate.Add('CodigoAgencia VARCHAR(15), ');
            vSQLCreate.Add('DigitoAgencia VARCHAR(1), ');
            vSQLCreate.Add('NumeroConta VARCHAR(15), ');
            vSQLCreate.Add('DigitoConta VARCHAR(1), ');
            vSQLCreate.Add('Carteira VARCHAR(3), ');
            vSQLCreate.Add('Convenio VARCHAR(10), ');
            vSQLCreate.Add('VariacaoCarteira VARCHAR(3), ');
            vSQLCreate.Add('NumeroContrato VARCHAR(10), ');     // Obs: B.B. Usa
            vSQLCreate.Add('DiasProtesto VARCHAR(2), ');        // Obs: B.B. Usa.
            vSQLCreate.Add('CodigoBancoRetorno '+cFloatTypeNoDec+', ');            
            vSQLCreate.Add('PRIMARY KEY (ID)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='funcionarios_advertencias';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);

         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('ID '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('CodigoFuncionario '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Data Date,');
            vSQLCreate.Add('Motivo TEXT,');
            vSQLCreate.Add('CodigoTipoAdvert '+cFloatTypeNoDec+', ');
            vSQLCreate.Add('PRIMARY KEY (ID)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end; 
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='indices_cotacoes';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);

         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('Cotacao VARCHAR(20) NOT NULL, ');
            vSQLCreate.Add('Indice '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('PRIMARY KEY (Cotacao)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end; 
            end;
         finally 
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='funcionarios_ferias';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);

         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('ID '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('CodigoFuncionario '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('AquisicaoInicial Date,');
            vSQLCreate.Add('AquisicaoFinal Date,');
            vSQLCreate.Add('GozoInicial Date,');
            vSQLCreate.Add('GozoFinal Date,');
            vSQLCreate.Add('DiasDescansados SMALLINT, ');
            vSQLCreate.Add('Observacoes TEXT, ');            
            vSQLCreate.Add('PRIMARY KEY (ID)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='remessas_geradas';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);

         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('ID '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('CodigoConta '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('NumeroRemessa SMALLINT,'); 
            vSQLCreate.Add('DataGeracao Date,');
            vSQLCreate.Add('Formato VARCHAR(10),');
            vSQLCreate.Add('QtdTitulos SMALLINT,');
            vSQLCreate.Add('ValorTotal '+cDoubleType2Dec+', ');           
            vSQLCreate.Add('PRIMARY KEY (ID)'); 
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free; 
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='funcionarios_digital';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);

         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('CodigoFuncionario '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Digital1 TEXT, ');
            vSQLCreate.Add('Digital2 TEXT, ');
            vSQLCreate.Add('Digital3 TEXT, ');            
            vSQLCreate.Add('PRIMARY KEY (CodigoFuncionario)'); 
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='funcionarios_fotos';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);

         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('CodigoFuncionario '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Foto LONGBLOB NOT NULL, ');
            vSQLCreate.Add('PRIMARY KEY (CodigoFuncionario)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='funcionarios_horarios';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);

         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('ID '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('CodigoFuncionario '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Data TIME, ');           
            vSQLCreate.Add('Hora TIME, ');
            vSQLCreate.Add('PRIMARY KEY (ID)'); 
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // --
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='cores';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);

         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');
            vSQLCreate.Add('Codigo '+cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('Descricao VARCHAR(50), ');
            vSQLCreate.Add('Abreviacao VARCHAR(3), ');
            vSQLCreate.Add('PRIMARY KEY (Codigo)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

         // Tabela Mensagem
         vSQLCreate:=TStringList.Create;
         vNomeArquivo:='mensagem';
         stpAvisos.Panels[0].Text:='Tabela: '+vNomeArquivo;
         stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);

         if TableExists(vNomeArquivo) then begin
            RenameTable(cNomenTabTmp+vNomeArquivo, vNomeArquivo);
            DropTable(vNomeArquivo);
         end;

         try
            vSQLCreate.Clear;
            vSQLCreate.Add('CREATE TABLE '+vNomeArquivo+' (');

            vSQLCreate.Add('CodigoMensagem'        + cFloatTypeNoDec+' NOT NULL, ');
            vSQLCreate.Add('CodigoUsuarioOrigem '  + cFloatTypeNoDec + ', ');
            vSQLCreate.Add('CodigoPerfilDestino '  + cFloatTypeNoDec + ', ');
            vSQLCreate.Add('CodigoUsuarioDestino ' + cFloatTypeNoDec + ', ');
            vSQLCreate.Add('Origem                   VARCHAR(50), ');
            vSQLCreate.Add('DataEnvio                Date DEFAULT NULL, ');
            vSQLCreate.Add('HoraEnvio                Date DEFAULT NULL, ');
            vSQLCreate.Add('DataLeitura              Date DEFAULT NULL, ');
            vSQLCreate.Add('HoraLeitura              Date DEFAULT NULL, ');
            vSQLCreate.Add('ConfirmarLeitura         integer DEFAULT 0, ');
            vSQLCreate.Add('Origem                   varchar(50) DEFAULT NULL, ');
            vSQLCreate.Add('Descricao                text, ');
            vSQLCreate.Add('PRIMARY KEY (CodigoMensagem)');
            vSQLCreate.Add(')');
            if CreateTable(vSQLCreate) then begin
               if RetornaDados(vNomeArquivo) then begin
                  DropTable(cNomenTabTmp+vNomeArquivo);
               end;
            end;
         finally
            vSQLCreate.Free;
         end;

      end;
   finally
      vOrigem.Free;
      vDestino.Free;
      btnOK.Enabled:=True;
      btnCancelar.Enabled:=True;
      Screen.Cursor:=crDefault;
      zcnConfigura.Connected:=False;
      SaveConfigHost(vHostConfig, GetPathProfileUser);
      fmMenu.pubHostConfig:=vHostConfig;
      stpAvisos.Panels[1].Text:='Erros: '+IntToStr(FErros);
      if Trim(FMensagem) <> '' then begin
         ShowMessage('Configuração Concluída com os Seguintes Erros: '+Chr(13)+FMensagem);
       end
      else begin

        fmMenu.zcnConexao.LoginPrompt:=False;
        fmMenu.zcnConexao.Protocol:=db_protocolo;
        fmMenu.zcnConexao.Database:=db_nome;
        fmMenu.zcnConexao.HostName:= GetIPFromHost(edtServidor.Text);
        // fmMenu.zcnConexao.HostName:= edtServidor.Text;
        fmMenu.zcnConexao.User:=db_usuario;
        fmMenu.zcnConexao.Password:=db_senha;
        fmMenu.zcnConexao.Port:=StrToInt(edtPorta.Text);
        fmMenu.zcnConexao.Connected:=True;

        fmMenu.pubHostConfig.Host :=  GetIPFromHost(edtServidor.Text);
        fmMenu.pubHostConfig.Port :=  StrToInt(edtPorta.Text);
        fmMenu.pubHostConfig.User :=   db_usuario;
        fmMenu.pubHostConfig.Password :=  db_senha;
        
        ShowMessage('Configuração Concluída com Sucesso.');

        fmMenu.stbMenu.Panels[2].Text := 'Conectado a ' + fmMenu.pubHostConfig.Host + ':' + IntToStr(fmMenu.pubHostConfig.Port);

        fmMenu.stbMenu.Panels[2].PanelStyle.Font.Color := clGreen;

      end;
   end;
   Close;
end;

procedure TfmConfiguracaoBancoDados.FormCreate(Sender: TObject);
begin
   inherited;
   FAdm:=False;
   FErros:=0;
   FMensagem:='';
   SetFormStyle(fsNormal);
end;

procedure TfmConfiguracaoBancoDados.FormShow(Sender: TObject);
var vArquivo : TStringList;
    vHostConfig: THostConfig;
begin
   vHostConfig:=LoadConfigHost(GetPathProfileUser);
   if Trim(vHostConfig.Host) = '' then begin
      if FileExists(ExtractFilePath(Application.ExeName)+sis_nome_abrv+'.ini') then begin
         vArquivo:=TStringList.Create;
         try
            vArquivo.LoadFromFile(ExtractFilePath(Application.ExeName)+sis_nome_abrv+'.ini');
            edtServidor.Text:=vArquivo.Strings[0];
            edtPorta.Text:=vArquivo.Strings[1];
         finally
            vArquivo.Free;
         end;
      end;
    end
   else begin
      edtServidor.Text:=vHostConfig.Host;
      edtPorta.Text:=IntToStr(vHostConfig.Port); 
   end;
end;

procedure TfmConfiguracaoBancoDados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   fmConfiguracaoBancoDados:=nil;
   inherited;
end;

procedure TfmConfiguracaoBancoDados.btnCancelarClick(Sender: TObject);
begin
   Close; 
end;

end.

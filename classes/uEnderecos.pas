unit uEnderecos;

interface

uses Forms, ZDataset, ZConnection, uConstantes, SysUtils, uFuncoes;

type

  TEndereco = record
    Cep: String;
    Endereco: string;
    Bairro: string;
    CodigoCidade: string;
    CodigoPais: string;
    Estado: string;
    Cidade: string;
  end;

function LocalizarCep(fCep: string): TEndereco;
function LocateCidade(fCodigoCidade: string): string; overload;
function LocateCidade(fCidade: string; fEstado: string): string; overload;
function LocatePais(fCodigoPais: string): string;
function AtualizaEndereco(fCep: string; fCodigoCidade: string; fEndereco: string; fBairro: string; fEstado: string): Boolean;

implementation

function LocalizarCep(fCep: string): TEndereco;
var vQuery: TZQuery;
    ZCon : TZConnection;
    vCep: string;
begin
   vCep:=FormatarCEP(fCep);

   Result.Cep:='';
   Result.Endereco:='';
   Result.Bairro:='';
   Result.CodigoCidade:='';
   Result.CodigoPais:='';
   Result.Estado:='';
   Result.Cidade:='';

   ZCon:=TZConnection(TForm(Application.FindComponent(sis_menu_name)).FindComponent(sis_conect_name));
   vQuery:=TZQuery.Create(nil);
   try try
      vQuery.Connection:=ZCon;
      vQuery.Close;
      vQuery.SQL.Clear;
      vQuery.SQL.Add('SELECT * FROM cep WHERE Cep = '+QuotedStr(vCep));
      vQuery.Open;
      if vQuery.RecordCount = 1 then begin
         Result.Cep:=vCep;
         Result.Endereco:=vQuery.FieldByName('Endereco').AsString;
         Result.Bairro:=vQuery.FieldByName('Bairro').AsString;
         Result.CodigoCidade:=vQuery.FieldByName('CodigoCidade').AsString;
         Result.CodigoPais:='1058';
         Result.Estado:=vQuery.FieldByName('Estado').AsString;
         Result.Cidade:=UpperCase(vQuery.FieldByName('Cidade').AsString);
         if Trim(Result.CodigoCidade) = '' then begin
            Result.CodigoCidade:=LocateCidade(Result.Cidade, Result.Estado);
         end;
      end;
   except
      on E: Exception do begin
         Exception.Create('Erro ao Localizar Endereço');
      end;
   end;
   finally
      vQuery.Close;
      vQuery.Free;
   end;
end;

function LocateCidade(fCodigoCidade: string): string;
var ZCon : TZConnection;
    vZQuery : TZQuery;
begin
   Result:='';
   ZCon:=TZConnection( TForm(Application.FindComponent(sis_menu_name)).FindComponent(sis_conect_name));
   vZQuery:=TZQuery.Create(nil);
   try try
      vZQuery.Connection:=ZCon;
      vZQuery.Close;
      vZQuery.SQL.Clear;
      vZQuery.SQL.Add('SELECT CodigoCidade,Cidade FROM cidades WHERE CodigoCidade = '+QuotedStr(fCodigoCidade));
      vZQuery.Open;
      if vZQuery.RecordCount > 0 then begin
         Result:=vZQuery.FieldByName('Cidade').AsString;
      end;
   except
      on E: Exception do begin
         Result:='';
         Exception.Create('Erro ao Localizar Cidade');
      end;
   end;
   finally
      vZQuery.Close;
      vZQuery.Free;
   end;
end;

function LocateCidade(fCidade: string; fEstado: string): string;
var ZCon : TZConnection;
    vZQuery : TZQuery;
begin
   Result:='';
   ZCon:=TZConnection( TForm(Application.FindComponent(sis_menu_name)).FindComponent(sis_conect_name));
   vZQuery:=TZQuery.Create(nil);
   try try
      vZQuery.Connection:=ZCon;
      vZQuery.Close;
      vZQuery.SQL.Clear;
      vZQuery.SQL.Add('SELECT CodigoCidade,Cidade,UF FROM cidades WHERE Cidade LIKE '+QuotedStr('%'+Trim(fCidade)+'%')+' AND UF = '+QuotedStr(Trim(fEstado)));
      vZQuery.Open;
      if vZQuery.RecordCount = 1 then begin
         Result:=vZQuery.FieldByName('CodigoCidade').AsString;
      end;
   except
      on E: Exception do begin
         Result:='';
         Exception.Create('Erro ao Localizar Cidade');
      end;
   end;
   finally
      vZQuery.Close;
      vZQuery.Free;
   end;
end;

function LocatePais(fCodigoPais: string): string;
var ZCon : TZConnection;
    vZQuery : TZQuery;
begin
   Result:='';
   ZCon:=TZConnection( TForm(Application.FindComponent(sis_menu_name)).FindComponent(sis_conect_name));
   vZQuery:=TZQuery.Create(nil);
   try try
      vZQuery.Connection:=ZCon;
      vZQuery.Close;
      vZQuery.SQL.Clear;
      vZQuery.SQL.Add('SELECT CodigoPais,Pais FROM paises WHERE CodigoPais = '+QuotedStr(fCodigoPais));
      vZQuery.Open;
      if vZQuery.RecordCount > 0 then begin
         Result:=vZQuery.FieldByName('Pais').AsString;
      end;
   except
      on E: Exception do begin
         Result:='';
         Exception.Create('Erro ao Localizar País');
      end;
   end;
   finally
      vZQuery.Close;
      vZQuery.Free;
   end;
end;

function AtualizaEndereco(fCep: string; fCodigoCidade: string; fEndereco: string; fBairro: string; fEstado: string): Boolean;
var ZCon : TZConnection;
    vZQuery : TZQuery;
    vCep : string;
begin                   
   vCep:=fCep;
   vCep:=FormatarCep(vCep);
   Result:=False;
   ZCon:=TZConnection( TForm(Application.FindComponent(sis_menu_name)).FindComponent(sis_conect_name));
   vZQuery:=TZQuery.Create(nil);
   try try
      vZQuery.Connection:=ZCon;
      vZQuery.Close;
      vZQuery.SQL.Clear;
      vZQuery.SQL.Add('SELECT Cep,CodigoCidade FROM cep WHERE Cep = '+QuotedStr(vCep));
      vZQuery.Open;
      if vZQuery.RecordCount > 0 then begin
         if Trim(vZQuery.FieldByName('CodigoCidade').AsString) = '' then begin
            vZQuery.Close;
            vZQuery.SQL.Clear;
            vZQuery.SQL.Add('UPDATE cep SET CodigoCidade = '+QuotedStr(fCodigoCidade)+' WHERE Cep = '+QuotedStr(vCep));
            vZQuery.ExecSQL;
            Result:=True;
         end;
       end
      else begin
         vZQuery.Close;
         vZQuery.SQL.Clear;
         vZQuery.SQL.Add('INSERT INTO cep (Cep, Bairro, Estado, Endereco, CodigoCidade)');
         vZQuery.SQL.Add('VALUES (');
         vZQuery.SQL.Add(QuotedStr(vCep)+', '+QuotedStr(fBairro)+', '+QuotedStr(fEstado)+', ');
         vZQuery.SQL.Add(QuotedStr(fEndereco)+', '+QuotedStr(fCodigoCidade));
         vZQuery.SQL.Add(')');
         vZQuery.ExecSQL; 
         Result:=True;
      end;
   except
      on E: Exception do begin
         Result:=False;
         Exception.Create(Format('Erro ao Atualizar Cep: %s ', [fCep]));
      end;
   end;
   finally
      vZQuery.Close;
      vZQuery.Free;
   end;
end;

end.

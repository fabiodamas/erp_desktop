unit uFuncoes;

interface

uses ZDataSet, Windows, Registry, Forms, Math, SysUtils, ExtCtrls, jpeg,
  ShlObj, ActiveX, uConstantes, Classes, DB, Variants, ZConnection, uTipos,
  QRCtrls, Dialogs, IdSMTP, IdMessage, ComCtrls, Menus, ComObj, StdCtrls,
  Printers, DateUtils, Controls, WinSock, IdIcmpClient;

// IdBaseComponent, IdComponent, IdRawBase, IdRawClient,
// IdIcmpClient;

function EnviarEmailImagem(fSmtpServ, fSmtpUser, fSmtpPass, fRemetNome, fRemetEmail, fDestEmail, fAssunto, fMsg, fAnexo1, fAnexo2, fAnexo3: string; fPorta: Integer; fDelAnexo: Boolean; fMsgHTML : String): string;
function TrocaVirgPPto(Valor: string): String;
function RetiraEspaco(s: string): string;
function GetSystemPath(fFolder: Integer): string;
function GetPCName: string;
function GetPathAppData: string;
function GetPathProfileUser: string;
function GetPathTempWindow: string;
function GetTableFromSQL(fSQL: string): string;
function GetCSOSN: TStringList;
function GetCST: TStringList;
function GetUFs: TStringList;
function GetNomeSobreNome(fNomeCompleto: string): string;
function GetCotacoesUpdates: TStringList;
function GetCodigoUF(fUF: string): Integer;
function GetEmailNFeXML(fTipoTela: Integer; fCodigoConta: real): string;
function GetEmailNFeDanfe(fTipoTela: Integer; fCodigoConta: real): string;
function SaveConfigFormCadButton(fIndex: Integer; fPath: string): Boolean;
function SaveConfigUserLogin(fUser: string; fPath: string): Boolean;
function SaveConfigPathImage(fPathImg: string; fPath: string): Boolean;
function SaveConfigHost(fHostConfig: THostConfig; fPath: string): Boolean;
function SaveConfigNFeTxtPath(fPathNfe: string; fPath: string): Boolean;
function SaveConfigNFeXMLPath(fPathNfe: string; fPath: string): Boolean;
function SaveConfigNFeDanfePath(fPathNfe: string; fPath: string): Boolean;
function SaveConfigBBRemessaPath(fPathBB: string; fPath: string): Boolean;
function SaveConfigBBRetornoPath(fPathBB: string; fPath: string): Boolean;
function LoadConfigFormCadButton(fPath: string): Integer;
function LoadConfigUserLogin(fPath: string): string;
function LoadConfigPathImage(fPath: string): string;
function LoadConfigHost(fPath: string): THostConfig;
function LoadConfigNFeTxtPath(fPath: string): string;
function LoadConfigNFeDanfePath(fPath: string): string;
function LoadConfigNFeXMLPath(fPath: string): string;
function LoadConfigBBRemessaPath(fPath: string): string;
function LoadConfigBBRetornoPath(fPath: string): string;
function CodeGenerator(fTabela: string; fCampo: string): real;
function RoundReal(fValue: Extended; fDecimals: integer): Extended;
function SaveImageTmp(fName: string; fImage: TImage): Boolean;
function DeleteConfigUserLogin(fPath: string): Boolean;
function LoadImageFromBD(fField: TField; fImage: TImage): Boolean; overload;
function LoadImageFromBD(fField: TField; fImage: TQRImage): Boolean; overload;
function LoadImageFromBD_ID(fCampo, fTabela, fIDCampo, fIDCampoValor: string; fImage: TImage): Boolean;
function ExistsValue(fField: string; fTable: string; fValue: string): boolean;
function Encrypt(str: string): string;
function Decrypt(str: string): string;
function Crypt(Action, Src: string): string;
function LoCase(ch: Char): Char;
function CPF(fCPF: string): Boolean;
function Desformatar(fConteudo: string): string;
function FormatarCPF(fCPF: string): string;
function CNPJ(fCNPJ: string): Boolean;
function FormatarCNPJ(fCNPJ: string): string;
function FormatarCEP(fCEP: string): string;
function FormatarCFOP(fCFOP: string): string;
function StrZero(fValue: real; fZeros: integer): string; overload;
function StrZero(fValue: string; fZeros: integer): string; overload;
function RemoverAcentos(fStr: string): string;
function CodigoEstado(fEstado: string): string;
function Replicar(fStr: string; fNum: integer): string;
function EnviarEmail(fSmtpServ, fSmtpUser, fSmtpPass, fRemetNome, fRemetEmail, fDestEmail, fAssunto, fMsg, fAnexo1, fAnexo2, fAnexo3: string; fPorta: Integer; fDelAnexo: Boolean): string;
function ChrAlt(fTexto: string): string;
function nrItensRot(rot: string): integer;
function FormatarHora(fHora: string): string;
function ExtractMonthByNum(fVal: integer): string;
function PeriodoExtenso(fDataInicial, fDataFinal: TDateTime): string;
function MesExtenso(fMes: Integer): string;
function DeleteLineBreaks(const S: string): string;
procedure AtzTree(tv: TTreeView; fMenuPrinc: TMainMenu; fMenu: TMenu);
procedure HabMenu(fMenuPrinc: TMainMenu; fMenu: TMenu; rotinas: string);
procedure Delay(pMSec: Cardinal);
procedure ExportarDataSetToExcel(pDataSet: TDataSet);
procedure SavePathNFeSalvar;
procedure SavePathNFeSchemas;
procedure CarregarImpressoras(pComboBox: TComboBox);
procedure CarregarImpressoras2(pListBox: TListBox);
function LoadPathNFeSalvar: string;
function LoadPathNFeSchemas: string;
function SaveConfigListBox(pListBox: TListBox; fPath: string; pTipo: string): Boolean;
function LoadConfigListBox(fPath: string; pTipo: string): string;
function Explode(str, separador: string): TStringList;
function FormExiste(aberto: string): Boolean;
function ConverteData(Data: TDate): string;
function GetIPFromHost(host: string): string;

implementation

uses StrUtils, uMenu;

function GetIPFromHost(host: string): string;
var
  IdICMPClient: TIdICMPClient;
  lb_Retornou: Boolean;
begin

  try
    try

      IdICMPClient := TIdICMPClient.Create(nil);

      IdICMPClient.Host := host;
      IdICMPClient.ReceiveTimeout := 1000;
      IdICMPClient.Ping;

      lb_Retornou := (IdICMPClient.ReplyStatus.BytesReceived > 0);

      if lb_Retornou then
      begin
        result := IdICMPClient.ReplyStatus.FromIpAddress
      end
      else
      begin
        result := host;
      end;
    except
      result := host;
    end;
  finally
    IdICMPClient.Free;
  end;

end;

function GetSystemPath(fFolder: Integer): string;
var
  vPIDL: PItemIDList;
  vPath: LPSTR;
  vAMalloc: IMalloc;
begin
  vPath := StrAlloc(MAX_PATH);
  SHGetSpecialFolderLocation(Application.Handle, fFolder, vPIDL);
  if SHGetPathFromIDList(vPIDL, vPath) then
    Result := vPath;
  SHGetMalloc(vAMalloc);
  vAMalloc.Free(vPIDL);
  StrDispose(vPath);
end;

function GetPathAppData: string;
begin
  Result := GetSystemPath(CSIDL_APPDATA);
end;

function GetPathProfileUser: string;
begin
  Result := GetPathAppData + '\' + UpperCase(corp_name) + '\' + Application.Title;
end;

function GetPathTempWindow: string;
var
  vPathName: array[0..127] of Char;
  vSize: dword;
begin
  vSize := SizeOf(vPathName);
  GetTempPath(vSize, vPathName);
  Result := vPathName;
end;

function GetCodigoUF(fUF: string): Integer;
begin
  Result := 0;
  if Trim(UpperCase(fUF)) = 'RO' then
    Result := 11;
  if Trim(UpperCase(fUF)) = 'AC' then
    Result := 12;
  if Trim(UpperCase(fUF)) = 'AM' then
    Result := 13;
  if Trim(UpperCase(fUF)) = 'RR' then
    Result := 14;
  if Trim(UpperCase(fUF)) = 'PA' then
    Result := 15;
  if Trim(UpperCase(fUF)) = 'AP' then
    Result := 16;
  if Trim(UpperCase(fUF)) = 'TO' then
    Result := 17;

  if Trim(UpperCase(fUF)) = 'MA' then
    Result := 21;
  if Trim(UpperCase(fUF)) = 'PI' then
    Result := 22;
  if Trim(UpperCase(fUF)) = 'CE' then
    Result := 23;
  if Trim(UpperCase(fUF)) = 'RN' then
    Result := 24;
  if Trim(UpperCase(fUF)) = 'PB' then
    Result := 25;
  if Trim(UpperCase(fUF)) = 'PE' then
    Result := 26;
  if Trim(UpperCase(fUF)) = 'AL' then
    Result := 27;
  if Trim(UpperCase(fUF)) = 'SE' then
    Result := 28;
  if Trim(UpperCase(fUF)) = 'BA' then
    Result := 29;

  if Trim(UpperCase(fUF)) = 'MG' then
    Result := 31;
  if Trim(UpperCase(fUF)) = 'ES' then
    Result := 32;
  if Trim(UpperCase(fUF)) = 'RJ' then
    Result := 33;
  if Trim(UpperCase(fUF)) = 'SP' then
    Result := 35;

  if Trim(UpperCase(fUF)) = 'PR' then
    Result := 41;
  if Trim(UpperCase(fUF)) = 'SC' then
    Result := 42;
  if Trim(UpperCase(fUF)) = 'RS' then
    Result := 43;

  if Trim(UpperCase(fUF)) = 'MS' then
    Result := 50;
  if Trim(UpperCase(fUF)) = 'MT' then
    Result := 51;
  if Trim(UpperCase(fUF)) = 'GO' then
    Result := 52;
  if Trim(UpperCase(fUF)) = 'DF' then
    Result := 53;
end;

function CodeGenerator(fTabela: string; fCampo: string): real;
var
  vQuery: TZQuery;
  ZCon: TZConnection;
begin
  ZCon := TZConnection(TForm(Application.FindComponent(sis_menu_name)).FindComponent(sis_conect_name));
  vQuery := TZQuery.Create(nil);
  try
    vQuery.Connection := ZCon;
    vQuery.Close;
    vQuery.SQL.Clear;
    vQuery.SQL.Add('SELECT MAX(' + fCampo + ') AS CODIGO FROM ' + fTabela);
    vQuery.Open;
    Result := vQuery.FieldByName('CODIGO').AsFloat + 1;
  finally
    vQuery.Close;
    vQuery.Free;
  end;
end;

function GetPCName: string;
var
  vCharName: array[0..127] of Char;
  vComputerName: string;
  vSize: dword;
begin
  vSize := SizeOf(vCharName);
  GetComputerName(vCharName, vSize);
  vComputerName := vCharName;
  Result := vComputerName;
end;

function GetEmailNFeXML(fTipoTela: Integer; fCodigoConta: real): string;
var
  vSQL: string;
  vQuery: TZQuery;
  ZCon: TZConnection;
begin
  Result := '';
  if FTipoTela = 1 then
  begin
    vSQL := 'SELECT EmailNfeXML FROM clientes WHERE CodigoCliente = ' + QuotedStr(FloatToStr(fCodigoConta));
  end
  else if FTipoTela = 2 then
  begin
    vSQL := 'SELECT EmailNfeXML FROM fornecedores WHERE CodigoFornecedor = ' + QuotedStr(FloatToStr(fCodigoConta));
  end;
  ZCon := TZConnection(TForm(Application.FindComponent(sis_menu_name)).FindComponent(sis_conect_name));
  vQuery := TZQuery.Create(nil);
  try
    vQuery.Connection := ZCon;
    vQuery.Close;
    vQuery.SQL.Clear;
    vQuery.SQL.Add(vSQL);
    vQuery.Open;
    if vQuery.RecordCount = 1 then
    begin
      Result := vQuery.FieldByName('EmailNfeXML').AsString;
    end;
  finally
    vQuery.Close;
    vQuery.Free;
  end;
end;

function GetEmailNFeDanfe(fTipoTela: Integer; fCodigoConta: real): string;
var
  vSQL: string;
  vQuery: TZQuery;
  ZCon: TZConnection;
begin
  Result := '';
  if FTipoTela = 1 then
  begin
    vSQL := 'SELECT EmailNfeDanfe FROM clientes WHERE CodigoCliente = ' + QuotedStr(FloatToStr(fCodigoConta));
  end
  else if FTipoTela = 2 then
  begin
    vSQL := 'SELECT EmailNfeDanfe FROM fornecedores WHERE CodigoFornecedor = ' + QuotedStr(FloatToStr(fCodigoConta));
  end;
  ZCon := TZConnection(TForm(Application.FindComponent(sis_menu_name)).FindComponent(sis_conect_name));
  vQuery := TZQuery.Create(nil);
  try
    vQuery.Connection := ZCon;
    vQuery.Close;
    vQuery.SQL.Clear;
    vQuery.SQL.Add(vSQL);
    vQuery.Open;
    if vQuery.RecordCount = 1 then
    begin
      Result := vQuery.FieldByName('EmailNfeDanfe').AsString;
    end;
  finally
    vQuery.Close;
    vQuery.Free;
  end;
end;

function RoundReal(fValue: Extended; fDecimals: integer): Extended;
var
  vFactor, vFraction: Extended;
begin
  vFactor := IntPower(10, fDecimals);
  fValue := StrToFloat(FloatToStr(fValue * vFactor));
  Result := Int(fValue);
  vFraction := Frac(fValue);
  if vFraction >= 0.5 then
    Result := Result + 1
  else if vFraction <= -0.5 then
    Result := Result - 1;
  Result := Result / vFactor;
end;

function SaveImageTmp(fName: string; fImage: TImage): Boolean;
begin
  Result := False;
  try
    if fImage.Picture <> nil then
    begin
      fImage.Picture.SaveToFile(GetPathTempWindow + fName + '.jpg');
      Result := True;
    end;
  except
    Result := False;
  end;
end;

function SaveConfigFormCadButton(fIndex: Integer; fPath: string): Boolean;
var
  vText: TStringList;
begin
  vText := TStringList.Create;
  try
    try
      vText.Clear;
      vText.Add(IntToStr(fIndex));
      vText.SaveToFile(fPath + '\ConfigFormCadButton' + sis_ext_config_save);
      Result := True;
    except
      Result := False;
    end;
  finally
    vText.Free;
  end;
end;

function SaveConfigBBRemessaPath(fPathBB: string; fPath: string): Boolean;
var
  vText: TStringList;
begin
  vText := TStringList.Create;
  try
    try
      vText.Clear;
      vText.Add(fPathBB);
      vText.SaveToFile(fPath + '\ConfigBBRemessa' + sis_ext_config_save);
      Result := True;
    except
      Result := False;
    end;
  finally
    vText.Free;
  end;
end;

function SaveConfigBBRetornoPath(fPathBB: string; fPath: string): Boolean;
var
  vText: TStringList;
begin
  vText := TStringList.Create;
  try
    try
      vText.Clear;
      vText.Add(fPathBB);
      vText.SaveToFile(fPath + '\ConfigBBRetorno' + sis_ext_config_save);
      Result := True;
    except
      Result := False;
    end;
  finally
    vText.Free;
  end;
end;

function LoadConfigFormCadButton(fPath: string): Integer;
var
  vText: TStringList;
  vPathFileComplete: string;
begin
  Result := -1;
  vText := TStringList.Create;
  try
    vPathFileComplete := fPath + '\ConfigFormCadButton' + sis_ext_config_save;
    vText.Clear;

    if FileExists(vPathFileComplete) then
    begin
      vText.LoadFromFile(vPathFileComplete);
      if Trim(vText.Strings[0]) <> '' then
      begin
        Result := StrToInt(Trim(vText.Strings[0]));
      end;
    end;
  finally
    vText.Free;
  end;
end;

function LoadConfigBBRemessaPath(fPath: string): string;
var
  vText: TStringList;
  vPathFileComplete: string;
begin
  Result := '';
  vText := TStringList.Create;
  try
    vPathFileComplete := fPath + '\ConfigBBRemessa' + sis_ext_config_save;
    vText.Clear;
    if FileExists(vPathFileComplete) then
    begin
      vText.LoadFromFile(vPathFileComplete);
      if Trim(vText.Strings[0]) <> '' then
      begin
        Result := Trim(vText.Strings[0]);
      end;
    end;
  finally
    vText.Free;
  end;
end;

function LoadConfigBBRetornoPath(fPath: string): string;
var
  vText: TStringList;
  vPathFileComplete: string;
begin
  Result := '';
  vText := TStringList.Create;
  try
    vPathFileComplete := fPath + '\ConfigBBRetorno' + sis_ext_config_save;
    vText.Clear;
    if FileExists(vPathFileComplete) then
    begin
      vText.LoadFromFile(vPathFileComplete);
      if Trim(vText.Strings[0]) <> '' then
      begin
        Result := Trim(vText.Strings[0]);
      end;
    end;
  finally
    vText.Free;
  end;
end;

function SaveConfigUserLogin(fUser: string; fPath: string): Boolean;
var
  vText: TStringList;
begin
  vText := TStringList.Create;
  try
    try
      vText.Clear;
      vText.Add(fUser);
      vText.SaveToFile(fPath + '\ConfigUserLogin' + sis_ext_config_save);
      Result := True;
    except
      Result := False;
    end;
  finally
    vText.Free;
  end;
end;

function LoadConfigUserLogin(fPath: string): string;
var
  vText: TStringList;
  vPathFileComplete: string;
begin
  Result := '';
  vText := TStringList.Create;
  try
    vPathFileComplete := fPath + '\ConfigUserLogin' + sis_ext_config_save;
    vText.Clear;

    if FileExists(vPathFileComplete) then
    begin
      vText.LoadFromFile(vPathFileComplete);
      if Trim(vText.Strings[0]) <> '' then
      begin
        Result := Trim(vText.Strings[0]);
      end;
    end;
  finally
    vText.Free;
  end;
end;

function DeleteConfigUserLogin(fPath: string): Boolean;
var
  vPathFileComplete: string;
begin
  Result := False;
  try
    vPathFileComplete := fPath + '\ConfigUserLogin' + sis_ext_config_save;
    if FileExists(vPathFileComplete) then
    begin
      Result := DeleteFile(vPathFileComplete);
    end;
  except
    Result := False;
  end;
end;

function Encrypt(str: string): string;
var
  i, salt, nr: integer;
  h: string;
begin
  randomize();
  result := '';
  salt := random(9) + 1;
  for i := 1 to length(str) do
  begin
    nr := ord(str[i]) + salt;
    if nr > 255 then
      nr := nr - 255;
    h := inttohex(nr, 0);
    if length(h) = 1 then
      h := '0' + h;
    result := result + h;
  end;
  result := result + inttostr(salt);
end;

function Decrypt(str: string): string;
var
  j, salt, nr: integer;
begin
  result := '';
  if str = '' then
    exit;
  j := 1;
  salt := StrToIntDef(str[length(str)], 0);
  result := '';
  while j < length(str) - 1 do
  begin
    nr := StrToInt('$' + str[j] + str[j + 1]) - salt;
    if nr < 0 then
      nr := nr + 255;
    result := result + chr(nr);
    inc(j, 2);
  end;
end;

function LoadImageFromBD(fField: TField; fImage: TImage): Boolean;
var
  vStream: TStream;
  vJPEGImage: TJPEGImage;
begin
  vJPEGImage := nil;
  vStream := nil;
  fImage.Picture := nil;
  Result := False;
  try
    try
      if not fField.DataSet.FieldByName(fField.FieldName).IsNull then
      begin
        vStream := fField.DataSet.CreateBlobStream(fField.DataSet.FieldByName(fField.FieldName), bmRead);
        vJPEGImage := TJPEGImage.Create;
        vJPEGImage.LoadFromStream(vStream);
        fImage.Picture.Assign(vJPEGImage);
        Result := True;
      end;
    except
      Result := False;
    end;
  finally
    vStream.Free;
    vJPEGImage.Free;
  end;
end;

function LoadImageFromBD_ID(fCampo, fTabela, fIDCampo, fIDCampoValor: string; fImage: TImage): Boolean;
var
  vStream: TStream;
  vJPEGImage: TJPEGImage;
  vTab: TZQuery;
begin
  vTab := TZQuery.Create(nil);

  vTab.Connection := fmMenu.zcnConexao;

  vTab.Close;
  vTab.SQL.Clear;
  vTab.SQL.Add(
    'SELECT ' + fCampo +
    ' FROM  ' + fTabela +
    ' WHERE ' + fIDCampo + '=' +
    QuotedStr(fIDCampoValor)
    );
  vTab.Open;

  vJPEGImage := nil;
  vStream := nil;
  fImage.Picture := nil;
  Result := False;
  try
    try
      if not vTab.FieldByName(fCampo).IsNull then
      begin
        vStream := vTab.FieldByName(fCampo).DataSet.CreateBlobStream(vTab.FieldByName(fCampo), bmRead);
        vJPEGImage := TJPEGImage.Create;
        vJPEGImage.LoadFromStream(vStream);
        fImage.Picture.Assign(vJPEGImage);
        Result := True;
      end;
    except
      Result := False;
    end;
  finally
    vStream.Free;
    vJPEGImage.Free;
    vTab.Free;
  end;
end;

function LoadImageFromBD(fField: TField; fImage: TQRImage): Boolean;
var
  vStream: TStream;
  vJPEGImage: TJPEGImage;
begin
  vJPEGImage := nil;
  vStream := nil;
  fImage.Picture := nil;
  Result := False;
  try
    try
      if not fField.DataSet.FieldByName(fField.FieldName).IsNull then
      begin
        vStream := fField.DataSet.CreateBlobStream(fField.DataSet.FieldByName(fField.FieldName), bmRead);
        vJPEGImage := TJPEGImage.Create;
        vJPEGImage.LoadFromStream(vStream);
        fImage.Picture.Assign(vJPEGImage);
        Result := True;
      end;
    except
      Result := False;
    end;
  finally
    vStream.Free;
    vJPEGImage.Free;
  end;
end;

function SaveConfigPathImage(fPathImg: string; fPath: string): Boolean;
var
  vText: TStringList;
begin
  vText := TStringList.Create;
  try
    try
      vText.Clear;
      vText.Add(fPathImg);
      vText.SaveToFile(fPath + '\ConfigPathImage' + sis_ext_config_save);
      Result := True;
    except
      Result := False;
    end;
  finally
    vText.Free;
  end;
end;

function LoadConfigPathImage(fPath: string): string;
var
  vText: TStringList;
  vPathFileComplete: string;
begin
  Result := '';
  vText := TStringList.Create;
  try
    vPathFileComplete := fPath + '\ConfigPathImage' + sis_ext_config_save;
    vText.Clear;

    if FileExists(vPathFileComplete) then
    begin
      vText.LoadFromFile(vPathFileComplete);
      if Trim(vText.Strings[0]) <> '' then
      begin
        Result := Trim(vText.Strings[0]);
      end;
    end;
  finally
    vText.Free;
  end;
end;

function ExistsValue(fField: string; fTable: string; fValue: string): boolean;
var
  ZCon: TZConnection;
  vZQuery: TZQuery;
begin
  Result := False;
  ZCon := TZConnection(TForm(Application.FindComponent(sis_menu_name)).FindComponent(sis_conect_name));
  vZQuery := TZQuery.Create(nil);
  try
    try
      vZQuery.Connection := ZCon;
      vZQuery.Close;
      vZQuery.SQL.Clear;
      vZQuery.SQL.Add('SELECT ' + fField + ' FROM ' + fTable + ' WHERE ' + fField + ' = ' + QuotedStr(fValue));
      vZQuery.Open;
      if vZQuery.RecordCount > 0 then
      begin
        Result := True;
      end
      else if vZQuery.RecordCount = 0 then
      begin
        Result := False;
      end;
    except
      on E: Exception do
      begin
        Exception.Create(Format('Erro ao Procurar Valor Field " %s " Table " %s "', [fField, fTable]));
      end;
    end;
  finally
    vZQuery.Close;
    vZQuery.Free;
  end;
end;

function Crypt(Action, Src: string): string;
var
  KeyLen: Integer;
  KeyPos: Integer;
  OffSet: Integer;
  Dest, Key: string;
  SrcPos: Integer;
  SrcAsc: Integer;
  TmpSrcAsc: Integer;
  Range: Integer;
begin
  if (Src = '') then
  begin
    Result := '';
    Exit;
  end;
  Key := 'YUQL23KL23DF90WI5E1JAS467NMCXXL6JAOAUWWMCL0AOMM4A4VZYW9KHJUI2347EJHJKDF3424SKL K3LAKDJSL9RTIKJ';
  Dest := '';
  KeyLen := Length(Key);
  KeyPos := 0;
  //   SrcPos := 0;
  //   SrcAsc := 0;
  Range := 256;
  if (Action = UpperCase('C')) then
  begin
    Randomize;
    OffSet := Random(Range);
    Dest := Format('%1.2x', [OffSet]);
    for SrcPos := 1 to Length(Src) do
    begin
      Application.ProcessMessages;
      SrcAsc := (Ord(Src[SrcPos]) + OffSet) mod 255;
      if KeyPos < KeyLen then
        KeyPos := KeyPos + 1
      else
        KeyPos := 1;
      SrcAsc := SrcAsc xor Ord(Key[KeyPos]);
      Dest := Dest + Format('%1.2x', [SrcAsc]);
      OffSet := SrcAsc;
    end;
  end
  else if (Action = UpperCase('D')) then
  begin
    OffSet := StrToInt('$' + copy(Src, 1, 2));
    SrcPos := 3;
    repeat
      SrcAsc := StrToInt('$' + copy(Src, SrcPos, 2));
      if (KeyPos < KeyLen) then
        KeyPos := KeyPos + 1
      else
        KeyPos := 1;
      TmpSrcAsc := SrcAsc xor Ord(Key[KeyPos]);
      if TmpSrcAsc <= OffSet then
        TmpSrcAsc := 255 + TmpSrcAsc - OffSet
      else
        TmpSrcAsc := TmpSrcAsc - OffSet;
      Dest := Dest + Chr(TmpSrcAsc);
      OffSet := SrcAsc;
      SrcPos := SrcPos + 2;
    until (SrcPos >= Length(Src));
  end;
  Result := Dest;
end;

function SaveConfigHost(fHostConfig: THostConfig; fPath: string): Boolean;
var
  vText: TStringList;
begin
  vText := TStringList.Create;
  try
    try
      vText.Clear;
      vText.Add(fHostConfig.Host);
      vText.Add(IntToStr(fHostConfig.Port));
      vText.Add(fHostConfig.User);
      vText.Add(fHostConfig.Password);
      vText.SaveToFile(fPath + '\ConfigHost' + sis_ext_config_save);
      Result := True;
    except
      Result := False;
    end;
  finally
    vText.Free;
  end;
end;

function LoadConfigHost(fPath: string): THostConfig;
var
  vText: TStringList;
  vPathFileComplete: string;
begin
  Result.Host := '';
  vText := TStringList.Create;
  try
    vPathFileComplete := fPath + '\ConfigHost' + sis_ext_config_save;
    vText.Clear;

    if FileExists(vPathFileComplete) then
    begin

      vText.LoadFromFile(vPathFileComplete);

      if (vText.Count - 1) >= 0 then
      begin
        if Trim(vText.Strings[0]) <> '' then
        begin
          Result.Host := Trim(vText.Strings[0]);
        end;
      end;

      if (vText.Count - 2) >= 0 then
      begin
        if Trim(vText.Strings[1]) <> '' then
        begin
          Result.Port := StrToInt(Trim(vText.Strings[1]));
        end;
      end;

      if (vText.Count - 3) >= 0 then
      begin
        if Trim(vText.Strings[2]) <> '' then
        begin
          Result.User := Trim(vText.Strings[2]);
        end;
      end;

      if (vText.Count - 4) >= 0 then
      begin
        if Trim(vText.Strings[3]) <> '' then
        begin
          Result.Password := Trim(vText.Strings[3]);
        end;
      end;
    end;
  finally
    vText.Free;
  end;
end;

function LoCase(ch: Char): Char;
begin
  Result := ch;
  case Result of
    'A'..'Z': Dec(Result, Ord('A') - Ord('a'));
  end;
end;

function CPF(fCPF: string): Boolean;
var
  vNumeros: array[1..9] of Integer;
  vD1, vD2, vCnt: Integer;
  vDigitado, vCalculado, vCPF: string;
begin
  vCPF := Trim(Desformatar(fCPF));

  try
    for vCnt := 1 to 9 do
    begin
      vNumeros[vCnt] := StrToInt(vCPF[vCnt]);
    end;
  except
    Exception.Create('CPF com caracteres inv·lidos');
  end;

  vD1 := vNumeros[9] * 2 + vNumeros[8] * 3 + vNumeros[7] * 4 + vNumeros[6] * 5 + vNumeros[5] * 6 + vNumeros[4] * 7 + vNumeros[3] * 8 + vNumeros[2] * 9 + vNumeros[1] * 10;

  vD1 := 11 - (vD1 mod 11);

  if vD1 >= 10 then
    vD1 := 0;

  vD2 := vD1 * 2 + vNumeros[9] * 3 + vNumeros[8] * 4 + vNumeros[7] * 5 + vNumeros[6] * 6 + vNumeros[5] * 7 + vNumeros[4] * 8 + vNumeros[3] * 9 + vNumeros[2] * 10 + vNumeros[1] * 11;

  vD2 := 11 - (vD2 mod 11);

  if vD2 >= 10 then
    vD2 := 0;

  vCalculado := IntToStr(vD1) + IntToStr(vD2);

  vDigitado := vCPF[10] + vCPF[11];

  if vCalculado = vDigitado then
  begin
    Result := True;
  end
  else
  begin
    Result := False;
  end;
end;

function Desformatar(fConteudo: string): string;
var
  vResult: string;
begin
  vResult := fConteudo;
  vResult := StringReplace(vResult, '.', '', [rfReplaceAll]);
  vResult := StringReplace(vResult, '/', '', [rfReplaceAll]);
  vResult := StringReplace(vResult, '\', '', [rfReplaceAll]);
  vResult := StringReplace(vResult, '-', '', [rfReplaceAll]);
  vResult := StringReplace(vResult, '(', '', [rfReplaceAll]);
  vResult := StringReplace(vResult, ')', '', [rfReplaceAll]);
  vResult := StringReplace(vResult, ':', '', [rfReplaceAll]);
  vResult := StringReplace(vResult, #160, ' ', [rfReplaceall]);
  vResult := Trim(vResult);
  Result := vResult;
end;

function FormatarCPF(fCPF: string): string;
var
  vCPF: string;
begin
  vCPF := fCPF;
  vCPF := Desformatar(vCPF);
  Insert('.', vCPF, 4);
  Insert('.', vCPF, 8);
  Insert('-', vCPF, 12);
  Result := vCPF;
end;

function FormatarHora(fHora: string): string;
var
  vHora: string;
begin
  vHora := Trim(Desformatar(fHora));
  Insert(':', vHora, 3);
  Insert(':', vHora, 6);
  Result := vHora;
end;

function CNPJ(fCNPJ: string): Boolean;
var
  vNumeros: array[1..12] of Integer;
  vD1, vD2, vCnt: integer;
  vDigitado, vCalculado, vCNPJ: string;
begin
  vCNPJ := Trim(Desformatar(fCNPJ));

  try
    for vCnt := 1 to 12 do
    begin
      vNumeros[vCnt] := StrToInt(vCNPJ[vCnt]);
    end;
  except
    Exception.Create('CNPJ com caracteres inv·lidos');
  end;

  vD1 := vNumeros[12] * 2 + vNumeros[11] * 3 + vNumeros[10] * 4 + vNumeros[9] * 5 + vNumeros[8] * 6 + vNumeros[7] * 7 + vNumeros[6] * 8 + vNumeros[5] * 9 + vNumeros[4] * 2 + vNumeros[3] * 3 + vNumeros[2] * 4 + vNumeros[1] * 5;

  vD1 := 11 - (vD1 mod 11);

  if vD1 >= 10 then
    vD1 := 0;

  vD2 := vD1 * 2 + vNumeros[12] * 3 + vNumeros[11] * 4 + vNumeros[10] * 5 + vNumeros[9] * 6 + vNumeros[8] * 7 + vNumeros[7] * 8 + vNumeros[6] * 9 + vNumeros[5] * 2 + vNumeros[4] * 3 + vNumeros[3] * 4 + vNumeros[2] * 5 + vNumeros[1] * 6;

  vD2 := 11 - (vD2 mod 11);

  if vD2 >= 10 then
    vD2 := 0;

  vCalculado := IntToStr(vD1) + IntToStr(vD2);

  vDigitado := vCNPJ[13] + vCNPJ[14];

  if vCalculado = vDigitado then
  begin
    Result := True;
  end
  else
  begin
    Result := False;
  end;
end;

function FormatarCNPJ(fCNPJ: string): string;
var
  vCNPJ: string;
begin
  vCNPJ := fCNPJ;
  vCNPJ := Desformatar(vCNPJ);
  Insert('.', vCNPJ, 3);
  Insert('.', vCNPJ, 7);
  Insert('/', vCNPJ, 11);
  Insert('-', vCNPJ, 16);
  Result := vCNPJ;
end;

function FormatarCEP(fCEP: string): string;
var
  vCEP: string;
begin
  vCEP := fCEP;
  vCep := Desformatar(vCEP);
  Insert('-', vCEP, 6);
  Result := vCEP;
end;

function FormatarCFOP(fCFOP: string): string;
var
  vCFOP: string;
begin
  vCFOP := fCFOP;
  vCFOP := Desformatar(vCFOP);
  Insert('.', vCFOP, 2);
  Result := vCFOP;
end;

function StrZero(fValue: real; fZeros: integer): string;
var
  vValue: string;
  vCnt: Integer;
begin
  vValue := FloatToStr(fValue);
  if Length(vValue) >= fZeros then
  begin
    Result := vValue;
    exit;
  end;
  for vCnt := 1 to (fZeros - Length(vValue)) do
  begin
    vValue := '0' + vValue;
  end;
  Result := vValue;
end;

function StrZero(fValue: string; fZeros: integer): string;
var
  vValue: string;
  vCnt: Integer;
begin
  vValue := fValue;
  if Length(vValue) >= fZeros then
  begin
    Result := vValue;
    exit;
  end;
  for vCnt := 1 to (fZeros - Length(vValue)) do
  begin
    vValue := '0' + vValue;
  end;
  Result := vValue;
end;

function RemoverAcentos(fStr: string): string;
const
  cAcentos: string[82] = '<>!@#%®*()+={}[]?;:|*"~^¥`®™∫øÆΩº¯£ÿÁ«·¡‚¬‡¿„√È…Í Ë»ÌÕÓŒÏÃÙÚ˚˘⁄€ŸÉÛ˙Ò—”ﬂ‘“ı’µ˛˝›';
  cNoAcentos: string[82] = '                                    cCaAaAaAaAeEeEeEiIiIiIoouuUUUfounNOBoooOupyY';
var
  vStr: string;
  vCnt: Integer;
  vPos: Integer; // & = &amp;
begin
  vStr := fStr;
  for vCnt := 1 to Length(vStr) do
  begin
    vPos := Pos(vStr[vCnt], cAcentos);
    if vPos <> 0 then
    begin
      vStr[vCnt] := cNoAcentos[vPos];
    end;
  end;
  Result := vStr;
end;

function CodigoEstado(fEstado: string): string;
begin
  if fEstado = 'RO' then
    Result := '11';
  if fEstado = 'AC' then
    Result := '12';
  if fEstado = 'AM' then
    Result := '13';
  if fEstado = 'RR' then
    Result := '14';
  if fEstado = 'PA' then
    Result := '15';
  if fEstado = 'AP' then
    Result := '16';
  if fEstado = 'TO' then
    Result := '17';
  if fEstado = 'MA' then
    Result := '21';
  if fEstado = 'PI' then
    Result := '22';
  if fEstado = 'CE' then
    Result := '23';
  if fEstado = 'RN' then
    Result := '24';
  if fEstado = 'PB' then
    Result := '25';
  if fEstado = 'PE' then
    Result := '26';
  if fEstado = 'AL' then
    Result := '27';
  if fEstado = 'SE' then
    Result := '28';
  if fEstado = 'BA' then
    Result := '29';
  if fEstado = 'MG' then
    Result := '31';
  if fEstado = 'ES' then
    Result := '32';
  if fEstado = 'RJ' then
    Result := '33';
  if fEstado = 'SP' then
    Result := '35';
  if fEstado = 'PR' then
    Result := '41';
  if fEstado = 'SC' then
    Result := '42';
  if fEstado = 'RS' then
    Result := '43';
  if fEstado = 'MS' then
    Result := '50';
  if fEstado = 'MT' then
    Result := '51';
  if fEstado = 'GO' then
    Result := '52';
  if fEstado = 'DF' then
    Result := '53';
end;

function Replicar(fStr: string; fNum: integer): string;
var
  vCnt: integer;
begin
  Result := '';
  for vCnt := 1 to fNum do
  begin
    Result := Result + fStr;
  end;
end;

function SaveConfigNFeTxtPath(fPathNfe: string; fPath: string): Boolean;
var
  vText: TStringList;
begin
  vText := TStringList.Create;
  try
    try
      vText.Clear;
      vText.Add(fPathNfe);
      vText.SaveToFile(fPath + '\ConfigNFeTxtPath' + sis_ext_config_save);
      Result := True;
    except
      Result := False;
    end;
  finally
    vText.Free;
  end;
end;

function SaveConfigNFeXMLPath(fPathNfe: string; fPath: string): Boolean;
var
  vText: TStringList;
begin
  vText := TStringList.Create;
  try
    try
      vText.Clear;
      vText.Add(fPathNfe);
      vText.SaveToFile(fPath + '\ConfigNFeXMLPath' + sis_ext_config_save);
      Result := True;
    except
      Result := False;
    end;
  finally
    vText.Free;
  end;
end;

function SaveConfigNFeDanfePath(fPathNfe: string; fPath: string): Boolean;
var
  vText: TStringList;
begin
  vText := TStringList.Create;
  try
    try
      vText.Clear;
      vText.Add(fPathNfe);
      vText.SaveToFile(fPath + '\ConfigNFeDanfePath' + sis_ext_config_save);
      Result := True;
    except
      Result := False;
    end;
  finally
    vText.Free;
  end;
end;

function EnviarEmailImagem(fSmtpServ, fSmtpUser, fSmtpPass, fRemetNome, fRemetEmail, fDestEmail, fAssunto, fMsg, fAnexo1, fAnexo2, fAnexo3: string; fPorta: Integer; fDelAnexo: Boolean; fMsgHTML : String): string;
var
  IdSMTP: TIdSMTP;
  IdMessage: TIdMessage;
begin
  Result := '';
  IdSMTP := TIdSMTP.Create(nil);
  IdMessage := TIdMessage.Create(nil);

  try
    try
      IdSMTP.Host               := fSmtpServ;
      IDSMTP.Username           := fSmtpUser;
      IdSMTP.Password           := fSmtpPass;
      IdSMTP.Port               := fPorta;
      IdSMTP.AuthenticationType := atLogin;

      with IdMessage do
      begin
        MessageParts.Clear;
        Subject := fAssunto;
        From.Address := fRemetEmail;
        From.Name := fRemetNome;
        Recipients.Add.Address := fDestEmail;
        ReceiptRecipient.Text := IDMessage.From.Text; // Auto Resposta
        ContentType := 'multipart/alternative';
        ContentDisposition := 'inline';
        Encoding := meMIME;
      end;

      // Parte 0
      with TIdText.Create(IdMessage.MessageParts) do
      begin
        Body.Text       := fMsg;
        ContentTransfer := '7bit';
        ContentType     := 'text/plain';
      end;

      // Parte 1
      with TIdText.Create(IdMessage.MessageParts) do
      begin
        ContentType := 'multipart/alternative';
        Body.Clear;
      end;

      // Parte 2 - HTML
      with TIdText.Create(IdMessage.MessageParts) do
      begin
        Body.Clear;
        Body.Add(fMsgHTML);
        ContentTransfer := '7bit';
        ContentType     := 'text/html';
        // ParentPart      := 1;
      end;

      if Trim(fAnexo1) <> '' then
      begin
        TIdAttachment.Create(IdMessage.MessageParts, fAnexo1);
      end;
      if Trim(fAnexo2) <> '' then
      begin
        TIdAttachment.Create(IdMessage.MessageParts, fAnexo2);
      end;
      if Trim(fAnexo3) <> '' then
      begin
        TIdAttachment.Create(IdMessage.MessageParts, fAnexo3);
      end;

      if not IdSMTP.Connected then
        IdSMTP.Connect(2000);

      if IdSMTP.Connected then
      begin
        IdSMTP.Send(IdMessage);
        Application.ProcessMessages;
      end;
    except
      on E: Exception do
      begin
        Result := E.Message;
      end;
    end;
  finally
    IdSMTP.Free;
    IdMessage.Free;
  end;
end;


function EnviarEmail(fSmtpServ, fSmtpUser, fSmtpPass, fRemetNome, fRemetEmail, fDestEmail, fAssunto, fMsg, fAnexo1, fAnexo2, fAnexo3: string; fPorta: Integer; fDelAnexo: Boolean): string;
var
  IdSMTP: TIdSMTP;
  IdMessage: TIdMessage;
begin
  Result := '';
  IdSMTP := TIdSMTP.Create(nil);
  IdMessage := TIdMessage.Create(nil);

  try
    try
      IdSMTP.Host := fSmtpServ;
      IDSMTP.Username := fSmtpUser;
      IdSMTP.Password := fSmtpPass;
      IdSMTP.Port := fPorta;
      IdSMTP.AuthenticationType := atLogin;
      IdMessage.MessageParts.Clear;

      if Trim(fAnexo1) <> '' then
      begin
        TIdAttachment.Create(IdMessage.MessageParts, fAnexo1);
      end;
      if Trim(fAnexo2) <> '' then
      begin
        TIdAttachment.Create(IdMessage.MessageParts, fAnexo2);
      end;
      if Trim(fAnexo3) <> '' then
      begin
        TIdAttachment.Create(IdMessage.MessageParts, fAnexo3);
      end;

      // Dados da origem do email
      IdMessage.From.Address := fRemetEmail;
      IdMessage.Subject := fAssunto;
      IdMessage.Body.Text := fMsg;

      // Dados do destino do email
      IdMessage.Recipients.EMailAddresses := fDestEmail;
      IdMessage.ReceiptRecipient.Text := IDMessage.From.Text; // Auto Resposta

      if not IdSMTP.Connected then
        IdSMTP.Connect(2000);

      if IdSMTP.Connected then
      begin
        IdSMTP.Send(IdMessage);
        Application.ProcessMessages;
      end;
    except
      on E: Exception do
      begin
        Result := E.Message;
      end;
    end;
  finally
    IdSMTP.Free;
    IdMessage.Free;
  end;
end;

function LoadConfigListBox(fPath: string; pTipo: string): string;
var
  vText: TStringList;
  vPathFileComplete: string;
begin
  Result := '';
  vText := TStringList.Create;
  try
    vPathFileComplete := fPath + '\' + pTipo + sis_ext_config_save;
    vText.Clear;

    if FileExists(vPathFileComplete) then
    begin
      vText.LoadFromFile(vPathFileComplete);
      if Trim(vText.Strings[0]) <> '' then
      begin
        Result := Trim(vText.Strings[0]);
      end;
    end;
  finally
    vText.Free;
  end;
end;

function SaveConfigListBox(pListBox: TListBox; fPath: string; pTipo: string): Boolean;
var
  vText: TStringList;
  vItens: string;
  vCnt: integer;
begin
  vItens := '';

  for vCnt := 0 to (pListBox.Items.Count - 1) do
  begin
    if Trim(vItens) <> '' then
      vItens := vItens + ' , ';
    vItens := vItens + pListBox.Items[vCnt];
  end;

  vText := TStringList.Create;
  try
    try
      vText.Clear;
      vText.Add(vItens);
      vText.SaveToFile(fPath + '\' + pTipo + sis_ext_config_save);
      Result := True;
    except
      Result := False;
    end;
  finally
    vText.Free;
  end;
end;

function LoadConfigNFeTxtPath(fPath: string): string;
var
  vText: TStringList;
  vPathFileComplete: string;
begin
  Result := '';
  vText := TStringList.Create;
  try
    vPathFileComplete := fPath + '\ConfigNFeTxtPath' + sis_ext_config_save;
    vText.Clear;

    if FileExists(vPathFileComplete) then
    begin
      vText.LoadFromFile(vPathFileComplete);
      if Trim(vText.Strings[0]) <> '' then
      begin
        Result := Trim(vText.Strings[0]);
      end;
    end;
  finally
    vText.Free;
  end;
end;

function LoadConfigNFeXMLPath(fPath: string): string;
var
  vText: TStringList;
  vPathFileComplete: string;
begin
  Result := '';
  vText := TStringList.Create;
  try
    vPathFileComplete := fPath + '\ConfigNFeXMLPath' + sis_ext_config_save;
    vText.Clear;

    if FileExists(vPathFileComplete) then
    begin
      vText.LoadFromFile(vPathFileComplete);
      if Trim(vText.Strings[0]) <> '' then
      begin
        Result := Trim(vText.Strings[0]);
      end;
    end;
  finally
    vText.Free;
  end;
end;

function LoadConfigNFeDanfePath(fPath: string): string;
var
  vText: TStringList;
  vPathFileComplete: string;
begin
  Result := '';
  vText := TStringList.Create;
  try
    vPathFileComplete := fPath + '\ConfigNFeDanfePath' + sis_ext_config_save;
    vText.Clear;

    if FileExists(vPathFileComplete) then
    begin
      vText.LoadFromFile(vPathFileComplete);
      if Trim(vText.Strings[0]) <> '' then
      begin
        Result := Trim(vText.Strings[0]);
      end;
    end;
  finally
    vText.Free;
  end;
end;

function ChrAlt(fTexto: string): string;
var
  vTexto: string;
begin
  vTexto := fTexto;
  vTexto := StringReplace(vTexto, '&', '&amp;', [rfReplaceAll]);
  Result := vTexto;
end;

procedure AtzTree(tv: TTreeView; fMenuPrinc: TMainMenu; fMenu: TMenu);
var
  i, j, p: integer;
  a, b: string;
  mI, mS: TMenuItem;
  n, sn: TTreeNode;
begin
  tv.Items.Clear;
  sn := nil;
  sn := tv.Items.Add(sn, 'Telas do Sistema');
  for i := 0 to fMenuPrinc.Items.Count - 1 do
  begin
    Application.ProcessMessages;
    mI := fMenu.Items[i];
    a := mI.Caption;
    p := pos('&', a);
    if p > 0 then
      Delete(a, p, 1);
    n := tv.Items.AddChild(sn, a);
    for j := 0 to mI.Count - 1 do
    begin
      Application.ProcessMessages;
      mS := mI.Items[j];
      b := mS.Caption;
      p := pos('&', b);
      if p > 0 then
        Delete(b, p, 1);
      if b <> '-' then
        tv.Items.AddChild(n, b);
    end;
  end;
end;

function nrItensRot(rot: string): integer;
var
  i, p, t: integer;
  s: string;
begin
  t := 0;
  for i := 0 to Length(rot) do
  begin
    Application.ProcessMessages;
    s := Copy(rot, 1, 2);
    p := pos('|', rot);
    if p > 0 then
    begin
      if s[2] <> '|' then
      begin
        Delete(rot, 1, p);
        p := pos('|', rot);
        Delete(rot, 1, p - 1)
      end
      else
      begin
        Delete(rot, 1, p + 1);
        p := pos('|', rot);
        Delete(rot, 1, p - 1);
      end;
      inc(t)
    end
  end;
  result := t;
end;

function GetTableFromSQL(fSQL: string): string;
var
  vPos: Integer;
  vTabela, vChar: string;
  vCopiar: integer;
  vFim, vAtivo: boolean;
  vTamanho: Integer;
begin
  vTabela := '';
  vChar := '';
  vFim := False;
  vAtivo := False;

  vPos := Pos('FROM', UpperCase(fSQL));
  if vPos <> 0 then
  begin
    vTamanho := Length(fSQL);
    vCopiar := vPos + 5;
    repeat
      vChar := Copy(fSQL, vCopiar, 1);

      if (vChar = ',') then
      begin
        break;
      end;

      if Trim(vChar) <> '' then
      begin
        vAtivo := True;
        vTabela := vTabela + vChar;
      end;

      if (vAtivo = True) and (vChar = ' ') then
      begin
        vFim := True;
      end;

      if vCopiar >= vTamanho then
      begin
        vFim := True;
      end;

      Inc(vCopiar);
    until vFim = True;
    Result := vTabela;
  end;
end;

function GetCSOSN: TStringList;
var
  vStr: TStringList;
begin
  vStr := TStringList.Create;
  vStr.Clear;
  vStr.Add('101');
  vStr.Add('102');
  vStr.Add('103');
  vStr.Add('201');
  vStr.Add('202');
  vStr.Add('203');
  vStr.Add('300');
  vStr.Add('400');
  vStr.Add('500');
  vStr.Add('900');
  Result := vStr;
end;

function GetCST: TStringList;
var
  vStr: TStringList;
begin
  vStr := TStringList.Create;
  vStr.Clear;
  vStr.Add('00');
  vStr.Add('10');
  vStr.Add('20');
  vStr.Add('30');
  vStr.Add('40');
  vStr.Add('41');
  vStr.Add('50');
  vStr.Add('51');
  vStr.Add('60');
  vStr.Add('70');
  vStr.Add('90');
  Result := vStr;
end;

function GetUFs: TStringList;
var
  vStr: TStringList;
begin
  vStr := TStringList.Create;
  vStr.Clear;
  vStr.Add('AC');
  vStr.Add('AL');
  vStr.Add('AM');
  vStr.Add('AP');
  vStr.Add('BA');
  vStr.Add('CE');
  vStr.Add('DF');
  vStr.Add('ES');
  vStr.Add('GO');
  vStr.Add('MA');
  vStr.Add('MG');
  vStr.Add('MS');
  vStr.Add('MT');
  vStr.Add('PA');
  vStr.Add('PB');
  vStr.Add('PE');
  vStr.Add('PI');
  vStr.Add('PR');
  vStr.Add('RJ');
  vStr.Add('RN');
  vStr.Add('RO');
  vStr.Add('RR');
  vStr.Add('RS');
  vStr.Add('SC');
  vStr.Add('SE');
  vStr.Add('SP');
  vStr.Add('TO');
  Result := vStr;
end;

function LoadPathNFeSalvar: string;
var
  vPath: string;
begin
  Result := '';
  vPath := GetPathAppData + '\' + UpperCase(corp_name) + '\' + Application.Title + '\NFeSalvar';
  if DirectoryExists(vPath) then
  begin
    Result := vPath;
  end;
end;

function LoadPathNFeSchemas: string;
var
  vPath: string;
begin
  Result := '';
  vPath := GetPathAppData + '\' + UpperCase(corp_name) + '\' + Application.Title + '\NFeSchemas';
  if DirectoryExists(vPath) then
  begin
    Result := vPath;
  end;
end;

procedure HabMenu(fMenuPrinc: TMainMenu; fMenu: TMenu; rotinas: string);
var
  i, j, k, nRots, p: integer;
  a, b, s: string;
  mI, mS: TMenuItem;
begin
  for i := 0 to fMenuPrinc.Items.Count - 1 do
  begin
    Application.ProcessMessages;
    fMenu.Items[i].Enabled := False;
    for j := 0 to fMenuPrinc.Items[i].Count - 1 do
      fMenu.Items[i].Items[j].Enabled := False;
  end;
  if Trim(rotinas) <> '' then
  begin
    nRots := nrItensRot(rotinas);
    for i := 0 to nRots do
    begin
      Application.ProcessMessages;
      a := Copy(rotinas, 1, 2);
      if a[2] <> '|' then
      begin
        Delete(rotinas, 1, 1);
        p := Pos('|', rotinas);
        b := Copy(rotinas, 1, p - 1);
        Delete(rotinas, 1, p - 1);
      end
      else
      begin
        Delete(rotinas, 1, 2);
        p := Pos('|', rotinas);
        if p > 0 then
          b := Copy(rotinas, 1, p - 1)
        else
          b := rotinas;
        Delete(rotinas, 1, p - 1);
      end;
      for j := 0 to fMenuPrinc.Items.Count - 1 do
      begin
        Application.ProcessMessages;
        mI := fMenu.Items[j];
        s := mI.Caption;
        p := Pos('&', s);
        if p > 0 then
          Delete(s, p, 1);
        if b = s then
          mI.Enabled := True;
        for k := 0 to fMenu.Items[j].Count - 1 do
        begin
          Application.ProcessMessages;
          mS := fMenu.Items[j].Items[k];
          s := mS.Caption;
          p := Pos('&', s);
          if p > 0 then
            Delete(s, p, 1);
          if b = s then
            mS.Enabled := True;
        end;
      end;
    end;
  end
  else
  begin
    for i := 0 to fMenuPrinc.Items.Count - 1 do
    begin
      Application.ProcessMessages;
      fMenu.Items[i].Enabled := True;
      for j := 0 to fMenuPrinc.Items[i].Count - 1 do
        fMenu.Items[i].Items[j].Enabled := True;
    end;
  end;
end;

function GetNomeSobreNome(fNomeCompleto: string): string;
var
  vNomeCompleto, vCopia: string;
  vContagem, vCnt: Integer;
  vTmp: ansistring;
begin
  vContagem := 0;
  vCopia := '';
  vNomeCompleto := fNomeCompleto;
  for vCnt := 1 to Length(vNomeCompleto) do
  begin
    vCopia := vCopia + vNomeCompleto[vCnt];
    if vNomeCompleto[vCnt] = ' ' then
    begin
      vContagem := vContagem + 1;
    end;
    if vContagem >= 2 then
    begin
      vTmp := LowerCase(Copy(vNomeCompleto, vCnt - 3, 3));
      if (vTmp = 'de ') or (vTmp = 'da ') then
      begin
        Continue;
      end
      else
      begin
        Break;
      end;
    end;
  end;
  Result := vCopia;
end;

function GetCotacoesUpdates: TStringList;
var
  vStr: TStringList;
begin
  vStr := TStringList.Create;
  vStr.Clear;
  vStr.Add('DÛlar');
  Result := vStr;
end;

function ExtractMonthByNum(fVal: integer): string;
begin
  Result := '';
  case fVal of
    1: Result := 'Janeiro';
    2: Result := 'Fevereiro';
    3: Result := 'MarÁo';
    4: Result := 'Abril';
    5: Result := 'Maio';
    6: Result := 'Junho';
    7: Result := 'Julho';
    8: Result := 'Agosto';
    9: Result := 'Setembro';
    10: Result := 'Outubro';
    11: Result := 'Novembro';
    12: Result := 'Dezembro';
  end;
end;

function PeriodoExtenso(fDataInicial, fDataFinal: TDateTime): string;
var
  vHoras, vMinutos, vSegundos: Int64;
  vValor: Int64;
begin
  vValor := (SecondsBetween(fDataInicial, fDataFinal));
  vHoras := vValor div 3600;
  vMinutos := vValor div 60 - vHoras * 60;
  vSegundos := (vValor - (vHoras * 3600 + vMinutos * 60)) + 1;
  Result := Format('%0.2d:%0.2d:%0.2d', [vHoras, vMinutos, vSegundos]);
end;

function MesExtenso(fMes: Integer): string;
begin
  case fMes of
    1: Result := 'Janeiro';
    2: Result := 'Fevereiro';
    3: Result := 'MarÁo';
    4: Result := 'Abril';
    5: Result := 'Maio';
    6: Result := 'Junho';
    7: Result := 'Julho';
    8: Result := 'Agosto';
    9: Result := 'Setembro';
    10: Result := 'Outubro';
    11: Result := 'Novembro';
    12: Result := 'Dezembro';
  end;
end;

function DeleteLineBreaks(const S: string): string;
var
  Source, SourceEnd: PChar;
begin
  Source := Pointer(S);
  SourceEnd := Source + Length(S);
  while Source < SourceEnd do
  begin
    case Source^ of
      #10: Source^ := #32;
      #13: Source^ := #32;
    end;
    Inc(Source);
  end;
  Result := S;
end;

procedure Delay(pMSec: Cardinal);
var
  Start: Cardinal;
begin
  Start := GetTickCount;
  repeat
    Application.ProcessMessages;
  until (GetTickCount - Start) >= pMSec;
end;

procedure ExportarDataSetToExcel(pDataSet: TDataSet);
var
  vPlanilha: Variant;
  vColuna, vLinha: Integer;
  vValorCampo: string;
begin
  vPlanilha := CreateoleObject('Excel.Application');
  vPlanilha.WorkBooks.Add(1);
  vPlanilha.Caption := 'Exportando dados para o Excel';
  vPlanilha.Visible := True;
  pDataSet.First;
  for vLinha := 0 to pDataSet.RecordCount - 1 do
  begin
    for vColuna := 1 to pDataSet.FieldCount do
    begin
      vValorCampo := pDataSet.Fields[vColuna - 1].AsString;
      vPlanilha.Cells[vLinha + 2, vColuna] := vValorCampo;
    end;
    pDataSet.Next;
  end;
  for vColuna := 1 to pDataSet.FieldCount do
  begin
    vValorCampo := pDataSet.Fields[vColuna - 1].DisplayLabel;
    vPlanilha.Cells[1, vColuna] := vValorCampo;
  end;
  vPlanilha.Columns.Autofit;
end;

procedure SavePathNFeSalvar;
var
  vPath: string;
begin
  vPath := GetPathAppData + '\' + UpperCase(corp_name) + '\' + Application.Title + '\NFeSalvar';
  if not DirectoryExists(PChar(vPath)) then
  begin
    ForceDirectories(vPath);
  end;
end;

procedure SavePathNFeSchemas;
var
  vPath: string;
begin
  vPath := GetPathAppData + '\' + UpperCase(corp_name) + '\' + Application.Title + '\NFeSchemas';
  if not DirectoryExists(PChar(vPath)) then
  begin
    ForceDirectories(vPath);
  end;
end;

procedure CarregarImpressoras(pComboBox: TComboBox);
var
  vCnt: Integer;
begin
  pComboBox.Items.Clear;
  for vCnt := 0 to (Printer.Printers.Count - 1) do
  begin
    pComboBox.Items.Add(Printer.Printers.Strings[vCnt]);
  end;
  pComboBox.ItemIndex := Printer.PrinterIndex;
end;

procedure CarregarImpressoras2(pListBox: TListBox);
var
  vCnt: Integer;
begin
  pListBox.Items.Clear;
  for vCnt := 0 to (Printer.Printers.Count - 1) do
  begin
    pListBox.Items.Add(Printer.Printers.Strings[vCnt]);
  end;
  pListBox.ItemIndex := Printer.PrinterIndex;
end;

function Explode(str, separador: string): TStringList;
var
  p: integer;
begin
  Result := TStringList.Create;

  p := Pos(separador, str);
  while (p > 0) do
  begin
    Result.Add(Copy(str, 1, p - 1));
    Delete(str, 1, p + Length(separador) - 1);
    p := Pos(separador, str);
  end;

  if (str <> '') then
    Result.Add(str);
end;

function FormExiste(aberto: string): Boolean;
var
  I: Integer;
begin
  FormExiste := false;
  for I := 0 to Screen.FormCount - 1 do
    if Screen.Forms[i].Name = aberto then
    begin
      FormExiste := true;
      Break;
    end
end;

function ConverteData(Data: TDate): string;
begin
  Result := IntToStr(YearOf(Data)) + '-' + IntToStr(MonthOf(Data)) + '-' + IntToStr(DayOf(data));
end;

function RetiraEspaco(s: string): string;
var
  i: Integer;
begin
  for i := 1 to Length(s) do
    if s[i] <> ' ' then
      Result := Result + s[i];
end;

function TrocaVirgPPto(Valor: string): String;
   var i:integer;
begin
    if Valor <>'' then begin
        for i := 0 to Length(Valor) do begin
            if Valor[i]=',' then Valor[i]:='.';

        end;
     end;
     Result := valor;
end;


end.


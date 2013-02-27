unit uAuditoria; 

interface

uses Forms, ZConnection, uConstantes, ZDataset, SysUtils, DB, Dialogs, Classes;

procedure UserLog(pUser: string; pPCName: string; pStats: string);
procedure Auditar(pDataSet: TDataSet);

implementation

uses uFuncoes, uMenu;

procedure UserLog(pUser: string; pPCName: string; pStats: string);
var vQuery: TZQuery;
    ZCon : TZConnection;
begin
   ZCon:=TZConnection(TForm(Application.FindComponent(sis_menu_name)).FindComponent(sis_conect_name));
   vQuery:=TZQuery.Create(nil);
   try try
      vQuery.Connection:=ZCon;
      vQuery.Close;
      vQuery.SQL.Clear;
      vQuery.SQL.Add('SELECT * FROM usuarios_logados WHERE Usuario = '+QuotedStr(pUser));
      vQuery.Open;
      if vQuery.RecordCount = 1 then begin
         vQuery.Edit;
         vQuery.FieldByName('Executavel').AsString := ExtractFileName(Application.ExeName);
         
         if pStats = 'in' then begin
            vQuery.FieldByName('DataLogin').AsDateTime:=Now;
            vQuery.FieldByName('DataLogoff').Clear;
          end
         else begin
            // vQuery.FieldByName('DataLogin').Clear;
            vQuery.FieldByName('DataLogoff').AsDateTime:=Now;
         end;

         vQuery.FieldByName('Computador').AsString:=pPCName;
         vQuery.Post;
         vQuery.ApplyUpdates;
       end
      else begin
         vQuery.Append;
         vQuery.FieldByName('Usuario').AsString:=pUser;
         vQuery.FieldByName('Executavel').AsString := ExtractFileName(Application.ExeName);
         
         if pStats = 'in' then begin
            vQuery.FieldByName('DataLogin').AsDateTime:=Now;
            vQuery.FieldByName('DataLogoff').Clear;
          end
         else begin
            // vQuery.FieldByName('DataLogin').Clear;
            vQuery.FieldByName('DataLogoff').AsDateTime:=Now;
         end;
         vQuery.FieldByName('Computador').AsString:=pPCName;
         vQuery.Post;
         vQuery.ApplyUpdates;
      end;
   except

   end;
   finally
      vQuery.Close;
      vQuery.Free;
   end;
end;

procedure Auditar(pDataSet: TDataSet);
var vCnt, vCnt2 : Integer;
    vQuery, vBusca: TZQuery;
    ZCon : TZConnection;
    vChaveCampos, vChaveValores, vWhere: string;
    vCampos, vValores: TStringList;  
begin
   ZCon:=TZConnection(TForm(Application.FindComponent(sis_menu_name)).FindComponent(sis_conect_name));
   vQuery:=TZQuery.Create(nil);
   vBusca:=TZQuery.Create(nil);
   vCampos:=TStringList.Create;
   vValores:=TStringList.Create;
   try try
      vQuery.Connection:=ZCon;
      vBusca.Connection:=ZCon;

      vQuery.Close;
      vQuery.SQL.Clear;
      vQuery.SQL.Add('SELECT * FROM log_arquivos WHERE 0');
      vQuery.Open;

      if pDataSet.State = dsInsert then begin
         vChaveCampos:=''; 
         vChaveValores:='';
         for vCnt:=0 to pDataSet.FieldCount-1 do begin
            if pDataSet.FieldByName( pDataSet.Fields.Fields[vCnt].FieldName ).Required then begin
               if Trim(vChaveCampos) <> '' then vChaveCampos:=vChaveCampos + ';';
               vChaveCampos:=vChaveCampos + pDataSet.FieldByName( pDataSet.Fields.Fields[vCnt].FieldName ).FieldName;
               if Trim(vChaveValores) <> '' then vChaveValores:=vChaveValores + ';';
               vChaveValores:=vChaveValores + pDataSet.FieldByName( pDataSet.Fields.Fields[vCnt].FieldName ).AsString;
            end;
         end;
         Application.ProcessMessages;
         vQuery.Append;
         vQuery.FieldByName('ID').AsFloat:=CodeGenerator('log_arquivos', 'ID');
         vQuery.FieldByName('Usuario').AsString:=fmMenu.pubUsuario;  
         vQuery.FieldByName('TipoAlteracao').AsString:='1';// VARCHAR(1), '); // 1 = Inclusão, 2 = Edição, 3 = Exclusão
         vQuery.FieldByName('DataAlteracao').AsDateTime:=Now;
         vQuery.FieldByName('Tabela').AsString:=GetTableFromSQL((pDataSet as TZQuery).SQL.Text);
         vQuery.FieldByName('ChavesCampos').AsString:=vChaveCampos;
         vQuery.FieldByName('ChavesValores').AsString:=vChaveValores;
         vQuery.FieldByName('Campo').AsString:='';
         vQuery.FieldByName('ValorNovo').AsString:='';
         vQuery.FieldByName('ValorAntigo').AsString:='';
         vQuery.FieldByName('Computador').AsString:=GetPCName;
         vQuery.Post;
         vQuery.ApplyUpdates;
       end
      else if pDataSet.State = dsEdit then begin
         vChaveCampos:='';
         vChaveValores:='';
         for vCnt:=0 to pDataSet.FieldCount-1 do begin
            if pDataSet.FieldByName( pDataSet.Fields.Fields[vCnt].FieldName ).Required then begin

               if Trim(vChaveCampos) <> '' then vChaveCampos:=vChaveCampos + ';';
               vChaveCampos:=vChaveCampos + pDataSet.FieldByName( pDataSet.Fields.Fields[vCnt].FieldName ).FieldName;

               if Trim(vChaveValores) <> '' then vChaveValores:=vChaveValores + ';';
               vChaveValores:=vChaveValores + pDataSet.FieldByName( pDataSet.Fields.Fields[vCnt].FieldName ).AsString;
            end;
         end;
         for vCnt:=0 to pDataSet.FieldCount-1 do begin
            Application.ProcessMessages;

            vBusca.Close;
            vBusca.SQL.Clear;
            vBusca.SQL.Add('SELECT * FROM '+GetTableFromSQL((pDataSet as TZQuery).SQL.Text));

            ExtractStrings([';'], [' '], PChar(vChaveCampos), vCampos);
            ExtractStrings([';'], [' '], PChar(vChaveValores), vValores);

            vWhere:='';

            for vCnt2:=0 to (vCampos.Count-1) do begin
               if Trim(vCampos.Strings[vCnt2]) <> '' then begin
                  if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
                  vWhere:=vWhere + vCampos.Strings[vCnt2]+' = '+QuotedStr(vValores.Strings[vCnt2]);
               end;
            end;

            if Trim(vWhere) <> '' then begin
               vBusca.SQL.Add('WHERE');
               vBusca.SQL.Add(vWhere);
            end;
            vBusca.Open;
            if vBusca.RecordCount > 0 then begin
               if pDataSet.FieldByName(pDataSet.Fields.Fields[vCnt].FieldName).Value <>
                  vBusca.FieldByName(vBusca.Fields.Fields[vCnt].FieldName).Value then begin
                  vQuery.Append;
                  vQuery.FieldByName('ID').AsFloat:=CodeGenerator('log_arquivos', 'ID');
                  vQuery.FieldByName('Usuario').AsString:=fmMenu.pubUsuario;  
                  vQuery.FieldByName('TipoAlteracao').AsString:='2';// VARCHAR(1), '); // 1 = Inclusão, 2 = Edição, 3 = Exclusão
                  vQuery.FieldByName('DataAlteracao').AsDateTime:=Now;
                  vQuery.FieldByName('Tabela').AsString:=GetTableFromSQL((pDataSet as TZQuery).SQL.Text);
                  vQuery.FieldByName('ChavesCampos').AsString:=vChaveCampos;
                  vQuery.FieldByName('ChavesValores').AsString:=vChaveValores;
                  vQuery.FieldByName('Campo').AsString:=pDataSet.FieldByName(pDataSet.Fields.Fields[vCnt].FieldName).FieldName;
                  vQuery.FieldByName('ValorNovo').AsString:=pDataSet.FieldByName(pDataSet.Fields.Fields[vCnt].FieldName).AsString;
                  vQuery.FieldByName('ValorAntigo').AsString:=vBusca.FieldByName(vBusca.Fields.Fields[vCnt].FieldName).AsString;
                  vQuery.FieldByName('Computador').AsString:=GetPCName; 
                  vQuery.Post;
                  vQuery.ApplyUpdates;
               end;
            end;
         end;
       end
      else if pDataSet.State = dsBrowse then begin
         vChaveCampos:='';
         vChaveValores:='';        
         for vCnt:=0 to pDataSet.FieldCount-1 do begin
            if pDataSet.FieldByName( pDataSet.Fields.Fields[vCnt].FieldName ).Required then begin

               if Trim(vChaveCampos) <> '' then vChaveCampos:=vChaveCampos + ';';
               vChaveCampos:=vChaveCampos + pDataSet.FieldByName( pDataSet.Fields.Fields[vCnt].FieldName ).FieldName;

               if Trim(vChaveValores) <> '' then vChaveValores:=vChaveValores + ';';
               vChaveValores:=vChaveValores + pDataSet.FieldByName( pDataSet.Fields.Fields[vCnt].FieldName ).AsString; 
            end;
         end;
         for vCnt:=0 to pDataSet.FieldCount-1 do begin        
            Application.ProcessMessages;
            vQuery.Append;
            vQuery.FieldByName('ID').AsFloat:=CodeGenerator('log_arquivos', 'ID');
            vQuery.FieldByName('Usuario').AsString:=fmMenu.pubUsuario;  
            vQuery.FieldByName('TipoAlteracao').AsString:='3';// VARCHAR(1), '); // 1 = Inclusão, 2 = Edição, 3 = Exclusão
            vQuery.FieldByName('DataAlteracao').AsDateTime:=Now;
            vQuery.FieldByName('Tabela').AsString:=GetTableFromSQL((pDataSet as TZQuery).SQL.Text);
            vQuery.FieldByName('ChavesCampos').AsString:=vChaveCampos;
            vQuery.FieldByName('ChavesValores').AsString:=vChaveValores;
            vQuery.FieldByName('Campo').AsString:=pDataSet.FieldByName(pDataSet.Fields.Fields[vCnt].FieldName).FieldName;
            vQuery.FieldByName('ValorNovo').AsString:=pDataSet.FieldByName(pDataSet.Fields.Fields[vCnt].FieldName).AsString;
            vQuery.FieldByName('ValorAntigo').AsString:=pDataSet.FieldByName(pDataSet.Fields.Fields[vCnt].FieldName).AsString;
            vQuery.FieldByName('Computador').AsString:=GetPCName;
            vQuery.Post; 
            vQuery.ApplyUpdates; 
         end;
      end;
   except

   end;
   finally
      vBusca.Close;
      vQuery.Close;
      vQuery.Free;
      vBusca.Free;
      vCampos.Free;
      vValores.Free;
   end;
end;

end.

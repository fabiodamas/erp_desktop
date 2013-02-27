unit uLeituraDigital; 

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, Menus, StdCtrls, ExtCtrls, Buttons, Comobj,
  DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Grids, DBGrids;

const
   NBioAPI_WINDOW_STYLE_POPUP      = 0;
   NBioAPI_WINDOW_STYLE_INVISIBLE  = 1; //only for NBioAPI_Capture()
   NBioAPI_WINDOW_STYLE_CONTINUOUS = 2;

   NBioAPI_WINDOW_STYLE_NO_FPIMG   = $00010000;
   NBioAPI_WINDOW_STYLE_TOPMOST    = $00020000;  //default flag and not used after v2.3 (WinCE v1.2)
   NBioAPI_WINDOW_STYLE_NO_WELCOME = $00040000;  //only for enroll
   NBioAPI_WINDOW_STYLE_NO_TOPMOST = $00080000;  //additional flag after v2.3 (WinCE v1.2)
   NBioAPI_DEVICE_ID_NONE          = 0;
   NBioAPIERROR_NONE = 0;

   NBioAPI_FIR_PURPOSE_VERIFY      = 1;
   NBioAPI_DEVICE_ID_FDP02_0       = 1;
   NBioAPI_DEVICE_ID_FDU01_0       = 2;
   NBioAPI_DEVICE_ID_AUTO_DETECT   = 255;
   NBioAPI_TRUE = 1;

type
  TfmLeituraDigital = class(TfmFormBaseAvancado)
    imgFoto: TImage;
    lblCodigo: TLabel;
    lblNome: TLabel;
    pnlDigital: TPanel;
    lblStatus: TLabel;
    tabDigital: TZQuery;
    dbgHorarios: TDBGrid;
    tabHorarios: TZQuery;
    dtsHorarios: TDataSource;
    tabFuncionarios: TZQuery;
    tabFotos: TZQuery;
    tmrDigital: TTimer;
    Label1: TLabel;
    Bevel1: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tmrDigitalTimer(Sender: TObject);
  private
    procedure RegistrarUsuario(fCodigo: real);
    procedure LocalizarDigital(pDigital: ansistring);
    procedure ResetUser;
  public
    { Public declarations }
  end;

var
  fmLeituraDigital: TfmLeituraDigital;
  objNBioBSP      : variant;
  objDevice       : variant;
  objExtraction   : variant;
  objMatching     : variant;
  objIndexSearch  : variant;

implementation

uses uFormBase, uMenu, uFuncoes, uConstantes, DateUtils;

{$R *.dfm}

procedure TfmLeituraDigital.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
   try
      objNBioBSP:=CreateOleObject('NBioBSPCOM.NBioBSP');
      objDevice:=objNBioBSP.Device;
      objExtraction:=objNBioBSP.Extraction;
      objMatching:=objNBioBSP.Matching;
      objIndexSearch:=objNBioBSP.IndexSearch;
   except
      tmrDigital.Enabled:=False;
      lblStatus.Caption:='Não foi possível inicializar o Leitor Biométrico.';
      lblStatus.Font.Color:=clRed;      
   end;
end;

procedure TfmLeituraDigital.RegistrarUsuario(fCodigo: real);
var vHoraAgora, vUltimaHora : TDateTime;
    vDifMinutos : Int64;
const
    cMinError = 10;
begin
   try
      tabFuncionarios.Close;
      tabFuncionarios.SQL.Clear;
      tabFuncionarios.SQL.Add('SELECT * FROM funcionarios WHERE Codigo = '+QuotedStr(FloatToStr(fCodigo)));
      tabFuncionarios.Open;

      if tabFuncionarios.RecordCount > 0 then begin
         lblCodigo.Caption:='Código: '+FloatToStr(fCodigo);
         lblNome.Caption:='Nome: '+tabFuncionarios.FieldByName('Nome').AsString;

         tabFotos.Close;
         tabFotos.SQL.Clear;
         tabFotos.SQL.Add('SELECT * FROM funcionarios_fotos WHERE CodigoFuncionario = '+QuotedStr(FloatToStr(fCodigo)));
         tabFotos.Open;

         if tabFotos.RecordCount = 1 then begin
            if not LoadImageFromBD(tabFotos.FieldByName('Foto'), imgFoto) then imgFoto.Picture:=nil;
         end;
      end;

      tabHorarios.Close;
      tabHorarios.SQL.Clear;
      tabHorarios.SQL.Add('SELECT * FROM funcionarios_horarios ');
      tabHorarios.SQL.Add('WHERE CodigoFuncionario = '+QuotedStr(FloatToStr(fCodigo)));
      tabHorarios.SQL.Add('AND Data = '+QuotedStr(FormatDateTime(sis_date_format, Date)));
      tabHorarios.SQL.Add('ORDER BY Hora');
      tabHorarios.Open;
      tabHorarios.Last;

      vUltimaHora:=StrToTime(FormatDateTime('hh:mm:ss', tabHorarios.FieldByName('Hora').AsDateTime));
      vHoraAgora:=StrToTime(FormatDateTime('hh:mm:ss', Now));
      vDifMinutos:=MinutesBetween(vUltimaHora, vHoraAgora);

      if tabHorarios.RecordCount = 0 then begin
         vDifMinutos:= cMinError + 1;  
      end;

      // Caso ele fique tentando por (N) minutos no leitor, não efetua o lança. 
      if vDifMinutos > cMinError  then begin
         tabHorarios.Append;
         tabHorarios.FieldByName('ID').AsFloat:=CodeGenerator('funcionarios_horarios', 'ID');
         tabHorarios.FieldByName('CodigoFuncionario').AsFloat:=fCodigo;
         tabHorarios.FieldByName('Data').AsDateTime:=Date;
         tabHorarios.FieldByName('Hora').AsDateTime:=vHoraAgora;
         tabHorarios.Post;
         tabHorarios.ApplyUpDates;
         if tabHorarios.RecordCount mod 2 = 0 then begin
            lblStatus.Caption:='Saída Registrada';
            lblStatus.Font.Color:=clYellow;
          end
         else begin
            lblStatus.Caption:='Entrada Registrada ';
            lblStatus.Font.Color:=clGreen;
         end;
       end
      else begin
         if tabHorarios.RecordCount mod 2 = 0 then begin
            lblStatus.Caption:='* Saída já Registrada';
            lblStatus.Font.Color:=clYellow;
          end
         else begin
            lblStatus.Caption:='* Entrada já Registrada';
            lblStatus.Font.Color:=clGreen;
         end;
      end;

   finally
      //tabLancamentos.Close;
   end;
end;

procedure TfmLeituraDigital.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabHorarios.Close;
   tabDigital.Close;
   tabFuncionarios.Close;
   tabFotos.Close;
   objDevice.Close(255);
   inherited;
end;

procedure TfmLeituraDigital.tmrDigitalTimer(Sender: TObject);
begin
   inherited;
   objExtraction.WindowStyle:=NBioAPI_WINDOW_STYLE_INVISIBLE;
   objExtraction.FingerWnd:=pnlDigital.Handle;
   objExtraction.WindowOption[NBioAPI_WINDOW_STYLE_NO_FPIMG]:=False;
   objExtraction.WindowOption[NBioAPI_WINDOW_STYLE_NO_TOPMOST]:=False;
   objExtraction.WindowOption[NBioAPI_WINDOW_STYLE_NO_WELCOME]:=False;
   objDevice.Open(255);
   Application.ProcessMessages;
   if objDevice.CheckFinger <> 0 then begin
      ResetUser;
      lblStatus.Caption:='Escaneando Digital...';
      lblStatus.Font.Color:=clGreen;
      objExtraction.DefaultTimeout:=1500; 
      objExtraction.Capture();

      if Trim(objExtraction.TextEncodeFIR) <> '' then begin
         LocalizarDigital(objExtraction.TextEncodeFIR);
       end
      else begin
         lblStatus.Caption:='Impressão Malsucedida';
         lblStatus.Font.Color:=clRed;
         ResetUser;
      end;
   end;
end;

procedure TfmLeituraDigital.LocalizarDigital(pDigital: ansistring);
var vAchou : boolean;
begin
   inherited;
   tmrDigital.Enabled:=False;
   try
      if Trim(pDigital) <> '' then begin 
         try
            tabDigital.Close;
            tabDigital.SQL.Clear;
            tabDigital.SQL.Add('SELECT * FROM funcionarios_digital ');
            tabDigital.Open;

            vAchou:=False;

            tabDigital.First;
            while not tabDigital.Eof do begin

               Application.ProcessMessages;

               objMatching.VerifyMatch(tabDigital.FieldByName('Digital1').AsString, pDigital);

               // try #1
               if objMatching.MatchingResult = NBioAPI_TRUE then begin
                  RegistrarUsuario(tabDigital.FieldByName('CodigoFuncionario').AsFloat);
                  vAchou:=True;
                  break;
                end
               else begin
                  // try #2
                  objMatching.VerifyMatch(tabDigital.FieldByName('Digital2').AsString, pDigital);
                  if objMatching.MatchingResult = NBioAPI_TRUE then begin
                     RegistrarUsuario(tabDigital.FieldByName('CodigoFuncionario').AsFloat);
                     vAchou:=True;
                     break;
                   end
                  else begin
                     // try #3
                     objMatching.VerifyMatch(tabDigital.FieldByName('Digital3').AsString, pDigital);
                     if objMatching.MatchingResult = NBioAPI_TRUE then begin
                        RegistrarUsuario(tabDigital.FieldByName('CodigoFuncionario').AsFloat);
                        vAchou:=True;
                        break;
                     end;
                  end;
               end;

               tabDigital.Next;
            end;

            if vAchou = False then begin
               lblStatus.Caption:='Digital NÃO Encontrada!';
               lblStatus.Font.Color:=clRed;
               ResetUser;
            end;

         finally
            tabDigital.Close;
         end;
       end
      else begin
         lblStatus.Caption:='Impressão Malsucedida';
         lblStatus.Font.Color:=clRed;
         ResetUser;
      end;
   finally
      tmrDigital.Enabled:=True;
   end;
end;

procedure TfmLeituraDigital.ResetUser;
begin
   imgFoto.Picture:=nil;
   lblCodigo.Caption:='Código: ';
   lblNome.Caption:='Nome: ';
   tmrDigital.Enabled:=True;
end;

end.

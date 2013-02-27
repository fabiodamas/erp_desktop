unit uFuncionariosDigital;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, Menus, StdCtrls, Buttons, ExtCtrls, Comobj,
  DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

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
  TfmFuncionariosDigital = class(TfmFormBaseAvancado)
    btnIniciarCaptura: TBitBtn;
    pnlDigital: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    btnComparar: TBitBtn;
    Edit4: TEdit;
    btnGravar: TBitBtn;
    btnFechar: TBitBtn;
    shp1: TShape;
    shp2: TShape;
    shp3: TShape;
    tabDigital: TZQuery;
    procedure FormCreate(Sender: TObject);
    procedure btnIniciarCapturaClick(Sender: TObject);
    procedure btnCompararClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FCodigoFuncionario: string;
  public
    { Public declarations }
  end;

var
  fmFuncionariosDigital: TfmFuncionariosDigital;
  objNBioBSP      : variant;
  objDevice       : variant;
  objExtraction   : variant;
  objMatching     : variant;
  objIndexSearch  : variant;

implementation

uses uFormBase, uMenu;

{$R *.dfm}

procedure TfmFuncionariosDigital.FormCreate(Sender: TObject);
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
      ShowMessage('NBioBSPCOM / NBioBSP não registradas');
   end;
end;

procedure TfmFuncionariosDigital.btnIniciarCapturaClick(Sender: TObject);
var vCnt : Integer;
begin
   inherited;
   for vCnt:=1 to 3 do begin
      TEdit(FindComponent('Edit'+IntToStr(vCnt))).Text:='';
      TShape(FindComponent('shp'+IntToStr(vCnt))).Brush.Color:=clWhite;
   end;
   try
      for vCnt:=1 to 3 do begin
         // Faz a captura sem o Pop-Up:
         objExtraction.WindowStyle:=NBioAPI_WINDOW_STYLE_INVISIBLE;
         // Mostra a imagem capturada da digital:
         objExtraction.FingerWnd:=pnlDigital.Handle; 
         objExtraction.WindowOption[NBioAPI_WINDOW_STYLE_NO_FPIMG]:=False;
         objExtraction.WindowOption[NBioAPI_WINDOW_STYLE_NO_TOPMOST]:=False;
         objExtraction.WindowOption[NBioAPI_WINDOW_STYLE_NO_WELCOME]:=False;
         // Abre o sensor:
         objDevice.Open(255);
         // Faz a captura:
         objExtraction.Capture();
         // O campo receberá a string que deve ser salva na Banco de Dados:
         TEdit(FindComponent('Edit'+IntToStr(vCnt))).Text := objExtraction.TextEncodeFIR;
//         finally
            // Fecha o sensor:
            objDevice.Close(255);
         TShape(FindComponent('shp'+IntToStr(vCnt))).Brush.Color:=clGreen;
         Application.ProcessMessages;

//        end;
      end;
   except
      raise Exception.Create('Erro na Captura');
   end;
   btnComparar.Enabled:=True;
   for vCnt:=1 to 3 do begin
      TShape(FindComponent('shp'+IntToStr(vCnt))).Brush.Color:=clYellow;
   end;
   Application.ProcessMessages; 
end;

procedure TfmFuncionariosDigital.btnCompararClick(Sender: TObject);
var //str : string;
    vCnt : Integer;
    vAcertos : Integer;
begin
   Edit4.Text:='';
   {
   // Detecta automaticamente qual o sensor que esta conectado ao pc:
   objDevice.Open(NBioAPI_DEVICE_ID_AUTO_DETECT) ;
   // Verifica se o sensor esta conectado:
   if objDevice.ErrorCode <> NBioAPIERROR_NONE then begin
      str := objDevice.ErrorDescription;
      ShowMessage('Falha ao abrir o dispositivo!');
      Exit;
   end;}
   objDevice.Open(255);
   objExtraction.Capture();
   Edit4.Text:= objExtraction.TextEncodeFIR;
   //Função que faz a verificação da digital. Neste caso esta comparando duas strings (digitais):
   vAcertos:=0;
   for vCnt:=1 to 3 do begin
      objMatching.VerifyMatch(TEdit(FindComponent('Edit'+IntToStr(vCnt))).Text, objExtraction.TextEncodeFIR);
      // Verifica se as digitais são iguais ou não.
      if objMatching.MatchingResult = NBioAPI_TRUE then begin
         vAcertos:=vAcertos + 1;
         //ShowMessage('USUARIO VALIDADO COM SUCESSO !');
       end
      else begin
         //ShowMessage('DIGITAL NÃO É DO USUARIO !');
      end;
   end;
   objDevice.Close(255);
   if vAcertos = 3 then begin 
      ShowMessage('Comparação das 3 Digitais Concluidas com Sucesso!');
      btnGravar.Enabled:=True;
    end
   else begin
      ShowMessage('Falha na Comparação Acertos: '+ IntToStr(vAcertos) +' de 3');
      btnGravar.Enabled:=False; 
   end;
end;

procedure TfmFuncionariosDigital.btnFecharClick(Sender: TObject);
begin
   inherited; 
   Close;
end;

procedure TfmFuncionariosDigital.FormShow(Sender: TObject);
begin
   inherited;
   FCodigoFuncionario:=fmMenu.pubTrans1;
   Caption:='Cadastro de Digital - Funcionário: '+FCodigoFuncionario;
end;

procedure TfmFuncionariosDigital.btnGravarClick(Sender: TObject);
begin
   inherited;
   btnGravar.Enabled:=False;

   tabDigital.Close;
   tabDigital.SQL.Clear;
   tabDigital.SQL.Add('DELETE FROM funcionarios_digital WHERE CodigoFuncionario = '+QuotedStr(FCodigoFuncionario));
   tabDigital.ExecSQL;

   tabDigital.Close;
   tabDigital.SQL.Clear;
   tabDigital.SQL.Add('SELECT * FROM funcionarios_digital WHERE 0');
   tabDigital.Open;

   tabDigital.Append;
   tabDigital.FieldByName('CodigoFuncionario').AsFloat:=StrToFloat(FCodigoFuncionario);
   tabDigital.FieldByName('Digital1').AsString:=Edit1.Text;
   tabDigital.FieldByName('Digital2').AsString:=Edit2.Text;
   tabDigital.FieldByName('Digital3').AsString:=Edit3.Text;
   tabDigital.Post;
   tabDigital.ApplyUpdates;

   ShowMessage('Digital Gravada com Sucesso.');

   Close;
end;

procedure TfmFuncionariosDigital.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabDigital.Close;
   inherited;
end;

end.

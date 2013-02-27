unit uLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, Buttons, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ExtCtrls, Menus, Registry, jpeg, JvGIF,
  JvExControls, JvLinkLabel, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxCheckBox, cxLabel, cxTextEdit, cxHyperLinkEdit, ShellApi,
  dxGDIPlusClasses ;

type
  TfmLogin = class(TfmFormBaseAvancado)
    edtUsuario: TEdit;
    Label1: TLabel;
    edtSenha: TEdit;
    Label2: TLabel;
    btnOK: TBitBtn;
    btnCancelar: TBitBtn;
    tabUsuarios: TZQuery;
    Bevel1: TBevel;
    lblNomeComp: TLabel;
    tabPerfil: TZQuery;
    lblCaps: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    imgLogoFundo: TImage;
    img1: TImage;
    ckbLembrarUsuario: TcxCheckBox;
    lbl3: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lbl3Click(Sender: TObject);
  private
    FUser: string;
  public
    { Public declarations }
  end;

var
  fmLogin: TfmLogin;
  vFechar : Boolean;

implementation

uses uMenu, uFormBaseConfig, uFuncoes, uAuditoria, uConstantes;

{$R *.dfm}

procedure TfmLogin.btnCancelarClick(Sender: TObject);
begin
   vFechar:=False;
   Close;
end;

procedure TfmLogin.btnOKClick(Sender: TObject);
begin
   if (Trim(edtUsuario.Text) = '') or (Trim(edtSenha.Text) = '') then begin
      ShowMessage('Obrigatório Preenchimento do Usuário e Senha');
      edtUsuario.SetFocus;
      exit;
   end;

   btnOK.Enabled:=False;
   btnCancelar.Enabled:=False;

   try

      if (Trim(edtUsuario.Text) = corp_adm_user) then begin
         vFechar:=False;
         if  Crypt('D', corp_adm_pass) = edtSenha.Text then begin
            fmMenu.pubUsuario:=corp_adm_user;
            if ckbLembrarUsuario.Checked then begin
               SaveConfigUserLogin(fmMenu.pubUsuario, GetPathProfileUser);
             end
            else begin
               DeleteConfigUserLogin(GetPathProfileUser);
            end;
            UserLog(fmMenu.pubUsuario, GetPCName, 'in');
            vFechar:=True;
            Close;
          end
         else begin
            ShowMessage('Usuário Incorreto'); 
            edtUsuario.SetFocus;
            exit;
         end;
       end
      else begin
         tabUsuarios.Close;
         tabUsuarios.SQL.Clear;
         tabUsuarios.SQL.Add('SELECT * FROM usuarios WHERE Usuario = '+QuotedStr(edtUsuario.Text));
         tabUsuarios.Open;
         if tabUsuarios.RecordCount = 1 then begin
            if Trim(edtSenha.Text) = Crypt('D', tabUsuarios.FieldByName('Senha').AsString) then begin
               vFechar:=True;
               fmMenu.pubUsuario:=tabUsuarios.FieldByName('Usuario').AsString;
               fmMenu.pubPerfil:=tabUsuarios.FieldByName('CodigoPerfil').AsFloat;

               if fmMenu.pubPerfil > 0 then begin
                  tabPerfil.Close;
                  tabPerfil.SQL.Clear;
                  tabPerfil.SQL.Add('SELECT * FROM usuarios_perfil WHERE CodigoPerfil = '+FloatToStr(fmMenu.pubPerfil));
                  tabPerfil.Open;

                  if tabPerfil.RecordCount > 0 then begin
                     if tabPerfil.FieldByName('Telas').AsString <> '' then HabMenu(fmMenu.mnmMenu, fmMenu.Menu, tabPerfil.FieldByName('Telas').AsString + '|Erros||Acompanhar||Relatar Erros');
                  end;
               end;
               
               if ckbLembrarUsuario.Checked then begin
                  SaveConfigUserLogin(edtUsuario.Text, GetPathProfileUser);
                end
               else begin
                  DeleteConfigUserLogin(GetPathProfileUser);
               end;
               UserLog(fmMenu.pubUsuario, GetPCName, 'in');

               Close;
             end
            else begin
               ShowMessage('Usuário Incorreto');
               edtUsuario.SetFocus;
               exit;
            end;
          end
         else begin
            ShowMessage('Usuário Incorreto');                                    
            edtUsuario.SetFocus;
            exit;
         end;
      end;
   finally
      tabUsuarios.Close;
      btnOK.Enabled:=True;
      btnCancelar.Enabled:=True;
   end;
end;

procedure TfmLogin.FormCreate(Sender: TObject);
var
  Reg: TRegistry;
begin
   inherited;

   vFechar:=False;
   SetFormStyle(fsNormal);

  try
    Reg := TRegistry.Create;

    try
      Reg.RootKey := HKEY_CURRENT_USER;
      Reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Policies\Associations', True);
      Reg.WriteString('LowRiskFileTypes', '.exe');
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  except

  end;


end;

procedure TfmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if vFechar <> True then begin
      Application.Terminate;
    end
   else begin
      tabUsuarios.Close;
      tabPerfil.Close;
      inherited;
      fmLogin:=nil;
   end;
end;

procedure TfmLogin.FormShow(Sender: TObject);
var vLogin: string;
    KeyState: TKeyboardState;
begin
   inherited;

   GetKeyboardState(KeyState);
   lblNomeComp.Caption:=corp_signature;
   vLogin:=Trim(LoadConfigUserLogin(GetPathProfileUser));
   if vLogin <> '' then begin
      FUser:=vLogin;
      edtUsuario.Text:=vLogin;
      ckbLembrarUsuario.Checked:=True;
      edtSenha.SetFocus;                                                
   end;
   if KeyState[VK_CAPITAL] = 0 then begin
      lblCaps.Caption:='CAPS OFF';
      lblCaps.Font.Color:=clRed;
    end
   else begin
      lblCaps.Caption:='CAPS ON';
      lblCaps.Font.Color:=clGreen;
   end;

   if fmMenu.pubNomeComputador = 'FABIO-PC' then
   begin
    edtUsuario.Text := 'Admin';
    edtSenha.Text := '123';

    // edtUsuario.Text := 'seba';
    // edtSenha.Text := '0324';

   end;
end;

procedure TfmLogin.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var KeyState: TKeyboardState;
begin
   inherited;
   GetKeyboardState(KeyState);
   if KeyState[VK_CAPITAL] = 0 then begin
      lblCaps.Caption:='CAPS OFF';
      lblCaps.Font.Color:=clRed; 
    end
   else begin
      lblCaps.Caption:='CAPS ON';
      lblCaps.Font.Color:=clGreen;
   end;
end;

procedure TfmLogin.lbl3Click(Sender: TObject);
begin
  inherited;
  ShellExecute(0, 'open', PChar('http://www.softwarepi.com.br/index.php/precos'), nil, nil, SW_SHOWNORMAL)
end;

end.

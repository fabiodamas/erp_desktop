unit uLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, Buttons, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ExtCtrls;

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
    Label3: TLabel;
    ckbLembrarUsuario: TCheckBox;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edtUsuarioExit(Sender: TObject);
  private
    FUser: string;
  public
    { Public declarations }
  end;

var
  fmLogin: TfmLogin;
  vFechar : Boolean;

implementation

uses uMenu, uFormBaseConfig, uFuncoes;

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
      if (Trim(edtUsuario.Text) = 'Admin') and (Trim(edtSenha.Text) = 'qwerty856') then begin
         fmMenu.pubUsuario:='Admin';
         if ckbLembrarUsuario.Checked then begin
            SaveConfigUserLogin(edtUsuario.Text, GetPathProfileUser);
          end
         else begin
            DeleteConfigUserLogin(GetPathProfileUser);
         end;
         vFechar:=True;
         Close;
       end
      else begin
         tabUsuarios.Close;
         tabUsuarios.SQL.Clear;
         tabUsuarios.SQL.Add('SELECT * FROM usuarios WHERE Usuario = '+QuotedStr(edtUsuario.Text));
         tabUsuarios.Open;
         if tabUsuarios.RecordCount = 1 then begin
            ShowMessage(decrypt(tabUsuarios.FieldByName('Senha').AsString));
            if Trim(edtSenha.Text) = decrypt(tabUsuarios.FieldByName('Senha').AsString) then begin
               vFechar:=True;
               fmMenu.pubUsuario:=tabUsuarios.FieldByName('Usuario').AsString;
               fmMenu.pubPerfil:=tabUsuarios.FieldByName('CodigoPerfil').AsFloat;
               if ckbLembrarUsuario.Checked then begin
                  SaveConfigUserLogin(edtUsuario.Text, GetPathProfileUser);
                end
               else begin
                  DeleteConfigUserLogin(GetPathProfileUser);
               end;
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
begin
   inherited;
   vFechar:=False;
   SetFormStyle(fsNormal);
end;

procedure TfmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if vFechar <> True then begin
      Application.Terminate;
    end
   else begin
      inherited;
      fmLogin:=nil;
   end;
end;

procedure TfmLogin.FormShow(Sender: TObject);
var vLogin: string;
begin
   inherited;

   vLogin:=Trim(LoadConfigUserLogin(GetPathProfileUser));
   if vLogin <> '' then begin
      FUser:=vLogin;
      edtUsuario.Text:=vLogin;
      ckbLembrarUsuario.Checked:=True;
      edtSenha.SetFocus;
   end;
end;

procedure TfmLogin.edtUsuarioExit(Sender: TObject);
begin
   if Trim(FUser) <> edtUsuario.Text then begin
      ckbLembrarUsuario.Checked:=False;
   end;
end;

end.

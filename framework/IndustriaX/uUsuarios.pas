unit uUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, Buttons, Mask, DBCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ExtCtrls,
  uFormBaseCadastro, Menus, ComCtrls;

type
  TfmUsuarios = class(TfmFormBaseCadastro)
    edtUsuario: TDBEdit;
    Label1: TLabel;
    edtSenha: TDBEdit;
    Label2: TLabel;
    edtPerfil: TDBLookupComboBox;
    Label3: TLabel;
    tabPerfil: TZQuery;
    dtsPerfil: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Novo; override;
    procedure Editar; override;
    procedure Deletar; override;
    procedure Cancelar; override;
    function Checagens: Boolean; override;
  end;

var
  fmUsuarios: TfmUsuarios;

implementation

uses uFormBaseConfig, uMenu, uFuncoes, uConstantes;

{$R *.dfm}

procedure TfmUsuarios.Novo;
begin
   tabBase.FieldByName('Senha').AsString:=Crypt('C', edtSenha.Text);
end;

procedure TfmUsuarios.Editar;
begin
   tabBase.FieldByName('Senha').AsString:=Crypt('C', edtSenha.Text);
end;

procedure TfmUsuarios.Deletar;
begin
end;

procedure TfmUsuarios.Cancelar;
begin
end;

function TfmUsuarios.Checagens: Boolean;
begin
   Result:=False;
   if Trim(edtUsuario.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Usuário');
      edtUsuario.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtSenha.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Senha');
      edtSenha.SetFocus;
      Result:=True;
      exit;
   end;
   if LowerCase(edtUsuario.Text) = LowerCase(corp_adm_user) then begin
      ShowMessage('Usuário já Existente');
      edtUsuario.SetFocus;
      Result:=True;
      exit;
   end;
   if tabBase.State = dsInsert then begin
      if ExistsValue('Usuario', 'usuarios', edtUsuario.Text) then begin
         ShowMessage('Usuário já Existente');
         edtUsuario.SetFocus;
         Result:=True;
         exit;
      end;
   end;
end;

procedure TfmUsuarios.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
   if fmMenu.pubUsuario = corp_adm_user then edtPerfil.Enabled:=True else edtPerfil.Enabled:=False;
end;

procedure TfmUsuarios.FormShow(Sender: TObject);
begin
   inherited;
   if (fmMenu.pubUsuario = corp_adm_user) then begin
      tabBase.SQL.Add('SELECT * FROM usuarios');
    end
   else begin
      tabBase.SQL.Add('SELECT * FROM usuarios WHERE Usuario = '+QuotedStr(fmMenu.pubUsuario));
   end;
   tabBase.Open;
   tabPerfil.SQL.Add('SELECT * FROM usuarios_perfil ORDER BY Descricao');
   tabPerfil.Open;
end;

procedure TfmUsuarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabBase.Close;
   tabPerfil.Close;
   inherited;
end;

procedure TfmUsuarios.btnNovoClick(Sender: TObject);
begin
   inherited;
   edtUsuario.SetFocus;
end;

procedure TfmUsuarios.btnEditarClick(Sender: TObject);
begin
   inherited;
   tabBase.FieldByName('Senha').AsString:=Crypt('D', tabBase.FieldByName('Senha').AsString);
end;

end.

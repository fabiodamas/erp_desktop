unit uFormBaseCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseConfig, Buttons, ExtCtrls, Grids, DBGrids,
  uFormBaseAvancado, RXCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ComCtrls, jpeg, Menus;

type
  TfmFormBaseCadastro = class(TfmFormBaseConfig)
    tabBase: TZQuery;
    dtsBase: TDataSource;
    pnlBotoes: TPanel;
    btnNovo: TSpeedButton;
    btnGravar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnAnterior: TSpeedButton;
    btnProximo: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnFechar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnLocalizar: TSpeedButton;
    btnOpcoes: TSpeedButton;
    popOpcoes: TPopupMenu;
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnOpcoesClick(Sender: TObject);
  private
    procedure DefaultBotoes;
  public
    procedure Novo; virtual; abstract;
    procedure Editar; virtual; abstract;
    procedure Deletar; virtual; abstract;
    procedure Cancelar; virtual; abstract;
    function Checagens : Boolean; virtual; abstract;
  end;

var
  fmFormBaseCadastro: TfmFormBaseCadastro;

implementation

uses uFuncoes;

{$R *.dfm}

procedure TfmFormBaseCadastro.btnAnteriorClick(Sender: TObject);
begin
   tabBase.Prior;
end;

procedure TfmFormBaseCadastro.btnProximoClick(Sender: TObject);
begin
   tabBase.Next;
end;

procedure TfmFormBaseCadastro.btnNovoClick(Sender: TObject);
begin
   btnNovo.Enabled:=False;
   
   btnAnterior.Enabled:=False;
   btnProximo.Enabled:=False;
   btnExcluir.Enabled:=False;
   btnEditar.Enabled:=False;
   btnLocalizar.Enabled:=False;
   btnOpcoes.Enabled:=False;
   btnFechar.Enabled:=False;

   btnGravar.Enabled:=True;
   btnCancelar.Enabled:=True;

   try
      tabBase.Append;
   except
      on E: Exception do begin
         DefaultBotoes;
         MessageDlg('Erro: '+E.Message, mtError, [mbOK], 0);
      end;
   end;
end;

procedure TfmFormBaseCadastro.btnGravarClick(Sender: TObject);
begin
   Self.ActiveControl := nil;
   
   if Checagens = True then exit;
   try try
      if tabBase.State in [dsInsert] then begin
         Novo;
       end
      else if tabBase.State in [dsEdit] then begin
         Editar;
      end;
      tabBase.Post;
      tabBase.ApplyUpdates;
   except
      on E: Exception do begin
         tabBase.Cancel;
         Exception.Create('Erro ao Gravar: '+E.Message);
      end;
   end;
   finally
      DefaultBotoes;
   end;
end;

procedure TfmFormBaseCadastro.btnExcluirClick(Sender: TObject);
begin
   if tabBase.RecordCount = 0 then begin
      ShowMessage('Nenhum Registro Cadastrado');  
      exit;
   end;
   if Application.MessageBox('Deseja realmente Excluir o Registro?', PChar(Application.Title), 36) = 7 then exit;
   Deletar;
   tabBase.Delete;
   tabBase.ApplyUpdates; 
end; 

procedure TfmFormBaseCadastro.btnCancelarClick(Sender: TObject);
begin
   try try
      Cancelar;
      tabBase.Cancel;
   except
      on E: Exception do begin
         Exception.Create('Erro ao Cancelar: '+E.Message);
      end;
   end;
   finally
      DefaultBotoes; 
   end;
end;

procedure TfmFormBaseCadastro.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfmFormBaseCadastro.btnEditarClick(Sender: TObject);
begin
   if tabBase.RecordCount = 0 then begin
      ShowMessage('Nenhum Registro Cadastrado');
      exit;
   end;

   btnEditar.Enabled:=False;

   btnAnterior.Enabled:=False;
   btnProximo.Enabled:=False;
   btnNovo.Enabled:=False;
   btnExcluir.Enabled:=False;
   btnLocalizar.Enabled:=False;
   btnFechar.Enabled:=False;

   btnGravar.Enabled:=True;
   btnCancelar.Enabled:=True;

   tabBase.Edit;
end;

procedure TfmFormBaseCadastro.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Application.MessageBox('Esse registro não foi devidamente salvo - Deseja Fechar e Cancelar as Alterações?', PChar(Caption), 36) = 7 then begin
         CanClose := False;
       end
      else begin
         tabBase.Cancel;
      end;
   end;
end;

procedure TfmFormBaseCadastro.btnOpcoesClick(Sender: TObject);
begin
   popOpcoes.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TfmFormBaseCadastro.DefaultBotoes;
begin
   btnAnterior.Enabled:=True;
   btnProximo.Enabled:=True;
   btnNovo.Enabled:=True;
   btnEditar.Enabled:=True;
   btnExcluir.Enabled:=True;
   btnLocalizar.Enabled:=True; 
   btnOpcoes.Enabled:=True;
   btnFechar.Enabled:=True;

   btnGravar.Enabled:=False;
   btnCancelar.Enabled:=False;
end;  

end.

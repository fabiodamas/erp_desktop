unit uChecaConexaoRede;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, IdBaseComponent, IdComponent, IdRawBase,
  IdRawClient, IdIcmpClient, ExtCtrls, StdCtrls, uTipos, Menus;

type
  TfmChecaConexaoRede = class(TfmFormBaseAvancado)
    IdIcmpClient1: TIdIcmpClient;
    tmrPing: TTimer;
    edtLog: TMemo;
    pnlStatus: TPanel;
    procedure tmrPingTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FHostConfig: THostConfig;
    FConectado : Integer;
  public
    { Public declarations }
  end;

var
  fmChecaConexaoRede: TfmChecaConexaoRede; 

implementation

uses uFormBase, uFuncoes;

{$R *.dfm}

procedure TfmChecaConexaoRede.tmrPingTimer(Sender: TObject); 
begin
   try try
      IdIcmpClient1.Host:=FHostConfig.Host;
      IdIcmpClient1.ReceiveTimeout:=500;
      IdIcmpClient1.Ping;
      if IdIcmpClient1.ReplyStatus.BytesReceived > 0 then begin
         FConectado:=FConectado +1;
         edtLog.Lines.Add('Conectado.');
         pnlStatus.Caption:='Conectado.';  
         pnlStatus.Color:=clGreen;
       end
      else begin
         edtLog.Lines.Add('Desconectado. Sem conexão com '+FHostConfig.Host);
         pnlStatus.Caption:='Desconectado. Sem conexão com '+FHostConfig.Host;
         pnlStatus.Color:=clRed;
      end;
   finally
      if FConectado >= 2 then begin
         Close;
      end;
   end;
   except
      edtLog.Lines.Add('Desconectado.');
   end;
end;

procedure TfmChecaConexaoRede.FormCreate(Sender: TObject);
begin
   inherited;
   FHostConfig:=LoadConfigHost(GetPathProfileUser);
   FConectado:=0;
   SetFormStyle(fsNormal);
   edtLog.Lines.Add('Desconectado do Servidor.');
end;

end.

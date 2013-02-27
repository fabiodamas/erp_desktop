unit uEnvioEmailIndividual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, ExtCtrls, Buttons, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP,
  Gauges, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, IdMessage,
  ComCtrls, uTipos;

type
  TfmEnvioEmailIndividual = class(TfmFormBaseAvancado)
    Label2: TLabel;
    edtDe: TEdit;
    edtPara: TComboBox;
    edtAssunto: TEdit;
    Label6: TLabel;
    ckbConfirmacaoEnvio: TCheckBox;
    btnEnviar: TBitBtn;
    btnFechar: TBitBtn;
    btnAnexoAdicionar: TBitBtn;
    btnAnexoRemover: TBitBtn;
    Label4: TLabel;
    edtComCopia: TEdit;
    Label10: TLabel;
    edtComCopiaOculta: TEdit;
    Label11: TLabel;
    lstAnexos: TListBox;
    edtMsg: TMemo;
    OpenDialog1: TOpenDialog;
    IdSMTP1: TIdSMTP;
    gagProgresso: TGauge;
    tabConfig: TZQuery;
    dtsConfig: TDataSource;
    IdMessage1: TIdMessage;
    stbStatusConexao: TStatusBar;
    Label1: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnAnexoAdicionarClick(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure IdSMTP1Connected(Sender: TObject);
    procedure IdSMTP1Disconnected(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure IdSMTP1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
  private
    FSendMail: TSendMail;
  public
    { Public declarations }
  end;

var
  fmEnvioEmailIndividual: TfmEnvioEmailIndividual;

implementation

uses uFormBaseConfig, uMenu;

{$R *.dfm}

procedure TfmEnvioEmailIndividual.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
   FSendMail:=TSendMail.Create;
   FSendMail.Anexo:='';
   FSendMail.Assunto:='';
   //FSendMail.ParaEmail:='';
end;

procedure TfmEnvioEmailIndividual.btnAnexoAdicionarClick(
  Sender: TObject);
var vCnt: integer;
begin
   if OpenDialog1.Execute then begin
      for vCnt:= 0 to OpenDialog1.Files.Count -1 do begin
         if (lstAnexos.Items.IndexOf(OpenDialog1.Files[vCnt]) = -1) then begin
            lstAnexos.Items.Add(OpenDialog1.Files[vCnt]);
         end;
      end;
   end;
end;

procedure TfmEnvioEmailIndividual.btnEnviarClick(Sender: TObject);
var vCnt : Integer;
    vMsg : string;
begin
   try try
      vMsg:='';
      tabConfig.Close;
      tabConfig.SQL.Clear;
      tabConfig.SQL.Add('SELECT * FROM configuracoes_proprietario');
      tabConfig.Open;

      btnEnviar.Enabled:=False;
      btnFechar.Enabled:=False;
      gagProgresso.MaxValue:=1;
      gagProgresso.Progress:=0;

      IdSMTP1.Host:=tabConfig.FieldByName('SmtpHost').AsString;
      IDSMTP1.Username:=tabConfig.FieldByName('SmtpUsername').AsString;
      IdSMTP1.Password:=tabConfig.FieldByName('SmtpPassword').AsString;
      IdSMTP1.Port:=tabConfig.FieldByName('SmtpPorta').AsInteger;

      // Servidor Requer Autenticacao
      // IdSMTP1.AuthenticationType:= atLogin
      // else
      IdSMTP1.AuthenticationType:=atLogin;

      // Utilizar Conexão Segura SSL
      // IdSMTP1.IOHandler := dmConexao.IdSSLIOHandlerSocket1
      //else
      IdSMTP1.IOHandler:=nil;

      IdMessage1.MessageParts.Clear;

      // adicionando anexos do email a ser enviado
      if lstAnexos.Items.Count > 0 then begin
         for vCnt:= 0 to lstAnexos.Items.Count - 1 do begin
            TIdAttachment.Create(IdMessage1.MessageParts, lstAnexos.Items[vCnt]);
         end;
      end;

      // Dados da origem do email
      IdMessage1.From.Address:=edtDe.Text;
      IdMessage1.Subject:=edtAssunto.Text;
      IdMessage1.Body.Text:=edtMsg.Text;

      // Dados do destino do email
      IdMessage1.Recipients.EMailAddresses:=edtPara.Text;
      IdMessage1.BccList.EMailAddresses:=edtComCopiaOculta.Text;
      IdMessage1.CCList.EMailAddresses:=edtComCopia.Text;

      if ckbConfirmacaoEnvio.Checked then IdMessage1.ReceiptRecipient.Text := IDMessage1.From.Text; // Auto Resposta

      if not IdSMTP1.Connected then IdSMTP1.Connect(2000);

      if IdSMTP1.Connected then begin
         IdSMTP1.Send(IdMessage1);
         Application.ProcessMessages;
         gagProgresso.AddProgress(1);
         Application.ProcessMessages;
      end;

      vMsg:='E-mail Enviado com Sucesso!';
   except
      on E:Exception do begin
         vMsg:=E.Message;
      end;
   end;
   finally
      IdSMTP1.Disconnect;
      btnEnviar.Enabled:=True;
      btnFechar.Enabled:=True;
      tabConfig.Close;
      gagProgresso.Progress:=0; 
      ShowMessage(vMsg);
   end; 
end;

procedure TfmEnvioEmailIndividual.IdSMTP1Connected(Sender: TObject);
begin
   stbStatusConexao.Panels[0].Text:='Conectado';
end;

procedure TfmEnvioEmailIndividual.IdSMTP1Disconnected(Sender: TObject);
begin
   stbStatusConexao.Panels[0].Text:='Desconectado';
end;

procedure TfmEnvioEmailIndividual.btnFecharClick(Sender: TObject);
begin
   inherited;
   Close;
end;

procedure TfmEnvioEmailIndividual.FormDestroy(Sender: TObject);
begin
   FSendMail.Free;
   inherited;
end;

procedure TfmEnvioEmailIndividual.IdSMTP1WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
   inherited;
   stbStatusConexao.Panels[0].Text:='Enviando para '+IdMessage1.Recipients.EMailAddresses;
end;

end.

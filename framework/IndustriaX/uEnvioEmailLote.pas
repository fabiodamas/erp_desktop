unit uEnvioEmailLote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, DBCtrls, StdCtrls, Buttons, Gauges, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Menus, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxTextEdit,
  cxHyperLinkEdit, JvComponentBase, JvUrlListGrabber, JvUrlGrabbers;

type
  TfmEnvioEmailLote = class(TfmFormBaseAvancado)
    edtGrupo: TDBLookupComboBox;
    edtTipo: TDBLookupComboBox;
    edtStatus: TDBLookupComboBox;
    grbEnviarPara: TGroupBox;
    ckbClientes: TCheckBox;
    ckbContatos: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtNome: TEdit;
    edtEmailRetorno: TEdit;
    Label5: TLabel;
    edtAssunto: TEdit;
    Label6: TLabel;
    btnAnexoAdicionar: TBitBtn;
    btnAnexoRemover: TBitBtn;
    Label7: TLabel;
    edtMensagem: TMemo;
    Label9: TLabel;
    gagProgresso: TGauge;
    btnEnviar: TBitBtn;
    btnFechar: TBitBtn;
    tabGrupos: TZQuery;
    dtsGrupos: TDataSource;
    tabTipos: TZQuery;
    dtsTipos: TDataSource;
    tabStatus: TZQuery;
    dtsStatus: TDataSource;
    tabClientes: TZQuery;
    tabConfigPropri: TZQuery;
    OpenDialog1: TOpenDialog;
    lstAnexos: TListBox;
    tabContatos: TZQuery;
    dtsClientes: TDataSource;
    dtsContatos: TDataSource;
    tabClientesEmails: TZQuery;
    tabContatosEmails: TZQuery;
    lbl1: TLabel;
    edtEmailTeste: TEdit;
    chkTestes: TCheckBox;
    urlImagem: TcxHyperLinkEdit;
    lbl2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure btnAnexoAdicionarClick(Sender: TObject);
    procedure btnAnexoRemoverClick(Sender: TObject);
    procedure dtsClientesDataChange(Sender: TObject; Field: TField);
    procedure dtsContatosDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmEnvioEmailLote: TfmEnvioEmailLote;

implementation

uses uFormBaseConfig, uMenu, uFuncoes;

{$R *.dfm}

procedure TfmEnvioEmailLote.FormCreate(Sender: TObject);
begin
  inherited;
  SetFormStyle(fsMDIChild);
end;

procedure TfmEnvioEmailLote.FormShow(Sender: TObject);
begin
  inherited;

  tabGrupos.SQL.Add('SELECT * FROM genericos WHERE Tipo = ' + QuotedStr('11') + ' ORDER BY Descricao');
  tabGrupos.Open;

  tabTipos.SQL.Add('SELECT * FROM genericos WHERE Tipo = ' + QuotedStr('12') + ' ORDER BY Descricao');
  tabTipos.Open;

  tabStatus.SQL.Add('SELECT * FROM genericos WHERE Tipo = ' + QuotedStr('13') + ' ORDER BY Descricao');
  tabStatus.Open;

  tabClientesEmails.Params.CreateParam(ftFloat, 'CodigoCliente', ptUnknown);
  tabClientesEmails.SQL.Add('SELECT * FROM clientes_emails WHERE CodigoCliente = :CodigoCliente');
  tabClientesEmails.Open;

  tabContatosEmails.Params.CreateParam(ftFloat, 'CodigoContato', ptUnknown);
  tabContatosEmails.SQL.Add('SELECT * FROM contatos_emails WHERE CodigoContato = :CodigoContato');
  tabContatosEmails.Open;
end;

procedure TfmEnvioEmailLote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tabGrupos.Close;
  tabTipos.Close;
  tabStatus.Close;
  tabClientes.Close;
  tabContatos.Close;
  tabConfigPropri.Close;
  tabClientesEmails.Close;
  tabContatosEmails.Close;
  inherited;
end;

procedure TfmEnvioEmailLote.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfmEnvioEmailLote.btnEnviarClick(Sender: TObject);
var
  vSQL: string;
  vErros: string;
  vAnexo1, vAnexo2, vAnexo3: string;
  vCnt: Integer;
  vImagem: string;
begin
  if (not chkTestes.Checked) and (not ckbClientes.Checked) and (not ckbContatos.Checked) then
  begin
    ShowMessage('Obrigatório Marcar o Envio para Clientes / Contatos / Teste');
    Exit;
  end;

  if Trim(edtNome.Text) = '' then
  begin
    ShowMessage('Obrigatório Preenchimento do Nome');
    edtNome.SetFocus;
    exit;
  end;

  if Trim(edtEmailRetorno.Text) = '' then
  begin
    ShowMessage('Obrigatório Preenchimento do Email Retorno');
    edtEmailRetorno.SetFocus;
    exit;
  end;

  if Trim(edtAssunto.Text) = '' then
  begin
    ShowMessage('Obrigatório Preenchimento do Assunto');
    edtAssunto.SetFocus;
    exit;
  end;

  if chkTestes.checked then
  begin
    if Trim(edtEmailTeste.Text) = '' then
    begin
      ShowMessage('Obrigatório do Email de Teste');
      edtEmailTeste.SetFocus;
      exit;
    end;
  end;

  vSQL := '';
  vAnexo1 := '';
  vAnexo2 := '';
  vAnexo3 := '';

  for vCnt := 0 to lstAnexos.Items.Count - 1 do
  begin
    if vCnt + 1 > 3 then
    begin
      ShowMessage('Permitido Apenas 3 ou Menos Anexos');
      exit;
    end;
    if vCnt = 0 then
      vAnexo1 := lstAnexos.Items.Strings[vCnt];
    if vCnt = 1 then
      vAnexo2 := lstAnexos.Items.Strings[vCnt];
    if vCnt = 2 then
      vAnexo3 := lstAnexos.Items.Strings[vCnt];
  end;

  tabConfigPropri.Close;
  tabConfigPropri.SQL.Clear;
  tabConfigPropri.SQL.Add('SELECT * FROM configuracoes_proprietario');
  tabConfigPropri.Open;

  if urlImagem.Text <> '' then
  begin
    vImagem := '';
    vImagem := vImagem + '<html>' ;
    vImagem := vImagem + '<head>' ;
    vImagem := vImagem + '<meta http-equiv=''Content-Type'' content=''text/html; charset=utf-8'' />' ;
    vImagem := vImagem + '<title>Nacional Ossos</title>' ;
    vImagem := vImagem + '</head>' ;

    vImagem := vImagem + '<body>' ;
    vImagem := vImagem + '<img style=''display:block;margin-left:auto;margin-right:auto''  src=''' +  urlImagem.Text + ''' />' ;
    vImagem := vImagem + '</body>' ;
    vImagem := vImagem + '</html>' ;
  end
  else
  begin
    vImagem := '';
  end;

  if chkTestes.checked then
  begin
    gagProgresso.MaxValue := 2;

    gagProgresso.Progress := 1;
    Application.ProcessMessages;

    vErros := EnviarEmailImagem(tabConfigPropri.FieldByName('SmtpHost').AsString,
      tabConfigPropri.FieldByName('SmtpUsername').AsString,
      tabConfigPropri.FieldByName('SmtpPassword').AsString,
      edtNome.Text,
      edtEmailRetorno.Text,
      edtEmailTeste.Text,
      edtAssunto.Text,
      edtMensagem.Text,
      vAnexo1,
      vAnexo2,
      vAnexo3,
      tabConfigPropri.FieldByName('SmtpPorta').AsInteger,
      True,
      vImagem
      );

    gagProgresso.Progress := 2;

    if Trim(vErros) <> '' then
    begin
      ShowMessage(vErros);
    end
    else
    begin
      ShowMessage('Envio Concluído com Sucesso.');
    end;

    gagProgresso.Progress := 0;

    Exit;
  end;

  if Trim(edtGrupo.Text) <> '' then
  begin
    if Trim(vSQL) <> '' then
      vSQL := vSQL + ' AND ';
    vSQL := vSQL + 'CodigoGrupo = ' + QuotedStr(string(edtGrupo.KeyValue));
  end;

  if Trim(edtTipo.Text) <> '' then
  begin
    if Trim(vSQL) <> '' then
      vSQL := vSQL + ' AND ';
    vSQL := vSQL + 'CodigoTipo = ' + QuotedStr(string(edtTipo.KeyValue));
  end;

  if Trim(edtStatus.Text) <> '' then
  begin
    if Trim(vSQL) <> '' then
      vSQL := vSQL + ' AND ';
    vSQL := vSQL + 'CodigoStatus = ' + QuotedStr(string(edtStatus.KeyValue));
  end;

  if ckbClientes.Checked then
  begin
    tabClientes.Close;
    tabClientes.SQL.Clear;
    if Trim(vSQL) <> '' then
    begin
      tabClientes.SQL.Add('SELECT * FROM clientes');
      tabClientes.SQL.Add('WHERE');
      tabClientes.SQL.Add(vSQL);
      tabClientes.SQL.Add('ORDER BY CodigoCliente');
    end
    else
    begin
      tabClientes.SQL.Add('SELECT * FROM clientes');
      tabClientes.SQL.Add('ORDER BY CodigoCliente');
    end;
    tabClientes.Open;

    gagProgresso.MaxValue := tabClientes.RecordCount;

    tabClientes.First;
    while not tabClientes.Eof do
    begin

      gagProgresso.Progress := tabClientes.RecNo;
      Application.ProcessMessages;

      if tabClientesEmails.RecordCount > 0 then
      begin
        tabClientesEmails.First;
        while not tabClientesEmails.Eof do
        begin

          vErros := vErros + EnviarEmailImagem(tabConfigPropri.FieldByName('SmtpHost').AsString,
            tabConfigPropri.FieldByName('SmtpUsername').AsString,
            tabConfigPropri.FieldByName('SmtpPassword').AsString,
            edtNome.Text,
            edtEmailRetorno.Text,
            tabClientesEmails.FieldByName('Email').AsString,
            edtAssunto.Text,
            edtMensagem.Text,
            vAnexo1,
            vAnexo2,
            vAnexo3,
            tabConfigPropri.FieldByName('SmtpPorta').AsInteger,
            True,
            vImagem
            );
          tabClientesEmails.Next;
        end;
      end;

      tabClientes.Next;
    end;
  end;

  if ckbContatos.Checked then
  begin
    tabContatos.Close;
    tabContatos.SQL.Clear;

    if Trim(vSQL) <> '' then
    begin
      tabContatos.SQL.Add('SELECT * FROM contatos');
      tabContatos.SQL.Add('WHERE');
      tabContatos.SQL.Add(vSQL);
      tabContatos.SQL.Add('ORDER BY CodigoContato');
    end
    else
    begin
      tabContatos.SQL.Add('SELECT * FROM contatos');
      tabContatos.SQL.Add('ORDER BY CodigoContato');
    end;
    tabContatos.Open;

    gagProgresso.MaxValue := tabContatos.RecordCount;

    tabContatos.First;
    while not tabContatos.Eof do
    begin

      gagProgresso.Progress := tabContatos.RecNo;
      Application.ProcessMessages;

      if tabContatosEmails.RecordCount > 0 then
      begin
        tabContatosEmails.First;
        while not tabContatosEmails.Eof do
        begin

          vErros := vErros + EnviarEmailImagem(tabConfigPropri.FieldByName('SmtpHost').AsString,
            tabConfigPropri.FieldByName('SmtpUsername').AsString,
            tabConfigPropri.FieldByName('SmtpPassword').AsString,
            edtNome.Text,
            edtEmailRetorno.Text,
            tabContatosEmails.FieldByName('Email').AsString,
            edtAssunto.Text,
            edtMensagem.Text,
            vAnexo1,
            vAnexo2,
            vAnexo3,
            tabConfigPropri.FieldByName('SmtpPorta').AsInteger,
            True,
            vImagem);

          tabContatosEmails.Next;
        end;
      end;

      tabContatos.Next;
    end;
  end;

  gagProgresso.Progress := 0;

  if Trim(vErros) <> '' then
  begin
    ShowMessage(vErros);
  end
  else
  begin
    ShowMessage('Envio Concluído com Sucesso.');
  end;
end;

procedure TfmEnvioEmailLote.btnAnexoAdicionarClick(Sender: TObject);
var
  vCnt: Integer;
begin
  inherited;
  if OpenDialog1.Execute then
  begin
    if OpenDialog1.FileName <> '' then
    begin
      for vCnt := 0 to OpenDialog1.Files.Count - 1 do
      begin
        lstAnexos.Items.Add(OpenDialog1.Files.Strings[vCnt]);
      end;
    end;
  end;
end;

procedure TfmEnvioEmailLote.btnAnexoRemoverClick(Sender: TObject);
begin
  inherited;
  if lstAnexos.ItemIndex >= 0 then
  begin
    lstAnexos.Items.Delete(lstAnexos.ItemIndex);
  end;
end;

procedure TfmEnvioEmailLote.dtsClientesDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  tabClientesEmails.Close;
  tabClientesEmails.ParamByName('CodigoCliente').AsFloat := tabClientes.FieldByName('CodigoCliente').AsFloat;
  tabClientesEmails.Open;
end;

procedure TfmEnvioEmailLote.dtsContatosDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  tabContatosEmails.Close;
  tabContatosEmails.ParamByName('CodigoContato').AsFloat := tabContatos.FieldByName('CodigoContato').AsFloat;
  tabContatosEmails.Open;
end;

end.


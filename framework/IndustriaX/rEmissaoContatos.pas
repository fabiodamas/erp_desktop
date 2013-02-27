unit rEmissaoContatos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls, QRMBCtrls, qrpctrls, qrpBaseCtrls;

type
  TrtEmissaoContatos = class(TfmFormBaseRelatorio)
    tabBase: TZQuery;
    pndDialogo: TPrintDialog;
    qrpContatos: TQRPQuickrep;
    QRSubDetail1: TQRSubDetail;
    QRBand1: TQRPBand;
    QRBand2: TQRPBand;
    QRBand3: TQRPBand;
    qrlSignature: TQRLabel;
    qrdCodigoContato: TQRDBText;
    QRShape1: TQRShape;
    qrlTitulo: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape2: TQRShape;
    QRSysData2: TQRSysData;
    QRDBText7: TQRDBText;
    rdgOrdemEmissao: TRadioGroup;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    Label1: TLabel;
    edtGrupo: TDBLookupComboBox;
    Label2: TLabel;
    edtTipo: TDBLookupComboBox;
    edtEstado: TComboBox;
    Label3: TLabel;
    edtCidade: TDBLookupComboBox;
    Label4: TLabel;
    edtPais: TDBLookupComboBox;
    Label5: TLabel;
    edtBairro: TEdit;
    Label6: TLabel;
    edtComplemento: TEdit;
    Label7: TLabel;
    edtSetor: TEdit;
    Label8: TLabel;
    rdgCamposRelatorio: TRadioGroup;
    tabGrupos: TZQuery;
    dtsGrupos: TDataSource;
    tabTipos: TZQuery;
    dtsTipos: TDataSource;
    tabPais: TZQuery;
    dtsPais: TDataSource;
    tabCidades: TZQuery;
    dtsCidades: TDataSource;
    qrlEndereco: TQRLabel;
    qrdEndereco: TQRDBText;
    qrlUF: TQRLabel;
    qrlBairro: TQRLabel;
    qrlSetor: TQRLabel;
    qrdUF: TQRDBText;
    qrdBairro: TQRDBText;
    qrdSetor: TQRDBText;
    qrdPais: TQRDBText;
    qrlPais: TQRLabel;
    qrlEmail: TQRLabel;
    qrlSite: TQRLabel;
    qrdSite: TQRDBText;
    qrlTotal: TQRLabel;
    mmo1: TMemo;
    qrlEmailRelacao: TQRPMemo;
    tabEmailRelacao: TZQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCidadeEnter(Sender: TObject);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrpContatosBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    procedure GerarImpressao(Impressora: Boolean = False);
  public
  end;

var
  vTotalCon: real;

implementation

uses uFormBase, uMenu, uFuncoes;

{$R *.dfm}

procedure TrtEmissaoContatos.FormCreate(Sender: TObject);
begin
  inherited;
  SetFormStyle(fsMDIChild);
end;

procedure TrtEmissaoContatos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tabBase.Close;
  tabGrupos.Close;
  tabTipos.Close;
  tabPais.Close;
  tabCidades.Close;
  inherited;
end;

procedure TrtEmissaoContatos.btnVisualizarClick(Sender: TObject);
begin
  inherited;
  GerarImpressao();
end;

procedure TrtEmissaoContatos.GerarImpressao(Impressora: Boolean = False);
var
  vWhere: string;
begin
  case rdgCamposRelatorio.ItemIndex of
    0:
      begin
        qrlPais.Enabled := False;
        qrdPais.Enabled := False;
        qrlEmail.Enabled := False;
        qrlEmailRelacao.Enabled := False;
        qrlSite.Enabled := False;
        qrdSite.Enabled := False;

        qrlEndereco.Enabled := True;
        qrdEndereco.Enabled := True;
        qrlUF.Enabled := True;
        qrdUF.Enabled := True;
        qrlBairro.Enabled := True;
        qrdBairro.Enabled := True;
        qrlSetor.Enabled := True;
        qrdSetor.Enabled := True;
      end;
    1:
      begin
        qrlEndereco.Enabled := False;
        qrdEndereco.Enabled := False;
        qrlUF.Enabled := False;
        qrdUF.Enabled := False;
        qrlBairro.Enabled := False;
        qrdBairro.Enabled := False;
        qrlSetor.Enabled := False;
        qrdSetor.Enabled := False;

        qrlPais.Enabled := True;
        qrdPais.Enabled := True;
        qrlEmail.Enabled := True;
        qrlEmailRelacao.Enabled := True;
        qrlSite.Enabled := True;
        qrdSite.Enabled := True;
      end;
  end;

  vWhere := '';

  qrlTitulo.Caption := 'Contatos';

  tabBase.Close;
  tabBase.SQL.Clear;
  tabBase.SQL.Add('SELECT contatos.CodigoContato, contatos.NomeFantasia, contatos.Telefone1,');
  tabBase.SQL.Add('contatos.Cep, contatos.Estado, contatos.Bairro, contatos.Endereco,');
  tabBase.SQL.Add('contatos.Site,');
  tabBase.SQL.Add('cidades.Cidade, setor.Setor, paises.Pais');
  tabBase.SQL.Add('FROM contatos');
  tabBase.SQL.Add('LEFT JOIN cidades ON contatos.CodigoCidade = cidades.CodigoCidade');
  tabBase.SQL.Add('LEFT JOIN setor ON contatos.SetorNormal = setor.Codigo');
  tabBase.SQL.Add('LEFT JOIN paises ON contatos.CodigoPais = paises.CodigoPais');

  if Trim(edtGrupo.Text) <> '' then
  begin
    qrlTitulo.Caption := qrlTitulo.Caption + ' - Grupo: ' + edtGrupo.Text;
    if Trim(vWhere) <> '' then
      vWhere := vWhere + ' AND ';
    vWhere := vWhere + 'contatos.CodigoGrupo = ' + FloatToStr(edtGrupo.KeyValue);
  end;
  if Trim(edtTipo.Text) <> '' then
  begin
    qrlTitulo.Caption := qrlTitulo.Caption + ' - Tipo: ' + edtTipo.Text;
    if Trim(vWhere) <> '' then
      vWhere := vWhere + ' AND ';
    vWhere := vWhere + 'contatos.CodigoTipo = ' + FloatToStr(edtTipo.KeyValue);
  end;
  if Trim(edtEstado.Text) <> '' then
  begin
    qrlTitulo.Caption := qrlTitulo.Caption + ' - UF: ' + edtEstado.Text;
    if Trim(vWhere) <> '' then
      vWhere := vWhere + ' AND ';
    vWhere := vWhere + 'contatos.Estado = ' + QuotedStr(edtEstado.Text);
  end;
  if Trim(edtCidade.Text) <> '' then
  begin
    qrlTitulo.Caption := qrlTitulo.Caption + ' - Cidade: ' + edtCidade.Text;
    if Trim(vWhere) <> '' then
      vWhere := vWhere + ' AND ';
    vWhere := vWhere + 'contatos.CodigoCidade = ' + QuotedStr(string(edtCidade.KeyValue));
  end;

  if Trim(edtPais.Text) <> '' then
  begin
    qrlTitulo.Caption := qrlTitulo.Caption + ' - País: ' + edtPais.Text;
    if Trim(vWhere) <> '' then
      vWhere := vWhere + ' AND ';
    vWhere := vWhere + 'contatos.CodigoPais = ' + QuotedStr(string(edtPais.KeyValue));
  end;

  if Trim(edtSetor.Text) <> '' then
  begin
    qrlTitulo.Caption := qrlTitulo.Caption + ' - Setor: ' + edtSetor.Text;
    if Trim(vWhere) <> '' then
      vWhere := vWhere + ' AND ';
    vWhere := vWhere + 'setor.Setor = ' + QuotedStr(edtSetor.Text);
  end;
  if Trim(edtBairro.Text) <> '' then
  begin
    qrlTitulo.Caption := qrlTitulo.Caption + ' - Bairro: ' + edtBairro.Text;
    if Trim(vWhere) <> '' then
      vWhere := vWhere + ' AND ';
    vWhere := vWhere + 'Upper(contatos.Bairro) LIKE ' + QuotedStr(UpperCase(edtBairro.Text) + '%');
  end;
  if Trim(edtComplemento.Text) <> '' then
  begin
    qrlTitulo.Caption := qrlTitulo.Caption + ' - Complemento: ' + edtComplemento.Text;
    if Trim(vWhere) <> '' then
      vWhere := vWhere + ' AND ';
    vWhere := vWhere + 'Upper(contatos.Complemento) LIKE ' + QuotedStr(UpperCase(edtBairro.Text) + '%');
  end;

  if Trim(vWhere) <> '' then
  begin
    tabBase.SQL.Add('WHERE');
    tabBase.SQL.Add(vWhere);
  end;

  tabBase.SQL.Add('ORDER BY');
  case rdgOrdemEmissao.ItemIndex of
    0: tabBase.SQL.Add('contatos.CodigoContato');
    1: tabBase.SQL.Add('contatos.NomeFantasia');
    2: tabBase.SQL.Add('contatos.CodigoGrupo');
    3: tabBase.SQL.Add('contatos.CodigoTipo');
    4: tabBase.SQL.Add('cidades.Cidade');
    5: tabBase.SQL.Add('contatos.Estado');
  end;

  mmo1.Lines.Text := tabBase.SQL.Text;

  tabBase.Open;

  vTotalCon := 0;

  if Impressora = True then
  begin
    if pndDialogo.Execute then
    begin
      qrpContatos.PrinterSettings.PrinterIndex := Printer.PrinterIndex;
      qrpContatos.Print;
    end;
  end
  else
  begin
    qrpContatos.PreviewModal;
  end;
end;

procedure TrtEmissaoContatos.btnImprimirClick(Sender: TObject);
begin
  inherited;
  GerarImpressao(True);
end;

procedure TrtEmissaoContatos.FormShow(Sender: TObject);
begin
  inherited;

  tabGrupos.SQL.Add('SELECT * FROM genericos WHERE Tipo = ' + QuotedStr('11') + ' ORDER BY Descricao');
  tabGrupos.Open;

  tabTipos.SQL.Add('SELECT * FROM genericos WHERE Tipo = ' + QuotedStr('12') + ' ORDER BY Descricao');
  tabTipos.Open;

  tabPais.SQL.Add('SELECT * FROM paises ORDER BY Pais');
  tabPais.Open;

  tabCidades.SQL.Add('SELECT * FROM cidades WHERE 0');
  tabCidades.Open;
end;

procedure TrtEmissaoContatos.edtCidadeEnter(Sender: TObject);
begin
  inherited;
  if Trim(edtEstado.Text) = '' then
  begin
    ShowMessage('Obrigatório Preenchimento do Estado');
    edtEstado.SetFocus;
    exit;
  end;
  tabCidades.Close;
  tabCidades.SQL.Clear;
  tabCidades.SQL.Add('SELECT * FROM cidades WHERE UF = ' + QuotedStr(edtEstado.Text) + 'ORDER BY Cidade');
  tabCidades.Open;
end;

procedure TrtEmissaoContatos.QRSubDetail1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  vTotalCon := vTotalCon + 1;
  qrlTotal.Caption := 'Total de Contatos: ' + FloatToStr(vTotalCon);
end;

procedure TrtEmissaoContatos.qrpContatosBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  vTotalCon := 0;

end;

procedure TrtEmissaoContatos.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  vTabEmailRelacao: TZQuery;
begin
  inherited;
  vTotalCon := 0;

  if rdgCamposRelatorio.ItemIndex = 1 then
  begin
    if tabBase.FieldByName('CodigoContato').AsString <> '' then
    begin
      tabEmailRelacao.Close;
      tabEmailRelacao.SQL.Clear;
      tabEmailRelacao.SQL.Add('select * from contatos_emails where contatos_emails.CodigoContato = ' + tabBase.FieldByName('CodigoContato').AsString);
      tabEmailRelacao.Open;

      qrlEmailRelacao.Lines.Text := '';

      if tabEmailRelacao.RecordCount <> 0 then
      begin
        tabEmailRelacao.First;

        while not tabEmailRelacao.Eof do
        begin
          qrlEmailRelacao.Lines.Text := qrlEmailRelacao.Lines.Text + tabEmailRelacao.FieldByName('email').AsString + ';';
          tabEmailRelacao.Next;
        end;

        qrlEmailRelacao.Lines.Text := Copy(qrlEmailRelacao.Lines.Text, 1, Length(qrlEmailRelacao.Lines.Text) - 3);
      end;

    end;
  end;

end;

end.


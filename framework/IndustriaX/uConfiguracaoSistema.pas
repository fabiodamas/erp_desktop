unit uConfiguracaoSistema;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, ComCtrls, StdCtrls, Mask, DBCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Buttons, ExtCtrls, jpeg,
  Menus, ACBrNFe;

type
  TfmConfiguracaoSistema = class(TfmFormBaseAvancado)
    pgcConfiguracoesSistema: TPageControl;
    tbsEmail: TTabSheet;
    grbSMTP: TGroupBox;
    edtSMTPHost: TDBEdit;
    Label1: TLabel;
    edtSMTPUserName: TDBEdit;
    Label2: TLabel;
    edtSMTPPassWord: TDBEdit;
    Label3: TLabel;
    edtSMTPPorta: TDBEdit;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    edtNFeEmailRetornoXML: TDBEdit;
    edtNFeEmailRetornoDANFE: TDBEdit;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    edtOrcEmailRetorno: TDBEdit;
    tbsProprietario: TTabSheet;
    Label8: TLabel;
    edtNomeFantasia: TDBEdit;
    Label9: TLabel;
    edtRazaoSocial: TDBEdit;
    edtEndereco: TDBEdit;
    Label10: TLabel;
    edtNumero: TDBEdit;
    Label11: TLabel;
    edtCep: TDBEdit;
    Label12: TLabel;
    tabConfig: TZQuery;
    dtsConfig: TDataSource;
    btnGravar: TBitBtn;
    tbsOrcamento: TTabSheet;
    edtTextoOrcamento: TDBEdit;
    Label13: TLabel;
    tbsSistema: TTabSheet;
    edtChaveAcesso: TDBEdit;
    Label14: TLabel;
    btnCancelar: TBitBtn;
    edtEstado: TDBComboBox;
    Label28: TLabel;
    edtCidade: TDBLookupComboBox;
    Label34: TLabel;
    tabCidades: TZQuery;
    dtsCidades: TDataSource;
    edtBairro: TDBEdit;
    Label15: TLabel;
    edtTelefone: TDBEdit;
    Label16: TLabel;
    edtFax: TDBEdit;
    Label17: TLabel;
    edtSite: TDBEdit;
    Label18: TLabel;
    edtEmail: TDBEdit;
    Label19: TLabel;
    tbsLogotipos: TTabSheet;
    imgLogoRelatorios: TImage;
    Label20: TLabel;
    Label21: TLabel;
    OpenDialog1: TOpenDialog;
    edtCnpj: TDBEdit;
    Label22: TLabel;
    edtIE: TDBEdit;
    Label23: TLabel;
    tbsNFe: TTabSheet;
    edtPais: TDBLookupComboBox;
    Label27: TLabel;
    tabPais: TZQuery;
    dtsPais: TDataSource;
    TabSheet1: TTabSheet;
    edtNumeroProducao: TDBEdit;
    Label29: TLabel;
    edtMarca: TDBEdit;
    Label30: TLabel;
    edtEspecie: TDBEdit;
    Label31: TLabel;
    edtFormasPagto: TDBEdit;
    Label32: TLabel;
    edtGarantia1: TDBEdit;
    Label33: TLabel;
    edtGarantia2: TDBEdit;
    Label35: TLabel;
    edtDocumentoReceber: TDBEdit;
    Label37: TLabel;
    edtDocumentoPagar: TDBEdit;
    Label38: TLabel;
    edtGrupoMateriaPrima: TDBLookupComboBox;
    Label39: TLabel;
    tabGrupos: TZQuery;
    dtsGrupos: TDataSource;
    edtLocalizacaoBB: TDBEdit;
    Label40: TLabel;
    dbcPreenchimentoObrigatorioEndereco: TDBCheckBox;
    btnLocalizaCep: TBitBtn;
    PageControl1: TPageControl;
    tbsNFeCertificado: TTabSheet;
    tbsNFeWebService: TTabSheet;
    tbsNFeGeral: TTabSheet;
    edtAliqAprov: TDBEdit;
    Label36: TLabel;
    dbrCrt: TDBRadioGroup;
    edtNFeObs3: TDBEdit;
    Label26: TLabel;
    edtNFeObs2: TDBEdit;
    Label25: TLabel;
    edtNFeObs1: TDBEdit;
    Label24: TLabel;
    grbCertificados: TGroupBox;
    Label41: TLabel;
    Label42: TLabel;
    btnCaminhoCert: TSpeedButton;
    Label43: TLabel;
    btnGetCert: TSpeedButton;
    dbrFormatoDanfe: TDBRadioGroup;
    dbrFormaEmissao: TDBRadioGroup;
    edtNFeCertCaminho: TDBEdit;
    edtNFeCertSenha: TDBEdit;
    edtNFeCertNumSerie: TDBEdit;
    edtNFeWSUF: TDBComboBox;
    Label44: TLabel;
    dbrNFeTipoAmbiente: TDBRadioGroup;
    ACBrNFe1: TACBrNFe;
    TabSheet2: TTabSheet;
    edtTransportadorasCorreios: TDBLookupComboBox;
    Label45: TLabel;
    tabTransportadoras: TZQuery;
    dtsTransportadoras: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCidadeEnter(Sender: TObject);
    procedure imgLogoRelatoriosClick(Sender: TObject);
    procedure edtCepExit(Sender: TObject);
    procedure btnLocalizaCepClick(Sender: TObject);
    procedure btnCaminhoCertClick(Sender: TObject);
    procedure btnGetCertClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmConfiguracaoSistema: TfmConfiguracaoSistema;

implementation

uses uFormBase, uMenu, uFuncoes, uEnderecos;

{$R *.dfm}

procedure TfmConfiguracaoSistema.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TfmConfiguracaoSistema.FormShow(Sender: TObject);
begin
   inherited;

   pgcConfiguracoesSistema.ActivePageIndex:=0;

   edtNFeWSUF.Items:=GetUFs;

   tabConfig.SQL.Add('SELECT * FROM configuracoes_proprietario');
   tabConfig.Open;
   if tabConfig.RecordCount > 0 then begin
      tabConfig.Edit;
    end
   else begin
      tabConfig.Append;
   end;

   if not tabConfig.FieldByName('LogoPequeno').IsNull then
   begin
    if not LoadImageFromBD(tabConfig.FieldByName('LogoPequeno'), imgLogoRelatorios) then imgLogoRelatorios.Picture:=nil;
   end;

   tabCidades.SQL.Add('SELECT * FROM cidades ORDER BY Cidade');
   tabCidades.Open;

   tabPais.SQL.Add('SELECT * FROM paises ORDER BY Pais');
   tabPais.Open;

   tabGrupos.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('1')+' ORDER BY Descricao');
   tabGrupos.Open;

   tabTransportadoras.SQL.Add('SELECT Codigo,Nome FROM transportadoras ORDER BY Nome');
   tabTransportadoras.Open;
end;

procedure TfmConfiguracaoSistema.btnGravarClick(Sender: TObject);
var vImg : TJPEGImage;
begin
   if Trim(edtNomeFantasia.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Nome Fantasia');
      pgcConfiguracoesSistema.ActivePage:=tbsProprietario;
      edtNomeFantasia.SetFocus;
      exit;
   end;
   if Trim(edtRazaoSocial.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Razão Social');
      pgcConfiguracoesSistema.ActivePage:=tbsProprietario;
      edtRazaoSocial.SetFocus;
      exit;
   end;
   if Trim(edtChaveAcesso.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Chave de Acesso');
      pgcConfiguracoesSistema.ActivePage:=tbsSistema;
      edtChaveAcesso.SetFocus;
      exit;
   end;
   if imgLogoRelatorios.Picture.Graphic <> NIL then begin
      vImg:=TJPEGImage.Create;
      try try
         vImg.Assign(imgLogoRelatorios.Picture.Graphic);
         tabConfig.FieldByName('LogoPequeno').Assign(vImg);
      except
         Exception.Create('Falha ao Carregar Logo Relatórios');
      end;
      finally
         vImg.Free;
      end;
   end;
   tabConfig.Post;
   tabConfig.ApplyUpdates;
   Close;
end;

procedure TfmConfiguracaoSistema.btnCancelarClick(Sender: TObject);
begin
   inherited;
   tabConfig.Cancel;
   Close;
end;

procedure TfmConfiguracaoSistema.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabCidades.Close;
   if tabConfig.State in [dsInsert, dsEdit] then tabConfig.Cancel;
   tabConfig.Close;
   tabPais.Close;
   tabGrupos.Close;
   tabTransportadoras.Close;
   inherited;
end;

procedure TfmConfiguracaoSistema.edtCidadeEnter(Sender: TObject);
begin
   inherited;
   if Trim(edtEstado.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Estado');
      edtEstado.SetFocus;
      exit;
   end;
   tabCidades.Close;
   tabCidades.SQL.Clear;
   tabCidades.SQL.Add('SELECT * FROM cidades WHERE UF = '+QuotedStr(edtEstado.Text)+' ORDER BY Cidade');
   tabCidades.Open;
end;

procedure TfmConfiguracaoSistema.imgLogoRelatoriosClick(Sender: TObject);
var vCnt: integer;
begin
   OpenDialog1.Title:='Selecione uma Imagem';
   OpenDialog1.DefaultExt:='*.jpg';
   OpenDialog1.Filter:='Arquivos JPG (*.jpg)|*.jpg|Todos os Arquivos (*.*)|*.*';
   OpenDialog1.InitialDir:=ExtractFileDir(Application.ExeName);
   if OpenDialog1.Execute then begin
      for vCnt:= 0 to OpenDialog1.Files.Count -1 do begin
         imgLogoRelatorios.Picture.LoadFromFile(OpenDialog1.Files[vCnt]);
      end;
   end; 
end;

procedure TfmConfiguracaoSistema.edtCepExit(Sender: TObject);
begin
   inherited;
   if tabConfig.State in [dsInsert, dsEdit] then begin
      if Trim(edtCep.Text) <> '' then begin
         edtCep.Text:=FormatarCEP(edtCep.Text);
         tabConfig.FieldByName('Cep').AsString:=edtCep.Text;
      end;  
   end;
end;

procedure TfmConfiguracaoSistema.btnLocalizaCepClick(Sender: TObject);
var vEndereco: TEndereco;
begin
   inherited;
   if Trim(edtCep.Text) <> '' then begin
      vEndereco:=LocalizarCep(edtCep.Text);
      tabConfig.FieldByName('Endereco').AsString:=vEndereco.Endereco;
      tabConfig.FieldByName('Bairro').AsString:=vEndereco.Bairro;
      tabConfig.FieldByName('Estado').AsString:=vEndereco.Estado;
      tabConfig.FieldByName('CodigoCidade').AsString:=vEndereco.CodigoCidade;
      tabConfig.FieldByName('CodigoPais').AsString:=vEndereco.CodigoPais; 
   end;
end;

procedure TfmConfiguracaoSistema.btnCaminhoCertClick(Sender: TObject);
begin
   inherited;
   OpenDialog1.Title:='Selecione o Certificado';
   OpenDialog1.DefaultExt:='*.pfx';
   OpenDialog1.Filter:='Arquivos PFX (*.pfx)|*.pfx|Todos os Arquivos (*.*)|*.*';
   OpenDialog1.InitialDir:=ExtractFileDir(Application.ExeName);
   if OpenDialog1.Execute then begin
      tabConfig.FieldByName('NFeCaminhoCertificado').AsString:=OpenDialog1.FileName;
   end;
end;

procedure TfmConfiguracaoSistema.btnGetCertClick(Sender: TObject);
begin
   inherited;
   tabConfig.FieldByName('NFeNumeroSerie').AsString:=ACBrNFe1.Configuracoes.Certificados.SelecionarCertificado;
end;

end.

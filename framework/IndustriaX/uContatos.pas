unit uContatos;

interface 

uses 
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Menus, Buttons, ExtCtrls, StdCtrls, Mask, DBCtrls, ComCtrls,
  ToolEdit, RXDBCtrl, Grids, DBGrids, ImgList, ShellApi, DBClient, Clipbrd;

type
  TfmContatos = class(TfmFormBaseCadastro) 
    Label1: TLabel;
    Label2: TLabel;
    edtNomeFantasia: TDBEdit;
    edtCodigoContato: TEdit;
    pgcClientes: TPageControl;
    tbsGeral: TTabSheet;
    tbsEnderecos: TTabSheet;
    tbsContatosEmails: TTabSheet;
    tbsObservacoes: TTabSheet;
    edtRazaoSocial: TDBEdit;
    Label3: TLabel;
    edtGrupo: TDBLookupComboBox;
    Label4: TLabel;
    edtTipo: TDBLookupComboBox;
    Label5: TLabel;
    edtRegimeTributario: TDBLookupComboBox;
    Label6: TLabel;
    edtStatus: TDBLookupComboBox;
    Label7: TLabel;
    edtConheceuPor: TDBEdit;
    Label8: TLabel;
    edtCnpjCpf: TDBEdit;
    lblCnpjCpf: TLabel;
    edtIeRg: TDBEdit;
    lblIeRg: TLabel;
    edtEmailNFeXml: TDBEdit;
    Label11: TLabel;
    edtEmailNFeDanfe: TDBEdit;
    Label12: TLabel;
    edtSite: TDBEdit;
    Label13: TLabel;
    grbTelefones: TGroupBox;
    edtTelefone1: TDBEdit;
    Label14: TLabel;
    edtTelefone2: TDBEdit;
    Label15: TLabel;
    edtTelefone3: TDBEdit;
    Label16: TLabel;
    edtTelefone4: TDBEdit;
    Label17: TLabel;
    edtFax1: TDBEdit;
    Label18: TLabel;
    edtFax2: TDBEdit;
    Label19: TLabel;
    edtCelular1: TDBEdit;
    Label20: TLabel;
    edtCelular2: TDBEdit;
    Label21: TLabel;
    grbEnderecoNormal: TGroupBox;
    edtEmailSkype: TDBEdit;
    Label22: TLabel;
    edtTelefoneSkype: TDBEdit;
    Label23: TLabel;
    edtMsn: TDBEdit;
    Label24: TLabel;
    edtDataNascto: TDBDateEdit;
    Label30: TLabel;
    edtDataCadastro: TDBDateEdit;
    Label25: TLabel;
    edtCep: TDBEdit;
    Label26: TLabel;
    edtNumero: TDBEdit;
    Label27: TLabel;
    edtEndereco: TDBEdit;
    Label29: TLabel;
    btnLocalizaCep: TBitBtn;
    edtBairro: TDBEdit;
    Label31: TLabel;
    edtComplemento: TDBEdit;
    Label32: TLabel;
    edtPais: TDBLookupComboBox;
    Label33: TLabel;
    edtCidade: TDBLookupComboBox;
    Label34: TLabel;
    edtEstado: TDBComboBox;
    Label28: TLabel;
    dbrTipoContato: TDBRadioGroup;
    grbEnderecoEntrega: TGroupBox;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    edtEntregaCep: TDBEdit;
    edtEntregaNumero: TDBEdit;
    edtEntregaEndereco: TDBEdit;
    btnEntregaLocalizaCep: TBitBtn;
    edtEntregaBairro: TDBEdit;
    edtEntregaComplemento: TDBEdit;
    edtEntregaPais: TDBLookupComboBox;
    edtEntregaCidade: TDBLookupComboBox;
    edtEntregaEstado: TDBComboBox;
    grbEnderecoCobranca: TGroupBox;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    edtCobrancaCep: TDBEdit;
    edtCobrancaNumero: TDBEdit;
    edtCobrancaEndereco: TDBEdit;
    btnCobrancaLocalizaCep: TBitBtn;
    edtCobrancaBairro: TDBEdit;
    edtCobrancaComplemento: TDBEdit;
    edtCobrancaPais: TDBLookupComboBox;
    edtCobrancaCidade: TDBLookupComboBox;
    edtCobrancaEstado: TDBComboBox;
    edtContato: TEdit;
    Label51: TLabel;
    edtDescricao: TEdit;
    Label52: TLabel;
    edtEmail: TEdit;
    Label53: TLabel;
    btnContatoAdicionar: TBitBtn;
    btnEmailAdicionar: TBitBtn;
    dbgContatos: TDBGrid;
    dbgEmails: TDBGrid;
    Rtulo1: TMenuItem;
    tabPais: TZQuery;
    dtsPais: TDataSource;
    tabCidades: TZQuery;
    dtsCidades: TDataSource;
    GerarCliente1: TMenuItem;
    btnContatosRemover: TBitBtn;
    btnEmailsRemover: TBitBtn;
    tabContatosContatos: TZQuery;
    dtsContatosContatos: TDataSource;
    tabContatosEmails: TZQuery;
    dtsContatosEmails: TDataSource;
    tabGrupos: TZQuery;
    dtsGrupos: TDataSource;
    tabTipos: TZQuery;
    dtsTipos: TDataSource;
    tabRegimeTributario: TZQuery;
    dtsRegimeTributario: TDataSource;
    tabStatus: TZQuery;
    dtsStatus: TDataSource;
    tabChecagens: TZQuery;
    tabClientes: TZQuery;
    tabClientesContatos: TZQuery;
    tabClientesEmails: TZQuery;
    popEmail: TPopupMenu;
    EnviarEmail1: TMenuItem;
    btnCopiarDeEndNormalParaEntrega: TBitBtn;
    btnCopiarEndNormalParaCobranca: TBitBtn;
    btnCopiarEndEntregaParaCobranca: TBitBtn;
    dtsChecagens: TDataSource;
    PageControl1: TPageControl;
    tbsHistorico: TTabSheet;
    tbsObs: TTabSheet;
    edtObs1: TDBMemo;
    edtObs2: TDBMemo;
    Label10: TLabel;
    edtHistoricoData: TDBDateEdit;
    Label54: TLabel;
    edtHistoricoDepto: TDBLookupComboBox;
    Label55: TLabel;
    edtHistoricoFuncionario: TDBLookupComboBox;
    dbgHistorico: TDBGrid;
    edtHistoricoHistorico: TDBMemo;
    Label9: TLabel;
    btnHistoricoNovo: TBitBtn;
    btnHistoricoGravar: TBitBtn;
    btnHistoricoRemover: TBitBtn;
    tabContatosHistoricos: TZQuery;
    dtsContatosHistoricos: TDataSource;
    tabAuxContatos: TClientDataSet;
    tabAuxContatosContato: TStringField;
    dtsAuxContatos: TDataSource;
    tabAuxEmails: TClientDataSet;
    tabAuxEmailsDescricao: TStringField;
    tabAuxEmailsEmail: TStringField;
    dtsAuxEmails: TDataSource;
    tabAuxHistoricos: TClientDataSet;
    tabAuxHistoricosData: TDateField;
    tabAuxHistoricosCodigoDepto: TFloatField;
    tabAuxHistoricosCodigoFuncionario: TFloatField;
    tabAuxHistoricosHistorico: TMemoField;
    dtsAuxHistoricos: TDataSource;
    tabDepto: TZQuery;
    dtsDepto: TDataSource;
    tabFuncionarios: TZQuery;
    dtsFuncionarios: TDataSource;
    tabClientesHistoricos: TZQuery;
    popEditarContato: TPopupMenu;
    MenuItem1: TMenuItem;
    popEditarEmail: TPopupMenu;
    MenuItem2: TMenuItem;
    N1: TMenuItem;
    EnviarEmail2: TMenuItem;
    N2: TMenuItem;
    Copiar1: TMenuItem;
    N3: TMenuItem;
    Copiar3: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEditarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dtsBaseDataChange(Sender: TObject; Field: TField);
    procedure btnNovoClick(Sender: TObject);
    procedure edtEmailNFeXmlKeyPress(Sender: TObject; var Key: Char);
    procedure btnLocalizaCepClick(Sender: TObject);
    procedure btnEntregaLocalizaCepClick(Sender: TObject);
    procedure btnCobrancaLocalizaCepClick(Sender: TObject);
    procedure edtCnpjCpfExit(Sender: TObject);
    procedure edtCepExit(Sender: TObject);
    procedure edtEntregaCepExit(Sender: TObject);
    procedure edtCobrancaCepExit(Sender: TObject);
    procedure btnContatoAdicionarClick(Sender: TObject);
    procedure btnEmailAdicionarClick(Sender: TObject);
    procedure btnContatosRemoverClick(Sender: TObject);
    procedure btnEmailsRemoverClick(Sender: TObject);
    procedure edtCodigoContatoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnLocalizarClick(Sender: TObject);
    procedure Rtulo1Click(Sender: TObject);
    procedure GerarCliente1Click(Sender: TObject);
    procedure edtCodigoContatoKeyPress(Sender: TObject; var Key: Char);
    procedure edtEmailNFeXmlClick(Sender: TObject);
    procedure edtEmailNFeDanfeClick(Sender: TObject);
    procedure EnviarEmail1Click(Sender: TObject);
    procedure edtEmailNFeDanfeKeyPress(Sender: TObject; var Key: Char);
    procedure btnCopiarDeEndNormalParaEntregaClick(Sender: TObject);
    procedure btnCopiarEndNormalParaCobrancaClick(Sender: TObject);
    procedure btnCopiarEndEntregaParaCobrancaClick(Sender: TObject);
    procedure edtCidadeEnter(Sender: TObject);
    procedure edtCidadeExit(Sender: TObject);
    procedure edtEntregaCidadeEnter(Sender: TObject);
    procedure edtEntregaCidadeExit(Sender: TObject);
    procedure edtCobrancaCidadeEnter(Sender: TObject);
    procedure edtCobrancaCidadeExit(Sender: TObject);
    procedure edtSiteClick(Sender: TObject);
    procedure btnHistoricoRemoverClick(Sender: TObject);
    procedure btnHistoricoGravarClick(Sender: TObject);
    procedure btnHistoricoNovoClick(Sender: TObject);
    procedure dbgHistoricoCellClick(Column: TColumn);
    procedure dtsAuxHistoricosDataChange(Sender: TObject; Field: TField);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure EnviarEmail2Click(Sender: TObject);
    procedure Copiar1Click(Sender: TObject);
    procedure Copiar3Click(Sender: TObject);
    procedure dbrTipoContatoClick(Sender: TObject);
  private
    FTyping : Boolean;
    FCodigoContato: string;
    procedure AtualizaCodigoContato;
    procedure AtualizaTipoPessoa;
    procedure EnvioDeEmails(pEmail: string);
    procedure AcessarSite(pSite: string);
    procedure GravarContatos(pCodigoContato: real);
    procedure GravarEmails(pCodigoContato: real);
    procedure GravarHistoricos(pCodigoContato: real);     
  public
    procedure Novo; override;
    procedure Editar; override;
    procedure Deletar; override;
    procedure Cancelar; override;
    function Checagens: Boolean; override;
  end;

var
  fmContatos: TfmContatos;

implementation

uses uMenu, uFormBaseConfig, uConstantes, uFuncoes, uLocalizarContatos,
     rRotulosContatos, uObservacoes, uEnderecos;

{$R *.dfm}

{ TfmContatos }

procedure TfmContatos.Novo;
begin
   if Trim(edtCodigoContato.Text) = '' then begin
      tabBase.FieldByName('CodigoContato').AsFloat:=CodeGenerator('contatos', 'CodigoContato');
    end 
   else begin
      tabBase.FieldByName('CodigoContato').AsFloat:=StrToFloat(edtCodigoContato.Text); 
   end;
   GravarContatos(tabBase.FieldByName('CodigoContato').AsFloat);
   GravarEmails(tabBase.FieldByName('CodigoContato').AsFloat);
   GravarHistoricos(tabBase.FieldByName('CodigoContato').AsFloat);    
end;

procedure TfmContatos.Editar;
begin
   GravarContatos(tabBase.FieldByName('CodigoContato').AsFloat);
   GravarEmails(tabBase.FieldByName('CodigoContato').AsFloat);
   GravarHistoricos(tabBase.FieldByName('CodigoContato').AsFloat);
end;

procedure TfmContatos.Cancelar;
begin
end;

procedure TfmContatos.Deletar;
begin
   // Contatos Contatos.
   tabChecagens.Close;
   tabChecagens.SQL.Clear;
   tabChecagens.SQL.Add('SELECT * FROM contatos_contatos WHERE CodigoContato = '+tabBase.FieldByName('CodigoContato').AsString);
   tabChecagens.Open;
   tabChecagens.First;
   while not tabChecagens.Eof do begin
      tabChecagens.Delete;
      tabChecagens.ApplyUpdates;
      Continue;
   end;
   // Contatos E-mails.
   tabChecagens.Close;
   tabChecagens.SQL.Clear;
   tabChecagens.SQL.Add('SELECT * FROM contatos_emails WHERE CodigoContato = '+tabBase.FieldByName('CodigoContato').AsString);
   tabChecagens.Open;
   tabChecagens.First;
   while not tabChecagens.Eof do begin
      tabChecagens.Delete;
      tabChecagens.ApplyUpdates;
      Continue;
   end;
   // Contatos Históricos.
   tabChecagens.Close;
   tabChecagens.SQL.Clear;
   tabChecagens.SQL.Add('SELECT * FROM contatos_historicos WHERE CodigoContato = '+tabBase.FieldByName('CodigoContato').AsString);
   tabChecagens.Open;
   tabChecagens.First;
   while not tabChecagens.Eof do begin
      tabChecagens.Delete;
      tabChecagens.ApplyUpdates;
      Continue;
   end;
end;

function TfmContatos.Checagens: Boolean;
begin
  Result:=False;
  if Trim(edtNomeFantasia.Text) = '' then
  begin
    ShowMessage('Obrigatório Preenchimento do Nome Fantasia');
    edtNomeFantasia.SetFocus;
    Result:=True;
    exit;
  end;
  if Trim(edtRazaoSocial.Text) = '' then
  begin
    ShowMessage('Obrigatório Preenchimento da Razão Social');
    edtRazaoSocial.SetFocus;
    Result:=True;
    exit;
  end;
  if tabBase.State = dsInsert then
  begin
    if Trim(edtCodigoContato.Text) <> '' then
    begin
      if ExistsValue('CodigoContato', 'contatos', edtCodigoContato.Text) then
      begin
        ShowMessage('Código do Contato já Existente');
        edtCodigoContato.SetFocus;
        Result:=True;
        exit;
      end;
    end;
    if Trim(edtCnpjCpf.Text) <> '' then
    begin
      if ExistsValue('CpfCnpj', 'contatos', edtCnpjCpf.Text) then
      begin
        ShowMessage('CPF/CNPJ já Existente');
        edtCnpjCpf.SetFocus;
        Result:=True;
        exit;
      end;
    end;
  end;
end; 

procedure TfmContatos.FormCreate(Sender: TObject);
begin
   inherited;
   FTyping:=False;
   SetFormStyle(fsMDIChild);
end;

procedure TfmContatos.AtualizaTipoPessoa;
begin
   if tabBase.State in [dsInsert, dsEdit] then begin
      if dbrTipoContato.ItemIndex = 0 then begin
         lblCnpjCpf.Caption:='CNPJ';
         lblIeRg.Caption:='Inscrição Estadual';
       end
      else begin
         lblCnpjCpf.Caption:='CPF';
         lblIeRg.Caption:='RG';
      end;
    end
   else begin
      if tabBase.FieldByName('TipoContato').AsInteger = 1 then begin
         lblCnpjCpf.Caption:='CNPJ';
         lblIeRg.Caption:='Inscrição Estadual';
       end
      else begin
         lblCnpjCpf.Caption:='CPF';
         lblIeRg.Caption:='RG';
      end;
   end;
end;

procedure TfmContatos.FormShow(Sender: TObject);
begin
   pgcClientes.ActivePageIndex:=0;

   FCodigoContato:='';

   if Trim(fmMenu.pubTrans1) <> '' then begin
      FCodigoContato:=fmMenu.pubTrans1;
   end;

   tabAuxContatos.CreateDataSet;
   tabAuxContatos.EmptyDataSet;

   tabAuxEmails.CreateDataSet;
   tabAuxEmails.EmptyDataSet;

   tabAuxHistoricos.CreateDataSet;
   tabAuxHistoricos.EmptyDataSet;

   tabContatosEmails.Params.CreateParam(ftFloat, 'CodigoContato', ptUnknown);
   tabContatosEmails.SQL.Add('SELECT * FROM contatos_emails WHERE CodigoContato = :CodigoContato');
   tabContatosEmails.Open; 

   tabContatosContatos.Params.CreateParam(ftFloat, 'CodigoContato', ptUnknown);
   tabContatosContatos.SQL.Add('SELECT ID, CodigoContato, Nome AS Contato FROM contatos_contatos WHERE CodigoContato = :CodigoContato');
   tabContatosContatos.Open;

   tabContatosHistoricos.Params.CreateParam(ftFloat, 'CodigoContato', ptUnknown); 
   tabContatosHistoricos.SQL.Add('SELECT * FROM contatos_historicos WHERE CodigoContato = :CodigoContato ORDER BY Data DESC');
   tabContatosHistoricos.Open;

   tabBase.Params.CreateParam(ftFloat, 'CodigoContato', ptUnknown);
   tabBase.SQL.Add('SELECT * FROM contatos WHERE CodigoContato = :CodigoContato');
   tabBase.Open;

   tabPais.SQL.Add('SELECT * FROM paises ORDER BY Pais');
   tabPais.Open;

   tabCidades.SQL.Add('SELECT * FROM cidades ORDER BY Cidade');
   tabCidades.Open;

   tabGrupos.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('11')+' ORDER BY Descricao');
   tabGrupos.Open;

   tabTipos.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('12')+' ORDER BY Descricao');
   tabTipos.Open;

   tabRegimeTributario.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('24'));
   tabRegimeTributario.Open;

   tabStatus.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('13'));
   tabStatus.Open;

   tabDepto.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('3')+' ORDER BY Descricao');
   tabDepto.Open; 

   tabFuncionarios.SQL.Add('SELECT Codigo,Nome FROM funcionarios WHERE DataSaida IS NULL ORDER BY Nome');
   tabFuncionarios.Open;

   AtualizaCodigoContato;

   if Trim(FCodigoContato) <> '' then begin
      tabBase.Close;
      tabBase.ParamByName('CodigoContato').AsFloat:=StrToFloat(FCodigoContato);
      tabBase.Open;
   end; 

   dbgContatos.PopupMenu:=popEditarContato;
   dbgEmails.PopupMenu:=popEditarEmail;

   inherited;
end;

procedure TfmContatos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabBase.Close;
   tabPais.Close;
   tabCidades.Close;
   tabContatosContatos.Close;
   tabContatosEmails.Close;
   tabGrupos.Close;
   tabTipos.Close;
   tabRegimeTributario.Close;
   tabStatus.Close;
   tabContatosHistoricos.Close;
   tabAuxContatos.Close;
   tabAuxEmails.Close;
   tabAuxHistoricos.Close;
   tabDepto.Close;
   tabFuncionarios.Close; 
   inherited;
end;

procedure TfmContatos.AtualizaCodigoContato;
begin
   if FTyping = False then begin
      if not tabBase.FieldByName('CodigoContato').IsNull then begin
         edtCodigoContato.Text:=FloatToStr(tabBase.FieldByName('CodigoContato').AsFloat);
      end;
   end;
end;

procedure TfmContatos.btnEditarClick(Sender: TObject);
begin
   inherited;
   edtCodigoContato.Enabled:=False;

   dbgContatos.DataSource:=dtsAuxContatos;
   dbgEmails.DataSource:=dtsAuxEmails;
   dbgHistorico.DataSource:=dtsAuxHistoricos;

   edtHistoricoData.DataSource:=dtsAuxHistoricos;
   edtHistoricoDepto.DataSource:=dtsAuxHistoricos;
   edtHistoricoFuncionario.DataSource:=dtsAuxHistoricos;
   edtHistoricoHistorico.DataSource:=dtsAuxHistoricos;

   // <contatos>
   tabAuxContatos.EmptyDataSet;
   
   tabContatosContatos.First;
   while not tabContatosContatos.Eof do begin

      tabAuxContatos.Append;
      tabAuxContatosContato.Value:=tabContatosContatos.FieldByName('Contato').AsString;
      tabAuxContatos.Post;

      tabContatosContatos.Next;
   end;

   tabAuxContatos.First;
   // </contatos>

   // <emails>
   tabAuxEmails.EmptyDataSet;

   tabContatosEmails.First;
   while not tabContatosEmails.Eof do begin

      tabAuxEmails.Append;
      tabAuxEmailsDescricao.Value:=tabContatosEmails.FieldByName('Descricao').AsString;
      tabAuxEmailsEmail.Value:=tabContatosEmails.FieldByName('Email').AsString;
      tabAuxEmails.Post;

      tabContatosEmails.Next;
   end;

   tabAuxEmails.First;
   // </emails>

   // <históricos>
   tabAuxHistoricos.EmptyDataSet;

   tabContatosHistoricos.First;
   while not tabContatosHistoricos.Eof do begin

      tabAuxHistoricos.Append;
      if not tabContatosHistoricos.FieldByName('Data').IsNull then begin
         tabAuxHistoricosData.Value:=tabContatosHistoricos.FieldByName('Data').AsDateTime;
      end;
      tabAuxHistoricosCodigoDepto.Value:=tabContatosHistoricos.FieldByName('CodigoDepto').AsFloat;
      tabAuxHistoricosCodigoFuncionario.Value:=tabContatosHistoricos.FieldByName('CodigoFuncionario').AsFloat;
      tabAuxHistoricosHistorico.Value:=tabContatosHistoricos.FieldByName('Historico').AsString;             
      tabAuxHistoricos.Post;

      tabContatosHistoricos.Next;
   end;

   tabAuxHistoricos.First;
   // </históricos>
end;

procedure TfmContatos.btnGravarClick(Sender: TObject);
begin
   inherited; 
   dbgContatos.DataSource:=dtsContatosContatos;
   dbgEmails.DataSource:=dtsContatosEmails;
   dbgHistorico.DataSource:=dtsContatosHistoricos;

   edtHistoricoData.DataSource:=dtsContatosHistoricos;
   edtHistoricoDepto.DataSource:=dtsContatosHistoricos;
   edtHistoricoFuncionario.DataSource:=dtsContatosHistoricos;
   edtHistoricoHistorico.DataSource:=dtsContatosHistoricos;
   
   edtCodigoContato.Enabled:=True;
end;

procedure TfmContatos.btnCancelarClick(Sender: TObject);
begin
   inherited;

   dbgContatos.DataSource:=dtsContatosContatos;
   dbgEmails.DataSource:=dtsContatosEmails;
   dbgHistorico.DataSource:=dtsContatosHistoricos;

   edtHistoricoData.DataSource:=dtsContatosHistoricos;
   edtHistoricoDepto.DataSource:=dtsContatosHistoricos;
   edtHistoricoFuncionario.DataSource:=dtsContatosHistoricos;
   edtHistoricoHistorico.DataSource:=dtsContatosHistoricos;

   edtCodigoContato.Enabled:=True;
end;

procedure TfmContatos.dtsBaseDataChange(Sender: TObject; Field: TField);
begin
   if tabBase.State = dsBrowse then begin

      tabContatosEmails.Close;
      tabContatosEmails.ParamByName('CodigoContato').Value:=tabBase.FieldByName('CodigoContato').Value;
      tabContatosEmails.Open;

      tabContatosContatos.Close;
      tabContatosContatos.ParamByName('CodigoContato').Value:=tabBase.FieldByName('CodigoContato').Value;
      tabContatosContatos.Open;      

      tabContatosHistoricos.Close;
      tabContatosHistoricos.ParamByName('CodigoContato').AsFloat:=tabBase.FieldByName('CodigoContato').AsFloat;
      tabContatosHistoricos.Open;

      AtualizaCodigoContato;
   end;

   AtualizaTipoPessoa;
end;

procedure TfmContatos.btnNovoClick(Sender: TObject);
begin
   inherited;

   dbgContatos.DataSource:=dtsAuxContatos;
   dbgEmails.DataSource:=dtsAuxEmails;
   dbgHistorico.DataSource:=dtsAuxHistoricos;

   edtHistoricoData.DataSource:=dtsAuxHistoricos;
   edtHistoricoDepto.DataSource:=dtsAuxHistoricos;
   edtHistoricoFuncionario.DataSource:=dtsAuxHistoricos;
   edtHistoricoHistorico.DataSource:=dtsAuxHistoricos;

   edtCodigoContato.Text:='';
   tabBase.FieldByName('TipoContato').AsInteger:=0;

   tabContatosEmails.Close;
   tabContatosEmails.ParamByName('CodigoContato').AsFloat:=0;
   tabContatosEmails.Open;

   tabContatosContatos.Close;
   tabContatosContatos.ParamByName('CodigoContato').AsFloat:=0;
   tabContatosContatos.Open;

   tabContatosHistoricos.Close;
   tabContatosHistoricos.ParamByName('CodigoContato').AsFloat:=0;
   tabContatosHistoricos.Open;

   tabAuxContatos.EmptyDataSet;
   tabAuxEmails.EmptyDataSet;
   tabAuxHistoricos.EmptyDataSet;

   edtNomeFantasia.SetFocus;   
end;

procedure TfmContatos.edtEmailNFeXmlKeyPress(Sender: TObject;
  var Key: Char);
begin
   Key:=LoCase(Key);
end;

procedure TfmContatos.btnLocalizaCepClick(Sender: TObject);
var vEndereco: TEndereco;
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin 
      if Trim(edtCep.Text) <> '' then begin
         vEndereco:=LocalizarCep(edtCep.Text);
         tabBase.FieldByName('Endereco').AsString:=vEndereco.Endereco;
         tabBase.FieldByName('Bairro').AsString:=vEndereco.Bairro;
         tabBase.FieldByName('CodigoPais').AsString:=vEndereco.CodigoPais;
         tabBase.FieldByName('Estado').AsString:=vEndereco.Estado;
         tabBase.FieldByName('CodigoCidade').AsString:=vEndereco.CodigoCidade;
      end;
   end;
end;

procedure TfmContatos.btnEntregaLocalizaCepClick(Sender: TObject);
var vEndereco: TEndereco;
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtEntregaCep.Text) <> '' then begin
         vEndereco:=LocalizarCep(edtEntregaCep.Text);
         tabBase.FieldByName('EntregaEndereco').AsString:=vEndereco.Endereco;
         tabBase.FieldByName('EntregaBairro').AsString:=vEndereco.Bairro;
         tabBase.FieldByName('EntregaCodigoPais').AsString:=vEndereco.CodigoPais;
         tabBase.FieldByName('EntregaEstado').AsString:=vEndereco.Estado;
         tabBase.FieldByName('EntregaCodigoCidade').AsString:=vEndereco.CodigoCidade;
      end;
   end;
end;

procedure TfmContatos.btnCobrancaLocalizaCepClick(Sender: TObject);
var vEndereco: TEndereco;
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtCobrancaCep.Text) <> '' then begin
         vEndereco:=LocalizarCep(edtCobrancaCep.Text);
         tabBase.FieldByName('CobrancaEndereco').AsString:=vEndereco.Endereco;
         tabBase.FieldByName('CobrancaBairro').AsString:=vEndereco.Bairro;
         tabBase.FieldByName('CobrancaCodigoPais').AsString:=vEndereco.CodigoPais;
         tabBase.FieldByName('CobrancaEstado').AsString:=vEndereco.Estado;
         tabBase.FieldByName('CobrancaCodigoCidade').AsString:=vEndereco.CodigoCidade;
      end;
   end;
end;

procedure TfmContatos.edtCnpjCpfExit(Sender: TObject);
begin
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtCnpjCpf.Text) <> '' then begin
         case dbrTipoContato.ItemIndex of
            0: begin
               if not CNPJ(edtCnpjCpf.Text) then begin
                  ShowMessage('CNPJ Inválido.');
                  edtCnpjCpf.SetFocus;
                  exit;
               end;
               edtCnpjCpf.Text:=FormatarCNPJ(edtCnpjCpf.Text);
               tabBase.FieldByName('CpfCnpj').AsString:=edtCnpjCpf.Text;
            end;
            1: begin
               if not CPF(edtCnpjCpf.Text) then begin
                  ShowMessage('CPF Inválido.');
                  edtCnpjCpf.SetFocus;
                  exit;
               end;
               edtCnpjCpf.Text:=FormatarCPF(edtCnpjCpf.Text);
               tabBase.FieldByName('CpfCnpj').AsString:=edtCnpjCpf.Text;
            end;
         end;
      end;
   end;
end;

procedure TfmContatos.edtCepExit(Sender: TObject);
begin
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtCep.Text) <> '' then begin
         edtCep.Text:=FormatarCEP(edtCep.Text);
         tabBase.FieldByName('Cep').AsString:=edtCep.Text;
      end;
   end;
end;

procedure TfmContatos.edtEntregaCepExit(Sender: TObject);
begin
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtEntregaCep.Text) <> '' then begin
         edtEntregaCep.Text:=FormatarCEP(edtEntregaCep.Text);
         tabBase.FieldByName('EntregaCep').AsString:=edtEntregaCep.Text;
      end;
   end;
end;

procedure TfmContatos.edtCobrancaCepExit(Sender: TObject);
begin
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtCobrancaCep.Text) <> '' then begin
         edtCobrancaCep.Text:=FormatarCEP(edtCobrancaCep.Text);
         tabBase.FieldByName('CobrancaCep').AsString:=edtCobrancaCep.Text;
      end;
   end;
end;

procedure TfmContatos.btnContatoAdicionarClick(Sender: TObject);
begin
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtContato.Text) <> '' then begin
         tabAuxContatos.Append;
         tabAuxContatosContato.Value:=edtContato.Text;
         tabAuxContatos.Post;
         edtContato.Text:='';
         edtContato.SetFocus;
      end;
   end;
end;

procedure TfmContatos.btnEmailAdicionarClick(Sender: TObject);
begin
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtEmail.Text) <> '' then begin
         tabAuxEmails.Append;
         tabAuxEmailsDescricao.Value:=edtDescricao.Text;
         tabAuxEmailsEmail.Value:=edtEmail.Text;
         tabAuxEmails.Post;

         edtDescricao.Text:='';
         edtEmail.Text:='';

         edtDescricao.SetFocus; 
      end;
   end;
end;

procedure TfmContatos.btnContatosRemoverClick(Sender: TObject);
begin
   if tabBase.State in [dsInsert, dsEdit] then begin
      if tabAuxContatos.RecordCount > 0 then begin
         if Application.MessageBox('Deseja Realmente Excluir o Contato desse Contato?', PChar(Application.Title), 36) = 7 then exit;
         tabAuxContatos.Delete;
      end;
   end;
end;

procedure TfmContatos.btnEmailsRemoverClick(Sender: TObject);
begin
   if tabBase.State in [dsInsert, dsEdit] then begin
      if tabAuxEmails.RecordCount > 0 then begin
         if Application.MessageBox('Deseja Realmente Excluir o Email desse Contato?', PChar(Application.Title), 36) = 7 then exit;
         tabAuxEmails.Delete;
      end;
   end;
end;

procedure TfmContatos.edtCodigoContatoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if tabBase.State = dsBrowse then begin
      if Trim(edtCodigoContato.Text) <> '' then begin
         FTyping:=True;
         tabBase.Close;
         tabBase.ParamByName('CodigoContato').AsFloat:=StrToFloat(edtCodigoContato.Text);
         tabBase.Open;
         FTyping:=False;
       end
      else begin
         FTyping:=True;
         tabBase.Close;
         tabBase.ParamByName('CodigoContato').AsFloat:=-1;
         tabBase.Open;
         FTyping:=False;
      end;
   end;
end;

procedure TfmContatos.btnLocalizarClick(Sender: TObject);
begin
   inherited;
   if not Assigned(fmLocalizarContatos) then begin
      Application.CreateForm(TfmLocalizarContatos, fmLocalizarContatos);
      fmLocalizarContatos.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edtCodigoContato.Text:=fmMenu.pubTrans1;
      tabBase.Close;
      tabBase.ParamByName('CodigoContato').Value:=edtCodigoContato.Text;
      tabBase.Open;
   end;
end;

procedure TfmContatos.Rtulo1Click(Sender: TObject);
var vRT: TrtRotulosContatos;
begin
   inherited;
   if Trim(edtCodigoContato.Text) <> '' then begin
      if tabBase.State = dsBrowse then begin
         fmMenu.pubTrans1:=edtCodigoContato.Text;
         vRT:=TrtRotulosContatos.Create(Self);
         vRT.Show; 
      end;
   end;
end;

procedure TfmContatos.GerarCliente1Click(Sender: TObject);
var vCodigoCliente : Real;
    vMensagem: string;
begin
  inherited;
  vMensagem:='';
  vCodigoCliente:=0;
   if Trim(edtCodigoContato.Text) <> '' then begin
      if tabBase.State = dsBrowse then begin
         if Trim(edtCnpjCpf.Text) <> '' then begin
            if ExistsValue('CpfCnpj', 'clientes', edtCnpjCpf.Text) then begin
               ShowMessage('Esse Contato já Existe no Cadastro de Clientes');
               exit;
            end;
         end;
         if Application.MessageBox('Confirmar Transferência de Contatos para Clientes?', PChar(Application.Title), 36) = 7 then exit;
         try try
            tabClientes.Close;
            tabClientes.SQL.Clear;
            tabClientes.SQL.Add('SELECT * FROM clientes WHERE 0');
            tabClientes.Open;

            tabClientes.Append;
            vCodigoCliente:=CodeGenerator('clientes', 'CodigoCliente');
            tabClientes.FieldByName('CodigoCliente').AsFloat:=vCodigoCliente;
            tabClientes.FieldByName('NomeFantasia').AsString:=tabBase.FieldByName('NomeFantasia').AsString;
            tabClientes.FieldByName('RazaoSocial').AsString:=tabBase.FieldByName('RazaoSocial').AsString;
            tabClientes.FieldByName('CodigoGrupo').AsFloat:=tabBase.FieldByName('CodigoGrupo').AsFloat;
            tabClientes.FieldByName('CodigoTipo').AsFloat:=tabBase.FieldByName('CodigoTipo').AsFloat;
            tabClientes.FieldByName('CodigoCRT').AsFloat:=tabBase.FieldByName('CodigoCRT').AsFloat;
            tabClientes.FieldByName('CodigoStatus').AsFloat:=tabBase.FieldByName('CodigoStatus').AsFloat;
            tabClientes.FieldByName('TipoCliente').AsInteger:=tabBase.FieldByName('TipoContato').AsInteger;
            tabClientes.FieldByName('CpfCnpj').AsString:=tabBase.FieldByName('CpfCnpj').AsString;
            tabClientes.FieldByName('IERG').AsString:=tabBase.FieldByName('IERG').AsString;
            tabClientes.FieldByName('ConheceuPor').AsString:=tabBase.FieldByName('ConheceuPor').AsString;
            tabClientes.FieldByName('EmailNFEXML').AsString:=tabBase.FieldByName('EmailNFEXML').AsString;
            tabClientes.FieldByName('EmailNFEDanfe').AsString:=tabBase.FieldByName('EmailNFEDanfe').AsString;
            tabClientes.FieldByName('Site').AsString:=tabBase.FieldByName('Site').AsString;
            tabClientes.FieldByName('EmailSkype').AsString:=tabBase.FieldByName('EmailSkype').AsString;
            tabClientes.FieldByName('TelSkype').AsString:=tabBase.FieldByName('TelSkype').AsString;
            tabClientes.FieldByName('MSN').AsString:=tabBase.FieldByName('MSN').AsString;
            if not tabBase.FieldByName('DataNascto').IsNull then begin
               tabClientes.FieldByName('DataNascto').AsDateTime:=tabBase.FieldByName('DataNascto').AsDateTime;
            end;
            if not tabBase.FieldByName('DataCadastro').IsNull then begin
               tabClientes.FieldByName('DataCadastro').AsDateTime:=tabBase.FieldByName('DataCadastro').AsDateTime;
            end;
            tabClientes.FieldByName('Telefone1').AsString:=tabBase.FieldByName('Telefone1').AsString;
            tabClientes.FieldByName('Telefone2').AsString:=tabBase.FieldByName('Telefone2').AsString;
            tabClientes.FieldByName('Telefone3').AsString:=tabBase.FieldByName('Telefone3').AsString;
            tabClientes.FieldByName('Telefone4').AsString:=tabBase.FieldByName('Telefone4').AsString;
            tabClientes.FieldByName('Fax1').AsString:=tabBase.FieldByName('Fax1').AsString;
            tabClientes.FieldByName('Fax2').AsString:=tabBase.FieldByName('Fax2').AsString;
            tabClientes.FieldByName('Celular1').AsString:=tabBase.FieldByName('Celular1').AsString;
            tabClientes.FieldByName('Celular2').AsString:=tabBase.FieldByName('Celular2').AsString;
            tabClientes.FieldByName('Cep').AsString:=FormatarCep(tabBase.FieldByName('Cep').AsString);
            tabClientes.FieldByName('Endereco').AsString:=tabBase.FieldByName('Endereco').AsString;
            tabClientes.FieldByName('Numero').AsString:=tabBase.FieldByName('Numero').AsString;
            tabClientes.FieldByName('Bairro').AsString:=tabBase.FieldByName('Bairro').AsString;
            tabClientes.FieldByName('Complemento').AsString:=tabBase.FieldByName('Complemento').AsString;
            tabClientes.FieldByName('CodigoPais').AsString:=tabBase.FieldByName('CodigoPais').AsString;
            tabClientes.FieldByName('Estado').AsString:=tabBase.FieldByName('Estado').AsString;
            tabClientes.FieldByName('CodigoCidade').AsString:=tabBase.FieldByName('CodigoCidade').AsString;
            tabClientes.FieldByName('EntregaCep').AsString:=FormatarCep(tabBase.FieldByName('EntregaCep').AsString);
            tabClientes.FieldByName('EntregaEndereco').AsString:=tabBase.FieldByName('EntregaEndereco').AsString;
            tabClientes.FieldByName('EntregaNumero').AsString:=tabBase.FieldByName('EntregaNumero').AsString;
            tabClientes.FieldByName('EntregaBairro').AsString:=tabBase.FieldByName('EntregaBairro').AsString;
            tabClientes.FieldByName('EntregaComplemento').AsString:=tabBase.FieldByName('EntregaComplemento').AsString;
            tabClientes.FieldByName('EntregaCodigoPais').AsString:=tabBase.FieldByName('EntregaCodigoPais').AsString;
            tabClientes.FieldByName('EntregaEstado').AsString:=tabBase.FieldByName('EntregaEstado').AsString;
            tabClientes.FieldByName('EntregaCodigoCidade').AsString:=tabBase.FieldByName('EntregaCodigoCidade').AsString;
            tabClientes.FieldByName('CobrancaCep').AsString:=FormatarCep(tabBase.FieldByName('CobrancaCep').AsString);
            tabClientes.FieldByName('CobrancaEndereco').AsString:=tabBase.FieldByName('CobrancaEndereco').AsString;
            tabClientes.FieldByName('CobrancaNumero').AsString:=tabBase.FieldByName('CobrancaNumero').AsString;
            tabClientes.FieldByName('CobrancaBairro').AsString:=tabBase.FieldByName('CobrancaBairro').AsString;
            tabClientes.FieldByName('CobrancaComplemento').AsString:=tabBase.FieldByName('CobrancaComplemento').AsString;
            tabClientes.FieldByName('CobrancaCodigoPais').AsString:=tabBase.FieldByName('CobrancaCodigoPais').AsString;
            tabClientes.FieldByName('CobrancaEstado').AsString:=tabBase.FieldByName('CobrancaEstado').AsString;
            tabClientes.FieldByName('CobrancaCodigoCidade').AsString:=tabBase.FieldByName('CobrancaCodigoCidade').AsString;
            tabClientes.FieldByName('Observacao1').AsString:=tabBase.FieldByName('Observacao1').AsString;
            tabClientes.FieldByName('Observacao2').AsString:=tabBase.FieldByName('Observacao2').AsString;
            tabClientes.Post;
            tabClientes.ApplyUpdates;
         except
            on E: Exception do begin
               vMensagem:=vMensagem+E.Message+Chr(13);
            end;
         end;
         finally
            tabClientes.Close;
         end;
         try try
            tabClientesContatos.Close;
            tabClientesContatos.SQL.Clear;
            tabClientesContatos.SQL.Add('SELECT * FROM clientes_contatos WHERE 0');
            tabClientesContatos.Open;

            tabContatosContatos.First;
            while not tabContatosContatos.Eof do begin

               Application.ProcessMessages;

               tabClientesContatos.Append;
               tabClientesContatos.FieldByName('ID').AsFloat:=CodeGenerator('clientes_contatos', 'ID');
               tabClientesContatos.FieldByName('CodigoCliente').AsFloat:=vCodigoCliente;
               tabClientesContatos.FieldByName('Nome').AsString:=tabContatosContatos.FieldByName('Contato').AsString;
               tabClientesContatos.Post;
               tabClientesContatos.ApplyUpdates;

               tabContatosContatos.Next;
            end;
         except
            on E: Exception do begin
               vMensagem:=vMensagem+E.Message+Chr(13);
            end;
         end;
         finally
            tabClientesContatos.Close;
         end;
         try try
            tabClientesEmails.Close;
            tabClientesEmails.SQL.Clear;
            tabClientesEmails.SQL.Add('SELECT * FROM clientes_emails WHERE 0');
            tabClientesEmails.Open;

            tabContatosEmails.First;
            while not tabContatosEmails.Eof do begin

               Application.ProcessMessages;

               tabClientesEmails.Append;
               tabClientesEmails.FieldByName('ID').AsFloat:=CodeGenerator('clientes_emails', 'ID');
               tabClientesEmails.FieldByName('CodigoCliente').AsFloat:=vCodigoCliente;
               tabClientesEmails.FieldByName('Descricao').AsString:=tabContatosEmails.FieldByName('Descricao').AsString;
               tabClientesEmails.FieldByName('Email').AsString:=tabContatosEmails.FieldByName('Email').AsString;
               tabClientesEmails.Post;
               tabClientesEmails.ApplyUpDates;

               tabContatosEmails.Next;
            end;
         except
            on E: Exception do begin
               vMensagem:=vMensagem+E.Message+Chr(13);
            end;
         end;
         finally
            tabClientesEmails.Close;
         end;
         try try
            tabClientesHistoricos.CLose;
            tabClientesHistoricos.SQl.Clear;
            tabClientesHistoricos.SQL.Add('SELECT * FROM clientes_historicos WHERE 0');
            tabClientesHistoricos.Open;

            tabContatosHistoricos.First; 
            while not tabContatosHistoricos.Eof do begin

               Application.ProcessMessages;

               tabClientesHistoricos.Append;
               tabClientesHistoricos.FieldByName('ID').AsFloat:=CodeGenerator('clientes_historicos', 'ID');
               tabClientesHistoricos.FieldByName('CodigoCliente').AsFloat:=vCodigoCliente;
               tabClientesHistoricos.FieldByName('CodigoFuncionario').AsFloat:=tabContatosHistoricos.FieldByName('CodigoFuncionario').AsFloat;
               tabClientesHistoricos.FieldByName('CodigoDepto').AsFloat:=tabContatosHistoricos.FieldByName('CodigoDepto').AsFloat;
               tabClientesHistoricos.FieldByName('Historico').AsString:=tabContatosHistoricos.FieldByName('Historico').AsString;
               if not tabContatosHistoricos.FieldByName('Data').IsNull then begin
                  tabClientesHistoricos.FieldByName('Data').AsFloat:=tabContatosHistoricos.FieldByName('Data').AsDateTime;
               end;
               tabClientesHistoricos.Post;
               tabClientesHistoricos.ApplyUpdates;

               tabContatosHistoricos.Next;
            end;
         except
            on E: Exception do begin
               vMensagem:=vMensagem+E.Message+Chr(13);
            end;
         end;
         finally

         end;
         if Trim(vMensagem) = '' then begin

            try
               tabContatosContatos.First;
               while not tabContatosContatos.Eof do begin

                  Application.ProcessMessages;

                  if tabContatosContatos.FieldByName('CodigoContato').AsFloat = tabBase.FieldByName('CodigoContato').AsFloat then begin
                     tabContatosContatos.Delete;
                     tabContatosContatos.ApplyUpdates;
                     Continue;
                  end;

                  tabContatosContatos.Next;
               end;

               tabContatosEmails.First;
               while not tabContatosEmails.Eof do begin

                  Application.ProcessMessages;

                  if tabContatosEmails.FieldByName('CodigoContato').AsFloat = tabBase.FieldByName('CodigoContato').AsFloat then begin
                     tabContatosEmails.Delete;
                     tabContatosEmails.ApplyUpdates;
                     Continue;
                  end;
                  
                  tabContatosEmails.Next;
               end;

               tabContatosHistoricos.First;
               while not tabContatosHistoricos.Eof do begin

                  Application.ProcessMessages;

                  if tabContatosHistoricos.FieldByName('CodigoContato').AsFloat = tabBase.FieldByName('CodigoContato').AsFloat then begin
                     tabContatosHistoricos.Delete;
                     tabContatosHistoricos.ApplyUpdates;
                     Continue;
                  end;
               
                  tabContatosHistoricos.Next;
               end; 

               tabBase.Delete;
               tabBase.ApplyUpdates;
            finally

            end;

            ShowMessage('Contato Convertido com Sucesso!'+Chr(13)+'Novo Cliente Numero: '+FloatToStr(vCodigoCliente));
          end
         else begin
            MessageDlg(vmensagem, mtError, mbOKCancel, 0);
         end;
      end;
   end;
end;

procedure TfmContatos.edtCodigoContatoKeyPress(Sender: TObject;
  var Key: Char);
begin
   inherited;
   if not (Key in['0'..'9',Chr(8)]) then Key:=#0;
end;

procedure TfmContatos.EnvioDeEmails(pEmail: string);
begin
   ShellExecute(0, 'open', Pchar('mailto:'+Trim(pEmail)), nil, nil, SW_SHOWNORMAL);
end;

procedure TfmContatos.edtEmailNFeXmlClick(Sender: TObject);
begin
   inherited;
   if Trim(edtEmailNFeXml.Text) <> '' then begin
      EnvioDeEmails(edtEmailNFeXml.Text);
   end;
end;

procedure TfmContatos.edtEmailNFeDanfeClick(Sender: TObject);
begin
   inherited;
   if Trim(edtEmailNFeDanfe.Text) <> '' then begin
      EnvioDeEmails(edtEmailNFeDanfe.Text);
   end;
end;

procedure TfmContatos.EnviarEmail1Click(Sender: TObject);
begin
   inherited;
   if Trim(dbgEmails.Columns[1].Field.AsString) <> '' then begin
      EnvioDeEmails(dbgEmails.Columns[1].Field.AsString);
   end;
end;

procedure TfmContatos.edtEmailNFeDanfeKeyPress(Sender: TObject;
  var Key: Char);
begin
   inherited;
   Key:=LoCase(Key);
end;

procedure TfmContatos.btnCopiarDeEndNormalParaEntregaClick(
  Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      tabBase.FieldByName('EntregaCep').AsString:=tabBase.FieldByName('Cep').AsString;
      tabBase.FieldByName('EntregaEndereco').AsString:=tabBase.FieldByName('Endereco').AsString;
      tabBase.FieldByName('EntregaNumero').AsString:=tabBase.FieldByName('Numero').AsString;
      tabBase.FieldByName('EntregaBairro').AsString:=tabBase.FieldByName('Bairro').AsString;
      tabBase.FieldByName('EntregaComplemento').AsString:=tabBase.FieldByName('Complemento').AsString;
      tabBase.FieldByName('EntregaCodigoPais').AsString:=tabBase.FieldByName('CodigoPais').AsString;
      tabBase.FieldByName('EntregaEstado').AsString:=tabBase.FieldByName('Estado').AsString;
      tabBase.FieldByName('EntregaCodigoCidade').AsString:=tabBase.FieldByName('CodigoCidade').AsString;
   end;
end;

procedure TfmContatos.btnCopiarEndNormalParaCobrancaClick(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      tabBase.FieldByName('CobrancaCep').AsString:=tabBase.FieldByName('Cep').AsString;
      tabBase.FieldByName('CobrancaEndereco').AsString:=tabBase.FieldByName('Endereco').AsString;
      tabBase.FieldByName('CobrancaNumero').AsString:=tabBase.FieldByName('Numero').AsString;
      tabBase.FieldByName('CobrancaBairro').AsString:=tabBase.FieldByName('Bairro').AsString;
      tabBase.FieldByName('CobrancaComplemento').AsString:=tabBase.FieldByName('Complemento').AsString;
      tabBase.FieldByName('CobrancaCodigoPais').AsString:=tabBase.FieldByName('CodigoPais').AsString;
      tabBase.FieldByName('CobrancaEstado').AsString:=tabBase.FieldByName('Estado').AsString;
      tabBase.FieldByName('CobrancaCodigoCidade').AsString:=tabBase.FieldByName('CodigoCidade').AsString;
   end;
end;

procedure TfmContatos.btnCopiarEndEntregaParaCobrancaClick(
  Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      tabBase.FieldByName('CobrancaCep').AsString:=tabBase.FieldByName('EntregaCep').AsString;
      tabBase.FieldByName('CobrancaEndereco').AsString:=tabBase.FieldByName('EntregaEndereco').AsString;
      tabBase.FieldByName('CobrancaNumero').AsString:=tabBase.FieldByName('EntregaNumero').AsString;
      tabBase.FieldByName('CobrancaBairro').AsString:=tabBase.FieldByName('EntregaBairro').AsString;
      tabBase.FieldByName('CobrancaComplemento').AsString:=tabBase.FieldByName('EntregaComplemento').AsString;
      tabBase.FieldByName('CobrancaCodigoPais').AsString:=tabBase.FieldByName('EntregaCodigoPais').AsString;
      tabBase.FieldByName('CobrancaEstado').AsString:=tabBase.FieldByName('EntregaEstado').AsString;
      tabBase.FieldByName('CobrancaCodigoCidade').AsString:=tabBase.FieldByName('EntregaCodigoCidade').AsString;
   end;
end;

procedure TfmContatos.edtCidadeEnter(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtEstado.Text) = '' then begin
         ShowMessage('Obrigatório Preenchimento do Estado');
         edtEstado.SetFocus;
         exit;
      end;
      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT * FROM cidades WHERE UF = '+QuotedStr(edtEstado.Text)+' ORDER BY Cidade');
      tabChecagens.Open;
      edtCidade.ListSource:=dtsChecagens;
   end;
end;

procedure TfmContatos.edtCidadeExit(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      edtCidade.ListSource:=dtsCidades;
   end;
end;

procedure TfmContatos.edtEntregaCidadeEnter(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtEntregaEstado.Text) = '' then begin
         ShowMessage('Obrigatório Preenchimento do Estado');
         edtEntregaEstado.SetFocus;
         exit;
      end;
      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT * FROM cidades WHERE UF = '+QuotedStr(edtEntregaEstado.Text)+' ORDER BY Cidade');
      tabChecagens.Open;
      edtEntregaCidade.ListSource:=dtsChecagens;
   end;
end;

procedure TfmContatos.edtEntregaCidadeExit(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      edtEntregaCidade.ListSource:=dtsCidades;
   end;
end;

procedure TfmContatos.edtCobrancaCidadeEnter(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtCobrancaEstado.Text) = '' then begin
         ShowMessage('Obrigatório Preenchimento do Estado');
         edtCobrancaEstado.SetFocus;
         exit;
      end;
      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT * FROM cidades WHERE UF = '+QuotedStr(edtCobrancaEstado.Text)+' ORDER BY Cidade');
      tabChecagens.Open;
      edtCobrancaCidade.ListSource:=dtsChecagens;
   end;
end;

procedure TfmContatos.edtCobrancaCidadeExit(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      edtCobrancaCidade.ListSource:=dtsCidades;
   end;
end;

procedure TfmContatos.edtSiteClick(Sender: TObject);
begin
   inherited;
   if Trim(edtSite.Text) <> '' then begin
      AcessarSite(edtSite.Text);
   end;
end;

procedure TfmContatos.AcessarSite(pSite: string);
begin
   ShellExecute(0, 'open', Pchar(Trim(pSite)), nil, nil, SW_SHOWNORMAL);
end;

procedure TfmContatos.GravarContatos(pCodigoContato: real);
var vDataSource: TDataSource;
begin
   tabChecagens.Close;
   tabChecagens.SQL.Clear;
   tabChecagens.SQL.Add('DELETE FROM contatos_contatos WHERE CodigoContato = '+FloatToStr(pCodigoContato));
   tabChecagens.ExecSQL;

   vDataSource:=dbgContatos.DataSource;
   dbgContatos.DataSource:=nil;

   try
      tabAuxContatos.First;
      while not tabAuxContatos.Eof do begin

         Application.ProcessMessages;

         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT * FROM contatos_contatos WHERE 0');
         tabChecagens.Open;

         tabChecagens.Append;
         tabChecagens.FieldByName('ID').AsFloat:=CodeGenerator('contatos_contatos', 'ID');
         tabChecagens.FieldByName('CodigoContato').AsFloat:=pCodigoContato;
         tabChecagens.FieldByName('Nome').AsString:=tabAuxContatosContato.Value;
         tabChecagens.Post;
         tabChecagens.ApplyUpDates;

         tabAuxContatos.Next;
      end;
   finally
      dbgContatos.DataSource:=vDataSource;
   end;
end;

procedure TfmContatos.GravarEmails(pCodigoContato: real);
var vDataSource: TDataSource;
begin
   tabChecagens.Close;
   tabChecagens.SQL.Clear;
   tabChecagens.SQL.Add('DELETE FROM contatos_emails WHERE CodigoContato = '+FloatToStr(pCodigoContato)); 
   tabChecagens.ExecSQL; 

   vDataSource:=dbgEmails.DataSource;

   dbgEmails.DataSource:=nil;

   try
      tabAuxEmails.First;
      while not tabAuxEmails.Eof do begin

         Application.ProcessMessages;

         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT * FROM contatos_emails WHERE 0');
         tabChecagens.Open;

         tabChecagens.Append;
         tabChecagens.FieldByName('ID').AsFloat:=CodeGenerator('contatos_emails', 'ID');
         tabChecagens.FieldByName('CodigoContato').AsFloat:=pCodigoContato;
         tabChecagens.FieldByName('Descricao').AsString:=tabAuxEmailsDescricao.Value;
         tabChecagens.FieldByName('Email').AsString:=tabAuxEmailsEmail.Value;
         tabChecagens.Post;
         tabChecagens.ApplyUpDates;

         tabAuxEmails.Next;
      end;
   finally
      dbgEmails.DataSource:=vDataSource;
   end;
end;

procedure TfmContatos.GravarHistoricos(pCodigoContato: real);
var vDataSource: TDataSource;
begin
   tabChecagens.Close;
   tabChecagens.SQL.Clear;
   tabChecagens.SQL.Add('DELETE FROM contatos_historicos WHERE CodigoContato = '+FloatToStr(pCodigoContato));
   tabChecagens.ExecSQL;

   vDataSource:=dbgHistorico.DataSource;

   dbgHistorico.DataSource:=nil;

   try
      tabAuxHistoricos.First;
      while not tabAuxHistoricos.Eof do begin

         Application.ProcessMessages;

         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT * FROM contatos_historicos WHERE 0');
         tabChecagens.Open;

         tabChecagens.Append;
         tabChecagens.FieldByName('ID').AsFloat:=CodeGenerator('contatos_historicos', 'ID');
         tabChecagens.FieldByName('CodigoContato').AsFloat:=pCodigoContato;
         if not tabAuxHistoricosData.IsNull then begin
            tabChecagens.FieldByName('Data').AsFloat:=tabAuxHistoricosData.Value;
         end;
         tabChecagens.FieldByName('CodigoDepto').AsFloat:=tabAuxHistoricosCodigoDepto.Value;
         tabChecagens.FieldByName('CodigoFuncionario').AsFloat:=tabAuxHistoricosCodigoFuncionario.Value;                  
         tabChecagens.FieldByName('Historico').AsString:=tabAuxHistoricosHistorico.Value;     
         tabChecagens.Post;
         tabChecagens.ApplyUpDates;

         tabAuxHistoricos.Next;
      end;
   finally
      dbgHistorico.DataSource:=vDataSource;
   end;
end;

procedure TfmContatos.btnHistoricoRemoverClick(Sender: TObject);
begin
   if not (tabBase.State in [dsInsert, dsEdit]) then begin
      ShowMessage('Edite o Contato para Excluir o Histórico'); 
      exit;
   end;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if tabAuxHistoricos.RecordCount > 0 then begin
         if Application.MessageBox('Deseja Realmente Excluir o Histórico desse Contato?', PChar(Application.Title), 36) = 7 then exit;
         tabAuxHistoricos.Delete; 
      end;
   end;
end;

procedure TfmContatos.btnHistoricoGravarClick(Sender: TObject);
begin
   inherited;
   if not (tabBase.State in [dsInsert, dsEdit]) then begin
      ShowMessage('Edite o Contato para Lançar um Novo Histórico');
      exit;
   end;
   if Trim(edtHistoricoData.Text) = '/  /' then begin
      ShowMessage('Obrigatório Preenchimento da Data');
      edtHistoricoData.SetFocus;
      exit;
   end;
   if Trim(edtHistoricoDepto.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Departamento');
      edtHistoricoDepto.SetFocus;
      exit;
   end;
   if Trim(edtHistoricoFuncionario.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Funcionário');
      edtHistoricoFuncionario.SetFocus;
      exit;
   end;
   if Trim(edtHistoricoHistorico.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Histórico');
      edtHistoricoHistorico.SetFocus;
      exit;
   end;
   tabAuxHistoricos.Post; 
end;

procedure TfmContatos.btnHistoricoNovoClick(Sender: TObject);
begin
   inherited;
   if not (tabBase.State in [dsInsert, dsEdit]) then begin
      ShowMessage('Edite o Contato para Lançar um Novo Histórico');
      exit;
   end;

   tabAuxHistoricos.Append;
   tabAuxHistoricosData.Value:=Date;

   try
      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT Codigo,CodigoDepto FROM funcionarios WHERE Usuario = '+QuotedStr(fmMenu.pubUsuario));
      tabChecagens.Open;
      tabAuxHistoricosCodigoFuncionario.Value:=tabChecagens.FieldByName('Codigo').AsFloat;
      tabAuxHistoricosCodigoDepto.Value:=tabChecagens.FieldByName('CodigoDepto').AsFloat;
   finally
      tabChecagens.Close;
   end;

   edtHistoricoHistorico.SetFocus;
end;

procedure TfmContatos.dbgHistoricoCellClick(Column: TColumn);
begin
   inherited;
   if Column.FieldName = 'Historico' then begin
      if tabBase.State in [dsInsert, dsEdit] then begin
         if Trim(tabAuxHistoricosHistorico.Value) <> '' then begin
            dbgHistorico.SetFocus;
            dbgHistorico.SelectedIndex:=1;
            if not Assigned (fmObservacoes) then begin
               Application.CreateForm(TfmObservacoes, fmObservacoes);
               fmObservacoes.Caption:='Histórico';
               fmObservacoes.pubApplyUpDates:=True;
               fmObservacoes.edtObservacoes.DataField:=Column.FieldName;
               fmObservacoes.edtObservacoes.DataSource:=dtsAuxHistoricos;
               fmObservacoes.ShowModal;
            end;
         end;
       end
      else begin
         if Trim(tabContatosHistoricos.FieldByName('Historico').AsString) <> '' then begin
            dbgHistorico.SetFocus;
            dbgHistorico.SelectedIndex:=1;
            if not Assigned (fmObservacoes) then begin
               Application.CreateForm(TfmObservacoes, fmObservacoes);
               fmObservacoes.Caption:='Histórico';
               fmObservacoes.pubApplyUpDates:=True;
               fmObservacoes.edtObservacoes.DataField:=Column.FieldName;
               fmObservacoes.edtObservacoes.DataSource:=dtsContatosHistoricos;
               fmObservacoes.ShowModal;
            end; 
         end; 
      end;
   end;
end;

procedure TfmContatos.dtsAuxHistoricosDataChange(Sender: TObject;
  Field: TField);
begin
   inherited; 
   if tabAuxHistoricos.State = dsInsert then begin
      btnHistoricoNovo.Enabled:=False;
      btnHistoricoGravar.Enabled:=True;
      btnHistoricoRemover.Enabled:=False;
    end
   else if tabAuxHistoricos.State = dsBrowse then begin
      btnHistoricoGravar.Enabled:=False;
      btnHistoricoRemover.Enabled:=True;
      btnHistoricoNovo.Enabled:=True;
    end
   else if tabAuxHistoricos.State = dsEdit then begin
      btnHistoricoNovo.Enabled:=False;
      btnHistoricoGravar.Enabled:=True;
      btnHistoricoRemover.Enabled:=False;
   end;
end;

procedure TfmContatos.MenuItem1Click(Sender: TObject);
begin
   inherited;
   if tabBase.State = dsEdit then begin
      if Trim(tabAuxContatosContato.Value) <> '' then begin
         edtContato.Text:=tabAuxContatosContato.Value;
         tabAuxContatos.Delete;
      end;
   end;
end;

procedure TfmContatos.MenuItem2Click(Sender: TObject);
begin
   inherited;
   if tabBase.State = dsEdit then begin
      if (Trim(tabAuxEmailsDescricao.Value) <> '') or (Trim(tabAuxEmailsEmail.Value) <> '') then begin
         edtDescricao.Text:=tabAuxEmailsDescricao.Value;
         edtEmail.Text:=tabAuxEmailsEmail.Value;
         tabAuxEmails.Delete;
      end;
   end;
end;

procedure TfmContatos.EnviarEmail2Click(Sender: TObject);
begin
   if Trim(dbgEmails.Columns[1].Field.AsString) <> '' then begin
      EnvioDeEmails(dbgEmails.Columns[1].Field.AsString);
   end; 
end;

procedure TfmContatos.Copiar1Click(Sender: TObject);
begin
   inherited;
   Clipboard.AsText:=dbgContatos.Columns[dbgContatos.SelectedIndex].Field.AsString;
end;

procedure TfmContatos.Copiar3Click(Sender: TObject); 
begin
   inherited;
   Clipboard.AsText:=dbgEmails.Columns[dbgEmails.SelectedIndex].Field.AsString;
end;

procedure TfmContatos.dbrTipoContatoClick(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then edtCnpjCpf.SetFocus;
end;

end.

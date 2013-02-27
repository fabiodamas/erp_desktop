unit uClientes;

interface  

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Menus, Buttons, ExtCtrls, StdCtrls, Mask, DBCtrls, ComCtrls,
  ToolEdit, RXDBCtrl, Grids, DBGrids, ImgList, ShellApi, Clipbrd, DBClient;

type
  TfmClientes = class(TfmFormBaseCadastro)   
    Label1: TLabel;
    Label2: TLabel;
    edtNomeFantasia: TDBEdit;
    pgcClientes: TPageControl;
    tbsGeral: TTabSheet;
    tbsEnderecos: TTabSheet;
    tbsContatosEmails: TTabSheet;
    tbsObservacoes: TTabSheet;
    tbs_compras: TTabSheet;
    tbs_financeiro: TTabSheet;
    tbsObsFinanceiro: TTabSheet;
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
    edtEmailNfeXml: TDBEdit;
    Label11: TLabel;
    edtEmailNfeDanfe: TDBEdit;
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
    dbrTipoCliente: TDBRadioGroup;
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
    edtContatoDescricao: TEdit;
    Label52: TLabel;
    edtContatoEmail: TEdit;
    Label53: TLabel;
    btnContatoAdicionar: TBitBtn;
    btnEmailAdicionar: TBitBtn;
    dbgContatos: TDBGrid;
    dbgEmails: TDBGrid;
    dbgCompras: TDBGrid;
    dbgTitulos: TDBGrid;
    edtObsFinanceiro1: TDBMemo;
    edtObsFinanceiro2: TDBMemo;
    Rtulo1: TMenuItem;
    tabPais: TZQuery;
    dtsPais: TDataSource;
    tabCidades: TZQuery;
    dtsCidades: TDataSource;
    tabChecagens: TZQuery;
    btnCopiarDeEndNormalParaEntrega: TBitBtn;
    btnCopiarEndEntregaParaCobranca: TBitBtn;
    btnCopiarEndNormalParaCobranca: TBitBtn;
    btnContatoRemover: TBitBtn;
    btnEmailRemover: TBitBtn;
    pgcObservacoes: TPageControl;
    tbsObsHistorico: TTabSheet;
    tbsObsObs: TTabSheet;
    edtObs1: TDBMemo;
    edtObs2: TDBMemo;
    Label9: TLabel;
    Label10: TLabel;
    edtHistoricoDepto: TDBLookupComboBox;
    Label54: TLabel;
    dbgHistorico: TDBGrid;
    edtHistoricoFuncionario: TDBLookupComboBox;
    Label55: TLabel;
    tabSetor: TZQuery;
    dtsSetor: TDataSource;
    tabFuncionarios: TZQuery;
    dtsFuncionarios: TDataSource;
    tabClientesGrupos: TZQuery;
    dtsClientesGrupos: TDataSource;
    tabClientesTipo: TZQuery;
    dtsClientesTipo: TDataSource;
    tabRegimeTributario: TZQuery;
    dtsRegimeTributario: TDataSource;
    tabClientesStatus: TZQuery;
    dtsClientesStatus: TDataSource;
    btnHistoricoRemover: TBitBtn;
    tabClientesContatos: TZQuery;
    dtsClientesContatos: TDataSource;
    tabClientesEmails: TZQuery;
    dtsClientesEmails: TDataSource;
    tabClientesHistoricos: TZQuery;
    dtsClientesHistoricos: TDataSource;
    tabDepto: TZQuery;
    dtsDepto: TDataSource;
    tabCompras: TZQuery;
    dtsCompras: TDataSource;
    tabTitulos: TZQuery;
    dtsTitulos: TDataSource;
    edtCodigoCliente: TEdit;
    edtSetor: TDBLookupComboBox;
    Label57: TLabel;
    popEmail: TPopupMenu;
    EnviarEmail1: TMenuItem;
    edtHistoricoData: TDBDateEdit;
    edtHistoricoHistorico: TDBMemo;
    btnHistoricoGravar: TBitBtn;
    btnHistoricoNovo: TBitBtn;
    dtsChecagens: TDataSource;
    tabAuxContatos: TClientDataSet;
    dtsAuxContatos: TDataSource;
    tabAuxContatosContato: TStringField;
    tabAuxEmails: TClientDataSet;
    dtsAuxEmails: TDataSource;
    tabAuxEmailsDescricao: TStringField;
    tabAuxEmailsEmail: TStringField;
    tabAuxHistoricos: TClientDataSet;
    dtsAuxHistoricos: TDataSource;
    tabAuxHistoricosData: TDateField;
    tabAuxHistoricosCodigoDepto: TFloatField;
    tabAuxHistoricosCodigoFuncionario: TFloatField;
    tabAuxHistoricosHistorico: TMemoField;
    tbsReferencias: TTabSheet;
    dbgReferencias: TDBGrid;
    Label56: TLabel;
    edtCodigoProduto: TEdit;
    btnRefLocalizarProduto: TBitBtn;
    edtProduto: TEdit;
    edtRefCliente: TEdit;
    btnAdicionarReferencia: TBitBtn;
    Label58: TLabel;
    tabReferenciaProdutos: TZQuery;
    dtsReferenciaProdutos: TDataSource;
    popEditarContato: TPopupMenu;
    MenuItem1: TMenuItem;
    popEditarEmail: TPopupMenu;
    MenuItem2: TMenuItem;
    btnReferenciaRemover: TBitBtn;
    N1: TMenuItem;
    EnviarEmail2: TMenuItem;
    N2: TMenuItem;
    Copiar1: TMenuItem;
    N3: TMenuItem;
    Copiar3: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnLocalizaCepClick(Sender: TObject);
    procedure btnEntregaLocalizaCepClick(Sender: TObject);
    procedure btnCobrancaLocalizaCepClick(Sender: TObject);
    procedure btnCopiarDeEndNormalParaEntregaClick(Sender: TObject);
    procedure btnCopiarEndNormalParaCobrancaClick(Sender: TObject);
    procedure btnCopiarEndEntregaParaCobrancaClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure edtEmailNfeXmlKeyPress(Sender: TObject; var Key: Char);
    procedure edtCnpjCpfExit(Sender: TObject);
    procedure edtEstadoKeyPress(Sender: TObject; var Key: Char);
    procedure btnEditarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnContatoAdicionarClick(Sender: TObject);
    procedure btnEmailAdicionarClick(Sender: TObject);
    procedure btnContatoRemoverClick(Sender: TObject);
    procedure btnEmailRemoverClick(Sender: TObject);
    procedure btnHistoricoRemoverClick(Sender: TObject);
    procedure edtLocalizarValorChange(Sender: TObject);
    procedure edtCodigoClienteKeyPress(Sender: TObject; var Key: Char);
    procedure edtCepExit(Sender: TObject);
    procedure edtEntregaCepExit(Sender: TObject);
    procedure edtCobrancaCepExit(Sender: TObject);
    procedure edtCodigoClienteKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Rtulo1Click(Sender: TObject);
    procedure edtEmailNfeXmlClick(Sender: TObject);
    procedure edtEmailNfeDanfeClick(Sender: TObject);
    procedure EnviarEmail1Click(Sender: TObject);
    procedure edtEmailNfeDanfeKeyPress(Sender: TObject; var Key: Char);
    procedure btnHistoricoGravarClick(Sender: TObject);
    procedure btnHistoricoNovoClick(Sender: TObject);
    procedure edtCidadeEnter(Sender: TObject);
    procedure edtCidadeExit(Sender: TObject);
    procedure edtEntregaCidadeEnter(Sender: TObject);
    procedure edtEntregaCidadeExit(Sender: TObject);
    procedure edtCobrancaCidadeEnter(Sender: TObject);
    procedure edtCobrancaCidadeExit(Sender: TObject);
    procedure dbgHistoricoCellClick(Column: TColumn);
    procedure edtSiteClick(Sender: TObject);
    procedure dtsAuxHistoricosDataChange(Sender: TObject; Field: TField);
    procedure edtCodigoProdutoChange(Sender: TObject);
    procedure btnRefLocalizarProdutoClick(Sender: TObject);
    procedure btnAdicionarReferenciaClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure dtsBaseDataChange(Sender: TObject; Field: TField);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure dbgReferenciasCellClick(Column: TColumn);
    procedure edtCodigoProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure btnReferenciaRemoverClick(Sender: TObject);
    procedure EnviarEmail2Click(Sender: TObject);
    procedure Copiar1Click(Sender: TObject);
    procedure Copiar3Click(Sender: TObject);
    procedure dbrTipoClienteClick(Sender: TObject);
  private
    FTyping: boolean;
    FCodigoCliente : string;
    procedure AtualizaTipoPessoa;
    procedure AtualizaCodigoCliente;
    procedure EnvioDeEmails(pEmail: string);
    procedure AcessarSite(pSite: string);
    procedure GravarContatos(pCodigoCliente: real);
    procedure GravarEmails(pCodigoCliente: real);
    procedure GravarHistoricos(pCodigoCliente: real);
  public
    procedure Novo; override;
    procedure Editar; override;
    procedure Deletar; override;
    procedure Cancelar; override;
    function Checagens: Boolean; override;
  end;

var
  fmClientes: TfmClientes;

implementation

uses uMenu, uFormBaseConfig, uConstantes, uLocalizarClientes, uFuncoes,
     rRotulosClientes, uObservacoes, uLocalizarProdutos, uEnderecos;

{$R *.dfm}

{ TfmClientes }

procedure TfmClientes.Novo; 
begin
   if Trim(edtCodigoCliente.Text) = '' then begin
      tabBase.FieldByName('CodigoCliente').AsFloat:=CodeGenerator('clientes', 'CodigoCliente');
    end
   else begin
      tabBase.FieldByName('CodigoCliente').AsFloat:=StrToFloat(edtCodigoCliente.Text);
   end;
   GravarContatos(tabBase.FieldByName('CodigoCliente').AsFloat);
   GravarEmails(tabBase.FieldByName('CodigoCliente').AsFloat);
   GravarHistoricos(tabBase.FieldByName('CodigoCliente').AsFloat);

   if tabBase.FieldByName('CodigoPais').AsString = '1058' then begin
      AtualizaEndereco(tabBase.FieldByName('Cep').AsString,
                    tabBase.FieldByName('CodigoCidade').AsString,
                    tabBase.FieldByName('Endereco').AsString,
                    tabBase.FieldByName('Bairro').AsString,
                    tabBase.FieldByName('Estado').AsString);
   end; 
end;

procedure TfmClientes.Editar;
begin
   GravarContatos(tabBase.FieldByName('CodigoCliente').AsFloat);
   GravarEmails(tabBase.FieldByName('CodigoCliente').AsFloat);
   GravarHistoricos(tabBase.FieldByName('CodigoCliente').AsFloat);

   // -- Cuidado ao atualizar Cep que não seja do Brasil - (RS) 21/09/11.
   if tabBase.FieldByName('CodigoPais').AsString = '1058' then begin
      AtualizaEndereco(tabBase.FieldByName('Cep').AsString,
                    tabBase.FieldByName('CodigoCidade').AsString,
                    tabBase.FieldByName('Endereco').AsString,
                    tabBase.FieldByName('Bairro').AsString,
                    tabBase.FieldByName('Estado').AsString);
   end;      
end;

procedure TfmClientes.Deletar;
begin
   // Clientes Contatos.
   tabChecagens.Close;
   tabChecagens.SQL.Clear;
   tabChecagens.SQL.Add('SELECT * FROM clientes_contatos WHERE CodigoCliente = '+tabBase.FieldByName('CodigoCliente').AsString);
   tabChecagens.Open;
   tabChecagens.First;
   while not tabChecagens.Eof do begin
      tabChecagens.Delete;
      tabChecagens.ApplyUpdates;
      Continue;
   end;
   // Clientes E-mails.
   tabChecagens.Close;
   tabChecagens.SQL.Clear;
   tabChecagens.SQL.Add('SELECT * FROM clientes_emails WHERE CodigoCliente = '+tabBase.FieldByName('CodigoCliente').AsString);
   tabChecagens.Open;
   tabChecagens.First;
   while not tabChecagens.Eof do begin
      tabChecagens.Delete;
      tabChecagens.ApplyUpdates;
      Continue;
   end;
   // Clientes Históricos.
   tabChecagens.Close;
   tabChecagens.SQL.Clear;
   tabChecagens.SQL.Add('SELECT * FROM clientes_historicos WHERE CodigoCliente = '+tabBase.FieldByName('CodigoCliente').AsString);
   tabChecagens.Open;
   tabChecagens.First;
   while not tabChecagens.Eof do begin
      tabChecagens.Delete;
      tabChecagens.ApplyUpdates;
      Continue;
   end;   
end;

procedure TfmClientes.Cancelar;
begin
end;

function TfmClientes.Checagens: Boolean;
begin
   Result:=False;
   if Trim(edtNomeFantasia.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Nome Fantasia');
      edtNomeFantasia.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtRazaoSocial.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Razão Social');
      edtRazaoSocial.SetFocus;
      Result:=True;
      exit;
   end;

   try
      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT POClientesEndNormal ');
      tabChecagens.SQL.Add('FROM configuracoes_proprietario ');
      tabChecagens.Open;

      if tabChecagens.FieldByName('POClientesEndNormal').AsInteger = 1 then begin
         if Trim(edtCep.Text) = '' then begin
            ShowMessage('Obrigatório Preenchimento do Cep');
            pgcClientes.ActivePage:=tbsEnderecos;
            edtCep.SetFocus;
            Result:=True;
            exit;
         end;
         if Trim(edtEndereco.Text) = '' then begin
            ShowMessage('Obrigatório Preenchimento do Endereço');
            pgcClientes.ActivePage:=tbsEnderecos;
            edtEndereco.SetFocus;
            Result:=True;
            exit;
         end;
         if Trim(edtNumero.Text) = '' then begin
            ShowMessage('Obrigatório Preenchimento do Numero');
            pgcClientes.ActivePage:=tbsEnderecos;
            edtNumero.SetFocus;
            Result:=True;
            exit;
         end;
         if Trim(edtBairro.Text) = '' then begin
            ShowMessage('Obrigatório Preenchimento do Bairro');
            pgcClientes.ActivePage:=tbsEnderecos;
            edtBairro.SetFocus;
            Result:=True;
            exit;
         end;
         if Trim(edtPais.Text) = '' then begin
            ShowMessage('Obrigatório Preenchimento do País');
            pgcClientes.ActivePage:=tbsEnderecos;
            edtPais.SetFocus;
            Result:=True;
            exit;
         end;
         if Trim(edtEstado.Text) = '' then begin
            ShowMessage('Obrigatório Preenchimento do Estado');
            pgcClientes.ActivePage:=tbsEnderecos;
            edtEstado.SetFocus;
            Result:=True;
            exit;
         end;
         if Trim(edtEstado.Text) <> 'EX' then
         begin
           if Trim(edtCidade.Text) = '' then
           begin
             ShowMessage('Obrigatório Preenchimento da Cidade');
             pgcClientes.ActivePage:=tbsEnderecos;
             edtCidade.SetFocus;
             Result:=True;
             exit;
           end;
         end;
      end;
   finally
      tabChecagens.Close;
   end;

   if tabBase.State = dsInsert then begin
      if Trim(edtCodigoCliente.Text) <> '' then begin
         if ExistsValue('CodigoCliente', 'clientes', edtCodigoCliente.Text) then begin
            ShowMessage('Código do Cliente já Existente');
            edtCodigoCliente.SetFocus;
            Result:=True;
            exit;
         end;
      end;
      if Trim(edtCnpjCpf.Text) <> '' then begin
         if ExistsValue('CpfCnpj', 'clientes', edtCnpjCpf.Text) then begin
            ShowMessage('CPF/CNPJ já Existente');
            edtCnpjCpf.SetFocus;
            Result:=True;
            exit; 
         end;
      end;
   end;
end;

procedure TfmClientes.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
   FTyping:=False;
end;

procedure TfmClientes.FormShow(Sender: TObject);
begin
   pgcClientes.ActivePageIndex:=0;

   FCodigoCliente:='';

   if Trim(fmMenu.pubTrans1) <> '' then begin
      FCodigoCliente:=fmMenu.pubTrans1; 
   end;

   tabCompras.Params.CreateParam(ftFloat, 'CodigoCliente', ptUnknown);
   tabCompras.SQL.Add('SELECT pedidos.NPedido, pedidos.Data, pedidos_produtos.CodigoProduto, pedidos_produtos.Quantidade, pedidos_produtos.Descricao AS Produto, pedidos_produtos.Valor');
   tabCompras.SQL.Add('FROM pedidos, pedidos_produtos');
   tabCompras.SQL.Add('WHERE pedidos.NPedido = pedidos_produtos.NPedido');
   tabCompras.SQL.Add('AND pedidos.CodigoCliente = :CodigoCliente');
   tabCompras.SQL.Add('AND pedidos.DataEntrega IS NOT NULL');
   tabCompras.Open;

   // "A Violência é o último refúgio do incompetente." Isaac Asimov
   // "Se o conhecimento pode criar problemas, não é através da ignorância que podemos solucioná-los." Isaac Asimov
   // "A liberdade não tem preço, a mera possibilidade de obtê-la já vale a pena." Isaac Asimov

   tabTitulos.Params.CreateParam(ftFloat, 'CodigoCliente', ptUnknown);
   tabTitulos.SQL.Add('SELECT Documento, DataEmissao, Parcela, ValorDesconto, ValorAcrescimo, ValorTotal, DataVencimento, DataPagamento, NotaFiscal');
   tabTitulos.SQL.Add('FROM titulos_receber ');
   tabTitulos.SQL.Add('WHERE CodigoConta = :CodigoCliente');
   tabTitulos.Open;

   tabClientesContatos.Params.CreateParam(ftFloat, 'CodigoCliente', ptUnknown);
   tabClientesContatos.SQL.Add('SELECT Nome AS Contato FROM clientes_contatos WHERE CodigoCliente = :CodigoCliente');
   tabClientesContatos.Open;

   tabClientesEmails.Params.CreateParam(ftFloat, 'CodigoCliente', ptUnknown);
   tabClientesEmails.SQL.Add('SELECT Descricao,Email FROM clientes_emails WHERE CodigoCliente = :CodigoCliente');
   tabClientesEmails.Open;

   tabClientesHistoricos.Params.CreateParam(ftFloat, 'CodigoCliente', ptUnknown);
   tabClientesHistoricos.SQL.Add('SELECT * FROM clientes_historicos WHERE CodigoCliente = :CodigoCliente ORDER BY Data DESC');
   tabClientesHistoricos.Open;

   tabReferenciaProdutos.Params.CreateParam(ftFloat, 'CodigoCliente', ptUnknown);
   tabReferenciaProdutos.SQL.Add('SELECT * FROM clientes_referencia_produtos WHERE CodigoCliente = :CodigoCliente');
   tabReferenciaProdutos.Open;

   tabBase.Params.CreateParam(ftFloat, 'CodigoCliente', ptUnknown);
   tabBase.SQL.Add('SELECT * FROM clientes WHERE CodigoCliente = :CodigoCliente');
   tabBase.Open;

   tabPais.SQL.Add('SELECT * FROM paises ORDER BY Pais');
   tabPais.Open;

   tabCidades.SQL.Add('SELECT * FROM cidades ORDER BY Cidade');
   tabCidades.Open;

   tabSetor.SQL.Add('SELECT * FROM setor');
   tabSetor.Open;

   tabFuncionarios.SQL.Add('SELECT * FROM funcionarios WHERE DataSaida IS NULL ORDER BY Nome');
   tabFuncionarios.Open;

   tabClientesGrupos.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('11')+' ORDER BY Descricao');
   tabClientesGrupos.Open;

   tabClientesTipo.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('12')+' ORDER BY Descricao');
   tabClientesTipo.Open;

   tabRegimeTributario.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('24')+' ORDER BY Descricao');
   tabRegimeTributario.Open;

   tabClientesStatus.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('13')+' ORDER BY Descricao');
   tabClientesStatus.Open;

   tabDepto.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('3')+' ORDER BY Descricao');
   tabDepto.Open;

   tabAuxContatos.CreateDataSet;
   tabAuxContatos.EmptyDataSet;

   tabAuxEmails.CreateDataSet;
   tabAuxEmails.EmptyDataSet;

   tabAuxHistoricos.CreateDataSet; 
   tabAuxHistoricos.EmptyDataSet;
   tabAuxHistoricos.IndexFieldNames:='Data'; 

   if Trim(FCodigoCliente) <> '' then begin
      tabBase.Close;
      tabBase.ParamByName('CodigoCliente').AsFloat:=StrToFloat(FCodigoCliente);
      tabBase.Open;
   end;

   dbgContatos.PopupMenu:=popEditarContato;
   dbgEmails.PopupMenu:=popEditarEmail;

   inherited;
end;

procedure TfmClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabBase.Close;
   tabSetor.Close; 
   tabPais.Close;
   tabCidades.Close;
   tabChecagens.Close;
   tabFuncionarios.Close;
   tabClientesGrupos.Close;
   tabClientesTipo.Close;
   tabRegimeTributario.Close;
   tabClientesContatos.Close;
   tabClientesEmails.Close;
   tabClientesStatus.Close;
   tabClientesHistoricos.Close;
   tabDepto.Close;
   tabCompras.Close;
   tabTitulos.Close;
   tabAuxContatos.Close;
   tabAuxEmails.Close;
   tabAuxHistoricos.Close;
   tabReferenciaProdutos.Close;
   //dbgContatos.PopupMenu:=nil;
   inherited; 
end;

procedure TfmClientes.AtualizaTipoPessoa;
begin
   if tabBase.State in [dsInsert, dsEdit] then begin
      if dbrTipoCliente.ItemIndex = 0 then begin
         lblCnpjCpf.Caption:='CNPJ';
         lblIeRg.Caption:='Inscrição Estadual';
       end
      else begin
         lblCnpjCpf.Caption:='CPF'; 
         lblIeRg.Caption:='RG';
      end;
    end
   else begin
      if tabBase.FieldByName('TipoCliente').AsInteger = 1 then begin
         lblCnpjCpf.Caption:='CNPJ';
         lblIeRg.Caption:='Inscrição Estadual';
       end
      else begin
         lblCnpjCpf.Caption:='CPF';
         lblIeRg.Caption:='RG';
      end;
   end;
end;

procedure TfmClientes.btnLocalizaCepClick(Sender: TObject);
var vEndereco : TEndereco;
begin
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

procedure TfmClientes.btnEntregaLocalizaCepClick(Sender: TObject);
var vEndereco : TEndereco;
begin
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

procedure TfmClientes.btnCobrancaLocalizaCepClick(Sender: TObject);
var vEndereco : TEndereco;
begin
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

procedure TfmClientes.btnCopiarDeEndNormalParaEntregaClick(Sender: TObject);
begin
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

procedure TfmClientes.btnCopiarEndNormalParaCobrancaClick(Sender: TObject);
begin
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

procedure TfmClientes.btnCopiarEndEntregaParaCobrancaClick(Sender: TObject);
begin
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

procedure TfmClientes.btnNovoClick(Sender: TObject);
begin
   inherited;

   dbgContatos.DataSource:=dtsAuxContatos;
   dbgEmails.DataSource:=dtsAuxEmails;
   dbgHistorico.DataSource:=dtsAuxHistoricos;

   edtHistoricoData.DataSource:=dtsAuxHistoricos;
   edtHistoricoDepto.DataSource:=dtsAuxHistoricos;
   edtHistoricoFuncionario.DataSource:=dtsAuxHistoricos;
   edtHistoricoHistorico.DataSource:=dtsAuxHistoricos;

   if tabBase.State = dsInsert then begin
      edtCodigoCliente.Text:='';
      tabBase.FieldByName('TipoCliente').AsInteger:=0;

      tabCompras.Close;
      tabCompras.ParamByName('CodigoCliente').AsFloat:=-1;
      tabCompras.Open;

      tabTitulos.Close;
      tabTitulos.ParamByName('CodigoCliente').AsFloat:=-1;
      tabTitulos.Open;

      tabClientesContatos.Close;
      tabClientesContatos.ParamByName('CodigoCliente').AsFloat:=-1;
      tabClientesContatos.Open;

      tabClientesEmails.Close;
      tabClientesEmails.ParamByName('CodigoCliente').AsFloat:=-1;
      tabClientesEmails.Open;

      tabClientesHistoricos.Close;
      tabClientesHistoricos.ParamByName('CodigoCliente').AsFloat:=-1;
      tabClientesHistoricos.Open;

      tabAuxContatos.EmptyDataSet;
      tabAuxEmails.EmptyDataSet;   
      tabAuxHistoricos.EmptyDataSet;

      edtNomeFantasia.SetFocus;
   end;
end;

procedure TfmClientes.edtEmailNfeXmlKeyPress(Sender: TObject;
  var Key: Char);
begin
   // Eventos Multiplos;
   Key:=LoCase(Key);
end;

procedure TfmClientes.edtCnpjCpfExit(Sender: TObject);
begin
   if tabBase.State in [dsInsert, dsEdit] then begin
      case dbrTipoCliente.ItemIndex of
         0: begin
            if Trim(edtCnpjCpf.Text) <> '' then begin
               if not CNPJ(edtCnpjCpf.Text) then begin
                  ShowMessage('CNPJ Inválido.'); 
                  edtCnpjCpf.SetFocus;
                  exit;
               end;
               edtCnpjCpf.Text:=FormatarCNPJ(edtCnpjCpf.Text);
               tabBase.FieldByName('CpfCnpj').AsString:=edtCnpjCpf.Text;
            end;
         end;
         1: begin
            if Trim(edtCnpjCpf.Text) <> '' then begin
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
      if tabBase.State = dsInsert then begin
         if Trim(edtCnpjCpf.Text) <> '' then begin
            if ExistsValue('CpfCnpj', 'clientes', edtCnpjCpf.Text) then begin
               ShowMessage('CPF/CNPJ já Existente');
               edtCnpjCpf.SetFocus;
               exit;
            end;
         end; 
      end; 
   end;
end;

procedure TfmClientes.edtEstadoKeyPress(Sender: TObject; var Key: Char);
begin
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Key = #32 then Key:=#0 else Key:=UpCase(Key);
   end; 
end;

procedure TfmClientes.btnEditarClick(Sender: TObject);
begin
   inherited;

   dbgContatos.DataSource:=dtsAuxContatos;
   dbgEmails.DataSource:=dtsAuxEmails;
   dbgHistorico.DataSource:=dtsAuxHistoricos;

   edtHistoricoData.DataSource:=dtsAuxHistoricos;
   edtHistoricoDepto.DataSource:=dtsAuxHistoricos;
   edtHistoricoFuncionario.DataSource:=dtsAuxHistoricos;
   edtHistoricoHistorico.DataSource:=dtsAuxHistoricos;
   
   edtCodigoCliente.Enabled:=False;

   // <contatos>
   tabAuxContatos.EmptyDataSet;
   
   tabClientesContatos.First;
   while not tabClientesContatos.Eof do begin

      tabAuxContatos.Append;
      tabAuxContatosContato.Value:=tabClientesContatos.FieldByName('Contato').AsString;
      tabAuxContatos.Post;

      tabClientesContatos.Next;
   end;

   tabAuxContatos.First;
   // </contatos>

   // <emails>
   tabAuxEmails.EmptyDataSet;

   tabClientesEmails.First;
   while not tabClientesEmails.Eof do begin

      tabAuxEmails.Append;
      tabAuxEmailsDescricao.Value:=tabClientesEmails.FieldByName('Descricao').AsString;
      tabAuxEmailsEmail.Value:=tabClientesEmails.FieldByName('Email').AsString;
      tabAuxEmails.Post;

      tabClientesEmails.Next;
   end;

   tabClientesEmails.First;
   // </emails>

   // <históricos>
   tabAuxHistoricos.EmptyDataSet;

   tabClientesHistoricos.First;
   while not tabClientesHistoricos.Eof do begin

      tabAuxHistoricos.Append;
      if not tabClientesHistoricos.FieldByName('Data').IsNull then begin
         tabAuxHistoricosData.Value:=tabClientesHistoricos.FieldByName('Data').AsDateTime;
      end;
      tabAuxHistoricosCodigoDepto.Value:=tabClientesHistoricos.FieldByName('CodigoDepto').AsFloat;
      tabAuxHistoricosCodigoFuncionario.Value:=tabClientesHistoricos.FieldByName('CodigoFuncionario').AsFloat;
      tabAuxHistoricosHistorico.Value:=tabClientesHistoricos.FieldByName('Historico').AsString;             
      tabAuxHistoricos.Post;

      tabClientesHistoricos.Next;
   end;

   tabClientesHistoricos.First;
   // </históricos>
end;

procedure TfmClientes.btnGravarClick(Sender: TObject);
begin
   tabChecagens.Close;
   tabChecagens.SQL.Clear;
   tabChecagens.SQL.Add('SELECT count(*) qtd FROM clientes');
   tabChecagens.Open;
   
   if tabChecagens.FieldByName('qtd').AsInteger >= 90 then
   begin
     ShowMessage('Quantidade limite de 90 clientes atingido na versão gratuita do programa. Adquira o programa para cadastrar mais clientes');

     Exit;
   end;

   inherited;

   dbgContatos.DataSource:=dtsClientesContatos;
   dbgEmails.DataSource:=dtsClientesEmails;
   dbgHistorico.DataSource:=dtsClientesHistoricos;

   edtHistoricoData.DataSource:=dtsClientesHistoricos;
   edtHistoricoDepto.DataSource:=dtsClientesHistoricos;
   edtHistoricoFuncionario.DataSource:=dtsClientesHistoricos;
   edtHistoricoHistorico.DataSource:=dtsClientesHistoricos;

   edtCodigoCliente.Enabled:=True;
end;

procedure TfmClientes.btnCancelarClick(Sender: TObject);
begin
   inherited;
   dbgContatos.DataSource:=dtsClientesContatos;
   dbgEmails.DataSource:=dtsClientesEmails;
   dbgHistorico.DataSource:=dtsClientesHistoricos;

   edtHistoricoData.DataSource:=dtsClientesHistoricos;
   edtHistoricoDepto.DataSource:=dtsClientesHistoricos;
   edtHistoricoFuncionario.DataSource:=dtsClientesHistoricos;
   edtHistoricoHistorico.DataSource:=dtsClientesHistoricos;

   edtCodigoCliente.Enabled:=True;
end;

procedure TfmClientes.btnContatoAdicionarClick(Sender: TObject);
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

procedure TfmClientes.btnEmailAdicionarClick(Sender: TObject);
begin
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtContatoEmail.Text) <> '' then begin
         tabAuxEmails.Append;
         tabAuxEmailsDescricao.Value:=edtContatoDescricao.Text;
         tabAuxEmailsEmail.Value:=edtContatoEmail.Text;
         tabAuxEmails.Post;

         edtContatoDescricao.Text:='';
         edtContatoEmail.Text:='';

         edtContatoDescricao.SetFocus; 
      end;
   end;
end;

procedure TfmClientes.btnContatoRemoverClick(Sender: TObject);
begin
   if tabBase.State in [dsInsert, dsEdit] then begin
      if tabAuxContatos.RecordCount > 0 then begin
         if Application.MessageBox('Deseja Realmente Excluir o Contato desse Cliente?', PChar(Application.Title), 36) = 7 then exit;
         tabAuxContatos.Delete;
      end;
   end;
end;

procedure TfmClientes.btnEmailRemoverClick(Sender: TObject);
begin
   if tabBase.State in [dsInsert, dsEdit] then begin
      if tabAuxEmails.RecordCount > 0 then begin
         if Application.MessageBox('Deseja Realmente Excluir o Email desse Cliente?', PChar(Application.Title), 36) = 7 then exit;
         tabAuxEmails.Delete;
      end;
   end;
end;

procedure TfmClientes.btnHistoricoRemoverClick(Sender: TObject);
begin
   if not (tabBase.State in [dsInsert, dsEdit]) then begin
      ShowMessage('Edite o Cliente para Excluir o Histórico'); 
      exit;
   end;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if tabAuxHistoricos.RecordCount > 0 then begin
         if Application.MessageBox('Deseja Realmente Excluir o Histórico desse Cliente?', PChar(Application.Title), 36) = 7 then exit;
         tabAuxHistoricos.Delete; 
      end;
   end;
end;

procedure TfmClientes.edtLocalizarValorChange(Sender: TObject);
begin
   if tabBase.State = dsBrowse then begin
      if Trim(edtCodigoCliente.Text) <> '' then begin
         tabBase.Close;
         tabBase.SQL.Clear;
         tabBase.SQL.Add('SELECT * FROM clientes WHERE CodigoCliente = '+edtCodigoCliente.Text);
         tabBase.Open;
       end
      else begin
         tabBase.Close;
         tabBase.SQL.Clear;
         tabBase.SQL.Add('SELECT * FROM clientes ORDER BY CodigoCliente DESC '+db_limite_cmd+' '+IntToStr(db_limite_registros));
         tabBase.Open;
      end;
   end;
end;

procedure TfmClientes.edtCodigoClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
   inherited;
   if not (Key in['0'..'9',Chr(8)]) then Key:=#0;
end;

procedure TfmClientes.AtualizaCodigoCliente;
begin
   if FTyping = False then begin
      if not tabBase.FieldByName('CodigoCliente').IsNull then begin
         edtCodigoCliente.Text:=FloatToStr(tabBase.FieldByName('CodigoCliente').AsFloat);
      end;
   end;
end;

procedure TfmClientes.edtCepExit(Sender: TObject);
begin
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtCep.Text) <> '' then begin
         edtCep.Text:=FormatarCEP(edtCep.Text);
         tabBase.FieldByName('Cep').AsString:=edtCep.Text; 
      end;
   end;
end;

procedure TfmClientes.edtEntregaCepExit(Sender: TObject);
begin
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtEntregaCep.Text) <> '' then begin
         edtEntregaCep.Text:=FormatarCEP(edtEntregaCep.Text);
         tabBase.FieldByName('EntregaCep').AsString:=edtEntregaCep.Text;
      end;
   end;
end;

procedure TfmClientes.edtCobrancaCepExit(Sender: TObject);
begin
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtCobrancaCep.Text) <> '' then begin
         edtCobrancaCep.Text:=FormatarCEP(edtCobrancaCep.Text);
         tabBase.FieldByName('CobrancaCep').AsString:=edtCobrancaCep.Text;
      end; 
   end;
end;

procedure TfmClientes.edtCodigoClienteKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   inherited;
   if tabBase.State = dsBrowse then begin
      if Trim(edtCodigoCliente.Text) <> '' then begin
         FTyping:=True;
         tabBase.Close;
         tabBase.ParamByName('CodigoCliente').AsFloat:=StrToFloat(edtCodigoCliente.Text);
         tabBase.Open;
         FTyping:=False;
       end
      else begin
         FTyping:=True;
         tabBase.Close;
         tabBase.ParamByName('CodigoCliente').AsFloat:=-1;
         tabBase.Open;
         FTyping:=False;
      end;
   end;
end;

procedure TfmClientes.Rtulo1Click(Sender: TObject);
var vRT: TrtRotulosClientes;
begin
   inherited;
   if Trim(edtCodigoCliente.Text) <> '' then begin
      if tabBase.State = dsBrowse then begin
         fmMenu.pubTrans1:=edtCodigoCliente.Text;
         fmMenu.pubTrans2:='';
         vRT:=TrtRotulosClientes.Create(Self);
         vRT.Show;
      end;
   end;
end;

procedure TfmClientes.EnvioDeEmails(pEmail: string);
begin
   ShellExecute(0, 'open', Pchar('mailto:'+Trim(pEmail)), nil, nil, SW_SHOWNORMAL);
end;

procedure TfmClientes.edtEmailNfeXmlClick(Sender: TObject);
begin
   inherited;
   if Trim(edtEmailNFeXml.Text) <> '' then begin
      EnvioDeEmails(edtEmailNFeXml.Text);
   end;
end;

procedure TfmClientes.edtEmailNfeDanfeClick(Sender: TObject);
begin
   inherited;
   if Trim(edtEmailNfeDanfe.Text) <> '' then begin
      EnvioDeEmails(edtEmailNfeDanfe.Text); 
   end;
end;

procedure TfmClientes.EnviarEmail1Click(Sender: TObject);
begin
   inherited;
   if Trim(dbgEmails.Columns[1].Field.AsString) <> '' then begin
      EnvioDeEmails(dbgEmails.Columns[1].Field.AsString);
   end;
end;

procedure TfmClientes.edtEmailNfeDanfeKeyPress(Sender: TObject;
  var Key: Char);
begin
   inherited;
   Key:=LoCase(Key);
end;

procedure TfmClientes.btnHistoricoGravarClick(Sender: TObject);
begin
   inherited;
   if not (tabBase.State in [dsInsert, dsEdit]) then begin
      ShowMessage('Edite o Cliente para Lançar um Novo Histórico');
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

procedure TfmClientes.btnHistoricoNovoClick(Sender: TObject);
begin
   inherited;

   if not (tabBase.State in [dsInsert, dsEdit]) then begin
      ShowMessage('Edite o Cliente para Lançar um Novo Histórico');
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

procedure TfmClientes.edtCidadeEnter(Sender: TObject);
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

procedure TfmClientes.edtCidadeExit(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      edtCidade.ListSource:=dtsCidades;
   end;
end;

procedure TfmClientes.edtEntregaCidadeEnter(Sender: TObject);
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

procedure TfmClientes.edtEntregaCidadeExit(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      edtEntregaCidade.ListSource:=dtsCidades;
   end;
end;

procedure TfmClientes.edtCobrancaCidadeEnter(Sender: TObject);
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

procedure TfmClientes.edtCobrancaCidadeExit(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      edtCobrancaCidade.ListSource:=dtsCidades; 
   end;
end;

procedure TfmClientes.dbgHistoricoCellClick(Column: TColumn);
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
         if Trim(tabClientesHistoricos.FieldByName('Historico').AsString) <> '' then begin
            dbgHistorico.SetFocus;
            dbgHistorico.SelectedIndex:=1;
            if not Assigned (fmObservacoes) then begin
               Application.CreateForm(TfmObservacoes, fmObservacoes);
               fmObservacoes.Caption:='Histórico';
               fmObservacoes.pubApplyUpDates:=True;
               fmObservacoes.edtObservacoes.DataField:=Column.FieldName;
               fmObservacoes.edtObservacoes.DataSource:=dtsClientesHistoricos;
               fmObservacoes.ShowModal;
            end;
         end;
      end;
   end;
end;

procedure TfmClientes.AcessarSite(pSite: string);
begin
   ShellExecute(0, 'open', Pchar(Trim(pSite)), nil, nil, SW_SHOWNORMAL);
end;

procedure TfmClientes.edtSiteClick(Sender: TObject);
begin
   inherited;
   if Trim(edtSite.Text) <> '' then begin
      AcessarSite(edtSite.Text);
   end;
end;

procedure TfmClientes.GravarContatos(pCodigoCliente: real);
var vDataSource: TDataSource;
begin
   tabChecagens.Close;
   tabChecagens.SQL.Clear;
   tabChecagens.SQL.Add('DELETE FROM clientes_contatos WHERE CodigoCliente = '+FloatToStr(pCodigoCliente));
   tabChecagens.ExecSQL;

   vDataSource:=dbgContatos.DataSource;
   dbgContatos.DataSource:=nil;

   try
      tabAuxContatos.First;
      while not tabAuxContatos.Eof do begin

         Application.ProcessMessages;

         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT * FROM clientes_contatos WHERE 0');
         tabChecagens.Open;

         tabChecagens.Append;
         tabChecagens.FieldByName('ID').AsFloat:=CodeGenerator('clientes_contatos', 'ID');
         tabChecagens.FieldByName('CodigoCliente').AsFloat:=pCodigoCliente;
         tabChecagens.FieldByName('Nome').AsString:=tabAuxContatosContato.Value;
         tabChecagens.Post;
         tabChecagens.ApplyUpDates; 

         tabAuxContatos.Next;
      end;
   finally
      dbgContatos.DataSource:=vDataSource;
   end;
end;

procedure TfmClientes.GravarEmails(pCodigoCliente: real);
var vDataSource: TDataSource;
begin
   tabChecagens.Close;
   tabChecagens.SQL.Clear;
   tabChecagens.SQL.Add('DELETE FROM clientes_emails WHERE CodigoCliente = '+FloatToStr(pCodigoCliente));
   tabChecagens.ExecSQL;

   vDataSource:=dbgEmails.DataSource;

   dbgEmails.DataSource:=nil;

   try
      tabAuxEmails.First;
      while not tabAuxEmails.Eof do begin

         Application.ProcessMessages;

         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT * FROM clientes_emails WHERE 0');
         tabChecagens.Open;

         tabChecagens.Append;
         tabChecagens.FieldByName('ID').AsFloat:=CodeGenerator('clientes_emails', 'ID');
         tabChecagens.FieldByName('CodigoCliente').AsFloat:=pCodigoCliente;
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

procedure TfmClientes.GravarHistoricos(pCodigoCliente: real);
var vDataSource: TDataSource;
begin
   tabChecagens.Close;
   tabChecagens.SQL.Clear;
   tabChecagens.SQL.Add('DELETE FROM clientes_historicos WHERE CodigoCliente = '+FloatToStr(pCodigoCliente));
   tabChecagens.ExecSQL;

   vDataSource:=dbgHistorico.DataSource;

   dbgHistorico.DataSource:=nil;

   try
      tabAuxHistoricos.First;
      while not tabAuxHistoricos.Eof do begin

         Application.ProcessMessages;

         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT * FROM clientes_historicos WHERE 0');
         tabChecagens.Open;

         tabChecagens.Append;
         tabChecagens.FieldByName('ID').AsFloat:=CodeGenerator('clientes_historicos', 'ID');
         tabChecagens.FieldByName('CodigoCliente').AsFloat:=pCodigoCliente;
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

procedure TfmClientes.dtsAuxHistoricosDataChange(Sender: TObject;
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

procedure TfmClientes.edtCodigoProdutoChange(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsEdit] then begin
      if Trim(edtCodigoProduto.Text) <> '' then begin
         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT NomeTecnico FROM produtos WHERE CodigoProduto = '+QuotedStr(edtCodigoProduto.Text));
            tabChecagens.Open;
            if tabChecagens.RecordCount > 0 then begin
               edtProduto.Text:=tabChecagens.FieldByName('NomeTecnico').AsString;
             end
            else begin
               edtProduto.Text:='';
            end;
         finally
            tabChecagens.Close;
         end;
       end
      else begin
         edtProduto.Text:='';
      end;
   end;
end;

procedure TfmClientes.btnRefLocalizarProdutoClick(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if not Assigned (fmLocalizarProdutos) then begin
         Application.CreateForm(TfmLocalizarProdutos, fmLocalizarProdutos);
         fmLocalizarProdutos.ShowModal;
      end;
      if Trim(fmMenu.pubTrans1) <> '' then begin
         edtCodigoProduto.Text:=fmMenu.pubTrans1;
      end;
   end;
end;

procedure TfmClientes.btnAdicionarReferenciaClick(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtCodigoProduto.Text) = '' then begin
         ShowMessage('Obrigatório Preenchimento do Produto');
         edtCodigoProduto.SetFocus;
         exit;
      end;

      if Trim(edtRefCliente.Text) = '' then begin
         ShowMessage('Obrigatório Preenchimento da Referencia no Cliente');
         edtRefCliente.SetFocus;
         exit;
      end;
      try
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT * FROM clientes_referencia_produtos ');
         tabChecagens.SQL.Add('WHERE CodigoCliente = '+tabBase.FieldByName('CodigoCliente').AsString);
         tabChecagens.SQL.Add('AND CodigoProduto = '+QuotedStr(edtCodigoProduto.Text));
         tabChecagens.SQL.Add('AND ReferenciaCliente = '+QuotedStr(edtRefCliente.Text));
         tabChecagens.Open;

         if tabChecagens.RecordCount > 0 then begin
            tabChecagens.Edit;
          end
         else begin
            tabChecagens.Append;
            tabChecagens.FieldByname('CodigoCliente').AsFloat:=tabBase.FieldByname('CodigoCliente').AsFloat;
            tabChecagens.FieldByname('CodigoProduto').AsString:=edtCodigoProduto.Text;
         end;
         tabChecagens.FieldByname('ReferenciaCliente').AsString:=edtRefCliente.Text;
         tabChecagens.Post;
         tabChecagens.ApplyUpdates;

         edtCodigoProduto.Text:='';
         edtRefCliente.Text:='';
         edtCodigoProduto.SetFocus;

         tabReferenciaProdutos.Close;
         tabReferenciaProdutos.ParamByName('CodigoCliente').AsFloat:=tabBase.FieldByname('CodigoCliente').AsFloat;
         tabReferenciaProdutos.Open;
      finally
         tabChecagens.Close;
      end;     
   end;
end;

procedure TfmClientes.btnLocalizarClick(Sender: TObject);
begin
   inherited;
   if not Assigned (fmLocalizarClientes) then begin
      Application.CreateForm(TfmLocalizarClientes, fmLocalizarClientes);
      fmLocalizarClientes.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edtCodigoCliente.Text:=fmMenu.pubTrans1;
      tabBase.Close;
      tabBase.ParamByName('CodigoCliente').Value:=edtCodigoCliente.Text;
      tabBase.Open;
   end;
end;

procedure TfmClientes.dtsBaseDataChange(Sender: TObject; Field: TField);
begin
   inherited;
   if tabBase.State = dsBrowse then begin
      tabClientesContatos.Close;
      tabClientesContatos.ParamByName('CodigoCliente').AsFloat:=tabBase.FieldByName('CodigoCliente').AsFloat;
      tabClientesContatos.Open;

      tabClientesEmails.Close;
      tabClientesEmails.ParamByName('CodigoCliente').AsFloat:=tabBase.FieldByName('CodigoCliente').AsFloat;
      tabClientesEmails.Open;

      tabClientesHistoricos.Close;
      tabClientesHistoricos.ParamByName('CodigoCliente').AsFloat:=tabBase.FieldByName('CodigoCliente').AsFloat;
      tabClientesHistoricos.Open;

      tabCompras.Close;
      tabCompras.ParamByName('CodigoCliente').AsFloat:=tabBase.FieldByName('CodigoCliente').AsFloat;
      tabCompras.Open;

      tabTitulos.Close;
      tabTitulos.ParamByName('CodigoCliente').AsFloat:=tabBase.FieldByName('CodigoCliente').AsFloat;
      tabTitulos.Open;

      tabReferenciaProdutos.Close;
      tabReferenciaProdutos.ParamByName('CodigoCliente').AsFloat:=tabBase.FieldByName('CodigoCliente').AsFloat;
      tabReferenciaProdutos.Open;

      AtualizaCodigoCliente;
   end;

   AtualizaTipoPessoa;
end;

procedure TfmClientes.MenuItem1Click(Sender: TObject);
begin
   inherited;
   if tabBase.State = dsEdit then begin
      if Trim(tabAuxContatosContato.Value) <> '' then begin
         edtContato.Text:=tabAuxContatosContato.Value;
         tabAuxContatos.Delete;
      end;
   end;
end;

procedure TfmClientes.MenuItem2Click(Sender: TObject);
begin
   inherited;
   if tabBase.State = dsEdit then begin
      if (Trim(tabAuxEmailsDescricao.Value) <> '') or (Trim(tabAuxEmailsEmail.Value) <> '') then begin
         edtContatoDescricao.Text:=tabAuxEmailsDescricao.Value;
         edtContatoEmail.Text:=tabAuxEmailsEmail.Value;
         tabAuxEmails.Delete; 
      end;
   end;
end;

procedure TfmClientes.dbgReferenciasCellClick(Column: TColumn);  
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      edtCodigoProduto.Text:=tabReferenciaProdutos.FieldByName('CodigoProduto').AsString;
      edtRefCliente.Text:=tabReferenciaProdutos.FieldByName('ReferenciaCliente').AsString;
   end;
end;

procedure TfmClientes.edtCodigoProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
   inherited;
   if Key = #32 then Key:=#0 else Key:=UpCase(Key); 
end;

procedure TfmClientes.btnReferenciaRemoverClick(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin 
      if tabReferenciaProdutos.RecordCount > 0 then begin
         if Application.MessageBox('Deseja Realmente Excluir a Referência?', PChar(Application.Title), 36) = 7 then exit;
         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT * FROM clientes_referencia_produtos ');
            tabChecagens.SQL.Add('WHERE CodigoCliente = '+tabReferenciaProdutos.FieldByName('CodigoCliente').AsString);
            tabChecagens.SQL.Add('AND CodigoProduto = '+QuotedStr(tabReferenciaProdutos.FieldByName('CodigoProduto').AsString));
            tabChecagens.SQL.Add('AND ReferenciaCliente = '+QuotedStr(tabReferenciaProdutos.FieldByName('ReferenciaCliente').AsString));
            tabChecagens.Open;
            tabChecagens.First;
            while not tabChecagens.Eof do begin
               tabChecagens.Delete;
               tabChecagens.ApplyUpdates;
               Continue;
            end;
         finally
            tabChecagens.Close;
         end;
         tabReferenciaProdutos.Close; 
         tabReferenciaProdutos.ParamByName('CodigoCliente').AsFloat:=tabBase.FieldByname('CodigoCliente').AsFloat;
         tabReferenciaProdutos.Open;
      end;
   end;
end;

procedure TfmClientes.EnviarEmail2Click(Sender: TObject);
begin
   if Trim(dbgEmails.Columns[1].Field.AsString) <> '' then begin
      EnvioDeEmails(dbgEmails.Columns[1].Field.AsString);
   end;
end;

procedure TfmClientes.Copiar1Click(Sender: TObject);
begin
   inherited;
   Clipboard.AsText:=dbgEmails.Columns[dbgEmails.SelectedIndex].Field.AsString;
end;

procedure TfmClientes.Copiar3Click(Sender: TObject);
begin
   inherited;
   Clipboard.AsText:=dbgContatos.Columns[dbgContatos.SelectedIndex].Field.AsString;
end;

procedure TfmClientes.dbrTipoClienteClick(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then edtCnpjCpf.SetFocus;
end;

end.

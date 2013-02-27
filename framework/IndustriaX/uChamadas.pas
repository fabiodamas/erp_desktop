unit uChamadas;

interface

uses 
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Menus, Buttons, ExtCtrls, StdCtrls, Mask, DBCtrls, ComCtrls,
  Grids, DBGrids, uTipos, ShellApi;

type
  TfmChamadas = class(TfmFormBaseCadastro)
    Label1: TLabel;
    Label2: TLabel;
    edtNomeFantasia: TDBEdit;
    edtFornecedorCodigo: TEdit;
    pgcChamadas: TPageControl;
    tbsGeral: TTabSheet;
    tbsEnderecos: TTabSheet;
    tbsContatos: TTabSheet;
    tbsObservacoes: TTabSheet;
    tbsCompras: TTabSheet;
    edtRazaoSocial: TDBEdit;
    Label3: TLabel;
    edtObservacoes: TDBMemo;
    dbgCompras: TDBGrid;
    edtCnpjCpf: TDBEdit;
    lblCnpjCpf: TLabel;
    edtIeRg: TDBEdit;
    lblIeRg: TLabel;
    dbrTipoFornecedor: TDBRadioGroup;
    Label4: TLabel;
    edtGrupo: TDBLookupComboBox;
    edtTipo: TDBLookupComboBox;
    Label5: TLabel;
    edtStatus: TDBLookupComboBox;
    Label6: TLabel;
    grbTelefones: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    edtTelefone1: TDBEdit;
    edtTelefone2: TDBEdit;
    edtTelefone3: TDBEdit;
    edtTelefone4: TDBEdit;
    edtFax1: TDBEdit;
    edtFax2: TDBEdit;
    edtCelular1: TDBEdit;
    edtCelular2: TDBEdit;
    edtSite: TDBEdit;
    Label7: TLabel;
    edtEmailNFeXML: TDBEdit;
    Label8: TLabel;
    grbEnderecoNormal: TGroupBox;
    Label26: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label28: TLabel;
    edtCep: TDBEdit;
    edtNumero: TDBEdit;
    edtEndereco: TDBEdit;
    btnLocalizaCep: TBitBtn;
    edtBairro: TDBEdit;
    edtComplemento: TDBEdit;
    edtPais: TDBLookupComboBox;
    edtCidade: TDBLookupComboBox;
    edtEstado: TDBComboBox;
    grbEnderecoDeposito: TGroupBox;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    edtDepositoCep: TDBEdit;
    edtDepositoNumero: TDBEdit;
    edtDepositoEndereco: TDBEdit;
    btnDepositoLocalizaCep: TBitBtn;
    edtDepositoBairro: TDBEdit;
    edtDepositoComplemento: TDBEdit;
    edtDepositoPais: TDBLookupComboBox;
    edtDepositoCidade: TDBLookupComboBox;
    edtDepositoEstado: TDBComboBox;
    btnCopiarDeEndNormalParaDeposito: TBitBtn;
    grbEnderecoCorrespondencia: TGroupBox;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    edtCorrespondenciaCep: TDBEdit;
    edtCorrespondenciaNumero: TDBEdit;
    edtCorrespondenciaEndereco: TDBEdit;
    btnCorrespondenciaLocalizaCep: TBitBtn;
    edtCorrespondenciaBairro: TDBEdit;
    edtCorrespondenciaComplemento: TDBEdit;
    edtCorrespondenciaPais: TDBLookupComboBox;
    edtCorrespondenciaCidade: TDBLookupComboBox;
    edtCorrespondenciaEstado: TDBComboBox;
    btnCopiarEndDepositoParaCorrespondencia: TBitBtn;
    btnCopiarEndNormalParaCorrespondencia: TBitBtn;
    dbgEmails: TDBGrid;
    Rtulo1: TMenuItem;
    tabGrupos: TZQuery;
    dtsGrupos: TDataSource;
    tabTipos: TZQuery;
    dtsTipos: TDataSource;
    tabStatus: TZQuery;
    dtsStatus: TDataSource;
    tabPaises: TZQuery;
    dtsPaises: TDataSource;
    edtEmailNFeDanfe: TDBEdit;
    Label9: TLabel;
    tabChecagens: TZQuery;
    dtsChecagens: TDataSource;
    tabCidades: TZQuery;
    dtsCidades: TDataSource;
    tabFornecedoresContatos: TZQuery;
    dtsFornecedoresContatos: TDataSource;
    tabFornecedoresEmails: TZQuery;
    dtsFornecedoresEmails: TDataSource;
    tabCompras: TZQuery;
    dtsCompras: TDataSource;
    popEmail: TPopupMenu;
    EnviarEmail1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure edtCnpjCpfExit(Sender: TObject);
    procedure dtsBaseDataChange(Sender: TObject; Field: TField);
    procedure edtCepExit(Sender: TObject);
    procedure edtDepositoCepExit(Sender: TObject);
    procedure edtCorrespondenciaCepExit(Sender: TObject);
    procedure btnLocalizaCepClick(Sender: TObject);
    procedure btnDepositoLocalizaCepClick(Sender: TObject);
    procedure btnCorrespondenciaLocalizaCepClick(Sender: TObject);
    procedure edtFornecedorCodigoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnCopiarDeEndNormalParaDepositoClick(Sender: TObject);
    procedure btnCopiarEndNormalParaCorrespondenciaClick(Sender: TObject);
    procedure btnCopiarEndDepositoParaCorrespondenciaClick(
      Sender: TObject);
    procedure btnContatoAdicionarClick(Sender: TObject);
    procedure btnEmailAdicionarClick(Sender: TObject);
    procedure btnContatoRemoverClick(Sender: TObject);
    procedure btnEmailRemoverClick(Sender: TObject);
    procedure Rtulo1Click(Sender: TObject);
    procedure edtFornecedorCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edtEmailNFeXMLClick(Sender: TObject);
    procedure edtSiteClick(Sender: TObject);
    procedure edtEmailNFeDanfeClick(Sender: TObject);
    procedure EnviarEmail1Click(Sender: TObject);
    procedure dbrTipoFornecedorClick(Sender: TObject);
  private
    FTyping : Boolean;
    procedure AtualizaCodigoFornecedor;
    procedure AtualizaCnpjCpf;
    procedure EnvioDeEmails(pEmail: string);
    procedure AcessarSite(pSite: string); 
  public
    procedure Novo; override;
    procedure Editar; override;
    procedure Deletar; override;
    procedure Cancelar; override;
    function Checagens: Boolean; override;
  end;

var
  fmChamadas: TfmChamadas;

implementation

uses uFormBaseConfig, uConstantes, uMenu, uFuncoes, uLocalizarGenerico,
     rRotulosFornecedor, uEnderecos;

{$R *.dfm}

{ TfmFornecedores }

procedure TfmChamadas.Editar;
begin
end;

procedure TfmChamadas.Cancelar;
begin
end;

function TfmChamadas.Checagens: Boolean;
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
   if tabBase.State = dsInsert then begin
      if Trim(edtFornecedorCodigo.Text) <> '' then begin
         if ExistsValue('CodigoFornecedor', 'fornecedores', edtFornecedorCodigo.Text) then begin
            ShowMessage('Código do Fornecedor já Existente');
            edtFornecedorCodigo.SetFocus;
            Result:=True;
            exit;
         end;
      end;
      if Trim(edtCnpjCpf.Text) <> '' then begin
         if ExistsValue('CpfCnpj', 'fornecedores', edtCnpjCpf.Text) then begin
            ShowMessage('CPF/CNPJ já Existente');
            edtCnpjCpf.SetFocus;
            Result:=True;
            exit;
         end;
      end;
   end;
end;

procedure TfmChamadas.Deletar;
begin
end;

procedure TfmChamadas.Novo;
begin 
   if Trim(edtFornecedorCodigo.Text) = '' then begin
      tabBase.FieldByName('CodigoFornecedor').AsFloat:=CodeGenerator('fornecedores', 'CodigoFornecedor');
    end
   else begin
      tabBase.FieldByName('CodigoFornecedor').AsFloat:=StrToFloat(edtFornecedorCodigo.Text);
   end;
end;

procedure TfmChamadas.FormCreate(Sender: TObject);
begin
   inherited;
   FTyping:=False; 
   SetFormStyle(fsMDIChild);    
end;

procedure TfmChamadas.FormShow(Sender: TObject);
begin
   inherited;
   pgcFornecedores.ActivePageIndex:=0; 

   tabCompras.Params.CreateParam(ftFloat, 'CodigoFornecedor', ptUnknown);
   tabCompras.SQL.Add('SELECT ultimas_compras.DataCompra, ultimas_compras.Documento, ');
   tabCompras.SQL.Add('ultimas_compras.CodigoProduto, produtos.NomeTecnico AS Produto, ');
   tabCompras.SQL.Add('ultimas_compras.Quantidade AS Qtd, ultimas_compras.ValorCompra AS Valor, ');
   tabCompras.SQL.Add('ultimas_compras.ValorCompra*ultimas_compras.Quantidade AS Total');
   tabCompras.SQL.Add('FROM ultimas_compras');
   tabCompras.SQL.Add('LEFT JOIN produtos ON ultimas_compras.CodigoProduto = produtos.CodigoProduto');
   tabCompras.SQL.Add('WHERE ultimas_compras.CodigoFornecedor = :CodigoFornecedor');
   tabCompras.SQL.Add('GROUP BY ultimas_compras.CodigoProduto');
   tabCompras.Open;

   tabFornecedoresContatos.Params.CreateParam(ftFloat, 'CodigoFornecedor', ptUnknown);
   tabFornecedoresContatos.SQL.Add('SELECT Nome FROM fornecedores_contatos WHERE CodigoFornecedor = :CodigoFornecedor');
   tabFornecedoresContatos.Open;

   tabFornecedoresEmails.Params.CreateParam(ftFloat, 'CodigoFornecedor', ptUnknown);
   tabFornecedoresEmails.SQL.Add('SELECT Descricao,Email FROM fornecedores_emails WHERE CodigoFornecedor = :CodigoFornecedor');
   tabFornecedoresEmails.Open;  

   tabBase.Params.CreateParam(ftFloat, 'CodigoFornecedor', ptUnknown);
   tabBase.SQL.Add('SELECT * FROM fornecedores WHERE CodigoFornecedor =:CodigoFornecedor');
   tabBase.Open;

   tabGrupos.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('11')+' ORDER BY Descricao');
   tabGrupos.Open;

   tabTipos.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('12')+' ORDER BY Descricao');
   tabTipos.Open;

   tabStatus.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('13')+' ORDER BY Descricao');
   tabStatus.Open;

   tabPaises.SQL.Add('SELECT * FROM paises ORDER BY Pais');
   tabPaises.Open;

   tabCidades.SQL.Add('SELECT * FROM cidades ORDER BY Cidade');
   tabCidades.Open;
end;

procedure TfmChamadas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabBase.Close;
   tabGrupos.Close;
   tabTipos.Close;
   tabStatus.Close;
   tabPaises.Close;
   tabCidades.Close;
   tabFornecedoresEmails.Close;
   tabFornecedoresContatos.Close;
   tabCompras.Close;
   inherited;
end;

procedure TfmChamadas.AtualizaCodigoFornecedor;
begin
   if FTyping = False then begin
      if not tabBase.FieldByName('CodigoFornecedor').IsNull then begin
         edtFornecedorCodigo.Text:=FloatToStr(tabBase.FieldByName('CodigoFornecedor').AsFloat);
      end;
   end;
end;

procedure TfmChamadas.btnNovoClick(Sender: TObject);
begin
   inherited;

   tabFornecedoresContatos.Close;
   tabFornecedoresContatos.ParamByName('CodigoFornecedor').AsFloat:=-1;
   tabFornecedoresContatos.Open;

   tabFornecedoresEmails.Close;
   tabFornecedoresEmails.ParamByName('CodigoFornecedor').AsFloat:=-1;
   tabFornecedoresEmails.Open;

   tabCompras.Close;
   tabCompras.ParamByName('CodigoFornecedor').AsFloat:=-1;
   tabCompras.Open;

   edtFornecedorCodigo.Text:='';
   tabBase.FieldByName('TipoFornecedor').AsInteger:=1;
   edtNomeFantasia.SetFocus;
end;

procedure TfmChamadas.edtCnpjCpfExit(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      case dbrTipoFornecedor.ItemIndex of
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
   end;
end;

procedure TfmChamadas.dtsBaseDataChange(Sender: TObject;
  Field: TField);
begin
   inherited;
   if tabBase.State = dsBrowse then begin
      AtualizaCodigoFornecedor;

      tabFornecedoresContatos.Close;
      tabFornecedoresContatos.ParamByName('CodigoFornecedor').AsFloat:=tabBase.FieldByName('CodigoFornecedor').AsFloat;
      tabFornecedoresContatos.Open;

      tabFornecedoresEmails.Close;
      tabFornecedoresEmails.ParamByName('CodigoFornecedor').AsFloat:=tabBase.FieldByName('CodigoFornecedor').AsFloat;
      tabFornecedoresEmails.Open;

      tabCompras.Close;
      tabCompras.ParamByName('CodigoFornecedor').AsFloat:=tabBase.FieldByName('CodigoFornecedor').AsFloat;
      tabCompras.Open; 
   end;
   AtualizaCnpjCpf;
end;

procedure TfmChamadas.edtCepExit(Sender: TObject);
begin
  inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtCep.Text) <> '' then begin
         edtCep.Text:=FormatarCEP(edtCep.Text);
         tabBase.FieldByName('Cep').AsString:=edtCep.Text;
      end;
   end;
end;

procedure TfmChamadas.edtDepositoCepExit(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtDepositoCep.Text) <> '' then begin
         edtDepositoCep.Text:=FormatarCEP(edtDepositoCep.Text);
         tabBase.FieldByName('DepositoCep').AsString:=edtDepositoCep.Text;
      end;
   end;
end;

procedure TfmChamadas.edtCorrespondenciaCepExit(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtCorrespondenciaCep.Text) <> '' then begin
         edtCorrespondenciaCep.Text:=FormatarCEP(edtCorrespondenciaCep.Text);
         tabBase.FieldByName('CorrespoCep').AsString:=edtCorrespondenciaCep.Text;
      end; 
   end;
end;

procedure TfmChamadas.btnLocalizaCepClick(Sender: TObject);
var vEndereco: TEndereco;
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtCep.Text) <> '' then begin
         vEndereco:=LocalizarCep(edtcep.Text);
         tabBase.FieldByName('Endereco').AsString:=vEndereco.Endereco;
         tabBase.FieldByName('Bairro').AsString:=vEndereco.Bairro;
         tabBase.FieldByName('CodigoPais').AsString:=vEndereco.CodigoPais;
         tabBase.FieldByName('Estado').AsString:=vEndereco.Estado;
         tabBase.FieldByName('CodigoCidade').AsString:=vEndereco.CodigoCidade;
      end;
   end;
end;

procedure TfmChamadas.btnDepositoLocalizaCepClick(Sender: TObject);
var vEndereco: TEndereco;
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtDepositoCep.Text) <> '' then begin
         vEndereco:=LocalizarCep(edtDepositoCep.Text);
         tabBase.FieldByName('DepositoEndereco').AsString:=vEndereco.Endereco;
         tabBase.FieldByName('DepositoBairro').AsString:=vEndereco.Bairro;
         tabBase.FieldByName('DepositoCodigoPais').AsString:=vEndereco.CodigoPais;
         tabBase.FieldByName('DepositoEstado').AsString:=vEndereco.Estado;
         tabBase.FieldByName('DepositoCodigoCidade').AsString:=vEndereco.CodigoCidade; 
      end;
   end;
end;

procedure TfmChamadas.btnCorrespondenciaLocalizaCepClick(Sender: TObject);
var vEndereco: TEndereco;
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtCorrespondenciaCep.Text) <> '' then begin
         vEndereco:=LocalizarCep(edtCorrespondenciaCep.Text);
         tabBase.FieldByName('CorrespoEndereco').AsString:=vEndereco.Endereco;
         tabBase.FieldByName('CorrespoBairro').AsString:=vEndereco.Bairro;
         tabBase.FieldByName('CorrespoCodigoPais').AsString:=vEndereco.CodigoPais;
         tabBase.FieldByName('CorrespoEstado').AsString:=vEndereco.Estado;
         tabBase.FieldByName('CorrespoCodigoCidade').AsString:=vEndereco.CodigoCidade;
      end; 
   end;
end;

procedure TfmChamadas.edtFornecedorCodigoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   inherited;
   if tabBase.State = dsBrowse then begin
      if Trim(edtFornecedorCodigo.Text) <> '' then begin
         FTyping:=True;
         tabBase.Close;
	       tabBase.ParamByName('CodigoFornecedor').AsFloat:=StrToFloat(edtFornecedorCodigo.Text);
         tabBase.Open;
         FTyping:=False;
       end
      else begin
         FTyping:=True;
         tabBase.Close;
	       tabBase.ParamByName('CodigoFornecedor').AsFloat:=-1;
         tabBase.Open;
         FTyping:=False;
	    end;
   end;
end;

procedure TfmChamadas.btnLocalizarClick(Sender: TObject);
var vParams: TParametrosLocalizar;
begin
   vParams.Table:='fornecedores';
   vParams.KeyField:='CodigoFornecedor';
   vParams.Field1:='NomeFantasia';
   if not Assigned (fmLocalizarGenerico) then begin
      Application.CreateForm(TfmLocalizarGenerico, fmLocalizarGenerico);
      fmLocalizarGenerico.LoadParams(vParams);
      fmLocalizarGenerico.ShowModal;
   end;   
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edtFornecedorCodigo.Text:=fmMenu.pubTrans1;
      tabBase.Close;  
      tabBase.ParamByName('CodigoFornecedor').Value:=edtFornecedorCodigo.Text;
      tabBase.Open; 
   end;
end;

procedure TfmChamadas.AtualizaCnpjCpf;
begin
   if tabBase.State in [dsInsert, dsEdit] then begin
      if dbrTipoFornecedor.ItemIndex = 0 then begin
         lblCnpjCpf.Caption:='CNPJ';
         lblIeRg.Caption:='Inscrição Estadual';
       end
      else begin
         lblCnpjCpf.Caption:='CPF'; 
         lblIeRg.Caption:='RG';
      end;
    end
   else begin
      if tabBase.FieldByName('TipoFornecedor').AsInteger = 1 then begin
         lblCnpjCpf.Caption:='CNPJ';
         lblIeRg.Caption:='Inscrição Estadual';
       end
      else begin
         lblCnpjCpf.Caption:='CPF';
         lblIeRg.Caption:='RG';
      end;
   end;
end;

procedure TfmChamadas.btnCopiarDeEndNormalParaDepositoClick(
  Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      tabBase.FieldByName('DepositoCep').AsString:=tabBase.FieldByName('Cep').AsString;
      tabBase.FieldByName('DepositoEndereco').AsString:=tabBase.FieldByName('Endereco').AsString;
      tabBase.FieldByName('DepositoNumero').AsString:=tabBase.FieldByName('Numero').AsString;
      tabBase.FieldByName('DepositoBairro').AsString:=tabBase.FieldByName('Bairro').AsString;
      tabBase.FieldByName('DepositoComplemento').AsString:=tabBase.FieldByName('Complemento').AsString;
      tabBase.FieldByName('DepositoCodigoPais').AsString:=tabBase.FieldByName('CodigoPais').AsString;
      tabBase.FieldByName('DepositoEstado').AsString:=tabBase.FieldByName('Estado').AsString;
      tabBase.FieldByName('DepositoCodigoCidade').AsString:=tabBase.FieldByName('CodigoCidade').AsString;
   end;
end;

procedure TfmChamadas.btnCopiarEndNormalParaCorrespondenciaClick(
  Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      tabBase.FieldByName('CorrespoCep').AsString:=tabBase.FieldByName('Cep').AsString;
      tabBase.FieldByName('CorrespoEndereco').AsString:=tabBase.FieldByName('Endereco').AsString;
      tabBase.FieldByName('CorrespoNumero').AsString:=tabBase.FieldByName('Numero').AsString;
      tabBase.FieldByName('CorrespoBairro').AsString:=tabBase.FieldByName('Bairro').AsString;
      tabBase.FieldByName('CorrespoComplemento').AsString:=tabBase.FieldByName('Complemento').AsString;
      tabBase.FieldByName('CorrespoCodigoPais').AsString:=tabBase.FieldByName('CodigoPais').AsString;
      tabBase.FieldByName('CorrespoEstado').AsString:=tabBase.FieldByName('Estado').AsString;
      tabBase.FieldByName('CorrespoCodigoCidade').AsString:=tabBase.FieldByName('CodigoCidade').AsString;
   end;
end;

procedure TfmChamadas.btnCopiarEndDepositoParaCorrespondenciaClick(
  Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      tabBase.FieldByName('CorrespoCep').AsString:=tabBase.FieldByName('DepositoCep').AsString;
      tabBase.FieldByName('CorrespoEndereco').AsString:=tabBase.FieldByName('DepositoEndereco').AsString;
      tabBase.FieldByName('CorrespoNumero').AsString:=tabBase.FieldByName('DepositoNumero').AsString;
      tabBase.FieldByName('CorrespoBairro').AsString:=tabBase.FieldByName('DepositoBairro').AsString;
      tabBase.FieldByName('CorrespoComplemento').AsString:=tabBase.FieldByName('DepositoComplemento').AsString;
      tabBase.FieldByName('CorrespoCodigoPais').AsString:=tabBase.FieldByName('DepositoCodigoPais').AsString;
      tabBase.FieldByName('CorrespoEstado').AsString:=tabBase.FieldByName('DepositoEstado').AsString;
      tabBase.FieldByName('CorrespoCodigoCidade').AsString:=tabBase.FieldByName('DepositoCodigoCidade').AsString;
   end;
end;

procedure TfmChamadas.btnContatoAdicionarClick(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtContato.Text) <> '' then begin
         if not tabBase.FieldByName('CodigoFornecedor').IsNull then begin
            try
               tabChecagens.Close;
               tabChecagens.SQL.Clear;
               tabChecagens.SQL.Add('SELECT * FROM fornecedores_contatos WHERE 0');
               tabChecagens.Open;

               tabChecagens.Append;
               tabChecagens.FieldByName('ID').AsFloat:=CodeGenerator('fornecedores_contatos', 'ID');
               tabChecagens.FieldByName('CodigoFornecedor').AsFloat:=tabBase.FieldByName('CodigoFornecedor').AsFloat;
               tabChecagens.FieldByName('Nome').AsString:=edtContato.Text;
               tabChecagens.Post;
               tabChecagens.ApplyUpDates;

               tabFornecedoresContatos.Close;
               tabFornecedoresContatos.ParamByName('CodigoFornecedor').Value:=tabBase.FieldByName('CodigoFornecedor').Value;
               tabFornecedoresContatos.Open;

               edtContato.Text:='';
            finally
               tabChecagens.Close;
            end;
          end
         else begin
            ShowMessage('Obrigatório Preenchimento do Código do Fornecedor'); 
         end;
      end;
   end; 
end;

procedure TfmChamadas.btnEmailAdicionarClick(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtEmail.Text) <> '' then begin
         if not tabBase.FieldByName('CodigoFornecedor').IsNull then begin
            try 
               tabChecagens.Close;
               tabChecagens.SQL.Clear;
               tabChecagens.SQL.Add('SELECT * FROM fornecedores_emails WHERE 0');
               tabChecagens.Open;

               tabChecagens.Append;
               tabChecagens.FieldByName('ID').AsFloat:=CodeGenerator('fornecedores_emails', 'ID');
               tabChecagens.FieldByName('CodigoFornecedor').AsFloat:=tabBase.FieldByName('CodigoFornecedor').AsFloat;
               tabChecagens.FieldByName('Descricao').AsString:=edtDescricao.Text;
               tabChecagens.FieldByName('Email').AsString:=edtEmail.Text;
               tabChecagens.Post;
               tabChecagens.ApplyUpDates;

               tabFornecedoresEmails.Close;
               tabFornecedoresEmails.ParamByName('CodigoFornecedor').Value:=tabBase.FieldByName('CodigoFornecedor').Value;
               tabFornecedoresEmails.Open;

               edtDescricao.Text:='';
               edtEmail.Text:='';
            finally
               tabChecagens.Close;
            end;
          end
         else begin
            ShowMessage('Obrigatório Preenchimento do Código do Fornecedor'); 
         end;
      end;
   end;
end;

procedure TfmChamadas.btnContatoRemoverClick(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if tabFornecedoresContatos.RecordCount > 0 then begin
         if Application.MessageBox('Deseja Realmente Excluir o Contato desse Fornecedor?', PChar(Application.Title), 36) = 7 then exit;
         tabFornecedoresContatos.Delete;
         tabFornecedoresContatos.ApplyUpdates;
      end;
   end;
end;

procedure TfmChamadas.btnEmailRemoverClick(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if tabFornecedoresEmails.RecordCount > 0 then begin
         if Application.MessageBox('Deseja Realmente Excluir o Email desse Fornecedor?', PChar(Application.Title), 36) = 7 then exit;
         tabFornecedoresEmails.Delete;
         tabFornecedoresEmails.ApplyUpdates;
      end;
   end;
end;

procedure TfmChamadas.Rtulo1Click(Sender: TObject);
var vRT: TrtRotulosFornecedor;
begin
   inherited;
   if Trim(edtFornecedorCodigo.Text) <> '' then begin
      if tabBase.State = dsBrowse then begin
         fmMenu.pubTrans1:=edtFornecedorCodigo.Text;
         vRT:=TrtRotulosFornecedor.Create(Self);
         vRT.Show;
      end;
   end;
end;

procedure TfmChamadas.edtFornecedorCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
   inherited;
   if not (Key in['0'..'9',Chr(8)]) then Key:=#0;
end;

procedure TfmChamadas.edtEmailNFeXMLClick(Sender: TObject);
begin
   inherited;
   if Trim(edtEmailNFeXml.Text) <> '' then begin
      EnvioDeEmails(edtEmailNFeXml.Text);
   end;
end;

procedure TfmChamadas.EnvioDeEmails(pEmail: string);
begin
   ShellExecute(0, 'open', Pchar('mailto:'+Trim(pEmail)), nil, nil, SW_SHOWNORMAL);
end;

procedure TfmChamadas.AcessarSite(pSite: string);
begin
   ShellExecute(0, 'open', Pchar(Trim(pSite)), nil, nil, SW_SHOWNORMAL);
end;

procedure TfmChamadas.edtSiteClick(Sender: TObject);
begin
   inherited;
   if Trim(edtSite.Text) <> '' then begin
      AcessarSite(edtSite.Text);
   end;
end;

procedure TfmChamadas.edtEmailNFeDanfeClick(Sender: TObject);
begin
   inherited;
   if Trim(edtEmailNFeDanfe.Text) <> '' then begin
      EnvioDeEmails(edtEmailNFeDanfe.Text);
   end;
end;

procedure TfmChamadas.EnviarEmail1Click(Sender: TObject);
begin
   inherited;
   if Trim(dbgEmails.Columns[1].Field.AsString) <> '' then begin
      EnvioDeEmails(dbgEmails.Columns[1].Field.AsString);
   end;
end;

procedure TfmChamadas.dbrTipoFornecedorClick(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then edtCnpjCpf.SetFocus;
end;

end.

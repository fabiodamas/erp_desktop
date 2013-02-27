unit uEmpresas;

interface 

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Menus, Buttons, ExtCtrls, StdCtrls, Mask, DBCtrls, ComCtrls,
  ToolEdit, RXDBCtrl, Grids, DBGrids, ImgList;

type
  TfmEmpresas = class(TfmFormBaseCadastro)
    Label1: TLabel;
    Label2: TLabel;
    edtNomeFantasia: TDBEdit;
    edtCodigoEmpresa: TEdit;
    pgcEmpresas: TPageControl;
    tbsGeral: TTabSheet;
    edtRazaoSocial: TDBEdit;
    Label3: TLabel;
    edtCnpj: TDBEdit;
    Label9: TLabel;
    edtIe: TDBEdit;
    Label10: TLabel;
    edtSite: TDBEdit;
    Label13: TLabel;
    tabPais: TZQuery;
    dtsPais: TDataSource;
    tabCidades: TZQuery;
    dtsCidades: TDataSource;
    edtEmail: TDBEdit;
    Label4: TLabel;
    Label26: TLabel;
    edtCep: TDBEdit;
    btnLocalizaCep: TBitBtn;
    edtEndereco: TDBEdit;
    Label29: TLabel;
    Label27: TLabel;
    edtNumero: TDBEdit;
    edtBairro: TDBEdit;
    Label31: TLabel;
    Label32: TLabel;
    edtComplemento: TDBEdit;
    edtCidade: TDBLookupComboBox;
    Label34: TLabel;
    edtEstado: TDBComboBox;
    Label28: TLabel;
    edtPais: TDBLookupComboBox;
    Label33: TLabel;
    edtTelefone: TDBEdit;
    Label5: TLabel;
    edtFax: TDBEdit;
    Label6: TLabel;
    edtIm: TDBEdit;
    Label7: TLabel;
    edtCnaeFiscal: TDBEdit;
    Label8: TLabel;
    tbsTributos: TTabSheet;
    dbrCRT: TDBRadioGroup;
    dbrPis: TDBRadioGroup;
    dbrCofins: TDBRadioGroup;
    tabChecagens: TZQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure dtsBaseDataChange(Sender: TObject; Field: TField);
    procedure btnEditarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnLocalizaCepClick(Sender: TObject);
    procedure edtCepExit(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure edtCodigoEmpresaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCnpjExit(Sender: TObject);
    procedure edtCodigoEmpresaKeyPress(Sender: TObject; var Key: Char);
  private
    FTyping : Boolean;
    procedure AtualizaCodigo;
  public
    procedure Novo; override;
    procedure Editar; override;
    procedure Deletar; override;
    procedure Cancelar; override;
    function Checagens: Boolean; override;
  end;

var
  fmEmpresas: TfmEmpresas;

implementation

uses uMenu, uFormBaseConfig, uConstantes, uFuncoes, uLocalizarGenerico, uTipos,
  uEnderecos;

{$R *.dfm}

{ Tfrm_clientes }

procedure TfmEmpresas.Novo;
begin
   if Trim(edtCodigoEmpresa.Text) = '' then begin
      tabBase.FieldByName('CodigoEmpresa').AsFloat:=CodeGenerator('empresas', 'CodigoEmpresa');
    end
   else begin
      tabBase.FieldByName('CodigoEmpresa').AsFloat:=StrToFloat(edtCodigoEmpresa.Text);
   end;
end;

procedure TfmEmpresas.Editar;
begin
end;

procedure TfmEmpresas.Deletar;
begin
end;

procedure TfmEmpresas.Cancelar;
begin
end;

function TfmEmpresas.Checagens: Boolean;
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
      pgcEmpresas.ActivePage:=tbsGeral;
      edtRazaoSocial.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtCodigoEmpresa.Text) <> '' then begin
      if tabBase.State = dsInsert then begin
         if ExistsValue('CodigoEmpresa', 'empresas', edtCodigoEmpresa.Text) then begin
            ShowMessage('Código da Empresa já Existente');
            Result:=True; 
            exit;
         end;
      end;
   end;
end;

procedure TfmEmpresas.FormCreate(Sender: TObject);
begin
   inherited;
   FTyping:=False;
   SetFormStyle(fsMDIChild);
end;

procedure TfmEmpresas.FormShow(Sender: TObject);
begin
   pgcEmpresas.ActivePageIndex:=0;

   tabBase.Params.CreateParam(ftFloat, 'CodigoEmpresa', ptUnknown);
   tabBase.SQL.Add('SELECT * FROM empresas WHERE CodigoEmpresa = :CodigoEmpresa');
   tabBase.Open;

   tabPais.SQL.Add('SELECT * FROM paises ORDER BY Pais');
   tabPais.Open;

   tabCidades.SQL.Add('SELECT * FROM cidades ORDER BY Cidade');
   tabCidades.Open;

   inherited;
end;

procedure TfmEmpresas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabBase.Close;
   tabPais.Close;
   tabCidades.Close;
   inherited;
end;

procedure TfmEmpresas.btnNovoClick(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert] then begin
      edtCodigoEmpresa.Text:='';
      edtNomeFantasia.SetFocus;
   end;
end;

procedure TfmEmpresas.dtsBaseDataChange(Sender: TObject; Field: TField);
begin
   if tabBase.State = dsBrowse then begin
      AtualizaCodigo;
   end;
end;

procedure TfmEmpresas.btnEditarClick(Sender: TObject);
begin
   inherited;
   edtCodigoEmpresa.Enabled:=False;
end;

procedure TfmEmpresas.btnGravarClick(Sender: TObject);
begin
   inherited;
   edtCodigoEmpresa.Enabled:=True;
end;

procedure TfmEmpresas.btnCancelarClick(Sender: TObject);
begin
   inherited;
   edtCodigoEmpresa.Enabled:=True;
end;

procedure TfmEmpresas.btnLocalizaCepClick(Sender: TObject);
var vEndereco: TEndereco;
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

procedure TfmEmpresas.edtCepExit(Sender: TObject);
begin
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtCep.Text) <> '' then begin
         edtCep.Text:=FormatarCEP(edtCep.Text);
         tabBase.FieldByName('Cep').AsString:=edtCep.Text;
      end;
   end;
end;

procedure TfmEmpresas.btnLocalizarClick(Sender: TObject);
var vParams: TParametrosLocalizar;
begin
   vParams.Table:='empresas'; 
   vParams.KeyField:='CodigoEmpresa';
   vParams.Field1:='NomeFantasia';
   if not Assigned (fmLocalizarGenerico) then begin
      Application.CreateForm(TfmLocalizarGenerico, fmLocalizarGenerico);
      fmLocalizarGenerico.LoadParams(vParams);
      fmLocalizarGenerico.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edtCodigoEmpresa.Text:=fmMenu.pubTrans1;
      tabBase.Close;
      tabBase.ParamByName('CodigoEmpresa').Value:=edtCodigoEmpresa.Text;
      tabBase.Open;
   end;
end;

procedure TfmEmpresas.edtCodigoEmpresaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   inherited;
   if tabBase.State = dsBrowse then begin
      if Trim(edtCodigoEmpresa.Text) <> '' then begin
         FTyping:=True;
         tabBase.Close;
         tabBase.ParamByName('CodigoEmpresa').AsFloat:=StrToFloat(edtCodigoEmpresa.Text);
         tabBase.Open;
         FTyping:=False;
       end
      else begin
         FTyping:=True;
         tabBase.Close;
         tabBase.ParamByName('CodigoEmpresa').AsFloat:=-1; 
         tabBase.Open;
         FTyping:=False;
      end;
   end;
end;

procedure TfmEmpresas.AtualizaCodigo;
begin
   if FTyping = False then begin
      if not tabBase.FieldByName('CodigoEmpresa').IsNull then begin
         edtCodigoEmpresa.Text:=FloatToStr(tabBase.FieldByName('CodigoEmpresa').AsFloat);
      end;
   end;
end;

procedure TfmEmpresas.edtCnpjExit(Sender: TObject);
begin
  inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtCnpj.Text) <> '' then begin
         if not CNPJ(edtCnpj.Text) then begin
            ShowMessage('CNPJ Inválido.');
            edtCnpj.SetFocus;
            exit;
         end;
         edtCnpj.Text:=FormatarCNPJ(edtCnpj.Text);
         tabBase.FieldByName('CNPJ').AsString:=edtCnpj.Text;
      end;
   end;
end;

procedure TfmEmpresas.edtCodigoEmpresaKeyPress(Sender: TObject;
  var Key: Char);
begin
   inherited;
   if not (Key in['0'..'9',Chr(8)]) then Key:=#0;
end;

end.

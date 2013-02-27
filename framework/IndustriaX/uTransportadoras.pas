unit uTransportadoras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Menus, Buttons, ExtCtrls, Mask, DBCtrls, StdCtrls, ComCtrls,
  Grids, DBGrids;

type
  TfmTransportadoras = class(TfmFormBaseCadastro)
    edtCodigoTransportadora: TEdit;
    Label1: TLabel;
    edtNome: TDBEdit;
    Label2: TLabel;
    pgcTransportadora: TPageControl;
    tbsGeral: TTabSheet;
    tbsContatos: TTabSheet;
    tbsObservacoes: TTabSheet;
    tbsTabelaPeso: TTabSheet;
    Label26: TLabel;
    edtCep: TDBEdit;
    btnLocalizaCep: TBitBtn;
    edtEndereco: TDBEdit;
    Label29: TLabel;
    Label27: TLabel;
    edtNumero: TDBEdit;
    edtBairro: TDBEdit;
    Label31: TLabel;
    edtComplemento: TDBEdit;
    Label32: TLabel;
    Label33: TLabel;
    edtPais: TDBLookupComboBox;
    edtEstado: TDBComboBox;
    Label28: TLabel;
    edtCidade: TDBLookupComboBox;
    Label34: TLabel;
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
    edtCnpj: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtIE: TDBEdit;
    edtSite: TDBEdit;
    Label5: TLabel;
    edtEmailNFe: TDBEdit;
    Label6: TLabel;
    Label51: TLabel;
    edtContato: TEdit;
    btnContatoAdicionar: TBitBtn;
    edtDescricao: TEdit;
    Label52: TLabel;
    Label53: TLabel;
    edtEmail: TEdit;
    btnEmailAdicionar: TBitBtn;
    dbgContatos: TDBGrid;
    btnContatoRemover: TBitBtn;
    dbgEmails: TDBGrid;
    btnEmailRemover: TBitBtn;
    edtObservacoes: TDBMemo;
    dbgTabelaPeso: TDBGrid;
    btnCadastrarEstados: TBitBtn;
    btnCadastrarTabela: TBitBtn;
    tabCidades: TZQuery;
    dtsCidades: TDataSource;
    tabPais: TZQuery;
    dtsPais: TDataSource;
    tabChecagens: TZQuery;
    tabTranspContatos: TZQuery;
    dtsTranspContatos: TDataSource;
    tabTranspEmail: TZQuery;
    dtsTranspEmail: TDataSource;
    tabTabelaPeso: TZQuery;
    dtsTabelaPeso: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCepExit(Sender: TObject);
    procedure btnLocalizaCepClick(Sender: TObject);
    procedure edtCodigoTransportadoraKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtsBaseDataChange(Sender: TObject; Field: TField);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnContatoAdicionarClick(Sender: TObject);
    procedure btnEmailAdicionarClick(Sender: TObject);
    procedure btnContatoRemoverClick(Sender: TObject);
    procedure btnEmailRemoverClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure edtCnpjExit(Sender: TObject);
    procedure edtCodigoTransportadoraKeyPress(Sender: TObject;
      var Key: Char);
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
  fmTransportadoras: TfmTransportadoras;

implementation

uses uFormBaseConfig, uMenu, uFuncoes, uLocalizarGenerico, uTipos,
  uEnderecos;

{$R *.dfm}

{ TfmTransportadoras }

procedure TfmTransportadoras.Novo;
begin
   if Trim(edtCodigoTransportadora.Text) = '' then begin
      tabBase.FieldByName('Codigo').AsFloat:=CodeGenerator('transportadoras', 'Codigo');
    end
   else begin
      tabBase.FieldByName('Codigo').AsFloat:=StrToFloat(edtCodigoTransportadora.Text);
   end;
end;

procedure TfmTransportadoras.Editar;
begin
end;

procedure TfmTransportadoras.Deletar;
begin
end;

procedure TfmTransportadoras.Cancelar;
begin
end;

function TfmTransportadoras.Checagens: Boolean;
begin
   Result:=False;
   if Trim(edtNome.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Nome');
      edtNome.SetFocus;
      Result:=True;
      exit;
   end;
   if tabBase.State = dsInsert then begin
      if Trim(edtCodigoTransportadora.Text) <> '' then begin
         if ExistsValue('Codigo', 'transportadoras', edtCodigoTransportadora.Text) then begin
            ShowMessage('Código da Transportadora já Existente');
            edtCodigoTransportadora.SetFocus;
            Result:=True;
            exit;
         end;
      end;
      if Trim(edtCnpj.Text) <> '' then begin
         if ExistsValue('Cnpj', 'transportadoras', edtCnpj.Text) then begin
            ShowMessage('CNPJ já Existente');
            edtCnpj.SetFocus;
            Result:=True;  
            exit;
         end;
      end;
   end;
end;

procedure TfmTransportadoras.FormCreate(Sender: TObject);
begin
   inherited;
   FTyping:=False;
   SetFormStyle(fsMDIChild);  
end;

procedure TfmTransportadoras.FormShow(Sender: TObject);
begin
   inherited;

   pgcTransportadora.ActivePageIndex:=0; 

   tabTabelaPeso.Params.CreateParam(ftFloat, 'CodigoTransportadora', ptUnknown);
   tabTabelaPeso.SQL.Add('SELECT * FROM tabela_pesos WHERE CodigoTransportadora = :CodigoTransportadora');
   tabTabelaPeso.Open;

   tabTranspContatos.Params.CreateParam(ftFloat, 'CodigoTransportadora', ptUnknown);
   tabTranspContatos.SQL.Add('SELECT Nome FROM transportadoras_contatos WHERE CodigoTransportadora =:CodigoTransportadora');
   tabTranspContatos.Open;

   tabTranspEmail.Params.CreateParam(ftFloat, 'CodigoTransportadora', ptUnknown);
   tabTranspEmail.SQL.Add('SELECT Descricao,Email FROM transportadoras_emails WHERE CodigoTransportadora =:CodigoTransportadora');
   tabTranspEmail.Open;

   tabBase.Params.CreateParam(ftFloat, 'CodigoTransportadora', ptUnknown); 
   tabBase.SQL.Add('SELECT * FROM transportadoras WHERE Codigo = :CodigoTransportadora');
   tabBase.Open;

   tabCidades.SQL.Add('SELECT * FROM cidades ORDER BY Cidade');
   tabCidades.Open;

   tabPais.SQL.Add('SELECT * FROM paises ORDER BY Pais');
   tabPais.Open; 
end;

procedure TfmTransportadoras.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabBase.Close;
   tabCidades.Close;
   tabPais.Close;
   tabTabelaPeso.Close;
   inherited;
end;

procedure TfmTransportadoras.edtCepExit(Sender: TObject);
begin
  inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtCep.Text) <> '' then begin
         edtCep.Text:=FormatarCEP(edtCep.Text);
         tabBase.FieldByName('Cep').AsString:=edtCep.Text;
      end;
   end;
end;

procedure TfmTransportadoras.btnLocalizaCepClick(Sender: TObject);
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

procedure TfmTransportadoras.edtCodigoTransportadoraKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
   if tabBase.State = dsBrowse then begin
      if Trim(edtCodigoTransportadora.Text) <> '' then begin
         FTyping:=True;
         tabBase.Close;
	       tabBase.ParamByName('CodigoTransportadora').AsFloat:=StrToFloat(edtCodigoTransportadora.Text);
         tabBase.Open;
         FTyping:=False;
       end
      else begin
         FTyping:=True;
         tabBase.Close;
	       tabBase.ParamByName('CodigoTransportadora').AsFloat:=-1;
         tabBase.Open;
         FTyping:=False;
      end;
   end;
end;

procedure TfmTransportadoras.AtualizaCodigo;
begin
   if FTyping = False then begin
      if not tabBase.FieldByName('Codigo').IsNull then begin
         edtCodigoTransportadora.Text:=FloatToStr(tabBase.FieldByName('Codigo').AsFloat);
      end;
   end;
end;

procedure TfmTransportadoras.dtsBaseDataChange(Sender: TObject;
  Field: TField);
begin
   inherited;
   if tabBase.State = dsBrowse then begin
      AtualizaCodigo;

      tabTranspContatos.Close;
      tabTranspContatos.ParamByName('CodigoTransportadora').Value:=tabBase.FieldByName('Codigo').Value;
      tabTranspContatos.Open;

      tabTranspEmail.Close;
      tabTranspEmail.ParamByName('CodigoTransportadora').Value:=tabBase.FieldByName('Codigo').Value;
      tabTranspEmail.Open;
   end;
end;

procedure TfmTransportadoras.btnLocalizarClick(Sender: TObject);
var vParamLoc: TParametrosLocalizar;
begin
   vParamLoc.Table:='transportadoras';
   vParamLoc.KeyField:='Codigo';
   vParamLoc.Field1:='Nome';
   vParamLoc.Filter:='';
   inherited;
   if not Assigned (fmLocalizarGenerico) then begin
      Application.CreateForm(TfmLocalizarGenerico, fmLocalizarGenerico);
      fmLocalizarGenerico.LoadParams(vParamLoc);
      fmLocalizarGenerico.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edtCodigoTransportadora.Text:=fmMenu.pubTrans1;
      tabBase.Close;
      tabBase.ParamByName('CodigoTransportadora').Value:=edtCodigoTransportadora.Text;
      tabBase.Open;
   end; 
end;

procedure TfmTransportadoras.btnContatoAdicionarClick(Sender: TObject);
begin
  inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtContato.Text) <> '' then begin
         if not tabBase.FieldByName('Codigo').IsNull then begin
            try
               tabChecagens.Close;
               tabChecagens.SQL.Clear;
               tabChecagens.SQL.Add('SELECT * FROM transportadoras_contatos WHERE 0');
               tabChecagens.Open;

               tabChecagens.Append;
               tabChecagens.FieldByName('ID').AsFloat:=CodeGenerator('transportadoras_contatos', 'ID');
               tabChecagens.FieldByName('CodigoTransportadora').AsFloat:=tabBase.FieldByName('Codigo').AsFloat;
               tabChecagens.FieldByName('Nome').AsString:=edtContato.Text;
               tabChecagens.Post;
               tabChecagens.ApplyUpDates;

               tabTranspContatos.Close;
               tabTranspContatos.ParamByName('CodigoTransportadora').Value:=tabBase.FieldByName('Codigo').Value;
               tabTranspContatos.Open;

               edtContato.Text:='';
            finally
               tabChecagens.Close;
            end;
          end
         else begin
            ShowMessage('Obrigatório Preenchimento do Código da Transportadora');  
         end;
      end;
   end;
end;

procedure TfmTransportadoras.btnEmailAdicionarClick(Sender: TObject);
begin
  inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtEmail.Text) <> '' then begin
         if not tabBase.FieldByName('Codigo').IsNull then begin
            try 
               tabChecagens.Close;
               tabChecagens.SQL.Clear;
               tabChecagens.SQL.Add('SELECT * FROM transportadoras_emails WHERE 0');
               tabChecagens.Open;

               tabChecagens.Append;
               tabChecagens.FieldByName('ID').AsFloat:=CodeGenerator('transportadoras_emails', 'ID');
               tabChecagens.FieldByName('CodigoTransportadora').AsFloat:=tabBase.FieldByName('Codigo').AsFloat;
               tabChecagens.FieldByName('Descricao').AsString:=edtDescricao.Text;
               tabChecagens.FieldByName('Email').AsString:=edtEmail.Text;               
               tabChecagens.Post;
               tabChecagens.ApplyUpDates;

               tabTranspEmail.Close;
               tabTranspEmail.ParamByName('CodigoTransportadora').Value:=tabBase.FieldByName('Codigo').Value;
               tabTranspEmail.Open;

               edtDescricao.Text:='';
               edtEmail.Text:='';
            finally
               tabChecagens.Close;
            end;
          end
         else begin
            ShowMessage('Obrigatório Preenchimento do Código da Transportadora'); 
         end;
      end;
   end;
end;

procedure TfmTransportadoras.btnContatoRemoverClick(Sender: TObject);
begin
  inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if tabTranspContatos.RecordCount > 0 then begin
         if Application.MessageBox('Deseja Realmente Excluir o Contato dessa Transportadora?', PChar(Application.Title), 36) = 7 then exit;
         tabTranspContatos.Delete;
         tabTranspContatos.ApplyUpdates;
      end;
   end;
end;

procedure TfmTransportadoras.btnEmailRemoverClick(Sender: TObject);
begin
  inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if tabTranspEmail.RecordCount > 0 then begin
         if Application.MessageBox('Deseja Realmente Excluir o Email dessa Transportadora?', PChar(Application.Title), 36) = 7 then exit;
         tabTranspEmail.Delete;
         tabTranspEmail.ApplyUpdates;
      end;
   end;
end;

procedure TfmTransportadoras.btnNovoClick(Sender: TObject);
begin
   inherited;
   if tabBase.State = dsInsert then begin
      edtCodigoTransportadora.Text:='';
      edtNome.SetFocus;
   end;
end;

procedure TfmTransportadoras.edtCnpjExit(Sender: TObject);
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
         tabBase.FieldByName('Cnpj').AsString:=edtCnpj.Text; 
      end;
   end;
end;

procedure TfmTransportadoras.edtCodigoTransportadoraKeyPress(  
  Sender: TObject; var Key: Char);
begin
   inherited;
   if not (Key in['0'..'9',Chr(8)]) then Key:=#0;
end;

end.

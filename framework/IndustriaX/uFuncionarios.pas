unit uFuncionarios;

interface 

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Menus, Buttons, ExtCtrls, StdCtrls, DBCtrls, ToolEdit,
  RXDBCtrl, ComCtrls, Mask, Grids, DBGrids, jpeg;

type
  TfmFuncionarios = class(TfmFormBaseCadastro)
    Label1: TLabel;
    edtCodigoFuncionario: TEdit;
    edtNome: TDBEdit;
    Label2: TLabel;
    pgcFuncionarios: TPageControl;
    tbsGeral: TTabSheet;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label30: TLabel;
    Label25: TLabel;
    edtCpf: TDBEdit;
    edtRg: TDBEdit;
    edtEmailEmpresa: TDBEdit;
    edtDataNascto: TDBDateEdit;
    edtDataAdmissao: TDBDateEdit;
    tbsEmails: TTabSheet;
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
    Label34: TLabel;
    edtCidade: TDBLookupComboBox;
    edtEstado: TDBComboBox;
    Label28: TLabel;
    edtPais: TDBLookupComboBox;
    Label33: TLabel;
    edtDataSaida: TDBDateEdit;
    Label3: TLabel;
    tbsObservacoes: TTabSheet;
    edtDepartamento: TDBLookupComboBox;
    Label4: TLabel;
    edtCargo: TDBLookupComboBox;
    Label5: TLabel;
    edtStatus: TDBLookupComboBox;
    Label6: TLabel;
    edtUsuario: TDBLookupComboBox;
    Label7: TLabel;
    edtDescricao: TEdit;
    edtEmail: TEdit;
    dbgEmails: TDBGrid;
    btnEmailAdicionar: TBitBtn;
    btnEmailRemover: TBitBtn;
    Label8: TLabel;
    Label12: TLabel;
    edtNomePai: TDBEdit;
    Label13: TLabel;
    edtNomeMae: TDBEdit;
    Label17: TLabel;
    edtObservacoes: TDBMemo;
    edtTelefone1: TDBEdit;
    Label14: TLabel;
    edtTelefone2: TDBEdit;
    Label15: TLabel;
    edtTelefoneEmpresa: TDBEdit;
    Label16: TLabel;
    edtCelular1: TDBEdit;
    Label20: TLabel;
    edtCelular2: TDBEdit;
    Label21: TLabel;
    tbsContaBancaria: TTabSheet;
    tbsDependentes: TTabSheet;
    edtAgencia: TDBEdit;
    Label22: TLabel;
    Label23: TLabel;
    edtConta: TDBEdit;
    Label24: TLabel;
    edtObsBancaria: TDBMemo;
    Label35: TLabel;
    dbgDependentes: TDBGrid;
    Label36: TLabel;
    edtDependenteGrauParentesco: TDBLookupComboBox;
    Label37: TLabel;
    Label38: TLabel;
    btnDependentesAdicionar: TBitBtn;
    dtsCidades: TDataSource;
    tabCidades: TZQuery;
    dtsPaises: TDataSource;
    tabPaises: TZQuery;
    dtsDepto: TDataSource;
    tabDepto: TZQuery;
    dtsCargos: TDataSource;
    tabCargos: TZQuery;
    dtsStatus: TDataSource;
    tabStatus: TZQuery;
    dtsUsuarios: TDataSource;
    tabUsuarios: TZQuery;
    dtsChecagens: TDataSource;
    tabChecagens: TZQuery;
    dtsFuncionariosEmails: TDataSource;
    tabFuncionariosEmails: TZQuery;
    edtBanco: TDBEdit;
    edtDependenteNome: TEdit;
    edtDependenteDataNascto: TDateEdit;
    dtsDependentes: TDataSource;
    tabDependentes: TZQuery;
    dtsGrauParentesco: TDataSource;
    tabGrauParentesco: TZQuery;
    edtEstadoCivil: TDBLookupComboBox;
    Label39: TLabel;
    dtsEstadoCivil: TDataSource;
    tabEstadoCivil: TZQuery;
    tbsAusencias: TTabSheet;
    Label40: TLabel;
    edtTipoAusencia: TDBLookupComboBox;
    Label41: TLabel;
    edtDataInicial: TDateEdit;
    btnAdicionarAusencia: TBitBtn;
    edtDataFinal: TDateEdit;
    Label43: TLabel;
    dbgAusencia: TDBGrid;
    dtsAusencias: TDataSource;
    tabAusencias: TZQuery;
    dtsTiposAusencias: TDataSource;
    tabTiposAusencias: TZQuery;
    TabSheet1: TTabSheet;
    Label44: TLabel;
    edtAdvertenciaTipo: TDBLookupComboBox;
    dbgAdvertencias: TDBGrid;
    btnAdvertenciaAdd: TBitBtn;
    edtAdvertenciaData: TDateEdit;
    Label18: TLabel;
    edtAdvertenciaMotivo: TEdit;
    Label19: TLabel;
    dtsAdvertencias: TDataSource;
    tabAdvertencias: TZQuery;
    dtsTiposAdvertencias: TDataSource;
    tabTiposAdvertencias: TZQuery;
    tbsFerias: TTabSheet;
    edtFeriasAqIni: TDateEdit;
    Label42: TLabel;
    edtFeriasAqFin: TDateEdit;
    Label46: TLabel;
    edtFeriasGozoFinal: TDateEdit;
    Label47: TLabel;
    edtFeriasGozoInicial: TDateEdit;
    Label48: TLabel;
    edtFeriasDiasDescansados: TEdit;
    Label49: TLabel;
    edtFeriasObservacoes: TEdit;
    Label50: TLabel;
    dbgFerias: TDBGrid;
    btnFeriasAdicionar: TBitBtn;
    btnFeriasRemover: TBitBtn;
    dtsFerias: TDataSource;
    tabFerias: TZQuery;
    Label45: TLabel;
    edtFeriasID: TEdit;
    CadastrarDigital1: TMenuItem;
    imgFoto: TImage;
    Label51: TLabel;
    btnAlterarFoto: TBitBtn;
    btnExcluirFoto: TBitBtn;
    dtsFotos: TDataSource;
    tabFotos: TZQuery;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dtsBaseDataChange(Sender: TObject; Field: TField);
    procedure btnNovoClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnLocalizaCepClick(Sender: TObject);
    procedure edtCpfExit(Sender: TObject);
    procedure btnEmailAdicionarClick(Sender: TObject);
    procedure btnEmailRemoverClick(Sender: TObject);
    procedure btnDependentesAdicionarClick(Sender: TObject);
    procedure edtCepExit(Sender: TObject);
    procedure edtCodigoFuncionarioKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoFuncionarioKeyPress(Sender: TObject; var Key: Char);
    procedure btnEditarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtCidadeEnter(Sender: TObject);
    procedure edtCidadeExit(Sender: TObject);
    procedure btnAdicionarAusenciaClick(Sender: TObject);
    procedure btnAdvertenciaAddClick(Sender: TObject);
    procedure dbgAdvertenciasCellClick(Column: TColumn);
    procedure btnFeriasAdicionarClick(Sender: TObject);
    procedure dbgFeriasCellClick(Column: TColumn);
    procedure btnFeriasRemoverClick(Sender: TObject);
    procedure CadastrarDigital1Click(Sender: TObject);
    procedure btnAlterarFotoClick(Sender: TObject);
    procedure btnExcluirFotoClick(Sender: TObject);
  private
    FTyping : Boolean;
    procedure AtualizaCodigoFuncionario;
    procedure AtualizarFotoFuncionario;
  public
    procedure Novo; override;
    procedure Editar; override;
    procedure Deletar; override;
    procedure Cancelar; override;
    function Checagens: Boolean; override;
  end;

var
  fmFuncionarios: TfmFuncionarios;

implementation

uses uMenu, uFuncoes, uFormBase, uLocalizarFuncionarios, uTipos, uObservacoes,
     uFuncionariosDigital, uCadastrarImagem, uEnderecos;

{$R *.dfm}

{ TfmFuncionarios }

procedure TfmFuncionarios.Novo;
begin
   if Trim(edtCodigoFuncionario.Text) = '' then begin
      tabBase.FieldByName('Codigo').AsFloat:=CodeGenerator('funcionarios', 'Codigo');
    end
   else begin
      tabBase.FieldByName('Codigo').AsFloat:=StrToFloat(edtCodigoFuncionario.Text);
   end;
end;

procedure TfmFuncionarios.Editar;
begin
end;

procedure TfmFuncionarios.Deletar;
begin
end;

procedure TfmFuncionarios.Cancelar;
begin
end;

function TfmFuncionarios.Checagens: Boolean;
begin
   Result:=False;
   if Trim(edtNome.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Nome');
      edtNome.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtCodigoFuncionario.Text) <> '' then begin
      if tabBase.State = dsInsert then begin
         if ExistsValue('Codigo', 'funcionarios', edtCodigoFuncionario.Text) then begin
            ShowMessage('Código do Funcionário já Existente');
            edtCodigoFuncionario.SetFocus;
            Result:=True;
            exit;
         end;
      end;
   end;
end;

procedure TfmFuncionarios.FormShow(Sender: TObject);
begin
   inherited;

   pgcFuncionarios.ActivePageIndex:=0;

   tabFotos.Params.CreateParam(ftFloat, 'CodigoFuncionario', ptUnknown);
   tabFotos.SQL.Add('SELECT * FROM funcionarios_fotos WHERE CodigoFuncionario = :CodigoFuncionario');
   tabFotos.Open;

   tabFuncionariosEmails.Params.CreateParam(ftFloat, 'CodigoFuncionario', ptUnknown);
   tabFuncionariosEmails.SQL.Add('SELECT Descricao,Email FROM funcionarios_emails WHERE CodigoFuncionario =:CodigoFuncionario');
   tabFuncionariosEmails.Open;
                            
   tabDependentes.Params.CreateParam(ftFloat, 'CodigoFuncionario', ptUnknown);
   tabDependentes.SQL.Add('SELECT funcionarios_dependentes.Nome, genericos.Descricao AS GrauParentesco, funcionarios_dependentes.DataNascto');
   tabDependentes.SQL.Add('FROM funcionarios_dependentes');
   tabDependentes.SQL.Add('LEFT JOIN genericos ON genericos.Codigo = funcionarios_dependentes.CodigoParentesco');
   tabDependentes.SQL.Add('WHERE CodigoFuncionario = :CodigoFuncionario');
   tabDependentes.Open; 

   tabAusencias.Params.CreateParam(ftFloat, 'CodigoFuncionario', ptUnknown);
   tabAusencias.SQL.Add('SELECT genericos.Descricao AS Tipo, funcionarios_ausencias.DataInicial, funcionarios_ausencias.DataFinal');
   tabAusencias.SQL.Add('FROM funcionarios_ausencias');
   tabAusencias.SQL.Add('LEFT JOIN genericos ON funcionarios_ausencias.CodigoAusencia = genericos.Codigo');
   tabAusencias.SQL.Add('WHERE CodigoFuncionario =:CodigoFuncionario');
   tabAusencias.Open;

   tabAdvertencias.Params.CreateParam(ftFloat, 'CodigoFuncionario', ptUnknown);
   tabAdvertencias.SQL.Add('SELECT genericos.Descricao AS TipoAdvertencia, fa.Data, fa.Motivo');
   tabAdvertencias.SQL.Add('FROM funcionarios_advertencias AS fa');
   tabAdvertencias.SQL.Add('LEFT JOIN genericos ON fa.CodigoTipoAdvert = genericos.Codigo');
   tabAdvertencias.SQL.Add('WHERE CodigoFuncionario =:CodigoFuncionario');
   tabAdvertencias.Open;

   tabFerias.Params.CreateParam(ftFloat, 'CodigoFuncionarios', ptUnknown);
   tabFerias.SQL.Add('SELECT * FROM funcionarios_ferias WHERE CodigoFuncionario = :CodigoFuncionario');
   tabFerias.Open;

   //tabBase.Params.CreateParam(ftFloat, 'CodigoFuncionario', ptUnknown);
   tabBase.SQL.Add('SELECT * FROM funcionarios ORDER BY Nome');
   tabBase.Open;

   tabCidades.SQL.Add('SELECT * FROM cidades ORDER BY Cidade');
   tabCidades.Open;

   tabPaises.SQL.Add('SELECT * FROM paises ORDER BY Pais');
   tabPaises.Open;

   tabDepto.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('3')+' ORDER BY Descricao');
   tabDepto.Open;

   tabCargos.SQL.Add('SELECT * FROM cargos ORDER BY Descricao');
   tabCargos.Open;

   tabStatus.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('14')+' ORDER BY Descricao');
   tabStatus.Open;

   tabUsuarios.SQL.Add('SELECT Usuario FROM usuarios');
   tabUsuarios.Open;

   tabGrauParentesco.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('25')+' ORDER BY Descricao');
   tabGrauParentesco.Open;

   tabEstadoCivil.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('26')+' ORDER BY Descricao');
   tabEstadoCivil.Open; 

   tabTiposAusencias.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('27')+' ORDER BY Descricao');
   tabTiposAusencias.Open;

   tabTiposAdvertencias.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('28')+' ORDER BY Descricao');
   tabTiposAdvertencias.Open;

//   dbgAdvertencias.Columns.fGrid.fa
end;

procedure TfmFuncionarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabBase.Close;
   tabCidades.Close;
   tabPaises.Close;
   tabDepto.Close;
   tabCargos.Close;
   tabStatus.Close;
   tabUsuarios.Close;
   tabFuncionariosEmails.Close;
   tabDependentes.Close;
   tabGrauParentesco.Close;
   tabEstadoCivil.Close;
   tabAusencias.Close;
   tabTiposAusencias.Close;
   tabAdvertencias.Close;
   tabTiposAdvertencias.Close;
   tabFerias.Close;
   tabFotos.Close;
   inherited; 
end;

procedure TfmFuncionarios.FormCreate(Sender: TObject);
begin
   inherited;
   FTyping:=False;
   SetFormStyle(fsMDIChild);
end;

procedure TfmFuncionarios.AtualizaCodigoFuncionario;
begin
   if FTyping = False then begin
      if not tabBase.FieldByName('Codigo').IsNull then begin
         edtCodigoFuncionario.Text:=FloatToStr(tabBase.FieldByName('Codigo').AsFloat);
      end;
   end;
end;

procedure TfmFuncionarios.dtsBaseDataChange(Sender: TObject;
  Field: TField); 
begin
   if tabBase.State = dsBrowse then begin 

      tabFuncionariosEmails.Close;
      tabFuncionariosEmails.ParamByName('CodigoFuncionario').Value:=tabBase.FieldByName('Codigo').Value;
      tabFuncionariosEmails.Open;

      tabDependentes.Close;
      tabDependentes.ParamByName('CodigoFuncionario').Value:=tabBase.FieldByName('Codigo').Value;
      tabDependentes.Open;

      tabAusencias.Close;
      tabAusencias.ParamByName('CodigoFuncionario').Value:=tabBase.FieldByName('Codigo').Value;
      tabAusencias.Open;

      tabAdvertencias.Close;
      tabAdvertencias.ParamByName('CodigoFuncionario').Value:=tabBase.FieldByName('Codigo').Value;
      tabAdvertencias.Open;

      tabFerias.Close;
      tabFerias.ParamByName('CodigoFuncionario').AsFloat:=tabBase.FieldByName('Codigo').AsFloat;
      tabFerias.Open;

      tabFotos.Close;
      tabFotos.ParamByName('CodigoFuncionario').AsFloat:=tabBase.FieldByName('Codigo').AsFloat;
      tabFotos.Open;

      AtualizaCodigoFuncionario;
      AtualizarFotoFuncionario;
   end;
end;

procedure TfmFuncionarios.btnNovoClick(Sender: TObject);
begin
   inherited;
   if tabBase.State = dsInsert then begin
      edtCodigoFuncionario.Text:='';
      edtCodigoFuncionario.SetFocus;  
   end;
end;

procedure TfmFuncionarios.btnLocalizarClick(Sender: TObject);
begin
   if not Assigned (fmLocalizarFuncionarios) then begin
      Application.CreateForm(TfmLocalizarFuncionarios, fmLocalizarFuncionarios);
      fmLocalizarFuncionarios.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edtCodigoFuncionario.Text:=fmMenu.pubTrans1;
      tabBase.Locate('Codigo', fmMenu.pubTrans1, []);
   end;
end;

procedure TfmFuncionarios.btnLocalizaCepClick(Sender: TObject);
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

procedure TfmFuncionarios.edtCpfExit(Sender: TObject);
begin
   if tabBase.State in [dsInsert, dsEdit] then begin
      if not CPF(edtCpf.Text) then begin
         ShowMessage('CPF Inválido.');
         edtCpf.SetFocus;
         exit;
      end;
      edtCpf.Text:=FormatarCPF(edtCpf.Text);
      tabBase.FieldByName('Cpf').AsString:=edtCpf.Text;
   end;
end;

procedure TfmFuncionarios.btnEmailAdicionarClick(Sender: TObject);
begin
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtEmail.Text) <> '' then begin
         if not tabBase.FieldByName('Codigo').IsNull then begin
            try 
               tabChecagens.Close;
               tabChecagens.SQL.Clear;
               tabChecagens.SQL.Add('SELECT * FROM funcionarios_emails WHERE 0');
               tabChecagens.Open; 

               tabChecagens.Append; 
               tabChecagens.FieldByName('ID').AsFloat:=CodeGenerator('funcionarios_emails', 'ID');
               tabChecagens.FieldByName('CodigoFuncionario').AsFloat:=tabBase.FieldByName('Codigo').AsFloat;
               tabChecagens.FieldByName('Descricao').AsString:=edtDescricao.Text;
               tabChecagens.FieldByName('Email').AsString:=edtEmail.Text;               
               tabChecagens.Post;
               tabChecagens.ApplyUpDates; 

               tabFuncionariosEmails.Close;
               tabFuncionariosEmails.ParamByName('CodigoFuncionario').Value:=tabBase.FieldByName('Codigo').Value;
               tabFuncionariosEmails.Open;

               edtDescricao.Text:='';
               edtEmail.Text:='';
            finally
               tabChecagens.Close;
            end;
          end
         else begin
            ShowMessage('Obrigatório Preenchimento do Código do Funcionário'); 
         end;
      end;
   end;
end;

procedure TfmFuncionarios.btnEmailRemoverClick(Sender: TObject);
begin
   if tabBase.State in [dsInsert, dsEdit] then begin
      if tabFuncionariosEmails.RecordCount > 0 then begin
         if Application.MessageBox('Deseja Realmente Excluir o Email desse Funcionário?', PChar(Application.Title), 36) = 7 then exit;
         tabFuncionariosEmails.Delete;
         tabFuncionariosEmails.ApplyUpdates;
      end;
   end;
end;

procedure TfmFuncionarios.btnDependentesAdicionarClick(Sender: TObject);
begin
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtDependenteNome.Text) <> '' then begin
         if not tabBase.FieldByName('Codigo').IsNull then begin
            try 
               tabChecagens.Close;
               tabChecagens.SQL.Clear;
               tabChecagens.SQL.Add('SELECT * FROM funcionarios_dependentes WHERE 0');
               tabChecagens.Open;

               tabChecagens.Append;
               tabChecagens.FieldByName('ID').AsFloat:=CodeGenerator('funcionarios_dependentes', 'ID');
               tabChecagens.FieldByName('CodigoFuncionario').AsFloat:=tabBase.FieldByName('Codigo').AsFloat;
               tabChecagens.FieldByName('Nome').AsString:=edtDependenteNome.Text;
               if Trim(edtDependenteGrauParentesco.Text) <> '' then begin
                  tabChecagens.FieldByName('CodigoParentesco').AsFloat:=StrToFloat(edtDependenteGrauParentesco.KeyValue);
               end;
               if Trim(edtDependenteDataNascto.Text) <> '/  /' then begin
                  tabChecagens.FieldByName('DataNascto').AsDateTime:=edtDependenteDataNascto.Date;
               end;
               tabChecagens.Post;
               tabChecagens.ApplyUpDates;

               tabDependentes.Close;
               tabDependentes.ParamByName('CodigoFuncionario').Value:=tabBase.FieldByName('Codigo').Value;
               tabDependentes.Open;

               edtDependenteNome.Text:='';
               edtDependenteGrauParentesco.KeyValue:=NULL;
               edtDependenteDataNascto.Clear;
               edtDependenteNome.SetFocus;
            finally
               tabChecagens.Close;
            end;
          end
         else begin
            ShowMessage('Obrigatório Preenchimento do Código do Funcionário'); 
         end;
      end;
   end;
end;

procedure TfmFuncionarios.edtCepExit(Sender: TObject);
begin
  inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtCep.Text) <> '' then begin
         edtCep.Text:=FormatarCEP(edtCep.Text);
         tabBase.FieldByName('Cep').AsString:=edtCep.Text;
      end;
   end;
end;

procedure TfmFuncionarios.edtCodigoFuncionarioKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
   if tabBase.State = dsBrowse then begin
      if Trim(edtCodigoFuncionario.Text) <> '' then begin
         FTyping:=True;
         tabBase.Locate('Codigo', edtCodigoFuncionario.Text, []);
         FTyping:=False;
      end;
   end;
end;

procedure TfmFuncionarios.edtCodigoFuncionarioKeyPress(Sender: TObject;
  var Key: Char);
begin
   inherited;
   if not (Key in['0'..'9',Chr(8)]) then Key:=#0;
end;

procedure TfmFuncionarios.btnEditarClick(Sender: TObject);
begin
   inherited;
   edtCodigoFuncionario.Enabled:=False;
end;

procedure TfmFuncionarios.btnGravarClick(Sender: TObject);
begin
   inherited;
   edtCodigoFuncionario.Enabled:=true;
end;

procedure TfmFuncionarios.btnCancelarClick(Sender: TObject);
begin
   inherited;
   edtCodigoFuncionario.Enabled:=true;
end;

procedure TfmFuncionarios.edtCidadeEnter(Sender: TObject);
begin
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

procedure TfmFuncionarios.edtCidadeExit(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      edtCidade.ListSource:=dtsCidades; 
   end;
end;

procedure TfmFuncionarios.btnAdicionarAusenciaClick(Sender: TObject); 
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtTipoAusencia.Text) = '' then begin
         ShowMessage('Obrigatório Preenchimento no Tipo de Ausencia'); 
         edtTipoAusencia.SetFocus; 
         exit;
      end;
      if Trim(edtDataInicial.Text) = '/  /' then begin
         ShowMessage('Obrigatório Preenchimento da Data Inicial'); 
         edtDataInicial.SetFocus;
         exit;
      end;
      if Trim(edtDataFinal.Text) = '/  /' then begin
         ShowMessage('Obrigatório Preenchimento da Data Inicial'); 
         edtDataFinal.SetFocus;
         exit; 
      end;
      if not tabBase.FieldByName('Codigo').IsNull then begin    
         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT * FROM funcionarios_ausencias WHERE 0');
            tabChecagens.Open;

            tabChecagens.Append; 
            tabChecagens.FieldByName('ID').AsFloat:=CodeGenerator('funcionarios_ausencias', 'ID');
            tabChecagens.FieldByName('CodigoFuncionario').AsFloat:=tabBase.FieldByName('Codigo').AsFloat;
            if Trim(edtDataInicial.Text) <> '/  /' then begin
               tabChecagens.FieldByName('DataInicial').AsDateTime:=edtDataInicial.Date;
            end;
            if Trim(edtDataFinal.Text) <> '/  /' then begin
               tabChecagens.FieldByName('DataFinal').AsDateTime:=edtDataFinal.Date;
            end;
            tabChecagens.FieldByName('CodigoAusencia').AsFloat:=StrToFloat(edtTipoAusencia.KeyValue); 
            tabChecagens.Post;
            tabChecagens.ApplyUpDates;

            tabAusencias.Close;
            tabAusencias.ParamByName('CodigoFuncionario').Value:=tabBase.FieldByName('Codigo').Value;
            tabAusencias.Open;

            edtTipoAusencia.KeyValue:=NULL;
            edtDataInicial.Clear; 
            edtDataFinal.Clear;
            edtDataFinal.SetFocus;
         finally
            tabChecagens.Close;
         end;
       end
      else begin
         ShowMessage('Obrigatório Preenchimento do Código do Funcionário');
      end;  
   end;
end;

procedure TfmFuncionarios.btnAdvertenciaAddClick(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtAdvertenciaTipo.Text) = '' then begin
         ShowMessage('Obrigatório Preenchimento no Tipo de Advertência');
         edtAdvertenciaTipo.SetFocus;
         exit;
      end;
      if Trim(edtAdvertenciaData.Text) = '/  /' then begin
         ShowMessage('Obrigatório Preenchimento da Data de Advertência');
         edtAdvertenciaData.SetFocus;
         exit;
      end;
      if Trim(edtAdvertenciaMotivo.Text) = '' then begin
         ShowMessage('Obrigatório Preenchimento do Motivo');
         edtAdvertenciaMotivo.SetFocus;
         exit;
      end;
      if not tabBase.FieldByName('Codigo').IsNull then begin
         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT * FROM funcionarios_advertencias WHERE 0');
            tabChecagens.Open;

            tabChecagens.Append;
            tabChecagens.FieldByName('ID').AsFloat:=CodeGenerator('funcionarios_advertencias', 'ID');
            tabChecagens.FieldByName('CodigoFuncionario').AsFloat:=tabBase.FieldByName('Codigo').AsFloat;
            tabChecagens.FieldByName('Data').AsDateTime:=edtAdvertenciaData.Date;
            tabChecagens.FieldByName('CodigoTipoAdvert').AsFloat:=StrToFloat(edtAdvertenciaTipo.KeyValue);
            tabChecagens.FieldByName('Motivo').AsString:=edtAdvertenciaMotivo.Text; 
            tabChecagens.Post;
            tabChecagens.ApplyUpDates;

            tabAdvertencias.Close;
            tabAdvertencias.ParamByName('CodigoFuncionario').Value:=tabBase.FieldByName('Codigo').Value;
            tabAdvertencias.Open;

            edtAdvertenciaTipo.KeyValue:=NULL;
            edtAdvertenciaData.Clear;
            edtAdvertenciaMotivo.Clear;
            edtAdvertenciaTipo.SetFocus; 
         finally
            tabChecagens.Close;
         end;
       end
      else begin
         ShowMessage('Obrigatório Preenchimento do Código do Funcionário');
      end; 
   end;
end;

procedure TfmFuncionarios.dbgAdvertenciasCellClick(Column: TColumn);
begin
   inherited;
   if Column.FieldName = 'Motivo' then begin
      if tabBase.State in [dsInsert, dsEdit] then begin
         if Trim(tabAdvertencias.FieldByName('Motivo').AsString) <> '' then begin
            dbgAdvertencias.SetFocus;
            dbgAdvertencias.SelectedIndex:=1;
            if not Assigned (fmObservacoes) then begin
               Application.CreateForm(TfmObservacoes, fmObservacoes);
               fmObservacoes.Caption:='Advertência';
               fmObservacoes.pubApplyUpDates:=True;
               fmObservacoes.edtObservacoes.DataField:=Column.FieldName;
               fmObservacoes.edtObservacoes.DataSource:=dtsAdvertencias;
               fmObservacoes.ShowModal;
            end;
         end;
       end
      else begin
         if Trim(tabAdvertencias.FieldByName('Motivo').AsString) <> '' then begin
            dbgAdvertencias.SetFocus;
            dbgAdvertencias.SelectedIndex:=1;
            if not Assigned (fmObservacoes) then begin
               Application.CreateForm(TfmObservacoes, fmObservacoes);
               fmObservacoes.Caption:='Advertência';
               fmObservacoes.pubApplyUpDates:=True;
               fmObservacoes.edtObservacoes.DataField:=Column.FieldName;
               fmObservacoes.edtObservacoes.DataSource:=dtsAdvertencias;
               fmObservacoes.ShowModal;
            end;
         end;
      end;
   end;
end;

procedure TfmFuncionarios.btnFeriasAdicionarClick(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtFeriasAqIni.Text) = '' then begin
         ShowMessage('Obrigatório Preenchimento da Aquisição Inicial');
         edtFeriasAqIni.SetFocus;
         exit;
      end;
      if Trim(edtFeriasAqFin.Text) = '' then begin
         ShowMessage('Obrigatório Preenchimento da Aquisição Final');
         edtFeriasAqFin.SetFocus;
         exit;
      end;
      if not tabBase.FieldByName('Codigo').IsNull then begin
         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT * FROM funcionarios_ferias ');
            tabChecagens.SQL.Add('WHERE CodigoFuncionario = '+tabBase.FieldByName('Codigo').AsString);
            tabChecagens.SQL.Add('AND ID = '+QuotedStr(edtFeriasID.Text));
            tabChecagens.Open;

            if tabChecagens.RecordCount = 0 then begin
               tabChecagens.Append;
               tabChecagens.FieldByName('ID').AsFloat:=CodeGenerator('funcionarios_ferias', 'ID');
               tabChecagens.FieldByName('CodigoFuncionario').AsFloat:=tabBase.FieldByName('Codigo').AsFloat;
             end
            else begin
               tabChecagens.Edit;
            end;
            if Trim(edtFeriasAqIni.Text) <> '/  /' then begin
               tabChecagens.FieldByName('AquisicaoInicial').AsDateTime:=edtFeriasAqIni.Date;
            end;
            if Trim(edtFeriasAqFin.Text) <> '/  /' then begin
               tabChecagens.FieldByName('AquisicaoFinal').AsDateTime:=edtFeriasAqFin.Date;
            end;
            if Trim(edtFeriasGozoInicial.Text) <> '/  /' then begin
               tabChecagens.FieldByName('GozoInicial').AsDateTime:=edtFeriasGozoInicial.Date;
            end;
            if Trim(edtFeriasGozoFinal.Text) <> '/  /' then begin
               tabChecagens.FieldByName('GozoFinal').AsDateTime:=edtFeriasGozoFinal.Date;
            end;
            if Trim(edtFeriasDiasDescansados.Text) <> '' then begin
               tabChecagens.FieldByName('DiasDescansados').AsInteger:=StrToInt(edtFeriasDiasDescansados.Text);
            end;
            if Trim(edtFeriasObservacoes.Text) <> '' then begin
               tabChecagens.FieldByName('Observacoes').AsString:=edtFeriasObservacoes.Text;
            end;
            tabChecagens.Post;
            tabChecagens.ApplyUpDates;

            tabFerias.Close;
            tabFerias.ParamByName('CodigoFuncionario').Value:=tabBase.FieldByName('Codigo').Value;
            tabFerias.Open;

            edtFeriasAqIni.Clear;
            edtFeriasAqFin.Clear;
            edtFeriasGozoInicial.Clear;
            edtFeriasGozoFinal.Clear;
            edtFeriasDiasDescansados.Text:='';
            edtFeriasObservacoes.Text:='';
            edtFeriasID.Text:='';

            edtFeriasAqIni.SetFocus; 
         finally
            tabChecagens.Close;
         end;
       end
      else begin
         ShowMessage('Obrigatório Preenchimento do Código do Funcionário');
      end; 
   end;
end;

procedure TfmFuncionarios.dbgFeriasCellClick(Column: TColumn);
begin
   inherited;
   if tabBase.State = dsEdit then begin
      if not tabFerias.FieldByName('AquisicaoInicial').IsNull then begin
         edtFeriasAqIni.Date:=tabFerias.FieldByName('AquisicaoInicial').AsDateTime;
      end;
      if not tabFerias.FieldByName('AquisicaoFinal').IsNull then begin
         edtFeriasAqFin.Date:=tabFerias.FieldByName('AquisicaoFinal').AsDateTime;
      end;
      if not tabFerias.FieldByName('GozoInicial').IsNull then begin
         edtFeriasGozoInicial.Date:=tabFerias.FieldByName('GozoInicial').AsDateTime;
      end;
      if not tabFerias.FieldByName('GozoFinal').IsNull then begin
         edtFeriasGozoFinal.Date:=tabFerias.FieldByName('GozoFinal').AsDateTime;
      end;
      if tabFerias.FieldByName('DiasDescansados').AsInteger > 0 then begin
         edtFeriasDiasDescansados.Text:=IntToStr(tabFerias.FieldByName('DiasDescansados').AsInteger);
       end
      else begin
         edtFeriasDiasDescansados.Text:='';
      end;
      if tabFerias.FieldByName('ID').AsFloat > 0 then begin
         edtFeriasID.Text:=FloatToStr(tabFerias.FieldByName('ID').AsFloat);
      end;
      edtFeriasObservacoes.Text:=tabFerias.FieldByName('Observacoes').AsString;
   end;
   if Column.FieldName = 'Observacoes' then begin
      if tabBase.State in [dsInsert, dsEdit] then begin
         if Trim(tabFerias.FieldByName('Observacoes').AsString) <> '' then begin
            dbgFerias.SetFocus;
            dbgFerias.SelectedIndex:=1;
            if not Assigned (fmObservacoes) then begin
               Application.CreateForm(TfmObservacoes, fmObservacoes);
               fmObservacoes.Caption:='Observações de Férias';
               fmObservacoes.pubApplyUpDates:=True;
               fmObservacoes.edtObservacoes.DataField:=Column.FieldName;
               fmObservacoes.edtObservacoes.DataSource:=dtsFerias;
               fmObservacoes.ShowModal;
            end;
         end;
       end
      else begin
         if Trim(tabFerias.FieldByName('Observacoes').AsString) <> '' then begin
            dbgFerias.SetFocus;
            dbgFerias.SelectedIndex:=1;
            if not Assigned (fmObservacoes) then begin
               Application.CreateForm(TfmObservacoes, fmObservacoes);
               fmObservacoes.Caption:='Observações de Férias';
               fmObservacoes.pubApplyUpDates:=True;
               fmObservacoes.edtObservacoes.DataField:=Column.FieldName;
               fmObservacoes.edtObservacoes.DataSource:=dtsFerias;
               fmObservacoes.ShowModal;
            end; 
         end;
      end;
   end;
end;

procedure TfmFuncionarios.btnFeriasRemoverClick(Sender: TObject);
begin
   inherited;
   if tabFerias.RecordCount > 0 then begin
      if Application.MessageBox('Deseja Realmente Excluir Férias desse Funcionário?', PChar(Application.Title), 36) = 7 then exit;
      tabFerias.Delete;
      tabFerias.ApplyUpdates;
   end;
end;

procedure TfmFuncionarios.CadastrarDigital1Click(Sender: TObject);
var vFM : TfmFuncionariosDigital;
begin
   inherited;
   if Trim(edtCodigoFuncionario.Text) <> '' then begin
      fmMenu.pubTrans1:=edtCodigoFuncionario.Text;
      vFM:=TfmFuncionariosDigital.Create(Self);
      vFM.Show;
   end;
end;

procedure TfmFuncionarios.btnAlterarFotoClick(Sender: TObject);
var vImg : TJPEGImage;
begin
   if (Trim(edtCodigoFuncionario.Text) <> '') and (tabBase.RecordCount > 0) then begin
      if not Assigned (fmCadastrarImagem) then begin
         Application.CreateForm(TfmCadastrarImagem, fmCadastrarImagem);
         fmCadastrarImagem.ShowModal;
      end;
      if fmMenu.pubTransImg <> nil then begin

         if tabBase.FieldByName('Codigo').AsFloat = tabFotos.FieldByName('CodigoFuncionario').AsFloat then begin
            try
               tabChecagens.Close;
               tabChecagens.SQL.Clear;
               tabChecagens.SQL.Add('DELETE FROM funcionarios_fotos WHERE CodigoFuncionario = '+QuotedStr(tabBase.FieldByName('Codigo').AsString));
               tabChecagens.ExecSQL;
            finally
               tabChecagens.Close; 
            end; 
         end; 

         imgFoto.Picture.Graphic:=fmMenu.pubTransImg;
         vImg:=TJPEGImage.Create;
         try try
            vImg.Assign(fmMenu.pubTransImg);
            tabFotos.Append;
            tabFotos.FieldByName('CodigoFuncionario').AsFloat:=StrToFloat(edtCodigoFuncionario.Text);
            tabFotos.FieldByName('Foto').Assign(vImg);
            tabFotos.Post;
            tabFotos.ApplyUpdates;
         except
            on E: Exception do begin
               imgFoto.Picture:=nil;
               ShowMessage(E.Message);
            end;
         end;
         finally
            vImg.Free;
         end;
      end;
    end
   else begin
      ShowMessage('Selecione um Funcionário para Incluir ou Alterar uma Imagem');
   end;
end;

procedure TfmFuncionarios.AtualizarFotoFuncionario;
begin
   if not LoadImageFromBD(tabFotos.FieldByName('Foto'), imgFoto) then imgFoto.Picture:=nil;
end;

procedure TfmFuncionarios.btnExcluirFotoClick(Sender: TObject);
begin
   inherited;
   if tabFotos.RecordCount > 0 then begin
      if Application.MessageBox(Pchar('Confirmar Exclusão da Foto do Funcionário '+tabBase.FieldByName('Codigo').AsString), 'Exclusão da Foto', 36) = 7 then exit;
      if tabBase.FieldByName('Codigo').AsFloat = tabFotos.FieldByName('CodigoFuncionario').AsFloat then begin
         tabFotos.Delete;
         tabFotos.ApplyUpdates;
         AtualizarFotoFuncionario;
      end;
   end;
end;

end.

unit uGerarPendentesTitulos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, Mask, ToolEdit, Buttons, ComCtrls,
  CurrEdit, DBCtrls, ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Menus;

type
  TfmGerarPendentesTitulos = class(TfmFormBaseAvancado)
    edtTipoTitulo: TComboBox;
    Label1: TLabel;
    edtFavorecido: TComboBox;
    Label2: TLabel;
    edtCodigo: TEdit;
    lblTipo: TLabel;
    edtNome: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    edtVencto0: TDateEdit;
    btnLocalizar: TBitBtn;
    edtCodigoCC: TEdit;
    Label6: TLabel;
    edtCC: TEdit;
    btnLocalizarCC: TBitBtn;
    edtCodigoEmpresa: TEdit;
    Label7: TLabel;
    edtNomeEmpresa: TEdit;
    btnLocalizarEmpresa: TBitBtn;
    edtParcelas: TEdit;
    Label8: TLabel;
    edtDocumento: TEdit;
    Label9: TLabel;
    edtNF: TEdit;
    Label10: TLabel;
    pgcVenctos: TPageControl;
    tbsVenctos1_12: TTabSheet;
    edtVencto1: TDateEdit;
    Label11: TLabel;
    edtValor1: TCurrencyEdit;
    Label12: TLabel;
    edtBanco1: TDBLookupComboBox;
    Label13: TLabel;
    edtLocalizacao1: TDBLookupComboBox;
    Label14: TLabel;
    Bevel1: TBevel;
    Label15: TLabel;
    edtVencto7: TDateEdit;
    Label16: TLabel;
    edtValor7: TCurrencyEdit;
    Label17: TLabel;
    edtBanco7: TDBLookupComboBox;
    Label18: TLabel;
    edtLocalizacao7: TDBLookupComboBox;
    Label19: TLabel;
    edtVencto2: TDateEdit;
    Label20: TLabel;
    edtValor2: TCurrencyEdit;
    Label21: TLabel;
    edtBanco2: TDBLookupComboBox;
    Label22: TLabel;
    edtLocalizacao2: TDBLookupComboBox;
    Label23: TLabel;
    edtVencto8: TDateEdit;
    Label24: TLabel;
    edtValor8: TCurrencyEdit;
    Label25: TLabel;
    edtBanco8: TDBLookupComboBox;
    Label26: TLabel;
    edtLocalizacao8: TDBLookupComboBox;
    Label27: TLabel;
    edtVencto3: TDateEdit;
    Label28: TLabel;
    edtValor3: TCurrencyEdit;
    Label29: TLabel;
    edtBanco3: TDBLookupComboBox;
    Label30: TLabel;
    edtLocalizacao3: TDBLookupComboBox;
    Label31: TLabel;
    edtVencto9: TDateEdit;
    Label32: TLabel;
    edtValor9: TCurrencyEdit;
    Label33: TLabel;
    edtBanco9: TDBLookupComboBox;
    Label34: TLabel;
    edtLocalizacao9: TDBLookupComboBox;
    Label35: TLabel;
    edtVencto4: TDateEdit;
    Label36: TLabel;
    edtValor4: TCurrencyEdit;
    Label37: TLabel;
    edtBanco4: TDBLookupComboBox;
    Label38: TLabel;
    edtLocalizacao4: TDBLookupComboBox;
    Label39: TLabel;
    edtVencto10: TDateEdit;
    Label40: TLabel;
    edtValor10: TCurrencyEdit;
    Label41: TLabel;
    edtBanco10: TDBLookupComboBox;
    Label42: TLabel;
    edtLocalizacao10: TDBLookupComboBox;
    Label43: TLabel;
    edtVencto5: TDateEdit;
    Label44: TLabel;
    edtValor5: TCurrencyEdit;
    Label45: TLabel;
    edtBanco5: TDBLookupComboBox;
    Label46: TLabel;
    edtLocalizacao5: TDBLookupComboBox;
    Label47: TLabel;
    edtVencto11: TDateEdit;
    Label48: TLabel;
    edtValor11: TCurrencyEdit;
    Label49: TLabel;
    edtBanco11: TDBLookupComboBox;
    Label50: TLabel;
    edtLocalizacao11: TDBLookupComboBox;
    Label51: TLabel;
    edtVencto6: TDateEdit;
    Label52: TLabel;
    edtValor6: TCurrencyEdit;
    Label53: TLabel;
    edtBanco6: TDBLookupComboBox;
    Label54: TLabel;
    edtLocalizacao6: TDBLookupComboBox;
    Label55: TLabel;
    edtVencto12: TDateEdit;
    Label56: TLabel;
    edtValor12: TCurrencyEdit;
    Label57: TLabel;
    edtBanco12: TDBLookupComboBox;
    Label58: TLabel;
    edtLocalizacao12: TDBLookupComboBox;
    tabChecagens: TZQuery;
    btnConfirmar: TBitBtn;
    btnFechar: TBitBtn;
    tabBancos: TZQuery;
    dtsBancos: TDataSource;
    tabLocalizacao: TZQuery;
    dtsLocalizacao: TDataSource;
    tbsObservacoes: TTabSheet;
    edtObservacao: TMemo;
    ckbSinalizar: TCheckBox;
    tbsVenctos13_24: TTabSheet;
    Label3: TLabel;
    edtVencto13: TDateEdit;
    Label59: TLabel;
    edtValor13: TCurrencyEdit;
    Label60: TLabel;
    edtBanco13: TDBLookupComboBox;
    Label61: TLabel;
    edtLocalizacao13: TDBLookupComboBox;
    Bevel2: TBevel;
    Label62: TLabel;
    edtVencto19: TDateEdit;
    Label63: TLabel;
    edtValor19: TCurrencyEdit;
    Label64: TLabel;
    edtBanco19: TDBLookupComboBox;
    Label65: TLabel;
    edtLocalizacao19: TDBLookupComboBox;
    Label66: TLabel;
    edtLocalizacao20: TDBLookupComboBox;
    Label67: TLabel;
    edtLocalizacao21: TDBLookupComboBox;
    Label68: TLabel;
    edtLocalizacao22: TDBLookupComboBox;
    Label69: TLabel;
    edtLocalizacao23: TDBLookupComboBox;
    Label70: TLabel;
    edtLocalizacao24: TDBLookupComboBox;
    edtBanco24: TDBLookupComboBox;
    Label71: TLabel;
    edtBanco23: TDBLookupComboBox;
    Label72: TLabel;
    edtBanco22: TDBLookupComboBox;
    Label73: TLabel;
    edtBanco21: TDBLookupComboBox;
    Label74: TLabel;
    edtBanco20: TDBLookupComboBox;
    Label75: TLabel;
    edtValor24: TCurrencyEdit;
    Label76: TLabel;
    edtValor23: TCurrencyEdit;
    Label77: TLabel;
    edtValor22: TCurrencyEdit;
    Label78: TLabel;
    edtValor21: TCurrencyEdit;
    Label79: TLabel;
    edtValor20: TCurrencyEdit;
    Label80: TLabel;
    Label81: TLabel;
    edtVencto20: TDateEdit;
    Label82: TLabel;
    edtVencto21: TDateEdit;
    Label83: TLabel;
    edtVencto22: TDateEdit;
    Label84: TLabel;
    edtVencto23: TDateEdit;
    Label85: TLabel;
    edtVencto24: TDateEdit;
    edtLocalizacao18: TDBLookupComboBox;
    Label86: TLabel;
    edtLocalizacao17: TDBLookupComboBox;
    Label87: TLabel;
    edtLocalizacao16: TDBLookupComboBox;
    Label88: TLabel;
    edtLocalizacao15: TDBLookupComboBox;
    Label89: TLabel;
    edtLocalizacao14: TDBLookupComboBox;
    Label90: TLabel;
    Label91: TLabel;
    edtBanco14: TDBLookupComboBox;
    Label92: TLabel;
    edtBanco15: TDBLookupComboBox;
    Label93: TLabel;
    edtBanco16: TDBLookupComboBox;
    Label94: TLabel;
    edtBanco17: TDBLookupComboBox;
    Label95: TLabel;
    edtBanco18: TDBLookupComboBox;
    edtValor18: TCurrencyEdit;
    Label96: TLabel;
    edtValor17: TCurrencyEdit;
    Label97: TLabel;
    edtValor16: TCurrencyEdit;
    Label98: TLabel;
    edtValor15: TCurrencyEdit;
    Label99: TLabel;
    edtValor14: TCurrencyEdit;
    Label100: TLabel;
    Label101: TLabel;
    edtVencto14: TDateEdit;
    Label102: TLabel;
    edtVencto15: TDateEdit;
    Label103: TLabel;
    edtVencto16: TDateEdit;
    Label104: TLabel;
    edtVencto17: TDateEdit;
    Label105: TLabel;
    edtVencto18: TDateEdit;
    tbsVenctos25_36: TTabSheet;
    Label106: TLabel;
    edtVencto25: TDateEdit;
    Label107: TLabel;
    edtValor25: TCurrencyEdit;
    Label108: TLabel;
    edtBanco25: TDBLookupComboBox;
    Label109: TLabel;
    edtLocalizacao25: TDBLookupComboBox;
    Bevel3: TBevel;
    Label110: TLabel;
    edtVencto31: TDateEdit;
    Label111: TLabel;
    edtValor31: TCurrencyEdit;
    Label112: TLabel;
    edtBanco31: TDBLookupComboBox;
    Label113: TLabel;
    edtLocalizacao31: TDBLookupComboBox;
    Label114: TLabel;
    edtLocalizacao32: TDBLookupComboBox;
    Label115: TLabel;
    edtLocalizacao33: TDBLookupComboBox;
    Label116: TLabel;
    edtLocalizacao34: TDBLookupComboBox;
    Label117: TLabel;
    edtLocalizacao35: TDBLookupComboBox;
    Label118: TLabel;
    edtLocalizacao36: TDBLookupComboBox;
    edtBanco36: TDBLookupComboBox;
    Label119: TLabel;
    edtBanco35: TDBLookupComboBox;
    Label120: TLabel;
    edtBanco34: TDBLookupComboBox;
    Label121: TLabel;
    edtBanco33: TDBLookupComboBox;
    Label122: TLabel;
    edtBanco32: TDBLookupComboBox;
    Label123: TLabel;
    Label124: TLabel;
    edtValor32: TCurrencyEdit;
    Label125: TLabel;
    edtValor33: TCurrencyEdit;
    Label126: TLabel;
    edtValor34: TCurrencyEdit;
    Label127: TLabel;
    edtValor35: TCurrencyEdit;
    Label128: TLabel;
    edtValor36: TCurrencyEdit;
    edtVencto36: TDateEdit;
    Label129: TLabel;
    edtVencto35: TDateEdit;
    Label130: TLabel;
    edtVencto34: TDateEdit;
    Label131: TLabel;
    Label132: TLabel;
    edtVencto33: TDateEdit;
    edtVencto32: TDateEdit;
    Label133: TLabel;
    Label134: TLabel;
    edtLocalizacao26: TDBLookupComboBox;
    Label135: TLabel;
    edtLocalizacao27: TDBLookupComboBox;
    Label136: TLabel;
    edtLocalizacao28: TDBLookupComboBox;
    Label137: TLabel;
    edtLocalizacao29: TDBLookupComboBox;
    Label138: TLabel;
    edtLocalizacao30: TDBLookupComboBox;
    edtBanco30: TDBLookupComboBox;
    Label139: TLabel;
    edtBanco29: TDBLookupComboBox;
    Label140: TLabel;
    edtBanco28: TDBLookupComboBox;
    Label141: TLabel;
    edtBanco27: TDBLookupComboBox;
    Label142: TLabel;
    edtBanco26: TDBLookupComboBox;
    Label143: TLabel;
    Label144: TLabel;
    edtValor26: TCurrencyEdit;
    Label145: TLabel;
    edtValor27: TCurrencyEdit;
    Label146: TLabel;
    edtValor28: TCurrencyEdit;
    Label147: TLabel;
    edtValor29: TCurrencyEdit;
    Label148: TLabel;
    edtValor30: TCurrencyEdit;
    edtVencto30: TDateEdit;
    Label149: TLabel;
    edtVencto29: TDateEdit;
    Label150: TLabel;
    edtVencto28: TDateEdit;
    Label151: TLabel;
    edtVencto27: TDateEdit;
    Label152: TLabel;
    edtVencto26: TDateEdit;
    Label153: TLabel;
    tbsVenctos36_48: TTabSheet;
    Label154: TLabel;
    edtVencto37: TDateEdit;
    Label155: TLabel;
    edtValor37: TCurrencyEdit;
    Label156: TLabel;
    edtBanco37: TDBLookupComboBox;
    Label157: TLabel;
    edtLocalizacao37: TDBLookupComboBox;
    Label158: TLabel;
    edtVencto43: TDateEdit;
    Label159: TLabel;
    edtValor43: TCurrencyEdit;
    Label160: TLabel;
    edtBanco43: TDBLookupComboBox;
    Label161: TLabel;
    edtLocalizacao43: TDBLookupComboBox;
    Label162: TLabel;
    edtLocalizacao44: TDBLookupComboBox;
    Label163: TLabel;
    edtLocalizacao45: TDBLookupComboBox;
    Label164: TLabel;
    edtLocalizacao46: TDBLookupComboBox;
    Label165: TLabel;
    edtLocalizacao47: TDBLookupComboBox;
    Label166: TLabel;
    edtLocalizacao48: TDBLookupComboBox;
    edtBanco48: TDBLookupComboBox;
    Label167: TLabel;
    edtBanco47: TDBLookupComboBox;
    Label168: TLabel;
    edtBanco46: TDBLookupComboBox;
    Label169: TLabel;
    edtBanco45: TDBLookupComboBox;
    Label170: TLabel;
    edtBanco44: TDBLookupComboBox;
    Label171: TLabel;
    Label172: TLabel;
    edtValor44: TCurrencyEdit;
    Label173: TLabel;
    edtValor45: TCurrencyEdit;
    Label174: TLabel;
    edtValor46: TCurrencyEdit;
    Label175: TLabel;
    edtValor47: TCurrencyEdit;
    Label176: TLabel;
    edtValor48: TCurrencyEdit;
    edtVencto48: TDateEdit;
    Label177: TLabel;
    edtVencto47: TDateEdit;
    Label178: TLabel;
    edtVencto46: TDateEdit;
    Label179: TLabel;
    edtVencto45: TDateEdit;
    Label180: TLabel;
    edtVencto44: TDateEdit;
    Label181: TLabel;
    Label182: TLabel;
    edtLocalizacao38: TDBLookupComboBox;
    edtBanco38: TDBLookupComboBox;
    Label183: TLabel;
    Label184: TLabel;
    edtValor38: TCurrencyEdit;
    edtVencto38: TDateEdit;
    Label185: TLabel;
    Label186: TLabel;
    edtVencto39: TDateEdit;
    Label187: TLabel;
    edtVencto40: TDateEdit;
    Label188: TLabel;
    edtVencto41: TDateEdit;
    Label189: TLabel;
    edtVencto42: TDateEdit;
    edtValor42: TCurrencyEdit;
    Label190: TLabel;
    edtValor41: TCurrencyEdit;
    Label191: TLabel;
    edtValor40: TCurrencyEdit;
    Label192: TLabel;
    edtValor39: TCurrencyEdit;
    Label193: TLabel;
    Label194: TLabel;
    edtBanco39: TDBLookupComboBox;
    Label195: TLabel;
    edtBanco40: TDBLookupComboBox;
    Label196: TLabel;
    edtBanco41: TDBLookupComboBox;
    Label197: TLabel;
    edtBanco42: TDBLookupComboBox;
    edtLocalizacao42: TDBLookupComboBox;
    Label198: TLabel;
    edtLocalizacao41: TDBLookupComboBox;
    Label199: TLabel;
    edtLocalizacao40: TDBLookupComboBox;
    Label200: TLabel;
    edtLocalizacao39: TDBLookupComboBox;
    Label201: TLabel;
    Bevel4: TBevel;
    tbsVenctos49_60: TTabSheet;
    Label202: TLabel;
    edtVencto49: TDateEdit;
    Label203: TLabel;
    edtVencto50: TDateEdit;
    Label204: TLabel;
    edtVencto51: TDateEdit;
    Label205: TLabel;
    edtVencto52: TDateEdit;
    Label206: TLabel;
    edtVencto53: TDateEdit;
    Label207: TLabel;
    edtVencto54: TDateEdit;
    edtValor54: TCurrencyEdit;
    Label208: TLabel;
    edtValor53: TCurrencyEdit;
    Label209: TLabel;
    edtValor52: TCurrencyEdit;
    Label210: TLabel;
    edtValor51: TCurrencyEdit;
    Label211: TLabel;
    edtValor50: TCurrencyEdit;
    Label212: TLabel;
    edtValor49: TCurrencyEdit;
    Label213: TLabel;
    Label214: TLabel;
    edtBanco49: TDBLookupComboBox;
    Label215: TLabel;
    edtLocalizacao49: TDBLookupComboBox;
    Label216: TLabel;
    edtBanco50: TDBLookupComboBox;
    edtLocalizacao50: TDBLookupComboBox;
    Label217: TLabel;
    Label218: TLabel;
    edtLocalizacao51: TDBLookupComboBox;
    edtBanco51: TDBLookupComboBox;
    Label219: TLabel;
    Label220: TLabel;
    edtBanco52: TDBLookupComboBox;
    Label221: TLabel;
    edtBanco53: TDBLookupComboBox;
    Label222: TLabel;
    edtBanco54: TDBLookupComboBox;
    edtLocalizacao54: TDBLookupComboBox;
    Label223: TLabel;
    edtLocalizacao53: TDBLookupComboBox;
    Label224: TLabel;
    edtLocalizacao52: TDBLookupComboBox;
    Label225: TLabel;
    Bevel5: TBevel;
    edtVencto60: TDateEdit;
    Label226: TLabel;
    edtVencto59: TDateEdit;
    Label227: TLabel;
    edtVencto58: TDateEdit;
    Label228: TLabel;
    edtVencto57: TDateEdit;
    Label229: TLabel;
    edtVencto56: TDateEdit;
    Label230: TLabel;
    edtVencto55: TDateEdit;
    Label231: TLabel;
    Label232: TLabel;
    edtValor55: TCurrencyEdit;
    Label233: TLabel;
    edtBanco55: TDBLookupComboBox;
    edtLocalizacao55: TDBLookupComboBox;
    Label234: TLabel;
    Label235: TLabel;
    edtLocalizacao56: TDBLookupComboBox;
    edtBanco56: TDBLookupComboBox;
    Label236: TLabel;
    Label237: TLabel;
    edtValor56: TCurrencyEdit;
    Label238: TLabel;
    edtValor57: TCurrencyEdit;
    Label239: TLabel;
    edtValor58: TCurrencyEdit;
    Label240: TLabel;
    edtValor59: TCurrencyEdit;
    Label241: TLabel;
    edtValor60: TCurrencyEdit;
    edtBanco60: TDBLookupComboBox;
    Label242: TLabel;
    Label243: TLabel;
    edtLocalizacao60: TDBLookupComboBox;
    edtLocalizacao59: TDBLookupComboBox;
    Label244: TLabel;
    edtBanco59: TDBLookupComboBox;
    Label245: TLabel;
    edtBanco58: TDBLookupComboBox;
    Label246: TLabel;
    Label247: TLabel;
    edtLocalizacao58: TDBLookupComboBox;
    edtLocalizacao57: TDBLookupComboBox;
    Label248: TLabel;
    Label249: TLabel;
    edtBanco57: TDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure edtTipoTituloCloseUp(Sender: TObject);
    procedure edtFavorecidoEnter(Sender: TObject);
    procedure edtCodigoChange(Sender: TObject);
    procedure edtCodigoCCChange(Sender: TObject);
    procedure edtCodigoEmpresaChange(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnLocalizarCCClick(Sender: TObject);
    procedure btnLocalizarEmpresaClick(Sender: TObject);
    procedure edtParcelasKeyPress(Sender: TObject; var Key: Char);
    procedure edtDocumentoKeyPress(Sender: TObject; var Key: Char);
    procedure edtNFKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtParcelasExit(Sender: TObject);
    procedure edtFavorecidoCloseUp(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmGerarPendentesTitulos: TfmGerarPendentesTitulos;

implementation

uses uFormBase, uTipos, uLocalizarGenerico, uMenu, uLocalizarClientes,
  uFuncoes, uLocalizarCentroCusto, uLocalizarFuncionarios;

{$R *.dfm}

procedure TfmGerarPendentesTitulos.FormCreate(Sender: TObject);
begin
  inherited;
  SetFormStyle(fsMDIChild);
end;

procedure TfmGerarPendentesTitulos.edtTipoTituloCloseUp(Sender: TObject);
begin
  inherited;
  if edtTipoTitulo.ItemIndex = 0 then
  begin
    edtFavorecido.ItemIndex:=-1;
    edtFavorecido.Enabled:=False;
    lblTipo.Caption:='Cliente';
   end
  else
  begin
    edtFavorecido.ItemIndex:=-1;
    edtFavorecido.Enabled:=True;
  end;
end;

procedure TfmGerarPendentesTitulos.edtFavorecidoEnter(Sender: TObject);
begin
  inherited;
  if edtTipoTitulo.ItemIndex < 0 then
  begin
    ShowMEssage('Obrigatório Preenchimento do Tipo do Título');
    edtTipoTitulo.SetFocus;
    exit;
  end;
end;

procedure TfmGerarPendentesTitulos.edtCodigoChange(Sender: TObject);
begin
  inherited;
  if edtTipoTitulo.ItemIndex >= 0 then
  begin
    if edtTipoTitulo.ItemIndex = 1 then
    begin
      if edtFavorecido.ItemIndex < 0 then exit;
    end;
    if Trim(edtCodigo.Text) <> '' then
    begin
      if edtTipoTitulo.ItemIndex = 1 then
      begin
        tabChecagens.Close;
        tabChecagens.SQL.Clear;
        if edtFavorecido.Items.Strings[edtFavorecido.ItemIndex] = 'Banco' then
        begin
          tabChecagens.SQL.Add('SELECT Codigo,Descricao FROM bancos WHERE Codigo = '+edtCodigo.Text);
          tabChecagens.Open;
          if tabChecagens.RecordCount > 0 then
          begin
            edtNome.Text:=tabChecagens.FieldByName('Descricao').AsString;
           end
          else
          begin
            edtNome.Text:='';
          end;
         end
        else if edtFavorecido.Items.Strings[edtFavorecido.ItemIndex] = 'Fornecedor' then
        begin
          tabChecagens.SQL.Add('SELECT CodigoFornecedor,NomeFantasia FROM fornecedores WHERE CodigoFornecedor = '+edtCodigo.Text);
          tabChecagens.Open;
          if tabChecagens.RecordCount > 0 then
          begin
            edtNome.Text:=tabChecagens.FieldByName('NomeFantasia').AsString;
           end
          else
          begin
            edtNome.Text:='';
          end;
         end
        else if edtFavorecido.Items.Strings[edtFavorecido.ItemIndex] = 'Funcionário' then
        begin
          tabChecagens.SQL.Add('SELECT Codigo,Nome FROM funcionarios WHERE Codigo = '+edtCodigo.Text);
          tabChecagens.Open;
          if tabChecagens.RecordCount > 0 then
          begin
            edtNome.Text:=tabChecagens.FieldByName('Nome').AsString;
           end
          else
          begin
            edtNome.Text:='';
          end;
         end
        else if edtFavorecido.Items.Strings[edtFavorecido.ItemIndex] = 'Transportadora' then
        begin
          tabChecagens.SQL.Add('SELECT Codigo,Nome FROM transportadoras WHERE Codigo = '+edtCodigo.Text);
          tabChecagens.Open;
          if tabChecagens.RecordCount > 0 then
          begin
            edtNome.Text:=tabChecagens.FieldByName('Nome').AsString;
           end
          else
          begin
            edtNome.Text:='';
          end;
        end;
       end
      else begin
        tabChecagens.Close;
        tabChecagens.SQL.Clear;
        tabChecagens.SQL.Add('SELECT CodigoCliente,NomeFantasia FROM clientes WHERE CodigoCliente = '+edtCodigo.Text);
        tabChecagens.Open;
        if tabChecagens.RecordCount > 0 then
        begin
          edtNome.Text:=tabChecagens.FieldByName('NomeFantasia').AsString;
         end
        else
        begin
          edtNome.Text:='';
        end;
      end;
     end
    else begin
      edtNome.Text:='';
    end;
  end;
end;

procedure TfmGerarPendentesTitulos.edtCodigoCCChange(Sender: TObject);
begin
  inherited;
  if Trim(edtCodigoCC.Text) <> '' then
  begin
    tabChecagens.Close;
    tabChecagens.SQL.Clear;
    tabChecagens.SQL.Add('SELECT Codigo,Descricao FROM centro_custo WHERE Codigo = '+QuotedStr(edtCodigoCC.Text));
    tabChecagens.Open;
    if tabChecagens.RecordCount > 0 then
    begin
      edtCC.Text:=tabChecagens.FieldByName('Descricao').AsString;
     end
    else
    begin
      edtCC.Text:='';
    end;
   end
  else begin
    edtCC.Text:='';
  end;
end;

procedure TfmGerarPendentesTitulos.edtCodigoEmpresaChange(Sender: TObject);
begin
  inherited;
  if Trim(edtCodigoEmpresa.Text) <> '' then
  begin
    tabChecagens.Close;
    tabChecagens.SQL.Clear;
    tabChecagens.SQL.Add('SELECT CodigoEmpresa,NomeFantasia FROM empresas WHERE CodigoEmpresa = '+edtCodigoEmpresa.Text);
    tabChecagens.Open;
    if tabChecagens.RecordCount > 0 then
    begin
      edtNomeEmpresa.Text:=tabChecagens.FieldByName('NomeFantasia').AsString;
     end
    else
    begin
      edtNomeEmpresa.Text:='';
    end;
   end
  else begin
    edtNomeEmpresa.Text:='';
  end;
end;

procedure TfmGerarPendentesTitulos.btnLocalizarClick(Sender: TObject);
var vParamLoc : TParametrosLocalizar;
begin
   inherited;
   if edtTipoTitulo.ItemIndex = 1 then begin
      if edtFavorecido.Items.Strings[edtFavorecido.ItemIndex] = 'Banco' then begin
         vParamLoc.Table:='bancos';
         vParamLoc.KeyField:='Codigo';
         vParamLoc.Field1:='Descricao';
         vParamLoc.Filter:='';
       end
      else if edtFavorecido.Items.Strings[edtFavorecido.ItemIndex] = 'Fornecedor' then begin
         vParamLoc.Table:='fornecedores';
         vParamLoc.KeyField:='CodigoFornecedor';
         vParamLoc.Field1:='NomeFantasia';
         vParamLoc.Filter:='';
       end
      else if edtFavorecido.Items.Strings[edtFavorecido.ItemIndex] = 'Funcionário' then begin
         if not Assigned (fmLocalizarFuncionarios) then begin
            Application.CreateForm(TfmLocalizarFuncionarios, fmLocalizarFuncionarios);
            fmLocalizarFuncionarios.ShowModal;
         end;
       end
      else if edtFavorecido.Items.Strings[edtFavorecido.ItemIndex] = 'Transportadora' then begin
         vParamLoc.Table:='transportadoras';
         vParamLoc.KeyField:='Codigo';
         vParamLoc.Field1:='Nome';
         vParamLoc.Filter:='';
      end;
      if edtFavorecido.Items.Strings[edtFavorecido.ItemIndex] <> 'Funcionário' then begin
         if not Assigned(fmLocalizarGenerico) then begin
            Application.CreateForm(TfmLocalizarGenerico, fmLocalizarGenerico);
            fmLocalizarGenerico.LoadParams(vParamLoc);
            fmLocalizarGenerico.ShowModal;
         end;
      end;
      if Trim(fmMenu.pubTrans1) <> '' then begin
         edtCodigo.Text:=fmMenu.pubTrans1;
      end;
    end
   else begin
      if not Assigned (fmLocalizarClientes) then begin
         Application.CreateForm(TfmLocalizarClientes, fmLocalizarClientes);
         fmLocalizarClientes.ShowModal;
      end;
      if Trim(fmMenu.pubTrans1) <> '' then begin
         edtCodigo.Text:=fmMenu.pubTrans1;
      end;
   end;
end;

procedure TfmGerarPendentesTitulos.btnFecharClick(Sender: TObject);
begin
   inherited;
   Close;
end;

procedure TfmGerarPendentesTitulos.btnLocalizarCCClick(Sender: TObject);
begin
   if not Assigned(fmLocalizarCentroCusto) then begin
      Application.CreateForm(TfmLocalizarCentroCusto, fmLocalizarCentroCusto);
      fmLocalizarCentroCusto.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edtCodigoCC.Text:=fmMenu.pubTrans1;
   end;   
end;

procedure TfmGerarPendentesTitulos.btnLocalizarEmpresaClick(
  Sender: TObject);
var vParamLoc : TParametrosLocalizar;
begin
   vParamLoc.Table:='empresas';
   vParamLoc.KeyField:='CodigoEmpresa';
   vParamLoc.Field1:='NomeFantasia';
   vParamLoc.Filter:='';
   if not Assigned(fmLocalizarGenerico) then begin
      Application.CreateForm(TfmLocalizarGenerico, fmLocalizarGenerico);
      fmLocalizarGenerico.LoadParams(vParamLoc);
      fmLocalizarGenerico.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edtCodigoEmpresa.Text:=fmMenu.pubTrans1;
   end;
end;

procedure TfmGerarPendentesTitulos.edtParcelasKeyPress(Sender: TObject;
  var Key: Char);
begin
   inherited;
   if not (Key in['0'..'9',Chr(8)]) then Key:=#0;
end; 

procedure TfmGerarPendentesTitulos.edtDocumentoKeyPress(Sender: TObject;
  var Key: Char);
begin
   inherited;
   if not (Key in['0'..'9',Chr(8)]) then Key:=#0; 
end;

procedure TfmGerarPendentesTitulos.edtNFKeyPress(Sender: TObject;
  var Key: Char);
begin
   inherited;
   if not (Key in['0'..'9',Chr(8)]) then Key:=#0;
end;

procedure TfmGerarPendentesTitulos.FormShow(Sender: TObject);
begin
   inherited;
   tabBancos.SQL.Add('SELECT * FROM bancos ORDER BY Descricao');
   tabBancos.Open;

   tabLocalizacao.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('7')+' ORDER BY Descricao');
   tabLocalizacao.Open;
end;

procedure TfmGerarPendentesTitulos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabBancos.Close;
   tabLocalizacao.Close;
   inherited;
end;

procedure TfmGerarPendentesTitulos.edtParcelasExit(Sender: TObject);
var vCnt: Integer;
begin
  inherited;

  if (StrToInt(edtParcelas.Text) <= 0) or (StrToInt(edtParcelas.Text) > 60) then
  begin
    ShowMessage('Valor Inválido - Parcelas entre 1 e 60');
    edtParcelas.SetFocus;
    exit;
  end;

  if Trim(edtVencto0.Text) = '/  /' then
  begin
    ShowMessage('Obrigatório Preenchimento do Vencto 1');
    edtVencto0.SetFocus;
    exit;
  end;

  edtVencto1.Date:=edtVencto0.Date;

  for vCnt:=2 to StrToInt(edtParcelas.Text) do
  begin
    TDateEdit(FindComponent('edtVencto'+IntToStr(vCnt))).Date:=TDateEdit(FindComponent('edtVencto'+IntToStr(vCnt-1))).Date + 30;
  end;
end;

procedure TfmGerarPendentesTitulos.edtFavorecidoCloseUp(Sender: TObject);
begin
  inherited;
  lblTipo.Caption:=edtFavorecido.Items.Strings[edtFavorecido.ItemIndex];
end;

procedure TfmGerarPendentesTitulos.btnConfirmarClick(Sender: TObject);
var vCnt, vGerados: Integer;
begin
   inherited;
   if edtTipoTitulo.ItemIndex < 0 then begin
      ShowMessage('Obrigatório Preenchimento do Tipo do Título');
      edtTipoTitulo.SetFocus;
      exit;
   end;
   if edtTipoTitulo.ItemIndex = 1 then begin
      if edtFavorecido.ItemIndex < 0 then begin
         ShowMessage('Obrigatório Preenchimento do Tipo do Título');
         edtTipoTitulo.SetFocus;
         exit;
      end;
   end;
   if Trim(edtCodigo.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Código');
      edtCodigo.SetFocus;
      exit;
   end;
   if Trim(edtVencto0.Text) = '/  /' then begin
      ShowMessage('Obrigatório Preenchimento do Vencto 1');
      edtVencto0.SetFocus;
      exit;
   end;
   if Trim(edtCodigoCC.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Centro de Custo');
      edtCodigoCC.SetFocus;
      exit;
   end;
   if Trim(edtCodigoEmpresa.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Empresa');
      edtCodigoEmpresa.SetFocus;
      exit;
   end;
   if Trim(edtParcelas.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Parcela');
      edtParcelas.SetFocus;
      exit;
   end;

//   if Trim(edtDocumento.Text) = '' then begin
//      ShowMessage('Obrigatório Preenchimento do Documento');
//      edtDocumento.SetFocus;
//      exit;
//   end;
//   if Trim(edtNF.Text) = '' then begin
//      ShowMessage('Obrigatório Preenchimento da NF');
//      edtNF.SetFocus;
//      exit;
//   end;

  vGerados:=0;

  for vCnt:=1 to 60 do
  begin
    if Trim(TDateEdit(FindComponent('edtVencto'+IntToStr(vCnt))).Text) <> '/  /' then
    begin
      if TCurrencyEdit(FindComponent('edtValor'+IntToStr(vCnt))).Value > 0 then
      begin
        tabChecagens.Close;
        tabChecagens.SQL.Clear;
        case edtTipoTitulo.ItemIndex of
          0: tabChecagens.SQL.Add('SELECT * FROM titulos_receber WHERE 0');
          1: tabChecagens.SQL.Add('SELECT * FROM titulos_pagar WHERE 0');
        end;
        tabChecagens.Open;
        tabChecagens.Append;
        case edtTipoTitulo.ItemIndex of
          0: begin
            tabChecagens.FieldByName('Titulo').AsFloat:=CodeGenerator('titulos_receber', 'Titulo');
            tabChecagens.FieldByName('ImpressoBoleto').AsString:='Não';
            tabChecagens.FieldByName('GeradoRemessa').AsString:='Não';
            if Trim(edtDocumento.Text) <> '' then
            begin
              tabChecagens.FieldByName('Documento').AsFloat:=StrToFloat(edtDocumento.Text);
             end
            else
            begin
              tabChecagens.FieldByName('Documento').AsFloat:=CodeGenerator('titulos_receber', 'Documento');
            end;
          end;
          1: begin 
            tabChecagens.FieldByName('Titulo').AsFloat:=CodeGenerator('titulos_pagar', 'Titulo');
            if Trim(edtDocumento.Text) <> '' then
            begin
              tabChecagens.FieldByName('Documento').AsFloat:=StrToFloat(edtDocumento.Text);
             end
            else
            begin
              tabChecagens.FieldByName('Documento').AsFloat:=CodeGenerator('titulos_pagar', 'Documento');
            end;
          end;
        end;

        if edtTipoTitulo.ItemIndex = 0 then
        begin
          tabChecagens.FieldByName('TipoConta').AsString:='1';
         end
        else
        begin
          case edtFavorecido.ItemIndex of
            0: begin
              tabChecagens.FieldByName('TipoConta').AsString:='4';
              tabChecagens.FieldByName('DescricaoConta').AsString:='Banco';
            end;
            1: begin
              tabChecagens.FieldByName('TipoConta').AsString:='1';
              tabChecagens.FieldByName('DescricaoConta').AsString:='Fornecedor';
            end;
            2: begin
              tabChecagens.FieldByName('TipoConta').AsString:='2';
              tabChecagens.FieldByName('DescricaoConta').AsString:='Funcionário';
            end;
            3: begin
              tabChecagens.FieldByName('TipoConta').AsString:='3';
              tabChecagens.FieldByName('DescricaoConta').AsString:='Transportadora';
            end;
          end;
        end;

        if ckbSinalizar.Checked = True then
        begin
          tabChecagens.FieldByName('Sinalizado').AsInteger:=1;
         end
        else
        begin
          tabChecagens.FieldByName('Sinalizado').AsInteger:=0;
        end;
        tabChecagens.FieldByName('CodigoConta').AsFloat:=StrToFloat(edtCodigo.Text);
        tabChecagens.FieldByName('Parcela').AsInteger:=vCnt;
        if Trim(TDBLookupComboBox(FindComponent('edtLocalizacao'+IntToStr(vCnt))).Text) <> '' then
        begin
          tabChecagens.FieldByName('CodigoLocalizacao').AsFloat:=StrToFloat(TDBLookupComboBox(FindComponent('edtLocalizacao'+IntToStr(vCnt))).KeyValue);
        end;
        tabChecagens.FieldByName('CodigoEmpresa').AsFloat:=StrToFloat(edtCodigoEmpresa.Text);
        tabChecagens.FieldByName('ValorTotal').AsFloat:=TCurrencyEdit(FindComponent('edtValor'+IntToStr(vCnt))).Value;
        tabChecagens.FieldByName('DataEmissao').AsDateTime:=Date;
        tabChecagens.FieldByName('DataVencimento').AsDateTime:=TDateEdit(FindComponent('edtVencto'+IntToStr(vCnt))).Date;
        tabChecagens.FieldByName('NotaFiscal').AsString:=edtNF.Text;
        tabChecagens.FieldByName('CodigoCentroCusto').AsString:=edtCodigoCC.Text;
        tabChecagens.FieldByName('Historico').AsString:='Gerado Automaticamente: '+FormatDateTime('dd/MM/yyyy hh:nn:ss', Now);
        tabChecagens.FieldByName('Observacao').AsString:=edtObservacao.Text;
        tabChecagens.Post; 
        tabChecagens.ApplyUpDates;

        TCurrencyEdit(FindComponent('edtValor'+IntToStr(vCnt))).Value:=0;
        TDateEdit(FindComponent('edtVencto'+IntToStr(vCnt))).Clear;
        TDBLookupComboBox(FindComponent('edtLocalizacao'+IntToStr(vCnt))).KeyValue:=NULL;
        TDBLookupComboBox(FindComponent('edtBanco'+IntToStr(vCnt))).KeyValue:=NULL;

        vGerados:=vGerados + 1; 
      end;
    end;
  end;
  edtObservacao.Text:='';
  ShowMessage('Títulos Gerados: '+IntToStr(vGerados));
end;

end.

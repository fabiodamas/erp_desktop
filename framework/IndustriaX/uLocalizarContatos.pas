unit uLocalizarContatos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, DBCtrls, Buttons, Grids, DBGrids,
  ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TfmLocalizarContatos = class(TfmFormBaseAvancado)
    lbl_codigo: TLabel;
    edtCodigo: TEdit;
    edtNomeFantasia: TEdit;
    Label1: TLabel;
    edtRazaoSocial: TEdit;
    Label2: TLabel;
    edtPais: TDBLookupComboBox;
    Label3: TLabel;
    Label28: TLabel;
    edtCidade: TDBLookupComboBox;
    Label34: TLabel;
    edtEndereco: TEdit;
    Label4: TLabel;
    rdgTipoPessoa: TRadioGroup;
    edtCnpjCpf: TEdit;
    Label5: TLabel;
    edtIeRg: TEdit;
    Label6: TLabel;
    dbgLocalizarContatos: TDBGrid;
    edtCodigoSelecionado: TEdit;
    edtNomeSelecionado: TEdit;
    btnOK: TBitBtn;
    btnCancelar: TBitBtn;
    edtEstado: TComboBox;
    tabContatos: TZQuery;
    dtsContatos: TDataSource;
    tabPaises: TZQuery;
    dtsPaises: TDataSource;
    tabCidades: TZQuery;
    dtsCidades: TDataSource;
    Label7: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dbgLocalizarContatosCellClick(Column: TColumn);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCidadeEnter(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure edtCodigoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNomeFantasiaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtRazaoSocialKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPaisCloseUp(Sender: TObject);
    procedure edtEstadoCloseUp(Sender: TObject);
    procedure edtCidadeCloseUp(Sender: TObject);
    procedure edtEnderecoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rdgTipoPessoaClick(Sender: TObject);
    procedure edtCnpjCpfKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtIeRgKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
  private
    procedure LoadData(pLimit: boolean = False);
  public
    { Public declarations }
  end;

var
  fmLocalizarContatos: TfmLocalizarContatos;

implementation

uses uFormBaseConfig, uConstantes, uMenu;

{$R *.dfm}

procedure TfmLocalizarContatos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabContatos.Close;
   tabPaises.Close;
   tabCidades.Close;
   inherited;
   fmLocalizarContatos:=nil;
end;

procedure TfmLocalizarContatos.FormCreate(Sender: TObject);
begin
   inherited; 
   SetFormStyle(fsNormal);
end;

procedure TfmLocalizarContatos.dbgLocalizarContatosCellClick(
  Column: TColumn);
begin
   if tabContatos.RecordCount > 0 then begin
      edtCodigoSelecionado.Text:=FloatToStr(tabContatos.FieldByName('CodigoContato').AsFloat);
      edtNomeSelecionado.Text:=tabContatos.FieldByName('NomeFantasia').AsString;
   end; 
end; 

procedure TfmLocalizarContatos.btnCancelarClick(Sender: TObject);
begin
   fmMenu.pubTrans1:='';
   Close;
end;

procedure TfmLocalizarContatos.FormShow(Sender: TObject);
begin
   inherited;

   fmMenu.pubTrans1:='';

   tabPaises.SQL.Add('SELECT * FROM paises ORDER BY Pais'); 
   tabPaises.Open;

   tabCidades.SQL.Add('SELECT * FROM cidades WHERE 0');
   tabCidades.Open;

   LoadData;
end;

procedure TfmLocalizarContatos.edtCidadeEnter(Sender: TObject);
begin
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

procedure TfmLocalizarContatos.btnOKClick(Sender: TObject);
begin
   if Trim(edtCodigoSelecionado.Text) <> '' then begin
      fmMenu.pubTrans1:=edtCodigoSelecionado.Text;
      Close;
    end
   else begin
      ShowMessage('Selecione um Registro para Confirmar');
   end;
end;

procedure TfmLocalizarContatos.edtCodigoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarContatos.edtNomeFantasiaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarContatos.edtRazaoSocialKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarContatos.edtPaisCloseUp(Sender: TObject);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarContatos.edtEstadoCloseUp(Sender: TObject);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarContatos.edtCidadeCloseUp(Sender: TObject);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarContatos.edtEnderecoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarContatos.rdgTipoPessoaClick(Sender: TObject);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarContatos.edtCnpjCpfKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarContatos.edtIeRgKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarContatos.LoadData(pLimit : boolean);
var vWhere : string;
begin
   vWhere:='';
   
   tabContatos.Close;
   tabContatos.SQL.Clear;
   tabContatos.SQL.Add('SELECT contatos.CodigoContato, contatos.NomeFantasia,');
   tabContatos.SQL.Add('contatos.RazaoSocial,contatos.Estado,contatos.Telefone1 AS Telefone,');
   tabContatos.SQL.Add('cidades.Cidade AS Cidade');
   tabContatos.SQL.Add('FROM contatos');
   tabContatos.SQL.Add('LEFT JOIN cidades ON cidades.CodigoCidade = contatos.CodigoCidade');   

   if Trim(edtCodigo.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'CodigoContato = '+edtCodigo.Text;
   end;

   if Trim(edtNomeFantasia.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'Upper(NomeFantasia) LIKE '+QuotedStr(UpperCase('%'+edtNomeFantasia.Text)+'%');
   end;

   if Trim(edtRazaoSocial.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'Upper(RazaoSocial) LIKE '+QuotedStr(UpperCase('%'+edtRazaoSocial.Text)+'%');
   end;

   if Trim(edtPais.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'contatos.CodigoPais = '+QuotedStr(edtPais.KeyValue);
   end;

   if Trim(edtEstado.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'contatos.Estado = '+QuotedStr(edtEstado.Text);
   end;

   if Trim(edtCidade.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'contatos.CodigoCidade = '+QuotedStr(edtCidade.KeyValue);
   end;

   if Trim(edtEndereco.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'Upper(Endereco) LIKE '+QuotedStr(UpperCase('%'+edtEndereco.Text)+'%');
   end;

   if rdgTipoPessoa.ItemIndex >= 0 then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'TipoContato = '+IntToStr(rdgTipoPessoa.ItemIndex);
   end;

   if Trim(edtCnpjCpf.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'CpfCnpj LIKE '+QuotedStr('%'+edtCnpjCpf.Text+'%');
   end;

   if Trim(edtIeRg.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'IERG LIKE '+QuotedStr('%'+edtIeRg.Text+'%');
   end;

   if Trim(vWhere) <> '' then begin
      tabContatos.SQL.Add('WHERE');
      tabContatos.SQL.Add(vWhere);
   end;

   tabContatos.SQL.Add('ORDER BY CodigoContato');

   if pLimit = True then begin
      tabContatos.SQL.Add(db_limite_cmd+ ' '+ IntToStr(db_limite_registros));
   end;

   tabContatos.Open;
end;

procedure TfmLocalizarContatos.edtCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
   inherited;
   if not (Key in['0'..'9',Chr(8)]) then Key:=#0;
end;

end.

unit uLocalizarClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, DBCtrls, Buttons, Grids, DBGrids,
  ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TfmLocalizarClientes = class(TfmFormBaseAvancado)
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
    dbgLocalizarClientes: TDBGrid;
    edtCodigoSelecionado: TEdit;
    edtNomeSelecionado: TEdit;
    btnOK: TBitBtn;
    btnCancelar: TBitBtn;
    edtEstado: TComboBox;
    tabClientes: TZQuery;
    dtsClientes: TDataSource;
    tabPaises: TZQuery;
    dtsPaises: TDataSource;
    tabCidades: TZQuery;
    dtsCidades: TDataSource;
    Label7: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dbgLocalizarClientesCellClick(Column: TColumn);
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
  fmLocalizarClientes: TfmLocalizarClientes;

implementation

uses uFormBaseConfig, uConstantes, uMenu;

{$R *.dfm}

procedure TfmLocalizarClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabClientes.Close;
   tabPaises.Close;
   tabCidades.Close;
   inherited;
   fmLocalizarClientes:=nil;
end;

procedure TfmLocalizarClientes.FormCreate(Sender: TObject);
begin
   inherited; 
   SetFormStyle(fsNormal);
end;

procedure TfmLocalizarClientes.dbgLocalizarClientesCellClick(
  Column: TColumn);
begin
   if tabClientes.RecordCount > 0 then begin
      edtCodigoSelecionado.Text:=FloatToStr(tabClientes.FieldByName('CodigoCliente').AsFloat);
      edtNomeSelecionado.Text:=tabClientes.FieldByName('NomeFantasia').AsString;
   end; 
end; 

procedure TfmLocalizarClientes.btnCancelarClick(Sender: TObject);
begin
   fmMenu.pubTrans1:='';
   Close;
end;

procedure TfmLocalizarClientes.FormShow(Sender: TObject);
begin
   inherited;

   edtNomeFantasia.SetFocus;

   fmMenu.pubTrans1:='';

   tabPaises.SQL.Add('SELECT * FROM paises ORDER BY Pais'); 
   tabPaises.Open;

   tabCidades.SQL.Add('SELECT * FROM cidades WHERE 0');
   tabCidades.Open;

   LoadData(True);
end;

procedure TfmLocalizarClientes.edtCidadeEnter(Sender: TObject);
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

procedure TfmLocalizarClientes.btnOKClick(Sender: TObject);
begin
   if Trim(edtCodigoSelecionado.Text) <> '' then begin
      fmMenu.pubTrans1:=edtCodigoSelecionado.Text;
      Close;
    end
   else begin
      ShowMessage('Selecione um Registro para Confirmar');
   end;
end;

procedure TfmLocalizarClientes.edtCodigoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarClientes.edtNomeFantasiaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarClientes.edtRazaoSocialKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarClientes.edtPaisCloseUp(Sender: TObject);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarClientes.edtEstadoCloseUp(Sender: TObject);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarClientes.edtCidadeCloseUp(Sender: TObject);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarClientes.edtEnderecoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   inherited;  
   LoadData;
end;

procedure TfmLocalizarClientes.rdgTipoPessoaClick(Sender: TObject);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarClientes.edtCnpjCpfKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarClientes.edtIeRgKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarClientes.LoadData(pLimit: boolean);
var vWhere : string;
begin
   vWhere:='';

   tabClientes.Close;
   tabClientes.SQL.Clear;
   tabClientes.SQL.Add('SELECT CodigoCliente,NomeFantasia,RazaoSocial,clientes.Estado,Telefone1 AS Telefone, cidades.Cidade AS Cidade FROM clientes');
   tabClientes.SQL.Add('LEFT JOIN cidades ON clientes.CodigoCidade = cidades.CodigoCidade');

   if Trim(edtCnpjCpf.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'IERG LIKE '+QuotedStr('%'+edtIeRg.Text+'%');
   end;

   if Trim(edtCnpjCpf.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'CpfCnpj LIKE '+QuotedStr('%'+edtCnpjCpf.Text+'%');
   end;

   if rdgTipoPessoa.ItemIndex >= 0 then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'TipoCliente = '+IntToStr(rdgTipoPessoa.ItemIndex);
   end;

   if Trim(edtEndereco.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'Upper(Endereco) LIKE '+QuotedStr(UpperCase('%'+edtEndereco.Text)+'%');
   end;

   if Trim(edtCidade.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'clientes.CodigoCidade = '+QuotedStr(edtCidade.KeyValue);
   end;

   if Trim(edtEstado.Text) <> '' then begin  
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'clientes.Estado = '+QuotedStr(edtEstado.Text);
   end;

   if Trim(edtPais.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'clientes.CodigoPais = '+QuotedStr(edtPais.KeyValue);
   end;

   if Trim(edtRazaoSocial.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'Upper(RazaoSocial) LIKE '+QuotedStr(UpperCase('%'+edtRazaoSocial.Text)+'%');
   end;

   if Trim(edtNomeFantasia.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'Upper(NomeFantasia) LIKE '+QuotedStr(UpperCase('%'+edtNomeFantasia.Text)+'%');
   end;

   if Trim(edtCodigo.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'CodigoCliente = '+edtCodigo.Text;
   end;

   if Trim(vWhere) <> '' then begin
      tabClientes.SQL.Add('WHERE');
      tabClientes.SQL.Add(vWhere);
   end;

   tabClientes.SQL.Add('ORDER BY CodigoCliente'); 
   if pLimit = True then begin
      tabClientes.SQL.Add(db_limite_cmd+ ' '+ IntToStr(db_limite_registros));
   end;
   tabClientes.Open;
end;

procedure TfmLocalizarClientes.edtCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
   inherited;
   if not (Key in['0'..'9',Chr(8)]) then Key:=#0;
end;

end.

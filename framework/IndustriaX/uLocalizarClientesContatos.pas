unit uLocalizarClientesContatos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, DBCtrls, Buttons, Grids, DBGrids,
  ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TfmLocalizarClientesContatos = class(TfmFormBaseAvancado)
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
    dbgClientes: TDBGrid;
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
    Label8: TLabel;
    dbgContatos: TDBGrid;
    Label9: TLabel;
    tabContatos: TZQuery;
    dtsContatos: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dbgClientesCellClick(Column: TColumn);
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
    procedure dbgContatosCellClick(Column: TColumn);
  private
    FTipo: string;
    procedure LoadData(pLimit: Boolean = False);
  public
    { Public declarations }
  end;

var
  fmLocalizarClientesContatos: TfmLocalizarClientesContatos;

implementation

uses uFormBaseConfig, uConstantes, uMenu;

{$R *.dfm}

procedure TfmLocalizarClientesContatos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabClientes.Close;
   tabContatos.Close;
   tabPaises.Close;
   tabCidades.Close;
   inherited;
   fmLocalizarClientesContatos:=nil;
end;

procedure TfmLocalizarClientesContatos.FormCreate(Sender: TObject);
begin
   inherited; 
   SetFormStyle(fsNormal);
   FTipo:='';
   fmMenu.pubTrans1:='';
   fmMenu.pubTrans2:='';
end;

procedure TfmLocalizarClientesContatos.dbgClientesCellClick(
  Column: TColumn);
begin
   if tabClientes.RecordCount > 0 then begin
      FTipo:='1';
      edtCodigoSelecionado.Text:=FloatToStr(tabClientes.FieldByName('CodigoCliente').AsFloat);
      edtNomeSelecionado.Text:=tabClientes.FieldByName('NomeFantasia').AsString;
   end;
end; 

procedure TfmLocalizarClientesContatos.btnCancelarClick(Sender: TObject);
begin
   fmMenu.pubTrans1:='';
   Close;
end;

procedure TfmLocalizarClientesContatos.FormShow(Sender: TObject);
begin
   inherited;

   fmMenu.pubTrans1:='';

   tabPaises.SQL.Add('SELECT * FROM paises ORDER BY Pais'); 
   tabPaises.Open;

   tabCidades.SQL.Add('SELECT * FROM cidades WHERE 0');
   tabCidades.Open;
   
   LoadData;
end;

procedure TfmLocalizarClientesContatos.edtCidadeEnter(Sender: TObject);
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

procedure TfmLocalizarClientesContatos.btnOKClick(Sender: TObject);
begin
   if Trim(edtCodigoSelecionado.Text) <> '' then begin
      fmMenu.pubTrans1:=edtCodigoSelecionado.Text;
      fmMenu.pubTrans2:=FTipo;
      Close;
    end
   else begin
      ShowMessage('Selecione um Registro para Confirmar');
   end;
end;

procedure TfmLocalizarClientesContatos.edtCodigoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarClientesContatos.edtNomeFantasiaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarClientesContatos.edtRazaoSocialKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarClientesContatos.edtPaisCloseUp(Sender: TObject);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarClientesContatos.edtEstadoCloseUp(Sender: TObject);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarClientesContatos.edtCidadeCloseUp(Sender: TObject);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarClientesContatos.edtEnderecoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarClientesContatos.rdgTipoPessoaClick(Sender: TObject);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarClientesContatos.edtCnpjCpfKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarClientesContatos.edtIeRgKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarClientesContatos.LoadData(pLimit: Boolean);
var vWhere, vWhereCli, vWhereCon: string;
begin
   vWhere:='';
   vWhereCli:='';
   vWhereCon:='';

   if Trim(edtCodigo.Text) <> '' then begin
      if Trim(vWhereCli) <> '' then vWhereCli:=vWhereCli + ' AND ';
      vWhereCli:=vWhereCli + 'CodigoCliente = '+edtCodigo.Text;

      if Trim(vWhereCon) <> '' then vWhereCon:=vWhereCon + ' AND ';
      vWhereCon:=vWhereCon + 'CodigoContato = '+edtCodigo.Text; 
   end;

   if rdgTipoPessoa.ItemIndex >= 0 then begin
      if Trim(vWhereCli) <> '' then vWhereCli:=vWhereCli + ' AND ';
      vWhereCli:=vWhereCli + 'TipoCliente = '+IntToStr(rdgTipoPessoa.ItemIndex);

      if Trim(vWhereCon) <> '' then vWhereCon:=vWhereCon + ' AND ';
      vWhereCon:=vWhereCon + 'TipoContato = '+IntToStr(rdgTipoPessoa.ItemIndex);
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
      if Trim(vWhereCli) <> '' then vWhereCli:=vWhereCli + ' AND ';
      vWhereCli:=vWhereCli + 'clientes.CodigoPais = '+QuotedStr(edtPais.KeyValue);

      if Trim(vWhereCon) <> '' then vWhereCon:=vWhereCon + ' AND ';
      vWhereCon:=vWhereCon + 'contatos.CodigoPais = '+QuotedStr(edtPais.KeyValue);   
   end;

   if Trim(edtEstado.Text) <> '' then begin
      if Trim(vWhereCli) <> '' then vWhereCli:=vWhereCli + ' AND ';
      vWhereCli:=vWhereCli + 'clientes.Estado = '+QuotedStr(edtEstado.Text);

      if Trim(vWhereCon) <> '' then vWhereCon:=vWhereCon + ' AND ';
      vWhereCon:=vWhereCon + 'contatos.Estado = '+QuotedStr(edtEstado.Text);      
   end;

   if Trim(edtCidade.Text) <> '' then begin
      if Trim(vWhereCli) <> '' then vWhereCli:=vWhereCli + ' AND ';
      vWhereCli:=vWhereCli + 'clientes.CodigoCidade = '+QuotedStr(edtCidade.KeyValue);

      if Trim(vWhereCon) <> '' then vWhereCon:=vWhereCon + ' AND ';
      vWhereCon:=vWhereCon + 'contatos.CodigoCidade = '+QuotedStr(edtCidade.KeyValue);
   end;

   if Trim(edtEndereco.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'Upper(Endereco) LIKE '+QuotedStr(UpperCase('%'+edtEndereco.Text)+'%');
   end;

   if Trim(edtCnpjCpf.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'CpfCnpj LIKE '+QuotedStr('%'+edtCnpjCpf.Text+'%'); 
   end;

   if Trim(edtIeRg.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'IERG LIKE '+QuotedStr('%'+edtIeRg.Text+'%');
   end;

   tabClientes.Close;
   tabClientes.SQL.Clear;
   tabClientes.SQL.Add('SELECT CodigoCliente,NomeFantasia,RazaoSocial,clientes.Estado,Telefone1 AS Telefone, cidades.Cidade AS Cidade');
   tabClientes.SQL.Add('FROM clientes');
   tabClientes.SQL.Add('LEFT JOIN cidades ON clientes.CodigoCidade = cidades.CodigoCidade');

   if Trim(vWhere) + Trim(vWhereCli) <> '' then begin
      tabClientes.SQL.Add('WHERE');
      if Trim(vWhere) <> '' then tabClientes.SQL.Add(vWhere);

      if (Trim(vWhere) <> '') and (Trim(vWhereCli) <> '') then begin
         tabClientes.SQL.Add('AND');
      end;

      if Trim(vWhereCli) <> '' then tabClientes.SQL.Add(vWhereCli);
   end;

   tabClientes.SQL.Add('ORDER BY CodigoCliente');

   if pLimit = True then begin
      tabClientes.SQL.Add(db_limite_cmd+ ' '+ IntToStr(db_limite_registros));
   end;
   tabClientes.Open;

   tabContatos.Close;
   tabContatos.SQL.Clear; 
   tabContatos.SQL.Add('SELECT CodigoContato,NomeFantasia,RazaoSocial,contatos.Estado,Telefone1 AS Telefone, cidades.Cidade AS Cidade');
   tabContatos.SQL.Add('FROM contatos');
   tabContatos.SQL.Add('LEFT JOIN cidades ON contatos.CodigoCidade = cidades.CodigoCidade');

   if Trim(vWhere) + Trim(vWhereCon) <> '' then begin
      tabContatos.SQL.Add('WHERE');
      if Trim(vWhere) <> '' then tabContatos.SQL.Add(vWhere);

      if (Trim(vWhere) <> '') and (Trim(vWhereCli) <> '') then begin
         tabContatos.SQL.Add('AND');
      end;

      if Trim(vWhereCon) <> '' then tabContatos.SQL.Add(vWhereCon);
   end;

   tabContatos.SQL.Add('ORDER BY CodigoContato');

   if pLimit = True then begin
      tabContatos.SQL.Add(db_limite_cmd+ ' '+ IntToStr(db_limite_registros));
   end;
   tabContatos.Open;   
end;

procedure TfmLocalizarClientesContatos.edtCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
   inherited;
   if not (Key in['0'..'9',Chr(8)]) then Key:=#0;
end;

procedure TfmLocalizarClientesContatos.dbgContatosCellClick(
  Column: TColumn);
begin
   inherited;
   if tabContatos.RecordCount > 0 then begin
      FTipo:='2';
      edtCodigoSelecionado.Text:=FloatToStr(tabContatos.FieldByName('CodigoContato').AsFloat);
      edtNomeSelecionado.Text:=tabContatos.FieldByName('NomeFantasia').AsString;
   end;
end;

end.

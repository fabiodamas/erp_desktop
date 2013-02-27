unit uCadastroEnderecos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, Menus, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Buttons, ExtCtrls, StdCtrls, DBCtrls, Mask,
  Grids, DBGrids;

type
  TfmCadastroEnderecos = class(TfmFormBaseCadastro)
    Label1: TLabel;
    edtProcurarCep: TEdit;
    edtProcurarCidade: TDBLookupComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Bevel1: TBevel;
    btnProcurar: TBitBtn;
    Label26: TLabel;
    edtCep: TDBEdit;
    edtEndereco: TDBEdit;
    Label29: TLabel;
    Label31: TLabel;
    edtBairro: TDBEdit;
    edtEstado: TDBComboBox;
    Label28: TLabel;
    edtCidade: TDBLookupComboBox;
    Label34: TLabel;
    dbgEnderecos: TDBGrid;
    edtProcurarEstado: TComboBox;
    tabCidades: TZQuery;
    dtsCidades: TDataSource;
    ckbProcurarExato: TCheckBox;
    edtCidadeDescricao: TDBEdit;
    tabProcurarCidade: TZQuery;
    dtsProcurarCidade: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnProcurarClick(Sender: TObject);
    procedure edtProcurarCidadeEnter(Sender: TObject);
    procedure edtCidadeEnter(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtProcurarCepExit(Sender: TObject);
    procedure edtCepExit(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Novo; override;
    procedure Editar; override;
    procedure Deletar; override;
    procedure Cancelar; override;
    function Checagens: Boolean; override;
  end;

var
  fmCadastroEnderecos: TfmCadastroEnderecos;

implementation

uses uFormBase, uMenu, uConstantes, uFuncoes; 

{$R *.dfm}

procedure TfmCadastroEnderecos.Novo;
begin
end;

procedure TfmCadastroEnderecos.Cancelar;
begin
end;

function TfmCadastroEnderecos.Checagens: Boolean;
begin
   Result:=False;
   if Trim(edtCep.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Cep');
      edtCep.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtEndereco.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Endereço');
      edtEndereco.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtBairro.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Bairro');
      edtBairro.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtEstado.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Estado');
      edtEstado.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtCidade.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Cidade');
      edtCidade.SetFocus;
      Result:=True;
      exit;
   end;
   if tabBase.State = dsInsert then begin
      if ExistsValue('Cep', 'cep', edtCep.Text) then begin
         ShowMessage('Cep já Existente');
         edtCep.SetFocus;
         Result:=True;
         exit;
      end;
   end;
end;

procedure TfmCadastroEnderecos.Deletar;
begin
end;

procedure TfmCadastroEnderecos.Editar;
begin
end;

procedure TfmCadastroEnderecos.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TfmCadastroEnderecos.FormShow(Sender: TObject);
begin
   inherited;
   tabBase.SQL.Add('SELECT * FROM cep ORDER BY Cep '+db_limite_cmd+' '+IntToStr(db_limite_registros));
   tabBase.Open;

   tabCidades.SQL.Add('SELECT * FROM cidades ORDER BY Cidade');
   tabCidades.Open;

   tabProcurarCidade.SQL.Add('SELECT * FROM cidades WHERE 0');
   tabProcurarCidade.Open;
end;

procedure TfmCadastroEnderecos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabBase.Close;
   tabCidades.Close;
   tabProcurarCidade.Close;
   inherited;
end;

procedure TfmCadastroEnderecos.btnNovoClick(Sender: TObject);
begin
   inherited;
   if tabBase.State = dsInsert then begin
      edtCep.SetFocus;
   end;
end;

procedure TfmCadastroEnderecos.btnProcurarClick(Sender: TObject);
var vSQL: string;
begin
   if tabBase.State = dsBrowse then begin

      vSQL:='';

      if Trim(edtProcurarCep.Text) <> '' then begin
         if Trim(vSQL) <> '' then vSQL:=vSQL+' AND ';
         if ckbProcurarExato.Checked then vSQL:=vSQL+'Cep = '+QuotedStr(edtProcurarCep.Text)
         else vSQL:=vSQL+'Cep LIKE '+QuotedStr(edtProcurarCep.Text+'%')
      end;

      if Trim(edtProcurarEstado.Text) <> '' then begin
         if Trim(vSQL) <> '' then vSQL:=vSQL+' AND ';
         vSQL:=vSQL+'Estado = '+QuotedStr(edtProcurarEstado.Text)
      end;

      if Trim(edtProcurarCidade.Text) <> '' then begin
         if Trim(vSQL) <> '' then vSQL:=vSQL+' AND ';
         vSQL:=vSQL+'CodigoCidade = '+QuotedStr(edtProcurarCidade.KeyValue)
      end;

      if Trim(vSQL) <> '' then begin
         tabBase.Close;
         tabBase.SQL.Clear;
         tabBase.SQL.Add('SELECT * FROM Cep ');
         tabBase.SQL.Add('WHERE '+vSQL);
         tabBase.SQL.Add('ORDER BY Cep');
         tabBase.Open;
      end;
   end;
end;

procedure TfmCadastroEnderecos.edtProcurarCidadeEnter(Sender: TObject);
begin
   if Trim(edtProcurarEstado.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Estado');
      edtProcurarEstado.SetFocus;
      exit;
   end;
   tabProcurarCidade.Close;
   tabProcurarCidade.SQL.Clear;
   tabProcurarCidade.SQL.Add('SELECT * FROM cidades WHERE UF = '+QuotedStr(edtProcurarEstado.Text)+' ORDER BY Cidade');
   tabProcurarCidade.Open;
end;

procedure TfmCadastroEnderecos.edtCidadeEnter(Sender: TObject);
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

procedure TfmCadastroEnderecos.btnGravarClick(Sender: TObject);
begin
   inherited;
   tabCidades.Close;
   tabCidades.SQL.Clear;
   tabCidades.SQL.Add('SELECT * FROM cidades ORDER BY Cidade');
   tabCidades.Open;
end;

procedure TfmCadastroEnderecos.btnCancelarClick(Sender: TObject);
begin
   inherited;
   tabCidades.Close;
   tabCidades.SQL.Clear;
   tabCidades.SQL.Add('SELECT * FROM cidades ORDER BY Cidade');
   tabCidades.Open;
end;

procedure TfmCadastroEnderecos.edtProcurarCepExit(Sender: TObject);
begin
  inherited;
   if Length(Trim(edtProcurarCep.Text)) >= 8 then begin
      edtProcurarCep.Text:=Desformatar(edtProcurarCep.Text);
      edtProcurarCep.Text:=FormatarCEP(edtProcurarCep.Text);
   end;
end;

procedure TfmCadastroEnderecos.edtCepExit(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      edtCep.Text:=Desformatar(edtCep.Text);
      edtCep.Text:=FormatarCEP(edtCep.Text);
      tabBase.FieldByName('Cep').AsString:=edtCep.Text;
   end; 
end;

end.

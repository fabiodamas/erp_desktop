unit uCidades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, Menus, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Buttons, ExtCtrls, Grids, DBGrids, StdCtrls,
  Mask, DBCtrls;

type
  TfmCidades = class(TfmFormBaseCadastro)
    dbgCidades: TDBGrid;
    edtCidade: TDBEdit;
    Label3: TLabel;
    edtCodigoCidade: TDBEdit;
    Label1: TLabel;
    edtEstado: TDBComboBox;
    Label28: TLabel;
    edtPais: TDBLookupComboBox;
    Label40: TLabel;
    tabPais: TZQuery;
    dtsPais: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure edtCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edtEstadoKeyPress(Sender: TObject; var Key: Char);
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
  fmCidades: TfmCidades;

implementation

uses uFormBase, uConstantes, uMenu, uFuncoes;

{$R *.dfm}

procedure TfmCidades.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TfmCidades.FormShow(Sender: TObject);
begin
   inherited;

   tabBase.SQL.Add('SELECT * FROM cidades ORDER BY Cidade '+db_limite_cmd+' '+IntToStr(db_limite_registros));
   tabBase.Open;

   tabPais.SQL.Add('SELECT * FROM paises ORDER BY Pais');
   tabPais.Open;
end;

procedure TfmCidades.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabBase.Close;
   tabPais.Close;
   inherited;
end;

procedure TfmCidades.Cancelar;
begin
end;

function TfmCidades.Checagens: Boolean;
begin
   Result:=False;
   if Trim(edtCodigoCidade.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Código da Cidade');
      edtCodigoCidade.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtEstado.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Estado UF - '+Chr(13)+'Para Exterior Digite "EX" sem aspas');
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
   if Trim(edtPais.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do País');
      edtPais.SetFocus;
      Result:=True;
      exit;
   end;
   if Length(edtCodigoCidade.Text) <> 7 then begin
      ShowMessage('O Código da Cidade deve Ser Informado com 7 Digitos Conforme Tabela do IBGE');
      edtCodigoCidade.SetFocus;
      Result:=True;
      exit;
   end;
   if (tabPais.FieldByName('CodigoPais').AsString <> '1058') then begin
      ShowMessage('País Incompatível');
      edtCodigoCidade.SetFocus;
      Result:=True;
      exit;
   end;
   if ExistsValue('CodigoCidade', 'cidades', edtCodigoCidade.Text) then begin
      ShowMessage('Código da Cidade já Existente');
      edtCodigoCidade.SetFocus;
      Result:=True;
      exit;
   end;  
end;

procedure TfmCidades.Deletar;
begin
end;

procedure TfmCidades.Editar;
begin
end;

procedure TfmCidades.Novo;
begin
end;

procedure TfmCidades.btnNovoClick(Sender: TObject);
begin
   inherited;
   if tabBase.State = dsInsert then begin
      edtCodigoCidade.SetFocus;
   end;
end;

procedure TfmCidades.edtCidadeKeyPress(Sender: TObject; var Key: Char);
begin
   Key:=UpCase(Key);
end;

procedure TfmCidades.edtEstadoKeyPress(Sender: TObject; var Key: Char);
begin
   Key:=UpCase(Key);
end;

end.

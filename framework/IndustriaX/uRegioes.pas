unit uRegioes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Menus, Buttons, ExtCtrls, StdCtrls, Mask, DBCtrls, Grids,
  DBGrids;

type
  TfmRegioes = class(TfmFormBaseCadastro)
    edtSetor: TDBEdit;
    Label26: TLabel;
    edtBairro: TDBEdit;
    Label29: TLabel;
    edtEstado: TDBComboBox;
    Label28: TLabel;
    edtCidade: TDBLookupComboBox;
    Label34: TLabel;
    dbgRegioes: TDBGrid;
    tabCidades: TZQuery;
    dtsCidades: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
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
  fmRegioes: TfmRegioes;

implementation

uses uFormBaseConfig, uMenu, uFuncoes;

{$R *.dfm}

{ TfmRegioes }

procedure TfmRegioes.Novo;
begin 
   tabBase.FieldByName('Codigo').AsFloat:=CodeGenerator('setor', 'Codigo');
end;

procedure TfmRegioes.Editar;
begin
end;

procedure TfmRegioes.Deletar;
begin
end;

procedure TfmRegioes.Cancelar;
begin
end;

function TfmRegioes.Checagens: Boolean;
begin
   Result:=False;
   if Trim(edtSetor.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Setor');
      edtSetor.SetFocus;
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
end;

procedure TfmRegioes.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end; 

procedure TfmRegioes.FormShow(Sender: TObject);
begin
   inherited;
   tabBase.SQL.Add('SELECT * FROM setor ORDER BY Setor');
   tabBase.Open;

   tabCidades.SQL.Add('SELECT * FROM cidades ORDER BY Cidade');
   tabCidades.Open;
end;

procedure TfmRegioes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabBase.Close;
   tabCidades.Close;
   inherited;
end;

procedure TfmRegioes.btnNovoClick(Sender: TObject);
begin
   inherited;
   edtSetor.SetFocus;
end;

end.

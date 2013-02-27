unit uPaises;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, Menus, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Buttons, ExtCtrls, Grids, DBGrids, StdCtrls,
  Mask, DBCtrls;

type
  TfmPaises = class(TfmFormBaseCadastro)
    edtCodigoPais: TDBEdit;
    Label1: TLabel;
    edtPais: TDBEdit;
    Label3: TLabel;
    dbgPais: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
  fmPaises: TfmPaises;

implementation

uses uFormBase, uMenu, uFuncoes;

{$R *.dfm}

procedure TfmPaises.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TfmPaises.FormShow(Sender: TObject);
begin
   inherited;
   tabBase.SQL.Add('SELECT * FROM paises ORDER BY Pais');
   tabBase.Open;
end;

procedure TfmPaises.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabBase.Close;
   inherited;
end;

function TfmPaises.Checagens: Boolean;
begin
   Result:=False;
   if Trim(edtCodigoPais.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Código do País');
      edtCodigoPais.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtPais.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do País');
      edtPais.SetFocus;
      Result:=True;
      exit;
   end;
   if Length(edtCodigoPais.Text) <> 4 then begin
      ShowMessage('Código do País deve Ser Informado com 4 Digitos Conforme Tabela do IBGE');
      edtCodigoPais.SetFocus;
      Result:=True;
      exit;
   end;
   if ExistsValue('CodigoPais', 'paises', edtCodigoPais.Text) then begin
      ShowMessage('Código do País já Existente');
      edtCodigoPais.SetFocus;
      Result:=True;
      exit;
   end;
end;

procedure TfmPaises.Cancelar;
begin
end;

procedure TfmPaises.Deletar;
begin
end;

procedure TfmPaises.Editar;
begin
end;

procedure TfmPaises.Novo;
begin
end;

end.

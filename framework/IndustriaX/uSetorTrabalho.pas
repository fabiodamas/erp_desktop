unit uSetorTrabalho;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Menus, Buttons, ExtCtrls, StdCtrls, Mask, DBCtrls, Grids,
  DBGrids;

type
  TfmSetorTrabalho = class(TfmFormBaseCadastro)
    edtSetor: TDBEdit;
    Label2: TLabel;
    edtCodigo: TDBEdit;
    Label1: TLabel;
    dbgSetor: TDBGrid;
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
  fmSetorTrabalho: TfmSetorTrabalho;

implementation

uses uFormBaseConfig, uMenu, uFuncoes;

{$R *.dfm}

{ Tfrm_setor_trabalho }

procedure TfmSetorTrabalho.Novo;
begin
   tabBase.FieldByName('Codigo').AsFloat:=CodeGenerator('genericos', 'Codigo');
   tabBase.FieldByName('Tipo').AsString:='22';      
end;

procedure TfmSetorTrabalho.Editar;
begin 
end;

procedure TfmSetorTrabalho.Deletar;
begin
end;

procedure TfmSetorTrabalho.Cancelar;
begin
end;

function TfmSetorTrabalho.Checagens: Boolean;
begin
   Result:=False;
   if Trim(edtSetor.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Setor');
      edtSetor.SetFocus;
      Result:=True;
      exit;
   end;
end;

procedure TfmSetorTrabalho.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);  
end;

procedure TfmSetorTrabalho.FormShow(Sender: TObject);
begin
   inherited;
   tabBase.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('22'));
   tabBase.Open;
end;

procedure TfmSetorTrabalho.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabBase.Close;
   inherited;
end;

end.

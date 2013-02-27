unit uCargos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Menus, Buttons, ExtCtrls, StdCtrls, Mask, DBCtrls, Grids,
  DBGrids, ImgList;

type
  TfmCargos = class(TfmFormBaseCadastro) 
    edtCodigo: TDBEdit;
    Label1: TLabel;
    edtDescricao: TDBEdit;
    Label2: TLabel;
    dbgGenericos: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
  private
  public
    procedure Novo; override;
    procedure Editar; override;
    procedure Deletar; override;
    procedure Cancelar; override;
    function Checagens: Boolean; override;
  end;

var
  fmCargos: TfmCargos;

implementation

uses uFormBaseConfig, uMenu, uFuncoes;

{$R *.dfm}

procedure TfmCargos.Novo;
begin
   if Trim(edtCodigo.Text) = '' then begin
      tabBase.FieldByName('Codigo').AsFloat:=CodeGenerator('cargos', 'Codigo');
   end;
end;

procedure TfmCargos.Editar;
begin
end;

procedure TfmCargos.Cancelar;
begin
end;

function TfmCargos.Checagens: Boolean;
begin
   Result:=False;
   if Trim(edtDescricao.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Descrição');
      edtDescricao.SetFocus;
      Result:=True;
      exit;
   end;
   if tabBase.State = dsInsert then begin
      if Trim(edtCodigo.Text) <> '' then begin
         if ExistsValue('Codigo', 'cargos', edtCodigo.Text) then begin
            ShowMessage('Código do Cargo já Existente');
            edtDescricao.SetFocus;
            Result:=True;
            exit;
         end;
      end;
   end;
end;

procedure TfmCargos.Deletar;
begin
end;

procedure TfmCargos.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TfmCargos.FormShow(Sender: TObject);
begin
   tabBase.SQL.Add('SELECT * FROM cargos ORDER BY Descricao');
   tabBase.Open;
   inherited;
end;

procedure TfmCargos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabBase.Close;
   inherited;
end;

procedure TfmCargos.btnNovoClick(Sender: TObject);
begin
   inherited;
   edtDescricao.SetFocus;
end;

end.

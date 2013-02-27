unit uTiposTabelasPrecos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Menus, Buttons, ExtCtrls, StdCtrls, Mask, DBCtrls, Grids,
  DBGrids;

type
  TfmTiposTabelasPrecos = class(TfmFormBaseCadastro)
    Label3: TLabel;
    edtDescricao: TDBEdit;
    edtCodigo: TDBEdit;
    Label1: TLabel;
    dbgTabelasPreco: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
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
  fmTiposTabelasPrecos: TfmTiposTabelasPrecos;

implementation

uses uMenu, uFuncoes, uFormBase, uLocalizarGenerico, uTipos;

{$R *.dfm}

procedure TfmTiposTabelasPrecos.Editar;
begin
end;

procedure TfmTiposTabelasPrecos.Cancelar;
begin
end;

function TfmTiposTabelasPrecos.Checagens: Boolean;
begin
   Result:=False;
   if Trim(edtDescricao.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Descrição');
      edtDescricao.SetFocus;
      Result:=True;
      exit;
   end;
end;

procedure TfmTiposTabelasPrecos.Deletar;
begin
end;

procedure TfmTiposTabelasPrecos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabBase.Close;
   inherited;
end;

procedure TfmTiposTabelasPrecos.FormShow(Sender: TObject);
begin
   inherited;
   tabBase.SQL.Add('SELECT * FROM tipos_tabela_preco');
   tabBase.Open;
end;

procedure TfmTiposTabelasPrecos.Novo;
begin
   tabBase.FieldByName('Codigo').AsFloat:=CodeGenerator('tipos_tabela_preco', 'Codigo');
end;

procedure TfmTiposTabelasPrecos.FormCreate(Sender: TObject);
begin
   inherited; 
   SetFormStyle(fsMDIChild);
end;

procedure TfmTiposTabelasPrecos.btnLocalizarClick(Sender: TObject);
var vParamLoc : TParametrosLocalizar;
begin
   inherited;
   vParamLoc.Table:='tipos_tabela_preco';
   vParamLoc.KeyField:='Codigo';
   vParamLoc.Field1:='Descricao';
   vParamLoc.Filter:='';
   if not Assigned (fmLocalizarGenerico) then begin
      Application.CreateForm(TfmLocalizarGenerico, fmLocalizarGenerico);
      fmLocalizarGenerico.LoadParams(vParamLoc);
      fmLocalizarGenerico.ShowModal;
   end;  
   if Trim(fmMenu.pubTrans1) <> '' then begin
      tabBase.Locate('Codigo', fmMenu.pubTrans1, []);
   end;     
end;

end.

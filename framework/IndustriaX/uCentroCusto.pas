unit uCentroCusto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Menus, Buttons, ExtCtrls, StdCtrls, Mask, DBCtrls, Grids,
  DBGrids;

type
  TfmCentroCusto = class(TfmFormBaseCadastro)
    edtCodigo: TDBEdit;
    Label2: TLabel;
    edtFamilia: TDBEdit;
    Label1: TLabel;
    edtDescricao: TDBEdit;
    Label3: TLabel;
    dbgCentroCusto: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
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
  fmCentroCusto: TfmCentroCusto;

implementation

uses uFormBaseConfig, uMenu, uFuncoes, uLocalizarCentroCusto;

{$R *.dfm}

{ TfmCentroCusto }

procedure TfmCentroCusto.Editar;
begin
end;

procedure TfmCentroCusto.Cancelar;
begin
end;

function TfmCentroCusto.Checagens: Boolean;
begin
   Result:=False;
   if Trim(edtCodigo.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Código');
      edtCodigo.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtFamilia.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Familia');
      edtFamilia.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtDescricao.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Descrição');
      edtDescricao.SetFocus;
      Result:=True;
      exit;
   end;
   if tabBase.State = dsInsert then begin
      if ExistsValue('Codigo', 'centro_custo', edtCodigo.Text) then begin
         ShowMessage('Código do Centro de Custo já Existente');
         edtCodigo.SetFocus;
         Result:=True;
         exit;
      end;
   end;
end;

procedure TfmCentroCusto.Deletar;
begin
end;

procedure TfmCentroCusto.Novo;
begin
end;

procedure TfmCentroCusto.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TfmCentroCusto.btnEditarClick(Sender: TObject);
begin
   inherited;
   edtCodigo.Enabled:=False;
end;

procedure TfmCentroCusto.btnGravarClick(Sender: TObject);
begin
   inherited;
   edtCodigo.Enabled:=True;
end;

procedure TfmCentroCusto.btnCancelarClick(Sender: TObject);
begin
   inherited;
   edtCodigo.Enabled:=True;
end;

procedure TfmCentroCusto.btnLocalizarClick(Sender: TObject);
begin
   inherited;
   if not Assigned (fmLocalizarCentroCusto) then begin
      Application.CreateForm(TfmLocalizarCentroCusto, fmLocalizarCentroCusto);
      fmLocalizarCentroCusto.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      tabBase.Close;
      tabBase.SQL.Clear;
      tabBase.SQL.Add('SELECT * FROM centro_custo WHERE Codigo = '+fmMenu.pubTrans1);
      tabBase.Open;
   end; 
end;

procedure TfmCentroCusto.FormShow(Sender: TObject);
begin
   inherited;
   tabBase.SQL.Add('SELECT * FROM centro_custo ORDER BY Codigo');
   tabBase.Open;
end;

procedure TfmCentroCusto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabBase.Close;
   inherited;
end;

procedure TfmCentroCusto.btnNovoClick(Sender: TObject);
begin
   inherited;
   edtCodigo.SetFocus;
end;

end.

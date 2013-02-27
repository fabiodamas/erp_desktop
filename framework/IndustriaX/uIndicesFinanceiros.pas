unit uIndicesFinanceiros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Menus, Buttons, ExtCtrls, StdCtrls, Mask, DBCtrls, Grids,
  DBGrids, ImgList, ToolEdit, RXDBCtrl;

type
  TfmIndicesFinanceiros = class(TfmFormBaseCadastro)
    Label1: TLabel;
    edtValor: TDBEdit;
    Label2: TLabel;
    dbgGenericos: TDBGrid;
    edtIndice: TDBLookupComboBox;
    edtData: TDBDateEdit;
    Label30: TLabel;
    tabTiposIndices: TZQuery;
    dtsTiposIndices: TDataSource;
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
  fmIndicesFinanceiros: TfmIndicesFinanceiros;

implementation

uses uFormBaseConfig, uMenu, uFuncoes, uTipos, uLocalizarGenerico;

{$R *.dfm}

procedure TfmIndicesFinanceiros.Cancelar;
begin
end;

procedure TfmIndicesFinanceiros.Editar;
begin 
end;

function TfmIndicesFinanceiros.Checagens: Boolean;
begin
   Result:=False;
   if Trim(edtIndice.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Indice');
      edtIndice.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtValor.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Valor');
      edtValor.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtData.Text) = '/  /' then begin
      ShowMessage('Obrigatório Preenchimento da Data');
      edtData.SetFocus;
      Result:=True;
      exit;
   end;
end;

procedure TfmIndicesFinanceiros.Deletar;
begin
end;

procedure TfmIndicesFinanceiros.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TfmIndicesFinanceiros.Novo;
begin
end;

procedure TfmIndicesFinanceiros.FormShow(Sender: TObject);
begin
   tabBase.SQL.Add('SELECT * FROM indices_financeiros ORDER BY Data DESC');
   tabBase.Open;

   tabTiposIndices.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('20'));
   tabTiposIndices.Open;

   inherited;
end;

procedure TfmIndicesFinanceiros.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabBase.Close;
   tabTiposIndices.Close;
   inherited;
end;

procedure TfmIndicesFinanceiros.btnNovoClick(Sender: TObject);
begin
   inherited;
   edtIndice.SetFocus;
end;

end.

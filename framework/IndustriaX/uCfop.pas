unit uCfop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Menus, Buttons, ExtCtrls, StdCtrls, Mask, DBCtrls, Grids,
  DBGrids;

type
  TfmCfop = class(TfmFormBaseCadastro)
    edtNaturezaOperacao: TDBEdit;
    Label2: TLabel;
    edtCFOP: TDBEdit;
    Label1: TLabel;
    dbgCFOP: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnLocalizarClick(Sender: TObject);
    procedure edtCFOPExit(Sender: TObject);
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
  fmCfop: TfmCfop;

implementation

uses uFormBaseConfig, uConstantes, uMenu, uFuncoes, uTipos,
     uLocalizarCfop;

{$R *.dfm}

{ Tfrm_cfop }

procedure TfmCfop.Novo;
begin
   tabBase.FieldByName('CodigoCFOP').AsFloat:=CodeGenerator('cfop', 'CodigoCFOP');
end;

procedure TfmCfop.Editar;
begin
end;

procedure TfmCfop.Deletar;
begin
end;

procedure TfmCfop.Cancelar;
begin
end;

function TfmCfop.Checagens: Boolean;
begin
   Result:=False;
   if Trim(edtCfop.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do CFOP');
      edtCfop.SetFocus;
      Result:=True;
      exit;
   end;
   if Length(edtCfop.Text) <> 5 then begin
      ShowMessage('Preenchimento Incorreto do CFOP');
      edtCfop.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtNaturezaOperacao.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Natureza de Operação');
      edtNaturezaOperacao.SetFocus;
      Result:=True;
      exit;
   end;
end;

procedure TfmCfop.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TfmCfop.FormShow(Sender: TObject);
begin
   inherited;
   tabBase.SQL.Add('SELECT * FROM cfop ORDER BY CFOP');
   tabBase.Open;
end;

procedure TfmCfop.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabBase.Close;
   inherited;
end;

procedure TfmCfop.btnLocalizarClick(Sender: TObject);
begin
   inherited;
   if not Assigned (fmLocalizarCfop) then begin
      Application.CreateForm(TfmLocalizarCfop, fmLocalizarCfop);
      fmLocalizarCfop.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      tabBase.Locate('CodigoCFOP', fmMenu.pubTrans1, []);
   end;
end;

procedure TfmCfop.edtCFOPExit(Sender: TObject);
begin
  inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtCFOP.Text) <> '' then begin
         edtCFOP.Text:=Desformatar(edtCFOP.Text);
         edtCFOP.Text:=FormatarCFOP(edtCFOP.Text);
         tabBase.FieldByName('CFOP').AsString:=edtCFOP.Text;
      end;
   end;
end;

procedure TfmCfop.btnNovoClick(Sender: TObject);
begin
   inherited;
   edtCFOP.SetFocus;
end;

end.

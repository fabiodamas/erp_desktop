unit uHorariosTrabalho;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Menus, Buttons, ExtCtrls, StdCtrls, Mask, DBCtrls, Grids,
  DBGrids, ImgList;

type
  TfmHorariosTrabalho = class(TfmFormBaseCadastro)
    edtSemana: TDBEdit;
    Label1: TLabel;
    edtEntrada1: TDBEdit;
    Label2: TLabel;
    dbgHorarios: TDBGrid;
    edtSaida1: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtEntrada2: TDBEdit;
    edtSaida2: TDBEdit;
    Label5: TLabel;
    edtSequencia: TDBEdit;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnLocalizarClick(Sender: TObject);
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
  fmHorariosTrabalho: TfmHorariosTrabalho;

implementation

uses uFormBaseConfig, uMenu, uFuncoes, uTipos, uLocalizarGenerico;

{$R *.dfm}

procedure TfmHorariosTrabalho.Cancelar;
begin
end;

procedure TfmHorariosTrabalho.Editar;
begin
end;

function TfmHorariosTrabalho.Checagens: Boolean;
begin
   Result:=False;
   if Trim(edtSemana.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Semana');
      edtSemana.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtEntrada1.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Hora de Entrada 1');
      edtEntrada1.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtSaida1.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Hora de Saída 1');
      edtSaida1.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtEntrada2.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Hora de Entrada 2');
      edtEntrada2.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtSaida2.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Hora de Saída 2');
      edtSaida2.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtSequencia.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Sequência');
      edtSequencia.SetFocus;
      Result:=True;
      exit;
   end;
end;

procedure TfmHorariosTrabalho.Deletar;
begin
end;

procedure TfmHorariosTrabalho.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TfmHorariosTrabalho.Novo;
begin
end;

procedure TfmHorariosTrabalho.FormShow(Sender: TObject);
begin
   tabBase.SQL.Add('SELECT * FROM horarios_trabalho ORDER BY Sequencia');
   tabBase.Open;

   tabBase.FieldByName('Entrada1').EditMask:='!90:00:00;';
   tabBase.FieldByName('Entrada2').EditMask:='!90:00:00;';
   tabBase.FieldByName('Saida1').EditMask  :='!90:00:00;';
   tabBase.FieldByName('Saida2').EditMask  :='!90:00:00;';

   if tabBase.RecordCount = 0 then begin
      tabBase.Append;
      tabBase.FieldByName('Semana').AsString:='SEG';
      tabBase.FieldByName('Sequencia').AsInteger:=1;
      tabBase.Post;
      tabBase.ApplyUpdates;

      tabBase.Append;
      tabBase.FieldByName('Semana').AsString:='TER';
      tabBase.FieldByName('Sequencia').AsInteger:=2;      
      tabBase.Post;
      tabBase.ApplyUpdates;

      tabBase.Append;
      tabBase.FieldByName('Semana').AsString:='QUA';
      tabBase.FieldByName('Sequencia').AsInteger:=3;      
      tabBase.Post;
      tabBase.ApplyUpdates;

      tabBase.Append;
      tabBase.FieldByName('Semana').AsString:='QUI';
      tabBase.FieldByName('Sequencia').AsInteger:=4;
      tabBase.Post;
      tabBase.ApplyUpdates;

      tabBase.Append;
      tabBase.FieldByName('Semana').AsString:='SEX';
      tabBase.FieldByName('Sequencia').AsInteger:=5;
      tabBase.Post;
      tabBase.ApplyUpdates;
   end;

   inherited;
end;

procedure TfmHorariosTrabalho.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabBase.Close;
   inherited;
end;

procedure TfmHorariosTrabalho.btnLocalizarClick(Sender: TObject);
var vParamLoc: TParametrosLocalizar;
begin
   inherited;
   vParamLoc.Table:='horarios_trabalho';
   vParamLoc.KeyField:='Semana';
   vParamLoc.Field1:='Entrada1';
   if not Assigned (fmLocalizarGenerico) then begin
      Application.CreateForm(TfmLocalizarGenerico, fmLocalizarGenerico);
      fmLocalizarGenerico.LoadParams(vParamLoc);
      fmLocalizarGenerico.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      tabBase.Locate('Semana', fmMenu.pubTrans1, []);
   end;
end;

procedure TfmHorariosTrabalho.btnNovoClick(Sender: TObject);
begin
   inherited;
   // edtSemana.SetFocus;
end;

end.

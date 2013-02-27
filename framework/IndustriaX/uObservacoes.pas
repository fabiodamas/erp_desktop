unit uObservacoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, Buttons, DBCtrls, ZDataset,
  ZAbstractDataset, DB, DBClient, Menus;

type
  TfmObservacoes = class(TfmFormBaseAvancado)
    btnConfirmar: TBitBtn;
    edtObservacoes: TDBMemo;
    btnCancelar: TBitBtn;
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
  private
  public
    pubApplyUpDates: boolean;
  end;

var
  fmObservacoes: TfmObservacoes;

implementation

uses uFormBase;

{$R *.dfm}

procedure TfmObservacoes.btnConfirmarClick(Sender: TObject);
begin
   inherited;
   if (edtObservacoes.DataSource.DataSet) <> nil then begin
      if edtObservacoes.DataSource.DataSet.State = dsEdit then begin
         if pubApplyUpDates = True then begin
            edtObservacoes.DataSource.DataSet.Post;
            if edtObservacoes.DataSource.DataSet is TZAbstractDataset then begin
               (edtObservacoes.DataSource.DataSet as TZAbstractDataset).ApplyUpdates;
            end;
         end;
      end;
   end;
   Close;
end;

procedure TfmObservacoes.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsNormal);
end;

procedure TfmObservacoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   inherited;
   fmObservacoes:=nil;
end;

procedure TfmObservacoes.btnCancelarClick(Sender: TObject);
begin
   inherited;
   if edtObservacoes.DataSource.DataSet <> nil then begin
      if edtObservacoes.DataSource.DataSet.State in [dsEdit,dsInsert] then begin
         if pubApplyUpDates = True then begin
            edtObservacoes.DataSource.DataSet.Cancel;
         end;
      end;
   end;
   Close;
end;

end.

unit uLocalizarGenerico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, Grids, DBGrids, StdCtrls, Buttons, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, uTipos, Menus;

type
  TfmLocalizarGenerico = class(TfmFormBaseAvancado)
    edtChave: TEdit;
    edtDescricao: TEdit;
    dbgGenerico: TDBGrid;
    btnOK: TBitBtn;
    btnCancelar: TBitBtn;
    tabBase: TZQuery;
    dtsBase: TDataSource;
    lblCodigo: TLabel;
    lblDescricao: TLabel;
    edtCodigoSelecionado: TEdit;
    edtNomeSelecionado: TEdit;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure dbgGenericoCellClick(Column: TColumn);
    procedure edtChaveKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDescricaoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FParamLoc: TParametrosLocalizar;
  public
    procedure LoadParams(pParamLoc: TParametrosLocalizar);
  end;

var
  fmLocalizarGenerico: TfmLocalizarGenerico;

implementation

uses uMenu, uFormBase, uConstantes;

{$R *.dfm}

procedure TfmLocalizarGenerico.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsNormal);
end;

procedure TfmLocalizarGenerico.FormShow(Sender: TObject);
begin
   inherited;

   edtDescricao.SetFocus;

   fmMenu.pubTrans1:='';

   tabBase.SQL.Add('SELECT '+ FParamLoc.KeyField + ', '+ FParamLoc.Field1);
   tabBase.SQL.Add(' FROM '+ FParamLoc.Table);
   if Trim(FParamLoc.Filter) <> '' then begin
      tabBase.SQL.Add(' WHERE '+ FParamLoc.Filter);
   end;
   tabBase.SQL.Add(db_limite_cmd +' ' + IntToStr(db_limite_registros));
   tabBase.Open;
end;

procedure TfmLocalizarGenerico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabBase.Close;
   fmLocalizarGenerico:=nil;
   inherited;
end;

procedure TfmLocalizarGenerico.btnCancelarClick(Sender: TObject);
begin
   fmMenu.pubTrans1:='';
   Close;
end;

procedure TfmLocalizarGenerico.LoadParams(pParamLoc: TParametrosLocalizar);
begin
   FParamLoc.Table:=pParamLoc.Table;
   FParamLoc.KeyField:=pParamLoc.KeyField;
   FParamLoc.Field1:=pParamLoc.Field1;
   FParamLoc.Filter:=pParamLoc.Filter;
   lblCodigo.Caption:=FParamLoc.KeyField;
   lblDescricao.Caption:=FParamLoc.Field1;
end;

procedure TfmLocalizarGenerico.btnOKClick(Sender: TObject);
begin
   if Trim(edtCodigoSelecionado.Text) <> '' then begin
      fmMenu.pubTrans1:=edtCodigoSelecionado.Text;
      Close;
    end
   else begin
      ShowMessage('Selecione um Registro para Confirmar');
   end;
end;

procedure TfmLocalizarGenerico.dbgGenericoCellClick(Column: TColumn);
begin
   if tabBase.RecordCount > 0 then begin
      edtCodigoSelecionado.Text:=tabBase.FieldByName(FParamLoc.KeyField).AsString;
      edtNomeSelecionado.Text:=tabBase.FieldByName(FParamLoc.Field1).AsString;
   end;
end;

procedure TfmLocalizarGenerico.edtChaveKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
   if tabBase.Active then begin
      tabBase.Close;
      tabBase.SQL.Clear;
      if Trim(edtChave.Text) <> '' then begin
         tabBase.SQL.Add('SELECT ' + FParamLoc.KeyField+', '+FParamLoc.Field1);
         tabBase.SQL.Add('FROM '+ FParamLoc.Table);
         tabBase.SQL.Add('WHERE ' + FParamLoc.KeyField + ' LIKE ' + QuotedStr('%'+edtChave.Text+'%'));
         if Trim(FParamLoc.Filter) <> '' then begin
            tabBase.SQL.Add('AND '+FParamLoc.Filter);
         end;
       end
      else begin
         tabBase.SQL.Add('SELECT '+ FParamLoc.KeyField + ', '+ FParamLoc.Field1);
         tabBase.SQL.Add(' FROM '+ FParamLoc.Table);
         if Trim(FParamLoc.Filter) <> '' then begin
            tabBase.SQL.Add('WHERE '+FParamLoc.Filter);
         end;
         tabBase.SQL.Add(db_limite_cmd +' '+ IntToStr(db_limite_registros));
      end;
      tabBase.Open;
   end;
end;

procedure TfmLocalizarGenerico.edtDescricaoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
   if tabBase.Active then begin
      tabBase.Close;
      tabBase.SQL.Clear;
      if Trim(edtDescricao.Text) <> '' then begin
         tabBase.SQL.Add('SELECT ' + FParamLoc.KeyField+', '+FParamLoc.Field1);
         tabBase.SQL.Add('FROM '+ FParamLoc.Table);
         tabBase.SQL.Add('WHERE ' + FParamLoc.Field1 + ' LIKE ' + QuotedStr('%'+edtDescricao.Text+'%'));
         if Trim(FParamLoc.Filter) <> '' then begin
            tabBase.SQL.Add('AND '+FParamLoc.Filter);
         end;
       end
      else begin
         tabBase.SQL.Add('SELECT '+ FParamLoc.KeyField + ', '+ FParamLoc.Field1);
         tabBase.SQL.Add('FROM '+ FParamLoc.Table);
         if Trim(FParamLoc.Filter) <> '' then begin
            tabBase.SQL.Add('WHERE '+FParamLoc.Filter);
         end;
         tabBase.SQL.Add(db_limite_cmd +' '+ IntToStr(db_limite_registros));
      end;
      tabBase.Open;      
   end;
end;

end.

unit uFormBaseConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBase, DBGrids, DB, TypInfo, Grids, DBCtrls, ZDataset, Menus,
  Clipbrd, StdCtrls;

type
  TfmFormBaseConfig = class(TfmFormBase)
    popGrid: TPopupMenu;
    Copiar2: TMenuItem;
    N5: TMenuItem;
    ExportarparaoExcel1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Copiar2Click(Sender: TObject);
    procedure ExportarparaoExcel1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
  public
    procedure OnTitleClick(Column: TColumn);
    procedure GridStatus(Sender: TObject);
    procedure DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure OnDropDownDBLookupComboBox(Sender: TObject);
    procedure AfterOpen(DataSet: TDataSet);
    procedure LookupKeyPress(Sender: TObject; var Key: Char);
    procedure BeforePost(DataSet: TDataSet);
    procedure BeforeDelete(DataSet: TDataSet);
  end;

var
  fmFormBaseConfig: TfmFormBaseConfig;

implementation

uses uConstantes, uAuditoria, uFuncoes;

{$R *.dfm}

{ TfmFormBaseConfig }

procedure TfmFormBaseConfig.FormCreate(Sender: TObject);
var vCnt : Integer;
begin
   inherited;

   Caption:=Application.Title + ' - ' + Caption;

   for vCnt:=0 to ComponentCount-1 do begin
      if Components[vCnt] is TDBGrid then begin
         (Components[vCnt] as TDBGrid).OnTitleClick:=OnTitleClick;
         (Components[vCnt] as TDBGrid).OnDrawColumnCell:=DrawColumnCell;
         (Components[vCnt] as TDBGrid).ReadOnly:=True;
         (Components[vCnt] as TDBGrid).Options:=[dgTitles,dgIndicator,dgColLines,dgColumnResize,dgRowLines,dgTabs,dgRowSelect ];
         (Components[vCnt] as TDBGrid).PopupMenu:=popGrid; 
      end;
      if Components[vCnt] is TDataSource then begin
         (Components[vCnt] as TDataSource).OnStateChange:=GridStatus;
      end;
      if Components[vCnt] is TZQuery then begin
         (Components[vCnt] as TZQuery).AfterOpen:=AfterOpen;
         (Components[vCnt] as TZQuery).BeforePost:=BeforePost;
         (Components[vCnt] as TZQuery).BeforeDelete:=BeforeDelete;
      end;                                            
      if Components[vCnt] is TDBLookupComboBox then begin
         (Components[vCnt] as TDBLookupComboBox).OnDropDown:=OnDropDownDBLookupComboBox;
         (Components[vCnt] as TDBLookupComboBox).OnKeyPress:=LookupKeyPress;
      end;
   end;
end;

procedure TfmFormBaseConfig.OnTitleClick(Column: TColumn);
var vOrder : string;
begin
   vOrder:='ASC';
   if Column.Field.DataSet.State in [dsBrowse] then begin
      if IsPublishedProp(Column.Field.DataSet, 'IndexFieldNames') then begin
         if IsPublishedProp(Column.Field.DataSet, 'SortType') then begin
            if GetEnumProp(Column.Field.DataSet, 'SortType') = 'stAscending' then begin
               SetEnumProp(Column.Field.DataSet, 'SortType', 'stDescending');
               vOrder:='DESC';
             end
            else if GetEnumProp(Column.Field.DataSet, 'SortType') = 'stDescending' then begin
               SetEnumProp(Column.Field.DataSet, 'SortType', 'stAscending');
               vOrder:='ASC';
            end;
          end
         else begin 
            vOrder:='';
         end;
         SetStrProp(Column.Field.DataSet, 'IndexFieldNames', Column.Field.FieldName + ' ' + vOrder);
         Column.Field.DataSet.First;
      end;
   end;
end;

procedure TfmFormBaseConfig.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=caFree; 
end;

procedure TfmFormBaseConfig.GridStatus(Sender: TObject);
var vCnt : Integer;
begin
   if (Sender is TDataSource) then begin
      if (Sender as TDataSource).DataSet.State in [dsInsert, dsEdit] then begin
         for vCnt:=0 to ComponentCount-1 do begin
            if (Components[vCnt] is TDBGrid) then begin
               if (Components[vCnt] as TDBGrid).DataSource <> nil then begin
                  if (Components[vCnt] as TDBGrid).DataSource.DataSet = (Sender as TDataSource).DataSet then begin
                     (Components[vCnt] as TDBGrid).Enabled:=False;
                  end;
               end;
            end;
         end;
       end
      else begin
         for vCnt:=0 to ComponentCount-1 do begin
            if (Components[vCnt] is TDBGrid) then begin
               if (Components[vCnt] as TDBGrid).DataSource <> nil then begin
                  if (Components[vCnt] as TDBGrid).DataSource.DataSet = (Sender as TDataSource).DataSet then begin
                     (Components[vCnt] as TDBGrid).Enabled:=True;
                  end;
               end;
            end;
         end;
      end;
   end;
end;

procedure TfmFormBaseConfig.DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState); 
begin
   if (Sender is TDBGrid) then begin
      if not (gdSelected in State) then begin
         if Column.Field <> nil then begin
            if Column.Field.DataSet.RecNo mod 2 = 1 then begin
               (Sender as TDBGrid).Canvas.Brush.Color:=clWhite;
             end
            else begin
               (Sender as TDBGrid).Canvas.Brush.Color:=sis_cor_grid_zebrado;
            end;
            (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
            if Column.Field.DataType = ftMemo then begin
               (Sender as TDBGrid).Canvas.FillRect(Rect);
               (Sender as TDBGrid).Canvas.TextRect(Rect, Rect.Left, Rect.Top+2, Column.Field.AsString);
            end;
         end;
      end;
   end;
end;

procedure TfmFormBaseConfig.OnDropDownDBLookupComboBox(Sender: TObject);
begin
   if (Sender is TDBLookupComboBox) then begin
      if (Sender as TDBLookupComboBox).DataSource <> nil then begin
         (Sender as TDBLookupComboBox).ListSource.DataSet.Refresh;
      end;
   end;
end;

procedure TfmFormBaseConfig.AfterOpen(DataSet: TDataSet);
var vCnt : Integer;
begin
   if DataSet.Active = True then begin
      for vCnt:=0 to DataSet.FieldDefs.Count-1 do begin
         if DataSet.FindField(DataSet.FieldDefs.Items[vCnt].Name) <> nil then begin
            if (DataSet.FindField(DataSet.FieldDefs.Items[vCnt].Name) is TFloatField) then begin            
               if Copy((DataSet.FindField(DataSet.FieldDefs.Items[vCnt].Name) as TFloatField).FieldName, 1, 5) = 'Valor' then begin
                  (DataSet.FindField(DataSet.FieldDefs.Items[vCnt].Name) as TFloatField).currency:=true;
               end;
            end;
         end;
      end;
   end;
end;

procedure TfmFormBaseConfig.LookupKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = Chr(8) then begin
      (Sender as TDBLookupComboBox).KeyValue:=NULL;
   end;
end;

procedure TfmFormBaseConfig.BeforePost(DataSet: TDataSet);
begin
   Auditar(DataSet);
end;

procedure TfmFormBaseConfig.BeforeDelete(DataSet: TDataSet);
begin
   Auditar(DataSet);
end;

procedure TfmFormBaseConfig.Copiar2Click(Sender: TObject);
begin
   inherited; 
   if Screen.ActiveControl is TDBGrid then begin  
      Clipboard.AsText:= (Screen.ActiveControl as TDBGrid).Columns[(Screen.ActiveControl as TDBGrid).SelectedIndex].Field.AsString;
   end;
end;

procedure TfmFormBaseConfig.ExportarparaoExcel1Click(Sender: TObject);
begin
   inherited;
   if Screen.ActiveControl is TDBGrid then begin 
      ExportarDataSetToExcel((Screen.ActiveControl as TDbgrid).DataSource.DataSet);
   end;
end;

procedure TfmFormBaseConfig.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and not (Screen.ActiveControl is TCustomMemo) and not (Screen.ActiveControl is TDbMemo)  then begin
    Key := #0;

    { check if SHIFT - Key is pressed }
    if GetKeyState(VK_Shift) and $8000 <> 0 then begin
      PostMessage(Handle, WM_NEXTDLGCTL, 1, 0)
    end
    else begin
      PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
    end;
  end;
end;

procedure TfmFormBaseConfig.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  // Se o usuário pressionou ESC no teclado
  if Key = 27 then
  begin
    Close;
  end;

end;

end.

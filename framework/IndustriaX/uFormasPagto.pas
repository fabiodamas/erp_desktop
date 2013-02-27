unit uFormasPagto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Menus, Buttons, ExtCtrls, StdCtrls, Mask, DBCtrls, ToolEdit,
  CurrEdit, Grids, DBGrids, DBClient;

type
  TfmFormasPagto = class(TfmFormBaseCadastro)
    edtCodigo: TDBEdit;
    Label2: TLabel;
    edtDescricao: TDBEdit;
    Label1: TLabel;
    edtParcelas: TDBEdit;
    Label3: TLabel;
    tabParcelasPagto: TZQuery;
    dtsParcelasPagto: TDataSource;
    grbParcelas: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtParcela: TEdit;
    edtQtdDias: TEdit;
    edtPesoParcela: TCurrencyEdit;
    dbgParcelasPagto: TDBGrid;
    btnParcelaAdicionar: TBitBtn;
    btnParcelaRemover: TBitBtn;
    tabAuxParcelas: TClientDataSet;
    dtsAuxParcelas: TDataSource;
    tabAuxParcelasParcela: TIntegerField;
    tabAuxParcelasDias: TIntegerField;
    tabAuxParcelasPesoParcela: TFloatField;
    tabChecagens: TZQuery;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dtsBaseDataChange(Sender: TObject; Field: TField);
    procedure btnParcelaAdicionarClick(Sender: TObject);
    procedure btnParcelaRemoverClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
  private
    function PegarProximaParcela : Integer;
    function Peso100 : Boolean;
    procedure GravarParcelas(fCodigo: real);
  public
    procedure Novo; override;
    procedure Editar; override;
    procedure Deletar; override;
    procedure Cancelar; override;
    function Checagens: Boolean; override;
  end;

var
  fmFormasPagto: TfmFormasPagto;

implementation

uses uMenu, uFormBase, uFuncoes, uLocalizarGenerico, uTipos;

{$R *.dfm}

procedure TfmFormasPagto.Novo;
begin
   tabBase.FieldByName('Codigo').AsFloat:=CodeGenerator('formas_pagamento', 'Codigo');
   GravarParcelas(tabBase.FieldByName('Codigo').AsFloat);
end;

procedure TfmFormasPagto.Editar;
begin
   GravarParcelas(tabBase.FieldByName('Codigo').AsFloat);
end;

procedure TfmFormasPagto.Cancelar;
begin
end;

procedure TfmFormasPagto.FormShow(Sender: TObject); 
begin
   inherited;

   tabParcelasPagto.Params.CreateParam(ftFloat, 'CodigoFormaPagto', ptUnknown);
   tabParcelasPagto.SQL.Add('SELECT * FROM parcelas_pagto WHERE CodigoFormaPagto = :CodigoFormaPagto');
   tabParcelasPagto.Open;

   tabBase.SQL.Add('SELECT * FROM formas_pagamento');
   tabBase.Open;

   tabAuxParcelas.CreateDataSet;
   tabAuxParcelas.EmptyDataSet;
end;

procedure TfmFormasPagto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabBase.Close;
   tabParcelasPagto.Close;
   tabAuxParcelas.Close;
   inherited;
end;

function TfmFormasPagto.Checagens: Boolean;
begin
   Result:=False;
   if Trim(edtDescricao.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Descrição');
      edtDescricao.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtParcelas.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Parcela');
      edtParcelas.SetFocus;
      Result:=True;
      exit;
   end;
   if StrToInt(edtParcelas.Text) <> tabAuxParcelas.RecordCount then begin
      ShowMessage('Parcelas Informadas Diferente das Parcelas Incluidas');
      Result:=True;
      exit;
   end;
   if Peso100 = False then begin
      ShowMessage('Total dos Pesos das Parcelas Incorreto');
      Result:=True;
      exit;
   end;
end;

procedure TfmFormasPagto.Deletar;
begin
end;

procedure TfmFormasPagto.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TfmFormasPagto.btnNovoClick(Sender: TObject);
begin
   inherited;
   edtDescricao.SetFocus;

   tabAuxParcelas.EmptyDataSet;
   dbgParcelasPagto.DataSource:=dtsAuxParcelas;
   edtParcela.Text:='1';
end;

procedure TfmFormasPagto.btnEditarClick(Sender: TObject);
begin
   inherited;
   edtCodigo.Enabled:=False;

   tabAuxParcelas.EmptyDataSet;
   dbgParcelasPagto.DataSource:=dtsAuxParcelas;

   tabParcelasPagto.First;
   while not tabParcelasPagto.Eof do begin

      tabAuxParcelas.Append;
      tabAuxParcelasParcela.Value:=tabParcelasPagto.FieldByName('Parcela').AsInteger;
      tabAuxParcelasDias.Value:=tabParcelasPagto.FieldByName('Dias').AsInteger;
      tabAuxParcelasPesoParcela.Value:=tabParcelasPagto.FieldByName('PesoParcela').AsFloat;
      tabAuxParcelas.Post;

      tabParcelasPagto.Next;
   end;

   edtParcela.Text:=IntToStr(PegarProximaParcela);
end;

procedure TfmFormasPagto.btnGravarClick(Sender: TObject);
begin
   inherited;
   edtCodigo.Enabled:=True;
end;

procedure TfmFormasPagto.btnCancelarClick(Sender: TObject);
begin
   inherited;
   edtCodigo.Enabled:=True;
   dbgParcelasPagto.DataSource:=dtsParcelasPagto;
end;

procedure TfmFormasPagto.dtsBaseDataChange(Sender: TObject; Field: TField);
begin
   inherited;
   tabParcelasPagto.Close;
   tabParcelasPagto.ParamByName('CodigoFormaPagto').Value:=tabBase.FieldByName('Codigo').Value;
   tabParcelasPagto.Open;
end;

procedure TfmFormasPagto.btnParcelaAdicionarClick(Sender: TObject);
begin
   inherited;
   if edtPesoParcela.Value <= 0 then begin
      ShowMessage('Obrigatório Preenchimento no Peso da Parcela');
      edtQtdDias.SetFocus;
      exit;
   end;

   tabAuxParcelas.Append;
   tabAuxParcelasParcela.Value:=StrToInt(edtParcela.Text);
   tabAuxParcelasDias.Value:=StrToIntDef(edtQtdDias.Text, 0);
   tabAuxParcelasPesoParcela.Value:=edtPesoParcela.Value;
   tabAuxParcelas.Post;
   
   // Verificar Próxima Parcela
   // Verificar se peso 100%

   edtParcela.Text:=IntToStr(PegarProximaParcela);
end;

procedure TfmFormasPagto.btnParcelaRemoverClick(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if tabAuxParcelas.RecordCount > 0 then begin
         if Application.MessageBox('Deseja Realmente Excluir a Parcela dessa Forma de Pagto?', PChar(Application.Title), 36) = 7 then exit;
         tabAuxParcelas.Delete;
         edtParcela.Text:=IntToStr(PegarProximaParcela);
      end;
   end;
end;

function TfmFormasPagto.PegarProximaParcela: Integer;
var vUltima: Integer;
begin
   tabAuxParcelas.IndexFieldNames:='Parcela';
   tabAuxParcelas.Last;
   vUltima:=tabAuxParcelasParcela.Value;
   if vUltima <= 0 then begin
      Result:=1;
    end
   else begin
      Result:=vUltima + 1;
   end;
end;

function TfmFormasPagto.Peso100: Boolean;
var vPeso : Real;
begin
   vPeso:=0;
   Result:=False;
   tabAuxParcelas.IndexFieldNames:='Parcela';
   tabAuxParcelas.First;
   while not tabAuxParcelas.Eof do begin
      vPeso:=vPeso + tabAuxParcelasPesoParcela.Value;
      tabAuxParcelas.Next;
   end;
   if vPeso = 100 then begin
      Result:=True;
   end;
end;

procedure TfmFormasPagto.GravarParcelas(fCodigo: real);
begin
   tabChecagens.Close;
   tabChecagens.SQL.Clear;
   tabChecagens.SQL.Add('DELETE FROM parcelas_pagto WHERE CodigoFormaPagto = '+FloatToStr(fCodigo));
   tabChecagens.ExecSQL;

   tabAuxParcelas.First;
   while not tabAuxParcelas.Eof do begin

      tabParcelasPagto.Append;
      tabParcelasPagto.FieldByName('ID').AsFloat:=CodeGenerator('parcelas_pagto', 'ID');
      tabParcelasPagto.FieldByName('CodigoFormaPagto').AsFloat:=fCodigo;
      tabParcelasPagto.FieldByName('Parcela').AsInteger:=tabAuxParcelasParcela.Value;
      tabParcelasPagto.FieldByName('Dias').AsInteger:=tabAuxParcelasDias.Value;
      tabParcelasPagto.FieldByName('PesoParcela').AsFloat:=tabAuxParcelasPesoParcela.Value;
      tabParcelasPagto.Post;
      tabParcelasPagto.ApplyUpDates;

      tabAuxParcelas.Next;
   end;
end;

procedure TfmFormasPagto.btnLocalizarClick(Sender: TObject);
var vParamLoc: TParametrosLocalizar;
begin
   inherited;
   vParamLoc.Table:='formas_pagamento';
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

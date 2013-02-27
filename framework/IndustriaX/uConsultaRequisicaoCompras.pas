unit uConsultaRequisicaoCompras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, Mask, ToolEdit, ExtCtrls,
  Buttons, Grids, DBGrids, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Menus;

type
  TfmConsultaRequisicaoCompras = class(TfmFormBaseAvancado)
    Label1: TLabel;
    edtDocumento: TEdit;
    Label2: TLabel;
    edtCodigoResponsavel: TEdit;
    Label3: TLabel;
    edtResponsavelNome: TEdit;
    edtDataInicial: TDateEdit;
    edtDataFinal: TDateEdit;
    Label4: TLabel;
    rdgStatus: TRadioGroup;
    dbgConsulta: TDBGrid;
    btnConsultar: TBitBtn;
    btnFechar: TBitBtn;
    btnResponsavelLocalizar: TBitBtn;
    tabChecagens: TZQuery;
    tabBase: TZQuery;
    dtsBase: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure edtCodigoResponsavelChange(Sender: TObject);
    procedure btnResponsavelLocalizarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure dbgConsultaCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmConsultaRequisicaoCompras: TfmConsultaRequisicaoCompras;

implementation

uses uFormBaseConfig, uTipos, uLocalizarFuncionarios, uMenu, uConstantes,
  uRequisicaoCompras;

{$R *.dfm}

procedure TfmConsultaRequisicaoCompras.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TfmConsultaRequisicaoCompras.edtCodigoResponsavelChange(
  Sender: TObject);
begin
   inherited;
   if Trim(edtCodigoResponsavel.Text) <> '' then begin
      try
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT Nome FROM funcionarios WHERE Codigo = '+edtCodigoResponsavel.Text);
         tabChecagens.Open;
         if tabChecagens.RecordCount > 0 then begin
            edtResponsavelNome.Text:=tabChecagens.FieldByName('Nome').AsString;
          end
         else begin
            edtResponsavelNome.Text:='';
         end;
      finally
         tabChecagens.Close;
      end;
    end
   else begin
      edtResponsavelNome.Text:='';
   end;
end;

procedure TfmConsultaRequisicaoCompras.btnResponsavelLocalizarClick(
  Sender: TObject);
begin
   if not Assigned (fmLocalizarFuncionarios) then begin
      Application.CreateForm(TfmLocalizarFuncionarios, fmLocalizarFuncionarios);
      fmLocalizarFuncionarios.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edtCodigoResponsavel.Text:=fmMenu.pubTrans1;
   end;
end;

procedure TfmConsultaRequisicaoCompras.btnConsultarClick(Sender: TObject);
var vWhere : string;
begin
   inherited;

   vWhere:='';

   tabBase.Close;
   tabBase.SQL.Clear;
   tabBase.SQL.Add('SELECT requisicao_compras.DataRequisicao, requisicao_compras.Documento, funcionarios.Nome AS Responsavel, requisicao_compras.DataBaixa');
   tabBase.SQL.Add('FROM requisicao_compras');
   tabBase.SQL.Add('LEFT JOIN funcionarios ON funcionarios.Codigo = requisicao_compras.CodigoFuncionario');

   if Trim(edtDocumento.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere+'Documento = '+edtDocumento.Text;
   end;
   if Trim(edtCodigoResponsavel.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere+'CodigoFuncionario = '+edtDocumento.Text;
   end;
   if (Trim(edtDataInicial.Text) <> '/  /') and (Trim(edtDataFinal.Text) <> '/  /') then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere+'DataRequisicao >= '+QuotedStr(FormatDateTime(sis_date_format, edtDataInicial.Date))+' AND DataRequisicao <= '+QuotedStr(FormatDateTime(sis_date_format, edtDataFinal.Date));
   end;
   case rdgStatus.ItemIndex of
      1: begin
         if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
         vWhere:=vWhere+'DataBaixa IS NULL';
      end;
      2: begin
         if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
         vWhere:=vWhere+'DataBaixa IS NOT NULL';
      end;
   end;

   if Trim(vWhere) <> '' then begin
      tabBase.SQL.Add('WHERE');
      tabBase.SQL.Add(vWhere);
   end;

   tabBase.Open;
end;

procedure TfmConsultaRequisicaoCompras.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabBase.Close;
   inherited;
end;

procedure TfmConsultaRequisicaoCompras.btnFecharClick(Sender: TObject);
begin
   inherited;
   Close;
end;

procedure TfmConsultaRequisicaoCompras.dbgConsultaCellClick(
  Column: TColumn);
var vFM: TfmRequisicaoCompras;
begin
   inherited;
   if tabBase.RecordCount > 0 then begin
      fmMenu.pubTrans1:=tabBase.FieldByName('Documento').AsString;
      vFM:=TfmRequisicaoCompras.Create(Self);
      vFM.Show;
   end;
end;

end.

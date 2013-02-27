unit uLogUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, Grids, DBGrids, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, StdCtrls, Buttons, Mask, ToolEdit, DBCtrls,
  Menus, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxLabel;

type
  TfmLogUsuarios = class(TfmFormBaseAvancado)
    dbgLog: TDBGrid;
    tabLogArquivos: TZQuery;
    dtsLogArquivos: TDataSource;
    btnFechar: TBitBtn;
    Label2: TLabel;
    Label6: TLabel;
    edtDataInicial: TDateEdit;
    edtDataFinal: TDateEdit;
    edtTipoAlteracao: TComboBox;
    Label1: TLabel;
    btnAtualizar: TBitBtn;
    lblStatus: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtUsuario: TDBLookupComboBox;
    Label7: TLabel;
    tabUsuario: TZQuery;
    dtsUsuario: TDataSource;
    lbl3: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure dbgLogDrawDataCell(Sender: TObject;
      const Rect: TRect; Field: TField; State: TGridDrawState);
  private
    procedure CarregarDados(Limit: Boolean = False);
  public
    { Public declarations }
  end;

var
  fmLogUsuarios: TfmLogUsuarios;

implementation

uses uFormBase, uConstantes;

{$R *.dfm}

procedure TfmLogUsuarios.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);   
end;

procedure TfmLogUsuarios.FormShow(Sender: TObject);
begin
   tabUsuario.SQL.Add('SELECT Usuario FROM usuarios');
   tabUsuario.Open;

   edtDataInicial.Date:=Date;
   edtDataFinal.Date:=Date;

   CarregarDados(True); 

   inherited;
end;

procedure TfmLogUsuarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabLogArquivos.Close;
   tabUsuario.Close;
   inherited;
end;

procedure TfmLogUsuarios.btnFecharClick(Sender: TObject);
begin
   inherited;
   Close;
end;
 
procedure TfmLogUsuarios.CarregarDados(Limit: Boolean);
begin
   if (Trim(edtDataInicial.Text) = '') or (Trim(edtDataFinal.Text) = '') then begin
      ShowMessage('Obrigatório Preenchimento do Período de Datas');
      edtDataInicial.SetFocus;
      exit;
   end;

   tabLogArquivos.Close;
   tabLogArquivos.SQL.Clear;
   tabLogArquivos.SQL.Add('SELECT TipoAlteracao AS Tipo, Usuario, DataAlteracao, LEFT(Tabela,15) AS Tabela,');
   tabLogArquivos.SQL.Add('LEFT(Campo,15) AS Campo, LEFT(ValorAntigo,25) AS ValorAntigo, LEFT(ValorNovo,25) AS ValorNovo, ChavesCampos, ChavesValores');
   tabLogArquivos.SQL.Add('FROM log_arquivos'); 
   tabLogArquivos.SQL.Add('WHERE DataAlteracao BETWEEN '+QuotedStr(FormatDateTime(sis_date_format, edtDataInicial.Date)+' 00:00:00'));
   tabLogArquivos.SQL.Add('AND '+QuotedStr(FormatDateTime(sis_date_format, edtDataFinal.Date)+' 23:59:59'));

   case edtTipoAlteracao.ItemIndex of
      1: tabLogArquivos.SQL.Add('AND TipoAlteracao = '+QuotedStr('1'));
      2: tabLogArquivos.SQL.Add('AND TipoAlteracao = '+QuotedStr('2'));
      3: tabLogArquivos.SQL.Add('AND TipoAlteracao = '+QuotedStr('3'));
   end;
 
   if Trim(edtUsuario.Text) <> '' then begin
      tabLogArquivos.SQL.Add('AND Usuario = '+QuotedStr(edtUsuario.Text));
   end;

   if Limit = True then begin
      tabLogArquivos.SQL.Add(db_limite_cmd+' '+IntToStr(db_limite_registros));
   end;
   tabLogArquivos.Open;

   lblStatus.Caption:='Listando '+IntToStr(tabLogArquivos.RecordCount)+' registros.';
end;

procedure TfmLogUsuarios.btnAtualizarClick(Sender: TObject);
begin
   inherited;
   CarregarDados;
end;

procedure TfmLogUsuarios.dbgLogDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
   inherited;
   if Field <> nil then begin
      if Field.DataSet.FieldByName('Tipo').AsString = '1' then begin
         dbgLog.Canvas.Font.Color:=clGreen;
       end
      else if Field.DataSet.FieldByName('Tipo').AsString = '2' then begin
         dbgLog.Canvas.Font.Color:=clBlue;
       end
      else if Field.DataSet.FieldByName('Tipo').AsString = '3' then begin
         dbgLog.Canvas.Font.Color:=clRed;
      end;
      dbgLog.DefaultDrawDataCell(Rect, Field, State);
   end;
end;

end.

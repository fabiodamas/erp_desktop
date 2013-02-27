unit uLocalizarProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, DBCtrls, Buttons, Grids, DBGrids,
  ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, QRCtrls,
  QuickRpt, Printers, Menus;

type
  TfmLocalizarProdutos = class(TfmFormBaseAvancado)
    lbl_codigo: TLabel;
    edtCodigoProduto: TEdit;
    edtNomeTecnico: TEdit;
    Label1: TLabel;
    edtGrupo: TDBLookupComboBox;
    Label3: TLabel;
    edtModelo: TDBLookupComboBox;
    Label34: TLabel;
    dbgLocalizarProdutos: TDBGrid;
    edtCodigoSelecionado: TEdit;
    edtNomeSelecionado: TEdit;
    btnOK: TBitBtn;
    btnCancelar: TBitBtn;
    tabProdutos: TZQuery;
    dtsProdutos: TDataSource;
    tabGrupos: TZQuery;
    dtsGrupos: TDataSource;
    tabModelos: TZQuery;
    dtsModelos: TDataSource;
    Label2: TLabel;
    btnImprimir: TBitBtn;
    qrpProdutos: TQuickRep;
    QRSubDetail1: TQRSubDetail;
    QRDBText3: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    qrlTitulo: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    qrlSignature: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape2: TQRShape;
    QRSysData2: TQRSysData;
    pndDialogo: TPrintDialog;
    edtReferencia: TEdit;
    Label4: TLabel;
    tabReferencia: TZQuery;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dbgLocalizarProdutosCellClick(Column: TColumn);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure edtCodigoProdutoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNomeTecnicoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtGrupoCloseUp(Sender: TObject);
    procedure edtModeloCloseUp(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure edtCodigoProdutoKeyPress(Sender: TObject; var Key: Char);
  private
    procedure LoadData(pLimit: Boolean = False);
  public
    { Public declarations }
  end;

var
  fmLocalizarProdutos: TfmLocalizarProdutos;

implementation

uses uFormBaseConfig, uConstantes, uMenu;

{$R *.dfm}

procedure TfmLocalizarProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabProdutos.Close;
   tabGrupos.Close;
   tabModelos.Close;
   tabReferencia.Close;
   inherited;
   fmLocalizarProdutos:=nil;
end;

procedure TfmLocalizarProdutos.FormCreate(Sender: TObject);
begin
   inherited; 
   SetFormStyle(fsNormal);
end;

procedure TfmLocalizarProdutos.dbgLocalizarProdutosCellClick(
  Column: TColumn);
begin
   if tabProdutos.RecordCount > 0 then begin
      edtCodigoSelecionado.Text:=tabProdutos.FieldByName('CodigoProduto').AsString;
      edtNomeSelecionado.Text:=tabProdutos.FieldByName('NomeTecnico').AsString;
   end;

   btnOKClick(Self);
   
end; 

procedure TfmLocalizarProdutos.btnCancelarClick(Sender: TObject);
begin
   fmMenu.pubTrans1:='';
   Close;
end;

procedure TfmLocalizarProdutos.FormShow(Sender: TObject);
begin
   inherited;

   edtNomeTecnico.SetFocus;
   fmMenu.pubTrans1:='';

   tabGrupos.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('1')+' ORDER BY Descricao');
   tabGrupos.Open;

   tabModelos.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('9')+' ORDER BY Descricao');
   tabModelos.Open;

   LoadData(True);
end;

procedure TfmLocalizarProdutos.btnOKClick(Sender: TObject);
begin
   if Trim(edtCodigoSelecionado.Text) <> '' then begin
      fmMenu.pubTrans1:=edtCodigoSelecionado.Text;
      Close;
    end
   else begin
      ShowMessage('Selecione um Registro para Confirmar');
   end;
end;

procedure TfmLocalizarProdutos.edtCodigoProdutoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarProdutos.edtNomeTecnicoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarProdutos.edtGrupoCloseUp(Sender: TObject);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarProdutos.edtModeloCloseUp(Sender: TObject);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarProdutos.btnImprimirClick(Sender: TObject);
begin
   inherited;
   if pndDialogo.Execute then begin
      qrpProdutos.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
      qrpProdutos.Print;
   end;
end;

procedure TfmLocalizarProdutos.LoadData(pLimit: Boolean);
var vWhere : string;
    vLimit: boolean;
begin
   vLimit:=pLimit;

   tabProdutos.Close;
   tabProdutos.SQL.Clear;
   tabProdutos.SQL.Add('SELECT pr.CodigoProduto, pr.NomeTecnico, pse.Disponivel');
   tabProdutos.SQL.Add('FROM produtos AS pr');
   tabProdutos.SQL.Add('LEFT JOIN produtos_status_estoque AS pse ON pse.CodigoProduto = pr.CodigoProduto');   

   if Trim(edtCodigoProduto.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'pr.CodigoProduto LIKE '+QuotedStr('%'+edtCodigoProduto.Text+'%');
   end;

   if Trim(edtNomeTecnico.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'Upper(pr.NomeTecnico) LIKE '+QuotedStr(UpperCase('%'+edtNomeTecnico.Text)+'%');
   end;

   if Trim(edtGrupo.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'pr.CodigoGrupo = '+FLoatToStr(edtGrupo.KeyValue);
   end;

   if Trim(edtModelo.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'pr.CodigoModelo = '+FloatToStr(edtModelo.KeyValue);
   end;

   if Trim(edtReferencia.Text) <> '' then begin
      tabReferencia.Close;
      tabReferencia.SQL.Clear;
      tabReferencia.SQL.Add('SELECT CodigoProduto,ReferenciaCliente');
      tabReferencia.SQL.Add('FROM clientes_referencia_produtos');
      tabReferencia.SQL.Add('WHERE ReferenciaCliente LIKE '+QuotedStr('%'+edtReferencia.Text+'%'));
      tabReferencia.Open;
      if tabReferencia.RecordCount > 0 then begin
         if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
         vWhere:=vWhere + '(';
         tabReferencia.First;
         while not tabReferencia.Eof do begin
            vWhere:=vWhere + 'pr.CodigoProduto = '+QuotedStr(tabReferencia.FieldByName('CodigoProduto').AsString);
            tabReferencia.Next;
            if tabReferencia.Eof then vWhere:=vWhere + ') ' else vWhere:=vWhere + ' OR ';
         end;
      end;
   end;

   if Trim(vWhere) <> '' then begin 
      tabProdutos.SQL.Add('WHERE');
      tabProdutos.SQL.Add(vWhere);
    end
   else begin
      vLimit:=True;
   end;

   tabProdutos.SQL.Add('ORDER BY NomeTecnico');

   if vLimit = True then begin
      tabProdutos.SQL.Add(db_limite_cmd+' '+IntToStr(db_limite_registros));
   end;

   tabProdutos.Open;
end;

procedure TfmLocalizarProdutos.edtCodigoProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
   inherited;
   if Key = #32 then Key:=#0 else Key:=UpCase(Key);
end;

end.

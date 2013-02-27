unit rRequisicaoCompras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls;

type
  TrtRequisicaoCompras = class(TfmFormBaseRelatorio)
    tabBase: TZQuery;
    pndDialogo: TPrintDialog;
    qrpRequisicaoCompras: TQuickRep;
    QRSubDetail1: TQRSubDetail;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    qrlSignature: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRShape1: TQRShape;
    qrlTitulo: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape2: TQRShape;
    QRSysData2: TQRSysData;
    Label1: TLabel;
    rdgOrdemEmissao: TRadioGroup;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    edtDocumento: TEdit;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    rdgRequisicao: TRadioGroup;
    edtResponsavel: TDBLookupComboBox;
    Label4: TLabel;
    edtCodResponsavel: TEdit;
    tabFuncionarios: TZQuery;
    dtsFuncionarios: TDataSource;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtResponsavelCloseUp(Sender: TObject);
    procedure edtCodResponsavelExit(Sender: TObject);
  private
     procedure GerarImpressao(Impressora: Boolean = False);
  public
  end;

implementation

uses uFormBase, uMenu, uFuncoes;

{$R *.dfm}

procedure TrtRequisicaoCompras.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TrtRequisicaoCompras.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabBase.Close;
   tabFuncionarios.Close;
   inherited;
end;

procedure TrtRequisicaoCompras.btnVisualizarClick(Sender: TObject);
begin
   inherited;
   GerarImpressao();
end;

procedure TrtRequisicaoCompras.GerarImpressao(Impressora: Boolean = False);
var vWhere: string;
begin
   vWhere:='';

   tabBase.Close;
   tabBase.SQL.Clear;
   tabBase.SQL.Add('SELECT requisicao_compras.Documento, requisicao_compras.DataRequisicao, funcionarios.Nome AS Responsavel,');
   tabBase.SQL.Add('requisicao_compras.DataBaixa');
   tabBase.SQL.Add('FROM requisicao_compras');
   tabBase.SQL.Add('LEFT JOIN funcionarios ON funcionarios.Codigo = requisicao_compras.CodigoFuncionario');

   if Trim(edtDocumento.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere+' AND ';
      vWhere:=vWhere + 'Documento = '+edtDocumento.Text;
   end;

   if Trim(edtCodResponsavel.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere+' AND ';
      vWhere:=vWhere + 'CodigoFuncionario = '+edtCodResponsavel.Text;
   end;

   case rdgRequisicao.ItemIndex of
      1: begin
         if Trim(vWhere) <> '' then vWhere:=vWhere+' AND ';
         vWhere:=vWhere + 'DataBaixa IS NULL';
      end;
      2: begin
         if Trim(vWhere) <> '' then vWhere:=vWhere+' AND ';
         vWhere:=vWhere + 'DataBaixa IS NOT NULL';
      end;
   end;

   if Trim(vWhere) <> '' then begin
      tabBase.SQL.Add('WHERE');
      tabBase.SQL.Add(vWhere);
   end;

   tabBase.SQL.Add('ORDER BY');
   case rdgOrdemEmissao.ItemIndex of
      0: tabBase.SQL.Add('Documento');
      1: tabBase.SQL.Add('DataRequisicao');
   end;

   tabBase.Open;

   if Impressora = True then begin
      if pndDialogo.Execute then begin
         qrpRequisicaoCompras.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
         qrpRequisicaoCompras.Print;
      end;
    end
   else begin
      qrpRequisicaoCompras.PreviewModal;
   end;
end;

procedure TrtRequisicaoCompras.btnImprimirClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(True);
end;

procedure TrtRequisicaoCompras.FormShow(Sender: TObject);
begin
   inherited;
   tabFuncionarios.SQL.Add('SELECT Codigo,Nome FROM funcionarios ORDER BY Nome');
   tabFuncionarios.Open;
end;

procedure TrtRequisicaoCompras.edtResponsavelCloseUp(Sender: TObject);
begin
   inherited;
   if Trim(edtResponsavel.Text) <> '' then begin
      edtCodResponsavel.Text:=String(edtResponsavel.KeyValue);
   end;
end;

procedure TrtRequisicaoCompras.edtCodResponsavelExit(Sender: TObject);
begin
   inherited;
   if Trim(edtCodResponsavel.Text) <> '' then begin  
      edtResponsavel.KeyValue:=StrToFloat(edtCodResponsavel.Text);
   end;
end;

end.

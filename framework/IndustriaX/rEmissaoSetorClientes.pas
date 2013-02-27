unit rEmissaoSetorClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls;

type
  TrtEmissaoSetorClientes = class(TfmFormBaseRelatorio)
    tabBase: TZQuery;
    pndDialogo: TPrintDialog;
    qrpSetor: TQuickRep;
    QRSubDetail1: TQRSubDetail;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    qrlSignature: TQRLabel;
    QRDBText3: TQRDBText;
    qrlTitulo: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape2: TQRShape;
    QRSysData2: TQRSysData;
    QRDBText7: TQRDBText;
    rdgOrdemEmissao: TRadioGroup;
    QRDBText1: TQRDBText;
    edtEstado: TComboBox;
    Label3: TLabel;
    edtCidade: TDBLookupComboBox;
    Label4: TLabel;
    edtSetor: TEdit;
    Label8: TLabel;
    tabCidades: TZQuery;
    dtsCidades: TDataSource;
    QRSubDetail2: TQRSubDetail;
    tabClientes: TZQuery;
    dtsBase: TDataSource;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel2: TQRLabel;
    QRShape3: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCidadeEnter(Sender: TObject);
    procedure dtsBaseDataChange(Sender: TObject; Field: TField);
  private
     procedure GerarImpressao(Impressora: Boolean = False);
  public
  end;

implementation

uses uFormBase, uMenu, uFuncoes;

{$R *.dfm}

procedure TrtEmissaoSetorClientes.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TrtEmissaoSetorClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabBase.Close;
   tabCidades.Close;
   tabClientes.Close;
   inherited;
end;

procedure TrtEmissaoSetorClientes.btnVisualizarClick(Sender: TObject);
begin
   inherited;
   GerarImpressao();
end;

procedure TrtEmissaoSetorClientes.GerarImpressao(Impressora: Boolean = False);
var vWhere: string;
begin
   vWhere:='';

   qrlTitulo.Caption:='Clientes por Setor'; 

   tabBase.Close;
   tabBase.SQL.Clear;
   tabBase.SQL.Add('SELECT * FROM setor');

   if Trim(edtEstado.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - UF: '+edtEstado.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere+' AND ';
      vWhere:=vWhere + 'Estado = '+QuotedStr(edtEstado.Text);
   end;

   if Trim(edtCidade.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Cidade: '+edtCidade.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere+' AND ';
      vWhere:=vWhere + 'CodigoCidade = '+QuotedStr(String(edtCidade.KeyValue));
   end;

   if Trim(edtSetor.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Setor: '+edtSetor.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere+' AND ';
      vWhere:=vWhere + 'Setor = '+QuotedStr(edtSetor.Text);
   end;

   if Trim(vWhere) <> '' then begin
      tabBase.SQL.Add('WHERE');
      tabBase.SQL.Add(vWhere);
   end;

   tabBase.SQL.Add('ORDER BY');
   case rdgOrdemEmissao.ItemIndex of
      0: tabBase.SQL.Add('setor.Codigo');
      1: tabBase.SQL.Add('setor.Setor');
      2: tabBase.SQL.Add('setor.Bairro');
   end;

   tabBase.Open;

   if Impressora = True then begin
      if pndDialogo.Execute then begin
         qrpSetor.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
         qrpSetor.Print;
      end;
    end
   else begin
      qrpSetor.PreviewModal;
   end;
end;

procedure TrtEmissaoSetorClientes.btnImprimirClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(True);
end;

procedure TrtEmissaoSetorClientes.FormShow(Sender: TObject);
begin
   inherited;

   tabCidades.SQL.Add('SELECT * FROM cidades WHERE 0');
   tabCidades.Open;

   tabClientes.Params.CreateParam(ftFloat, 'CodigoSetor', ptUnknown);
   tabClientes.SQL.Add('SELECT CodigoCliente, NomeFantasia, SetorNormal FROM clientes WHERE SetorNormal = :CodigoSetor');
   tabClientes.Open;
end;

procedure TrtEmissaoSetorClientes.edtCidadeEnter(Sender: TObject);
begin
   inherited;
   if Trim(edtEstado.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Estado');
      edtEstado.SetFocus;
      exit;
   end;
   tabCidades.Close;
   tabCidades.SQL.Clear;
   tabCidades.SQL.Add('SELECT * FROM cidades WHERE UF = '+QuotedStr(edtEstado.Text)+'ORDER BY Cidade');
   tabCidades.Open;
end;

procedure TrtEmissaoSetorClientes.dtsBaseDataChange(Sender: TObject;
  Field: TField);
begin
   inherited;
   tabClientes.Close;
   tabClientes.ParamByName('CodigoSetor').AsFloat:=tabBase.FieldByName('Codigo').AsFloat;
   tabClientes.Open;
end;

end.

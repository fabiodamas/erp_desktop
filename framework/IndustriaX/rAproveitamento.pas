unit rAproveitamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls, ToolEdit;

type
  TrtAproveitamento = class(TfmFormBaseRelatorio)
    tabBase: TZQuery;
    pndDialogo: TPrintDialog;
    qrpAproveitamento: TQuickRep;
    QRSubDetail1: TQRSubDetail;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    qrlSignature: TQRLabel;
    QRDBText3: TQRDBText;
    QRShape1: TQRShape;
    qrlTitulo: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape2: TQRShape;
    QRSysData2: TQRSysData;
    QRDBText7: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    Label1: TLabel;
    Label2: TLabel;
    edtCodigoCliente: TEdit;
    edtDataInicial: TDateEdit;
    btnLocalizarCliente: TBitBtn;
    edtDataFinal: TDateEdit;
    Label3: TLabel;
    edtNomeFantasia: TEdit;
    tabChecagens: TZQuery;
    qrlTotal: TQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure edtCodigoClienteChange(Sender: TObject);
    procedure btnLocalizarClienteClick(Sender: TObject);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrpAproveitamentoBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
     procedure GerarImpressao(Impressora: Boolean = False);
  public
  end;

var vPecInj, vPerdas, vAprov: real;  

implementation

uses uFormBase, uMenu, uFuncoes, uConstantes, uLocalizarClientes;

{$R *.dfm}

procedure TrtAproveitamento.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TrtAproveitamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabBase.Close;
   inherited;
end;

procedure TrtAproveitamento.btnVisualizarClick(Sender: TObject);
begin
   inherited;
   GerarImpressao();
end;

procedure TrtAproveitamento.GerarImpressao(Impressora: Boolean = False);
var vWhere: string;
begin
   vWhere:='';

   tabBase.Close;
   tabBase.SQL.Clear;
   tabBase.SQL.Add('SELECT aproveitamento.Data, clientes.NomeFantasia AS Cliente, aproveitamento.PecasInjetadas, aproveitamento.Perdas, (aproveitamento.PecasInjetadas-aproveitamento.Perdas) AS Aproveitamento');
   tabBase.SQL.Add('FROM aproveitamento');
   tabBase.SQL.Add('LEFT JOIN clientes ON clientes.CodigoCliente = aproveitamento.CodigoCliente');

   if Trim(edtCodigoCliente.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'aproveitamento.CodigoCliente = '+edtCodigoCliente.Text;
   end;
   
   if (Trim(edtDataInicial.Text) <> '/  /') and (Trim(edtDataFinal.Text) <> '/  /') then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'aproveitamento.Data >= '+QuotedStr(FormatDateTime(sis_date_format, edtDataInicial.Date))+' AND aproveitamento.Data <= '+QuotedStr(FormatDateTime(sis_date_format, edtDataFinal.Date));
   end;

   if Trim(vWhere) <> '' then begin
      tabBase.SQL.Add('WHERE');
      tabBase.SQL.Add(vWhere);
   end;

   tabBase.SQL.Add('ORDER BY aproveitamento.Data');
   tabBase.Open;

   vPecInj:=0;
   vPerdas:=0;
   vAprov:=0;

   if Impressora = True then begin
      if pndDialogo.Execute then begin
         qrpAproveitamento.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
         qrpAproveitamento.Print;
      end;
    end
   else begin
      qrpAproveitamento.PreviewModal;
   end;
end;

procedure TrtAproveitamento.btnImprimirClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(True);
end;

procedure TrtAproveitamento.edtCodigoClienteChange(Sender: TObject);
begin
   inherited;
   if Trim(edtCodigoCliente.Text) <> '' then begin
      try
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT NomeFantasia FROM clientes WHERE CodigoCliente = '+edtCodigoCliente.Text);
         tabChecagens.Open;
         if tabChecagens.RecordCount > 0 then begin
            edtNomeFantasia.Text:=tabChecagens.FieldByName('NomeFantasia').AsString;
          end
         else begin
            edtNomeFantasia.Text:='';
         end;
      finally
         tabChecagens.Close;
      end;
    end
   else begin
      edtNomeFantasia.Text:='';
   end;
end;

procedure TrtAproveitamento.btnLocalizarClienteClick(Sender: TObject);
begin
   inherited;
   if not Assigned (fmLocalizarClientes) then begin
      Application.CreateForm(TfmLocalizarClientes, fmLocalizarClientes);
      fmLocalizarClientes.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edtCodigoCliente.Text:=fmMenu.pubTrans1;
   end;
end;

procedure TrtAproveitamento.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   inherited;
   vPecInj:=vPecInj + tabBase.FieldByName('PecasInjetadas').AsFloat;
   vPerdas:=vPerdas + tabBase.FieldByName('Perdas').AsFloat;
   vAprov:=vAprov   + tabBase.FieldByName('Aproveitamento').AsFloat;
   qrlTotal.Caption:='Peças Injetadas: '+FloatToStr(vPecInj)+' - Perdas: '+FloatToStr(vPerdas)+' - Aproveitamento: '+FloatToStr(vAprov);
end;

procedure TrtAproveitamento.qrpAproveitamentoBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   inherited;
   vPecInj:=0;
   vPerdas:=0;
   vAprov:=0;
end;

end.

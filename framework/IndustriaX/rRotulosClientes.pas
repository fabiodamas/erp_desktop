unit rRotulosClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls;

type
  TrtRotulosClientes = class(TfmFormBaseRelatorio)
    edtAosCuidados: TEdit;
    rdgEnderecoRotulo: TRadioGroup;
    Label1: TLabel;
    edtCodigo: TEdit;
    lblCodigo: TLabel;
    Label2: TLabel;
    rdgNomeRotulo: TRadioGroup;
    edtQtd: TEdit;
    Label3: TLabel;
    tabBase: TZQuery;
    dtsBase: TDataSource;
    tabRotulos: TClientDataSet;
    tabRotulosCep: TStringField;
    pndDialogo: TPrintDialog;
    qrpRotulos: TQuickRep;
    QRSubDetail1: TQRSubDetail;
    tabChecagens: TZQuery;
    edtNomeFantasia: TDBEdit;
    QRDBText1: TQRDBText;
    tabRotulosAC: TStringField;
    tabRotulosCodigoNome: TStringField;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    tabRotulosEnderecoNumero: TStringField;
    tabRotulosBairroComplemento: TStringField;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    tabRotulosCidadeUFPais: TStringField;
    QRDBText6: TQRDBText;
    btnLocalizaCliente: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure edtCodigoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnLocalizaClienteClick(Sender: TObject);
  private
    FCodigo: string;
    procedure GerarImpressao(Impressora: Boolean = False);
  public
  end;


implementation

uses uFormBase, uMenu, uFuncoes, uLocalizarClientes, uEnderecos;

{$R *.dfm}

procedure TrtRotulosClientes.FormCreate(Sender: TObject);
begin
  inherited;
  SetFormStyle(fsMDIChild);
end;

procedure TrtRotulosClientes.FormShow(Sender: TObject);
begin
  inherited;

  edtAosCuidados.SetFocus;

  FCodigo:=fmMenu.pubTrans1;
  edtCodigo.Text:=FCodigo;

  if Trim(fmMenu.pubTrans2) <> '' then
  begin
    edtQtd.Text:=fmMenu.pubTrans2;
   end
  else begin
    edtQtd.Text:='1';
  end;

   tabRotulos.CreateDataSet;
   tabRotulos.EmptyDataSet;

   tabBase.Params.CreateParam(ftFloat, 'CodigoCliente', ptUnknown);
   tabBase.SQL.Add('SELECT * FROM clientes WHERE CodigoCliente = :CodigoCLiente');
   tabBase.ParamByName('CodigoCliente').Value:=StrToFloat(FCodigo);
   tabBase.Open;
end;

procedure TrtRotulosClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabBase.Close;
   tabRotulos.Close;  
   inherited;
end;

procedure TrtRotulosClientes.btnVisualizarClick(Sender: TObject);
begin
   inherited;
   GerarImpressao();  
end;

procedure TrtRotulosClientes.GerarImpressao(Impressora: Boolean = False);
var vCnt : Integer;
begin
   if Trim(edtQtd.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Quantidade');
      edtQtd.SetFocus; 
      exit;
   end;

   if StrToInt(edtQtd.Text) <= 0 then begin
      ShowMessage('Preenchimento Incorreto');
      edtQtd.SetFocus;
      exit;
   end;

   tabRotulos.EmptyDataSet;

   for vCnt:=1 to StrToInt(edtQtd.Text) do begin
      tabRotulos.Append;
      tabRotulosAC.Value:=edtAosCuidados.Text;
      case rdgEnderecoRotulo.ItemIndex of
         0: begin
            tabRotulosCep.Value:=tabBase.FieldByName('Cep').AsString;
            tabRotulosEnderecoNumero.Value:=tabBase.FieldByName('Endereco').AsString+', '+tabBase.FieldByName('Numero').AsString;
            tabRotulosBairroComplemento.Value:=tabBase.FieldByName('Bairro').AsString+' - '+tabBase.FieldByName('Complemento').AsString;
            tabRotulosCidadeUFPais.Value:=LocateCidade(tabBase.FieldByName('CodigoCidade').AsString)+' - '+tabBase.FieldByName('Estado').AsString+' '+LocatePais(tabBase.FieldByName('CodigoPais').AsString);
         end;
         1: begin
            tabRotulosCep.Value:=tabBase.FieldByName('EntregaCep').AsString;
            tabRotulosEnderecoNumero.Value:=tabBase.FieldByName('EntregaEndereco').AsString+', '+tabBase.FieldByName('EntregaNumero').AsString;
            tabRotulosBairroComplemento.Value:=tabBase.FieldByName('EntregaBairro').AsString+' - '+tabBase.FieldByName('EntregaComplemento').AsString;
            tabRotulosCidadeUFPais.Value:=LocateCidade(tabBase.FieldByName('EntregaCodigoCidade').AsString)+' - '+tabBase.FieldByName('EntregaEstado').AsString+' '+LocatePais(tabBase.FieldByName('EntregaCodigoPais').AsString);
         end;
         2: begin
            tabRotulosCep.Value:=tabBase.FieldByName('CobrancaCep').AsString;
            tabRotulosEnderecoNumero.Value:=tabBase.FieldByName('CobrancaEndereco').AsString+', '+tabBase.FieldByName('CobrancaNumero').AsString;
            tabRotulosBairroComplemento.Value:=tabBase.FieldByName('CobrancaBairro').AsString+' - '+tabBase.FieldByName('CobrancaComplemento').AsString;
            tabRotulosCidadeUFPais.Value:=LocateCidade(tabBase.FieldByName('CobrancaCodigoCidade').AsString)+' - '+tabBase.FieldByName('CobrancaEstado').AsString+' '+LocatePais(tabBase.FieldByName('CobrancaCodigoPais').AsString);
         end;
      end;
      case rdgNomeRotulo.ItemIndex of
         0: begin
            tabRotulosCodigoNome.Value:=FloatToStr(tabBase.FieldByName('CodigoCliente').AsFloat)+' - '+tabBase.FieldByName('RazaoSocial').AsString;
         end;
         1: begin
            tabRotulosCodigoNome.Value:=FloatToStr(tabBase.FieldByName('CodigoCliente').AsFloat)+' - '+tabBase.FieldByName('NomeFantasia').AsString;
         end;
      end;
      tabRotulos.Post;
   end;

   if Impressora = True then begin
      if pndDialogo.Execute then begin
         qrpRotulos.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
         qrpRotulos.Print;
      end;
    end
   else begin
      qrpRotulos.PreviewModal;
   end;
end;

procedure TrtRotulosClientes.btnImprimirClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(True); 
end;

procedure TrtRotulosClientes.edtCodigoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   tabBase.Close;
   tabBase.ParamByName('CodigoCliente').Value:=StrToFloat(edtCodigo.Text);
   tabBase.Open;
end;

procedure TrtRotulosClientes.btnLocalizaClienteClick(Sender: TObject);
begin
   if not Assigned (fmLocalizarClientes) then begin
      Application.CreateForm(TfmLocalizarClientes, fmLocalizarClientes);
      fmLocalizarClientes.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edtCodigo.Text:=fmMenu.pubTrans1;
      tabBase.Close;
      tabBase.ParamByName('CodigoCliente').Value:=edtCodigo.Text;
      tabBase.Open;
   end;
end;

end.

unit rRotulosFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls;

type
  TrtRotulosFornecedor = class(TfmFormBaseRelatorio)
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
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    tabRotulosEnderecoNumero: TStringField;
    tabRotulosBairroComplemento: TStringField;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    tabRotulosCidadeUFPais: TStringField;
    QRDBText6: TQRDBText;
    btnLocalizaFornecedor: TBitBtn;
    tabRotulosCodigoNome: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure edtCodigoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnLocalizaFornecedorClick(Sender: TObject);
  private
    FCodigo: string;
    procedure GerarImpressao(Impressora: Boolean = False);
  public
  end;


implementation

uses uFormBase, uMenu, uFuncoes, uLocalizarGenerico, uTipos, uEnderecos;

{$R *.dfm}

procedure TrtRotulosFornecedor.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TrtRotulosFornecedor.FormShow(Sender: TObject);
begin
   inherited;

   FCodigo:=fmMenu.pubTrans1;
   edtCodigo.Text:=FCodigo;

   tabRotulos.CreateDataSet;
   tabRotulos.EmptyDataSet;

   tabBase.Params.CreateParam(ftFloat, 'CodigoContato', ptUnknown);
   tabBase.SQL.Add('SELECT * FROM fornecedores WHERE CodigoFornecedor = :CodigoFornecedor');
   tabBase.ParamByName('CodigoFornecedor').Value:=StrToFloat(FCodigo);
   tabBase.Open;
end;

procedure TrtRotulosFornecedor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabBase.Close;
   tabRotulos.Close;
   inherited;
end;

procedure TrtRotulosFornecedor.btnVisualizarClick(Sender: TObject);
begin
   inherited;
   GerarImpressao();
end;

procedure TrtRotulosFornecedor.GerarImpressao(Impressora: Boolean = False);
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
            tabRotulosCep.Value:=tabBase.FieldByName('DepositoCep').AsString;
            tabRotulosEnderecoNumero.Value:=tabBase.FieldByName('DepositoEndereco').AsString+', '+tabBase.FieldByName('DepositoNumero').AsString;
            tabRotulosBairroComplemento.Value:=tabBase.FieldByName('DepositoBairro').AsString+' - '+tabBase.FieldByName('DepositoComplemento').AsString;
            tabRotulosCidadeUFPais.Value:=LocateCidade(tabBase.FieldByName('DepositoCodigoCidade').AsString)+' - '+tabBase.FieldByName('DepositoEstado').AsString+' '+LocatePais(tabBase.FieldByName('DepositoCodigoPais').AsString);
         end;
         2: begin
            tabRotulosCep.Value:=tabBase.FieldByName('CorrespoCep').AsString;
            tabRotulosEnderecoNumero.Value:=tabBase.FieldByName('CorrespoEndereco').AsString+', '+tabBase.FieldByName('CorrespoNumero').AsString;
            tabRotulosBairroComplemento.Value:=tabBase.FieldByName('CorrespoBairro').AsString+' - '+tabBase.FieldByName('CorrespoComplemento').AsString;
            tabRotulosCidadeUFPais.Value:=LocateCidade(tabBase.FieldByName('CorrespoCodigoCidade').AsString)+' - '+tabBase.FieldByName('CorrespoEstado').AsString+' '+LocatePais(tabBase.FieldByName('CorrespoCodigoPais').AsString);
         end;
      end;
      case rdgNomeRotulo.ItemIndex of
         0: begin
            tabRotulosCodigoNome.Value:=FloatToStr(tabBase.FieldByName('CodigoFornecedor').AsFloat)+' - '+tabBase.FieldByName('RazaoSocial').AsString;
         end;
         1: begin
            tabRotulosCodigoNome.Value:=FloatToStr(tabBase.FieldByName('CodigoFornecedor').AsFloat)+' - '+tabBase.FieldByName('NomeFantasia').AsString;
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

procedure TrtRotulosFornecedor.btnImprimirClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(True);
end;

procedure TrtRotulosFornecedor.edtCodigoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   tabBase.Close;
   tabBase.ParamByName('CodigoFornecedor').Value:=StrToFloat(edtCodigo.Text);
   tabBase.Open;
end;

procedure TrtRotulosFornecedor.btnLocalizaFornecedorClick(Sender: TObject);
var vParams: TParametrosLocalizar;
begin
   vParams.Table:='fornecedores';
   vParams.KeyField:='CodigoFornecedor';
   vParams.Field1:='NomeFantasia';
   if not Assigned (fmLocalizarGenerico) then begin
      Application.CreateForm(TfmLocalizarGenerico, fmLocalizarGenerico);
      fmLocalizarGenerico.LoadParams(vParams);
      fmLocalizarGenerico.ShowModal;
   end;   
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edtCodigo.Text:=fmMenu.pubTrans1;
      tabBase.Close; 
      tabBase.ParamByName('CodigoFornecedor').Value:=edtCodigo.Text;
      tabBase.Open;
   end;
end;

end.

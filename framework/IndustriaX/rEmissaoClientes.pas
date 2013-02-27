unit rEmissaoClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls, qrpctrls;

type
  TrtEmissaoClientes = class(TfmFormBaseRelatorio)
    tabBase: TZQuery;
    pndDialogo: TPrintDialog;
    qrpClientes: TQuickRep;
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
    rdgOrdemEmissao: TRadioGroup;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    qrdCidade: TQRDBText;
    Label1: TLabel;
    edtGrupo: TDBLookupComboBox;
    Label2: TLabel;
    edtTipo: TDBLookupComboBox;
    edtEstado: TComboBox;
    Label3: TLabel;
    edtCidade: TDBLookupComboBox;
    Label4: TLabel;
    edtPais: TDBLookupComboBox;
    Label5: TLabel;
    edtBairro: TEdit;
    Label6: TLabel;
    edtComplemento: TEdit;
    Label7: TLabel;
    edtSetor: TEdit;
    Label8: TLabel;
    rdgCamposRelatorio: TRadioGroup;
    tabGrupos: TZQuery;
    dtsGrupos: TDataSource;
    tabTipos: TZQuery;
    dtsTipos: TDataSource;
    tabPais: TZQuery;
    dtsPais: TDataSource;
    tabCidades: TZQuery;
    dtsCidades: TDataSource;
    qrlEndereco: TQRLabel;
    qrdEndereco: TQRDBText;
    qrlUF: TQRLabel;
    qrlBairro: TQRLabel;
    qrlSetor: TQRLabel;
    qrdUF: TQRDBText;
    qrdBairro: TQRDBText;
    qrdSetor: TQRDBText;
    qrdPais: TQRDBText;
    qrlPais: TQRLabel;
    qrlEmail: TQRLabel;
    qrlSite: TQRLabel;
    qrdSite: TQRDBText;
    qrlTotal: TQRLabel;
    dtsBase: TDataSource;
    ckbPaisDiferenteDe: TCheckBox;
    tabEmailRelacao: TZQuery;
    qrlEmailRelacao: TQRPMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCidadeEnter(Sender: TObject);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrpClientesBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    procedure GerarImpressao(Impressora: Boolean = False);
  public
  end;

var
   vTotalCli : real;

implementation

uses uFormBase, uMenu, uFuncoes;

{$R *.dfm}

procedure TrtEmissaoClientes.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TrtEmissaoClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabBase.Close;
   tabGrupos.Close;
   tabTipos.Close;
   tabPais.Close;
   tabCidades.Close;
   inherited;
end;

procedure TrtEmissaoClientes.btnVisualizarClick(Sender: TObject);
begin
   inherited;
   GerarImpressao();
end;

procedure TrtEmissaoClientes.GerarImpressao(Impressora: Boolean = False);
var vWhere: string;
begin
   case rdgCamposRelatorio.ItemIndex of
      0: begin
         qrlPais.Enabled:=False;
         qrdPais.Enabled:=False;
         qrlEmail.Enabled:=False;
         qrlEmailRelacao.Enabled:=False;
         qrlSite.Enabled:=False;
         qrdSite.Enabled:=False;

         qrlEndereco.Enabled:=True;
         qrdEndereco.Enabled:=True;
         qrlUF.Enabled:=True;
         qrdUF.Enabled:=True;
         qrlBairro.Enabled:=True;
         qrdBairro.Enabled:=True;
         qrlSetor.Enabled:=True;
         qrdSetor.Enabled:=True;
      end;
      1: begin
         qrlEndereco.Enabled:=False;
         qrdEndereco.Enabled:=False;
         qrlUF.Enabled:=False;
         qrdUF.Enabled:=False;
         qrlBairro.Enabled:=False;
         qrdBairro.Enabled:=False;
         qrlSetor.Enabled:=False;
         qrdSetor.Enabled:=False;

         qrlPais.Enabled:=True;
         qrdPais.Enabled:=True;
         qrlEmail.Enabled:=True;
         qrlEmailRelacao.Enabled:=True;
         qrlSite.Enabled:=True;
         qrdSite.Enabled:=True;
      end;
   end;

   vWhere:='';

   qrlTitulo.Caption:='Clientes';

   tabBase.Close;
   tabBase.SQL.Clear;
   tabBase.SQL.Add('SELECT');
   tabBase.SQL.Add('clientes.CodigoCliente,');
   tabBase.SQL.Add('clientes.NomeFantasia,');
   tabBase.SQL.Add('clientes.Telefone1,');
   tabBase.SQL.Add('clientes.Cep,');
   tabBase.SQL.Add('clientes.Estado,');
   tabBase.SQL.Add('clientes.Bairro,');
   tabBase.SQL.Add('clientes.Endereco,');
   tabBase.SQL.Add('clientes.EmailNFEXML AS Email,');
   tabBase.SQL.Add('clientes.Site,');
   tabBase.SQL.Add('cidades.Cidade AS Cidade,');
   tabBase.SQL.Add('setor.Setor,');
   tabBase.SQL.Add('paises.Pais');
   tabBase.SQL.Add('FROM clientes');
   tabBase.SQL.Add('LEFT JOIN cidades ON clientes.CodigoCidade = cidades.CodigoCidade');
   tabBase.SQL.Add('LEFT JOIN setor ON clientes.SetorNormal = setor.Codigo');
   tabBase.SQL.Add('LEFT JOIN paises ON clientes.CodigoPais = paises.CodigoPais');
 //  tabBase.SQL.Add('LEFT JOIN clientes_emails ON clientes.CodigoCliente = clientes_emails.CodigoCliente');

   if Trim(edtGrupo.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Grupo: '+edtGrupo.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'clientes.CodigoGrupo = '+FloatToStr(edtGrupo.KeyValue);
   end;
   if Trim(edtTipo.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Tipo: '+edtTipo.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'clientes.CodigoTipo = '+FloatToStr(edtTipo.KeyValue);
   end;
   if Trim(edtEstado.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - UF: '+edtEstado.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'clientes.Estado = '+QuotedStr(edtEstado.Text);
   end;
   if Trim(edtCidade.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Cidade: '+edtCidade.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'clientes.CodigoCidade = '+QuotedStr(String(edtCidade.KeyValue));
   end;
   if Trim(edtPais.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      if ckbPaisDiferenteDe.Checked = True then begin
         qrlTitulo.Caption:=qrlTitulo.Caption + ' - País Diferente de : '+edtPais.Text;
         vWhere:=vWhere + 'clientes.CodigoPais <> '+QuotedStr('')+' AND clientes.CodigoPais <> '+QuotedStr(String(edtPais.KeyValue));
       end
      else begin
         qrlTitulo.Caption:=qrlTitulo.Caption + ' - País: '+edtPais.Text;
         vWhere:=vWhere + 'clientes.CodigoPais = '+QuotedStr(String(edtPais.KeyValue));
      end;
   end;
   if Trim(edtSetor.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Setor: '+edtSetor.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'setor.Setor = '+QuotedStr(edtSetor.Text);
   end;
   if Trim(edtBairro.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Bairro: '+edtBairro.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'Upper(clientes.Bairro) LIKE '+QuotedStr(UpperCase(edtBairro.Text)+'%');
   end;
   if Trim(edtComplemento.Text) <> '' then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Complemento: '+edtComplemento.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';   
      vWhere:=vWhere + 'Upper(clientes.Complemento) LIKE '+QuotedStr(UpperCase(edtBairro.Text)+'%');
   end;

   if Trim(vWhere) <> '' then begin
      tabBase.SQL.Add('WHERE');
      tabBase.SQL.Add(vWhere);
   end;

   tabBase.SQL.Add('ORDER BY');
   case rdgOrdemEmissao.ItemIndex of
      0: tabBase.SQL.Add('clientes.CodigoCliente');
      1: tabBase.SQL.Add('clientes.Nomefantasia');
      2: tabBase.SQL.Add('clientes.CodigoGrupo');
      3: tabBase.SQL.Add('clientes.CodigoTipo');
      4: tabBase.SQL.Add('cidades.Cidade');
      5: tabBase.SQL.Add('clientes.Estado');
   end;

   tabBase.Open;

   vTotalCli:=0;

   if Impressora = True then begin
      if pndDialogo.Execute then begin
         qrpClientes.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
         qrpClientes.Print;
      end;
    end
   else begin
      qrpClientes.PreviewModal;
   end;
end;

procedure TrtEmissaoClientes.btnImprimirClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(True);
end;

procedure TrtEmissaoClientes.FormShow(Sender: TObject);
begin
   inherited;

   tabGrupos.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('11')+' ORDER BY Descricao');
   tabGrupos.Open;

   tabTipos.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('12')+' ORDER BY Descricao');
   tabTipos.Open;

   tabPais.SQL.Add('SELECT * FROM paises ORDER BY Pais');
   tabPais.Open;

   tabCidades.SQL.Add('SELECT * FROM cidades WHERE 0');
   tabCidades.Open;
end;

procedure TrtEmissaoClientes.edtCidadeEnter(Sender: TObject);
begin
   inherited;
   if Trim(edtEstado.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Estado');
      edtEstado.SetFocus;
      exit;
   end;
   tabCidades.Close;
   tabCidades.SQL.Clear;
   tabCidades.SQL.Add('SELECT * FROM cidades WHERE UF = '+QuotedStr(edtEstado.Text)+' ORDER BY Cidade');
   tabCidades.Open;
end;

procedure TrtEmissaoClientes.QRSubDetail1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
   inherited;
   vTotalCli:=vTotalCli + 1;
   qrlTotal.Caption:='Total de Clientes: '+FloatToStr(vTotalCli);
end;

procedure TrtEmissaoClientes.qrpClientesBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   inherited;
   vTotalCli:=0;
end;

procedure TrtEmissaoClientes.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  vTabEmailRelacao: TZQuery;
begin
  inherited;

  if rdgCamposRelatorio.ItemIndex = 1 then
  begin
    if tabBase.FieldByName('CodigoCliente').AsString <> '' then
    begin
      tabEmailRelacao.Close;
      tabEmailRelacao.SQL.Clear;
      tabEmailRelacao.SQL.Add('select * from clientes_emails where clientes_emails.CodigoCliente = ' + tabBase.FieldByName('CodigoCliente').AsString);
      tabEmailRelacao.Open;

      qrlEmailRelacao.Lines.Text := '';

      if tabEmailRelacao.RecordCount <> 0 then
      begin
        tabEmailRelacao.First;

        while not tabEmailRelacao.Eof do
        begin
          qrlEmailRelacao.Lines.Text := qrlEmailRelacao.Lines.Text + tabEmailRelacao.FieldByName('email').AsString + ';';
          tabEmailRelacao.Next;
        end;

        qrlEmailRelacao.Lines.Text := Copy(qrlEmailRelacao.Lines.Text, 1, Length(qrlEmailRelacao.Lines.Text) - 3);
      end;

    end;
  end;

end;

end.

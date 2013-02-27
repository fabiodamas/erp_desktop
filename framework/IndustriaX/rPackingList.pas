unit rPackingList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls;

type
  TrtPackingList = class(TfmFormBaseRelatorio)
    tabPackingList: TZQuery;
    pndDialogo: TPrintDialog;
    qrpPackingList: TQuickRep;
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
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    Label1: TLabel;
    edtPedido: TEdit;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape3: TQRShape;
    qrlEmpNome: TQRLabel;
    qrlEmpEndereco: TQRLabel;
    qrlEmpCidade: TQRLabel;
    qrlEmpCep: TQRLabel;
    QRShape4: TQRShape;
    qrlEmpFoneFax: TQRLabel;
    qrlEmpEmail: TQRLabel;
    qrlEmpWebSite: TQRLabel;
    QRLabel12: TQRLabel;
    qrlClienteCep: TQRLabel;
    qrlClienteCidade: TQRLabel;
    qrlClienteEndereco: TQRLabel;
    qrlClienteNome: TQRLabel;
    qrlClientePais: TQRLabel;
    qrlClienteFone1: TQRLabel;
    qrlClienteFone2: TQRLabel;
    qrlClienteFone3: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    qrlData: TQRLabel;
    qrlPedido: TQRLabel;
    tabPackingListProdutos: TZQuery;
    tabClientes: TZQuery;
    tabConfigPropri: TZQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
     procedure GerarImpressao(Impressora: Boolean = False);
  public
  end;

implementation

uses uFormBase, uMenu, uFuncoes, uEnderecos;

{$R *.dfm}

procedure TrtPackingList.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TrtPackingList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabPackingList.Close;
   tabPackingListProdutos.Close;
   tabClientes.Close;
   tabConfigPropri.Close;
   inherited;
end;

procedure TrtPackingList.btnVisualizarClick(Sender: TObject);
begin
   inherited;
   GerarImpressao();
end;

procedure TrtPackingList.GerarImpressao(Impressora: Boolean = False);
begin
   tabPackingList.Close;
   tabPackingList.SQL.Clear;
   tabPackingList.SQL.Add('SELECT * FROM packing_list WHERE Pedido = '+edtPedido.Text);
   tabPackingList.Open;

   tabPackingListProdutos.Close;
   tabPackingListProdutos.SQL.Clear;
   tabPackingListProdutos.SQL.Add('SELECT packing_list_produtos.*, unidades.Sigla');
   tabPackingListProdutos.SQL.Add('FROM packing_list_produtos');
   tabPackingListProdutos.SQL.Add('LEFT JOIN produtos ON produtos.CodigoProduto = packing_list_produtos.CodigoProduto');
   tabPackingListProdutos.SQL.Add('LEFT JOIN unidades ON produtos.CodigoUnidade = unidades.Codigo');   
   tabPackingListProdutos.SQL.Add('WHERE Pedido = '+edtPedido.Text); 
   tabPackingListProdutos.Open;

   tabClientes.Close;
   tabClientes.SQL.Clear;
   tabClientes.SQL.Add('SELECT * FROM clientes WHERE CodigoCliente = '+tabPackingList.FieldByName('CodigoCliente').AsString);
   tabClientes.Open;

   qrlTitulo.Caption:='Packing List: '+edtPedido.Text;  
   qrlPedido.Caption:=tabPackingList.FieldByName('Pedido').AsString;
   qrlData.Caption:=FormatDateTime('dd/MM/yyyy', Date);  

   qrlEmpNome.Caption:='NAME: '+tabConfigPropri.FieldByName('RazaoSocial').AsString;
   qrlEmpEndereco.Caption:='ADDRESS: '+tabConfigPropri.FieldByName('Endereco').AsString+', '+tabConfigPropri.FieldByName('Numero').AsString;
   qrlEmpCidade.Caption:='CITY: '+LocateCidade(tabConfigPropri.FieldByName('CodigoCidade').AsString);
   qrlEmpCep.Caption:='ZIP CODE: '+tabConfigPropri.FieldByName('Cep').AsString;
   qrlEMpFoneFax.Caption:='Fone/Fax: '+tabConfigPropri.FieldByName('Telefone').AsString;
   qrlEmpEmail.Caption:='E-MAIL: '+tabConfigPropri.FieldByName('Email').AsString;
   qrlEmpWebSite.Caption:='WEBSITE: '+tabConfigPropri.FieldByName('Site').AsString;

   qrlClienteNome.Caption:='NAME: '+tabClientes.FieldByName('NomeFantasia').AsString;
   qrlClienteEndereco.Caption:='ADDRESS: '+tabClientes.FieldByName('Endereco').AsString+', '+tabClientes.FieldByName('Numero').AsString;
   qrlClienteCidade.Caption:='CITY: '+LocateCidade(tabClientes.FieldByName('CodigoCidade').AsString)+' - '+tabClientes.FieldByName('Estado').AsString;
   qrlClienteCep.Caption:='ZIP CODE: '+tabClientes.FieldByName('Cep').AsString;
   qrlClientePais.Caption:='COUNTRY: '+LocatePais(tabClientes.FieldByName('CodigoPais').AsString);
   qrlClienteFone1.Caption:=tabClientes.FieldByName('Telefone1').AsString;
   qrlClienteFone2.Caption:=tabClientes.FieldByName('Telefone2').AsString;
   qrlClienteFone3.Caption:=tabClientes.FieldByName('Telefone3').AsString;      

   if Impressora = True then begin
      if pndDialogo.Execute then begin
         qrpPackingList.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
         qrpPackingList.Print;
      end;
    end
   else begin
      qrpPackingList.PreviewModal;
   end;
end;

procedure TrtPackingList.btnImprimirClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(True);
end;

procedure TrtPackingList.FormShow(Sender: TObject);
begin
   inherited;
   edtPedido.Text:=fmMenu.pubTrans1;

   tabConfigPropri.SQL.Add('SELECT * FROM configuracoes_proprietario');
   tabConfigPropri.Open;
end;

end.

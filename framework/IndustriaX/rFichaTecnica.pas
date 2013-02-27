unit rFichaTecnica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls, ToolEdit, qrBarcode;

type
  TrtFichaTecnica = class(TfmFormBaseRelatorio)
    tabProdutos: TZQuery;
    pndDialogo: TPrintDialog;
    qrpFT: TQuickRep;
    qrbColuna: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    tabFT: TZQuery;
    dtsProdutos: TDataSource;
    qrbPagina: TQRBand;
    qrbRodape: TQRBand;
    qrlSignature: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape2: TQRShape;
    QRSysData2: TQRSysData;
    qrlTitulo: TQRLabel;
    qrbComposicao: TQRBand;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape1: TQRShape;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText4: TQRDBText;
    rdgOrdemEmissao: TRadioGroup;
    edtGrupo: TDBLookupComboBox;
    Label1: TLabel;
    tabGrupos: TZQuery;
    dtsGrupos: TDataSource;
    QRDBText5: TQRDBText;
    QRLabel3: TQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtsProdutosDataChange(Sender: TObject; Field: TField);
  private
    procedure GerarImpressao(Impressora: Boolean = False);
  public 
  end;

implementation

uses uFormBase, uMenu, uFuncoes, uConstantes;          

{$R *.dfm}

procedure TrtFichaTecnica.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);        
end;
   
procedure TrtFichaTecnica.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabProdutos.Close;
   tabFT.Close;
   tabGrupos.Close;
   inherited;
end;

procedure TrtFichaTecnica.btnVisualizarClick(Sender: TObject);
begin
   inherited;  
   GerarImpressao(); 
end;
 
procedure TrtFichaTecnica.GerarImpressao(Impressora: Boolean = False);
begin
   qrlTitulo.Caption:='Ficha Técnica';

   tabProdutos.Close; 
   tabProdutos.SQL.Clear;
   tabProdutos.SQL.Add('SELECT pr.CodigoProduto, pr.NomeTecnico, pr.Peso, pr.ValorCustoProduto');
   tabProdutos.SQL.Add('FROM produtos as pr');
   tabProdutos.SQL.Add('WHERE');

   if Trim(edtGrupo.Text) <> '' then begin
      tabProdutos.SQL.Add('pr.CodigoGrupo = '+QuotedStr(String(edtGrupo.KeyValue))+' AND ');
      qrlTitulo.Caption:=qrlTitulo.Caption + ' - Grupo: '+edtGrupo.Text;
   end;

   tabProdutos.SQL.Add('pr.CodigoProduto IN ');
   tabProdutos.SQL.Add('(SELECT CodigoPrincipal FROM produtos_ficha_tecnica)');

   case rdgOrdemEmissao.ItemIndex of
      0: tabProdutos.SQL.Add('ORDER BY pr.NomeTecnico');
      1: tabProdutos.SQL.Add('ORDER BY pr.NomeTecnico, pr.CodigoGrupo, pr.CodigoModelo');
   end;

   tabProdutos.Open;

   // * Atualização da Ficha Técnica *
   //tabProdutos.First;
   //while not tabProdutos.Eof do begin
   //   Application.ProcessMessages;
   //   fmMenu.AtualizarFichaTecnica(tabProdutos.FieldByName('CodigoProduto').AsString);
   //   tabProdutos.Next;
   //end;
   //tabProdutos.First;

   if Impressora = True then begin 
      if pndDialogo.Execute then begin  
         qrpFT.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;    
         qrpFT.Print;   
      end;
    end
   else begin
      qrpFT.PreviewModal;     
   end;       
end;     
  
procedure TrtFichaTecnica.btnImprimirClick(Sender: TObject);
begin 
   inherited;
   GerarImpressao(True);  
end; 
 
procedure TrtFichaTecnica.FormShow(Sender: TObject);
begin
   inherited;

   tabFT.Params.CreateParam(ftString, 'CodigoProduto', ptUnknown);
   tabFT.SQL.Add('SELECT ft.*, unidades.Sigla AS Sigla');
   tabFT.SQL.Add('FROM produtos_ficha_tecnica AS ft');
   tabFT.SQL.Add('LEFT JOIN unidades ON unidades.Codigo = ft.CodigoUnidade');
   tabFT.SQL.Add('WHERE ft.CodigoPrincipal = :CodigoProduto');
   tabFT.Open;

   tabGrupos.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('1')+' ORDER BY Descricao');
   tabGrupos.Open;
end;

procedure TrtFichaTecnica.dtsProdutosDataChange(Sender: TObject; Field: TField);
begin
   inherited; 
   tabFT.Close; 
   tabFT.ParamByName('CodigoProduto').AsString:=tabProdutos.FieldByName('CodigoProduto').AsString;
   tabFT.Open;
end;

end.

unit rEmissaoTabelaPrecos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls;

type
  TrtEmissaoTabelaPrecos = class(TfmFormBaseRelatorio)
    tabBase: TZQuery;
    pndDialogo: TPrintDialog;
    qrpPrecos: TQuickRep;
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
    rdgOrdemEmissao: TRadioGroup;
    QRLabel3: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    qrlTabela1: TQRLabel;
    QRDBText2: TQRDBText;
    Label1: TLabel;
    edtGrupo: TDBLookupComboBox;
    Label2: TLabel;
    edtSubGrupo: TDBLookupComboBox;
    edtTabelaPreco2: TDBLookupComboBox;
    Label4: TLabel;
    edtTabelaPreco1: TDBLookupComboBox;
    Label5: TLabel;
    tabGrupos: TZQuery;
    dtsGrupos: TDataSource;
    tabSubGrupos: TZQuery;
    dtsSubGrupos: TDataSource;
    Label3: TLabel;
    edtTabelaPreco3: TDBLookupComboBox;
    QRSysData3: TQRSysData;
    qrlTabela2: TQRLabel;
    QRDBText4: TQRDBText;
    qrlTabela3: TQRLabel;
    QRDBText5: TQRDBText;
    tabTipoTabelaPreco: TZQuery;
    dtsTipoTabelaPreco: TDataSource;
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

uses uFormBase, uMenu, uFuncoes, uFormBaseConfig;

{$R *.dfm}

procedure TrtEmissaoTabelaPrecos.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TrtEmissaoTabelaPrecos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabBase.Close;
   tabGrupos.Close;
   tabSubGrupos.Close;
   tabTipoTabelaPreco.Close;
   inherited;
end;

procedure TrtEmissaoTabelaPrecos.btnVisualizarClick(Sender: TObject);
begin
   inherited;
   GerarImpressao();
end;

procedure TrtEmissaoTabelaPrecos.GerarImpressao(Impressora: Boolean = False);
var vWhere, vFields : string;
begin
   if Trim(edtTabelaPreco1.Text+edtTabelaPreco2.Text+edtTabelaPreco3.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento de no Minimo uma Tabela de Preço');
      edtTabelaPreco1.SetFocus;
      exit;
   end;

   vFields:='produtos.CodigoProduto, produtos.NomeTecnico';
   vWhere:='';

   if Trim(edtTabelaPreco1.Text) <> '' then begin
      if Trim(vFields) <> '' then vFields:=vFields + ', ';
      vFields:=vFields + 'preco1.ValorAtual AS Valor1';
      qrlTabela1.Caption:=edtTabelaPreco1.Text;
   end;

   if Trim(edtTabelaPreco2.Text) <> '' then begin
      if Trim(vFields) <> '' then vFields:=vFields + ', ';
      vFields:=vFields + 'preco2.ValorAtual AS Valor2';
      qrlTabela2.Caption:=edtTabelaPreco2.Text;
   end;

   if Trim(edtTabelaPreco3.Text) <> '' then begin
      if Trim(vFields) <> '' then vFields:=vFields + ', ';
      vFields:=vFields + 'preco3.ValorAtual AS Valor3';
      qrlTabela3.Caption:=edtTabelaPreco3.Text;
   end;
   
   tabBase.Close;
   tabBase.SQL.Clear;
   tabBase.SQL.Add('SELECT');
   tabBase.SQL.Add(vFields);
   tabBase.SQL.Add('FROM produtos');

   if Trim(edtTabelaPreco1.Text) <> '' then begin
      tabBase.SQL.Add('LEFT JOIN tabela_precos AS preco1 ON preco1.CodigoProduto = produtos.CodigoProduto AND preco1.CodigoTabela = '+FloatToStr(edtTabelaPreco1.KeyValue));
   end;

   if Trim(edtTabelaPreco2.Text) <> '' then begin
      tabBase.SQL.Add('LEFT JOIN tabela_precos AS preco2 ON preco2.CodigoProduto = produtos.CodigoProduto AND preco2.CodigoTabela = '+FloatToStr(edtTabelaPreco2.KeyValue));
   end;

   if Trim(edtTabelaPreco3.Text) <> '' then begin
      tabBase.SQL.Add('LEFT JOIN tabela_precos AS preco3 ON preco3.CodigoProduto = produtos.CodigoProduto AND preco3.CodigoTabela = '+FloatToStr(edtTabelaPreco3.KeyValue));
   end;   

   if Trim(edtGrupo.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'produtos.CodigoGrupo = '+FloatToStr(edtGrupo.KeyValue);
   end;

   if Trim(edtSubGrupo.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'produtos.CodigoSubGrupo = '+FloatToStr(edtSubGrupo.KeyValue);
   end;

   if Trim(vWhere) <> '' then begin
      tabBase.SQL.Add('WHERE');
      tabBase.SQL.Add(vWhere);
   end;

   tabBase.SQL.Add('ORDER BY');
   case rdgOrdemEmissao.ItemIndex of
      0: tabBase.SQL.Add('produtos.CodigoProduto');
      1: tabBase.SQL.Add('produtos.NomeTecnico');
   end;

   tabBase.Open;
   AfterOpen(tabBase);

   if Impressora = True then begin
      if pndDialogo.Execute then begin
         qrpPrecos.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
         qrpPrecos.Print;
      end;
    end
   else begin
      qrpPrecos.PreviewModal; 
   end; 
end;

procedure TrtEmissaoTabelaPrecos.btnImprimirClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(True);
end;

procedure TrtEmissaoTabelaPrecos.FormShow(Sender: TObject);
begin
   inherited;

   tabTipoTabelaPreco.SQL.Add('SELECT * FROM tipos_tabela_preco ORDER BY Descricao');
   tabTipoTabelaPreco.Open;

   tabGrupos.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('1')+' ORDER BY Descricao');
   tabGrupos.Open;

   tabSubGrupos.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('2')+' ORDER BY Descricao');
   tabSubGrupos.Open;
end;

end.

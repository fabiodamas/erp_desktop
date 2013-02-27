unit rEmissaoOrcamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseRelatorio, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, QuickRpt, Printers,
  QRCtrls, Mask, DBCtrls, Grids, DBGrids, ToolEdit;

type
  TrtEmissaoOrcamentos = class(TfmFormBaseRelatorio)
    tabOrcamentos: TZQuery;
    pndDialogo: TPrintDialog;
    tabChecagens: TZQuery;
    rdgOrdemEmissao: TRadioGroup;
    Label1: TLabel;
    edtOrcamento: TEdit;
    tabClientes: TZQuery;
    dtsOrcamentos: TDataSource;
    rdgTipoOrcamento: TRadioGroup;
    tabOrcamentosProdutos: TZQuery;
    dtsOrcamentosProdutos: TDataSource;
    qrpOrcamentos: TQuickRep;
    QRBand1: TQRBand;
    QRBand4: TQRBand;
    QRLabel12: TQRLabel;
    QRSysData3: TQRSysData;
    QRShape7: TQRShape;
    QRSysData4: TQRSysData;
    qrsOrcamentosProdutos: TQRSubDetail;
    qriLogo: TQRImage;
    qrlNome: TQRLabel;
    qrlEndNumBairro: TQRLabel;
    qrlCidadeUFCep: TQRLabel;
    qrlFoneFax: TQRLabel;
    qrlCnpjIe: TQRLabel;
    qrlTitulo: TQRLabel;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRLabel3: TQRLabel;
    qrlCliCodigoNome: TQRLabel;
    qrlCliContato: TQRLabel;
    qrlCliEndeNumBairro: TQRLabel;
    qrlCliCidadeEstadoCep: TQRLabel;
    QRLabel1: TQRLabel;
    QRShape4: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    qrlCliCnpjCpf: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText7: TQRDBText;
    GroupFooterBand1: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText14: TQRDBText;
    QRShape2: TQRShape;
    QRLabel13: TQRLabel;
    QRShape5: TQRShape;
    QRLabel19: TQRLabel;
    QRShape6: TQRShape;
    QRLabel20: TQRLabel;
    tabResponsavel: TZQuery;
    tabFormasPagto: TZQuery;
    qrlCliFoneFax: TQRLabel;
    QRLabel21: TQRLabel;
    QRDBText15: TQRDBText;
    Label3: TLabel;
    edtDataInicial: TDateEdit;
    edtDataFinal: TDateEdit;
    Label4: TLabel;
    QRDBText16: TQRDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtsOrcamentosDataChange(Sender: TObject; Field: TField);
    procedure qrsOrcamentosProdutosBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
     procedure GerarImpressao(Impressora: Boolean = False);
  public
  end;

var vOrcamento: real;  

implementation

uses uFormBase, uMenu, uFuncoes, uConstantes, uEnderecos;

{$R *.dfm}

procedure TrtEmissaoOrcamentos.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TrtEmissaoOrcamentos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabOrcamentos.Close;
   tabClientes.Close;
   tabOrcamentosProdutos.Close;
   tabResponsavel.Close;
   tabFormasPagto.Close;
   inherited;
end;

procedure TrtEmissaoOrcamentos.btnVisualizarClick(Sender: TObject);
begin
   inherited;
   GerarImpressao();
end;

procedure TrtEmissaoOrcamentos.GerarImpressao(Impressora: Boolean = False);
var vWhere : string;
begin
   vWhere:='';

   qrlTitulo.Caption:='Orçamento';

   tabOrcamentos.Close;
   tabOrcamentos.SQL.Clear; 
   tabOrcamentos.SQL.Add('SELECT * FROM orcamentos');

   case rdgTipoOrcamento.ItemIndex of
      1: begin
         if Trim(vWhere) <> '' then vWhere:=vWhere+' AND ';
         vWhere:=vWhere+'DataPedido IS NULL';
      end;
      2: begin
         if Trim(vWhere) <> '' then vWhere:=vWhere+' AND ';
         vWhere:=vWhere+'DataPedido IS NOT NULL';
      end;
   end;

   if Trim(edtOrcamento.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere+' AND ';
      vWhere:=vWhere+'Orcamento = '+edtOrcamento.Text;
   end; 

   if (Trim(edtDataInicial.Text) <> '/  /') and (Trim(edtDataFinal.Text) <> '/  /') then begin
      qrlTitulo.Caption:=qrlTitulo.Caption + ' Período: '+edtDataInicial.Text+' a '+ edtDataFinal.Text;
      if Trim(vWhere) <> '' then vWhere:=vWhere+' AND ';
      vWhere:=vWhere+'Data >= '+QuotedStr(FormatDateTime(sis_date_format, edtDataInicial.Date))+' AND Data <= '+QuotedStr(FormatDateTime(sis_date_format, edtDataFinal.Date));
   end;

   if Trim(vWhere) <> '' then begin
      tabOrcamentos.SQL.Add('WHERE');
      tabOrcamentos.SQL.Add(vWhere);
   end;

   tabOrcamentos.SQL.Add('ORDER BY');
   case rdgOrdemEmissao.ItemIndex of
      0: tabOrcamentos.SQL.Add('Orcamento');
      1: tabOrcamentos.SQL.Add('Data');
   end;

   tabOrcamentos.Open;

   try
      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT * FROM configuracoes_proprietario');
      tabChecagens.Open;

      qrlNome.Caption:=tabChecagens.FieldByName('RazaoSocial').AsString;
      qrlEndNumBairro.Caption:=tabChecagens.FieldByName('Endereco').AsString+', '+tabChecagens.FieldByName('Numero').AsString+', '+tabChecagens.FieldByName('Bairro').AsString;
      qrlCidadeUFCep.Caption:=LocateCidade(tabChecagens.FieldByName('CodigoCidade').AsString)+', '+tabChecagens.FieldByName('Estado').AsString+', '+tabChecagens.FieldByName('Cep').AsString;
      qrlFoneFax.Caption:=tabChecagens.FieldByName('Telefone').AsString+' - '+tabChecagens.FieldByName('Fax').AsString;
      qrlCnpjIe.Caption:='CNPJ: '+tabChecagens.FieldByName('CNPJ').AsString+' - IE: '+tabChecagens.FieldByName('IE').AsString;

      if not LoadImageFromBD(tabChecagens.FieldByName('LogoPequeno'), qriLogo) then qriLogo.Picture:=nil;      
   finally
      tabChecagens.Close;
   end;

   tabOrcamentos.First;
   vOrcamento:=tabOrcamentos.FieldByName('Orcamento').AsFloat;

   if Impressora = True then begin
      if pndDialogo.Execute then begin
         qrpOrcamentos.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
         qrpOrcamentos.Print;
      end;
    end
   else begin
      qrpOrcamentos.PreviewModal;
   end;
end;

procedure TrtEmissaoOrcamentos.btnImprimirClick(Sender: TObject);
begin
   inherited;
   GerarImpressao(True); 
end;

procedure TrtEmissaoOrcamentos.FormShow(Sender: TObject);
begin
   inherited;

   if Trim(fmMenu.pubTrans1) <> '' then edtOrcamento.Text:=fmMenu.pubTrans1;

   tabClientes.Params.CreateParam(ftFloat, 'CodigoCliente', ptUnknown);
   tabClientes.SQL.Add('SELECT * FROM clientes WHERE CodigoCliente = :CodigoCliente');
   tabClientes.Open;

   tabOrcamentosProdutos.Params.CreateParam(ftFloat, 'Orcamento', ptUnknown);
   tabOrcamentosProdutos.SQL.Add('SELECT * FROM orcamentos_produtos WHERE Orcamento = :Orcamento');
   tabOrcamentosProdutos.Open;

   tabResponsavel.Params.CreateParam(ftFloat, 'CodigoFuncionario', ptUnknown);
   tabResponsavel.SQL.Add('SELECT Codigo,Nome,EmailEmpresa FROM funcionarios WHERE Codigo = :CodigoFuncionario');
   tabResponsavel.Open;

   tabFormasPagto.Params.CreateParam(ftFloat, 'CodigoPagto', ptUnknown);
   tabFormasPagto.SQL.Add('SELECT Codigo,Descricao,Parcelas FROM formas_pagamento WHERE Codigo = :CodigoPagto');
   tabFormasPagto.Open;
end;

procedure TrtEmissaoOrcamentos.dtsOrcamentosDataChange(Sender: TObject;
  Field: TField);
begin
   inherited;
   tabClientes.Close;
   tabClientes.ParamByName('CodigoCliente').AsFloat:=tabOrcamentos.FieldByName('CodigoCliente').AsFloat;
   tabClientes.Open;

   tabOrcamentosProdutos.Close;
   tabOrcamentosProdutos.ParamByName('Orcamento').AsFloat:=tabOrcamentos.FieldByName('Orcamento').AsFloat;
   tabOrcamentosProdutos.Open;

   tabResponsavel.Close;
   tabResponsavel.ParamByName('CodigoFuncionario').AsFloat:=tabOrcamentos.FieldByName('CodigoFuncionario').AsFloat;
   tabResponsavel.Open;

   tabFormasPagto.Close;
   tabFormasPagto.ParamByName('CodigoPagto').AsFloat:=tabOrcamentos.FieldByName('CodigoFormaPagto').AsFloat;
   tabFormasPagto.Open;
end;

procedure TrtEmissaoOrcamentos.qrsOrcamentosProdutosBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   inherited;
   if vOrcamento <> tabOrcamentos.FieldByName('Orcamento').AsFloat then begin
      qrsOrcamentosProdutos.ForceNewPage:=True;
      vOrcamento:=tabOrcamentos.FieldByName('Orcamento').AsFloat;
    end
   else begin
      qrsOrcamentosProdutos.ForceNewPage:=False;
   end;
end;

procedure TrtEmissaoOrcamentos.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var vCnpjCpf, vIeRg, vCidade: string;
begin
   inherited;
                         
   qrlTitulo.Caption:='Orçamento: '+tabOrcamentos.FieldByName('Orcamento').AsString;
   if tabClientes.Active then begin

      qrlCliCodigoNome.Caption:=tabClientes.FieldByName('CodigoCliente').AsString + ' - ' + tabClientes.FieldByName('NomeFantasia').AsString;

      vCnpjCpf:=tabClientes.FieldByName('CpfCnpj').AsString;
      vIeRg:=tabClientes.FieldByName('IeRg').AsString;

      if tabClientes.FieldByName('TipoCliente').AsInteger = 1 then begin
         if Trim(vCnpjCpf) <> '' then begin
            vCnpjCpf:='CNPJ: '+vCnpjCpf;
         end;
         if Trim(vIeRg) <> '' then begin
            vIeRg:='IE: '+vIeRg;
         end;
       end
      else begin
         if Trim(vCnpjCpf) <> '' then begin
            vCnpjCpf:='CPF: '+vCnpjCpf;
         end;
         if Trim(vIeRg) <> '' then begin
            vIeRg:='RG: '+vIeRg;
         end;
      end;

      qrlCliCnpjCpf.Caption:=vCnpjCpf + ' ' + vIeRg;

      qrlCliEndeNumBairro.Caption:='';

      if Trim(tabClientes.FieldByName('Endereco').AsString) <> '' then begin
         if Trim(qrlCliEndeNumBairro.Caption) <> '' then qrlCliEndeNumBairro.Caption:=qrlCliEndeNumBairro.Caption+', ';
         qrlCliEndeNumBairro.Caption:=qrlCliEndeNumBairro.Caption + 'Endereço: '+tabClientes.FieldByName('Endereco').AsString;
      end;

      if Trim(tabClientes.FieldByName('Numero').AsString) <> '' then begin
         if Trim(qrlCliEndeNumBairro.Caption) <> '' then qrlCliEndeNumBairro.Caption:=qrlCliEndeNumBairro.Caption+', ';
         qrlCliEndeNumBairro.Caption:=qrlCliEndeNumBairro.Caption + tabClientes.FieldByName('Numero').AsString;
      end;

      if Trim(tabClientes.FieldByName('Bairro').AsString) <> '' then begin
         if Trim(qrlCliEndeNumBairro.Caption) <> '' then qrlCliEndeNumBairro.Caption:=qrlCliEndeNumBairro.Caption+', ';
         qrlCliEndeNumBairro.Caption:=qrlCliEndeNumBairro.Caption + tabClientes.FieldByName('Bairro').AsString;
      end;

      qrlCliCidadeEstadoCep.Caption:='';

      vCidade:=LocateCidade(tabClientes.FieldByName('CodigoCidade').AsString);

      if Trim(vCidade) <> '' then begin
         if Trim(qrlCliCidadeEstadoCep.Caption) <> '' then qrlCliCidadeEstadoCep.Caption:=qrlCliCidadeEstadoCep.Caption + ', ';
         qrlCliCidadeEstadoCep.Caption:=qrlCliCidadeEstadoCep.Caption + 'Cidade: '+vCidade;
      end;

      if Trim(tabClientes.FieldByName('Estado').AsString) <> '' then begin
         if Trim(qrlCliCidadeEstadoCep.Caption) <> '' then qrlCliCidadeEstadoCep.Caption:=qrlCliCidadeEstadoCep.Caption + ', ';
         qrlCliCidadeEstadoCep.Caption:=qrlCliCidadeEstadoCep.Caption + tabClientes.FieldByName('Estado').AsString;
      end;

      if Trim(tabClientes.FieldByName('Cep').AsString) <> '' then begin
         if Trim(qrlCliCidadeEstadoCep.Caption) <> '' then qrlCliCidadeEstadoCep.Caption:=qrlCliCidadeEstadoCep.Caption + ', ';
         qrlCliCidadeEstadoCep.Caption:=qrlCliCidadeEstadoCep.Caption + tabClientes.FieldByName('Cep').AsString;
      end;

      qrlCliContato.Caption:='Contato: '+tabOrcamentos.FieldByName('Contato').AsString;

      qrlCliFoneFax.Caption:='';

      if Trim(tabClientes.FieldByName('Telefone1').AsString) <> '' then begin
         if Trim(qrlCliFoneFax.Caption) <> '' then qrlCliFoneFax.Caption:=qrlCliFoneFax.Caption+', ';
         qrlCliFoneFax.Caption:=qrlCliFoneFax.Caption + 'Fone: '+tabClientes.FieldByName('Telefone1').AsString;
      end;

      if Trim(tabClientes.FieldByName('Fax1').AsString) <> '' then begin
         if Trim(qrlCliFoneFax.Caption) <> '' then qrlCliFoneFax.Caption:=qrlCliFoneFax.Caption+', ';
         qrlCliFoneFax.Caption:=qrlCliFoneFax.Caption + 'Fax: '+tabClientes.FieldByName('Fax1').AsString;
      end;
   end;
end;

end.

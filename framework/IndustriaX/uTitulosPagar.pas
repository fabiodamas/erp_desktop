unit uTitulosPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Menus, Buttons, ExtCtrls, StdCtrls, Mask, DBCtrls, Grids,
  DBGrids, ImgList, ToolEdit, RXDBCtrl, CurrEdit, uTipos;

type
  TfmTitulosPagar = class(TfmFormBaseCadastro)
    edtCodigoConta: TDBEdit;
    Label1: TLabel;
    edtNomeConta: TDBEdit;
    lblConta: TLabel;
    btnLocalizaConta: TBitBtn;
    edtDataEmissao: TDBDateEdit;
    Label30: TLabel;
    Label3: TLabel;
    edtCodigoCC: TDBEdit;
    edtDescricaoCC: TDBEdit;
    btnLocalizarCentroCusto: TBitBtn;
    Label4: TLabel;
    edtDocumento: TDBEdit;
    Label5: TLabel;
    edtParcela: TDBEdit;
    edtNotaFiscal: TDBEdit;
    Label6: TLabel;
    edtValorTitulo: TDBEdit;
    Label8: TLabel;
    edtDesconto: TDBEdit;
    Label9: TLabel;
    edtAcrescimo: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    edtDataVencto: TDBDateEdit;
    Label12: TLabel;
    edtDataPagamento: TDBDateEdit;
    Label13: TLabel;
    edtHistorico: TDBEdit;
    Label14: TLabel;
    edtNumeroCheque: TDBEdit;
    Label15: TLabel;
    edtEmpresa: TDBLookupComboBox;
    edtLocalizacao: TDBLookupComboBox;
    Label18: TLabel;
    edtCodigoEmpresa: TDBEdit;
    Label19: TLabel;
    Bevel1: TBevel;
    Label17: TLabel;
    dbgLiquidacoes: TDBGrid;
    edtLiqData: TDateEdit;
    Label20: TLabel;
    edtLiqValor: TCurrencyEdit;
    Label21: TLabel;
    edtLiqTipo: TDBLookupComboBox;
    Label22: TLabel;
    btnLiqAdicionar: TBitBtn;
    tabFornecedor: TZQuery;
    dtsFornecedor: TDataSource;
    tabCentroCusto: TZQuery;
    dtsCentroCusto: TDataSource;
    tabTiposLiquidacao: TZQuery;
    dtsTiposLiquidacao: TDataSource;
    tabResponsavel: TZQuery;
    dtsResponsavel: TDataSource;
    tabEmpresas: TZQuery;
    dtsEmpresas: TDataSource;
    tabLocalizacao: TZQuery;
    dtsLocalizacao: TDataSource;
    tabLiquidacoes: TZQuery;
    dtsLiquidacoes: TDataSource;
    tabChecagens: TZQuery;
    Estornar1: TMenuItem;
    edtTipo: TDBComboBox;
    Label24: TLabel;
    tabFuncionarios: TZQuery;
    dtsFuncionarios: TDataSource;
    tabTransportadoras: TZQuery;
    dtsTransportadoras: TDataSource;
    tabBancos: TZQuery;
    dtsBancos: TDataSource;
    Label2: TLabel;
    edtObservacao: TDBMemo;
    Label16: TLabel;
    edtLiqDesconto: TCurrencyEdit;
    edtLiqAcrescimo: TCurrencyEdit;
    Label25: TLabel;
    edtValorRestante: TCurrencyEdit;
    tabConfigPropri: TZQuery;
    Sinalizar1: TMenuItem;
    RemoverSinalizao1: TMenuItem;
    dbcSinalizado: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dtsBaseDataChange(Sender: TObject; Field: TField);
    procedure btnNovoClick(Sender: TObject);
    procedure btnLocalizaContaClick(Sender: TObject);
    procedure btnLocalizarCentroCustoClick(Sender: TObject);
    procedure btnLiqAdicionarClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnOpcoesClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure Estornar1Click(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure edtCodigoContaEnter(Sender: TObject);
    procedure edtDataVenctoExit(Sender: TObject);
    procedure edtLiqDataExit(Sender: TObject);
    procedure edtLiqDescontoExit(Sender: TObject);
    procedure edtLiqAcrescimoExit(Sender: TObject);
    procedure Sinalizar1Click(Sender: TObject);
    procedure RemoverSinalizao1Click(Sender: TObject);
  private
    FTitulo: real;        // * Filtro do Título           =  pubTrans1
    FTipoTela: string[1]; // * '1' Pagar,       '2' Pagos =  pubTrans2
    FEstrutura : TTituloPagar;
    procedure CalculaValorRestante;
    procedure AlterarCampos(pHabilita: boolean);
    procedure CalculaLiq;
  public
    procedure Novo; override;
    procedure Editar; override;
    procedure Deletar; override;
    procedure Cancelar; override;
    function Checagens: Boolean; override;
  end;

var
  fmTitulosPagar: TfmTitulosPagar;

implementation

uses uFormBaseConfig, uMenu, uFuncoes, uLocalizarGenerico,
     uLocalizarTitulosPagar, uConstantes, uObservacoes,
     uLocalizarCentroCusto, uLocalizarFuncionarios;

{$R *.dfm}

procedure TfmTitulosPagar.Cancelar;
begin
end;

procedure TfmTitulosPagar.Editar;
begin
end;

function TfmTitulosPagar.Checagens: Boolean;
begin
   Result:=False;
   if Trim(edtCodigoConta.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Cliente');
      edtCodigoConta.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtDataEmissao.Text) = '/  /' then begin 
      ShowMessage('Obrigatório Preenchimento da Data de Emissão');
      edtDataEmissao.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtCodigoCC.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Centro de Custo');
      edtCodigoCC.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtParcela.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Parcela');
      edtParcela.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtValorTitulo.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Valor do Título');
      edtValorTitulo.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtDataVencto.Text) = '/  /' then begin
      ShowMessage('Obrigatório Preenchimento do Vencimento');
      edtDataVencto.SetFocus;
      Result:=True;
      exit;
   end;
   if Trim(edtEmpresa.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Empresa');
      edtEmpresa.SetFocus;
      Result:=True;
      exit;
   end;
end;

procedure TfmTitulosPagar.Deletar;
begin
   tabChecagens.Close;
   tabChecagens.SQL.Clear;
   tabChecagens.SQL.Add('SELECT * FROM titulos_pagar_liquidacoes');
   tabChecagens.SQL.Add('WHERE Titulo = '+tabBase.FieldByName('Titulo').AsString);
   tabChecagens.Open;
   tabChecagens.First;
   while not tabChecagens.Eof do begin   
      Application.ProcessMessages;
      tabChecagens.Delete;
      tabChecagens.ApplyUpDates;
      Continue;
   end;
   tabChecagens.Close;
end;

procedure TfmTitulosPagar.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TfmTitulosPagar.Novo;
begin
   tabBase.FieldByName('Titulo').AsFloat:=CodeGenerator('titulos_pagar', 'Titulo');
   if edtTipo.Text = 'Fornecedor' then begin
      tabBase.FieldByName('TipoConta').AsString:='1';
    end
   else if edtTipo.Text = 'Funcionário' then begin
      tabBase.FieldByName('TipoConta').AsString:='2';
    end
   else if edtTipo.Text = 'Transportadora' then begin
      tabBase.FieldByName('TipoConta').AsString:='3';
    end
   else if edtTipo.Text = 'Banco' then begin
      tabBase.FieldByName('TipoConta').AsString:='4'; 
   end;
   tabBase.FieldByName('Documento').AsFloat:=tabConfigPropri.FieldByName('NumeroPagar').AsFloat + 1;

   tabConfigPropri.Edit;
   tabConfigPropri.FieldByName('NumeroPagar').AsFloat:=tabConfigPropri.FieldByName('NumeroPagar').AsFloat + 1;
   tabConfigPropri.Post;
   tabConfigPropri.ApplyUpdates;
end;

procedure TfmTitulosPagar.FormShow(Sender: TObject);
var vWhere: string;
begin
   // FTitulo: real;        // * Filtro do Título           =  pubTrans1
   // FTipoTela: string[1]; // * '1' Pagar,       '2' Pagos =  pubTrans2

   tabConfigPropri.SQL.Add('SELECT * FROM configuracoes_proprietario');
   tabConfigPropri.Open;

   vWhere:='';

   if Trim(fmMenu.pubTrans1) <> '' then begin
      FTitulo:=StrToFloat(fmMenu.pubTrans1);
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'Titulo = '+FloatToStr(FTitulo);
   end;

   if Trim(fmMenu.pubTrans2) <> '' then begin
      FTipoTela:=fmMenu.pubTrans2;
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      if FTipoTela = '1' then begin
         vWhere:=vWhere + 'DataPagamento IS NULL';
         Caption:=Caption + ' a Pagar';
       end
      else if FTipoTela = '2' then begin
         vWhere:=vWhere + 'DataPagamento IS NOT NULL';
         Caption:=Caption + ' Pagos';
         btnNovo.Enabled:=False;
      end;  
   end;   

   tabLiquidacoes.Params.CreateParam(ftFloat, 'Titulo', ptUnknown);
   tabLiquidacoes.SQL.Add('SELECT titulos_pagar_liquidacoes.DataLiquida, titulos_pagar_liquidacoes.ValorLiquida, bancos.Descricao AS Banco');
   tabLiquidacoes.SQL.Add('FROM titulos_pagar_liquidacoes');
   tabLiquidacoes.SQL.Add('LEFT JOIN bancos ON bancos.Codigo = titulos_pagar_liquidacoes.TipoLiquida');
   tabLiquidacoes.SQL.Add('WHERE Titulo = :Titulo');
   tabLiquidacoes.Open;

   tabFornecedor.Params.CreateParam(ftFloat, 'CodigoConta', ptUnknown);  
   tabFornecedor.SQL.Add('SELECT CodigoFornecedor,NomeFantasia FROM fornecedores WHERE CodigoFornecedor = :CodigoConta');
   tabFornecedor.Open;

   tabFuncionarios.Params.CreateParam(ftFloat, 'CodigoConta', ptUnknown);
   tabFuncionarios.SQL.Add('SELECT Codigo,Nome FROM funcionarios WHERE Codigo = :CodigoConta');
   tabFuncionarios.Open;

   tabTransportadoras.Params.CreateParam(ftFloat, 'CodigoConta', ptUnknown);
   tabTransportadoras.SQL.Add('SELECT Codigo,Nome FROM transportadoras WHERE Codigo = :CodigoConta');
   tabTransportadoras.Open;

   tabBancos.Params.CreateParam(ftFloat, 'CodigoConta', ptUnknown);
   tabBancos.SQL.Add('SELECT Codigo,Descricao FROM bancos WHERE Codigo = :CodigoConta');
   tabBancos.Open;

   tabCentroCusto.Params.CreateParam(ftFloat, 'CodigoCC', ptUnknown);
   tabCentroCusto.SQL.Add('SELECT * FROM centro_custo WHERE Codigo = :CodigoCC');
   tabCentroCusto.Open; 

   if Trim(vWhere) <> '' then begin
      tabBase.SQL.Add('SELECT * FROM titulos_pagar WHERE '+vWhere);
    end
   else begin
      tabBase.SQL.Add('SELECT * FROM titulos_pagar');  
   end;
   tabBase.Open; 

   tabTiposLiquidacao.SQL.Add('SELECT * FROM bancos ORDER BY Descricao');
   tabTiposLiquidacao.Open;

   tabResponsavel.SQL.Add('SELECT Codigo,Descricao FROM genericos WHERE Tipo = '+QuotedStr('21')+'ORDER BY Descricao');
   tabResponsavel.Open;

   tabEmpresas.SQL.Add('SELECT CodigoEmpresa,NomeFantasia FROM empresas ORDER BY NomeFantasia');
   tabEmpresas.Open;

   tabLocalizacao.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('7')+' ORDER BY Descricao');
   tabLocalizacao.Open;

   FEstrutura:=fmMenu.pubTituloPagar;

   if FEstrutura <> nil then begin
      btnNovo.Click;

      if tabBase.State = dsInsert then begin
         tabBase.FieldByName('Parcela').AsInteger:=FEstrutura.Parcela;
         tabBase.FieldByName('NotaFiscal').AsString:=FEstrutura.NotaFiscal;
         tabBase.FieldByName('ValorTotal').AsFloat:=FEstrutura.ValorTotal;
         tabBase.FieldByName('Observacao').AsString:=FEstrutura.Observacoes;
         tabBase.FieldByName('DescricaoConta').AsString:=FEstrutura.TipoConta;
         tabBase.FieldByName('CodigoConta').AsFloat:=FEstrutura.CodigoConta;
         edtCodigoCC.SetFocus;  
      end;
   end;

   inherited;
end;

procedure TfmTitulosPagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabBase.Close;
   tabFornecedor.Close;
   tabCentroCusto.Close;
   tabTiposLiquidacao.Close;
   tabResponsavel.Close;
   tabEmpresas.Close;
   tabLocalizacao.Close;
   tabLiquidacoes.Close;
   tabFuncionarios.Close;
   tabTransportadoras.Close;
   tabBancos.Close;
   tabConfigPropri.Close;
   inherited;
end;

procedure TfmTitulosPagar.dtsBaseDataChange(Sender: TObject;
  Field: TField);
begin
   inherited;

   tabLiquidacoes.Close;
   tabLiquidacoes.ParamByName('Titulo').AsFloat:=tabBase.FieldByName('Titulo').AsFloat;
   tabLiquidacoes.Open;

   if edtTipo.Text = 'Fornecedor' then begin
      lblConta.Caption:='Fornecedor';
      edtNomeConta.DataSource:=nil;
      edtNomeConta.DataField:='NomeFantasia';
      edtNomeConta.DataSource:=dtsFornecedor;
      tabFornecedor.Close;
      tabFornecedor.ParamByName('CodigoConta').AsFloat:=tabBase.FieldByName('CodigoConta').AsFloat;
      tabFornecedor.Open;
    end
   else if edtTipo.Text = 'Funcionário' then begin
      lblConta.Caption:='Funcionários';
      edtNomeConta.DataSource:=nil;
      edtNomeConta.DataField:='Nome';
      edtNomeConta.DataSource:=dtsFuncionarios;
      tabFuncionarios.Close;
      tabFuncionarios.ParamByName('CodigoConta').AsFloat:=tabBase.FieldByName('CodigoConta').AsFloat;
      tabFuncionarios.Open;
    end
   else if edtTipo.Text = 'Transportadora' then begin
      lblConta.Caption:='Transportadoras';
      edtNomeConta.DataSource:=nil;
      edtNomeConta.DataField:='Nome';
      edtNomeConta.DataSource:=dtsTransportadoras;
      tabTransportadoras.Close;
      tabTransportadoras.ParamByName('CodigoConta').AsFloat:=tabBase.FieldByName('CodigoConta').AsFloat;
      tabTransportadoras.Open;
    end
   else if edtTipo.Text = 'Banco' then begin
      lblConta.Caption:='Banco';
      edtNomeConta.DataSource:=nil;
      edtNomeConta.DataField:='Descricao';
      edtNomeConta.DataSource:=dtsBancos;
      tabBancos.Close;
      tabBancos.ParamByName('CodigoConta').AsFloat:=tabBase.FieldByName('CodigoConta').AsFloat;
      tabBancos.Open;
   end;

   tabCentroCusto.Close;
   tabCentroCusto.ParamByName('CodigoCC').AsString:=tabBase.FieldByName('CodigoCentroCusto').AsString;
   tabCentroCusto.Open;

   CalculaValorRestante; 
end;

procedure TfmTitulosPagar.btnNovoClick(Sender: TObject);
begin
   inherited;
   tabBase.FieldByName('DataEmissao').AsDateTime:=Date;
   tabBase.FieldByName('Parcela').AsInteger:=1;
   edtTipo.SetFocus;
end;

procedure TfmTitulosPagar.btnLocalizaContaClick(Sender: TObject);
var vParamLoc: TParametrosLocalizar;
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtTipo.Text) = '' then begin
         ShowMessage('Obrigatório Preenchimento do Tipo');
         edtTipo.SetFocus; 
         exit;
      end;
      if edtTipo.Text = 'Fornecedor' then begin
         vParamLoc.Table:='fornecedores';
         vParamLoc.KeyField:='CodigoFornecedor';
         vParamLoc.Field1:='NomeFantasia';
         vParamLoc.Filter:='';
       end
      else if edtTipo.Text = 'Funcionário' then begin
         if not Assigned (fmLocalizarFuncionarios) then begin
            Application.CreateForm(TfmLocalizarFuncionarios, fmLocalizarFuncionarios);
            fmLocalizarFuncionarios.ShowModal;
         end;
       end
      else if edtTipo.Text = 'Transportadora' then begin
         vParamLoc.Table:='transportadoras';
         vParamLoc.KeyField:='Codigo';
         vParamLoc.Field1:='Nome';
         vParamLoc.Filter:='';
       end
      else if edtTipo.Text = 'Banco' then begin
         vParamLoc.Table:='bancos';
         vParamLoc.KeyField:='Codigo';
         vParamLoc.Field1:='Descricao';
         vParamLoc.Filter:='';
      end;
      if edtTipo.Text <> 'Funcionário' then begin
         if not Assigned (fmLocalizarGenerico) then begin
            Application.CreateForm(TfmLocalizarGenerico, fmLocalizarGenerico);
            fmLocalizarGenerico.LoadParams(vParamLoc);
            fmLocalizarGenerico.ShowModal;
         end;
      end;
      if Trim(fmMenu.pubTrans1) <> '' then begin
         tabBase.FieldByName('CodigoConta').AsString:=fmMenu.pubTrans1;
      end;
   end;
end;

procedure TfmTitulosPagar.btnLocalizarCentroCustoClick(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if not Assigned (fmLocalizarCentroCusto) then begin
         Application.CreateForm(TfmLocalizarCentroCusto, fmLocalizarCentroCusto);
         fmLocalizarCentroCusto.ShowModal;
      end;
      if Trim(fmMenu.pubTrans1) <> '' then begin
         tabBase.FieldByName('CodigoCentroCusto').AsString:=fmMenu.pubTrans1;
      end; 
   end;
end;

procedure TfmTitulosPagar.btnLiqAdicionarClick(Sender: TObject);
var vValorTotal: real;
    vLiquida: boolean;
begin
   inherited;
   vLiquida:=False;

   if not tabBase.FieldByName('DataPagamento').IsNull then begin
      ShowMessage('Título Totalmente Liquidado');
      exit;
   end;
  
   if not tabBase.FieldByName('Titulo').IsNull then begin
      if Trim(edtLiqData.Text) = '/  /' then begin
         ShowMessage('Obrigatório Preenchimento da Data da Liquidação');
         edtLiqData.SetFocus;
         exit;
      end;
      if edtLiqValor.Value <= 0 then begin
         ShowMessage('Obrigatório Preenchimento do Valor da Liquidação');
         edtLiqValor.SetFocus;
         exit;
      end;
      if Trim(edtLiqTipo.Text) = '' then begin
         ShowMessage('Obrigatório Preenchimento do Tipo de Liquidação');
         edtLiqTipo.SetFocus;
         exit;
      end;
      if (edtLiqDesconto.Value > 0) or (edtLiqAcrescimo.Value > 0) then begin
         tabBase.Edit;
         tabBase.FieldByName('ValorAcrescimo').AsFloat:=tabBase.FieldByName('ValorAcrescimo').AsFloat + edtLiqAcrescimo.Value;
         tabBase.FieldByName('ValorDesconto').AsFloat:=tabBase.FieldByName('ValorDesconto').AsFloat + edtLiqDesconto.Value;
         tabBase.Post;
         tabBase.ApplyUpDates;
      end;
      if RoundReal(edtLiqValor.Value, 2) > RoundReal(((tabBase.FieldByName('ValorTotal').AsFloat-tabBase.FieldByName('ValorDesconto').AsFloat)+tabBase.FieldByName('ValorAcrescimo').AsFloat), 2) then begin
         ShowMessage('Valor da Liquidação Superior ao Valor Total do Título');
         edtLiqValor.SetFocus; 
         exit;
      end;

      try
         vValorTotal:=(tabBase.FieldByName('ValorTotal').AsFloat-tabBase.FieldByName('ValorDesconto').AsFloat)+tabBase.FieldByName('ValorAcrescimo').AsFloat;

         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT SUM(ValorLiquida) AS vTotalLiq FROM titulos_pagar_liquidacoes WHERE Titulo = '+FloatToStr(tabBase.FieldByName('Titulo').AsFloat));
         tabChecagens.Open;

         if RoundReal((tabChecagens.FieldByName('vTotalLiq').AsFloat+edtLiqValor.Value), 2) > RoundReal(vValorTotal, 2) then begin
            ShowMessage('Valor da Liquidação Superior ao Valor Total do Título e das Parcelas Liquidadas');
            edtLiqValor.SetFocus;
            exit;
          end
         else if RoundReal((tabChecagens.FieldByName('vTotalLiq').AsFloat+edtLiqValor.Value),2) = RoundReal(vValorTotal,2) then begin
            vLiquida:=True;
         end;
         
      finally
         tabChecagens.Close; 
      end;

      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT * FROM titulos_pagar_liquidacoes WHERE 0');
      tabChecagens.Open;

      tabChecagens.Append;
      tabChecagens.FieldByName('ID').AsFloat:=CodeGenerator('titulos_pagar_liquidacoes', 'ID');
      tabChecagens.FieldByName('Titulo').AsFloat:=tabBase.FieldByName('Titulo').AsFloat;
      tabChecagens.FieldByName('TipoLiquida').AsFloat:=StrToFloat(edtLiqTipo.KeyValue);
      tabChecagens.FieldByName('DataLiquida').AsDateTime:=edtLiqData.Date;
      tabChecagens.FieldByName('ValorLiquida').AsFloat:=edtLiqValor.Value;
      //tabChecagens.FieldByName('Observacao').AsString:=edtLiqObs.Text;
      tabChecagens.FieldByName('Sinalizado').AsInteger:=tabBase.FieldByName('Sinalizado').AsInteger;
      tabChecagens.Post;
      tabChecagens.ApplyUpdates;

      if vLiquida = True then begin
         tabBase.Edit;
         tabBase.FieldByName('DataPagamento').AsDateTime:=edtLiqData.Date;
         tabBase.Post;
         tabBase.ApplyUpdates;
      end;

      tabLiquidacoes.Close;
      tabLiquidacoes.ParamByName('Titulo').AsFloat:=tabBase.FieldByName('Titulo').AsFloat;
      tabLiquidacoes.Open;

      edtLiqTipo.KeyValue:=NULL;
      edtLiqData.Clear;
      edtLiqValor.Value:=0;
      //edtLiqObs.Text:='';

      CalculaValorRestante;
    end
   else begin
      ShowMessage('Grave o Título para Liquidar Parcelas');
   end;
end;

procedure TfmTitulosPagar.btnLocalizarClick(Sender: TObject);
var vFM : TfmLocalizarTitulosPagar;
begin
   inherited;
   fmMenu.pubTrans1:=FTipoTela;
   vFM:=TfmLocalizarTitulosPagar.Create(Self);
   vFM.Show;
end;

procedure TfmTitulosPagar.CalculaValorRestante;
var vValor: real;
    vLiquidacoes: real;
begin
   vLiquidacoes:=0;
   vValor:=tabBase.FieldByName('ValorTotal').AsFloat-tabBase.FieldByName('ValorDesconto').AsFloat;
   vValor:=vValor + tabBase.FieldByName('ValorAcrescimo').AsFloat;
   try
      dbgLiquidacoes.DataSource:=nil; 
      if tabLiquidacoes.RecordCount > 0 then begin
         tabLiquidacoes.First;
         while not tabLiquidacoes.Eof do begin
            vLiquidacoes:=vLiquidacoes + tabLiquidacoes.FieldByName('ValorLiquida').AsFloat;
            tabLiquidacoes.Next;
         end;
      end;
      edtValorRestante.Value:=(vValor-vLiquidacoes);
   finally
      dbgLiquidacoes.DataSource:=dtsLiquidacoes;
   end;
end;

procedure TfmTitulosPagar.btnOpcoesClick(Sender: TObject);
begin
   if tabLiquidacoes.RecordCount = 0 then begin
      Estornar1.Enabled:=False;
    end
   else begin
      Estornar1.Enabled:=True;
   end;

   if tabBase.FieldByName('Sinalizado').AsInteger = 1 then begin
      Sinalizar1.Enabled:=False;
      RemoverSinalizao1.Enabled:=True;
    end
   else begin
      Sinalizar1.Enabled:=True;
      RemoverSinalizao1.Enabled:=False;
   end;
   
   inherited;
end;

procedure TfmTitulosPagar.btnGravarClick(Sender: TObject);
begin
   inherited;
   AlterarCampos(True);
   if FTipoTela = '2' then begin
      btnNovo.Enabled:=False;
   end;
end;

procedure TfmTitulosPagar.btnCancelarClick(Sender: TObject);
begin
   inherited; 
   AlterarCampos(True);
   if FTipoTela = '2' then begin
      btnNovo.Enabled:=False;
   end;
end;

procedure TfmTitulosPagar.Estornar1Click(Sender: TObject);
begin
   inherited;
   if not (tabBase.State in [dsInsert, dsEdit]) then begin
      if Application.MessageBox('Deseja Realmente Estornar o Título?', PChar(Application.Title), 36) = 7 then exit;

      try
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT * FROM titulos_pagar_liquidacoes WHERE Titulo = '+tabBase.FieldByName('Titulo').AsString);
         tabChecagens.Open;
         tabChecagens.First;
         while not tabChecagens.Eof do begin
            tabChecagens.Delete;
            tabChecagens.ApplyUpdates;
            Continue;
         end;
      finally
         tabChecagens.Close;
      end;

      tabLiquidacoes.Close;
      tabLiquidacoes.ParamByName('Titulo').AsFloat:=tabBase.FieldByName('Titulo').AsFloat;
      tabLiquidacoes.Open;

      tabBase.Edit;
      tabBase.FieldByName('DataPagamento').Clear;
      tabBase.Post;
      tabBase.ApplyUpdates;
   end;
end;

procedure TfmTitulosPagar.AlterarCampos(pHabilita: boolean);
begin
   edtTipo.Enabled:=pHabilita;
   edtCodigoConta.Enabled:=pHabilita;
   btnLocalizaConta.Enabled:=pHabilita;
//   edtCodigoCC.Enabled:=pHabilita;
//   btnLocalizarCentroCusto.Enabled:=pHabilita;
   edtParcela.Enabled:=pHabilita;
//   edtValorTitulo.Enabled:=pHabilita;
//   edtDesconto.Enabled:=pHabilita;
//   edtAcrescimo.Enabled:=pHabilita;
end;

procedure TfmTitulosPagar.btnEditarClick(Sender: TObject);
begin
   inherited;
   AlterarCampos(False);
end;

procedure TfmTitulosPagar.edtCodigoContaEnter(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtTipo.Text) = '' then begin
         ShowMessage('Obrigatório Preenchimento do Tipo');
         edtTipo.SetFocus;
      end;
   end;
end;

procedure TfmTitulosPagar.edtDataVenctoExit(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtDataVencto.Text) <> '/  /' then begin
         if edtDataVencto.Date < Date then begin
            if Application.MessageBox('Data de Vencimento Retroativa, Confirmar?', PChar(Application.Title), 36) = 7 then begin
               edtDataVencto.SetFocus;
            end;
         end;
      end;
   end;
end;

procedure TfmTitulosPagar.CalculaLiq; 
begin
   edtLiqValor.Value:=(edtValorRestante.Value+edtLiqAcrescimo.Value)-edtLiqDesconto.Value;
end;

procedure TfmTitulosPagar.edtLiqDataExit(Sender: TObject);
begin
   inherited;
   CalculaLiq;
end;

procedure TfmTitulosPagar.edtLiqDescontoExit(Sender: TObject);
begin
   inherited;
   CalculaLiq;
end;

procedure TfmTitulosPagar.edtLiqAcrescimoExit(Sender: TObject);
begin
   inherited;
   CalculaLiq;
end;

procedure TfmTitulosPagar.Sinalizar1Click(Sender: TObject);
begin
   inherited;
   if Trim(tabBase.FieldByName('Titulo').AsString) <> '' then begin
      if tabBase.State = dsBrowse then begin
         tabBase.Edit;
         tabBase.FieldByName('Sinalizado').AsInteger:=1;
         tabBase.Post;
         tabBase.ApplyUpDates;
         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT * FROM titulos_pagar_liquidacoes WHERE Titulo = '+QuotedStr(tabBase.FieldByName('Titulo').AsString));
            tabChecagens.Open;

            tabChecagens.First;
            while not tabChecagens.Eof do begin

               tabChecagens.Edit;
               tabChecagens.FieldByName('Sinalizado').AsInteger:=1;
               tabChecagens.Post;
               tabChecagens.ApplyUpdates;

               tabChecagens.Next;
            end;

            ShowMessage('Títulos Sinalizados.');
         finally
            tabChecagens.Close;
         end;
      end;
   end;
end;

procedure TfmTitulosPagar.RemoverSinalizao1Click(Sender: TObject);
begin
   inherited;
   if Trim(tabBase.FieldByName('Titulo').AsString) <> '' then begin
      if tabBase.State = dsBrowse then begin
         tabBase.Edit;
         tabBase.FieldByName('Sinalizado').AsInteger:=0;
         tabBase.Post;
         tabBase.ApplyUpDates;
         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT * FROM titulos_pagar_liquidacoes WHERE Titulo = '+QuotedStr(tabBase.FieldByName('Titulo').AsString));
            tabChecagens.Open;

            tabChecagens.First;
            while not tabChecagens.Eof do begin

               tabChecagens.Edit;
               tabChecagens.FieldByName('Sinalizado').AsInteger:=0;
               tabChecagens.Post;
               tabChecagens.ApplyUpdates;

               tabChecagens.Next;
            end;

            ShowMessage('Removida Sinalização dos Títulos.');
         finally
            tabChecagens.Close;
         end;
      end;
   end;
end;

end.

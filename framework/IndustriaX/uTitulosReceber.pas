unit uTitulosReceber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Menus, Buttons, ExtCtrls, StdCtrls, Mask, DBCtrls, Grids,
  DBGrids, ImgList, ToolEdit, RXDBCtrl, CurrEdit;

type
  TfmTitulosReceber = class(TfmFormBaseCadastro)
    edtCodigoCliente: TDBEdit;
    Label1: TLabel;
    edtNomeCliente: TDBEdit;
    Label2: TLabel;
    btnLocalizaClientes: TBitBtn;
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
    edtResponsavel: TDBLookupComboBox;
    Label16: TLabel;
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
    tabClientes: TZQuery;
    dtsClientes: TDataSource;
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
    Label23: TLabel;
    edtObservacao: TDBMemo;
    edtValorRestante: TCurrencyEdit;
    Label24: TLabel;
    edtLiqDesconto: TCurrencyEdit;
    edtLiqAcrescimo: TCurrencyEdit;
    Label25: TLabel;
    tabConfigPropri: TZQuery;
    Label7: TLabel;
    edtImposto: TDBEdit;
    Sinalizar1: TMenuItem;
    RemoverSinalizao1: TMenuItem;
    dbcSinalizado: TDBCheckBox;
    N1: TMenuItem;
    N2: TMenuItem;
    GerarTriplicata1: TMenuItem;
    dbrImpressoBoleto: TDBRadioGroup;
    dbrGeradoRemessa: TDBRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dtsBaseDataChange(Sender: TObject; Field: TField);
    procedure btnNovoClick(Sender: TObject);
    procedure btnLocalizaClientesClick(Sender: TObject);
    procedure btnLocalizarCentroCustoClick(Sender: TObject);
    procedure btnLiqAdicionarClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnOpcoesClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure Estornar1Click(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure edtDataVenctoExit(Sender: TObject);
    procedure edtLiqDataExit(Sender: TObject);
    procedure edtLiqDescontoExit(Sender: TObject);
    procedure edtLiqAcrescimoExit(Sender: TObject);
    procedure Sinalizar1Click(Sender: TObject);
    procedure RemoverSinalizao1Click(Sender: TObject);
    procedure GerarTriplicata1Click(Sender: TObject);
  private
    FTitulo: real;        // * Filtro do Título           =  pubTrans1
    FTipoTela: string[1]; // * '1' Receber, '2' Recebidos =  pubTrans2
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
  fmTitulosReceber: TfmTitulosReceber;

implementation

uses uFormBaseConfig, uMenu, uFuncoes, uTipos, uLocalizarGenerico,
     uLocalizarClientes, uLocalizarTitulosReceber, uConstantes,
     uLocalizarCentroCusto, uTriplicata;

{$R *.dfm}

procedure TfmTitulosReceber.Cancelar;
begin
end;

procedure TfmTitulosReceber.Editar;
begin
end;

function TfmTitulosReceber.Checagens: Boolean;
begin
   Result:=False;
   if Trim(edtCodigoCliente.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Cliente');
      edtCodigoCliente.SetFocus;
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

procedure TfmTitulosReceber.Deletar;
begin
   tabChecagens.Close;
   tabChecagens.SQL.Clear;
   tabChecagens.SQL.Add('SELECT * FROM titulos_receber_liquidacoes');
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

procedure TfmTitulosReceber.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TfmTitulosReceber.Novo;
begin
   tabBase.FieldByName('Titulo').AsFloat:=CodeGenerator('titulos_receber', 'Titulo');
   tabBase.FieldByName('TipoConta').AsString:='1';
   tabBase.FieldByName('PedidoVenda').AsInteger:=0;
   tabBase.FieldByName('ImpressoBoleto').AsString:='Não';
   tabBase.FieldByName('GeradoRemessa').AsString:='Não';   
   tabBase.FieldByName('Documento').AsFloat:=tabConfigPropri.FieldByName('NumeroReceber').AsFloat + 1;

   tabConfigPropri.Edit;
   tabConfigPropri.FieldByName('NumeroReceber').AsFloat:=tabConfigPropri.FieldByName('NumeroReceber').AsFloat + 1; 
   tabConfigPropri.Post;
   tabConfigPropri.ApplyUpdates;
end;

procedure TfmTitulosReceber.FormShow(Sender: TObject);
var vWhere: string;
begin
   // FTitulo: real;        // * Filtro do Título           =  pubTrans1
   // FTipoTela: string[1]; // * '1' Receber, '2' Recebidos =  pubTrans2

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
         Caption:=Caption + ' a Receber';
       end
      else if FTipoTela = '2' then begin
         vWhere:=vWhere + 'DataPagamento IS NOT NULL';
         Caption:=Caption + ' Recebidos';
         btnNovo.Enabled:=False;
      end;
   end; 

   tabLiquidacoes.Params.CreateParam(ftFloat, 'Titulo', ptUnknown);
   tabLiquidacoes.SQL.Add('SELECT titulos_receber_liquidacoes.DataLiquida, titulos_receber_liquidacoes.ValorLiquida, bancos.Descricao AS Banco');
   tabLiquidacoes.SQL.Add('FROM titulos_receber_liquidacoes');
   tabLiquidacoes.SQL.Add('LEFT JOIN bancos ON bancos.Codigo = titulos_receber_liquidacoes.TipoLiquida');
   tabLiquidacoes.SQL.Add('WHERE Titulo = :Titulo');
   tabLiquidacoes.Open;

   tabClientes.Params.CreateParam(ftFloat, 'CodigoConta', ptUnknown);
   tabClientes.SQL.Add('SELECT CodigoCliente,NomeFantasia FROM clientes WHERE CodigoCliente = :CodigoConta');
   tabClientes.Open;

   tabCentroCusto.Params.CreateParam(ftFloat, 'CodigoCC', ptUnknown);
   tabCentroCusto.SQL.Add('SELECT * FROM centro_custo WHERE Codigo = :CodigoCC');
   tabCentroCusto.Open;

   if Trim(vWhere) <> '' then begin
      tabBase.SQL.Add('SELECT * FROM titulos_receber WHERE '+vWhere);
    end
   else begin
      tabBase.SQL.Add('SELECT * FROM titulos_receber');
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

   inherited;
end;

procedure TfmTitulosReceber.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabBase.Close;
   tabClientes.Close;
   tabCentroCusto.Close;
   tabTiposLiquidacao.Close;
   tabResponsavel.Close;
   tabEmpresas.Close;
   tabLocalizacao.Close;
   tabLiquidacoes.Close;
   tabConfigPropri.Close;
   inherited;
end;

procedure TfmTitulosReceber.dtsBaseDataChange(Sender: TObject;
  Field: TField);
begin
   inherited;

   tabLiquidacoes.Close;
   tabLiquidacoes.ParamByName('Titulo').AsFloat:=tabBase.FieldByName('Titulo').AsFloat;
   tabLiquidacoes.Open;

   tabClientes.Close;
   tabClientes.ParamByName('CodigoConta').AsFloat:=tabBase.FieldByName('CodigoConta').AsFloat;
   tabClientes.Open;

   tabCentroCusto.Close;
   tabCentroCusto.ParamByName('CodigoCC').AsString:=tabBase.FieldByName('CodigoCentroCusto').AsString;
   tabCentroCusto.Open;

   CalculaValorRestante; 
end;

procedure TfmTitulosReceber.btnNovoClick(Sender: TObject);
begin
   inherited;
   tabBase.FieldByName('DataEmissao').AsDateTime:=Date;
   tabBase.FieldByName('Parcela').AsInteger:=1;
   edtCodigoCliente.SetFocus;
end;

procedure TfmTitulosReceber.btnLocalizaClientesClick(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if not Assigned (fmLocalizarClientes) then begin
         Application.CreateForm(TfmLocalizarClientes, fmLocalizarClientes);
         fmLocalizarClientes.ShowModal;
      end;
      if Trim(fmMenu.pubTrans1) <> '' then begin
         tabBase.FieldByName('CodigoConta').AsFloat:=StrToFloat(fmMenu.pubTrans1);
      end;
   end;
end;

procedure TfmTitulosReceber.btnLocalizarCentroCustoClick(Sender: TObject);
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

procedure TfmTitulosReceber.btnLiqAdicionarClick(Sender: TObject);
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

      if RoundReal(edtLiqValor.Value, 2) > RoundReal(((tabBase.FieldByName('ValorTotal').AsFloat-tabBase.FieldByName('ValorDesconto').AsFloat)+tabBase.FieldByName('ValorAcrescimo').AsFloat+tabBase.FieldByName('ValorImposto').AsFloat), 2) then begin
         ShowMessage('Valor da Liquidação Superior ao Valor Total do Título');
         edtLiqValor.SetFocus;
         exit;
      end;

      try

         vValorTotal:=(tabBase.FieldByName('ValorTotal').AsFloat-tabBase.FieldByName('ValorDesconto').AsFloat)+tabBase.FieldByName('ValorAcrescimo').AsFloat+tabBase.FieldByName('ValorImposto').AsFloat;

         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT SUM(ValorLiquida) AS vTotalLiq FROM titulos_receber_liquidacoes WHERE Titulo = '+FloatToStr(tabBase.FieldByName('Titulo').AsFloat));
         tabChecagens.Open;

         if RoundReal((tabChecagens.FieldByName('vTotalLiq').AsFloat+edtLiqValor.Value), 2) > Roundreal(vValorTotal, 2) then begin
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
      tabChecagens.SQL.Add('SELECT * FROM titulos_receber_liquidacoes WHERE 0');
      tabChecagens.Open;

      tabChecagens.Append;
      tabChecagens.FieldByName('ID').AsFloat:=CodeGenerator('titulos_receber_liquidacoes', 'ID');
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
      edtLiqDesconto.Value:=0;
      edtLiqAcrescimo.Value:=0;
      //edtLiqObs.Text:='';

      CalculaValorRestante;
    end
   else begin
      ShowMessage('Grave o Título para Liquidar Parcelas');
   end;
end;

procedure TfmTitulosReceber.btnLocalizarClick(Sender: TObject);
var vFM : TfmLocalizarTitulosReceber;
begin
   inherited;
   fmMenu.pubTrans1:=FTipoTela;
   vFM:=TfmLocalizarTitulosReceber.Create(Self);
   vFM.Show;
end;

procedure TfmTitulosReceber.CalculaValorRestante;
var vValor: real;
    vLiquidacoes: real;
begin
   vLiquidacoes:=0;
   vValor:=tabBase.FieldByName('ValorTotal').AsFloat-tabBase.FieldByName('ValorDesconto').AsFloat;
   vValor:=vValor + tabBase.FieldByName('ValorAcrescimo').AsFloat;
   vValor:=vValor + tabBase.FieldByName('ValorImposto').AsFloat; 

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

procedure TfmTitulosReceber.btnOpcoesClick(Sender: TObject);
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

   if (tabBase.FieldByName('DataPagamento').IsNull) and (Date > tabBase.FieldByName('DataVencimento').AsDateTime) and (tabBase.FieldByName('PedidoVenda').AsInteger = 1) then begin     
      GerarTriplicata1.Enabled:=True; 
    end
   else begin
      GerarTriplicata1.Enabled:=False;
   end;

   inherited;
end;

procedure TfmTitulosReceber.btnGravarClick(Sender: TObject);
begin
   inherited;
   AlterarCampos(True);
   if FTipoTela = '2' then begin
      btnNovo.Enabled:=False;
   end;
end;

procedure TfmTitulosReceber.btnCancelarClick(Sender: TObject);
begin
   inherited; 
   AlterarCampos(True);
   if FTipoTela = '2' then begin
      btnNovo.Enabled:=False;
   end;
end;

procedure TfmTitulosReceber.Estornar1Click(Sender: TObject);
begin
   inherited;
   if not (tabBase.State in [dsInsert, dsEdit]) then begin
      if Application.MessageBox('Deseja Realmente Estornar o Título?', PChar(Application.Title), 36) = 7 then exit;
      try
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT * FROM titulos_receber_liquidacoes WHERE Titulo = '+tabBase.FieldByName('Titulo').AsString);
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

procedure TfmTitulosReceber.AlterarCampos(pHabilita: boolean);
begin
   edtCodigoCliente.Enabled:=pHabilita; 
   btnLocalizaClientes.Enabled:=pHabilita;
   edtCodigoCC.Enabled:=pHabilita;
   btnLocalizarCentroCusto.Enabled:=pHabilita;
   edtParcela.Enabled:=pHabilita;
//   edtValorTitulo.Enabled:=pHabilita;
end;

procedure TfmTitulosReceber.btnEditarClick(Sender: TObject);
begin
   inherited;
   AlterarCampos(True);
end;

procedure TfmTitulosReceber.edtDataVenctoExit(Sender: TObject);
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

procedure TfmTitulosReceber.edtLiqDataExit(Sender: TObject);
begin
   inherited;
   CalculaLiq;
end;

procedure TfmTitulosReceber.edtLiqDescontoExit(Sender: TObject);
begin
   CalculaLiq;
end;

procedure TfmTitulosReceber.CalculaLiq;
begin
   edtLiqValor.Value:=(edtValorRestante.Value+edtLiqAcrescimo.Value)-edtLiqDesconto.Value;
end;

procedure TfmTitulosReceber.edtLiqAcrescimoExit(Sender: TObject);
begin
   inherited;
   CalculaLiq;  
end;

procedure TfmTitulosReceber.Sinalizar1Click(Sender: TObject);
begin
   inherited;
   if Trim(tabBase.FieldByName('Titulo').AsString) <> '' then begin
      if tabBase.State = dsBrowse then begin
         tabBase.Edit;
         tabBase.FieldByName('Sinalizado').AsInteger:=1;
         tabBase.Post;
         tabBase.ApplyUpdates;

         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT * FROM titulos_receber_liquidacoes WHERE Titulo = '+QuotedStr(tabBase.FieldByName('Titulo').AsString));
            tabChecagens.Open;

            tabChecagens.First;
            while not tabChecagens.Eof do begin

               tabChecagens.Edit;
               tabChecagens.FieldByName('Sinalizado').AsInteger:=1;
               tabChecagens.Post;
               tabChecagens.ApplyUpdates;

               tabChecagens.Next;
            end;

            ShowMessage('Títulos Sinalizados!');
         finally
            tabChecagens.Close;
         end;
      end;
   end;
end;

procedure TfmTitulosReceber.RemoverSinalizao1Click(Sender: TObject);
begin
   inherited;
   if Trim(tabBase.FieldByName('Titulo').AsString) <> '' then begin
      if tabBase.State = dsBrowse then begin
         tabBase.Edit;
         tabBase.FieldByName('Sinalizado').AsInteger:=0;
         tabBase.Post;
         tabBase.ApplyUpdates;

         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT * FROM titulos_receber_liquidacoes WHERE Titulo = '+QuotedStr(tabBase.FieldByName('Titulo').AsString));
            tabChecagens.Open;

            tabChecagens.First;
            while not tabChecagens.Eof do begin

               tabChecagens.Edit;
               tabChecagens.FieldByName('Sinalizado').AsInteger:=0;
               tabChecagens.Post;
               tabChecagens.ApplyUpdates;

               tabChecagens.Next;
            end;

            ShowMessage('Removida Sinalização dos Títulos!');
         finally
            tabChecagens.Close;
         end;
      end;
   end;
end;

procedure TfmTitulosReceber.GerarTriplicata1Click(Sender: TObject);
var vFM: TfmTriplicata;
begin
   inherited;
   if tabBase.State = dsBrowse then begin
      fmMenu.pubTrans1:=tabBase.FieldByName('Titulo').AsString;
      vFM:=TfmTriplicata.Create(Self);
      vFM.Show;
   end;
end;

end.

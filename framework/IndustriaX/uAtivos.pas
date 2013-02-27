unit uAtivos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Menus, Buttons, ExtCtrls, Mask, DBCtrls, StdCtrls, ComCtrls,
  ToolEdit, RXDBCtrl, CurrEdit, Grids, DBGrids, jpeg;

type
  TfmAtivos = class(TfmFormBaseCadastro)
    Label1: TLabel;
    edtCodigoAtivo: TEdit;
    edtDescricao: TDBEdit;
    Label2: TLabel;
    pgcAtivos: TPageControl;
    tbsGeral: TTabSheet;
    tbsComposicao: TTabSheet;
    tbsManutencao: TTabSheet; 
    edtMarca: TDBEdit;
    Label3: TLabel;
    edtModelo: TDBEdit;
    Label4: TLabel;
    edtVoltagem: TDBEdit;
    Label5: TLabel;
    edtNumeroSerie: TDBEdit;
    Label6: TLabel;
    edtProcedencia: TDBEdit;
    Label7: TLabel;
    edtImportador: TDBEdit;
    Label8: TLabel;
    edtSetor: TDBLookupComboBox;
    Label9: TLabel;
    edtResponsavel: TDBLookupComboBox;
    Label10: TLabel;
    Label11: TLabel;
    Bevel1: TBevel;
    edtDataAquisicao: TDBDateEdit;
    Label30: TLabel;
    edtGarantia: TDBEdit;
    Label12: TLabel;
    edtNotaFiscal: TDBEdit;
    Label13: TLabel;
    edtValorNF: TDBEdit;
    Label14: TLabel;
    edtCodigoFornecedor: TDBEdit;
    Label26: TLabel;
    btnLocalizaFornecedor: TBitBtn;
    edtFornecedor: TDBEdit;
    Label29: TLabel;
    edtComposicao: TDBMemo;
    edtManuData: TDateEdit;
    Label15: TLabel;
    edtManuNF: TEdit;
    Label16: TLabel;
    edtManuCodigoFornecedor: TEdit;
    Label17: TLabel;
    btnManuLocalizaFornecedor: TBitBtn;
    edtManuNomeFornecedor: TEdit;
    edtManuValorNF: TCurrencyEdit;
    Label18: TLabel;
    edtManuPrazoGarantia: TEdit;
    Label19: TLabel;
    edtManuTipoMovimento: TComboBox;
    btnManuAdicionar: TBitBtn;
    btnManuRemover: TBitBtn;
    dbgManutencao: TDBGrid;
    Label20: TLabel;
    tabFornecedor: TZQuery;
    tabResponsavel: TZQuery;
    dtsResponsavel: TDataSource;
    tabSetor: TZQuery;
    dtsSetor: TDataSource;
    dtsFornecedor: TDataSource;
    tabAtivosManutencao: TZQuery;
    dtsAtivosManutencao: TDataSource;
    tabChecagens: TZQuery;
    edtManuObs: TEdit;
    Label21: TLabel;
    lblSemImagem: TLabel;
    imgFotoAtivo: TImage;
    btnAlterarFoto: TBitBtn;
    btnExcluirFoto: TBitBtn;
    tabAtivosFotos: TZQuery;
    edtManuID: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEditarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure dtsBaseDataChange(Sender: TObject; Field: TField);
    procedure btnLocalizaFornecedorClick(Sender: TObject);
    procedure edtCodigoAtivoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnManuAdicionarClick(Sender: TObject);
    procedure btnManuRemoverClick(Sender: TObject);
    procedure btnManuLocalizaFornecedorClick(Sender: TObject);
    procedure edtManuCodigoFornecedorChange(Sender: TObject);
    procedure edtCodigoAtivoKeyPress(Sender: TObject; var Key: Char);
    procedure dbgManutencaoCellClick(Column: TColumn);
    procedure btnAlterarFotoClick(Sender: TObject);
    procedure btnExcluirFotoClick(Sender: TObject);
  private
    FTyping : Boolean;
    procedure AtualizaCodigo;
    procedure AtualizaFotoAtivo;
  public
    procedure Novo; override;
    procedure Editar; override;
    procedure Deletar; override;
    procedure Cancelar; override;
    function Checagens: Boolean; override;
  end;

var
  fmAtivos: TfmAtivos;

implementation

uses uFormBaseConfig, uMenu, uFuncoes, uLocalizarGenerico, uTipos,
  uCadastrarImagem, uTitulosPagar;

{$R *.dfm}

{ Tfrm_ativos }

procedure TfmAtivos.Novo;
begin
   if Trim(edtCodigoAtivo.Text) = '' then begin
      tabBase.FieldByName('Codigo').AsFloat:=CodeGenerator('ativos', 'Codigo');
    end
   else begin
      tabBase.FieldByName('Codigo').AsFloat:=StrToFloat(edtCodigoAtivo.Text);
   end;
end;

procedure TfmAtivos.Editar;
begin
end;

procedure TfmAtivos.Cancelar;
begin
end;

function TfmAtivos.Checagens: Boolean;
begin
   Result:=False;
   if Trim(edtDescricao.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Descrição');
      edtDescricao.SetFocus;
      Result:=True;
      exit;
   end;
   if tabBase.State = dsInsert then begin
      if Trim(edtCodigoAtivo.Text) <> '' then begin
         if ExistsValue('Codigo', 'ativos', edtCodigoAtivo.Text) then begin
            ShowMessage('Código do Ativo já Existente');
            edtCodigoAtivo.SetFocus;
            Result:=True;
            exit;
         end;
      end;
   end;
end;

procedure TfmAtivos.Deletar;
begin
end;

procedure TfmAtivos.FormCreate(Sender: TObject);
begin
   inherited;
   FTyping:=False;
   SetFormStyle(fsMDIChild);
end;

procedure TfmAtivos.FormShow(Sender: TObject);
begin
   inherited;  

   pgcAtivos.ActivePageIndex:=0; 

   tabAtivosManutencao.Params.CreateParam(ftFloat, 'CodigoAtivo', ptUnknown);
   tabAtivosManutencao.SQL.Add('SELECT * FROM ativos_manutencao WHERE CodigoAtivo =:CodigoAtivo ORDER BY Data');
   tabAtivosManutencao.Open;

   tabFornecedor.Params.CreateParam(ftFloat, 'CodigoFornecedor', ptUnknown);
   tabFornecedor.SQL.Add('SELECT CodigoFornecedor,NomeFantasia FROM fornecedores WHERE CodigoFornecedor = :CodigoFornecedor');
   tabFornecedor.Open;   

   tabAtivosFotos.Params.CreateParam(ftFloat, 'CodigoAtivo', ptUnknown);
   tabAtivosFotos.SQL.Add('SELECT * FROM ativos_fotos WHERE CodigoAtivo = :CodigoAtivo');
   tabAtivosFotos.Open;

   tabBase.Params.CreateParam(ftFloat, 'CodigoAtivo', ptUnknown);
   tabBase.SQL.Add('SELECT * FROM ativos WHERE Codigo = :CodigoAtivo');
   tabBase.Open; 

   tabSetor.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('22'));
   tabSetor.Open;

   tabResponsavel.SQL.Add('SELECT Codigo,Nome,DataSaida FROM funcionarios WHERE DataSaida IS NULL ORDER BY Nome');
   tabResponsavel.Open;
end;

procedure TfmAtivos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   tabBase.Close;
   tabFornecedor.Close;
   tabSetor.Close;
   tabResponsavel.Close;
   tabAtivosManutencao.Close;
   tabAtivosFotos.Close;
   inherited;
end;

procedure TfmAtivos.btnEditarClick(Sender: TObject);
begin
   inherited;
   edtCodigoAtivo.Enabled:=False;
end;

procedure TfmAtivos.btnGravarClick(Sender: TObject);
begin
   inherited;
   edtCodigoAtivo.Enabled:=True;
end;

procedure TfmAtivos.btnCancelarClick(Sender: TObject);
begin
   inherited;
   edtCodigoAtivo.Enabled:=True;
end;

procedure TfmAtivos.btnNovoClick(Sender: TObject);
begin
   inherited;

   tabAtivosManutencao.Close;
   tabAtivosManutencao.ParamByName('CodigoAtivo').AsFloat:=-1;
   tabAtivosManutencao.Open;

   tabAtivosFotos.Close;
   tabAtivosFotos.ParamByName('CodigoAtivo').AsFloat:=-1;
   tabAtivosFotos.Open;

   tabFornecedor.Close;
   tabFornecedor.ParamByName('CodigoFornecedor').Value:=-1;
   tabFornecedor.Open;

   edtCodigoAtivo.Text:='';
   edtDescricao.SetFocus;
end;

procedure TfmAtivos.dtsBaseDataChange(Sender: TObject; Field: TField);
begin
   inherited;

   if tabBase.State = dsBrowse then begin
      tabAtivosManutencao.Close;
      tabAtivosManutencao.ParamByName('CodigoAtivo').AsFloat:=tabBase.FieldByName('Codigo').AsFloat;
      tabAtivosManutencao.Open;

      tabAtivosFotos.Close;
      tabAtivosFotos.ParamByName('CodigoAtivo').AsFloat:=tabBase.FieldByName('Codigo').AsFloat;
      tabAtivosFotos.Open;

      AtualizaCodigo;
      AtualizaFotoAtivo; 
   end;

   tabFornecedor.Close;
   tabFornecedor.ParamByName('CodigoFornecedor').Value:=tabBase.FieldByName('CodigoFornecedor').Value;
   tabFornecedor.Open;
end;

procedure TfmAtivos.btnLocalizaFornecedorClick(Sender: TObject);
var vParams: TParametrosLocalizar;
begin
   if tabBase.State in [dsInsert, dsEdit] then begin
      vParams.Table:='fornecedores';
      vParams.KeyField:='CodigoFornecedor';
      vParams.Field1:='NomeFantasia';
      if not Assigned (fmLocalizarGenerico) then begin
         Application.CreateForm(TfmLocalizarGenerico, fmLocalizarGenerico);
         fmLocalizarGenerico.LoadParams(vParams);
         fmLocalizarGenerico.ShowModal;
      end;
      if Trim(fmMenu.pubTrans1) <> '' then begin
         tabBase.FieldByName('CodigoFornecedor').AsFloat:=StrToFloat(fmMenu.pubTrans1);

         tabFornecedor.Close;
         tabFornecedor.ParamByName('CodigoFornecedor').Value:=tabBase.FieldByName('CodigoFornecedor').Value;
         tabFornecedor.Open;
      end;
   end;
end;

procedure TfmAtivos.edtCodigoAtivoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   inherited;
   if tabBase.State = dsBrowse then begin
      if Trim(edtCodigoAtivo.Text) <> '' then begin
         FTyping:=True;
         tabBase.Close;
   	     tabBase.ParamByName('CodigoAtivo').AsFloat:=StrToFloat(edtCodigoAtivo.Text);
         tabBase.Open;
         FTyping:=False;
       end
      else begin
         FTyping:=True;
         tabBase.Close;
  	     tabBase.ParamByName('CodigoAtivo').AsFloat:=-1;
         tabBase.Open;
         FTyping:=False;
	    end;
   end;
end;

procedure TfmAtivos.AtualizaCodigo;
begin
   if FTyping = False then begin
      if not tabBase.FieldByName('Codigo').IsNull then begin
         edtCodigoAtivo.Text:=FloatToStr(tabBase.FieldByName('Codigo').AsFloat);
      end;
   end;
end;

procedure TfmAtivos.btnLocalizarClick(Sender: TObject);
var vParamLoc: TParametrosLocalizar;
begin
   inherited;
   vParamLoc.Table:='ativos';
   vParamLoc.KeyField:='Codigo';
   vParamLoc.Field1:='Nome';
   vParamLoc.Filter:=''; 
   if not Assigned (fmLocalizarGenerico) then begin
      Application.CreateForm(TfmLocalizarGenerico, fmLocalizarGenerico);
      fmLocalizarGenerico.LoadParams(vParamLoc);
      fmLocalizarGenerico.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      edtCodigoAtivo.Text:=fmMenu.pubTrans1;
      tabBase.Close;
      tabBase.ParamByName('CodigoAtivo').Value:=edtCodigoAtivo.Text;
      tabBase.Open;
   end; 
end;

procedure TfmAtivos.btnManuAdicionarClick(Sender: TObject);
var vTituloPagar : TTituloPagar;
    vFM : TfmTitulosPagar;
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if not tabBase.FieldByName('Codigo').IsNull then begin
         if Trim(edtManuData.Text) = '/  /' then begin
            ShowMessage('Obrigatório Preenchimento da Data');
            edtManuData.SetFocus;
            exit;
         end;
         if Trim(edtManuNF.Text) = '' then begin
            ShowMessage('Obrigatório Preenchimento da Nota Fiscal');
            edtManuNF.SetFocus;
            exit;
         end;
         if Trim(edtManuCodigoFornecedor.Text) = '' then begin
            ShowMessage('Obrigatório Preenchimento do Fornecedor');
            edtManuCodigoFornecedor.SetFocus;
            exit;
         end;
         if edtManuTipoMovimento.ItemIndex < 0 then begin
            ShowMessage('Obrigatório Preenchimento do Tipo do Movimento');
            edtManuTipoMovimento.SetFocus;
            exit;
         end;
         try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT * FROM ativos_manutencao WHERE ID = '+QuotedStr(edtManuID.Text));
            tabChecagens.Open;

            if tabChecagens.RecordCount = 0 then begin
               tabChecagens.Append;
               tabChecagens.FieldByName('ID').AsFloat:=CodeGenerator('ativos_manutencao', 'ID');
             end
            else begin
               tabChecagens.Edit;
            end;
            tabChecagens.FieldByName('CodigoAtivo').AsFloat:=tabBase.FieldByName('Codigo').AsFloat;
            tabChecagens.FieldByName('Data').AsDateTime:=edtManuData.Date;
            tabChecagens.FieldByName('NF').AsString:=edtManuNF.Text;
            tabChecagens.FieldByName('CodigoFornecedor').AsFloat:=StrToFloat(edtManuCodigoFornecedor.Text);
            tabChecagens.FieldByName('Valor').AsFloat:=edtManuValorNF.Value;
            tabChecagens.FieldByName('PrazoGarantia').AsString:=edtManuPrazoGarantia.Text;
            tabChecagens.FieldByName('Observacao').AsString:=edtManuObs.Text;
            case edtManuTipoMovimento.ItemIndex of
               0: begin
                  tabChecagens.FieldByName('TipoMovimento').AsString:='1';
                  tabChecagens.FieldByName('DescricaoMovimento').AsString:='Entrada';
               end;
               1: begin
                  tabChecagens.FieldByName('TipoMovimento').AsString:='2';
                  tabChecagens.FieldByName('DescricaoMovimento').AsString:='Saída';
               end;
            end; 
            tabChecagens.Post;
            tabChecagens.ApplyUpDates;

            tabAtivosManutencao.Close;
            tabAtivosManutencao.ParamByName('CodigoAtivo').Value:=tabBase.FieldByName('Codigo').Value;
            tabAtivosManutencao.Open;

            if edtManuTipoMovimento.ItemIndex = 0 then begin
               if Application.MessageBox('Deseja Gerar uma Conta a Pagar?', PChar(Application.Title), 36) = 7 then exit;

               try
                  vTituloPagar:=TTituloPagar.Create;
                  vTituloPagar.Parcela:=1;
                  vTituloPagar.TipoConta:='Fornecedor';
                  vTituloPagar.CodigoConta:=StrToFloat(edtManuCodigoFornecedor.Text);
                  vTituloPagar.ValorTotal:=edtManuValorNF.Value;
                  vTituloPagar.NotaFiscal:=edtManuNF.Text;
                  vTituloPagar.Observacoes:='CADASTRO DE ATIVOS: '+edtCodigoAtivo.Text+' '+edtManuObs.Text;

                  fmMenu.pubTrans1:='';
                  fmMenu.pubTrans2:='1';
                  fmMenu.pubTituloPagar:=vTituloPagar;
                  vFM:=TfmTitulosPagar.Create(Self);
                  vFM.Show;
               finally
                  vTituloPagar.Free; 
               end;
            end;
         finally
            edtManuData.Clear;
            edtManuID.Text:='';
            edtManuNF.Text:='';
            edtManuCodigoFornecedor.Text:='';
            edtManuValorNF.Value:=0;
            edtManuPrazoGarantia.Text:='';
            edtManuTipoMovimento.ItemIndex:=-1;
            edtManuObs.Text:='';
            edtManuData.SetFocus;
            tabChecagens.Close;
         end;
       end
      else begin
         ShowMessage('Obrigatório Preenchimento do Código do Cliente');
      end;
   end;
end;

procedure TfmAtivos.btnManuRemoverClick(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if tabAtivosManutencao.RecordCount > 0 then begin
         if Application.MessageBox('Deseja Realmente Excluir a Manutenção desse Ativo?', PChar(Application.Title), 36) = 7 then exit;
         tabAtivosManutencao.Delete;
         tabAtivosManutencao.ApplyUpdates;
         edtManuID.Text:='';
      end;
   end;
end;

procedure TfmAtivos.btnManuLocalizaFornecedorClick(Sender: TObject);
var vParamLoc: TParametrosLocalizar;
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      vParamLoc.Table:='fornecedores';
      vParamLoc.KeyField:='CodigoFornecedor'; 
      vParamLoc.Field1:='NomeFantasia';
      vParamLoc.Filter:='';
      if not Assigned (fmLocalizarGenerico) then begin
         Application.CreateForm(TfmLocalizarGenerico, fmLocalizarGenerico);
         fmLocalizarGenerico.LoadParams(vParamLoc);
         fmLocalizarGenerico.ShowModal;
      end;
      if Trim(fmMenu.pubTrans1) <> '' then begin
         edtManuCodigoFornecedor.Text:=fmMenu.pubTrans1;
      end;
   end;
end;

procedure TfmAtivos.edtManuCodigoFornecedorChange(Sender: TObject);
begin
   inherited;
   if tabBase.State in [dsInsert, dsEdit] then begin
      if Trim(edtManuCodigoFornecedor.Text) <> '' then begin
         tabChecagens.Close;
         tabChecagens.SQL.Clear;
         tabChecagens.SQL.Add('SELECT CodigoFornecedor,NomeFantasia FROM fornecedores WHERE CodigoFornecedor = '+edtManuCodigoFornecedor.Text);
         tabChecagens.Open;
         if tabChecagens.RecordCount > 0 then begin
            edtManuNomeFornecedor.Text:=tabChecagens.FieldByName('NomeFantasia').AsString;
          end
         else begin
            edtManuNomeFornecedor.Text:='';
         end;
       end
      else begin
         edtManuNomeFornecedor.Text:='';
      end;
   end;
end;

procedure TfmAtivos.edtCodigoAtivoKeyPress(Sender: TObject; var Key: Char);
begin
   inherited;
   if not (Key in['0'..'9',Chr(8)]) then Key:=#0;
end;

procedure TfmAtivos.dbgManutencaoCellClick(Column: TColumn);
begin
   inherited;
   if tabBase.State = dsEdit then begin
      edtManuID.Text:=tabAtivosManutencao.FieldByName('ID').AsString;
      edtManuData.Date:=tabAtivosManutencao.FieldByName('Data').AsDateTime;
      edtManuNF.Text:=tabAtivosManutencao.FieldByName('NF').AsString;
      edtManuCodigoFornecedor.Text:=tabAtivosManutencao.FieldByName('CodigoFornecedor').AsString;
      edtManuValorNF.Value:=tabAtivosManutencao.FieldByName('Valor').AsFloat;
      edtManuPrazoGarantia.Text:=tabAtivosManutencao.FieldByName('PrazoGarantia').AsString;
      edtManuObs.Text:=tabAtivosManutencao.FieldByName('Observacao').AsString;
      if tabAtivosManutencao.FieldByName('TipoMovimento').AsString = '1' then begin
         edtManuTipoMovimento.ItemIndex:=0;
       end
      else begin
         edtManuTipoMovimento.ItemIndex:=1;
      end;
   end;
end;

procedure TfmAtivos.AtualizaFotoAtivo;
begin 
   if not LoadImageFromBD(tabAtivosFotos.FieldByName('Foto'), imgFotoAtivo) then imgFotoAtivo.Picture:=nil; 
end;

procedure TfmAtivos.btnAlterarFotoClick(Sender: TObject);
var vImg : TJPEGImage; 
begin
   inherited;
   if (Trim(edtCodigoAtivo.Text) <> '') and (tabBase.RecordCount > 0) then begin
      if not Assigned (fmCadastrarImagem) then begin
         Application.CreateForm(TfmCadastrarImagem, fmCadastrarImagem);
         fmCadastrarImagem.ShowModal;
      end;
      if fmMenu.pubTransImg <> nil then begin
         imgFotoAtivo.Picture.Graphic:=fmMenu.pubTransImg;
         vImg:=TJPEGImage.Create;
         try try
            vImg.Assign(fmMenu.pubTransImg);
            tabAtivosFotos.Append;
            tabAtivosFotos.FieldByName('CodigoAtivo').AsString:=edtCodigoAtivo.Text;
            tabAtivosFotos.FieldByName('Foto').Assign(vImg);
            tabAtivosFotos.Post;
            tabAtivosFotos.ApplyUpdates;
         except
            on E: Exception do begin
               imgFotoAtivo.Picture:=nil;
               ShowMessage(E.Message);
            end;
         end;
         finally
            vImg.Free;
         end;
      end;
    end
   else begin
      ShowMessage('Selecione um Ativo para Incluir ou Alterar uma Imagem');
   end;    
end;

procedure TfmAtivos.btnExcluirFotoClick(Sender: TObject); 
begin
   inherited; 
   if tabAtivosFotos.RecordCount > 0 then begin 
      if Application.MessageBox(PChar('Confirmar Exclusão da Foto do Ativo '+tabBase.FieldByName('Codigo').AsString), 'Exclusão da Foto', 36) = 7 then exit;
      if tabBase.FieldByName('Codigo').AsFloat = tabAtivosFotos.FieldByName('CodigoAtivo').AsFloat then begin   
         tabAtivosFotos.Delete;  
         tabAtivosFotos.ApplyUpdates; 
         AtualizaFotoAtivo; 
      end;
   end; 
end;

end.

unit uMoldes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Menus, Buttons, ExtCtrls, ComCtrls, StdCtrls, Mask, DBCtrls,
  ToolEdit, RXDBCtrl, CurrEdit, Grids, DBGrids, jpeg, QuickRpt, QRCtrls,
  Printers;

type
  TfmMoldes = class(TfmFormBaseCadastro)
    pgcMoldes: TPageControl;
    tbsGeral: TTabSheet;
    tbsOperacoes: TTabSheet;
    tbsManutencoes: TTabSheet;
    edtMoldeDataFabricacao: TDBDateEdit;
    Label30: TLabel;
    edtTipo: TDBEdit;
    Label4: TLabel;
    edtGrupo: TDBLookupComboBox;
    Label5: TLabel;
    edtCor: TDBLookupComboBox;
    Label6: TLabel;
    edtPeso: TDBEdit;
    Label7: TLabel;
    edtNumeroCavidades: TDBEdit;
    Label8: TLabel;
    edtTipoCaixa: TDBEdit;
    Label9: TLabel;
    edtEndereco: TDBEdit;
    Label10: TLabel;
    edtSetor: TDBLookupComboBox;
    Label11: TLabel;
    edtObservacoes: TDBMemo;
    Label12: TLabel;
    edtOpData: TDateEdit;
    Label13: TLabel;
    edtOpQtd: TCurrencyEdit;
    Label15: TLabel;
    edtOpSetor: TDBLookupComboBox;
    Label16: TLabel;
    edtOpResponsavel: TDBLookupComboBox;
    Label17: TLabel;
    edtOpMovimento: TComboBox;
    Label18: TLabel;
    btnOpAdicionar: TSpeedButton;
    dbgOperacoes: TDBGrid;
    Label19: TLabel;
    edtManuData: TDateEdit;
    edtManuDocumento: TEdit;
    Label20: TLabel;
    Label21: TLabel;
    edtManuSetor: TDBLookupComboBox;
    edtManuResponsavel: TDBLookupComboBox;
    Label22: TLabel;
    edtManuMovimento: TComboBox;
    Label23: TLabel;
    btnManuAdicionar: TSpeedButton;
    dbgManutencoes: TDBGrid;
    tabGrupoMoldes: TZQuery;
    dtsGrupoMoldes: TDataSource;
    tabCorMolde: TZQuery;
    dtsCorMolde: TDataSource;
    tabSetor: TZQuery;
    dtsSetor: TDataSource;
    tabFuncionarios: TZQuery;
    dtsFuncionarios: TDataSource;
    tabOpMoldes: TZQuery;
    dtsOpMoldes: TDataSource;
    tabChecagens: TZQuery;
    Label1: TLabel;
    edtMoldeCliente: TDBEdit;
    Label2: TLabel;
    edtDescricao: TDBEdit;
    Label3: TLabel;
    edtNumeroMolde: TEdit;
    edtManuQtd: TCurrencyEdit;
    Label24: TLabel;
    tabManuMoldes: TZQuery;
    dtsManuMoldes: TDataSource;
    btnManuRemover: TSpeedButton;
    btnOpRemover: TSpeedButton;
    lblSemImagem: TLabel;
    imgFotoMolde: TImage;
    lblStatusImagem: TLabel;
    btnImagemAnterior: TBitBtn;
    btnImagemProximo: TBitBtn;
    btnAlterarFoto: TBitBtn;
    btnExcluirFoto: TBitBtn;
    tabMoldesFotos: TZQuery;
    dtsMoldesFotos: TDataSource;
    btnOPVisualizar: TSpeedButton;
    qrpOP: TQuickRep;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    qrlTitulo: TQRLabel;
    qrlCliente: TQRLabel;
    QRBand2: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRBand3: TQRBand;
    qrlSignature: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape2: TQRShape;
    QRSysData2: TQRSysData;
    QRSubDetail2: TQRSubDetail;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    edtCodigoCliente: TEdit;
    Label14: TLabel;
    edtNomeCliente: TEdit;
    btnLocalizarCliente: TBitBtn;
    qrlNMolde: TQRLabel;
    qrlDescricaoMolde: TQRLabel;
    edtOpObservacao: TEdit;
    Label25: TLabel;
    QRLabel6: TQRLabel;
    qrmOpObservacao: TQRMemo;
    qrlQuantidade: TQRLabel;
    btnOPImprimir: TSpeedButton;
    pndDialogo: TPrintDialog;
    GerarProdutos1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOpAdicionarClick(Sender: TObject);
    procedure edtNumeroMoldeKeyPress(Sender: TObject; var Key: Char);
    procedure btnEditarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnManuAdicionarClick(Sender: TObject);
    procedure btnManuRemoverClick(Sender: TObject);
    procedure btnOpRemoverClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure edtNumeroMoldeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnExcluirFotoClick(Sender: TObject);
    procedure btnAlterarFotoClick(Sender: TObject);
    procedure btnImagemAnteriorClick(Sender: TObject);
    procedure btnImagemProximoClick(Sender: TObject);
    procedure btnLocalizarClienteClick(Sender: TObject);
    procedure edtCodigoClienteChange(Sender: TObject);
    procedure btnOPVisualizarClick(Sender: TObject);
    procedure btnOPImprimirClick(Sender: TObject);
    procedure GerarProdutos1Click(Sender: TObject);
    procedure dbgOperacoesCellClick(Column: TColumn);
    procedure ExibeDados;
  private
    FTyping: Boolean;
    procedure AtualizaMolde;
    procedure AtualizaFotoMolde;
    procedure AtualizaLabelStatusImagem;
  public
    procedure Novo; override;
    procedure Editar; override;
    procedure Deletar; override;
    procedure Cancelar; override;
    function Checagens: Boolean; override;
  end;

var
  fmMoldes: TfmMoldes;

implementation

uses uFormBaseConfig, uMenu, uConstantes, uFuncoes, uLocalizarGenerico, uTipos,
  uCadastrarImagem, uLocalizarClientes, uGerarProdutos, uObservacoes;

{$R *.dfm}

procedure TfmMoldes.Novo;
begin
  tabBase.FieldByName('NMolde').AsString := edtNumeroMolde.Text;
end;

procedure TfmMoldes.Editar;
begin
end;

procedure TfmMoldes.Deletar;
begin
end;

procedure TfmMoldes.Cancelar;
begin
end;

function TfmMoldes.Checagens: Boolean;
begin
  Result := False;
  if Trim(edtNumeroMolde.Text) = '' then
  begin
    ShowMessage('Obrigatório Preenchimento do Numero do Molde');
    edtNumeroMolde.SetFocus;
    Result := True;
    exit;
  end;
  if Trim(edtDescricao.Text) = '' then
  begin
    ShowMessage('Obrigatório Preenchimento da Descrição');
    edtDescricao.SetFocus;
    Result := True;
    exit;
  end;
  if tabBase.State = dsInsert then
  begin
    if ExistsValue('NMolde', 'moldes', edtNumeroMolde.Text) = True then
    begin
      ShowMessage('Numero do Molde já Existe');
      edtNumeroMolde.SetFocus;
      Result := True;
      exit;
    end;
  end;
end;

procedure TfmMoldes.FormCreate(Sender: TObject);
begin
  inherited;
  SetFormStyle(fsMDIChild);
  FTyping := False;
end;

procedure TfmMoldes.FormShow(Sender: TObject);
begin
  pgcMoldes.ActivePageIndex := 0;

  tabManuMoldes.Params.CreateParam(ftString, 'NMolde', ptUnknown);
  tabManuMoldes.SQL.Add('SELECT Data,Documento,QtdPecas,DescricaoMovimento,CodigoResponsavel FROM moldes_manutencoes WHERE NMolde = :NMolde');
  tabManuMoldes.Open;

  tabOpMoldes.Params.CreateParam(ftString, 'NMolde', ptUnknown);
  tabOpMoldes.SQL.Add('SELECT Data,Documento,QtdPecas,DescricaoMovimento,CodigoResponsavel,CodigoCliente,Observacao FROM moldes_operacoes WHERE NMolde = :NMolde');
  tabOpMoldes.Open;

  tabMoldesFotos.Params.CreateParam(ftString, 'CodigoMolde', ptUnknown);
  tabMoldesFotos.SQL.Add('SELECT ID, CodigoMolde FROM moldes_fotos WHERE CodigoMolde = :CodigoMolde');
  tabMoldesFotos.ParamByName('CodigoMolde').AsFloat := 0;
  tabMoldesFotos.Open;

  tabBase.Params.CreateParam(ftString, 'NMolde', ptUnknown);
  tabBase.SQL.Add('SELECT Endereco, NMolde, DataFabricacao, Tipo, Peso, CodigoSetor, Descricao, CodigoGrupo, CodigoCor, NumeroCavidades, MoldeTipoCaixa, Observacoes, NMoldeCliente FROM moldes WHERE NMolde = :NMolde');
  tabBase.Open;

  tabGrupoMoldes.SQL.Add('SELECT * FROM genericos WHERE Tipo = ' + QuotedStr('1') + ' ORDER BY Descricao');
  tabGrupoMoldes.Open;

  tabCorMolde.SQL.Add('SELECT * FROM cores ORDER BY Descricao');
  tabCorMolde.Open;

  tabSetor.SQL.Add('SELECT * FROM genericos WHERE Tipo = ' + QuotedStr('22') + ' ORDER BY Descricao');
  tabSetor.Open;

  tabFuncionarios.SQL.Add('SELECT Codigo,Nome FROM funcionarios WHERE DataSaida IS NULL ORDER BY Nome');
  tabFuncionarios.Open;

  ExibeDados;

  inherited;
end;

procedure TfmMoldes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tabBase.Close;
  tabGrupoMoldes.Close;
  tabCorMolde.Close;
  tabSetor.Close;
  tabFuncionarios.Close;
  tabOpMoldes.Close;
  tabChecagens.Close;
  tabManuMoldes.Close;
  tabMoldesFotos.Close;
  inherited;
end;

procedure TfmMoldes.btnOpAdicionarClick(Sender: TObject);
var
  vEntradas, vSaidas: real;
begin
  if tabBase.State in [dsInsert, dsEdit] then
  begin
    if Trim(edtNumeroMolde.Text) = '' then
    begin
      ShowMessage('Obrigatório Preenchimento do Numero do Molde');
      exit;
    end;
    if Trim(edtOpData.Text) = '/  /' then
    begin
      ShowMessage('Obrigatório Preenchimento da Data da Operação');
      edtOpData.SetFocus;
      exit;
    end;
    if edtOpQtd.Value <= 0 then
    begin
      ShowMessage('Obrigatório Preenchimento da Quantidade');
      edtOpQtd.SetFocus;
      exit;
    end;
    if Trim(edtOpSetor.Text) = '' then
    begin
      ShowMessage('Obrigatório Preenchimento do Setor');
      edtOpSetor.SetFocus;
      exit;
    end;
    if Trim(edtOpResponsavel.Text) = '' then
    begin
      ShowMessage('Obrigatório Preenchimento do Responsável');
      edtOpResponsavel.SetFocus;
      exit;
    end;
    if edtOpMovimento.ItemIndex < 0 then
    begin
      ShowMessage('Obrigatório Preenchimento do Tipo de Movimento');
      edtOpMovimento.SetFocus;
      exit;
    end;
    if Trim(edtCodigoCliente.Text) = '' then
    begin
      ShowMessage('Obrigatório Preenchimento do Cliente');
      edtCodigoCliente.SetFocus;
      exit;
    end;
    if edtOpMovimento.ItemIndex = 1 then
    begin
      try
        tabChecagens.Close;
        tabChecagens.SQL.Clear;
        tabChecagens.SQL.Add('SELECT SUM(QtdPecas) AS QtdPcs FROM moldes_operacoes WHERE NMolde = ' + QuotedStr(edtNumeroMolde.Text));
        tabChecagens.SQL.Add('AND TipoMovimento = ' + QuotedStr('2'));
        tabChecagens.Open;

        vSaidas := tabChecagens.FieldByName('QtdPcs').AsFloat;

        tabChecagens.Close;
        tabChecagens.SQL.Clear;
        tabChecagens.SQL.Add('SELECT SUM(QtdPecas) AS QtdPcs FROM moldes_operacoes WHERE NMolde = ' + QuotedStr(edtNumeroMolde.Text));
        tabChecagens.SQL.Add('AND TipoMovimento = ' + QuotedStr('1'));
        tabChecagens.Open;

        vEntradas := tabChecagens.FieldByName('QtdPcs').AsFloat;

        if edtOpQtd.Value>(vEntradas - vSaidas) then
        begin
          ShowMessage('Saldo Insuficiente para Efetuar Saída');
          edtOpQtd.SetFocus;
          exit;
        end;
      finally
        tabChecagens.Close;
      end;
    end;

    try
      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT * FROM moldes_operacoes WHERE 0');
      tabChecagens.Open;

      tabChecagens.Append;
      tabChecagens.FieldByName('ID').AsFloat := CodeGenerator('moldes_operacoes', 'ID');
      tabChecagens.FieldByName('NMolde').AsString := edtNumeroMolde.Text;
      tabChecagens.FieldByName('Data').AsDateTime := edtOpData.Date;
      tabChecagens.FieldByName('Documento').AsFloat := CodeGenerator('moldes_operacoes', 'Documento');
      case edtOpMovimento.ItemIndex of
        0:
          begin
            tabChecagens.FieldByName('TipoMovimento').AsString := '1';
            tabChecagens.FieldByName('DescricaoMovimento').AsString := 'Entrada';
          end;
        1:
          begin
            tabChecagens.FieldByName('TipoMovimento').AsString := '2';
            tabChecagens.FieldByName('DescricaoMovimento').AsString := 'Saída';
          end;
      end;
      tabChecagens.FieldByName('QtdPecas').AsFloat := edtOpQtd.Value;
      tabChecagens.FieldByName('CodigoSetor').AsFloat := StrToFloat(edtOpSetor.KeyValue);
      tabChecagens.FieldByName('CodigoResponsavel').AsFloat := StrToFloat(edtOpResponsavel.KeyValue);
      tabChecagens.FieldByName('CodigoCliente').AsFloat := StrToFloat(edtCodigoCliente.Text);
      tabChecagens.FieldByName('Observacao').AsString := edtOpObservacao.Text;
      tabChecagens.Post;
      tabChecagens.ApplyUpdates;

      tabOpMoldes.Close;
      tabOpMoldes.ParamByName('NMolde').Value := tabBase.FieldByName('NMolde').Value;
      tabOpMoldes.Open;

      edtOpData.Clear;
      edtOpQtd.Value := 0;
      edtOpSetor.KeyValue := NULL;
      edtOpResponsavel.KeyValue := NULL;
      edtOpMovimento.ItemIndex := -1;
      edtOpObservacao.Text := '';

      edtOpData.SetFocus;
    finally
      tabChecagens.Close;
    end;
  end
  else
  begin
    ShowMessage('Edite o Molde para Adicionar Operações');
  end;
end;

procedure TfmMoldes.AtualizaMolde;
begin
  if FTyping = False then
  begin
    edtNumeroMolde.Text := tabBase.FieldByName('NMolde').AsString;
  end;
end;

procedure TfmMoldes.edtNumeroMoldeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #32 then
    Key := #0
  else
    Key := UpCase(Key);
end;

procedure TfmMoldes.btnEditarClick(Sender: TObject);
begin
  inherited;
  edtNumeroMolde.Enabled := False;
end;

procedure TfmMoldes.btnNovoClick(Sender: TObject);
begin
  inherited;
  imgFotoMolde.Picture := nil;
  lblStatusImagem.Caption := 'Imagem: 0 / 0';
  edtNumeroMolde.Text := '';
  edtNumeroMolde.SetFocus;
end;

procedure TfmMoldes.btnManuAdicionarClick(Sender: TObject);
var
  vEntradas, vSaidas, vManuSaidas, vManuEntradas: real;
begin
  if tabBase.State in [dsInsert, dsEdit] then
  begin
    if Trim(edtNumeroMolde.Text) = '' then
    begin
      ShowMessage('Obrigatório Preenchimento do Numero do Molde');
      exit;
    end;
    if Trim(edtManuData.Text) = '/  /' then
    begin
      ShowMessage('Obrigatório Preenchimento da Data da Manutenção');
      edtManuData.SetFocus;
      exit;
    end;
    if Trim(edtManuDocumento.Text) = '' then
    begin
      ShowMessage('Obrigatório Preenchimento do Documento');
      edtManuDocumento.SetFocus;
      exit;
    end;
    if edtManuQtd.Value <= 0 then
    begin
      ShowMessage('Obrigatório Preenchimento da Quantidade');
      edtManuQtd.SetFocus;
      exit;
    end;
    if Trim(edtManuSetor.Text) = '' then
    begin
      ShowMessage('Obrigatório Preenchimento do Setor');
      edtManuSetor.SetFocus;
      exit;
    end;
    if Trim(edtManuResponsavel.Text) = '' then
    begin
      ShowMessage('Obrigatório Preenchimento do Responsável');
      edtManuResponsavel.SetFocus;
      exit;
    end;
    if edtManuMovimento.ItemIndex < 0 then
    begin
      ShowMessage('Obrigatório Preenchimento do Tipo de Movimento');
      edtManuMovimento.SetFocus;
      exit;
    end;
    case edtManuMovimento.ItemIndex of
      0:
        begin
          try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT SUM(QtdPecas) AS QtdPcs FROM moldes_operacoes WHERE NMolde = ' + QuotedStr(edtNumeroMolde.Text));
            tabChecagens.SQL.Add('AND TipoMovimento = ' + QuotedStr('2'));
            tabChecagens.Open;

            vSaidas := tabChecagens.FieldByName('QtdPcs').AsFloat;

            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT SUM(QtdPecas) AS QtdPcs FROM moldes_operacoes WHERE NMolde = ' + QuotedStr(edtNumeroMolde.Text));
            tabChecagens.SQL.Add('AND TipoMovimento = ' + QuotedStr('1'));
            tabChecagens.Open;

            vEntradas := tabChecagens.FieldByName('QtdPcs').AsFloat;

            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT SUM(QtdPecas) AS QtdPcs FROM moldes_manutencoes WHERE NMolde = ' + QuotedStr(edtNumeroMolde.Text));
            tabChecagens.SQL.Add('AND TipoMovimento = ' + QuotedStr('2'));
            tabChecagens.Open;

            vManuSaidas := tabChecagens.FieldByName('QtdPcs').AsFloat;

            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT SUM(QtdPecas) AS QtdPcs FROM moldes_manutencoes WHERE NMolde = ' + QuotedStr(edtNumeroMolde.Text));
            tabChecagens.SQL.Add('AND TipoMovimento = ' + QuotedStr('1'));
            tabChecagens.Open;

            vManuEntradas := tabChecagens.FieldByName('QtdPcs').AsFloat;

            if edtManuQtd.Value>(vEntradas - vSaidas) - (vManuEntradas - vManuSaidas) then
            begin
              ShowMessage('Saldo Insuficiente para Efetuar Entrada');
              edtManuQtd.SetFocus;
              exit;
            end;
          finally
            tabChecagens.Close;
          end;
        end;
      1:
        begin
          try
            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT SUM(QtdPecas) AS QtdPcs FROM moldes_manutencoes WHERE NMolde = ' + QuotedStr(edtNumeroMolde.Text));
            tabChecagens.SQL.Add('AND TipoMovimento = ' + QuotedStr('2'));
            tabChecagens.Open;

            vSaidas := tabChecagens.FieldByName('QtdPcs').AsFloat;

            tabChecagens.Close;
            tabChecagens.SQL.Clear;
            tabChecagens.SQL.Add('SELECT SUM(QtdPecas) AS QtdPcs FROM moldes_manutencoes WHERE NMolde = ' + QuotedStr(edtNumeroMolde.Text));
            tabChecagens.SQL.Add('AND TipoMovimento = ' + QuotedStr('1'));
            tabChecagens.Open;

            vEntradas := tabChecagens.FieldByName('QtdPcs').AsFloat;

            if edtManuQtd.Value>(vEntradas - vSaidas) then
            begin
              ShowMessage('Saldo Insuficiente para Efetuar Saída');
              edtManuQtd.SetFocus;
              exit;
            end;
          finally
            tabChecagens.Close;
          end;
        end;
    end;

    try
      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT * FROM moldes_manutencoes WHERE 0');
      tabChecagens.Open;

      tabChecagens.Append;
      tabChecagens.FieldByName('ID').AsFloat := CodeGenerator('moldes_manutencoes', 'ID');
      tabChecagens.FieldByName('NMolde').AsString := edtNumeroMolde.Text;
      tabChecagens.FieldByName('Data').AsDateTime := edtManuData.Date;
      tabChecagens.FieldByName('Documento').AsString := edtManuDocumento.Text;
      case edtManuMovimento.ItemIndex of
        0:
          begin
            tabChecagens.FieldByName('TipoMovimento').AsString := '1';
            tabChecagens.FieldByName('DescricaoMovimento').AsString := 'Entrada';
          end;
        1:
          begin
            tabChecagens.FieldByName('TipoMovimento').AsString := '2';
            tabChecagens.FieldByName('DescricaoMovimento').AsString := 'Saída';
          end;
      end;
      tabChecagens.FieldByName('QtdPecas').AsFloat := edtManuQtd.Value;
      tabChecagens.FieldByName('CodigoSetor').AsFloat := StrToFloat(edtManuSetor.KeyValue);
      tabChecagens.FieldByName('CodigoResponsavel').AsFloat := StrToFloat(edtManuResponsavel.KeyValue);
      tabChecagens.Post;
      tabChecagens.ApplyUpdates;

      tabManuMoldes.Close;
      tabManuMoldes.ParamByName('NMolde').Value := tabBase.FieldByName('NMolde').Value;
      tabManuMoldes.Open;

      edtManuData.Clear;
      edtManuDocumento.Text := '';
      edtManuQtd.Value := 0;
      edtManuSetor.KeyValue := NULL;
      edtManuResponsavel.KeyValue := NULL;
      edtManuMovimento.ItemIndex := -1;

      edtManuData.SetFocus;
    finally
      tabChecagens.Close;
    end;
  end
  else
  begin
    ShowMessage('Edite o Molde para Adicionar Manutenções');
  end;
end;

procedure TfmMoldes.btnManuRemoverClick(Sender: TObject);
begin
  if tabBase.State in [dsInsert, dsEdit] then
  begin
    if tabManuMoldes.RecordCount > 0 then
    begin
      if Application.MessageBox('Deseja Realmente Excluir a Manutenção?', PChar(Application.Title), 36) = 7 then
        exit;
      tabManuMoldes.Delete;
      tabManuMoldes.ApplyUpdates;
    end;
  end;
end;

procedure TfmMoldes.btnOpRemoverClick(Sender: TObject);
begin
  if tabBase.State in [dsInsert, dsEdit] then
  begin
    if tabOpMoldes.RecordCount > 0 then
    begin
      if Application.MessageBox('Deseja Realmente Excluir a Operação?', PChar(Application.Title), 36) = 7 then
        exit;
      tabOpMoldes.Delete;
      tabOpMoldes.ApplyUpdates;
    end;
  end
  else
  begin
    ShowMessage('Edite o Molde para Remover essa Operação');
  end;
end;

procedure TfmMoldes.btnGravarClick(Sender: TObject);
begin
  inherited;
  edtNumeroMolde.Enabled := True;
end;

procedure TfmMoldes.btnCancelarClick(Sender: TObject);
begin
  inherited;
  edtNumeroMolde.Enabled := True;
end;

procedure TfmMoldes.btnLocalizarClick(Sender: TObject);
var
  vParams: TParametrosLocalizar;
begin
  vParams.Table := 'moldes';
  vParams.KeyField := 'NMolde';
  vParams.Field1 := 'Descricao';
  if not Assigned(fmLocalizarGenerico) then
  begin
    Application.CreateForm(TfmLocalizarGenerico, fmLocalizarGenerico);
    fmLocalizarGenerico.LoadParams(vParams);
    fmLocalizarGenerico.ShowModal;
  end;
  if Trim(fmMenu.pubTrans1) <> '' then
  begin
    edtNumeroMolde.Text := fmMenu.pubTrans1;
    tabBase.Close;
    tabBase.ParamByName('NMolde').Value := edtNumeroMolde.Text;
    tabBase.Open;
    ExibeDados;    
  end;
end;

procedure TfmMoldes.edtNumeroMoldeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if tabBase.State = dsBrowse then
  begin
    if Trim(edtNumeroMolde.Text) <> '' then
    begin
      FTyping := True;
      tabBase.Close;
      tabBase.ParamByName('NMolde').AsString := edtNumeroMolde.Text;
      tabBase.Open;
      ExibeDados;      
      FTyping := False;
    end
    else
    begin
      FTyping := True;
      tabBase.Close;
      tabBase.ParamByName('NMolde').AsString := '';
      tabBase.Open;
      ExibeDados;
      FTyping := False;
    end;
  end;
end;

procedure TfmMoldes.AtualizaFotoMolde;
begin
  if not LoadImageFromBD_ID('Foto', 'moldes_fotos', 'ID', tabMoldesFotos.FieldByName('ID').AsString , imgFotoMolde) then
  begin
    imgFotoMolde.Picture := nil;
  end;
end;

procedure TfmMoldes.btnExcluirFotoClick(Sender: TObject);
begin
  if tabMoldesFotos.RecordCount > 0 then
  begin
    if Application.MessageBox(Pchar('Confirmar Exclusão da Foto do Molde ' + tabBase.FieldByName('NMolde').AsString), 'Exclusão da Foto', 36) = 7 then
      exit;
    if tabBase.FieldByName('NMolde').AsString = tabMoldesFotos.FieldByName('CodigoMolde').AsString then
    begin
      tabMoldesFotos.Delete;
      tabMoldesFotos.ApplyUpdates;
      AtualizaFotoMolde;
      AtualizaLabelStatusImagem;
    end;
  end;
end;

procedure TfmMoldes.AtualizaLabelStatusImagem;
begin
  lblStatusImagem.Caption := 'Imagem: ' + IntToStr(tabMoldesFotos.RecNo) + ' / ' + IntToStr(tabMoldesFotos.RecordCount);
end;

procedure TfmMoldes.btnAlterarFotoClick(Sender: TObject);
var
  vZQuery: TZQuery;
  AStream: TMemoryStream;
  vMoldeFotosID : Real;
begin
  if (Trim(edtNumeroMolde.Text) <> '') and (tabBase.RecordCount > 0) then
  begin
    if not Assigned(fmCadastrarImagem) then
    begin
      Application.CreateForm(TfmCadastrarImagem, fmCadastrarImagem);
      fmCadastrarImagem.ShowModal;
    end;
    if fmMenu.pubTransImg <> nil then
    begin

      // Exibe a imagem
      imgFotoMolde.Picture.Graphic := fmMenu.pubTransImg;

      try
        // Prepara a inserçào
        AStream := TMemoryStream.Create;
        vZQuery := TZQuery.Create(nil);
        vZQuery.Connection := fmMenu.zcnConexao;
        vZQuery.Close;
        vZQuery.SQL.Clear;

        try
          // Salva a imagem na variável
          imgFotoMolde.Picture.Graphic.SaveToStream(AStream);
          AStream.Position := 0;

          // Monta o comando SQL com os parametros
          vZQuery.Params.CreateParam(ftFloat, 'pID', ptUnknown);
          vZQuery.Params.CreateParam(ftString, 'pCodigoMolde', ptUnknown);
          vZQuery.Params.CreateParam(ftBlob, 'pFoto', ptUnknown);
          vZQuery.SQL.Add('INSERT INTO moldes_fotos (ID, CodigoMolde, Foto )');
          vZQuery.SQL.Add('VALUES (:pID, :pCodigoMolde, :pFoto)');

          // Preenche os paramestros e insere
          vMoldeFotosID := CodeGenerator('moldes_fotos', 'ID');
          vZQuery.ParamByName('pID').AsFloat := vMoldeFotosID;
          vZQuery.ParamByName('pCodigoMolde').AsString := edtNumeroMolde.Text;
          vZQuery.ParamByName('pFoto').LoadFromStream(AStream, ftBlob);
          vZQuery.ExecSQL;

          tabMoldesFotos.Close;
          tabMoldesFotos.ParamByName('CodigoMolde').AsString := tabBase.FieldByName('NMolde').AsString;
          tabMoldesFotos.Open;

          tabMoldesFotos.Locate('ID',vMoldeFotosID, [] );

          // Coloca a imagem atual
          if not LoadImageFromBD_ID('Foto', 'moldes_fotos', 'ID', FloatToStr(vMoldeFotosID), imgFotoMolde) then
          begin
            imgFotoMolde.Picture := nil;
          end;

          AtualizaLabelStatusImagem;

        finally
          // libera as variáveis
          AStream.Free;
          vZQuery.Free;
        end;

      except
        on E: Exception do
        begin
          imgFotoMolde.Picture := nil;
          ShowMessage(E.Message);
        end;
      end;

    end;
  end
  else
  begin
    ShowMessage('Selecione um Produto para Incluir ou Alterar uma Imagem');
  end;
end;

procedure TfmMoldes.btnImagemAnteriorClick(Sender: TObject);
begin
  inherited;
  tabMoldesFotos.Prior;
  AtualizaFotoMolde;
  AtualizaLabelStatusImagem;
end;

procedure TfmMoldes.btnImagemProximoClick(Sender: TObject);
begin
  inherited;
  tabMoldesFotos.Next;
  AtualizaFotoMolde;
  AtualizaLabelStatusImagem;
end;

procedure TfmMoldes.btnLocalizarClienteClick(Sender: TObject);
begin
  inherited;
  if tabBase.State in [dsInsert, dsEdit] then
  begin
    if not Assigned(fmLocalizarClientes) then
    begin
      Application.CreateForm(TfmLocalizarClientes, fmLocalizarClientes);
      fmLocalizarClientes.ShowModal;
    end;
    if Trim(fmMenu.pubTrans1) <> '' then
    begin
      edtCodigoCliente.Text := fmMenu.pubTrans1;
    end;
  end;
end;

procedure TfmMoldes.edtCodigoClienteChange(Sender: TObject);
begin
  inherited;
  if tabBase.State in [dsInsert, dsEdit] then
  begin
    try
      if Trim(edtCodigoCliente.Text) <> '' then
      begin
        tabChecagens.Close;
        tabChecagens.SQL.Clear;
        tabChecagens.SQL.Add('SELECT NomeFantasia FROM clientes WHERE CodigoCliente = ' + edtCodigoCliente.Text);
        tabChecagens.Open;
        if tabChecagens.RecordCount > 0 then
        begin
          edtNomeCliente.Text := tabChecagens.FieldByName('NomeFantasia').AsString;
        end
        else
        begin
          edtNomeCliente.Text := '';
        end;
      end
      else
      begin
        edtNomeCliente.Text := '';
      end;
    finally
      tabChecagens.Close;
    end;
  end;
end;

procedure TfmMoldes.btnOPVisualizarClick(Sender: TObject);
begin
  inherited;
  if tabOpMoldes.RecordCount > 0 then
  begin
    if tabOpMoldes.FieldByName('DescricaoMovimento').AsString = 'Entrada' then
    begin
      qrlTitulo.Caption := 'Moldes - Ordem de Produção - ' + tabOpMoldes.FieldByName('Documento').AsString;
      qrlNMolde.Caption := edtNumeroMolde.Text;
      qrlDescricaoMolde.Caption := edtDescricao.Text;
      qrlQuantidade.Caption := tabOpMoldes.FieldByName('QtdPecas').AsString;
      qrmOpObservacao.Lines.Text := tabOpMoldes.FieldByName('Observacao').AsString;
      try
        tabChecagens.Close;
        tabChecagens.SQL.Clear;
        tabChecagens.SQL.Add('SELECT NomeFantasia FROM clientes WHERE CodigoCliente = ' + tabOpMoldes.FieldByname('CodigoCliente').AsString);
        tabChecagens.Open;
        qrlCliente.Caption := 'Cliente: ' + tabChecagens.FieldByName('NomeFantasia').AsString;
      finally
        tabChecagens.Close;
      end;
      qrpOP.PreviewModal;
    end;
  end;
end;

procedure TfmMoldes.btnOPImprimirClick(Sender: TObject);
begin
  inherited;
  if tabOpMoldes.RecordCount > 0 then
  begin
    if tabOpMoldes.FieldByName('DescricaoMovimento').AsString = 'Entrada' then
    begin
      qrlTitulo.Caption := 'Moldes - Ordem de Produção - ' + tabOpMoldes.FieldByName('Documento').AsString;
      qrlNMolde.Caption := edtNumeroMolde.Text;
      qrlDescricaoMolde.Caption := edtDescricao.Text;
      qrlQuantidade.Caption := tabOpMoldes.FieldByName('QtdPecas').AsString;
      qrmOpObservacao.Lines.Text := tabOpMoldes.FieldByName('Observacao').AsString;
      try
        tabChecagens.Close;
        tabChecagens.SQL.Clear;
        tabChecagens.SQL.Add('SELECT NomeFantasia FROM clientes WHERE CodigoCliente = ' + tabOpMoldes.FieldByname('CodigoCliente').AsString);
        tabChecagens.Open;
        qrlCliente.Caption := 'Cliente: ' + tabChecagens.FieldByName('NomeFantasia').AsString;
      finally
        tabChecagens.Close;
      end;
      if pndDialogo.Execute then
      begin
        qrpOP.PrinterSettings.PrinterIndex := Printer.PrinterIndex;
        qrpOP.Print;
      end;
    end;
  end;
end;

procedure TfmMoldes.GerarProdutos1Click(Sender: TObject);
var
  vFM: TfmGerarProdutos;
begin
  inherited;
  if Trim(edtNumeroMolde.Text) <> '' then
  begin
    fmMenu.pubTrans1 := edtNumeroMolde.Text;
    fmMenu.pubTrans2 := edtDescricao.Text;
    vFM := TfmGerarProdutos.Create(Self);
    vFM.Show;
  end;
end;

procedure TfmMoldes.dbgOperacoesCellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'Observacao' then
  begin
    if tabBase.State in [dsInsert, dsEdit] then
    begin
      if Trim(tabOpMoldes.FieldByName('Observacao').AsString) <> '' then
      begin
        dbgOperacoes.SetFocus;
        dbgOperacoes.SelectedIndex := 1;
        if not Assigned(fmObservacoes) then
        begin
          Application.CreateForm(TfmObservacoes, fmObservacoes);
          fmObservacoes.Caption := 'Observações das Operação';
          fmObservacoes.pubApplyUpDates := True;
          fmObservacoes.edtObservacoes.DataField := Column.FieldName;
          fmObservacoes.edtObservacoes.DataSource := dtsOpMoldes;
          fmObservacoes.ShowModal;
        end;
      end;
    end
    else
    begin
      if Trim(tabOpMoldes.FieldByName('Observacao').AsString) <> '' then
      begin
        dbgOperacoes.SetFocus;
        dbgOperacoes.SelectedIndex := 1;
        if not Assigned(fmObservacoes) then
        begin
          Application.CreateForm(TfmObservacoes, fmObservacoes);
          fmObservacoes.Caption := 'Observações da Operação';
          fmObservacoes.pubApplyUpDates := True;
          fmObservacoes.edtObservacoes.DataField := Column.FieldName;
          fmObservacoes.edtObservacoes.DataSource := dtsOpMoldes;
          fmObservacoes.ShowModal;
        end;
      end;
    end;
  end;
end;

procedure TfmMoldes.ExibeDados;
begin
  if tabBase.State = dsBrowse then
  begin
    tabOpMoldes.Close;
    tabOpMoldes.ParamByName('NMolde').AsString := tabBase.FieldByName('NMolde').AsString;
    tabOpMoldes.Open;

    tabManuMoldes.Close;
    tabManuMoldes.ParamByName('NMolde').AsString := tabBase.FieldByName('NMolde').AsString;
    tabManuMoldes.Open;

    tabMoldesFotos.Close;
    tabMoldesFotos.ParamByName('CodigoMolde').AsString := tabBase.FieldByName('NMolde').AsString;
    tabMoldesFotos.Open;

    AtualizaMolde;
    AtualizaFotoMolde;
    AtualizaLabelStatusImagem;
  end;
end;

end.


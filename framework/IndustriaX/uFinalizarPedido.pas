unit uFinalizarPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, Grids, DBGrids, StdCtrls, Buttons, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, Menus,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxGroupBox, cxLabel, cxSpinEdit, cxTimeEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, CurrEdit, ComCtrls,
  DBCtrls, Mask, ToolEdit, RXDBCtrl, Math, uFuncoes, ExtCtrls, QRCtrls,
  QuickRpt, Printers, CheckLst,  uFinaPediRelaExpe, uFinaPediRelaAdmn;

type
  TfrmFinalizarPedido = class(TfmFormBaseAvancado)
    tabAuxiliarProdutos: TClientDataSet;
    tabAuxiliarProdutosCodigoProduto: TStringField;
    tabAuxiliarProdutosDescricao: TStringField;
    tabAuxiliarProdutosQuantidade: TFloatField;
    tabAuxiliarProdutosNumeroCavidades: TIntegerField;
    tabAuxiliarProdutosQuantidadeUnidade: TStringField;
    dtsAuxiliarProdutos: TDataSource;
    tabAuxiliarProdutosPontoReposicao: TFloatField;
    tabChecagens: TZQuery;
    tabAuxiliarProdutosFaltas: TFloatField;
    grp1: TGroupBox;
    grp2: TGroupBox;
    tabPedidos: TZQuery;
    tabClientes: TZQuery;
    dtsClientes: TDataSource;
    dtsPedidos: TDataSource;
    tabPedidosProdutos: TZQuery;
    tabUnidades: TZQuery;
    tab1: TZQuery;
    tabVendedor: TZQuery;
    pndDialogo: TPrintDialog;
    grp3: TGroupBox;
    lbl13: TLabel;
    lbl15: TLabel;
    lstAvisarUsuarios: TListBox;
    btnAvisarUsuario: TButton;
    btnEnviaTodasUsuario: TButton;
    btnDevolveUsuario: TButton;
    btnDevolveTodasUsuario: TButton;
    lstAvisarUsuariosSelecionados: TListBox;
    lbl16: TLabel;
    pmOpcoes: TPopupMenu;
    tabAuxiliarProdutosPedidos: TFloatField;
    tabAuxiliarProdutosProducao: TFloatField;
    tabAuxiliarProdutosEstoque: TFloatField;
    btnRelatorioExpedicao: TButton;
    btnRelatorioAdministracao: TButton;
    pnl1: TPanel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl6: TLabel;
    lbl9: TLabel;
    lbl11: TLabel;
    edtCodigoResponsavel: TEdit;
    edtCodigoCliente: TEdit;
    edtNomeResponsavel: TEdit;
    edtNomeCliente: TEdit;
    edtData: TEdit;
    edtHora: TEdit;
    edtDataPrevisao: TEdit;
    edtNomeContato: TEdit;
    pgcOP: TPageControl;
    tsProdutos: TTabSheet;
    dbgrdProdutos: TDBGrid;
    pnl2: TPanel;
    btnConfirmar: TBitBtn;
    btnFechar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    function CalculaQuantidadeProduzir (vPontoReposicao, vQuantidadeUnidade : Real; vNumeroCavidades : String; vPedidos, vProducao, vEstoque : Real): Real;
    function CalculaQuantidadeProduzirTexto (vPontoReposicao, vQuantidadeUnidade : Real; vNumeroCavidades : String; vPedidos, vProducao, vEstoque : Real): String;
    procedure btnEnviaImpressoraClick(Sender: TObject);
    procedure btnDevolveImpressoraClick(Sender: TObject);
    procedure btnEnviaTodasImpressoraClick(Sender: TObject);
    procedure btnDevolveTodasImpressoraClick(Sender: TObject);
    procedure btnAvisarUsuarioClick(Sender: TObject);
    procedure btnEnviaTodasUsuarioClick(Sender: TObject);
    procedure btnDevolveUsuarioClick(Sender: TObject);
    procedure btnDevolveTodasUsuarioClick(Sender: TObject);
    procedure lstImpressoraDblClick(Sender: TObject);
    procedure lstImpressorasSelecionadasDblClick(Sender: TObject);
    procedure lstAvisarUsuariosDblClick(Sender: TObject);
    procedure lstAvisarUsuariosSelecionadosDblClick(Sender: TObject);
    procedure GerarImpressao;
    procedure btnRelatorioExpedicaoClick(Sender: TObject);
    procedure btnRelatorioAdministracaoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FPedido: string;
  public
    procedure DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);

  end;

var
  frmFinalizarPedido: TfrmFinalizarPedido;
  vOrdemProducao : Real = 0;


implementation

uses uFormBase, uMenu,
  rPedidoAdministracao, rPedidoExpedicao, rOrdensProducaoEmissao,
  uPedidosVenda, rPedidoProducaoExpedicao;

{$R *.dfm}

procedure TfrmFinalizarPedido.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TfrmFinalizarPedido.btnFecharClick(Sender: TObject);
begin
   inherited;
   Close;

end;

procedure TfrmFinalizarPedido.DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

end;

procedure TfrmFinalizarPedido.FormShow(Sender: TObject);
var vPontoReposicao, vQuantidadeUnidade, vPedidos, vProducao, vEstoque: real;
var vErroCavidades, vNumeroCavidades, vErroMolde, vMensagem : string;
var vTabFuncionarios, vTabClientes, vTabPedidos, vTabConfigPropri, vTabProdutos, vTabAtualizaEstoque, vTabUnidades, vTabCavidades, vTabCavidades2, vTabPedidosProdutos, vTabUsuarios: TZQuery;
var vStringList: TStringList;
var vCount, vCount2, vCnt : integer;
begin
  inherited;

  vTabUsuarios                    := TZQuery.Create(nil);
  vTabUsuarios.Connection         := fmMenu.zcnConexao;

  // Perfis de usuário
  vTabUsuarios.SQL.Add('SELECT * FROM usuarios ORDER BY Usuario');
  vTabUsuarios.Open;

  vTabUsuarios.First;

  // varre produto por produto
  while not vTabUsuarios.Eof do begin
     lstAvisarUsuarios.Items.Add(vTabUsuarios.FieldByName('Usuario').AsString);

     // Insere o produto na ordem de producao
     vTabUsuarios.Next;
  end;


  // Lista de usuários salvos
  vStringList:=TStringList.Create;
  vStringList := Explode(LoadConfigListBox(GetPathProfileUser, 'ConfigUsuariosImpressao'), ',');
  for vCount:=0 to vStringList.Count-1 do
  begin
     for vCount2 := 0 to  lstAvisarUsuarios.Count-1 do
     begin
          if Trim(vStringList[vCount]) = lstAvisarUsuarios.Items[vCount2] then
          begin
             lstAvisarUsuariosSelecionados.Items.Add(Trim(vStringList[vCount]));
             lstAvisarUsuarios.Items.Delete(vCount2);
             Break;
          end;
     end;
  end;



   try

      vTabConfigPropri               := TZQuery.Create(nil);
      vTabConfigPropri.Connection    := fmMenu.zcnConexao;

      vTabProdutos                   := TZQuery.Create(nil);
      vTabProdutos.Connection        := fmMenu.zcnConexao;

      vTabAtualizaEstoque            := TZQuery.Create(nil);
      vTabAtualizaEstoque.Connection := fmMenu.zcnConexao;

      vTabUnidades                   := TZQuery.Create(nil);
      vTabUnidades.Connection        := fmMenu.zcnConexao;

      vTabCavidades                  := TZQuery.Create(nil);
      vTabCavidades.Connection       := fmMenu.zcnConexao;

      vTabCavidades2                  := TZQuery.Create(nil);
      vTabCavidades2.Connection       := fmMenu.zcnConexao;

      vTabFuncionarios               := TZQuery.Create(nil);
      vTabFuncionarios.Connection    := fmMenu.zcnConexao;

      vTabClientes                   := TZQuery.Create(nil);
      vTabClientes.Connection        := fmMenu.zcnConexao;

      vTabPedidosProdutos                   := TZQuery.Create(nil);
      vTabPedidosProdutos.Connection        := fmMenu.zcnConexao;

      vTabPedidos                           := TZQuery.Create(nil);
      vTabPedidos.Connection                := fmMenu.zcnConexao;



      // Seleciona os produtos do pedido
      vTabPedidos.SQL.Clear;
      vTabPedidos.SQL.Add('SELECT * FROM pedidos WHERE NPedido = :NPedido');
      vTabPedidos.Params.CreateParam(ftFloat, 'NPedido', ptUnknown);
      vTabPedidos.ParamByName('NPedido').AsFloat:=StrToFloat(fmMenu.pubTrans1);
      vTabPedidos.Open;

      // Seleciona os produtos do pedido
      vTabPedidosProdutos.SQL.Clear;
      vTabPedidosProdutos.SQL.Add('SELECT * FROM pedidos_produtos WHERE NPedido = :NPedido AND Composto = 0');
      vTabPedidosProdutos.Params.CreateParam(ftFloat, 'NPedido', ptUnknown);
      vTabPedidosProdutos.ParamByName('NPedido').AsFloat:=StrToFloat(fmMenu.pubTrans1);
      vTabPedidosProdutos.Open;

      vTabFuncionarios.SQL.Add('SELECT Codigo,Nome FROM funcionarios where codigo = :Codigo');
      vTabFuncionarios.Params.CreateParam(ftFloat, 'Codigo', ptUnknown);
      vTabFuncionarios.ParamByName('Codigo').AsFloat:= vTabPedidos.FieldByName('CodigoFuncionario').AsFloat;
      vTabFuncionarios.Open;

      vTabClientes.Params.CreateParam(ftFloat, 'CodigoCliente', ptUnknown);
      vTabClientes.ParamByName('CodigoCliente').AsFloat:= vTabPedidos.FieldByName('CodigoCliente').AsFloat;
      vTabClientes.SQL.Add('SELECT CodigoCliente,NomeFantasia FROM clientes WHERE CodigoCliente = :CodigoCliente');
      vTabClientes.Open;

      // Inserindo registro na ordem de produção e gravando no banco de dados
      edtData.Text              := DateToStr(Date);
      edtHora.Text              := TimeToStr(Time);
      edtDataPrevisao.Text      := vTabPedidos.FieldByName('DataPrevisao').AsString  ;

      edtCodigoResponsavel.Text := vTabPedidos.FieldByName('CodigoFuncionario').AsString;
      edtNomeResponsavel.Text   := vTabFuncionarios.FieldByName('Nome').AsString;

      edtCodigoCliente.Text     := vTabPedidos.FieldByName('CodigoCliente').AsString;
      edtNomeCliente.Text       := vTabClientes.FieldByName('NomeFantasia').AsString;
      edtNomeContato.Text       := vTabPedidos.FieldByName('Contato').AsString;

      tabAuxiliarProdutos.CreateDataSet;
      tabAuxiliarProdutos.EmptyDataSet;
      tabAuxiliarProdutos.IndexFieldNames:='CodigoProduto';
      tabAuxiliarProdutos.Open;


      // varre produto por produto
      while not vTabPedidosProdutos.Eof do begin

         // Insere o produto na ordem de producao
         tabAuxiliarProdutos.Append;

         tabAuxiliarProdutos.FieldByName('CodigoProduto').AsString := vTabPedidosProdutos.FieldByName('CodigoProduto').AsString;
         tabAuxiliarProdutos.FieldByName('Descricao').AsString     := vTabPedidosProdutos.FieldByName('Descricao').AsString;

         // Procurando o ponto de reposição, código do Molde e o código da unidade
         vTabProdutos.Close;
         vTabProdutos.SQL.Clear;
         vTabProdutos.SQL.Add('SELECT PontoReposicao, NMolde, CodigoUnidade FROM produtos WHERE CodigoProduto = '+QuotedStr(vTabPedidosProdutos.FieldByName('CodigoProduto').AsString));
         vTabProdutos.Open;

         // Procurando o número de faltas
         vTabAtualizaEstoque.Close;
         vTabAtualizaEstoque.SQL.Clear;
         vTabAtualizaEstoque.SQL.Add('SELECT * FROM produtos_status_estoque WHERE CodigoProduto = '+QuotedStr(vTabPedidosProdutos.FieldByName('CodigoProduto').AsString));
         vTabAtualizaEstoque.Open;

         // Procurando o número de Cavidades
         // tomar cuidado pois existe numero cavidade que é texto
         vTabCavidades2.Close;
         vTabCavidades2.SQL.Clear;
         vTabCavidades2.SQL.Add('SELECT * FROM produtos_moldes WHERE  CodigoProduto = ' + QuotedStr(vTabPedidosProdutos.FieldByName('CodigoProduto').AsString) );
         vTabCavidades2.Open;

         if vTabCavidades2.RecordCount <= 0 then
         begin
            ShowMessage ('Molde não informado para o produto ' + QuotedStr(vTabPedidosProdutos.FieldByName('CodigoProduto').AsString));
            self.Close;
            Exit;
         end;

         vTabCavidades.Close;
         vTabCavidades.SQL.Clear;
         vTabCavidades.SQL.Add('SELECT NumeroCavidades FROM moldes WHERE  NMolde = ' + QuotedStr(vTabCavidades2.FieldByName('CodigoMolde').AsString) );
         vTabCavidades.Open;

         // Procurando a Quantidade da Unidade
         // CodigoUnidade
         vTabUnidades.Close;
         vTabUnidades.SQL.Clear;
         vTabUnidades.SQL.Add('SELECT Quantidade FROM unidades WHERE Codigo = '+QuotedStr(vTabProdutos.FieldByName('CodigoUnidade').AsString));
         vTabUnidades.Open;


         vPontoReposicao    := 0;
         vNumeroCavidades   := '0';
         vQuantidadeUnidade := 0;

         vPontoReposicao    := vTabProdutos.FieldByName('PontoReposicao').AsFloat;
         vNumeroCavidades   := vTabCavidades.FieldByName('NumeroCavidades').AsString;
         vQuantidadeUnidade := vTabUnidades.FieldByName('Quantidade').AsFloat;
         vPedidos           := vTabPedidosProdutos.FieldByName('Quantidade').AsFloat;
         vProducao          := vtabAtualizaEstoque.FieldByName('Interno').AsFloat;
         vEstoque           := vtabAtualizaEstoque.FieldByName('Estoque').AsFloat;


         if vTabPedidosProdutos.FieldByName('CodigoProduto').AsString = 'T60BG' then begin
          Beep;
         end;

         tabAuxiliarProdutos.FieldByName('PontoReposicao').AsFloat     :=  vPontoReposicao;
         tabAuxiliarProdutos.FieldByName('Faltas').AsFloat             :=  vPedidos - vEstoque;
         tabAuxiliarProdutos.FieldByName('NumeroCavidades').AsFloat    :=  StrToFloat(vNumeroCavidades);
         tabAuxiliarProdutos.FieldByName('QuantidadeUnidade').AsFloat  :=  vQuantidadeUnidade;
         tabAuxiliarProdutos.FieldByName('Pedidos').AsFloat  :=  vPedidos;
         tabAuxiliarProdutos.FieldByName('Producao').AsFloat  :=  vProducao;
         tabAuxiliarProdutos.FieldByName('Estoque').AsFloat  :=  vEstoque;


         tabAuxiliarProdutos.FieldByName('Quantidade').AsFloat     :=  Ceil((CalculaQuantidadeProduzir(vPontoReposicao,
                                                                                              vQuantidadeUnidade,
                                                                                                vNumeroCavidades,
                                                                                                        vPedidos,
                                                                                                       vProducao,
                                                                                                     vEstoque) / vQuantidadeUnidade)) * vQuantidadeUnidade  ;


         tabAuxiliarProdutos.Post;

         // próximo produto
         vTabPedidosProdutos.Next;
      end;

   except
          vMensagem      := 'Ordem de Produção não pode ser gerada: ' + #13 + #13;

          if vTabProdutos.FieldByName('NMolde').AsString = '' then
          begin
             vErroMolde     := '- Molde não informado'      +  #13 +  #13 ;
             vErroCavidades := '';
          end
          else
          begin
             vErroMolde         := '- Número Molde:'         +   QuotedStr(vErroMolde)            +  #13 +  #13 ;
             vErroCavidades     := '- Número de Cavidades:'  + QuotedStr(vTabCavidades.FieldByName('NumeroCavidades').AsString);
          end;

          ShowMessage( vMensagem +
                       '- Erro no número de cavidades. '  +  #13 +  #13 +
                       '- Produto:'              + vTabPedidosProdutos.FieldByName('CodigoProduto').AsString + ', ' + vTabPedidosProdutos.FieldByName('Descricao').AsString + #13 + #13 +
                       vErroMolde + vErroCavidades);


          btnFecharClick(Self);
   end;


  frmFinaPediRelaExpe  := TfrmFinaPediRelaExpe.Create(Self);
  frmFinaPediRelaExpe.FormShow(Self);

  frmFinaPediRelaAdmn := TfrmFinaPediRelaAdmn.Create(Self);
  frmFinaPediRelaAdmn.FormShow(Self);
end;

procedure TfrmFinalizarPedido.btnConfirmarClick(Sender: TObject);
var vPontoReposicao, vQuantidadeUnidade, vPedidos, vProducao, vEstoque: real;
var vErroCavidades, vMensagem, vNumeroCavidades, vErroMolde, vErroCavidade : string;
var vTabFuncionarios, vTabClientes, vTabUsuario, vTabConfigPropri, vTabProdutos, vTabAtualizaEstoque, vTabUnidades, vTabCavidades, vTabCavidades2, vTabPedidos, vTabPedidosProdutos: TZQuery;
var vTabMensagem : TZQuery;
var vCount : Integer;
var vDataPrevisao : TDate;
var vObsOrdemProducao : String;
var vPedido : String;
begin
  inherited;


  SaveConfigListBox(lstAvisarUsuariosSelecionados, GetPathProfileUser, 'ConfigUsuariosImpressao' );

  // Se o usuário deseja realmente gerar a ordem de produção
  if Application.MessageBox('Deseja Realmente Gerar a Ordem de Produção?', PChar(Application.Title), 36) = 7 then exit;

  // Inicia a transação
  tabChecagens.Close;
  tabChecagens.SQL.Clear;
  tabChecagens.SQL.Text:='start transaction';
  tabChecagens.ExecSQL;

  // Caso ocorrer algum erro
  // um rollback é executado
  // try


    vTabMensagem             := TZQuery.Create(nil);
    vTabMensagem.Connection  := fmMenu.zcnConexao;

    vTabUsuario               := TZQuery.Create(nil);
    vTabUsuario.Connection    := fmMenu.zcnConexao;

    vTabMensagem.SQL.Add('SELECT * from mensagem where CodigoMensagem = 0');
    vTabMensagem.Open;


    vTabConfigPropri               := TZQuery.Create(nil);
    vTabConfigPropri.Connection    := fmMenu.zcnConexao;

    vTabProdutos                   := TZQuery.Create(nil);
    vTabProdutos.Connection        := fmMenu.zcnConexao;

    vTabAtualizaEstoque            := TZQuery.Create(nil);
    vTabAtualizaEstoque.Connection := fmMenu.zcnConexao;

    vTabUnidades                   := TZQuery.Create(nil);
    vTabUnidades.Connection        := fmMenu.zcnConexao;

    vTabCavidades                  := TZQuery.Create(nil);
    vTabCavidades.Connection       := fmMenu.zcnConexao;

    vTabCavidades2                  := TZQuery.Create(nil);
    vTabCavidades2.Connection       := fmMenu.zcnConexao;

    vTabFuncionarios               := TZQuery.Create(nil);
    vTabFuncionarios.Connection    := fmMenu.zcnConexao;

    vTabClientes                   := TZQuery.Create(nil);
    vTabClientes.Connection        := fmMenu.zcnConexao;

    vTabPedidosProdutos                   := TZQuery.Create(nil);
    vTabPedidosProdutos.Connection        := fmMenu.zcnConexao;

    vTabPedidos                           := TZQuery.Create(nil);
    vTabPedidos.Connection                := fmMenu.zcnConexao;

    // Seleciona os produtos do pedido
    vTabPedidos.SQL.Clear;
    vTabPedidos.SQL.Add('SELECT * FROM pedidos WHERE NPedido = :NPedido');
    vTabPedidos.Params.CreateParam(ftFloat, 'NPedido', ptUnknown);
    vTabPedidos.ParamByName('NPedido').AsFloat:=StrToFloat(fmMenu.pubTrans1);
    vTabPedidos.Open;

    vDataPrevisao := vTabPedidos.FieldByName('DataPrevisao').AsDateTime;

    // Seleciona os produtos do pedido
    vTabPedidosProdutos.SQL.Clear;
    vTabPedidosProdutos.SQL.Add('SELECT * FROM pedidos_produtos WHERE NPedido = :NPedido AND Composto = 0');
    vTabPedidosProdutos.Params.CreateParam(ftFloat, 'NPedido', ptUnknown);
    vTabPedidosProdutos.ParamByName('NPedido').AsFloat:=StrToFloat(fmMenu.pubTrans1);
    vTabPedidosProdutos.Open;

    vTabFuncionarios.SQL.Add('SELECT Codigo,Nome FROM funcionarios where codigo = :Codigo');
    vTabFuncionarios.Params.CreateParam(ftFloat, 'Codigo', ptUnknown);
    vTabFuncionarios.ParamByName('Codigo').AsFloat:= vTabPedidos.FieldByName('CodigoFuncionario').AsFloat;
    vTabFuncionarios.Open;

    vTabClientes.Params.CreateParam(ftFloat, 'CodigoCliente', ptUnknown);
    vTabClientes.ParamByName('CodigoCliente').AsFloat:= vTabPedidos.FieldByName('CodigoCliente').AsFloat;
    vTabClientes.SQL.Add('SELECT CodigoCliente,NomeFantasia FROM clientes WHERE CodigoCliente = :CodigoCliente');
    vTabClientes.Open;


    vTabConfigPropri.Close;
    vTabConfigPropri.SQL.Add('SELECT NumeroProducao FROM configuracoes_proprietario');
    vTabConfigPropri.Open;
    vOrdemProducao := vTabConfigPropri.FieldByName('NumeroProducao').AsFloat + 1;
    vTabConfigPropri.Edit;
    vTabConfigPropri.FieldByName('NumeroProducao').AsFloat := vOrdemProducao;
    vTabConfigPropri.Post;
    vTabConfigPropri.ApplyUpdates;


    // Inserindo registro na ordem de produção e gravando no banco de dados
    tabChecagens.Close;
    tabChecagens.SQL.Clear;
    tabChecagens.SQL.Add('SELECT * FROM ordem_producao WHERE 0');
    tabChecagens.Open;
    tabChecagens.Append;
    tabChecagens.FieldByName('OrdemProducao').AsFloat        := vOrdemProducao;
    tabChecagens.FieldByName('Data').AsDateTime              := Date;
    tabChecagens.FieldByName('Hora').AsDateTime              := Now;


    tabChecagens.FieldByName('CodigoCliente').AsFloat        := vTabPedidos.FieldByName('CodigoCliente').AsFloat;
    tabChecagens.FieldByName('Contato').AsString             := vTabPedidos.FieldByName('Contato').AsString;
    tabChecagens.FieldByName('DataPrevisao').AsDateTime      := vTabPedidos.FieldByName('DataPrevisao').AsDateTime ;
    tabChecagens.FieldByName('CodigoPedido').AsFloat         := StrToFloat(fmMenu.pubTrans1);
    tabChecagens.FieldByName('CodigoFuncionario').AsString := edtCodigoResponsavel.Text;
    tabChecagens.Post;
    tabChecagens.ApplyUpdates;

    // Adiciona os produtos
    tabChecagens.Close;
    tabChecagens.SQL.Clear;
    tabChecagens.SQL.Add('SELECT * FROM ordem_producao_produtos WHERE 0');
    tabChecagens.Open;

    // varre produto por produto
    while not vTabPedidosProdutos.Eof do begin

       // Insere o produto na ordem de producao
       tabChecagens.Append;
       tabChecagens.FieldByName('ID').AsFloat                 := CodeGenerator('ordem_producao_produtos', 'ID');
       tabChecagens.FieldByName('OrdemProducao').AsFloat      := vOrdemProducao;
       tabChecagens.FieldByName('CodigoProduto').AsString     := vTabPedidosProdutos.FieldByName('CodigoProduto').AsString;
       tabChecagens.FieldByName('Descricao').AsString         := vTabPedidosProdutos.FieldByName('Descricao').AsString;

       // Procurando o ponto de reposição, código do Molde e o código da unidade
       vTabProdutos.Close;
       vTabProdutos.SQL.Clear;
       vTabProdutos.SQL.Add('SELECT PontoReposicao, NMolde, CodigoUnidade FROM produtos WHERE CodigoProduto = '+QuotedStr(vTabPedidosProdutos.FieldByName('CodigoProduto').AsString));
       vTabProdutos.Open;

       // Procurando o número de faltas
       vTabAtualizaEstoque.Close;
       vTabAtualizaEstoque.SQL.Clear;
       vTabAtualizaEstoque.SQL.Add('SELECT * FROM produtos_status_estoque WHERE CodigoProduto = '+QuotedStr(vTabPedidosProdutos.FieldByName('CodigoProduto').AsString));
       vTabAtualizaEstoque.Open;

       // Procurando o número de Cavidades
       // tomar cuidado pois existe numero cavidade que é texto
       vTabCavidades2.Close;
       vTabCavidades2.SQL.Clear;
       vTabCavidades2.SQL.Add('SELECT * FROM produtos_moldes WHERE  CodigoProduto = ' + QuotedStr(vTabPedidosProdutos.FieldByName('CodigoProduto').AsString) );
       vTabCavidades2.Open;

       if vTabCavidades2.RecordCount <= 0 then
       begin
          ShowMessage ('Molde não informado para o produto ' + QuotedStr(vTabPedidosProdutos.FieldByName('CodigoProduto').AsString));
          self.Close;
          Exit;
       end;

       vTabCavidades.Close;
       vTabCavidades.SQL.Clear;
       vTabCavidades.SQL.Add('SELECT NumeroCavidades FROM moldes WHERE  NMolde = ' + QuotedStr(vTabCavidades2.FieldByName('CodigoMolde').AsString) );
       vTabCavidades.Open;


       // Procurando a Quantidade da Unidade
       // CodigoUnidade
       vTabUnidades.Close;
       vTabUnidades.SQL.Clear;
       vTabUnidades.SQL.Add('SELECT Quantidade FROM unidades WHERE Codigo = '+QuotedStr(vTabProdutos.FieldByName('CodigoUnidade').AsString));
       vTabUnidades.Open;

       vPontoReposicao    := 0;
       vNumeroCavidades   := '0';
       vQuantidadeUnidade := 0;

       vPontoReposicao    := vTabProdutos.FieldByName('PontoReposicao').AsFloat;
       vNumeroCavidades   := vTabCavidades.FieldByName('NumeroCavidades').AsString;
       vQuantidadeUnidade := vTabUnidades.FieldByName('Quantidade').AsFloat;
       vPedidos           := vTabPedidosProdutos.FieldByName('Quantidade').AsFloat;
       vProducao          := vtabAtualizaEstoque.FieldByName('Interno').AsFloat;
       vEstoque           := vtabAtualizaEstoque.FieldByName('Estoque').AsFloat;
       
       if vEstoque < 0 then begin
         vEstoque := 0;
       end;

        tabChecagens.FieldByName('Quantidade').AsFloat     :=  Ceil((CalculaQuantidadeProduzir(vPontoReposicao,
                                                                                              vQuantidadeUnidade,
                                                                                                vNumeroCavidades,
                                                                                                        vPedidos,
                                                                                                       vProducao,
                                                                                                     vEstoque) / vQuantidadeUnidade)) ;

      vObsOrdemProducao := vObsOrdemProducao + '*****' + #13;
      vObsOrdemProducao := vObsOrdemProducao + 'CodigoProduto=' + vTabPedidosProdutos.FieldByName('CodigoProduto').AsString + #13;
      vObsOrdemProducao := vObsOrdemProducao + CalculaQuantidadeProduzirTexto(vPontoReposicao, vQuantidadeUnidade, vNumeroCavidades, vPedidos,  vProducao,  vEstoque) + #13;
      vObsOrdemProducao := vObsOrdemProducao + '*****' + #13;



       tabChecagens.Post;
       tabChecagens.ApplyUpdates;

       // Atualiza o estoque
       fmMenu.AtualizaEstoque(vTabPedidosProdutos.FieldByName('CodigoProduto').AsString);

       // próximo produto
       vTabPedidosProdutos.Next;

    end;

    // Inserindo registro na ordem de produção e gravando no banco de dados
    tabChecagens.Close;
    tabChecagens.SQL.Clear;
    tabChecagens.SQL.Add('SELECT * FROM ordem_producao WHERE OrdemProducao = ' + FloatToStr(vOrdemProducao) );
    tabChecagens.Open;
    tabChecagens.Edit;
    tabChecagens.FieldByName('Calculo').AsString        := vObsOrdemProducao;
    tabChecagens.Post;
    tabChecagens.ApplyUpdates;

    {
    // Baixando o pedido
    try
      vTabPedidos.Edit;
      vTabPedidos.FieldByName('DataProducao').AsDateTime:=Date;
      vTabPedidos.FieldByName('HoraProducao').AsDateTime:=Now;
      vTabPedidos.Post;

      vTabPedidosProdutos.First;
      while not vTabPedidosProdutos.Eof do begin

        if vTabPedidosProdutos.FieldByName('DataProducao').IsNull then begin
           vTabPedidosProdutos.Edit;
           vTabPedidosProdutos.FieldByName('DataProducao').AsDateTime:=Date;
           vTabPedidosProdutos.Post;
        end;

        Application.ProcessMessages;

        fmMenu.AtualizaEstoque(vTabPedidosProdutos.FieldByName('CodigoProduto').AsString);

        vTabPedidosProdutos.Next;
      end;
    finally
      vTabPedidosProdutos.Close;
      vTabPedidos.Close;
    end;
    }

    GerarImpressao;

    // Mensagens
    for vCount := 0 to  lstAvisarUsuariosSelecionados.Count-1 do
    begin
      vTabUsuario.Close;
      vTabUsuario.SQL.Clear;
      vTabUsuario.SQL.Add('select usuarios.usuario ');
      vTabUsuario.SQL.Add('  from usuarios ');
      vTabUsuario.SQL.Add(' where Usuario = ' + QuotedStr(Trim(lstAvisarUsuariosSelecionados.Items[vCount])));
      vTabUsuario.SQL.Add('       and usuarios.usuario <> ' + QuotedStr(fmMenu.pubUsuario) );

      vTabUsuario.Open;

      vTabUsuario.First;

      // varre produto por produto
      while not vTabUsuario.Eof do begin

        vTabMensagem.Append;

        vTabMensagem.FieldByName('CodigoMensagem').AsFloat       := CodeGenerator('mensagem', 'CodigoMensagem');
        vTabMensagem.FieldByName('UsuarioOrigem').AsString       := fmMenu.pubUsuario;
        vTabMensagem.FieldByName('Usuario').AsString             :=  vTabUsuario.FieldByName('usuario').AsString;

        vTabMensagem.FieldByName('Origem').AsString              := 'Finalizando Pedido de Venda';
        vTabMensagem.FieldByName('DataEnvio').AsFloat            := Date;
        vTabMensagem.FieldByName('HoraEnvio').AsFloat            := Time;

        vTabMensagem.FieldByName('ConfirmarLeitura').AsFloat     := 0;
        vTabMensagem.FieldByName('Descricao').AsSTring           := 'Itens Gerados:'           + #13 +
                                                                    '* Pedido..........: ' + fmMenu.pubTrans1           +  #13 +
                                                                    '* OP..............: ' + FloatToStr(vOrdemProducao) +  #13 +
                                                                    '* Data de Previsão: ' + DateToStr(vDataPrevisao);
        vTabMensagem.POST;

        vTabUsuario.Next;
      end;
    end;

    // Comita a transação
    tabChecagens.Close;
    tabChecagens.SQL.Clear;
    tabChecagens.SQL.Text:='commit';
    tabChecagens.ExecSQL;
    
    // Exibe mensagem de que a ordem de produção foi gerada com sucesso
    ShowMessage('Ordem de Produção '+ FloatToStr(vOrdemProducao) +' Gerada com Sucesso');
    
//    fmPedidosVenda.AtualizarDataProducao;

    Close;
  {
  except

    vMensagem      := 'Ordem de Produção não pode ser gerada: ' + #13 + #13;

    if vTabProdutos.FieldByName('NMolde').AsString = '' then
    begin
       vErroMolde     := '- Molde não informado'      +  #13 +  #13 ;
       vErroCavidades := '';
    end
    else
    begin
       vErroMolde         := '- Número Molde:'         +   QuotedStr(vErroMolde)            +  #13 +  #13 ;
       vErroCavidades     := '- Número de Cavidades:'  + QuotedStr(vTabCavidades.FieldByName('NumeroCavidades').AsString);
    end;

    ShowMessage( vMensagem +
               '- Erro no número de cavidades. '  +  #13 +  #13 +
               '- Produto:'              + vTabPedidosProdutos.FieldByName('CodigoProduto').AsString + ', ' + vTabPedidosProdutos.FieldByName('Descricao').AsString + #13 + #13 +
               vErroMolde + vErroCavidades);

    // Caso ocorrer algum problema, desfazemos a ação
    tabChecagens.Close;
    tabChecagens.SQL.Clear;
    tabChecagens.SQL.Text:='rollback';
    tabChecagens.ExecSQL;
  end;
  }

end;



function TfrmFinalizarPedido.CalculaQuantidadeProduzir(
  vPontoReposicao, vQuantidadeUnidade: Real;
  vNumeroCavidades: String; vPedidos, vProducao, vEstoque : Real): Real;
var
   vQuantidade, vSaldo, vFaltas : Real;
begin
  Result := 0;

  vFaltas := vPedidos - vEstoque;

  vQuantidade :=  (Ceil((vPontoReposicao*vQuantidadeUnidade+vFaltas*vQuantidadeUnidade)/StrToFloat(vNumeroCavidades))*StrToFloat(vNumeroCavidades));

  if vQuantidade <= 0 then begin
     Result := 0;
  end
  else
  begin
    Result := vQuantidade;
  end;

end;

function TfrmFinalizarPedido.CalculaQuantidadeProduzirTexto(
  vPontoReposicao, vQuantidadeUnidade: Real;
  vNumeroCavidades: String; vPedidos, vProducao, vEstoque: Real): String;
var
   vQuantidade, vSaldo, vFaltas, vCalc1, vCalc2, vCalc3, vCalc4, vCalc5, vCalc6 : Real;
   ls_PontoReposicao, ls_Faltas, ls_NumeroCavidades, ls_QuantidadeUnidade, ls_Producao, ls_Calc1, ls_Calc2, ls_Calc3, ls_Calc4, ls_Saldo : string;
   vTexto : string;
begin

  vFaltas            := vPedidos - vEstoque;

  vQuantidade :=  (Ceil((vPontoReposicao*vQuantidadeUnidade+vFaltas*vQuantidadeUnidade)/StrToFloat(vNumeroCavidades))*StrToFloat(vNumeroCavidades));

  ls_PontoReposicao    := FloatToStr(vPontoReposicao);
  ls_Faltas            := FloatToStr(vFaltas);
  ls_NumeroCavidades   := vNumeroCavidades;
  ls_QuantidadeUnidade := FloatToStr(vQuantidadeUnidade);
  ls_Producao          := FloatToStr(vProducao);

  vTexto := vTexto + 'Faltas=' + #13;
  vTexto := vTexto + 'Faltas= Pedidos - Estoque' + #13;
  vTexto := vTexto + 'Faltas= ' + FloatToStr(vPedidos) + '-' + FloatToStr(vEstoque)  + #13;
  vTexto := vTexto + 'Faltas= ' + FloatToStr(vFaltas)  + #13;
  vTexto := vTexto + 'Produzir=(Arredonda((PontoReposicao*QuantidadeUnidade+Faltas*QuantidadeUnidade)/NumeroCavidades)*NumeroCavidades)' + #13;
  vTexto := vTexto + 'Produzir=(Arredonda((' + ls_PontoReposicao + '*' + ls_QuantidadeUnidade + '+' + ls_Faltas + '*' + ls_QuantidadeUnidade + ')/' + ls_NumeroCavidades + ')*' + ls_NumeroCavidades + ')' + #13;

  vCalc1 := vPontoReposicao*vQuantidadeUnidade;
  vTexto := vTexto + 'Produzir=(Arredonda((' + FloatToStr(vCalc1) + '+' + ls_Faltas + '*' + ls_QuantidadeUnidade + ')/' + ls_NumeroCavidades + ')*' + ls_NumeroCavidades + ')' + #13;

  vCalc2 := vFaltas*vQuantidadeUnidade;
  vTexto := vTexto + 'Produzir=(Arredonda((' + FloatToStr(vCalc1) + '+' + FloatToStr(vCalc2) + ')/' + ls_NumeroCavidades + ')*' + ls_NumeroCavidades + ')' + #13;

  vCalc3 := (vCalc1+vCalc2);
  vTexto := vTexto + 'Produzir=(Arredonda(' + FloatToStr(vCalc3) +  '/' + ls_NumeroCavidades + ')*' + ls_NumeroCavidades + ')' + #13;

  vCalc4 := vCalc3 / StrToFloat(vNumeroCavidades);
  vTexto := vTexto + 'Produzir=(Arredonda(' + FloatToStr(vCalc4) + ')*' + ls_NumeroCavidades + ')' + #13;

  vCalc5 := Ceil(vCalc4);
  vTexto := vTexto + 'Produzir=(' + FloatToStr(vCalc5) +  '*' + ls_NumeroCavidades + ')' + #13;

  vCalc6 := vCalc5*StrToFloat(vNumeroCavidades);
  vTexto := vTexto + 'Produzir=(' + FloatToStr(vCalc6) + ')' + #13;

  if vQuantidade < 0 then
  begin
    vTexto      := vTexto + 'Produzir=0' + #13;
  end;

  Result := vTexto;
end;


procedure TfrmFinalizarPedido.btnEnviaImpressoraClick(Sender: TObject);
begin
  inherited;
  // lstImpressora.MoveSelection(lstImpressorasSelecionadas);
end;

procedure TfrmFinalizarPedido.btnDevolveImpressoraClick(Sender: TObject);
begin
  inherited;
  // lstImpressorasSelecionadas.MoveSelection(lstImpressora);
end;

procedure TfrmFinalizarPedido.btnEnviaTodasImpressoraClick(Sender: TObject);
begin
  inherited;
  //copia todos os itens da lista2 para a lista1 (>>)
  // lstImpressorasSelecionadas.Items.Text := lstImpressorasSelecionadas.Items.Text + lstImpressora.Items.Text;
  //limpa a lista1
  //  lstImpressora.Clear;
end;

procedure TfrmFinalizarPedido.btnDevolveTodasImpressoraClick(Sender: TObject);
begin
  inherited;
  //copia todos os itens da lista2 para a lista1 (<<)
  // lstImpressora.Items.Text := lstImpressora.Items.Text + lstImpressorasSelecionadas.Items.Text;
  //limpa a lista2
  // lstImpressorasSelecionadas.Clear;
end;

procedure TfrmFinalizarPedido.btnAvisarUsuarioClick(
  Sender: TObject);
begin
  inherited;
  lstAvisarUsuarios.MoveSelection(lstAvisarUsuariosSelecionados);
end;

procedure TfrmFinalizarPedido.btnEnviaTodasUsuarioClick(
  Sender: TObject);
begin
  inherited;
  //copia todos os itens da lista2 para a lista1 (>>)
  lstAvisarUsuariosSelecionados.Items.Text := lstAvisarUsuariosSelecionados.Items.Text + lstAvisarUsuarios.Items.Text;
  //limpa a lista1
  lstAvisarUsuarios.Clear;

end;

procedure TfrmFinalizarPedido.btnDevolveUsuarioClick(
  Sender: TObject);
begin
  inherited;
  lstAvisarUsuariosSelecionados.MoveSelection(lstAvisarUsuarios);

end;

procedure TfrmFinalizarPedido.btnDevolveTodasUsuarioClick(
  Sender: TObject);
begin
  inherited;
  //copia todos os itens da lista2 para a lista1 (<<)
  lstAvisarUsuarios.Items.Text := lstAvisarUsuarios.Items.Text + lstAvisarUsuariosSelecionados.Items.Text;
  //limpa a lista2
  lstAvisarUsuariosSelecionados.Clear;

end;

procedure TfrmFinalizarPedido.lstImpressoraDblClick(Sender: TObject);
begin
  inherited;
  btnEnviaImpressoraClick(Sender)
end;

procedure TfrmFinalizarPedido.lstImpressorasSelecionadasDblClick(
  Sender: TObject);
begin
  inherited;
  btnDevolveImpressoraClick(Sender)
end;

procedure TfrmFinalizarPedido.lstAvisarUsuariosDblClick(Sender: TObject);
begin
  inherited;
  btnAvisarUsuarioClick(Sender)
end;

procedure TfrmFinalizarPedido.lstAvisarUsuariosSelecionadosDblClick(
  Sender: TObject);
begin
  inherited;
  btnDevolveUsuarioClick(Sender)
end;

procedure TfrmFinalizarPedido.GerarImpressao;
var vCnt, vCnt2 : Integer;
var vRTAdmn: TrtPedidoAdministracao; vRTExpe : TrtPedidoExpedicao; vrtOP : TrtOrdensProducaoEmissao;
    vRTPediProdExpe  : TrtPedidoProducaoExpedicao;

begin
  vRTAdmn:=TrtPedidoAdministracao.Create(Self);
  vRTAdmn.FormShow(Self);
  vRTAdmn.Visible := False;
  vRTAdmn.rdgDetalhesPagto.ItemIndex := frmFinaPediRelaAdmn.rdgDetalhesPagto.ItemIndex;
  vRTAdmn.rdgFreteConta.ItemIndex := frmFinaPediRelaAdmn.rdgFreteConta.ItemIndex;
  vRTAdmn.rdgTransporte.ItemIndex := frmFinaPediRelaAdmn.rdgTransporte.ItemIndex;
  vRTAdmn.edtTransporteOutros.Text := frmFinaPediRelaAdmn.edtTransporteOutros.Text;
  vRTAdmn.rdgPeso.ItemIndex := frmFinaPediRelaAdmn.rdgPeso.ItemIndex;
  vRTAdmn.GerarImpressao(True);

  vRTExpe:=TrtPedidoExpedicao.Create(Self);
  vRTExpe.FormShow(Self);
  vRTExpe.Visible := False;
	vRTExpe.rdgTransporte.ItemIndex  := frmFinaPediRelaExpe.rdgTransporte.ItemIndex;
	vRTExpe.edtTransporteOutros.Text := frmFinaPediRelaExpe.edtTransporteOutros.Text;
  vRTExpe.GerarImpressao(True);

  vrtOP:=TrtOrdensProducaoEmissao.Create(Self);
  vrtOP.FormShow(Self);
  vrtOP.Visible := False;
	vrtOP.edtOP.Text := FloatToStr(vOrdemProducao);
  vrtOP.GerarImpressao(True);

  vRTPediProdExpe := TrtPedidoProducaoExpedicao.Create(Self);
  vRTPediProdExpe.FormShow(Self);
  vRTPediProdExpe.Visible := False;
  vRTPediProdExpe.edtRotuloAc.Text       := frmFinaPediRelaExpe.edtRotuloAc.Text;
  vRTPediProdExpe.rdgEndRotulo.ItemIndex := frmFinaPediRelaExpe.rdgEndRotulo.ItemIndex;
  vRTPediProdExpe.GerarImpressao(True);
end;


procedure TfrmFinalizarPedido.btnRelatorioExpedicaoClick(Sender: TObject);
begin
  inherited;
  frmFinaPediRelaExpe.Show;
end;

procedure TfrmFinalizarPedido.btnRelatorioAdministracaoClick(
  Sender: TObject);
begin
  inherited;
  frmFinaPediRelaAdmn.Show;
end;

procedure TfrmFinalizarPedido.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(frmFinaPediRelaExpe);
  FreeAndNil(frmFinaPediRelaAdmn);
end;


end.

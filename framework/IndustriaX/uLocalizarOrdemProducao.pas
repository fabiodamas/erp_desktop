unit uLocalizarOrdemProducao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, DBCtrls, Buttons, Grids, DBGrids,
  ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Menus,
  Mask, ToolEdit, RXDBCtrl, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxContainer, cxTextEdit, cxMaskEdit,
  cxSpinEdit, cxTimeEdit, DateUtils, uFuncoes;

type
  TfmLocalizarOrdemProducao = class(TfmFormBaseAvancado)
    btnOK: TBitBtn;
    btnCancelar: TBitBtn;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl1: TLabel;
    edtOP: TEdit;
    lbl11: TLabel;
    tvwOrdemProducao: TcxGridDBTableView;
    lvlOrdemProducao: TcxGridLevel;
    dbgOrdemProducao: TcxGrid;
    tabOrdemProducao: TZQuery;
    dtsOrdemProducao: TDataSource;
    tabClientes: TZQuery;
    dtsClientes: TDataSource;
    tabPaises: TZQuery;
    dtsPaises: TDataSource;
    tabCidades: TZQuery;
    dtsCidades: TDataSource;
    clmOrdemProducaoOrdemProducao: TcxGridDBColumn;
    clmOrdemProducaoCodigoPedido: TcxGridDBColumn;
    clmOrdemProducaoContato: TcxGridDBColumn;
    clmOrdemProducaoData: TcxGridDBColumn;
    clmOrdemProducaoHora: TcxGridDBColumn;
    clmOrdemProducaoDataPrevisao: TcxGridDBColumn;
    clmOrdemProducaoDataTermino: TcxGridDBColumn;
    clmOrdemProducaoObservacoes: TcxGridDBColumn;
    clmOrdemProducaoRazaosocial: TcxGridDBColumn;
    clmOrdemProducaonome: TcxGridDBColumn;
    edtCodigoPedido: TEdit;
    edtData: TDateEdit;
    edtHora: TcxTimeEdit;
    edtDataPrevisao: TDateEdit;
    edtDataTermino: TDateEdit;
    lbl12: TLabel;
    edtCliente: TEdit;
    edtResponsavel: TEdit;
    edtContato: TEdit;
    edtObservacao: TEdit;
    btnExibirTodos: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edtOPKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoPedidoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDataKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtHoraKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDataPrevisaoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDataTerminoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoClienteKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtClienteKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoResponsavelKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtResponsavelKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNomeFantasiaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtContatoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnExibirTodosClick(Sender: TObject);
  private
    procedure LoadData(pTudo: boolean = False);
  public
    { Public declarations }
  end;

var
  fmLocalizarOrdemProducao: TfmLocalizarOrdemProducao;

implementation

uses uFormBaseConfig, uConstantes, uMenu;

{$R *.dfm}

procedure TfmLocalizarOrdemProducao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabClientes.Close;
   tabPaises.Close;
   tabCidades.Close;
   tabOrdemProducao.Close;
   inherited;
   fmLocalizarOrdemProducao:=nil;
end;

procedure TfmLocalizarOrdemProducao.FormCreate(Sender: TObject);
begin
   inherited; 
   SetFormStyle(fsNormal);
end;

procedure TfmLocalizarOrdemProducao.btnCancelarClick(Sender: TObject);
begin
   fmMenu.pubTrans1:='';
   Close;
end;

procedure TfmLocalizarOrdemProducao.FormShow(Sender: TObject);
begin
   inherited;

   edtOP.SetFocus;

   fmMenu.pubTrans1:='';

   LoadData(True);
end;

procedure TfmLocalizarOrdemProducao.btnOKClick(Sender: TObject);
begin
   if (tabOrdemProducao.Active) and (tabOrdemProducao.RecordCount > 0) then begin
      fmMenu.pubTrans1:= tabOrdemProducao.FieldByName('OrdemProducao').AsString;
      Close;
    end
   else begin
      ShowMessage('Selecione um Registro para Confirmar');
   end;
end;

procedure TfmLocalizarOrdemProducao.LoadData(pTudo: boolean);
var vWhere : string;
begin
   vWhere:='';

   tabOrdemProducao.Close;
   tabOrdemProducao.SQL.Clear;
   tabOrdemProducao.SQL.Add(' select ');
   tabOrdemProducao.SQL.Add('       ordem_producao.*, clientes.Razaosocial, funcionarios.nome ');
   tabOrdemProducao.SQL.Add('   from ');
   tabOrdemProducao.SQL.Add('       ordem_producao ');
   tabOrdemProducao.SQL.Add('       LEFT JOIN clientes      ON clientes.CodigoCliente    = ordem_producao.CodigoCliente ');
   tabOrdemProducao.SQL.Add('       LEFT JOIN funcionarios  ON funcionarios.Codigo = ordem_producao.CodigoFuncionario ');

   if Trim(edtOP.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'ordem_producao.OrdemProducao like ''%' + edtOP.Text + '%''';
   end;

   if Trim(edtCodigoPedido.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'ordem_producao.CodigoPedido = ' + QuotedStr(edtCodigoPedido.Text);
   end;

   if (edtData.Text <> '  /  /    ') then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'ordem_producao.Data = ' + QuotedStr( ConverteData (edtData.Date));
   end;



   if (edtHora.Text <> '00:00:00') then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'ordem_producao.Hora = ' + QuotedStr( TimeToStr(edtHora.Time));
   end;

   if (edtDataPrevisao.Text <> '  /  /    ')  then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + 'ordem_producao.DataPrevisao = '+QuotedStr(ConverteData(edtDataPrevisao.Date));
   end;

   if (edtDataTermino.Text <> '  /  /    ') then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + ' ordem_producao.DataTermino = '+QuotedStr(ConverteData(edtDataTermino.Date));
   end;

   if Trim(edtCliente.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + ' clientes.Razaosocial like ' + QuotedStr('%' + edtCliente.Text + '%');
   end;

   if Trim(edtResponsavel.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + ' funcionarios.nome like '    + QuotedStr('%' + edtResponsavel.Text + '%');
   end;

   if Trim(edtObservacao.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + ' ordem_producao.Observacoes LIKE '+QuotedStr('%'+edtObservacao.Text+'%');
   end;

   if Trim(edtContato.Text) <> '' then begin
      if Trim(vWhere) <> '' then vWhere:=vWhere + ' AND ';
      vWhere:=vWhere + ' ordem_producao.Contato LIKE '+QuotedStr('%'+edtContato.Text+'%');
   end;

   tabOrdemProducao.SQL.Add(' WHERE ');

   // Se é para exibir todos
   if pTudo = True then begin
      tabOrdemProducao.SQL.Add(  ' ordem_producao.OrdemProducao > 0' );
   end
   else
   begin
     // Se nao foi preenchido nada, nao mostramos nada
     if vWhere = '' then
     begin
       vWhere := ' ordem_producao.OrdemProducao = -1'
     end;

    tabOrdemProducao.SQL.Add(vWhere);
   end;

   tabOrdemProducao.SQL.Add(' ORDER BY OrdemProducao DESC');

   tabOrdemProducao.Open;
end;

procedure TfmLocalizarOrdemProducao.edtCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
   inherited;
   if not (Key in['0'..'9',Chr(8)]) then Key:=#0;
end;

procedure TfmLocalizarOrdemProducao.edtOPKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   inherited;
   LoadData;
end;

procedure TfmLocalizarOrdemProducao.edtCodigoPedidoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  LoadData;
end;

procedure TfmLocalizarOrdemProducao.edtDataKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  LoadData;
end;

procedure TfmLocalizarOrdemProducao.edtHoraKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  LoadData;
end;

procedure TfmLocalizarOrdemProducao.edtDataPrevisaoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  LoadData;
end;

procedure TfmLocalizarOrdemProducao.edtDataTerminoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  LoadData;
end;

procedure TfmLocalizarOrdemProducao.edtCodigoClienteKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  LoadData;
end;

procedure TfmLocalizarOrdemProducao.edtClienteKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  LoadData;
end;

procedure TfmLocalizarOrdemProducao.edtCodigoResponsavelKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  LoadData;
end;

procedure TfmLocalizarOrdemProducao.edtResponsavelKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  LoadData;
end;

procedure TfmLocalizarOrdemProducao.edtNomeFantasiaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  LoadData;
end;

procedure TfmLocalizarOrdemProducao.edtContatoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  LoadData;
end;

procedure TfmLocalizarOrdemProducao.btnExibirTodosClick(Sender: TObject);
begin
  inherited;
  LoadData(True);
end;

end.

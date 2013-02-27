unit uContasBancarias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Menus, Buttons, ExtCtrls, StdCtrls, Mask, DBCtrls, Grids,
  DBGrids;

type
  TfmContasBancarias = class(TfmFormBaseCadastro)
    Label3: TLabel;
    edtCodigoAgencia: TDBEdit;
    edtCodigoBanco: TDBEdit;
    Label1: TLabel;
    dbgContasBancarias: TDBGrid;
    edtDigitoAgencia: TDBEdit;
    edtNumeroConta: TDBEdit;
    Label2: TLabel;
    Label4: TLabel;
    edtCodigo: TDBEdit;
    edtDigitoConta: TDBEdit;
    edtCarteira: TDBEdit;
    Label5: TLabel;
    edtConvenio: TDBEdit;
    Label6: TLabel;
    Label9: TLabel;
    edtDescricao: TDBEdit;
    Label7: TLabel;
    edtVariacaoCarteira: TDBEdit;
    edtNumeroContrato: TDBEdit;
    Label8: TLabel;
    edtDiasProtesto: TDBEdit;
    Label10: TLabel;
    edtRetornoBanco: TDBLookupComboBox;
    Label11: TLabel;
    tabBancos: TZQuery;
    dtsBancos: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Novo; override;
    procedure Editar; override;
    procedure Deletar; override;
    procedure Cancelar; override;
    function Checagens: Boolean; override;
  end;

var
  fmContasBancarias: TfmContasBancarias;

implementation

uses uMenu, uFuncoes, uFormBase, uLocalizarGenerico, uTipos;

{$R *.dfm}

procedure TfmContasBancarias.Editar;
begin
end;

procedure TfmContasBancarias.Cancelar;
begin
end;

function TfmContasBancarias.Checagens: Boolean;
begin
   Result:=False;
   if Trim(edtCodigoBanco.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Código do Banco');
      edtCodigoBanco.SetFocus;
      Result:=True;
      exit;
   end;
end;

procedure TfmContasBancarias.Deletar;
begin
end;

procedure TfmContasBancarias.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabBase.Close;
   tabBancos.Close;
   inherited;
end;

procedure TfmContasBancarias.FormShow(Sender: TObject);
begin
   inherited;
   tabBase.SQL.Add('SELECT * FROM contas_bancarias');
   tabBase.Open;

   tabBancos.SQL.Add('SELECT * FROM bancos ORDER BY Descricao');
   tabBancos.Open;
end;

procedure TfmContasBancarias.Novo;
begin
   tabBase.FieldByName('ID').AsFloat:=CodeGenerator('contas_bancarias', 'ID');
end;

procedure TfmContasBancarias.FormCreate(Sender: TObject);
begin
   inherited; 
   SetFormStyle(fsMDIChild); 
end;

procedure TfmContasBancarias.btnLocalizarClick(Sender: TObject);
var vParamLoc : TParametrosLocalizar; 
begin
   inherited;
   vParamLoc.Table:='contas_bancarias';
   vParamLoc.KeyField:='CodigoBanco';
   vParamLoc.Field1:='CodigoAgencia'; 
   vParamLoc.Filter:='';
   if not Assigned (fmLocalizarGenerico) then begin
      Application.CreateForm(TfmLocalizarGenerico, fmLocalizarGenerico);
      fmLocalizarGenerico.LoadParams(vParamLoc);  
      fmLocalizarGenerico.ShowModal;
   end;  
   if Trim(fmMenu.pubTrans1) <> '' then begin
      tabBase.Locate('Codigo', fmMenu.pubTrans1, []);
   end;      
end;

end.  

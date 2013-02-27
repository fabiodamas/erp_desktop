unit uSubGrupo;

interface  

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Menus, Buttons, ExtCtrls, StdCtrls, Mask, DBCtrls, Grids,
  DBGrids, ImgList, cxGraphics, cxControls, cxLookAndFeels,
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
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  cxDBLookupComboBox;

type
  TfmSubGrupo = class(TfmFormBaseCadastro)
    edtCodigo: TDBEdit;
    Label1: TLabel;
    edtDescricao: TDBEdit;
    Label2: TLabel;
    edtGrupo: TDBLookupComboBox;
    lbl1: TLabel;
    tabGrupos: TZQuery;
    dtsGrupos: TDataSource;
    dbgSubGrupos: TcxGrid;
    tvwSubGrupos: TcxGridDBTableView;
    clmCodigoSubGrupo: TcxGridDBColumn;
    clmGrupo: TcxGridDBColumn;
    lvlSubGrupos: TcxGridLevel;
    clmDescricao: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
  public
    procedure Novo; override;
    procedure Editar; override;
    procedure Deletar; override;
    procedure Cancelar; override;
    function Checagens: Boolean; override;
  end;

var
  fmSubGrupo: TfmSubGrupo;
  UltimoGrupo : Real;

implementation

uses uFormBaseConfig, uMenu, uFuncoes, uTipos, uLocalizarGenerico;

{$R *.dfm}

procedure TfmSubGrupo.Cancelar;
begin
end;

procedure TfmSubGrupo.Editar;
begin
end;

function TfmSubGrupo.Checagens: Boolean;
begin
   Result:=False;
   if Trim(edtDescricao.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Descrição');
      edtDescricao.SetFocus;
      Result:=True;
      exit;
   end;
end;

procedure TfmSubGrupo.Deletar;
begin
end;

procedure TfmSubGrupo.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TfmSubGrupo.Novo;
begin
   tabBase.FieldByName('CodigoSubGrupo').AsFloat:=CodeGenerator('subgrupo', 'CodigoSubGrupo');
end;

procedure TfmSubGrupo.FormShow(Sender: TObject);
begin
   tabGrupos.SQL.Add('SELECT * FROM genericos WHERE Tipo = ' + QuotedStr('1') + ' ORDER BY Descricao');
   tabGrupos.Open;

   tabBase.SQL.Add('SELECT * FROM subgrupo ORDER BY Descricao');
   tabBase.Open;

   UltimoGrupo := 0;
   inherited;
end;

procedure TfmSubGrupo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabBase.Close;
   inherited;
end;

procedure TfmSubGrupo.btnLocalizarClick(Sender: TObject);
var vParamLoc: TParametrosLocalizar;
begin
   inherited;
   vParamLoc.Table:='subgrupo';
   vParamLoc.KeyField:='CodigoSubGrupo';
   vParamLoc.Field1:='Descricao';
   vParamLoc.Filter:='';
   if not Assigned (fmLocalizarGenerico) then begin
      Application.CreateForm(TfmLocalizarGenerico, fmLocalizarGenerico);
      fmLocalizarGenerico.LoadParams(vParamLoc);
      fmLocalizarGenerico.ShowModal;
   end;
   if Trim(fmMenu.pubTrans1) <> '' then begin
      tabBase.Locate('CodigoSubGrupo', fmMenu.pubTrans1, []);
   end;
end;

procedure TfmSubGrupo.btnNovoClick(Sender: TObject);
begin
   inherited;

   if UltimoGrupo <> 0 then
   begin
     tabBase.FieldByName('CodigoGrupo').AsFloat := UltimoGrupo;
     edtDescricao.SetFocus;
   end
   else
   begin
     edtGrupo.SetFocus;
   end;
end;

procedure TfmSubGrupo.btnGravarClick(Sender: TObject);
begin
  inherited;
  UltimoGrupo := tabBase.FieldByName('CodigoGrupo').AsFloat;
end;

end.

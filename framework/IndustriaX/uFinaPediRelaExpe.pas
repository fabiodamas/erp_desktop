unit uFinaPediRelaExpe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ExtCtrls, Buttons, uFuncoes, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TfrmFinaPediRelaExpe = class(TForm)
    grp2: TGroupBox;
    lstImpressora: TListBox;
    btnEnviaImpressora: TButton;
    btnEnviaTodasImpressora: TButton;
    btnDevolveImpressora: TButton;
    btnDevolveTodasImpressora: TButton;
    lstImpressorasSelecionadas: TListBox;
    grp1: TGroupBox;
    btnFechar: TBitBtn;
    lbl2: TLabel;
    rdgTransporte: TRadioGroup;
    edtTransporteOutros: TEdit;
    lbl1: TLabel;
    edtRotuloAc: TEdit;
    rdgEndRotulo: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure btnEnviaImpressoraClick(Sender: TObject);
    procedure btnDevolveImpressoraClick(Sender: TObject);
    procedure btnEnviaTodasImpressoraClick(Sender: TObject);
    procedure btnDevolveTodasImpressoraClick(Sender: TObject);
    procedure lstImpressoraDblClick(Sender: TObject);
    procedure lstImpressorasSelecionadasDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFinaPediRelaExpe: TfrmFinaPediRelaExpe;

implementation

uses uMenu;

{$R *.dfm}

procedure TfrmFinaPediRelaExpe.FormShow(Sender: TObject);
var vStringList: TStringList;
var vCount, vCount2 : integer;
var vTabUsuarios, vTabChecagens, vTabConfigPropri: TZQuery;
begin
  lstImpressora.Items.Clear;
  lstImpressorasSelecionadas.Items.Clear;

  vTabConfigPropri               := TZQuery.Create(nil);
  vTabConfigPropri.Connection    := fmMenu.zcnConexao;

  vTabChecagens               := TZQuery.Create(nil);
  vTabChecagens.Connection    := fmMenu.zcnConexao;

  vStringList:=TStringList.Create;
  
  // Configuração da impressão
  try
    vStringList.Clear;
    vTabChecagens.Close;
    vTabChecagens.SQL.Clear;
    vTabChecagens.SQL.Add('SELECT OpcoesAdm FROM pedidos WHERE NPedido = '+fmMenu.pubTrans1);
    vTabChecagens.Open;

    if Trim(vTabChecagens.FieldByName('OpcoesAdm').AsString) <> '' then begin
      ExtractStrings([';'], [' '], Pchar(vTabChecagens.FieldByName('OpcoesAdm').AsString), vStringList);
    end;

    for vCount:=0 to (vStringList.Count-1) do begin
      if vCount = 0 then begin
         if Trim(vStringList.Strings[vCount]) <> '' then begin
            rdgTransporte.ItemIndex:=StrToInt(vStringList.Strings[vCount]);
         end;
      end;
      if vCount = 1 then begin
         if Trim(vStringList.Strings[vCount]) <> '' then begin
            edtTransporteOutros.Text:=vStringList.Strings[vCount];
         end;
      end;
    end;

   finally
    vStringList.Free;
    vTabChecagens.Close;
   end;

  CarregarImpressoras2(lstImpressora);
  lstImpressora.Items.Add('LPT1');

  vStringList:=TStringList.Create;
  vStringList := Explode(LoadConfigListBox(GetPathProfileUser, 'ConfigImpressoraExpedicao'), ',');
  for vCount:=0 to vStringList.Count-1 do
  begin
     for vCount2 := 0 to  lstImpressora.Count-1 do
     begin
          if Trim(vStringList[vCount]) = lstImpressora.Items[vCount2] then
          begin
             lstImpressorasSelecionadas.Items.Add(Trim(vStringList[vCount]));
             lstImpressora.Items.Delete(vCount2);
             Break;
          end;
     end;
  end;

end;

procedure TfrmFinaPediRelaExpe.btnEnviaImpressoraClick(Sender: TObject);
begin
  lstImpressora.MoveSelection(lstImpressorasSelecionadas);
end;

procedure TfrmFinaPediRelaExpe.btnDevolveImpressoraClick(Sender: TObject);
begin
  lstImpressorasSelecionadas.MoveSelection(lstImpressora);
end;

procedure TfrmFinaPediRelaExpe.btnEnviaTodasImpressoraClick(
  Sender: TObject);
begin
  //copia todos os itens da lista2 para a lista1 (>>)
  lstImpressorasSelecionadas.Items.Text := lstImpressorasSelecionadas.Items.Text + lstImpressora.Items.Text;
  //limpa a lista1
  lstImpressora.Clear;
end;

procedure TfrmFinaPediRelaExpe.btnDevolveTodasImpressoraClick(
  Sender: TObject);
begin
  //copia todos os itens da lista2 para a lista1 (<<)
  lstImpressora.Items.Text := lstImpressora.Items.Text + lstImpressorasSelecionadas.Items.Text;
  //limpa a lista2
  lstImpressorasSelecionadas.Clear;
end;

procedure TfrmFinaPediRelaExpe.lstImpressoraDblClick(Sender: TObject);
begin
  btnEnviaImpressoraClick (Sender);
end;

procedure TfrmFinaPediRelaExpe.lstImpressorasSelecionadasDblClick(
  Sender: TObject);
begin
  btnDevolveImpressoraClick(Sender);
end;

procedure TfrmFinaPediRelaExpe.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SaveConfigListBox(lstImpressorasSelecionadas,    GetPathProfileUser, 'ConfigImpressoraExpedicao'        );
end;

procedure TfrmFinaPediRelaExpe.btnFecharClick(Sender: TObject);
begin
  Close;
end;

end.

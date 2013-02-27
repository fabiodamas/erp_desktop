unit uFinaPediRelaAdmn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, uFuncoes;

type
  TfrmFinaPediRelaAdmn = class(TForm)
    grp1: TGroupBox;
    btnFechar: TBitBtn;
    lbl2: TLabel;
    rdgDetalhesPagto: TRadioGroup;
    rdgFreteConta: TRadioGroup;
    rdgTransporte: TRadioGroup;
    rdgPeso: TRadioGroup;
    edtTransporteOutros: TEdit;
    grp2: TGroupBox;
    lstImpressora: TListBox;
    btnEnviaImpressora: TButton;
    btnEnviaTodasImpressora: TButton;
    btnDevolveImpressora: TButton;
    btnDevolveTodasImpressora: TButton;
    lstImpressorasSelecionadas: TListBox;
    procedure FormShow(Sender: TObject);
    procedure btnEnviaImpressoraClick(Sender: TObject);
    procedure btnEnviaTodasImpressoraClick(Sender: TObject);
    procedure btnDevolveImpressoraClick(Sender: TObject);
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
  frmFinaPediRelaAdmn: TfrmFinaPediRelaAdmn;

implementation

{$R *.dfm}

procedure TfrmFinaPediRelaAdmn.FormShow(Sender: TObject);
var vStringList: TStringList;
var vCount, vCount2 : integer;
begin
  lstImpressora.Items.Clear;
  lstImpressorasSelecionadas.Items.Clear;
  
  CarregarImpressoras2(lstImpressora);
  lstImpressora.Items.Add('LPT1');

  vStringList:=TStringList.Create;
  vStringList := Explode(LoadConfigListBox(GetPathProfileUser, 'ConfigImpressoraAdmn'), ',');
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

procedure TfrmFinaPediRelaAdmn.btnEnviaImpressoraClick(Sender: TObject);
begin
  lstImpressora.MoveSelection(lstImpressorasSelecionadas);
end;

procedure TfrmFinaPediRelaAdmn.btnEnviaTodasImpressoraClick(
  Sender: TObject);
begin
  //copia todos os itens da lista2 para a lista1 (>>)
  lstImpressorasSelecionadas.Items.Text := lstImpressorasSelecionadas.Items.Text + lstImpressora.Items.Text;
  //limpa a lista1
  lstImpressora.Clear;
end;

procedure TfrmFinaPediRelaAdmn.btnDevolveImpressoraClick(Sender: TObject);
begin
  lstImpressorasSelecionadas.MoveSelection(lstImpressora);
end;

procedure TfrmFinaPediRelaAdmn.btnDevolveTodasImpressoraClick(
  Sender: TObject);
begin
  //copia todos os itens da lista2 para a lista1 (<<)
  lstImpressora.Items.Text := lstImpressora.Items.Text + lstImpressorasSelecionadas.Items.Text;
  //limpa a lista2
  lstImpressorasSelecionadas.Clear;
end;

procedure TfrmFinaPediRelaAdmn.lstImpressoraDblClick(Sender: TObject);
begin
  btnEnviaImpressoraClick (Sender);
end;

procedure TfrmFinaPediRelaAdmn.lstImpressorasSelecionadasDblClick(
  Sender: TObject);
begin
  btnDevolveImpressoraClick(Sender);
end;

procedure TfrmFinaPediRelaAdmn.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SaveConfigListBox(lstImpressorasSelecionadas,    GetPathProfileUser, 'ConfigImpressoraAdmn' );
end;

procedure TfrmFinaPediRelaAdmn.btnFecharClick(Sender: TObject);
begin
  Close;
end;

end.

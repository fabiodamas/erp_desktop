unit uReceberPedidoCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, DBCtrls, Buttons, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TfmReceberPedidoCompra = class(TfmFormBaseAvancado)
    Label1: TLabel;
    edtNumeroNota: TEdit;
    edtLocalizacao: TDBLookupComboBox;
    Label7: TLabel;
    BitBtn1: TBitBtn;
    tabLocalizar: TZQuery;
    dtsLocalizar: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmReceberPedidoCompra: TfmReceberPedidoCompra;

implementation

uses uFormBase, uMenu;

{$R *.dfm}

procedure TfmReceberPedidoCompra.FormShow(Sender: TObject);
begin
   inherited;

   fmMenu.pubTrans1:='';
   fmMenu.pubTrans2:='';

   tabLocalizar.SQL.Add('SELECT * FROM genericos WHERE Tipo = '+QuotedStr('7'));
   tabLocalizar.Open;
end;

procedure TfmReceberPedidoCompra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabLocalizar.Close;
   inherited;
   fmReceberPedidoCompra:=nil;
end;

procedure TfmReceberPedidoCompra.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsNormal);
end;

procedure TfmReceberPedidoCompra.BitBtn1Click(Sender: TObject);
begin
   inherited;
   if Trim(edtNumeroNota.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento do Numero da Nota');
      edtNumeroNota.SetFocus;
      exit;
   end;
   if Trim(edtLocalizacao.Text) = '' then begin
      ShowMessage('Obrigatório Preenchimento da Localização');
      edtLocalizacao.SetFocus;
      exit;
   end;
   fmMenu.pubTrans1:=edtNumeroNota.Text;
   fmMenu.pubTrans2:=FloatToStr(edtLocalizacao.KeyValue);
   Close;
end;

end.

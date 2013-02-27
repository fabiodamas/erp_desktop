unit uRastreamentoPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, Menus, OleCtrls, SHDocVw, StdCtrls, Buttons,
  ActiveX, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TfmRastreamentoPedido = class(TfmFormBaseAvancado)
    edtConhecimento: TEdit;
    Label1: TLabel;
    btnRastrear: TBitBtn;
    WebBrowser: TWebBrowser;
    tabPedidos: TZQuery;
    btnFechar: TBitBtn;
    procedure btnRastrearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
  private
    FPedido: string;
  public
    { Public declarations }
  end;

var
  fmRastreamentoPedido: TfmRastreamentoPedido;

implementation

uses uFormBase, uMenu;

{$R *.dfm}

procedure TfmRastreamentoPedido.btnRastrearClick(Sender: TObject);
const vUrlIni = 'http://websro.correios.com.br/sro_bin/txect01$.QueryList?P_TIPO=001&P_COD_UNI=';
      vUrlFim = '&P_LINGUA=001';
      vUrlJad = 'http://www.jadlog.com.br/tracking.jsp';
begin
  inherited;

  if Trim(edtConhecimento.Text) <> '' then
  begin
    if tabPedidos.RecordCount = 1 then
    begin
      if tabPedidos.FieldByName('NPedido').AsString <> '' then
      begin
        tabPedidos.Edit;
        tabPedidos.FieldByName('Conhecimento').AsString:=edtConhecimento.Text;
        tabPedidos.Post;
        tabPedidos.ApplyUpdates;

        if Copy(edtConhecimento.Text, Length(edtConhecimento.Text)-1, 2) = 'BR' then
        begin
          WebBrowser.Navigate(vUrlIni + edtConhecimento.Text + vUrlFim);
         end
        else
        begin
          WebBrowser.Navigate(vUrlJad);
        end;
      end;
    end;
   end
  else
  begin
    ShowMessage('Informe o numero do conhecimento para rastrear o pedido');
    edtConhecimento.SetFocus;
    exit;
  end;
end;

procedure TfmRastreamentoPedido.FormCreate(Sender: TObject);
begin
  inherited;
  SetFormStyle(fsMDIChild);
end;

procedure TfmRastreamentoPedido.FormShow(Sender: TObject);
begin
  inherited;
  FPedido:=fmMenu.pubTrans1;

  tabPedidos.SQL.Add('SELECT * FROM pedidos WHERE NPedido = '+QuotedStr(FPedido));
  tabPedidos.Open;

  if tabPedidos.RecordCount = 1 then
  begin
    edtConhecimento.Text:=Trim(tabPedidos.FieldByName('Conhecimento').AsString);
  end;
end;

procedure TfmRastreamentoPedido.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tabPedidos.Close;
  inherited;
end;

procedure TfmRastreamentoPedido.btnFecharClick(Sender: TObject);
begin
  inherited; 
  Close;
end;

end.

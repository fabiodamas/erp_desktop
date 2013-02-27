unit uTriplicata;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, Menus, StdCtrls, Mask, ToolEdit, Buttons, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TfmTriplicata = class(TfmFormBaseAvancado)
    edtNovoVencto: TDateEdit;
    Label20: TLabel;
    edtInstrucoes: TMemo;
    Label1: TLabel;
    btnGravar: TBitBtn;
    btnFechar: TBitBtn;
    tabTitulos: TZQuery;
    tabChecagens: TZQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
  private
    FTitulo: string;
    function GerarNossoNumero: string;
  public
    { Public declarations }
  end;

var
  fmTriplicata: TfmTriplicata;

implementation

uses uFormBase, uMenu, uFuncoes;

{$R *.dfm}

procedure TfmTriplicata.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TfmTriplicata.FormShow(Sender: TObject);
begin
   inherited;

   FTitulo:=fmMenu.pubTrans1;

   tabTitulos.SQL.Add('SELECT * FROM titulos_receber WHERE Titulo = '+QuotedStr(FTitulo));
   tabTitulos.Open;

   if tabTitulos.RecordCount = 1 then begin
      edtInstrucoes.Lines.Add('TRIPLICATA REF NF '+tabTitulos.FieldByName('NotaFiscal').AsString+
      ' PARCELA '+tabTitulos.FieldByName('Parcela').AsString+' COM NOVO PRAZO PARA PAGAMENTO.');
    end
   else begin
      btnGravar.Enabled:=False;
   end;
end;

procedure TfmTriplicata.btnGravarClick(Sender: TObject);
var vTemp : string;
begin
   inherited;
   if Trim(edtNovoVencto.Text) = '/  /' then begin
      ShowMessage('Obrigatório Preenchimento do Novo Vencimento');
      edtNovoVencto.SetFocus;
      exit;
   end;
   if edtNovoVencto.Date < Date then begin
      ShowMessage('Preenchimento Incorreto');
      edtNovoVencto.SetFocus;
      exit;
   end;
   if tabTitulos.RecordCount = 1 then begin

      vTemp:='Data 1ª Emissão: '+FormatDateTime('dd/MM/yyyy', tabTitulos.FieldByName('DataEmissao').AsDateTime)+Chr(13)+
      'Vencto 1ª Emissão: '+FormatDateTime('dd/MM/yyyy', tabTitulos.FieldByName('DataVencimento').AsDateTime)+Chr(13)+
      'Nosso Numero 1ª Emissão: '+tabTitulos.FieldByName('NossoNumero').AsString;

      tabTitulos.Edit;
      tabTitulos.FieldByName('Observacao').AsString:=tabTitulos.FieldByName('Observacao').AsString+Chr(13)+
      edtInstrucoes.Text+Chr(13)+vTemp;
      tabTitulos.FieldByName('DataEmissao').AsDateTime:=Date;
      tabTitulos.FieldByName('DataVencimento').AsDateTime:=edtNovoVencto.Date;
      tabTitulos.FieldByName('NossoNumero').AsString:=GerarNossoNumero;
      tabTitulos.FieldByName('GeradoRemessa').AsString:='Não';
      tabTitulos.FieldByName('ImpressoBoleto').AsString:='Não';
      tabTitulos.FieldByName('Instrucoes').AsString:=edtInstrucoes.Text;
      tabTitulos.Post; 
      tabTitulos.ApplyUpdates;
   end;
   Close;
end;

function TfmTriplicata.GerarNossoNumero: string; 
var vNNFloat : real;
begin
   try
      tabChecagens.Close;
      tabChecagens.SQL.Clear;
      tabChecagens.SQL.Add('SELECT MAX(NossoNumero) AS vMaxNN FROM titulos_receber');
      tabChecagens.Open;
      if (not tabChecagens.FieldByName('vMaxNN').IsNull) and (Trim(tabChecagens.FieldByName('vMaxNN').AsString) <> '') then begin
         vNNFloat:=StrToFloat(tabChecagens.FieldByName('vMaxNN').AsString);
         vNNFloat:=vNNFloat + 1;
         Result:=StrZero(vNNFloat, 10);
       end
      else begin
         vNNFloat:=1;
         Result:=StrZero(vNNFloat, 10);
      end;
   finally
      tabChecagens.Close;
   end;
end;

procedure TfmTriplicata.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabTitulos.Close;
   tabChecagens.Close;
   inherited;
end;

procedure TfmTriplicata.btnFecharClick(Sender: TObject);
begin
   inherited;
   Close;
end;

end.

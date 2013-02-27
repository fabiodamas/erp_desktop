unit uGerarParticipacaoVendedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, StdCtrls, Mask, ToolEdit, Buttons, ComCtrls,
  CurrEdit, DBCtrls, ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Gauges, DBClient, QRCtrls, QuickRpt, Menus;

type
  TfmGerarParticipacaoVendedores = class(TfmFormBaseAvancado)
    Label5: TLabel;
    edtDataInicial: TDateEdit;
    tabPedidos: TZQuery;
    btnConfirmar: TBitBtn;
    btnFechar: TBitBtn;
    Label1: TLabel;
    edtDataFinal: TDateEdit;
    gagProgresso: TGauge;
    tabFuncionarios: TZQuery;
    tabFuncDeptos: TZQuery;
    tabAusencias: TZQuery;
    tabParticipacao: TZQuery;
    btnConferencia: TBitBtn;
    tabAuxConferencia: TClientDataSet;
    tabAuxConferenciaNPedido: TFloatField;
    tabAuxConferenciaEntrega: TDateField;
    tabAuxConferenciaParticipantes: TStringField;
    qrpParticipacao: TQuickRep;
    QRSubDetail1: TQRSubDetail;
    QRDBText3: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText1: TQRDBText;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    qrlTitulo: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel1: TQRLabel;
    QRBand3: TQRBand;
    qrlSignature: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape2: TQRShape;
    QRSysData2: TQRSysData;
    dtsAuxConferencia: TDataSource;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    tabAuxConferenciaObservacao: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnConferenciaClick(Sender: TObject);
    procedure dtsAuxConferenciaDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmGerarParticipacaoVendedores: TfmGerarParticipacaoVendedores;

implementation

uses uFormBase, uMenu, uConstantes;

{$R *.dfm}

procedure TfmGerarParticipacaoVendedores.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TfmGerarParticipacaoVendedores.btnFecharClick(Sender: TObject);
begin
   inherited;
   Close;
end;

procedure TfmGerarParticipacaoVendedores.FormShow(Sender: TObject); 
begin
   inherited;
   tabAuxConferencia.CreateDataSet;
   tabAuxConferencia.EmptyDataSet;
   tabAuxConferencia.IndexFieldNames:='NPedido';
end;

procedure TfmGerarParticipacaoVendedores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabPedidos.Close;
   tabFuncionarios.Close;
   tabFuncDeptos.Close;
   tabAusencias.CLose;
   tabParticipacao.CLose;
   tabAuxConferencia.Close;
   inherited;
end;

procedure TfmGerarParticipacaoVendedores.btnConfirmarClick(
  Sender: TObject);
var vSair: boolean;
    vObservacao : string;  
begin
   inherited;
   if Trim(edtDataInicial.Text) = '/  /' then begin
      ShowMessage('Obrigatório Preenchimento da Data Inicial');
      edtDataInicial.SetFocus;
      exit;
   end;
   if Trim(edtDataFinal.Text) = '/  /' then begin
      ShowMessage('Obrigatório Preenchimento da Data Final');
      edtDataFinal.SetFocus;
      exit; 
   end;

   qrlTitulo.Caption:='Participação de Vendedores - Período: '+edtDataInicial.Text+' a '+edtDataFinal.Text; 

   tabAuxConferencia.EmptyDataSet;

   tabPedidos.Close;
   tabPedidos.SQL.Clear;
   tabPedidos.SQL.Add('SELECT * FROM pedidos WHERE ');
   tabPedidos.SQL.Add('DataEntrega IS NOT NULL AND ');
   tabPedidos.SQL.Add('DataEntrega >= '     + QuotedStr(FormatDateTime(sis_date_format, edtDataInicial.Date))+' ');
   tabPedidos.SQL.Add('AND DataEntrega <= ' + QuotedStr(FormatDateTime(sis_date_format, edtDataFinal.Date)));
   tabPedidos.SQL.Add('AND NPedido > 0');    
   tabPedidos.Open;

   gagProgresso.MaxValue:=tabPedidos.RecordCount;

   tabPedidos.First;
   while not tabPedidos.Eof do begin

      gagProgresso.Progress:=tabPedidos.RecNo;
      Application.ProcessMessages; 

      tabFuncionarios.Close;
      tabFuncionarios.SQL.Clear;
      tabFuncionarios.SQL.Add('SELECT Codigo,Nome,CodigoDepto FROM funcionarios WHERE Codigo = '+tabPedidos.FieldByName('CodigoFuncionario').AsString);
      tabFuncionarios.Open;

      if tabFuncionarios.RecordCount > 0 then begin    
         if tabFuncionarios.FieldByName('CodigoDepto').AsFloat > 0 then begin
         
            tabFuncDeptos.Close;  
            tabFuncDeptos.SQL.Clear;
            tabFuncDeptos.SQL.Add('SELECT Codigo FROM funcionarios WHERE CodigoDepto = '+tabFuncionarios.FieldByName('CodigoDepto').AsString+' AND DataSaida IS NULL');
            tabFuncDeptos.Open; 

            vObservacao:='';
            tabFuncDeptos.First;
            while not tabFuncDeptos.Eof do begin 

               tabAusencias.Close;
               tabAusencias.SQL.Clear;
               tabAusencias.SQL.Add('SELECT * FROM funcionarios_ausencias WHERE CodigoFuncionario = '+tabFuncDeptos.FieldByName('Codigo').AsString);
               tabAusencias.Open;

               if tabAusencias.RecordCount > 0 then begin
                  vSair:=False;
                  tabAusencias.First;
                  while not tabAusencias.Eof do begin
                     // Esta Ausente!
                     if (tabPedidos.FieldByName('DataEntrega').AsDateTime >= tabAusencias.FieldByName('DataInicial').AsDateTime) and
                        (tabPedidos.FieldByName('DataEntrega').AsDateTime <= tabAusencias.FieldByName('DataFinal').AsDateTime) then begin
                        vObservacao:='Ausência: '+tabAusencias.FieldByName('CodigoFuncionario').AsString;
                        vSair:=True;
                     end;
                     tabAusencias.Next;
                  end;
                  if vSair = True then begin
                     tabFuncDeptos.Next;
                     Continue;
                  end;
               end;

               tabParticipacao.Close;
               tabParticipacao.SQL.Clear;
               tabParticipacao.SQL.Add('DELETE FROM pedidos_part_func WHERE ');
               tabParticipacao.SQL.Add('NPedido = '+tabPedidos.FieldByName('NPedido').AsString+' ');
               tabParticipacao.SQL.Add('AND CodigoFuncionario = '+tabFuncDeptos.FieldByName('Codigo').AsString+' '); 
               tabParticipacao.ExecSQL; 

               tabParticipacao.Close;
               tabParticipacao.SQL.Clear;
               tabParticipacao.SQL.Add('SELECT * FROM pedidos_part_func WHERE 0');
               tabParticipacao.Open;

               tabParticipacao.Append;
               tabParticipacao.FieldByName('NPedido').AsFloat:=tabPedidos.FieldByName('NPedido').AsFloat;
               tabParticipacao.FieldByName('CodigoFuncionario').AsFloat:=tabFuncDeptos.FieldByName('Codigo').AsFloat;
               tabParticipacao.FieldByName('Observacao').AsString:=vObservacao;
               tabParticipacao.Post;
               tabParticipacao.ApplyUpdates;

               if tabAuxConferencia.FindKey([tabPedidos.FieldByName('NPedido').AsFloat]) then begin
                  tabAuxConferencia.Edit;
                  tabAuxConferenciaParticipantes.Value:=tabAuxConferenciaParticipantes.Value+', '+tabFuncDeptos.FieldByName('Codigo').AsString;
                end
               else begin
                  tabAuxConferencia.Append;
                  tabAuxConferenciaNPedido.Value:=tabPedidos.FieldByName('NPedido').AsFloat;
                  tabAuxConferenciaEntrega.Value:=tabPedidos.FieldByName('DataEntrega').AsDateTime;
                  tabAuxConferenciaParticipantes.Value:=tabFuncDeptos.FieldByName('Codigo').AsString;
               end;
               tabAuxConferenciaObservacao.Value:=vObservacao;  
               tabAuxConferencia.Post;

               tabFuncDeptos.Next;
            end;
         end;
      end;     
      tabPedidos.Next; 
   end; 

   ShowMessage('Concluído com Sucesso.'); 
   gagProgresso.Progress:=0;    
end;

procedure TfmGerarParticipacaoVendedores.btnConferenciaClick(Sender: TObject);
begin
   inherited;
   qrpParticipacao.Preview;
end;

procedure TfmGerarParticipacaoVendedores.dtsAuxConferenciaDataChange(
  Sender: TObject; Field: TField);
begin
   inherited;
   if tabAuxConferencia.RecordCount > 0 then begin
      btnConferencia.Enabled:=True;
    end
   else begin
      btnConferencia.Enabled:=False;
   end;
end;

end.

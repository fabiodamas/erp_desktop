unit uOrcamentosEnviadosEmail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseAvancado, Grids, DBGrids, StdCtrls, Buttons, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TfmOrcamentosEnviadosEmail = class(TfmFormBaseAvancado)
    dbgOrcamentosEnviados: TDBGrid;
    btnFechar: TBitBtn;
    tabOrcamentosEnviados: TZQuery;
    dtsOrcamentosEnviados: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmOrcamentosEnviadosEmail: TfmOrcamentosEnviadosEmail;

implementation

uses uMenu;

{$R *.dfm}

procedure TfmOrcamentosEnviadosEmail.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

procedure TfmOrcamentosEnviadosEmail.btnFecharClick(Sender: TObject);
begin
   inherited;
   Close;
end;

procedure TfmOrcamentosEnviadosEmail.FormShow(Sender: TObject);
begin
   inherited;
   tabOrcamentosEnviados.SQL.Add('SELECT Usuario,Data,Hora,Orcamento,Assunto,ParaNome');
   tabOrcamentosEnviados.SQL.Add('FROM orcamentos_enviados_email');
   tabOrcamentosEnviados.SQL.Add('WHERE orcamentos_enviados_email.Usuario = '+QuotedStr(fmMenu.pubUsuario));
   tabOrcamentosEnviados.Open; 
end;

procedure TfmOrcamentosEnviadosEmail.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tabOrcamentosEnviados.Close;
   inherited;
end;

end.

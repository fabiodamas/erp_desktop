unit uTipos;

interface

uses Classes, StdCtrls, ExtCtrls;

type

  TParametrosLocalizar = record
    Table: string;
    KeyField: string;
    Field1: string;
    Filter: string;
  end;

  THostConfig = record
    Host: string;
    Port: Integer;
    User: string;
    Password: string;
  end;

  TSendMail = class
    Anexo: string;
    Assunto: string;
    ParaEmail: TStringList;
    DeEmail: string;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TTituloPagar = class
    Parcela: integer;
    TipoConta: string;
    ValorTotal: real;
    NotaFiscal: string;
    Observacoes: string;
    CodigoConta: real;
  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses SysUtils;

{ TSendMail }

constructor TSendMail.Create;
begin
   inherited Create;
   ParaEmail:=TStringList.Create; 
end;

destructor TSendMail.Destroy;
begin
   ParaEmail.Free;
   inherited Destroy;
end;

{ TTitulos }

constructor TTituloPagar.Create;
begin
   inherited Create;
end;

destructor TTituloPagar.Destroy;
begin
   inherited Destroy;
end;

end.

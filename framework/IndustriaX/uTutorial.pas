unit uTutorial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls;

type
  TfmTutorial = class(TForm)
    lbl1: TLabel;
    shp1: TShape;
    lbl2: TLabel;
    lbl3: TLabel;
    shp2: TShape;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    shp3: TShape;
    lbl7: TLabel;
    lbl8: TLabel;
    shp4: TShape;
    lbl9: TLabel;
    lbl10: TLabel;
    shp5: TShape;
    lbl11: TLabel;
    lbl12: TLabel;
    shp6: TShape;
    lbl13: TLabel;
    lbl14: TLabel;
    shp7: TShape;
    lbl15: TLabel;
    procedure lbl2Click(Sender: TObject);
    procedure lbl4Click(Sender: TObject);
    procedure lbl7Click(Sender: TObject);
    procedure lbl9Click(Sender: TObject);
    procedure lbl11Click(Sender: TObject);
    procedure lbl13Click(Sender: TObject);
    procedure lbl15Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lbl2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lbl2MouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmTutorial: TfmTutorial;

implementation

uses uMenu;

{$R *.dfm}

procedure TfmTutorial.lbl2Click(Sender: TObject);
begin
  fmMenu.Clientes1Click(Self);
end;

procedure TfmTutorial.lbl4Click(Sender: TObject);
begin
  fmMenu.Fornecedores1Click(Self);
end;

procedure TfmTutorial.lbl7Click(Sender: TObject);
begin
  fmMenu.Funcionrios1Click(Self);
end;

procedure TfmTutorial.lbl9Click(Sender: TObject);
begin
  fmMenu.Empresas1Click(Self);
end;

procedure TfmTutorial.lbl11Click(Sender: TObject);
begin
  fmMenu.ransportadoras1Click(Self);
end;

procedure TfmTutorial.lbl13Click(Sender: TObject);
begin
  fmMenu.Produtos1Click(Self);
end;

procedure TfmTutorial.lbl15Click(Sender: TObject);
begin
  fmMenu.PedidosdeVenda1Click(Self);
end;

procedure TfmTutorial.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:=caFree; 
end;

procedure TfmTutorial.lbl2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  (Sender As TLabel).Font.Color := clRed;
end;

procedure TfmTutorial.lbl2MouseLeave(Sender: TObject);
begin
  (Sender As TLabel).Font.Color := clBlue;
end;

end.

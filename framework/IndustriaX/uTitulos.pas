unit uTitulos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBaseCadastro, Menus, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Buttons, ExtCtrls, StdCtrls, DBCtrls, Mask,
  ToolEdit, RXDBCtrl, Grids, DBGrids;

type
  TfmTitulos = class(TfmFormBaseCadastro) 
    edt_tipo_titulo: TDBComboBox;
    Label1: TLabel;
    edt_codigo: TDBEdit;
    Label2: TLabel;
    edt_nome: TDBEdit;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    edt_data_emissao: TDBDateEdit;
    Label25: TLabel;
    edt_codigo_centro_custo: TDBEdit;
    Label4: TLabel;
    edt_centro_custo: TDBEdit;
    Label5: TLabel;
    BitBtn2: TBitBtn;
    edt_documento: TDBEdit;
    Label6: TLabel;
    edt_parcela: TDBEdit;
    Label7: TLabel;
    edt_nota_fiscal: TDBEdit;
    Label8: TLabel;
    edt_tipo_liquidacao: TDBLookupComboBox;
    Label9: TLabel;
    edt_valor_titulo: TDBEdit;
    Label10: TLabel;
    edt_desconto: TDBEdit;
    Label11: TLabel;
    edt_acrescimo: TDBEdit;
    Label12: TLabel;
    edt_valor_final: TDBEdit;
    Label13: TLabel;
    edt_data_vencto: TDBDateEdit;
    Label14: TLabel;
    edt_data_pagto: TDBDateEdit;
    Label15: TLabel;
    edt_historico: TDBEdit;
    Label16: TLabel;
    edt_numero_cheque: TDBEdit;
    Label17: TLabel;
    edt_localizacao: TDBLookupComboBox;
    Label18: TLabel;
    edt_codigo_empresa: TDBEdit;
    Label19: TLabel;
    edt_empresa: TDBLookupComboBox;
    Label20: TLabel;
    Bevel1: TBevel;
    Label21: TLabel;
    DateEdit1: TDateEdit;
    Label22: TLabel;
    edt_valor_liquidacao: TEdit;
    Label23: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label24: TLabel;
    BitBtn3: TBitBtn;
    dbg_liquidacoes: TDBGrid;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Novo; override;
    procedure Editar; override;
    procedure Deletar; override;
    procedure Cancelar; override;
    function Checagens: Boolean; override;
  end;

var
  fmTitulos: TfmTitulos;

implementation

uses uFormBaseConfig, uMenu;

{$R *.dfm}

{ TfmTitulos }

procedure TfmTitulos.Editar;
begin
end;

procedure TfmTitulos.Cancelar;
begin
end;

function TfmTitulos.Checagens: Boolean;
begin
   Result:=False;
end;

procedure TfmTitulos.Deletar;
begin
end;

procedure TfmTitulos.Novo;
begin
end;

procedure TfmTitulos.FormCreate(Sender: TObject);
begin
   inherited;
   SetFormStyle(fsMDIChild);
end;

end.

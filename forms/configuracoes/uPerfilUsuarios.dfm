inherited fmPerfilUsuarios: TfmPerfilUsuarios
  Left = 233
  Top = 154
  Caption = 'Perfil de Usu'#225'rios'
  ClientHeight = 372
  ClientWidth = 604
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 128
    Top = 5
    Width = 48
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object Label1: TLabel [1]
    Left = 8
    Top = 5
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  inherited pnlBotoes: TPanel
    Top = 311
    Width = 604
  end
  object edtDescricao: TDBEdit [3]
    Left = 128
    Top = 21
    Width = 471
    Height = 21
    DataField = 'Descricao'
    DataSource = dtsBase
    TabOrder = 1
  end
  object edtCodigo: TDBEdit [4]
    Left = 8
    Top = 21
    Width = 113
    Height = 21
    DataField = 'CodigoPerfil'
    DataSource = dtsBase
    Enabled = False
    TabOrder = 2
  end
  object tevTelas: TTreeView [5]
    Left = 8
    Top = 48
    Width = 591
    Height = 241
    Indent = 15
    ReadOnly = True
    RowSelect = True
    TabOrder = 3
    OnDblClick = tevTelasDblClick
  end
  object btnRestaurar: TBitBtn [6]
    Left = 524
    Top = 288
    Width = 75
    Height = 18
    Caption = 'Restaurar'
    TabOrder = 4
    OnClick = btnRestaurarClick
  end
  inherited tabBase: TZQuery
    Connection = fmMenu.zcnConexao
  end
end

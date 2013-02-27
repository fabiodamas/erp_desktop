inherited fmIndicesFinanceiros: TfmIndicesFinanceiros
  Left = 231
  Top = 154
  Caption = 'Indices Financeiros'
  ClientHeight = 354
  ClientWidth = 606
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 6
    Width = 29
    Height = 13
    Caption = 'Indice'
  end
  object Label2: TLabel [1]
    Left = 161
    Top = 6
    Width = 24
    Height = 13
    Caption = 'Valor'
  end
  object Label30: TLabel [2]
    Left = 296
    Top = 6
    Width = 23
    Height = 13
    Caption = 'Data'
  end
  inherited pnlBotoes: TPanel
    Top = 293
    Width = 606
  end
  object edtValor: TDBEdit [4]
    Left = 161
    Top = 22
    Width = 120
    Height = 21
    DataField = 'Valor'
    DataSource = dtsBase
    TabOrder = 1
  end
  object dbgGenericos: TDBGrid [5]
    Left = 8
    Top = 51
    Width = 593
    Height = 235
    DataSource = dtsBase
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object edtIndice: TDBLookupComboBox [6]
    Left = 8
    Top = 22
    Width = 139
    Height = 21
    DataField = 'Codigo'
    DataSource = dtsBase
    KeyField = 'Codigo'
    ListField = 'Descricao'
    ListSource = dtsTiposIndices
    TabOrder = 3
  end
  object edtData: TDBDateEdit [7]
    Left = 296
    Top = 22
    Width = 111
    Height = 21
    DataField = 'Data'
    DataSource = dtsBase
    NumGlyphs = 2
    TabOrder = 4
    YearDigits = dyFour
  end
  inherited tabBase: TZQuery
    Connection = fmMenu.zcnConexao
  end
  inherited dtsBase: TDataSource
    Left = 416
  end
  inherited popOpcoes: TPopupMenu
    Left = 384
    Top = 192
  end
  object tabTiposIndices: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 120
    Top = 136
  end
  object dtsTiposIndices: TDataSource
    AutoEdit = False
    DataSet = tabTiposIndices
    Left = 184
    Top = 136
  end
end

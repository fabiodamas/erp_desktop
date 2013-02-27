inherited fmPaises: TfmPaises
  Top = 155
  Caption = 'Pa'#237'ses'
  ClientWidth = 600
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 9
    Width = 58
    Height = 13
    Caption = 'C'#243'digo Pa'#237's'
  end
  object Label3: TLabel [1]
    Left = 119
    Top = 9
    Width = 22
    Height = 13
    Caption = 'Pa'#237's'
  end
  inherited pnlBotoes: TPanel
    Width = 600
    TabOrder = 3
  end
  object edtCodigoPais: TDBEdit [3]
    Left = 8
    Top = 25
    Width = 97
    Height = 21
    DataField = 'CodigoPais'
    DataSource = dtsBase
    TabOrder = 0
  end
  object edtPais: TDBEdit [4]
    Left = 119
    Top = 25
    Width = 474
    Height = 21
    DataField = 'Pais'
    DataSource = dtsBase
    TabOrder = 1
  end
  object dbgPais: TDBGrid [5]
    Left = 8
    Top = 57
    Width = 585
    Height = 364
    DataSource = dtsBase
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  inherited tabBase: TZQuery
    Connection = fmMenu.zcnConexao
  end
end

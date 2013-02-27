inherited fmCentroCusto: TfmCentroCusto
  Left = 234
  Top = 152
  Caption = 'Centro de Custo'
  ClientWidth = 604
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 8
    Top = 8
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label1: TLabel [1]
    Left = 90
    Top = 8
    Width = 32
    Height = 13
    Caption = 'Familia'
  end
  object Label3: TLabel [2]
    Left = 171
    Top = 8
    Width = 48
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  inherited pnlBotoes: TPanel
    Width = 604
    TabOrder = 4
    inherited btnLocalizar: TSpeedButton
      OnClick = btnLocalizarClick
    end
  end
  object edtCodigo: TDBEdit [4]
    Left = 8
    Top = 24
    Width = 73
    Height = 21
    DataField = 'Codigo'
    DataSource = dtsBase
    TabOrder = 0
  end
  object edtFamilia: TDBEdit [5]
    Left = 90
    Top = 24
    Width = 73
    Height = 21
    DataField = 'Familia'
    DataSource = dtsBase
    TabOrder = 1
  end
  object edtDescricao: TDBEdit [6]
    Left = 171
    Top = 24
    Width = 427
    Height = 21
    DataField = 'Descricao'
    DataSource = dtsBase
    TabOrder = 2
  end
  object dbgCentroCusto: TDBGrid [7]
    Left = 8
    Top = 56
    Width = 591
    Height = 364
    DataSource = dtsBase
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  inherited tabBase: TZQuery
    Connection = fmMenu.zcnConexao
  end
  inherited popOpcoes: TPopupMenu
    Left = 499
    Top = 440
  end
end

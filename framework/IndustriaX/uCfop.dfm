inherited fmCfop: TfmCfop
  Left = 232
  Top = 152
  Caption = 'CFOP - Natureza de Opera'#231#227'o'
  ClientHeight = 405
  ClientWidth = 606
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 128
    Top = 6
    Width = 108
    Height = 13
    Caption = 'Natureza de Opera'#231#227'o'
  end
  object Label1: TLabel [1]
    Left = 8
    Top = 6
    Width = 28
    Height = 13
    Caption = 'CFOP'
  end
  inherited pnlBotoes: TPanel
    Top = 344
    Width = 606
    inherited btnLocalizar: TSpeedButton
      OnClick = btnLocalizarClick
    end
  end
  object edtNaturezaOperacao: TDBEdit [3]
    Left = 128
    Top = 22
    Width = 468
    Height = 21
    DataField = 'NaturezaOperacao'
    DataSource = dtsBase
    TabOrder = 1
  end
  object edtCFOP: TDBEdit [4]
    Left = 8
    Top = 22
    Width = 113
    Height = 21
    DataField = 'CFOP'
    DataSource = dtsBase
    TabOrder = 2
    OnExit = edtCFOPExit
  end
  object dbgCFOP: TDBGrid [5]
    Left = 8
    Top = 55
    Width = 589
    Height = 281
    DataSource = dtsBase
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CFOP'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NaturezaOperacao'
        Title.Caption = 'Natureza Opera'#231#227'o'
        Width = 436
        Visible = True
      end>
  end
  inherited tabBase: TZQuery
    Connection = fmMenu.zcnConexao
    Left = 160
    Top = 168
  end
  inherited dtsBase: TDataSource
    Left = 232
    Top = 168
  end
  inherited popOpcoes: TPopupMenu
    Left = 435
    Top = 112
  end
end

inherited fmTiposTabelasPrecos: TfmTiposTabelasPrecos
  Left = 232
  Top = 153
  Caption = 'Tipos de Tabelas de Pre'#231'os'
  ClientHeight = 385
  ClientWidth = 605
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel [0]
    Left = 96
    Top = 7
    Width = 48
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object Label1: TLabel [1]
    Left = 8
    Top = 7
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  inherited pnlBotoes: TPanel
    Top = 324
    Width = 605
    inherited btnLocalizar: TSpeedButton
      OnClick = btnLocalizarClick
    end
  end
  object edtDescricao: TDBEdit [3]
    Left = 96
    Top = 23
    Width = 503
    Height = 21
    DataField = 'Descricao'
    DataSource = dtsBase
    TabOrder = 1
  end
  object edtCodigo: TDBEdit [4]
    Left = 8
    Top = 23
    Width = 80
    Height = 21
    DataField = 'Codigo'
    DataSource = dtsBase
    Enabled = False
    TabOrder = 2
  end
  object dbgTabelasPreco: TDBGrid [5]
    Left = 8
    Top = 53
    Width = 591
    Height = 265
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
        FieldName = 'Codigo'
        Title.Caption = 'C'#243'digo'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 482
        Visible = True
      end>
  end
  inherited tabBase: TZQuery
    Connection = fmMenu.zcnConexao
  end
  inherited popOpcoes: TPopupMenu
    Left = 440
    Top = 280
  end
end

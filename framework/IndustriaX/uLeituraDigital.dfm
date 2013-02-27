inherited fmLeituraDigital: TfmLeituraDigital
  Left = 233
  Top = 154
  Caption = 'Leitura Digital'
  ClientHeight = 482
  ClientWidth = 729
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel [0]
    Left = 8
    Top = 6
    Width = 87
    Height = 125
  end
  object lblCodigo: TLabel [1]
    Left = 112
    Top = 16
    Width = 83
    Height = 29
    Caption = 'C'#243'digo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblNome: TLabel [2]
    Left = 112
    Top = 58
    Width = 441
    Height = 71
    AutoSize = False
    Caption = 'Nome'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object lblStatus: TLabel [3]
    Left = 8
    Top = 140
    Width = 539
    Height = 232
    Alignment = taCenter
    AutoSize = False
    Caption = 'Status.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -48
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object Label1: TLabel [4]
    Left = 24
    Top = 61
    Width = 58
    Height = 13
    Caption = 'Sem Foto.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object imgFoto: TImage [5]
    Left = 8
    Top = 6
    Width = 87
    Height = 125
    Center = True
    Stretch = True
  end
  object pnlDigital: TPanel [6]
    Left = 557
    Top = 8
    Width = 165
    Height = 215
    BevelInner = bvLowered
    TabOrder = 0
  end
  object dbgHorarios: TDBGrid [7]
    Left = 557
    Top = 232
    Width = 165
    Height = 240
    DataSource = dtsHorarios
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Hora'
        Width = 128
        Visible = True
      end>
  end
  inherited popGrid: TPopupMenu
    Left = 24
    Top = 520
  end
  object tabDigital: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 56
    Top = 384
  end
  object tabHorarios: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 216
    Top = 384
  end
  object dtsHorarios: TDataSource
    AutoEdit = False
    DataSet = tabHorarios
    Left = 288
    Top = 384
  end
  object tabFuncionarios: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 128
    Top = 384
  end
  object tabFotos: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 360
    Top = 384
  end
  object tmrDigital: TTimer
    Interval = 5000
    OnTimer = tmrDigitalTimer
    Left = 432
    Top = 384
  end
end

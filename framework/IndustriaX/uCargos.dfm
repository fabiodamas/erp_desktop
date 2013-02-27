inherited fmCargos: TfmCargos
  Caption = 'Cargos'
  ClientHeight = 354
  ClientWidth = 606
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 6
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel [1]
    Left = 129
    Top = 6
    Width = 48
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  inherited pnlBotoes: TPanel
    Top = 293
    Width = 606
  end
  object edtCodigo: TDBEdit [3]
    Left = 8
    Top = 22
    Width = 109
    Height = 21
    DataField = 'Codigo'
    DataSource = dtsBase
    Enabled = False
    TabOrder = 1
  end
  object edtDescricao: TDBEdit [4]
    Left = 129
    Top = 22
    Width = 469
    Height = 21
    DataField = 'Descricao'
    DataSource = dtsBase
    TabOrder = 2
  end
  object dbgGenericos: TDBGrid [5]
    Left = 8
    Top = 51
    Width = 590
    Height = 235
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
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 461
        Visible = True
      end>
  end
  inherited tabBase: TZQuery
    Connection = fmMenu.zcnConexao
  end
  inherited popOpcoes: TPopupMenu
    Left = 448
    Top = 56
  end
end

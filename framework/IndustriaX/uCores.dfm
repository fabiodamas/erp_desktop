inherited fmCores: TfmCores
  Caption = 'Cores'
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
    Left = 126
    Top = 6
    Width = 48
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object Label3: TLabel [2]
    Left = 517
    Top = 6
    Width = 54
    Height = 13
    Caption = 'Abrevia'#231#227'o'
  end
  inherited pnlBotoes: TPanel
    Top = 293
    Width = 606
    inherited btnLocalizar: TSpeedButton
      OnClick = btnLocalizarClick
    end
  end
  object edtCodigo: TDBEdit [4]
    Left = 8
    Top = 22
    Width = 109
    Height = 21
    DataField = 'Codigo'
    DataSource = dtsBase
    Enabled = False
    TabOrder = 1
  end
  object edtDescricao: TDBEdit [5]
    Left = 126
    Top = 22
    Width = 384
    Height = 21
    DataField = 'Descricao'
    DataSource = dtsBase
    TabOrder = 2
  end
  object dbgGenericos: TDBGrid [6]
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
        Width = 395
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Abreviacao'
        Title.Caption = 'Abrevia'#231#227'o'
        Visible = True
      end>
  end
  object edtAbreviacao: TDBEdit [7]
    Left = 517
    Top = 22
    Width = 81
    Height = 21
    DataField = 'Abreviacao'
    DataSource = dtsBase
    TabOrder = 4
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
end

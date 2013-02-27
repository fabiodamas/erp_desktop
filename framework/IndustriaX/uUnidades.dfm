inherited fmUnidades: TfmUnidades
  Left = 256
  Top = 180
  Caption = 'Unidades de Medida'
  ClientHeight = 392
  ClientWidth = 603
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 8
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel [1]
    Left = 238
    Top = 8
    Width = 44
    Height = 13
    Caption = 'Completo'
  end
  object Label3: TLabel [2]
    Left = 129
    Top = 8
    Width = 23
    Height = 13
    Caption = 'Sigla'
  end
  object lbl1: TLabel [3]
    Left = 429
    Top = 8
    Width = 55
    Height = 13
    Caption = 'Quantidade'
  end
  inherited pnlBotoes: TPanel
    Top = 331
    Width = 603
  end
  object edtCodigo: TDBEdit [5]
    Left = 8
    Top = 24
    Width = 109
    Height = 21
    DataField = 'Codigo'
    DataSource = dtsBase
    Enabled = False
    TabOrder = 1
  end
  object edtCompleto: TDBEdit [6]
    Left = 238
    Top = 24
    Width = 187
    Height = 21
    DataField = 'Descricao'
    DataSource = dtsBase
    TabOrder = 3
  end
  object dbgUnidades: TDBGrid [7]
    Left = 8
    Top = 53
    Width = 591
    Height = 268
    DataSource = dtsBase
    TabOrder = 5
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
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sigla'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = 'Completo'
        Width = 282
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantidade'
        Visible = True
      end>
  end
  object edtSigla: TDBEdit [8]
    Left = 129
    Top = 24
    Width = 97
    Height = 21
    DataField = 'Sigla'
    DataSource = dtsBase
    TabOrder = 2
    OnKeyPress = edtSiglaKeyPress
  end
  object edtQuantidade: TcxDBSpinEdit [9]
    Left = 428
    Top = 24
    DataBinding.DataField = 'Quantidade'
    DataBinding.DataSource = dtsBase
    TabOrder = 4
    Width = 93
  end
  inherited tabBase: TZQuery
    Connection = fmMenu.zcnConexao
  end
  inherited popOpcoes: TPopupMenu
    Left = 504
    Top = 136
  end
end

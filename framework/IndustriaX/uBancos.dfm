inherited fmBancos: TfmBancos
  Caption = 'Bancos'
  ClientHeight = 410
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
  object Label3: TLabel [2]
    Left = 8
    Top = 54
    Width = 39
    Height = 13
    Caption = 'Ag'#234'ncia'
  end
  object Label4: TLabel [3]
    Left = 120
    Top = 54
    Width = 31
    Height = 13
    Caption = 'Banco'
  end
  object Label5: TLabel [4]
    Left = 240
    Top = 54
    Width = 28
    Height = 13
    Caption = 'Conta'
  end
  inherited pnlBotoes: TPanel
    Top = 349
    Width = 606
    TabOrder = 7
    inherited btnLocalizar: TSpeedButton
      OnClick = btnLocalizarClick
    end
  end
  object edtCodigo: TDBEdit [6]
    Left = 8
    Top = 22
    Width = 109
    Height = 21
    DataField = 'Codigo'
    DataSource = dtsBase
    Enabled = False
    TabOrder = 0
  end
  object edtDescricao: TDBEdit [7]
    Left = 129
    Top = 22
    Width = 469
    Height = 21
    DataField = 'Descricao'
    DataSource = dtsBase
    TabOrder = 1
  end
  object dbgGenericos: TDBGrid [8]
    Left = 8
    Top = 104
    Width = 590
    Height = 235
    DataSource = dtsBase
    TabOrder = 6
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
  object edtAgencia: TDBEdit [9]
    Left = 8
    Top = 70
    Width = 97
    Height = 21
    DataField = 'Agencia'
    DataSource = dtsBase
    TabOrder = 2
  end
  object edtBanco: TDBEdit [10]
    Left = 120
    Top = 70
    Width = 97
    Height = 21
    DataField = 'Banco'
    DataSource = dtsBase
    TabOrder = 3
  end
  object edtConta: TDBEdit [11]
    Left = 240
    Top = 70
    Width = 217
    Height = 21
    DataField = 'Conta'
    DataSource = dtsBase
    TabOrder = 4
  end
  object dbcSemValorComercial: TDBCheckBox [12]
    Left = 471
    Top = 72
    Width = 120
    Height = 17
    Caption = 'Sem Valor Comercial'
    DataField = 'SemValorComercial'
    DataSource = dtsBase
    TabOrder = 5
    ValueChecked = '1'
    ValueUnchecked = '0'
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

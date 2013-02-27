inherited fmContasBancarias: TfmContasBancarias
  Left = 233
  Top = 153
  Caption = 'Contas Banc'#225'rias'
  ClientHeight = 437
  ClientWidth = 607
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel [0]
    Left = 445
    Top = 7
    Width = 39
    Height = 13
    Caption = 'Ag'#234'ncia'
  end
  object Label1: TLabel [1]
    Left = 357
    Top = 7
    Width = 67
    Height = 13
    Caption = 'C'#243'digo Banco'
  end
  object Label2: TLabel [2]
    Left = 8
    Top = 47
    Width = 83
    Height = 13
    Caption = 'Numero da Conta'
  end
  object Label4: TLabel [3]
    Left = 8
    Top = 7
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label5: TLabel [4]
    Left = 163
    Top = 47
    Width = 36
    Height = 13
    Caption = 'Carteira'
  end
  object Label6: TLabel [5]
    Left = 285
    Top = 47
    Width = 45
    Height = 13
    Caption = 'Conv'#234'nio'
  end
  object Label9: TLabel [6]
    Left = 82
    Top = 7
    Width = 48
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object Label7: TLabel [7]
    Left = 219
    Top = 47
    Width = 44
    Height = 13
    Caption = 'Var. Cart.'
  end
  object Label8: TLabel [8]
    Left = 379
    Top = 47
    Width = 95
    Height = 13
    Caption = 'Numero do Contrato'
  end
  object Label10: TLabel [9]
    Left = 533
    Top = 47
    Width = 63
    Height = 13
    Caption = 'Dias Protesto'
  end
  object Label11: TLabel [10]
    Left = 8
    Top = 95
    Width = 159
    Height = 13
    Caption = 'Banco de Recebimento (Retorno)'
  end
  inherited pnlBotoes: TPanel
    Top = 376
    Width = 607
    TabOrder = 14
    inherited btnLocalizar: TSpeedButton
      OnClick = btnLocalizarClick
    end
  end
  object edtCodigoAgencia: TDBEdit [12]
    Left = 445
    Top = 23
    Width = 129
    Height = 21
    DataField = 'CodigoAgencia'
    DataSource = dtsBase
    TabOrder = 3
  end
  object edtCodigoBanco: TDBEdit [13]
    Left = 357
    Top = 23
    Width = 80
    Height = 21
    DataField = 'CodigoBanco'
    DataSource = dtsBase
    TabOrder = 2
  end
  object dbgContasBancarias: TDBGrid [14]
    Left = 8
    Top = 148
    Width = 591
    Height = 222
    DataSource = dtsBase
    TabOrder = 13
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object edtDigitoAgencia: TDBEdit [15]
    Left = 576
    Top = 23
    Width = 24
    Height = 21
    DataField = 'DigitoAgencia'
    DataSource = dtsBase
    TabOrder = 4
  end
  object edtNumeroConta: TDBEdit [16]
    Left = 8
    Top = 63
    Width = 121
    Height = 21
    DataField = 'NumeroConta'
    DataSource = dtsBase
    TabOrder = 5
  end
  object edtCodigo: TDBEdit [17]
    Left = 8
    Top = 23
    Width = 65
    Height = 21
    DataField = 'ID'
    DataSource = dtsBase
    Enabled = False
    TabOrder = 0
  end
  object edtDigitoConta: TDBEdit [18]
    Left = 132
    Top = 63
    Width = 24
    Height = 21
    DataField = 'DigitoConta'
    DataSource = dtsBase
    TabOrder = 6
  end
  object edtCarteira: TDBEdit [19]
    Left = 163
    Top = 63
    Width = 49
    Height = 21
    DataField = 'Carteira'
    DataSource = dtsBase
    TabOrder = 7
  end
  object edtConvenio: TDBEdit [20]
    Left = 285
    Top = 63
    Width = 87
    Height = 21
    DataField = 'Convenio'
    DataSource = dtsBase
    TabOrder = 9
  end
  object edtDescricao: TDBEdit [21]
    Left = 82
    Top = 23
    Width = 264
    Height = 21
    DataField = 'Descricao'
    DataSource = dtsBase
    TabOrder = 1
  end
  object edtVariacaoCarteira: TDBEdit [22]
    Left = 219
    Top = 63
    Width = 57
    Height = 21
    DataField = 'VariacaoCarteira'
    DataSource = dtsBase
    TabOrder = 8
  end
  object edtNumeroContrato: TDBEdit [23]
    Left = 379
    Top = 63
    Width = 148
    Height = 21
    DataField = 'NumeroContrato'
    DataSource = dtsBase
    TabOrder = 10
  end
  object edtDiasProtesto: TDBEdit [24]
    Left = 533
    Top = 63
    Width = 67
    Height = 21
    DataField = 'DiasProtesto'
    DataSource = dtsBase
    TabOrder = 11
  end
  object edtRetornoBanco: TDBLookupComboBox [25]
    Left = 8
    Top = 112
    Width = 185
    Height = 21
    DataField = 'CodigoBancoRetorno'
    DataSource = dtsBase
    KeyField = 'Codigo'
    ListField = 'Descricao'
    ListSource = dtsBancos
    TabOrder = 12
  end
  inherited popGrid: TPopupMenu
    Left = 520
    Top = 416
  end
  inherited tabBase: TZQuery
    Connection = fmMenu.zcnConexao
    Left = 440
    Top = 416
  end
  inherited dtsBase: TDataSource
    Left = 480
    Top = 416
  end
  inherited popOpcoes: TPopupMenu
    Left = 568
    Top = 416
  end
  object tabBancos: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 440
    Top = 464
  end
  object dtsBancos: TDataSource
    AutoEdit = False
    DataSet = tabBancos
    Left = 480
    Top = 464
  end
end

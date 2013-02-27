inherited fmCidades: TfmCidades
  Left = 232
  Top = 153
  Caption = 'Cidades'
  ClientWidth = 601
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel [0]
    Left = 159
    Top = 9
    Width = 33
    Height = 13
    Caption = 'Cidade'
  end
  object Label1: TLabel [1]
    Left = 8
    Top = 9
    Width = 69
    Height = 13
    Caption = 'C'#243'digo Cidade'
  end
  object Label28: TLabel [2]
    Left = 96
    Top = 9
    Width = 33
    Height = 13
    Caption = 'Estado'
  end
  object Label40: TLabel [3]
    Left = 488
    Top = 11
    Width = 22
    Height = 13
    Caption = 'Pa'#237's'
  end
  inherited pnlBotoes: TPanel
    Width = 601
    TabOrder = 4
  end
  object dbgCidades: TDBGrid [5]
    Left = 8
    Top = 57
    Width = 585
    Height = 360
    DataSource = dtsBase
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object edtCidade: TDBEdit [6]
    Left = 159
    Top = 25
    Width = 322
    Height = 21
    DataField = 'Cidade'
    DataSource = dtsBase
    TabOrder = 2
    OnKeyPress = edtCidadeKeyPress
  end
  object edtCodigoCidade: TDBEdit [7]
    Left = 8
    Top = 25
    Width = 81
    Height = 21
    DataField = 'CodigoCidade'
    DataSource = dtsBase
    TabOrder = 0
  end
  object edtEstado: TDBComboBox [8]
    Left = 96
    Top = 25
    Width = 55
    Height = 21
    DataField = 'UF'
    DataSource = dtsBase
    ItemHeight = 13
    Items.Strings = (
      'AC'
      'AL'
      'AM'
      'AP'
      'BA'
      'CE'
      'DF'
      'ES'
      'GO'
      'MA'
      'MG'
      'MS'
      'MT'
      'PA'
      'PB'
      'PE'
      'PI'
      'PR'
      'RJ'
      'RN'
      'RO'
      'RR'
      'RS'
      'SC'
      'SE'
      'SP'
      'TO'
      'EX')
    TabOrder = 1
    OnKeyPress = edtEstadoKeyPress
  end
  object edtPais: TDBLookupComboBox [9]
    Left = 488
    Top = 25
    Width = 106
    Height = 21
    DataField = 'CodigoPais'
    DataSource = dtsBase
    KeyField = 'CodigoPais'
    ListField = 'Pais'
    ListSource = dtsPais
    TabOrder = 5
  end
  inherited tabBase: TZQuery
    Connection = fmMenu.zcnConexao
  end
  object tabPais: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 352
    Top = 176
  end
  object dtsPais: TDataSource
    AutoEdit = False
    DataSet = tabPais
    Left = 424
    Top = 176
  end
end

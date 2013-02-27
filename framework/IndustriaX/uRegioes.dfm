inherited fmRegioes: TfmRegioes
  Caption = 'Regi'#245'es'
  ClientHeight = 407
  ClientWidth = 591
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label26: TLabel [0]
    Left = 8
    Top = 9
    Width = 25
    Height = 13
    Caption = 'Setor'
  end
  object Label29: TLabel [1]
    Left = 95
    Top = 9
    Width = 27
    Height = 13
    Caption = 'Bairro'
  end
  object Label28: TLabel [2]
    Left = 272
    Top = 9
    Width = 33
    Height = 13
    Caption = 'Estado'
  end
  object Label34: TLabel [3]
    Left = 336
    Top = 9
    Width = 33
    Height = 13
    Caption = 'Cidade'
  end
  inherited pnlBotoes: TPanel
    Top = 346
    Width = 591
    TabOrder = 5
  end
  object edtSetor: TDBEdit [5]
    Left = 8
    Top = 23
    Width = 81
    Height = 21
    DataField = 'Setor'
    DataSource = dtsBase
    TabOrder = 0
  end
  object edtBairro: TDBEdit [6]
    Left = 95
    Top = 23
    Width = 170
    Height = 21
    DataField = 'Bairro'
    DataSource = dtsBase
    TabOrder = 1
  end
  object edtEstado: TDBComboBox [7]
    Left = 272
    Top = 23
    Width = 57
    Height = 21
    Style = csDropDownList
    DataField = 'Estado'
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
    TabOrder = 2
  end
  object edtCidade: TDBLookupComboBox [8]
    Left = 336
    Top = 23
    Width = 248
    Height = 21
    DataField = 'CodigoCidade'
    DataSource = dtsBase
    KeyField = 'CodigoCidade'
    ListField = 'Cidade'
    ListSource = dtsCidades
    TabOrder = 3
  end
  object dbgRegioes: TDBGrid [9]
    Left = 8
    Top = 56
    Width = 576
    Height = 281
    DataSource = dtsBase
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  inherited tabBase: TZQuery
    Connection = fmMenu.zcnConexao
    Left = 616
    Top = 8
  end
  inherited dtsBase: TDataSource
    Left = 688
    Top = 8
  end
  inherited popOpcoes: TPopupMenu
    Left = 507
    Top = 320
  end
  object tabCidades: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 616
    Top = 64
  end
  object dtsCidades: TDataSource
    AutoEdit = False
    DataSet = tabCidades
    Left = 688
    Top = 64
  end
end

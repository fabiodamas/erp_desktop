inherited fmAlteracoesCodigos: TfmAlteracoesCodigos
  Left = 234
  Top = 155
  Caption = 'Altera'#231#245'es de C'#243'digos'
  ClientHeight = 106
  ClientWidth = 323
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 8
    Width = 33
    Height = 13
    Caption = 'Tabela'
  end
  object Label2: TLabel [1]
    Left = 168
    Top = 8
    Width = 33
    Height = 13
    Caption = 'Origem'
  end
  object Label3: TLabel [2]
    Left = 248
    Top = 8
    Width = 36
    Height = 13
    Caption = 'Destino'
  end
  object edtTabela: TComboBox [3]
    Left = 8
    Top = 24
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    Items.Strings = (
      'Centro de Custo'
      'Produtos')
  end
  object edtOrigem: TEdit [4]
    Left = 168
    Top = 24
    Width = 65
    Height = 21
    TabOrder = 1
  end
  object edtDestino: TEdit [5]
    Left = 248
    Top = 24
    Width = 65
    Height = 21
    TabOrder = 2
  end
  object btnOK: TButton [6]
    Left = 239
    Top = 64
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 3
    OnClick = btnOKClick
  end
  object tabUpDate: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 344
    Top = 144
  end
end

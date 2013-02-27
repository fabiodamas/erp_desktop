inherited fmCadastroEnderecos: TfmCadastroEnderecos
  Left = 232
  Top = 154
  Caption = 'Endere'#231'os'
  ClientHeight = 507
  ClientWidth = 603
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 8
    Width = 33
    Height = 20
    Caption = 'Cep:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel [1]
    Left = 157
    Top = 8
    Width = 55
    Height = 20
    Caption = 'Estado:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel [2]
    Left = 240
    Top = 8
    Width = 54
    Height = 20
    Caption = 'Cidade:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Bevel1: TBevel [3]
    Left = 8
    Top = 60
    Width = 585
    Height = 12
    Shape = bsBottomLine
  end
  object Label26: TLabel [4]
    Left = 8
    Top = 83
    Width = 19
    Height = 13
    Caption = 'Cep'
  end
  object Label29: TLabel [5]
    Left = 135
    Top = 83
    Width = 46
    Height = 13
    Caption = 'Endere'#231'o'
  end
  object Label31: TLabel [6]
    Left = 8
    Top = 134
    Width = 27
    Height = 13
    Caption = 'Bairro'
  end
  object Label28: TLabel [7]
    Left = 259
    Top = 134
    Width = 33
    Height = 13
    Caption = 'Estado'
  end
  object Label34: TLabel [8]
    Left = 345
    Top = 123
    Width = 33
    Height = 13
    Caption = 'Cidade'
  end
  inherited pnlBotoes: TPanel
    Top = 446
    Width = 603
    TabOrder = 10
  end
  object edtProcurarCep: TEdit [10]
    Left = 8
    Top = 32
    Width = 129
    Height = 21
    TabOrder = 0
    OnExit = edtProcurarCepExit
  end
  object edtProcurarCidade: TDBLookupComboBox [11]
    Left = 240
    Top = 32
    Width = 257
    Height = 21
    KeyField = 'CodigoCidade'
    ListField = 'Cidade'
    ListSource = dtsProcurarCidade
    TabOrder = 2
    OnEnter = edtProcurarCidadeEnter
  end
  object btnProcurar: TBitBtn [12]
    Left = 506
    Top = 11
    Width = 88
    Height = 51
    Caption = 'Procurar'
    TabOrder = 3
    OnClick = btnProcurarClick
    Glyph.Data = {
      36060000424D3606000000000000360000002800000020000000100000000100
      18000000000000060000120B0000120B00000000000000000000FF00FF314B62
      AC7D7EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FF777777BDBDBDFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5084B20F6FE1
      325F8CB87E7AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFABABAB9797978B8B8BC1C1C1FF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF32A0FE37A1FF
      106FE2325F8BB67D79FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFB8B8B8BCBCBC9898988A8A8AC0C0C0FF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF37A4FE
      379FFF0E6DDE355F89BB7F79FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFBBBBBBBCBCBC9595958B8B8BC2C2C2FF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      37A4FE359EFF0F6FDE35608BA67B7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFBBBBBBBABABA9696968C8C8CBABABAFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF38A5FE329DFF156DCE444F5BFF00FF9C6B65AF887BAF887EAA8075FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBCBCBCB9B9B99494947E7E7EFF
      00FF979797AAAAAAABABABA5A5A5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF3BABFFA1CAE7AD8679A98373E0CFB1FFFFDAFFFFDDFCF8CFCCB2
      9FA1746BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBEBEBED1D1D1A8A8A8A3
      A3A3D4D4D4F1F1F1F2F2F2EBEBEBC5C5C59D9D9DFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFC0917DFCE9ACFFFFCCFFFFCFFFFFD0FFFFDEFFFF
      FAE3D3D1996965FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1B1B1DD
      DDDDEBEBEBECECECEDEDEDF2F2F2FDFDFDE3E3E3969696FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFB08978FAD192FEF4C2FFFFD0FFFFDAFFFFF6FFFF
      FCFFFFFCB69384FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA9A9A9D1
      D1D1E7E7E7EDEDEDF1F1F1FBFBFBFEFEFEFEFEFEB1B1B1FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFB08978FEDA97EDB478FBEEBBFFFFD3FFFFDCFFFFF4FFFF
      F4FFFFE2E9DDBCA67B73FF00FFFF00FFFF00FFFF00FFFF00FFA9A9A9D5D5D5C1
      C1C1E3E3E3EEEEEEF1F1F1FBFBFBFBFBFBF4F4F4DCDCDCA2A2A2FF00FFFF00FF
      FF00FFFF00FFFF00FFB18A78FFDE99E9A167F4D199FEFCCCFFFFD5FFFFDAFFFF
      DCFFFFD7EFE6C5A97E75FF00FFFF00FFFF00FFFF00FFFF00FFA9A9A9D6D6D6B7
      B7B7D2D2D2EBEBEBEFEFEFF1F1F1F1F1F1EFEFEFE2E2E2A4A4A4FF00FFFF00FF
      FF00FFFF00FFFF00FFAA7F73FAE0A4F0B778EEBA7BF6DDA6FEFBCCFFFFD3FFFF
      D1FFFFD7D9C5A7A3756CFF00FFFF00FFFF00FFFF00FFFF00FFA4A4A4D9D9D9C2
      C2C2C3C3C3D8D8D8EBEBEBEEEEEEEDEDEDEFEFEFCECECE9E9E9EFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFCEB293FFFEDDF4D1A5EEBA7BF2C78FF8E1ABFCF0
      BAFCFACAA3776FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1C1C1F2
      F2F2D7D7D7C3C3C3CDCDCDDBDBDBE3E3E3E9E9E99F9F9FFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFA1746BE1D4D3FFFEEEF7CC8CF0B473F7C788FCE3
      A5C2A088A5776CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9D9D9DE2
      E2E2F8F8F8CECECEC0C0C0CCCCCCDADADAB7B7B79F9F9FFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FF986865BA9587EAD7A4EAD59EE0C097A577
      6CA5776CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF96
      9696B3B3B3D3D3D3D0D0D0C9C9C99F9F9F9F9F9FFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA77E70A98073A4786EFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFA2A2A2A3A3A39F9F9FFF00FFFF00FFFF00FFFF00FF}
    NumGlyphs = 2
  end
  object edtCep: TDBEdit [13]
    Left = 8
    Top = 97
    Width = 119
    Height = 21
    DataField = 'Cep'
    DataSource = dtsBase
    TabOrder = 4
    OnExit = edtCepExit
  end
  object edtEndereco: TDBEdit [14]
    Left = 135
    Top = 97
    Width = 458
    Height = 21
    DataField = 'Endereco'
    DataSource = dtsBase
    TabOrder = 5
  end
  object edtBairro: TDBEdit [15]
    Left = 8
    Top = 148
    Width = 237
    Height = 21
    DataField = 'Bairro'
    DataSource = dtsBase
    TabOrder = 6
  end
  object edtEstado: TDBComboBox [16]
    Left = 259
    Top = 148
    Width = 73
    Height = 21
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
    TabOrder = 7
  end
  object edtCidade: TDBLookupComboBox [17]
    Left = 345
    Top = 137
    Width = 248
    Height = 21
    DataField = 'CodigoCidade'
    DataSource = dtsBase
    KeyField = 'CodigoCidade'
    ListField = 'Cidade'
    ListSource = dtsCidades
    TabOrder = 8
    OnEnter = edtCidadeEnter
  end
  object dbgEnderecos: TDBGrid [18]
    Left = 8
    Top = 184
    Width = 585
    Height = 253
    DataSource = dtsBase
    TabOrder = 9
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object edtProcurarEstado: TComboBox [19]
    Left = 157
    Top = 32
    Width = 67
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
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
      'TO')
  end
  object ckbProcurarExato: TCheckBox [20]
    Left = 90
    Top = 12
    Width = 45
    Height = 17
    Caption = 'Igual'
    TabOrder = 11
  end
  object edtCidadeDescricao: TDBEdit [21]
    Left = 345
    Top = 158
    Width = 248
    Height = 21
    DataField = 'Cidade'
    DataSource = dtsBase
    Enabled = False
    TabOrder = 12
  end
  inherited tabBase: TZQuery
    Connection = fmMenu.zcnConexao
    Left = 40
    Top = 240
  end
  inherited dtsBase: TDataSource
    Left = 112
    Top = 240
  end
  inherited popOpcoes: TPopupMenu
    Left = 83
    Top = 360
  end
  object tabCidades: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 40
    Top = 288
  end
  object dtsCidades: TDataSource
    AutoEdit = False
    DataSet = tabCidades
    Left = 112
    Top = 288
  end
  object tabProcurarCidade: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 392
    Top = 240
  end
  object dtsProcurarCidade: TDataSource
    AutoEdit = False
    DataSet = tabProcurarCidade
    Left = 480
    Top = 240
  end
end

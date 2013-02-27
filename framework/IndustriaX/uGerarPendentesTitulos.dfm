inherited fmGerarPendentesTitulos: TfmGerarPendentesTitulos
  Left = 233
  Top = 154
  Caption = 'Gerar Pendentes T'#237'tulos'
  ClientHeight = 466
  ClientWidth = 743
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 8
    Width = 67
    Height = 13
    Caption = 'Tipo do T'#237'tulo'
  end
  object Label2: TLabel [1]
    Left = 168
    Top = 8
    Width = 53
    Height = 13
    Caption = 'Favorecido'
  end
  object lblTipo: TLabel [2]
    Left = 288
    Top = 8
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label4: TLabel [3]
    Left = 378
    Top = 8
    Width = 28
    Height = 13
    Caption = 'Nome'
  end
  object Label5: TLabel [4]
    Left = 621
    Top = 8
    Width = 43
    Height = 13
    Caption = 'Vencto 1'
    FocusControl = edtVencto0
  end
  object Label6: TLabel [5]
    Left = 8
    Top = 56
    Width = 76
    Height = 13
    Caption = 'Centro de Custo'
  end
  object Label7: TLabel [6]
    Left = 288
    Top = 56
    Width = 41
    Height = 13
    Caption = 'Empresa'
  end
  object Label8: TLabel [7]
    Left = 505
    Top = 56
    Width = 41
    Height = 13
    Caption = 'Parcelas'
  end
  object Label9: TLabel [8]
    Left = 553
    Top = 56
    Width = 55
    Height = 13
    Caption = 'Documento'
  end
  object Label10: TLabel [9]
    Left = 617
    Top = 56
    Width = 20
    Height = 13
    Caption = 'N.F.'
  end
  object edtTipoTitulo: TComboBox [10]
    Left = 8
    Top = 24
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnCloseUp = edtTipoTituloCloseUp
    Items.Strings = (
      'T'#237'tulo a Receber'
      'T'#237'tulo a Pagar')
  end
  object edtFavorecido: TComboBox [11]
    Left = 168
    Top = 24
    Width = 113
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
    OnCloseUp = edtFavorecidoCloseUp
    OnEnter = edtFavorecidoEnter
    Items.Strings = (
      'Banco'
      'Fornecedor'
      'Funcion'#225'rio'
      'Transportadora')
  end
  object edtCodigo: TEdit [12]
    Left = 288
    Top = 24
    Width = 54
    Height = 21
    TabOrder = 2
    OnChange = edtCodigoChange
  end
  object edtNome: TEdit [13]
    Left = 378
    Top = 24
    Width = 232
    Height = 21
    Enabled = False
    TabOrder = 4
  end
  object edtVencto0: TDateEdit [14]
    Left = 621
    Top = 24
    Width = 113
    Height = 21
    NumGlyphs = 2
    YearDigits = dyFour
    TabOrder = 5
  end
  object btnLocalizar: TBitBtn [15]
    Left = 346
    Top = 24
    Width = 29
    Height = 22
    TabOrder = 3
    OnClick = btnLocalizarClick
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
  object edtCodigoCC: TEdit [16]
    Left = 8
    Top = 72
    Width = 57
    Height = 21
    TabOrder = 6
    OnChange = edtCodigoCCChange
  end
  object edtCC: TEdit [17]
    Left = 101
    Top = 72
    Width = 180
    Height = 21
    Enabled = False
    TabOrder = 8
  end
  object btnLocalizarCC: TBitBtn [18]
    Left = 69
    Top = 72
    Width = 29
    Height = 22
    TabOrder = 7
    OnClick = btnLocalizarCCClick
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
  object edtCodigoEmpresa: TEdit [19]
    Left = 288
    Top = 72
    Width = 54
    Height = 21
    TabOrder = 9
    OnChange = edtCodigoEmpresaChange
  end
  object edtNomeEmpresa: TEdit [20]
    Left = 378
    Top = 72
    Width = 122
    Height = 21
    Enabled = False
    TabOrder = 11
  end
  object btnLocalizarEmpresa: TBitBtn [21]
    Left = 346
    Top = 72
    Width = 29
    Height = 22
    TabOrder = 10
    OnClick = btnLocalizarEmpresaClick
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
  object edtParcelas: TEdit [22]
    Left = 505
    Top = 72
    Width = 42
    Height = 21
    TabOrder = 12
    OnExit = edtParcelasExit
    OnKeyPress = edtParcelasKeyPress
  end
  object edtDocumento: TEdit [23]
    Left = 553
    Top = 72
    Width = 57
    Height = 21
    TabOrder = 13
    OnKeyPress = edtDocumentoKeyPress
  end
  object edtNF: TEdit [24]
    Left = 617
    Top = 72
    Width = 60
    Height = 21
    TabOrder = 14
  end
  object pgcVenctos: TPageControl [25]
    Left = 8
    Top = 104
    Width = 729
    Height = 324
    ActivePage = tbsVenctos1_12
    TabOrder = 16
    object tbsVenctos1_12: TTabSheet
      Caption = 'Venctos 1 - 12'
      object Label11: TLabel
        Left = 8
        Top = 8
        Width = 43
        Height = 13
        Caption = 'Vencto 1'
        FocusControl = edtVencto1
      end
      object Label12: TLabel
        Left = 120
        Top = 8
        Width = 33
        Height = 13
        Caption = 'Valor 1'
        FocusControl = edtVencto1
      end
      object Label13: TLabel
        Left = 204
        Top = 8
        Width = 40
        Height = 13
        Caption = 'Banco 1'
      end
      object Label14: TLabel
        Left = 283
        Top = 8
        Width = 66
        Height = 13
        Caption = 'Localiza'#231#227'o 1'
      end
      object Bevel1: TBevel
        Left = 360
        Top = 4
        Width = 9
        Height = 286
        Shape = bsLeftLine
      end
      object Label15: TLabel
        Left = 366
        Top = 8
        Width = 43
        Height = 13
        Caption = 'Vencto 7'
        FocusControl = edtVencto7
      end
      object Label16: TLabel
        Left = 478
        Top = 8
        Width = 33
        Height = 13
        Caption = 'Valor 7'
        FocusControl = edtVencto7
      end
      object Label17: TLabel
        Left = 562
        Top = 8
        Width = 40
        Height = 13
        Caption = 'Banco 7'
      end
      object Label18: TLabel
        Left = 641
        Top = 8
        Width = 66
        Height = 13
        Caption = 'Localiza'#231#227'o 7'
      end
      object Label19: TLabel
        Left = 8
        Top = 56
        Width = 43
        Height = 13
        Caption = 'Vencto 2'
        FocusControl = edtVencto2
      end
      object Label20: TLabel
        Left = 120
        Top = 56
        Width = 33
        Height = 13
        Caption = 'Valor 2'
        FocusControl = edtVencto2
      end
      object Label21: TLabel
        Left = 204
        Top = 56
        Width = 40
        Height = 13
        Caption = 'Banco 2'
      end
      object Label22: TLabel
        Left = 283
        Top = 56
        Width = 66
        Height = 13
        Caption = 'Localiza'#231#227'o 2'
      end
      object Label23: TLabel
        Left = 366
        Top = 56
        Width = 43
        Height = 13
        Caption = 'Vencto 8'
        FocusControl = edtVencto8
      end
      object Label24: TLabel
        Left = 478
        Top = 56
        Width = 33
        Height = 13
        Caption = 'Valor 8'
        FocusControl = edtVencto8
      end
      object Label25: TLabel
        Left = 562
        Top = 56
        Width = 40
        Height = 13
        Caption = 'Banco 8'
      end
      object Label26: TLabel
        Left = 641
        Top = 56
        Width = 66
        Height = 13
        Caption = 'Localiza'#231#227'o 8'
      end
      object Label27: TLabel
        Left = 8
        Top = 104
        Width = 43
        Height = 13
        Caption = 'Vencto 3'
        FocusControl = edtVencto3
      end
      object Label28: TLabel
        Left = 120
        Top = 104
        Width = 33
        Height = 13
        Caption = 'Valor 3'
        FocusControl = edtVencto3
      end
      object Label29: TLabel
        Left = 204
        Top = 104
        Width = 40
        Height = 13
        Caption = 'Banco 3'
      end
      object Label30: TLabel
        Left = 283
        Top = 104
        Width = 66
        Height = 13
        Caption = 'Localiza'#231#227'o 3'
      end
      object Label31: TLabel
        Left = 366
        Top = 104
        Width = 43
        Height = 13
        Caption = 'Vencto 9'
        FocusControl = edtVencto9
      end
      object Label32: TLabel
        Left = 478
        Top = 104
        Width = 33
        Height = 13
        Caption = 'Valor 9'
        FocusControl = edtVencto9
      end
      object Label33: TLabel
        Left = 562
        Top = 104
        Width = 40
        Height = 13
        Caption = 'Banco 9'
      end
      object Label34: TLabel
        Left = 641
        Top = 104
        Width = 66
        Height = 13
        Caption = 'Localiza'#231#227'o 9'
      end
      object Label35: TLabel
        Left = 8
        Top = 152
        Width = 43
        Height = 13
        Caption = 'Vencto 4'
        FocusControl = edtVencto4
      end
      object Label36: TLabel
        Left = 120
        Top = 152
        Width = 33
        Height = 13
        Caption = 'Valor 4'
        FocusControl = edtVencto4
      end
      object Label37: TLabel
        Left = 204
        Top = 152
        Width = 40
        Height = 13
        Caption = 'Banco 4'
      end
      object Label38: TLabel
        Left = 283
        Top = 152
        Width = 66
        Height = 13
        Caption = 'Localiza'#231#227'o 4'
      end
      object Label39: TLabel
        Left = 366
        Top = 152
        Width = 49
        Height = 13
        Caption = 'Vencto 10'
        FocusControl = edtVencto10
      end
      object Label40: TLabel
        Left = 478
        Top = 152
        Width = 39
        Height = 13
        Caption = 'Valor 10'
        FocusControl = edtVencto10
      end
      object Label41: TLabel
        Left = 562
        Top = 152
        Width = 46
        Height = 13
        Caption = 'Banco 10'
      end
      object Label42: TLabel
        Left = 641
        Top = 152
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 10'
      end
      object Label43: TLabel
        Left = 8
        Top = 200
        Width = 43
        Height = 13
        Caption = 'Vencto 5'
        FocusControl = edtVencto5
      end
      object Label44: TLabel
        Left = 120
        Top = 200
        Width = 33
        Height = 13
        Caption = 'Valor 5'
        FocusControl = edtVencto5
      end
      object Label45: TLabel
        Left = 204
        Top = 200
        Width = 40
        Height = 13
        Caption = 'Banco 5'
      end
      object Label46: TLabel
        Left = 283
        Top = 200
        Width = 66
        Height = 13
        Caption = 'Localiza'#231#227'o 5'
      end
      object Label47: TLabel
        Left = 366
        Top = 200
        Width = 49
        Height = 13
        Caption = 'Vencto 11'
        FocusControl = edtVencto11
      end
      object Label48: TLabel
        Left = 478
        Top = 200
        Width = 39
        Height = 13
        Caption = 'Valor 11'
        FocusControl = edtVencto11
      end
      object Label49: TLabel
        Left = 562
        Top = 200
        Width = 46
        Height = 13
        Caption = 'Banco 11'
      end
      object Label50: TLabel
        Left = 641
        Top = 200
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 11'
      end
      object Label51: TLabel
        Left = 8
        Top = 248
        Width = 43
        Height = 13
        Caption = 'Vencto 6'
        FocusControl = edtVencto6
      end
      object Label52: TLabel
        Left = 120
        Top = 248
        Width = 33
        Height = 13
        Caption = 'Valor 6'
        FocusControl = edtVencto6
      end
      object Label53: TLabel
        Left = 204
        Top = 248
        Width = 40
        Height = 13
        Caption = 'Banco 6'
      end
      object Label54: TLabel
        Left = 283
        Top = 248
        Width = 66
        Height = 13
        Caption = 'Localiza'#231#227'o 6'
      end
      object Label55: TLabel
        Left = 366
        Top = 248
        Width = 49
        Height = 13
        Caption = 'Vencto 12'
        FocusControl = edtVencto12
      end
      object Label56: TLabel
        Left = 478
        Top = 248
        Width = 39
        Height = 13
        Caption = 'Valor 12'
        FocusControl = edtVencto12
      end
      object Label57: TLabel
        Left = 562
        Top = 248
        Width = 46
        Height = 13
        Caption = 'Banco 12'
      end
      object Label58: TLabel
        Left = 641
        Top = 248
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 12'
      end
      object edtVencto1: TDateEdit
        Left = 8
        Top = 24
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 0
      end
      object edtValor1: TCurrencyEdit
        Left = 120
        Top = 24
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 1
      end
      object edtBanco1: TDBLookupComboBox
        Left = 204
        Top = 24
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 2
      end
      object edtLocalizacao1: TDBLookupComboBox
        Left = 283
        Top = 24
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 3
      end
      object edtVencto7: TDateEdit
        Left = 366
        Top = 24
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 24
      end
      object edtValor7: TCurrencyEdit
        Left = 478
        Top = 24
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 25
      end
      object edtBanco7: TDBLookupComboBox
        Left = 562
        Top = 24
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 26
      end
      object edtLocalizacao7: TDBLookupComboBox
        Left = 641
        Top = 24
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 27
      end
      object edtVencto2: TDateEdit
        Left = 8
        Top = 72
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 4
      end
      object edtValor2: TCurrencyEdit
        Left = 120
        Top = 72
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 5
      end
      object edtBanco2: TDBLookupComboBox
        Left = 204
        Top = 72
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 6
      end
      object edtLocalizacao2: TDBLookupComboBox
        Left = 283
        Top = 72
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 7
      end
      object edtVencto8: TDateEdit
        Left = 366
        Top = 72
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 28
      end
      object edtValor8: TCurrencyEdit
        Left = 478
        Top = 72
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 29
      end
      object edtBanco8: TDBLookupComboBox
        Left = 562
        Top = 72
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 30
      end
      object edtLocalizacao8: TDBLookupComboBox
        Left = 640
        Top = 72
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 31
      end
      object edtVencto3: TDateEdit
        Left = 8
        Top = 120
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 8
      end
      object edtValor3: TCurrencyEdit
        Left = 120
        Top = 120
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 9
      end
      object edtBanco3: TDBLookupComboBox
        Left = 204
        Top = 120
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 10
      end
      object edtLocalizacao3: TDBLookupComboBox
        Left = 283
        Top = 120
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 11
      end
      object edtVencto9: TDateEdit
        Left = 366
        Top = 120
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 32
      end
      object edtValor9: TCurrencyEdit
        Left = 478
        Top = 120
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 33
      end
      object edtBanco9: TDBLookupComboBox
        Left = 562
        Top = 120
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 34
      end
      object edtLocalizacao9: TDBLookupComboBox
        Left = 640
        Top = 120
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 35
      end
      object edtVencto4: TDateEdit
        Left = 8
        Top = 168
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 12
      end
      object edtValor4: TCurrencyEdit
        Left = 120
        Top = 168
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 13
      end
      object edtBanco4: TDBLookupComboBox
        Left = 204
        Top = 168
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 14
      end
      object edtLocalizacao4: TDBLookupComboBox
        Left = 283
        Top = 168
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 15
      end
      object edtVencto10: TDateEdit
        Left = 366
        Top = 168
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 36
      end
      object edtValor10: TCurrencyEdit
        Left = 478
        Top = 168
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 37
      end
      object edtBanco10: TDBLookupComboBox
        Left = 562
        Top = 168
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 38
      end
      object edtLocalizacao10: TDBLookupComboBox
        Left = 640
        Top = 168
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 39
      end
      object edtVencto5: TDateEdit
        Left = 8
        Top = 216
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 16
      end
      object edtValor5: TCurrencyEdit
        Left = 120
        Top = 216
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 17
      end
      object edtBanco5: TDBLookupComboBox
        Left = 204
        Top = 216
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 18
      end
      object edtLocalizacao5: TDBLookupComboBox
        Left = 283
        Top = 216
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 19
      end
      object edtVencto11: TDateEdit
        Left = 366
        Top = 216
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 40
      end
      object edtValor11: TCurrencyEdit
        Left = 478
        Top = 216
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 41
      end
      object edtBanco11: TDBLookupComboBox
        Left = 562
        Top = 216
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 42
      end
      object edtLocalizacao11: TDBLookupComboBox
        Left = 640
        Top = 216
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 43
      end
      object edtVencto6: TDateEdit
        Left = 8
        Top = 264
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 20
      end
      object edtValor6: TCurrencyEdit
        Left = 120
        Top = 264
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 21
      end
      object edtBanco6: TDBLookupComboBox
        Left = 204
        Top = 264
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 22
      end
      object edtLocalizacao6: TDBLookupComboBox
        Left = 283
        Top = 264
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 23
      end
      object edtVencto12: TDateEdit
        Left = 366
        Top = 264
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 44
      end
      object edtValor12: TCurrencyEdit
        Left = 478
        Top = 264
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 45
      end
      object edtBanco12: TDBLookupComboBox
        Left = 562
        Top = 264
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 46
      end
      object edtLocalizacao12: TDBLookupComboBox
        Left = 640
        Top = 264
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 47
      end
    end
    object tbsVenctos13_24: TTabSheet
      Caption = 'Venctos 13 - 24'
      ImageIndex = 2
      object Label3: TLabel
        Left = 8
        Top = 8
        Width = 49
        Height = 13
        Caption = 'Vencto 13'
        FocusControl = edtVencto13
      end
      object Label59: TLabel
        Left = 120
        Top = 8
        Width = 39
        Height = 13
        Caption = 'Valor 13'
        FocusControl = edtVencto13
      end
      object Label60: TLabel
        Left = 204
        Top = 8
        Width = 46
        Height = 13
        Caption = 'Banco 13'
      end
      object Label61: TLabel
        Left = 283
        Top = 8
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 13'
      end
      object Bevel2: TBevel
        Left = 360
        Top = 4
        Width = 9
        Height = 286
        Shape = bsLeftLine
      end
      object Label62: TLabel
        Left = 366
        Top = 8
        Width = 49
        Height = 13
        Caption = 'Vencto 19'
        FocusControl = edtVencto19
      end
      object Label63: TLabel
        Left = 478
        Top = 8
        Width = 39
        Height = 13
        Caption = 'Valor 19'
        FocusControl = edtVencto19
      end
      object Label64: TLabel
        Left = 562
        Top = 8
        Width = 46
        Height = 13
        Caption = 'Banco 19'
      end
      object Label65: TLabel
        Left = 641
        Top = 8
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 19'
      end
      object Label66: TLabel
        Left = 641
        Top = 56
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 20'
      end
      object Label67: TLabel
        Left = 641
        Top = 104
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 21'
      end
      object Label68: TLabel
        Left = 641
        Top = 152
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 22'
      end
      object Label69: TLabel
        Left = 641
        Top = 200
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 23'
      end
      object Label70: TLabel
        Left = 641
        Top = 248
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 24'
      end
      object Label71: TLabel
        Left = 562
        Top = 248
        Width = 46
        Height = 13
        Caption = 'Banco 24'
      end
      object Label72: TLabel
        Left = 562
        Top = 200
        Width = 46
        Height = 13
        Caption = 'Banco 23'
      end
      object Label73: TLabel
        Left = 562
        Top = 152
        Width = 46
        Height = 13
        Caption = 'Banco 22'
      end
      object Label74: TLabel
        Left = 562
        Top = 104
        Width = 46
        Height = 13
        Caption = 'Banco 21'
      end
      object Label75: TLabel
        Left = 562
        Top = 56
        Width = 46
        Height = 13
        Caption = 'Banco 20'
      end
      object Label76: TLabel
        Left = 478
        Top = 248
        Width = 39
        Height = 13
        Caption = 'Valor 24'
        FocusControl = edtVencto24
      end
      object Label77: TLabel
        Left = 478
        Top = 200
        Width = 39
        Height = 13
        Caption = 'Valor 23'
        FocusControl = edtVencto23
      end
      object Label78: TLabel
        Left = 478
        Top = 152
        Width = 39
        Height = 13
        Caption = 'Valor 22'
        FocusControl = edtVencto22
      end
      object Label79: TLabel
        Left = 478
        Top = 104
        Width = 39
        Height = 13
        Caption = 'Valor 21'
        FocusControl = edtVencto21
      end
      object Label80: TLabel
        Left = 478
        Top = 56
        Width = 39
        Height = 13
        Caption = 'Valor 20'
        FocusControl = edtVencto20
      end
      object Label81: TLabel
        Left = 366
        Top = 56
        Width = 49
        Height = 13
        Caption = 'Vencto 20'
        FocusControl = edtVencto20
      end
      object Label82: TLabel
        Left = 366
        Top = 104
        Width = 49
        Height = 13
        Caption = 'Vencto 21'
        FocusControl = edtVencto21
      end
      object Label83: TLabel
        Left = 366
        Top = 152
        Width = 49
        Height = 13
        Caption = 'Vencto 22'
        FocusControl = edtVencto22
      end
      object Label84: TLabel
        Left = 366
        Top = 200
        Width = 49
        Height = 13
        Caption = 'Vencto 23'
        FocusControl = edtVencto23
      end
      object Label85: TLabel
        Left = 366
        Top = 248
        Width = 49
        Height = 13
        Caption = 'Vencto 24'
        FocusControl = edtVencto24
      end
      object Label86: TLabel
        Left = 283
        Top = 248
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 18'
      end
      object Label87: TLabel
        Left = 283
        Top = 200
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 17'
      end
      object Label88: TLabel
        Left = 283
        Top = 152
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 16'
      end
      object Label89: TLabel
        Left = 283
        Top = 104
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 15'
      end
      object Label90: TLabel
        Left = 283
        Top = 56
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 14'
      end
      object Label91: TLabel
        Left = 204
        Top = 56
        Width = 46
        Height = 13
        Caption = 'Banco 14'
      end
      object Label92: TLabel
        Left = 204
        Top = 104
        Width = 46
        Height = 13
        Caption = 'Banco 15'
      end
      object Label93: TLabel
        Left = 204
        Top = 152
        Width = 46
        Height = 13
        Caption = 'Banco 16'
      end
      object Label94: TLabel
        Left = 204
        Top = 200
        Width = 46
        Height = 13
        Caption = 'Banco 17'
      end
      object Label95: TLabel
        Left = 204
        Top = 248
        Width = 46
        Height = 13
        Caption = 'Banco 18'
      end
      object Label96: TLabel
        Left = 120
        Top = 248
        Width = 39
        Height = 13
        Caption = 'Valor 18'
        FocusControl = edtVencto18
      end
      object Label97: TLabel
        Left = 120
        Top = 200
        Width = 39
        Height = 13
        Caption = 'Valor 17'
        FocusControl = edtVencto17
      end
      object Label98: TLabel
        Left = 120
        Top = 152
        Width = 39
        Height = 13
        Caption = 'Valor 16'
        FocusControl = edtVencto16
      end
      object Label99: TLabel
        Left = 120
        Top = 104
        Width = 39
        Height = 13
        Caption = 'Valor 15'
        FocusControl = edtVencto15
      end
      object Label100: TLabel
        Left = 120
        Top = 56
        Width = 39
        Height = 13
        Caption = 'Valor 14'
        FocusControl = edtVencto14
      end
      object Label101: TLabel
        Left = 8
        Top = 56
        Width = 49
        Height = 13
        Caption = 'Vencto 14'
        FocusControl = edtVencto14
      end
      object Label102: TLabel
        Left = 8
        Top = 104
        Width = 49
        Height = 13
        Caption = 'Vencto 15'
        FocusControl = edtVencto15
      end
      object Label103: TLabel
        Left = 8
        Top = 152
        Width = 49
        Height = 13
        Caption = 'Vencto 16'
        FocusControl = edtVencto16
      end
      object Label104: TLabel
        Left = 8
        Top = 200
        Width = 49
        Height = 13
        Caption = 'Vencto 17'
        FocusControl = edtVencto17
      end
      object Label105: TLabel
        Left = 8
        Top = 248
        Width = 49
        Height = 13
        Caption = 'Vencto 18'
        FocusControl = edtVencto18
      end
      object edtVencto13: TDateEdit
        Left = 8
        Top = 24
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 0
      end
      object edtValor13: TCurrencyEdit
        Left = 120
        Top = 24
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 1
      end
      object edtBanco13: TDBLookupComboBox
        Left = 204
        Top = 24
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 2
      end
      object edtLocalizacao13: TDBLookupComboBox
        Left = 283
        Top = 24
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 3
      end
      object edtVencto19: TDateEdit
        Left = 366
        Top = 24
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 4
      end
      object edtValor19: TCurrencyEdit
        Left = 478
        Top = 24
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 5
      end
      object edtBanco19: TDBLookupComboBox
        Left = 562
        Top = 24
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 6
      end
      object edtLocalizacao19: TDBLookupComboBox
        Left = 641
        Top = 24
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 7
      end
      object edtLocalizacao20: TDBLookupComboBox
        Left = 640
        Top = 72
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 8
      end
      object edtLocalizacao21: TDBLookupComboBox
        Left = 640
        Top = 120
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 9
      end
      object edtLocalizacao22: TDBLookupComboBox
        Left = 640
        Top = 168
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 10
      end
      object edtLocalizacao23: TDBLookupComboBox
        Left = 640
        Top = 216
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 11
      end
      object edtLocalizacao24: TDBLookupComboBox
        Left = 640
        Top = 264
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 12
      end
      object edtBanco24: TDBLookupComboBox
        Left = 562
        Top = 264
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 13
      end
      object edtBanco23: TDBLookupComboBox
        Left = 562
        Top = 216
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 14
      end
      object edtBanco22: TDBLookupComboBox
        Left = 562
        Top = 168
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 15
      end
      object edtBanco21: TDBLookupComboBox
        Left = 562
        Top = 120
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 16
      end
      object edtBanco20: TDBLookupComboBox
        Left = 562
        Top = 72
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 17
      end
      object edtValor24: TCurrencyEdit
        Left = 478
        Top = 264
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 18
      end
      object edtValor23: TCurrencyEdit
        Left = 478
        Top = 216
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 19
      end
      object edtValor22: TCurrencyEdit
        Left = 478
        Top = 168
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 20
      end
      object edtValor21: TCurrencyEdit
        Left = 478
        Top = 120
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 21
      end
      object edtValor20: TCurrencyEdit
        Left = 478
        Top = 72
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 22
      end
      object edtVencto20: TDateEdit
        Left = 366
        Top = 72
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 23
      end
      object edtVencto21: TDateEdit
        Left = 366
        Top = 120
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 24
      end
      object edtVencto22: TDateEdit
        Left = 366
        Top = 168
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 25
      end
      object edtVencto23: TDateEdit
        Left = 366
        Top = 216
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 26
      end
      object edtVencto24: TDateEdit
        Left = 366
        Top = 264
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 27
      end
      object edtLocalizacao18: TDBLookupComboBox
        Left = 283
        Top = 264
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 28
      end
      object edtLocalizacao17: TDBLookupComboBox
        Left = 283
        Top = 216
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 29
      end
      object edtLocalizacao16: TDBLookupComboBox
        Left = 283
        Top = 168
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 30
      end
      object edtLocalizacao15: TDBLookupComboBox
        Left = 283
        Top = 120
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 31
      end
      object edtLocalizacao14: TDBLookupComboBox
        Left = 283
        Top = 72
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 32
      end
      object edtBanco14: TDBLookupComboBox
        Left = 204
        Top = 72
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 33
      end
      object edtBanco15: TDBLookupComboBox
        Left = 204
        Top = 120
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 34
      end
      object edtBanco16: TDBLookupComboBox
        Left = 204
        Top = 168
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 35
      end
      object edtBanco17: TDBLookupComboBox
        Left = 204
        Top = 216
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 36
      end
      object edtBanco18: TDBLookupComboBox
        Left = 204
        Top = 264
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 37
      end
      object edtValor18: TCurrencyEdit
        Left = 120
        Top = 264
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 38
      end
      object edtValor17: TCurrencyEdit
        Left = 120
        Top = 216
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 39
      end
      object edtValor16: TCurrencyEdit
        Left = 120
        Top = 168
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 40
      end
      object edtValor15: TCurrencyEdit
        Left = 120
        Top = 120
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 41
      end
      object edtValor14: TCurrencyEdit
        Left = 120
        Top = 72
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 42
      end
      object edtVencto14: TDateEdit
        Left = 8
        Top = 72
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 43
      end
      object edtVencto15: TDateEdit
        Left = 8
        Top = 120
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 44
      end
      object edtVencto16: TDateEdit
        Left = 8
        Top = 168
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 45
      end
      object edtVencto17: TDateEdit
        Left = 8
        Top = 216
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 46
      end
      object edtVencto18: TDateEdit
        Left = 8
        Top = 264
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 47
      end
    end
    object tbsVenctos25_36: TTabSheet
      Caption = 'Venctos 25 - 36'
      ImageIndex = 3
      object Label106: TLabel
        Left = 8
        Top = 8
        Width = 49
        Height = 13
        Caption = 'Vencto 25'
        FocusControl = edtVencto25
      end
      object Label107: TLabel
        Left = 120
        Top = 8
        Width = 39
        Height = 13
        Caption = 'Valor 25'
        FocusControl = edtVencto25
      end
      object Label108: TLabel
        Left = 204
        Top = 8
        Width = 46
        Height = 13
        Caption = 'Banco 25'
      end
      object Label109: TLabel
        Left = 283
        Top = 8
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 25'
      end
      object Bevel3: TBevel
        Left = 360
        Top = 4
        Width = 9
        Height = 286
        Shape = bsLeftLine
      end
      object Label110: TLabel
        Left = 366
        Top = 8
        Width = 49
        Height = 13
        Caption = 'Vencto 31'
        FocusControl = edtVencto31
      end
      object Label111: TLabel
        Left = 478
        Top = 8
        Width = 39
        Height = 13
        Caption = 'Valor 31'
        FocusControl = edtVencto31
      end
      object Label112: TLabel
        Left = 562
        Top = 8
        Width = 46
        Height = 13
        Caption = 'Banco 31'
      end
      object Label113: TLabel
        Left = 641
        Top = 8
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 31'
      end
      object Label114: TLabel
        Left = 641
        Top = 56
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 32'
      end
      object Label115: TLabel
        Left = 641
        Top = 104
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 33'
      end
      object Label116: TLabel
        Left = 641
        Top = 152
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 34'
      end
      object Label117: TLabel
        Left = 641
        Top = 200
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 35'
      end
      object Label118: TLabel
        Left = 641
        Top = 248
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 36'
      end
      object Label119: TLabel
        Left = 562
        Top = 248
        Width = 46
        Height = 13
        Caption = 'Banco 36'
      end
      object Label120: TLabel
        Left = 562
        Top = 200
        Width = 46
        Height = 13
        Caption = 'Banco 35'
      end
      object Label121: TLabel
        Left = 562
        Top = 152
        Width = 46
        Height = 13
        Caption = 'Banco 34'
      end
      object Label122: TLabel
        Left = 562
        Top = 104
        Width = 46
        Height = 13
        Caption = 'Banco 33'
      end
      object Label123: TLabel
        Left = 562
        Top = 56
        Width = 46
        Height = 13
        Caption = 'Banco 32'
      end
      object Label124: TLabel
        Left = 478
        Top = 56
        Width = 39
        Height = 13
        Caption = 'Valor 32'
        FocusControl = edtVencto32
      end
      object Label125: TLabel
        Left = 478
        Top = 104
        Width = 39
        Height = 13
        Caption = 'Valor 33'
        FocusControl = edtVencto33
      end
      object Label126: TLabel
        Left = 478
        Top = 152
        Width = 39
        Height = 13
        Caption = 'Valor 34'
        FocusControl = edtVencto34
      end
      object Label127: TLabel
        Left = 478
        Top = 200
        Width = 39
        Height = 13
        Caption = 'Valor 35'
        FocusControl = edtVencto35
      end
      object Label128: TLabel
        Left = 478
        Top = 248
        Width = 39
        Height = 13
        Caption = 'Valor 36'
        FocusControl = edtVencto36
      end
      object Label129: TLabel
        Left = 366
        Top = 248
        Width = 49
        Height = 13
        Caption = 'Vencto 36'
        FocusControl = edtVencto36
      end
      object Label130: TLabel
        Left = 366
        Top = 200
        Width = 49
        Height = 13
        Caption = 'Vencto 35'
        FocusControl = edtVencto35
      end
      object Label131: TLabel
        Left = 366
        Top = 152
        Width = 49
        Height = 13
        Caption = 'Vencto 34'
        FocusControl = edtVencto34
      end
      object Label132: TLabel
        Left = 366
        Top = 104
        Width = 49
        Height = 13
        Caption = 'Vencto 33'
        FocusControl = edtVencto33
      end
      object Label133: TLabel
        Left = 366
        Top = 56
        Width = 49
        Height = 13
        Caption = 'Vencto 32'
        FocusControl = edtVencto32
      end
      object Label134: TLabel
        Left = 283
        Top = 56
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 26'
      end
      object Label135: TLabel
        Left = 283
        Top = 104
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 27'
      end
      object Label136: TLabel
        Left = 283
        Top = 152
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 28'
      end
      object Label137: TLabel
        Left = 283
        Top = 200
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 29'
      end
      object Label138: TLabel
        Left = 283
        Top = 248
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 30'
      end
      object Label139: TLabel
        Left = 204
        Top = 248
        Width = 46
        Height = 13
        Caption = 'Banco 30'
      end
      object Label140: TLabel
        Left = 204
        Top = 200
        Width = 46
        Height = 13
        Caption = 'Banco 29'
      end
      object Label141: TLabel
        Left = 204
        Top = 152
        Width = 46
        Height = 13
        Caption = 'Banco 28'
      end
      object Label142: TLabel
        Left = 204
        Top = 104
        Width = 46
        Height = 13
        Caption = 'Banco 27'
      end
      object Label143: TLabel
        Left = 204
        Top = 56
        Width = 46
        Height = 13
        Caption = 'Banco 26'
      end
      object Label144: TLabel
        Left = 120
        Top = 56
        Width = 39
        Height = 13
        Caption = 'Valor 26'
        FocusControl = edtVencto26
      end
      object Label145: TLabel
        Left = 120
        Top = 104
        Width = 39
        Height = 13
        Caption = 'Valor 27'
        FocusControl = edtVencto27
      end
      object Label146: TLabel
        Left = 120
        Top = 152
        Width = 39
        Height = 13
        Caption = 'Valor 28'
        FocusControl = edtVencto28
      end
      object Label147: TLabel
        Left = 120
        Top = 200
        Width = 39
        Height = 13
        Caption = 'Valor 29'
        FocusControl = edtVencto29
      end
      object Label148: TLabel
        Left = 120
        Top = 248
        Width = 39
        Height = 13
        Caption = 'Valor 30'
        FocusControl = edtVencto30
      end
      object Label149: TLabel
        Left = 8
        Top = 248
        Width = 49
        Height = 13
        Caption = 'Vencto 30'
        FocusControl = edtVencto30
      end
      object Label150: TLabel
        Left = 8
        Top = 200
        Width = 49
        Height = 13
        Caption = 'Vencto 29'
        FocusControl = edtVencto29
      end
      object Label151: TLabel
        Left = 8
        Top = 152
        Width = 49
        Height = 13
        Caption = 'Vencto 28'
        FocusControl = edtVencto28
      end
      object Label152: TLabel
        Left = 8
        Top = 104
        Width = 49
        Height = 13
        Caption = 'Vencto 27'
        FocusControl = edtVencto27
      end
      object Label153: TLabel
        Left = 8
        Top = 56
        Width = 49
        Height = 13
        Caption = 'Vencto 26'
        FocusControl = edtVencto26
      end
      object edtVencto25: TDateEdit
        Left = 8
        Top = 24
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 0
      end
      object edtValor25: TCurrencyEdit
        Left = 120
        Top = 24
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 1
      end
      object edtBanco25: TDBLookupComboBox
        Left = 204
        Top = 24
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 2
      end
      object edtLocalizacao25: TDBLookupComboBox
        Left = 283
        Top = 24
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 3
      end
      object edtVencto31: TDateEdit
        Left = 366
        Top = 24
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 4
      end
      object edtValor31: TCurrencyEdit
        Left = 478
        Top = 24
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 5
      end
      object edtBanco31: TDBLookupComboBox
        Left = 562
        Top = 24
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 6
      end
      object edtLocalizacao31: TDBLookupComboBox
        Left = 641
        Top = 24
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 7
      end
      object edtLocalizacao32: TDBLookupComboBox
        Left = 640
        Top = 72
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 8
      end
      object edtLocalizacao33: TDBLookupComboBox
        Left = 640
        Top = 120
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 9
      end
      object edtLocalizacao34: TDBLookupComboBox
        Left = 640
        Top = 168
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 10
      end
      object edtLocalizacao35: TDBLookupComboBox
        Left = 640
        Top = 216
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 11
      end
      object edtLocalizacao36: TDBLookupComboBox
        Left = 640
        Top = 264
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 12
      end
      object edtBanco36: TDBLookupComboBox
        Left = 562
        Top = 264
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 13
      end
      object edtBanco35: TDBLookupComboBox
        Left = 562
        Top = 216
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 14
      end
      object edtBanco34: TDBLookupComboBox
        Left = 562
        Top = 168
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 15
      end
      object edtBanco33: TDBLookupComboBox
        Left = 562
        Top = 120
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 16
      end
      object edtBanco32: TDBLookupComboBox
        Left = 562
        Top = 72
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 17
      end
      object edtValor32: TCurrencyEdit
        Left = 478
        Top = 72
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 18
      end
      object edtValor33: TCurrencyEdit
        Left = 478
        Top = 120
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 19
      end
      object edtValor34: TCurrencyEdit
        Left = 478
        Top = 168
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 20
      end
      object edtValor35: TCurrencyEdit
        Left = 478
        Top = 216
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 21
      end
      object edtValor36: TCurrencyEdit
        Left = 478
        Top = 264
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 22
      end
      object edtVencto36: TDateEdit
        Left = 366
        Top = 264
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 23
      end
      object edtVencto35: TDateEdit
        Left = 366
        Top = 216
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 24
      end
      object edtVencto34: TDateEdit
        Left = 366
        Top = 168
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 25
      end
      object edtVencto33: TDateEdit
        Left = 366
        Top = 120
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 26
      end
      object edtVencto32: TDateEdit
        Left = 366
        Top = 72
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 27
      end
      object edtLocalizacao26: TDBLookupComboBox
        Left = 283
        Top = 72
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 28
      end
      object edtLocalizacao27: TDBLookupComboBox
        Left = 283
        Top = 120
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 29
      end
      object edtLocalizacao28: TDBLookupComboBox
        Left = 283
        Top = 168
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 30
      end
      object edtLocalizacao29: TDBLookupComboBox
        Left = 283
        Top = 216
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 31
      end
      object edtLocalizacao30: TDBLookupComboBox
        Left = 283
        Top = 264
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 32
      end
      object edtBanco30: TDBLookupComboBox
        Left = 204
        Top = 264
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 33
      end
      object edtBanco29: TDBLookupComboBox
        Left = 204
        Top = 216
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 34
      end
      object edtBanco28: TDBLookupComboBox
        Left = 204
        Top = 168
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 35
      end
      object edtBanco27: TDBLookupComboBox
        Left = 204
        Top = 120
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 36
      end
      object edtBanco26: TDBLookupComboBox
        Left = 204
        Top = 72
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 37
      end
      object edtValor26: TCurrencyEdit
        Left = 120
        Top = 72
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 38
      end
      object edtValor27: TCurrencyEdit
        Left = 120
        Top = 120
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 39
      end
      object edtValor28: TCurrencyEdit
        Left = 120
        Top = 168
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 40
      end
      object edtValor29: TCurrencyEdit
        Left = 120
        Top = 216
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 41
      end
      object edtValor30: TCurrencyEdit
        Left = 120
        Top = 264
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 42
      end
      object edtVencto30: TDateEdit
        Left = 8
        Top = 264
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 43
      end
      object edtVencto29: TDateEdit
        Left = 8
        Top = 216
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 44
      end
      object edtVencto28: TDateEdit
        Left = 8
        Top = 168
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 45
      end
      object edtVencto27: TDateEdit
        Left = 8
        Top = 120
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 46
      end
      object edtVencto26: TDateEdit
        Left = 8
        Top = 72
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 47
      end
    end
    object tbsVenctos36_48: TTabSheet
      Caption = 'Venctos 37 - 48'
      ImageIndex = 4
      object Label154: TLabel
        Left = 8
        Top = 8
        Width = 49
        Height = 13
        Caption = 'Vencto 37'
        FocusControl = edtVencto37
      end
      object Label155: TLabel
        Left = 120
        Top = 8
        Width = 39
        Height = 13
        Caption = 'Valor 37'
        FocusControl = edtVencto37
      end
      object Label156: TLabel
        Left = 204
        Top = 8
        Width = 46
        Height = 13
        Caption = 'Banco 37'
      end
      object Label157: TLabel
        Left = 283
        Top = 8
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 37'
      end
      object Label158: TLabel
        Left = 366
        Top = 8
        Width = 49
        Height = 13
        Caption = 'Vencto 43'
        FocusControl = edtVencto43
      end
      object Label159: TLabel
        Left = 478
        Top = 8
        Width = 39
        Height = 13
        Caption = 'Valor 43'
        FocusControl = edtVencto43
      end
      object Label160: TLabel
        Left = 562
        Top = 8
        Width = 46
        Height = 13
        Caption = 'Banco 43'
      end
      object Label161: TLabel
        Left = 641
        Top = 8
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 43'
      end
      object Label162: TLabel
        Left = 641
        Top = 56
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 44'
      end
      object Label163: TLabel
        Left = 641
        Top = 104
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 45'
      end
      object Label164: TLabel
        Left = 641
        Top = 152
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 46'
      end
      object Label165: TLabel
        Left = 641
        Top = 200
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 47'
      end
      object Label166: TLabel
        Left = 641
        Top = 248
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 48'
      end
      object Label167: TLabel
        Left = 562
        Top = 248
        Width = 46
        Height = 13
        Caption = 'Banco 48'
      end
      object Label168: TLabel
        Left = 562
        Top = 200
        Width = 46
        Height = 13
        Caption = 'Banco 47'
      end
      object Label169: TLabel
        Left = 562
        Top = 152
        Width = 46
        Height = 13
        Caption = 'Banco 46'
      end
      object Label170: TLabel
        Left = 562
        Top = 104
        Width = 46
        Height = 13
        Caption = 'Banco 45'
      end
      object Label171: TLabel
        Left = 562
        Top = 56
        Width = 46
        Height = 13
        Caption = 'Banco 44'
      end
      object Label172: TLabel
        Left = 478
        Top = 56
        Width = 39
        Height = 13
        Caption = 'Valor 44'
        FocusControl = edtVencto44
      end
      object Label173: TLabel
        Left = 478
        Top = 104
        Width = 39
        Height = 13
        Caption = 'Valor 45'
        FocusControl = edtVencto45
      end
      object Label174: TLabel
        Left = 478
        Top = 152
        Width = 39
        Height = 13
        Caption = 'Valor 46'
        FocusControl = edtVencto46
      end
      object Label175: TLabel
        Left = 478
        Top = 200
        Width = 39
        Height = 13
        Caption = 'Valor 47'
        FocusControl = edtVencto47
      end
      object Label176: TLabel
        Left = 478
        Top = 248
        Width = 39
        Height = 13
        Caption = 'Valor 48'
        FocusControl = edtVencto48
      end
      object Label177: TLabel
        Left = 366
        Top = 248
        Width = 49
        Height = 13
        Caption = 'Vencto 48'
        FocusControl = edtVencto48
      end
      object Label178: TLabel
        Left = 366
        Top = 200
        Width = 49
        Height = 13
        Caption = 'Vencto 47'
        FocusControl = edtVencto47
      end
      object Label179: TLabel
        Left = 366
        Top = 152
        Width = 49
        Height = 13
        Caption = 'Vencto 46'
        FocusControl = edtVencto46
      end
      object Label180: TLabel
        Left = 366
        Top = 104
        Width = 49
        Height = 13
        Caption = 'Vencto 45'
        FocusControl = edtVencto45
      end
      object Label181: TLabel
        Left = 366
        Top = 56
        Width = 49
        Height = 13
        Caption = 'Vencto 44'
        FocusControl = edtVencto44
      end
      object Label182: TLabel
        Left = 283
        Top = 56
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 38'
      end
      object Label183: TLabel
        Left = 204
        Top = 56
        Width = 46
        Height = 13
        Caption = 'Banco 38'
      end
      object Label184: TLabel
        Left = 120
        Top = 56
        Width = 39
        Height = 13
        Caption = 'Valor 38'
        FocusControl = edtVencto38
      end
      object Label185: TLabel
        Left = 8
        Top = 56
        Width = 49
        Height = 13
        Caption = 'Vencto 38'
        FocusControl = edtVencto38
      end
      object Label186: TLabel
        Left = 8
        Top = 104
        Width = 49
        Height = 13
        Caption = 'Vencto 39'
        FocusControl = edtVencto39
      end
      object Label187: TLabel
        Left = 8
        Top = 152
        Width = 49
        Height = 13
        Caption = 'Vencto 40'
        FocusControl = edtVencto40
      end
      object Label188: TLabel
        Left = 8
        Top = 200
        Width = 49
        Height = 13
        Caption = 'Vencto 41'
        FocusControl = edtVencto41
      end
      object Label189: TLabel
        Left = 8
        Top = 248
        Width = 49
        Height = 13
        Caption = 'Vencto 42'
        FocusControl = edtVencto42
      end
      object Label190: TLabel
        Left = 120
        Top = 248
        Width = 39
        Height = 13
        Caption = 'Valor 42'
        FocusControl = edtVencto42
      end
      object Label191: TLabel
        Left = 120
        Top = 200
        Width = 39
        Height = 13
        Caption = 'Valor 41'
        FocusControl = edtVencto41
      end
      object Label192: TLabel
        Left = 120
        Top = 152
        Width = 39
        Height = 13
        Caption = 'Valor 40'
        FocusControl = edtVencto40
      end
      object Label193: TLabel
        Left = 120
        Top = 104
        Width = 39
        Height = 13
        Caption = 'Valor 39'
        FocusControl = edtVencto39
      end
      object Label194: TLabel
        Left = 204
        Top = 104
        Width = 46
        Height = 13
        Caption = 'Banco 39'
      end
      object Label195: TLabel
        Left = 204
        Top = 152
        Width = 46
        Height = 13
        Caption = 'Banco 40'
      end
      object Label196: TLabel
        Left = 204
        Top = 200
        Width = 46
        Height = 13
        Caption = 'Banco 41'
      end
      object Label197: TLabel
        Left = 204
        Top = 248
        Width = 46
        Height = 13
        Caption = 'Banco 42'
      end
      object Label198: TLabel
        Left = 283
        Top = 248
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 42'
      end
      object Label199: TLabel
        Left = 283
        Top = 200
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 41'
      end
      object Label200: TLabel
        Left = 283
        Top = 152
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 40'
      end
      object Label201: TLabel
        Left = 283
        Top = 104
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 39'
      end
      object Bevel4: TBevel
        Left = 360
        Top = 4
        Width = 9
        Height = 286
        Shape = bsLeftLine
      end
      object edtVencto37: TDateEdit
        Left = 8
        Top = 24
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 0
      end
      object edtValor37: TCurrencyEdit
        Left = 120
        Top = 24
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 1
      end
      object edtBanco37: TDBLookupComboBox
        Left = 204
        Top = 24
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 2
      end
      object edtLocalizacao37: TDBLookupComboBox
        Left = 283
        Top = 24
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 3
      end
      object edtVencto43: TDateEdit
        Left = 366
        Top = 24
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 4
      end
      object edtValor43: TCurrencyEdit
        Left = 478
        Top = 24
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 5
      end
      object edtBanco43: TDBLookupComboBox
        Left = 562
        Top = 24
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 6
      end
      object edtLocalizacao43: TDBLookupComboBox
        Left = 641
        Top = 24
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 7
      end
      object edtLocalizacao44: TDBLookupComboBox
        Left = 640
        Top = 72
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 8
      end
      object edtLocalizacao45: TDBLookupComboBox
        Left = 640
        Top = 120
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 9
      end
      object edtLocalizacao46: TDBLookupComboBox
        Left = 640
        Top = 168
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 10
      end
      object edtLocalizacao47: TDBLookupComboBox
        Left = 640
        Top = 216
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 11
      end
      object edtLocalizacao48: TDBLookupComboBox
        Left = 640
        Top = 264
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 12
      end
      object edtBanco48: TDBLookupComboBox
        Left = 562
        Top = 264
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 13
      end
      object edtBanco47: TDBLookupComboBox
        Left = 562
        Top = 216
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 14
      end
      object edtBanco46: TDBLookupComboBox
        Left = 562
        Top = 168
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 15
      end
      object edtBanco45: TDBLookupComboBox
        Left = 562
        Top = 120
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 16
      end
      object edtBanco44: TDBLookupComboBox
        Left = 562
        Top = 72
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 17
      end
      object edtValor44: TCurrencyEdit
        Left = 478
        Top = 72
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 18
      end
      object edtValor45: TCurrencyEdit
        Left = 478
        Top = 120
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 19
      end
      object edtValor46: TCurrencyEdit
        Left = 478
        Top = 168
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 20
      end
      object edtValor47: TCurrencyEdit
        Left = 478
        Top = 216
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 21
      end
      object edtValor48: TCurrencyEdit
        Left = 478
        Top = 264
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 22
      end
      object edtVencto48: TDateEdit
        Left = 366
        Top = 264
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 23
      end
      object edtVencto47: TDateEdit
        Left = 366
        Top = 216
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 24
      end
      object edtVencto46: TDateEdit
        Left = 366
        Top = 168
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 25
      end
      object edtVencto45: TDateEdit
        Left = 366
        Top = 120
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 26
      end
      object edtVencto44: TDateEdit
        Left = 366
        Top = 72
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 27
      end
      object edtLocalizacao38: TDBLookupComboBox
        Left = 283
        Top = 72
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 28
      end
      object edtBanco38: TDBLookupComboBox
        Left = 204
        Top = 72
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 29
      end
      object edtValor38: TCurrencyEdit
        Left = 120
        Top = 72
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 30
      end
      object edtVencto38: TDateEdit
        Left = 8
        Top = 72
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 31
      end
      object edtVencto39: TDateEdit
        Left = 8
        Top = 120
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 32
      end
      object edtVencto40: TDateEdit
        Left = 8
        Top = 168
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 33
      end
      object edtVencto41: TDateEdit
        Left = 8
        Top = 216
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 34
      end
      object edtVencto42: TDateEdit
        Left = 8
        Top = 264
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 35
      end
      object edtValor42: TCurrencyEdit
        Left = 120
        Top = 264
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 36
      end
      object edtValor41: TCurrencyEdit
        Left = 120
        Top = 216
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 37
      end
      object edtValor40: TCurrencyEdit
        Left = 120
        Top = 168
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 38
      end
      object edtValor39: TCurrencyEdit
        Left = 120
        Top = 120
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 39
      end
      object edtBanco39: TDBLookupComboBox
        Left = 204
        Top = 120
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 40
      end
      object edtBanco40: TDBLookupComboBox
        Left = 204
        Top = 168
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 41
      end
      object edtBanco41: TDBLookupComboBox
        Left = 204
        Top = 216
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 42
      end
      object edtBanco42: TDBLookupComboBox
        Left = 204
        Top = 264
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 43
      end
      object edtLocalizacao42: TDBLookupComboBox
        Left = 283
        Top = 264
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 44
      end
      object edtLocalizacao41: TDBLookupComboBox
        Left = 283
        Top = 216
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 45
      end
      object edtLocalizacao40: TDBLookupComboBox
        Left = 283
        Top = 168
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 46
      end
      object edtLocalizacao39: TDBLookupComboBox
        Left = 283
        Top = 120
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 47
      end
    end
    object tbsVenctos49_60: TTabSheet
      Caption = 'Venctos 49 - 60'
      ImageIndex = 5
      object Label202: TLabel
        Left = 8
        Top = 8
        Width = 49
        Height = 13
        Caption = 'Vencto 49'
        FocusControl = edtVencto49
      end
      object Label203: TLabel
        Left = 8
        Top = 56
        Width = 49
        Height = 13
        Caption = 'Vencto 50'
        FocusControl = edtVencto50
      end
      object Label204: TLabel
        Left = 8
        Top = 104
        Width = 49
        Height = 13
        Caption = 'Vencto 51'
        FocusControl = edtVencto51
      end
      object Label205: TLabel
        Left = 8
        Top = 152
        Width = 49
        Height = 13
        Caption = 'Vencto 52'
        FocusControl = edtVencto52
      end
      object Label206: TLabel
        Left = 8
        Top = 200
        Width = 49
        Height = 13
        Caption = 'Vencto 53'
        FocusControl = edtVencto53
      end
      object Label207: TLabel
        Left = 8
        Top = 248
        Width = 49
        Height = 13
        Caption = 'Vencto 54'
        FocusControl = edtVencto54
      end
      object Label208: TLabel
        Left = 120
        Top = 248
        Width = 39
        Height = 13
        Caption = 'Valor 54'
        FocusControl = edtVencto54
      end
      object Label209: TLabel
        Left = 120
        Top = 200
        Width = 39
        Height = 13
        Caption = 'Valor 53'
        FocusControl = edtVencto53
      end
      object Label210: TLabel
        Left = 120
        Top = 152
        Width = 39
        Height = 13
        Caption = 'Valor 52'
        FocusControl = edtVencto52
      end
      object Label211: TLabel
        Left = 120
        Top = 104
        Width = 39
        Height = 13
        Caption = 'Valor 51'
        FocusControl = edtVencto51
      end
      object Label212: TLabel
        Left = 120
        Top = 56
        Width = 39
        Height = 13
        Caption = 'Valor 50'
        FocusControl = edtVencto50
      end
      object Label213: TLabel
        Left = 120
        Top = 8
        Width = 39
        Height = 13
        Caption = 'Valor 49'
        FocusControl = edtVencto49
      end
      object Label214: TLabel
        Left = 204
        Top = 8
        Width = 46
        Height = 13
        Caption = 'Banco 49'
      end
      object Label215: TLabel
        Left = 283
        Top = 8
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 49'
      end
      object Label216: TLabel
        Left = 204
        Top = 56
        Width = 46
        Height = 13
        Caption = 'Banco 50'
      end
      object Label217: TLabel
        Left = 283
        Top = 56
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 50'
      end
      object Label218: TLabel
        Left = 283
        Top = 104
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 51'
      end
      object Label219: TLabel
        Left = 204
        Top = 104
        Width = 46
        Height = 13
        Caption = 'Banco 51'
      end
      object Label220: TLabel
        Left = 204
        Top = 152
        Width = 46
        Height = 13
        Caption = 'Banco 52'
      end
      object Label221: TLabel
        Left = 204
        Top = 200
        Width = 46
        Height = 13
        Caption = 'Banco 53'
      end
      object Label222: TLabel
        Left = 204
        Top = 248
        Width = 46
        Height = 13
        Caption = 'Banco 54'
      end
      object Label223: TLabel
        Left = 283
        Top = 248
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 54'
      end
      object Label224: TLabel
        Left = 283
        Top = 200
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 53'
      end
      object Label225: TLabel
        Left = 283
        Top = 152
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 52'
      end
      object Bevel5: TBevel
        Left = 360
        Top = 4
        Width = 9
        Height = 286
        Shape = bsLeftLine
      end
      object Label226: TLabel
        Left = 366
        Top = 248
        Width = 49
        Height = 13
        Caption = 'Vencto 60'
        FocusControl = edtVencto60
      end
      object Label227: TLabel
        Left = 366
        Top = 200
        Width = 49
        Height = 13
        Caption = 'Vencto 59'
        FocusControl = edtVencto59
      end
      object Label228: TLabel
        Left = 366
        Top = 152
        Width = 49
        Height = 13
        Caption = 'Vencto 58'
        FocusControl = edtVencto58
      end
      object Label229: TLabel
        Left = 366
        Top = 104
        Width = 49
        Height = 13
        Caption = 'Vencto 57'
        FocusControl = edtVencto57
      end
      object Label230: TLabel
        Left = 366
        Top = 56
        Width = 49
        Height = 13
        Caption = 'Vencto 56'
        FocusControl = edtVencto56
      end
      object Label231: TLabel
        Left = 366
        Top = 8
        Width = 49
        Height = 13
        Caption = 'Vencto 55'
        FocusControl = edtVencto55
      end
      object Label232: TLabel
        Left = 478
        Top = 8
        Width = 39
        Height = 13
        Caption = 'Valor 55'
        FocusControl = edtVencto55
      end
      object Label233: TLabel
        Left = 562
        Top = 8
        Width = 46
        Height = 13
        Caption = 'Banco 55'
      end
      object Label234: TLabel
        Left = 641
        Top = 8
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 55'
      end
      object Label235: TLabel
        Left = 641
        Top = 56
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 56'
      end
      object Label236: TLabel
        Left = 562
        Top = 56
        Width = 46
        Height = 13
        Caption = 'Banco 56'
      end
      object Label237: TLabel
        Left = 478
        Top = 56
        Width = 39
        Height = 13
        Caption = 'Valor 56'
        FocusControl = edtVencto56
      end
      object Label238: TLabel
        Left = 478
        Top = 104
        Width = 39
        Height = 13
        Caption = 'Valor 57'
        FocusControl = edtVencto57
      end
      object Label239: TLabel
        Left = 478
        Top = 152
        Width = 39
        Height = 13
        Caption = 'Valor 58'
        FocusControl = edtVencto58
      end
      object Label240: TLabel
        Left = 478
        Top = 200
        Width = 39
        Height = 13
        Caption = 'Valor 59'
        FocusControl = edtVencto59
      end
      object Label241: TLabel
        Left = 478
        Top = 248
        Width = 39
        Height = 13
        Caption = 'Valor 60'
        FocusControl = edtVencto60
      end
      object Label242: TLabel
        Left = 562
        Top = 248
        Width = 46
        Height = 13
        Caption = 'Banco 60'
      end
      object Label243: TLabel
        Left = 641
        Top = 248
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 60'
      end
      object Label244: TLabel
        Left = 641
        Top = 200
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 59'
      end
      object Label245: TLabel
        Left = 562
        Top = 200
        Width = 46
        Height = 13
        Caption = 'Banco 59'
      end
      object Label246: TLabel
        Left = 562
        Top = 152
        Width = 46
        Height = 13
        Caption = 'Banco 58'
      end
      object Label247: TLabel
        Left = 641
        Top = 152
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 58'
      end
      object Label248: TLabel
        Left = 641
        Top = 104
        Width = 72
        Height = 13
        Caption = 'Localiza'#231#227'o 57'
      end
      object Label249: TLabel
        Left = 562
        Top = 104
        Width = 46
        Height = 13
        Caption = 'Banco 57'
      end
      object edtVencto49: TDateEdit
        Left = 8
        Top = 24
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 0
      end
      object edtVencto50: TDateEdit
        Left = 8
        Top = 72
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 1
      end
      object edtVencto51: TDateEdit
        Left = 8
        Top = 120
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 2
      end
      object edtVencto52: TDateEdit
        Left = 8
        Top = 168
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 3
      end
      object edtVencto53: TDateEdit
        Left = 8
        Top = 216
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 4
      end
      object edtVencto54: TDateEdit
        Left = 8
        Top = 264
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 5
      end
      object edtValor54: TCurrencyEdit
        Left = 120
        Top = 264
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 6
      end
      object edtValor53: TCurrencyEdit
        Left = 120
        Top = 216
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 7
      end
      object edtValor52: TCurrencyEdit
        Left = 120
        Top = 168
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 8
      end
      object edtValor51: TCurrencyEdit
        Left = 120
        Top = 120
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 9
      end
      object edtValor50: TCurrencyEdit
        Left = 120
        Top = 72
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 10
      end
      object edtValor49: TCurrencyEdit
        Left = 120
        Top = 24
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 11
      end
      object edtBanco49: TDBLookupComboBox
        Left = 204
        Top = 24
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 12
      end
      object edtLocalizacao49: TDBLookupComboBox
        Left = 283
        Top = 24
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 13
      end
      object edtBanco50: TDBLookupComboBox
        Left = 204
        Top = 72
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 14
      end
      object edtLocalizacao50: TDBLookupComboBox
        Left = 283
        Top = 72
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 15
      end
      object edtLocalizacao51: TDBLookupComboBox
        Left = 283
        Top = 120
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 16
      end
      object edtBanco51: TDBLookupComboBox
        Left = 204
        Top = 120
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 17
      end
      object edtBanco52: TDBLookupComboBox
        Left = 204
        Top = 168
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 18
      end
      object edtBanco53: TDBLookupComboBox
        Left = 204
        Top = 216
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 19
      end
      object edtBanco54: TDBLookupComboBox
        Left = 204
        Top = 264
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 20
      end
      object edtLocalizacao54: TDBLookupComboBox
        Left = 283
        Top = 264
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 21
      end
      object edtLocalizacao53: TDBLookupComboBox
        Left = 283
        Top = 216
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 22
      end
      object edtLocalizacao52: TDBLookupComboBox
        Left = 283
        Top = 168
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 23
      end
      object edtVencto60: TDateEdit
        Left = 366
        Top = 264
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 24
      end
      object edtVencto59: TDateEdit
        Left = 366
        Top = 216
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 25
      end
      object edtVencto58: TDateEdit
        Left = 366
        Top = 168
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 26
      end
      object edtVencto57: TDateEdit
        Left = 366
        Top = 120
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 27
      end
      object edtVencto56: TDateEdit
        Left = 366
        Top = 72
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 28
      end
      object edtVencto55: TDateEdit
        Left = 366
        Top = 24
        Width = 105
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 29
      end
      object edtValor55: TCurrencyEdit
        Left = 478
        Top = 24
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 30
      end
      object edtBanco55: TDBLookupComboBox
        Left = 562
        Top = 24
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 31
      end
      object edtLocalizacao55: TDBLookupComboBox
        Left = 641
        Top = 24
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 32
      end
      object edtLocalizacao56: TDBLookupComboBox
        Left = 640
        Top = 72
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 33
      end
      object edtBanco56: TDBLookupComboBox
        Left = 562
        Top = 72
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 34
      end
      object edtValor56: TCurrencyEdit
        Left = 478
        Top = 72
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 35
      end
      object edtValor57: TCurrencyEdit
        Left = 478
        Top = 120
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 36
      end
      object edtValor58: TCurrencyEdit
        Left = 478
        Top = 168
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 37
      end
      object edtValor59: TCurrencyEdit
        Left = 478
        Top = 216
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 38
      end
      object edtValor60: TCurrencyEdit
        Left = 478
        Top = 264
        Width = 76
        Height = 21
        AutoSize = False
        TabOrder = 39
      end
      object edtBanco60: TDBLookupComboBox
        Left = 562
        Top = 264
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 40
      end
      object edtLocalizacao60: TDBLookupComboBox
        Left = 640
        Top = 264
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 41
      end
      object edtLocalizacao59: TDBLookupComboBox
        Left = 640
        Top = 216
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 42
      end
      object edtBanco59: TDBLookupComboBox
        Left = 562
        Top = 216
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 43
      end
      object edtBanco58: TDBLookupComboBox
        Left = 562
        Top = 168
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 44
      end
      object edtLocalizacao58: TDBLookupComboBox
        Left = 640
        Top = 168
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 45
      end
      object edtLocalizacao57: TDBLookupComboBox
        Left = 640
        Top = 120
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsLocalizacao
        TabOrder = 46
      end
      object edtBanco57: TDBLookupComboBox
        Left = 562
        Top = 120
        Width = 73
        Height = 21
        DropDownWidth = 300
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsBancos
        TabOrder = 47
      end
    end
    object tbsObservacoes: TTabSheet
      Caption = 'Observa'#231#245'es'
      ImageIndex = 1
      object edtObservacao: TMemo
        Left = 8
        Top = 8
        Width = 706
        Height = 280
        TabOrder = 0
      end
    end
  end
  object btnConfirmar: TBitBtn [26]
    Left = 501
    Top = 432
    Width = 116
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 17
    OnClick = btnConfirmarClick
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      0800000000000002000000000000000000000001000000000000FF00FF00307A
      2A0096675E0099695F009E6E6000A16E6000A6726200AB766300B0786400B57D
      64000081000050883C005F924B00D5812700BB806500C0836600C4876700C989
      6700CC8B6800CF8E6800A7B88300EDC68C00EDC99100EFCB9500EECC9900EFCF
      9C00F0CF9F00EFD19F00F0D09E00EDD4A900F0D1A100F0D3A400F1D4A600F2D5
      AA00F2D7AD00E6D8B400F3DAB500F4DAB500F3DCB400F4DDBA00F6E0BF00EFE2
      C200F5E1C100F6E2C500F6E5C700F7E5C900F7E6CE00F8E6CB00F8E7CE00F7E9
      CF00F7E9D100F8E9D000F8EAD400F8EDD700F8EDD900FAEEDC00FAEFE000FAF1
      E200FBF2E500FCF3E700FCF4E700FBF4E900FCF4EA00FCF6EE00FDF8F100FEFB
      F500FEFBF800FEFCFA00FFFEFD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000002040404
      0404040404040404040000001414141414141414141414141400000003282724
      2220201C181717150300000014323229292929232323232314000000042B2B27
      240A2220181817170300000014323232291429232923232314000000052E2B2B
      0A0A0A22201C1817050000001436323214141429232329231400000005352F0A
      010C0A0B22201C1C04000000143636141423142329292323140000000737350A
      292B140A0A1D2020030000001439361432323614142929231400000008383735
      2F2E2B230A0A2220060000001439393636363629141429291400000008383838
      37312F2B2B27242203000000143939393636363232322929140000000F400D0D
      0D0D0D0D0D0D0D2405000000143914141414141414141432140000000F40403E
      383837352F2B2B2704000000143F39393939363636363232140000000F424040
      3E38373735352B2B04000000143F3F3F39393939363632321400000011420D0D
      0D0D0D0D0D0D0D3104000000143F141414141414141414361400000012424242
      42403E3E3737352F04000000143F3F3F3F393F39393639361400000012424242
      4242403E3E38373704000000143F3F3F3F3F393F393939361400000012131213
      1212121312131213120000001414141414141414141414141400000000000000
      0000000000000000000000000000000000000000000000000000}
    NumGlyphs = 2
  end
  object btnFechar: TBitBtn [27]
    Left = 621
    Top = 432
    Width = 116
    Height = 25
    Caption = 'Fechar'
    TabOrder = 18
    OnClick = btnFecharClick
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      08000000000000020000120B0000120B0000000100000000000000000000FFFF
      FF00FF00FF00FCD1D3004E1E1F00C54D4E00C9525300C24F5000D4585900C954
      5500CF575800CB555600D75C5D00D55C5D00D05A5B00CF595A00B74F5200B24D
      4E00B64F5000D55E5F00BD535600D75F6000DD636400C2575A00C6595B00E267
      6800DD656600DA636400E3686900DE666700EB6D6E00E96C6D00F2737400F073
      7400EE727300F7777900D1656600F0757600F6797A00F77A7B00FE7F8000FB7E
      7F00FF818200FC7F8000DA6E6F00FF828300FE818200FF838400E5767700E073
      7400E2757600FF868700FF888900CF6E7000CB6C6D00CC6E7000FE8B8C00EB81
      8200E67E7F009C565700FB9A9C00F8AAAB00F7B5B600FAD3D400A64B4B00A94D
      4D00F8787900D76B6B00CF6E6E00824B4B00FAEBC500FCEFC700FFF2CC00FCFB
      CF00FCFBD100FFFFD300FFFFD400FFFFD500FFFFD700E6FCC700A5D8970050D1
      6F0026B149002AB44D001BBB490023B54A002DC7580042C966000CBC410010BB
      430013C1480013BC450016BD480016BC48001CBF4C001EBC4C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000020202020202
      0245040202020202020202020202020202503B02020202020202020202024545
      4041040202020202020202020202505037503B02020202020202020245451207
      0511044545454545450202025050505050503B50505050505002020245080B09
      061004383C3D3E3E450202025050505050503B3F3F3F3F3F50020202450C0E0F
      0A1404555A5C583E450202025050505050503B3737373B3F5002020245161513
      0D1704535E5F5B3E450202025050505050503B505050373F50020202451C1A1B
      1D1804525D54593E450202025050505050503B3737503B3F50020202451E193A
      3F3704505157563E450202025050505001503B3F5050503F5002020245201F39
      033504484E4C4F3E450202025050503E01503B0101013F3F5002020245422522
      212404474D4B4E3E45020202503E505050503B010101013F5002020245282726
      234304474D4B4D3E45020202503F3E3E3E503B010101013F50020202452F2B29
      282C04474D4B4D3E45020202503F3F3F3F503B010101013F5002020245342D2A
      2D3104474D4B4D3E45020202503F3F3F3F503B3F0101013F500202024545322E
      333004464A494A3E450202025050503F3F503B3F0101013F500202020202453B
      3644044545454545450202020202505050503B50505050505002020202020202
      4545040202020202020202020202020250503B02020202020202}
    NumGlyphs = 2
  end
  object ckbSinalizar: TCheckBox [28]
    Left = 680
    Top = 74
    Width = 97
    Height = 17
    Caption = 'Sinalizar'
    TabOrder = 15
  end
  inherited popGrid: TPopupMenu
    Left = 200
    Top = 48
  end
  object tabChecagens: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 776
    Top = 152
  end
  object tabBancos: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 776
    Top = 40
  end
  object dtsBancos: TDataSource
    AutoEdit = False
    DataSet = tabBancos
    Left = 864
    Top = 40
  end
  object tabLocalizacao: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 776
    Top = 96
  end
  object dtsLocalizacao: TDataSource
    AutoEdit = False
    DataSet = tabLocalizacao
    Left = 864
    Top = 96
  end
end

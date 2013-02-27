inherited fmTitulosReceber: TfmTitulosReceber
  Left = 233
  Top = 153
  Caption = 'T'#237'tulos'
  ClientHeight = 540
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
    Left = 127
    Top = 6
    Width = 32
    Height = 13
    Caption = 'Cliente'
  end
  object Label30: TLabel [2]
    Left = 504
    Top = 6
    Width = 65
    Height = 13
    Caption = 'Data Emiss'#227'o'
  end
  object Label3: TLabel [3]
    Left = 8
    Top = 48
    Width = 76
    Height = 13
    Caption = 'Centro de Custo'
  end
  object Label4: TLabel [4]
    Left = 8
    Top = 90
    Width = 55
    Height = 13
    Caption = 'Documento'
  end
  object Label5: TLabel [5]
    Left = 100
    Top = 90
    Width = 36
    Height = 13
    Caption = 'Parcela'
  end
  object Label6: TLabel [6]
    Left = 175
    Top = 90
    Width = 53
    Height = 13
    Caption = 'Nota Fiscal'
  end
  object Label8: TLabel [7]
    Left = 478
    Top = 90
    Width = 70
    Height = 13
    Caption = 'Valor do T'#237'tulo'
  end
  object Label9: TLabel [8]
    Left = 8
    Top = 132
    Width = 46
    Height = 13
    Caption = 'Desconto'
  end
  object Label10: TLabel [9]
    Left = 104
    Top = 132
    Width = 49
    Height = 13
    Caption = 'Acr'#233'scimo'
  end
  object Label11: TLabel [10]
    Left = 298
    Top = 132
    Width = 70
    Height = 13
    Caption = 'Valor Restante'
  end
  object Label12: TLabel [11]
    Left = 405
    Top = 132
    Width = 82
    Height = 13
    Caption = 'Data Vencimento'
  end
  object Label13: TLabel [12]
    Left = 504
    Top = 132
    Width = 80
    Height = 13
    Caption = 'Data Pagamento'
  end
  object Label14: TLabel [13]
    Left = 435
    Top = 48
    Width = 41
    Height = 13
    Caption = 'Hist'#243'rico'
  end
  object Label15: TLabel [14]
    Left = 268
    Top = 90
    Width = 77
    Height = 13
    Caption = 'Numero Cheque'
  end
  object Label16: TLabel [15]
    Left = 8
    Top = 174
    Width = 62
    Height = 13
    Caption = 'Respons'#225'vel'
  end
  object Label18: TLabel [16]
    Left = 383
    Top = 174
    Width = 57
    Height = 13
    Caption = 'Localiza'#231#227'o'
  end
  object Label19: TLabel [17]
    Left = 180
    Top = 174
    Width = 41
    Height = 13
    Caption = 'Empresa'
  end
  object Bevel1: TBevel [18]
    Left = 88
    Top = 284
    Width = 510
    Height = 10
    Shape = bsBottomLine
  end
  object Label17: TLabel [19]
    Left = 8
    Top = 283
    Width = 75
    Height = 16
    Caption = 'Liquida'#231#245'es'
    Font.Charset = ANSI_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label20: TLabel [20]
    Left = 8
    Top = 303
    Width = 78
    Height = 13
    Caption = 'Data Liquida'#231#227'o'
    FocusControl = edtLiqData
  end
  object Label21: TLabel [21]
    Left = 271
    Top = 303
    Width = 79
    Height = 13
    Caption = 'Valor Liquida'#231#227'o'
    FocusControl = edtLiqData
  end
  object Label22: TLabel [22]
    Left = 359
    Top = 303
    Width = 31
    Height = 13
    Caption = 'Banco'
  end
  object Label23: TLabel [23]
    Left = 8
    Top = 215
    Width = 61
    Height = 13
    Caption = 'Observa'#231#227'o:'
  end
  object Label24: TLabel [24]
    Left = 112
    Top = 303
    Width = 73
    Height = 13
    Caption = 'Valor Desconto'
    FocusControl = edtLiqData
  end
  object Label25: TLabel [25]
    Left = 192
    Top = 303
    Width = 76
    Height = 13
    Caption = 'Valor Acr'#233'scimo'
    FocusControl = edtLiqData
  end
  object Label7: TLabel [26]
    Left = 201
    Top = 132
    Width = 37
    Height = 13
    Caption = 'Imposto'
  end
  inherited pnlBotoes: TPanel
    Top = 479
    Width = 606
    TabOrder = 34
    inherited btnLocalizar: TSpeedButton
      OnClick = btnLocalizarClick
    end
  end
  object edtCodigoCliente: TDBEdit [28]
    Left = 8
    Top = 22
    Width = 81
    Height = 21
    DataField = 'CodigoConta'
    DataSource = dtsBase
    TabOrder = 0
  end
  object edtNomeCliente: TDBEdit [29]
    Left = 127
    Top = 22
    Width = 368
    Height = 21
    DataField = 'NomeFantasia'
    DataSource = dtsClientes
    Enabled = False
    TabOrder = 2
  end
  object btnLocalizaClientes: TBitBtn [30]
    Left = 93
    Top = 22
    Width = 29
    Height = 22
    TabOrder = 1
    OnClick = btnLocalizaClientesClick
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
  object edtDataEmissao: TDBDateEdit [31]
    Left = 504
    Top = 22
    Width = 96
    Height = 21
    DataField = 'DataEmissao'
    DataSource = dtsBase
    NumGlyphs = 2
    TabOrder = 3
    YearDigits = dyFour
  end
  object edtCodigoCC: TDBEdit [32]
    Left = 8
    Top = 64
    Width = 81
    Height = 21
    DataField = 'CodigoCentroCusto'
    DataSource = dtsBase
    TabOrder = 4
  end
  object edtDescricaoCC: TDBEdit [33]
    Left = 127
    Top = 64
    Width = 298
    Height = 21
    DataField = 'Descricao'
    DataSource = dtsCentroCusto
    Enabled = False
    TabOrder = 6
  end
  object btnLocalizarCentroCusto: TBitBtn [34]
    Left = 93
    Top = 64
    Width = 29
    Height = 22
    TabOrder = 5
    OnClick = btnLocalizarCentroCustoClick
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
  object edtDocumento: TDBEdit [35]
    Left = 8
    Top = 106
    Width = 81
    Height = 21
    DataField = 'Documento'
    DataSource = dtsBase
    Enabled = False
    TabOrder = 8
  end
  object edtParcela: TDBEdit [36]
    Left = 100
    Top = 106
    Width = 61
    Height = 21
    DataField = 'Parcela'
    DataSource = dtsBase
    TabOrder = 9
  end
  object edtNotaFiscal: TDBEdit [37]
    Left = 175
    Top = 106
    Width = 81
    Height = 21
    DataField = 'NotaFiscal'
    DataSource = dtsBase
    TabOrder = 10
  end
  object edtValorTitulo: TDBEdit [38]
    Left = 478
    Top = 106
    Width = 121
    Height = 21
    DataField = 'ValorTotal'
    DataSource = dtsBase
    TabOrder = 12
  end
  object edtDesconto: TDBEdit [39]
    Left = 8
    Top = 148
    Width = 93
    Height = 21
    DataField = 'ValorDesconto'
    DataSource = dtsBase
    TabOrder = 13
  end
  object edtAcrescimo: TDBEdit [40]
    Left = 104
    Top = 148
    Width = 93
    Height = 21
    DataField = 'ValorAcrescimo'
    DataSource = dtsBase
    TabOrder = 14
  end
  object edtDataVencto: TDBDateEdit [41]
    Left = 405
    Top = 148
    Width = 96
    Height = 21
    DataField = 'DataVencimento'
    DataSource = dtsBase
    NumGlyphs = 2
    TabOrder = 17
    YearDigits = dyFour
    OnExit = edtDataVenctoExit
  end
  object edtDataPagamento: TDBDateEdit [42]
    Left = 504
    Top = 148
    Width = 96
    Height = 21
    DataField = 'DataPagamento'
    DataSource = dtsBase
    Enabled = False
    NumGlyphs = 2
    TabOrder = 18
    YearDigits = dyFour
  end
  object edtHistorico: TDBEdit [43]
    Left = 435
    Top = 64
    Width = 164
    Height = 21
    DataField = 'Historico'
    DataSource = dtsBase
    TabOrder = 7
  end
  object edtNumeroCheque: TDBEdit [44]
    Left = 268
    Top = 106
    Width = 199
    Height = 21
    DataField = 'NumeroCheque'
    DataSource = dtsBase
    TabOrder = 11
  end
  object edtResponsavel: TDBLookupComboBox [45]
    Left = 8
    Top = 190
    Width = 166
    Height = 21
    DataField = 'CodigoResponsavel'
    DataSource = dtsBase
    KeyField = 'Codigo'
    ListField = 'Descricao'
    ListSource = dtsResponsavel
    TabOrder = 19
  end
  object edtEmpresa: TDBLookupComboBox [46]
    Left = 225
    Top = 190
    Width = 151
    Height = 21
    DataField = 'CodigoEmpresa'
    DataSource = dtsBase
    KeyField = 'CodigoEmpresa'
    ListField = 'NomeFantasia'
    ListSource = dtsEmpresas
    TabOrder = 21
  end
  object edtLocalizacao: TDBLookupComboBox [47]
    Left = 383
    Top = 190
    Width = 141
    Height = 21
    DataField = 'CodigoLocalizacao'
    DataSource = dtsBase
    KeyField = 'Codigo'
    ListField = 'Descricao'
    ListSource = dtsLocalizacao
    TabOrder = 22
  end
  object edtCodigoEmpresa: TDBEdit [48]
    Left = 180
    Top = 190
    Width = 41
    Height = 21
    DataField = 'CodigoEmpresa'
    DataSource = dtsBase
    TabOrder = 20
  end
  object dbgLiquidacoes: TDBGrid [49]
    Left = 8
    Top = 346
    Width = 592
    Height = 124
    DataSource = dtsLiquidacoes
    TabOrder = 33
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DataLiquida'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValorLiquida'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Banco'
        Width = 225
        Visible = True
      end>
  end
  object edtLiqData: TDateEdit [50]
    Left = 8
    Top = 319
    Width = 101
    Height = 21
    NumGlyphs = 2
    YearDigits = dyFour
    TabOrder = 27
    OnExit = edtLiqDataExit
  end
  object edtLiqValor: TCurrencyEdit [51]
    Left = 271
    Top = 319
    Width = 85
    Height = 21
    AutoSize = False
    TabOrder = 30
  end
  object edtLiqTipo: TDBLookupComboBox [52]
    Left = 359
    Top = 319
    Width = 208
    Height = 21
    KeyField = 'Codigo'
    ListField = 'Descricao'
    ListSource = dtsTiposLiquidacao
    TabOrder = 31
  end
  object btnLiqAdicionar: TBitBtn [53]
    Left = 571
    Top = 319
    Width = 29
    Height = 22
    TabOrder = 32
    OnClick = btnLiqAdicionarClick
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      08000000000000020000120B0000120B0000000100000000000000000000FFFF
      FF00FF00FF00035D050005950E0005930D0005920D00058C0D00058B0D000695
      0F0006920E000A9A15000C9C18000D9E1C00119F210017A62B0018A92F0021B8
      3C0025BC42002AC64D0030CF570030CE57003BD968003BDA690048EB7F005BF7
      9100000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000020202020202
      0202020202020202020202020202020202020202020202020202020202020202
      0203030202020202020202020202020202121202020202020202020202020202
      0319070302020202020202020202020212011612020202020202020202020202
      0319040302020202020202020202020212011612020202020202020202020202
      0319060302020202020202020202020212011612020202020202020202020202
      0319090302020202020202020202020212011612020202020202020203030303
      03190C0303030303020202021212121212011612121212120202020319171413
      110F0E0D0B0A0508030202120101191919191919161616161202020319191919
      1919101919191919030202120101010101011901010101011202020203030303
      0319120303030303020202021212121212011912121212120202020202020202
      0319150302020202020202020202020212011912020202020202020202020202
      0319160302020202020202020202020212010112020202020202020202020202
      0319180302020202020202020202020212010112020202020202020202020202
      0319190302020202020202020202020212010112020202020202020202020202
      0203030202020202020202020202020202121202020202020202020202020202
      0202020202020202020202020202020202020202020202020202}
    NumGlyphs = 2
  end
  object edtObservacao: TDBMemo [54]
    Left = 8
    Top = 230
    Width = 473
    Height = 53
    DataField = 'Observacao'
    DataSource = dtsBase
    ScrollBars = ssVertical
    TabOrder = 25
  end
  object edtValorRestante: TCurrencyEdit [55]
    Left = 298
    Top = 148
    Width = 103
    Height = 21
    AutoSize = False
    Enabled = False
    TabOrder = 16
  end
  object edtLiqDesconto: TCurrencyEdit [56]
    Left = 112
    Top = 319
    Width = 75
    Height = 21
    AutoSize = False
    TabOrder = 28
    OnExit = edtLiqDescontoExit
  end
  object edtLiqAcrescimo: TCurrencyEdit [57]
    Left = 192
    Top = 319
    Width = 75
    Height = 21
    AutoSize = False
    TabOrder = 29
    OnExit = edtLiqAcrescimoExit
  end
  object edtImposto: TDBEdit [58]
    Left = 201
    Top = 148
    Width = 93
    Height = 21
    DataField = 'ValorImposto'
    DataSource = dtsBase
    TabOrder = 15
  end
  object dbcSinalizado: TDBCheckBox [59]
    Left = 529
    Top = 192
    Width = 70
    Height = 17
    Caption = 'Sinalizado'
    DataField = 'Sinalizado'
    DataSource = dtsBase
    TabOrder = 23
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object dbrImpressoBoleto: TDBRadioGroup [60]
    Left = 488
    Top = 217
    Width = 106
    Height = 32
    Caption = 'Impresso Boleto:'
    Columns = 2
    DataField = 'ImpressoBoleto'
    DataSource = dtsBase
    Items.Strings = (
      'Sim'
      'N'#227'o')
    TabOrder = 24
    Values.Strings = (
      'Sim'
      'N'#227'o')
  end
  object dbrGeradoRemessa: TDBRadioGroup [61]
    Left = 488
    Top = 251
    Width = 106
    Height = 32
    Caption = 'Gerado Remessa:'
    Columns = 2
    DataField = 'GeradoRemessa'
    DataSource = dtsBase
    Items.Strings = (
      'Sim'
      'N'#227'o')
    TabOrder = 26
    Values.Strings = (
      'Sim'
      'N'#227'o')
  end
  inherited tabBase: TZQuery
    Connection = fmMenu.zcnConexao
    Left = 664
    Top = 16
  end
  inherited dtsBase: TDataSource
    OnDataChange = dtsBaseDataChange
    Left = 728
    Top = 16
  end
  inherited popOpcoes: TPopupMenu
    Left = 504
    Top = 449
    object Estornar1: TMenuItem
      Caption = 'Estornar'
      OnClick = Estornar1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Sinalizar1: TMenuItem
      Caption = 'Sinalizar'
      OnClick = Sinalizar1Click
    end
    object RemoverSinalizao1: TMenuItem
      Caption = 'Remover Sinaliza'#231#227'o'
      OnClick = RemoverSinalizao1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object GerarTriplicata1: TMenuItem
      Caption = 'Gerar Triplicata'
      OnClick = GerarTriplicata1Click
    end
  end
  object tabClientes: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 664
    Top = 72
  end
  object dtsClientes: TDataSource
    AutoEdit = False
    DataSet = tabClientes
    Left = 728
    Top = 72
  end
  object tabCentroCusto: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 664
    Top = 128
  end
  object dtsCentroCusto: TDataSource
    AutoEdit = False
    DataSet = tabCentroCusto
    Left = 728
    Top = 128
  end
  object tabTiposLiquidacao: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 664
    Top = 184
  end
  object dtsTiposLiquidacao: TDataSource
    AutoEdit = False
    DataSet = tabTiposLiquidacao
    Left = 728
    Top = 184
  end
  object tabResponsavel: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 664
    Top = 240
  end
  object dtsResponsavel: TDataSource
    AutoEdit = False
    DataSet = tabResponsavel
    Left = 728
    Top = 240
  end
  object tabEmpresas: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 664
    Top = 296
  end
  object dtsEmpresas: TDataSource
    AutoEdit = False
    DataSet = tabEmpresas
    Left = 728
    Top = 296
  end
  object tabLocalizacao: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 664
    Top = 352
  end
  object dtsLocalizacao: TDataSource
    AutoEdit = False
    DataSet = tabLocalizacao
    Left = 728
    Top = 352
  end
  object tabLiquidacoes: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 664
    Top = 408
  end
  object dtsLiquidacoes: TDataSource
    AutoEdit = False
    DataSet = tabLiquidacoes
    Left = 728
    Top = 408
  end
  object tabChecagens: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 504
    Top = 393
  end
  object tabConfigPropri: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 624
    Top = 480
  end
end

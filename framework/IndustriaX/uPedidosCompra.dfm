inherited fmPedidosCompra: TfmPedidosCompra
  Left = 202
  Top = 110
  Caption = 'Pedidos de Compra'
  ClientHeight = 474
  ClientWidth = 756
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 8
    Width = 48
    Height = 13
    Caption = 'N'#186' Pedido'
  end
  object Label2: TLabel [1]
    Left = 109
    Top = 8
    Width = 59
    Height = 13
    Caption = 'Data Pedido'
  end
  object Label3: TLabel [2]
    Left = 227
    Top = 8
    Width = 59
    Height = 13
    Caption = 'Hora Pedido'
  end
  object Label4: TLabel [3]
    Left = 309
    Top = 8
    Width = 67
    Height = 13
    Caption = 'Data Previs'#227'o'
  end
  object Label5: TLabel [4]
    Left = 426
    Top = 8
    Width = 89
    Height = 13
    Caption = 'Data Recebimento'
  end
  object Label6: TLabel [5]
    Left = 555
    Top = 8
    Width = 53
    Height = 13
    Caption = 'Nota Fiscal'
  end
  object Label7: TLabel [6]
    Left = 655
    Top = 8
    Width = 69
    Height = 13
    Caption = 'Or'#231'. Aprovado'
  end
  object Label8: TLabel [7]
    Left = 8
    Top = 55
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label9: TLabel [8]
    Left = 106
    Top = 55
    Width = 54
    Height = 13
    Caption = 'Fornecedor'
  end
  object Label10: TLabel [9]
    Left = 296
    Top = 55
    Width = 37
    Height = 13
    Caption = 'Contato'
  end
  object Label12: TLabel [10]
    Left = 8
    Top = 103
    Width = 62
    Height = 13
    Caption = 'Respons'#225'vel'
  end
  object Label13: TLabel [11]
    Left = 228
    Top = 103
    Width = 41
    Height = 13
    Caption = 'Empresa'
  end
  object Label14: TLabel [12]
    Left = 446
    Top = 55
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label15: TLabel [13]
    Left = 538
    Top = 55
    Width = 61
    Height = 13
    Caption = 'Centro Custo'
  end
  object Label16: TLabel [14]
    Left = 448
    Top = 103
    Width = 72
    Height = 13
    Caption = 'Transportadora'
  end
  object Label17: TLabel [15]
    Left = 685
    Top = 55
    Width = 60
    Height = 13
    Caption = 'Qtd Volumes'
  end
  object Label18: TLabel [16]
    Left = 664
    Top = 103
    Width = 68
    Height = 13
    Caption = 'Conhecimento'
  end
  object Label24: TLabel [17]
    Left = 8
    Top = 366
    Width = 69
    Height = 13
    Caption = 'Valor Produtos'
  end
  object Label25: TLabel [18]
    Left = 138
    Top = 366
    Width = 51
    Height = 13
    Caption = 'Valor Frete'
  end
  object Label26: TLabel [19]
    Left = 268
    Top = 366
    Width = 76
    Height = 13
    Caption = 'Valor Acr'#233'scimo'
  end
  object Label27: TLabel [20]
    Left = 398
    Top = 366
    Width = 40
    Height = 13
    Caption = 'Valor IPI'
  end
  object Label28: TLabel [21]
    Left = 520
    Top = 366
    Width = 73
    Height = 13
    Caption = 'Valor Desconto'
  end
  object Label57: TLabel [22]
    Left = 643
    Top = 366
    Width = 75
    Height = 13
    Caption = 'Total do Pedido'
  end
  inherited pnlBotoes: TPanel
    Top = 413
    Width = 756
    TabOrder = 29
    inherited btnLocalizar: TSpeedButton
      OnClick = btnLocalizarClick
    end
  end
  object edtPedido: TEdit [24]
    Left = 8
    Top = 24
    Width = 89
    Height = 21
    TabOrder = 0
    OnKeyPress = edtPedidoKeyPress
    OnKeyUp = edtPedidoKeyUp
  end
  object edtDataPedido: TDBDateEdit [25]
    Left = 109
    Top = 24
    Width = 107
    Height = 21
    DataField = 'Data'
    DataSource = dtsBase
    NumGlyphs = 2
    TabOrder = 1
  end
  object edtHoraPedido: TDBEdit [26]
    Left = 227
    Top = 24
    Width = 70
    Height = 21
    DataField = 'Hora'
    DataSource = dtsBase
    TabOrder = 2
  end
  object edtDataPrevisao: TDBDateEdit [27]
    Left = 309
    Top = 24
    Width = 107
    Height = 21
    DataField = 'DataPrevisao'
    DataSource = dtsBase
    NumGlyphs = 2
    TabOrder = 3
  end
  object edtDataRecebimento: TDBDateEdit [28]
    Left = 426
    Top = 24
    Width = 107
    Height = 21
    DataField = 'DataRecebimento'
    DataSource = dtsBase
    Enabled = False
    NumGlyphs = 2
    TabOrder = 4
  end
  object edtNotaFiscal: TDBEdit [29]
    Left = 555
    Top = 24
    Width = 84
    Height = 21
    DataField = 'NotaFiscal'
    DataSource = dtsBase
    Enabled = False
    TabOrder = 5
  end
  object edtOrcamentoAprovado: TDBEdit [30]
    Left = 655
    Top = 24
    Width = 92
    Height = 21
    DataField = 'Requisicao'
    DataSource = dtsBase
    TabOrder = 6
  end
  object edtCodigoFornecedor: TDBEdit [31]
    Left = 8
    Top = 71
    Width = 52
    Height = 21
    DataField = 'CodigoFornecedor'
    DataSource = dtsBase
    TabOrder = 7
    OnExit = edtCodigoFornecedorExit
  end
  object btnFornecedorLocalizar: TBitBtn [32]
    Left = 68
    Top = 71
    Width = 29
    Height = 22
    TabOrder = 8
    OnClick = btnFornecedorLocalizarClick
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
  object edtFornecedor: TDBEdit [33]
    Left = 106
    Top = 71
    Width = 184
    Height = 21
    DataField = 'NomeFantasia'
    DataSource = dtsFornecedor
    Enabled = False
    TabOrder = 9
  end
  object edtContato: TDBComboBox [34]
    Left = 296
    Top = 71
    Width = 143
    Height = 21
    DataField = 'Contato'
    DataSource = dtsBase
    ItemHeight = 13
    TabOrder = 10
  end
  object edtCodigoResponsavel: TDBEdit [35]
    Left = 8
    Top = 119
    Width = 54
    Height = 21
    DataField = 'CodigoFuncionario'
    DataSource = dtsBase
    TabOrder = 15
  end
  object edtResponsavel: TDBLookupComboBox [36]
    Left = 64
    Top = 119
    Width = 154
    Height = 21
    DataField = 'CodigoFuncionario'
    DataSource = dtsBase
    KeyField = 'Codigo'
    ListField = 'Nome'
    ListSource = dtsFuncionarios
    TabOrder = 16
  end
  object edtCodigoEmpresa: TDBEdit [37]
    Left = 228
    Top = 119
    Width = 54
    Height = 21
    DataField = 'CodigoEmpresa'
    DataSource = dtsBase
    TabOrder = 17
  end
  object edtEmpresa: TDBLookupComboBox [38]
    Left = 284
    Top = 119
    Width = 154
    Height = 21
    DataField = 'CodigoEmpresa'
    DataSource = dtsBase
    KeyField = 'CodigoEmpresa'
    ListField = 'NomeFantasia'
    ListSource = dtsEmpresas
    TabOrder = 18
  end
  object edtCodigoCC: TDBEdit [39]
    Left = 446
    Top = 71
    Width = 54
    Height = 21
    DataField = 'CodigoCentroCusto'
    DataSource = dtsBase
    TabOrder = 11
    OnExit = edtCodigoCCExit
  end
  object btnLocalizarCC: TBitBtn [40]
    Left = 505
    Top = 71
    Width = 29
    Height = 22
    TabOrder = 12
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
  object edtCentroCusto: TDBEdit [41]
    Left = 538
    Top = 71
    Width = 142
    Height = 21
    DataField = 'Descricao'
    DataSource = dtsCentroCusto
    Enabled = False
    TabOrder = 13
  end
  object edtCodigoTransportadora: TDBEdit [42]
    Left = 448
    Top = 119
    Width = 54
    Height = 21
    DataField = 'CodigoTransportadora'
    DataSource = dtsBase
    TabOrder = 19
  end
  object edtTransportadora: TDBLookupComboBox [43]
    Left = 504
    Top = 119
    Width = 154
    Height = 21
    DataField = 'CodigoTransportadora'
    DataSource = dtsBase
    KeyField = 'Codigo'
    ListField = 'Nome'
    ListSource = dtsTransportadora
    TabOrder = 20
  end
  object edtQtdCaixas: TDBEdit [44]
    Left = 685
    Top = 71
    Width = 61
    Height = 21
    DataField = 'QtdCaixas'
    DataSource = dtsBase
    TabOrder = 14
  end
  object edtConhecimento: TDBEdit [45]
    Left = 664
    Top = 119
    Width = 81
    Height = 21
    DataField = 'Conhecimento'
    DataSource = dtsBase
    TabOrder = 21
  end
  object pgcPedidos: TPageControl [46]
    Left = 8
    Top = 151
    Width = 740
    Height = 208
    ActivePage = tbsProdutos
    TabOrder = 22
    object tbsProdutos: TTabSheet
      Caption = 'Produtos'
      object Label19: TLabel
        Left = 8
        Top = 7
        Width = 73
        Height = 13
        Caption = 'C'#243'digo Produto'
      end
      object Label20: TLabel
        Left = 124
        Top = 7
        Width = 37
        Height = 13
        Caption = 'Produto'
      end
      object Label21: TLabel
        Left = 442
        Top = 7
        Width = 27
        Height = 13
        Caption = 'Saldo'
      end
      object Label22: TLabel
        Left = 531
        Top = 7
        Width = 55
        Height = 13
        Caption = 'Quantidade'
      end
      object Label23: TLabel
        Left = 625
        Top = 7
        Width = 24
        Height = 13
        Caption = 'Valor'
      end
      object btnProdutoAdicionar: TBitBtn
        Left = 693
        Top = 52
        Width = 29
        Height = 22
        TabOrder = 7
        OnClick = btnProdutoAdicionarClick
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
      object btnProdutoRemover: TBitBtn
        Left = 693
        Top = 76
        Width = 29
        Height = 22
        TabOrder = 8
        OnClick = btnProdutoRemoverClick
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          08000000000000020000120B0000120B0000000100000000000000000000FFFF
          FF00FF00FF0096B1FF003459D9003F69FF003455DC003D5EE2004B6EFF004B6D
          F8004C6DF2004C6DEB00001FBC00001CC2004966FF00001BE200001AD800001C
          CC00001CFF00001CFA00001BEE000014FF0000018B0000000000000000000000
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
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000020202020202
          0202020202020202020202020202020202020202020202020202020202020202
          0202020202020202020202020202020202020202020202020202020202020202
          0202020202020202020202020202020202020202020202020202020202020202
          0202020202020202020202020202020202020202020202020202020202020202
          0202020202020202020202020202020202020202020202020202020202020202
          0202020202020202020202020202020202020202020202020202020202161616
          1616161616161602020202020204040404040404040404020202020216051512
          13140F10110D0C1602020202040103030303030303030B040202020216030E08
          08090A0B07060416020202020401010101010101030303040202020202161616
          1616161616161602020202020204040404040404040404020202020202020202
          0202020202020202020202020202020202020202020202020202020202020202
          0202020202020202020202020202020202020202020202020202020202020202
          0202020202020202020202020202020202020202020202020202020202020202
          0202020202020202020202020202020202020202020202020202020202020202
          0202020202020202020202020202020202020202020202020202020202020202
          0202020202020202020202020202020202020202020202020202}
        NumGlyphs = 2
      end
      object dbgProdutos: TDBGrid
        Left = 8
        Top = 52
        Width = 681
        Height = 120
        DataSource = dtsPedidosCompraProdutos
        TabOrder = 6
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CodigoProduto'
            Width = 98
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Descricao'
            Width = 297
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Quantidade'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor'
            Width = 79
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ValorTotal'
            Width = 91
            Visible = True
          end>
      end
      object edtCodigoProduto: TEdit
        Left = 8
        Top = 23
        Width = 76
        Height = 21
        TabOrder = 0
        OnChange = edtCodigoProdutoChange
        OnKeyPress = edtCodigoProdutoKeyPress
      end
      object btnProdutoLocalizar: TBitBtn
        Left = 89
        Top = 23
        Width = 29
        Height = 22
        TabOrder = 1
        OnClick = btnProdutoLocalizarClick
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
      object edtDescricaoProdutos: TEdit
        Left = 124
        Top = 23
        Width = 304
        Height = 21
        TabOrder = 2
      end
      object edtSaldo: TEdit
        Left = 442
        Top = 23
        Width = 76
        Height = 21
        TabOrder = 3
      end
      object edtQuantidade: TCurrencyEdit
        Left = 531
        Top = 23
        Width = 81
        Height = 21
        AutoSize = False
        DecimalPlaces = 4
        DisplayFormat = '0.0000;-0.0000'
        TabOrder = 4
      end
      object edtValor: TCurrencyEdit
        Left = 625
        Top = 23
        Width = 97
        Height = 21
        AutoSize = False
        DecimalPlaces = 4
        DisplayFormat = 'R$ ,0.0000;-R$ ,0.0000'
        TabOrder = 5
      end
    end
    object tbsVenctos: TTabSheet
      Caption = 'Vencimentos'
      ImageIndex = 1
      object Label30: TLabel
        Left = 8
        Top = 15
        Width = 83
        Height = 13
        Caption = 'Formas de Pagto:'
      end
      object Label31: TLabel
        Left = 280
        Top = 7
        Width = 41
        Height = 13
        Caption = 'Parcelas'
      end
      object Label32: TLabel
        Left = 384
        Top = 14
        Width = 44
        Height = 13
        Caption = 'Parcelas:'
      end
      object Label33: TLabel
        Left = 5
        Top = 42
        Width = 47
        Height = 13
        Caption = '1'#186' Vencto'
      end
      object Label34: TLabel
        Left = 102
        Top = 42
        Width = 37
        Height = 13
        Caption = '1'#186' Valor'
      end
      object Label35: TLabel
        Left = 5
        Top = 83
        Width = 47
        Height = 13
        Caption = '2'#186' Vencto'
      end
      object Label36: TLabel
        Left = 102
        Top = 83
        Width = 37
        Height = 13
        Caption = '2'#186' Valor'
      end
      object Label37: TLabel
        Left = 5
        Top = 130
        Width = 47
        Height = 13
        Caption = '3'#186' Vencto'
      end
      object Label38: TLabel
        Left = 102
        Top = 130
        Width = 37
        Height = 13
        Caption = '3'#186' Valor'
      end
      object Label39: TLabel
        Left = 187
        Top = 42
        Width = 47
        Height = 13
        Caption = '4'#186' Vencto'
      end
      object Label40: TLabel
        Left = 284
        Top = 42
        Width = 37
        Height = 13
        Caption = '4'#186' Valor'
      end
      object Label41: TLabel
        Left = 187
        Top = 83
        Width = 47
        Height = 13
        Caption = '5'#186' Vencto'
      end
      object Label42: TLabel
        Left = 284
        Top = 83
        Width = 37
        Height = 13
        Caption = '5'#186' Valor'
      end
      object Label43: TLabel
        Left = 187
        Top = 130
        Width = 47
        Height = 13
        Caption = '6'#186' Vencto'
      end
      object Label44: TLabel
        Left = 284
        Top = 130
        Width = 37
        Height = 13
        Caption = '6'#186' Valor'
      end
      object Label45: TLabel
        Left = 367
        Top = 42
        Width = 47
        Height = 13
        Caption = '7'#186' Vencto'
      end
      object Label46: TLabel
        Left = 465
        Top = 42
        Width = 37
        Height = 13
        Caption = '7'#186' Valor'
      end
      object Label47: TLabel
        Left = 367
        Top = 83
        Width = 47
        Height = 13
        Caption = '8'#186' Vencto'
      end
      object Label48: TLabel
        Left = 465
        Top = 83
        Width = 37
        Height = 13
        Caption = '8'#186' Valor'
      end
      object Label49: TLabel
        Left = 367
        Top = 130
        Width = 47
        Height = 13
        Caption = '9'#186' Vencto'
      end
      object Label50: TLabel
        Left = 465
        Top = 130
        Width = 37
        Height = 13
        Caption = '9'#186' Valor'
      end
      object Label51: TLabel
        Left = 547
        Top = 130
        Width = 53
        Height = 13
        Caption = '12'#186' Vencto'
      end
      object Label52: TLabel
        Left = 645
        Top = 130
        Width = 43
        Height = 13
        Caption = '12'#186' Valor'
      end
      object Label53: TLabel
        Left = 645
        Top = 83
        Width = 43
        Height = 13
        Caption = '11'#186' Valor'
      end
      object Label54: TLabel
        Left = 547
        Top = 83
        Width = 53
        Height = 13
        Caption = '11'#186' Vencto'
      end
      object Label55: TLabel
        Left = 547
        Top = 42
        Width = 53
        Height = 13
        Caption = '10'#186' Vencto'
      end
      object Label56: TLabel
        Left = 645
        Top = 42
        Width = 43
        Height = 13
        Caption = '10'#186' Valor'
      end
      object edtFormasPagto: TDBLookupComboBox
        Left = 95
        Top = 10
        Width = 265
        Height = 21
        DataField = 'CodigoFormaPagto'
        DataSource = dtsBase
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsFormasPagto
        TabOrder = 1
        OnExit = edtFormasPagtoExit
      end
      object edtParcelas: TDBEdit
        Left = 434
        Top = 9
        Width = 70
        Height = 21
        DataField = 'Parcelas'
        DataSource = dtsBase
        TabOrder = 0
      end
      object edtVencto1: TDBDateEdit
        Left = 5
        Top = 58
        Width = 95
        Height = 21
        DataField = 'DataVencto1'
        DataSource = dtsPedidosVencto
        NumGlyphs = 2
        TabOrder = 2
      end
      object edtValor1: TDBEdit
        Left = 102
        Top = 58
        Width = 80
        Height = 21
        DataField = 'Valor1'
        DataSource = dtsPedidosVencto
        TabOrder = 3
      end
      object edtVencto2: TDBDateEdit
        Left = 5
        Top = 99
        Width = 95
        Height = 21
        DataField = 'DataVencto2'
        DataSource = dtsPedidosVencto
        NumGlyphs = 2
        TabOrder = 10
      end
      object edtValor2: TDBEdit
        Left = 102
        Top = 99
        Width = 80
        Height = 21
        DataField = 'Valor2'
        DataSource = dtsPedidosVencto
        TabOrder = 11
      end
      object edtVencto3: TDBDateEdit
        Left = 5
        Top = 146
        Width = 95
        Height = 21
        DataField = 'DataVencto3'
        DataSource = dtsPedidosVencto
        NumGlyphs = 2
        TabOrder = 18
      end
      object edtValor3: TDBEdit
        Left = 102
        Top = 146
        Width = 80
        Height = 21
        DataField = 'Valor3'
        DataSource = dtsPedidosVencto
        TabOrder = 19
      end
      object edtVencto4: TDBDateEdit
        Left = 187
        Top = 58
        Width = 95
        Height = 21
        DataField = 'DataVencto4'
        DataSource = dtsPedidosVencto
        NumGlyphs = 2
        TabOrder = 4
      end
      object edtValor4: TDBEdit
        Left = 284
        Top = 58
        Width = 80
        Height = 21
        DataField = 'Valor4'
        DataSource = dtsPedidosVencto
        TabOrder = 5
      end
      object edtVencto5: TDBDateEdit
        Left = 187
        Top = 99
        Width = 95
        Height = 21
        DataField = 'DataVencto5'
        DataSource = dtsPedidosVencto
        NumGlyphs = 2
        TabOrder = 12
      end
      object edtValor5: TDBEdit
        Left = 284
        Top = 99
        Width = 80
        Height = 21
        DataField = 'Valor5'
        DataSource = dtsPedidosVencto
        TabOrder = 13
      end
      object edtVencto6: TDBDateEdit
        Left = 187
        Top = 146
        Width = 95
        Height = 21
        DataField = 'DataVencto6'
        DataSource = dtsPedidosVencto
        NumGlyphs = 2
        TabOrder = 20
      end
      object edtValor6: TDBEdit
        Left = 284
        Top = 146
        Width = 80
        Height = 21
        DataField = 'Valor6'
        DataSource = dtsPedidosVencto
        TabOrder = 21
      end
      object edtVencto7: TDBDateEdit
        Left = 367
        Top = 58
        Width = 95
        Height = 21
        DataField = 'DataVencto7'
        DataSource = dtsPedidosVencto
        NumGlyphs = 2
        TabOrder = 6
      end
      object edtValor7: TDBEdit
        Left = 465
        Top = 58
        Width = 80
        Height = 21
        DataField = 'Valor7'
        DataSource = dtsPedidosVencto
        TabOrder = 7
      end
      object edtVencto8: TDBDateEdit
        Left = 367
        Top = 99
        Width = 95
        Height = 21
        DataField = 'DataVencto8'
        DataSource = dtsPedidosVencto
        NumGlyphs = 2
        TabOrder = 14
      end
      object edtValor8: TDBEdit
        Left = 465
        Top = 99
        Width = 80
        Height = 21
        DataField = 'Valor8'
        DataSource = dtsPedidosVencto
        TabOrder = 15
      end
      object edtVencto9: TDBDateEdit
        Left = 367
        Top = 146
        Width = 95
        Height = 21
        DataField = 'DataVencto9'
        DataSource = dtsPedidosVencto
        NumGlyphs = 2
        TabOrder = 22
      end
      object edtValor9: TDBEdit
        Left = 465
        Top = 146
        Width = 80
        Height = 21
        DataField = 'Valor9'
        DataSource = dtsPedidosVencto
        TabOrder = 23
      end
      object edtVencto12: TDBDateEdit
        Left = 547
        Top = 146
        Width = 95
        Height = 21
        DataField = 'DataVencto12'
        DataSource = dtsPedidosVencto
        NumGlyphs = 2
        TabOrder = 24
      end
      object edtValor12: TDBEdit
        Left = 645
        Top = 146
        Width = 80
        Height = 21
        DataField = 'Valor12'
        DataSource = dtsPedidosVencto
        TabOrder = 25
      end
      object edtValor11: TDBEdit
        Left = 645
        Top = 99
        Width = 80
        Height = 21
        DataField = 'Valor11'
        DataSource = dtsPedidosVencto
        TabOrder = 17
      end
      object edtVencto11: TDBDateEdit
        Left = 547
        Top = 99
        Width = 95
        Height = 21
        DataField = 'DataVencto11'
        DataSource = dtsPedidosVencto
        NumGlyphs = 2
        TabOrder = 16
      end
      object edtVencto10: TDBDateEdit
        Left = 547
        Top = 58
        Width = 95
        Height = 21
        DataField = 'DataVencto10'
        DataSource = dtsPedidosVencto
        NumGlyphs = 2
        TabOrder = 8
      end
      object edtValor10: TDBEdit
        Left = 645
        Top = 58
        Width = 80
        Height = 21
        DataField = 'Valor10'
        DataSource = dtsPedidosVencto
        TabOrder = 9
      end
    end
    object tbsObservacoes: TTabSheet
      Caption = 'Observa'#231#245'es'
      ImageIndex = 2
      object edtObservacoes: TDBMemo
        Left = 8
        Top = 8
        Width = 717
        Height = 163
        DataField = 'Observacao'
        DataSource = dtsBase
        TabOrder = 0
      end
    end
  end
  object edtValorProdutos: TDBEdit [47]
    Left = 8
    Top = 382
    Width = 105
    Height = 21
    DataField = 'ValorProdutos'
    DataSource = dtsBase
    Enabled = False
    TabOrder = 23
  end
  object edtValorFrete: TDBEdit [48]
    Left = 138
    Top = 382
    Width = 105
    Height = 21
    DataField = 'ValorFrete'
    DataSource = dtsBase
    TabOrder = 24
    OnExit = edtValorFreteExit
  end
  object edtValorAcrescimo: TDBEdit [49]
    Left = 268
    Top = 382
    Width = 105
    Height = 21
    DataField = 'ValorAcrescimo'
    DataSource = dtsBase
    TabOrder = 25
    OnExit = edtValorAcrescimoExit
  end
  object edtValorIpi: TDBEdit [50]
    Left = 398
    Top = 382
    Width = 105
    Height = 21
    DataField = 'ValorIPI'
    DataSource = dtsBase
    TabOrder = 26
    OnExit = edtValorIpiExit
  end
  object edtValorDesconto: TDBEdit [51]
    Left = 520
    Top = 382
    Width = 105
    Height = 21
    DataField = 'ValorDesconto'
    DataSource = dtsBase
    TabOrder = 27
    OnExit = edtValorDescontoExit
  end
  object edtTotalPedido: TDBEdit [52]
    Left = 643
    Top = 382
    Width = 105
    Height = 21
    DataField = 'ValorTotal'
    DataSource = dtsBase
    Enabled = False
    TabOrder = 28
  end
  inherited tabBase: TZQuery
    Connection = fmMenu.zcnConexao
    Left = 824
    Top = 8
  end
  inherited dtsBase: TDataSource
    OnDataChange = dtsBaseDataChange
    Left = 912
    Top = 8
  end
  inherited popOpcoes: TPopupMenu
    Left = 491
    Top = 392
    object Receber1: TMenuItem
      Caption = 'Receber'
      OnClick = Receber1Click
    end
  end
  object tabFornecedor: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 824
    Top = 56
  end
  object dtsFornecedor: TDataSource
    AutoEdit = False
    DataSet = tabFornecedor
    Left = 912
    Top = 56
  end
  object tabCFOP: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 824
    Top = 104
  end
  object dtsCFOP: TDataSource
    AutoEdit = False
    DataSet = tabCFOP
    Left = 912
    Top = 104
  end
  object tabTransportadora: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 824
    Top = 152
  end
  object dtsTransportadora: TDataSource
    AutoEdit = False
    DataSet = tabTransportadora
    Left = 912
    Top = 152
  end
  object tabEmpresas: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 824
    Top = 200
  end
  object dtsEmpresas: TDataSource
    AutoEdit = False
    DataSet = tabEmpresas
    Left = 912
    Top = 200
  end
  object tabCentroCusto: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 824
    Top = 248
  end
  object dtsCentroCusto: TDataSource
    AutoEdit = False
    DataSet = tabCentroCusto
    Left = 912
    Top = 248
  end
  object tabPedidosCompraProdutos: TZQuery
    Connection = fmMenu.zcnConexao
    SQL.Strings = (
      'SELECT * FROM pedidos_compra_produtos')
    Params = <>
    Left = 824
    Top = 296
    object tabPedidosCompraProdutosID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object tabPedidosCompraProdutosPedido: TFloatField
      FieldName = 'Pedido'
      Required = True
    end
    object strngfldPedidosCompraProdutosCodigoProduto: TStringField
      FieldName = 'CodigoProduto'
      Required = True
    end
    object strngfldPedidosCompraProdutosDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object tabPedidosCompraProdutosQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
    object tabPedidosCompraProdutosValor: TFloatField
      FieldName = 'Valor'
      DisplayFormat = '"R$ "#0.00##'
    end
    object tabPedidosCompraProdutosValorTotal: TFloatField
      FieldName = 'ValorTotal'
      DisplayFormat = '"R$ "#0.00##'
    end
    object dfdPedidosCompraProdutosDataBaixa: TDateField
      FieldName = 'DataBaixa'
    end
    object tabPedidosCompraProdutosCodigoFornecedor: TFloatField
      FieldName = 'CodigoFornecedor'
    end
  end
  object dtsPedidosCompraProdutos: TDataSource
    AutoEdit = False
    DataSet = tabPedidosCompraProdutos
    Left = 960
    Top = 296
  end
  object tabAuxiliarProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 824
    Top = 352
    object tabAuxiliarProdutosCodigoProduto: TStringField
      FieldName = 'CodigoProduto'
    end
    object tabAuxiliarProdutosDescricao: TStringField
      FieldName = 'Descricao'
      Size = 60
    end
    object tabAuxiliarProdutosQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
    object tabAuxiliarProdutosValor: TCurrencyField
      FieldName = 'Valor'
      currency = False
    end
    object tabAuxiliarProdutosValorTotal: TCurrencyField
      FieldName = 'ValorTotal'
      currency = False
    end
  end
  object dtsAuxiliarProdutos: TDataSource
    AutoEdit = False
    DataSet = tabAuxiliarProdutos
    Left = 920
    Top = 351
  end
  object tabAuxiliarVenctos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 824
    Top = 400
    object tabAuxiliarVenctosDataVencto1: TDateField
      FieldName = 'DataVencto1'
    end
    object tabAuxiliarVenctosDataVencto2: TDateField
      FieldName = 'DataVencto2'
    end
    object tabAuxiliarVenctosDataVencto3: TDateField
      FieldName = 'DataVencto3'
    end
    object tabAuxiliarVenctosDataVencto4: TDateField
      FieldName = 'DataVencto4'
    end
    object tabAuxiliarVenctosDataVencto5: TDateField
      FieldName = 'DataVencto5'
    end
    object tabAuxiliarVenctosDataVencto6: TDateField
      FieldName = 'DataVencto6'
    end
    object tabAuxiliarVenctosDataVencto7: TDateField
      FieldName = 'DataVencto7'
    end
    object tabAuxiliarVenctosDataVencto8: TDateField
      FieldName = 'DataVencto8'
    end
    object tabAuxiliarVenctosDataVencto9: TDateField
      FieldName = 'DataVencto9'
    end
    object tabAuxiliarVenctosDataVencto10: TDateField
      FieldName = 'DataVencto10'
    end
    object tabAuxiliarVenctosDataVencto11: TDateField
      FieldName = 'DataVencto11'
    end
    object tabAuxiliarVenctosDataVencto12: TDateField
      FieldName = 'DataVencto12'
    end
    object tabAuxiliarVenctosValor1: TCurrencyField
      FieldName = 'Valor1'
    end
    object tabAuxiliarVenctosValor2: TCurrencyField
      FieldName = 'Valor2'
    end
    object tabAuxiliarVenctosValor3: TCurrencyField
      FieldName = 'Valor3'
    end
    object tabAuxiliarVenctosValor4: TCurrencyField
      FieldName = 'Valor4'
    end
    object tabAuxiliarVenctosValor5: TCurrencyField
      FieldName = 'Valor5'
    end
    object tabAuxiliarVenctosValor6: TCurrencyField
      FieldName = 'Valor6'
    end
    object tabAuxiliarVenctosValor7: TCurrencyField
      FieldName = 'Valor7'
    end
    object tabAuxiliarVenctosValor8: TCurrencyField
      FieldName = 'Valor8'
    end
    object tabAuxiliarVenctosValor9: TCurrencyField
      FieldName = 'Valor9'
    end
    object tabAuxiliarVenctosValor10: TCurrencyField
      FieldName = 'Valor10'
    end
    object tabAuxiliarVenctosValor11: TCurrencyField
      FieldName = 'Valor11'
    end
    object tabAuxiliarVenctosValor12: TCurrencyField
      FieldName = 'Valor12'
    end
  end
  object dtsAuxiliarVenctos: TDataSource
    DataSet = tabAuxiliarVenctos
    Left = 920
    Top = 399
  end
  object tabChecagens: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 1056
    Top = 281
  end
  object tabPedidosVencto: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 824
    Top = 456
  end
  object dtsPedidosVencto: TDataSource
    AutoEdit = False
    DataSet = tabPedidosVencto
    Left = 912
    Top = 456
  end
  object tabFormasPagto: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 824
    Top = 512
  end
  object dtsFormasPagto: TDataSource
    AutoEdit = False
    DataSet = tabFormasPagto
    Left = 912
    Top = 512
  end
  object tabFuncionarios: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 824
    Top = 568
  end
  object dtsFuncionarios: TDataSource
    AutoEdit = False
    DataSet = tabFuncionarios
    Left = 912
    Top = 568
  end
  object tabUltimasCompras: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 1056
    Top = 337
  end
  object tabTitulos: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 1056
    Top = 393
  end
  object tabProdutosFornecedores: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 688
    Top = 568
  end
end

inherited fmFaturamento: TfmFaturamento
  Left = 288
  Top = 97
  Caption = 'Faturamento'
  ClientHeight = 511
  ClientWidth = 738
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 8
    Width = 53
    Height = 13
    Caption = 'Nota Fiscal'
  end
  object Label2: TLabel [1]
    Left = 171
    Top = 8
    Width = 49
    Height = 13
    Caption = 'Data Nota'
  end
  object Label3: TLabel [2]
    Left = 279
    Top = 8
    Width = 48
    Height = 13
    Caption = 'N'#186' Pedido'
  end
  object Label4: TLabel [3]
    Left = 355
    Top = 8
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object lblTipoNome: TLabel [4]
    Left = 459
    Top = 8
    Width = 28
    Height = 13
    Caption = 'Nome'
  end
  object Label6: TLabel [5]
    Left = 629
    Top = 8
    Width = 94
    Height = 13
    Caption = 'Data Cancelamento'
  end
  object Label7: TLabel [6]
    Left = 87
    Top = 55
    Width = 72
    Height = 13
    Caption = 'Transportadora'
  end
  object Label9: TLabel [7]
    Left = 279
    Top = 55
    Width = 79
    Height = 13
    Caption = 'Tabela de Pre'#231'o'
  end
  object Label10: TLabel [8]
    Left = 396
    Top = 55
    Width = 41
    Height = 13
    Caption = 'Empresa'
  end
  object Label11: TLabel [9]
    Left = 97
    Top = 8
    Width = 24
    Height = 13
    Caption = 'S'#233'rie'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label12: TLabel [10]
    Left = 8
    Top = 321
    Width = 69
    Height = 13
    Caption = 'Valor Produtos'
  end
  object Label13: TLabel [11]
    Left = 114
    Top = 321
    Width = 40
    Height = 13
    Caption = 'Valor IPI'
  end
  object Label14: TLabel [12]
    Left = 220
    Top = 321
    Width = 51
    Height = 13
    Caption = 'Valor Frete'
  end
  object Label15: TLabel [13]
    Left = 324
    Top = 321
    Width = 76
    Height = 13
    Caption = 'Valor Acr'#233'scimo'
  end
  object Label16: TLabel [14]
    Left = 8
    Top = 363
    Width = 61
    Height = 13
    Caption = 'Valor Seguro'
  end
  object Label17: TLabel [15]
    Left = 277
    Top = 363
    Width = 65
    Height = 13
    Caption = 'Total da Nota'
  end
  object Label23: TLabel [16]
    Left = 114
    Top = 363
    Width = 73
    Height = 13
    Caption = 'Valor Desconto'
  end
  object Label24: TLabel [17]
    Left = 220
    Top = 363
    Width = 39
    Height = 13
    Caption = '% Desc.'
  end
  object Label25: TLabel [18]
    Left = 430
    Top = 321
    Width = 63
    Height = 13
    Caption = 'Observa'#231#245'es'
  end
  object Label26: TLabel [19]
    Left = 8
    Top = 406
    Width = 62
    Height = 13
    Caption = 'Respons'#225'vel'
  end
  object Label27: TLabel [20]
    Left = 283
    Top = 406
    Width = 37
    Height = 13
    Caption = 'CSOSN'
  end
  object lbl1: TLabel [21]
    Left = 433
    Top = 407
    Width = 28
    Height = 13
    Caption = 'CFOP'
  end
  inherited pnlBotoes: TPanel
    Top = 450
    Width = 738
    TabOrder = 24
    inherited btnLocalizar: TSpeedButton
      OnClick = btnLocalizarClick
    end
  end
  object edtNotaFiscal: TEdit [23]
    Left = 8
    Top = 24
    Width = 86
    Height = 21
    TabOrder = 0
    OnExit = edtNotaFiscalExit
    OnKeyPress = edtNotaFiscalKeyPress
    OnKeyUp = edtNotaFiscalKeyUp
  end
  object edtDataNota: TDBDateEdit [24]
    Left = 171
    Top = 24
    Width = 103
    Height = 21
    DataField = 'Data'
    DataSource = dtsBase
    NumGlyphs = 2
    TabOrder = 2
  end
  object edtPedido: TDBEdit [25]
    Left = 279
    Top = 24
    Width = 69
    Height = 21
    DataField = 'NPedido'
    DataSource = dtsBase
    TabOrder = 3
  end
  object edtCodigo: TDBEdit [26]
    Left = 355
    Top = 24
    Width = 65
    Height = 21
    DataField = 'CodigoConta'
    DataSource = dtsBase
    TabOrder = 4
    OnExit = edtCodigoExit
  end
  object edtNome: TDBEdit [27]
    Left = 459
    Top = 24
    Width = 163
    Height = 21
    DataField = 'NomeFantasia'
    DataSource = dtsConta
    Enabled = False
    TabOrder = 6
  end
  object btnTipoLocalizar: TBitBtn [28]
    Left = 425
    Top = 24
    Width = 29
    Height = 22
    TabOrder = 5
    OnClick = btnTipoLocalizarClick
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
  object edtDataCancelamento: TDBDateEdit [29]
    Left = 629
    Top = 24
    Width = 103
    Height = 21
    DataField = 'DataCancelamento'
    DataSource = dtsBase
    Enabled = False
    NumGlyphs = 2
    TabOrder = 7
  end
  object edtTransportadora: TDBLookupComboBox [30]
    Left = 87
    Top = 72
    Width = 141
    Height = 21
    DataField = 'CodigoTransportadora'
    DataSource = dtsBase
    KeyField = 'Codigo'
    ListField = 'Nome'
    ListSource = dtsTransportadoras
    TabOrder = 9
  end
  object edtTabelaPreco: TDBLookupComboBox [31]
    Left = 279
    Top = 72
    Width = 113
    Height = 21
    DataField = 'CodigoTabPreco'
    DataSource = dtsBase
    KeyField = 'Codigo'
    ListField = 'Descricao'
    ListSource = dtsTabelaPreco
    TabOrder = 10
  end
  object edtEmpresa: TDBLookupComboBox [32]
    Left = 396
    Top = 72
    Width = 333
    Height = 21
    DataField = 'CodigoEmpresa'
    DataSource = dtsBase
    KeyField = 'CodigoEmpresa'
    ListField = 'NomeFantasia'
    ListSource = dtsEmpresas
    TabOrder = 11
  end
  object pgcFaturamento: TPageControl [33]
    Left = 8
    Top = 108
    Width = 725
    Height = 205
    ActivePage = tbsProdutos
    TabOrder = 12
    object tbsProdutos: TTabSheet
      Caption = 'Produtos'
      object Label18: TLabel
        Left = 8
        Top = 7
        Width = 73
        Height = 13
        Caption = 'C'#243'digo Produto'
      end
      object Label19: TLabel
        Left = 124
        Top = 7
        Width = 37
        Height = 13
        Caption = 'Produto'
      end
      object Label21: TLabel
        Left = 538
        Top = 7
        Width = 55
        Height = 13
        Caption = 'Quantidade'
      end
      object Label22: TLabel
        Left = 610
        Top = 7
        Width = 24
        Height = 13
        Caption = 'Valor'
      end
      object Label5: TLabel
        Left = 483
        Top = 7
        Width = 49
        Height = 13
        Caption = 'Aliq. ICMS'
      end
      object Label66: TLabel
        Left = 410
        Top = 7
        Width = 24
        Height = 13
        Caption = 'NCM'
      end
      object Label67: TLabel
        Left = 364
        Top = 7
        Width = 40
        Height = 13
        Caption = 'Unidade'
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
      object btnProdutoAdicionar: TBitBtn
        Left = 679
        Top = 52
        Width = 29
        Height = 22
        TabOrder = 9
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
        Left = 679
        Top = 76
        Width = 29
        Height = 22
        TabOrder = 10
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
        Width = 667
        Height = 116
        DataSource = dtsFaturaProdutos
        TabOrder = 8
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
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
        Width = 237
        Height = 21
        TabOrder = 2
      end
      object edtQuantidade: TCurrencyEdit
        Left = 538
        Top = 23
        Width = 68
        Height = 21
        AutoSize = False
        DecimalPlaces = 3
        DisplayFormat = '0.000;-0.000'
        TabOrder = 6
      end
      object edtValor: TCurrencyEdit
        Left = 610
        Top = 23
        Width = 97
        Height = 21
        AutoSize = False
        TabOrder = 7
      end
      object edtAliqIcms: TCurrencyEdit
        Left = 483
        Top = 23
        Width = 51
        Height = 21
        AutoSize = False
        DisplayFormat = '0.00;-0.00'
        TabOrder = 5
      end
      object edtNCM: TEdit
        Left = 410
        Top = 23
        Width = 69
        Height = 21
        TabOrder = 4
      end
      object edtUnidade: TEdit
        Left = 364
        Top = 23
        Width = 42
        Height = 21
        TabOrder = 3
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
      object Label32: TLabel
        Left = 384
        Top = 14
        Width = 44
        Height = 13
        Caption = 'Parcelas:'
      end
      object Label33: TLabel
        Left = 1
        Top = 42
        Width = 47
        Height = 13
        Caption = '1'#186' Vencto'
      end
      object Label35: TLabel
        Left = 1
        Top = 83
        Width = 47
        Height = 13
        Caption = '2'#186' Vencto'
      end
      object Label37: TLabel
        Left = 1
        Top = 130
        Width = 47
        Height = 13
        Caption = '3'#186' Vencto'
      end
      object Label38: TLabel
        Left = 97
        Top = 130
        Width = 37
        Height = 13
        Caption = '3'#186' Valor'
      end
      object Label36: TLabel
        Left = 97
        Top = 83
        Width = 37
        Height = 13
        Caption = '2'#186' Valor'
      end
      object Label34: TLabel
        Left = 97
        Top = 42
        Width = 37
        Height = 13
        Caption = '1'#186' Valor'
      end
      object Label39: TLabel
        Left = 183
        Top = 42
        Width = 47
        Height = 13
        Caption = '4'#186' Vencto'
      end
      object Label41: TLabel
        Left = 180
        Top = 83
        Width = 47
        Height = 13
        Caption = '5'#186' Vencto'
      end
      object Label43: TLabel
        Left = 180
        Top = 130
        Width = 47
        Height = 13
        Caption = '6'#186' Vencto'
      end
      object Label44: TLabel
        Left = 277
        Top = 130
        Width = 37
        Height = 13
        Caption = '6'#186' Valor'
      end
      object Label42: TLabel
        Left = 277
        Top = 83
        Width = 37
        Height = 13
        Caption = '5'#186' Valor'
      end
      object Label40: TLabel
        Left = 277
        Top = 42
        Width = 37
        Height = 13
        Caption = '4'#186' Valor'
      end
      object Label45: TLabel
        Left = 359
        Top = 42
        Width = 47
        Height = 13
        Caption = '7'#186' Vencto'
      end
      object Label47: TLabel
        Left = 359
        Top = 83
        Width = 47
        Height = 13
        Caption = '8'#186' Vencto'
      end
      object Label49: TLabel
        Left = 359
        Top = 130
        Width = 47
        Height = 13
        Caption = '9'#186' Vencto'
      end
      object Label50: TLabel
        Left = 455
        Top = 130
        Width = 37
        Height = 13
        Caption = '9'#186' Valor'
      end
      object Label48: TLabel
        Left = 455
        Top = 83
        Width = 37
        Height = 13
        Caption = '8'#186' Valor'
      end
      object Label46: TLabel
        Left = 455
        Top = 42
        Width = 37
        Height = 13
        Caption = '7'#186' Valor'
      end
      object Label55: TLabel
        Left = 536
        Top = 42
        Width = 53
        Height = 13
        Caption = '10'#186' Vencto'
      end
      object Label54: TLabel
        Left = 536
        Top = 83
        Width = 53
        Height = 13
        Caption = '11'#186' Vencto'
      end
      object Label51: TLabel
        Left = 536
        Top = 130
        Width = 53
        Height = 13
        Caption = '12'#186' Vencto'
      end
      object Label52: TLabel
        Left = 632
        Top = 130
        Width = 43
        Height = 13
        Caption = '12'#186' Valor'
      end
      object Label53: TLabel
        Left = 632
        Top = 83
        Width = 43
        Height = 13
        Caption = '11'#186' Valor'
      end
      object Label56: TLabel
        Left = 632
        Top = 42
        Width = 43
        Height = 13
        Caption = '10'#186' Valor'
      end
      object edtFormasPagto: TDBLookupComboBox
        Left = 102
        Top = 11
        Width = 265
        Height = 21
        DataField = 'CodigoFormaPagto'
        DataSource = dtsBase
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsFormasPagto
        TabOrder = 0
        OnExit = edtFormasPagtoExit
      end
      object edtParcelas: TDBEdit
        Left = 441
        Top = 11
        Width = 70
        Height = 21
        DataField = 'Parcelas'
        DataSource = dtsBase
        Enabled = False
        TabOrder = 1
      end
      object edtVencto1: TDBDateEdit
        Left = 1
        Top = 58
        Width = 95
        Height = 21
        DataField = 'DataVencto1'
        DataSource = dtsFaturaVenctos
        NumGlyphs = 2
        TabOrder = 2
      end
      object edtVencto2: TDBDateEdit
        Left = 1
        Top = 99
        Width = 95
        Height = 21
        DataField = 'DataVencto2'
        DataSource = dtsFaturaVenctos
        NumGlyphs = 2
        TabOrder = 10
      end
      object edtVencto3: TDBDateEdit
        Left = 1
        Top = 146
        Width = 95
        Height = 21
        DataField = 'DataVencto3'
        DataSource = dtsFaturaVenctos
        NumGlyphs = 2
        TabOrder = 18
      end
      object edtValor3: TDBEdit
        Left = 97
        Top = 146
        Width = 80
        Height = 21
        DataField = 'Valor3'
        DataSource = dtsFaturaVenctos
        TabOrder = 19
      end
      object edtValor2: TDBEdit
        Left = 97
        Top = 99
        Width = 80
        Height = 21
        DataField = 'Valor2'
        DataSource = dtsFaturaVenctos
        TabOrder = 11
      end
      object edtValor1: TDBEdit
        Left = 97
        Top = 58
        Width = 80
        Height = 21
        DataField = 'Valor1'
        DataSource = dtsFaturaVenctos
        TabOrder = 3
      end
      object edtVencto4: TDBDateEdit
        Left = 180
        Top = 58
        Width = 95
        Height = 21
        DataField = 'DataVencto4'
        DataSource = dtsFaturaVenctos
        NumGlyphs = 2
        TabOrder = 4
      end
      object edtVencto5: TDBDateEdit
        Left = 180
        Top = 99
        Width = 95
        Height = 21
        DataField = 'DataVencto5'
        DataSource = dtsFaturaVenctos
        NumGlyphs = 2
        TabOrder = 12
      end
      object edtVencto6: TDBDateEdit
        Left = 180
        Top = 146
        Width = 95
        Height = 21
        DataField = 'DataVencto6'
        DataSource = dtsFaturaVenctos
        NumGlyphs = 2
        TabOrder = 20
      end
      object edtValor6: TDBEdit
        Left = 277
        Top = 146
        Width = 80
        Height = 21
        DataField = 'Valor6'
        DataSource = dtsFaturaVenctos
        TabOrder = 21
      end
      object edtValor5: TDBEdit
        Left = 277
        Top = 99
        Width = 80
        Height = 21
        DataField = 'Valor5'
        DataSource = dtsFaturaVenctos
        TabOrder = 13
      end
      object edtValor4: TDBEdit
        Left = 277
        Top = 58
        Width = 80
        Height = 21
        DataField = 'Valor4'
        DataSource = dtsFaturaVenctos
        TabOrder = 5
      end
      object edtVencto7: TDBDateEdit
        Left = 359
        Top = 58
        Width = 95
        Height = 21
        DataField = 'DataVencto7'
        DataSource = dtsFaturaVenctos
        NumGlyphs = 2
        TabOrder = 6
      end
      object edtVencto8: TDBDateEdit
        Left = 359
        Top = 99
        Width = 95
        Height = 21
        DataField = 'DataVencto8'
        DataSource = dtsFaturaVenctos
        NumGlyphs = 2
        TabOrder = 14
      end
      object edtVencto9: TDBDateEdit
        Left = 359
        Top = 146
        Width = 95
        Height = 21
        DataField = 'DataVencto9'
        DataSource = dtsFaturaVenctos
        NumGlyphs = 2
        TabOrder = 22
      end
      object edtValor9: TDBEdit
        Left = 455
        Top = 146
        Width = 80
        Height = 21
        DataField = 'Valor9'
        DataSource = dtsFaturaVenctos
        TabOrder = 23
      end
      object edtValor8: TDBEdit
        Left = 455
        Top = 99
        Width = 80
        Height = 21
        DataField = 'Valor8'
        DataSource = dtsFaturaVenctos
        TabOrder = 15
      end
      object edtValor7: TDBEdit
        Left = 455
        Top = 58
        Width = 80
        Height = 21
        DataField = 'Valor7'
        DataSource = dtsFaturaVenctos
        TabOrder = 7
      end
      object edtVencto10: TDBDateEdit
        Left = 536
        Top = 58
        Width = 95
        Height = 21
        DataField = 'DataVencto10'
        DataSource = dtsFaturaVenctos
        NumGlyphs = 2
        TabOrder = 8
      end
      object edtVencto11: TDBDateEdit
        Left = 536
        Top = 99
        Width = 95
        Height = 21
        DataField = 'DataVencto11'
        DataSource = dtsFaturaVenctos
        NumGlyphs = 2
        TabOrder = 16
      end
      object edtVencto12: TDBDateEdit
        Left = 536
        Top = 146
        Width = 95
        Height = 21
        DataField = 'DataVencto12'
        DataSource = dtsFaturaVenctos
        NumGlyphs = 2
        TabOrder = 24
      end
      object edtValor12: TDBEdit
        Left = 632
        Top = 146
        Width = 80
        Height = 21
        DataField = 'Valor12'
        DataSource = dtsFaturaVenctos
        TabOrder = 25
      end
      object edtValor11: TDBEdit
        Left = 632
        Top = 99
        Width = 80
        Height = 21
        DataField = 'Valor11'
        DataSource = dtsFaturaVenctos
        TabOrder = 17
      end
      object edtValor10: TDBEdit
        Left = 632
        Top = 58
        Width = 80
        Height = 21
        DataField = 'Valor10'
        DataSource = dtsFaturaVenctos
        TabOrder = 9
      end
    end
    object tbsVolumes: TTabSheet
      Caption = 'Volumes'
      ImageIndex = 2
      object Label20: TLabel
        Left = 8
        Top = 8
        Width = 61
        Height = 13
        Caption = 'Peso Liquido'
      end
      object Label28: TLabel
        Left = 144
        Top = 8
        Width = 52
        Height = 13
        Caption = 'Peso Bruto'
      end
      object Label29: TLabel
        Left = 280
        Top = 8
        Width = 30
        Height = 13
        Caption = 'Marca'
      end
      object Label31: TLabel
        Left = 456
        Top = 8
        Width = 38
        Height = 13
        Caption = 'Esp'#233'cie'
      end
      object Label57: TLabel
        Left = 632
        Top = 8
        Width = 60
        Height = 13
        Caption = 'Qtd Volumes'
      end
      object edtPesoLiquido: TDBEdit
        Left = 8
        Top = 24
        Width = 121
        Height = 21
        DataField = 'PesoLiquido'
        DataSource = dtsBase
        TabOrder = 0
      end
      object edtPesoBruto: TDBEdit
        Left = 144
        Top = 24
        Width = 121
        Height = 21
        DataField = 'PesoBruto'
        DataSource = dtsBase
        TabOrder = 1
      end
      object edtMarca: TDBEdit
        Left = 280
        Top = 24
        Width = 161
        Height = 21
        DataField = 'Marca'
        DataSource = dtsBase
        TabOrder = 2
      end
      object edtEspecie: TDBEdit
        Left = 456
        Top = 24
        Width = 161
        Height = 21
        DataField = 'Especie'
        DataSource = dtsBase
        TabOrder = 3
      end
      object edtQtdVolumes: TDBEdit
        Left = 632
        Top = 24
        Width = 74
        Height = 21
        DataField = 'QtdVolumes'
        DataSource = dtsBase
        TabOrder = 4
      end
    end
    object tbsNFe: TTabSheet
      Caption = 'NF-e'
      ImageIndex = 3
      object pgcImpExp: TPageControl
        Left = 131
        Top = 8
        Width = 579
        Height = 161
        ActivePage = tbsExportacao
        TabOrder = 1
        object tbsExportacao: TTabSheet
          Caption = 'Exporta'#231#227'o'
          ImageIndex = 1
          object Label58: TLabel
            Left = 8
            Top = 8
            Width = 65
            Height = 13
            Caption = 'UF Embarque'
          end
          object Label59: TLabel
            Left = 123
            Top = 8
            Width = 92
            Height = 13
            Caption = 'Local de Embarque'
          end
          object edtUfEmbarque: TDBComboBox
            Left = 8
            Top = 24
            Width = 103
            Height = 21
            DataField = 'UFEmbarque'
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
              'TO')
            TabOrder = 0
          end
          object edtLocalEmbarque: TDBEdit
            Left = 123
            Top = 24
            Width = 198
            Height = 21
            DataField = 'LocalEmbarque'
            DataSource = dtsBase
            TabOrder = 1
          end
        end
        object tbsImportacao: TTabSheet
          Caption = 'Importa'#231#227'o'
          object Label60: TLabel
            Left = 8
            Top = 8
            Width = 19
            Height = 13
            Caption = 'NDI'
          end
          object Label61: TLabel
            Left = 107
            Top = 8
            Width = 87
            Height = 13
            Caption = 'Data Registro NDI'
          end
          object Label62: TLabel
            Left = 219
            Top = 8
            Width = 110
            Height = 13
            Caption = 'Local do Desembara'#231'o'
          end
          object Label63: TLabel
            Left = 8
            Top = 56
            Width = 83
            Height = 13
            Caption = 'UF Desembara'#231'o'
          end
          object Label64: TLabel
            Left = 123
            Top = 56
            Width = 92
            Height = 13
            Caption = 'Data Desembara'#231'o'
          end
          object Label65: TLabel
            Left = 235
            Top = 56
            Width = 102
            Height = 13
            Caption = 'C'#243'digo do Exportador'
          end
          object edtNdi: TDBEdit
            Left = 8
            Top = 24
            Width = 89
            Height = 21
            DataField = 'NDI'
            DataSource = dtsBase
            TabOrder = 0
          end
          object edtDataRegistroNdi: TDBDateEdit
            Left = 107
            Top = 24
            Width = 103
            Height = 21
            DataField = 'DataDI'
            DataSource = dtsBase
            NumGlyphs = 2
            TabOrder = 1
          end
          object edtLocalDesembaraco: TDBEdit
            Left = 219
            Top = 24
            Width = 222
            Height = 21
            DataField = 'LocalDesembaraco'
            DataSource = dtsBase
            TabOrder = 2
          end
          object edtUfDesembaraco: TDBComboBox
            Left = 8
            Top = 72
            Width = 103
            Height = 21
            DataField = 'UFDesembaraco'
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
              'TO')
            TabOrder = 3
          end
          object edtDataDesembaraco: TDBDateEdit
            Left = 123
            Top = 72
            Width = 103
            Height = 21
            DataField = 'DataDesembaraco'
            DataSource = dtsBase
            NumGlyphs = 2
            TabOrder = 4
          end
          object edtCodigoExportador: TDBEdit
            Left = 235
            Top = 72
            Width = 222
            Height = 21
            DataField = 'CodigoExportador'
            DataSource = dtsBase
            TabOrder = 5
          end
        end
      end
      object dbrFormaPagto: TDBRadioGroup
        Left = 8
        Top = 8
        Width = 118
        Height = 74
        Caption = 'Forma de Pagto'
        DataField = 'NFEFormaPagto'
        DataSource = dtsBase
        Items.Strings = (
          '0 = Pagto a Vista'
          '1 = Pagto a Prazo'
          '2 = Outros')
        TabOrder = 0
        Values.Strings = (
          '0'
          '1'
          '2')
      end
      object dbrFreteConta: TDBRadioGroup
        Left = 8
        Top = 88
        Width = 118
        Height = 82
        Caption = 'Frete por Conta'
        DataField = 'FreteConta'
        DataSource = dtsBase
        Items.Strings = (
          '0 = Emitente'
          '1 = Dest. / Rem.'
          '2 = Terceiros'
          '9 = Sem Frete')
        TabOrder = 2
        Values.Strings = (
          '0'
          '1'
          '2'
          '9')
      end
    end
  end
  object dbrTipoMovimento: TDBRadioGroup [34]
    Left = 8
    Top = 48
    Width = 73
    Height = 50
    Caption = 'Movimento'
    DataField = 'TipoNota'
    DataSource = dtsBase
    Items.Strings = (
      'Entrada'
      'Sa'#237'da')
    TabOrder = 8
    Values.Strings = (
      '2'
      '1')
  end
  object edtSerie: TDBEdit [35]
    Left = 97
    Top = 24
    Width = 69
    Height = 21
    DataField = 'Serie'
    DataSource = dtsBase
    TabOrder = 1
    OnExit = edtSerieExit
  end
  object edtValorProdutos: TDBEdit [36]
    Left = 8
    Top = 337
    Width = 97
    Height = 21
    DataField = 'ValorProdutos'
    DataSource = dtsBase
    Enabled = False
    TabOrder = 13
  end
  object edtValorIpi: TDBEdit [37]
    Left = 114
    Top = 337
    Width = 97
    Height = 21
    DataField = 'ValorIPI'
    DataSource = dtsBase
    TabOrder = 14
    OnExit = edtValorIpiExit
  end
  object edtValorFrete: TDBEdit [38]
    Left = 220
    Top = 337
    Width = 97
    Height = 21
    DataField = 'ValorFrete'
    DataSource = dtsBase
    TabOrder = 15
    OnExit = edtValorFreteExit
  end
  object edtValorAcrescimo: TDBEdit [39]
    Left = 324
    Top = 337
    Width = 97
    Height = 21
    DataField = 'ValorAcrescimo'
    DataSource = dtsBase
    TabOrder = 16
    OnExit = edtValorAcrescimoExit
  end
  object edtValorSeguro: TDBEdit [40]
    Left = 8
    Top = 379
    Width = 97
    Height = 21
    DataField = 'ValorSeguro'
    DataSource = dtsBase
    TabOrder = 18
    OnExit = edtValorSeguroExit
  end
  object edtValorTotal: TDBEdit [41]
    Left = 277
    Top = 379
    Width = 144
    Height = 21
    DataField = 'ValorTotal'
    DataSource = dtsBase
    Enabled = False
    TabOrder = 21
  end
  object edtValorDesconto: TDBEdit [42]
    Left = 114
    Top = 379
    Width = 97
    Height = 21
    DataField = 'ValorDesconto'
    DataSource = dtsBase
    TabOrder = 19
    OnExit = edtValorDescontoExit
  end
  object edtPercDesconto: TDBEdit [43]
    Left = 220
    Top = 379
    Width = 49
    Height = 21
    DataField = 'PercDesc'
    DataSource = dtsBase
    TabOrder = 20
    OnExit = edtPercDescontoExit
  end
  object edtObservacoes: TDBMemo [44]
    Left = 430
    Top = 337
    Width = 302
    Height = 64
    DataField = 'Observacao'
    DataSource = dtsBase
    TabOrder = 17
  end
  object edtResponsavel: TDBLookupComboBox [45]
    Left = 8
    Top = 423
    Width = 265
    Height = 21
    DataField = 'CodigoFuncionario'
    DataSource = dtsBase
    KeyField = 'Codigo'
    ListField = 'Nome'
    ListSource = dtsFuncionarios
    TabOrder = 22
  end
  object edtCsosn: TDBComboBox [46]
    Left = 283
    Top = 423
    Width = 139
    Height = 21
    Style = csDropDownList
    DataField = 'CSTCSOSN'
    DataSource = dtsBase
    ItemHeight = 13
    TabOrder = 23
  end
  object cbbNatureza: TcxDBLookupComboBox [47]
    Left = 432
    Top = 424
    DataBinding.DataField = 'CodigoCFOP'
    DataBinding.DataSource = dtsBase
    Properties.KeyFieldNames = 'CodigoCFOP'
    Properties.ListColumns = <
      item
        Caption = 'CFOP - Descri'#231#227'o'
        FieldName = 'CFOP_DESC'
      end>
    Properties.ListSource = dtsCFOP
    TabOrder = 25
    OnEnter = cbbNaturezaEnter
    Width = 297
  end
  inherited popGrid: TPopupMenu
    Left = 616
    Top = 456
  end
  inherited tabBase: TZQuery
    Connection = fmMenu.zcnConexao
    Left = 777
    Top = 16
  end
  inherited dtsBase: TDataSource
    OnDataChange = dtsBaseDataChange
    Left = 878
    Top = 16
  end
  inherited popOpcoes: TPopupMenu
    Left = 499
    Top = 456
    object DefinirAnoBase1: TMenuItem
      Caption = 'Definir Ano Base'
      OnClick = DefinirAnoBase1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object CancelarNotaFiscal1: TMenuItem
      Caption = 'Cancelar Nota Fiscal'
      OnClick = CancelarNotaFiscal1Click
    end
    object ReEmissodaNFe1: TMenuItem
      Caption = 'Re-enviar NFe'
      OnClick = ReEmissodaNFe1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object ransmitirNota1: TMenuItem
      Caption = 'Transmitir Nota'
      OnClick = ransmitirNota1Click
    end
  end
  object tabConta: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 777
    Top = 64
  end
  object dtsConta: TDataSource
    AutoEdit = False
    DataSet = tabConta
    Left = 878
    Top = 64
  end
  object tabTransportadoras: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 777
    Top = 112
  end
  object dtsTransportadoras: TDataSource
    AutoEdit = False
    DataSet = tabTransportadoras
    Left = 878
    Top = 112
  end
  object tabCFOP: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 777
    Top = 160
    object tabCFOPCodigoCFOP: TFloatField
      FieldName = 'CodigoCFOP'
      Required = True
    end
    object strngfldCFOPCFOP: TStringField
      FieldName = 'CFOP'
      Size = 5
    end
    object strngfldCFOPNaturezaOperacao: TStringField
      FieldName = 'NaturezaOperacao'
      Size = 100
    end
    object strngfldCFOPCFOP_DESC: TStringField
      FieldName = 'CFOP_DESC'
      ReadOnly = True
      Size = 108
    end
  end
  object dtsCFOP: TDataSource
    AutoEdit = False
    DataSet = tabCFOP
    Left = 878
    Top = 160
  end
  object tabTabelaPreco: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 777
    Top = 208
  end
  object dtsTabelaPreco: TDataSource
    AutoEdit = False
    DataSet = tabTabelaPreco
    Left = 878
    Top = 208
  end
  object tabEmpresas: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 777
    Top = 256
  end
  object dtsEmpresas: TDataSource
    AutoEdit = False
    DataSet = tabEmpresas
    Left = 878
    Top = 256
  end
  object tabFaturaProdutos: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 777
    Top = 304
  end
  object dtsFaturaProdutos: TDataSource
    AutoEdit = False
    DataSet = tabFaturaProdutos
    Left = 878
    Top = 304
  end
  object tabFormasPagto: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 777
    Top = 352
  end
  object dtsFormasPagto: TDataSource
    AutoEdit = False
    DataSet = tabFormasPagto
    Left = 878
    Top = 352
  end
  object tabFaturaVenctos: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 777
    Top = 400
  end
  object dtsFaturaVenctos: TDataSource
    AutoEdit = False
    DataSet = tabFaturaVenctos
    Left = 878
    Top = 400
  end
  object tabAuxiliarProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 776
    Top = 448
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
    end
    object tabAuxiliarProdutosValorTotal: TCurrencyField
      FieldName = 'ValorTotal'
    end
    object tabAuxiliarProdutosNCM: TStringField
      FieldName = 'NCM'
      Size = 10
    end
    object tabAuxiliarProdutosUnidade: TStringField
      FieldName = 'Unidade'
      Size = 3
    end
  end
  object dtsAuxiliarProdutos: TDataSource
    AutoEdit = False
    DataSet = tabAuxiliarProdutos
    Left = 880
    Top = 447
  end
  object tabChecagens: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 777
    Top = 544
  end
  object tabAuxiliarVenctos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 776
    Top = 496
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
    Left = 880
    Top = 495
  end
  object tabFuncionarios: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 777
    Top = 592
  end
  object dtsFuncionarios: TDataSource
    AutoEdit = False
    DataSet = tabFuncionarios
    Left = 878
    Top = 592
  end
  object tabXML: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 641
    Top = 512
  end
  object tabChecagens2: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 881
    Top = 544
  end
end

inherited fmLoteProducao: TfmLoteProducao
  Left = 234
  Top = 43
  Caption = 'Lote de Produ'#231#227'o'
  ClientHeight = 600
  ClientWidth = 704
  KeyPreview = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoes: TPanel
    Top = 539
    Width = 704
    inherited btnLocalizar: TSpeedButton
      OnClick = btnLocalizarClick
    end
  end
  object pnl1: TPanel [1]
    Left = 0
    Top = 0
    Width = 704
    Height = 185
    Align = alTop
    TabOrder = 1
    object lbl7: TLabel
      Left = 16
      Top = 8
      Width = 21
      Height = 13
      Caption = 'Lote'
    end
    object lbl8: TLabel
      Left = 125
      Top = 8
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object lbl9: TLabel
      Left = 237
      Top = 8
      Width = 23
      Height = 13
      Caption = 'Hora'
    end
    object lbl10: TLabel
      Left = 319
      Top = 8
      Width = 67
      Height = 13
      Caption = 'Data Previs'#227'o'
    end
    object lbl11: TLabel
      Left = 438
      Top = 8
      Width = 64
      Height = 13
      Caption = 'Data T'#233'rmino'
    end
    object lbl2: TLabel
      Left = 13
      Top = 48
      Width = 55
      Height = 13
      Caption = 'Quantidade'
    end
    object lbl3: TLabel
      Left = 127
      Top = 48
      Width = 60
      Height = 13
      Caption = 'Lote Compra'
    end
    object lbl6: TLabel
      Left = 13
      Top = 96
      Width = 55
      Height = 13
      Caption = 'Quantidade'
    end
    object lbl12: TLabel
      Left = 237
      Top = 48
      Width = 62
      Height = 13
      Caption = 'Respons'#225'vel'
    end
    object lbl13: TLabel
      Left = 550
      Top = 8
      Width = 124
      Height = 13
      Caption = 'Gera'#231#227'o Ordem Produ'#231#227'o'
    end
    object edtCodigoLoteProducao: TEdit
      Left = 16
      Top = 24
      Width = 97
      Height = 21
      TabOrder = 0
      OnKeyPress = edtCodigoLoteProducaoKeyPress
      OnKeyUp = edtCodigoLoteProducaoKeyUp
    end
    object edtData: TDBDateEdit
      Left = 125
      Top = 24
      Width = 107
      Height = 21
      DataField = 'Data'
      DataSource = dtsBase
      NumGlyphs = 2
      TabOrder = 1
    end
    object edtHora: TDBEdit
      Left = 237
      Top = 24
      Width = 76
      Height = 21
      DataField = 'Hora'
      DataSource = dtsBase
      TabOrder = 2
    end
    object edtDataPrevisao: TDBDateEdit
      Left = 319
      Top = 24
      Width = 107
      Height = 21
      DataField = 'DataPrevisao'
      DataSource = dtsBase
      NumGlyphs = 2
      TabOrder = 3
    end
    object edtDataTermino: TDBDateEdit
      Left = 438
      Top = 24
      Width = 107
      Height = 21
      DataField = 'DataTermino'
      DataSource = dtsBase
      Enabled = False
      NumGlyphs = 2
      TabOrder = 4
    end
    object edtObservacao: TDBMemo
      Left = 15
      Top = 114
      Width = 674
      Height = 55
      DataField = 'Observacoes'
      DataSource = dtsBase
      TabOrder = 5
    end
    object edtCodigoResponsavel: TDBEdit
      Left = 237
      Top = 64
      Width = 54
      Height = 21
      DataField = 'CodigoFuncionario'
      DataSource = dtsBase
      TabOrder = 6
    end
    object edtResponsavel: TDBLookupComboBox
      Left = 294
      Top = 64
      Width = 251
      Height = 21
      DataField = 'CodigoFuncionario'
      DataSource = dtsBase
      KeyField = 'Codigo'
      ListField = 'Nome'
      ListSource = dtsFuncionarios
      TabOrder = 7
    end
    object edtCodigoFuncionario1: TDBEdit
      Left = 128
      Top = 64
      Width = 97
      Height = 21
      DataField = 'CodigoLoteCompra'
      DataSource = dtsBase
      ReadOnly = True
      TabOrder = 8
    end
    object edtCodigoLoteCompra: TDBEdit
      Left = 16
      Top = 64
      Width = 97
      Height = 21
      DataField = 'Quantidade'
      DataSource = dtsBase
      ReadOnly = True
      TabOrder = 9
    end
    object edtDataTermino1: TDBDateEdit
      Left = 550
      Top = 24
      Width = 123
      Height = 21
      DataField = 'DataGeracaoOrdemProducao'
      DataSource = dtsBase
      Enabled = False
      NumGlyphs = 2
      TabOrder = 10
    end
  end
  object dbgFichaTecnica: TcxGrid [2]
    Left = 0
    Top = 241
    Width = 673
    Height = 298
    Align = alClient
    TabOrder = 2
    object tvwFichaTecnica: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dtsLoteProducaoPedidos
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      object clmPosicao: TcxGridDBColumn
        Caption = 'Posi'#231#227'o'
        DataBinding.FieldName = 'Posicao'
        Width = 62
      end
      object clmOrdemProducao: TcxGridDBColumn
        Caption = 'Ficha'
        DataBinding.FieldName = 'OrdemProducao'
      end
      object clmPedido: TcxGridDBColumn
        Caption = 'Pedido'
        DataBinding.FieldName = 'CodigoPedido'
        Width = 71
      end
      object clmCliente: TcxGridDBColumn
        Caption = 'Cliente'
        DataBinding.FieldName = 'RazaoSocial'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.ListColumns = <>
        Width = 102
      end
      object clmPrazoEntrega: TcxGridDBColumn
        Caption = 'Prazo Entrega'
        Width = 128
      end
      object clmQuantidade: TcxGridDBColumn
        DataBinding.FieldName = 'Quantidade'
        Width = 84
      end
    end
    object lvlFichaTecnica: TcxGridLevel
      GridView = tvwFichaTecnica
    end
  end
  object pnl2: TPanel [3]
    Left = 0
    Top = 185
    Width = 704
    Height = 56
    Align = alTop
    TabOrder = 3
    object lbl1: TLabel
      Left = 8
      Top = 11
      Width = 58
      Height = 13
      Caption = 'C'#243'd. Pedido'
    end
    object lbl4: TLabel
      Left = 348
      Top = 11
      Width = 38
      Height = 13
      Caption = 'Posi'#231#227'o'
    end
    object lbl5: TLabel
      Left = 124
      Top = 11
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object btnPedidoAdicionar: TBitBtn
      Left = 423
      Top = 22
      Width = 29
      Height = 22
      TabOrder = 0
      OnClick = btnPedidoAdicionarClick
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
    object btnPedidosLocalizar: TBitBtn
      Left = 88
      Top = 23
      Width = 29
      Height = 22
      TabOrder = 1
      OnClick = btnPedidosLocalizarClick
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
    object edtCodigoPedido: TEdit
      Left = 8
      Top = 24
      Width = 78
      Height = 21
      TabOrder = 2
      OnChange = edtCodigoPedidoChange
    end
    object edtClienteRazaoSocial: TEdit
      Left = 124
      Top = 24
      Width = 217
      Height = 21
      ReadOnly = True
      TabOrder = 3
    end
    object edtPosicao: TEdit
      Left = 348
      Top = 24
      Width = 69
      Height = 21
      TabOrder = 4
    end
  end
  object pnl3: TPanel [4]
    Left = 673
    Top = 241
    Width = 31
    Height = 298
    Align = alRight
    AutoSize = True
    TabOrder = 4
    object btnPedidoRemover: TBitBtn
      Left = 1
      Top = 4
      Width = 29
      Height = 22
      TabOrder = 0
      OnClick = btnPedidoRemoverClick
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
  end
  inherited popGrid: TPopupMenu
    Left = 936
    Top = 288
  end
  inherited tabBase: TZQuery
    Connection = fmMenu.zcnConexao
    SQL.Strings = (
      'select * from lote_producao')
    Left = 704
    Top = 8
  end
  inherited dtsBase: TDataSource
    OnDataChange = dtsBaseDataChange
    Left = 816
    Top = 0
  end
  inherited popOpcoes: TPopupMenu
    Left = 512
    Top = 464
    object mniGerarFichaProducao: TMenuItem
      Caption = 'Gerar Ordem de Produ'#231#227'o'
      OnClick = mniGerarFichaProducaoClick
    end
    object mniExcluirFichaProducao: TMenuItem
      Caption = 'Excluir Ordem de Produ'#231#227'o'
      OnClick = mniExcluirFichaProducaoClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object EmissodaOP1: TMenuItem
      Caption = 'Emiss'#227'o da O.P.'
    end
    object RelaodeOPsPendentes1: TMenuItem
      Caption = 'Rela'#231#227'o de O.Ps Pendentes / Baixadas'
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object FichadeProduo1: TMenuItem
      Caption = 'Ficha de Produ'#231#227'o'
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object EtiquetasdeProdutos1: TMenuItem
      Caption = 'Etiquetas de Produtos'
    end
  end
  object tabClientes: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 704
    Top = 56
  end
  object dtsClientes: TDataSource
    AutoEdit = False
    DataSet = tabClientes
    Left = 904
    Top = 64
  end
  object tabChecagens: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 704
    Top = 168
  end
  object tabFuncionarios: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 704
    Top = 216
  end
  object dtsFuncionarios: TDataSource
    AutoEdit = False
    DataSet = tabFuncionarios
    Left = 808
    Top = 216
  end
  object tabSetor: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 704
    Top = 312
  end
  object dtsSetor: TDataSource
    AutoEdit = False
    DataSet = tabSetor
    Left = 776
    Top = 312
  end
  object tabLoteProducaoPedidos: TZQuery
    Connection = fmMenu.zcnConexao
    SQL.Strings = (
      'select * from lote_producao_pedidos')
    Params = <>
    Left = 704
    Top = 368
    object tabLoteProducaoPedidosCodigoLoteProducaoPedidos: TFloatField
      FieldName = 'CodigoLoteProducaoPedidos'
      Required = True
    end
    object tabLoteProducaoPedidosCodigoLoteProducao: TFloatField
      FieldName = 'CodigoLoteProducao'
      Required = True
    end
    object tabLoteProducaoPedidosCodigoPedido: TFloatField
      FieldName = 'CodigoPedido'
      Required = True
    end
    object tabLoteProducaoPedidosPosicao: TFloatField
      FieldName = 'Posicao'
      Required = True
    end
    object tabLoteProducaoPedidosQuantidade: TFloatField
      FieldName = 'Quantidade'
      Required = True
    end
    object tabLoteProducaoPedidosOrdemProducao: TFloatField
      FieldName = 'OrdemProducao'
    end
  end
  object dtsLoteProducaoPedidos: TDataSource
    AutoEdit = False
    DataSet = tabLoteProducaoPedidos
    Left = 840
    Top = 368
  end
  object tabAuxiliarLotePedi: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp1'
    Left = 160
    Top = 288
    object tabAuxiliarLotePediCodigoLoteProducaoPedidos: TFloatField
      FieldName = 'CodigoLoteProducaoPedidos'
    end
    object tabAuxiliarLotePediCodigoLoteProducao: TFloatField
      FieldName = 'CodigoLoteProducao'
    end
    object tabAuxiliarLotePediCodigoPedido: TFloatField
      FieldName = 'CodigoPedido'
    end
    object tabAuxiliarLotePediPosicao: TFloatField
      FieldName = 'Posicao'
    end
    object tabAuxiliarLotePediQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
    object tabAuxiliarLotePediOrdemProducao: TFloatField
      FieldName = 'OrdemProducao'
    end
  end
  object dtsAuxiliarLotePedi: TDataSource
    AutoEdit = False
    DataSet = tabAuxiliarLotePedi
    Left = 856
    Top = 423
  end
  object tabAuxAtualiza: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 696
    Top = 496
    object tabAuxAtualizaCodigoPedido: TStringField
      FieldName = 'CodigoPedido'
    end
  end
  object tabOrdemProducao: TZQuery
    Connection = fmMenu.zcnConexao
    SQL.Strings = (
      'select * from lote_producao')
    Params = <>
    Left = 728
    Top = 432
  end
  object tabOrdemProducaoProdutos: TZQuery
    Connection = fmMenu.zcnConexao
    SQL.Strings = (
      'select * from lote_producao')
    Params = <>
    Left = 784
    Top = 504
  end
  object tabPedidos: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 712
    Top = 112
  end
  object tabPedidosProdutos: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 776
    Top = 104
  end
end

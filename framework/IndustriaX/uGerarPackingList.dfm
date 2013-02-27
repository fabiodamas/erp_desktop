inherited fmGerarPackingList: TfmGerarPackingList
  Left = 234
  Top = 154
  Caption = 'Gerar Packing List'
  ClientHeight = 443
  ClientWidth = 600
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 192
    Width = 179
    Height = 37
    Caption = 'Caixa Num:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel [1]
    Left = 257
    Top = 192
    Width = 73
    Height = 37
    Caption = 'C'#243'd:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel [2]
    Left = 397
    Top = 192
    Width = 87
    Height = 37
    Caption = 'Peso:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dbgProdutos: TDBGrid [3]
    Left = 8
    Top = 8
    Width = 584
    Height = 173
    DataSource = dtsAuxProdutos
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = dbgProdutosCellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CodigoProduto'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Width = 365
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantidade'
        Visible = True
      end>
  end
  object edtCaixaNumero: TEdit [4]
    Left = 191
    Top = 194
    Width = 61
    Height = 32
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = '1'
  end
  object edtCodigo: TEdit [5]
    Left = 332
    Top = 194
    Width = 61
    Height = 32
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object dbgPackingList: TDBGrid [6]
    Left = 8
    Top = 264
    Width = 551
    Height = 139
    DataSource = dtsAuxPackingList
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CaixaNum'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CodigoCaixa'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CodigoProduto'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DescricaoProduto'
        Title.Caption = 'Produto'
        Width = 196
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Peso'
        Visible = True
      end>
  end
  object edtCodigoProduto: TEdit [7]
    Left = 8
    Top = 240
    Width = 97
    Height = 21
    TabOrder = 5
  end
  object edtDescricaoProduto: TEdit [8]
    Left = 112
    Top = 240
    Width = 386
    Height = 21
    Enabled = False
    TabOrder = 6
  end
  object edtQuantidadeProduto: TCurrencyEdit [9]
    Left = 506
    Top = 240
    Width = 85
    Height = 21
    AutoSize = False
    DisplayFormat = '0.00;-0.00'
    TabOrder = 7
  end
  object btnProdutoAdicionar: TBitBtn [10]
    Left = 562
    Top = 264
    Width = 29
    Height = 22
    TabOrder = 8
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
  object btnProdutoRemover: TBitBtn [11]
    Left = 562
    Top = 289
    Width = 29
    Height = 22
    TabOrder = 9
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
  object btnConfirmar: TBitBtn [12]
    Left = 329
    Top = 411
    Width = 129
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 10
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
  object btnFechar: TBitBtn [13]
    Left = 463
    Top = 411
    Width = 129
    Height = 25
    Caption = 'Fechar'
    TabOrder = 11
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
  object edtPeso: TCurrencyEdit [14]
    Left = 485
    Top = 194
    Width = 107
    Height = 32
    AutoSize = False
    DecimalPlaces = 3
    DisplayFormat = '0.000;-0.000'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object tabPedidosProdutos: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 136
    Top = 16
  end
  object dtsPedidosProdutos: TDataSource
    AutoEdit = False
    DataSet = tabPedidosProdutos
    Left = 264
    Top = 16
  end
  object tabAuxPackingList: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 104
    Top = 304
    object tabAuxPackingListCaixaNum: TIntegerField
      FieldName = 'CaixaNum'
    end
    object tabAuxPackingListCodigoCaixa: TStringField
      FieldName = 'CodigoCaixa'
    end
    object tabAuxPackingListCodigoProduto: TStringField
      FieldName = 'CodigoProduto'
    end
    object tabAuxPackingListDescricaoProduto: TStringField
      FieldName = 'DescricaoProduto'
      Size = 50
    end
    object tabAuxPackingListQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
    object tabAuxPackingListPeso: TFloatField
      FieldName = 'Peso'
    end
  end
  object dtsAuxPackingList: TDataSource
    AutoEdit = False
    DataSet = tabAuxPackingList
    Left = 240
    Top = 304
  end
  object tabPedidos: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 136
    Top = 72
  end
  object tabPackingList: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 136
    Top = 128
  end
  object tabPackingListProdutos: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 256
    Top = 104
  end
  object tabAuxCaixas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 368
    object tabAuxCaixasCaixaNum: TIntegerField
      FieldName = 'CaixaNum'
    end
  end
  object tabAuxProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 408
    Top = 48
    object tabAuxProdutosCodigoProduto: TStringField
      FieldName = 'CodigoProduto'
    end
    object tabAuxProdutosDescricao: TStringField
      FieldName = 'Descricao'
      Size = 60
    end
    object tabAuxProdutosQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
  end
  object dtsAuxProdutos: TDataSource
    AutoEdit = False
    DataSet = tabAuxProdutos
    Left = 488
    Top = 48
  end
end
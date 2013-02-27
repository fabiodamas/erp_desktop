inherited fmGerarParticipacaoVendedores: TfmGerarParticipacaoVendedores
  Left = 233
  Top = 154
  Caption = 'Gerar Participa'#231#227'o Vendedores'
  ClientHeight = 142
  ClientWidth = 241
  Scaled = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel [0]
    Left = 8
    Top = 8
    Width = 67
    Height = 13
    Caption = 'Entrega Inicial'
    FocusControl = edtDataInicial
  end
  object Label1: TLabel [1]
    Left = 128
    Top = 8
    Width = 62
    Height = 13
    Caption = 'Entrega Final'
    FocusControl = edtDataFinal
  end
  object gagProgresso: TGauge [2]
    Left = 8
    Top = 117
    Width = 225
    Height = 17
    Progress = 0
  end
  object edtDataInicial: TDateEdit [3]
    Left = 8
    Top = 24
    Width = 105
    Height = 21
    NumGlyphs = 2
    YearDigits = dyFour
    TabOrder = 0
  end
  object btnConfirmar: TBitBtn [4]
    Left = 8
    Top = 53
    Width = 110
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 2
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
  object btnFechar: TBitBtn [5]
    Left = 123
    Top = 53
    Width = 110
    Height = 25
    Caption = 'Fechar'
    TabOrder = 3
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
  object edtDataFinal: TDateEdit [6]
    Left = 128
    Top = 24
    Width = 105
    Height = 21
    NumGlyphs = 2
    YearDigits = dyFour
    TabOrder = 1
  end
  object btnConferencia: TBitBtn [7]
    Left = 8
    Top = 85
    Width = 225
    Height = 25
    Caption = 'Imprimir Lista para Confer'#234'ncia'
    TabOrder = 4
    OnClick = btnConferenciaClick
    Glyph.Data = {
      36060000424D3606000000000000360000002800000020000000100000000100
      18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FF6C6A6A6C6A6AFF00FFFF00FF6C6A6A6C6A6AFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF989898989898FF00FFFF
      00FF989898989898FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF6C6A6AAAA7A7A19F9F6C6A6A6C6A6A6C6A6AE5E3E36C6A6A6C6A6A6C6A
      6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF989898BFBFBFBABABA98989898
      9898989898E1E1E1989898989898989898FF00FFFF00FFFF00FFFF00FFFF00FF
      6C6A6ADAD9D9A19F9FA19F9FA19F9F3736363535356C6D6DBFBFBFE1E2E2B7B6
      B66C6A6A6C6A6A6C6A6AFF00FFFF00FF989898DBDBDBBABABABABABABABABA72
      7272717171999999CCCCCCDFDFDFC7C7C7989898989898989898FF00FF6C6A6A
      D4D3D3CACACA8E8C8C8E8C8C8E8C8C3C3B3B0A090A0707070B0B0B0707077A7A
      7ABBBBBB6C6A6AFF00FFFF00FF989898D7D7D7D3D3D3AEAEAEAEAEAEAEAEAE76
      7676474747454545494949454545A2A2A2CACACA989898FF00FF6C6A6ACACACA
      CACACA8E8C8CD7D4D4CECBCBBFBCBCB1AFAFA3A0A08886865E5B5C0707070909
      090808086C6A6A767373989898D3D3D3D3D3D3AEAEAED9D9D9D3D3D3CBCBCBC3
      C3C3BABABAAAAAAA8E8E8E4545454747474646469898989D9D9D6C6A6ACACACA
      8E8C8CEFEEEEFFFEFEFBFAFAE3E0E1DEDEDEDEDDDDCFCECEBDBCBCADABAB8B89
      895856567A7878757373989898D3D3D3AEAEAEE6E6E6EFEFEFEDEDEDDFDFDFDE
      DEDEDDDDDDD4D4D4CACACAC1C1C1ACACAC8A8A8AA1A1A19D9D9D6C6A6A8E8C8C
      FFFFFFFEFCFCFAFAFAD5D4D5989193A09899B2ABACC4C0C1D7D7D7D8D8D8C7C6
      C6B7B6B6918F8F6C6969989898AEAEAEEFEFEFEFEFEFEDEDEDD8D8D8B3B3B3B7
      B7B7C2C2C2CDCDCDDADADADBDBDBD0D0D0C7C7C7AFAFAF979797FF00FF6C6A6A
      6C6A6AEDEBEBB1A6A77A6F728A83889692959690919D97989A93959E9899BBBA
      BAD1D1D1C2C2C26C6A6AFF00FF989898989898E6E6E6C1C1C19E9E9EAAAAAAB2
      B2B2B1B1B1B6B6B6B4B4B4B7B7B7C9C9C9D7D7D7CECECE989898FF00FFFF00FF
      FF00FF6C6A6ABB897FA7876D8B6F647D67606F62657973798F8B8EA9A3A4CBCA
      CAC1C1C16C6A6AFF00FFFF00FFFF00FFFF00FF989898A7A7A79999998A8A8A9A
      9A9A9696969F9F9FAEAEAEBDBDBDD3D3D3CDCDCD989898FF00FFFF00FFFF00FF
      FF00FFFF00FFBD8281FFE3B4FFD39FE9B281C99973BA916CBD8281807D7E6C6A
      6A6C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA9A9A9D3D3D3CCCCCCB8
      B8B8A7A7A79F9F9FA9A9A9A5A5A5989898989898FF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFBD8281FFE0B8FFD3A7FFD09DFFCE90FFC688BD8281FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA9A9A9D5D5D5CFCFCFCB
      CBCBC6C6C6C3C3C3A9A9A9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFC08683FFE7CFFFE0C0FFD9B2FFD3A5FFD099BD8281FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFABABABDDDDDDD8D8D8D3D3D3CE
      CECECACACAA9A9A9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFBD8281FEEBD8FFE6CCFFDEBDFFD8B1FED3A4BD8281FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA9A9A9E0E0E0DCDCDCD7D7D7D3
      D3D3CDCDCDA9A9A9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      BD8281FFFFF2FFFFF2FFEBD8FFE5CAFFE1BDF3C7A7BD8281FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFA9A9A9EAEAEAEAEAEAE1E1E1DCDCDCD7
      D7D7CBCBCBA9A9A9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      BD8281BD8281BD8281FBEFE2FBE3CFFBDDC2BD8281FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFA9A9A9A9A9A9A9A9A9E3E3E3DCDCDCD8
      D8D8A9A9A9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFBD8281BD8281BD8281FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA9A9A9A9A9A9A9
      A9A9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    NumGlyphs = 2
  end
  object qrpParticipacao: TQuickRep [8]
    Left = 13
    Top = 319
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE'
      'QRSTRINGSBAND1')
    Functions.DATA = (
      '0'
      '0'
      #39#39
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Values = (
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    object QRSubDetail1: TQRSubDetail
      Left = 38
      Top = 73
      Width = 718
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        42.333333333333340000
        1899.708333333333000000)
      Master = qrpParticipacao
      DataSet = tabAuxConferencia
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText3: TQRDBText
        Left = 1
        Top = 1
        Width = 40
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          2.645833333333333000
          2.645833333333333000
          105.833333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tabAuxConferencia
        DataField = 'NPedido'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText7: TQRDBText
        Left = 64
        Top = 1
        Width = 39
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          169.333333333333300000
          2.645833333333333000
          103.187500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tabAuxConferencia
        DataField = 'Entrega'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText1: TQRDBText
        Left = 162
        Top = 1
        Width = 63
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          428.625000000000000000
          2.645833333333333000
          166.687500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tabAuxConferencia
        DataField = 'Participantes'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 530
        Top = 1
        Width = 59
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1402.291666666667000000
          2.645833333333333000
          156.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tabAuxConferencia
        DataField = 'Observacao'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object QRBand1: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 35
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        92.604166666666680000
        1899.708333333333000000)
      BandType = rbPageHeader
      object QRShape1: TQRShape
        Left = -1
        Top = 18
        Width = 719
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          -2.645833333333333000
          47.625000000000000000
          1902.354166666667000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlTitulo: TQRLabel
        Left = 267
        Top = 1
        Width = 183
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          706.437500000000000000
          2.645833333333333000
          484.187500000000000000)
        Alignment = taCenter
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'Participa'#231#227'o de Vendedores'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 1
        Top = 20
        Width = 33
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          2.645833333333333000
          52.916666666666660000
          87.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Pedido'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel5: TQRLabel
        Left = 64
        Top = 20
        Width = 39
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          169.333333333333300000
          52.916666666666660000
          103.187500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Entrega'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel1: TQRLabel
        Left = 162
        Top = 20
        Width = 63
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          428.625000000000000000
          52.916666666666660000
          166.687500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Participantes'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel2: TQRLabel
        Left = 530
        Top = 20
        Width = 59
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1402.291666666667000000
          52.916666666666660000
          156.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Observa'#231#227'o'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
    end
    object QRBand3: TQRBand
      Left = 38
      Top = 89
      Width = 718
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        47.625000000000000000
        1899.708333333333000000)
      BandType = rbPageFooter
      object qrlSignature: TQRLabel
        Left = 1
        Top = 3
        Width = 39
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          2.645833333333333000
          7.937500000000000000
          103.187500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'RINSoft'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRSysData1: TQRSysData
        Left = 320
        Top = 3
        Width = 77
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          846.666666666666600000
          7.937500000000000000
          203.729166666666700000)
        Alignment = taCenter
        AlignToBand = True
        AutoSize = True
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Text = 'P'#225'gina:'
        Transparent = False
        FontSize = 8
      end
      object QRShape2: TQRShape
        Left = -1
        Top = 1
        Width = 720
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          -2.645833333333333000
          2.645833333333333000
          1905.000000000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRSysData2: TQRSysData
        Left = 622
        Top = 3
        Width = 96
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1645.708333333333000000
          7.937500000000000000
          254.000000000000000000)
        Alignment = taRightJustify
        AlignToBand = True
        AutoSize = True
        Color = clWhite
        Data = qrsDateTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Text = 'Emitido:'
        Transparent = False
        FontSize = 8
      end
    end
  end
  object tabPedidos: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 408
    Top = 8
  end
  object tabFuncionarios: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 408
    Top = 56
  end
  object tabFuncDeptos: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 408
    Top = 104
  end
  object tabAusencias: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 408
    Top = 152
  end
  object tabParticipacao: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 408
    Top = 200
  end
  object tabAuxConferencia: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 408
    Top = 256
    object tabAuxConferenciaNPedido: TFloatField
      FieldName = 'NPedido'
    end
    object tabAuxConferenciaEntrega: TDateField
      FieldName = 'Entrega'
    end
    object tabAuxConferenciaParticipantes: TStringField
      FieldName = 'Participantes'
      Size = 255
    end
    object tabAuxConferenciaObservacao: TStringField
      FieldName = 'Observacao'
      Size = 30
    end
  end
  object dtsAuxConferencia: TDataSource
    AutoEdit = False
    DataSet = tabAuxConferencia
    OnDataChange = dtsAuxConferenciaDataChange
    Left = 512
    Top = 256
  end
end

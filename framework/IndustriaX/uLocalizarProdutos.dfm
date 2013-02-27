inherited fmLocalizarProdutos: TfmLocalizarProdutos
  Left = 232
  Top = 153
  Caption = 'Localizar Produtos'
  ClientHeight = 463
  ClientWidth = 584
  Scaled = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_codigo: TLabel [0]
    Left = 8
    Top = 8
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
    FocusControl = edtCodigoProduto
  end
  object Label1: TLabel [1]
    Left = 131
    Top = 8
    Width = 70
    Height = 13
    Caption = 'Nome T'#233'cnico'
    FocusControl = edtNomeTecnico
  end
  object Label3: TLabel [2]
    Left = 8
    Top = 48
    Width = 29
    Height = 13
    Caption = 'Grupo'
  end
  object Label34: TLabel [3]
    Left = 295
    Top = 50
    Width = 35
    Height = 13
    Caption = 'Modelo'
  end
  object Label2: TLabel [4]
    Left = 8
    Top = 432
    Width = 73
    Height = 14
    Caption = 'Selecionado'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel [5]
    Left = 463
    Top = 8
    Width = 52
    Height = 13
    Caption = 'Refer'#234'ncia'
    FocusControl = edtReferencia
  end
  object edtCodigoProduto: TEdit [6]
    Left = 8
    Top = 24
    Width = 113
    Height = 21
    TabOrder = 0
    OnKeyPress = edtCodigoProdutoKeyPress
    OnKeyUp = edtCodigoProdutoKeyUp
  end
  object edtNomeTecnico: TEdit [7]
    Left = 131
    Top = 24
    Width = 326
    Height = 21
    TabOrder = 1
    OnKeyUp = edtNomeTecnicoKeyUp
  end
  object edtGrupo: TDBLookupComboBox [8]
    Left = 8
    Top = 64
    Width = 281
    Height = 21
    KeyField = 'Codigo'
    ListField = 'Descricao'
    ListSource = dtsGrupos
    TabOrder = 3
    OnCloseUp = edtGrupoCloseUp
  end
  object edtModelo: TDBLookupComboBox [9]
    Left = 295
    Top = 64
    Width = 281
    Height = 21
    KeyField = 'Codigo'
    ListField = 'Descricao'
    ListSource = dtsModelos
    TabOrder = 4
    OnCloseUp = edtModeloCloseUp
  end
  object dbgLocalizarProdutos: TDBGrid [10]
    Left = 8
    Top = 95
    Width = 567
    Height = 305
    DataSource = dtsProdutos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = dbgLocalizarProdutosCellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CodigoProduto'
        Title.Caption = 'C'#243'digo Produto'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeTecnico'
        Width = 360
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Disponivel'
        Title.Caption = 'Dispon'#237'vel'
        Visible = True
      end>
  end
  object edtCodigoSelecionado: TEdit [11]
    Left = 8
    Top = 406
    Width = 89
    Height = 21
    TabOrder = 6
  end
  object edtNomeSelecionado: TEdit [12]
    Left = 104
    Top = 406
    Width = 470
    Height = 21
    TabOrder = 7
  end
  object btnOK: TBitBtn [13]
    Left = 388
    Top = 433
    Width = 90
    Height = 25
    Caption = 'OK'
    TabOrder = 8
    OnClick = btnOKClick
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
  object btnCancelar: TBitBtn [14]
    Left = 484
    Top = 433
    Width = 90
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 9
    OnClick = btnCancelarClick
    Glyph.Data = {
      36060000424D3606000000000000360000002800000020000000100000000100
      18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FF000288010893010B99010C99010893000389FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9B9B9B9F9F9FA2
      A2A2A2A2A29F9F9F9B9B9BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF000186010D9D021CAF021FB4021FB5021FB5021FB2021CB0010F9F0002
      87FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A9A9AA2A2A2A9A9A9AAAAAAAB
      ABABABABABAAAAAAA9A9A9A3A3A39A9A9AFF00FFFF00FFFF00FFFF00FFFF00FF
      00038A0118B2021FB7021EB1021DB1021DB1021DB1021DB1021EB2021FB40219
      AC00048EFF00FFFF00FFFF00FFFF00FF9C9C9CA9A9A9ABABABA9A9A9A9A9A9A9
      A9A9A9A9A9A9A9A9AAAAAAAAAAAAA8A8A89D9D9DFF00FFFF00FFFF00FF000183
      0118BB0220CC011CBF0015B4011AB0021DB1021DB1011CB00015AD011BB0021F
      B4021AAC000287FF00FFFF00FF9A9A9AABABABB1B1B1ACACACA8A8A8A8A8A8A9
      A9A9A9A9A9A8A8A8A6A6A6A8A8A8AAAAAAA8A8A89A9A9AFF00FFFF00FF010CA7
      0121E0011CD30726CC4966D70B28BC0018B00019AF0622B44A66CE0D2BB7011B
      B0021FB5010F9FFF00FFFF00FFA5A5A5B6B6B6B2B2B2B5B5B5D5D5D5B2B2B2A6
      A6A6A7A7A7ADADADD3D3D3B2B2B2A9A9A9ABABABA4A4A4FF00FF000187011CDC
      0120ED0017DC3655E2FFFFFFA4B4ED0520BB0119B28B9EE1FFFFFF4E6ACF0014
      AC021EB2021CB00003899A9A9AB4B4B4B9B9B9B3B3B3D1D1D1FFFFFFF8F8F8AE
      AEAEA9A9A9EDEDEDFFFFFFD4D4D4A6A6A6AAAAAAA9A9A99B9B9B00069A0120F8
      011FF6001DE9031FE1738BEEFFFFFFA0B1ED93A5E7FFFFFF91A4E20823B4011B
      B0021DB1021FB4010895A1A1A1BBBBBBBBBBBBB7B7B7B8B8B8E9E9E9FFFFFFF6
      F6F6F2F2F2FFFFFFEFEFEFAEAEAEA9A9A9A9A9A9AAAAAA9F9F9F020CAA0A2EFE
      0323FB011FF6001CEB0018E1788FF0FFFFFFFFFFFF96A7EA021BB50019AF021D
      B1021DB10220B5010C99A7A7A7C4C4C4BEBEBEBBBBBBB7B7B7B4B4B4EBEBEBFF
      FFFFFFFFFFF3F3F3AAAAAAA7A7A7A9A9A9A9A9A9ABABABA2A2A2040EAC294DFE
      0D30FB011FFA001CF7011CEE8EA1F4FFFFFFFFFFFFA6B6EE0520C20018B6021D
      B1021DB10220B5010B98A9A9A9D3D3D3C5C5C5BCBCBCBABABAB9B9B9F3F3F3FF
      FFFFFFFFFFF9F9F9B0B0B0A9A9A9A9A9A9A9A9A9ABABABA1A1A10208A04162FB
      2F51FC001EFA0725FA8AA0FEFFFFFF8EA3F67991F2FFFFFFA3B4EE0C29C6011B
      B8021DB4021FB2000793A4A4A4DBDBDBD5D5D5BBBBBBC1C1C1F4F4F4FFFFFFF4
      F4F4ECECECFFFFFFF8F8F8B6B6B6ABABABAAAAAAAAAAAA9F9F9F000189314FEF
      7690FF0F2DFA3354FBFFFFFF91A5FE021EF30017E7738BF3FFFFFF4765E00016
      C2021FBD021CB20002889B9B9BD2D2D2EFEFEFC6C6C6D6D6D6FFFFFFF6F6F6BB
      BBBBB6B6B6EBEBEBFFFFFFD6D6D6ACACACADADADAAAAAA9A9A9AFF00FF0C1BBC
      819AFF728BFE1134FA3456FB0526FA001CFA001CF40220ED3353ED0625DA011D
      D00220CB010DA1FF00FFFF00FFB3B3B3F2F2F2EDEDEDC7C7C7D6D6D6C0C0C0BB
      BBBBB9B9B9B9B9B9D2D2D2B8B8B8B1B1B1B0B0B0A4A4A4FF00FFFF00FF000189
      2943E6A5B7FF849AFC2341FB0323FA011FFA011FFA001EF7011BEE021FE50121
      E20118BF000184FF00FFFF00FF9B9B9BCCCCCCFDFDFDF2F2F2D0D0D0BEBEBEBC
      BCBCBCBCBCBBBBBBB9B9B9B7B7B7B7B7B7ADADAD9A9A9AFF00FFFF00FFFF00FF
      01038F2A45E693A9FFABBBFF758FFE4969FC3658FB3153FC2346FC092CF70118
      CB00038BFF00FFFF00FFFF00FFFF00FF9E9E9ECDCDCDF8F8F8FFFFFFEEEEEEDF
      DFDFD8D8D8D5D5D5D0D0D0C1C1C1B0B0B09C9C9CFF00FFFF00FFFF00FFFF00FF
      FF00FF0001890F1DBF3E5BF36B87FE728CFF5E7BFE395BFB1231EB010FB50001
      84FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9B9B9BB5B5B5D8D8D8EBEBEBED
      EDEDE6E6E6D8D8D8C3C3C3AAAAAA9A9A9AFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF000189030AA30611B2050FB10107A0000188FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9B9B9BA6A6A6AD
      ADADABABABA3A3A39B9B9BFF00FFFF00FFFF00FFFF00FFFF00FF}
    NumGlyphs = 2
  end
  object btnImprimir: TBitBtn [15]
    Left = 292
    Top = 433
    Width = 90
    Height = 25
    Caption = 'Imprimir'
    TabOrder = 10
    OnClick = btnImprimirClick
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
  object qrpProdutos: TQuickRep [16]
    Left = 104
    Top = 518
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
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stQRP
    object QRSubDetail1: TQRSubDetail
      Left = 38
      Top = 86
      Width = 718
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        58.208333333333330000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpProdutos
      DataSet = tabProdutos
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText3: TQRDBText
        Left = 2
        Top = 3
        Width = 82
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          5.291666666666667000
          7.937500000000000000
          216.958333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tabProdutos
        DataField = 'CodigoProduto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 9
      end
      object QRDBText7: TQRDBText
        Left = 122
        Top = 3
        Width = 507
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          322.791666666666700000
          7.937500000000000000
          1341.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabProdutos
        DataField = 'NomeTecnico'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 9
      end
      object QRDBText1: TQRDBText
        Left = 647
        Top = 3
        Width = 54
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          1711.854166666667000000
          7.937500000000000000
          142.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tabProdutos
        DataField = 'Disponivel'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 9
      end
    end
    object QRBand1: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 44
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        116.416666666666700000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRShape1: TQRShape
        Left = -1
        Top = 23
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
          60.854166666666680000
          1905.000000000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlTitulo: TQRLabel
        Left = 322
        Top = 2
        Width = 74
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          851.958333333333300000
          5.291666666666667000
          195.791666666666700000)
        Alignment = taCenter
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'Produtos'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 12
      end
      object QRLabel3: TQRLabel
        Left = 2
        Top = 25
        Width = 86
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          5.291666666666667000
          66.145833333333340000
          227.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'C'#243'digo Produto'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        FontSize = 9
      end
      object QRLabel5: TQRLabel
        Left = 122
        Top = 25
        Width = 80
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          322.791666666666700000
          66.145833333333340000
          211.666666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Nome T'#233'cnico'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        FontSize = 9
      end
      object QRLabel1: TQRLabel
        Left = 647
        Top = 25
        Width = 54
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          1711.854166666667000000
          66.145833333333340000
          142.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Dispon'#237'vel'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        FontSize = 9
      end
    end
    object QRBand2: TQRBand
      Left = 38
      Top = 82
      Width = 718
      Height = 4
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        10.583333333333330000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbColumnHeader
    end
    object QRBand3: TQRBand
      Left = 38
      Top = 108
      Width = 718
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        50.270833333333330000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
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
        ExportAs = exptText
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
          846.666666666666700000
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
        ExportAs = exptText
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
        ExportAs = exptText
        FontSize = 8
      end
    end
  end
  object edtReferencia: TEdit [17]
    Left = 463
    Top = 24
    Width = 113
    Height = 21
    TabOrder = 2
    OnKeyUp = edtCodigoProdutoKeyUp
  end
  object tabProdutos: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 600
    Top = 8
  end
  object dtsProdutos: TDataSource
    AutoEdit = False
    DataSet = tabProdutos
    Left = 696
    Top = 8
  end
  object tabGrupos: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 600
    Top = 64
  end
  object dtsGrupos: TDataSource
    AutoEdit = False
    DataSet = tabGrupos
    Left = 696
    Top = 64
  end
  object tabModelos: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 600
    Top = 120
  end
  object dtsModelos: TDataSource
    AutoEdit = False
    DataSet = tabModelos
    Left = 696
    Top = 120
  end
  object pndDialogo: TPrintDialog
    Left = 768
    Top = 64
  end
  object tabReferencia: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 632
    Top = 200
  end
end

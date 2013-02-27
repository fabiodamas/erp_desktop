inherited rtInventarioProdutos: TrtInventarioProdutos
  Left = 233
  Caption = 'Invent'#225'rio de Produtos'
  ClientHeight = 366
  ClientWidth = 336
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 2
    Width = 29
    Height = 13
    Caption = 'Grupo'
  end
  object Label2: TLabel [1]
    Left = 8
    Top = 53
    Width = 95
    Height = 13
    Caption = 'Tabela para C'#225'lculo'
  end
  object Label5: TLabel [2]
    Left = 8
    Top = 166
    Width = 75
    Height = 13
    Caption = 'Remover Grupo'
  end
  object gagProgresso: TGauge [3]
    Left = 8
    Top = 340
    Width = 320
    Height = 17
    Progress = 0
  end
  object Label6: TLabel [4]
    Left = 184
    Top = 53
    Width = 46
    Height = 13
    Caption = '% C'#225'lculo'
  end
  inherited btnVisualizar: TBitBtn
    Left = 240
    Top = 12
    TabOrder = 10
    OnClick = btnVisualizarClick
  end
  inherited btnImprimir: TBitBtn
    Left = 240
    Top = 40
    TabOrder = 11
    OnClick = btnImprimirClick
  end
  inherited btnFechar: TBitBtn
    Left = 240
    Top = 96
    TabOrder = 13
  end
  inherited btnOpcoes: TBitBtn
    Left = 240
    Top = 68
    TabOrder = 12
  end
  object qrpInventario: TQuickRep [9]
    Left = 96
    Top = 424
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = qrpInventarioBeforePrint
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
      Top = 86
      Width = 718
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRSubDetail1BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        58.208333333333340000
        1899.708333333333000000)
      Master = qrpInventario
      DataSet = tabAuxInventario
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText3: TQRDBText
        Left = 2
        Top = 3
        Width = 71
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
          187.854166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabAuxInventario
        DataField = 'Codigo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText7: TQRDBText
        Left = 77
        Top = 3
        Width = 332
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          203.729166666666700000
          7.937500000000000000
          878.416666666666800000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabAuxInventario
        DataField = 'Produto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText2: TQRDBText
        Left = 418
        Top = 3
        Width = 45
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          1105.958333333333000000
          7.937500000000000000
          119.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tabAuxInventario
        DataField = 'Unidade'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrdPais: TQRDBText
        Left = 474
        Top = 3
        Width = 64
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          1254.125000000000000000
          7.937500000000000000
          169.333333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tabAuxInventario
        DataField = 'Quantidade'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText4: TQRDBText
        Left = 546
        Top = 3
        Width = 69
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          1444.625000000000000000
          7.937500000000000000
          182.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tabAuxInventario
        DataField = 'ValorUnitario'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText5: TQRDBText
        Left = 626
        Top = 3
        Width = 29
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          1656.291666666667000000
          7.937500000000000000
          76.729166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = tabAuxInventario
        DataField = 'Total'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
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
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        116.416666666666700000
        1899.708333333333000000)
      BandType = rbPageHeader
      object QRShape1: TQRShape
        Left = -1
        Top = 23
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
          60.854166666666680000
          1902.354166666667000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlTitulo: TQRLabel
        Left = 264
        Top = 2
        Width = 189
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          698.500000000000000000
          5.291666666666667000
          500.062500000000000000)
        Alignment = taCenter
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'Invent'#225'rio de Produtos'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel3: TQRLabel
        Left = 2
        Top = 25
        Width = 38
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
          100.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'C'#243'digo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 9
      end
      object QRLabel5: TQRLabel
        Left = 77
        Top = 25
        Width = 45
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          203.729166666666700000
          66.145833333333340000
          119.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Produto'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 9
      end
      object QRLabel2: TQRLabel
        Left = 418
        Top = 25
        Width = 45
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          1105.958333333333000000
          66.145833333333340000
          119.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Unidade'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 9
      end
      object qrlEndereco: TQRLabel
        Left = 546
        Top = 25
        Width = 73
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          1444.625000000000000000
          66.145833333333340000
          193.145833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Valor Unit'#225'rio'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 9
      end
      object qrlPais: TQRLabel
        Left = 474
        Top = 25
        Width = 64
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          1254.125000000000000000
          66.145833333333340000
          169.333333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Quantidade'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 9
      end
      object qrlEmail: TQRLabel
        Left = 626
        Top = 25
        Width = 29
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          1656.291666666667000000
          66.145833333333340000
          76.729166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
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
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        10.583333333333330000
        1899.708333333333000000)
      BandType = rbColumnHeader
    end
    object QRBand3: TQRBand
      Left = 38
      Top = 108
      Width = 718
      Height = 34
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
        89.958333333333340000
        1899.708333333333000000)
      BandType = rbPageFooter
      object qrlSignature: TQRLabel
        Left = 1
        Top = 18
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
          47.625000000000000000
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
        Top = 18
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
          47.625000000000000000
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
        Top = 16
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
          42.333333333333340000
          1905.000000000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRSysData2: TQRSysData
        Left = 622
        Top = 18
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
          47.625000000000000000
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
      object qrlTotal: TQRLabel
        Left = 693
        Top = 1
        Width = 25
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1833.562500000000000000
          2.645833333333333000
          66.145833333333340000)
        Alignment = taRightJustify
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'Total'
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
    end
  end
  object rdgOrdemEmissao: TRadioGroup [10]
    Left = 8
    Top = 300
    Width = 320
    Height = 36
    Caption = 'Ordem Emiss'#227'o'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'C'#243'digo Produto'
      'Nome T'#233'cnico')
    TabOrder = 9
  end
  object edtGrupo: TDBLookupComboBox [11]
    Left = 8
    Top = 18
    Width = 225
    Height = 21
    KeyField = 'Codigo'
    ListField = 'Descricao'
    ListSource = dtsGrupos
    TabOrder = 0
  end
  object edtTabelaCalculo: TDBLookupComboBox [12]
    Left = 8
    Top = 69
    Width = 169
    Height = 21
    KeyField = 'Codigo'
    ListField = 'Descricao'
    ListSource = dtsTipoTabPreco
    TabOrder = 1
  end
  object edtGrupoRemover: TDBLookupComboBox [13]
    Left = 8
    Top = 182
    Width = 261
    Height = 21
    KeyField = 'Codigo'
    ListField = 'Descricao'
    ListSource = dtsGrupos
    TabOrder = 5
  end
  object lstGrupos: TListBox [14]
    Left = 8
    Top = 208
    Width = 318
    Height = 87
    ItemHeight = 13
    TabOrder = 8
  end
  object btnGrupoAdicionar: TBitBtn [15]
    Left = 275
    Top = 181
    Width = 25
    Height = 22
    TabOrder = 6
    OnClick = btnGrupoAdicionarClick
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
  object btnGrupoRemover: TBitBtn [16]
    Left = 302
    Top = 181
    Width = 25
    Height = 22
    TabOrder = 7
    OnClick = btnGrupoRemoverClick
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
  object edtPercCalc: TEdit [17]
    Left = 184
    Top = 69
    Width = 49
    Height = 21
    TabOrder = 2
    Text = '20'
  end
  object rdgEstoque: TRadioGroup [18]
    Left = 8
    Top = 130
    Width = 320
    Height = 31
    Caption = 'Estoque'
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'Geral'
      'Com Estoque'
      'Sem Estoque')
    TabOrder = 4
  end
  object ckbProdutoAcabado: TCheckBox [19]
    Left = 8
    Top = 104
    Width = 129
    Height = 17
    Caption = 'Produto Acabado'
    TabOrder = 3
  end
  inherited popOpcoes: TPopupMenu
    Left = 768
    Top = 0
  end
  object tabBase: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 368
    Top = 8
  end
  object pndDialogo: TPrintDialog
    Left = 768
    Top = 64
  end
  object tabGrupos: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 368
    Top = 57
  end
  object dtsGrupos: TDataSource
    AutoEdit = False
    DataSet = tabGrupos
    Left = 432
    Top = 57
  end
  object tabAuxInventario: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 480
    Top = 184
    object tabAuxInventarioCodigo: TStringField
      FieldName = 'Codigo'
    end
    object tabAuxInventarioProduto: TStringField
      FieldName = 'Produto'
      Size = 50
    end
    object tabAuxInventarioUnidade: TStringField
      FieldName = 'Unidade'
      Size = 10
    end
    object tabAuxInventarioQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
    object tabAuxInventarioValorUnitario: TCurrencyField
      FieldName = 'ValorUnitario'
    end
    object tabAuxInventarioTotal: TCurrencyField
      FieldName = 'Total'
    end
  end
  object tabChecagens: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 568
    Top = 17
  end
  object tabTipoTabPreco: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 368
    Top = 113
  end
  object dtsTipoTabPreco: TDataSource
    AutoEdit = False
    DataSet = tabTipoTabPreco
    Left = 432
    Top = 113
  end
end

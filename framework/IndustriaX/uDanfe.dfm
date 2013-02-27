inherited fmDanfe: TfmDanfe
  Left = 231
  Top = 152
  Caption = 'Danfe'
  ClientHeight = 155
  ClientWidth = 166
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object gagProgresso: TGauge [0]
    Left = 8
    Top = 128
    Width = 149
    Height = 17
    Progress = 0
  end
  object qrpDanfe: TQuickRep [1]
    Tag = 99
    Left = 310
    Top = 6
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = qrpDanfeBeforePrint
    DataSet = tabDanfe
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Values = (
      39.687500000000000000
      2970.000000000000000000
      39.687500000000000000
      2100.000000000000000000
      100.012500000000000000
      100.012500000000000000
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
    Units = Pixels
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    object QRSubDetail1: TQRSubDetail
      Tag = 99
      Left = 38
      Top = 298
      Width = 718
      Height = 415
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
        1098.020833333333000000
        1899.708333333333000000)
      Master = qrpDanfe
      PrintBefore = False
      PrintIfEmpty = True
      object QRLabel64: TQRLabel
        Tag = 99
        Left = 258
        Top = 276
        Width = 70
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          682.625000000000000000
          730.250000000000000000
          185.208333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'FRETE POR CONTA'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText37: TQRDBText
        Tag = 99
        Left = 257
        Top = 287
        Width = 85
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          679.979166666666800000
          759.354166666666800000
          224.895833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'TranspFreteConta'
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
      object QRLabel18: TQRLabel
        Tag = 99
        Left = 4
        Top = 5
        Width = 154
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          10.583333333333330000
          13.229166666666670000
          407.458333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DESTINAT'#193'RIO / REMETENTE'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRShape17: TQRShape
        Tag = 99
        Left = 0
        Top = 19
        Width = 718
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          50.270833333333330000
          1899.708333333333000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape18: TQRShape
        Tag = 99
        Left = 0
        Top = 48
        Width = 718
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          127.000000000000000000
          1899.708333333333000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel19: TQRLabel
        Tag = 99
        Left = 4
        Top = 21
        Width = 80
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          10.583333333333330000
          55.562500000000000000
          211.666666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NOME/RAZ'#195'O SOCIAL'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel20: TQRLabel
        Tag = 99
        Left = 428
        Top = 21
        Width = 34
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          1132.416666666667000000
          55.562500000000000000
          89.958333333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CNPJ/CPF'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel21: TQRLabel
        Tag = 99
        Left = 605
        Top = 21
        Width = 69
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          1600.729166666667000000
          55.562500000000000000
          182.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DATA DA EMISSAO'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape19: TQRShape
        Tag = 99
        Left = 422
        Top = 19
        Width = 1
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          1116.541666666667000000
          50.270833333333330000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape20: TQRShape
        Tag = 99
        Left = 600
        Top = 19
        Width = 1
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          1587.500000000000000000
          50.270833333333330000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape21: TQRShape
        Tag = 99
        Left = 0
        Top = 77
        Width = 718
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          203.729166666666700000
          1899.708333333333000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel22: TQRLabel
        Tag = 99
        Left = 4
        Top = 50
        Width = 39
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          10.583333333333330000
          132.291666666666700000
          103.187500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ENDERE'#199'O'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel23: TQRLabel
        Tag = 99
        Left = 325
        Top = 50
        Width = 69
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          859.895833333333400000
          132.291666666666700000
          182.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'BAIRRO/DISTRITO'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel24: TQRLabel
        Tag = 99
        Left = 468
        Top = 50
        Width = 14
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          1238.250000000000000000
          132.291666666666700000
          37.041666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CEP'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel25: TQRLabel
        Tag = 99
        Left = 605
        Top = 50
        Width = 102
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1600.729166666667000000
          132.291666666666700000
          269.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DATA DA SAIDA / ENTRADA'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape22: TQRShape
        Tag = 99
        Left = 318
        Top = 48
        Width = 1
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          841.375000000000000000
          127.000000000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape23: TQRShape
        Tag = 99
        Left = 461
        Top = 48
        Width = 1
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          1219.729166666667000000
          127.000000000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape24: TQRShape
        Tag = 99
        Left = 600
        Top = 48
        Width = 1
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          1587.500000000000000000
          127.000000000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape25: TQRShape
        Tag = 99
        Left = 0
        Top = 107
        Width = 718
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          283.104166666666700000
          1899.708333333333000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel26: TQRLabel
        Tag = 99
        Left = 4
        Top = 79
        Width = 41
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          10.583333333333330000
          209.020833333333300000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'MUNIC'#205'PIO'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel27: TQRLabel
        Tag = 99
        Left = 234
        Top = 79
        Width = 37
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          619.125000000000000000
          209.020833333333300000
          97.895833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'FONE/FAX'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel28: TQRLabel
        Tag = 99
        Left = 337
        Top = 79
        Width = 10
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          891.645833333333400000
          209.020833333333300000
          26.458333333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'UF'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel29: TQRLabel
        Tag = 99
        Left = 395
        Top = 79
        Width = 82
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          1045.104166666667000000
          209.020833333333300000
          216.958333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'INSCRI'#199#195'O ESTADUAL'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel30: TQRLabel
        Tag = 99
        Left = 605
        Top = 79
        Width = 59
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          1600.729166666667000000
          209.020833333333300000
          156.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'HORA DE SA'#205'DA'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape26: TQRShape
        Tag = 99
        Left = 600
        Top = 77
        Width = 1
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          1587.500000000000000000
          203.729166666666700000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape27: TQRShape
        Tag = 99
        Left = 386
        Top = 77
        Width = 1
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          1021.291666666667000000
          203.729166666666700000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape28: TQRShape
        Tag = 99
        Left = 331
        Top = 77
        Width = 1
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          875.770833333333400000
          203.729166666666700000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape29: TQRShape
        Tag = 99
        Left = 227
        Top = 77
        Width = 1
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          600.604166666666800000
          203.729166666666700000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel31: TQRLabel
        Tag = 99
        Left = 4
        Top = 178
        Width = 121
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          10.583333333333330000
          470.958333333333400000
          320.145833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'C'#193'LCULO DO IMPOSTO'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRShape30: TQRShape
        Tag = 99
        Left = 0
        Top = 192
        Width = 718
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          508.000000000000000000
          1899.708333333333000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape31: TQRShape
        Tag = 99
        Left = 0
        Top = 221
        Width = 718
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          584.729166666666800000
          1899.708333333333000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape32: TQRShape
        Tag = 99
        Left = 0
        Top = 250
        Width = 718
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          661.458333333333400000
          1899.708333333333000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel32: TQRLabel
        Tag = 99
        Left = 4
        Top = 260
        Width = 245
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          10.583333333333330000
          687.916666666666800000
          648.229166666666800000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TRANSPORTADOR/VOLUMES TRANSPORTADOS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRShape33: TQRShape
        Tag = 99
        Left = 0
        Top = 274
        Width = 718
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          724.958333333333400000
          1899.708333333333000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape34: TQRShape
        Tag = 99
        Left = 0
        Top = 303
        Width = 718
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          801.687500000000100000
          1899.708333333333000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape35: TQRShape
        Tag = 99
        Left = 0
        Top = 332
        Width = 718
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          878.416666666666800000
          1899.708333333333000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape36: TQRShape
        Tag = 99
        Left = 0
        Top = 361
        Width = 718
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          955.145833333333500000
          1899.708333333333000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel33: TQRLabel
        Tag = 99
        Left = 4
        Top = 371
        Width = 160
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          10.583333333333330000
          981.604166666666800000
          423.333333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DADOS DO PRODUTO/SERVI'#199'O'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRShape37: TQRShape
        Tag = 99
        Left = 0
        Top = 385
        Width = 718
        Height = 28
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          74.083333333333340000
          0.000000000000000000
          1018.645833333333000000
          1899.708333333333000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel34: TQRLabel
        Tag = 99
        Left = 2
        Top = 387
        Width = 39
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          5.291666666666667000
          1023.937500000000000000
          103.187500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'C'#211'DIGO'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel35: TQRLabel
        Tag = 99
        Left = 44
        Top = 387
        Width = 162
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          116.416666666666700000
          1023.937500000000000000
          428.625000000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'DESCRI'#199#195'O DO PRODUTO/SERVI'#199'O'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel36: TQRLabel
        Tag = 99
        Left = 209
        Top = 387
        Width = 41
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          552.979166666666800000
          1023.937500000000000000
          108.479166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'NCM/SH'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel37: TQRLabel
        Tag = 99
        Left = 253
        Top = 387
        Width = 26
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          669.395833333333400000
          1023.937500000000000000
          68.791666666666680000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'CST'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel38: TQRLabel
        Tag = 99
        Left = 282
        Top = 387
        Width = 37
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          746.125000000000000000
          1023.937500000000000000
          97.895833333333340000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'CFOP'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel39: TQRLabel
        Tag = 99
        Left = 322
        Top = 387
        Width = 28
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          851.958333333333400000
          1023.937500000000000000
          74.083333333333340000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'UNID'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel40: TQRLabel
        Tag = 99
        Left = 353
        Top = 387
        Width = 38
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          933.979166666666600000
          1023.937500000000000000
          100.541666666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QTD'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel41: TQRLabel
        Tag = 99
        Left = 394
        Top = 387
        Width = 63
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1042.458333333333000000
          1023.937500000000000000
          166.687500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VLR. UNIT.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel42: TQRLabel
        Tag = 99
        Left = 460
        Top = 387
        Width = 71
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1217.083333333333000000
          1023.937500000000000000
          187.854166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VLR. TOTAL'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel43: TQRLabel
        Tag = 99
        Left = 534
        Top = 387
        Width = 41
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1412.875000000000000000
          1023.937500000000000000
          108.479166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'BC. ICMS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel44: TQRLabel
        Tag = 99
        Left = 578
        Top = 387
        Width = 39
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1529.291666666667000000
          1023.937500000000000000
          103.187500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'V. ICMS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel45: TQRLabel
        Tag = 99
        Left = 620
        Top = 387
        Width = 32
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1640.416666666667000000
          1023.937500000000000000
          84.666666666666680000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'V. IPI'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel46: TQRLabel
        Tag = 99
        Left = 656
        Top = 387
        Width = 28
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          1735.666666666667000000
          1023.937500000000000000
          74.083333333333340000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'AL'#205'Q.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel49: TQRLabel
        Tag = 99
        Left = 689
        Top = 387
        Width = 26
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          1822.979166666667000000
          1023.937500000000000000
          68.791666666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'AL'#205'Q.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel50: TQRLabel
        Tag = 99
        Left = 4
        Top = 194
        Width = 103
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          10.583333333333330000
          513.291666666666800000
          272.520833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'BASE DE C'#193'LCULO DO ICMS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel51: TQRLabel
        Tag = 99
        Left = 150
        Top = 194
        Width = 61
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          396.875000000000000000
          513.291666666666800000
          161.395833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VALOR DO ICMS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel52: TQRLabel
        Tag = 99
        Left = 296
        Top = 194
        Width = 115
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          783.166666666666800000
          513.291666666666800000
          304.270833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'BASE DE C'#193'LCULO DO ICMS ST'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel53: TQRLabel
        Tag = 99
        Left = 442
        Top = 194
        Width = 73
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          1169.458333333333000000
          513.291666666666800000
          193.145833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VALOR DO ICMS ST'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel54: TQRLabel
        Tag = 99
        Left = 589
        Top = 194
        Width = 115
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          1558.395833333333000000
          513.291666666666800000
          304.270833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VALOR TOTAL DOS PRODUTOS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape39: TQRShape
        Tag = 99
        Left = 138
        Top = 192
        Width = 1
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          365.125000000000000000
          508.000000000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape40: TQRShape
        Tag = 99
        Left = 284
        Top = 192
        Width = 1
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          751.416666666666800000
          508.000000000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape41: TQRShape
        Tag = 99
        Left = 431
        Top = 192
        Width = 1
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          1140.354166666667000000
          508.000000000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape42: TQRShape
        Tag = 99
        Left = 567
        Top = 192
        Width = 1
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          1500.187500000000000000
          508.000000000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel55: TQRLabel
        Tag = 99
        Left = 4
        Top = 223
        Width = 65
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          10.583333333333330000
          590.020833333333400000
          171.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VALOR DO FRETE'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel56: TQRLabel
        Tag = 99
        Left = 125
        Top = 223
        Width = 72
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          330.729166666666700000
          590.020833333333400000
          190.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VALOR DO SEGURO'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel57: TQRLabel
        Tag = 99
        Left = 247
        Top = 223
        Width = 41
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          653.520833333333400000
          590.020833333333400000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DESCONTO'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel58: TQRLabel
        Tag = 99
        Left = 336
        Top = 223
        Width = 116
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          889.000000000000000000
          590.020833333333400000
          306.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'OUTRAS DESPESAS ACESS'#211'RIAS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel59: TQRLabel
        Tag = 99
        Left = 482
        Top = 223
        Width = 53
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          1275.291666666667000000
          590.020833333333400000
          140.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VALOR DO IPI'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel60: TQRLabel
        Tag = 99
        Left = 612
        Top = 223
        Width = 91
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          1619.250000000000000000
          590.020833333333400000
          240.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VALOR TOTAL DA NOTA'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape43: TQRShape
        Tag = 99
        Left = 115
        Top = 221
        Width = 1
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          304.270833333333400000
          584.729166666666800000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape44: TQRShape
        Tag = 99
        Left = 237
        Top = 221
        Width = 1
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          627.062500000000000000
          584.729166666666800000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape45: TQRShape
        Tag = 99
        Left = 330
        Top = 221
        Width = 1
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          873.124999999999900000
          584.729166666666800000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape46: TQRShape
        Tag = 99
        Left = 474
        Top = 221
        Width = 1
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          1254.125000000000000000
          584.729166666666800000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape47: TQRShape
        Tag = 99
        Left = 567
        Top = 221
        Width = 1
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          1500.187500000000000000
          584.729166666666800000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel61: TQRLabel
        Tag = 99
        Left = 4
        Top = 276
        Width = 80
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          10.583333333333330000
          730.250000000000000000
          211.666666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NOME/RAZ'#195'O SOCIAL'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel62: TQRLabel
        Tag = 99
        Left = 4
        Top = 305
        Width = 39
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          10.583333333333330000
          806.979166666666800000
          103.187500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ENDERE'#199'O'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel63: TQRLabel
        Tag = 99
        Left = 4
        Top = 334
        Width = 49
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          10.583333333333330000
          883.708333333333400000
          129.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QUANTIDADE'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel65: TQRLabel
        Tag = 99
        Left = 348
        Top = 276
        Width = 54
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          920.750000000000000000
          730.250000000000000000
          142.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'C'#211'DIGO ANTT'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel66: TQRLabel
        Tag = 99
        Left = 425
        Top = 276
        Width = 73
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          1124.479166666667000000
          730.250000000000000000
          193.145833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PLACA DO VE'#205'CULO'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel67: TQRLabel
        Tag = 99
        Left = 517
        Top = 276
        Width = 10
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          1367.895833333333000000
          730.250000000000000000
          26.458333333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'UF'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel68: TQRLabel
        Tag = 99
        Left = 572
        Top = 276
        Width = 34
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          1513.416666666667000000
          730.250000000000000000
          89.958333333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CNPJ/CPF'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape48: TQRShape
        Tag = 99
        Left = 253
        Top = 302
        Width = 1
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          669.395833333333400000
          799.041666666666800000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape49: TQRShape
        Tag = 99
        Left = 253
        Top = 273
        Width = 1
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          669.395833333333400000
          722.312500000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape50: TQRShape
        Tag = 99
        Left = 344
        Top = 274
        Width = 1
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          910.166666666666600000
          724.958333333333400000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape51: TQRShape
        Tag = 99
        Left = 421
        Top = 274
        Width = 1
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          1113.895833333333000000
          724.958333333333400000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape52: TQRShape
        Tag = 99
        Left = 513
        Top = 274
        Width = 1
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          1357.312500000000000000
          724.958333333333400000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape53: TQRShape
        Tag = 99
        Left = 567
        Top = 274
        Width = 1
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          1500.187500000000000000
          724.958333333333400000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel69: TQRLabel
        Tag = 99
        Left = 260
        Top = 305
        Width = 41
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          687.916666666666800000
          806.979166666666800000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'MUNIC'#205'PIO'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel70: TQRLabel
        Tag = 99
        Left = 517
        Top = 305
        Width = 10
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          1367.895833333333000000
          806.979166666666800000
          26.458333333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'UF'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape54: TQRShape
        Tag = 99
        Left = 513
        Top = 303
        Width = 1
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          1357.312500000000000000
          801.687500000000100000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape55: TQRShape
        Tag = 99
        Left = 567
        Top = 302
        Width = 1
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          1500.187500000000000000
          799.041666666666800000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel71: TQRLabel
        Tag = 99
        Left = 572
        Top = 305
        Width = 82
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          1513.416666666667000000
          806.979166666666800000
          216.958333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'INSCRI'#199#195'O ESTADUAL'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape56: TQRShape
        Tag = 99
        Left = 113
        Top = 332
        Width = 1
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          298.979166666666700000
          878.416666666666800000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel72: TQRLabel
        Tag = 99
        Left = 120
        Top = 334
        Width = 29
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          317.500000000000000000
          883.708333333333400000
          76.729166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ESP'#201'CIE'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel73: TQRLabel
        Tag = 99
        Left = 256
        Top = 334
        Width = 27
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          677.333333333333400000
          883.708333333333400000
          71.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'MARCA'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel74: TQRLabel
        Tag = 99
        Left = 383
        Top = 334
        Width = 47
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          1013.354166666667000000
          883.708333333333400000
          124.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NUMERA'#199#195'O'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel75: TQRLabel
        Tag = 99
        Left = 504
        Top = 334
        Width = 48
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          1333.500000000000000000
          883.708333333333400000
          127.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PESO BRUTO'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel76: TQRLabel
        Tag = 99
        Left = 624
        Top = 334
        Width = 54
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          1651.000000000000000000
          883.708333333333400000
          142.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PESO L'#205'QUIDO'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape57: TQRShape
        Tag = 99
        Left = 249
        Top = 332
        Width = 1
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          658.812500000000000000
          878.416666666666800000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape58: TQRShape
        Tag = 99
        Left = 377
        Top = 332
        Width = 1
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          997.479166666666900000
          878.416666666666800000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape59: TQRShape
        Tag = 99
        Left = 497
        Top = 332
        Width = 1
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          1314.979166666667000000
          878.416666666666800000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape60: TQRShape
        Tag = 99
        Left = 617
        Top = 332
        Width = 1
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          1632.479166666667000000
          878.416666666666800000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape62: TQRShape
        Tag = 99
        Left = 42
        Top = 385
        Width = 1
        Height = 27
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          71.437500000000000000
          111.125000000000000000
          1018.645833333333000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape63: TQRShape
        Tag = 99
        Left = 207
        Top = 385
        Width = 1
        Height = 27
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          71.437500000000000000
          547.687500000000000000
          1018.645833333333000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape64: TQRShape
        Tag = 99
        Left = 251
        Top = 385
        Width = 1
        Height = 27
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          71.437500000000000000
          664.104166666666800000
          1018.645833333333000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape65: TQRShape
        Tag = 99
        Left = 280
        Top = 385
        Width = 1
        Height = 27
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          71.437500000000000000
          740.833333333333400000
          1018.645833333333000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape66: TQRShape
        Tag = 99
        Left = 320
        Top = 385
        Width = 1
        Height = 27
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          71.437500000000000000
          846.666666666666600000
          1018.645833333333000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape67: TQRShape
        Tag = 99
        Left = 351
        Top = 385
        Width = 1
        Height = 27
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          71.437500000000000000
          928.687500000000000000
          1018.645833333333000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape68: TQRShape
        Tag = 99
        Left = 392
        Top = 385
        Width = 1
        Height = 27
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          71.437500000000000000
          1037.166666666667000000
          1018.645833333333000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape69: TQRShape
        Tag = 99
        Left = 458
        Top = 385
        Width = 1
        Height = 27
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          71.437500000000000000
          1211.791666666667000000
          1018.645833333333000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape70: TQRShape
        Tag = 99
        Left = 532
        Top = 385
        Width = 1
        Height = 27
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          71.437500000000000000
          1407.583333333333000000
          1018.645833333333000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape71: TQRShape
        Tag = 99
        Left = 576
        Top = 385
        Width = 1
        Height = 27
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          71.437500000000000000
          1524.000000000000000000
          1018.645833333333000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape72: TQRShape
        Tag = 99
        Left = 618
        Top = 385
        Width = 1
        Height = 27
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          71.437500000000000000
          1635.125000000000000000
          1018.645833333333000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape73: TQRShape
        Tag = 99
        Left = 653
        Top = 385
        Width = 1
        Height = 27
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          71.437500000000000000
          1727.729166666667000000
          1018.645833333333000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape74: TQRShape
        Tag = 99
        Left = 686
        Top = 385
        Width = 1
        Height = 27
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          71.437500000000000000
          1815.041666666667000000
          1018.645833333333000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText14: TQRDBText
        Tag = 99
        Left = 4
        Top = 31
        Width = 399
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          82.020833333333340000
          1055.687500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'DestRazao'
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
      object QRDBText15: TQRDBText
        Tag = 99
        Left = 428
        Top = 31
        Width = 169
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1132.416666666667000000
          82.020833333333340000
          447.145833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'DestCNPJCPF'
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
      object QRDBText16: TQRDBText
        Tag = 99
        Left = 4
        Top = 60
        Width = 303
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          158.750000000000000000
          801.687500000000100000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'DestEndereco'
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
      object QRDBText17: TQRDBText
        Tag = 99
        Left = 325
        Top = 60
        Width = 129
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          859.895833333333400000
          158.750000000000000000
          341.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'DestBairro'
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
      object QRDBText18: TQRDBText
        Tag = 99
        Left = 468
        Top = 60
        Width = 129
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1238.250000000000000000
          158.750000000000000000
          341.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'DestCep'
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
      object QRDBText19: TQRDBText
        Tag = 99
        Left = 4
        Top = 89
        Width = 213
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          235.479166666666700000
          563.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'DestCidade'
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
      object QRDBText20: TQRDBText
        Tag = 99
        Left = 345
        Top = 89
        Width = 24
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          912.812500000000100000
          235.479166666666700000
          63.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'DestUF'
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
      object QRDBText21: TQRDBText
        Tag = 99
        Left = 395
        Top = 89
        Width = 203
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1045.104166666667000000
          235.479166666666700000
          537.104166666666800000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'DestIE'
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
      object QRDBText22: TQRDBText
        Tag = 99
        Left = 605
        Top = 31
        Width = 86
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1600.729166666667000000
          82.020833333333340000
          227.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'Emissao'
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
      object QRDBText23: TQRDBText
        Tag = 99
        Left = 234
        Top = 89
        Width = 86
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          619.125000000000000000
          235.479166666666700000
          227.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'DestFone'
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
      object QRDBText24: TQRDBText
        Tag = 99
        Left = 11
        Top = 204
        Width = 125
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          29.104166666666670000
          539.750000000000000000
          330.729166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'ValorBC'
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
      object QRDBText25: TQRDBText
        Tag = 99
        Left = 161
        Top = 204
        Width = 121
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          425.979166666666700000
          539.750000000000000000
          320.145833333333400000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'ValorICMS'
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
      object QRDBText26: TQRDBText
        Tag = 99
        Left = 308
        Top = 204
        Width = 121
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          814.916666666666800000
          539.750000000000000000
          320.145833333333400000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'ValorBCST'
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
      object QRDBText27: TQRDBText
        Tag = 99
        Left = 452
        Top = 204
        Width = 113
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1195.916666666667000000
          539.750000000000000000
          298.979166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'ValorST'
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
      object QRDBText28: TQRDBText
        Tag = 99
        Left = 576
        Top = 204
        Width = 138
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1524.000000000000000000
          539.750000000000000000
          365.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'ValorProdutos'
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
      object QRDBText29: TQRDBText
        Tag = 99
        Left = 9
        Top = 233
        Width = 104
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          23.812500000000000000
          616.479166666666800000
          275.166666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'ValorFrete'
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
      object QRDBText30: TQRDBText
        Tag = 99
        Left = 139
        Top = 233
        Width = 96
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          367.770833333333400000
          616.479166666666800000
          254.000000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'ValorSeguro'
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
      object QRDBText31: TQRDBText
        Tag = 99
        Left = 253
        Top = 233
        Width = 75
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          669.395833333333400000
          616.479166666666800000
          198.437500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'ValorDesconto'
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
      object QRDBText32: TQRDBText
        Tag = 99
        Left = 347
        Top = 233
        Width = 125
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          918.104166666666800000
          616.479166666666800000
          330.729166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'ValorODA'
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
      object QRDBText33: TQRDBText
        Tag = 99
        Left = 488
        Top = 233
        Width = 77
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1291.166666666667000000
          616.479166666666800000
          203.729166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'ValorIPI'
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
      object QRDBText34: TQRDBText
        Tag = 99
        Left = 584
        Top = 233
        Width = 131
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1545.166666666667000000
          616.479166666666800000
          346.604166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'ValorTotalNF'
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
      object QRDBText35: TQRDBText
        Tag = 99
        Left = 4
        Top = 286
        Width = 240
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          756.708333333333400000
          635.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'TranspRazao'
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
      object QRDBText36: TQRDBText
        Tag = 99
        Left = 4
        Top = 315
        Width = 240
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          833.437500000000000000
          635.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'TranspEndereco'
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
      object QRDBText38: TQRDBText
        Tag = 99
        Left = 354
        Top = 286
        Width = 64
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          936.625000000000100000
          756.708333333333400000
          169.333333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'TranspCodigoANTT'
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
      object QRDBText39: TQRDBText
        Tag = 99
        Left = 425
        Top = 286
        Width = 77
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1124.479166666667000000
          756.708333333333400000
          203.729166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'TranspPlacaVeic'
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
      object QRDBText40: TQRDBText
        Tag = 99
        Left = 529
        Top = 286
        Width = 20
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1399.645833333333000000
          756.708333333333400000
          52.916666666666660000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'TranspPlacaUF'
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
      object QRDBText41: TQRDBText
        Tag = 99
        Left = 572
        Top = 286
        Width = 142
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1513.416666666667000000
          756.708333333333400000
          375.708333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'TranspCNPJ'
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
      object QRDBText42: TQRDBText
        Tag = 99
        Left = 260
        Top = 315
        Width = 248
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          687.916666666666800000
          833.437500000000000000
          656.166666666666800000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'TranspCidade'
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
      object QRDBText43: TQRDBText
        Tag = 99
        Left = 529
        Top = 315
        Width = 20
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1399.645833333333000000
          833.437500000000000000
          52.916666666666660000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'TranspUF'
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
      object QRDBText44: TQRDBText
        Tag = 99
        Left = 572
        Top = 315
        Width = 143
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1513.416666666667000000
          833.437500000000000000
          378.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'TranspIE'
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
      object QRDBText45: TQRDBText
        Tag = 99
        Left = 11
        Top = 344
        Width = 100
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          29.104166666666670000
          910.166666666666600000
          264.583333333333400000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'VolQuantidade'
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
      object QRDBText46: TQRDBText
        Tag = 99
        Left = 120
        Top = 344
        Width = 126
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          317.500000000000000000
          910.166666666666600000
          333.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'VolEspecie'
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
      object QRDBText47: TQRDBText
        Tag = 99
        Left = 256
        Top = 344
        Width = 116
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          677.333333333333400000
          910.166666666666600000
          306.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'VolMarca'
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
      object QRDBText48: TQRDBText
        Tag = 99
        Left = 386
        Top = 344
        Width = 108
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1021.291666666667000000
          910.166666666666600000
          285.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'VolNumeracao'
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
      object QRDBText49: TQRDBText
        Tag = 99
        Left = 504
        Top = 344
        Width = 112
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1333.500000000000000000
          910.166666666666600000
          296.333333333333400000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'VolPesoB'
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
      object QRDBText50: TQRDBText
        Tag = 99
        Left = 624
        Top = 344
        Width = 92
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1651.000000000000000000
          910.166666666666600000
          243.416666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'VolPesoL'
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
      object QRShape101: TQRShape
        Tag = 99
        Left = 0
        Top = 19
        Width = 1
        Height = 88
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          232.833333333333400000
          0.000000000000000000
          50.270833333333330000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape102: TQRShape
        Tag = 99
        Left = 717
        Top = 20
        Width = 1
        Height = 87
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          230.187500000000000000
          1897.062500000000000000
          52.916666666666660000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape103: TQRShape
        Tag = 99
        Left = 0
        Top = 192
        Width = 1
        Height = 59
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          156.104166666666700000
          0.000000000000000000
          508.000000000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape104: TQRShape
        Tag = 99
        Left = 717
        Top = 192
        Width = 1
        Height = 59
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          156.104166666666700000
          1897.062500000000000000
          508.000000000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape105: TQRShape
        Tag = 99
        Left = 0
        Top = 273
        Width = 1
        Height = 88
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          232.833333333333400000
          0.000000000000000000
          722.312500000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape106: TQRShape
        Tag = 99
        Left = 717
        Top = 274
        Width = 1
        Height = 88
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          232.833333333333400000
          1897.062500000000000000
          724.958333333333400000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel47: TQRLabel
        Tag = 99
        Left = 656
        Top = 399
        Width = 28
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1735.666666666667000000
          1055.687500000000000000
          74.083333333333340000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'ICMS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel48: TQRLabel
        Tag = 99
        Left = 689
        Top = 399
        Width = 26
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1822.979166666667000000
          1055.687500000000000000
          68.791666666666680000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'IPI'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape1: TQRShape
        Tag = 99
        Left = 0
        Top = 128
        Width = 718
        Height = 44
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          116.416666666666700000
          0.000000000000000000
          338.666666666666700000
          1899.708333333333000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel13: TQRLabel
        Tag = 99
        Left = 4
        Top = 114
        Width = 123
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          10.583333333333330000
          301.625000000000000000
          325.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'FATURA / DUPLICATAS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel81: TQRLabel
        Tag = 99
        Left = 5
        Top = 130
        Width = 32
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          13.229166666666670000
          343.958333333333400000
          84.666666666666680000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NUMERO'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape108: TQRShape
        Tag = 99
        Left = 80
        Top = 128
        Width = 1
        Height = 44
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          116.416666666666700000
          211.666666666666700000
          338.666666666666700000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel82: TQRLabel
        Tag = 99
        Left = 85
        Top = 130
        Width = 49
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          224.895833333333300000
          343.958333333333400000
          129.645833333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VENCIMENTO'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape107: TQRShape
        Tag = 99
        Left = 160
        Top = 128
        Width = 1
        Height = 44
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          116.416666666666700000
          423.333333333333300000
          338.666666666666700000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel87: TQRLabel
        Tag = 99
        Left = 168
        Top = 130
        Width = 26
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          444.500000000000000000
          343.958333333333400000
          68.791666666666680000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VALOR'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape61: TQRShape
        Tag = 99
        Left = 240
        Top = 128
        Width = 1
        Height = 44
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          116.416666666666700000
          635.000000000000000000
          338.666666666666700000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel88: TQRLabel
        Tag = 99
        Left = 245
        Top = 130
        Width = 32
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          648.229166666666800000
          343.958333333333400000
          84.666666666666680000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NUMERO'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape111: TQRShape
        Tag = 99
        Left = 320
        Top = 128
        Width = 1
        Height = 44
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          116.416666666666700000
          846.666666666666600000
          338.666666666666700000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel90: TQRLabel
        Tag = 99
        Left = 325
        Top = 130
        Width = 49
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          859.895833333333400000
          343.958333333333400000
          129.645833333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VENCIMENTO'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape112: TQRShape
        Tag = 99
        Left = 400
        Top = 128
        Width = 1
        Height = 44
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          116.416666666666700000
          1058.333333333333000000
          338.666666666666700000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel91: TQRLabel
        Tag = 99
        Left = 408
        Top = 130
        Width = 26
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1079.500000000000000000
          343.958333333333400000
          68.791666666666680000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VALOR'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel92: TQRLabel
        Tag = 99
        Left = 485
        Top = 130
        Width = 32
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1283.229166666667000000
          343.958333333333400000
          84.666666666666680000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NUMERO'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel93: TQRLabel
        Tag = 99
        Left = 570
        Top = 130
        Width = 49
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1508.125000000000000000
          343.958333333333400000
          129.645833333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VENCIMENTO'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel94: TQRLabel
        Tag = 99
        Left = 644
        Top = 130
        Width = 26
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1703.916666666667000000
          343.958333333333400000
          68.791666666666680000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VALOR'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape114: TQRShape
        Tag = 99
        Left = 640
        Top = 128
        Width = 1
        Height = 44
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          116.416666666666700000
          1693.333333333333000000
          338.666666666666700000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape75: TQRShape
        Tag = 99
        Left = 560
        Top = 128
        Width = 1
        Height = 44
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          116.416666666666700000
          1481.666666666667000000
          338.666666666666700000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape113: TQRShape
        Tag = 99
        Left = 480
        Top = 128
        Width = 1
        Height = 44
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          116.416666666666700000
          1270.000000000000000000
          338.666666666666700000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText52: TQRDBText
        Tag = 99
        Left = 4
        Top = 144
        Width = 71
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          10.583333333333330000
          381.000000000000000000
          187.854166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'FatNum1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText71: TQRDBText
        Tag = 99
        Left = 4
        Top = 157
        Width = 71
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          10.583333333333330000
          415.395833333333400000
          187.854166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'FatNum2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText72: TQRDBText
        Tag = 99
        Left = 244
        Top = 157
        Width = 74
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          645.583333333333400000
          415.395833333333400000
          195.791666666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'FatNum4'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText73: TQRDBText
        Tag = 99
        Left = 244
        Top = 144
        Width = 74
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          645.583333333333400000
          381.000000000000000000
          195.791666666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'FatNum3'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText74: TQRDBText
        Tag = 99
        Left = 484
        Top = 157
        Width = 74
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1280.583333333333000000
          415.395833333333400000
          195.791666666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'FatNum6'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText75: TQRDBText
        Tag = 99
        Left = 484
        Top = 144
        Width = 74
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1280.583333333333000000
          381.000000000000000000
          195.791666666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'FatNum5'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText76: TQRDBText
        Tag = 99
        Left = 84
        Top = 144
        Width = 74
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          222.250000000000000000
          381.000000000000000000
          195.791666666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'FatVencto1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText77: TQRDBText
        Tag = 99
        Left = 84
        Top = 157
        Width = 74
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          222.250000000000000000
          415.395833333333400000
          195.791666666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'FatVencto2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText78: TQRDBText
        Tag = 99
        Left = 164
        Top = 157
        Width = 74
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          433.916666666666800000
          415.395833333333400000
          195.791666666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'FatValor2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText79: TQRDBText
        Tag = 99
        Left = 164
        Top = 144
        Width = 74
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          433.916666666666800000
          381.000000000000000000
          195.791666666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'FatValor1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText80: TQRDBText
        Tag = 99
        Left = 324
        Top = 144
        Width = 74
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          857.250000000000000000
          381.000000000000000000
          195.791666666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'FatVencto3'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText81: TQRDBText
        Tag = 99
        Left = 404
        Top = 144
        Width = 74
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1068.916666666667000000
          381.000000000000000000
          195.791666666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'FatValor3'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText82: TQRDBText
        Tag = 99
        Left = 324
        Top = 157
        Width = 74
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          857.250000000000000000
          415.395833333333400000
          195.791666666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'FatVencto4'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText83: TQRDBText
        Tag = 99
        Left = 404
        Top = 157
        Width = 74
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1068.916666666667000000
          415.395833333333400000
          195.791666666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'FatValor4'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText84: TQRDBText
        Tag = 99
        Left = 563
        Top = 144
        Width = 74
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1489.604166666667000000
          381.000000000000000000
          195.791666666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'FatVencto5'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText85: TQRDBText
        Tag = 99
        Left = 642
        Top = 144
        Width = 73
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1698.625000000000000000
          381.000000000000000000
          193.145833333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'FatValor5'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText86: TQRDBText
        Tag = 99
        Left = 563
        Top = 157
        Width = 74
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1489.604166666667000000
          415.395833333333400000
          195.791666666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'FatVencto6'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText87: TQRDBText
        Tag = 99
        Left = 642
        Top = 157
        Width = 73
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1698.625000000000000000
          415.395833333333400000
          193.145833333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'FatValor6'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
    end
    object qrsProdutos: TQRSubDetail
      Tag = 99
      Left = 38
      Top = 713
      Width = 718
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrsProdutosBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        44.979166666666670000
        1899.708333333333000000)
      Master = qrpDanfe
      DataSet = tabDanfeProdutos
      PrintBefore = False
      PrintIfEmpty = True
      object qrdCodigoProduto: TQRDBText
        Tag = 99
        Left = 2
        Top = 2
        Width = 39
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          5.291666666666667000
          5.291666666666667000
          103.187500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = tabDanfeProdutos
        DataField = 'CodigoProduto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object qrdProduto: TQRDBText
        Tag = 99
        Left = 44
        Top = 2
        Width = 162
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          116.416666666666700000
          5.291666666666667000
          428.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = tabDanfeProdutos
        DataField = 'Descricao'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object qrdNCM: TQRDBText
        Tag = 99
        Left = 209
        Top = 2
        Width = 41
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          552.979166666666800000
          5.291666666666667000
          108.479166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = tabDanfeProdutos
        DataField = 'NCM'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object qrdCST: TQRDBText
        Tag = 99
        Left = 252
        Top = 2
        Width = 26
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          666.750000000000000000
          5.291666666666667000
          68.791666666666680000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = tabDanfeProdutos
        DataField = 'CST'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText55: TQRDBText
        Tag = 99
        Left = 282
        Top = 2
        Width = 37
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          746.125000000000000000
          5.291666666666667000
          97.895833333333340000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = tabDanfeProdutos
        DataField = 'CFOP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText56: TQRDBText
        Tag = 99
        Left = 322
        Top = 2
        Width = 28
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          851.958333333333400000
          5.291666666666667000
          74.083333333333340000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = tabDanfeProdutos
        DataField = 'UN'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText57: TQRDBText
        Tag = 99
        Left = 353
        Top = 2
        Width = 38
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          933.979166666666600000
          5.291666666666667000
          100.541666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = tabDanfeProdutos
        DataField = 'Quantidade'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText58: TQRDBText
        Tag = 99
        Left = 394
        Top = 2
        Width = 63
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1042.458333333333000000
          5.291666666666667000
          166.687500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = tabDanfeProdutos
        DataField = 'ValorUnitario'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText59: TQRDBText
        Tag = 99
        Left = 460
        Top = 2
        Width = 71
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1217.083333333333000000
          5.291666666666667000
          187.854166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = tabDanfeProdutos
        DataField = 'ValorProdutos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText60: TQRDBText
        Tag = 99
        Left = 534
        Top = 2
        Width = 41
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1412.875000000000000000
          5.291666666666667000
          108.479166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = tabDanfeProdutos
        DataField = 'BCICMS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText61: TQRDBText
        Tag = 99
        Left = 578
        Top = 2
        Width = 39
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1529.291666666667000000
          5.291666666666667000
          103.187500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = tabDanfeProdutos
        DataField = 'ValorICMS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText62: TQRDBText
        Tag = 99
        Left = 620
        Top = 2
        Width = 32
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1640.416666666667000000
          5.291666666666667000
          84.666666666666680000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = tabDanfeProdutos
        DataField = 'ValorIPI'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText63: TQRDBText
        Tag = 99
        Left = 655
        Top = 2
        Width = 30
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1733.020833333333000000
          5.291666666666667000
          79.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = tabDanfeProdutos
        DataField = 'AliICMS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText64: TQRDBText
        Tag = 99
        Left = 688
        Top = 2
        Width = 28
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1820.333333333333000000
          5.291666666666667000
          74.083333333333340000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = tabDanfeProdutos
        DataField = 'AliqIPI'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object qrsDiv3: TQRShape
        Tag = 99
        Left = 207
        Top = -1
        Width = 1
        Height = 254
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          672.041666666666800000
          547.687500000000000000
          -2.645833333333333000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrsDiv2: TQRShape
        Tag = 99
        Left = 42
        Top = -1
        Width = 1
        Height = 254
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          672.041666666666800000
          111.125000000000000000
          -2.645833333333333000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrsDiv1: TQRShape
        Tag = 99
        Left = 0
        Top = -1
        Width = 1
        Height = 254
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          672.041666666666800000
          0.000000000000000000
          -2.645833333333333000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrsDiv4: TQRShape
        Tag = 99
        Left = 251
        Top = -1
        Width = 1
        Height = 254
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          672.041666666666800000
          664.104166666666800000
          -2.645833333333333000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrsDiv5: TQRShape
        Tag = 99
        Left = 280
        Top = -1
        Width = 1
        Height = 254
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          672.041666666666800000
          740.833333333333400000
          -2.645833333333333000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrsDiv6: TQRShape
        Tag = 99
        Left = 320
        Top = -1
        Width = 1
        Height = 254
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          672.041666666666800000
          846.666666666666600000
          -2.645833333333333000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrsDiv7: TQRShape
        Tag = 99
        Left = 351
        Top = -1
        Width = 1
        Height = 254
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          672.041666666666800000
          928.687500000000000000
          -2.645833333333333000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrsDiv8: TQRShape
        Tag = 99
        Left = 392
        Top = -1
        Width = 1
        Height = 254
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          672.041666666666800000
          1037.166666666667000000
          -2.645833333333333000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrsDiv9: TQRShape
        Tag = 99
        Left = 458
        Top = -1
        Width = 1
        Height = 254
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          672.041666666666800000
          1211.791666666667000000
          -2.645833333333333000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrsDiv10: TQRShape
        Tag = 99
        Left = 532
        Top = -1
        Width = 1
        Height = 254
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          672.041666666666800000
          1407.583333333333000000
          -2.645833333333333000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrsDiv11: TQRShape
        Tag = 99
        Left = 576
        Top = -1
        Width = 1
        Height = 254
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          672.041666666666800000
          1524.000000000000000000
          -2.645833333333333000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrsDiv12: TQRShape
        Tag = 99
        Left = 618
        Top = -1
        Width = 1
        Height = 254
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          672.041666666666800000
          1635.125000000000000000
          -2.645833333333333000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrsDiv13: TQRShape
        Tag = 99
        Left = 653
        Top = -1
        Width = 1
        Height = 254
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          672.041666666666800000
          1727.729166666667000000
          -2.645833333333333000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrsDiv14: TQRShape
        Tag = 99
        Left = 686
        Top = -1
        Width = 1
        Height = 254
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          672.041666666666800000
          1815.041666666667000000
          -2.645833333333333000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrsDiv15: TQRShape
        Tag = 99
        Left = 717
        Top = -1
        Width = 1
        Height = 254
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          672.041666666666800000
          1897.062500000000000000
          -2.645833333333333000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
    end
    object QRBand1: TQRBand
      Left = 38
      Top = 15
      Width = 718
      Height = 283
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        748.770833333333400000
        1899.708333333333000000)
      BandType = rbPageHeader
      object QRShape6: TQRShape
        Tag = 99
        Left = 0
        Top = 77
        Width = 718
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          203.729166666666700000
          1899.708333333333000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qriLogoDanfe: TQRImage
        Left = 2
        Top = 79
        Width = 287
        Height = 60
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          158.750000000000000000
          5.291666666666667000
          209.020833333333300000
          759.354166666666800000)
        Center = True
      end
      object QRShape12: TQRShape
        Tag = 99
        Left = 290
        Top = 77
        Width = 1
        Height = 145
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          383.645833333333400000
          767.291666666666800000
          203.729166666666700000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel6: TQRLabel
        Tag = 99
        Left = 323
        Top = 80
        Width = 41
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          854.604166666666800000
          211.666666666666700000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DANFE'
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
      object QRShape8: TQRShape
        Tag = 99
        Left = 407
        Top = 77
        Width = 1
        Height = 174
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          460.375000000000000000
          1076.854166666667000000
          203.729166666666700000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel89: TQRLabel
        Tag = 99
        Left = 413
        Top = 82
        Width = 80
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1092.729166666667000000
          216.958333333333400000
          211.666666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CONTROLE DO FISCO'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object qrsCodigoBarras: TQRAsBarcode
        Tag = 99
        Left = 419
        Top = 98
        Width = 36
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          1108.604166666667000000
          259.291666666666700000
          95.250000000000000000)
        BarcodeHeight = 30
        BarcodeWidth = 35
        Checksum = True
        Modul = 1
        Ratio = 2.000000000000000000
        Typ = bcCode128C
      end
      object QRLabel2: TQRLabel
        Tag = 99
        Left = 413
        Top = 145
        Width = 68
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          1092.729166666667000000
          383.645833333333400000
          179.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CHAVE DE ACESSO'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape9: TQRShape
        Tag = 99
        Left = 407
        Top = 141
        Width = 311
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          1076.854166666667000000
          373.062500000000000000
          822.854166666666600000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText7: TQRDBText
        Tag = 99
        Left = 2
        Top = 140
        Width = 286
        Height = 43
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          113.770833333333300000
          5.291666666666667000
          370.416666666666700000
          756.708333333333400000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'EmitRazao'
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
      object QRDBText8: TQRDBText
        Tag = 99
        Left = 2
        Top = 184
        Width = 286
        Height = 33
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          87.312500000000000000
          5.291666666666667000
          486.833333333333400000
          756.708333333333400000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'EmitEndCompleto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Tag = 99
        Left = 295
        Top = 163
        Width = 107
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          780.520833333333400000
          431.270833333333400000
          283.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'NumeroNota'
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
      object QRDBText5: TQRDBText
        Tag = 99
        Left = 295
        Top = 180
        Width = 107
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          780.520833333333400000
          476.250000000000000000
          283.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'SerieNota'
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
      object qrlPagina: TQRLabel
        Tag = 99
        Left = 295
        Top = 199
        Width = 107
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          780.520833333333400000
          526.520833333333400000
          283.104166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'P'#225'gina 1 de 1'
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
      object QRLabel10: TQRLabel
        Tag = 99
        Left = 295
        Top = 146
        Width = 38
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          780.520833333333400000
          386.291666666666700000
          100.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '1 - Sa'#237'da'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel9: TQRLabel
        Tag = 99
        Left = 295
        Top = 130
        Width = 47
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          780.520833333333400000
          343.958333333333400000
          124.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0 - Entrada'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRShape13: TQRShape
        Tag = 99
        Left = 374
        Top = 130
        Width = 24
        Height = 26
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          68.791666666666680000
          989.541666666666800000
          343.958333333333400000
          63.500000000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText6: TQRDBText
        Tag = 99
        Left = 380
        Top = 135
        Width = 11
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1005.416666666667000000
          357.187500000000000000
          29.104166666666670000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'TipoNF'
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
      object QRLabel8: TQRLabel
        Tag = 99
        Left = 293
        Top = 112
        Width = 112
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          775.229166666666800000
          296.333333333333400000
          296.333333333333400000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Nota Fiscal Eletr'#244'nica'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel7: TQRLabel
        Tag = 99
        Left = 293
        Top = 98
        Width = 112
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          775.229166666666800000
          259.291666666666700000
          296.333333333333400000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Documento Auxiliar da'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRDBText10: TQRDBText
        Tag = 99
        Left = 408
        Top = 161
        Width = 309
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          1079.500000000000000000
          425.979166666666700000
          817.562500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'ChaveAcessoFmt'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape10: TQRShape
        Tag = 99
        Left = 407
        Top = 183
        Width = 311
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          1076.854166666667000000
          484.187500000000000000
          822.854166666666600000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel3: TQRLabel
        Tag = 99
        Left = 450
        Top = 186
        Width = 219
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          1190.625000000000000000
          492.124999999999900000
          579.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Consulta de autenticidade no portal nacional da NF-e'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel4: TQRLabel
        Tag = 99
        Left = 428
        Top = 203
        Width = 269
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          1132.416666666667000000
          537.104166666666800000
          711.729166666666800000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'www.nfe.fazenda.gov.br/portal ou no site da Sefaz Autorizadora'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRDBText11: TQRDBText
        Tag = 99
        Left = 419
        Top = 233
        Width = 288
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1108.604166666667000000
          616.479166666666800000
          762.000000000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'ProtocoloAutorizacao'
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
      object QRLabel15: TQRLabel
        Tag = 99
        Left = 4
        Top = 252
        Width = 82
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          10.583333333333330000
          666.750000000000000000
          216.958333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'INSCRI'#199#195'O ESTADUAL'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText12: TQRDBText
        Tag = 99
        Left = 4
        Top = 262
        Width = 191
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          693.208333333333400000
          505.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'EmitIE'
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
      object QRDBText3: TQRDBText
        Tag = 99
        Left = 4
        Top = 233
        Width = 394
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          616.479166666666800000
          1042.458333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'NatOp'
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
      object QRLabel14: TQRLabel
        Tag = 99
        Left = 4
        Top = 223
        Width = 95
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          10.583333333333330000
          590.020833333333400000
          251.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NATUREZA DA OPERA'#199#195'O'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape99: TQRShape
        Tag = 99
        Left = 0
        Top = 78
        Width = 1
        Height = 202
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          534.458333333333400000
          0.000000000000000000
          206.375000000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape16: TQRShape
        Tag = 99
        Left = 205
        Top = 250
        Width = 1
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          542.395833333333400000
          661.458333333333400000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel16: TQRLabel
        Tag = 99
        Left = 220
        Top = 252
        Width = 147
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          582.083333333333400000
          666.750000000000000000
          388.937500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'INSCRI'#199#195'O ESTADUAL DO SUBST. TRIB.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel17: TQRLabel
        Tag = 99
        Left = 428
        Top = 252
        Width = 18
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          1132.416666666667000000
          666.750000000000000000
          47.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CNPJ'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText13: TQRDBText
        Tag = 99
        Left = 428
        Top = 262
        Width = 270
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1132.416666666667000000
          693.208333333333400000
          714.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'EmitCNPJ'
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
      object QRShape15: TQRShape
        Tag = 99
        Left = 422
        Top = 250
        Width = 1
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          1116.541666666667000000
          661.458333333333400000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel5: TQRLabel
        Tag = 99
        Left = 413
        Top = 223
        Width = 147
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1092.729166666667000000
          590.020833333333400000
          388.937500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PROTOCOLO DE AUTORIZA'#199#195'O DE USO'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape11: TQRShape
        Tag = 99
        Left = 0
        Top = 221
        Width = 718
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          584.729166666666800000
          1899.708333333333000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape100: TQRShape
        Tag = 99
        Left = 717
        Top = 77
        Width = 1
        Height = 202
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          534.458333333333400000
          1897.062500000000000000
          203.729166666666700000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape7: TQRShape
        Tag = 99
        Left = 0
        Top = 250
        Width = 718
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          661.458333333333400000
          1899.708333333333000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape14: TQRShape
        Tag = 99
        Left = 0
        Top = 279
        Width = 718
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          738.187500000000000000
          1899.708333333333000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrdRecebemos: TQRDBText
        Tag = 99
        Left = 1
        Top = 4
        Width = 556
        Height = 28
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          74.083333333333340000
          2.645833333333333000
          10.583333333333330000
          1471.083333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'Recebemos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape4: TQRShape
        Tag = 99
        Left = 560
        Top = 2
        Width = 1
        Height = 62
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          164.041666666666700000
          1481.666666666667000000
          5.291666666666667000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel1: TQRLabel
        Tag = 99
        Left = 615
        Top = 10
        Width = 17
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1627.187500000000000000
          26.458333333333330000
          44.979166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NF-e'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText1: TQRDBText
        Tag = 99
        Left = 569
        Top = 29
        Width = 144
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1505.479166666667000000
          76.729166666666680000
          381.000000000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'NumeroNota'
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
        Tag = 99
        Left = 569
        Top = 45
        Width = 144
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1505.479166666667000000
          119.062500000000000000
          381.000000000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'SerieNota'
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
      object QRLabel12: TQRLabel
        Tag = 99
        Left = 175
        Top = 35
        Width = 175
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          463.020833333333400000
          92.604166666666680000
          463.020833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = True
        Caption = 'IDENTIFICA'#199#195'O E ASSINATURA DO RECEBEDOR'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape97: TQRShape
        Tag = 99
        Left = 171
        Top = 33
        Width = 1
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          82.020833333333340000
          452.437500000000000000
          87.312500000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel11: TQRLabel
        Tag = 99
        Left = 1
        Top = 35
        Width = 88
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          2.645833333333333000
          92.604166666666680000
          232.833333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = True
        Caption = 'DATA DE RECEBIMENTO'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape2: TQRShape
        Tag = 99
        Left = 0
        Top = 33
        Width = 561
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          87.312500000000000000
          1484.312500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape3: TQRShape
        Tag = 99
        Left = 0
        Top = 63
        Width = 718
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          166.687500000000000000
          1899.708333333333000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape5: TQRShape
        Tag = 99
        Left = 0
        Top = 70
        Width = 718
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          185.208333333333300000
          1899.708333333333000000)
        Pen.Style = psDashDotDot
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape98: TQRShape
        Tag = 99
        Left = 0
        Top = 1
        Width = 719
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          2.645833333333333000
          1902.354166666667000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape119: TQRShape
        Tag = 99
        Left = 0
        Top = 1
        Width = 1
        Height = 62
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          164.041666666666700000
          0.000000000000000000
          2.645833333333333000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape120: TQRShape
        Tag = 99
        Left = 717
        Top = 1
        Width = 1
        Height = 62
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          164.041666666666700000
          1897.062500000000000000
          2.645833333333333000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
    end
    object qrbISSQNDadosAd: TQRBand
      Left = 38
      Top = 730
      Width = 718
      Height = 209
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrbISSQNDadosAdBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        552.979166666666800000
        1899.708333333333000000)
      BandType = rbPageFooter
      object QRLabel77: TQRLabel
        Tag = 99
        Left = 4
        Top = 3
        Width = 103
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          10.583333333333330000
          7.937500000000000000
          272.520833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'C'#193'LCULO DO ISSQN'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel83: TQRLabel
        Tag = 99
        Left = 4
        Top = 19
        Width = 85
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          10.583333333333330000
          50.270833333333330000
          224.895833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'INSCRI'#199#195'O MUNICIPAL'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText65: TQRDBText
        Tag = 99
        Left = 12
        Top = 29
        Width = 139
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          31.750000000000000000
          76.729166666666680000
          367.770833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'EmitIM'
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
      object QRLabel84: TQRLabel
        Tag = 99
        Left = 164
        Top = 19
        Width = 111
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          433.916666666666700000
          50.270833333333330000
          293.687500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VALOR TOTAL DOS SERVI'#199'OS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText66: TQRDBText
        Tag = 99
        Left = 171
        Top = 29
        Width = 175
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          452.437500000000000000
          76.729166666666680000
          463.020833333333400000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'ValorTotalServico'
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
      object QRLabel78: TQRLabel
        Tag = 99
        Left = 4
        Top = 51
        Width = 106
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          10.583333333333330000
          134.937500000000000000
          280.458333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DADOS ADICIONAIS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel79: TQRLabel
        Tag = 99
        Left = 4
        Top = 67
        Width = 124
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          10.583333333333330000
          177.270833333333300000
          328.083333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'INFORMA'#199#213'ES COMPLEMENTARES'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText69: TQRDBText
        Tag = 99
        Left = 4
        Top = 80
        Width = 401
        Height = 113
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          298.979166666666700000
          10.583333333333330000
          211.666666666666700000
          1060.979166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'InfCpl'
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
      object QRLabel80: TQRLabel
        Tag = 99
        Left = 414
        Top = 67
        Width = 83
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          1095.375000000000000000
          177.270833333333300000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'RESERVADO AO FISCO'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText70: TQRDBText
        Tag = 99
        Left = 414
        Top = 80
        Width = 302
        Height = 113
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          298.979166666666700000
          1095.375000000000000000
          211.666666666666700000
          799.041666666666800000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'InfAdFisco'
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
      object QRDBText67: TQRDBText
        Tag = 99
        Left = 379
        Top = 29
        Width = 161
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1002.770833333333000000
          76.729166666666680000
          425.979166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'ValorBCISSQN'
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
      object QRLabel85: TQRLabel
        Tag = 99
        Left = 367
        Top = 19
        Width = 107
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          971.020833333333400000
          50.270833333333330000
          283.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'BASE DE C'#193'LCULO DO ISSQN'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel86: TQRLabel
        Tag = 99
        Left = 556
        Top = 19
        Width = 93
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1471.083333333333000000
          50.270833333333330000
          246.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VALOR TOTAL DO ISSQN'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText68: TQRDBText
        Tag = 99
        Left = 561
        Top = 29
        Width = 152
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1484.312500000000000000
          76.729166666666680000
          402.166666666666600000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabDanfe
        DataField = 'ValorTotalISSQN'
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
      object QRShape96: TQRShape
        Tag = 99
        Left = 546
        Top = 17
        Width = 1
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          1444.625000000000000000
          44.979166666666670000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape95: TQRShape
        Tag = 99
        Left = 358
        Top = 17
        Width = 1
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          947.208333333333400000
          44.979166666666670000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape94: TQRShape
        Tag = 99
        Left = 154
        Top = 17
        Width = 1
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          407.458333333333400000
          44.979166666666670000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape115: TQRShape
        Tag = 99
        Left = 0
        Top = 18
        Width = 1
        Height = 29
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          76.729166666666680000
          0.000000000000000000
          47.625000000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape87: TQRShape
        Tag = 99
        Left = 0
        Top = 17
        Width = 718
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          44.979166666666670000
          1899.708333333333000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape88: TQRShape
        Tag = 99
        Left = 0
        Top = 46
        Width = 718
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          121.708333333333300000
          1899.708333333333000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape91: TQRShape
        Tag = 99
        Left = 408
        Top = 65
        Width = 1
        Height = 131
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          346.604166666666700000
          1079.500000000000000000
          171.979166666666700000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape89: TQRShape
        Tag = 99
        Left = -1
        Top = 65
        Width = 718
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          -2.645833333333333000
          171.979166666666700000
          1899.708333333333000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape90: TQRShape
        Tag = 99
        Left = 0
        Top = 195
        Width = 719
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          515.937500000000000000
          1902.354166666667000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape93: TQRShape
        Tag = 99
        Left = 0
        Top = 65
        Width = 1
        Height = 130
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          343.958333333333400000
          0.000000000000000000
          171.979166666666700000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape116: TQRShape
        Tag = 99
        Left = 717
        Top = 18
        Width = 1
        Height = 29
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          76.729166666666680000
          1897.062500000000000000
          47.625000000000000000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape92: TQRShape
        Tag = 99
        Left = 717
        Top = 65
        Width = 1
        Height = 130
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          343.958333333333400000
          1897.062500000000000000
          171.979166666666700000
          2.645833333333333000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel95: TQRLabel
        Tag = 99
        Left = 0
        Top = 197
        Width = 129
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          0.000000000000000000
          521.229166666666800000
          341.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'RINSoft - http://www.rinsoft.com.br'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRSysData1: TQRSysData
        Left = 645
        Top = 197
        Width = 73
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1706.562500000000000000
          521.229166666666800000
          193.145833333333300000)
        Alignment = taRightJustify
        AlignToBand = True
        AutoSize = True
        Color = clWhite
        Data = qrsDateTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Text = 'Emitido:'
        Transparent = False
        FontSize = 6
      end
      object QRShape38: TQRShape
        Tag = 99
        Left = 0
        Top = 0
        Width = 718
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          0.000000000000000000
          1899.708333333333000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
    end
  end
  object btnVisualizar: TBitBtn [2]
    Left = 8
    Top = 12
    Width = 149
    Height = 28
    Caption = 'Visualizar'
    TabOrder = 0
    OnClick = btnVisualizarClick
    Glyph.Data = {
      36060000424D3606000000000000360000002800000020000000100000000100
      18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
      A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
      69A46769A46769FF00FFFF00FFFF00FF9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C
      9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9CFF00FFFF00FFFF00FF
      485360FEE9C7F4DAB5F3D5AAF2D0A0EFCB96EFC68BEDC182EBC17FEBC180EBC1
      80F2C782A46769FF00FFFF00FFFF00FF6F6F6FE9E9E9DEDEDED9D9D9D4D4D4CF
      CFCFCACACAC5C5C5C3C3C3C4C4C4C4C4C4C7C7C79C9C9CFF00FFFF00FF4380B7
      1F6FC2656B86F3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD
      7FEFC481A46769FF00FFFF00FF9292928282828E8E8EE0E0E0DBDBDBD7D7D7D2
      D2D2CDCDCDC9C9C9C3C3C3C2C2C2C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FF
      32A3FF1672D76B6A80F2DABCF2D5B2EFD0A9EECB9EEDC796EBC28CE9BD82E9BD
      7FEFC481A46769FF00FFFF00FFFF00FFA5A5A58484848E8E8EE0E0E0DCDCDCD7
      D7D7D2D2D2CECECEC9C9C9C4C4C4C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FF
      A0675B34A1FF1572D45E6782F3DABBF2D5B1F0D0A6EECB9EEDC795EBC28AEABF
      81EFC480A46769FF00FFFF00FFFF00FF959595A6A6A6828282898989E0E0E0DB
      DBDBD6D6D6D2D2D2CDCDCDC8C8C8C4C4C4C5C5C59C9C9CFF00FFFF00FFFF00FF
      A7756BFFFBF033A6FF4078AD8E675EAC7F7597645EAC7D6FCAA083EDC695EBC2
      8AEFC583A46769FF00FFFF00FFFF00FF9F9F9FF9F9F9A5A5A58C8C8C8E8E8EA6
      A6A6929292A3A3A3B8B8B8CDCDCDC8C8C8C7C7C79C9C9CFF00FFFF00FFFF00FF
      A7756BFFFFFCFAF0E6AD8A88B78F84D8BAA5EED5B6D7B298B58877CBA083EBC7
      93F2C98CA46769FF00FFFF00FFFF00FF9F9F9FFEFEFEF3F3F3AFAFAFB1B1B1CC
      CCCCDCDCDCC6C6C6AAAAAAB9B9B9CCCCCCCCCCCC9C9C9CFF00FFFF00FFFF00FF
      BC8268FFFFFFFEF7F2AF847FDAC0B4F7E3CFF6E0C5FFFFF4D7B198AC7D6FEECC
      9EF3CE97A46769FF00FFFF00FFFF00FFA6A6A6FFFFFFF9F9F9ABABABD3D3D3E9
      E9E9E5E5E5FBFBFBC6C6C6A3A3A3D2D2D2D1D1D19C9C9CFF00FFFF00FFFF00FF
      BC8268FFFFFFFFFEFC976560F6E9E0F7EADAF6E3CFFFFFEBEFD4B797645EF0D0
      A6F6D3A0A46769FF00FFFF00FFFF00FFA6A6A6FFFFFFFEFEFE939393EFEFEFEE
      EEEEE9E9E9F7F7F7DDDDDD929292D6D6D6D6D6D69C9C9CFF00FFFF00FFFF00FF
      D1926DFFFFFFFFFFFFB08884DECAC4FAEFE5F8EAD9FFFFD4D9B8A5AC7F74F4D8
      B1EBCFA4A46769FF00FFFF00FFFF00FFB1B1B1FFFFFFFFFFFFAEAEAEDBDBDBF3
      F3F3EEEEEEEEEEEECDCDCDA5A5A5DCDCDCD3D3D39C9C9CFF00FFFF00FFFF00FF
      D1926DFFFFFFFFFFFFD5BFBCBA9793DECAC4F6E9DEDAC0B4B78F84B28C7BDECE
      B4B6AA93A46769FF00FFFF00FFFF00FFB1B1B1FFFFFFFFFFFFD5D5D5B9B9B9DB
      DBDBEFEFEFD3D3D3B1B1B1ABABABD5D5D5B7B7B79C9C9CFF00FFFF00FFFF00FF
      DA9D75FFFFFFFFFFFFFFFFFFD5BFBCB08884976560AF867FCAA79DA56B5FA56B
      5FA56B5FA46769FF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFFD5D5D5AE
      AEAE939393ABABABC3C3C39999999999999999999C9C9CFF00FFFF00FFFF00FF
      DA9D75FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BAA56B5FE19E
      55E68F31B56D4DFF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFDFDFDFCFCFCD6D6D6999999ACACAC9B9B9B969696FF00FFFF00FFFF00FF
      E7AB79FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCC7C5A56B5FF8B5
      5CBF7A5CFF00FFFF00FFFF00FFFF00FFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFDBDBDB999999B8B8B8A2A2A2FF00FFFF00FFFF00FFFF00FF
      E7AB79FBF4F0FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0A56B5FC183
      6CFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFF8F8F8F7F7F7F7F7F7F7F7F7F6
      F6F6F6F6F6F6F6F6D7D7D7999999AAAAAAFF00FFFF00FFFF00FFFF00FFFF00FF
      E7AB79D1926DD1926DD1926DD1926DD1926DD1926DD1926DD1926DA56B5FFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFB1B1B1B1B1B1B1B1B1B1B1B1B1
      B1B1B1B1B1B1B1B1B1B1B1999999FF00FFFF00FFFF00FFFF00FF}
    NumGlyphs = 2
  end
  object btnImprimir: TBitBtn [3]
    Left = 8
    Top = 40
    Width = 149
    Height = 28
    Caption = 'Imprimir'
    TabOrder = 1
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
  object btnFechar: TBitBtn [4]
    Left = 8
    Top = 98
    Width = 149
    Height = 28
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
  object btnEmail: TBitBtn [5]
    Left = 8
    Top = 69
    Width = 149
    Height = 28
    Caption = 'E-mail'
    TabOrder = 2
    OnClick = btnEmailClick
    Glyph.Data = {
      36060000424D3606000000000000360000002800000020000000100000000100
      18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8E5D59
      8E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D
      598E5D598E5D59FF00FFFF00FF96969696969696969696969696969696969696
      9696969696969696969696969696969696969696969696FF00FF8E5D59B67F74
      E7B28FFFD098FECC96FFCC97FFCC97FFCC97FFCC97FFCC97FFCC97FFCC96FFD3
      99E5AD8CB47B758E5D59969696A8A8A8C3C3C3CECECECDCDCDCDCDCDCDCDCDCD
      CDCDCDCDCDCDCDCDCDCDCDCDCDCDCECECEC2C2C2A8A8A89696968E5D59D5A084
      B67F78F0CEACF4D3AFF2CFADF2D0ADF2D0ADF2D0ADF2D0ADF2CFADF4D3AFEBC4
      A6B57D77D8A98F8E5D59969696B9B9B9AAAAAAD1D1D1D3D3D3D2D2D2D2D2D2D2
      D2D2D2D2D2D2D2D2D2D2D2D3D3D3CDCDCDA9A9A9BEBEBE9696968E5D59F0D3B6
      C58E7BC1938EEFDEC9EDD8C4EDD8C4EDD8C4EDD8C4EDD8C4EDD8C4EFDDC7BD8C
      87C29183EFD8C18E5D59969696D4D4D4B1B1B1B6B6B6DADADAD8D8D8D8D8D8D8
      D8D8D8D8D8D8D8D8D8D8D8D9D9D9B2B2B2B2B2B2D8D8D89696968E5D59EADCD0
      EED0B2B17A70D7BFB6EFE7D9EEE2D7EEE2D7EEE2D7EEE2D7F2EADCD0AFA7B47E
      76EFDCC6EADCD08E5D59969696DBDBDBD2D2D2A5A5A5CCCCCCDFDFDFDEDEDEDE
      DEDEDEDEDEDEDEDEE1E1E1C4C4C4A8A8A8D9D9D9DBDBDB9696968E5D59EFE3DD
      F8F3E7E3B89EAD7A74E7D5CFF2E5DCEFE2D9EFE2D9F0E3DAE3CAC4B27A76E2C5
      B5F7F4EAF0E3DC8E5D59969696E1E1E1E7E7E7C8C8C8A5A5A5D9D9D9E1E1E1DF
      DFDFDFDFDFE0E0E0D4D4D4A8A8A8CFCFCFE8E8E8E1E1E19696968E5D59F7F2EE
      FAF8F3C99A93AF78748E5D598E5D598E5D598E5D598E5D598E5D59AF7673D7B6
      B0FFFFFEF6EFED8E5D59969696E9E9E9EBEBEBBBBBBBA5A5A596969696969696
      96969696969696968F8F8FA5A5A5C9C9C9F0F0F0E8E8E89696968E5D59E7CECC
      B78683BA8C8BEEE7E7F0F0F0E7E2E3E6E3E5E3E3E3E2E9EAE9F7F7D5CECCB180
      7FBD8F8EEDDCDC8E5D59969696D9D9D9AFAFAFB2B2B2E4E4E4E8E8E8E0E0E0E0
      E0E0DFDFDFE1E1E1E7E7E7D3D3D3ABABABB5B5B5DFDFDF9696968E5D59AF7F7E
      D0B1B0FFFFFFFBFFFFF8FFFFF4FFFFF2FFFFEEFFFFEBFFFFEAFFFFEBFFFFE6F6
      F6C2A3A1B5827F8E5D59969696AAAAAAC8C8C8F1F1F1F0F0F0EFEFEFEEEEEEED
      EDEDEBEBEBEAEAEAEAEAEAEAEAEAE6E6E6BDBDBDACACAC9696968E5D59A3DADE
      FFFFFFFCFFFFFAFFFFFAFFFFFAFFFFF7FFFFF7FFFFF0FEFCEBF8F8E1F4F4D5ED
      EEC5EDF2ABBBC08E5D59969696C8C8C8F1F1F1F0F0F0F0F0F0F0F0F0F0F0F0EF
      EFEFEFEFEFECECECE9E9E9E4E4E4DEDEDED9D9D9C0C0C0969696FF00FF8E5D59
      FFFFFFFFFFFFFFFFFFF0F7F8E1EDEEC9E2E5A6CCD193C1CA84B8C67AB1C56EAF
      CB72A1BF8E5D59FF00FFFF00FF969696F1F1F1F1F1F1F1F1F1EAEAEAE2E2E2D7
      D7D7C4C4C4BBBBBBB4B4B4B0B0B0ADADADABABAB969696FF00FFFF00FFFF00FF
      8E5D59A7D8DE8BFCFF7DDEEA73D4E16CD8E36ADAE96CD8EE6DD8F26CDAFC87BA
      D38E5D59FF00FFFF00FFFF00FFFF00FF969696C9C9C9C9C9C9BDBDBDB6B6B6B5
      B5B5B6B6B6B8B8B8BABABABCBCBCB9B9B9969696FF00FFFF00FFFF00FFFF00FF
      FF00FF8E5D5992B7BD70F0FC6EF7FF73F2FF73F3FF6FF7FF76E6FA9CAAB68E5D
      59FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF969696B6B6B6BEBEBEBEBEBEC0
      C0C0C0C0C0BFBFBFC0C0C0B7B7B7969696FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF8E5D598E5D5982D8E073F0FA74EFF883D7E08E5D598E5D59FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF969696969696BCBCBCBE
      BEBEBEBEBEBCBCBC8F8F8F969696FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF8E5D598E5D598E5D598E5D59FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF96969696
      9696969696969696FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    NumGlyphs = 2
  end
  inherited popGrid: TPopupMenu
    Left = 872
    Top = 24
  end
  object tabDanfe: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 816
    Top = 174
    object tabDanfeNumeroNota: TStringField
      FieldName = 'NumeroNota'
    end
    object tabDanfeNatOp: TStringField
      FieldName = 'NatOp'
      Size = 60
    end
    object tabDanfeTipoNF: TStringField
      FieldName = 'TipoNF'
      Size = 1
    end
    object tabDanfeEmitRazao: TStringField
      FieldName = 'EmitRazao'
      Size = 60
    end
    object tabDanfeEmitFantasia: TStringField
      FieldName = 'EmitFantasia'
      Size = 60
    end
    object tabDanfeEmitCNPJ: TStringField
      FieldName = 'EmitCNPJ'
    end
    object tabDanfeEmitLgr: TStringField
      FieldName = 'EmitLgr'
      Size = 60
    end
    object tabDanfeEmitNro: TStringField
      FieldName = 'EmitNro'
      Size = 10
    end
    object tabDanfeChaveAcesso: TStringField
      FieldName = 'ChaveAcesso'
      Size = 50
    end
    object tabDanfeChaveAcessoFmt: TStringField
      FieldName = 'ChaveAcessoFmt'
      Size = 55
    end
    object tabDanfeProtocoloAutorizacao: TStringField
      FieldName = 'ProtocoloAutorizacao'
      Size = 100
    end
    object tabDanfeNumeroNotaFmt: TStringField
      FieldName = 'NumeroNotaFmt'
      Size = 30
    end
    object tabDanfeSerieNota: TStringField
      FieldName = 'SerieNota'
      Size = 10
    end
    object tabDanfeEmissao: TStringField
      FieldName = 'Emissao'
      Size = 10
    end
    object tabDanfeEmitIE: TStringField
      FieldName = 'EmitIE'
    end
    object tabDanfeEmitIM: TStringField
      FieldName = 'EmitIM'
    end
    object tabDanfeRecebemos: TStringField
      FieldName = 'Recebemos'
      Size = 150
    end
    object tabDanfeEmitFone: TStringField
      FieldName = 'EmitFone'
    end
    object tabDanfeEmitEndCompleto: TStringField
      FieldName = 'EmitEndCompleto'
      Size = 255
    end
    object tabDanfeDestCNPJCPF: TStringField
      FieldName = 'DestCNPJCPF'
    end
    object tabDanfeDestRazao: TStringField
      FieldName = 'DestRazao'
      Size = 60
    end
    object tabDanfeDestEmail: TStringField
      FieldName = 'DestEmail'
      Size = 60
    end
    object tabDanfeDestEndereco: TStringField
      FieldName = 'DestEndereco'
      Size = 60
    end
    object tabDanfeDestBairro: TStringField
      FieldName = 'DestBairro'
      Size = 60
    end
    object tabDanfeDestCep: TStringField
      FieldName = 'DestCep'
      Size = 10
    end
    object tabDanfeDestCidade: TStringField
      FieldName = 'DestCidade'
      Size = 60
    end
    object tabDanfeDestUF: TStringField
      FieldName = 'DestUF'
      Size = 2
    end
    object tabDanfeDestFone: TStringField
      FieldName = 'DestFone'
    end
    object tabDanfeDestIE: TStringField
      FieldName = 'DestIE'
    end
    object tabDanfeValorBC: TCurrencyField
      FieldName = 'ValorBC'
    end
    object tabDanfeValorICMS: TCurrencyField
      FieldName = 'ValorICMS'
    end
    object tabDanfeValorBCST: TCurrencyField
      FieldName = 'ValorBCST'
    end
    object tabDanfeValorST: TCurrencyField
      FieldName = 'ValorST'
    end
    object tabDanfeValorProdutos: TCurrencyField
      FieldName = 'ValorProdutos'
    end
    object tabDanfeValorFrete: TCurrencyField
      FieldName = 'ValorFrete'
    end
    object tabDanfeValorSeguro: TCurrencyField
      FieldName = 'ValorSeguro'
    end
    object tabDanfeValorDesconto: TCurrencyField
      FieldName = 'ValorDesconto'
    end
    object tabDanfeValorII: TCurrencyField
      FieldName = 'ValorII'
    end
    object tabDanfeValorIPI: TCurrencyField
      FieldName = 'ValorIPI'
    end
    object tabDanfeValorPIS: TCurrencyField
      FieldName = 'ValorPIS'
    end
    object tabDanfeValorCOFINS: TCurrencyField
      FieldName = 'ValorCOFINS'
    end
    object tabDanfeValorODA: TCurrencyField
      FieldName = 'ValorODA'
    end
    object tabDanfeValorTotalNF: TCurrencyField
      FieldName = 'ValorTotalNF'
    end
    object tabDanfeValorTotalServico: TCurrencyField
      FieldName = 'ValorTotalServico'
    end
    object tabDanfeValorBCISSQN: TCurrencyField
      FieldName = 'ValorBCISSQN'
    end
    object tabDanfeValorTotalISSQN: TCurrencyField
      FieldName = 'ValorTotalISSQN'
    end
    object tabDanfeTranspFreteConta: TStringField
      FieldName = 'TranspFreteConta'
    end
    object tabDanfeTranspRazao: TStringField
      FieldName = 'TranspRazao'
      Size = 60
    end
    object tabDanfeTranspCNPJ: TStringField
      FieldName = 'TranspCNPJ'
    end
    object tabDanfeTranspEndereco: TStringField
      FieldName = 'TranspEndereco'
      Size = 60
    end
    object tabDanfeTranspCidade: TStringField
      FieldName = 'TranspCidade'
      Size = 60
    end
    object tabDanfeTranspUF: TStringField
      FieldName = 'TranspUF'
      Size = 2
    end
    object tabDanfeTranspIE: TStringField
      FieldName = 'TranspIE'
    end
    object tabDanfeTranspCodigoANTT: TStringField
      FieldName = 'TranspCodigoANTT'
    end
    object tabDanfeTranspPlacaVeic: TStringField
      FieldName = 'TranspPlacaVeic'
      Size = 8
    end
    object tabDanfeVolEspecie: TStringField
      FieldName = 'VolEspecie'
      Size = 30
    end
    object tabDanfeVolMarca: TStringField
      FieldName = 'VolMarca'
      Size = 30
    end
    object tabDanfeVolQuantidade: TIntegerField
      FieldName = 'VolQuantidade'
    end
    object tabDanfeVolNumeracao: TStringField
      FieldName = 'VolNumeracao'
    end
    object tabDanfeFatNum1: TStringField
      FieldName = 'FatNum1'
    end
    object tabDanfeFatNum2: TStringField
      FieldName = 'FatNum2'
    end
    object tabDanfeFatNum3: TStringField
      FieldName = 'FatNum3'
    end
    object tabDanfeFatNum4: TStringField
      FieldName = 'FatNum4'
    end
    object tabDanfeFatNum5: TStringField
      FieldName = 'FatNum5'
    end
    object tabDanfeFatNum6: TStringField
      FieldName = 'FatNum6'
    end
    object tabDanfeFatValor1: TStringField
      FieldName = 'FatValor1'
    end
    object tabDanfeFatValor2: TStringField
      FieldName = 'FatValor2'
    end
    object tabDanfeFatValor3: TStringField
      FieldName = 'FatValor3'
    end
    object tabDanfeFatValor4: TStringField
      FieldName = 'FatValor4'
    end
    object tabDanfeFatValor5: TStringField
      FieldName = 'FatValor5'
    end
    object tabDanfeFatValor6: TStringField
      FieldName = 'FatValor6'
    end
    object tabDanfeFatVencto1: TStringField
      FieldName = 'FatVencto1'
      Size = 10
    end
    object tabDanfeFatVencto2: TStringField
      FieldName = 'FatVencto2'
      Size = 10
    end
    object tabDanfeFatVencto3: TStringField
      FieldName = 'FatVencto3'
      Size = 10
    end
    object tabDanfeFatVencto4: TStringField
      FieldName = 'FatVencto4'
      Size = 10
    end
    object tabDanfeFatVencto5: TStringField
      FieldName = 'FatVencto5'
      Size = 10
    end
    object tabDanfeFatvencto6: TStringField
      FieldName = 'Fatvencto6'
      Size = 10
    end
    object tabDanfeInfCpl: TMemoField
      FieldName = 'InfCpl'
      BlobType = ftMemo
      Size = 1
    end
    object tabDanfeInfAdFisco: TMemoField
      FieldName = 'InfAdFisco'
      BlobType = ftMemo
      Size = 1
    end
    object tabDanfeTranspPlacaUF: TStringField
      FieldName = 'TranspPlacaUF'
      Size = 2
    end
    object tabDanfeVolPesoL: TStringField
      FieldName = 'VolPesoL'
      Size = 10
    end
    object tabDanfeVolPesoB: TStringField
      FieldName = 'VolPesoB'
      Size = 10
    end
    object tabDanfeInfoCplCont: TMemoField
      FieldName = 'InfoCplCont'
      BlobType = ftMemo
      Size = 1
    end
    object tabDanfeCodigoConta: TFloatField
      FieldName = 'CodigoConta'
    end
    object tabDanfeTipoTela: TIntegerField
      FieldName = 'TipoTela'
    end
    object tabDanfeXML: TBlobField
      FieldName = 'XML'
    end
  end
  object dtsDanfe: TDataSource
    AutoEdit = False
    DataSet = tabDanfe
    Left = 880
    Top = 174
  end
  object tabDanfeProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 848
    Top = 222
    object tabDanfeProdutosChaveAcesso: TStringField
      FieldName = 'ChaveAcesso'
      Size = 50
    end
    object tabDanfeProdutosCodigoProduto: TStringField
      FieldName = 'CodigoProduto'
      Size = 30
    end
    object tabDanfeProdutosDescricao: TStringField
      FieldName = 'Descricao'
      Size = 60
    end
    object tabDanfeProdutosNCM: TStringField
      FieldName = 'NCM'
      Size = 10
    end
    object tabDanfeProdutosCFOP: TStringField
      FieldName = 'CFOP'
      Size = 10
    end
    object tabDanfeProdutosUN: TStringField
      FieldName = 'UN'
      Size = 5
    end
    object tabDanfeProdutosQuantidade: TStringField
      FieldName = 'Quantidade'
      Size = 10
    end
    object tabDanfeProdutosValorUnitario: TStringField
      FieldName = 'ValorUnitario'
      Size = 15
    end
    object tabDanfeProdutosValorProdutos: TStringField
      FieldName = 'ValorProdutos'
      Size = 15
    end
    object tabDanfeProdutosBCICMS: TFloatField
      FieldName = 'BCICMS'
    end
    object tabDanfeProdutosValorICMS: TCurrencyField
      FieldName = 'ValorICMS'
    end
    object tabDanfeProdutosValorIPI: TCurrencyField
      FieldName = 'ValorIPI'
    end
    object tabDanfeProdutosAliICMS: TFloatField
      FieldName = 'AliICMS'
    end
    object tabDanfeProdutosAliqIPI: TFloatField
      FieldName = 'AliqIPI'
    end
    object tabDanfeProdutosCST: TStringField
      FieldName = 'CST'
      Size = 5
    end
  end
  object pndDialogo: TPrintDialog
    Left = 248
    Top = 32
  end
  object tabConfigPropri: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 225
    Top = 96
  end
end

inherited rtEtiquetasProdutos: TrtEtiquetasProdutos
  Caption = 'Etiquetas de Produtos'
  ClientHeight = 134
  ClientWidth = 336
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 4
    Width = 73
    Height = 13
    Caption = 'C'#243'digo Produto'
  end
  object Label2: TLabel [1]
    Left = 8
    Top = 45
    Width = 29
    Height = 13
    Caption = 'Grupo'
  end
  inherited btnVisualizar: TBitBtn
    Left = 240
    Top = 12
    TabOrder = 3
    OnClick = btnVisualizarClick
  end
  inherited btnImprimir: TBitBtn
    Left = 240
    Top = 40
    TabOrder = 4
    OnClick = btnImprimirClick
  end
  inherited btnFechar: TBitBtn
    Left = 240
    Top = 96
    TabOrder = 6
  end
  inherited btnOpcoes: TBitBtn
    Left = 240
    Top = 68
    TabOrder = 5
  end
  object qrpProdutos: TQuickRep [6]
    Left = 8
    Top = 168
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
      20.000000000000000000
      2970.000000000000000000
      20.000000000000000000
      2100.000000000000000000
      50.000000000000000000
      50.000000000000000000
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
      Left = 19
      Top = 16
      Width = 756
      Height = 104
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
        275.166666666666700000
        2000.250000000000000000)
      Master = qrpProdutos
      DataSet = tabBase
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText3: TQRDBText
        Left = 1
        Top = 3
        Width = 223
        Height = 34
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          89.958333333333340000
          2.645833333333333000
          7.937500000000000000
          590.020833333333400000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = tabBase
        DataField = 'CodigoProduto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 20
      end
      object QRDBText1: TQRDBText
        Left = 233
        Top = 13
        Width = 517
        Height = 78
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          206.375000000000000000
          616.479166666666800000
          34.395833333333340000
          1367.895833333333000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = tabBase
        DataField = 'NomeTecnico'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 20
      end
      object qrsCodigoBarras: TQRAsBarcode
        Left = 58
        Top = 48
        Width = 46
        Height = 40
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          105.833333333333300000
          153.458333333333300000
          127.000000000000000000
          121.708333333333300000)
        Stretch = True
        BarcodeHeight = 40
        BarcodeWidth = 46
        Modul = 1
        Ratio = 2.000000000000000000
        Typ = bcCodeEAN128A
      end
      object QRShape1: TQRShape
        Left = -1
        Top = 101
        Width = 758
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          -2.645833333333333000
          267.229166666666700000
          2005.541666666667000000)
        Pen.Style = psDot
        Shape = qrsRectangle
        VertAdjust = 0
      end
    end
    object QRBand1: TQRBand
      Left = 19
      Top = 8
      Width = 756
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
        2000.250000000000000000)
      BandType = rbPageHeader
    end
    object QRBand2: TQRBand
      Left = 19
      Top = 12
      Width = 756
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
        2000.250000000000000000)
      BandType = rbColumnHeader
    end
    object QRBand3: TQRBand
      Left = 19
      Top = 120
      Width = 756
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
        10.600000000000000000
        2000.250000000000000000)
      BandType = rbPageFooter
    end
  end
  object rdgOrdemEmissao: TRadioGroup [7]
    Left = 8
    Top = 85
    Width = 225
    Height = 40
    Caption = 'Ordem Emiss'#227'o'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'C'#243'digo Produto'
      'Nome T'#233'cnico')
    TabOrder = 2
  end
  object edtCodigoProduto: TEdit [8]
    Left = 8
    Top = 20
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtGrupo: TDBLookupComboBox [9]
    Left = 8
    Top = 61
    Width = 225
    Height = 21
    KeyField = 'Codigo'
    ListField = 'Descricao'
    ListSource = dtsGrupo
    TabOrder = 1
  end
  inherited popGrid: TPopupMenu
    Left = 360
    Top = 24
  end
  inherited popOpcoes: TPopupMenu
    Left = 768
    Top = 0
  end
  object tabBase: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 432
    Top = 8
  end
  object pndDialogo: TPrintDialog
    Left = 768
    Top = 64
  end
  object tabGrupo: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 448
    Top = 64
  end
  object dtsGrupo: TDataSource
    AutoEdit = False
    DataSet = tabGrupo
    Left = 528
    Top = 64
  end
end

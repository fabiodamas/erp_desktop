inherited rtAproveitamentoLista: TrtAproveitamentoLista
  Caption = 'Aproveitamento - Lista de Impress'#227'o'
  ClientHeight = 182
  ClientWidth = 443
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited btn_visualizar: TBitBtn
    OnClick = btn_visualizarClick
  end
  inherited btn_imprimir: TBitBtn
    OnClick = btn_imprimirClick
  end
  inherited btn_fechar: TBitBtn
    OnClick = btn_fecharClick
  end
  inherited grb_campos_relatorio: TGroupBox
    Height = 167
  end
  inherited QuickRep1: TQuickRep
    Left = 504
    Top = 464
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Page.Values = (
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    inherited QRSubDetail1: TQRSubDetail
      Height = 187
      Size.Values = (
        494.770833333333400000
        1899.708333333333000000)
      inherited QRLabel1: TQRLabel
        Size.Values = (
          44.979166666666670000
          127.000000000000000000
          21.166666666666670000
          153.458333333333300000)
        FontSize = 10
      end
      inherited QRDBText1: TQRDBText
        Left = 128
        Size.Values = (
          44.979166666666670000
          338.666666666666700000
          21.166666666666670000
          92.604166666666680000)
        FontSize = 10
      end
      inherited QRDBText2: TQRDBText
        Size.Values = (
          44.979166666666670000
          592.666666666666800000
          21.166666666666670000
          108.479166666666700000)
        FontSize = 10
      end
      inherited QRDBText3: TQRDBText
        Size.Values = (
          44.979166666666670000
          740.833333333333400000
          21.166666666666670000
          47.625000000000000000)
        FontSize = 10
      end
      inherited QRDBText4: TQRDBText
        Size.Values = (
          44.979166666666670000
          825.500000000000100000
          21.166666666666670000
          108.479166666666700000)
        FontSize = 10
      end
      inherited QRDBText5: TQRDBText
        Size.Values = (
          44.979166666666670000
          973.666666666666900000
          21.166666666666670000
          148.166666666666700000)
        FontSize = 10
      end
      inherited QRDBText6: TQRDBText
        Size.Values = (
          44.979166666666670000
          1143.000000000000000000
          21.166666666666670000
          63.500000000000000000)
        FontSize = 10
      end
      inherited QRDBText7: TQRDBText
        Size.Values = (
          44.979166666666670000
          1270.000000000000000000
          21.166666666666670000
          174.625000000000000000)
        FontSize = 10
      end
      inherited QRDBText8: TQRDBText
        Size.Values = (
          44.979166666666670000
          1481.666666666667000000
          21.166666666666670000
          179.916666666666700000)
        FontSize = 10
      end
      object QRDBText9: TQRDBText
        Left = 224
        Top = 32
        Width = 41
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          592.666666666666800000
          84.666666666666680000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'Cidade'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText10: TQRDBText
        Left = 280
        Top = 32
        Width = 18
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          740.833333333333400000
          84.666666666666680000
          47.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'UF'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText11: TQRDBText
        Left = 312
        Top = 32
        Width = 41
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          825.500000000000100000
          84.666666666666680000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'Codigo'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText12: TQRDBText
        Left = 368
        Top = 32
        Width = 56
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          973.666666666666900000
          84.666666666666680000
          148.166666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'Endereco'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText13: TQRDBText
        Left = 432
        Top = 32
        Width = 24
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1143.000000000000000000
          84.666666666666680000
          63.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'Cep'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText14: TQRDBText
        Left = 480
        Top = 32
        Width = 66
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1270.000000000000000000
          84.666666666666680000
          174.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'Valor_Total'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText15: TQRDBText
        Left = 560
        Top = 32
        Width = 68
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1481.666666666667000000
          84.666666666666680000
          179.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'Valor_Frete'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText16: TQRDBText
        Left = 224
        Top = 56
        Width = 41
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          592.666666666666800000
          148.166666666666700000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'Cidade'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText17: TQRDBText
        Left = 280
        Top = 56
        Width = 18
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          740.833333333333400000
          148.166666666666700000
          47.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'UF'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText18: TQRDBText
        Left = 312
        Top = 56
        Width = 41
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          825.500000000000100000
          148.166666666666700000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'Codigo'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText19: TQRDBText
        Left = 368
        Top = 56
        Width = 56
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          973.666666666666900000
          148.166666666666700000
          148.166666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'Endereco'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText20: TQRDBText
        Left = 432
        Top = 56
        Width = 24
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1143.000000000000000000
          148.166666666666700000
          63.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'Cep'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText21: TQRDBText
        Left = 480
        Top = 56
        Width = 66
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1270.000000000000000000
          148.166666666666700000
          174.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'Valor_Total'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText22: TQRDBText
        Left = 560
        Top = 56
        Width = 68
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1481.666666666667000000
          148.166666666666700000
          179.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'Valor_Frete'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText23: TQRDBText
        Left = 224
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
          592.666666666666800000
          211.666666666666700000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'Cidade'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText24: TQRDBText
        Left = 280
        Top = 80
        Width = 18
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          740.833333333333400000
          211.666666666666700000
          47.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'UF'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText25: TQRDBText
        Left = 312
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
          825.500000000000100000
          211.666666666666700000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'Codigo'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText26: TQRDBText
        Left = 368
        Top = 80
        Width = 56
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          973.666666666666900000
          211.666666666666700000
          148.166666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'Endereco'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText27: TQRDBText
        Left = 432
        Top = 80
        Width = 24
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1143.000000000000000000
          211.666666666666700000
          63.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'Cep'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText28: TQRDBText
        Left = 480
        Top = 80
        Width = 66
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1270.000000000000000000
          211.666666666666700000
          174.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'Valor_Total'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText29: TQRDBText
        Left = 560
        Top = 80
        Width = 68
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1481.666666666667000000
          211.666666666666700000
          179.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'Valor_Frete'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText30: TQRDBText
        Left = 224
        Top = 176
        Width = 41
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          592.666666666666800000
          465.666666666666800000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'Cidade'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText31: TQRDBText
        Left = 224
        Top = 152
        Width = 41
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          592.666666666666800000
          402.166666666666600000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'Cidade'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText32: TQRDBText
        Left = 224
        Top = 128
        Width = 41
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          592.666666666666800000
          338.666666666666700000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'Cidade'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText33: TQRDBText
        Left = 224
        Top = 104
        Width = 41
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          592.666666666666800000
          275.166666666666700000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'Cidade'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText34: TQRDBText
        Left = 280
        Top = 104
        Width = 18
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          740.833333333333400000
          275.166666666666700000
          47.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'UF'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText35: TQRDBText
        Left = 280
        Top = 128
        Width = 18
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          740.833333333333400000
          338.666666666666700000
          47.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'UF'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText36: TQRDBText
        Left = 280
        Top = 152
        Width = 18
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          740.833333333333400000
          402.166666666666600000
          47.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'UF'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText37: TQRDBText
        Left = 280
        Top = 176
        Width = 18
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          740.833333333333400000
          465.666666666666800000
          47.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'UF'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText38: TQRDBText
        Left = 312
        Top = 176
        Width = 41
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          825.500000000000100000
          465.666666666666800000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'Codigo'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText39: TQRDBText
        Left = 312
        Top = 152
        Width = 41
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          825.500000000000100000
          402.166666666666600000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'Codigo'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText40: TQRDBText
        Left = 312
        Top = 128
        Width = 41
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          825.500000000000100000
          338.666666666666700000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'Codigo'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText41: TQRDBText
        Left = 312
        Top = 104
        Width = 41
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          825.500000000000100000
          275.166666666666700000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'Codigo'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText42: TQRDBText
        Left = 368
        Top = 104
        Width = 56
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          973.666666666666900000
          275.166666666666700000
          148.166666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'Endereco'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText43: TQRDBText
        Left = 368
        Top = 128
        Width = 56
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          973.666666666666900000
          338.666666666666700000
          148.166666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'Endereco'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText44: TQRDBText
        Left = 432
        Top = 128
        Width = 24
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1143.000000000000000000
          338.666666666666700000
          63.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'Cep'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText45: TQRDBText
        Left = 432
        Top = 104
        Width = 24
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1143.000000000000000000
          275.166666666666700000
          63.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'Cep'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText46: TQRDBText
        Left = 368
        Top = 152
        Width = 56
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          973.666666666666900000
          402.166666666666600000
          148.166666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'Endereco'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText47: TQRDBText
        Left = 432
        Top = 152
        Width = 24
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1143.000000000000000000
          402.166666666666600000
          63.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'Cep'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText48: TQRDBText
        Left = 368
        Top = 176
        Width = 56
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          973.666666666666900000
          465.666666666666800000
          148.166666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'Endereco'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText49: TQRDBText
        Left = 432
        Top = 176
        Width = 24
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1143.000000000000000000
          465.666666666666800000
          63.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'Cep'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText50: TQRDBText
        Left = 480
        Top = 176
        Width = 66
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1270.000000000000000000
          465.666666666666800000
          174.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'Valor_Total'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText51: TQRDBText
        Left = 480
        Top = 152
        Width = 66
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1270.000000000000000000
          402.166666666666600000
          174.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'Valor_Total'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText52: TQRDBText
        Left = 480
        Top = 128
        Width = 66
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1270.000000000000000000
          338.666666666666700000
          174.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'Valor_Total'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText53: TQRDBText
        Left = 480
        Top = 104
        Width = 66
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1270.000000000000000000
          275.166666666666700000
          174.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'Valor_Total'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText54: TQRDBText
        Left = 560
        Top = 104
        Width = 68
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1481.666666666667000000
          275.166666666666700000
          179.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'Valor_Frete'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText55: TQRDBText
        Left = 560
        Top = 128
        Width = 68
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1481.666666666667000000
          338.666666666666700000
          179.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'Valor_Frete'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText56: TQRDBText
        Left = 560
        Top = 152
        Width = 68
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1481.666666666667000000
          402.166666666666600000
          179.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'Valor_Frete'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText57: TQRDBText
        Left = 560
        Top = 176
        Width = 68
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1481.666666666667000000
          465.666666666666800000
          179.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'Valor_Frete'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
  end
  object qrp_lista: TQuickRep
    Left = 544
    Top = 142
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
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = Auto
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    object QRBand1: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 22
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
        58.208333333333340000
        1899.708333333333000000)
      BandType = rbTitle
      object QRLabel2: TQRLabel
        Left = 83
        Top = 2
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          219.604166666666700000
          5.291666666666667000
          121.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cliente'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 403
        Top = 2
        Width = 101
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1066.270833333333000000
          5.291666666666667000
          267.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Pe'#231'as Injetadas'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 531
        Top = 2
        Width = 45
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1404.937500000000000000
          5.291666666666667000
          119.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Perdas'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 612
        Top = 2
        Width = 102
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1619.250000000000000000
          5.291666666666667000
          269.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Aproveitamento'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRShape1: TQRShape
      Left = 38
      Top = 38
      Width = 718
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.645833333333333000
        100.541666666666700000
        100.541666666666700000
        1899.708333333333000000)
      Shape = qrsRectangle
    end
    object QRShape2: TQRShape
      Left = 38
      Top = 59
      Width = 718
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.645833333333333000
        100.541666666666700000
        156.104166666666700000
        1899.708333333333000000)
      Shape = qrsRectangle
    end
    object QRShape3: TQRShape
      Left = 645
      Top = 38
      Width = 1
      Height = 1047
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2770.187500000000000000
        1706.562500000000000000
        100.541666666666700000
        2.645833333333333000)
      Shape = qrsRectangle
    end
    object QRShape4: TQRShape
      Left = 550
      Top = 38
      Width = 1
      Height = 1047
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2770.187500000000000000
        1455.208333333333000000
        100.541666666666700000
        2.645833333333333000)
      Shape = qrsRectangle
    end
    object QRShape5: TQRShape
      Left = 422
      Top = 38
      Width = 1
      Height = 1047
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2770.187500000000000000
        1116.541666666667000000
        100.541666666666700000
        2.645833333333333000)
      Shape = qrsRectangle
    end
    object QRShape6: TQRShape
      Left = 115
      Top = 38
      Width = 1
      Height = 1047
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2770.187500000000000000
        304.270833333333400000
        100.541666666666700000
        2.645833333333333000)
      Shape = qrsRectangle
    end
    object QRShape7: TQRShape
      Left = 38
      Top = 123
      Width = 718
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.645833333333333000
        100.541666666666700000
        325.437500000000000000
        1899.708333333333000000)
      Shape = qrsRectangle
    end
    object QRShape8: TQRShape
      Left = 38
      Top = 91
      Width = 718
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.645833333333333000
        100.541666666666700000
        240.770833333333300000
        1899.708333333333000000)
      Shape = qrsRectangle
    end
    object QRShape9: TQRShape
      Left = 38
      Top = 155
      Width = 718
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.645833333333333000
        100.541666666666700000
        410.104166666666800000
        1899.708333333333000000)
      Shape = qrsRectangle
    end
    object QRShape10: TQRShape
      Left = 38
      Top = 187
      Width = 718
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.645833333333333000
        100.541666666666700000
        494.770833333333400000
        1899.708333333333000000)
      Shape = qrsRectangle
    end
    object QRShape11: TQRShape
      Left = 38
      Top = 219
      Width = 718
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.645833333333333000
        100.541666666666700000
        579.437500000000000000
        1899.708333333333000000)
      Shape = qrsRectangle
    end
    object QRShape12: TQRShape
      Left = 38
      Top = 251
      Width = 718
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.645833333333333000
        100.541666666666700000
        664.104166666666800000
        1899.708333333333000000)
      Shape = qrsRectangle
    end
    object QRShape13: TQRShape
      Left = 38
      Top = 283
      Width = 718
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.645833333333333000
        100.541666666666700000
        748.770833333333400000
        1899.708333333333000000)
      Shape = qrsRectangle
    end
    object QRShape14: TQRShape
      Left = 38
      Top = 315
      Width = 718
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.645833333333333000
        100.541666666666700000
        833.437500000000000000
        1899.708333333333000000)
      Shape = qrsRectangle
    end
    object QRShape15: TQRShape
      Left = 38
      Top = 347
      Width = 718
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.645833333333333000
        100.541666666666700000
        918.104166666666800000
        1899.708333333333000000)
      Shape = qrsRectangle
    end
    object QRShape16: TQRShape
      Left = 38
      Top = 379
      Width = 718
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.645833333333333000
        100.541666666666700000
        1002.770833333333000000
        1899.708333333333000000)
      Shape = qrsRectangle
    end
    object QRShape17: TQRShape
      Left = 38
      Top = 411
      Width = 718
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.645833333333333000
        100.541666666666700000
        1087.437500000000000000
        1899.708333333333000000)
      Shape = qrsRectangle
    end
    object QRShape18: TQRShape
      Left = 38
      Top = 443
      Width = 718
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.645833333333333000
        100.541666666666700000
        1172.104166666667000000
        1899.708333333333000000)
      Shape = qrsRectangle
    end
    object QRShape19: TQRShape
      Left = 38
      Top = 475
      Width = 718
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.645833333333333000
        100.541666666666700000
        1256.770833333333000000
        1899.708333333333000000)
      Shape = qrsRectangle
    end
    object QRShape20: TQRShape
      Left = 38
      Top = 507
      Width = 718
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.645833333333333000
        100.541666666666700000
        1341.437500000000000000
        1899.708333333333000000)
      Shape = qrsRectangle
    end
    object QRShape21: TQRShape
      Left = 38
      Top = 539
      Width = 718
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.645833333333333000
        100.541666666666700000
        1426.104166666667000000
        1899.708333333333000000)
      Shape = qrsRectangle
    end
    object QRShape22: TQRShape
      Left = 38
      Top = 571
      Width = 718
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.645833333333333000
        100.541666666666700000
        1510.770833333333000000
        1899.708333333333000000)
      Shape = qrsRectangle
    end
    object QRShape23: TQRShape
      Left = 38
      Top = 603
      Width = 718
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.645833333333333000
        100.541666666666700000
        1595.437500000000000000
        1899.708333333333000000)
      Shape = qrsRectangle
    end
    object QRShape24: TQRShape
      Left = 38
      Top = 635
      Width = 718
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.645833333333333000
        100.541666666666700000
        1680.104166666667000000
        1899.708333333333000000)
      Shape = qrsRectangle
    end
    object QRShape25: TQRShape
      Left = 38
      Top = 667
      Width = 718
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.645833333333333000
        100.541666666666700000
        1764.770833333333000000
        1899.708333333333000000)
      Shape = qrsRectangle
    end
    object QRShape26: TQRShape
      Left = 38
      Top = 699
      Width = 718
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.645833333333333000
        100.541666666666700000
        1849.437500000000000000
        1899.708333333333000000)
      Shape = qrsRectangle
    end
    object QRShape27: TQRShape
      Left = 38
      Top = 731
      Width = 718
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.645833333333333000
        100.541666666666700000
        1934.104166666667000000
        1899.708333333333000000)
      Shape = qrsRectangle
    end
    object QRShape28: TQRShape
      Left = 38
      Top = 763
      Width = 718
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.645833333333333000
        100.541666666666700000
        2018.770833333333000000
        1899.708333333333000000)
      Shape = qrsRectangle
    end
    object QRShape29: TQRShape
      Left = 38
      Top = 795
      Width = 718
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.645833333333333000
        100.541666666666700000
        2103.437500000000000000
        1899.708333333333000000)
      Shape = qrsRectangle
    end
    object QRShape30: TQRShape
      Left = 38
      Top = 827
      Width = 718
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.645833333333333000
        100.541666666666700000
        2188.104166666667000000
        1899.708333333333000000)
      Shape = qrsRectangle
    end
    object QRShape31: TQRShape
      Left = 38
      Top = 859
      Width = 718
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.645833333333333000
        100.541666666666700000
        2272.770833333333000000
        1899.708333333333000000)
      Shape = qrsRectangle
    end
    object QRShape32: TQRShape
      Left = 38
      Top = 891
      Width = 718
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.645833333333333000
        100.541666666666700000
        2357.437500000000000000
        1899.708333333333000000)
      Shape = qrsRectangle
    end
    object QRShape33: TQRShape
      Left = 38
      Top = 923
      Width = 718
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.645833333333333000
        100.541666666666700000
        2442.104166666667000000
        1899.708333333333000000)
      Shape = qrsRectangle
    end
    object QRShape34: TQRShape
      Left = 38
      Top = 955
      Width = 718
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.645833333333333000
        100.541666666666700000
        2526.770833333333000000
        1899.708333333333000000)
      Shape = qrsRectangle
    end
    object QRShape35: TQRShape
      Left = 38
      Top = 987
      Width = 718
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.645833333333333000
        100.541666666666700000
        2611.437500000000000000
        1899.708333333333000000)
      Shape = qrsRectangle
    end
    object QRShape36: TQRShape
      Left = 38
      Top = 1019
      Width = 718
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.645833333333333000
        100.541666666666700000
        2696.104166666667000000
        1899.708333333333000000)
      Shape = qrsRectangle
    end
    object QRShape37: TQRShape
      Left = 38
      Top = 1051
      Width = 718
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.645833333333333000
        100.541666666666700000
        2780.770833333333000000
        1899.708333333333000000)
      Shape = qrsRectangle
    end
    object QRShape38: TQRShape
      Left = 38
      Top = 1084
      Width = 718
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.645833333333333000
        100.541666666666700000
        2868.083333333333000000
        1899.708333333333000000)
      Shape = qrsRectangle
    end
    object QRShape39: TQRShape
      Left = 38
      Top = 38
      Width = 1
      Height = 1047
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2770.187500000000000000
        100.541666666666700000
        100.541666666666700000
        2.645833333333333000)
      Shape = qrsRectangle
    end
    object QRShape40: TQRShape
      Left = 755
      Top = 38
      Width = 1
      Height = 1047
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2770.187500000000000000
        1997.604166666667000000
        100.541666666666700000
        2.645833333333333000)
      Shape = qrsRectangle
    end
  end
  object pnd_impressao: TPrintDialog
    Left = 208
  end
end

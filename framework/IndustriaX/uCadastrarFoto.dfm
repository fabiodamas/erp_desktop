inherited fmCadastrarFoto: TfmCadastrarFoto
  Left = 235
  Top = 152
  Caption = 'Cadastrar Foto'
  ClientHeight = 499
  ClientWidth = 676
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 405
    Width = 30
    Height = 13
    Caption = 'Zoom:'
  end
  object Label2: TLabel
    Left = 45
    Top = 358
    Width = 7
    Height = 13
    Caption = '/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object tcb_zoom: TTrackBar
    Left = 0
    Top = 424
    Width = 680
    Height = 34
    Enabled = False
    Max = 200
    Min = 1
    Frequency = 5
    Position = 1
    TabOrder = 0
    OnChange = tcb_zoomChange
  end
  object pnl_imagem: TPanel
    Left = 712
    Top = 8
    Width = 657
    Height = 344
    TabOrder = 1
    Visible = False
    object img_imagem: TImage
      Left = 1
      Top = 1
      Width = 504
      Height = 296
      Center = True
      Stretch = True
    end
  end
  object edt_diretorio_fotos: TDirectoryEdit
    Left = 8
    Top = 464
    Width = 657
    Height = 21
    DialogKind = dkWin32
    NumGlyphs = 1
    TabOrder = 2
  end
  object pnl_tumbs: TPanel
    Left = 8
    Top = 8
    Width = 657
    Height = 344
    TabOrder = 3
    object img_1: TImage
      Left = 7
      Top = 5
      Width = 129
      Height = 84
      Center = True
      Stretch = True
      OnClick = img_1Click
      OnMouseMove = img_1MouseMove
    end
    object img_2: TImage
      Left = 136
      Top = 5
      Width = 129
      Height = 84
      Center = True
      Stretch = True
      OnClick = img_1Click
      OnMouseMove = img_1MouseMove
    end
    object img_3: TImage
      Left = 265
      Top = 5
      Width = 129
      Height = 84
      Center = True
      Stretch = True
      OnClick = img_1Click
      OnMouseMove = img_1MouseMove
    end
    object img_4: TImage
      Left = 394
      Top = 5
      Width = 129
      Height = 84
      Center = True
      Stretch = True
      OnClick = img_1Click
      OnMouseMove = img_1MouseMove
    end
    object img_5: TImage
      Left = 523
      Top = 5
      Width = 129
      Height = 84
      Center = True
      Stretch = True
      OnClick = img_1Click
      OnMouseMove = img_1MouseMove
    end
    object img_6: TImage
      Left = 7
      Top = 89
      Width = 129
      Height = 84
      Center = True
      Stretch = True
      OnClick = img_1Click
      OnMouseMove = img_1MouseMove
    end
    object img_7: TImage
      Left = 136
      Top = 89
      Width = 129
      Height = 84
      Center = True
      Stretch = True
      OnClick = img_1Click
      OnMouseMove = img_1MouseMove
    end
    object img_8: TImage
      Left = 265
      Top = 89
      Width = 129
      Height = 84
      Center = True
      Stretch = True
      OnClick = img_1Click
      OnMouseMove = img_1MouseMove
    end
    object img_9: TImage
      Left = 394
      Top = 89
      Width = 129
      Height = 84
      Center = True
      Stretch = True
      OnClick = img_1Click
      OnMouseMove = img_1MouseMove
    end
    object img_10: TImage
      Left = 523
      Top = 89
      Width = 129
      Height = 84
      Center = True
      Stretch = True
      OnClick = img_1Click
      OnMouseMove = img_1MouseMove
    end
    object img_16: TImage
      Left = 7
      Top = 257
      Width = 129
      Height = 84
      Center = True
      Stretch = True
      OnClick = img_1Click
      OnMouseMove = img_1MouseMove
    end
    object img_17: TImage
      Left = 136
      Top = 257
      Width = 129
      Height = 84
      Center = True
      Stretch = True
      OnClick = img_1Click
      OnMouseMove = img_1MouseMove
    end
    object img_18: TImage
      Left = 265
      Top = 257
      Width = 129
      Height = 84
      Center = True
      Stretch = True
      OnClick = img_1Click
      OnMouseMove = img_1MouseMove
    end
    object img_19: TImage
      Left = 394
      Top = 257
      Width = 129
      Height = 84
      Center = True
      Stretch = True
      OnClick = img_1Click
      OnMouseMove = img_1MouseMove
    end
    object img_20: TImage
      Left = 523
      Top = 257
      Width = 129
      Height = 84
      Center = True
      Stretch = True
      OnClick = img_1Click
      OnMouseMove = img_1MouseMove
    end
    object img_11: TImage
      Left = 7
      Top = 173
      Width = 129
      Height = 84
      Center = True
      Stretch = True
      OnClick = img_1Click
      OnMouseMove = img_1MouseMove
    end
    object img_12: TImage
      Left = 136
      Top = 173
      Width = 129
      Height = 84
      Center = True
      Stretch = True
      OnClick = img_1Click
      OnMouseMove = img_1MouseMove
    end
    object img_13: TImage
      Left = 265
      Top = 173
      Width = 129
      Height = 84
      Center = True
      Stretch = True
      OnClick = img_1Click
      OnMouseMove = img_1MouseMove
    end
    object img_14: TImage
      Left = 394
      Top = 173
      Width = 129
      Height = 84
      Center = True
      Stretch = True
      OnClick = img_1Click
      OnMouseMove = img_1MouseMove
    end
    object img_15: TImage
      Left = 523
      Top = 173
      Width = 129
      Height = 84
      Center = True
      Stretch = True
      OnClick = img_1Click
      OnMouseMove = img_1MouseMove
    end
  end
  object btn_diretorio: TButton
    Left = 512
    Top = 358
    Width = 153
    Height = 25
    Caption = 'Carregar Diret'#243'rio'
    TabOrder = 4
    OnClick = btn_diretorioClick
  end
  object edt_pag_ini: TEdit
    Left = 8
    Top = 354
    Width = 33
    Height = 21
    Enabled = False
    TabOrder = 5
    Text = '1'
  end
  object edt_pag_final: TEdit
    Left = 56
    Top = 354
    Width = 33
    Height = 21
    Enabled = False
    TabOrder = 6
    Text = '1'
  end
  object btn_confirmar: TButton
    Left = 512
    Top = 384
    Width = 153
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 7
    OnClick = btn_confirmarClick
  end
  object btn_anterior: TBitBtn
    Left = 95
    Top = 354
    Width = 29
    Height = 22
    TabOrder = 8
    OnClick = btn_anteriorClick
    Glyph.Data = {
      36060000424D3606000000000000360000002800000020000000100000000100
      18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FF013002014103025104025104014303013302FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7474747B7B7B81
      81818181817B7B7B757575FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF014503014503037808039C0B039F0C039F0C039D0C027E09014D04014D
      04FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7C7C7C7C7C7C8E8E8E9A9A9A9B
      9B9B9B9B9B9A9A9A9090907F7F7F7F7F7FFF00FFFF00FFFF00FFFF00FFFF00FF
      034F0903650904A30D03A60C03A00B029E0A039F0C03A00C03A50C03A60C0269
      06013402FF00FFFF00FFFF00FFFF00FF8282828989899C9C9C9D9D9D9B9B9B9A
      9A9A9B9B9B9B9B9B9C9C9C9D9D9D898989757575FF00FFFF00FFFF00FF044F09
      066B110AAB1F07A415049E0D029D0A039D0A039E0C039E0C039E0C03A00C03A7
      0C026A06024C04FF00FFFF00FF8282828D8D8DA3A3A39F9F9F9B9B9B9A9A9A9A
      9A9A9A9A9A9A9A9A9A9A9A9B9B9B9D9D9D8989897F7F7FFF00FFFF00FF044F09
      10AC300DAB2809A41C039E0F48C052E9F8EAD5F2D816AA20039E0C039E0C039F
      0C03A70C024C04FF00FFFF00FF828282A7A7A7A5A5A5A0A0A09B9B9BC4C4C4FF
      FFFFFDFDFDA9A9A99A9A9A9A9A9A9B9B9B9D9D9D7F7F7FFF00FF0357060D8223
      17B6410EA92D05A01341BD4BF4FCF6FFFFFF82D58907A010039E0C039E0C039E
      0C03A50C037B08014203848484989898ADADADA5A5A59D9D9DC0C0C0FFFFFFFF
      FFFFDDDDDD9E9E9E9A9A9A9A9A9A9A9A9A9C9C9C9090907B7B7B03570617A341
      18B54A11AB3441BD4EF3FBF4FCFEFC75D07D039E0C039E0C039E0C039E0C039E
      0C03A10C03960A014203848484A8A8A8ADADADA7A7A7C1C1C1FFFFFFFFFFFFD7
      D7D79A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9C9C9C9898987B7B7B06680D21B151
      1EB75170D392F0FBF3FFFFFFF7FCF8B7E9C5B4E7BDADE5B2ADE5B2AFE5B4B1E6
      B603A00C039F0C014A048C8C8CB0B0B0B1B1B1D7D7D7FFFFFFFFFFFFFFFFFFF2
      F2F2F1F1F1EFEFEFEFEFEFEFEFEFF0F0F09B9B9B9B9B9B7E7E7E0874123EBD69
      2ABA5CBAEACCFFFFFFFFFFFFFCFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF03A00C039F0C025205919191C0C0C0B6B6B6F3F3F3FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C9C9C9B9B9B81818106780E54C57A
      44C6742CBA5CA4E3BCFFFFFFFAFEFB82D9A03EBF5E41C05B41BF5B41BF5841BF
      5707A518039D0C014603919191C9C9C9C4C4C4B7B7B7EBEBEBFFFFFFFFFFFFDE
      DEDEC0C0C0C2C2C2C1C1C1C1C1C1C1C1C19F9F9F9A9A9A7D7D7D06780E4CBD69
      83DDA722B6551DB24F95DEB0FFFFFFE2F7EA4FC67511AB340FAA300FAA2E0CA6
      2706A716038C0A014603919191C4C4C4E0E0E0B2B2B2AFAFAFE5E5E5FFFFFFFF
      FFFFC8C8C8A7A7A7A6A6A6A6A6A6A3A3A3A0A0A09595957D7D7DFF00FF139923
      AAE7C568D08E16AF481CB14D8EDCABFFFFFFF4FCF72DB85310A9310EA7290BA4
      2009AF1C036B0AFF00FFFF00FFA3A3A3EEEEEED3D3D3AAAAAAAEAEAEE3E3E3FF
      FFFFFFFFFFB7B7B7A6A6A6A4A4A4A1A1A1A3A3A38B8B8BFF00FFFF00FF139923
      56C573C5F0D866CF8C20B4521CB24F95DEB0ABE6C11FB44E13AC3C12AA340FB0
      2D0A991F036B0AFF00FFFF00FFA3A3A3CACACAF8F8F8D2D2D2B1B1B1AFAFAFE5
      E5E5EEEEEEB0B0B0A8A8A8A7A7A7A8A8A89E9E9E8B8B8BFF00FFFF00FFFF00FF
      1399236ACC88D0F4E39AE1B650C77A38BD672CBA5D30BB602FBC5D23BC4F11A3
      3006620FFF00FFFF00FFFF00FFFF00FFA3A3A3D3D3D3FDFDFDE8E8E8C9C9C9BD
      BDBDB7B7B7B9B9B9B9B9B9B4B4B4A4A4A4898989FF00FFFF00FFFF00FFFF00FF
      FF00FF13992313992398E1B5BDEED4A7E7C490E0B178D99F49C7791B9D3D1B9D
      3DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA3A3A3A3A3A3E7E7E7F6F6F6ED
      EDEDE4E4E4DBDBDBC7C7C7A8A8A8A8A8A8FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF1DA435139923139923139923139923138C2AFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAAAAAAA3A3A3A3
      A3A3A3A3A3A3A3A39F9F9FFF00FFFF00FFFF00FFFF00FFFF00FF}
    NumGlyphs = 2
  end
  object btn_proximo: TBitBtn
    Left = 127
    Top = 354
    Width = 29
    Height = 22
    TabOrder = 9
    OnClick = btn_proximoClick
    Glyph.Data = {
      36060000424D3606000000000000360000002800000020000000100000000100
      18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FF044906055B09066C0C066C0C055E0A044C06FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7474747B7B7B81
      81818181817B7B7B757575FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF05600905600908911309B01809B31A09B31909B11907961405680C0568
      0CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7C7C7C7C7C7C8E8E8E9A9A9A9B
      9B9B9B9B9B9A9A9A9090907F7F7F7F7F7FFF00FFFF00FFFF00FFFF00FFFF00FF
      0A6A150A7F150BB61C09B91A08B41807B21609B31909B41909B81A09B91A0783
      10044D06FF00FFFF00FFFF00FFFF00FF8282828989899C9C9C9D9D9D9B9B9B9A
      9A9A9B9B9B9B9B9B9C9C9C9D9D9D898989757575FF00FFFF00FFFF00FF0B6A15
      0F852216BD3411B7270BB21C07B11608B11709B21909B21909B21909B41909BA
      1A07841006670CFF00FFFF00FF8282828D8D8DA3A3A39F9F9F9B9B9B9A9A9A9A
      9A9A9A9A9A9A9A9A9A9A9A9B9B9B9D9D9D8989897F7F7FFF00FFFF00FF0B6A15
      20BE491BBD4014B7300AB21F28BC36DFF5E1EEFAEF63CE6D09B21909B21909B3
      1909BA1A06670CFF00FFFF00FF828282A7A7A7A5A5A5A0A0A09B9B9BA9A9A9FD
      FDFDFFFFFFC4C4C49A9A9A9A9A9A9B9B9B9D9D9D7F7F7FFF00FF0872101B9A3A
      2AC65B1DBB450EB4250BB31B11B4219ADFA0FFFFFFF7FDF85ACB6509B21909B2
      1909B81A089413045D09848484989898ADADADA5A5A59D9D9D9C9C9C9E9E9EDD
      DDDDFFFFFFFFFFFFC0C0C09A9A9A9A9A9A9C9C9C9090907B7B7B0872102AB65B
      2CC56522BD4D0FB4220AB21A0CB31C0AB2198DDB95FDFEFDF6FCF758CB6309B2
      1909B51A08AB17045D09848484A8A8A8ADADADA7A7A79D9D9D9B9B9B9C9C9C9B
      9B9BD7D7D7FFFFFFFFFFFFBFBFBF9A9A9A9C9C9C9898987B7B7B0F821C37C26C
      33C76CCDF1DAC9EFD3C7EED0C8EFD2C5EED0C7EECFF8FDF9FFFFFFF2FBF36FD2
      7908B41909B31905650B8C8C8CB0B0B0B1B1B1F6F6F6F3F3F3F2F2F2F3F3F3F1
      F1F1F2F2F2FFFFFFFFFFFFFFFFFFC9C9C99B9B9B9B9B9B7E7E7E138D2358CC83
      42C977FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFDFFFFFFFFFFFFBCEA
      C10AB41A09B319066D0D919191C0C0C0B6B6B6FFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDED9C9C9C9B9B9B8181810F911D6FD293
      5FD38D6DD49572D69971D69872D69964D28C92DFA8FBFEFBFFFFFFACE5B82EBF
      4C11B82B08B11905610A919191C9C9C9C4C4C4C9C9C9CCCCCCCBCBCBCCCCCCC6
      C6C6DADADAFFFFFFFFFFFFE5E5E5ACACAC9F9F9F9A9A9A7D7D7D0F911D67CC83
      9BE5BA38C67030C36938C56F38C56F70D697E8F8EEFFFFFF9FE2B120BD481AB9
      3E10BA2908A31705610A919191C4C4C4E0E0E0B2B2B2AEAEAEB1B1B1B1B1B1CB
      CBCBFFFFFFFFFFFFE0E0E0A6A6A6A3A3A3A0A0A09595957D7D7DFF00FF25AE39
      BCEDD282DBA428C0632FC26753CD82F7FDF9FFFFFF9CE2B222BC4B1DBA4118B7
      3614C0300A8517FF00FFFF00FFA3A3A3EEEEEED3D3D3AAAAAAADADADBEBEBEFF
      FFFFFFFFFFDFDFDFA7A7A7A4A4A4A1A1A1A3A3A38B8B8BFF00FFFF00FF25AE39
      71D28CD2F4E180DAA336C46D39C56FBCECCEABE6C22DC26324BE5623BC4D1FC1
      4616AE340A8517FF00FFFF00FFA3A3A3CACACAF8F8F8D2D2D2B1B1B1B2B2B2EE
      EEEEE5E5E5ADADADA8A8A8A7A7A7A8A8A89E9E9E8B8B8BFF00FFFF00FFFF00FF
      25AE3984D89FDBF7EAAFE8C66BD49352CC8144C97849CA7B48CB7839CB6A21B6
      490F7C1FFF00FFFF00FFFF00FFFF00FFA3A3A3D3D3D3FDFDFDE8E8E8C9C9C9BD
      BDBDB7B7B7B9B9B9B9B9B9B4B4B4A4A4A4898989FF00FFFF00FFFF00FFFF00FF
      FF00FF25AE3925AE39ADE8C5CCF2DEBAEDD1A6E7C291E2B364D4922FB1572FB1
      57FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA3A3A3A3A3A3E7E7E7F6F6F6ED
      EDEDE4E4E4DBDBDBC7C7C7A8A8A8A8A8A8FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF32B74E25AE3925AE3925AE3925AE3924A342FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAAAAAAA3A3A3A3
      A3A3A3A3A3A3A3A39F9F9FFF00FFFF00FFFF00FFFF00FFFF00FF}
    NumGlyphs = 2
  end
end

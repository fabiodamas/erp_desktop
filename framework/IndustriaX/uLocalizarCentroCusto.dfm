inherited fmLocalizarCentroCusto: TfmLocalizarCentroCusto
  Left = 234
  Top = 152
  Caption = 'Localizar Centro de Custo'
  ClientHeight = 398
  ClientWidth = 663
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_codigo: TLabel
    Left = 8
    Top = 8
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
    FocusControl = edtCodigo
  end
  object Label1: TLabel
    Left = 107
    Top = 8
    Width = 48
    Height = 13
    Caption = 'Descri'#231#227'o'
    FocusControl = edtDescricao
  end
  object Label2: TLabel
    Left = 64
    Top = 8
    Width = 34
    Height = 13
    Caption = 'Fam'#237'lia'
    FocusControl = edtFamilia
  end
  object edtCodigo: TEdit
    Left = 8
    Top = 24
    Width = 49
    Height = 21
    TabOrder = 0
    OnChange = edtCodigoChange
  end
  object edtDescricao: TEdit
    Left = 107
    Top = 24
    Width = 549
    Height = 21
    TabOrder = 2
    OnChange = edtDescricaoChange
  end
  object dbgLocalizar: TDBGrid
    Left = 8
    Top = 53
    Width = 648
    Height = 305
    DataSource = dtsCC
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = dbgLocalizarCellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Title.Caption = 'C'#243'digo'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Familia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 505
        Visible = True
      end>
  end
  object btnCancelar: TBitBtn
    Left = 568
    Top = 365
    Width = 88
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 4
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
  object edtFamilia: TEdit
    Left = 64
    Top = 24
    Width = 36
    Height = 21
    TabOrder = 1
    OnChange = edtFamiliaChange
  end
  object tabCC: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 696
    Top = 8
  end
  object dtsCC: TDataSource
    AutoEdit = False
    DataSet = tabCC
    Left = 744
    Top = 8
  end
end

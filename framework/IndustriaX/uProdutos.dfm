inherited fmProdutos: TfmProdutos
  Left = 348
  Top = 134
  HelpContext = 8
  Caption = 'Cadastro de Produtos'
  ClientHeight = 482
  ClientWidth = 607
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
    Left = 128
    Top = 4
    Width = 70
    Height = 13
    Caption = 'Nome T'#233'cnico'
  end
  inherited pnlBotoes: TPanel
    Top = 421
    Width = 607
    TabOrder = 3
    inherited btnLocalizar: TSpeedButton
      OnClick = btnLocalizarClick
    end
  end
  object edtNomeTecnico: TDBEdit [3]
    Left = 128
    Top = 20
    Width = 471
    Height = 21
    DataField = 'NomeTecnico'
    DataSource = dtsBase
    TabOrder = 1
  end
  object pgcProdutos: TPageControl [4]
    Left = 8
    Top = 51
    Width = 590
    Height = 370
    ActivePage = tbsFichaTecnica
    TabOrder = 2
    OnChange = pgcProdutosChange
    object tbsGeral: TTabSheet
      Caption = 'Geral'
      object Label3: TLabel
        Left = 8
        Top = 9
        Width = 29
        Height = 13
        Caption = 'Grupo'
      end
      object Label7: TLabel
        Left = 208
        Top = 57
        Width = 40
        Height = 13
        Caption = 'Unidade'
      end
      object Label8: TLabel
        Left = 371
        Top = 57
        Width = 24
        Height = 13
        Caption = 'Peso'
      end
      object Label9: TLabel
        Left = 488
        Top = 57
        Width = 82
        Height = 13
        Caption = 'Ponto Reposi'#231#227'o'
      end
      object Label10: TLabel
        Left = 8
        Top = 105
        Width = 59
        Height = 13
        Caption = 'Nome Ingl'#234's'
      end
      object Label11: TLabel
        Left = 287
        Top = 105
        Width = 46
        Height = 13
        Caption = 'Endere'#231'o'
      end
      object Label12: TLabel
        Left = 393
        Top = 105
        Width = 24
        Height = 13
        Caption = 'NCM'
      end
      object Label13: TLabel
        Left = 512
        Top = 105
        Width = 37
        Height = 13
        Caption = 'EX TIPI'
      end
      object Label14: TLabel
        Left = 8
        Top = 238
        Width = 39
        Height = 13
        Caption = 'Estoque'
      end
      object Label15: TLabel
        Left = 61
        Top = 238
        Width = 28
        Height = 13
        Caption = 'Faltas'
      end
      object Label16: TLabel
        Left = 114
        Top = 238
        Width = 38
        Height = 13
        Caption = 'Pedidos'
      end
      object Label17: TLabel
        Left = 167
        Top = 238
        Width = 21
        Height = 13
        Caption = 'O.P.'
      end
      object Label18: TLabel
        Left = 220
        Top = 238
        Width = 51
        Height = 13
        Caption = 'Dispon'#237'vel'
      end
      object lblSemImagem: TLabel
        Left = 407
        Top = 223
        Width = 61
        Height = 13
        Caption = 'Sem Imagem'
      end
      object imgFotoProduto: TImage
        Left = 295
        Top = 151
        Width = 285
        Height = 164
        Center = True
        Stretch = True
      end
      object Bevel1: TBevel
        Left = 290
        Top = 152
        Width = 9
        Height = 177
        Shape = bsLeftLine
      end
      object lblStatusImagem: TLabel
        Left = 311
        Top = 324
        Width = 80
        Height = 13
        Caption = 'Imagem: 0 / 0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label43: TLabel
        Left = 8
        Top = 57
        Width = 16
        Height = 13
        Caption = 'Cor'
      end
      object lbl4: TLabel
        Left = 192
        Top = 9
        Width = 57
        Height = 13
        Caption = 'Sub - Grupo'
      end
      object lbl5: TLabel
        Left = 384
        Top = 9
        Width = 39
        Height = 13
        Caption = 'Cole'#231#227'o'
      end
      object lbl8: TLabel
        Left = 10
        Top = 179
        Width = 29
        Height = 13
        Caption = 'Grade'
      end
      object edtGrupo: TDBLookupComboBox
        Left = 8
        Top = 25
        Width = 176
        Height = 21
        Hint = 'aaaaaaaaa'
        DataField = 'CodigoGrupo'
        DataSource = dtsBase
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsGrupos
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object edtUnidade: TDBLookupComboBox
        Left = 208
        Top = 73
        Width = 137
        Height = 21
        DataField = 'CodigoUnidade'
        DataSource = dtsBase
        KeyField = 'Codigo'
        ListField = 'Sigla;Descricao'
        ListSource = dtsUnidades
        TabOrder = 3
      end
      object edtPeso: TDBEdit
        Left = 371
        Top = 73
        Width = 100
        Height = 21
        DataField = 'Peso'
        DataSource = dtsBase
        TabOrder = 4
      end
      object edtPontoReposicao: TDBEdit
        Left = 488
        Top = 73
        Width = 83
        Height = 21
        DataField = 'PontoReposicao'
        DataSource = dtsBase
        TabOrder = 5
      end
      object edtNomeIngles: TDBEdit
        Left = 8
        Top = 121
        Width = 176
        Height = 21
        DataField = 'NomeIngles'
        DataSource = dtsBase
        TabOrder = 6
      end
      object edtEndereco: TDBEdit
        Left = 287
        Top = 121
        Width = 74
        Height = 21
        DataField = 'Endereco'
        DataSource = dtsBase
        TabOrder = 7
      end
      object edtNcm: TDBEdit
        Left = 393
        Top = 121
        Width = 90
        Height = 21
        DataField = 'NCM'
        DataSource = dtsBase
        TabOrder = 8
      end
      object edtExTipi: TDBEdit
        Left = 512
        Top = 121
        Width = 56
        Height = 21
        DataField = 'EXTIPI'
        DataSource = dtsBase
        TabOrder = 9
      end
      object dbcEntraTabelaEstoque: TDBCheckBox
        Left = 8
        Top = 155
        Width = 96
        Height = 17
        Caption = 'Tabela Estoque'
        DataField = 'EntraTabelaEstoque'
        DataSource = dtsBase
        TabOrder = 10
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object btnAlterarFoto: TBitBtn
        Left = 509
        Top = 319
        Width = 29
        Height = 22
        Hint = 'Adicionar Imagem'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 20
        OnClick = btnAlterarFotoClick
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          08000000000000020000120B0000120B0000000100000000000000000000FFFF
          FF0089819900FF00FF00FF5D3500FF9E88008A32160089361C008A391F008938
          1F00F0C5B800CB532A0097452800C0582D00E5B4A000BD4C0000BC4B0000FFF8
          F200FED0A100FED0A300FEEFE000D5812700FECB9600FED1A100FFDAB200FEDA
          B200FEDAB400FFE5C900FEE5C900FFEFDE00FFF8F000FFFAF000035A05000BA3
          170012B1250012AB250016B22D001AB6350023C9450028D14F002DDE590038EE
          6E00F0F6F800C9E0EB00157BB6005896B800145C8C00D8E6EF00004B820084C1
          ED00319FFC0035A3FF0084BCEA00B0D7F6001F87E9007E91A700000000000000
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
          0000000000000000000000000000000000000000000000000000030303030303
          0303030303202020030303030303030303030303030202020303030303030303
          03030303032021200303030303030303030303030302370203030F1010101010
          101010202020232020200202020202020202020202020E0202020F0101111D1C
          19171020282625242220022F2F2F2F2B2B2B02022F2B0A0E0E020F010D070809
          0C1A1020202027202020022F37020202022B020202022B0202020F010B040105
          061C1012162029201003022F370E2A2B022B022B0A022F0202030F010A022C37
          0E1D101A152020201003022F2B0E020E0A2F022B0202020202030F01342C362C
          351F101B1A1316161003022F0E0237022B2F022B2B2B0A0A02030F012E32332C
          310110141C1817161003022F020E0E020E2F022F2B2B2B0A02030F0130323230
          2B01101E151515171003022F020E0E022B2F022F0202022B02030F012F30302D
          2A011001111D1C1A1003022F2B02020E2F2F022F2F2F2B2B02030F0101010101
          0101100101111D1B1003022F2F2F2F2F2F2F022F2F2F2F2B02030F0101010101
          010110010101111D1003022F2F2F2F2F2F2F022F2F2F2F2F0203100F0F0F0F0F
          0F0F0F0F0F0F0F0F0F0302020202020202020202020202020203031010101010
          1010101010101010030303020202020202020202020202020303030303030303
          0303030303030303030303030303030303030303030303030303}
        NumGlyphs = 2
      end
      object btnExcluirFoto: TBitBtn
        Left = 540
        Top = 319
        Width = 29
        Height = 22
        Hint = 'Remover Imagem'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 21
        OnClick = btnExcluirFotoClick
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          08000000000000020000120B0000120B0000000100000000000000000000FFFF
          FF006A687000FF00FF008C8A8C008280810069666500CB660000CC670100FFFA
          F500A5A29F00F1F0EF00FED7AB00FEDBB600FFEBD500FFF3E600FEF3E700FEDC
          B500FFE3C300FEE3C300FEE3C400FEEBD500FFFAF400DF993E00FFFBF400C9D1
          C60086B981009FC99D00829881001A871700007400001188120072D98000169E
          30006CD68500274040002E5E6D003097FF002E4A66002778D100295A91002945
          63003968A300494F5800175CD300174AA80023498F006C92FF005D83FF007999
          FF003B65FA003A61F2003E67F6004D6CDD004E6BD700001D8A00012AC5000225
          AB000221A20002219E00052DCB000626A9000C3AF2000D38E1003B61F3004665
          DA005476FC004967D8004B68D5004E67D3000829BB000723AE00091D80000B1E
          7C00435BCA000820A20000009A0052525F0052525600E0E0E100000000000000
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
          0000000000000000000000000000000000000000000000000000030303030303
          0303034C4C03034C4C0303030303030303030302020303020203030303030303
          03034C42474C4C3C383703030303030303030219050202040506080707070707
          07074C41404B463E394C0404040404040404020A0A02050A0502080101090F15
          1311074944343F3B4C03044F4F4F4F1919194E060A190402020308011A1F1E1E
          1D140748362F323A4C03044F1905060605194E060A191902020308011B212220
          1E154C35304A45333D4C044F4F0519190619020A190A0A0A0502080119232A24
          1C0F4C31354C4C43334C044F0A060A050A4F024F0A02020A0A020801022E2C2D
          4D18074C4C0D0C4C4C03044F04050A04054F040202191902020308014E282527
          2B0107101512110C0703044F0505190A054F044F191919190403080105002926
          0A010716171717110703044F0A230202194F044F0A0A0A19040308014F060004
          0B010701090F15140703044F1904230A4F4F044F4F4F19190403080101010101
          0101070101090F0E0703044F4F4F4F4F4F4F044F4F4F4F190403080101010101
          010107010101090F0703044F4F4F4F4F4F4F044F4F4F4F4F0403070808080808
          0808080808080808080304040404040404040404040404040403030707070707
          0707070707070707030303040404040404040404040404040303030303030303
          0303030303030303030303030303030303030303030303030303}
        NumGlyphs = 2
      end
      object edtEstoque: TEdit
        Left = 8
        Top = 254
        Width = 52
        Height = 21
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        ReadOnly = True
        TabOrder = 12
      end
      object edtFaltas: TEdit
        Left = 61
        Top = 254
        Width = 52
        Height = 21
        ReadOnly = True
        TabOrder = 13
      end
      object edtEmpenho: TEdit
        Left = 114
        Top = 254
        Width = 52
        Height = 21
        ReadOnly = True
        TabOrder = 14
      end
      object edtInterno: TEdit
        Left = 167
        Top = 254
        Width = 52
        Height = 21
        ReadOnly = True
        TabOrder = 15
      end
      object edtDisponivel: TEdit
        Left = 220
        Top = 254
        Width = 52
        Height = 21
        ReadOnly = True
        TabOrder = 16
      end
      object pnlStatusEstoque: TPanel
        Left = 8
        Top = 286
        Width = 264
        Height = 49
        Caption = 'Status Estoque'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 17
      end
      object dbcEntraTabelaPreco: TDBCheckBox
        Left = 109
        Top = 155
        Width = 85
        Height = 17
        Caption = 'Tabela Pre'#231'o'
        DataField = 'EntraTabelaPreco'
        DataSource = dtsBase
        TabOrder = 11
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object btnImagemAnterior: TBitBtn
        Left = 446
        Top = 319
        Width = 29
        Height = 22
        Hint = 'Imagem Anterior'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 18
        OnClick = btnImagemAnteriorClick
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
      object btnImagemProximo: TBitBtn
        Left = 477
        Top = 319
        Width = 29
        Height = 22
        Hint = 'Pr'#243'xima Imagem'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 19
        OnClick = btnImagemProximoClick
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
      object edtCor: TDBLookupComboBox
        Left = 8
        Top = 73
        Width = 176
        Height = 21
        DataField = 'CodigoCor'
        DataSource = dtsBase
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsCor
        TabOrder = 2
      end
      object dbcProdutoAcabado: TDBCheckBox
        Left = 475
        Top = 3
        Width = 106
        Height = 17
        Hint = 'bbbbbbbbbbbbbbb'
        Caption = 'Produto Acabado'
        DataField = 'ProdutoAcabado'
        DataSource = dtsBase
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object edtCodigoModelo: TDBLookupComboBox
        Left = 192
        Top = 25
        Width = 176
        Height = 21
        DataField = 'CodigoSubGrupo'
        DataSource = dtsBase
        KeyField = 'CodigoSubGrupo'
        ListField = 'Descricao'
        ListSource = dtsSubGrupo
        ParentShowHint = False
        ShowHint = True
        TabOrder = 22
      end
      object lbcCodigoColecao: TDBLookupComboBox
        Left = 384
        Top = 25
        Width = 167
        Height = 21
        DataField = 'CodigoColecao'
        DataSource = dtsBase
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsColecao
        TabOrder = 23
      end
      object edtCodigoGrade: TDBLookupComboBox
        Left = 8
        Top = 195
        Width = 257
        Height = 21
        DataField = 'CodigoGrade'
        DataSource = dtsBase
        KeyField = 'CodigoGrade'
        ListField = 'Descricao'
        ListSource = dtsGrades
        TabOrder = 24
      end
      object dbchkEntraTabelaPreco: TDBCheckBox
        Left = 197
        Top = 155
        Width = 76
        Height = 17
        Caption = 'Usar Grade'
        DataField = 'UsarGrade'
        DataSource = dtsBase
        TabOrder = 25
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
    object tbsPrecos: TTabSheet
      Caption = 'Pre'#231'os'
      ImageIndex = 1
      object grbPrecos: TGroupBox
        Left = 8
        Top = 6
        Width = 563
        Height = 177
        Caption = 'Pre'#231'os'
        TabOrder = 0
        object dbgPrecos: TDBGrid
          Left = 8
          Top = 15
          Width = 547
          Height = 154
          DataSource = dtsTabelaPrecos
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
      object grbValores: TGroupBox
        Left = 8
        Top = 187
        Width = 230
        Height = 146
        Caption = 'Valores'
        TabOrder = 1
        object Label21: TLabel
          Left = 8
          Top = 79
          Width = 24
          Height = 13
          Caption = '% IPI'
        end
        object Label22: TLabel
          Left = 8
          Top = 31
          Width = 33
          Height = 13
          Caption = 'Moeda'
        end
        object Label24: TLabel
          Left = 160
          Top = 31
          Width = 53
          Height = 13
          Caption = 'Qtd Moeda'
        end
        object edtMoeda: TDBLookupComboBox
          Left = 8
          Top = 47
          Width = 145
          Height = 21
          DataField = 'CodigoMoeda'
          DataSource = dtsBase
          KeyField = 'Codigo'
          ListField = 'Descricao'
          ListSource = dtsTiposIndices
          TabOrder = 0
        end
        object edtPercIpi: TDBEdit
          Left = 8
          Top = 95
          Width = 86
          Height = 21
          DataField = 'PercIPI'
          DataSource = dtsBase
          TabOrder = 2
        end
        object edtQtdMoeda: TDBEdit
          Left = 160
          Top = 47
          Width = 57
          Height = 21
          DataField = 'QtdMoeda'
          DataSource = dtsBase
          TabOrder = 1
        end
      end
    end
    object tbsVendas: TTabSheet
      Caption = 'Vendas'
      ImageIndex = 2
      object dbgVendas: TDBGrid
        Left = 8
        Top = 8
        Width = 565
        Height = 325
        DataSource = dtsProdutosVendas
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
    object tbsCompras: TTabSheet
      Caption = 'Compras'
      ImageIndex = 3
      object dbgCompras: TDBGrid
        Left = 8
        Top = 8
        Width = 566
        Height = 325
        DataSource = dtsProdutosCompras
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'Compra'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Data'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD'
            Title.Caption = 'Quantidade'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CodForn'
            Title.Caption = 'C'#243'd. Forn.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Fornecedor'
            Visible = True
          end>
      end
    end
    object tbsObservacao: TTabSheet
      Caption = 'Observa'#231#245'es'
      ImageIndex = 4
      object edtObservacoes: TDBMemo
        Left = 8
        Top = 8
        Width = 566
        Height = 326
        DataField = 'Observacao'
        DataSource = dtsBase
        TabOrder = 0
      end
    end
    object tbsDescricao: TTabSheet
      Caption = 'Descri'#231#227'o'
      ImageIndex = 5
      object Label25: TLabel
        Left = 8
        Top = 8
        Width = 100
        Height = 13
        Caption = 'Descri'#231#227'o Detalhada'
      end
      object Label26: TLabel
        Left = 294
        Top = 8
        Width = 79
        Height = 13
        Caption = 'Descri'#231#227'o Ingl'#234's'
      end
      object edtDescricaoDetalhada: TDBMemo
        Left = 8
        Top = 23
        Width = 279
        Height = 310
        DataField = 'DescricaoDetalhada'
        DataSource = dtsBase
        TabOrder = 0
      end
      object edtDescricaoIngles: TDBMemo
        Left = 293
        Top = 23
        Width = 279
        Height = 310
        DataField = 'DescricaoIngles'
        DataSource = dtsBase
        TabOrder = 1
      end
    end
    object tbsMolde: TTabSheet
      Caption = 'Molde'
      ImageIndex = 6
      object Label27: TLabel
        Left = 8
        Top = 2
        Width = 69
        Height = 13
        Caption = 'Numero Molde'
      end
      object Label28: TLabel
        Left = 121
        Top = 2
        Width = 29
        Height = 13
        Caption = 'Molde'
      end
      object Label29: TLabel
        Left = 320
        Top = 56
        Width = 46
        Height = 13
        Caption = 'Endere'#231'o'
      end
      object Label30: TLabel
        Left = 479
        Top = 56
        Width = 79
        Height = 13
        Caption = 'Data Fabrica'#231#227'o'
      end
      object Label31: TLabel
        Left = 479
        Top = 92
        Width = 25
        Height = 13
        Caption = 'Setor'
      end
      object Label32: TLabel
        Left = 88
        Top = 92
        Width = 29
        Height = 13
        Caption = 'Grupo'
      end
      object Label33: TLabel
        Left = 224
        Top = 92
        Width = 16
        Height = 13
        Caption = 'Cor'
      end
      object Label34: TLabel
        Left = 320
        Top = 92
        Width = 24
        Height = 13
        Caption = 'Peso'
      end
      object Label35: TLabel
        Left = 6
        Top = 110
        Width = 21
        Height = 13
        Caption = 'Tipo'
      end
      object Label36: TLabel
        Left = 404
        Top = 92
        Width = 65
        Height = 13
        Caption = 'N'#186' Cavidades'
      end
      object Label37: TLabel
        Left = 6
        Top = 129
        Width = 58
        Height = 13
        Caption = 'Observa'#231#227'o'
      end
      object lbl1: TLabel
        Left = 6
        Top = 56
        Width = 69
        Height = 13
        Caption = 'Numero Molde'
      end
      object lbl2: TLabel
        Left = 88
        Top = 56
        Width = 29
        Height = 13
        Caption = 'Molde'
      end
      object lbl3: TLabel
        Left = 6
        Top = 93
        Width = 21
        Height = 13
        Caption = 'Tipo'
      end
      object edtMoldeEndereco: TDBEdit
        Left = 320
        Top = 69
        Width = 149
        Height = 21
        DataField = 'Endereco'
        DataSource = dtsProdutosMoldes
        ReadOnly = True
        TabOrder = 6
      end
      object edtMoldeDataFabricacao: TDBDateEdit
        Left = 479
        Top = 69
        Width = 90
        Height = 21
        DataField = 'DataFabricacao'
        DataSource = dtsProdutosMoldes
        ReadOnly = True
        NumGlyphs = 2
        TabOrder = 7
        YearDigits = dyFour
      end
      object edtMoldeGrupo: TDBLookupComboBox
        Left = 88
        Top = 105
        Width = 108
        Height = 21
        DataField = 'CodigoGrupo'
        DataSource = dtsProdutosMoldes
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsGrupos
        ReadOnly = True
        TabOrder = 9
      end
      object edtMoldeCor: TDBLookupComboBox
        Left = 224
        Top = 105
        Width = 89
        Height = 21
        DataField = 'CodigoCor'
        DataSource = dtsProdutosMoldes
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsCor
        ReadOnly = True
        TabOrder = 10
      end
      object edtMoldePeso: TDBEdit
        Left = 320
        Top = 105
        Width = 73
        Height = 21
        DataField = 'Peso'
        DataSource = dtsProdutosMoldes
        ReadOnly = True
        TabOrder = 11
      end
      object edtMoldeTipo: TDBEdit
        Left = 6
        Top = 105
        Width = 75
        Height = 21
        DataField = 'Tipo'
        DataSource = dtsProdutosMoldes
        ReadOnly = True
        TabOrder = 8
      end
      object edtMoldeNumeroCavidades: TDBEdit
        Left = 404
        Top = 105
        Width = 66
        Height = 21
        DataField = 'NumeroCavidades'
        DataSource = dtsProdutosMoldes
        ReadOnly = True
        TabOrder = 12
      end
      object edtMoldeObservacao: TDBMemo
        Left = 6
        Top = 143
        Width = 564
        Height = 90
        DataField = 'Observacoes'
        DataSource = dtsProdutosMoldes
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 14
      end
      object dbgProdutosMoldes: TDBGrid
        Left = 6
        Top = 241
        Width = 540
        Height = 99
        DataSource = dtsProdutosMoldes
        TabOrder = 15
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object btnMoldeAdicionar: TBitBtn
        Left = 295
        Top = 15
        Width = 29
        Height = 22
        TabOrder = 0
        OnClick = btnMoldeAdicionarClick
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
      object btnMoldeRemover: TBitBtn
        Left = 552
        Top = 241
        Width = 29
        Height = 22
        TabOrder = 16
        OnClick = btnMoldeRemoverClick
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
      object edtMoldeNumero: TEdit
        Left = 41
        Top = 17
        Width = 74
        Height = 21
        TabOrder = 2
        OnChange = edtMoldeNumeroChange
      end
      object edtMoldeDescricao: TEdit
        Left = 120
        Top = 17
        Width = 172
        Height = 21
        ReadOnly = True
        TabOrder = 3
      end
      object dblkcbbCodigoGrupo: TDBLookupComboBox
        Left = 479
        Top = 105
        Width = 92
        Height = 21
        DataField = 'CodigoSetor'
        DataSource = dtsProdutosMoldes
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsSetor
        ReadOnly = True
        TabOrder = 13
      end
      object edtNMolde: TDBEdit
        Left = 6
        Top = 69
        Width = 75
        Height = 21
        DataField = 'NMolde'
        DataSource = dtsProdutosMoldes
        ReadOnly = True
        TabOrder = 4
      end
      object edtDescricao: TDBEdit
        Left = 88
        Top = 69
        Width = 225
        Height = 21
        DataField = 'Descricao'
        DataSource = dtsProdutosMoldes
        ReadOnly = True
        TabOrder = 5
      end
      object btnLocalizaMolde: TBitBtn
        Left = 8
        Top = 17
        Width = 29
        Height = 22
        TabOrder = 1
        OnClick = btnLocalizaMoldeClick
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
    end
    object tbsProducao: TTabSheet
      Caption = 'Roteiro'
      ImageIndex = 7
      object Label38: TLabel
        Left = 8
        Top = 0
        Width = 25
        Height = 13
        Caption = 'Setor'
      end
      object Label40: TLabel
        Left = 8
        Top = 40
        Width = 58
        Height = 13
        Caption = 'Observa'#231#227'o'
      end
      object edtSetorCodigo: TEdit
        Left = 40
        Top = 16
        Width = 65
        Height = 21
        TabOrder = 1
        OnChange = edtSetorCodigoChange
      end
      object edtSetorDescricao: TEdit
        Left = 108
        Top = 16
        Width = 463
        Height = 21
        Enabled = False
        TabOrder = 2
      end
      object edtSetorObservacao: TMemo
        Left = 8
        Top = 55
        Width = 564
        Height = 89
        TabOrder = 3
      end
      object btnSetorAdicionar: TBitBtn
        Left = 543
        Top = 149
        Width = 29
        Height = 22
        TabOrder = 4
        OnClick = btnSetorAdicionarClick
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
      object btnLocalizaSetor: TBitBtn
        Left = 8
        Top = 15
        Width = 29
        Height = 22
        TabOrder = 0
        OnClick = btnLocalizaSetorClick
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
      object btnSetorRemover: TBitBtn
        Left = 543
        Top = 173
        Width = 29
        Height = 22
        TabOrder = 5
        OnClick = btnSetorRemoverClick
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
      object dbgSetor: TcxGrid
        Left = 8
        Top = 152
        Width = 532
        Height = 178
        TabOrder = 6
        object tvwSetor: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dtsSequenciaProducao
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.GroupByBox = False
          object clmSetor: TcxGridDBColumn
            DataBinding.FieldName = 'Setor'
            Width = 132
          end
          object clmSeq: TcxGridDBColumn
            Caption = 'Seq.'
            DataBinding.FieldName = 'Seq'
            Width = 47
          end
          object clmTempoMedioHora: TcxGridDBColumn
            Caption = 'Produ'#231#227'o M'#233'dia por Hora'
            DataBinding.FieldName = 'ProducaoPorHora'
            PropertiesClassName = 'TcxCalcEditProperties'
            Width = 149
          end
          object clmObservacao: TcxGridDBColumn
            Caption = 'Observa'#231#227'o'
            DataBinding.FieldName = 'Observacao'
            Width = 129
          end
        end
        object lvlSetor: TcxGridLevel
          GridView = tvwSetor
        end
      end
      object btnProducaoMediaHora: TBitBtn
        Left = 543
        Top = 201
        Width = 29
        Height = 22
        TabOrder = 7
        OnClick = btnProducaoMediaHoraClick
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          08000000000000020000120B0000120B00000001000069000000C29B7A00B5C1
          BA00EBD8BC0049B0F200E8CA9700CED5CD00FFF2E500CEB59A00B7C3BC007AC6
          FC001F97E500EFD4A400D8BB8B00DDC49D00F2E5CF00DECCAB00D4BB9D0067AE
          D500F6DAB500D5B08B00F0E5D700E5BC7E00FFFFFF0070BEEC00E2D2B700E6D0
          AC00DFBFA300E7D6BB00B7C9C70094D7FF00FFEFD800CAAF8E00EBDDC900BFC3
          B600D6BD9200DBB57D00E2CBA600E6C38B0059B8FA00FAE4C800D4C1A500EED7
          B400E3C8A300E9D9C200F9DFC000FEF7ED00DDBF93008DCDF400A3C5D6004CB6
          FE00F7DBB600E5D0B400D4B89400D4CFB300FCE6C900F9E8D300E5C08B00E4CC
          A40066BEFA00DDB68F00DDC8A700E7D3B100DABA8400C6C2AF00CBB19200E7C6
          9200BBC3BB00DEC59400D9C6A600EFCF9A00FFDEB200D4B68E00FFF1DD00DCC8
          AF00C7A38500FFF6E7009ADAFF00E6DEC500F2DBB500E3C79E00EDD1AC00E8D3
          B500E0CCB400D8C3A000F0D7AD00F7E7CF00D8C7AB00EDE0CE00E3C5AA00F4EA
          DB00DBBD8A00F0E8DE00FEE8CF00EFDEBD00FCE1BF00FFFDF200CEB59700E6BF
          84005EBAFA0089D1FF0054B7FB006FC1FA00C6C8B300E7DCCE00000000000000
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
          00000000000000000000000000000000000000000000000000000E4F2E2E2E2E
          474734343434343B1067160E4F2E2E2E2E474734343434343B10244525152561
          25412541044135660B601624452515256125412541044135660B2A45204F0224
          512B3E2E4F25170A461F162A45204F0224512B3E2E4F25170A46240B1B4F3D2A
          3D1B5A0D2A382F03461F16240B1B4F3D2A3D1B5A0D2A382F03461954022A5119
          512B43242443051C541F161954022A5119512B43242443051C54194E5B51572B
          57145A0D39223923291F16194E5B51572B57145A0D392239232919550C4F2E0D
          0D0D240D242E1947291F1619550C4F2E0D0D0D240D242E1947293D1E19022929
          292929192939290D2940163D1E19022929292929192939290D29020E0F3C3C3C
          3C3C3C3C3C0F53533D1016020E0F3C3C3C3C3C3C3C3C0F53533D0E5256202B2B
          1B1B3333100733282849160E5256202B2B1B1B333310073328280E1818061E5C
          272C2C4F00133B185352160E1818061E5C272C2C4F00133B18530E182B2D061E
          3727271A1F4A13185352160E182B2D061E3727271A1F4A1318530E182B5F2D4B
          4B48485C581A2C182818160E182B5F2D4B4B48485C581A2C18280E2911316464
          623A6509631D4C300D18160E2911316464623A6509631D4C300D570E21010108
          080842424242213F025216570E21010108080842424242213F0259024E4E1212
          121212125454503939141659024E4E1212121212125454503939}
        NumGlyphs = 2
      end
    end
    object tbsFornecedores: TTabSheet
      Caption = 'Fornecedores'
      ImageIndex = 8
      object Label41: TLabel
        Left = 8
        Top = 0
        Width = 54
        Height = 13
        Caption = 'Fornecedor'
      end
      object edtFornecedorCodigo: TEdit
        Left = 41
        Top = 16
        Width = 65
        Height = 21
        TabOrder = 1
        OnChange = edtFornecedorCodigoChange
      end
      object btnFornecedorLocalizar: TBitBtn
        Left = 8
        Top = 15
        Width = 29
        Height = 22
        TabOrder = 0
        OnClick = btnFornecedorLocalizarClick
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
      object edtFornecedorNome: TEdit
        Left = 110
        Top = 16
        Width = 462
        Height = 21
        Enabled = False
        TabOrder = 2
      end
      object btnFornecedorAdicionar: TBitBtn
        Left = 544
        Top = 43
        Width = 29
        Height = 22
        TabOrder = 4
        OnClick = btnFornecedorAdicionarClick
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
      object dbgFornecedor: TDBGrid
        Left = 8
        Top = 43
        Width = 532
        Height = 288
        DataSource = dtsProdutosFornecedores
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object btnFornecedorRemover: TBitBtn
        Left = 544
        Top = 68
        Width = 29
        Height = 22
        TabOrder = 5
        OnClick = btnFornecedorRemoverClick
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
    object tbsFichaTecnica: TTabSheet
      Caption = 'Ficha T'#233'cnica'
      ImageIndex = 9
      OnShow = tbsFichaTecnicaShow
      object Label4: TLabel
        Left = 8
        Top = 6
        Width = 144
        Height = 13
        Caption = 'Semi Acabado / Mat'#233'ria Prima'
      end
      object Label5: TLabel
        Left = 294
        Top = 6
        Width = 55
        Height = 13
        Caption = 'Quantidade'
      end
      object Label19: TLabel
        Left = 8
        Top = 317
        Width = 100
        Height = 13
        Caption = 'Custo do Produto:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label20: TLabel
        Left = 360
        Top = 6
        Width = 63
        Height = 13
        Caption = 'Valor Unit'#225'rio'
      end
      object Label44: TLabel
        Left = 8
        Top = 293
        Width = 70
        Height = 13
        Caption = '% Adicional:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label45: TLabel
        Left = 452
        Top = 6
        Width = 40
        Height = 13
        Caption = 'Unidade'
      end
      object lbl6: TLabel
        Left = 8
        Top = 46
        Width = 37
        Height = 13
        Caption = 'Material'
      end
      object lbl7: TLabel
        Left = 295
        Top = 45
        Width = 16
        Height = 13
        Caption = 'Cor'
      end
      object edtFTCodigo: TEdit
        Left = 40
        Top = 22
        Width = 65
        Height = 21
        TabOrder = 1
        OnChange = edtFTCodigoChange
        OnKeyPress = edtFTCodigoKeyPress
      end
      object btnFTLocalizar: TBitBtn
        Left = 8
        Top = 21
        Width = 29
        Height = 22
        TabOrder = 0
        OnClick = btnFTLocalizarClick
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
      object edtFTDescricao: TEdit
        Left = 108
        Top = 22
        Width = 183
        Height = 21
        ReadOnly = True
        TabOrder = 2
      end
      object edtFTQuantidade: TCurrencyEdit
        Left = 294
        Top = 22
        Width = 62
        Height = 21
        AutoSize = False
        DecimalPlaces = 5
        DisplayFormat = '0.00000;-0.00000'
        TabOrder = 3
      end
      object btnFTAdd: TBitBtn
        Left = 519
        Top = 17
        Width = 29
        Height = 22
        TabOrder = 6
        OnClick = btnFTAddClick
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
      object btnFTRem: TBitBtn
        Left = 551
        Top = 17
        Width = 29
        Height = 22
        TabOrder = 7
        OnClick = btnFTRemClick
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
      object edtFTValorCustoProduto: TDBEdit
        Left = 116
        Top = 314
        Width = 121
        Height = 21
        DataField = 'ValorCustoProduto'
        DataSource = dtsBase
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
      end
      object edtFTValorUnitario: TCurrencyEdit
        Left = 360
        Top = 22
        Width = 88
        Height = 21
        AutoSize = False
        DecimalPlaces = 4
        DisplayFormat = '0.0000;-0.0000'
        TabOrder = 4
      end
      object edtFTCustoAdicional: TDBEdit
        Left = 116
        Top = 289
        Width = 121
        Height = 21
        DataField = 'PercAdicionalCusto'
        DataSource = dtsBase
        Font.Charset = ANSI_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        OnExit = edtFTCustoAdicionalExit
      end
      object edtFTUnidade: TDBLookupComboBox
        Left = 452
        Top = 22
        Width = 57
        Height = 21
        KeyField = 'Codigo'
        ListField = 'Sigla;Descricao'
        ListSource = dtsUnidades
        TabOrder = 5
      end
      object edtFTCustoAdicionalObs: TDBMemo
        Left = 243
        Top = 289
        Width = 331
        Height = 46
        DataField = 'ValorAdicionalObs'
        DataSource = dtsBase
        TabOrder = 9
        OnClick = edtFTCustoAdicionalObsClick
      end
      object dbgFichaTecnica: TcxGrid
        Left = 7
        Top = 96
        Width = 572
        Height = 189
        TabOrder = 11
        object tvwFichaTecnica: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dtsProdutosFT
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.GroupByBox = False
          object clmFichaTecnicaCodigoProduto: TcxGridDBColumn
            Caption = 'C'#243'd.'
            DataBinding.FieldName = 'CodigoProduto'
            Options.Editing = False
            Width = 46
          end
          object clmFichaTecnicaDescricao: TcxGridDBColumn
            Caption = 'Descri'#231#227'o'
            DataBinding.FieldName = 'Descricao'
            Options.Editing = False
            Width = 147
          end
          object clmFichaTecnicaQuantidade: TcxGridDBColumn
            DataBinding.FieldName = 'Quantidade'
            Width = 61
          end
          object clmFichaTecnicaValorCusto: TcxGridDBColumn
            Caption = 'Custo'
            DataBinding.FieldName = 'ValorCusto'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Width = 52
          end
          object clmFichaTecnicaCodigoUnidade: TcxGridDBColumn
            Caption = 'Unidade'
            DataBinding.FieldName = 'CodigoUnidade'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'Codigo'
            Properties.ListColumns = <
              item
                FieldName = 'Sigla'
              end>
            Properties.ListSource = dtsUnidades
            Width = 46
          end
          object clmFichaTecnicaCodigoMaterial: TcxGridDBColumn
            Caption = 'Material'
            DataBinding.FieldName = 'CodigoMaterial'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'CodigoProduto'
            Properties.ListColumns = <
              item
                Caption = 'Material'
                FieldName = 'NomeTecnico'
              end>
            Properties.ListSource = dtsMaterial
            Width = 86
          end
          object clmFichaTecnicaCodigoCor: TcxGridDBColumn
            Caption = 'Cor'
            DataBinding.FieldName = 'CodigoCor'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'Codigo'
            Properties.ListColumns = <
              item
                Caption = 'Cor'
                FieldName = 'Descricao'
              end>
            Properties.ListSource = dtsCor
            Width = 76
          end
        end
        object lvlFichaTecnica: TcxGridLevel
          GridView = tvwFichaTecnica
        end
      end
      object btn1: TBitBtn
        Left = 8
        Top = 61
        Width = 29
        Height = 22
        TabOrder = 12
        OnClick = btn1Click
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
      object edtCodigoMaterial: TEdit
        Left = 40
        Top = 62
        Width = 65
        Height = 21
        TabOrder = 13
        OnChange = edtCodigoMaterialChange
        OnKeyPress = edtFTCodigoKeyPress
      end
      object edtDescricaoMaterial: TEdit
        Left = 108
        Top = 62
        Width = 183
        Height = 21
        ReadOnly = True
        TabOrder = 14
      end
      object edtCorMaterial: TDBLookupComboBox
        Left = 295
        Top = 60
        Width = 213
        Height = 21
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsCor
        TabOrder = 15
      end
    end
  end
  object edtCodigoProduto: TEdit [5]
    Left = 8
    Top = 20
    Width = 110
    Height = 21
    TabOrder = 0
    OnKeyPress = edtCodigoProdutoKeyPress
    OnKeyUp = edtCodigoProdutoKeyUp
  end
  inherited popGrid: TPopupMenu
    Left = 792
    Top = 104
  end
  inherited tabBase: TZQuery
    Connection = fmMenu.zcnConexao
    Left = 656
    Top = 80
  end
  inherited dtsBase: TDataSource
    OnDataChange = dtsBaseDataChange
    Left = 752
    Top = 80
  end
  inherited popOpcoes: TPopupMenu
    Left = 768
    Top = 128
    object ClonarProduto1: TMenuItem
      Caption = 'Clonar Produto'
      OnClick = ClonarProduto1Click
    end
  end
  object tabGrupos: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 656
    Top = 136
  end
  object dtsGrupos: TDataSource
    AutoEdit = False
    DataSet = tabGrupos
    Left = 752
    Top = 136
  end
  object tabSubGrupo: TZQuery
    Connection = fmMenu.zcnConexao
    SQL.Strings = (
      'select * from SubGrupo')
    Params = <>
    Left = 656
    Top = 301
    object tabSubGrupoCodigoSubGrupo: TFloatField
      FieldName = 'CodigoSubGrupo'
      Required = True
    end
    object tabSubGrupoCodigoGrupo: TFloatField
      FieldName = 'CodigoGrupo'
      Required = True
    end
    object tabSubGrupoDescricao: TWideStringField
      FieldName = 'Descricao'
      Size = 50
    end
  end
  object dtsSubGrupo: TDataSource
    AutoEdit = False
    DataSet = tabSubGrupo
    Left = 752
    Top = 301
  end
  object tabUnidades: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 656
    Top = 351
  end
  object dtsUnidades: TDataSource
    AutoEdit = False
    DataSet = tabUnidades
    Left = 752
    Top = 351
  end
  object tabProdutosEstoque: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 656
    Top = 401
  end
  object dtsProdutosEstoque: TDataSource
    AutoEdit = False
    DataSet = tabProdutosEstoque
    Left = 752
    Top = 401
  end
  object tabProdutosFotos: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 656
    Top = 449
  end
  object dtsProdutosFotos: TDataSource
    AutoEdit = False
    DataSet = tabProdutosFotos
    Left = 752
    Top = 449
  end
  object tabTabelaPrecos: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 656
    Top = 497
  end
  object dtsTabelaPrecos: TDataSource
    AutoEdit = False
    DataSet = tabTabelaPrecos
    Left = 752
    Top = 497
  end
  object tabTiposIndices: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 656
    Top = 545
  end
  object dtsTiposIndices: TDataSource
    AutoEdit = False
    DataSet = tabTiposIndices
    Left = 752
    Top = 545
  end
  object tabProdutosVendas: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 848
    Top = 80
  end
  object dtsProdutosVendas: TDataSource
    AutoEdit = False
    DataSet = tabProdutosVendas
    Left = 976
    Top = 80
  end
  object tabProdutosCompras: TZQuery
    Connection = fmMenu.zcnConexao
    SQL.Strings = (
      'SELECT '
      '    ultimas_compras.Documento AS Compra,'
      '    ultimas_compras.DataCompra AS Data,'
      '    ultimas_compras.ValorCompra AS Valor,'
      '    ultimas_compras.Quantidade AS QTD,'
      '    ultimas_compras.CodigoFornecedor AS CodForn,'
      '    fornecedores.NomeFantasia AS Fornecedor'
      'FROM'
      '    ultimas_compras,'
      '    fornecedores'
      'WHERE'
      '    ultimas_compras.CodigoProduto = '#39#39
      
        '        AND ultimas_compras.CodigoFornecedor = fornecedores.Codi' +
        'goFornecedor'
      'ORDER BY ultimas_compras.DataCompra DESC')
    Params = <>
    Left = 848
    Top = 136
    object tabProdutosComprasCompra: TFloatField
      FieldName = 'Compra'
    end
    object dfdProdutosComprasData: TDateField
      FieldName = 'Data'
    end
    object tabProdutosComprasValor: TFloatField
      FieldName = 'Valor'
      DisplayFormat = '"R$ "#0.00##'
    end
    object tabProdutosComprasQTD: TFloatField
      FieldName = 'QTD'
    end
    object tabProdutosComprasCodForn: TFloatField
      FieldName = 'CodForn'
    end
    object strngfldProdutosComprasFornecedor: TStringField
      FieldName = 'Fornecedor'
      Size = 100
    end
  end
  object dtsProdutosCompras: TDataSource
    AutoEdit = False
    DataSet = tabProdutosCompras
    Left = 976
    Top = 136
  end
  object tabMoldes: TZQuery
    Connection = fmMenu.zcnConexao
    Active = True
    SQL.Strings = (
      'SELECT * FROM moldes')
    Params = <>
    Left = 848
    Top = 192
    object cdsMoldesNMolde: TStringField
      FieldName = 'NMolde'
      Required = True
    end
    object cdsMoldesEndereco: TStringField
      FieldName = 'Endereco'
      Size = 60
    end
    object dfdMoldesDataFabricacao: TDateField
      FieldName = 'DataFabricacao'
    end
    object cdsMoldesTipo: TStringField
      FieldName = 'Tipo'
      Size = 30
    end
    object cdsMoldesPeso: TStringField
      FieldName = 'Peso'
      Size = 10
    end
    object tabMoldesCodigoSetor: TFloatField
      FieldName = 'CodigoSetor'
    end
    object cdsMoldesDescricao: TStringField
      FieldName = 'Descricao'
      Size = 60
    end
    object tabMoldesCodigoGrupo: TFloatField
      FieldName = 'CodigoGrupo'
    end
    object tabMoldesCodigoCor: TFloatField
      FieldName = 'CodigoCor'
    end
    object cdsMoldesNumeroCavidades: TStringField
      FieldName = 'NumeroCavidades'
      Size = 10
    end
    object cdsMoldesMoldeTipoCaixa: TStringField
      FieldName = 'MoldeTipoCaixa'
    end
    object mmfMoldesObservacoes: TMemoField
      FieldName = 'Observacoes'
      BlobType = ftMemo
    end
    object cdsMoldesNMoldeCliente: TStringField
      FieldName = 'NMoldeCliente'
      Size = 30
    end
  end
  object dtsMoldes: TDataSource
    AutoEdit = False
    DataSet = tabMoldes
    OnDataChange = dtsMoldesDataChange
    Left = 976
    Top = 192
  end
  object tabChecagens: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 712
    Top = 16
  end
  object tabSequenciaProducao: TZQuery
    Connection = fmMenu.zcnConexao
    UpdateObject = upsSequenciaProducao
    Params = <>
    Left = 848
    Top = 244
  end
  object dtsSequenciaProducao: TDataSource
    DataSet = tabSequenciaProducao
    Left = 976
    Top = 244
  end
  object tabProdutosFornecedores: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 848
    Top = 300
  end
  object dtsProdutosFornecedores: TDataSource
    AutoEdit = False
    DataSet = tabProdutosFornecedores
    Left = 976
    Top = 300
  end
  object tabMoldesGrupos: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 848
    Top = 348
  end
  object dtsMoldesGrupos: TDataSource
    AutoEdit = False
    DataSet = tabMoldesGrupos
    Left = 976
    Top = 348
  end
  object tabMoldesSetor: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 848
    Top = 396
  end
  object dtsMoldesSetor: TDataSource
    AutoEdit = False
    DataSet = tabMoldesSetor
    Left = 976
    Top = 396
  end
  object tabMoldesCor: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 848
    Top = 444
  end
  object dtsMoldesCor: TDataSource
    AutoEdit = False
    DataSet = tabMoldesCor
    Left = 976
    Top = 444
  end
  object tabCor: TZQuery
    Connection = fmMenu.zcnConexao
    SQL.Strings = (
      'select * from cores')
    Params = <>
    Left = 848
    Top = 492
  end
  object dtsCor: TDataSource
    AutoEdit = False
    DataSet = tabCor
    Left = 976
    Top = 492
  end
  object tabConfigPropri: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 848
    Top = 556
  end
  object tabProdutosFT: TZQuery
    Connection = fmMenu.zcnConexao
    SQL.Strings = (
      'select * from produtos_ficha_tecnica')
    Params = <>
    Left = 656
    Top = 253
  end
  object dtsProdutosFT: TDataSource
    DataSet = tabProdutosFT
    Left = 752
    Top = 253
  end
  object tabProdutosMoldes: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 656
    Top = 612
  end
  object dtsProdutosMoldes: TDataSource
    AutoEdit = False
    DataSet = tabProdutosMoldes
    Left = 752
    Top = 612
  end
  object tabSetor: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 656
    Top = 192
  end
  object dtsSetor: TDataSource
    AutoEdit = False
    DataSet = tabSetor
    Left = 752
    Top = 192
  end
  object upsSequenciaProducao: TZUpdateSQL
    ModifySQL.Strings = (
      
        'Update sequencia_producao_produtos set ProducaoPorHora=:Producao' +
        'PorHora where'#10'(CodigoProduto=:CodigoProduto and CodigoSetor=:Cod' +
        'igoSetor)')
    UseSequenceFieldForRefreshSQL = False
    Left = 972
    Top = 547
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ProducaoPorHora'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CodigoProduto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CodigoSetor'
        ParamType = ptUnknown
      end>
  end
  object tabColecao: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 848
    Top = 28
  end
  object dtsColecao: TDataSource
    AutoEdit = False
    DataSet = tabColecao
    Left = 976
    Top = 28
  end
  object tabGrades: TZQuery
    Connection = fmMenu.zcnConexao
    SQL.Strings = (
      'select * from grades')
    Params = <>
    Left = 864
    Top = 600
    object tabGradesCodigoGrade: TFloatField
      FieldName = 'CodigoGrade'
      Required = True
    end
    object cdsGradesDescricao: TStringField
      FieldName = 'Descricao'
      Required = True
      Size = 50
    end
  end
  object dtsGrades: TDataSource
    AutoEdit = False
    DataSet = tabGrades
    Left = 976
    Top = 592
  end
  object tabMaterial: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 1056
    Top = 40
  end
  object dtsMaterial: TDataSource
    AutoEdit = False
    DataSet = tabMaterial
    OnDataChange = dtsMoldesDataChange
    Left = 1152
    Top = 40
  end
end

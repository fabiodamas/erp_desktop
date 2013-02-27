inherited frmFinalizarPedido: TfrmFinalizarPedido
  Left = 328
  Top = 109
  Width = 607
  Height = 580
  BorderStyle = bsSizeable
  Caption = 'Finalizar Pedido'
  Scaled = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grp1: TGroupBox [0]
    Left = 0
    Top = 193
    Width = 599
    Height = 360
    Align = alClient
    TabOrder = 0
    object pnl1: TPanel
      Left = 2
      Top = 15
      Width = 595
      Height = 114
      Align = alTop
      TabOrder = 0
      object lbl2: TLabel
        Left = 5
        Top = 33
        Width = 23
        Height = 13
        Caption = 'Data'
      end
      object lbl3: TLabel
        Left = 5
        Top = 69
        Width = 23
        Height = 13
        Caption = 'Hora'
      end
      object lbl4: TLabel
        Left = 77
        Top = 33
        Width = 67
        Height = 13
        Caption = 'Data Previs'#227'o'
      end
      object lbl5: TLabel
        Left = 149
        Top = 69
        Width = 62
        Height = 13
        Caption = 'Respons'#225'vel'
      end
      object lbl7: TLabel
        Left = 205
        Top = 33
        Width = 32
        Height = 13
        Caption = 'Cliente'
      end
      object lbl8: TLabel
        Left = 334
        Top = 34
        Width = 37
        Height = 13
        Caption = 'Contato'
      end
      object lbl6: TLabel
        Left = 149
        Top = 33
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object lbl9: TLabel
        Left = 77
        Top = 69
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object lbl11: TLabel
        Left = 1
        Top = 1
        Width = 593
        Height = 16
        Align = alTop
        Caption = 'Ordem de Produ'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtCodigoResponsavel: TEdit
        Left = 77
        Top = 83
        Width = 49
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object edtCodigoCliente: TEdit
        Left = 149
        Top = 47
        Width = 49
        Height = 21
        ReadOnly = True
        TabOrder = 1
      end
      object edtNomeResponsavel: TEdit
        Left = 149
        Top = 83
        Width = 436
        Height = 21
        ReadOnly = True
        TabOrder = 2
      end
      object edtNomeCliente: TEdit
        Left = 205
        Top = 47
        Width = 124
        Height = 21
        ReadOnly = True
        TabOrder = 3
      end
      object edtData: TEdit
        Left = 5
        Top = 47
        Width = 68
        Height = 21
        ReadOnly = True
        TabOrder = 4
      end
      object edtHora: TEdit
        Left = 5
        Top = 83
        Width = 68
        Height = 21
        ReadOnly = True
        TabOrder = 5
      end
      object edtDataPrevisao: TEdit
        Left = 77
        Top = 47
        Width = 68
        Height = 21
        ReadOnly = True
        TabOrder = 6
      end
      object edtNomeContato: TEdit
        Left = 334
        Top = 48
        Width = 251
        Height = 21
        ReadOnly = True
        TabOrder = 7
      end
    end
    object pgcOP: TPageControl
      Left = 2
      Top = 129
      Width = 595
      Height = 194
      ActivePage = tsProdutos
      Align = alClient
      TabOrder = 1
      object tsProdutos: TTabSheet
        Caption = 'Produtos'
        object dbgrdProdutos: TDBGrid
          Left = 0
          Top = 0
          Width = 587
          Height = 166
          Align = alClient
          DataSource = dtsAuxiliarProdutos
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'CodigoProduto'
              Title.Caption = 'C'#243'digo Produto'
              Width = 82
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Descricao'
              Title.Caption = 'Descri'#231#227'o'
              Width = 178
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Quantidade'
              Title.Caption = 'Quantidade a Produzir'
              Width = 121
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PontoReposicao'
              Title.Caption = 'Ponto de Reposi'#231#227'o'
              Width = 106
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Estoque'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Faltas'
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Pedidos'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Producao'
              Title.Caption = 'Produ'#231#227'o'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NumeroCavidades'
              Title.Caption = 'Numero de Cavidades Molde'
              Width = 147
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QuantidadeUnidade'
              Title.Caption = 'Quantidade Unidade'
              Width = 109
              Visible = True
            end>
        end
      end
    end
    object pnl2: TPanel
      Left = 2
      Top = 323
      Width = 595
      Height = 35
      Align = alBottom
      TabOrder = 2
      DesignSize = (
        595
        35)
      object btnConfirmar: TBitBtn
        Left = 363
        Top = 8
        Width = 93
        Height = 23
        Anchors = []
        Caption = 'Confirmar'
        TabOrder = 0
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
      object btnFechar: TBitBtn
        Left = 479
        Top = 8
        Width = 93
        Height = 23
        Anchors = []
        Caption = 'Fechar'
        TabOrder = 1
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
    end
  end
  object grp2: TGroupBox [1]
    Left = 0
    Top = 0
    Width = 599
    Height = 65
    Align = alTop
    TabOrder = 1
    object btnRelatorioExpedicao: TButton
      Left = 209
      Top = 16
      Width = 376
      Height = 33
      Caption = 'Relat'#243'rios: (1)Expedi'#231#227'o (2)Produ'#231#227'o (3)Pedido/Expedicao'
      TabOrder = 0
      OnClick = btnRelatorioExpedicaoClick
    end
  end
  object grp3: TGroupBox [2]
    Left = 0
    Top = 65
    Width = 599
    Height = 128
    Align = alTop
    TabOrder = 2
    object lbl13: TLabel
      Left = 6
      Top = 32
      Width = 85
      Height = 13
      Caption = 'Avisar os usu'#225'rios'
    end
    object lbl15: TLabel
      Left = 318
      Top = 32
      Width = 106
      Height = 13
      Caption = 'Usu'#225'rios selecionados'
    end
    object lbl16: TLabel
      Left = 5
      Top = 9
      Width = 111
      Height = 16
      Caption = 'Avisar Usu'#225'rios'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lstAvisarUsuarios: TListBox
      Left = 5
      Top = 45
      Width = 252
      Height = 68
      ItemHeight = 13
      MultiSelect = True
      TabOrder = 0
      OnDblClick = lstAvisarUsuariosDblClick
    end
    object btnAvisarUsuario: TButton
      Left = 273
      Top = 44
      Width = 24
      Height = 17
      Caption = '>'
      TabOrder = 1
      OnClick = btnAvisarUsuarioClick
    end
    object btnEnviaTodasUsuario: TButton
      Left = 273
      Top = 60
      Width = 24
      Height = 17
      Caption = '>>'
      TabOrder = 2
      OnClick = btnEnviaTodasUsuarioClick
    end
    object btnDevolveUsuario: TButton
      Left = 273
      Top = 76
      Width = 24
      Height = 17
      Caption = '<'
      TabOrder = 3
      OnClick = btnDevolveUsuarioClick
    end
    object btnDevolveTodasUsuario: TButton
      Left = 273
      Top = 92
      Width = 24
      Height = 17
      Caption = '<<'
      TabOrder = 4
      OnClick = btnDevolveTodasUsuarioClick
    end
    object lstAvisarUsuariosSelecionados: TListBox
      Left = 317
      Top = 45
      Width = 268
      Height = 68
      ItemHeight = 13
      MultiSelect = True
      TabOrder = 5
      OnDblClick = lstAvisarUsuariosSelecionadosDblClick
    end
  end
  object btnRelatorioAdministracao: TButton [3]
    Left = 8
    Top = 16
    Width = 185
    Height = 33
    Caption = 'Relat'#243'rio Administra'#231#227'o...'
    TabOrder = 3
    OnClick = btnRelatorioAdministracaoClick
  end
  inherited popGrid: TPopupMenu
    Left = 1112
    Top = 184
  end
  object tabAuxiliarProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1048
    Top = 40
    object tabAuxiliarProdutosCodigoProduto: TStringField
      FieldName = 'CodigoProduto'
    end
    object tabAuxiliarProdutosDescricao: TStringField
      FieldName = 'Descricao'
      Size = 60
    end
    object tabAuxiliarProdutosQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
    object tabAuxiliarProdutosPontoReposicao: TFloatField
      FieldName = 'PontoReposicao'
    end
    object tabAuxiliarProdutosFaltas: TFloatField
      FieldName = 'Faltas'
    end
    object tabAuxiliarProdutosNumeroCavidades: TIntegerField
      FieldName = 'NumeroCavidades'
    end
    object tabAuxiliarProdutosQuantidadeUnidade: TStringField
      FieldName = 'QuantidadeUnidade'
    end
    object tabAuxiliarProdutosPedidos: TFloatField
      FieldName = 'Pedidos'
    end
    object tabAuxiliarProdutosProducao: TFloatField
      FieldName = 'Producao'
    end
    object tabAuxiliarProdutosEstoque: TFloatField
      FieldName = 'Estoque'
    end
  end
  object dtsAuxiliarProdutos: TDataSource
    AutoEdit = False
    DataSet = tabAuxiliarProdutos
    Left = 1136
    Top = 95
  end
  object tabChecagens: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 1184
    Top = 209
  end
  object tabPedidos: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 1000
    Top = 272
  end
  object tabClientes: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 1000
    Top = 328
  end
  object dtsClientes: TDataSource
    AutoEdit = False
    DataSet = tabClientes
    Left = 1088
    Top = 328
  end
  object dtsPedidos: TDataSource
    AutoEdit = False
    DataSet = tabPedidos
    Left = 1088
    Top = 272
  end
  object tabPedidosProdutos: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 1072
    Top = 384
  end
  object tabUnidades: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 1176
    Top = 288
  end
  object tab1: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 976
    Top = 384
  end
  object tabVendedor: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 1176
    Top = 384
  end
  object pndDialogo: TPrintDialog
    Left = 288
    Top = 184
  end
  object pmOpcoes: TPopupMenu
    Left = 376
    Top = 216
  end
end

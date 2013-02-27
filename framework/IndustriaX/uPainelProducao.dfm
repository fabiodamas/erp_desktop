inherited fmPainelProducao: TfmPainelProducao
  Left = 42
  Top = 80
  Caption = 'Painel de Produ'#231#227'o'
  ClientHeight = 583
  ClientWidth = 1149
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgcPainelProducao: TPageControl [0]
    Left = 0
    Top = 0
    Width = 1145
    Height = 553
    ActivePage = tbsPainel
    TabOrder = 0
    OnChanging = pgcPainelProducaoChanging
    object tbsPainel: TTabSheet
      Caption = 'Painel de Produ'#231#227'o'
      object dbgPainel: TcxGrid
        Left = 0
        Top = 0
        Width = 1137
        Height = 463
        Align = alClient
        TabOrder = 0
        object tvwPainel: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          OnCustomDrawCell = tvwPainelCustomDrawCell
          DataController.DataSource = dtsPainel
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.IncSearch = True
          OptionsCustomize.ColumnHiding = True
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          Styles.Selection = cstVerde
          object clmOrdemProducao: TcxGridDBColumn
            Caption = 'O.P.'
            DataBinding.FieldName = 'OrdemProducao'
            Width = 29
          end
          object clmCodigoProduto: TcxGridDBColumn
            Caption = 'C'#243'd. Produto'
            DataBinding.FieldName = 'CodigoProduto'
            Width = 67
          end
          object clmOperacao: TcxGridDBColumn
            Caption = 'Opera'#231#227'o'
            DataBinding.FieldName = 'Setor'
            Width = 135
          end
          object clmInicio: TcxGridDBColumn
            Caption = 'In'#237'cio'
            DataBinding.FieldName = 'PeriodoInicial'
            Width = 109
          end
          object clmTermino: TcxGridDBColumn
            Caption = 'T'#233'rmino'
            DataBinding.FieldName = 'PeriodoFinal'
            Width = 108
          end
          object clmDuracao: TcxGridDBColumn
            Caption = 'Dura'#231#227'o'
            DataBinding.FieldName = 'Duracao'
            Width = 53
          end
          object clmMediaHora: TcxGridDBColumn
            Caption = 'M'#233'dia/Hora'
            DataBinding.FieldName = 'MediaHora'
            Width = 63
          end
          object clmMediaPadraoHora: TcxGridDBColumn
            Caption = 'M'#233'dia/Hora Padr'#227'o'
            DataBinding.FieldName = 'ProducaoPorHora'
            Width = 99
          end
          object clmProdutividade: TcxGridDBColumn
            Caption = 'Produtividade'
            DataBinding.FieldName = 'Produtividade'
            Width = 87
          end
          object clmQuantidade: TcxGridDBColumn
            DataBinding.FieldName = 'Quantidade'
            Width = 61
          end
          object clmTotal: TcxGridDBColumn
            DataBinding.FieldName = 'Total'
            Width = 30
          end
          object clmResponsavel1: TcxGridDBColumn
            Caption = 'Respons'#225'vel 1'
            DataBinding.FieldName = 'nome1'
            Width = 282
          end
          object clmResponsavel2: TcxGridDBColumn
            Caption = 'Respons'#225'vel 2'
            DataBinding.FieldName = 'nome2'
            Width = 195
          end
        end
        object lvlPainel: TcxGridLevel
          GridView = tvwPainel
        end
      end
      object pnl1: TPanel
        Left = 0
        Top = 484
        Width = 1137
        Height = 41
        Align = alBottom
        TabOrder = 1
        object lbl1: TLabel
          Left = 321
          Top = 3
          Width = 53
          Height = 13
          Caption = 'Data Inicial'
        end
        object lbl2: TLabel
          Left = 429
          Top = 3
          Width = 48
          Height = 13
          Caption = 'Data Final'
        end
        object rdgProdutos: TRadioGroup
          Left = 7
          Top = 5
          Width = 306
          Height = 32
          Caption = 'Produtos'
          Columns = 3
          ItemIndex = 0
          Items.Strings = (
            'N'#227'o Terminados'
            'Terminados'
            'Todos')
          TabOrder = 0
          OnClick = rdgProdutosClick
        end
        object chkApenasAndamento: TCheckBox
          Left = 648
          Top = 16
          Width = 137
          Height = 17
          Caption = 'Apenas em Andamento'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 1
          OnClick = chkApenasAndamentoClick
        end
        object edtDataInicial: TDateEdit
          Left = 320
          Top = 15
          Width = 97
          Height = 21
          NumGlyphs = 2
          TabOrder = 2
          OnAcceptDate = edtDataInicialAcceptDate
          OnExit = edtDataInicialExit
        end
        object edtDataFinal: TDateEdit
          Left = 428
          Top = 15
          Width = 97
          Height = 21
          NumGlyphs = 2
          TabOrder = 3
          OnAcceptDate = edtDataInicialAcceptDate
          OnExit = edtDataFinalExit
        end
      end
      object pbrBarra: TcxProgressBar
        Left = 0
        Top = 463
        Align = alBottom
        Properties.PeakValue = 50.000000000000000000
        TabOrder = 2
        Width = 1137
      end
    end
    object tbsMovimentos: TTabSheet
      Caption = 'Movimentos'
      ImageIndex = 1
      object Label1: TLabel
        Left = 112
        Top = 1
        Width = 321
        Height = 39
        Alignment = taCenter
        Caption = 'C'#243'digo da Opera'#231#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -32
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtCodigoBarrasOperacao: TEdit
        Left = 112
        Top = 40
        Width = 481
        Height = 45
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -32
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnExit = edtCodigoBarrasOperacaoExit
      end
      object grbInfoOP: TGroupBox
        Left = 32
        Top = 85
        Width = 672
        Height = 206
        TabOrder = 1
        Visible = False
        object lblOrdemProducao: TLabel
          Left = 16
          Top = 108
          Width = 329
          Height = 39
          Caption = 'Ordem de Produ'#231#227'o:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -32
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblSetor: TLabel
          Left = 16
          Top = 63
          Width = 98
          Height = 39
          Caption = 'Setor:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -32
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblProduto: TLabel
          Left = 16
          Top = 17
          Width = 260
          Height = 39
          Caption = 'C'#243'digo Produto:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -32
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCStatus: TLabel
          Left = 16
          Top = 153
          Width = 113
          Height = 39
          Caption = 'Status:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -32
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblStatus: TLabel
          Left = 131
          Top = 149
          Width = 533
          Height = 50
          Alignment = taCenter
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
      end
      object grbPreencheOP: TGroupBox
        Left = 32
        Top = 293
        Width = 672
        Height = 182
        TabOrder = 2
        Visible = False
        object lblResponsavel: TLabel
          Left = 16
          Top = 78
          Width = 213
          Height = 39
          Caption = 'Respons'#225'vel:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -32
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblQuantidade: TLabel
          Left = 16
          Top = 134
          Width = 197
          Height = 39
          Caption = 'Quantidade:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -32
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblPerdas: TLabel
          Left = 16
          Top = 22
          Width = 121
          Height = 39
          Caption = 'Perdas:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -32
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtCodigoResponsavel1: TEdit
          Left = 248
          Top = 72
          Width = 67
          Height = 45
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -32
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object edtQuantidade: TCurrencyEdit
          Left = 248
          Top = 128
          Width = 139
          Height = 45
          AutoSize = False
          DisplayFormat = '0.00;-0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -32
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object edtPerdas: TCurrencyEdit
          Left = 248
          Top = 16
          Width = 139
          Height = 45
          AutoSize = False
          DisplayFormat = '0.00;-0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -32
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object btnGravar: TBitBtn
          Left = 487
          Top = 128
          Width = 170
          Height = 45
          Caption = '&Gravar / Pausar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          OnClick = btnGravarClick
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
        object edtCodigoResponsavel2: TEdit
          Left = 320
          Top = 72
          Width = 67
          Height = 45
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -32
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
      end
    end
    object tsProximaEtapa: TTabSheet
      Caption = 'Pr'#243'xima Etapa'
      ImageIndex = 2
      OnShow = tsProximaEtapaShow
      object dbgProximaEtapa: TcxGrid
        Left = 0
        Top = 0
        Width = 1137
        Height = 525
        Align = alClient
        TabOrder = 0
        object tvwProximaEtapa: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dtsProximaEtapaAux
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          Styles.ContentEven = cstCorAzul
          Styles.ContentOdd = cstCorBranca
          object clmProximaEtapaOrdemProducao: TcxGridDBColumn
            DataBinding.FieldName = 'OrdemProducao'
            Width = 112
          end
          object clmProximaEtapaCodigoProduto: TcxGridDBColumn
            DataBinding.FieldName = 'CodigoProduto'
            Width = 93
          end
          object clmProximaEtapaSetor: TcxGridDBColumn
            DataBinding.FieldName = 'Setor'
            Width = 168
          end
          object clmProximaEtapaProximoSetor: TcxGridDBColumn
            DataBinding.FieldName = 'ProximoSetor'
            Width = 171
          end
          object clmProximaEtapaTotal: TcxGridDBColumn
            DataBinding.FieldName = 'Total'
            Width = 116
          end
        end
        object lvlProximaEtapa: TcxGridLevel
          GridView = tvwProximaEtapa
        end
      end
    end
  end
  object btnPausarTodas: TButton [1]
    Left = 1
    Top = 557
    Width = 97
    Height = 21
    Caption = 'Pausar Todas'
    TabOrder = 1
    OnClick = btnPausarTodasClick
  end
  object btnImprimir: TButton [2]
    Left = 128
    Top = 557
    Width = 93
    Height = 22
    Caption = 'Imprimir'
    TabOrder = 2
    OnClick = btnImprimirClick
  end
  object mmo1: TMemo [3]
    Left = 400
    Top = 160
    Width = 185
    Height = 89
    TabOrder = 3
    Visible = False
  end
  inherited popGrid: TPopupMenu
    Left = 840
    Top = 248
  end
  object tabAuxSetores: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 868
    Top = 88
    object tabAuxSetoresCodigoSetor: TFloatField
      FieldName = 'CodigoSetor'
    end
    object tabAuxSetoresSetor: TStringField
      FieldName = 'Setor'
      Size = 30
    end
  end
  object tabRoteiro: TZQuery
    Connection = fmMenu.zcnConexao
    SQL.Strings = (
      
        ' SELECT                           '#10'     rp.OrdemProducao,       ' +
        '                    '#10'     rp.CodigoProduto,                     ' +
        '      '#10'     rp.PeriodoInicial,                           '#10'     r' +
        'p.PeriodoFinal,                           '#10'     rp.Perdas,      ' +
        '                     '#10'     rp.CodigoSetor,                      ' +
        '     '#10'     rp.Quantidade,                           '#10'     rp.Qua' +
        'ntidade as Total,                           '#10'     rp.CodigoRespo' +
        'nsavel1,                           '#10'     rp.CodigoResponsavel2, ' +
        '                          '#10'     spp.ProducaoPorHora,            ' +
        '               '#10'     f1.nome as nome1,                          ' +
        ' '#10'     f2.nome as nome2,                           '#10'     f2.nome' +
        ' as Status,                           '#10'     f2.nome as produtivi' +
        'dade,                           '#10'     genericos.Descricao AS Set' +
        'or,                           '#10'    TIMEDIFF(rp.PeriodoFinal, rp.' +
        'PeriodoInicial) AS Duracao,                         '#10'     ID as ' +
        'MediaHora                             '#10' FROM                    ' +
        ' '
      
        '      '#10'     roteiro_produtivo AS rp                           '#10' ' +
        '        LEFT JOIN                           '#10'     genericos ON g' +
        'enericos.Codigo = rp.CodigoSetor                           '#10'    ' +
        '     LEFT JOIN                           '#10'     funcionarios as f' +
        '1 ON f1.Codigo = rp.CodigoResponsavel1                          ' +
        ' '#10'         LEFT JOIN                           '#10'     funcionario' +
        's as f2 ON f2.Codigo = rp.CodigoResponsavel2                    ' +
        '       '#10'         LEFT JOIN                           '#10'     seque' +
        'ncia_producao_produtos as spp on spp.CodigoProduto = rp.CodigoPr' +
        'oduto and spp.CodigoSetor = rp.CodigoSetor '#10' WHERE              ' +
        '             '#10'     exists( SELECT                           '#10'   ' +
        '          op.OrdemProducao                           '#10'         F' +
        'ROM                           '#10'             ordem_producao AS op' +
        '                           '#10'         WHERE                      ' +
        '     '#10'               rp.OrdemProducao = op.OrdemProducao   '#10'    ' +
        '     )                        '#10)
    Params = <>
    Left = 787
    Top = 168
  end
  object tabAuxOperacoes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 796
    Top = 8
    object tabAuxOperacoesOrdemProducao: TStringField
      FieldName = 'OrdemProducao'
      Size = 10
    end
    object tabAuxOperacoesOperacao: TStringField
      FieldName = 'Operacao'
      Size = 30
    end
    object tabAuxOperacoesInicio: TDateTimeField
      FieldName = 'Inicio'
    end
    object tabAuxOperacoesTermino: TDateTimeField
      FieldName = 'Termino'
    end
    object tabAuxOperacoesDuracao: TStringField
      FieldName = 'Duracao'
      Size = 50
    end
    object tabAuxOperacoesQuantidade: TStringField
      FieldName = 'Quantidade'
    end
    object tabAuxOperacoesCodigoProduto: TStringField
      FieldName = 'CodigoProduto'
    end
    object tabAuxOperacoesSequencia: TIntegerField
      FieldName = 'Sequencia'
    end
    object tabAuxOperacoesData: TDateField
      FieldName = 'Data'
    end
    object tabAuxOperacoesResponsavel1: TStringField
      FieldName = 'Responsavel1'
      Size = 40
    end
    object tabAuxOperacoesResponsavel2: TStringField
      FieldName = 'Responsavel2'
      Size = 40
    end
  end
  object dtsAuxOperacoes: TDataSource
    AutoEdit = False
    DataSet = tabAuxOperacoes
    Left = 892
    Top = 8
  end
  object tabOP: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 789
    Top = 217
  end
  object tabChecagens: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 791
    Top = 269
  end
  object stlCores: TcxStyleRepository
    Left = 536
    Top = 176
    PixelsPerInch = 96
    object cstCorBranca: TcxStyle
      AssignedValues = [svColor]
      Color = clWindow
    end
    object cstCorAzul: TcxStyle
      AssignedValues = [svColor]
      Color = 16775664
    end
    object cstVerde: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clGreen
    end
    object cstVermelho: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clRed
    end
  end
  object tabPainel: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPainel'
    Left = 912
    Top = 168
    object tabPainelOrdemProducao: TFloatField
      FieldName = 'OrdemProducao'
    end
    object cdsPainelCodigoProduto: TStringField
      FieldName = 'CodigoProduto'
    end
    object tabPainelPeriodoInicial: TDateTimeField
      FieldName = 'PeriodoInicial'
    end
    object tabPainelPeriodoFinal: TDateTimeField
      FieldName = 'PeriodoFinal'
    end
    object tabPainelPerdas: TFloatField
      FieldName = 'Perdas'
    end
    object tabPainelCodigoSetor: TFloatField
      FieldName = 'CodigoSetor'
    end
    object tabPainelQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
    object tabPainelTotal: TFloatField
      FieldName = 'Total'
    end
    object tabPainelCodigoResponsavel1: TFloatField
      FieldName = 'CodigoResponsavel1'
    end
    object tabPainelCodigoResponsavel2: TFloatField
      FieldName = 'CodigoResponsavel2'
    end
    object tabPainelProducaoPorHora: TFloatField
      FieldName = 'ProducaoPorHora'
    end
    object cdsPainelnome1: TStringField
      FieldName = 'nome1'
      Size = 50
    end
    object cdsPainelnome2: TStringField
      FieldName = 'nome2'
      Size = 50
    end
    object cdsPainelStatus: TStringField
      FieldName = 'Status'
      Size = 50
    end
    object cdsPainelprodutividade: TStringField
      FieldName = 'produtividade'
      Size = 50
    end
    object cdsPainelSetor: TStringField
      FieldName = 'Setor'
      Size = 60
    end
    object tfdPainelDuracao: TTimeField
      FieldName = 'Duracao'
      ReadOnly = True
    end
    object tabPainelMediaHora: TFloatField
      FieldName = 'MediaHora'
      Required = True
    end
  end
  object dspPainel: TDataSetProvider
    DataSet = tabRoteiro
    Constraints = False
    Left = 852
    Top = 168
  end
  object dtsPainel: TDataSource
    DataSet = tabPainel
    Left = 968
    Top = 168
  end
  object crpPainel: TdxComponentPrinter
    CurrentLink = grlPainel
    CustomizeDlgOptions = []
    PreviewOptions.Caption = 'Visualiza'#231#227'o'
    PreviewOptions.VisibleOptions = [pvoPageSetup, pvoPrint]
    PrintTitle = 'Painel de Produ'#231#227'o'
    Version = 0
    Left = 568
    Top = 296
    object grlPainel: TdxGridReportLink
      Component = dbgPainel
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 6350
      PrinterPage.GrayShading = True
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.Orientation = poLandscape
      PrinterPage.PageSize.X = 210000
      PrinterPage.PageSize.Y = 297000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      BuiltInReportLink = True
    end
  end
  object tabTodoRoteiroProdutivo: TZQuery
    Connection = fmMenu.zcnConexao
    SQL.Strings = (
      
        'select '#10'    OrdemProducao,'#10' CodigoSetor,   genericos.Descricao A' +
        'S Setor,'#10'    CodigoProduto,'#10'    sum(Quantidade) as Qtd'#10'from'#10'    ' +
        'roteiro_produtivo AS rp'#10'        LEFT JOIN'#10'    genericos ON gener' +
        'icos.Codigo = rp.CodigoSetor'#10#10'group by OrdemProducao , CodigoSet' +
        'or , CodigoProduto'#10'order by ordemproducao desc;')
    Params = <>
    Left = 487
    Top = 381
    object tabTodoRoteiroProdutivoOrdemProducao: TFloatField
      FieldName = 'OrdemProducao'
    end
    object strngfldProximaEtapaSetor: TStringField
      FieldName = 'Setor'
      Size = 60
    end
    object strngfldProximaEtapaCodigoProduto: TStringField
      FieldName = 'CodigoProduto'
    end
    object tabTodoRoteiroProdutivoQtd: TFloatField
      FieldName = 'Qtd'
      ReadOnly = True
    end
    object tabTodoRoteiroProdutivoCodigoSetor: TFloatField
      FieldName = 'CodigoSetor'
    end
  end
  object tabProximaEtapaAux: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 800
    Top = 472
    object tabProximaEtapaAuxOrdemProducao: TFloatField
      DisplayLabel = 'Ordem de Produ'#231#227'o'
      FieldName = 'OrdemProducao'
    end
    object strngfldProximaEtapa1Setor: TStringField
      FieldName = 'Setor'
      Size = 60
    end
    object strngfldProximaEtapa1CodigoProduto: TStringField
      DisplayLabel = 'C'#243'digo do Produto'
      FieldName = 'CodigoProduto'
    end
    object tabProximaEtapaAuxQtd: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'Qtd'
    end
    object tabProximaEtapaAuxTotal: TFloatField
      DisplayLabel = 'Total a ser produzido'
      FieldName = 'Total'
    end
    object tabProximaEtapaAuxCodigoSetor: TFloatField
      DisplayLabel = 'C'#243'digo do Setor'
      FieldName = 'CodigoSetor'
    end
    object strngfldProximaEtapaAuxProximoSetor: TStringField
      DisplayLabel = 'Pr'#243'ximo Setor'
      FieldName = 'ProximoSetor'
      Size = 50
    end
  end
  object tabChecagens2: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 919
    Top = 253
  end
  object tabProximaEtapaExibirAux: TClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    Left = 792
    Top = 328
    object tab2: TFloatField
      FieldName = 'OrdemProducao'
    end
    object strngfld1: TStringField
      FieldName = 'Setor'
      Size = 60
    end
    object strngfld2: TStringField
      FieldName = 'CodigoProduto'
    end
    object tab3: TFloatField
      FieldName = 'Qtd'
    end
    object tab4: TFloatField
      FieldName = 'Total'
    end
    object tab5: TFloatField
      FieldName = 'CodigoSetor'
    end
  end
  object dtsProximaEtapaExibirAux: TDataSource
    DataSet = tabProximaEtapaExibirAux
    Left = 936
    Top = 329
  end
  object dtsProximaEtapaAux: TDataSource
    DataSet = tabProximaEtapaAux
    Left = 944
    Top = 473
  end
  object tabChecagens3: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 999
    Top = 229
  end
end

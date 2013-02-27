inherited frmSolicitacaoMudanca: TfrmSolicitacaoMudanca
  Left = 269
  Top = 142
  Width = 925
  Height = 609
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Solicita'#231#245'es de Mudan'#231'as'
  FormStyle = fsMDIChild
  Visible = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoes: TPanel
    Top = 521
    Width = 917
    TabOrder = 1
  end
  object pgcSolicitacoes: TPageControl [1]
    Left = 0
    Top = 0
    Width = 917
    Height = 521
    ActivePage = tsSolicitacoesMudancas
    Align = alClient
    TabOrder = 0
    object tsSolicitacoesMudancas: TTabSheet
      Caption = 'Solicita'#231#245'es de Mudan'#231'as'
      ImageIndex = 2
      object dbgSolicitacaoMudanca: TcxGrid
        Left = 0
        Top = 49
        Width = 909
        Height = 444
        Align = alClient
        TabOrder = 1
        LookAndFeel.NativeStyle = True
        LookAndFeel.SkinName = 'Blue'
        object tvwSolicitacaoMudanca: TcxGridDBTableView
          OnDblClick = tvwSolicitacaoMudancaDblClick
          NavigatorButtons.ConfirmDelete = False
          OnCellDblClick = tvwSolicitacaoMudancaCellDblClick
          OnCustomDrawCell = tvwSolicitacaoMudancaCustomDrawCell
          DataController.DataSource = dtsBase
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnHiding = True
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsCustomize.DataRowSizing = True
          Styles.ContentEven = cstCorBranca
          Styles.ContentOdd = cstCorAzul
          object clmOrdemExecucao: TcxGridDBColumn
            Caption = 'Ordem de Execu'#231#227'o'
            DataBinding.FieldName = 'OrdemExecucao'
            PropertiesClassName = 'TcxSpinEditProperties'
            Width = 102
          end
          object clmStatus: TcxGridDBColumn
            DataBinding.FieldName = 'Status'
            PropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.Images = imgImagens
            Properties.Items = <
              item
                Description = 'Em Aberto'
                ImageIndex = 2
                Value = 'Em Aberto'
              end
              item
                Description = 'Em execu'#231#227'o'
                ImageIndex = 3
                Value = 'Em execu'#231#227'o'
              end
              item
                Description = 'Corrigido'
                ImageIndex = 5
                Value = 'Corrigido'
              end>
            Width = 107
          end
          object clmSinopse: TcxGridDBColumn
            Caption = 'Resumo'
            DataBinding.FieldName = 'Sinopse'
            Width = 249
          end
          object clmDescricao: TcxGridDBColumn
            Caption = 'Descri'#231#227'o Detalhada'
            DataBinding.FieldName = 'Descricao'
            PropertiesClassName = 'TcxMemoProperties'
            Properties.ScrollBars = ssBoth
            Width = 246
          end
          object clmTipo: TcxGridDBColumn
            DataBinding.FieldName = 'Tipo'
            PropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.Images = imgImagens
            Properties.Items = <
              item
                Description = 'Sugest'#227'o'
                ImageIndex = 0
                Value = 'Sugest'#227'o'
              end
              item
                Description = 'Defeito'
                ImageIndex = 1
                Value = 'Defeito'
              end
              item
              end>
            Width = 91
          end
          object clmPrioridade: TcxGridDBColumn
            DataBinding.FieldName = 'Prioridade'
            PropertiesClassName = 'TcxCheckComboBoxProperties'
            Properties.Items = <
              item
                Description = 'Cr'#237'tico'
              end
              item
                Description = 'Urgente'
              end
              item
                Description = 'Alta'
              end
              item
                Description = 'Normal'
              end
              item
                Description = 'Baixa'
              end
              item
                Description = 'A mais baixa'
              end>
            Width = 109
          end
          object clmUsuario: TcxGridDBColumn
            Caption = 'Usu'#225'rio'
            DataBinding.FieldName = 'CodigoUsuario'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'Usuario'
            Properties.ListColumns = <
              item
                FieldName = 'Usuario'
              end>
            Properties.ListSource = dtsUsuarios
            Width = 88
          end
          object clmDataRequisicao: TcxGridDBColumn
            Caption = 'Data Requisi'#231#227'o'
            DataBinding.FieldName = 'DataRequisicao'
            PropertiesClassName = 'TcxDateEditProperties'
            Width = 98
          end
          object clmNomeJanela: TcxGridDBColumn
            Caption = 'Nome da Janela'
            DataBinding.FieldName = 'NomeJanela'
            Width = 143
          end
          object clmPrazoFinal: TcxGridDBColumn
            Caption = 'Prazo Final'
            DataBinding.FieldName = 'PrazoFinal'
          end
          object clmTempoEstimado: TcxGridDBColumn
            Caption = 'Tempo estimado'
            DataBinding.FieldName = 'TempoEstimado'
            Width = 92
          end
          object clmHorasCorridas: TcxGridDBColumn
            Caption = 'Horas Corridas'
            DataBinding.FieldName = 'HorasCorridas'
            Width = 95
          end
        end
        object tvwSolucaoDetalhe: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          NavigatorButtons.First.Visible = False
          NavigatorButtons.PriorPage.Visible = False
          NavigatorButtons.Prior.Visible = False
          NavigatorButtons.Next.Visible = False
          NavigatorButtons.NextPage.Visible = False
          NavigatorButtons.Last.Visible = False
          NavigatorButtons.Insert.Visible = True
          NavigatorButtons.Append.Visible = False
          NavigatorButtons.Refresh.Visible = False
          NavigatorButtons.SaveBookmark.Visible = False
          NavigatorButtons.GotoBookmark.Visible = False
          NavigatorButtons.Filter.Visible = False
          DataController.DataModeController.DetailInSQLMode = True
          DataController.DataSource = dtsSolucao
          DataController.DetailKeyFieldNames = 'CodigoSolicitacoesMudancas'
          DataController.MasterKeyFieldNames = 'CodigoSolicitacoesMudancas'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.Navigator = True
          OptionsView.GroupByBox = False
          object clmSolicitacaoMudancaDBTableView3CodigoSolucao: TcxGridDBColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'CodigoSolucao'
          end
          object clmSolicitacaoMudancaDBTableView3CodigoSolicitacoesMudancas: TcxGridDBColumn
            Caption = 'C'#243'd. Solicita'#231#227'o de Mudan'#231'a'
            DataBinding.FieldName = 'CodigoSolicitacoesMudancas'
          end
          object clmSolicitacaoMudancaDBTableView3Data: TcxGridDBColumn
            DataBinding.FieldName = 'Data'
          end
          object clmSolicitacaoMudancaDBTableView3HoraInicial: TcxGridDBColumn
            Caption = 'Hora Inicial'
            DataBinding.FieldName = 'HoraInicial'
          end
          object clmSolicitacaoMudancaDBTableView3HoraFinal: TcxGridDBColumn
            Caption = 'Hora Final'
            DataBinding.FieldName = 'HoraFinal'
          end
          object clmSolicitacaoMudancaDBTableView3Total: TcxGridDBColumn
            DataBinding.FieldName = 'Total'
          end
          object clmSolicitacaoMudancaDBTableView3Descricao: TcxGridDBColumn
            Caption = 'Descri'#231#227'o'
            DataBinding.FieldName = 'Descricao'
          end
        end
        object lvlSolicitacaoMudanca: TcxGridLevel
          GridView = tvwSolicitacaoMudanca
          object lvlSolucaoDetalhe: TcxGridLevel
            GridView = tvwSolucaoDetalhe
          end
        end
      end
      object pnl5: TPanel
        Left = 0
        Top = 0
        Width = 909
        Height = 49
        Align = alTop
        TabOrder = 0
        object btnVisualizar: TBitBtn
          Left = 16
          Top = 12
          Width = 87
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
      end
    end
    object tsDetalhes: TTabSheet
      Caption = 'Detalhes'
      ImageIndex = 4
      object grp4: TGroupBox
        Left = 0
        Top = 56
        Width = 909
        Height = 324
        Align = alClient
        Caption = 'Descri'#231#227'o Detalhada'
        TabOrder = 1
        object dbm1: TcxDBMemo
          Left = 2
          Top = 15
          Align = alClient
          DataBinding.DataField = 'Descricao'
          DataBinding.DataSource = dtsBase
          Properties.ScrollBars = ssBoth
          TabOrder = 0
          Height = 307
          Width = 905
        end
      end
      object grp5: TGroupBox
        Left = 0
        Top = 437
        Width = 909
        Height = 56
        Align = alBottom
        TabOrder = 3
        object lbl9: TLabel
          Left = 7
          Top = 11
          Width = 77
          Height = 13
          Caption = 'Nome da Janela'
        end
        object lbl10: TLabel
          Left = 183
          Top = 11
          Width = 79
          Height = 13
          Caption = 'Tempo Estimado'
        end
        object lbl11: TLabel
          Left = 287
          Top = 11
          Width = 52
          Height = 13
          Caption = 'Prazo Final'
        end
        object lbl12: TLabel
          Left = 383
          Top = 11
          Width = 69
          Height = 13
          Caption = 'Horas Corridas'
        end
        object edtEndereco1: TDBEdit
          Left = 7
          Top = 25
          Width = 170
          Height = 21
          DataField = 'NomeJanela'
          DataSource = dtsBase
          TabOrder = 3
        end
        object cxDBTimeEdit1: TcxDBTimeEdit
          Left = 184
          Top = 24
          DataBinding.DataField = 'TempoEstimado'
          DataBinding.DataSource = dtsBase
          TabOrder = 0
          Width = 89
        end
        object cxDBTimeEdit2: TcxDBTimeEdit
          Left = 384
          Top = 24
          DataBinding.DataField = 'HorasCorridas'
          DataBinding.DataSource = dtsBase
          Properties.ReadOnly = True
          Style.Color = clSilver
          TabOrder = 2
          Width = 89
        end
        object dbe2: TcxDBDateEdit
          Left = 285
          Top = 24
          DataBinding.DataField = 'PrazoFinal'
          DataBinding.DataSource = dtsBase
          TabOrder = 1
          Width = 92
        end
      end
      object pnl1: TPanel
        Left = 0
        Top = 380
        Width = 909
        Height = 57
        Align = alBottom
        TabOrder = 2
        object grp2: TGroupBox
          Left = 7
          Top = 8
          Width = 89
          Height = 41
          Caption = 'Tipo'
          TabOrder = 0
          object cbbTipo: TcxDBComboBox
            Left = 4
            Top = 15
            DataBinding.DataField = 'Tipo'
            DataBinding.DataSource = dtsBase
            Properties.Items.Strings = (
              'Sugest'#227'o'
              'Defeito')
            TabOrder = 0
            Width = 78
          end
        end
        object grp3: TGroupBox
          Left = 103
          Top = 8
          Width = 105
          Height = 41
          Caption = 'Status'
          TabOrder = 1
          object lbl5: TLabel
            Left = 24
            Top = 24
            Width = 16
            Height = 13
            Caption = 'lbl5'
          end
          object cbb1: TcxDBComboBox
            Left = 4
            Top = 15
            DataBinding.DataField = 'Status'
            DataBinding.DataSource = dtsBase
            Properties.Items.Strings = (
              'Em Aberto'
              'Corrigido'
              'Em execu'#231#227'o')
            TabOrder = 0
            Width = 90
          end
        end
        object grp6: TGroupBox
          Left = 215
          Top = 8
          Width = 105
          Height = 41
          Caption = 'Prioridade'
          TabOrder = 2
          object cbb3: TcxDBComboBox
            Left = 4
            Top = 15
            DataBinding.DataField = 'Prioridade'
            DataBinding.DataSource = dtsBase
            Properties.Items.Strings = (
              'Cr'#237'tico'
              'Urgente'
              'Alta'
              'Normal'
              'Baixa'
              'A mais baixa')
            TabOrder = 0
            Width = 90
          end
        end
        object grp7: TGroupBox
          Left = 327
          Top = 8
          Width = 105
          Height = 41
          Caption = 'Usu'#225'rio'
          TabOrder = 3
          object cbb2: TcxDBLookupComboBox
            Left = 4
            Top = 15
            DataBinding.DataField = 'CodigoUsuario'
            DataBinding.DataSource = dtsBase
            Properties.KeyFieldNames = 'Usuario'
            Properties.ListColumns = <
              item
                FieldName = 'Usuario'
              end>
            Properties.ListSource = dtsUsuarios
            TabOrder = 0
            Width = 81
          end
        end
        object grp8: TGroupBox
          Left = 439
          Top = 8
          Width = 121
          Height = 41
          Caption = 'Data da Requisi'#231#227'o'
          TabOrder = 4
          object dbe1: TcxDBDateEdit
            Left = 4
            Top = 15
            DataBinding.DataField = 'DataRequisicao'
            DataBinding.DataSource = dtsBase
            TabOrder = 0
            Width = 105
          end
        end
      end
      object grp9: TGroupBox
        Left = 0
        Top = 0
        Width = 909
        Height = 56
        Align = alTop
        TabOrder = 0
        object lbl7: TLabel
          Left = 87
          Top = 9
          Width = 39
          Height = 13
          Caption = 'Resumo'
        end
        object lbl8: TLabel
          Left = 15
          Top = 10
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
        end
        object edtSinopse: TDBEdit
          Left = 87
          Top = 23
          Width = 802
          Height = 21
          DataField = 'Sinopse'
          DataSource = dtsBase
          TabOrder = 1
        end
        object edtCodigoSolicitacoesMudancas: TDBEdit
          Left = 12
          Top = 23
          Width = 69
          Height = 21
          Color = clSilver
          DataField = 'CodigoSolicitacoesMudancas'
          DataSource = dtsBase
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
    object tsSolucao: TTabSheet
      Caption = 'Solu'#231#227'o'
      ImageIndex = 3
      OnShow = tsSolucaoShow
      object grp10: TGroupBox
        Left = 0
        Top = 0
        Width = 909
        Height = 113
        Align = alTop
        TabOrder = 0
        object lbl1: TLabel
          Left = 71
          Top = 21
          Width = 23
          Height = 13
          Caption = 'Data'
        end
        object lbl2: TLabel
          Left = 177
          Top = 21
          Width = 53
          Height = 13
          Caption = 'Hora Inicial'
        end
        object lbl20: TLabel
          Left = 274
          Top = 21
          Width = 48
          Height = 13
          Caption = 'Hora Final'
        end
        object lbl6: TLabel
          Left = 8
          Top = 64
          Width = 48
          Height = 13
          Caption = 'Descri'#231#227'o'
        end
        object lbl3: TLabel
          Left = 368
          Top = 21
          Width = 24
          Height = 13
          Caption = 'Total'
        end
        object lbl4: TLabel
          Left = 9
          Top = 21
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
        end
        object edtDescricao2: TDBEdit
          Left = 8
          Top = 77
          Width = 585
          Height = 21
          DataField = 'Descricao'
          DataSource = dtsSolucao
          TabOrder = 5
        end
        object edtCodigoSolucao: TDBEdit
          Left = 8
          Top = 33
          Width = 57
          Height = 21
          DataField = 'CodigoSolucao'
          DataSource = dtsSolucao
          ReadOnly = True
          TabOrder = 0
        end
        object dbe3: TcxDBDateEdit
          Left = 70
          Top = 33
          DataBinding.DataField = 'Data'
          DataBinding.DataSource = dtsSolucao
          TabOrder = 1
          Width = 95
        end
        object cxDBTimeEdit3: TcxDBTimeEdit
          Left = 176
          Top = 33
          DataBinding.DataField = 'HoraInicial'
          DataBinding.DataSource = dtsSolucao
          TabOrder = 2
          Width = 89
        end
        object cxDBTimeEdit4: TcxDBTimeEdit
          Left = 272
          Top = 33
          DataBinding.DataField = 'HoraFinal'
          DataBinding.DataSource = dtsSolucao
          TabOrder = 3
          OnExit = cxDBTimeEdit4Exit
          Width = 89
        end
        object cxDBTimeEdit5: TcxDBTimeEdit
          Left = 368
          Top = 33
          DataBinding.DataField = 'Total'
          DataBinding.DataSource = dtsSolucao
          TabOrder = 4
          Width = 89
        end
      end
      object pnl2: TPanel
        Left = 0
        Top = 113
        Width = 860
        Height = 380
        Align = alClient
        TabOrder = 1
        object dbgSolucao: TcxGrid
          Left = 1
          Top = 1
          Width = 858
          Height = 378
          Align = alClient
          TabOrder = 0
          object tvwSolucao: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = dtsSolucao
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Kind = skSum
                FieldName = 'Total'
                Column = clmSolucaoTotal
                DisplayText = 'Total'
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsView.Footer = True
            object clmSolucaoCodigoSolucao: TcxGridDBColumn
              Caption = 'C'#243'digo'
              DataBinding.FieldName = 'CodigoSolucao'
              Width = 51
            end
            object clmSolucaoData: TcxGridDBColumn
              DataBinding.FieldName = 'Data'
            end
            object clmSolucaoHoraInicial: TcxGridDBColumn
              DataBinding.FieldName = 'HoraInicial'
            end
            object clmSolucaoHoraFinal: TcxGridDBColumn
              DataBinding.FieldName = 'HoraFinal'
              Width = 82
            end
            object clmSolucaoTotal: TcxGridDBColumn
              DataBinding.FieldName = 'Total'
              PropertiesClassName = 'TcxTimeEditProperties'
              Width = 70
            end
            object clmSolucaoDescricao: TcxGridDBColumn
              Caption = 'Descri'#231#227'o'
              DataBinding.FieldName = 'Descricao'
              Width = 1058
            end
          end
          object lvlSolucao: TcxGridLevel
            GridView = tvwSolucao
          end
        end
      end
      object pnl3: TPanel
        Left = 860
        Top = 113
        Width = 49
        Height = 380
        Align = alRight
        AutoSize = True
        TabOrder = 2
        object btnNovoSolucao: TSpeedButton
          Left = 1
          Top = 1
          Width = 47
          Height = 38
          Action = dsiInsert
          Flat = True
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
            A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
            69A46769A46769FF00FFFF00FFFF00FF9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C
            9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9CFF00FFFF00FFFF00FF
            B79184FEE9C7F4DAB5F3D5AAF2D0A0EFCB96EFC68BEDC182EBC17FEBC180EBC1
            80F2C782A46769FF00FFFF00FFFF00FF9C9C9CE9E9E9DEDEDED9D9D9D4D4D4CF
            CFCFCACACAC5C5C5C3C3C3C4C4C4C4C4C4C7C7C79C9C9CFF00FFFF00FFFF00FF
            B79187FCEACEF3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD
            7FEFC481A46769FF00FFFF00FFFF00FF9C9C9CEBEBEBE0E0E0DBDBDBD7D7D7D2
            D2D2CDCDCDC9C9C9C3C3C3C2C2C2C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FF
            B7938AFEEFDAF6E0C6F2DABCF2D5B2EFD0A9EECB9EEDC796EBC28CE9BD82E9BD
            7FEFC481A46769FF00FFFF00FFFF00FF959595F0F0F0E5E5E5E0E0E0DCDCDCD7
            D7D7D2D2D2CECECEC9C9C9C4C4C4C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FF
            BA978FFFF4E5F7E5CFF4E0C5F3DABBF2D5B1F0D0A6EECB9EEDC795EBC28AEABF
            81EFC480A46769FF00FFFF00FFFF00FF959595F5F5F5E9E9E9E4E4E4E0E0E0DB
            DBDBD6D6D6D2D2D2CDCDCDC8C8C8C4C4C4C5C5C59C9C9CFF00FFFF00FFFF00FF
            C09E95FFFBF0F8EADCF6E3CFF4E0C6F2D9BCF2D5B1F0D0A9EDCB9EEDC695EBC2
            8AEFC583A46769FF00FFFF00FFFF00FF9F9F9FF9F9F9EFEFEFE9E9E9E5E5E5E0
            E0E0DBDBDBD7D7D7D1D1D1CDCDCDC8C8C8C7C7C79C9C9CFF00FFFF00FFFF00FF
            C6A49AFFFFFCFAF0E6F8EADAF7E5CFF4E0C5F2DABAF2D5B1F0D0A7EECB9DEBC7
            93F2C98CA46769FF00FFFF00FFFF00FF9F9F9FFEFEFEF3F3F3EEEEEEE9E9E9E4
            E4E4DFDFDFDBDBDBD7D7D7D1D1D1CCCCCCCCCCCC9C9C9CFF00FFFF00FFFF00FF
            CBA99EFFFFFFFEF7F2FAEFE6F8EAD9F7E3CFF6E0C5F2DABBF2D4B1F0D0A7EECC
            9EF3CE97A46769FF00FFFF00FFFF00FFA6A6A6FFFFFFF9F9F9F3F3F3EEEEEEE9
            E9E9E5E5E5DFDFDFDBDBDBD7D7D7D2D2D2D1D1D19C9C9CFF00FFFF00FFFF00FF
            CFAC9FFFFFFFFFFEFCFCF6F0FAEFE6F7EADAF6E3CFF4E0C5F3D9BBF3D4B0F0D0
            A6F6D3A0A46769FF00FFFF00FFFF00FFA6A6A6FFFFFFFEFEFEF8F8F8F3F3F3EE
            EEEEE9E9E9E4E4E4E0E0E0DBDBDBD6D6D6D6D6D69C9C9CFF00FFFF00FFFF00FF
            D4B0A1FFFFFFFFFFFFFFFEFCFEF7F0FAEFE5F8EAD9F7E5CEF6DEC4F3D9B8F4D8
            B1EBCFA4A46769FF00FFFF00FFFF00FFB1B1B1FFFFFFFFFFFFFEFEFEF9F9F9F3
            F3F3EEEEEEE9E9E9E4E4E4DFDFDFDCDCDCD3D3D39C9C9CFF00FFFF00FFFF00FF
            D9B5A1FFFFFFFFFFFFFFFFFFFFFEFCFCF7F0FAEFE5F8E9D9F8E7D1FBEACEDECE
            B4B6AA93A46769FF00FFFF00FFFF00FFB1B1B1FFFFFFFFFFFFFFFFFFFEFEFEF8
            F8F8F3F3F3EEEEEEEBEBEBEAEAEAD5D5D5B7B7B79C9C9CFF00FFFF00FFFF00FF
            DDB7A4FFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFCF6EFFCF3E6EDD8C9B68A7BA17B
            6F9C7667A46769FF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFE
            FEFEF8F8F8F4F4F4E3E3E39999999999999999999C9C9CFF00FFFF00FFFF00FF
            E2BCA5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BAAD735BE19E
            55E68F31B56D4DFF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFDFDFDFCFCFCD6D6D6999999ACACAC9B9B9B969696FF00FFFF00FFFF00FF
            E6BFA7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCC7C5B88265F8B5
            5CBF7A5CFF00FFFF00FFFF00FFFF00FFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFDBDBDB999999B8B8B8A2A2A2FF00FFFF00FFFF00FFFF00FF
            E4BCA4FBF4F0FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0B77F62C183
            6CFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFF8F8F8F7F7F7F7F7F7F7F7F7F6
            F6F6F6F6F6F6F6F6D7D7D7999999AAAAAAFF00FFFF00FFFF00FFFF00FFFF00FF
            E8C4ADEBCBB7EBCBB7EACBB7EACAB6EACAB6EACAB6EACAB6E3C2B1A56B5FFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFB1B1B1B1B1B1B1B1B1B1B1B1B1
            B1B1B1B1B1B1B1B1B1B1B1999999FF00FFFF00FFFF00FFFF00FF}
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
        end
        object btnDelete: TSpeedButton
          Left = 1
          Top = 39
          Width = 47
          Height = 38
          Action = dseEdit
          Caption = 'Editar'
          Flat = True
          Glyph.Data = {
            36060000424D3606000000000000360400002800000020000000100000000100
            08000000000000020000120B0000120B0000000100000000000000000000FFFF
            FF00FF00FF0001570300079110000D9A1B0013A1230017A92C0017A72A0020B4
            3B0025BB430024B841002AC04B002FC5530031C7560031C7570037CE60003AD1
            660084FEFB0087FFFE00D7FCFB0056DCDD00A5FFFF00C0FFFF007DFAFE0062F8
            FF0077F7FF007BF0F60080F8FE0057F4FF005BF4FF0062DCE7008EF6FF0063DE
            EA00ABF0F70095D0D70045CAE0004BD9F00072EAFF002AB7D50053CCE3005BDC
            F70062E5FF0016B7DD0023D7FF002CD5FF0051D3F2005CE1FF0057D0ED0068D7
            F3009EE0F00011BBEA0015CEFE0016CEFE0014B8E50018CBFE0018C9FB0018C7
            F7001ACFFF001ACBFC001DA4CB003C95AF004FB4D10054ABC2004991A4006EDA
            F70078DDF700B4E1EE00A1C4CE0018BFF00043A7C50051BDDE00ADDEEE008AAC
            B600189ED00089CEE500097DAC000976A3000C86B8001284B200159ACE00179E
            D1001A92C0001D7292002180A50040A1C7000274A9000273A700026898000265
            920009729F00096D9800B7DAE900FFFFFF000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
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
            0202565656565656020202020202020202024949494949490202020202020202
            024C3C36452E474E560202020202020202494949445C44494902020202020202
            0259152B3A2A4151560202020202020202494449445C5C494902020256565603
            03030334372F3150560202024949494040404044445C5C494902024C3C360304
            0356192C2D26424A560202494949404940495C44445C5C494902025615030503
            405923324844434B560202494440494049495C14145C145C4902020303070B0E
            03033E52035B54555602024040494944404044494049494449020256030F1111
            035627030603464D560202494044444440494440494044494902025622031103
            49560308090C034F59020249144044405C49404949494049490202563E52035A
            5303030A0D100303560202494449404949404049494440404902025627333928
            3D56170311031C2556020249444944444949014044405C44490202561E343830
            3F59031103131221560202495C44445C44494044405C5C5C490202561D353B29
            0303030356565656020202495C44445C40404040494949490202025617201A18
            1B245802020202020202024901145C5C5C44490202020202020202565C141613
            121F570202020202020202491401145C5C5C4902020202020202020257565656
            5656020202020202020202024949494949490202020202020202}
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
        end
        object btnGravarSolucao: TSpeedButton
          Left = 1
          Top = 77
          Width = 47
          Height = 38
          Action = dspPost
          Flat = True
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
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
        end
        object btnCancelaSolucao: TSpeedButton
          Left = 1
          Top = 115
          Width = 47
          Height = 38
          Action = dscCancel
          Flat = True
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
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
        end
        object btnExcluirSolucao: TSpeedButton
          Left = 1
          Top = 153
          Width = 47
          Height = 38
          Action = dsdDelete
          Flat = True
          Glyph.Data = {
            EE020000424DEE02000000000000EE0000002800000020000000100000000100
            08000000000000020000120B0000120B00002E0000002E000000FF00FF000000
            9A00012AF200002CF600002CF8000733F6000031FE000431FE000134FF000C3C
            FF00123BF100103BF400143EF400103DFB001743F6001B46F6001C47F6001D48
            F6001342FF001A47F8001847FF00174AFD001A48F9001D4BFF001A4CFF001D50
            FF00224DF100224CF400204BF800214CF800214EFC002550F4002D59F4002655
            FA002355FF002659FF002E5BF9002C5FFF00325DF1003B66F3003664FA00386B
            FF004071FA004274FF00497AFC00000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000101000000000000010100
            000000002727000000000000272700000000000001150B010000000001040601
            000000272C2C2700000000272C2C2700000000000113180B0100000103060301
            000000272C2C2C270000272C2C2C270000000000000110180B01010406030100
            00000000272C2C2C27272C2C2C2700000000000000000111190D060603010000
            0000000000272C2C2C2C2C2C27000000000000000000000118120D0501000000
            000000000000272C2C2C2C270000000000000000000000011D18131201000000
            000000000000272C2C2C2C27000000000000000000000124241D1D1911010000
            0000000000272C2C2C2C2C2C2700000000000000000128292401011F191F0100
            00000000272C2C2C27272C2C2C27000000000000012A2A26010000011F231D01
            000000272C2C2C270000272C2C2C270000000000012C270100000000011F1901
            000000272C2C2700000000272C2C270000000000000101000000000000010100
            0000000027270000000000002727000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000}
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
        end
      end
    end
    object tsTodasSolucoes: TTabSheet
      Caption = 'Todas as Solu'#231#245'es'
      ImageIndex = 3
      OnShow = tsTodasSolucoesShow
      object dbgTodasSolucoes: TcxGrid
        Left = 0
        Top = 49
        Width = 860
        Height = 444
        Align = alClient
        TabOrder = 1
        object tvwTodasSolucoes: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dtsSolucaoCorrido
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skSum
              FieldName = 'Total'
              DisplayText = 'Total'
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsView.CellAutoHeight = True
          OptionsView.Footer = True
          Styles.ContentEven = cstCorAzul
          Styles.ContentOdd = cstCorBranca
          object clmGridDBTableView1CodigoSolucao: TcxGridDBColumn
            DataBinding.FieldName = 'CodigoSolucao'
          end
          object clmGridDBTableView1CodigoSolicitacoesMudancas: TcxGridDBColumn
            Caption = 'Solicita'#231#227'o de Mudan'#231'a'
            DataBinding.FieldName = 'CodigoSolicitacoesMudancas'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'CodigoSolicitacoesMudancas'
            Properties.ListColumns = <
              item
                FieldName = 'Sinopse'
              end
              item
                FieldName = 'CodigoSolicitacoesMudancas'
              end>
            Properties.ListSource = dtsBase
            Width = 176
          end
          object clmGridDBTableView1Data: TcxGridDBColumn
            DataBinding.FieldName = 'Data'
          end
          object clmGridDBTableView1HoraInicial: TcxGridDBColumn
            DataBinding.FieldName = 'HoraInicial'
          end
          object clmGridDBTableView1HoraFinal: TcxGridDBColumn
            DataBinding.FieldName = 'HoraFinal'
          end
          object clmGridDBTableView1Total: TcxGridDBColumn
            DataBinding.FieldName = 'Total'
          end
          object clmGridDBTableView1Descricao: TcxGridDBColumn
            DataBinding.FieldName = 'Descricao'
            PropertiesClassName = 'TcxMemoProperties'
            Width = 321
          end
        end
        object lvlTodasSolucoes: TcxGridLevel
          GridView = tvwTodasSolucoes
        end
      end
      object pnl4: TPanel
        Left = 860
        Top = 49
        Width = 49
        Height = 444
        Align = alRight
        AutoSize = True
        TabOrder = 2
        object btnInsert: TSpeedButton
          Left = 1
          Top = 1
          Width = 47
          Height = 38
          Action = dsiInsertCorrido
          Caption = 'Novo'
          Flat = True
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
            A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
            69A46769A46769FF00FFFF00FFFF00FF9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C
            9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9CFF00FFFF00FFFF00FF
            B79184FEE9C7F4DAB5F3D5AAF2D0A0EFCB96EFC68BEDC182EBC17FEBC180EBC1
            80F2C782A46769FF00FFFF00FFFF00FF9C9C9CE9E9E9DEDEDED9D9D9D4D4D4CF
            CFCFCACACAC5C5C5C3C3C3C4C4C4C4C4C4C7C7C79C9C9CFF00FFFF00FFFF00FF
            B79187FCEACEF3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD
            7FEFC481A46769FF00FFFF00FFFF00FF9C9C9CEBEBEBE0E0E0DBDBDBD7D7D7D2
            D2D2CDCDCDC9C9C9C3C3C3C2C2C2C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FF
            B7938AFEEFDAF6E0C6F2DABCF2D5B2EFD0A9EECB9EEDC796EBC28CE9BD82E9BD
            7FEFC481A46769FF00FFFF00FFFF00FF959595F0F0F0E5E5E5E0E0E0DCDCDCD7
            D7D7D2D2D2CECECEC9C9C9C4C4C4C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FF
            BA978FFFF4E5F7E5CFF4E0C5F3DABBF2D5B1F0D0A6EECB9EEDC795EBC28AEABF
            81EFC480A46769FF00FFFF00FFFF00FF959595F5F5F5E9E9E9E4E4E4E0E0E0DB
            DBDBD6D6D6D2D2D2CDCDCDC8C8C8C4C4C4C5C5C59C9C9CFF00FFFF00FFFF00FF
            C09E95FFFBF0F8EADCF6E3CFF4E0C6F2D9BCF2D5B1F0D0A9EDCB9EEDC695EBC2
            8AEFC583A46769FF00FFFF00FFFF00FF9F9F9FF9F9F9EFEFEFE9E9E9E5E5E5E0
            E0E0DBDBDBD7D7D7D1D1D1CDCDCDC8C8C8C7C7C79C9C9CFF00FFFF00FFFF00FF
            C6A49AFFFFFCFAF0E6F8EADAF7E5CFF4E0C5F2DABAF2D5B1F0D0A7EECB9DEBC7
            93F2C98CA46769FF00FFFF00FFFF00FF9F9F9FFEFEFEF3F3F3EEEEEEE9E9E9E4
            E4E4DFDFDFDBDBDBD7D7D7D1D1D1CCCCCCCCCCCC9C9C9CFF00FFFF00FFFF00FF
            CBA99EFFFFFFFEF7F2FAEFE6F8EAD9F7E3CFF6E0C5F2DABBF2D4B1F0D0A7EECC
            9EF3CE97A46769FF00FFFF00FFFF00FFA6A6A6FFFFFFF9F9F9F3F3F3EEEEEEE9
            E9E9E5E5E5DFDFDFDBDBDBD7D7D7D2D2D2D1D1D19C9C9CFF00FFFF00FFFF00FF
            CFAC9FFFFFFFFFFEFCFCF6F0FAEFE6F7EADAF6E3CFF4E0C5F3D9BBF3D4B0F0D0
            A6F6D3A0A46769FF00FFFF00FFFF00FFA6A6A6FFFFFFFEFEFEF8F8F8F3F3F3EE
            EEEEE9E9E9E4E4E4E0E0E0DBDBDBD6D6D6D6D6D69C9C9CFF00FFFF00FFFF00FF
            D4B0A1FFFFFFFFFFFFFFFEFCFEF7F0FAEFE5F8EAD9F7E5CEF6DEC4F3D9B8F4D8
            B1EBCFA4A46769FF00FFFF00FFFF00FFB1B1B1FFFFFFFFFFFFFEFEFEF9F9F9F3
            F3F3EEEEEEE9E9E9E4E4E4DFDFDFDCDCDCD3D3D39C9C9CFF00FFFF00FFFF00FF
            D9B5A1FFFFFFFFFFFFFFFFFFFFFEFCFCF7F0FAEFE5F8E9D9F8E7D1FBEACEDECE
            B4B6AA93A46769FF00FFFF00FFFF00FFB1B1B1FFFFFFFFFFFFFFFFFFFEFEFEF8
            F8F8F3F3F3EEEEEEEBEBEBEAEAEAD5D5D5B7B7B79C9C9CFF00FFFF00FFFF00FF
            DDB7A4FFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFCF6EFFCF3E6EDD8C9B68A7BA17B
            6F9C7667A46769FF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFE
            FEFEF8F8F8F4F4F4E3E3E39999999999999999999C9C9CFF00FFFF00FFFF00FF
            E2BCA5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BAAD735BE19E
            55E68F31B56D4DFF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFDFDFDFCFCFCD6D6D6999999ACACAC9B9B9B969696FF00FFFF00FFFF00FF
            E6BFA7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCC7C5B88265F8B5
            5CBF7A5CFF00FFFF00FFFF00FFFF00FFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFDBDBDB999999B8B8B8A2A2A2FF00FFFF00FFFF00FFFF00FF
            E4BCA4FBF4F0FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0B77F62C183
            6CFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFF8F8F8F7F7F7F7F7F7F7F7F7F6
            F6F6F6F6F6F6F6F6D7D7D7999999AAAAAAFF00FFFF00FFFF00FFFF00FFFF00FF
            E8C4ADEBCBB7EBCBB7EACBB7EACAB6EACAB6EACAB6EACAB6E3C2B1A56B5FFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFB1B1B1B1B1B1B1B1B1B1B1B1B1
            B1B1B1B1B1B1B1B1B1B1B1999999FF00FFFF00FFFF00FFFF00FF}
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
        end
        object btnEdit: TSpeedButton
          Left = 1
          Top = 39
          Width = 47
          Height = 38
          Action = dseEditCorrido
          Caption = 'Editar'
          Flat = True
          Glyph.Data = {
            36060000424D3606000000000000360400002800000020000000100000000100
            08000000000000020000120B0000120B0000000100000000000000000000FFFF
            FF00FF00FF0001570300079110000D9A1B0013A1230017A92C0017A72A0020B4
            3B0025BB430024B841002AC04B002FC5530031C7560031C7570037CE60003AD1
            660084FEFB0087FFFE00D7FCFB0056DCDD00A5FFFF00C0FFFF007DFAFE0062F8
            FF0077F7FF007BF0F60080F8FE0057F4FF005BF4FF0062DCE7008EF6FF0063DE
            EA00ABF0F70095D0D70045CAE0004BD9F00072EAFF002AB7D50053CCE3005BDC
            F70062E5FF0016B7DD0023D7FF002CD5FF0051D3F2005CE1FF0057D0ED0068D7
            F3009EE0F00011BBEA0015CEFE0016CEFE0014B8E50018CBFE0018C9FB0018C7
            F7001ACFFF001ACBFC001DA4CB003C95AF004FB4D10054ABC2004991A4006EDA
            F70078DDF700B4E1EE00A1C4CE0018BFF00043A7C50051BDDE00ADDEEE008AAC
            B600189ED00089CEE500097DAC000976A3000C86B8001284B200159ACE00179E
            D1001A92C0001D7292002180A50040A1C7000274A9000273A700026898000265
            920009729F00096D9800B7DAE900FFFFFF000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
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
            0202565656565656020202020202020202024949494949490202020202020202
            024C3C36452E474E560202020202020202494949445C44494902020202020202
            0259152B3A2A4151560202020202020202494449445C5C494902020256565603
            03030334372F3150560202024949494040404044445C5C494902024C3C360304
            0356192C2D26424A560202494949404940495C44445C5C494902025615030503
            405923324844434B560202494440494049495C14145C145C4902020303070B0E
            03033E52035B54555602024040494944404044494049494449020256030F1111
            035627030603464D560202494044444440494440494044494902025622031103
            49560308090C034F59020249144044405C49404949494049490202563E52035A
            5303030A0D100303560202494449404949404049494440404902025627333928
            3D56170311031C2556020249444944444949014044405C44490202561E343830
            3F59031103131221560202495C44445C44494044405C5C5C490202561D353B29
            0303030356565656020202495C44445C40404040494949490202025617201A18
            1B245802020202020202024901145C5C5C44490202020202020202565C141613
            121F570202020202020202491401145C5C5C4902020202020202020257565656
            5656020202020202020202024949494949490202020202020202}
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
        end
        object btnPost: TSpeedButton
          Left = 1
          Top = 77
          Width = 47
          Height = 38
          Action = dspPostCorrido
          Caption = 'Gravar'
          Flat = True
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
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
        end
        object btnCancel: TSpeedButton
          Left = 1
          Top = 115
          Width = 47
          Height = 38
          Action = dscCancelCorrido
          Caption = 'Cancelar'
          Flat = True
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
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
        end
        object btnDelete1: TSpeedButton
          Left = 1
          Top = 153
          Width = 47
          Height = 38
          Action = dsdDeleteCorrido
          Caption = 'Excluir'
          Flat = True
          Glyph.Data = {
            EE020000424DEE02000000000000EE0000002800000020000000100000000100
            08000000000000020000120B0000120B00002E0000002E000000FF00FF000000
            9A00012AF200002CF600002CF8000733F6000031FE000431FE000134FF000C3C
            FF00123BF100103BF400143EF400103DFB001743F6001B46F6001C47F6001D48
            F6001342FF001A47F8001847FF00174AFD001A48F9001D4BFF001A4CFF001D50
            FF00224DF100224CF400204BF800214CF800214EFC002550F4002D59F4002655
            FA002355FF002659FF002E5BF9002C5FFF00325DF1003B66F3003664FA00386B
            FF004071FA004274FF00497AFC00000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000101000000000000010100
            000000002727000000000000272700000000000001150B010000000001040601
            000000272C2C2700000000272C2C2700000000000113180B0100000103060301
            000000272C2C2C270000272C2C2C270000000000000110180B01010406030100
            00000000272C2C2C27272C2C2C2700000000000000000111190D060603010000
            0000000000272C2C2C2C2C2C27000000000000000000000118120D0501000000
            000000000000272C2C2C2C270000000000000000000000011D18131201000000
            000000000000272C2C2C2C27000000000000000000000124241D1D1911010000
            0000000000272C2C2C2C2C2C2700000000000000000128292401011F191F0100
            00000000272C2C2C27272C2C2C27000000000000012A2A26010000011F231D01
            000000272C2C2C270000272C2C2C270000000000012C270100000000011F1901
            000000272C2C2700000000272C2C270000000000000101000000000000010100
            0000000027270000000000002727000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000}
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
        end
      end
      object pnl6: TPanel
        Left = 0
        Top = 0
        Width = 909
        Height = 49
        Align = alTop
        TabOrder = 0
        object btnVisualizarTodasSolucoes: TBitBtn
          Left = 16
          Top = 12
          Width = 87
          Height = 28
          Caption = 'Visualizar'
          TabOrder = 0
          OnClick = btnVisualizarTodasSolucoesClick
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
      end
    end
  end
  inherited popGrid: TPopupMenu
    Left = 728
    Top = 480
  end
  inherited tabBase: TZQuery
    Connection = fmMenu.zcnConexao
    AfterInsert = tabBaseAfterInsert
    SQL.Strings = (
      'select * from solicitacoes_mudancas')
    Left = 200
    Top = 264
    object tabBaseCodigoSolicitacoesMudancas: TFloatField
      FieldName = 'CodigoSolicitacoesMudancas'
      Required = True
    end
    object tabBaseOrdemExecucao: TFloatField
      FieldName = 'OrdemExecucao'
    end
    object strngfldBaseCodigoUsuario: TStringField
      FieldName = 'CodigoUsuario'
      Size = 45
    end
    object strngfldBaseTipo: TStringField
      FieldName = 'Tipo'
      Size = 45
    end
    object strngfldBaseStatus: TStringField
      FieldName = 'Status'
      Size = 45
    end
    object strngfldBasePrioridade: TStringField
      FieldName = 'Prioridade'
      Size = 45
    end
    object dfdBaseDataRequisicao: TDateField
      FieldName = 'DataRequisicao'
    end
    object strngfldBaseNomeJanela: TStringField
      FieldName = 'NomeJanela'
      Size = 45
    end
    object tfdBaseTempoEstimado: TTimeField
      FieldName = 'TempoEstimado'
    end
    object dfdBasePrazoFinal: TDateField
      FieldName = 'PrazoFinal'
    end
    object tfdBaseHorasCorridas: TTimeField
      FieldName = 'HorasCorridas'
    end
    object strngfldBaseDescricao: TStringField
      FieldName = 'Descricao'
      Size = 500
    end
    object strngfldBaseSinopse: TStringField
      FieldName = 'Sinopse'
      Size = 45
    end
  end
  inherited dtsBase: TDataSource
    AutoEdit = True
    OnDataChange = dtsBaseDataChange
    Left = 184
    Top = 560
  end
  inherited popOpcoes: TPopupMenu
    Left = 688
    Top = 480
    object Rtulo1: TMenuItem
      Caption = 'R'#243'tulo'
    end
  end
  object popEmail: TPopupMenu
    Left = 328
    Top = 512
    object EnviarEmail1: TMenuItem
      Caption = 'Enviar E-mail'
    end
  end
  object tabSolucao: TZQuery
    Connection = fmMenu.zcnConexao
    SortedFields = 'CodigoSolucao'
    AfterPost = tabSolucaoAfterPost
    AfterDelete = tabSolucaoAfterPost
    OnNewRecord = tabSolucaoNewRecord
    SQL.Strings = (
      'select * from solucao')
    Params = <>
    IndexFieldNames = 'CodigoSolucao Asc'
    Left = 264
    Top = 512
    object tabSolucaoCodigoSolucao: TFloatField
      FieldName = 'CodigoSolucao'
      Required = True
    end
    object tabSolucaoCodigoSolicitacoesMudancas: TFloatField
      FieldName = 'CodigoSolicitacoesMudancas'
    end
    object dfdSolucaoData: TDateField
      FieldName = 'Data'
    end
    object tfdSolucaoHoraInicial: TTimeField
      FieldName = 'HoraInicial'
    end
    object tfdSolucaoHoraFinal: TTimeField
      FieldName = 'HoraFinal'
    end
    object tfdSolucaoTotal: TTimeField
      FieldName = 'Total'
    end
    object strngfldSolucaoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 500
    end
  end
  object dtsSolucao: TDataSource
    DataSet = tabSolucao
    Left = 264
    Top = 560
  end
  object dtsUsuarios: TDataSource
    AutoEdit = False
    DataSet = tabUsuarios
    Left = 392
    Top = 568
  end
  object tabUsuarios: TZQuery
    Connection = fmMenu.zcnConexao
    SQL.Strings = (
      'SELECT * FROM usuarios')
    Params = <>
    Left = 392
    Top = 520
    object strngfldUsuariosUsuario: TStringField
      FieldName = 'Usuario'
      Required = True
    end
    object strngfldUsuariosSenha: TStringField
      FieldName = 'Senha'
      Required = True
      Size = 30
    end
    object tabUsuariosCodigoPerfil: TFloatField
      FieldName = 'CodigoPerfil'
    end
    object mmfUsuariosTelas: TMemoField
      FieldName = 'Telas'
      BlobType = ftMemo
    end
  end
  object imgImagens: TcxImageList
    FormatVersion = 1
    DesignInfo = 14680264
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000FF000000FF0000
          00FF000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000FF666699FF669999FF6699
          99FF000000FF0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000FF99FFFFFF99FFFFFF99CC
          CCFF000000FF0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000FF339999FF009999FF0099
          99FF000000FF0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000CCFFFFFF000000FF33FFFFFF33FFFFFF33FF
          FFFF000000FFCCFFFFFF00000000000000000000000000000000000000000000
          0000000000000000000000000000000000FF66FFFFFF33FFFFFF00FFFFFF33FF
          FFFF66FFFFFF000000FF00000000000000000000000000000000000000000000
          00000000000000000000CCFFFFFF000000FF33FFFFFF00FFFFFF00FFFFFF00FF
          FFFF33FFFFFF000000FFCCFFFFFF000000000000000000000000000000000000
          00000000000000000000000000FF66FFFFFF33FFFFFF00FFFFFF00FFFFFF00FF
          FFFF33FFFFFF66FFFFFF000000FF000000000000000000000000000000000000
          00000000000000000000000000FF66FFFFFF33FFFFFF00FFFFFF00FFFFFF00FF
          FFFF00FFFFFF33FFFFFF000000FF000000000000000000000000000000000000
          000000000000CCFFFFFF000000FF66FFFFFF33FFFFFF00FFFFFF00FFFFFF00FF
          FFFF33FFFFFF66FFFFFF000000FF000000000000000000000000000000000000
          0000CCFFFFFFCCFFFFFFCCFFFFFF000000FF66FFFFFF33FFFFFF00FFFFFF33FF
          FFFF66FFFFFF000000FFCCFFFFFFCCFFFFFF000000000000000000000000CCFF
          FFFFCCFFFFFFCCCCFFFF00000000CCFFFFFF000000FF66FFFFFF33FFFFFF66FF
          FFFF000000FFCCFFFFFF99CCFFFFCCFFFFFF0000000000000000CCFFFFFFCCFF
          FFFF99FFFFFFCCFFFFFF0000000000000000CCFFFFFF000000FF000000FF0000
          00FFCCFFFFFFCCFFFFFFCCFFFFFF99FFFFFFCCFFFFFFCCFFFFFFCCFFFFFFCCCC
          FFFFCCFFFFFFCCFFFFFF000000000000000099CCFFFFCCFFFFFF000000000000
          000099CCFFFFCCFFFFFFCCFFFFFFCCFFFFFFCCCCFFFFCCFFFFFF000000000000
          0000000000000000000000000000CCFFFFFF99FFFFFF99FFFFFF00000000CCFF
          FFFF99FFFFFF99FFFFFFCCFFFFFF000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000099FFFFFFCCFFFFFF000000000000
          000099FFFFFFCCFFFFFF00000000000000000000000000000000000000000000
          00000000000000000000000000000000000099CCCCFF99CCCCFFCCCCCCFFCCCC
          CCFF000000000000000000000000000000000000000000000000000000000000
          00000000000000000000CCCCCCFF99CC99FF000000FF99CC99FF99CC99FF0000
          00FF99CC99FFCCCCCCFF00000000CCCCCCFFCCCCCCFF00000000CCCCCCFF0000
          0000000000000000000099CC99FF003300FF66CC66FF003300FF003300FF66CC
          66FF003300FF99CC99FFCCCCCCFFCCCCCCFF000000FF00000000000000FFCCCC
          CCFFCCCCCCFF99CC99FF000000FF66CC66FF33CC33FF33CC33FF33CC33FF33CC
          33FF66CC66FF000000FFCCCCCCFF000000FF000000FF00000000000000FF0000
          00FF000000FF99CC99FF003300FF66CC66FF003300FF33CC33FF33CC33FF0033
          00FF66CC66FF003300FF000000FF000000FF0000000000000000000000000000
          0000000000FF000000FF003300FF33CC33FF003300FF33CC33FF33CC33FF0033
          00FF33CC33FF003300FF99CC99FFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
          CCFFCCCCCCFF99CC99FF003300FF33CC33FF003300FF33CC33FF33CC33FF0033
          00FF33CC33FF003300FF99CC99FF000000FF000000FF00000000CCCCCCFF0000
          00FF000000FF000000FF003300FF33CC33FF33CC33FF33FF33FF33FF33FF33CC
          33FF33CC33FF003300FF000000FF000000FF0000000000000000000000FF0000
          00FFCCCCCCFF99CC99FF000000FF66CC66FF33FF33FF00FF00FF00FF00FF33FF
          33FF66CC66FF000000FFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFF00000000CCCC
          CCFF000000FF000000FF000000FF003300FF33CC33FF33CC33FF33FF33FF33CC
          33FF003300FF000000FF000000FF000000FF000000FFCCCCCCFF00000000CCCC
          CCFF000000FF0000000000000000000000FF000000FF003300FF000000FF0000
          00FF000000FF000000000000000000000000000000FFCCCCCCFF000000000000
          00FF000000FF0000000000000000CCCCCCFF996666FF00000000000000009966
          99FFCCCCCCFF000000000000000000000000000000FFCCCCCCFF000000000000
          00000000000000000000CCCCCCFF666666FF0000000000000000000000000000
          0000666666FFCCCCCCFF00000000000000000000000000000000000000000000
          000000000000CCCCCCFF666666FF000000000000000000000000000000000000
          000000000000996666FFCCCCCCFF000000000000000000000000000000000000
          000000000000666666FF00000000000000000000000000000000000000000000
          00000000000000000000666666FF000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000BF9F5FFFBF7F3FFFBF7F3FFFBF7F3FFFBF7F
          3FFFBF9F5FFF0000000000000000000000000000000000000000000000000000
          00000000000000000000BF7F3FFF9F5F3FFF9F5F3FFF9F5F3FFF9F5F3FFF9F5F
          3FFF9F5F3FFFBF7F3FFF00000000000000000000000000000000000000000000
          000000000000BF7F3FFFBF7F3FFFBF9F5FFFBFBF9FFF0000000000000000BFBF
          9FFFBF9F5FFF9F5F3FFFBF7F3FFF000000000000000000000000000000000000
          0000BF7F3FFFBF7F3FFFBFBF9FFF000000000000000000000000000000000000
          000000000000BFBF9FFF9F5F3FFFBF7F3FFF000000000000000000000000BF9F
          5FFFBF7F3FFFBF9F5FFF00000000000000000000000000000000000000000000
          00000000000000000000BF9F5FFF9F5F3FFFBF9F5FFF0000000000000000BF7F
          3FFF9F5F3FFFBFBF9FFF00000000000000000000000000000000000000000000
          00000000000000000000BFBF9FFF9F5F3FFFBF7F3FFF0000000000000000BF7F
          3FFF9F5F3FFF0000000000000000000000000000000000000000000000000000
          00000000000000000000000000009F5F3FFFBF7F3FFF0000000000000000BF7F
          3FFF9F5F3FFF0000000000000000000000000000000000000000000000000000
          00000000000000000000000000009F5F3FFFBF7F3FFF0000000000000000BF7F
          3FFF9F5F3FFFBFBF9FFF00000000000000000000000000000000000000000000
          00000000000000000000BFBF9FFF9F5F3FFFBF7F3FFF0000000000000000BF9F
          5FFF9F5F3FFFBF9F5FFF00000000000000000000000000000000000000000000
          00000000000000000000BF9F5FFFBF7F3FFFBF9F5FFF00000000000000000000
          0000BF7F3FFF9F5F3FFFBFBF9FFF000000000000000000000000000000000000
          000000000000BFBF9FFFBF7F3FFFBF7F3FFF0000000000000000000000000000
          000000000000BF7F3FFF9F5F3FFFBF9F5FFFBFBF9FFF0000000000000000BFBF
          9FFFBF9F5FFFBF7F3FFFBF7F3FFF000000000000000000000000000000000000
          00000000000000000000BF7F3FFF9F5F3FFF9F5F3FFF9F5F3FFF9F5F3FFF9F5F
          3FFF9F5F3FFFBF7F3FFF00000000000000000000000000000000000000000000
          0000000000000000000000000000BF9F5FFFBF7F3FFFBF7F3FFFBF7F3FFFBF7F
          3FFFBF9F5FFF0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000FBFBFBFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFFFEFEFEFFEDEDEDFFFFFF
          FFFFF2F2F2FFE5E5E5FFF7F7F7FFFFFFFFFFFDFDFDFF00000000FEFEFEFFFEFE
          FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFFFBFBFBFFFFFFFFFFCECE
          CEFF656565FF343434FF565656FFB6B6B6FFFFFFFFFF00000000FFFFFFFFFDFD
          FDFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFEFEFEFFEBEBEBFF7171
          71FF070707FF303030FF323232FF5C5C5CFFE9E9E9FF00000000FFFFFFFFFDFD
          FDFFFFFFFFFFFFFFFFFFFBFBFBFFFFFFFFFFFFFFFFFFF5F5F5FF848484FF2A2A
          2AFF1E1E1EFFACACACFF636363FF1F1F1FFFC7C7C7FF00000000FFFFFFFFFCFC
          FCFFFFFFFFFFFFFFFFFFFCFCFCFFFFFFFFFFF4F4F4FFBDBDBDFF303030FF1616
          16FF151515FF5E5E5EFF1F1F1FFF2A2A2AFFE6E6E6FF00000000FFFFFFFFFBFB
          FBFFFFFFFFFFFFFFFFFFFAFAFAFFFBFBFBFFBDBDBDFF535353FF111111FF1616
          16FF0C0C0CFF080808FF303030FFA6A6A6FFFFFFFFFF00000000FFFFFFFFFBFB
          FBFFFFFFFFFFFFFFFFFFF7F7F7FFEBEBEBFF898989FF000000FF1C1C1CFF0D0D
          0DFF1E1E1EFF323232FFA9A9A9FFFFFFFFFFEFEFEFFF00000000FFFFFFFFF3F3
          F3FFF4F4F4FFECECECFFDFDFDFFF828282FF181818FF141414FF080808FF1818
          18FF5D5D5DFFC2C2C2FFFFFFFFFFFFFFFFFFFCFCFCFF00000000E9E9E9FFF4F4
          F4FF8C8C8CFF545454FF313131FF2F2F2FFF101010FF111111FF212121FF7676
          76FFD1D1D1FFF8F8F8FFFBFBFBFFFBFBFBFFFDFDFDFF00000000F9F9F9FF8383
          83FF191919FF020202FF000000FF1F1F1FFF181818FF222222FF8D8D8DFFD8D8
          D8FFFFFFFFFFFFFFFFFFF4F4F4FFFEFEFEFFFFFFFFFF00000000F1F1F1FF1111
          11FF373737FF2F2F2FFF151515FF0B0B0BFF181818FF707070FFF0F0F0FFFCFC
          FCFFFFFFFFFFFCFCFCFFF9F9F9FFFFFFFFFFFFFFFFFF00000000E4E4E4FF5E5E
          5EFFC4C4C4FFBABABAFF727272FF2F2F2FFF141414FF898989FFFBFBFBFFFBFB
          FBFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9FFFAFAFAFF00000000F2F2F2FFF0F0
          F0FFFAFAFAFFFBFBFBFF898989FF323232FF000000FF8D8D8DFFF9F9F9FFFFFF
          FFFFFFFFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFF00000000F5F5F5FFFFFF
          FFFFECECECFFC9C9C9FF2E2E2EFF1C1C1CFF323232FFD5D5D5FFFFFFFFFFFFFF
          FFFFFAFAFAFFF4F4F4FFFCFCFCFFFFFFFFFFFFFFFFFF00000000FFFFFFFFE4E4
          E4FFFFFFFFFFD1D1D1FF5B5B5BFFB4B4B4FFCACACAFFFAFAFAFFFAFAFAFFFCFC
          FCFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9FFFAFAFAFF00000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000FCF9FEFFA4E3
          EEFF1991AFFF75A3B3FFD0CABFFFB5BABDFFC1CDCFFFDEE0E4FFF7F1F3FFF7FC
          FBFFFEFEFEFFFFFFFFFFFFFFFFFFFDFDFDFFFCFCFCFF00000000D8F5F7FF39C2
          DCFF16ADDEFF158CABFFEDF7FDFFFEF6F6FFF1F0EFFFE7ECEBFFE5E6E6FFE7E3
          E4FFE6E6E6FFECECECFFF1F1F1FFF6F6F6FFFEFEFEFF00000000E4FCFCFF45AC
          CDFF12C3FAFF0CA9DAFF3C8AA8FFFCFEFEFFFFFCFBFFFCFEF9FFF9FFFCFFFFFC
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFF00000000FFFEFCFFE5F5
          FEFF29AFD7FF2BC6F6FF0FA1D2FFAEE0E9FFF2F3FAFFFFFCF7FFF8FFFBFFFFFE
          FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FBFDF7FFF3F8
          F8FFA0D7E2FF25C3E8FF14B0EFFF20859CFFEBF6FFFFFFFDFEFFF9FFF9FFFFFF
          FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FFFDFFFFF7FF
          F9FFF3FFFDFF65A7C1FF18C6F4FF19B0E6FF5996B3FFFEFDF9FFF4FFEEFFFFF9
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FFFDFFFFFBFF
          FAFFFFFEFBFFDBFAFFFF3FAAC9FF23BFF2FF0FA5CFFFD9F2FAFFEEFEFAFFFEFD
          FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FCFFFFFFFFFF
          FCFFFFFFFBFFFDFDFFFFE0FEFFFF20AED9FF11B7E2FF4898B7FFFEFAFDFFF7FE
          F7FFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFCFCFCFF00000000FCFFFFFFFFFE
          FFFFFFFFFEFFFFFFFEFFFFFEFFFFB3EBF4FF3FBDD3FFABC6DDFFF1FBFAFFFAFA
          F8FFFFFFFFFFFFFFFFFFFEFEFEFFFEFEFEFFFFFFFFFF00000000FFFFFEFFFFFE
          FFFFF6FFFFFFF5FFFFFFFFFFFCFFFCFAFDFFE4F9FCFFF2F0F0FFB6B4AEFFFFFB
          FFFFFFFFFFFFFFFFFFFFFBFBFBFFECECECFFFAFAFAFF00000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2D2D2FFD7D7D7FFDCDC
          DCFFFCFCFCFFFBFBFBFFC0C0C0FF595959FFF9F9F9FF00000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFCFCFCFFB9B9B9FFFFFF
          FFFF707070FF909090FF474747FFD2D2D2FFB5B5B5FF00000000FFFFFFFFFFFF
          FFFFFEFEFEFFFDFDFDFFFDFDFDFFFDFDFDFFFEFEFEFFFDFDFDFFD0D0D0FFFBFB
          FBFFF2F2F2FFC8C8C8FFA5A5A5FFF0F0F0FFF4F4F4FF00000000FFFFFFFFFFFF
          FFFFFEFEFEFFFBFBFBFFFDFDFDFF8E8E8EFFBABABAFFB7B7B7FF707070FFF8F8
          F8FFFBFBFBFFC6C6C6FFF4F4F4FFFDFDFDFFFEFEFEFF00000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFE4E4E4FF929292FF9D9D9DFFDBDBDBFFE2E2
          E2FFF3F3F3FFFBFBFBFFFCFCFCFFFEFEFEFFFFFFFFFF00000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000E020B6911060F5E00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000060004241F6A2DF2206228EC0600041E000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000173521C130CD5CFF2FC44AFF18351BCA000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000701034D299F5BFF3CE079FF36D461FF279F3EFF0E0F0E7B0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000010000041A593CE349EC9AFF46DC87FF3AD472FF35D961FF217732FF0800
          052E000000000000000000000000000000000000000000000000000000000000
          000008100C7448C995FF60F5B4FF36E88DFF39E283FF3DD573FF32CF5CFF1C44
          24D9030001030000000000000000000000000000000000000000000000000900
          01402F866EEE59FFDAFF1BCF8DFF165829EE1A8748FF33E989FF40DC76FF2AAF
          50FF14191390000000000000000000000000000000000000000000000000152F
          27FF1BC893FF0D9074FA0C1512890700000E0C00064C177C52FC2CE489FF41E4
          76FF22823EFF0B03083E00000000000000000000000000000000000000001216
          135F101C128E070000200000000000000000000000000B0002320F624CE727DD
          8AFF3CE073FF1C4D2AE301000006000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000070000180E48
          3BCF22D481FF30C867FF152017A1000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000500
          0007112D25B220C471FF249F53FF080003430000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000111614921DA656FF196A39E10700022700000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000F0B0967196A30F71C2F26EA00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000010000A621B1D1B6F00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end>
  end
  object aclSolucao: TActionList
    Left = 664
    Top = 544
    object dsiInsert: TDataSetInsert
      Category = 'Dataset'
      Caption = 'Novo'
      DataSource = dtsSolucao
    end
    object dsdDelete: TDataSetDelete
      Category = 'Dataset'
      Caption = 'Excluir'
      DataSource = dtsSolucao
    end
    object dspPost: TDataSetPost
      Category = 'Dataset'
      Caption = 'Gravar'
      DataSource = dtsSolucao
    end
    object dscCancel: TDataSetCancel
      Category = 'Dataset'
      Caption = 'Cancelar'
      DataSource = dtsSolucao
    end
    object dseEdit: TDataSetEdit
      Category = 'Dataset'
      Caption = 'dseEdit'
      DataSource = dtsSolucao
    end
  end
  object tabChecagens: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 480
    Top = 528
  end
  object tabTotalHoras: TZQuery
    Connection = fmMenu.zcnConexao
    SQL.Strings = (
      
        'SELECT * FROM solicitacoes_mudancas where CodigoSolicitacoesMuda' +
        'ncas = :CodigoSolicitacoesMudancas')
    Params = <
      item
        DataType = ftString
        Name = 'CodigoSolicitacoesMudancas'
        ParamType = ptInput
      end>
    Left = 72
    Top = 512
    ParamData = <
      item
        DataType = ftString
        Name = 'CodigoSolicitacoesMudancas'
        ParamType = ptInput
      end>
    object tabTotalHorasCodigoSolicitacoesMudancas: TFloatField
      FieldName = 'CodigoSolicitacoesMudancas'
      Required = True
    end
    object strngfldTotalHorasCodigoUsuario: TStringField
      FieldName = 'CodigoUsuario'
      Size = 45
    end
    object strngfldTotalHorasTipo: TStringField
      FieldName = 'Tipo'
      Size = 45
    end
    object strngfldTotalHorasStatus: TStringField
      FieldName = 'Status'
      Size = 45
    end
    object strngfldTotalHorasPrioridade: TStringField
      FieldName = 'Prioridade'
      Size = 45
    end
    object dfdTotalHorasDataRequisicao: TDateField
      FieldName = 'DataRequisicao'
    end
    object strngfldTotalHorasNomeJanela: TStringField
      FieldName = 'NomeJanela'
      Size = 45
    end
    object tfdTotalHorasTempoEstimado: TTimeField
      FieldName = 'TempoEstimado'
    end
    object dfdTotalHorasPrazoFinal: TDateField
      FieldName = 'PrazoFinal'
    end
    object tfdHorasCorridas: TTimeField
      FieldName = 'HorasCorridas'
    end
    object strngfldTotalHorasDescricao: TStringField
      FieldName = 'Descricao'
      Size = 500
    end
    object strngfldTotalHorasSinopse: TStringField
      FieldName = 'Sinopse'
      Size = 45
    end
  end
  object tabTotalHorasSolucao: TZQuery
    Connection = fmMenu.zcnConexao
    SQL.Strings = (
      
        'SELECT * FROM solucao WHERE CodigoSolicitacoesMudancas = :Codigo' +
        'SolicitacoesMudancas')
    Params = <
      item
        DataType = ftString
        Name = 'CodigoSolicitacoesMudancas'
        ParamType = ptInput
      end>
    Left = 72
    Top = 560
    ParamData = <
      item
        DataType = ftString
        Name = 'CodigoSolicitacoesMudancas'
        ParamType = ptInput
      end>
    object tabTotalHorasSolucaoCodigoSolucao: TFloatField
      FieldName = 'CodigoSolucao'
      Required = True
    end
    object tabTotalHorasSolucaoCodigoSolicitacoesMudancas: TFloatField
      FieldName = 'CodigoSolicitacoesMudancas'
    end
    object dfdTotalHorasSolucaoData: TDateField
      FieldName = 'Data'
    end
    object tfdTotalHorasSolucaoHoraInicial: TTimeField
      FieldName = 'HoraInicial'
    end
    object tfdTotalHorasSolucaoHoraFinal: TTimeField
      FieldName = 'HoraFinal'
    end
    object tfdTotal: TTimeField
      FieldName = 'Total'
    end
    object strngfldTotalHorasSolucaoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 500
    end
  end
  object tabSolucaoCorrido: TZQuery
    Connection = fmMenu.zcnConexao
    AfterPost = tabSolucaoCorridoAfterPost
    AfterDelete = tabSolucaoCorridoAfterDelete
    OnNewRecord = tabSolucaoCorridoNewRecord
    SQL.Strings = (
      'select * from solucao')
    Params = <>
    Left = 64
    Top = 224
    object tabSolucaoCorridoCodigoSolucao: TFloatField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CodigoSolucao'
      Required = True
    end
    object tabSolucaoCorridoCodigoSolicitacoesMudancas: TFloatField
      DisplayLabel = 'Solicita'#231#227'oMudan'#231'a'
      FieldName = 'CodigoSolicitacoesMudancas'
    end
    object dfdSolucaoCorridoData: TDateField
      FieldName = 'Data'
    end
    object tfdSolucaoCorridoHoraInicial: TTimeField
      DisplayLabel = 'Hora Inicial'
      FieldName = 'HoraInicial'
    end
    object tfdSolucaoCorridoHoraFinal: TTimeField
      DisplayLabel = 'Hora Final'
      FieldName = 'HoraFinal'
    end
    object tfdSolucaoCorridoTotal: TTimeField
      FieldName = 'Total'
    end
    object strngfldSolucaoCorridoDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Descricao'
      Size = 500
    end
  end
  object dtsSolucaoCorrido: TDataSource
    DataSet = tabSolucaoCorrido
    OnDataChange = dtsBaseDataChange
    Left = 64
    Top = 272
  end
  object aclSolucaoCorrido: TActionList
    Left = 64
    Top = 320
    object dsiInsertCorrido: TDataSetInsert
      Category = 'Dataset'
      Caption = 'dsiInsertCorrido'
    end
    object dsdDeleteCorrido: TDataSetDelete
      Category = 'Dataset'
      Caption = 'dsdDeleteCorrido'
    end
    object dseEditCorrido: TDataSetEdit
      Category = 'Dataset'
      Caption = 'dseEditCorrido'
    end
    object dspPostCorrido: TDataSetPost
      Category = 'Dataset'
      Caption = 'dspPostCorrido'
    end
    object dscCancelCorrido: TDataSetCancel
      Category = 'Dataset'
      Caption = 'dscCancelCorrido'
    end
  end
  object stl2: TcxStyleRepository
    Left = 712
    Top = 144
    PixelsPerInch = 96
    object cst2: TcxStyle
    end
  end
  object stlCores: TcxStyleRepository
    Left = 144
    Top = 224
    PixelsPerInch = 96
    object cstCorBranca: TcxStyle
      AssignedValues = [svColor]
      Color = clWindow
    end
    object cstCorAzul: TcxStyle
      AssignedValues = [svColor]
      Color = 16775664
    end
  end
  object crpImprimir: TdxComponentPrinter
    CurrentLink = grlSolicitacaoMudanca
    Version = 0
    Left = 448
    Top = 224
    object grlSolicitacaoMudanca: TdxGridReportLink
      Component = dbgSolicitacaoMudanca
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 6350
      PrinterPage.GrayShading = True
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.PageSize.X = 210000
      PrinterPage.PageSize.Y = 297000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.Caption = 'Solicita'#231#245'es de Mudan'#231'a'
      ReportDocument.CreationDate = 41115.391151863430000000
      ReportDocument.Creator = 'F'#225'bio'
      BuiltInReportLink = True
    end
    object grlTodasSolucoes: TdxGridReportLink
      Component = dbgTodasSolucoes
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 6350
      PrinterPage.GrayShading = True
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.PageSize.X = 210000
      PrinterPage.PageSize.Y = 297000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      BuiltInReportLink = True
    end
  end
end

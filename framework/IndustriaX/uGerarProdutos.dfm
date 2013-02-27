inherited fmGerarProdutos: TfmGerarProdutos
  Left = 233
  Top = 153
  Caption = 'Gerar Produtos'
  ClientHeight = 414
  ClientWidth = 633
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel [0]
    Left = 8
    Top = 8
    Width = 44
    Height = 13
    Caption = 'N'#186' Molde'
  end
  object Label4: TLabel [1]
    Left = 123
    Top = 8
    Width = 29
    Height = 13
    Caption = 'Molde'
  end
  object pnlPasso1: TPanel [2]
    Left = 8
    Top = 51
    Width = 617
    Height = 347
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 37
      Height = 13
      Caption = 'Produto'
    end
    object Label5: TLabel
      Left = 8
      Top = 51
      Width = 29
      Height = 13
      Caption = 'Grupo'
    end
    object Label6: TLabel
      Left = 169
      Top = 51
      Width = 35
      Height = 13
      Caption = 'Modelo'
    end
    object Label7: TLabel
      Left = 328
      Top = 51
      Width = 40
      Height = 13
      Caption = 'Unidade'
    end
    object Label8: TLabel
      Left = 8
      Top = 96
      Width = 24
      Height = 13
      Caption = 'NCM'
    end
    object Label9: TLabel
      Left = 344
      Top = 136
      Width = 58
      Height = 13
      Caption = 'Observa'#231#227'o'
    end
    object Label10: TLabel
      Left = 136
      Top = 96
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object Label11: TLabel
      Left = 488
      Top = 96
      Width = 102
      Height = 13
      Caption = 'Refer'#234'ncia do Cliente'
    end
    object Label12: TLabel
      Left = 8
      Top = 136
      Width = 27
      Height = 13
      Caption = 'Cores'
    end
    object Label2: TLabel
      Left = 8
      Top = 312
      Width = 231
      Height = 23
      Caption = 'Caracter'#237'stica dos Produtos.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGreen
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object edtDescricaoProduto: TEdit
      Left = 8
      Top = 24
      Width = 598
      Height = 21
      TabOrder = 0
    end
    object dbgCores: TDBGrid
      Left = 8
      Top = 152
      Width = 329
      Height = 145
      DataSource = dtsAuxCores
      TabOrder = 12
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = dbgCoresCellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Selecionar'
          Width = 63
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Cor'
          Width = 154
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Abreviado'
          Width = 63
          Visible = True
        end>
    end
    object ckbProdutoAcabado: TCheckBox
      Left = 496
      Top = 68
      Width = 106
      Height = 17
      Caption = 'Produto Acabado'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
    object edtGrupo: TDBLookupComboBox
      Left = 8
      Top = 66
      Width = 145
      Height = 21
      KeyField = 'Codigo'
      ListField = 'Descricao'
      ListSource = dtsGrupos
      TabOrder = 1
    end
    object edtModelo: TDBLookupComboBox
      Left = 169
      Top = 66
      Width = 145
      Height = 21
      KeyField = 'Codigo'
      ListField = 'Descricao'
      ListSource = dtsModelos
      TabOrder = 2
    end
    object edtUnidade: TDBLookupComboBox
      Left = 328
      Top = 66
      Width = 145
      Height = 21
      KeyField = 'Codigo'
      ListField = 'Descricao'
      ListSource = dtsUnidades
      TabOrder = 3
    end
    object edtNCM: TEdit
      Left = 8
      Top = 112
      Width = 113
      Height = 21
      TabOrder = 5
    end
    object edtObservacao: TMemo
      Left = 344
      Top = 152
      Width = 261
      Height = 145
      TabOrder = 10
    end
    object edtCodigoCliente: TEdit
      Left = 136
      Top = 112
      Width = 57
      Height = 21
      TabOrder = 6
      OnChange = edtCodigoClienteChange
      OnExit = edtCodigoClienteExit
    end
    object edtNomeCliente: TEdit
      Left = 228
      Top = 112
      Width = 249
      Height = 21
      Enabled = False
      TabOrder = 8
    end
    object edtReferenciaCliente: TEdit
      Left = 488
      Top = 112
      Width = 117
      Height = 21
      TabOrder = 9
      OnExit = edtReferenciaClienteExit
    end
    object btnLocalizarCliente: TBitBtn
      Left = 196
      Top = 112
      Width = 29
      Height = 22
      TabOrder = 7
      OnClick = btnLocalizarClienteClick
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
    object btnPasso1Proximo: TButton
      Left = 531
      Top = 309
      Width = 75
      Height = 25
      Caption = 'Pr'#243'ximo >'
      TabOrder = 11
      OnClick = btnPasso1ProximoClick
    end
    object btnAddCor: TButton
      Left = 531
      Top = 5
      Width = 75
      Height = 19
      Caption = 'Adicionar Cor'
      TabOrder = 13
      OnClick = btnAddCorClick
    end
  end
  object edtNMolde: TEdit [3]
    Left = 8
    Top = 24
    Width = 105
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object edtMolde: TEdit [4]
    Left = 123
    Top = 24
    Width = 502
    Height = 21
    Enabled = False
    TabOrder = 2
  end
  object pnlPasso2: TPanel [5]
    Left = -400
    Top = 439
    Width = 617
    Height = 347
    TabOrder = 3
    object Label13: TLabel
      Left = 8
      Top = 312
      Width = 234
      Height = 23
      Caption = 'Tabelas de Pre'#231'os a Definir.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGreen
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object btnPasso2Proximo: TButton
      Left = 531
      Top = 309
      Width = 75
      Height = 25
      Caption = 'Pr'#243'ximo >'
      TabOrder = 0
      OnClick = btnPasso2ProximoClick
    end
    object dbgTabelasPreco: TDBGrid
      Left = 8
      Top = 8
      Width = 598
      Height = 295
      DataSource = dtsAuxTiposTabela
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = dbgTabelasPrecoCellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Selecionar'
          Width = 74
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Codigo'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Descricao'
          Width = 401
          Visible = True
        end>
    end
    object btnPasso2Anterior: TButton
      Left = 451
      Top = 309
      Width = 75
      Height = 25
      Caption = '< Anterior'
      TabOrder = 2
      OnClick = btnPasso2AnteriorClick
    end
  end
  object pnlPasso3: TPanel [6]
    Left = -408
    Top = 534
    Width = 617
    Height = 347
    TabOrder = 4
    object Label14: TLabel
      Left = 8
      Top = 312
      Width = 227
      Height = 23
      Caption = 'Definir Pre'#231'o dos Produtos.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGreen
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object btnPasso3Proximo: TButton
      Left = 531
      Top = 309
      Width = 75
      Height = 25
      Caption = 'Pr'#243'ximo >'
      TabOrder = 0
      OnClick = btnPasso3ProximoClick
    end
    object dbgPrecoProdutos: TDBGrid
      Left = 8
      Top = 8
      Width = 598
      Height = 295
      DataSource = dtsAuxTabelaPreco
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'CodigoProduto'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Tabela'
          ReadOnly = True
          Width = 298
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Valor'
          Width = 129
          Visible = True
        end>
    end
    object btnPasso3Anterior: TButton
      Left = 451
      Top = 309
      Width = 75
      Height = 25
      Caption = '< Anterior'
      TabOrder = 2
      OnClick = btnPasso3AnteriorClick
    end
  end
  object pnlPasso4: TPanel [7]
    Left = 280
    Top = 446
    Width = 617
    Height = 347
    TabOrder = 5
    object Label15: TLabel
      Left = 8
      Top = 312
      Width = 299
      Height = 23
      Caption = 'Confirma'#231#227'o dos Produtos Gerados.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGreen
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object btnPasso4Gravar: TButton
      Left = 531
      Top = 309
      Width = 75
      Height = 25
      Caption = 'Gravar'
      TabOrder = 0
      OnClick = btnPasso4GravarClick
    end
    object btnPaso4Anterior: TButton
      Left = 451
      Top = 309
      Width = 75
      Height = 25
      Caption = '< Anterior'
      TabOrder = 1
      OnClick = btnPaso4AnteriorClick
    end
    object dbgProdutosGerados: TDBGrid
      Left = 8
      Top = 8
      Width = 601
      Height = 297
      DataSource = dtsAuxProdutos
      TabOrder = 2
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
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Descricao'
          Title.Caption = 'Descri'#231#227'o'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Cor'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CodigoCor'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CodigoGrupo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CodigoModelo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CodigoUnidade'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ProdutoAcabado'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NCM'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CodigoCLiente'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ReferenciaCliente'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Observacoes'
          Visible = True
        end>
    end
  end
  inherited popGrid: TPopupMenu
    Left = 760
    Top = 16
  end
  object tabCores: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 672
    Top = 24
  end
  object dtsAuxCores: TDataSource
    AutoEdit = False
    DataSet = tabAuxCores
    Left = 712
    Top = 75
  end
  object tabAuxCores: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 640
    Top = 75
    object tabAuxCoresSelecionar: TBooleanField
      FieldName = 'Selecionar'
    end
    object tabAuxCoresCor: TStringField
      FieldName = 'Cor'
      Size = 50
    end
    object tabAuxCoresAbreviado: TStringField
      FieldName = 'Abreviado'
      Size = 3
    end
    object tabAuxCoresCodigoCor: TFloatField
      FieldName = 'CodigoCor'
    end
  end
  object tabAuxProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 640
    Top = 123
    object tabAuxProdutosCodigoProduto: TStringField
      FieldName = 'CodigoProduto'
    end
    object tabAuxProdutosDescricao: TStringField
      FieldName = 'Descricao'
      Size = 60
    end
    object tabAuxProdutosCor: TStringField
      FieldName = 'Cor'
      Size = 50
    end
    object tabAuxProdutosCodigoCor: TFloatField
      FieldName = 'CodigoCor'
    end
    object tabAuxProdutosCodigoGrupo: TFloatField
      FieldName = 'CodigoGrupo'
    end
    object tabAuxProdutosCodigoModelo: TFloatField
      FieldName = 'CodigoModelo'
    end
    object tabAuxProdutosCodigoUnidade: TFloatField
      FieldName = 'CodigoUnidade'
    end
    object tabAuxProdutosProdutoAcabado: TIntegerField
      FieldName = 'ProdutoAcabado'
    end
    object tabAuxProdutosNCM: TStringField
      FieldName = 'NCM'
    end
    object tabAuxProdutosCodigoCLiente: TFloatField
      FieldName = 'CodigoCLiente'
    end
    object tabAuxProdutosReferenciaCliente: TStringField
      FieldName = 'ReferenciaCliente'
    end
    object tabAuxProdutosObservacoes: TStringField
      FieldName = 'Observacoes'
      Size = 255
    end
    object tabAuxProdutosAtualizaPreco: TBooleanField
      FieldName = 'AtualizaPreco'
    end
  end
  object dtsAuxProdutos: TDataSource
    AutoEdit = False
    DataSet = tabAuxProdutos
    Left = 712
    Top = 123
  end
  object tabGrupos: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 640
    Top = 176
  end
  object dtsGrupos: TDataSource
    AutoEdit = False
    DataSet = tabGrupos
    Left = 712
    Top = 176
  end
  object tabModelos: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 640
    Top = 232
  end
  object dtsModelos: TDataSource
    AutoEdit = False
    DataSet = tabModelos
    Left = 712
    Top = 232
  end
  object tabUnidades: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 640
    Top = 288
  end
  object dtsUnidades: TDataSource
    AutoEdit = False
    DataSet = tabUnidades
    Left = 712
    Top = 288
  end
  object tabChecagens: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 816
    Top = 72
  end
  object dtsAuxTiposTabela: TDataSource
    AutoEdit = False
    DataSet = tabAuxTiposTabela
    Left = 736
    Top = 339
  end
  object tabAuxTiposTabela: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 640
    Top = 339
    object tabAuxTiposTabelaSelecionar: TBooleanField
      FieldName = 'Selecionar'
    end
    object tabAuxTiposTabelaCodigo: TFloatField
      FieldName = 'Codigo'
    end
    object tabAuxTiposTabelaDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
  end
  object tabTiposTabelasPreco: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 816
    Top = 128
  end
  object dtsAuxTabelaPreco: TDataSource
    DataSet = tabAuxTabelaPreco
    Left = 736
    Top = 387
  end
  object tabAuxTabelaPreco: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 640
    Top = 387
    object tabAuxTabelaPrecoTabela: TStringField
      FieldName = 'Tabela'
      Size = 40
    end
    object tabAuxTabelaPrecoValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tabAuxTabelaPrecoCodigoTabela: TFloatField
      FieldName = 'CodigoTabela'
    end
    object tabAuxTabelaPrecoCodigoProduto: TStringField
      FieldName = 'CodigoProduto'
    end
  end
end

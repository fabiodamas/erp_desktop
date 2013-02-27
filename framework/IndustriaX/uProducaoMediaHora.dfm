object fmProducaoMediaHora: TfmProducaoMediaHora
  Left = 221
  Top = 130
  Width = 800
  Height = 540
  Caption = 'Produ'#231#227'o M'#233'dia por Hora'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 461
    Width = 784
    Height = 41
    Align = alBottom
    TabOrder = 0
    object btnColetarMedias: TButton
      Left = 8
      Top = 8
      Width = 99
      Height = 25
      Caption = 'Visualizar M'#233'dias'
      TabOrder = 0
      OnClick = btnColetarMediasClick
    end
    object rdgProdutos: TRadioGroup
      Left = 260
      Top = 4
      Width = 306
      Height = 32
      Caption = 'Produtos'
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        'N'#227'o Terminados'
        'Terminados'
        'Todos')
      TabOrder = 1
    end
    object btnInserirMedias: TButton
      Left = 112
      Top = 8
      Width = 121
      Height = 25
      Caption = 'Inserir no Roteiro'
      TabOrder = 2
      OnClick = btnInserirMediasClick
    end
  end
  object dbgPainel: TcxGrid
    Left = 0
    Top = 105
    Width = 784
    Height = 316
    Align = alClient
    TabOrder = 1
    object tvwPainel: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dtsPainel
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      object clmCodigoProduto: TcxGridDBColumn
        Caption = 'C'#243'd. Produto'
        DataBinding.FieldName = 'CodigoProduto'
        Width = 67
      end
      object clmResponsavel1: TcxGridDBColumn
        Caption = 'Respons'#225'vel 1'
        DataBinding.FieldName = 'nome1'
        Width = 157
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
        Width = 97
      end
      object clmQuantidade: TcxGridDBColumn
        DataBinding.FieldName = 'Quantidade'
        Width = 87
      end
      object clmStatus: TcxGridDBColumn
        Caption = 'Dura'#231#227'o'
        DataBinding.FieldName = 'Status'
        Width = 81
      end
      object clmMediaHora: TcxGridDBColumn
        Caption = 'M'#233'dia por Hora'
        DataBinding.FieldName = 'MediaHora'
        Width = 94
      end
    end
    object lvlPainel: TcxGridLevel
      GridView = tvwPainel
    end
  end
  object mmo1: TMemo
    Left = 383
    Top = 192
    Width = 185
    Height = 89
    TabOrder = 2
    Visible = False
  end
  object pnl2: TPanel
    Left = 0
    Top = 0
    Width = 784
    Height = 105
    Align = alTop
    TabOrder = 3
    object lbl2: TLabel
      Left = 8
      Top = 7
      Width = 73
      Height = 13
      Caption = 'C'#243'digo Produto'
    end
    object lbl3: TLabel
      Left = 124
      Top = 7
      Width = 37
      Height = 13
      Caption = 'Produto'
    end
    object lbl1: TLabel
      Left = 8
      Top = 52
      Width = 91
      Height = 13
      Caption = 'C'#243'digo Funcion'#225'rio'
    end
    object lbl4: TLabel
      Left = 124
      Top = 52
      Width = 55
      Height = 13
      Caption = 'Funcion'#225'rio'
    end
    object edtCodigoProduto: TEdit
      Left = 8
      Top = 23
      Width = 76
      Height = 21
      TabOrder = 0
      OnChange = edtCodigoProdutoChange
      OnKeyPress = edtCodigoProdutoKeyPress
    end
    object btnProdutoLocalizar: TBitBtn
      Left = 89
      Top = 23
      Width = 29
      Height = 22
      TabOrder = 1
      OnClick = btnProdutoLocalizarClick
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
    object edtDescricaoProdutos: TEdit
      Left = 124
      Top = 23
      Width = 299
      Height = 21
      Enabled = False
      TabOrder = 2
    end
    object edtCodigoFuncionario: TEdit
      Left = 8
      Top = 68
      Width = 76
      Height = 21
      TabOrder = 3
      OnChange = edtCodigoFuncionarioChange
      OnKeyPress = edtCodigoProdutoKeyPress
    end
    object btnFuncionarioLocalizar: TBitBtn
      Left = 89
      Top = 68
      Width = 29
      Height = 22
      TabOrder = 4
      OnClick = btnFuncionarioLocalizarClick
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
    object edtFuncionario: TEdit
      Left = 124
      Top = 68
      Width = 299
      Height = 21
      Enabled = False
      TabOrder = 5
    end
    object btn3: TButton
      Left = 536
      Top = 24
      Width = 121
      Height = 25
      Caption = 'Exportar para Excel'
      TabOrder = 6
      Visible = False
      OnClick = btn3Click
    end
  end
  object pbrBarra: TcxProgressBar
    Left = 0
    Top = 421
    Align = alBottom
    Properties.PeakValue = 50.000000000000000000
    TabOrder = 4
    Width = 784
  end
  object pnlBarra: TPanel
    Left = 0
    Top = 442
    Width = 784
    Height = 19
    Align = alBottom
    TabOrder = 5
  end
  object tabRoteiro: TZQuery
    Connection = fmMenu.zcnConexao
    SQL.Strings = (
      ' SELECT                           '
      '     rp.OrdemProducao,                           '
      '     rp.CodigoProduto,                           '
      '     rp.PeriodoInicial,                           '
      '     rp.PeriodoFinal,                           '
      '     rp.Perdas,                           '
      '     rp.CodigoSetor,                           '
      '     rp.Quantidade,                           '
      '     rp.Quantidade as Total,                           '
      '     rp.CodigoResponsavel1,                           '
      '     rp.CodigoResponsavel2,                           '
      '     f1.nome as nome1,                           '
      '     f2.nome as nome2,                           '
      '     f2.nome as Status,                           '
      '     ID as MediaHora,                             '
      '     genericos.Descricao AS Setor,                           '
      
        '    TIMEDIFF(rp.PeriodoFinal, rp.PeriodoInicial) AS Duracao     ' +
        '                    '
      ' FROM                           '
      '     roteiro_produtivo AS rp                           '
      '         LEFT JOIN                           '
      
        '     genericos ON genericos.Codigo = rp.CodigoSetor             ' +
        '              '
      '         LEFT JOIN                           '
      
        '     funcionarios as f1 ON f1.Codigo = rp.CodigoResponsavel1    ' +
        '                       '
      '         LEFT JOIN                           '
      
        '     funcionarios as f2 ON f2.Codigo = rp.CodigoResponsavel2    ' +
        '                       '
      ' WHERE    rp.Quantidade <> 0  and                    '
      '     exists( SELECT                           '
      '             op.OrdemProducao                           '
      '         FROM                           '
      '             ordem_producao AS op                           '
      
        '         WHERE  rp.PeriodoFinal is not null and                 ' +
        '       '
      ' op.DataTermino IS NOT NULL '
      '                 and rp.OrdemProducao = op.OrdemProducao   '
      '         )                        '
      'order by rp.CodigoProduto, rp.CodigoResponsavel1  ')
    Params = <>
    Left = 171
    Top = 160
  end
  object tabPainel: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 296
    Top = 160
    Data = {
      830100009619E0BD01000000180000001000000000000300000083010D4F7264
      656D50726F647563616F08000400000000000D436F6469676F50726F6475746F
      01004900000001000557494454480200020014000E506572696F646F496E6963
      69616C08000800000000000C506572696F646F46696E616C0800080000000000
      0650657264617308000400000000000B436F6469676F5365746F720800040000
      0000000A5175616E746964616465080004000000000005546F74616C08000400
      0000000012436F6469676F526573706F6E736176656C31080004000000000012
      436F6469676F526573706F6E736176656C320800040000000000056E6F6D6531
      0100490000000100055749445448020002003200056E6F6D6532010049000000
      0100055749445448020002003200065374617475730100490000000100055749
      445448020002003200094D65646961486F72610800040004000000055365746F
      720100490000000100055749445448020002003C00074475726163616F040007
      00020000000000}
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
    object tabPainelMediaHora: TFloatField
      FieldName = 'MediaHora'
    end
    object cdsPainelSetor: TStringField
      FieldName = 'Setor'
      Size = 60
    end
    object tfdPainelDuracao: TTimeField
      FieldName = 'Duracao'
      ReadOnly = True
    end
  end
  object dtsPainel: TDataSource
    DataSet = tabPainel
    Left = 352
    Top = 160
  end
  object tabChecagens: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 175
    Top = 261
  end
end

inherited fmFornecedores: TfmFornecedores
  Left = 231
  Top = 152
  Caption = 'Fornecedores'
  ClientHeight = 528
  ClientWidth = 604
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 6
    Width = 90
    Height = 13
    Caption = 'C'#243'digo Fornecedor'
  end
  object Label2: TLabel [1]
    Left = 128
    Top = 6
    Width = 71
    Height = 13
    Caption = 'Nome Fantasia'
  end
  inherited pnlBotoes: TPanel
    Top = 467
    Width = 604
    inherited btnLocalizar: TSpeedButton
      OnClick = btnLocalizarClick
    end
  end
  object edtNomeFantasia: TDBEdit [3]
    Left = 128
    Top = 22
    Width = 468
    Height = 21
    DataField = 'NomeFantasia'
    DataSource = dtsBase
    TabOrder = 2
  end
  object edtFornecedorCodigo: TEdit [4]
    Left = 8
    Top = 22
    Width = 110
    Height = 21
    TabOrder = 1
    OnKeyPress = edtFornecedorCodigoKeyPress
    OnKeyUp = edtFornecedorCodigoKeyUp
  end
  object pgcFornecedores: TPageControl [5]
    Left = 8
    Top = 49
    Width = 588
    Height = 414
    ActivePage = tbsGeral
    TabOrder = 3
    object tbsGeral: TTabSheet
      Caption = 'Geral'
      object Label3: TLabel
        Left = 8
        Top = 6
        Width = 63
        Height = 13
        Caption = 'Raz'#227'o Social'
      end
      object lblCnpjCpf: TLabel
        Left = 138
        Top = 54
        Width = 27
        Height = 13
        Caption = 'CNPJ'
      end
      object lblIeRg: TLabel
        Left = 370
        Top = 54
        Width = 87
        Height = 13
        Caption = 'Inscri'#231#227'o Estadual'
      end
      object Label4: TLabel
        Left = 8
        Top = 97
        Width = 29
        Height = 13
        Caption = 'Grupo'
      end
      object Label5: TLabel
        Left = 201
        Top = 97
        Width = 21
        Height = 13
        Caption = 'Tipo'
      end
      object Label6: TLabel
        Left = 397
        Top = 97
        Width = 30
        Height = 13
        Caption = 'Status'
      end
      object Label7: TLabel
        Left = 8
        Top = 268
        Width = 18
        Height = 13
        Caption = 'Site'
      end
      object Label8: TLabel
        Left = 197
        Top = 268
        Width = 76
        Height = 13
        Caption = 'E-mail NFe XML'
      end
      object Label9: TLabel
        Left = 386
        Top = 268
        Width = 83
        Height = 13
        Caption = 'E-mail NFe Danfe'
      end
      object edtRazaoSocial: TDBEdit
        Left = 8
        Top = 22
        Width = 563
        Height = 21
        DataField = 'RazaoSocial'
        DataSource = dtsBase
        TabOrder = 0
      end
      object edtCnpjCpf: TDBEdit
        Left = 138
        Top = 70
        Width = 200
        Height = 21
        DataField = 'CpfCnpj'
        DataSource = dtsBase
        TabOrder = 1
        OnExit = edtCnpjCpfExit
      end
      object edtIeRg: TDBEdit
        Left = 370
        Top = 70
        Width = 200
        Height = 21
        DataField = 'IERG'
        DataSource = dtsBase
        TabOrder = 2
      end
      object dbrTipoFornecedor: TDBRadioGroup
        Left = 8
        Top = 50
        Width = 124
        Height = 41
        Caption = 'Tipo'
        Columns = 2
        DataField = 'TipoFornecedor'
        DataSource = dtsBase
        Items.Strings = (
          'CNPJ'
          'CPF')
        TabOrder = 3
        Values.Strings = (
          '1'
          '0')
        OnClick = dbrTipoFornecedorClick
      end
      object edtGrupo: TDBLookupComboBox
        Left = 8
        Top = 113
        Width = 173
        Height = 21
        DataField = 'CodigoGrupo'
        DataSource = dtsBase
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsGrupos
        TabOrder = 4
      end
      object edtTipo: TDBLookupComboBox
        Left = 201
        Top = 113
        Width = 173
        Height = 21
        DataField = 'CodigoTipo'
        DataSource = dtsBase
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsTipos
        TabOrder = 5
      end
      object edtStatus: TDBLookupComboBox
        Left = 397
        Top = 113
        Width = 173
        Height = 21
        DataField = 'CodigoStatus'
        DataSource = dtsBase
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsStatus
        TabOrder = 6
      end
      object grbTelefones: TGroupBox
        Left = 8
        Top = 146
        Width = 563
        Height = 113
        Caption = 'Telefones'
        TabOrder = 7
        object Label14: TLabel
          Left = 16
          Top = 17
          Width = 51
          Height = 13
          Caption = 'Telefone 1'
        end
        object Label15: TLabel
          Left = 144
          Top = 17
          Width = 51
          Height = 13
          Caption = 'Telefone 2'
        end
        object Label16: TLabel
          Left = 304
          Top = 17
          Width = 51
          Height = 13
          Caption = 'Telefone 3'
        end
        object Label17: TLabel
          Left = 432
          Top = 17
          Width = 51
          Height = 13
          Caption = 'Telefone 4'
        end
        object Label18: TLabel
          Left = 16
          Top = 59
          Width = 26
          Height = 13
          Caption = 'Fax 1'
        end
        object Label19: TLabel
          Left = 144
          Top = 59
          Width = 26
          Height = 13
          Caption = 'Fax 2'
        end
        object Label20: TLabel
          Left = 304
          Top = 59
          Width = 41
          Height = 13
          Caption = 'Celular 1'
        end
        object Label21: TLabel
          Left = 432
          Top = 59
          Width = 41
          Height = 13
          Caption = 'Celular 2'
        end
        object edtTelefone1: TDBEdit
          Left = 16
          Top = 33
          Width = 113
          Height = 21
          DataField = 'Telefone1'
          DataSource = dtsBase
          TabOrder = 0
        end
        object edtTelefone2: TDBEdit
          Left = 144
          Top = 33
          Width = 113
          Height = 21
          DataField = 'Telefone2'
          DataSource = dtsBase
          TabOrder = 1
        end
        object edtTelefone3: TDBEdit
          Left = 304
          Top = 33
          Width = 113
          Height = 21
          DataField = 'Telefone3'
          DataSource = dtsBase
          TabOrder = 2
        end
        object edtTelefone4: TDBEdit
          Left = 432
          Top = 33
          Width = 113
          Height = 21
          DataField = 'Telefone4'
          DataSource = dtsBase
          TabOrder = 3
        end
        object edtFax1: TDBEdit
          Left = 16
          Top = 75
          Width = 113
          Height = 21
          DataField = 'Fax1'
          DataSource = dtsBase
          TabOrder = 4
        end
        object edtFax2: TDBEdit
          Left = 144
          Top = 75
          Width = 113
          Height = 21
          DataField = 'Fax2'
          DataSource = dtsBase
          TabOrder = 5
        end
        object edtCelular1: TDBEdit
          Left = 304
          Top = 75
          Width = 113
          Height = 21
          DataField = 'Celular1'
          DataSource = dtsBase
          TabOrder = 6
        end
        object edtCelular2: TDBEdit
          Left = 432
          Top = 75
          Width = 113
          Height = 21
          DataField = 'Celular2'
          DataSource = dtsBase
          TabOrder = 7
        end
      end
      object edtSite: TDBEdit
        Left = 8
        Top = 284
        Width = 185
        Height = 21
        DataField = 'Site'
        DataSource = dtsBase
        TabOrder = 8
        OnClick = edtSiteClick
      end
      object edtEmailNFeXML: TDBEdit
        Left = 197
        Top = 284
        Width = 185
        Height = 21
        DataField = 'EmailNfeXML'
        DataSource = dtsBase
        TabOrder = 9
        OnClick = edtEmailNFeXMLClick
      end
      object edtEmailNFeDanfe: TDBEdit
        Left = 386
        Top = 284
        Width = 185
        Height = 21
        DataField = 'EmailNfeDanfe'
        DataSource = dtsBase
        TabOrder = 10
        OnClick = edtEmailNFeDanfeClick
      end
    end
    object tbsEnderecos: TTabSheet
      Caption = 'Endere'#231'os'
      ImageIndex = 1
      object grbEnderecoNormal: TGroupBox
        Left = 8
        Top = 2
        Width = 563
        Height = 124
        Caption = 'Endere'#231'o Normal'
        TabOrder = 0
        object Label26: TLabel
          Left = 8
          Top = 11
          Width = 19
          Height = 13
          Caption = 'Cep'
        end
        object Label27: TLabel
          Left = 8
          Top = 46
          Width = 37
          Height = 13
          Caption = 'Numero'
        end
        object Label29: TLabel
          Left = 159
          Top = 11
          Width = 46
          Height = 13
          Caption = 'Endere'#231'o'
        end
        object Label31: TLabel
          Left = 98
          Top = 46
          Width = 27
          Height = 13
          Caption = 'Bairro'
        end
        object Label32: TLabel
          Left = 343
          Top = 46
          Width = 64
          Height = 13
          Caption = 'Complemento'
        end
        object Label33: TLabel
          Left = 8
          Top = 82
          Width = 22
          Height = 13
          Caption = 'Pa'#237's'
        end
        object Label34: TLabel
          Left = 304
          Top = 82
          Width = 33
          Height = 13
          Caption = 'Cidade'
        end
        object Label28: TLabel
          Left = 184
          Top = 82
          Width = 33
          Height = 13
          Caption = 'Estado'
        end
        object edtCep: TDBEdit
          Left = 8
          Top = 25
          Width = 119
          Height = 21
          DataField = 'Cep'
          DataSource = dtsBase
          TabOrder = 0
          OnExit = edtCepExit
        end
        object edtNumero: TDBEdit
          Left = 8
          Top = 60
          Width = 81
          Height = 21
          DataField = 'Numero'
          DataSource = dtsBase
          TabOrder = 3
        end
        object edtEndereco: TDBEdit
          Left = 159
          Top = 25
          Width = 391
          Height = 21
          DataField = 'Endereco'
          DataSource = dtsBase
          TabOrder = 2
        end
        object btnLocalizaCep: TBitBtn
          Left = 128
          Top = 24
          Width = 29
          Height = 22
          TabOrder = 1
          OnClick = btnLocalizaCepClick
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
        object edtBairro: TDBEdit
          Left = 98
          Top = 60
          Width = 237
          Height = 21
          DataField = 'Bairro'
          DataSource = dtsBase
          TabOrder = 4
        end
        object edtComplemento: TDBEdit
          Left = 343
          Top = 60
          Width = 207
          Height = 21
          DataField = 'Complemento'
          DataSource = dtsBase
          TabOrder = 5
        end
        object edtPais: TDBLookupComboBox
          Left = 8
          Top = 96
          Width = 169
          Height = 21
          DataField = 'CodigoPais'
          DataSource = dtsBase
          KeyField = 'CodigoPais'
          ListField = 'Pais'
          ListSource = dtsPaises
          TabOrder = 6
        end
        object edtCidade: TDBLookupComboBox
          Left = 304
          Top = 96
          Width = 248
          Height = 21
          DataField = 'CodigoCidade'
          DataSource = dtsBase
          KeyField = 'CodigoCidade'
          ListField = 'Cidade'
          ListSource = dtsCidades
          TabOrder = 8
        end
        object edtEstado: TDBComboBox
          Left = 184
          Top = 96
          Width = 114
          Height = 21
          DataField = 'Estado'
          DataSource = dtsBase
          ItemHeight = 13
          Items.Strings = (
            'AC'
            'AL'
            'AM'
            'AP'
            'BA'
            'CE'
            'DF'
            'ES'
            'GO'
            'MA'
            'MG'
            'MS'
            'MT'
            'PA'
            'PB'
            'PE'
            'PI'
            'PR'
            'RJ'
            'RN'
            'RO'
            'RR'
            'RS'
            'SC'
            'SE'
            'SP'
            'TO')
          TabOrder = 7
        end
      end
      object grbEnderecoDeposito: TGroupBox
        Left = 8
        Top = 128
        Width = 563
        Height = 124
        Caption = 'Endere'#231'o Dep'#243'sito'
        TabOrder = 1
        object Label35: TLabel
          Left = 8
          Top = 11
          Width = 19
          Height = 13
          Caption = 'Cep'
        end
        object Label36: TLabel
          Left = 8
          Top = 46
          Width = 37
          Height = 13
          Caption = 'Numero'
        end
        object Label37: TLabel
          Left = 159
          Top = 11
          Width = 46
          Height = 13
          Caption = 'Endere'#231'o'
        end
        object Label38: TLabel
          Left = 98
          Top = 46
          Width = 27
          Height = 13
          Caption = 'Bairro'
        end
        object Label39: TLabel
          Left = 343
          Top = 46
          Width = 64
          Height = 13
          Caption = 'Complemento'
        end
        object Label40: TLabel
          Left = 8
          Top = 82
          Width = 22
          Height = 13
          Caption = 'Pa'#237's'
        end
        object Label41: TLabel
          Left = 304
          Top = 82
          Width = 33
          Height = 13
          Caption = 'Cidade'
        end
        object Label42: TLabel
          Left = 184
          Top = 82
          Width = 33
          Height = 13
          Caption = 'Estado'
        end
        object edtDepositoCep: TDBEdit
          Left = 8
          Top = 25
          Width = 119
          Height = 21
          DataField = 'DepositoCep'
          DataSource = dtsBase
          TabOrder = 0
          OnExit = edtDepositoCepExit
        end
        object edtDepositoNumero: TDBEdit
          Left = 8
          Top = 60
          Width = 81
          Height = 21
          DataField = 'DepositoNumero'
          DataSource = dtsBase
          TabOrder = 3
        end
        object edtDepositoEndereco: TDBEdit
          Left = 159
          Top = 25
          Width = 391
          Height = 21
          DataField = 'DepositoEndereco'
          DataSource = dtsBase
          TabOrder = 2
        end
        object btnDepositoLocalizaCep: TBitBtn
          Left = 128
          Top = 24
          Width = 29
          Height = 22
          TabOrder = 1
          OnClick = btnDepositoLocalizaCepClick
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
        object edtDepositoBairro: TDBEdit
          Left = 98
          Top = 60
          Width = 237
          Height = 21
          DataField = 'DepositoBairro'
          DataSource = dtsBase
          TabOrder = 4
        end
        object edtDepositoComplemento: TDBEdit
          Left = 343
          Top = 60
          Width = 207
          Height = 21
          DataField = 'DepositoComplemento'
          DataSource = dtsBase
          TabOrder = 5
        end
        object edtDepositoPais: TDBLookupComboBox
          Left = 8
          Top = 96
          Width = 169
          Height = 21
          DataField = 'DepositoCodigoPais'
          DataSource = dtsBase
          KeyField = 'CodigoPais'
          ListField = 'Pais'
          ListSource = dtsPaises
          TabOrder = 6
        end
        object edtDepositoCidade: TDBLookupComboBox
          Left = 304
          Top = 96
          Width = 248
          Height = 21
          DataField = 'DepositoCodigoCidade'
          DataSource = dtsBase
          KeyField = 'CodigoCidade'
          ListField = 'Cidade'
          ListSource = dtsCidades
          TabOrder = 8
        end
        object edtDepositoEstado: TDBComboBox
          Left = 184
          Top = 96
          Width = 114
          Height = 21
          DataField = 'DepositoEstado'
          DataSource = dtsBase
          ItemHeight = 13
          Items.Strings = (
            'AC'
            'AL'
            'AM'
            'AP'
            'BA'
            'CE'
            'DF'
            'ES'
            'GO'
            'MA'
            'MG'
            'MS'
            'MT'
            'PA'
            'PB'
            'PE'
            'PI'
            'PR'
            'RJ'
            'RN'
            'RO'
            'RR'
            'RS'
            'SC'
            'SE'
            'SP'
            'TO')
          TabOrder = 7
        end
        object btnCopiarDeEndNormalParaDeposito: TBitBtn
          Left = 498
          Top = 6
          Width = 29
          Height = 20
          TabOrder = 9
          OnClick = btnCopiarDeEndNormalParaDepositoClick
          Glyph.Data = {
            36060000424D3606000000000000360400002800000020000000100000000100
            08000000000000020000120B0000120B0000000100000000000000000000FFFF
            FF00FF00FF0096351100DCD9D800752E11008A3715007D321300783012006528
            0F00893615007B311300762F12006628100065281000692A11007E3313006B2D
            12007B34160099411500A6420C009844100099461100984411009A4713009745
            130095461600BD580B00BD580C00BD590C00BC580C00BB570C00BF5A0D00B857
            0F00FEF0E500E97F1E00FED9B400FEDEBD00FEEFE000FEF0E200FEF6EE00FEF7
            F000FEF8F200FEFCFA00FED3A500FEE0BF00FEE3C600FEE5CA00FEE6CB00FEEA
            D400FEEBD700FEEEDD00DCCFC100FEF4E900FEE9D100FEF3E600DCD7D100DCD4
            CA00FEFBF700035A050010A7210012AA240015AD290018B22F001DB7370021BC
            3F0022BC3F0027C146002BC64E002FCB560033CF5B0033CF5C0035D1600000BD
            FF00FEFEFE00DCDCDC00FFFFFF00000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
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
            023B020202020202020202020202020202480202020202020202020202020202
            3B483B02020202020202020202020202483448020202020202020A070B0B0B3B
            4848483B0B0B0B100602484848484848343434484848484848020F2732303B48
            484846453B2C2C2C0802484B4B4B4834343434344804040448020E28223B4847
            45444341403B2C2C0C0248224B483434343434343448040448020D033B3B3B3B
            42403F3B3B3B3B030C02483448484848343434484848483448020D494949493B
            3E3D3C3B494949490C024834343434483434344834343434480209494949493B
            3E3E3E3B494949490C024834343434483434344834343434480209030303033B
            3B3B3B3B030303030C02483434343448484848483434343448020D4A4A4A4A4A
            3A293733362E25240C0248222222222222224B4B4B4B4B4B4802094A4A4A4A4A
            4A2B2A3526312F2D05024822222222222222224B4B4B4B4B4802114B4B4B4B4B
            4B4B4B4B043839341202484B4B4B4B4B4B4B4B4B4B4B4B044802131615151515
            151517181618191A0C0234343434343434343434343434343402132323232323
            2323232323232323140234343434343434343434343434343402021E1C1C1C1C
            1C1C1D201B201F21020202343434343434343434343434340202020202020202
            0202020202020202020202020202020202020202020202020202}
          NumGlyphs = 2
        end
      end
      object grbEnderecoCorrespondencia: TGroupBox
        Left = 8
        Top = 254
        Width = 563
        Height = 124
        Caption = 'Endere'#231'o Correspond'#234'ncia'
        TabOrder = 2
        object Label43: TLabel
          Left = 8
          Top = 11
          Width = 19
          Height = 13
          Caption = 'Cep'
        end
        object Label44: TLabel
          Left = 8
          Top = 46
          Width = 37
          Height = 13
          Caption = 'Numero'
        end
        object Label45: TLabel
          Left = 159
          Top = 11
          Width = 46
          Height = 13
          Caption = 'Endere'#231'o'
        end
        object Label46: TLabel
          Left = 98
          Top = 46
          Width = 27
          Height = 13
          Caption = 'Bairro'
        end
        object Label47: TLabel
          Left = 343
          Top = 46
          Width = 64
          Height = 13
          Caption = 'Complemento'
        end
        object Label48: TLabel
          Left = 8
          Top = 82
          Width = 22
          Height = 13
          Caption = 'Pa'#237's'
        end
        object Label49: TLabel
          Left = 304
          Top = 82
          Width = 33
          Height = 13
          Caption = 'Cidade'
        end
        object Label50: TLabel
          Left = 184
          Top = 82
          Width = 33
          Height = 13
          Caption = 'Estado'
        end
        object edtCorrespondenciaCep: TDBEdit
          Left = 8
          Top = 25
          Width = 119
          Height = 21
          DataField = 'CorrespoCep'
          DataSource = dtsBase
          TabOrder = 0
          OnExit = edtCorrespondenciaCepExit
        end
        object edtCorrespondenciaNumero: TDBEdit
          Left = 8
          Top = 60
          Width = 81
          Height = 21
          DataField = 'CorrespoNumero'
          DataSource = dtsBase
          TabOrder = 3
        end
        object edtCorrespondenciaEndereco: TDBEdit
          Left = 159
          Top = 25
          Width = 391
          Height = 21
          DataField = 'CorrespoEndereco'
          DataSource = dtsBase
          TabOrder = 2
        end
        object btnCorrespondenciaLocalizaCep: TBitBtn
          Left = 128
          Top = 24
          Width = 29
          Height = 22
          TabOrder = 1
          OnClick = btnCorrespondenciaLocalizaCepClick
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
        object edtCorrespondenciaBairro: TDBEdit
          Left = 98
          Top = 60
          Width = 237
          Height = 21
          DataField = 'CorrespoBairro'
          DataSource = dtsBase
          TabOrder = 4
        end
        object edtCorrespondenciaComplemento: TDBEdit
          Left = 343
          Top = 60
          Width = 207
          Height = 21
          DataField = 'CorrespoComplemento'
          DataSource = dtsBase
          TabOrder = 5
        end
        object edtCorrespondenciaPais: TDBLookupComboBox
          Left = 8
          Top = 96
          Width = 169
          Height = 21
          DataField = 'CorrespoCodigoPais'
          DataSource = dtsBase
          KeyField = 'CodigoPais'
          ListField = 'Pais'
          ListSource = dtsPaises
          TabOrder = 6
        end
        object edtCorrespondenciaCidade: TDBLookupComboBox
          Left = 304
          Top = 96
          Width = 248
          Height = 21
          DataField = 'CorrespoCodigoCidade'
          DataSource = dtsBase
          KeyField = 'CodigoCidade'
          ListField = 'Cidade'
          ListSource = dtsCidades
          TabOrder = 8
        end
        object edtCorrespondenciaEstado: TDBComboBox
          Left = 184
          Top = 96
          Width = 114
          Height = 21
          DataField = 'CorrespoEstado'
          DataSource = dtsBase
          ItemHeight = 13
          Items.Strings = (
            'AC'
            'AL'
            'AM'
            'AP'
            'BA'
            'CE'
            'DF'
            'ES'
            'GO'
            'MA'
            'MG'
            'MS'
            'MT'
            'PA'
            'PB'
            'PE'
            'PI'
            'PR'
            'RJ'
            'RN'
            'RO'
            'RR'
            'RS'
            'SC'
            'SE'
            'SP'
            'TO')
          TabOrder = 7
        end
        object btnCopiarEndDepositoParaCorrespondencia: TBitBtn
          Left = 498
          Top = 6
          Width = 29
          Height = 20
          TabOrder = 9
          OnClick = btnCopiarEndDepositoParaCorrespondenciaClick
          Glyph.Data = {
            36060000424D3606000000000000360400002800000020000000100000000100
            08000000000000020000120B0000120B0000000100000000000000000000FFFF
            FF00FF00FF0096351100DCD9D800752E11008A3715007D321300783012006528
            0F00893615007B311300762F12006628100065281000692A11007E3313006B2D
            12007B34160099411500A6420C009844100099461100984411009A4713009745
            130095461600BD580B00BD580C00BD590C00BC580C00BB570C00BF5A0D00B857
            0F00FEF0E500E97F1E00FED9B400FEDEBD00FEEFE000FEF0E200FEF6EE00FEF7
            F000FEF8F200FEFCFA00FED3A500FEE0BF00FEE3C600FEE5CA00FEE6CB00FEEA
            D400FEEBD700FEEEDD00DCCFC100FEF4E900FEE9D100FEF3E600DCD7D100DCD4
            CA00FEFBF700035A050010A7210012AA240015AD290018B22F001DB7370021BC
            3F0022BC3F0027C146002BC64E002FCB560033CF5B0033CF5C0035D1600000BD
            FF00FEFEFE00DCDCDC00FFFFFF00000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
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
            023B020202020202020202020202020202480202020202020202020202020202
            3B483B02020202020202020202020202483448020202020202020A070B0B0B3B
            4848483B0B0B0B100602484848484848343434484848484848020F2732303B48
            484846453B2C2C2C0802484B4B4B4834343434344804040448020E28223B4847
            45444341403B2C2C0C0248224B483434343434343448040448020D033B3B3B3B
            42403F3B3B3B3B030C02483448484848343434484848483448020D494949493B
            3E3D3C3B494949490C024834343434483434344834343434480209494949493B
            3E3E3E3B494949490C024834343434483434344834343434480209030303033B
            3B3B3B3B030303030C02483434343448484848483434343448020D4A4A4A4A4A
            3A293733362E25240C0248222222222222224B4B4B4B4B4B4802094A4A4A4A4A
            4A2B2A3526312F2D05024822222222222222224B4B4B4B4B4802114B4B4B4B4B
            4B4B4B4B043839341202484B4B4B4B4B4B4B4B4B4B4B4B044802131615151515
            151517181618191A0C0234343434343434343434343434343402132323232323
            2323232323232323140234343434343434343434343434343402021E1C1C1C1C
            1C1C1D201B201F21020202343434343434343434343434340202020202020202
            0202020202020202020202020202020202020202020202020202}
          NumGlyphs = 2
        end
        object btnCopiarEndNormalParaCorrespondencia: TBitBtn
          Left = 469
          Top = 6
          Width = 29
          Height = 20
          TabOrder = 10
          OnClick = btnCopiarEndNormalParaCorrespondenciaClick
          Glyph.Data = {
            36060000424D3606000000000000360400002800000020000000100000000100
            08000000000000020000120B0000120B0000000100000000000000000000FFFF
            FF00FF00FF0096351100DCD9D800752E11008A3715007D321300783012006528
            0F00893615007B311300762F12006628100065281000692A11007E3313006B2D
            12007B34160099411500A6420C009844100099461100984411009A4713009745
            130095461600BD580B00BD580C00BD590C00BC580C00BB570C00BF5A0D00B857
            0F00FEF0E500E97F1E00FED9B400FEDEBD00FEEFE000FEF0E200FEF6EE00FEF7
            F000FEF8F200FEFCFA00FED3A500FEE0BF00FEE3C600FEE5CA00FEE6CB00FEEA
            D400FEEBD700FEEEDD00DCCFC100FEF4E900FEE9D100FEF3E600DCD7D100DCD4
            CA00FEFBF700035A050010A7210012AA240015AD290018B22F001DB7370021BC
            3F0022BC3F0027C146002BC64E002FCB560033CF5B0033CF5C0035D1600000BD
            FF00FEFEFE00DCDCDC00FFFFFF00000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
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
            023B020202020202020202020202020202480202020202020202020202020202
            3B483B02020202020202020202020202483448020202020202020A070B0B0B3B
            4848483B0B0B0B100602484848484848343434484848484848020F2732303B48
            484846453B2C2C2C0802484B4B4B4834343434344804040448020E28223B4847
            45444341403B2C2C0C0248224B483434343434343448040448020D033B3B3B3B
            42403F3B3B3B3B030C02483448484848343434484848483448020D494949493B
            3E3D3C3B494949490C024834343434483434344834343434480209494949493B
            3E3E3E3B494949490C024834343434483434344834343434480209030303033B
            3B3B3B3B030303030C02483434343448484848483434343448020D4A4A4A4A4A
            3A293733362E25240C0248222222222222224B4B4B4B4B4B4802094A4A4A4A4A
            4A2B2A3526312F2D05024822222222222222224B4B4B4B4B4802114B4B4B4B4B
            4B4B4B4B043839341202484B4B4B4B4B4B4B4B4B4B4B4B044802131615151515
            151517181618191A0C0234343434343434343434343434343402132323232323
            2323232323232323140234343434343434343434343434343402021E1C1C1C1C
            1C1C1D201B201F21020202343434343434343434343434340202020202020202
            0202020202020202020202020202020202020202020202020202}
          NumGlyphs = 2
        end
      end
    end
    object tbsContatos: TTabSheet
      Caption = 'Contatos e E-mails'
      ImageIndex = 2
      object Label51: TLabel
        Left = 8
        Top = 6
        Width = 37
        Height = 13
        Caption = 'Contato'
      end
      object Label52: TLabel
        Left = 219
        Top = 6
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label53: TLabel
        Left = 355
        Top = 6
        Width = 28
        Height = 13
        Caption = 'E-mail'
      end
      object edtContato: TEdit
        Left = 8
        Top = 24
        Width = 171
        Height = 21
        TabOrder = 0
      end
      object btnContatoAdicionar: TBitBtn
        Left = 182
        Top = 23
        Width = 29
        Height = 22
        TabOrder = 1
        OnClick = btnContatoAdicionarClick
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
      object edtDescricao: TEdit
        Left = 219
        Top = 24
        Width = 134
        Height = 21
        TabOrder = 2
      end
      object edtEmail: TEdit
        Left = 355
        Top = 24
        Width = 185
        Height = 21
        TabOrder = 3
      end
      object btnEmailAdicionar: TBitBtn
        Left = 542
        Top = 23
        Width = 29
        Height = 22
        TabOrder = 4
        OnClick = btnEmailAdicionarClick
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
      object dbgContatos: TDBGrid
        Left = 8
        Top = 46
        Width = 563
        Height = 152
        DataSource = dtsFornecedoresContatos
        TabOrder = 5
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object dbgEmails: TDBGrid
        Left = 8
        Top = 219
        Width = 563
        Height = 146
        DataSource = dtsFornecedoresEmails
        TabOrder = 6
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object btnContatoRemover: TBitBtn
        Left = 547
        Top = 199
        Width = 24
        Height = 20
        TabOrder = 7
        OnClick = btnContatoRemoverClick
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
      object btnEmailRemover: TBitBtn
        Left = 547
        Top = 365
        Width = 24
        Height = 20
        TabOrder = 8
        OnClick = btnEmailRemoverClick
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
    object tbsObservacoes: TTabSheet
      Caption = 'Observa'#231#245'es'
      ImageIndex = 3
      object edtObservacoes: TDBMemo
        Left = 8
        Top = 8
        Width = 565
        Height = 371
        DataField = 'Observacao1'
        DataSource = dtsBase
        TabOrder = 0
      end
    end
    object tbsCompras: TTabSheet
      Caption = 'Compras'
      ImageIndex = 4
      object dbgCompras: TDBGrid
        Left = 8
        Top = 11
        Width = 563
        Height = 367
        DataSource = dtsCompras
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
  end
  inherited popGrid: TPopupMenu
    Left = 536
    Top = 464
  end
  inherited tabBase: TZQuery
    Connection = fmMenu.zcnConexao
    Left = 648
    Top = 8
  end
  inherited dtsBase: TDataSource
    OnDataChange = dtsBaseDataChange
    Left = 720
    Top = 8
  end
  inherited popOpcoes: TPopupMenu
    Left = 496
    Top = 464
    object Rtulo1: TMenuItem
      Caption = 'R'#243'tulo'
      OnClick = Rtulo1Click
    end
  end
  object tabGrupos: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 648
    Top = 64
  end
  object dtsGrupos: TDataSource
    AutoEdit = False
    DataSet = tabGrupos
    Left = 720
    Top = 64
  end
  object tabTipos: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 648
    Top = 120
  end
  object dtsTipos: TDataSource
    AutoEdit = False
    DataSet = tabTipos
    Left = 720
    Top = 120
  end
  object tabStatus: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 648
    Top = 176
  end
  object dtsStatus: TDataSource
    AutoEdit = False
    DataSet = tabStatus
    Left = 720
    Top = 176
  end
  object tabPaises: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 648
    Top = 232
  end
  object dtsPaises: TDataSource
    AutoEdit = False
    DataSet = tabPaises
    Left = 720
    Top = 232
  end
  object tabChecagens: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 648
    Top = 288
  end
  object dtsChecagens: TDataSource
    AutoEdit = False
    DataSet = tabChecagens
    Left = 720
    Top = 288
  end
  object tabCidades: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 648
    Top = 336
  end
  object dtsCidades: TDataSource
    AutoEdit = False
    DataSet = tabCidades
    Left = 720
    Top = 336
  end
  object tabFornecedoresContatos: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 648
    Top = 384
  end
  object dtsFornecedoresContatos: TDataSource
    AutoEdit = False
    DataSet = tabFornecedoresContatos
    Left = 720
    Top = 384
  end
  object tabFornecedoresEmails: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 648
    Top = 432
  end
  object dtsFornecedoresEmails: TDataSource
    AutoEdit = False
    DataSet = tabFornecedoresEmails
    Left = 720
    Top = 432
  end
  object tabCompras: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 648
    Top = 480
  end
  object dtsCompras: TDataSource
    AutoEdit = False
    DataSet = tabCompras
    Left = 720
    Top = 480
  end
  object popEmail: TPopupMenu
    Left = 248
    object EnviarEmail1: TMenuItem
      Caption = 'Enviar E-mail'
      OnClick = EnviarEmail1Click
    end
  end
end

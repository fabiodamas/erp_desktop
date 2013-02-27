inherited fmContatos: TfmContatos
  Left = 272
  Top = 122
  Caption = 'Contatos'
  ClientHeight = 529
  ClientWidth = 607
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 8
    Width = 73
    Height = 13
    Caption = 'C'#243'digo Contato'
  end
  object Label2: TLabel [1]
    Left = 128
    Top = 8
    Width = 71
    Height = 13
    Caption = 'Nome Fantasia'
  end
  inherited pnlBotoes: TPanel
    Top = 468
    Width = 607
    TabOrder = 3
    inherited btnLocalizar: TSpeedButton
      OnClick = btnLocalizarClick
    end
  end
  object edtNomeFantasia: TDBEdit [3]
    Left = 128
    Top = 24
    Width = 472
    Height = 21
    DataField = 'NomeFantasia'
    DataSource = dtsBase
    TabOrder = 1
  end
  object edtCodigoContato: TEdit [4]
    Left = 8
    Top = 24
    Width = 110
    Height = 21
    TabOrder = 0
    OnKeyPress = edtCodigoContatoKeyPress
    OnKeyUp = edtCodigoContatoKeyUp
  end
  object pgcClientes: TPageControl [5]
    Left = 8
    Top = 52
    Width = 592
    Height = 413
    ActivePage = tbsGeral
    TabOrder = 2
    object tbsGeral: TTabSheet
      Caption = 'Geral'
      object Label3: TLabel
        Left = 8
        Top = 1
        Width = 63
        Height = 13
        Caption = 'Raz'#227'o Social'
      end
      object Label4: TLabel
        Left = 8
        Top = 41
        Width = 29
        Height = 13
        Caption = 'Grupo'
      end
      object Label5: TLabel
        Left = 315
        Top = 41
        Width = 21
        Height = 13
        Caption = 'Tipo'
      end
      object Label6: TLabel
        Left = 8
        Top = 85
        Width = 83
        Height = 13
        Caption = 'Regime Tribut'#225'rio'
      end
      object Label7: TLabel
        Left = 315
        Top = 85
        Width = 30
        Height = 13
        Caption = 'Status'
      end
      object Label8: TLabel
        Left = 429
        Top = 140
        Width = 67
        Height = 13
        Caption = 'Conheceu por'
      end
      object lblCnpjCpf: TLabel
        Left = 88
        Top = 140
        Width = 27
        Height = 13
        Caption = 'CNPJ'
      end
      object lblIeRg: TLabel
        Left = 262
        Top = 140
        Width = 87
        Height = 13
        Caption = 'Inscri'#231#227'o Estadual'
      end
      object Label11: TLabel
        Left = 8
        Top = 184
        Width = 82
        Height = 13
        Caption = 'E-mail NFe - XML'
      end
      object Label12: TLabel
        Left = 204
        Top = 184
        Width = 96
        Height = 13
        Caption = 'E-mail NFe - DANFE'
      end
      object Label13: TLabel
        Left = 397
        Top = 184
        Width = 21
        Height = 13
        Caption = 'Site '
      end
      object Label22: TLabel
        Left = 8
        Top = 226
        Width = 61
        Height = 13
        Caption = 'E-mail Skype'
      end
      object Label23: TLabel
        Left = 150
        Top = 226
        Width = 75
        Height = 13
        Caption = 'Telefone Skype'
      end
      object Label24: TLabel
        Left = 256
        Top = 226
        Width = 24
        Height = 13
        Caption = 'MSN'
      end
      object Label30: TLabel
        Left = 372
        Top = 226
        Width = 60
        Height = 13
        Caption = 'Data Nascto'
      end
      object Label25: TLabel
        Left = 476
        Top = 226
        Width = 68
        Height = 13
        Caption = 'Data Cadastro'
      end
      object edtRazaoSocial: TDBEdit
        Left = 8
        Top = 17
        Width = 564
        Height = 21
        DataField = 'RazaoSocial'
        DataSource = dtsBase
        TabOrder = 0
      end
      object edtGrupo: TDBLookupComboBox
        Left = 8
        Top = 57
        Width = 257
        Height = 21
        DataField = 'CodigoGrupo'
        DataSource = dtsBase
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsGrupos
        TabOrder = 1
      end
      object edtTipo: TDBLookupComboBox
        Left = 315
        Top = 57
        Width = 257
        Height = 21
        DataField = 'CodigoTipo'
        DataSource = dtsBase
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsTipos
        TabOrder = 2
      end
      object edtRegimeTributario: TDBLookupComboBox
        Left = 8
        Top = 101
        Width = 257
        Height = 21
        DataField = 'CodigoCRT'
        DataSource = dtsBase
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsRegimeTributario
        TabOrder = 3
      end
      object edtStatus: TDBLookupComboBox
        Left = 315
        Top = 101
        Width = 257
        Height = 21
        DataField = 'CodigoStatus'
        DataSource = dtsBase
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsStatus
        TabOrder = 4
      end
      object edtConheceuPor: TDBEdit
        Left = 429
        Top = 156
        Width = 142
        Height = 21
        DataField = 'ConheceuPor'
        DataSource = dtsBase
        TabOrder = 8
      end
      object edtCnpjCpf: TDBEdit
        Left = 88
        Top = 156
        Width = 137
        Height = 21
        DataField = 'CpfCnpj'
        DataSource = dtsBase
        TabOrder = 6
        OnExit = edtCnpjCpfExit
      end
      object edtIeRg: TDBEdit
        Left = 262
        Top = 156
        Width = 137
        Height = 21
        DataField = 'IERG'
        DataSource = dtsBase
        TabOrder = 7
      end
      object edtEmailNFeXml: TDBEdit
        Left = 8
        Top = 200
        Width = 174
        Height = 21
        DataField = 'EmailNFEXML'
        DataSource = dtsBase
        TabOrder = 9
        OnClick = edtEmailNFeXmlClick
        OnKeyPress = edtEmailNFeXmlKeyPress
      end
      object edtEmailNFeDanfe: TDBEdit
        Left = 204
        Top = 200
        Width = 174
        Height = 21
        DataField = 'EmailNFEDanfe'
        DataSource = dtsBase
        TabOrder = 10
        OnClick = edtEmailNFeDanfeClick
        OnKeyPress = edtEmailNFeDanfeKeyPress
      end
      object edtSite: TDBEdit
        Left = 397
        Top = 200
        Width = 174
        Height = 21
        DataField = 'Site'
        DataSource = dtsBase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clOlive
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        TabOrder = 11
        OnClick = edtSiteClick
      end
      object grbTelefones: TGroupBox
        Left = 8
        Top = 266
        Width = 564
        Height = 113
        Caption = 'Telefones'
        TabOrder = 17
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
      object edtEmailSkype: TDBEdit
        Left = 8
        Top = 242
        Width = 130
        Height = 21
        DataField = 'EmailSkype'
        DataSource = dtsBase
        TabOrder = 12
      end
      object edtTelefoneSkype: TDBEdit
        Left = 150
        Top = 242
        Width = 93
        Height = 21
        DataField = 'TelSkype'
        DataSource = dtsBase
        TabOrder = 13
      end
      object edtMsn: TDBEdit
        Left = 256
        Top = 242
        Width = 108
        Height = 21
        DataField = 'MSN'
        DataSource = dtsBase
        TabOrder = 14
      end
      object edtDataNascto: TDBDateEdit
        Left = 372
        Top = 242
        Width = 96
        Height = 21
        DataField = 'DataNascto'
        DataSource = dtsBase
        NumGlyphs = 2
        TabOrder = 15
        YearDigits = dyFour
      end
      object edtDataCadastro: TDBDateEdit
        Left = 476
        Top = 242
        Width = 96
        Height = 21
        DataField = 'DataCadastro'
        DataSource = dtsBase
        NumGlyphs = 2
        TabOrder = 16
        YearDigits = dyFour
      end
      object dbrTipoContato: TDBRadioGroup
        Left = 8
        Top = 128
        Width = 73
        Height = 49
        Caption = 'Tipo'
        DataField = 'TipoContato'
        DataSource = dtsBase
        Items.Strings = (
          'CNPJ'
          'CPF')
        TabOrder = 5
        Values.Strings = (
          '1'
          '0')
        OnClick = dbrTipoContatoClick
      end
    end
    object tbsEnderecos: TTabSheet
      Caption = 'Endere'#231'os'
      ImageIndex = 1
      object grbEnderecoNormal: TGroupBox
        Left = 8
        Top = 2
        Width = 566
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
          Left = 152
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
          Left = 349
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
          Left = 152
          Top = 25
          Width = 404
          Height = 21
          DataField = 'Endereco'
          DataSource = dtsBase
          TabOrder = 2
        end
        object btnLocalizaCep: TBitBtn
          Left = 128
          Top = 25
          Width = 24
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
          Width = 242
          Height = 21
          DataField = 'Bairro'
          DataSource = dtsBase
          TabOrder = 4
        end
        object edtComplemento: TDBEdit
          Left = 349
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
          ListSource = dtsPais
          TabOrder = 6
        end
        object edtCidade: TDBLookupComboBox
          Left = 304
          Top = 96
          Width = 252
          Height = 21
          DataField = 'CodigoCidade'
          DataSource = dtsBase
          KeyField = 'CodigoCidade'
          ListField = 'Cidade'
          ListSource = dtsCidades
          TabOrder = 8
          OnEnter = edtCidadeEnter
          OnExit = edtCidadeExit
        end
        object edtEstado: TDBComboBox
          Left = 184
          Top = 96
          Width = 114
          Height = 21
          Style = csDropDownList
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
            'TO'
            'EX')
          TabOrder = 7
        end
      end
      object grbEnderecoEntrega: TGroupBox
        Left = 8
        Top = 128
        Width = 566
        Height = 124
        Caption = 'Endere'#231'o Entrega'
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
          Left = 152
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
          Left = 348
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
        object edtEntregaCep: TDBEdit
          Left = 8
          Top = 25
          Width = 119
          Height = 21
          DataField = 'EntregaCep'
          DataSource = dtsBase
          TabOrder = 0
          OnExit = edtEntregaCepExit
        end
        object edtEntregaNumero: TDBEdit
          Left = 8
          Top = 60
          Width = 81
          Height = 21
          DataField = 'EntregaNumero'
          DataSource = dtsBase
          TabOrder = 3
        end
        object edtEntregaEndereco: TDBEdit
          Left = 152
          Top = 25
          Width = 404
          Height = 21
          DataField = 'EntregaEndereco'
          DataSource = dtsBase
          TabOrder = 2
        end
        object btnEntregaLocalizaCep: TBitBtn
          Left = 128
          Top = 25
          Width = 24
          Height = 22
          TabOrder = 1
          OnClick = btnEntregaLocalizaCepClick
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
        object edtEntregaBairro: TDBEdit
          Left = 98
          Top = 60
          Width = 242
          Height = 21
          DataField = 'EntregaBairro'
          DataSource = dtsBase
          TabOrder = 4
        end
        object edtEntregaComplemento: TDBEdit
          Left = 348
          Top = 60
          Width = 207
          Height = 21
          DataField = 'EntregaComplemento'
          DataSource = dtsBase
          TabOrder = 5
        end
        object edtEntregaPais: TDBLookupComboBox
          Left = 8
          Top = 96
          Width = 169
          Height = 21
          DataField = 'EntregaCodigoPais'
          DataSource = dtsBase
          KeyField = 'CodigoPais'
          ListField = 'Pais'
          ListSource = dtsPais
          TabOrder = 6
        end
        object edtEntregaCidade: TDBLookupComboBox
          Left = 304
          Top = 96
          Width = 252
          Height = 21
          DataField = 'EntregaCodigoCidade'
          DataSource = dtsBase
          KeyField = 'CodigoCidade'
          ListField = 'Cidade'
          ListSource = dtsCidades
          TabOrder = 8
          OnEnter = edtEntregaCidadeEnter
          OnExit = edtEntregaCidadeExit
        end
        object edtEntregaEstado: TDBComboBox
          Left = 184
          Top = 96
          Width = 114
          Height = 21
          Style = csDropDownList
          DataField = 'EntregaEstado'
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
            'TO'
            'EX')
          TabOrder = 7
        end
        object btnCopiarDeEndNormalParaEntrega: TBitBtn
          Left = 498
          Top = 6
          Width = 29
          Height = 20
          Hint = 'Copia de Endere'#231'o Normal para Entrega'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 9
          OnClick = btnCopiarDeEndNormalParaEntregaClick
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
      object grbEnderecoCobranca: TGroupBox
        Left = 8
        Top = 254
        Width = 566
        Height = 124
        Caption = 'Endere'#231'o Cobran'#231'a'
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
          Left = 152
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
          Left = 348
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
        object edtCobrancaCep: TDBEdit
          Left = 8
          Top = 25
          Width = 119
          Height = 21
          DataField = 'CobrancaCep'
          DataSource = dtsBase
          TabOrder = 0
          OnExit = edtCobrancaCepExit
        end
        object edtCobrancaNumero: TDBEdit
          Left = 8
          Top = 60
          Width = 81
          Height = 21
          DataField = 'CobrancaNumero'
          DataSource = dtsBase
          TabOrder = 3
        end
        object edtCobrancaEndereco: TDBEdit
          Left = 152
          Top = 25
          Width = 404
          Height = 21
          DataField = 'CobrancaEndereco'
          DataSource = dtsBase
          TabOrder = 2
        end
        object btnCobrancaLocalizaCep: TBitBtn
          Left = 128
          Top = 25
          Width = 24
          Height = 22
          TabOrder = 1
          OnClick = btnCobrancaLocalizaCepClick
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
        object edtCobrancaBairro: TDBEdit
          Left = 98
          Top = 60
          Width = 242
          Height = 21
          DataField = 'CobrancaBairro'
          DataSource = dtsBase
          TabOrder = 4
        end
        object edtCobrancaComplemento: TDBEdit
          Left = 348
          Top = 60
          Width = 207
          Height = 21
          DataField = 'CobrancaComplemento'
          DataSource = dtsBase
          TabOrder = 5
        end
        object edtCobrancaPais: TDBLookupComboBox
          Left = 8
          Top = 96
          Width = 169
          Height = 21
          DataField = 'CobrancaCodigoPais'
          DataSource = dtsBase
          KeyField = 'CodigoPais'
          ListField = 'Pais'
          ListSource = dtsPais
          TabOrder = 6
        end
        object edtCobrancaCidade: TDBLookupComboBox
          Left = 304
          Top = 96
          Width = 252
          Height = 21
          DataField = 'CobrancaCodigoCidade'
          DataSource = dtsBase
          KeyField = 'CodigoCidade'
          ListField = 'Cidade'
          ListSource = dtsCidades
          TabOrder = 8
          OnEnter = edtCobrancaCidadeEnter
          OnExit = edtCobrancaCidadeExit
        end
        object edtCobrancaEstado: TDBComboBox
          Left = 184
          Top = 96
          Width = 114
          Height = 21
          Style = csDropDownList
          DataField = 'CobrancaEstado'
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
            'TO'
            'EX')
          TabOrder = 7
        end
        object btnCopiarEndNormalParaCobranca: TBitBtn
          Left = 469
          Top = 6
          Width = 29
          Height = 20
          Hint = 'Copia de Endere'#231'o Normal para Cobran'#231'a'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 9
          OnClick = btnCopiarEndNormalParaCobrancaClick
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
        object btnCopiarEndEntregaParaCobranca: TBitBtn
          Left = 498
          Top = 6
          Width = 29
          Height = 20
          Hint = 'Copiar de Endere'#231'o de Entrega para Cobran'#231'a '
          ParentShowHint = False
          ShowHint = True
          TabOrder = 10
          OnClick = btnCopiarEndEntregaParaCobrancaClick
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
    object tbsContatosEmails: TTabSheet
      Caption = 'Contatos - E-mails'
      ImageIndex = 2
      object Label51: TLabel
        Left = 8
        Top = 6
        Width = 37
        Height = 13
        Caption = 'Contato'
      end
      object Label52: TLabel
        Left = 216
        Top = 6
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label53: TLabel
        Left = 360
        Top = 6
        Width = 28
        Height = 13
        Caption = 'E-mail'
      end
      object edtContato: TEdit
        Left = 8
        Top = 24
        Width = 169
        Height = 21
        TabOrder = 0
      end
      object edtDescricao: TEdit
        Left = 216
        Top = 24
        Width = 138
        Height = 21
        TabOrder = 1
      end
      object edtEmail: TEdit
        Left = 360
        Top = 24
        Width = 185
        Height = 21
        TabOrder = 2
        OnKeyPress = edtEmailNFeXmlKeyPress
      end
      object btnContatoAdicionar: TBitBtn
        Left = 179
        Top = 23
        Width = 25
        Height = 23
        TabOrder = 3
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
      object btnEmailAdicionar: TBitBtn
        Left = 547
        Top = 23
        Width = 25
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
        Top = 47
        Width = 565
        Height = 153
        DataSource = dtsContatosContatos
        TabOrder = 5
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'Contato'
            Width = 525
            Visible = True
          end>
      end
      object dbgEmails: TDBGrid
        Left = 8
        Top = 219
        Width = 565
        Height = 145
        DataSource = dtsContatosEmails
        TabOrder = 6
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'Descricao'
            Width = 258
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Email'
            Width = 269
            Visible = True
          end>
      end
      object btnContatosRemover: TBitBtn
        Left = 548
        Top = 199
        Width = 25
        Height = 20
        TabOrder = 7
        OnClick = btnContatosRemoverClick
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
      object btnEmailsRemover: TBitBtn
        Left = 548
        Top = 365
        Width = 25
        Height = 20
        TabOrder = 8
        OnClick = btnEmailsRemoverClick
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
      object PageControl1: TPageControl
        Left = 8
        Top = 8
        Width = 568
        Height = 367
        ActivePage = tbsHistorico
        TabOrder = 0
        object tbsHistorico: TTabSheet
          Caption = 'Hist'#243'rico'
          object Label10: TLabel
            Left = 8
            Top = 0
            Width = 23
            Height = 13
            Caption = 'Data'
          end
          object Label54: TLabel
            Left = 8
            Top = 40
            Width = 67
            Height = 13
            Caption = 'Departamento'
          end
          object Label55: TLabel
            Left = 8
            Top = 80
            Width = 55
            Height = 13
            Caption = 'Funcion'#225'rio'
          end
          object Label9: TLabel
            Left = 500
            Top = -3
            Width = 36
            Height = 14
            Caption = 'Novo!'
            Font.Charset = ANSI_CHARSET
            Font.Color = clGreen
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold, fsUnderline]
            ParentFont = False
          end
          object edtHistoricoData: TDBDateEdit
            Left = 8
            Top = 16
            Width = 113
            Height = 21
            DataField = 'Data'
            DataSource = dtsContatosHistoricos
            NumGlyphs = 2
            TabOrder = 0
            YearDigits = dyFour
          end
          object edtHistoricoDepto: TDBLookupComboBox
            Left = 8
            Top = 56
            Width = 113
            Height = 21
            DataField = 'CodigoDepto'
            DataSource = dtsContatosHistoricos
            KeyField = 'Codigo'
            ListField = 'Descricao'
            ListSource = dtsDepto
            TabOrder = 1
          end
          object edtHistoricoFuncionario: TDBLookupComboBox
            Left = 8
            Top = 96
            Width = 113
            Height = 21
            DataField = 'CodigoFuncionario'
            DataSource = dtsContatosHistoricos
            KeyField = 'Codigo'
            ListField = 'Nome'
            ListSource = dtsFuncionarios
            TabOrder = 2
          end
          object dbgHistorico: TDBGrid
            Left = 8
            Top = 128
            Width = 515
            Height = 201
            DataSource = dtsContatosHistoricos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnCellClick = dbgHistoricoCellClick
            Columns = <
              item
                Expanded = False
                FieldName = 'CodigoFuncionario'
                Title.Caption = 'C'#243'digo Func.'
                Width = 78
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Data'
                Width = 86
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Historico'
                Width = 522
                Visible = True
              end>
          end
          object edtHistoricoHistorico: TDBMemo
            Left = 128
            Top = 16
            Width = 393
            Height = 101
            DataField = 'Historico'
            DataSource = dtsContatosHistoricos
            TabOrder = 4
          end
          object btnHistoricoNovo: TBitBtn
            Left = 527
            Top = 16
            Width = 25
            Height = 22
            TabOrder = 5
            OnClick = btnHistoricoNovoClick
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
            NumGlyphs = 2
          end
          object btnHistoricoGravar: TBitBtn
            Left = 527
            Top = 44
            Width = 25
            Height = 22
            TabOrder = 6
            OnClick = btnHistoricoGravarClick
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
          object btnHistoricoRemover: TBitBtn
            Left = 527
            Top = 72
            Width = 25
            Height = 22
            TabOrder = 7
            OnClick = btnHistoricoRemoverClick
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
        object tbsObs: TTabSheet
          Caption = 'Observa'#231#227'o'
          ImageIndex = 1
          object edtObs1: TDBMemo
            Left = 8
            Top = 8
            Width = 543
            Height = 164
            DataField = 'Observacao1'
            DataSource = dtsBase
            ScrollBars = ssVertical
            TabOrder = 0
          end
          object edtObs2: TDBMemo
            Left = 8
            Top = 179
            Width = 544
            Height = 148
            DataField = 'Observacao2'
            DataSource = dtsBase
            ScrollBars = ssVertical
            TabOrder = 1
          end
        end
      end
    end
  end
  inherited popGrid: TPopupMenu
    Left = 496
    Top = 472
  end
  inherited tabBase: TZQuery
    Connection = fmMenu.zcnConexao
    Left = 640
    Top = 8
  end
  inherited dtsBase: TDataSource
    OnDataChange = dtsBaseDataChange
    Left = 712
    Top = 8
  end
  inherited popOpcoes: TPopupMenu
    Left = 448
    Top = 472
    object Rtulo1: TMenuItem
      Caption = 'R'#243'tulo'
      OnClick = Rtulo1Click
    end
    object GerarCliente1: TMenuItem
      Caption = 'Gerar Cliente'
      OnClick = GerarCliente1Click
    end
  end
  object tabPais: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 640
    Top = 56
  end
  object dtsPais: TDataSource
    AutoEdit = False
    DataSet = tabPais
    Left = 712
    Top = 56
  end
  object tabCidades: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 640
    Top = 104
  end
  object dtsCidades: TDataSource
    AutoEdit = False
    DataSet = tabCidades
    Left = 712
    Top = 104
  end
  object tabContatosContatos: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 640
    Top = 152
  end
  object dtsContatosContatos: TDataSource
    AutoEdit = False
    DataSet = tabContatosContatos
    Left = 712
    Top = 152
  end
  object tabContatosEmails: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 640
    Top = 200
  end
  object dtsContatosEmails: TDataSource
    AutoEdit = False
    DataSet = tabContatosEmails
    Left = 760
    Top = 200
  end
  object tabGrupos: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 640
    Top = 248
  end
  object dtsGrupos: TDataSource
    AutoEdit = False
    DataSet = tabGrupos
    Left = 760
    Top = 248
  end
  object tabTipos: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 640
    Top = 296
  end
  object dtsTipos: TDataSource
    AutoEdit = False
    DataSet = tabTipos
    Left = 760
    Top = 296
  end
  object tabRegimeTributario: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 640
    Top = 344
  end
  object dtsRegimeTributario: TDataSource
    AutoEdit = False
    DataSet = tabRegimeTributario
    Left = 760
    Top = 344
  end
  object tabStatus: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 640
    Top = 392
  end
  object dtsStatus: TDataSource
    AutoEdit = False
    DataSet = tabStatus
    Left = 760
    Top = 392
  end
  object tabChecagens: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 800
    Top = 24
  end
  object tabClientes: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 880
    Top = 176
  end
  object tabClientesContatos: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 880
    Top = 224
  end
  object tabClientesEmails: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 880
    Top = 272
  end
  object popEmail: TPopupMenu
    Left = 344
    Top = 8
    object EnviarEmail1: TMenuItem
      Caption = 'Enviar E-mail'
      OnClick = EnviarEmail1Click
    end
  end
  object dtsChecagens: TDataSource
    AutoEdit = False
    DataSet = tabChecagens
    Left = 888
    Top = 24
  end
  object tabContatosHistoricos: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 640
    Top = 440
  end
  object dtsContatosHistoricos: TDataSource
    DataSet = tabContatosHistoricos
    Left = 760
    Top = 440
  end
  object tabAuxContatos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 636
    Top = 497
    object tabAuxContatosContato: TStringField
      FieldName = 'Contato'
      Size = 60
    end
  end
  object dtsAuxContatos: TDataSource
    AutoEdit = False
    DataSet = tabAuxContatos
    Left = 756
    Top = 497
  end
  object tabAuxEmails: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 636
    Top = 553
    object tabAuxEmailsDescricao: TStringField
      FieldName = 'Descricao'
      Size = 60
    end
    object tabAuxEmailsEmail: TStringField
      FieldName = 'Email'
      Size = 120
    end
  end
  object dtsAuxEmails: TDataSource
    AutoEdit = False
    DataSet = tabAuxEmails
    Left = 756
    Top = 553
  end
  object tabAuxHistoricos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 636
    Top = 609
    object tabAuxHistoricosData: TDateField
      FieldName = 'Data'
    end
    object tabAuxHistoricosCodigoDepto: TFloatField
      FieldName = 'CodigoDepto'
    end
    object tabAuxHistoricosCodigoFuncionario: TFloatField
      FieldName = 'CodigoFuncionario'
    end
    object tabAuxHistoricosHistorico: TMemoField
      FieldName = 'Historico'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dtsAuxHistoricos: TDataSource
    DataSet = tabAuxHistoricos
    OnDataChange = dtsAuxHistoricosDataChange
    Left = 756
    Top = 609
  end
  object tabDepto: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 840
    Top = 370
  end
  object dtsDepto: TDataSource
    AutoEdit = False
    DataSet = tabDepto
    Left = 928
    Top = 370
  end
  object tabFuncionarios: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 840
    Top = 426
  end
  object dtsFuncionarios: TDataSource
    AutoEdit = False
    DataSet = tabFuncionarios
    Left = 928
    Top = 426
  end
  object tabClientesHistoricos: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 880
    Top = 320
  end
  object popEditarContato: TPopupMenu
    Left = 424
    Top = 8
    object MenuItem1: TMenuItem
      Caption = 'Editar'
      OnClick = MenuItem1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object EnviarEmail2: TMenuItem
      Caption = 'Enviar E-mail'
      OnClick = EnviarEmail2Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Copiar1: TMenuItem
      Caption = 'Copiar'
      OnClick = Copiar1Click
    end
  end
  object popEditarEmail: TPopupMenu
    Left = 512
    Top = 8
    object MenuItem2: TMenuItem
      Caption = 'Editar'
      OnClick = MenuItem2Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object Copiar3: TMenuItem
      Caption = 'Copiar'
      OnClick = Copiar3Click
    end
  end
end

inherited fmConfiguracaoSistema: TfmConfiguracaoSistema
  Left = 258
  Top = 183
  Caption = 'Configura'#231#227'o do Sistema'
  ClientHeight = 433
  ClientWidth = 546
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgcConfiguracoesSistema: TPageControl [0]
    Left = 8
    Top = 8
    Width = 530
    Height = 387
    ActivePage = tbsProprietario
    TabOrder = 0
    object tbsProprietario: TTabSheet
      Caption = 'Dados do Propriet'#225'rio'
      ImageIndex = 1
      object Label8: TLabel
        Left = 8
        Top = 3
        Width = 71
        Height = 13
        Caption = 'Nome Fantasia'
      end
      object Label9: TLabel
        Left = 264
        Top = 3
        Width = 63
        Height = 13
        Caption = 'Raz'#227'o Social'
      end
      object Label10: TLabel
        Left = 168
        Top = 51
        Width = 46
        Height = 13
        Caption = 'Endere'#231'o'
      end
      object Label11: TLabel
        Left = 439
        Top = 51
        Width = 37
        Height = 13
        Caption = 'Numero'
      end
      object Label12: TLabel
        Left = 8
        Top = 51
        Width = 19
        Height = 13
        Caption = 'Cep'
      end
      object Label28: TLabel
        Left = 169
        Top = 101
        Width = 33
        Height = 13
        Caption = 'Estado'
      end
      object Label34: TLabel
        Left = 235
        Top = 101
        Width = 33
        Height = 13
        Caption = 'Cidade'
      end
      object Label15: TLabel
        Left = 8
        Top = 101
        Width = 27
        Height = 13
        Caption = 'Bairro'
      end
      object Label16: TLabel
        Left = 8
        Top = 149
        Width = 42
        Height = 13
        Caption = 'Telefone'
      end
      object Label17: TLabel
        Left = 168
        Top = 149
        Width = 17
        Height = 13
        Caption = 'Fax'
      end
      object Label18: TLabel
        Left = 8
        Top = 197
        Width = 41
        Height = 13
        Caption = 'WebSite'
      end
      object Label19: TLabel
        Left = 296
        Top = 197
        Width = 25
        Height = 13
        Caption = 'Email'
      end
      object Label22: TLabel
        Left = 8
        Top = 245
        Width = 27
        Height = 13
        Caption = 'CNPJ'
      end
      object Label23: TLabel
        Left = 296
        Top = 245
        Width = 10
        Height = 13
        Caption = 'IE'
      end
      object Label27: TLabel
        Left = 8
        Top = 293
        Width = 22
        Height = 13
        Caption = 'Pa'#237's'
      end
      object edtNomeFantasia: TDBEdit
        Left = 8
        Top = 19
        Width = 249
        Height = 21
        DataField = 'NomeFantasia'
        DataSource = dtsConfig
        TabOrder = 0
      end
      object edtRazaoSocial: TDBEdit
        Left = 264
        Top = 19
        Width = 249
        Height = 21
        DataField = 'RazaoSocial'
        DataSource = dtsConfig
        TabOrder = 1
      end
      object edtEndereco: TDBEdit
        Left = 168
        Top = 67
        Width = 264
        Height = 21
        DataField = 'Endereco'
        DataSource = dtsConfig
        TabOrder = 4
      end
      object edtNumero: TDBEdit
        Left = 439
        Top = 67
        Width = 74
        Height = 21
        DataField = 'Numero'
        DataSource = dtsConfig
        TabOrder = 5
      end
      object edtCep: TDBEdit
        Left = 8
        Top = 67
        Width = 123
        Height = 21
        DataField = 'Cep'
        DataSource = dtsConfig
        TabOrder = 2
        OnExit = edtCepExit
      end
      object edtEstado: TDBComboBox
        Left = 169
        Top = 117
        Width = 57
        Height = 21
        Style = csDropDownList
        DataField = 'Estado'
        DataSource = dtsConfig
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
      object edtCidade: TDBLookupComboBox
        Left = 235
        Top = 117
        Width = 279
        Height = 21
        DataField = 'CodigoCidade'
        DataSource = dtsConfig
        KeyField = 'CodigoCidade'
        ListField = 'Cidade'
        ListSource = dtsCidades
        TabOrder = 8
        OnEnter = edtCidadeEnter
      end
      object edtBairro: TDBEdit
        Left = 8
        Top = 117
        Width = 151
        Height = 21
        DataField = 'Bairro'
        DataSource = dtsConfig
        TabOrder = 6
      end
      object edtTelefone: TDBEdit
        Left = 8
        Top = 165
        Width = 151
        Height = 21
        DataField = 'Telefone'
        DataSource = dtsConfig
        TabOrder = 9
      end
      object edtFax: TDBEdit
        Left = 168
        Top = 165
        Width = 151
        Height = 21
        DataField = 'Fax'
        DataSource = dtsConfig
        TabOrder = 10
      end
      object edtSite: TDBEdit
        Left = 8
        Top = 213
        Width = 217
        Height = 21
        DataField = 'Site'
        DataSource = dtsConfig
        TabOrder = 11
      end
      object edtEmail: TDBEdit
        Left = 296
        Top = 213
        Width = 217
        Height = 21
        DataField = 'Email'
        DataSource = dtsConfig
        TabOrder = 12
      end
      object edtCnpj: TDBEdit
        Left = 8
        Top = 261
        Width = 217
        Height = 21
        DataField = 'CNPJ'
        DataSource = dtsConfig
        TabOrder = 13
      end
      object edtIE: TDBEdit
        Left = 296
        Top = 261
        Width = 217
        Height = 21
        DataField = 'IE'
        DataSource = dtsConfig
        TabOrder = 14
      end
      object edtPais: TDBLookupComboBox
        Left = 8
        Top = 309
        Width = 217
        Height = 21
        DataField = 'CodigoPais'
        DataSource = dtsConfig
        KeyField = 'CodigoPais'
        ListField = 'Pais'
        ListSource = dtsPais
        TabOrder = 15
        OnEnter = edtCidadeEnter
      end
      object btnLocalizaCep: TBitBtn
        Left = 135
        Top = 66
        Width = 29
        Height = 22
        TabOrder = 3
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
    end
    object tbsEmail: TTabSheet
      Caption = 'E-mail'
      object grbSMTP: TGroupBox
        Left = 8
        Top = 10
        Width = 189
        Height = 233
        Caption = 'SMTP'
        TabOrder = 0
        object Label1: TLabel
          Left = 16
          Top = 27
          Width = 22
          Height = 13
          Caption = 'Host'
        end
        object Label2: TLabel
          Left = 16
          Top = 75
          Width = 48
          Height = 13
          Caption = 'Username'
        end
        object Label3: TLabel
          Left = 16
          Top = 123
          Width = 46
          Height = 13
          Caption = 'Password'
        end
        object Label4: TLabel
          Left = 16
          Top = 171
          Width = 25
          Height = 13
          Caption = 'Porta'
        end
        object edtSMTPHost: TDBEdit
          Left = 16
          Top = 43
          Width = 155
          Height = 21
          DataField = 'SmtpHost'
          DataSource = dtsConfig
          TabOrder = 0
        end
        object edtSMTPUserName: TDBEdit
          Left = 16
          Top = 91
          Width = 155
          Height = 21
          DataField = 'SmtpUsername'
          DataSource = dtsConfig
          TabOrder = 1
        end
        object edtSMTPPassWord: TDBEdit
          Left = 16
          Top = 139
          Width = 155
          Height = 21
          DataField = 'SmtpPassword'
          DataSource = dtsConfig
          PasswordChar = '*'
          TabOrder = 2
        end
        object edtSMTPPorta: TDBEdit
          Left = 16
          Top = 187
          Width = 155
          Height = 21
          DataField = 'SmtpPorta'
          DataSource = dtsConfig
          TabOrder = 3
        end
      end
      object GroupBox1: TGroupBox
        Left = 208
        Top = 10
        Width = 274
        Height = 138
        Caption = 'NFe'
        TabOrder = 1
        object Label5: TLabel
          Left = 16
          Top = 27
          Width = 94
          Height = 13
          Caption = 'E-mail Retorno XML'
        end
        object Label6: TLabel
          Left = 16
          Top = 75
          Width = 108
          Height = 13
          Caption = 'E-mail Retorno DANFE'
        end
        object edtNFeEmailRetornoXML: TDBEdit
          Left = 16
          Top = 43
          Width = 241
          Height = 21
          DataField = 'NFeEmailXML'
          DataSource = dtsConfig
          TabOrder = 0
        end
        object edtNFeEmailRetornoDANFE: TDBEdit
          Left = 16
          Top = 91
          Width = 241
          Height = 21
          DataField = 'NFeEmailDanfe'
          DataSource = dtsConfig
          TabOrder = 1
        end
      end
      object GroupBox2: TGroupBox
        Left = 208
        Top = 154
        Width = 274
        Height = 89
        Caption = 'Or'#231'amentos de Venda'
        TabOrder = 2
        object Label7: TLabel
          Left = 16
          Top = 27
          Width = 178
          Height = 13
          Caption = 'E-mail Retorno Or'#231'amentos de Venda'
        end
        object edtOrcEmailRetorno: TDBEdit
          Left = 16
          Top = 43
          Width = 241
          Height = 21
          DataField = 'OrcEmail'
          DataSource = dtsConfig
          TabOrder = 0
        end
      end
    end
    object tbsOrcamento: TTabSheet
      Caption = 'Or'#231'amento'
      ImageIndex = 2
      object Label13: TLabel
        Left = 8
        Top = 8
        Width = 82
        Height = 13
        Caption = 'Texto Or'#231'amento'
      end
      object edtTextoOrcamento: TDBEdit
        Left = 8
        Top = 24
        Width = 352
        Height = 21
        DataField = 'TextoOrcamento'
        DataSource = dtsConfig
        TabOrder = 0
      end
    end
    object tbsSistema: TTabSheet
      Caption = 'Sistema'
      ImageIndex = 3
      object Label14: TLabel
        Left = 8
        Top = 8
        Width = 84
        Height = 13
        Caption = 'Chave de Acesso'
      end
      object edtChaveAcesso: TDBEdit
        Left = 8
        Top = 24
        Width = 313
        Height = 21
        DataField = 'Chave'
        DataSource = dtsConfig
        TabOrder = 0
      end
    end
    object tbsLogotipos: TTabSheet
      Caption = 'Logotipos'
      ImageIndex = 4
      object Label21: TLabel
        Left = 27
        Top = 58
        Width = 99
        Height = 13
        Caption = 'Clique para adicionar'
      end
      object imgLogoRelatorios: TImage
        Left = 8
        Top = 16
        Width = 137
        Height = 105
        Center = True
        Stretch = True
        OnClick = imgLogoRelatoriosClick
      end
      object Label20: TLabel
        Left = 37
        Top = 128
        Width = 74
        Height = 13
        Caption = 'Logo Relat'#243'rios'
      end
    end
    object tbsNFe: TTabSheet
      Caption = 'NF-e'
      ImageIndex = 5
      object PageControl1: TPageControl
        Left = 0
        Top = 0
        Width = 521
        Height = 358
        ActivePage = tbsNFeGeral
        TabOrder = 0
        object tbsNFeGeral: TTabSheet
          Caption = 'Geral'
          ImageIndex = 2
          object Label36: TLabel
            Left = 8
            Top = 248
            Width = 182
            Height = 13
            Caption = 'Aliquota Aproveitamento (CSOSN 101)'
          end
          object Label26: TLabel
            Left = 8
            Top = 104
            Width = 51
            Height = 13
            Caption = 'Obs NFe 3'
          end
          object Label25: TLabel
            Left = 8
            Top = 56
            Width = 51
            Height = 13
            Caption = 'Obs NFe 2'
          end
          object Label24: TLabel
            Left = 8
            Top = 8
            Width = 51
            Height = 13
            Caption = 'Obs NFe 1'
          end
          object edtAliqAprov: TDBEdit
            Left = 8
            Top = 264
            Width = 193
            Height = 21
            DataField = 'AliqAprov'
            DataSource = dtsConfig
            TabOrder = 0
          end
          object dbrCrt: TDBRadioGroup
            Left = 8
            Top = 151
            Width = 316
            Height = 87
            Caption = 'C'#243'digo do Regime Tribut'#225'rio'
            DataField = 'CRT'
            DataSource = dtsConfig
            Items.Strings = (
              '1 - Simples Nacional.'
              '2 - Simples Nacional - Excesso de sublimite de receita bruta'
              '3 - Regime Normal')
            TabOrder = 1
            Values.Strings = (
              '1'
              '2'
              '3')
          end
          object edtNFeObs3: TDBEdit
            Left = 8
            Top = 120
            Width = 500
            Height = 21
            DataField = 'ObsNF3'
            DataSource = dtsConfig
            TabOrder = 2
          end
          object edtNFeObs2: TDBEdit
            Left = 8
            Top = 72
            Width = 500
            Height = 21
            DataField = 'ObsNF2'
            DataSource = dtsConfig
            TabOrder = 3
          end
          object edtNFeObs1: TDBEdit
            Left = 8
            Top = 24
            Width = 500
            Height = 21
            DataField = 'ObsNF1'
            DataSource = dtsConfig
            TabOrder = 4
          end
          object dbrFormatoDanfe: TDBRadioGroup
            Left = 328
            Top = 151
            Width = 181
            Height = 55
            Caption = 'Formato Danfe'
            DataField = 'NFeFormatoDanfe'
            DataSource = dtsConfig
            Items.Strings = (
              'Retrato'
              'Paisagem')
            TabOrder = 5
            Values.Strings = (
              '0'
              '1')
          end
          object dbrFormaEmissao: TDBRadioGroup
            Left = 328
            Top = 207
            Width = 181
            Height = 117
            Caption = 'Forma de Emiss'#227'o'
            DataField = 'NFeFormaEmissao'
            DataSource = dtsConfig
            Items.Strings = (
              'Normal'
              'Conting'#234'ncia'
              'SCAN'
              'DPEC'
              'FSDA')
            TabOrder = 6
            Values.Strings = (
              '0'
              '1'
              '2'
              '3'
              '4')
          end
        end
        object tbsNFeCertificado: TTabSheet
          Caption = 'Certificado'
          object grbCertificados: TGroupBox
            Left = 8
            Top = 4
            Width = 267
            Height = 144
            Caption = 'Certificado'
            TabOrder = 0
            object Label41: TLabel
              Left = 8
              Top = 16
              Width = 41
              Height = 13
              Caption = 'Caminho'
            end
            object Label42: TLabel
              Left = 8
              Top = 56
              Width = 31
              Height = 13
              Caption = 'Senha'
            end
            object btnCaminhoCert: TSpeedButton
              Left = 235
              Top = 32
              Width = 23
              Height = 23
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
              OnClick = btnCaminhoCertClick
            end
            object Label43: TLabel
              Left = 8
              Top = 96
              Width = 79
              Height = 13
              Caption = 'N'#250'mero de S'#233'rie'
            end
            object btnGetCert: TSpeedButton
              Left = 235
              Top = 112
              Width = 23
              Height = 23
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
              OnClick = btnGetCertClick
            end
            object edtNFeCertCaminho: TDBEdit
              Left = 8
              Top = 32
              Width = 225
              Height = 21
              DataField = 'NFeCaminhoCertificado'
              DataSource = dtsConfig
              TabOrder = 0
            end
            object edtNFeCertSenha: TDBEdit
              Left = 8
              Top = 72
              Width = 250
              Height = 21
              DataField = 'NFeSenhaCertificado'
              DataSource = dtsConfig
              PasswordChar = '*'
              TabOrder = 1
            end
            object edtNFeCertNumSerie: TDBEdit
              Left = 8
              Top = 112
              Width = 225
              Height = 21
              DataField = 'NFeNumeroSerie'
              DataSource = dtsConfig
              TabOrder = 2
            end
          end
        end
        object tbsNFeWebService: TTabSheet
          Caption = 'Web Service'
          ImageIndex = 1
          object Label44: TLabel
            Left = 8
            Top = 13
            Width = 41
            Height = 13
            Caption = 'UF - WS'
          end
          object edtNFeWSUF: TDBComboBox
            Left = 8
            Top = 29
            Width = 57
            Height = 21
            Style = csDropDownList
            DataField = 'NFeUFDest'
            DataSource = dtsConfig
            ItemHeight = 13
            TabOrder = 0
          end
          object dbrNFeTipoAmbiente: TDBRadioGroup
            Left = 80
            Top = 7
            Width = 113
            Height = 55
            Caption = 'Ambiente'
            DataField = 'NFeTipoAmbiente'
            DataSource = dtsConfig
            Items.Strings = (
              'Produ'#231#227'o'
              'Homologa'#231#227'o')
            TabOrder = 1
            Values.Strings = (
              '0'
              '1')
          end
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Diversos'
      ImageIndex = 6
      object Label29: TLabel
        Left = 8
        Top = 7
        Width = 61
        Height = 13
        Caption = 'Numero O.P.'
      end
      object Label30: TLabel
        Left = 136
        Top = 7
        Width = 30
        Height = 13
        Caption = 'Marca'
      end
      object Label31: TLabel
        Left = 264
        Top = 7
        Width = 38
        Height = 13
        Caption = 'Esp'#233'cie'
      end
      object Label32: TLabel
        Left = 8
        Top = 55
        Width = 65
        Height = 13
        Caption = 'Formas Pagto'
      end
      object Label33: TLabel
        Left = 8
        Top = 103
        Width = 49
        Height = 13
        Caption = 'Garantia 1'
      end
      object Label35: TLabel
        Left = 8
        Top = 151
        Width = 49
        Height = 13
        Caption = 'Garantia 2'
      end
      object Label37: TLabel
        Left = 8
        Top = 207
        Width = 99
        Height = 13
        Caption = 'Documento Receber'
      end
      object Label38: TLabel
        Left = 134
        Top = 207
        Width = 86
        Height = 13
        Caption = 'Documento Pagar'
      end
      object Label39: TLabel
        Left = 259
        Top = 207
        Width = 102
        Height = 13
        Caption = 'Grupo - Mat'#233'ria Prima'
      end
      object Label40: TLabel
        Left = 8
        Top = 255
        Width = 80
        Height = 13
        Caption = 'Localiza'#231#227'o B.B.'
      end
      object edtNumeroProducao: TDBEdit
        Left = 8
        Top = 23
        Width = 113
        Height = 21
        DataField = 'NumeroProducao'
        DataSource = dtsConfig
        TabOrder = 0
      end
      object edtMarca: TDBEdit
        Left = 136
        Top = 23
        Width = 113
        Height = 21
        DataField = 'Marca'
        DataSource = dtsConfig
        TabOrder = 1
      end
      object edtEspecie: TDBEdit
        Left = 264
        Top = 23
        Width = 113
        Height = 21
        DataField = 'Especie'
        DataSource = dtsConfig
        TabOrder = 2
      end
      object edtFormasPagto: TDBEdit
        Left = 8
        Top = 71
        Width = 505
        Height = 21
        DataField = 'FormasPagto'
        DataSource = dtsConfig
        TabOrder = 3
      end
      object edtGarantia1: TDBEdit
        Left = 8
        Top = 119
        Width = 505
        Height = 21
        DataField = 'Garantia1'
        DataSource = dtsConfig
        TabOrder = 4
      end
      object edtGarantia2: TDBEdit
        Left = 8
        Top = 167
        Width = 505
        Height = 21
        DataField = 'Garantia2'
        DataSource = dtsConfig
        TabOrder = 5
      end
      object edtDocumentoReceber: TDBEdit
        Left = 8
        Top = 223
        Width = 113
        Height = 21
        DataField = 'NumeroReceber'
        DataSource = dtsConfig
        TabOrder = 6
      end
      object edtDocumentoPagar: TDBEdit
        Left = 134
        Top = 223
        Width = 113
        Height = 21
        DataField = 'NumeroPagar'
        DataSource = dtsConfig
        TabOrder = 7
      end
      object edtGrupoMateriaPrima: TDBLookupComboBox
        Left = 259
        Top = 223
        Width = 255
        Height = 21
        DataField = 'CodigoGrupoMP'
        DataSource = dtsConfig
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dtsGrupos
        TabOrder = 8
        OnEnter = edtCidadeEnter
      end
      object edtLocalizacaoBB: TDBEdit
        Left = 8
        Top = 271
        Width = 113
        Height = 21
        DataField = 'LocalizacaoBB'
        DataSource = dtsConfig
        TabOrder = 9
      end
      object dbcPreenchimentoObrigatorioEndereco: TDBCheckBox
        Left = 8
        Top = 304
        Width = 297
        Height = 17
        Caption = 'Preenchimento Obrigat'#243'rio do Endere'#231'o Normal do Cliente'
        DataField = 'POClientesEndNormal'
        DataSource = dtsConfig
        TabOrder = 10
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Fretes Correios'
      ImageIndex = 7
      object Label45: TLabel
        Left = 8
        Top = 15
        Width = 119
        Height = 13
        Caption = 'Transportadora - Correios'
      end
      object edtTransportadorasCorreios: TDBLookupComboBox
        Left = 8
        Top = 31
        Width = 289
        Height = 21
        DataField = 'CodigoTranspCorreios'
        DataSource = dtsConfig
        KeyField = 'Codigo'
        ListField = 'Nome'
        ListSource = dtsTransportadoras
        TabOrder = 0
        OnEnter = edtCidadeEnter
      end
    end
  end
  object btnGravar: TBitBtn [1]
    Left = 309
    Top = 400
    Width = 113
    Height = 25
    Caption = 'Gravar'
    TabOrder = 1
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
  object btnCancelar: TBitBtn [2]
    Left = 425
    Top = 400
    Width = 113
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 2
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
  inherited popGrid: TPopupMenu
    Left = 720
    Top = 8
  end
  object tabConfig: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 584
    Top = 8
  end
  object dtsConfig: TDataSource
    AutoEdit = False
    DataSet = tabConfig
    Left = 648
    Top = 8
  end
  object tabCidades: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 584
    Top = 56
  end
  object dtsCidades: TDataSource
    AutoEdit = False
    DataSet = tabCidades
    Left = 648
    Top = 56
  end
  object OpenDialog1: TOpenDialog
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Localizar arquivo para anexar '#224' mensagem'
    Left = 780
    Top = 8
  end
  object tabPais: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 584
    Top = 104
  end
  object dtsPais: TDataSource
    AutoEdit = False
    DataSet = tabPais
    Left = 648
    Top = 104
  end
  object tabGrupos: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 584
    Top = 153
  end
  object dtsGrupos: TDataSource
    AutoEdit = False
    DataSet = tabGrupos
    Left = 648
    Top = 153
  end
  object ACBrNFe1: TACBrNFe
    Configuracoes.Geral.FormaEmissao = teContingencia
    Configuracoes.Geral.PathSalvar = 'C:\Program Files\Borland\Delphi7\Bin\'
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 15000
    Configuracoes.WebServices.IntervaloTentativas = 1000
    Configuracoes.WebServices.AjustaAguardaConsultaRet = True
    Left = 843
    Top = 8
  end
  object tabTransportadoras: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 584
    Top = 201
  end
  object dtsTransportadoras: TDataSource
    AutoEdit = False
    DataSet = tabTransportadoras
    Left = 648
    Top = 201
  end
end

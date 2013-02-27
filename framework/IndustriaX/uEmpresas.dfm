inherited fmEmpresas: TfmEmpresas
  Left = 234
  Top = 153
  Caption = 'Empresas'
  ClientHeight = 397
  ClientWidth = 605
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 8
    Width = 77
    Height = 13
    Caption = 'C'#243'digo Empresa'
  end
  object Label2: TLabel [1]
    Left = 128
    Top = 8
    Width = 71
    Height = 13
    Caption = 'Nome Fantasia'
  end
  inherited pnlBotoes: TPanel
    Top = 336
    Width = 605
    TabOrder = 3
    inherited btnLocalizar: TSpeedButton
      OnClick = btnLocalizarClick
    end
  end
  object edtNomeFantasia: TDBEdit [3]
    Left = 128
    Top = 24
    Width = 469
    Height = 21
    DataField = 'NomeFantasia'
    DataSource = dtsBase
    TabOrder = 1
  end
  object edtCodigoEmpresa: TEdit [4]
    Left = 8
    Top = 24
    Width = 110
    Height = 21
    TabOrder = 0
    OnKeyPress = edtCodigoEmpresaKeyPress
    OnKeyUp = edtCodigoEmpresaKeyUp
  end
  object pgcEmpresas: TPageControl [5]
    Left = 8
    Top = 51
    Width = 590
    Height = 280
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
      object Label9: TLabel
        Left = 8
        Top = 160
        Width = 27
        Height = 13
        Caption = 'CNPJ'
      end
      object Label10: TLabel
        Left = 173
        Top = 160
        Width = 87
        Height = 13
        Caption = 'Inscri'#231#227'o Estadual'
      end
      object Label13: TLabel
        Left = 421
        Top = 202
        Width = 21
        Height = 13
        Caption = 'Site '
      end
      object Label4: TLabel
        Left = 265
        Top = 202
        Width = 28
        Height = 13
        Caption = 'E-mail'
      end
      object Label26: TLabel
        Left = 8
        Top = 43
        Width = 19
        Height = 13
        Caption = 'Cep'
      end
      object Label29: TLabel
        Left = 165
        Top = 43
        Width = 46
        Height = 13
        Caption = 'Endere'#231'o'
      end
      object Label27: TLabel
        Left = 8
        Top = 81
        Width = 37
        Height = 13
        Caption = 'Numero'
      end
      object Label31: TLabel
        Left = 98
        Top = 81
        Width = 27
        Height = 13
        Caption = 'Bairro'
      end
      object Label32: TLabel
        Left = 352
        Top = 81
        Width = 64
        Height = 13
        Caption = 'Complemento'
      end
      object Label34: TLabel
        Left = 356
        Top = 120
        Width = 33
        Height = 13
        Caption = 'Cidade'
      end
      object Label28: TLabel
        Left = 232
        Top = 120
        Width = 33
        Height = 13
        Caption = 'Estado'
      end
      object Label33: TLabel
        Left = 8
        Top = 120
        Width = 22
        Height = 13
        Caption = 'Pa'#237's'
      end
      object Label5: TLabel
        Left = 8
        Top = 202
        Width = 42
        Height = 13
        Caption = 'Telefone'
      end
      object Label6: TLabel
        Left = 136
        Top = 202
        Width = 17
        Height = 13
        Caption = 'Fax'
      end
      object Label7: TLabel
        Left = 339
        Top = 160
        Width = 91
        Height = 13
        Caption = 'Inscri'#231#227'o Municipal'
      end
      object Label8: TLabel
        Left = 461
        Top = 160
        Width = 59
        Height = 13
        Caption = 'CNAE Fiscal'
      end
      object edtRazaoSocial: TDBEdit
        Left = 8
        Top = 17
        Width = 565
        Height = 21
        DataField = 'RazaoSocial'
        DataSource = dtsBase
        TabOrder = 0
      end
      object edtCnpj: TDBEdit
        Left = 8
        Top = 176
        Width = 153
        Height = 21
        DataField = 'CNPJ'
        DataSource = dtsBase
        TabOrder = 10
        OnExit = edtCnpjExit
      end
      object edtIe: TDBEdit
        Left = 173
        Top = 176
        Width = 153
        Height = 21
        DataField = 'IE'
        DataSource = dtsBase
        TabOrder = 11
      end
      object edtSite: TDBEdit
        Left = 421
        Top = 218
        Width = 150
        Height = 21
        DataField = 'Site'
        DataSource = dtsBase
        TabOrder = 17
      end
      object edtEmail: TDBEdit
        Left = 265
        Top = 218
        Width = 150
        Height = 21
        DataField = 'Email'
        DataSource = dtsBase
        TabOrder = 16
      end
      object edtCep: TDBEdit
        Left = 8
        Top = 57
        Width = 119
        Height = 21
        DataField = 'Cep'
        DataSource = dtsBase
        TabOrder = 1
        OnExit = edtCepExit
      end
      object btnLocalizaCep: TBitBtn
        Left = 131
        Top = 56
        Width = 29
        Height = 22
        TabOrder = 2
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
      object edtEndereco: TDBEdit
        Left = 165
        Top = 57
        Width = 408
        Height = 21
        DataField = 'Endereco'
        DataSource = dtsBase
        TabOrder = 3
      end
      object edtNumero: TDBEdit
        Left = 8
        Top = 95
        Width = 81
        Height = 21
        DataField = 'Numero'
        DataSource = dtsBase
        TabOrder = 4
      end
      object edtBairro: TDBEdit
        Left = 98
        Top = 95
        Width = 243
        Height = 21
        DataField = 'Bairro'
        DataSource = dtsBase
        TabOrder = 5
      end
      object edtComplemento: TDBEdit
        Left = 352
        Top = 95
        Width = 220
        Height = 21
        DataField = 'Complemento'
        DataSource = dtsBase
        TabOrder = 6
      end
      object edtCidade: TDBLookupComboBox
        Left = 356
        Top = 134
        Width = 216
        Height = 21
        DataField = 'CodigoCidade'
        DataSource = dtsBase
        KeyField = 'CodigoCidade'
        ListField = 'Cidade'
        ListSource = dtsCidades
        TabOrder = 9
      end
      object edtEstado: TDBComboBox
        Left = 232
        Top = 134
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
        TabOrder = 8
      end
      object edtPais: TDBLookupComboBox
        Left = 8
        Top = 134
        Width = 212
        Height = 21
        DataField = 'CodigoPais'
        DataSource = dtsBase
        KeyField = 'CodigoPais'
        ListField = 'Pais'
        ListSource = dtsPais
        TabOrder = 7
      end
      object edtTelefone: TDBEdit
        Left = 8
        Top = 218
        Width = 120
        Height = 21
        DataField = 'Telefone'
        DataSource = dtsBase
        TabOrder = 14
      end
      object edtFax: TDBEdit
        Left = 136
        Top = 218
        Width = 120
        Height = 21
        DataField = 'Fax'
        DataSource = dtsBase
        TabOrder = 15
      end
      object edtIm: TDBEdit
        Left = 339
        Top = 176
        Width = 110
        Height = 21
        DataField = 'IM'
        DataSource = dtsBase
        TabOrder = 12
      end
      object edtCnaeFiscal: TDBEdit
        Left = 461
        Top = 176
        Width = 110
        Height = 21
        DataField = 'CNAEFiscal'
        DataSource = dtsBase
        TabOrder = 13
      end
    end
    object tbsTributos: TTabSheet
      Caption = 'Tributos'
      ImageIndex = 1
      object dbrCRT: TDBRadioGroup
        Left = 8
        Top = 8
        Width = 566
        Height = 107
        Caption = 'C'#243'digo do Regime Tribut'#225'rio'
        DataField = 'CRT'
        DataSource = dtsBase
        Items.Strings = (
          '1 - Simples Nacional.'
          '2 - Simples Nacional - Excesso de sublimite de receita bruta'
          '3 - Regime Normal')
        TabOrder = 0
        Values.Strings = (
          '1'
          '2'
          '3')
      end
      object dbrPis: TDBRadioGroup
        Left = 8
        Top = 123
        Width = 566
        Height = 53
        Caption = 'PIS'
        DataField = 'PISTipo'
        DataSource = dtsBase
        Items.Strings = (
          '99 - Outras Opera'#231#245'es')
        TabOrder = 1
        Values.Strings = (
          '99')
      end
      object dbrCofins: TDBRadioGroup
        Left = 8
        Top = 185
        Width = 566
        Height = 53
        Caption = 'COFINS'
        DataField = 'COFINSTipo'
        DataSource = dtsBase
        Items.Strings = (
          '99 - Outras Opera'#231#245'es')
        TabOrder = 2
        Values.Strings = (
          '99')
      end
    end
  end
  inherited tabBase: TZQuery
    Connection = fmMenu.zcnConexao
    Left = 624
    Top = 8
  end
  inherited dtsBase: TDataSource
    OnDataChange = dtsBaseDataChange
    Left = 712
    Top = 8
  end
  inherited popOpcoes: TPopupMenu
    Left = 497
    Top = 342
  end
  object tabPais: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 624
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
    Left = 624
    Top = 104
  end
  object dtsCidades: TDataSource
    AutoEdit = False
    DataSet = tabCidades
    Left = 712
    Top = 104
  end
  object tabChecagens: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 624
    Top = 152
  end
end

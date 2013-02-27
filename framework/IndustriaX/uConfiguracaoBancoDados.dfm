inherited fmConfiguracaoBancoDados: TfmConfiguracaoBancoDados
  Caption = 'Configura'#231#227'o do Banco'
  ClientHeight = 182
  ClientWidth = 258
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnOK: TBitBtn [0]
    Left = 89
    Top = 133
    Width = 78
    Height = 25
    Caption = '&OK'
    TabOrder = 1
    OnClick = btnOKClick
  end
  object btnCancelar: TBitBtn [1]
    Left = 171
    Top = 133
    Width = 78
    Height = 25
    Caption = '&Cancelar'
    TabOrder = 2
    OnClick = btnCancelarClick
  end
  object stpAvisos: TStatusBar [2]
    Left = 0
    Top = 163
    Width = 258
    Height = 19
    Panels = <
      item
        Text = 'Tabela:'
        Width = 200
      end
      item
        Text = 'Erros:'
        Width = 80
      end>
  end
  object GroupBox1: TGroupBox [3]
    Left = 8
    Top = 8
    Width = 241
    Height = 121
    Caption = 'Conex'#227'o'
    TabOrder = 0
    object Label1: TLabel
      Left = 38
      Top = 22
      Width = 42
      Height = 13
      Caption = 'Servidor:'
      FocusControl = edtServidor
    end
    object Label4: TLabel
      Left = 38
      Top = 62
      Width = 28
      Height = 13
      Caption = 'Porta:'
      FocusControl = edtPorta
    end
    object edtServidor: TEdit
      Left = 38
      Top = 36
      Width = 164
      Height = 21
      TabOrder = 0
    end
    object edtPorta: TEdit
      Left = 38
      Top = 75
      Width = 164
      Height = 21
      TabOrder = 1
    end
  end
  object zcnConfigura: TZConnection
    Left = 344
    Top = 176
  end
  object tabQuery: TZQuery
    Connection = zcnConfigura
    Params = <>
    Left = 344
    Top = 16
  end
  object tabBackup: TZQuery
    Connection = zcnConfigura
    Params = <>
    Left = 344
    Top = 67
  end
  object tabDefault: TZQuery
    Connection = zcnConfigura
    Params = <>
    Left = 344
    Top = 120
  end
end

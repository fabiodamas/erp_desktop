inherited fmUsuarios: TfmUsuarios
  Left = 269
  Top = 188
  Caption = 'Cadastro de Usu'#225'rios'
  ClientHeight = 125
  ClientWidth = 605
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 8
    Width = 36
    Height = 13
    Caption = 'Usu'#225'rio'
  end
  object Label2: TLabel [1]
    Left = 144
    Top = 8
    Width = 31
    Height = 13
    Caption = 'Senha'
  end
  object Label3: TLabel [2]
    Left = 280
    Top = 7
    Width = 23
    Height = 13
    Caption = 'Perfil'
  end
  inherited pnlBotoes: TPanel
    Top = 64
    Width = 605
    TabOrder = 3
  end
  object edtUsuario: TDBEdit [4]
    Left = 8
    Top = 24
    Width = 121
    Height = 21
    DataField = 'Usuario'
    DataSource = dtsBase
    TabOrder = 0
  end
  object edtSenha: TDBEdit [5]
    Left = 144
    Top = 24
    Width = 121
    Height = 21
    DataField = 'Senha'
    DataSource = dtsBase
    PasswordChar = '*'
    TabOrder = 1
  end
  object edtPerfil: TDBLookupComboBox [6]
    Left = 280
    Top = 24
    Width = 177
    Height = 21
    DataField = 'CodigoPerfil'
    DataSource = dtsBase
    KeyField = 'CodigoPerfil'
    ListField = 'Descricao'
    ListSource = dtsPerfil
    TabOrder = 2
  end
  inherited tabBase: TZQuery
    Connection = fmMenu.zcnConexao
    Left = 736
    Top = 8
  end
  inherited dtsBase: TDataSource
    Left = 800
    Top = 8
  end
  inherited popOpcoes: TPopupMenu
    Left = 763
    Top = 128
  end
  object tabPerfil: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 736
    Top = 56
  end
  object dtsPerfil: TDataSource
    AutoEdit = False
    DataSet = tabPerfil
    Left = 800
    Top = 56
  end
end

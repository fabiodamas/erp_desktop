inherited fmHorariosTrabalho: TfmHorariosTrabalho
  Caption = 'Hor'#225'rios de Trabalho'
  ClientHeight = 354
  ClientWidth = 606
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 6
    Width = 39
    Height = 13
    Caption = 'Semana'
  end
  object Label2: TLabel [1]
    Left = 129
    Top = 6
    Width = 46
    Height = 13
    Caption = 'Entrada 1'
  end
  object Label3: TLabel [2]
    Left = 209
    Top = 6
    Width = 38
    Height = 13
    Caption = 'Sa'#237'da 1'
  end
  object Label4: TLabel [3]
    Left = 297
    Top = 6
    Width = 46
    Height = 13
    Caption = 'Entrada 2'
  end
  object Label5: TLabel [4]
    Left = 377
    Top = 6
    Width = 38
    Height = 13
    Caption = 'Sa'#237'da 2'
  end
  object Label6: TLabel [5]
    Left = 457
    Top = 6
    Width = 51
    Height = 13
    Caption = 'Sequ'#234'ncia'
  end
  inherited pnlBotoes: TPanel
    Top = 293
    Width = 606
    inherited btnLocalizar: TSpeedButton
      OnClick = btnLocalizarClick
    end
  end
  object edtSemana: TDBEdit [7]
    Left = 8
    Top = 22
    Width = 109
    Height = 21
    DataField = 'Semana'
    DataSource = dtsBase
    TabOrder = 1
  end
  object edtEntrada1: TDBEdit [8]
    Left = 129
    Top = 22
    Width = 69
    Height = 21
    DataField = 'Entrada1'
    DataSource = dtsBase
    TabOrder = 2
  end
  object dbgHorarios: TDBGrid [9]
    Left = 8
    Top = 51
    Width = 591
    Height = 235
    DataSource = dtsBase
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object edtSaida1: TDBEdit [10]
    Left = 209
    Top = 22
    Width = 69
    Height = 21
    DataField = 'Saida1'
    DataSource = dtsBase
    TabOrder = 4
  end
  object edtEntrada2: TDBEdit [11]
    Left = 297
    Top = 22
    Width = 69
    Height = 21
    DataField = 'Entrada2'
    DataSource = dtsBase
    TabOrder = 5
  end
  object edtSaida2: TDBEdit [12]
    Left = 377
    Top = 22
    Width = 69
    Height = 21
    DataField = 'Saida2'
    DataSource = dtsBase
    TabOrder = 6
  end
  object edtSequencia: TDBEdit [13]
    Left = 457
    Top = 22
    Width = 56
    Height = 21
    DataField = 'Sequencia'
    DataSource = dtsBase
    Enabled = False
    TabOrder = 7
  end
  inherited tabBase: TZQuery
    Connection = fmMenu.zcnConexao
  end
  inherited dtsBase: TDataSource
    Left = 416
  end
  inherited popOpcoes: TPopupMenu
    Left = 384
    Top = 192
  end
end

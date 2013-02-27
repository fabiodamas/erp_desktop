inherited fmSetorTrabalho: TfmSetorTrabalho
  Left = 232
  Top = 152
  Caption = 'Setor de Trabalho'
  ClientHeight = 389
  ClientWidth = 605
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 96
    Top = 4
    Width = 25
    Height = 13
    Caption = 'Setor'
  end
  object Label1: TLabel [1]
    Left = 8
    Top = 4
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  inherited pnlBotoes: TPanel
    Top = 328
    Width = 605
    TabOrder = 3
  end
  object edtSetor: TDBEdit [3]
    Left = 96
    Top = 20
    Width = 502
    Height = 21
    DataField = 'Descricao'
    DataSource = dtsBase
    TabOrder = 1
  end
  object edtCodigo: TDBEdit [4]
    Left = 8
    Top = 20
    Width = 81
    Height = 21
    DataField = 'Codigo'
    DataSource = dtsBase
    Enabled = False
    TabOrder = 0
  end
  object dbgSetor: TDBGrid [5]
    Left = 8
    Top = 48
    Width = 590
    Height = 273
    DataSource = dtsBase
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = 'Setor'
        Width = 449
        Visible = True
      end>
  end
  inherited tabBase: TZQuery
    Connection = fmMenu.zcnConexao
    Left = 608
    Top = 24
  end
  inherited dtsBase: TDataSource
    Left = 680
    Top = 24
  end
  inherited popOpcoes: TPopupMenu
    Left = 600
    Top = 128
  end
end

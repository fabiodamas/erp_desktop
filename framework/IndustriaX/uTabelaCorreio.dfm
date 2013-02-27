inherited fmTabelaCorreio: TfmTabelaCorreio
  Left = 233
  Top = 154
  Caption = 'Tabela Correio'
  ClientHeight = 399
  ClientWidth = 607
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 8
    Top = 6
    Width = 23
    Height = 13
    Caption = 'Data'
  end
  object Label3: TLabel [1]
    Left = 129
    Top = 6
    Width = 33
    Height = 13
    Caption = 'Pedido'
  end
  object Label1: TLabel [2]
    Left = 249
    Top = 6
    Width = 67
    Height = 13
    Caption = 'Valor Cobrado'
  end
  object Label4: TLabel [3]
    Left = 378
    Top = 6
    Width = 60
    Height = 13
    Caption = 'Valor Correio'
  end
  object Label5: TLabel [4]
    Left = 494
    Top = 6
    Width = 68
    Height = 13
    Caption = 'Conhecimento'
  end
  inherited pnlBotoes: TPanel
    Top = 338
    Width = 607
    TabOrder = 6
  end
  object edtData: TDBDateEdit [6]
    Left = 8
    Top = 22
    Width = 107
    Height = 21
    DataField = 'Data'
    DataSource = dtsBase
    NumGlyphs = 2
    TabOrder = 0
  end
  object edtPedido: TDBEdit [7]
    Left = 129
    Top = 22
    Width = 104
    Height = 21
    DataField = 'Pedido'
    DataSource = dtsBase
    TabOrder = 1
  end
  object edtValorCobrado: TDBEdit [8]
    Left = 249
    Top = 22
    Width = 101
    Height = 21
    DataField = 'ValorCobrado'
    DataSource = dtsBase
    Enabled = False
    TabOrder = 2
  end
  object edtValorCorreio: TDBEdit [9]
    Left = 378
    Top = 22
    Width = 101
    Height = 21
    DataField = 'ValorCorreio'
    DataSource = dtsBase
    TabOrder = 3
  end
  object dbgTabelaCorreio: TDBGrid [10]
    Left = 8
    Top = 56
    Width = 590
    Height = 273
    DataSource = dtsBase
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Data'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pedido'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValorCobrado'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValorCorreio'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValorTotal'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Conhecimento'
        Width = 126
        Visible = True
      end>
  end
  object edtConhecimento: TDBEdit [11]
    Left = 494
    Top = 22
    Width = 104
    Height = 21
    DataField = 'Conhecimento'
    DataSource = dtsBase
    TabOrder = 4
  end
  inherited popGrid: TPopupMenu
    Left = 144
    Top = 216
  end
  inherited tabBase: TZQuery
    Connection = fmMenu.zcnConexao
    Left = 664
    Top = 16
  end
  inherited dtsBase: TDataSource
    Left = 720
    Top = 16
  end
  inherited popOpcoes: TPopupMenu
    Left = 515
    Top = 312
  end
end

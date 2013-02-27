inherited fmSubGrupo: TfmSubGrupo
  Caption = 'Sub-Grupos'
  ClientHeight = 335
  ClientWidth = 606
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 6
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel [1]
    Left = 6
    Top = 54
    Width = 48
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object lbl1: TLabel [2]
    Left = 72
    Top = 6
    Width = 29
    Height = 13
    Caption = 'Grupo'
  end
  inherited pnlBotoes: TPanel
    Top = 274
    Width = 606
    inherited btnLocalizar: TSpeedButton
      OnClick = btnLocalizarClick
    end
  end
  object edtCodigo: TDBEdit [4]
    Left = 8
    Top = 22
    Width = 57
    Height = 21
    DataField = 'CodigoSubGrupo'
    DataSource = dtsBase
    Enabled = False
    TabOrder = 1
  end
  object edtDescricao: TDBEdit [5]
    Left = 6
    Top = 70
    Width = 585
    Height = 21
    DataField = 'Descricao'
    DataSource = dtsBase
    TabOrder = 2
  end
  object edtGrupo: TDBLookupComboBox [6]
    Left = 72
    Top = 22
    Width = 521
    Height = 21
    Hint = 'aaaaaaaaa'
    DataField = 'CodigoGrupo'
    DataSource = dtsBase
    KeyField = 'Codigo'
    ListField = 'Descricao'
    ListSource = dtsGrupos
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object dbgSubGrupos: TcxGrid [7]
    Left = 0
    Top = 96
    Width = 591
    Height = 169
    TabOrder = 4
    LookAndFeel.NativeStyle = True
    LookAndFeel.SkinName = 'Blue'
    object tvwSubGrupos: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dtsBase
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnHiding = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsCustomize.DataRowSizing = True
      object clmCodigoSubGrupo: TcxGridDBColumn
        DataBinding.FieldName = 'CodigoSubGrupo'
        Width = 96
      end
      object clmGrupo: TcxGridDBColumn
        Caption = 'Grupo'
        DataBinding.FieldName = 'CodigoGrupo'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'Codigo'
        Properties.ListColumns = <
          item
            FieldName = 'Descricao'
          end>
        Properties.ListSource = dtsGrupos
        Width = 204
      end
      object clmDescricao: TcxGridDBColumn
        Caption = 'Descri'#231#227'o'
        DataBinding.FieldName = 'Descricao'
        Width = 251
      end
    end
    object lvlSubGrupos: TcxGridLevel
      GridView = tvwSubGrupos
    end
  end
  inherited tabBase: TZQuery
    Connection = fmMenu.zcnConexao
    Left = 688
    Top = 24
  end
  inherited dtsBase: TDataSource
    Left = 776
    Top = 48
  end
  inherited popOpcoes: TPopupMenu
    Left = 384
    Top = 192
  end
  object tabGrupos: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 656
    Top = 136
  end
  object dtsGrupos: TDataSource
    AutoEdit = False
    DataSet = tabGrupos
    Left = 752
    Top = 136
  end
end

inherited fmLocalizarSetores: TfmLocalizarSetores
  Left = 234
  Top = 152
  Caption = 'Localizar Setores'
  ClientHeight = 398
  ClientWidth = 663
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_codigo: TLabel
    Left = 8
    Top = 8
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
    FocusControl = edt_setor_codigo
  end
  object Label1: TLabel
    Left = 107
    Top = 8
    Width = 48
    Height = 13
    Caption = 'Descri'#231#227'o'
    FocusControl = edt_setor_descricao
  end
  object edt_setor_codigo: TEdit
    Left = 8
    Top = 24
    Width = 89
    Height = 21
    TabOrder = 0
  end
  object edt_setor_descricao: TEdit
    Left = 107
    Top = 24
    Width = 549
    Height = 21
    TabOrder = 1
  end
  object btn_localizar: TBitBtn
    Left = 550
    Top = 0
    Width = 105
    Height = 17
    Caption = 'Localizar'
    TabOrder = 7
    OnClick = btn_localizarClick
  end
  object dbg_localizar: TDBGrid
    Left = 8
    Top = 53
    Width = 648
    Height = 305
    DataSource = dts_setor
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = dbg_localizarCellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Title.Caption = 'C'#243'digo'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 505
        Visible = True
      end>
  end
  object edt_codigo_selecionado: TEdit
    Left = 8
    Top = 369
    Width = 89
    Height = 21
    TabOrder = 3
  end
  object edt_nome_selecionado: TEdit
    Left = 104
    Top = 369
    Width = 390
    Height = 21
    TabOrder = 4
  end
  object btn_ok: TBitBtn
    Left = 501
    Top = 365
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 5
    OnClick = btn_okClick
  end
  object btn_cancelar: TBitBtn
    Left = 581
    Top = 365
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 6
    OnClick = btn_cancelarClick
  end
  object tab_setor: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 744
    Top = 24
  end
  object dts_setor: TDataSource
    AutoEdit = False
    DataSet = tab_setor
    Left = 840
    Top = 24
  end
end

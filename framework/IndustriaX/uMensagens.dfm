inherited fmMensagens: TfmMensagens
  Left = 155
  Top = 95
  Caption = 'Mensagens'
  ClientHeight = 374
  ClientWidth = 1028
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoes: TPanel
    Left = 672
    Top = 141
    Width = 606
    Align = alNone
  end
  object dbgMensagem: TcxGrid [1]
    Left = 0
    Top = 0
    Width = 1028
    Height = 374
    Align = alClient
    TabOrder = 1
    object tvwMensagem: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dtsBase
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnHiding = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsCustomize.DataRowSizing = True
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.DataRowHeight = 57
      object clmMensagemCodigoMensagem: TcxGridDBColumn
        Caption = 'C'#243'digo da Mensagem'
        DataBinding.FieldName = 'CodigoMensagem'
        Width = 115
      end
      object clmMensagemUsuarioOrigem: TcxGridDBColumn
        Caption = 'Usu'#225'rio de Origem'
        DataBinding.FieldName = 'UsuarioOrigem'
        Width = 109
      end
      object clmMensagemCodigoPerfilDestino: TcxGridDBColumn
        DataBinding.FieldName = 'CodigoPerfilDestino'
        Visible = False
        Width = 125
      end
      object clmMensagemUsuario: TcxGridDBColumn
        Caption = 'Usu'#225'rio de Destino'
        DataBinding.FieldName = 'Usuario'
        Width = 108
      end
      object clmMensagemDataEnvio: TcxGridDBColumn
        Caption = 'Data do Envio'
        DataBinding.FieldName = 'DataEnvio'
        Width = 82
      end
      object clmMensagemHoraEnvio: TcxGridDBColumn
        Caption = 'Hora do Envio'
        DataBinding.FieldName = 'HoraEnvio'
        Width = 80
      end
      object clmMensagemConfirmarLeitura: TcxGridDBColumn
        Caption = 'Leitura Confirmada?'
        DataBinding.FieldName = 'ConfirmarLeitura'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Width = 103
      end
      object clmMensagemDataLeitura: TcxGridDBColumn
        Caption = 'Data da Leitura'
        DataBinding.FieldName = 'DataLeitura'
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 83
      end
      object clmMensagemHoraLeitura: TcxGridDBColumn
        Caption = 'Hora da Leitura'
        DataBinding.FieldName = 'HoraLeitura'
        PropertiesClassName = 'TcxTimeEditProperties'
        Width = 85
      end
      object clmMensagemOrigem: TcxGridDBColumn
        DataBinding.FieldName = 'Origem'
        Width = 91
      end
      object clmMensagemDescricao: TcxGridDBColumn
        Caption = 'Mensagem'
        DataBinding.FieldName = 'Descricao'
        PropertiesClassName = 'TcxMemoProperties'
        Width = 159
      end
    end
    object lvlMensagem: TcxGridLevel
      GridView = tvwMensagem
    end
  end
  inherited popGrid: TPopupMenu
    Left = 216
    Top = 144
  end
  inherited tabBase: TZQuery
    Connection = fmMenu.zcnConexao
    Left = 504
    Top = 256
  end
  inherited dtsBase: TDataSource
    Left = 520
    Top = 240
  end
  inherited popOpcoes: TPopupMenu
    Left = 576
    Top = 208
  end
end

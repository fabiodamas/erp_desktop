inherited fmFormBaseConfig: TfmFormBaseConfig
  Left = 502
  Top = 284
  Caption = 'Form Config'
  OldCreateOrder = True
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object popGrid: TPopupMenu
    Left = 104
    Top = 32
    object Copiar2: TMenuItem
      Caption = 'Copiar'
      OnClick = Copiar2Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object ExportarparaoExcel1: TMenuItem
      Caption = 'Exportar para o Excel...'
      OnClick = ExportarparaoExcel1Click
    end
  end
end

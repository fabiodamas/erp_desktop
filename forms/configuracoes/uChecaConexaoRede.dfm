inherited fmChecaConexaoRede: TfmChecaConexaoRede
  Left = 351
  Top = 305
  Caption = 'Checando Conex'#227'o com Servidor'
  ClientHeight = 361
  ClientWidth = 533
  PixelsPerInch = 96
  TextHeight = 13
  object edtLog: TMemo [0]
    Left = 8
    Top = 8
    Width = 517
    Height = 284
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object pnlStatus: TPanel [1]
    Left = 8
    Top = 296
    Width = 518
    Height = 57
    Caption = 'Desconectado do Servidor.'
    Color = clRed
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object IdIcmpClient1: TIdIcmpClient
    Left = 120
    Top = 144
  end
  object tmrPing: TTimer
    Interval = 10000
    OnTimer = tmrPingTimer
    Left = 56
    Top = 144
  end
end

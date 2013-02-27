object fmConectando: TfmConectando
  Left = 452
  Top = 338
  BorderStyle = bsNone
  Caption = 'Conectando...'
  ClientHeight = 126
  ClientWidth = 352
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlStatus: TPanel
    Left = 0
    Top = 0
    Width = 352
    Height = 126
    Align = alClient
    Caption = 'Conectando ao Servidor...'
    Color = clInactiveBorder
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
end

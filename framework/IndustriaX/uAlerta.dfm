object frmAlerta: TfrmAlerta
  Left = 378
  Top = 162
  BorderStyle = bsToolWindow
  Caption = 'Alerta'
  ClientHeight = 224
  ClientWidth = 364
  Color = clYellow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl2: TLabel
    Left = 0
    Top = 0
    Width = 364
    Height = 29
    Align = alTop
    Alignment = taCenter
    Caption = 'Aviso'
    Color = clRed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object retAviso: TRichEdit
    Left = 0
    Top = 29
    Width = 364
    Height = 154
    Align = alClient
    BorderStyle = bsNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object pnl1: TPanel
    Left = 0
    Top = 183
    Width = 364
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btn1: TButton
      Left = 128
      Top = 8
      Width = 121
      Height = 25
      Caption = 'Confirmar Leitura'
      TabOrder = 0
      OnClick = btn1Click
    end
  end
end

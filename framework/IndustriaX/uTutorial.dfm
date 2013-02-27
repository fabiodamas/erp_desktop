object fmTutorial: TfmTutorial
  Left = 234
  Top = 225
  BorderStyle = bsToolWindow
  Caption = 'Acesso R'#225'pido'
  ClientHeight = 308
  ClientWidth = 266
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object shp7: TShape
    Left = 3
    Top = 267
    Width = 33
    Height = 33
    Brush.Color = 10244608
    Pen.Color = 10244608
    Shape = stCircle
  end
  object shp6: TShape
    Left = 2
    Top = 231
    Width = 33
    Height = 33
    Brush.Color = 10244608
    Pen.Color = 10244608
    Shape = stCircle
  end
  object shp5: TShape
    Left = 2
    Top = 195
    Width = 33
    Height = 33
    Brush.Color = 10244608
    Pen.Color = 10244608
    Shape = stCircle
  end
  object shp4: TShape
    Left = 2
    Top = 160
    Width = 33
    Height = 33
    Brush.Color = 10244608
    Pen.Color = 10244608
    Shape = stCircle
  end
  object shp2: TShape
    Left = 2
    Top = 90
    Width = 33
    Height = 33
    Brush.Color = 10244608
    Pen.Color = 10244608
    Shape = stCircle
  end
  object shp1: TShape
    Left = 2
    Top = 55
    Width = 33
    Height = 33
    Brush.Color = 10244608
    Pen.Color = 10244608
    Shape = stCircle
  end
  object lbl1: TLabel
    Left = 13
    Top = 59
    Width = 10
    Height = 24
    Caption = '1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl2: TLabel
    Left = 39
    Top = 62
    Width = 164
    Height = 20
    Cursor = crHandPoint
    Caption = 'Cadastre seus Clientes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = lbl2Click
    OnMouseMove = lbl2MouseMove
    OnMouseLeave = lbl2MouseLeave
  end
  object lbl3: TLabel
    Left = 13
    Top = 94
    Width = 10
    Height = 24
    Caption = '2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl4: TLabel
    Left = 39
    Top = 97
    Width = 206
    Height = 20
    Cursor = crHandPoint
    Caption = 'Cadastre seus Fornecedores'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = lbl4Click
    OnMouseMove = lbl2MouseMove
    OnMouseLeave = lbl2MouseLeave
  end
  object lbl5: TLabel
    Left = 0
    Top = 0
    Width = 266
    Height = 49
    Align = alTop
    Alignment = taCenter
    AutoSize = False
    Caption = 'Tutorial'
    Color = 10244608
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -48
    Font.Name = 'Arial Rounded MT Bold'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object shp3: TShape
    Left = 2
    Top = 126
    Width = 33
    Height = 33
    Brush.Color = 10244608
    Pen.Color = 10244608
    Shape = stCircle
  end
  object lbl7: TLabel
    Left = 39
    Top = 131
    Width = 198
    Height = 20
    Cursor = crHandPoint
    Caption = 'Cadastre seus Funcion'#225'rios'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = lbl7Click
    OnMouseMove = lbl2MouseMove
    OnMouseLeave = lbl2MouseLeave
  end
  object lbl6: TLabel
    Left = 13
    Top = 130
    Width = 10
    Height = 24
    Caption = '3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl8: TLabel
    Left = 13
    Top = 164
    Width = 10
    Height = 24
    Caption = '4'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl9: TLabel
    Left = 39
    Top = 167
    Width = 201
    Height = 20
    Cursor = crHandPoint
    Caption = 'Defina sua Empresa e Filiais'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = lbl9Click
    OnMouseMove = lbl2MouseMove
    OnMouseLeave = lbl2MouseLeave
  end
  object lbl10: TLabel
    Left = 13
    Top = 199
    Width = 10
    Height = 24
    Caption = '5'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl11: TLabel
    Left = 39
    Top = 202
    Width = 224
    Height = 20
    Cursor = crHandPoint
    Caption = 'Cadastre suas Transportadoras'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = lbl11Click
    OnMouseMove = lbl2MouseMove
    OnMouseLeave = lbl2MouseLeave
  end
  object lbl12: TLabel
    Left = 13
    Top = 235
    Width = 10
    Height = 24
    Caption = '6'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl13: TLabel
    Left = 39
    Top = 236
    Width = 171
    Height = 20
    Cursor = crHandPoint
    Caption = 'Cadastre seus Produtos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = lbl13Click
    OnMouseMove = lbl2MouseMove
    OnMouseLeave = lbl2MouseLeave
  end
  object lbl14: TLabel
    Left = 14
    Top = 271
    Width = 10
    Height = 24
    Caption = '7'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lbl15: TLabel
    Left = 40
    Top = 272
    Width = 188
    Height = 20
    Cursor = crHandPoint
    Caption = 'Crie seu Pedido de Venda!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = lbl15Click
    OnMouseMove = lbl2MouseMove
    OnMouseLeave = lbl2MouseLeave
  end
end

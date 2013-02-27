inherited fmPainelGerencial: TfmPainelGerencial
  Left = 234
  Top = 154
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Painel Gerencial'
  ClientHeight = 513
  ClientWidth = 758
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgcPainelGerencial: TPageControl [0]
    Left = 0
    Top = 0
    Width = 758
    Height = 513
    ActivePage = tbsVendas
    Align = alClient
    TabOrder = 0
    object tbsVendas: TTabSheet
      Caption = 'Vendas'
      object pgcVendas: TPageControl
        Left = 0
        Top = 0
        Width = 750
        Height = 485
        ActivePage = tbsVendasAnual
        Align = alClient
        TabOrder = 0
        object tbsVendasMensal: TTabSheet
          Caption = 'Mensal'
          object chtVendasMensal: TChart
            Left = 0
            Top = 0
            Width = 742
            Height = 457
            BackWall.Brush.Color = clWhite
            BackWall.Brush.Style = bsClear
            Title.Text.Strings = (
              'TChart')
            Align = alClient
            TabOrder = 0
            object Series1: TBarSeries
              ColorEachPoint = True
              Marks.ArrowLength = 20
              Marks.Style = smsValue
              Marks.Visible = True
              SeriesColor = clRed
              ValueFormat = 'R$ #,##0.###'
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1.000000000000000000
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Bar'
              YValues.Multiplier = 1.000000000000000000
              YValues.Order = loNone
            end
          end
        end
        object tbsVendasAnual: TTabSheet
          Caption = 'Vendedores Mensal'
          ImageIndex = 1
          object chtVendasVendedorMensal: TChart
            Left = 0
            Top = 0
            Width = 742
            Height = 457
            BackWall.Brush.Color = clWhite
            BackWall.Brush.Style = bsClear
            Title.Text.Strings = (
              'TChart')
            BottomAxis.Automatic = False
            BottomAxis.AutomaticMaximum = False
            BottomAxis.AutomaticMinimum = False
            BottomAxis.Maximum = 5.000000000000004000
            Align = alClient
            TabOrder = 0
            object Series2: TFastLineSeries
              Marks.ArrowLength = 8
              Marks.Style = smsValue
              Marks.Visible = False
              SeriesColor = clRed
              LinePen.Color = clRed
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1.000000000000000000
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1.000000000000000000
              YValues.Order = loNone
            end
            object Series3: TFastLineSeries
              Marks.ArrowLength = 8
              Marks.Style = smsValue
              Marks.Visible = False
              SeriesColor = clGreen
              LinePen.Color = clGreen
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1.000000000000000000
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1.000000000000000000
              YValues.Order = loNone
            end
          end
        end
      end
    end
  end
  inherited popGrid: TPopupMenu
    Left = 456
    Top = 128
  end
  object tabVendas: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 368
    Top = 104
  end
  object tabChecagens: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 392
    Top = 152
  end
end

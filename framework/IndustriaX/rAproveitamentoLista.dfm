inherited rtAproveitamentoLista: TrtAproveitamentoLista
  Caption = 'Aproveitamento - Lista de Impress'#227'o'
  ClientHeight = 218
  ClientWidth = 455
  PixelsPerInch = 96
  TextHeight = 13
  inherited btnVisualizar: TBitBtn
    OnClick = btn_imprimirClick
  end
  inherited btnFechar: TBitBtn
    OnClick = btn_fecharClick
  end
end

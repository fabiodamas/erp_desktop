inherited fmLogUsuarios: TfmLogUsuarios
  Left = 234
  Top = 153
  Caption = 'Log de Usu'#225'rios'
  ClientHeight = 478
  ClientWidth = 698
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 8
    Top = 9
    Width = 53
    Height = 13
    Caption = 'Data Inicial'
    FocusControl = edtDataInicial
  end
  object Label6: TLabel [1]
    Left = 136
    Top = 9
    Width = 48
    Height = 13
    Caption = 'Data Final'
    FocusControl = edtDataFinal
  end
  object Label1: TLabel [2]
    Left = 264
    Top = 9
    Width = 69
    Height = 13
    Caption = 'Tipo Altera'#231#227'o'
    FocusControl = edtDataFinal
  end
  object lblStatus: TLabel [3]
    Left = 8
    Top = 448
    Width = 337
    Height = 13
    AutoSize = False
    Caption = 'Listando'
    Font.Charset = ANSI_CHARSET
    Font.Color = clGreen
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel [4]
    Left = 360
    Top = 456
    Width = 54
    Height = 13
    Caption = 'Inclus'#245'es'
    Font.Charset = ANSI_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel [5]
    Left = 419
    Top = 456
    Width = 61
    Height = 13
    Caption = 'Altera'#231#245'es'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel [6]
    Left = 485
    Top = 456
    Width = 55
    Height = 13
    Caption = 'Exclus'#245'es'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel [7]
    Left = 418
    Top = 9
    Width = 36
    Height = 13
    Caption = 'Usu'#225'rio'
    FocusControl = edtDataFinal
  end
  object dbgLog: TDBGrid [8]
    Left = 8
    Top = 56
    Width = 681
    Height = 385
    DataSource = dtsLogArquivos
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawDataCell = dbgLogDrawDataCell
  end
  object btnFechar: TBitBtn [9]
    Left = 555
    Top = 447
    Width = 134
    Height = 25
    Caption = 'Fechar'
    TabOrder = 5
    OnClick = btnFecharClick
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      08000000000000020000120B0000120B0000000100000000000000000000FFFF
      FF00FF00FF00FCD1D3004E1E1F00C54D4E00C9525300C24F5000D4585900C954
      5500CF575800CB555600D75C5D00D55C5D00D05A5B00CF595A00B74F5200B24D
      4E00B64F5000D55E5F00BD535600D75F6000DD636400C2575A00C6595B00E267
      6800DD656600DA636400E3686900DE666700EB6D6E00E96C6D00F2737400F073
      7400EE727300F7777900D1656600F0757600F6797A00F77A7B00FE7F8000FB7E
      7F00FF818200FC7F8000DA6E6F00FF828300FE818200FF838400E5767700E073
      7400E2757600FF868700FF888900CF6E7000CB6C6D00CC6E7000FE8B8C00EB81
      8200E67E7F009C565700FB9A9C00F8AAAB00F7B5B600FAD3D400A64B4B00A94D
      4D00F8787900D76B6B00CF6E6E00824B4B00FAEBC500FCEFC700FFF2CC00FCFB
      CF00FCFBD100FFFFD300FFFFD400FFFFD500FFFFD700E6FCC700A5D8970050D1
      6F0026B149002AB44D001BBB490023B54A002DC7580042C966000CBC410010BB
      430013C1480013BC450016BD480016BC48001CBF4C001EBC4C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000020202020202
      0245040202020202020202020202020202503B02020202020202020202024545
      4041040202020202020202020202505037503B02020202020202020245451207
      0511044545454545450202025050505050503B50505050505002020245080B09
      061004383C3D3E3E450202025050505050503B3F3F3F3F3F50020202450C0E0F
      0A1404555A5C583E450202025050505050503B3737373B3F5002020245161513
      0D1704535E5F5B3E450202025050505050503B505050373F50020202451C1A1B
      1D1804525D54593E450202025050505050503B3737503B3F50020202451E193A
      3F3704505157563E450202025050505001503B3F5050503F5002020245201F39
      033504484E4C4F3E450202025050503E01503B0101013F3F5002020245422522
      212404474D4B4E3E45020202503E505050503B010101013F5002020245282726
      234304474D4B4D3E45020202503F3E3E3E503B010101013F50020202452F2B29
      282C04474D4B4D3E45020202503F3F3F3F503B010101013F5002020245342D2A
      2D3104474D4B4D3E45020202503F3F3F3F503B3F0101013F500202024545322E
      333004464A494A3E450202025050503F3F503B3F0101013F500202020202453B
      3644044545454545450202020202505050503B50505050505002020202020202
      4545040202020202020202020202020250503B02020202020202}
    NumGlyphs = 2
  end
  object edtDataInicial: TDateEdit [10]
    Left = 8
    Top = 25
    Width = 121
    Height = 21
    NumGlyphs = 2
    YearDigits = dyFour
    TabOrder = 0
  end
  object edtDataFinal: TDateEdit [11]
    Left = 136
    Top = 25
    Width = 121
    Height = 21
    NumGlyphs = 2
    YearDigits = dyFour
    TabOrder = 1
  end
  object edtTipoAlteracao: TComboBox [12]
    Left = 264
    Top = 25
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 2
    Text = 'Todos'
    Items.Strings = (
      'Todos'
      'Inclu'#245'es'
      'Altera'#231#245'es'
      'Exclus'#245'es')
  end
  object btnAtualizar: TBitBtn [13]
    Left = 594
    Top = 21
    Width = 95
    Height = 25
    Caption = 'Atualizar'
    TabOrder = 3
    OnClick = btnAtualizarClick
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      08000000000000020000120B0000120B0000000100000000000000000000FFFF
      FF00FF00FF0001570300079110000D9A1B0013A1230017A92C0017A72A0020B4
      3B0025BB430024B841002AC04B002FC5530031C7560031C7570037CE60003AD1
      660084FEFB0087FFFE00D7FCFB0056DCDD00A5FFFF00C0FFFF007DFAFE0062F8
      FF0077F7FF007BF0F60080F8FE0057F4FF005BF4FF0062DCE7008EF6FF0063DE
      EA00ABF0F70095D0D70045CAE0004BD9F00072EAFF002AB7D50053CCE3005BDC
      F70062E5FF0016B7DD0023D7FF002CD5FF0051D3F2005CE1FF0057D0ED0068D7
      F3009EE0F00011BBEA0015CEFE0016CEFE0014B8E50018CBFE0018C9FB0018C7
      F7001ACFFF001ACBFC001DA4CB003C95AF004FB4D10054ABC2004991A4006EDA
      F70078DDF700B4E1EE00A1C4CE0018BFF00043A7C50051BDDE00ADDEEE008AAC
      B600189ED00089CEE500097DAC000976A3000C86B8001284B200159ACE00179E
      D1001A92C0001D7292002180A50040A1C7000274A9000273A700026898000265
      920009729F00096D9800B7DAE900FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000020202020202
      0202565656565656020202020202020202024949494949490202020202020202
      024C3C36452E474E560202020202020202494949445C44494902020202020202
      0259152B3A2A4151560202020202020202494449445C5C494902020256565603
      03030334372F3150560202024949494040404044445C5C494902024C3C360304
      0356192C2D26424A560202494949404940495C44445C5C494902025615030503
      405923324844434B560202494440494049495C14145C145C4902020303070B0E
      03033E52035B54555602024040494944404044494049494449020256030F1111
      035627030603464D560202494044444440494440494044494902025622031103
      49560308090C034F59020249144044405C49404949494049490202563E52035A
      5303030A0D100303560202494449404949404049494440404902025627333928
      3D56170311031C2556020249444944444949014044405C44490202561E343830
      3F59031103131221560202495C44445C44494044405C5C5C490202561D353B29
      0303030356565656020202495C44445C40404040494949490202025617201A18
      1B245802020202020202024901145C5C5C44490202020202020202565C141613
      121F570202020202020202491401145C5C5C4902020202020202020257565656
      5656020202020202020202024949494949490202020202020202}
    NumGlyphs = 2
  end
  object edtUsuario: TDBLookupComboBox [14]
    Left = 418
    Top = 24
    Width = 169
    Height = 21
    KeyField = 'Usuario'
    ListField = 'Usuario'
    ListSource = dtsUsuario
    TabOrder = 6
  end
  object lbl3: TcxLabel [15]
    Left = 296
    Top = 248
    Caption = 'lbl3'
  end
  object tabLogArquivos: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 160
    Top = 144
  end
  object dtsLogArquivos: TDataSource
    AutoEdit = False
    DataSet = tabLogArquivos
    Left = 304
    Top = 144
  end
  object tabUsuario: TZQuery
    Connection = fmMenu.zcnConexao
    Params = <>
    Left = 160
    Top = 200
  end
  object dtsUsuario: TDataSource
    AutoEdit = False
    DataSet = tabUsuario
    Left = 304
    Top = 200
  end
end

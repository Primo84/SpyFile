object Form1: TForm1
  Left = 152
  Top = 95
  Width = 760
  Height = 534
  Caption = 'Kliient'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 536
    Top = 40
    Width = 34
    Height = 29
    Caption = 'of'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -23
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 688
    Top = 40
    Width = 26
    Height = 29
    Caption = 'kb'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -23
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 48
    Width = 24
    Height = 26
    Caption = 'IP'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clRed
    Font.Height = -24
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 16
    Width = 48
    Height = 26
    Caption = 'Host'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clRed
    Font.Height = -24
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 408
    Top = 8
    Width = 152
    Height = 29
    Caption = 'T r a n s f e r '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -23
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 704
    Top = 8
    Width = 33
    Height = 29
    Caption = '/s'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -23
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 680
    Top = 8
    Width = 26
    Height = 29
    Caption = 'kb'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -23
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 240
    Top = 368
    Width = 94
    Height = 29
    Caption = 'rozmiar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -23
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 472
    Top = 368
    Width = 20
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -23
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 448
    Top = 368
    Width = 26
    Height = 29
    Caption = 'kb'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -23
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object proc: TGauge
    Left = 200
    Top = 8
    Width = 201
    Height = 33
    BackColor = clSkyBlue
    Color = clSkyBlue
    ForeColor = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxValue = 0
    ParentColor = False
    ParentFont = False
    Progress = 0
  end
  object Button1: TButton
    Left = 448
    Top = 80
    Width = 113
    Height = 33
    Caption = 'Sprawdz polaczenie'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 568
    Top = 80
    Width = 105
    Height = 33
    Caption = 'Pobierz liste dysk'#243'w'
    TabOrder = 1
    OnClick = Button2Click
  end
  object ComboBox1: TComboBox
    Left = 576
    Top = 120
    Width = 161
    Height = 22
    Style = csOwnerDrawVariable
    DragMode = dmAutomatic
    ItemHeight = 16
    TabOrder = 2
  end
  object ListBox1: TListBox
    Left = 576
    Top = 144
    Width = 161
    Height = 177
    ItemHeight = 13
    TabOrder = 3
  end
  object Button3: TButton
    Left = 672
    Top = 80
    Width = 75
    Height = 33
    Caption = 'zaladuj dysk'
    TabOrder = 4
    OnClick = Button3Click
  end
  object ListBox2: TListBox
    Left = 320
    Top = 120
    Width = 249
    Height = 201
    ItemHeight = 13
    ScrollWidth = 600
    TabOrder = 5
  end
  object BitBtn1: TBitBtn
    Left = 616
    Top = 336
    Width = 49
    Height = 25
    TabOrder = 6
    OnClick = BitBtn1Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333FF3333333333333003333
      3333333333773FF3333333333309003333333333337F773FF333333333099900
      33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
      99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
      33333333337F3F77333333333309003333333333337F77333333333333003333
      3333333333773333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 568
    Top = 336
    Width = 49
    Height = 25
    TabOrder = 7
    OnClick = BitBtn2Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333FF3333333333333003333333333333F77F33333333333009033
      333333333F7737F333333333009990333333333F773337FFFFFF330099999000
      00003F773333377777770099999999999990773FF33333FFFFF7330099999000
      000033773FF33777777733330099903333333333773FF7F33333333333009033
      33333333337737F3333333333333003333333333333377333333333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
  end
  object StaticText1: TStaticText
    Left = 16
    Top = 416
    Width = 729
    Height = 25
    AutoSize = False
    Color = clMoneyGreen
    ParentColor = False
    TabOrder = 8
  end
  object BitBtn3: TBitBtn
    Left = 240
    Top = 328
    Width = 75
    Height = 33
    Caption = 'Pobierz'
    TabOrder = 9
    OnClick = BitBtn3Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
      FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
      FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
      007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
      7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
      99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
      99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
      99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
      93337FFFF7737777733300000033333333337777773333333333}
    NumGlyphs = 2
  end
  object Edit1: TEdit
    Left = 568
    Top = 40
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 10
  end
  object Edit2: TEdit
    Left = 416
    Top = 40
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 11
  end
  object BitBtn4: TBitBtn
    Left = 328
    Top = 328
    Width = 75
    Height = 33
    Caption = 'Przerwij'
    TabOrder = 12
    OnClick = BitBtn4Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
      3333333777333777FF3333993333339993333377FF3333377FF3399993333339
      993337777FF3333377F3393999333333993337F777FF333337FF993399933333
      399377F3777FF333377F993339993333399377F33777FF33377F993333999333
      399377F333777FF3377F993333399933399377F3333777FF377F993333339993
      399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
      99333773FF3333777733339993333339933333773FFFFFF77333333999999999
      3333333777333777333333333999993333333333377777333333}
    NumGlyphs = 2
  end
  object Edit3: TEdit
    Left = 560
    Top = 8
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 13
  end
  object ListBox3: TListBox
    Left = 8
    Top = 120
    Width = 153
    Height = 201
    ItemHeight = 13
    TabOrder = 14
  end
  object BitBtn5: TBitBtn
    Left = 8
    Top = 80
    Width = 121
    Height = 33
    Caption = 'Zaladuj komputer'
    TabOrder = 15
    OnClick = BitBtn5Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
      00333FF777777777773F0000FFFFFFFFFF0377773F3F3F3F3F7308880F0F0F0F
      0FF07F33737373737337088880FFFFFFFFF07F3337FFFFFFFFF7088880000000
      00037F3337777777777308888033330F03337F3337F3FF7F7FFF088880300000
      00007F3337F7777777770FFFF030FFFFFFF07F3FF7F7F3FFFFF708008030F000
      00F07F7737F7F77777F70FFFF030F0AAE0F07F3FF7F7F7F337F708008030F0DA
      D0F07F7737F7F7FFF7F70FFFF030F00000F07F33F7F7F77777370FF9F030FFFF
      FFF07F3737F7FFFFFFF70FFFF030000000007FFFF7F777777777000000333333
      3333777777333333333333333333333333333333333333333333}
    NumGlyphs = 2
  end
  object Edit4: TEdit
    Left = 56
    Top = 48
    Width = 121
    Height = 21
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = True
    ParentFont = False
    TabOrder = 16
  end
  object BitBtn6: TBitBtn
    Left = 16
    Top = 328
    Width = 201
    Height = 33
    Caption = 'Dodaj komputer do bazy danych'
    TabOrder = 17
    OnClick = BitBtn6Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00550000000005
      555555777777777FF5555500000000805555557777777777FF555550BBBBB008
      05555557F5FFF7777FF55550B000B03080555557F77757F777F55550BBBBB033
      00555557F55557F577555550BBBBB03305555557FFFFF7F57F55555000000033
      05555557777777F57F555550BBBBB03305555557F5FFF7F57F555550B000B033
      05555557F77757F57F555550BBBBB03305555557F55557F57F555550BBBBB033
      05555557FFFFF7FF7F55550000000003055555777777777F7F55550777777700
      05555575FF5555777F5555500B3B3B300555555775FF55577FF555555003B3B3
      005555555775FFFF77F555555570000000555555555777777755}
    NumGlyphs = 2
  end
  object BitBtn7: TBitBtn
    Left = 16
    Top = 368
    Width = 201
    Height = 33
    Caption = 'Usun komputer z bazy danych'
    TabOrder = 18
    OnClick = BitBtn7Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333FF33333333333330003333333333333777333333333333
      300033FFFFFF3333377739999993333333333777777F3333333F399999933333
      3300377777733333337733333333333333003333333333333377333333333333
      3333333333333333333F333333333333330033333F33333333773333C3333333
      330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
      993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
      333333377F33333333FF3333C333333330003333733333333777333333333333
      3000333333333333377733333333333333333333333333333333}
    NumGlyphs = 2
  end
  object Edit5: TEdit
    Left = 56
    Top = 16
    Width = 121
    Height = 21
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = True
    ParentFont = False
    TabOrder = 19
  end
  object Button4: TButton
    Left = 112
    Top = 448
    Width = 97
    Height = 33
    Caption = 'Wylacz program '
    TabOrder = 20
    OnClick = Button4Click
  end
  object BitBtn8: TBitBtn
    Left = 416
    Top = 328
    Width = 75
    Height = 33
    Caption = 'Rozmiar'
    TabOrder = 21
    OnClick = BitBtn8Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      5555555555555555555555555555555555555555555555555555555555555555
      55555555FFFFFFFFFF5555500000000005555557777777777F55550BFBFBFBFB
      0555557F555555557F55550FBFBFBFBF0555557F555555557F55550BFBFBFBFB
      0555557F555555557F55550FBFBFBFBF0555557F555555557F55550BFBFBFBFB
      0555557F555555557F55550FBFBFBFBF0555557FFFFFFFFF7555550000000000
      555555777777777755555550FBFB0555555555575FFF75555555555700007555
      5555555577775555555555555555555555555555555555555555555555555555
      5555555555555555555555555555555555555555555555555555}
    NumGlyphs = 2
  end
  object Edit6: TEdit
    Left = 328
    Top = 376
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 22
  end
  object BitBtn9: TBitBtn
    Left = 16
    Top = 448
    Width = 97
    Height = 33
    Caption = 'Restartuj program'
    TabOrder = 23
    OnClick = BitBtn9Click
  end
  object Button5: TButton
    Left = 160
    Top = 80
    Width = 97
    Height = 33
    Caption = 'Pobierz ip z sieci'
    TabOrder = 24
    OnClick = Button5Click
  end
  object ListBox4: TListBox
    Left = 168
    Top = 120
    Width = 145
    Height = 193
    ItemHeight = 13
    TabOrder = 25
  end
  object Button6: TButton
    Left = 264
    Top = 80
    Width = 57
    Height = 33
    Caption = 'Wyczysc'
    TabOrder = 26
    OnClick = Button6Click
  end
  object Spower1: TServerSocket
    Active = False
    Port = 2000
    ServerType = stNonBlocking
    OnClientRead = Spower1ClientRead
    Left = 432
    Top = 416
  end
  object cpower: TClientSocket
    Active = False
    ClientType = ctBlocking
    Port = 2001
    OnConnect = cpowerConnect
    Left = 464
    Top = 416
  end
  object pob: TClientSocket
    Active = False
    ClientType = ctBlocking
    Host = '192.168.5.64'
    Port = 2005
    Left = 608
    Top = 416
  end
  object pplik: TServerSocket
    Active = False
    Port = 2006
    ServerType = stNonBlocking
    OnClientRead = pplikClientRead
    Left = 576
    Top = 416
  end
  object roz: TServerSocket
    Active = False
    Port = 3000
    ServerType = stNonBlocking
    OnClientRead = rozClientRead
    Left = 640
    Top = 416
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = Timer1Timer
    Left = 504
    Top = 416
  end
  object Timer2: TTimer
    Enabled = False
    OnTimer = Timer2Timer
    Left = 544
    Top = 416
  end
  object krozmiar: TClientSocket
    Active = False
    ClientType = ctBlocking
    Port = 4000
    Left = 672
    Top = 416
  end
  object srozmiar: TServerSocket
    Active = False
    Port = 4500
    ServerType = stNonBlocking
    OnClientRead = srozmiarClientRead
    Left = 712
    Top = 416
  end
  object kat: TClientSocket
    Active = False
    ClientType = ctBlocking
    Port = 4555
    Left = 584
    Top = 376
  end
  object skat: TServerSocket
    Active = False
    Port = 4666
    ServerType = stNonBlocking
    OnClientRead = skatClientRead
    Left = 624
    Top = 376
  end
  object splik: TServerSocket
    Active = False
    Port = 4777
    ServerType = stNonBlocking
    OnClientRead = splikClientRead
    Left = 672
    Top = 376
  end
  object res: TClientSocket
    Active = False
    ClientType = ctBlocking
    Port = 64000
    Left = 24
    Top = 416
  end
  object udp: TIdUDPClient
    Active = True
    BroadcastEnabled = True
    Port = 25432
    Left = 544
    Top = 376
  end
  object sip: TServerSocket
    Active = False
    Port = 26543
    ServerType = stNonBlocking
    OnClientRead = sipClientRead
    Left = 448
    Top = 456
  end
end

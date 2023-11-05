object Form1: TForm1
  Left = 249
  Top = 219
  AlphaBlendValue = 0
  BorderStyle = bsSingle
  Caption = 'Form1'
  ClientHeight = 311
  ClientWidth = 452
  Color = clBtnFace
  DockSite = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ldysk: TDriveComboBox
    Left = 168
    Top = 88
    Width = 1
    Height = 19
    DirList = katalog
    TabOrder = 0
  end
  object katalog: TDirectoryListBox
    Left = 176
    Top = 112
    Width = 129
    Height = 97
    FileList = pliklist
    ItemHeight = 16
    TabOrder = 1
  end
  object pliklist: TFileListBox
    Left = 25
    Top = 112
    Width = 112
    Height = 97
    ItemHeight = 13
    TabOrder = 2
  end
  object cpower: TClientSocket
    Active = False
    ClientType = ctBlocking
    Port = 2000
    OnConnect = cpowerConnect
    Left = 48
    Top = 56
  end
  object spower: TServerSocket
    Active = False
    Port = 2001
    ServerType = stNonBlocking
    OnClientRead = spowerClientRead
    Left = 88
    Top = 40
  end
  object pob: TServerSocket
    Active = False
    Port = 2005
    ServerType = stNonBlocking
    OnClientRead = pobClientRead
    Left = 112
    Top = 40
  end
  object wplik: TClientSocket
    Active = False
    ClientType = ctBlocking
    Port = 2006
    Left = 144
    Top = 56
  end
  object roz: TClientSocket
    Active = False
    ClientType = ctBlocking
    Port = 3000
    Left = 112
    Top = 72
  end
  object krozmiar: TClientSocket
    Active = False
    ClientType = ctBlocking
    Port = 4500
    Left = 72
    Top = 16
  end
  object srozmiar: TServerSocket
    Active = False
    Port = 4000
    ServerType = stNonBlocking
    OnClientRead = srozmiarClientRead
    Left = 120
    Top = 16
  end
  object skat: TServerSocket
    Active = False
    Port = 4555
    ServerType = stNonBlocking
    OnClientRead = skatClientRead
    Left = 304
    Top = 16
  end
  object kats: TClientSocket
    Active = False
    ClientType = ctBlocking
    Port = 4666
    Left = 304
    Top = 48
  end
  object plik: TClientSocket
    Active = False
    ClientType = ctBlocking
    Port = 4777
    Left = 360
    Top = 8
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 264
    Top = 224
  end
  object res: TServerSocket
    Active = False
    Port = 64000
    ServerType = stNonBlocking
    OnClientRead = resClientRead
    Left = 392
    Top = 104
  end
  object sudp: TIdUDPServer
    BroadcastEnabled = True
    Bindings = <>
    DefaultPort = 25432
    OnUDPRead = sudpUDPRead
    Left = 184
    Top = 16
  end
  object ip: TClientSocket
    Active = False
    ClientType = ctBlocking
    Port = 26543
    Left = 352
    Top = 48
  end
end

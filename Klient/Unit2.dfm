object Form2: TForm2
  Left = 317
  Top = 272
  Width = 359
  Height = 160
  Caption = 'Dodaj komputer'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 64
    Top = 8
    Width = 20
    Height = 24
    Caption = 'IP'
    Font.Charset = SYMBOL_CHARSET
    Font.Color = clRed
    Font.Height = -24
    Font.Name = 'WST_Germ'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 64
    Top = 40
    Width = 40
    Height = 24
    Caption = 'Host'
    Font.Charset = SYMBOL_CHARSET
    Font.Color = clRed
    Font.Height = -24
    Font.Name = 'WST_Germ'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BitBtn1: TBitBtn
    Left = 56
    Top = 80
    Width = 81
    Height = 33
    TabOrder = 0
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 168
    Top = 80
    Width = 81
    Height = 33
    Caption = 'Anuluj'
    TabOrder = 1
    Kind = bkAbort
  end
  object Edit1: TEdit
    Left = 104
    Top = 40
    Width = 137
    Height = 21
    TabOrder = 2
  end
  object Edit2: TEdit
    Left = 104
    Top = 8
    Width = 137
    Height = 21
    TabOrder = 3
  end
end

object Form1: TForm1
  Left = 234
  Top = 142
  Width = 123
  Height = 106
  Caption = 'Restart'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Timer1: TTimer
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 8
    Top = 8
  end
end

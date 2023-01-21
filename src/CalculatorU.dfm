object CalculatorF: TCalculatorF
  Left = 192
  Top = 146
  Width = 171
  Height = 234
  Caption = 'CalculatorF'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnResize = FormResize
  DesignSize = (
    153
    189)
  PixelsPerInch = 120
  TextHeight = 16
  object ResultL: TLabel
    Left = 9
    Top = 36
    Width = 136
    Height = 16
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 8
    Top = 8
    Width = 138
    Height = 29
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyPress = Edit1KeyPress
    OnKeyUp = Edit1KeyUp
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 53
    Width = 25
    Height = 25
    Caption = '7'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 32
    Top = 53
    Width = 25
    Height = 25
    Caption = '8'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn3: TBitBtn
    Left = 56
    Top = 53
    Width = 25
    Height = 25
    Caption = '9'
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object BitBtn4: TBitBtn
    Left = 88
    Top = 53
    Width = 25
    Height = 25
    Caption = '+'
    TabOrder = 4
    OnClick = BitBtn1Click
  end
  object BitBtn5: TBitBtn
    Left = 56
    Top = 77
    Width = 25
    Height = 25
    Caption = '6'
    TabOrder = 5
    OnClick = BitBtn1Click
  end
  object BitBtn6: TBitBtn
    Left = 8
    Top = 77
    Width = 25
    Height = 25
    Caption = '4'
    TabOrder = 6
    OnClick = BitBtn1Click
  end
  object BitBtn7: TBitBtn
    Left = 32
    Top = 77
    Width = 25
    Height = 25
    Caption = '5'
    TabOrder = 7
    OnClick = BitBtn1Click
  end
  object BitBtn8: TBitBtn
    Left = 56
    Top = 101
    Width = 25
    Height = 25
    Caption = '3'
    TabOrder = 8
    OnClick = BitBtn1Click
  end
  object BitBtn9: TBitBtn
    Left = 8
    Top = 101
    Width = 25
    Height = 25
    Caption = '1'
    TabOrder = 9
    OnClick = BitBtn1Click
  end
  object BitBtn10: TBitBtn
    Left = 32
    Top = 101
    Width = 25
    Height = 25
    Caption = '2'
    TabOrder = 10
    OnClick = BitBtn1Click
  end
  object BitBtn11: TBitBtn
    Left = 88
    Top = 77
    Width = 25
    Height = 25
    Caption = '-'
    TabOrder = 11
    OnClick = BitBtn1Click
  end
  object BitBtn12: TBitBtn
    Left = 88
    Top = 101
    Width = 25
    Height = 25
    Caption = '/'
    TabOrder = 12
    OnClick = BitBtn1Click
  end
  object BitBtn13: TBitBtn
    Left = 8
    Top = 125
    Width = 49
    Height = 25
    Caption = '0'
    TabOrder = 13
    OnClick = BitBtn1Click
  end
  object BitBtn14: TBitBtn
    Left = 56
    Top = 125
    Width = 25
    Height = 25
    Caption = '.'
    TabOrder = 14
    OnClick = BitBtn1Click
  end
  object BitBtn15: TBitBtn
    Left = 120
    Top = 101
    Width = 25
    Height = 49
    Caption = '='
    TabOrder = 15
    OnClick = BitBtn1Click
  end
  object BitBtn16: TBitBtn
    Left = 88
    Top = 125
    Width = 25
    Height = 25
    Caption = '*'
    TabOrder = 16
    OnClick = BitBtn1Click
  end
  object BitBtn17: TBitBtn
    Left = 120
    Top = 53
    Width = 25
    Height = 25
    Caption = #1057
    TabOrder = 17
    OnClick = BitBtn1Click
  end
  object BitBtn18: TBitBtn
    Left = 120
    Top = 77
    Width = 25
    Height = 25
    Caption = '<='
    TabOrder = 18
    OnClick = BitBtn1Click
  end
  object OkB: TButton
    Left = 88
    Top = 157
    Width = 57
    Height = 25
    Caption = #1054#1050
    TabOrder = 19
    OnClick = OkBClick
  end
end

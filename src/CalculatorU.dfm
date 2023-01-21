object CalculatorF: TCalculatorF
  Left = 192
  Top = 146
  Width = 171
  Height = 236
  Caption = 'CalculatorF'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  OnCreate = FormCreate
  OnResize = FormResize
  DesignSize = (
    153
    191)
  PixelsPerInch = 120
  TextHeight = 16
  object ResultL: TLabel
    Left = 9
    Top = 36
    Width = 126
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
  object HelpL: TLabel
    Left = 138
    Top = 36
    Width = 14
    Height = 17
    Anchors = [akTop, akRight]
    AutoSize = False
    Caption = '?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -12
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
  object PopupMenu1: TPopupMenu
    Left = 8
    Top = 152
    object MICommaToDot: TMenuItem
      Caption = #1047#1072#1084#1077#1085#1103#1090#1100' '#1079#1072#1087#1103#1090#1091#1102' '#1085#1072' '#1090#1086#1095#1082#1091
      OnClick = MICommaToDotClick
    end
    object MIAlwaysOnTop: TMenuItem
      Caption = #1042#1089#1077#1075#1076#1072' '#1085#1072' '#1101#1082#1088#1072#1085#1077
      OnClick = MIAlwaysOnTopClick
    end
    object MICompactMode: TMenuItem
      Caption = #1050#1086#1084#1087#1072#1082#1090#1085#1099#1081' '#1074#1080#1076
      OnClick = MICompactModeClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object MICopy: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      OnClick = MICopyClick
    end
    object MIPaste: TMenuItem
      Caption = #1042#1089#1090#1072#1074#1080#1090#1100
      OnClick = MIPasteClick
    end
    object MIClear: TMenuItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      OnClick = MIClearClick
    end
    object MIResetSettings: TMenuItem
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
      OnClick = MIResetSettingsClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object MIExit: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = MIExitClick
    end
  end
end

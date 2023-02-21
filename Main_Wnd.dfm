object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Okno'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LastValue: TLabel
    Left = 320
    Top = 104
    Width = 46
    Height = 13
    Caption = 'LastValue'
  end
  object LastValueLabel: TLabel
    Left = 208
    Top = 104
    Width = 86
    Height = 13
    Caption = 'Ostatnia warto'#347#263':'
  end
  object AverageValueLabel: TLabel
    Left = 208
    Top = 72
    Width = 81
    Height = 13
    Caption = #346'rednia warto'#347#263':'
  end
  object AverageValue: TLabel
    Left = 320
    Top = 72
    Width = 67
    Height = 13
    Caption = 'AverageValue'
  end
  object AsyncStartIntGeneration: TButton
    Left = 296
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Press'
    TabOrder = 0
    OnClick = AsyncStartIntGenerationClick
  end
  object StopIntGeneration: TButton
    Left = 296
    Top = 167
    Width = 75
    Height = 25
    Caption = 'Stop'
    TabOrder = 1
    OnClick = StopIntGenerationClick
  end
end

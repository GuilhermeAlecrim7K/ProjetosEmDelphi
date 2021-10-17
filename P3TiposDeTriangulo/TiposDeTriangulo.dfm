object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 194
  ClientWidth = 255
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 147
    Width = 185
    Height = 21
    AutoSize = False
    Caption = 'Resultado = '
  end
  object Edit1: TEdit
    Left = 16
    Top = 48
    Width = 57
    Height = 21
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TextHint = '1'#186' lado'
  end
  object Button1: TButton
    Left = 32
    Top = 94
    Width = 89
    Height = 25
    Caption = #201' tri'#226'ngulo?'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 3
    OnClick = Button1Click
  end
  object Edit2: TEdit
    Left = 96
    Top = 48
    Width = 57
    Height = 21
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TextHint = '2'#186' lado'
  end
  object Edit3: TEdit
    Left = 176
    Top = 48
    Width = 57
    Height = 21
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    TextHint = '3'#186' lado'
  end
  object Button2: TButton
    Left = 135
    Top = 94
    Width = 82
    Height = 25
    Caption = 'Limpar campos'
    TabOrder = 4
    OnClick = Button2Click
  end
end

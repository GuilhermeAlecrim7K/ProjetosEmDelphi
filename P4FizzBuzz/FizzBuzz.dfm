object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'FizzBuzz'
  ClientHeight = 359
  ClientWidth = 329
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object BotaoFizzBuzz: TButton
    Left = 248
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Fizzbuzz'
    TabOrder = 0
    OnClick = BotaoFizzBuzzClick
  end
  object Memo1: TMemo
    Left = 8
    Top = 48
    Width = 225
    Height = 297
    Lines.Strings = (
      '')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object BotaoEdicao: TButton
    Left = 264
    Top = 79
    Width = 41
    Height = 26
    Hint = 'Quero testar com outros valores'
    Caption = '?'
    TabOrder = 2
    Visible = False
  end
  object EditFizz: TLabeledEdit
    Left = 32
    Top = 21
    Width = 17
    Height = 21
    Alignment = taCenter
    EditLabel.Width = 18
    EditLabel.Height = 13
    EditLabel.Caption = 'Fizz'
    Enabled = False
    LabelPosition = lpLeft
    NumbersOnly = True
    TabOrder = 3
    Text = '3'
  end
  object EditBuzz: TLabeledEdit
    Left = 80
    Top = 21
    Width = 17
    Height = 21
    Alignment = taCenter
    EditLabel.Width = 22
    EditLabel.Height = 13
    EditLabel.Caption = 'Buzz'
    Enabled = False
    LabelPosition = lpLeft
    NumbersOnly = True
    TabOrder = 4
    Text = '5'
  end
  object EditLimite: TLabeledEdit
    Left = 192
    Top = 21
    Width = 41
    Height = 21
    Alignment = taCenter
    EditLabel.Width = 27
    EditLabel.Height = 13
    EditLabel.Caption = 'Limite'
    LabelPosition = lpLeft
    NumbersOnly = True
    TabOrder = 5
    Text = '100'
  end
end

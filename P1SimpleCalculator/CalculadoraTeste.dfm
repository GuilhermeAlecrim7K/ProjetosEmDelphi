object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Calculadora Teste'
  ClientHeight = 313
  ClientWidth = 438
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object botao1: TButton
    Left = 336
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Calcular!'
    TabOrder = 0
    OnClick = botao1Click
  end
  object Campo1: TEdit
    Left = 48
    Top = 44
    Width = 97
    Height = 21
    TabOrder = 1
    TextHint = 'Valor 1'
  end
  object Campo2: TEdit
    Left = 224
    Top = 42
    Width = 97
    Height = 21
    TabOrder = 2
    TextHint = 'Valor 2'
  end
  object CmbBoxOperation: TComboBox
    Left = 161
    Top = 42
    Width = 49
    Height = 21
    Style = csDropDownList
    TabOrder = 3
    TextHint = 'Oper.'
    Items.Strings = (
      '+'
      '-'
      '*'
      '/')
  end
  object CaixaDeResultado: TEdit
    Left = 48
    Top = 87
    Width = 363
    Height = 21
    Alignment = taCenter
    Color = cl3DDkShadow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
    Text = 'Resultado'
  end
end

object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Calculadora Teste'
  ClientHeight = 338
  ClientWidth = 342
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Btn7: TButton
    Left = 32
    Top = 97
    Width = 49
    Height = 48
    Caption = '7'
    TabOrder = 7
    TabStop = False
    OnClick = Btn7Click
  end
  object MemPainel: TMemo
    Left = 32
    Top = 8
    Width = 269
    Height = 73
    TabStop = False
    Alignment = taRightJustify
    Color = clSkyBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Consolas'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 10
  end
  object Btn8: TButton
    Left = 87
    Top = 97
    Width = 49
    Height = 48
    Caption = '8'
    TabOrder = 8
    TabStop = False
    OnClick = Btn8Click
  end
  object Btn9: TButton
    Left = 142
    Top = 97
    Width = 49
    Height = 48
    Caption = '9'
    TabOrder = 9
    TabStop = False
    OnClick = Btn9Click
  end
  object Btn4: TButton
    Left = 32
    Top = 151
    Width = 49
    Height = 48
    Caption = '4'
    TabOrder = 4
    TabStop = False
    OnClick = Btn4Click
  end
  object Btn5: TButton
    Left = 87
    Top = 151
    Width = 49
    Height = 48
    Caption = '5'
    TabOrder = 5
    TabStop = False
    OnClick = Btn5Click
  end
  object Btn6: TButton
    Left = 142
    Top = 151
    Width = 49
    Height = 48
    Caption = '6'
    TabOrder = 6
    TabStop = False
    OnClick = Btn6Click
  end
  object Btn1: TButton
    Left = 32
    Top = 205
    Width = 49
    Height = 48
    Caption = '1'
    TabOrder = 1
    TabStop = False
    OnClick = Btn1Click
  end
  object Btn2: TButton
    Left = 87
    Top = 205
    Width = 49
    Height = 48
    Caption = '2'
    TabOrder = 2
    TabStop = False
    OnClick = Btn2Click
  end
  object Btn3: TButton
    Left = 142
    Top = 205
    Width = 49
    Height = 48
    Caption = '3'
    TabOrder = 3
    TabStop = False
    OnClick = Btn3Click
  end
  object Btn0: TButton
    Left = 32
    Top = 259
    Width = 104
    Height = 48
    Caption = '0'
    TabOrder = 0
    TabStop = False
    OnClick = Btn0Click
  end
  object BtnVirgula: TButton
    Left = 142
    Top = 259
    Width = 49
    Height = 48
    Caption = ','
    TabOrder = 11
    TabStop = False
    OnClick = BtnVirgulaClick
  end
  object BtnDivisao: TButton
    Left = 197
    Top = 97
    Width = 49
    Height = 48
    Caption = '/'
    TabOrder = 12
    TabStop = False
    OnClick = BtnDivisaoClick
  end
  object BtnMultiplicacao: TButton
    Left = 197
    Top = 151
    Width = 49
    Height = 48
    Caption = '*'
    TabOrder = 13
    TabStop = False
    OnClick = BtnMultiplicacaoClick
  end
  object BtnSubtracao: TButton
    Left = 197
    Top = 205
    Width = 49
    Height = 48
    Caption = '-'
    TabOrder = 14
    TabStop = False
    OnClick = BtnSubtracaoClick
  end
  object BtnAdicao: TButton
    Left = 197
    Top = 259
    Width = 49
    Height = 48
    Caption = '+'
    TabOrder = 15
    TabStop = False
    OnClick = BtnAdicaoClick
  end
  object BtnClear: TButton
    Left = 252
    Top = 97
    Width = 49
    Height = 48
    Caption = 'C'
    TabOrder = 16
    TabStop = False
    OnClick = BtnClearClick
  end
  object BtnClearLast: TButton
    Left = 252
    Top = 151
    Width = 49
    Height = 48
    Caption = 'CE'
    TabOrder = 17
    TabStop = False
    OnClick = BtnClearLastClick
  end
  object BtnIgual: TButton
    Left = 252
    Top = 205
    Width = 49
    Height = 102
    Caption = '='
    TabOrder = 18
    TabStop = False
    OnClick = BtnIgualClick
  end
end

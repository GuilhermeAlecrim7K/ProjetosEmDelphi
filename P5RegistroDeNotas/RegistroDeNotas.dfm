object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Registro de notas escolares'
  ClientHeight = 216
  ClientWidth = 366
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
    Left = 8
    Top = 8
    Width = 234
    Height = 13
    Caption = 'Demonstrativo de notas e desempenho da turma'
  end
  object MemoMain: TMemo
    Left = 8
    Top = 32
    Width = 249
    Height = 173
    Lines.Strings = (
      '')
    ReadOnly = True
    TabOrder = 0
  end
  object Button1: TButton
    Left = 263
    Top = 32
    Width = 82
    Height = 25
    Caption = 'Come'#231'ar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object EditMediaTurma: TLabeledEdit
    Left = 263
    Top = 88
    Width = 82
    Height = 21
    EditLabel.Width = 74
    EditLabel.Height = 13
    EditLabel.Caption = 'M'#233'dia da turma'
    ReadOnly = True
    TabOrder = 2
    Visible = False
  end
  object EditMaiorNota: TLabeledEdit
    Left = 263
    Top = 136
    Width = 82
    Height = 21
    EditLabel.Width = 52
    EditLabel.Height = 13
    EditLabel.Caption = 'Maior Nota'
    ReadOnly = True
    TabOrder = 3
    Visible = False
  end
  object EditMenorNota: TLabeledEdit
    Left = 263
    Top = 184
    Width = 82
    Height = 21
    EditLabel.Width = 56
    EditLabel.Height = 13
    EditLabel.Caption = 'Menor Nota'
    ReadOnly = True
    TabOrder = 4
    Visible = False
  end
end

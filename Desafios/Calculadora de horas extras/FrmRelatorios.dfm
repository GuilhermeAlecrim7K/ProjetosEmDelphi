object FormRelatorios: TFormRelatorios
  Left = 0
  Top = 0
  Caption = 'FormRelatorios'
  ClientHeight = 201
  ClientWidth = 337
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 225
    Height = 185
    TabOrder = 0
  end
  object BtnGerarRelatorio: TButton
    Left = 239
    Top = 8
    Width = 90
    Height = 25
    Caption = 'Gerar relat'#243'rio'
    TabOrder = 1
    OnClick = BtnGerarRelatorioClick
  end
end

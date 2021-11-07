object FrmOperacao: TFrmOperacao
  Left = 0
  Top = 0
  Caption = 'TituloFrm'
  ClientHeight = 99
  ClientWidth = 278
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
  object LblLimiteSaque: TLabel
    Left = 43
    Top = 64
    Width = 80
    Height = 13
    Caption = 'Limite p/ Saque: '
    Visible = False
  end
  object BtnOperacao: TButton
    Left = 168
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 0
    OnClick = BtnOperacaoClick
  end
  object MskEdtValor: TMaskEdit
    Left = 43
    Top = 42
    Width = 111
    Height = 21
    EditMask = 'R$ 9.000,\0\0;0;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 11
    ParentFont = False
    TabOrder = 1
    Text = ''
  end
end

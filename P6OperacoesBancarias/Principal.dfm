object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Conta banc'#225'ria'
  ClientHeight = 222
  ClientWidth = 346
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
    Top = 35
    Width = 291
    Height = 91
    TabOrder = 0
  end
  object BtnEmitirSaldo: TButton
    Left = 40
    Top = 132
    Width = 75
    Height = 25
    Caption = 'Emitir saldo'
    Enabled = False
    TabOrder = 1
  end
  object BtnDeposito: TButton
    Left = 121
    Top = 132
    Width = 75
    Height = 25
    Caption = 'Dep'#243'sito'
    Enabled = False
    TabOrder = 2
  end
  object BtnSaque: TButton
    Left = 202
    Top = 132
    Width = 75
    Height = 25
    Caption = 'Saque'
    Enabled = False
    TabOrder = 3
  end
  object CmbBoxTipoConta: TComboBox
    Left = 8
    Top = 8
    Width = 201
    Height = 21
    TabOrder = 4
    TextHint = 'Tipo de conta'
    OnSelect = CmbBoxTipoContaSelect
    Items.Strings = (
      'Conta Corrente'
      'Conta Poupan'#231'a')
  end
  object BtnExibirDados: TButton
    Left = 224
    Top = 8
    Width = 75
    Height = 21
    Caption = 'Exibir dados'
    TabOrder = 5
    OnClick = BtnExibirDadosClick
  end
end

object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Conta banc'#225'ria'
  ClientHeight = 213
  ClientWidth = 320
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
  object MemoInfoPanel: TMemo
    Left = 8
    Top = 67
    Width = 291
    Height = 91
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object BtnEmitirSaldo: TButton
    Left = 32
    Top = 164
    Width = 75
    Height = 25
    Caption = 'Emitir saldo'
    Enabled = False
    TabOrder = 3
    OnClick = BtnEmitirSaldoClick
  end
  object BtnDeposito: TButton
    Left = 113
    Top = 164
    Width = 75
    Height = 25
    Caption = 'Dep'#243'sito'
    Enabled = False
    TabOrder = 4
    OnClick = BtnDepositoClick
  end
  object BtnSaque: TButton
    Left = 194
    Top = 164
    Width = 75
    Height = 25
    Caption = 'Saque'
    Enabled = False
    TabOrder = 5
    OnClick = BtnSaqueClick
  end
  object CmbBoxTipoConta: TComboBox
    Left = 8
    Top = 40
    Width = 201
    Height = 21
    AutoDropDown = True
    AutoCloseUp = True
    Style = csDropDownList
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TextHint = 'Tipo de conta'
    OnSelect = CmbBoxTipoContaSelect
    Items.Strings = (
      'Conta Corrente'
      'Conta Poupan'#231'a')
  end
  object BtnExibirDados: TButton
    Left = 224
    Top = 40
    Width = 75
    Height = 21
    Caption = 'Exibir dados'
    TabOrder = 1
    OnClick = BtnExibirDadosClick
  end
end

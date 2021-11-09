object FrmInclusao: TFrmInclusao
  Left = 390
  Top = 55
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Incluir Novo Cliente'
  ClientHeight = 319
  ClientWidth = 278
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object LblNumCliente: TLabel
    Left = 16
    Top = 10
    Width = 86
    Height = 13
    Caption = 'N'#250'mero do cliente'
  end
  object LblNome: TLabel
    Left = 16
    Top = 56
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object LblTelefone: TLabel
    Left = 16
    Top = 104
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  object LblDataNascimento: TLabel
    Left = 16
    Top = 154
    Width = 95
    Height = 13
    Caption = 'Data de nascimento'
  end
  object LblNaturalidade: TLabel
    Left = 16
    Top = 200
    Width = 61
    Height = 13
    Caption = 'Naturalidade'
  end
  object BtnGerarNumCliente: TSpeedButton
    Left = 83
    Top = 29
    Width = 23
    Height = 22
    Caption = '#'
    OnClick = BtnGerarNumClienteClick
  end
  object EdtNomeCliente: TEdit
    Left = 16
    Top = 75
    Width = 233
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object BtnRegistrar: TButton
    Left = 48
    Top = 264
    Width = 169
    Height = 25
    Caption = 'Registrar'
    TabOrder = 5
    OnClick = BtnRegistrarClick
  end
  object EdtNumCliente: TEdit
    Left = 16
    Top = 29
    Width = 61
    Height = 21
    ReadOnly = True
    TabOrder = 0
    Text = '00000000'
  end
  object EdtTelefone: TMaskEdit
    Left = 16
    Top = 125
    Width = 95
    Height = 21
    TabOrder = 2
    Text = ''
    OnEnter = EdtTelefoneEnter
    OnExit = EdtTelefoneExit
  end
  object CmbBoxNaturalidade: TComboBox
    Left = 16
    Top = 219
    Width = 153
    Height = 22
    Style = csOwnerDrawFixed
    ItemIndex = 0
    TabOrder = 4
    Text = 'Acre (AC)'
    Items.Strings = (
      'Acre (AC)'
      'Alagoas (AL)'
      'Amap'#225' (AP)'
      'Amazonas (AM)'
      'Bahia (BA)'
      'Cear'#225' (CE)'
      'Distrito Federal (DF)'
      'Esp'#237'rito Santo (ES)'
      'Goi'#225's (GO)'
      'Maranh'#227'o (MA)'
      'Mato Grosso (MT)'
      'Mato Grosso do Sul (MS)'
      'Minas Gerais (MG)'
      'Par'#225' (PA)'
      'Para'#237'ba (PB)'
      'Paran'#225' (PR)'
      'Pernambuco (PE)'
      'Piau'#237' (PI)'
      'Rio de Janeiro (RJ)'
      'Rio Grande do Norte (RN)'
      'Rio Grande do Sul (RS)'
      'Rond'#244'nia (RO)'
      'Roraima (RR)'
      'Santa Catarina (SC)'
      'S'#227'o Paulo (SP)'
      'Sergipe (SE)'
      'Tocantins (TO)')
  end
  object BoxDataNascimento: TDateTimePicker
    Left = 16
    Top = 173
    Width = 95
    Height = 21
    Date = 32874.000000000000000000
    Time = 32874.000000000000000000
    DoubleBuffered = False
    MaxDate = 44508.999988425920000000
    MinDate = 18264.000000000000000000
    ParentDoubleBuffered = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 3
  end
end

object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Calculadora de Parcelas'
  ClientHeight = 238
  ClientWidth = 401
  Color = cl3DLight
  DockSite = True
  DragKind = dkDock
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LabelValorMin: TLabel
    Left = 33
    Top = 61
    Width = 87
    Height = 13
    Caption = 'Min.: R$ 1.000,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object BotaoCalcular: TButton
    Left = 296
    Top = 34
    Width = 75
    Height = 25
    Caption = 'Calcular'
    Enabled = False
    TabOrder = 2
    OnClick = BotaoCalcularClick
  end
  object ComboBoxQuantidadeDeParcelas: TComboBox
    Left = 170
    Top = 36
    Width = 103
    Height = 21
    AutoDropDown = True
    AutoCloseUp = True
    Style = csDropDownList
    Color = cl3DLight
    Enabled = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TextHint = 'Qtd. de Parcelas'
    OnSelect = ComboBoxQuantidadeDeParcelasSelect
    Items.Strings = (
      #192' vista'
      '2x sem juros'
      '3x sem juros'
      '4x sem juros'
      '5x sem juros'
      '6x sem juros'
      '7x sem juros'
      '8x sem juros'
      '9x sem juros'
      '10x sem juros'
      '11x sem juros'
      '12x sem juros'
      'Mais parcelas')
  end
  object MemoDemonstrativoDeParcelas: TMemo
    Left = 33
    Top = 80
    Width = 338
    Height = 100
    Lines.Strings = (
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ReadOnly = True
    TabOrder = 3
    Visible = False
  end
  object EditValorTotalDoProduto: TMaskEdit
    Left = 33
    Top = 36
    Width = 96
    Height = 21
    EditMask = 'R$ 90.000,00;0;_'
    MaxLength = 12
    TabOrder = 0
    Text = ''
    TextHint = 'Valor do produto'
    OnChange = EditValorTotalDoProdutoChange
  end
  object BotaoConfirmar: TButton
    Left = 209
    Top = 186
    Width = 162
    Height = 25
    Caption = 'Confirmar pagamento'
    Enabled = False
    TabOrder = 4
    Visible = False
    OnClick = BotaoConfirmarClick
  end
end

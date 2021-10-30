object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 201
  ClientWidth = 437
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
  object StrGrdTabela: TStringGrid
    Left = 8
    Top = 8
    Width = 337
    Height = 120
    DefaultColWidth = 80
    FixedColor = clGrayText
    TabOrder = 0
  end
  object EdtNomeProduto: TEdit
    Left = 8
    Top = 144
    Width = 81
    Height = 21
    TabOrder = 1
    TextHint = 'Nome'
  end
  object EdtQtd: TEdit
    Left = 95
    Top = 144
    Width = 42
    Height = 21
    TabOrder = 2
    TextHint = 'Qtd.'
  end
  object EdtPreco: TEdit
    Left = 143
    Top = 144
    Width = 66
    Height = 21
    TabOrder = 3
    TextHint = 'Pre'#231'o'
  end
  object BtnInserirProduto: TButton
    Left = 239
    Top = 142
    Width = 106
    Height = 25
    Caption = 'Inserir Produto'
    TabOrder = 4
    OnClick = BtnInserirProdutoClick
  end
  object LblEdtValorTotal: TLabeledEdit
    Left = 239
    Top = 173
    Width = 106
    Height = 21
    EditLabel.Width = 106
    EditLabel.Height = 13
    EditLabel.Caption = 'Valor Total da Compra'
    LabelPosition = lpLeft
    ReadOnly = True
    TabOrder = 5
    Text = 'R$   '
  end
  object BtnCancelarItem: TButton
    Left = 351
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Cancelar Item'
    TabOrder = 6
    OnClick = BtnCancelarItemClick
  end
end

object MainForm: TMainForm
  Left = 0
  Top = 0
  Hint = 'Clique em uma linha para excluir'
  ParentCustomHint = False
  Caption = 'Tabela de Clientes'
  ClientHeight = 537
  ClientWidth = 786
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  ShowHint = False
  OnCreate = FormCreate
  DesignSize = (
    786
    537)
  PixelsPerInch = 96
  TextHeight = 13
  object StrGrdClientes: TStringGrid
    Left = 8
    Top = 8
    Width = 645
    Height = 494
    Anchors = [akLeft, akTop, akRight, akBottom]
    DefaultColWidth = 120
    FixedCols = 0
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
  end
  object Incluir: TButton
    Left = 659
    Top = 8
    Width = 108
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Novo Cliente'
    TabOrder = 1
    OnClick = IncluirClick
    ExplicitLeft = 557
  end
  object BtnExcluir: TButton
    Left = 659
    Top = 39
    Width = 108
    Height = 25
    Hint = 'Selecione uma linha'
    ParentCustomHint = False
    Anchors = [akTop, akRight]
    Caption = 'Remover Registro'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = BtnExcluirClick
    ExplicitLeft = 557
  end
  object EdtEditar: TButton
    Left = 659
    Top = 70
    Width = 108
    Height = 25
    Caption = 'Editar Registro'
    TabOrder = 3
    OnClick = EdtEditarClick
  end
end

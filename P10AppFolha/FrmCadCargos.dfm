object FCadCargos: TFCadCargos
  Left = 0
  Top = 0
  Caption = 'Cargos'
  ClientHeight = 190
  ClientWidth = 378
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object BtnSalvar: TButton
    Left = 56
    Top = 112
    Width = 97
    Height = 25
    Caption = 'Salvar'
    TabOrder = 0
    OnClick = BtnSalvarClick
  end
  object BtnCancelar: TButton
    Left = 216
    Top = 112
    Width = 97
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 1
  end
  object EdtCodigo: TLabeledEdit
    Left = 56
    Top = 32
    Width = 121
    Height = 21
    EditLabel.Width = 33
    EditLabel.Height = 13
    EditLabel.Caption = 'C'#243'digo'
    ReadOnly = True
    TabOrder = 2
  end
  object EdtTitulo: TLabeledEdit
    Left = 56
    Top = 72
    Width = 257
    Height = 21
    EditLabel.Width = 73
    EditLabel.Height = 13
    EditLabel.Caption = 'T'#237'tulo do Cargo'
    TabOrder = 3
  end
  object QryInsertCargos: TFDQuery
    Connection = DModule.FDConnect
    Left = 56
    Top = 136
  end
  object QryConsultaCargos: TFDQuery
    Connection = DModule.FDConnect
    Left = 112
    Top = 136
  end
end

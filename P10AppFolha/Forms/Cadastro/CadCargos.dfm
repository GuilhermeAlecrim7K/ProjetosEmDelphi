object FrmCadastroCargos: TFrmCadastroCargos
  Left = 0
  Top = 0
  Caption = 'Cadastro de Cargos'
  ClientHeight = 201
  ClientWidth = 447
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
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 73
    Height = 13
    Caption = 'T'#237'tulo do Cargo'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 8
    Top = 107
    Width = 58
    Height = 13
    Caption = 'Sal'#225'rio Base'
    FocusControl = DBEdit3
  end
  object DBEdit1: TDBEdit
    Left = 8
    Top = 24
    Width = 56
    Height = 21
    DataField = 'CODIGO'
    DataSource = DtsCargos
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 8
    Top = 72
    Width = 394
    Height = 21
    DataField = 'NOME'
    DataSource = DtsCargos
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 8
    Top = 126
    Width = 134
    Height = 21
    DataField = 'SALARIOBASE'
    DataSource = DtsCargos
    TabOrder = 2
  end
  object TblCargos: TFDTable
    IndexName = 'CARGOS_PK'
    Connection = DM.ConnectionFB
    TableName = 'CARGOS'
    Left = 408
    Top = 9
    object TblCargosCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object TblCargosNOME: TStringField
      DisplayLabel = 'T'#237'tulo do Cargo'
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 30
    end
    object TblCargosSALARIOBASE: TFloatField
      DisplayLabel = 'Sal'#225'rio Base'
      FieldName = 'SALARIOBASE'
      Origin = 'SALARIOBASE'
    end
  end
  object DtsCargos: TDataSource
    DataSet = TblCargos
    Left = 408
    Top = 64
  end
end

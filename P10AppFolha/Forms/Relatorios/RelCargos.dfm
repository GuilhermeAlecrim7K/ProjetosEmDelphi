object FrmListaCargos: TFrmListaCargos
  Left = 390
  Top = 165
  Caption = 'Cargos Cadastrados'
  ClientHeight = 361
  ClientWidth = 584
  Color = clBtnFace
  Constraints.MinHeight = 400
  Constraints.MinWidth = 600
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    584
    361)
  PixelsPerInch = 96
  TextHeight = 13
  object DbgCargos: TDBGrid
    Left = 0
    Top = 0
    Width = 584
    Height = 331
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DtsCargos
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnTitleClick = DbgCargosTitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALARIO_BASE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS'
        Width = 100
        Visible = True
      end>
  end
  object ChkBoxMostrarInativos: TCheckBox
    Left = 207
    Top = 337
    Width = 97
    Height = 17
    Anchors = [akRight, akBottom]
    Caption = 'Mostrar Inativos'
    TabOrder = 1
  end
  object LblEdtNomeCargo: TLabeledEdit
    Left = 72
    Top = 337
    Width = 121
    Height = 21
    Anchors = [akLeft, akRight]
    CharCase = ecUpperCase
    EditLabel.Width = 62
    EditLabel.Height = 13
    EditLabel.Caption = 'Buscar Nome'
    LabelPosition = lpLeft
    TabOrder = 2
  end
  object BtnPesquisar: TButton
    Left = 319
    Top = 337
    Width = 75
    Height = 21
    Anchors = [akLeft]
    Caption = 'Pesquisar'
    TabOrder = 3
    OnClick = BtnPesquisarClick
  end
  object BtnLimparPesquisa: TButton
    Left = 400
    Top = 337
    Width = 73
    Height = 21
    Anchors = [akLeft]
    Caption = 'Limpar'
    TabOrder = 4
    OnClick = BtnLimparPesquisaClick
  end
  object DtsCargos: TDataSource
    AutoEdit = False
    DataSet = QryCargos
    Left = 512
    Top = 80
  end
  object QryCargos: TFDQuery
    Connection = DM.ConnectionFB
    SQL.Strings = (
      'SELECT *'
      'FROM CARGOS'
      'WHERE STATUS = 1'
      'ORDER BY CODIGO'
      '')
    Left = 512
    Top = 32
    object QryCargosCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 7
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object QryCargosNOME: TStringField
      DisplayLabel = 'T'#237'tulo do cargo'
      DisplayWidth = 32
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 30
    end
    object QryCargosSALARIO_BASE: TFloatField
      DisplayLabel = 'Sal'#225'rio base'
      DisplayWidth = 16
      FieldName = 'SALARIO_BASE'
      Origin = 'SALARIO_BASE'
      OnGetText = QryCargosSALARIO_BASEGetText
    end
    object QryCargosSTATUS: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 12
      FieldName = 'STATUS'
      Origin = 'STATUS'
      OnGetText = QryCargosSTATUSGetText
      FixedChar = True
      Size = 1
    end
  end
end

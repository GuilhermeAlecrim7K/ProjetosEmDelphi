object FrmLancarEventos: TFrmLancarEventos
  Left = 0
  Top = 0
  Caption = 'Lan'#231'ar Eventos'
  ClientHeight = 399
  ClientWidth = 350
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object LblMesAno: TLabel
    Left = 8
    Top = 16
    Width = 36
    Height = 13
    Caption = 'Per'#237'odo'
  end
  object LblTipoEvento: TLabel
    Left = 8
    Top = 149
    Width = 72
    Height = 13
    Caption = 'Tipo de Evento'
  end
  object LblEdtPesquisa: TLabel
    Left = 223
    Top = 146
    Width = 97
    Height = 13
    AutoSize = False
    Caption = 'Pressione Enter'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Consolas'
    Font.Style = [fsItalic]
    ParentFont = False
    Transparent = True
  end
  object LblJustificativa: TLabel
    Left = 8
    Top = 253
    Width = 130
    Height = 13
    Caption = 'Justificativa do lan'#231'amento'
  end
  object Label2: TLabel
    Left = 8
    Top = 200
    Width = 24
    Height = 13
    Caption = 'Valor'
    FocusControl = DBEdit1
  end
  object DbLkpCmbBoxCargoOuFunc: TDBLookupComboBox
    Left = 8
    Top = 120
    Width = 209
    Height = 21
    Hint = 'Utilize o campo de pesquisa abaixo para acessar as op'#231#245'es'
    DataSource = DtsLancarEvento
    Enabled = False
    KeyField = 'CODIGO'
    ListField = 'C_COD_NOME'
    ListSource = DtsCargos
    TabOrder = 3
  end
  object DbLkpCmbBoxEvento: TDBLookupComboBox
    Left = 8
    Top = 168
    Width = 145
    Height = 21
    DataField = 'COD_EVENTO'
    DataSource = DtsLancarEvento
    KeyField = 'CODIGO'
    ListField = 'C_COD_NOME'
    ListSource = DtsEventos
    TabOrder = 4
  end
  object MemJustificativa: TMemo
    Left = 8
    Top = 272
    Width = 335
    Height = 89
    TabOrder = 6
  end
  object EdtBusca: TEdit
    Left = 222
    Top = 122
    Width = 121
    Height = 18
    TabOrder = 2
    TextHint = 'Pesquisa'
    OnKeyDown = EdtBuscaKeyDown
  end
  object BtnLancarEvento: TButton
    Left = 255
    Top = 367
    Width = 88
    Height = 25
    Caption = 'Lan'#231'ar Evento'
    TabOrder = 7
    OnClick = BtnLancarEventoClick
  end
  object RadGrpBeneficiario: TRadioGroup
    Left = 8
    Top = 72
    Width = 209
    Height = 42
    Caption = 'Escolha uma op'#231#227'o'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Cargo'
      'Funcion'#225'rio')
    TabOrder = 1
    OnClick = RadGrpBeneficiarioClick
  end
  object DtpMesAno: TDateTimePicker
    Left = 8
    Top = 35
    Width = 89
    Height = 21
    Date = 44585.000000000000000000
    Format = 'yyyy/MM'
    Time = 44585.000000000000000000
    Checked = False
    TabOrder = 0
  end
  object DBEdit1: TDBEdit
    Left = 8
    Top = 216
    Width = 134
    Height = 21
    DataField = 'VALOR'
    DataSource = DtsLancarEvento
    TabOrder = 5
  end
  object QryTiposEventos: TFDQuery
    OnCalcFields = QryTiposEventosCalcFields
    Connection = DM.ConnectionFB
    SQL.Strings = (
      'SELECT * FROM EVENTOS')
    Left = 360
    Top = 8
    object QryTiposEventosCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object QryTiposEventosNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 30
    end
    object QryTiposEventosTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object QryTiposEventosC_COD_NOME: TStringField
      FieldKind = fkCalculated
      FieldName = 'C_COD_NOME'
      Size = 25
      Calculated = True
    end
  end
  object DtsEventos: TDataSource
    DataSet = QryTiposEventos
    Left = 400
    Top = 8
  end
  object QryFuncionarios: TFDQuery
    OnCalcFields = QryFuncionariosCalcFields
    Connection = DM.ConnectionFB
    SQL.Strings = (
      'SELECT * FROM FUNCIONARIOS WHERE STATUS = 1')
    Left = 360
    Top = 56
    object QryFuncionariosCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object QryFuncionariosNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 50
    end
    object QryFuncionariosDATA_NASCIMENTO: TStringField
      FieldName = 'DATA_NASCIMENTO'
      Origin = 'DATA_NASCIMENTO'
      Size = 10
    end
    object QryFuncionariosCOD_CARGO: TStringField
      FieldName = 'COD_CARGO'
      Origin = 'COD_CARGO'
      Size = 4
    end
    object QryFuncionariosCONTATO: TStringField
      FieldName = 'CONTATO'
      Origin = 'CONTATO'
      Size = 11
    end
    object QryFuncionariosEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 50
    end
    object QryFuncionariosSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object QryFuncionariosSALARIO_ATUAL: TSingleField
      FieldName = 'SALARIO_ATUAL'
      Origin = 'SALARIO_ATUAL'
    end
    object QryFuncionariosC_COD_NOME: TStringField
      FieldKind = fkCalculated
      FieldName = 'C_COD_NOME'
      Size = 60
      Calculated = True
    end
  end
  object QryCargos: TFDQuery
    OnCalcFields = QryCargosCalcFields
    Connection = DM.ConnectionFB
    SQL.Strings = (
      'SELECT * FROM CARGOS WHERE STATUS = 1')
    Left = 360
    Top = 96
    object QryCargosCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object QryCargosNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 30
    end
    object QryCargosSALARIO_BASE: TFloatField
      FieldName = 'SALARIO_BASE'
      Origin = 'SALARIO_BASE'
    end
    object QryCargosSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object QryCargosC_COD_NOME: TStringField
      FieldKind = fkCalculated
      FieldName = 'C_COD_NOME'
      Size = 50
      Calculated = True
    end
  end
  object DtsFuncionarios: TDataSource
    DataSet = QryFuncionarios
    Left = 400
    Top = 56
  end
  object DtsCargos: TDataSource
    DataSet = QryCargos
    Left = 400
    Top = 96
  end
  object QryLancarEvento: TFDQuery
    Connection = DM.ConnectionFB
    SQL.Strings = (
      'SELECT * FROM HIST_EVENTOS')
    Left = 360
    Top = 144
    object QryLancarEventoMES_LANCAMENTO: TIntegerField
      FieldName = 'MES_LANCAMENTO'
      Origin = 'MES_LANCAMENTO'
    end
    object QryLancarEventoANO_LANCAMENTO: TIntegerField
      FieldName = 'ANO_LANCAMENTO'
      Origin = 'ANO_LANCAMENTO'
    end
    object QryLancarEventoCOD_EVENTO: TStringField
      FieldName = 'COD_EVENTO'
      Origin = 'COD_EVENTO'
      Required = True
      Size = 5
    end
    object QryLancarEventoCOD_FUNCIONARIO: TStringField
      FieldName = 'COD_FUNCIONARIO'
      Origin = 'COD_FUNCIONARIO'
      Size = 6
    end
    object QryLancarEventoCOD_CARGO: TStringField
      FieldName = 'COD_CARGO'
      Origin = 'COD_CARGO'
      Size = 4
    end
    object QryLancarEventoVALOR: TSingleField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Required = True
      currency = True
    end
    object QryLancarEventoJUSTIFICATIVA: TStringField
      FieldName = 'JUSTIFICATIVA'
      Origin = 'JUSTIFICATIVA'
      Size = 100
    end
  end
  object DtsLancarEvento: TDataSource
    DataSet = QryLancarEvento
    Left = 400
    Top = 144
  end
  object QryRemoveDuplicates: TFDQuery
    Connection = DM.ConnectionFB
    SQL.Strings = (
      'SELECT * FROM HIST_EVENTOS')
    Left = 360
    Top = 192
    object QryRemoveDuplicatesMES_LANCAMENTO: TIntegerField
      FieldName = 'MES_LANCAMENTO'
      Origin = 'MES_LANCAMENTO'
    end
    object QryRemoveDuplicatesANO_LANCAMENTO: TIntegerField
      FieldName = 'ANO_LANCAMENTO'
      Origin = 'ANO_LANCAMENTO'
    end
    object QryRemoveDuplicatesCOD_EVENTO: TStringField
      FieldName = 'COD_EVENTO'
      Origin = 'COD_EVENTO'
      Size = 5
    end
    object QryRemoveDuplicatesCOD_FUNCIONARIO: TStringField
      FieldName = 'COD_FUNCIONARIO'
      Origin = 'COD_FUNCIONARIO'
      Size = 6
    end
    object QryRemoveDuplicatesCOD_CARGO: TStringField
      FieldName = 'COD_CARGO'
      Origin = 'COD_CARGO'
      Size = 4
    end
    object QryRemoveDuplicatesVALOR: TSingleField
      FieldName = 'VALOR'
      Origin = 'VALOR'
    end
    object QryRemoveDuplicatesJUSTIFICATIVA: TStringField
      FieldName = 'JUSTIFICATIVA'
      Origin = 'JUSTIFICATIVA'
      Size = 100
    end
  end
end

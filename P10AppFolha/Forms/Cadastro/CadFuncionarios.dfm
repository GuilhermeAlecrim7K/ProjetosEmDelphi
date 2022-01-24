object FrmCadastroFuncionarios: TFrmCadastroFuncionarios
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Funcion'#225'rios'
  ClientHeight = 425
  ClientWidth = 994
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object PgCtrFuncionarios: TPageControl
    Left = 0
    Top = 0
    Width = 994
    Height = 425
    ActivePage = TabListaFuncionarios
    Align = alClient
    TabOrder = 0
    object TabListaFuncionarios: TTabSheet
      Caption = 'Lista de Funcion'#225'rios'
      object DbgFuncionarios: TDBGrid
        Left = 3
        Top = 3
        Width = 970
        Height = 350
        DataSource = DtsFuncionarios
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnTitleClick = DbgFuncionariosTitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'C_TITULO_CARGO'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA_NASCIMENTO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONTATO'
            Title.Caption = 'Contato'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMAIL'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'C_STATUS'
            Visible = True
          end>
      end
      object BtnIncluir: TButton
        Left = 726
        Top = 367
        Width = 75
        Height = 25
        Caption = 'Novo'
        TabOrder = 1
        OnClick = BtnIncluirClick
      end
      object BtnEditar: TButton
        Left = 807
        Top = 367
        Width = 75
        Height = 25
        Caption = 'Editar'
        TabOrder = 2
        OnClick = BtnEditarClick
      end
      object BtnInativar: TButton
        Left = 888
        Top = 367
        Width = 75
        Height = 25
        Caption = 'Inativar'
        TabOrder = 3
        OnClick = BtnInativarClick
      end
      object EdtBuscaFuncionario: TEdit
        Left = 3
        Top = 367
        Width = 121
        Height = 21
        TabOrder = 4
        TextHint = 'Pesquisar'
        OnChange = EdtBuscaFuncionarioChange
      end
      object ChkBoxShowAtivos: TCheckBox
        Left = 130
        Top = 369
        Width = 159
        Height = 17
        Caption = 'Mostrar funcion'#225'rios inativos'
        TabOrder = 5
        OnClick = ChkBoxShowAtivosClick
      end
    end
    object TabOperacoes: TTabSheet
      Caption = 'Novo Cadastro'
      ImageIndex = 1
      object LblCodigo: TLabel
        Left = 8
        Top = 8
        Width = 104
        Height = 13
        Caption = 'C'#243'digo do funcion'#225'rio'
        FocusControl = DbEdtCodigo
      end
      object LblNome: TLabel
        Left = 8
        Top = 48
        Width = 27
        Height = 13
        Caption = 'Nome'
        FocusControl = DbEdtNome
      end
      object LblDataNascimento: TLabel
        Left = 8
        Top = 88
        Width = 96
        Height = 13
        Caption = 'Data de Nascimento'
      end
      object LblTelefone: TLabel
        Left = 8
        Top = 135
        Width = 95
        Height = 13
        Caption = 'Telefone p/ contato'
        FocusControl = DbEdtIncluirTelefone
      end
      object LblEmail: TLabel
        Left = 8
        Top = 176
        Width = 91
        Height = 13
        Caption = 'Endere'#231'o de e-mail'
        FocusControl = DbEdtEmail
      end
      object LblPadraoEmailCorporativo: TLabel
        Left = 137
        Top = 192
        Width = 129
        Height = 13
        Caption = '@alecrimtecnologia.com.br'
      end
      object DbEdtCodigo: TDBEdit
        Left = 8
        Top = 21
        Width = 82
        Height = 21
        DataField = 'CODIGO'
        DataSource = DtsFuncionarios
        TabOrder = 0
      end
      object DbEdtNome: TDBEdit
        Left = 8
        Top = 61
        Width = 329
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NOME'
        DataSource = DtsFuncionarios
        TabOrder = 1
      end
      object DbEdtIncluirTelefone: TDBEdit
        Left = 8
        Top = 148
        Width = 121
        Height = 21
        DataField = 'CONTATO'
        DataSource = DtsFuncionarios
        TabOrder = 3
      end
      object DbEdtEmail: TDBEdit
        Left = 8
        Top = 189
        Width = 129
        Height = 21
        CharCase = ecLowerCase
        DataField = 'EMAIL'
        DataSource = DtsFuncionarios
        TabOrder = 4
      end
      object DtpDataNascimento: TDateTimePicker
        Left = 8
        Top = 101
        Width = 104
        Height = 26
        Date = 32874.000000000000000000
        Time = 32874.000000000000000000
        TabOrder = 2
      end
      object DbRadGrpStatus: TDBRadioGroup
        Left = 8
        Top = 216
        Width = 201
        Height = 33
        Caption = 'Status'
        Columns = 2
        DataField = 'STATUS'
        DataSource = DtsFuncionarios
        Items.Strings = (
          'Ativo'
          'Inativo')
        TabOrder = 5
        Values.Strings = (
          '1'
          '0')
      end
      object PnlCargoSalario: TPanel
        Left = -4
        Top = 255
        Width = 329
        Height = 104
        BevelOuter = bvNone
        TabOrder = 6
        Visible = False
        object LblCargo: TLabel
          Left = 12
          Top = 0
          Width = 29
          Height = 13
          Caption = 'Cargo'
        end
        object LblSalarioInicial: TLabel
          Left = 12
          Top = 43
          Width = 62
          Height = 13
          Caption = 'Sal'#225'rio Inicial'
        end
        object DbLkpCmbBoxCargo: TDBLookupComboBox
          Left = 12
          Top = 16
          Width = 264
          Height = 21
          DataField = 'COD_CARGO'
          DataSource = DtsFuncionarios
          KeyField = 'CODIGO'
          ListField = 'C_COD_NOME'
          ListSource = DtsCargos
          TabOrder = 0
          OnCloseUp = DbLkpCmbBoxCargoCloseUp
        end
        object DbEdtSalarioInicial: TDBEdit
          Left = 12
          Top = 59
          Width = 121
          Height = 21
          DataField = 'SALARIO_ATUAL'
          DataSource = DtsFuncionarios
          TabOrder = 1
        end
      end
      object BtnSalvar: TButton
        Left = 181
        Top = 365
        Width = 75
        Height = 25
        Caption = 'Salvar'
        TabOrder = 7
        OnClick = BtnSalvarClick
      end
      object BtnCancelar: TButton
        Left = 262
        Top = 365
        Width = 75
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 8
        OnClick = BtnCancelarClick
      end
    end
  end
  object QryFuncionarios: TFDQuery
    OnCalcFields = QryFuncionariosCalcFields
    IndexFieldNames = 'NOME'
    Connection = DM.ConnectionFB
    SQL.Strings = (
      'SELECT * FROM FUNCIONARIOS WHERE STATUS = 1')
    Left = 360
    Top = 8
    object QryFuncionariosCODIGO: TStringField
      DisplayLabel = 'C'#243'digo do funcion'#225'rio'
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      EditMask = '000000;0;_'
      Size = 6
    end
    object QryFuncionariosNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 50
    end
    object QryFuncionariosDATA_NASCIMENTO: TStringField
      DisplayLabel = 'Data de Nascimento'
      FieldName = 'DATA_NASCIMENTO'
      Origin = 'DATA_NASCIMENTO'
      Required = True
      Size = 10
    end
    object QryFuncionariosCONTATO: TStringField
      DisplayLabel = 'Telefone p/ contato'
      DisplayWidth = 16
      FieldName = 'CONTATO'
      Origin = 'CONTATO'
      EditMask = '(00) 0 0000-0000;0;_'
      Size = 11
    end
    object QryFuncionariosC_TITULO_CARGO: TStringField
      DisplayLabel = 'Cargo'
      FieldKind = fkLookup
      FieldName = 'C_TITULO_CARGO'
      LookupDataSet = QryCargos
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'NOME'
      KeyFields = 'COD_CARGO'
      Size = 50
      Lookup = True
    end
    object QryFuncionariosEMAIL: TStringField
      DisplayLabel = 'Endere'#231'o de e-mail'
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 50
    end
    object QryFuncionariosSTATUS: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'STATUS'
      Origin = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object QryFuncionariosCOD_CARGO: TStringField
      FieldName = 'COD_CARGO'
      Origin = 'COD_CARGO'
      Size = 4
    end
    object QryFuncionariosC_STATUS: TStringField
      DisplayLabel = 'Status'
      FieldKind = fkCalculated
      FieldName = 'C_STATUS'
      Size = 10
      Calculated = True
    end
    object QryFuncionariosSALARIO_ATUAL: TSingleField
      FieldName = 'SALARIO_ATUAL'
      Origin = 'SALARIO_ATUAL'
    end
  end
  object DtsFuncionarios: TDataSource
    DataSet = QryFuncionarios
    Left = 360
    Top = 56
  end
  object QryCargos: TFDQuery
    Active = True
    OnCalcFields = QryCargosCalcFields
    IndexFieldNames = 'NOME'
    Connection = DM.ConnectionFB
    SQL.Strings = (
      'SELECT * FROM CARGOS WHERE STATUS = '#39'1'#39)
    Left = 356
    Top = 104
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
  object DtsCargos: TDataSource
    DataSet = QryCargos
    Left = 356
    Top = 152
  end
  object QrySalarios: TFDQuery
    Connection = DM.ConnectionFB
    SQL.Strings = (
      'SELECT * FROM HIST_ALTER_SALARIO_INDIVIDUAL')
    Left = 356
    Top = 200
  end
  object DtsSalarios: TDataSource
    DataSet = QrySalarios
    Left = 356
    Top = 248
  end
end

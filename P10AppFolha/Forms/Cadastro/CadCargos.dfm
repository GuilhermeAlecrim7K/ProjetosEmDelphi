object FrmCadastroCargos: TFrmCadastroCargos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Cargos'
  ClientHeight = 451
  ClientWidth = 573
  Color = clBtnFace
  Constraints.MinHeight = 250
  Constraints.MinWidth = 320
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    573
    451)
  PixelsPerInch = 96
  TextHeight = 13
  object PgCtrCadCargos: TPageControl
    Left = 0
    Top = 0
    Width = 573
    Height = 451
    ActivePage = TabEdicao
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    OnChange = SetSQLState
    object TabInclusao: TTabSheet
      Caption = 'Incluir novo registro'
      object LblCodigoCargo: TLabel
        Left = 3
        Top = 3
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = DbEdtCodigoInclusao
      end
      object LblSalarioBaseCargo: TLabel
        Left = 3
        Top = 84
        Width = 121
        Height = 13
        Caption = 'Sal'#225'rio base da categoria'
        FocusControl = DbEdtSalarioBaseInclusao
      end
      object LblTituloCargo: TLabel
        Left = 3
        Top = 44
        Width = 73
        Height = 13
        Caption = 'T'#237'tulo do Cargo'
        FocusControl = DbEdtTituloInclusao
      end
      object DbChkBoxStatusAtivo: TDBCheckBox
        Left = 243
        Top = 19
        Width = 49
        Height = 17
        Caption = 'Ativo'
        DataField = 'STATUS'
        DataSource = DtsCadCargos
        TabOrder = 1
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DbEdtCodigoInclusao: TDBEdit
        Left = 3
        Top = 17
        Width = 56
        Height = 21
        DataField = 'CODIGO'
        DataSource = DtsCadCargos
        TabOrder = 0
        OnExit = CheckCamposInclusao
      end
      object DbEdtSalarioBaseInclusao: TDBEdit
        Left = 3
        Top = 97
        Width = 134
        Height = 21
        DataField = 'SALARIO_BASE'
        DataSource = DtsCadCargos
        TabOrder = 3
        OnExit = CheckCamposInclusao
      end
      object DbEdtTituloInclusao: TDBEdit
        Left = 3
        Top = 57
        Width = 241
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NOME'
        DataSource = DtsCadCargos
        TabOrder = 2
        OnExit = CheckCamposInclusao
      end
    end
    object TabEdicao: TTabSheet
      Caption = 'Editar registro existente'
      ImageIndex = 1
      object EdtPesquisar: TEdit
        Left = 0
        Top = 3
        Width = 222
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
        TextHint = 'Pesquisar'
      end
      object BtnPesquisar: TButton
        Left = 228
        Top = 3
        Width = 75
        Height = 22
        Caption = 'Pesquisar'
        TabOrder = 1
        OnClick = BtnPesquisarClick
      end
      object DbgEdicao: TDBGrid
        Left = 0
        Top = 34
        Width = 303
        Height = 103
        Hint = 'Clique sobre um registro para selecion'#225'-lo'
        DataSource = DtsCadCargos
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnColEnter = DbgEdicaoColEnter
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
            FieldName = 'CALC_STATUS'
            Visible = True
          end>
      end
      object PnlEdicao: TPanel
        Left = 0
        Top = 152
        Width = 303
        Height = 124
        BevelOuter = bvNone
        TabOrder = 3
        Visible = False
        object Label1: TLabel
          Left = 11
          Top = 11
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
          FocusControl = DBEdtCodigoEdicao
        end
        object Label2: TLabel
          Left = 11
          Top = 52
          Width = 73
          Height = 13
          Caption = 'T'#237'tulo do Cargo'
          FocusControl = DbEdtTituloEdicao
        end
        object DBEdtCodigoEdicao: TDBEdit
          Left = 11
          Top = 25
          Width = 56
          Height = 21
          DataField = 'CODIGO'
          DataSource = DtsCadCargos
          TabOrder = 0
          OnExit = CheckCamposInclusao
        end
        object DbEdtTituloEdicao: TDBEdit
          Left = 11
          Top = 65
          Width = 241
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NOME'
          DataSource = DtsCadCargos
          TabOrder = 1
          OnExit = CheckCamposInclusao
        end
        object DbChkBoxAtivoEdicao: TDBCheckBox
          Left = 203
          Top = 19
          Width = 49
          Height = 17
          Caption = 'Ativo'
          DataField = 'STATUS'
          DataSource = DtsCadCargos
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
    end
  end
  object BtnCancelar: TButton
    Left = 490
    Top = 418
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = BtnCancelarClick
  end
  object BtnSalvar: TButton
    Left = 410
    Top = 418
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Salvar'
    Enabled = False
    TabOrder = 1
    OnClick = BtnSalvarClick
  end
  object DtsCadCargos: TDataSource
    DataSet = QryCadCargos
    Left = 328
    Top = 80
  end
  object MainMenu1: TMainMenu
    Left = 328
    Top = 136
    object MenuHeadListaCargos: TMenuItem
      Caption = 'Consultar Lista de Cargos'
      OnClick = MenuHeadListaCargosClick
    end
  end
  object QryCadCargos: TFDQuery
    OnCalcFields = QryCadCargosCalcFields
    IndexFieldNames = 'CODIGO;NOME'
    Connection = DM.ConnectionFB
    SQL.Strings = (
      'SELECT * FROM CARGOS'
      '')
    Left = 328
    Top = 24
    object QryCadCargosCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      EditMask = '0000;1;_'
      Size = 4
    end
    object QryCadCargosNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 30
    end
    object QryCadCargosSALARIO_BASE: TFloatField
      DefaultExpression = '1212.00'
      DisplayLabel = 'Sal'#225'rio base da categoria'
      FieldName = 'SALARIO_BASE'
      Origin = 'SALARIO_BASE'
      Required = True
      currency = True
      MaxValue = 999999.000000000000000000
      Precision = 8
    end
    object QryCadCargosSTATUS: TStringField
      DefaultExpression = #39'0'#39
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Origin = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object QryCadCargosCALC_STATUS: TStringField
      DisplayLabel = 'Status'
      FieldKind = fkCalculated
      FieldName = 'CALC_STATUS'
      KeyFields = 'STATUS'
      Size = 10
      Calculated = True
    end
  end
end

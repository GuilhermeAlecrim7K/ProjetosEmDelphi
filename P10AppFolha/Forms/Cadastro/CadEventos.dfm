object FrmCadastroEventos: TFrmCadastroEventos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Eventos'
  ClientHeight = 220
  ClientWidth = 475
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
  object PgCtrCadEventos: TPageControl
    Left = 0
    Top = 0
    Width = 475
    Height = 220
    ActivePage = TabListaEventos
    Align = alClient
    TabOrder = 0
    TabStop = False
    ExplicitWidth = 410
    ExplicitHeight = 276
    object TabListaEventos: TTabSheet
      Caption = 'Lista de Eventos Cadastrados'
      DesignSize = (
        467
        192)
      object BtnIncluir: TButton
        Left = 227
        Top = 164
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Novo'
        TabOrder = 0
        OnClick = BtnIncluirClick
        ExplicitLeft = 162
        ExplicitTop = 220
      end
      object BtnEditar: TButton
        Left = 308
        Top = 164
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Editar'
        TabOrder = 1
        OnClick = BtnEditarClick
        ExplicitLeft = 243
        ExplicitTop = 220
      end
      object BtnDeletar: TButton
        Left = 389
        Top = 164
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Deletar'
        TabOrder = 2
        OnClick = BtnDeletarClick
        ExplicitLeft = 324
        ExplicitTop = 220
      end
      object DbgEventos: TDBGrid
        Left = 0
        Top = 0
        Width = 464
        Height = 159
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = DtsCadEventos
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'Evento'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CALC_TIPO'
            Width = 110
            Visible = True
          end>
      end
    end
    object TabCrud: TTabSheet
      Caption = 'Crud'
      ImageIndex = 1
      object Label1: TLabel
        Left = 3
        Top = 16
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 3
        Top = 56
        Width = 78
        Height = 13
        Caption = 'T'#237'tulo do evento'
        FocusControl = DBEdit2
      end
      object DBEdit1: TDBEdit
        Left = 3
        Top = 32
        Width = 67
        Height = 21
        DataField = 'CODIGO'
        DataSource = DtsCadEventos
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 3
        Top = 72
        Width = 174
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NOME'
        DataSource = DtsCadEventos
        TabOrder = 1
      end
      object DbRadGrpTipo: TDBRadioGroup
        Left = 3
        Top = 99
        Width = 174
        Height = 38
        Caption = 'Tipo'
        Columns = 2
        DataField = 'TIPO'
        DataSource = DtsCadEventos
        Items.Strings = (
          'Decr'#233'scimo'
          'Acr'#233'scimo')
        TabOrder = 2
        Values.Strings = (
          '0'
          '1')
      end
      object BtnSalvar: TButton
        Left = 21
        Top = 152
        Width = 75
        Height = 25
        Caption = 'Salvar'
        TabOrder = 3
        OnClick = BtnSalvarClick
      end
      object BtnCancelar: TButton
        Left = 102
        Top = 152
        Width = 75
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 4
        OnClick = BtnCancelarClick
      end
    end
  end
  object DtsCadEventos: TDataSource
    DataSet = TblEventos
    Left = 416
    Top = 8
  end
  object TblEventos: TFDTable
    OnCalcFields = TblEventosCalcFields
    IndexFieldNames = 'NOME;CODIGO;TIPO'
    Connection = DM.ConnectionFB
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    TableName = 'EVENTOS'
    Left = 320
    Top = 8
    object TblEventosCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      EditMask = '00000;0;_'
      Size = 5
    end
    object TblEventosNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 30
    end
    object TblEventosTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object TblEventosCALC_TIPO: TStringField
      DisplayLabel = 'Tipo de Evento'
      FieldKind = fkCalculated
      FieldName = 'CALC_TIPO'
      KeyFields = 'CODIGO'
      Size = 15
      Calculated = True
    end
  end
end

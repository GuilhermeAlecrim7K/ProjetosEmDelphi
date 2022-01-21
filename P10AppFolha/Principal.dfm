object FrmPrincipal: TFrmPrincipal
  Left = 342
  Top = 165
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Folha de pagamento - Fortes'
  ClientHeight = 449
  ClientWidth = 766
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    766
    449)
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    AlignWithMargins = True
    Left = 3
    Top = 427
    Width = 760
    Height = 19
    Panels = <
      item
        Text = 'Status da Conex'#227'o'
        Width = 300
      end
      item
        Alignment = taRightJustify
        Text = 'Data do dia'
        Width = 50
      end>
  end
  object PgCtrInicio: TPageControl
    Left = 0
    Top = 8
    Width = 772
    Height = 422
    ActivePage = TabResumoEmpresa
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object TabResumoEmpresa: TTabSheet
      Caption = 'Resumo da empresa'
    end
    object TabTabelas: TTabSheet
      Caption = 'Tabelas de INSS e IRRF'
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = False
      object LblINSS: TLabel
        Left = 3
        Top = 3
        Width = 77
        Height = 40
        Caption = 'INSS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -35
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LbIRRF: TLabel
        Left = 3
        Top = 187
        Width = 86
        Height = 40
        Caption = 'IRRF'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -35
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DbgInss: TDBGrid
        Left = 3
        Top = 49
        Width = 342
        Height = 120
        TabStop = False
        DataSource = DtsInss
        DrawingStyle = gdsGradient
        Enabled = False
        Options = [dgTitles, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        StyleElements = [seFont, seClient]
        Columns = <
          item
            Expanded = False
            FieldName = 'CAL_LIMITE'
            Title.Caption = 'Faixa de Contribui'#231#227'o'
            Width = 150
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CAL_ALIQUOTA'
            Title.Caption = 'Al'#237'quota'
            Width = 55
            Visible = True
          end>
      end
      object DbgIrrf: TDBGrid
        Left = 3
        Top = 233
        Width = 342
        Height = 120
        TabStop = False
        DataSource = DtsIrrf
        DrawingStyle = gdsGradient
        Enabled = False
        Options = [dgTitles, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CAL_LIMITE'
            Title.Caption = 'Faixa de Contribui'#231#227'o'
            Width = 150
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CAL_ALIQUOTA'
            Title.Caption = 'Al'#237'quota'
            Width = 55
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'CAL_DEDUCAO'
            Title.Caption = 'A deduzir'
            Width = 100
            Visible = True
          end>
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 712
    Top = 32
    object MenuHeadCadastros: TMenuItem
      Caption = 'Cadastros'
      object SubMenCadFuncionarios: TMenuItem
        Caption = 'Funcion'#225'rios'
        OnClick = SubMenCadFuncionariosClick
      end
      object SubMenCadCargos: TMenuItem
        Caption = 'Cargos'
        OnClick = SubMenCadCargosClick
      end
      object SubMenCadEventos: TMenuItem
        Caption = 'Eventos'
        OnClick = SubMenCadEventosClick
      end
    end
    object MenuHeadLancamentos: TMenuItem
      Caption = 'Lan'#231'amentos'
      object SubMenLanMudancaDeCargo: TMenuItem
        Caption = 'Mudan'#231'a de cargo'
        OnClick = SubMenLanMudancaDeCargoClick
      end
      object SubMenLanMudancaDeSalario: TMenuItem
        Caption = 'Mudan'#231'a de sal'#225'rio'
        OnClick = SubMenLanMudancaDeSalarioClick
      end
      object SubMenLanEventos: TMenuItem
        Caption = 'Eventos'
        OnClick = SubMenLanEventosClick
      end
    end
    object MenuHeadRelatorios: TMenuItem
      Caption = 'Relat'#243'rios'
      object SubMenRelListaDeCargos: TMenuItem
        Caption = 'Lista de Cargos'
        OnClick = SubMenRelListaDeCargosClick
      end
      object SubMenRelListaDeFuncionarios: TMenuItem
        Caption = 'Lista de Funcion'#225'rios'
        OnClick = SubMenRelListaDeFuncionariosClick
      end
      object SubMenRelEventos: TMenuItem
        Caption = 'Eventos'
        OnClick = SubMenRelEventosClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object SubMenRelINSS: TMenuItem
        Caption = 'INSS'
        OnClick = SubMenRelINSSClick
      end
      object SubMenRelIRRF: TMenuItem
        Caption = 'IRRF'
        OnClick = SubMenRelIRRFClick
      end
    end
    object MenuHeadFolhaDePagamento: TMenuItem
      Caption = 'Folha de Pagamento'
      object SubMenFolPagCalcular: TMenuItem
        Caption = 'Calcular Folha de Pagamento'
        OnClick = SubMenFolPagCalcularClick
      end
      object SubMenFolPagFolhasAnteriores: TMenuItem
        Caption = 'Folhas anteriores'
        OnClick = SubMenFolPagFolhasAnterioresClick
      end
    end
    object MenuHeadSair: TMenuItem
      Caption = 'Sair'
      OnClick = MenuHeadSairClick
    end
  end
  object DtsInss: TDataSource
    AutoEdit = False
    DataSet = TblInss
    Left = 140
    Top = 40
  end
  object DtsIrrf: TDataSource
    AutoEdit = False
    DataSet = TblIrrf
    Left = 148
    Top = 224
  end
  object TblInss: TFDTable
    OnCalcFields = TblInssCalcFields
    IndexFieldNames = 'ALIQUOTA'
    Connection = DM.ConnectionFB
    TableName = 'INSS'
    Left = 100
    Top = 40
    object TblInssALIQUOTA: TSingleField
      FieldName = 'ALIQUOTA'
      Origin = 'ALIQUOTA'
    end
    object TblInssLIMITE_SALARIO: TSingleField
      FieldName = 'LIMITE_SALARIO'
      Origin = 'LIMITE_SALARIO'
    end
    object TblInssCAL_LIMITE: TStringField
      FieldKind = fkCalculated
      FieldName = 'CAL_LIMITE'
      Calculated = True
    end
    object TblInssCAL_ALIQUOTA: TStringField
      FieldKind = fkCalculated
      FieldName = 'CAL_ALIQUOTA'
      Size = 5
      Calculated = True
    end
    object TblInssFAIXA_CONTRIBUICAO: TStringField
      FieldName = 'FAIXA_CONTRIBUICAO'
      Origin = 'FAIXA_CONTRIBUICAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object TblIrrf: TFDTable
    OnCalcFields = TblIrrfCalcFields
    IndexFieldNames = 'ALIQUOTA'
    Connection = DM.ConnectionFB
    TableName = 'IRRF'
    Left = 108
    Top = 224
    object TblIrrfALIQUOTA: TSingleField
      FieldName = 'ALIQUOTA'
      Origin = 'ALIQUOTA'
    end
    object TblIrrfLIMITE_SALARIO: TSingleField
      FieldName = 'LIMITE_SALARIO'
      Origin = 'LIMITE_SALARIO'
    end
    object TblIrrfCAL_LIMITE: TStringField
      FieldKind = fkCalculated
      FieldName = 'CAL_LIMITE'
      Size = 15
      Calculated = True
    end
    object TblIrrfCAL_ALIQUOTA: TStringField
      FieldKind = fkCalculated
      FieldName = 'CAL_ALIQUOTA'
      Size = 5
      Calculated = True
    end
    object TblIrrfCAL_DEDUCAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CAL_DEDUCAO'
      Size = 15
      Calculated = True
    end
    object TblIrrfFAIXA_CONTRIBUICAO: TStringField
      FieldName = 'FAIXA_CONTRIBUICAO'
      Origin = 'FAIXA_CONTRIBUICAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object TblIrrfDEDUCAO: TSingleField
      FieldName = 'DEDUCAO'
      Origin = 'DEDUCAO'
    end
  end
end

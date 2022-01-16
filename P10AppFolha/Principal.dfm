object FrmPrincipal: TFrmPrincipal
  Left = 342
  Top = 165
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Folha de pagamento - Fortes'
  ClientHeight = 511
  ClientWidth = 787
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  DesignSize = (
    787
    511)
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    AlignWithMargins = True
    Left = 3
    Top = 489
    Width = 781
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
    ExplicitLeft = -2
    ExplicitTop = 484
  end
  object PgCtrInicio: TPageControl
    Left = 0
    Top = 8
    Width = 793
    Height = 484
    ActivePage = TabResumoEmpresa
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    ExplicitWidth = 782
    ExplicitHeight = 458
    object TabResumoEmpresa: TTabSheet
      Caption = 'Resumo da empresa'
    end
    object TabTabelas: TTabSheet
      Caption = 'Tabelas de INSS e IRRF'
      ImageIndex = 1
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
      object StrGrdTabelaINSS: TStringGrid
        Left = 0
        Top = 49
        Width = 240
        Height = 128
        TabStop = False
        ColCount = 2
        Enabled = False
        FixedCols = 0
        ScrollBars = ssNone
        TabOrder = 0
      end
      object StrGrdTabelaIRRF: TStringGrid
        Left = 0
        Top = 233
        Width = 320
        Height = 128
        TabStop = False
        ColCount = 3
        Enabled = False
        FixedCols = 0
        ScrollBars = ssNone
        TabOrder = 1
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 704
    Top = 32
    object MenuHeadCadastros: TMenuItem
      Caption = 'Cadastros'
      object SubMenCadFuncionarios: TMenuItem
        Caption = 'Funcion'#225'rios'
      end
      object SubMenCadCargos: TMenuItem
        Caption = 'Cargos'
      end
      object SubMenCadEventos: TMenuItem
        Caption = 'Eventos'
      end
    end
    object MenuHeadLancamentos: TMenuItem
      Caption = 'Lan'#231'amentos'
      object SubMenLanMudancaDeCargo: TMenuItem
        Caption = 'Mudan'#231'a de cargo'
      end
      object SubMenLanMudancaDeSalario: TMenuItem
        Caption = 'Mudan'#231'a de sal'#225'rio'
      end
      object SubMenLanEventos: TMenuItem
        Caption = 'Eventos'
      end
    end
    object MenuHeadRelatorios: TMenuItem
      Caption = 'Relat'#243'rios'
      object SubMenRelListaDeCargos: TMenuItem
        Caption = 'Lista de Cargos'
      end
      object SubMenRelListaDeFuncionarios: TMenuItem
        Caption = 'Lista de Funcion'#225'rios'
      end
      object SubMenRelEventos: TMenuItem
        Caption = 'Eventos'
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object SubMenRelINSS: TMenuItem
        Caption = 'INSS'
      end
      object SubMenRelIRRF: TMenuItem
        Caption = 'IRRF'
      end
    end
    object MenuHeadFolhaDePagamento: TMenuItem
      Caption = 'Folha de Pagamento'
      object SubMenFolPagCalcular: TMenuItem
        Caption = 'Calcular Folha de Pagamento'
      end
      object SubMenFolPagFolhasAnteriores: TMenuItem
        Caption = 'Folhas anteriores'
      end
    end
    object MenuHeadSair: TMenuItem
      Caption = 'Sair'
    end
  end
end

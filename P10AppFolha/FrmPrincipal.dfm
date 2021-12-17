object FMain: TFMain
  Left = 0
  Top = 0
  Caption = 'Aplica'#231#227'o'
  ClientHeight = 426
  ClientWidth = 522
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 488
    Top = 8
    object Cargos1: TMenuItem
      Caption = 'Cadastros'
      object Cargos2: TMenuItem
        Caption = 'Cargos'
        OnClick = Cargos2Click
      end
      object Cargos3: TMenuItem
        Caption = 'Eventos'
        OnClick = Cargos3Click
      end
      object Funcionrios1: TMenuItem
        Caption = 'Funcion'#225'rios'
        OnClick = Funcionrios1Click
      end
      object Funcionrios2: TMenuItem
        Caption = '-'
      end
      object abeladeINSS1: TMenuItem
        Caption = 'Tabela de INSS'
      end
      object abeladeINSS2: TMenuItem
        Caption = 'Tabela de IRRF'
      end
    end
    object Processos1: TMenuItem
      Caption = 'Processos'
      object Mudanadesalrio1: TMenuItem
        Caption = 'Mudan'#231'a de sal'#225'rio'
      end
      object Mudanadesalrio2: TMenuItem
        Caption = 'Lan'#231'ar Evento para funcion'#225'rio'
      end
      object FolhadePagamento1: TMenuItem
        Caption = 'Folha de Pagamento'
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object FolhadePagamento2: TMenuItem
        Caption = 'Folha de Pagamento'
      end
      object Funcionrios3: TMenuItem
        Caption = 'Funcion'#225'rios'
      end
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
end

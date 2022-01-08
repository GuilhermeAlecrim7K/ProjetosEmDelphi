object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Formul'#225'rio Principal'
  ClientHeight = 201
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 8
    Top = 8
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
      object Produtos1: TMenuItem
        Caption = 'Produtos'
        OnClick = AbrirFrmProdutos
      end
      object Clientes1: TMenuItem
        Caption = 'Clientes'
        OnClick = AbrirFrmClientes
      end
      object MDI: TMenuItem
        Caption = 'Mdi'
        OnClick = AbrirFrmMDIs
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object N2: TMenuItem
        Caption = 'Sair'
        OnClick = SairClick
      end
    end
    object MDIs1: TMenuItem
      Caption = 'MDI'#39's'
      OnClick = FecharTodosMDIs
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 64
    Top = 8
    object Copiar1: TMenuItem
      Caption = 'Copiar'
    end
    object Copiar2: TMenuItem
      Caption = 'Colar'
    end
    object MaisInformaes1: TMenuItem
      Caption = 'Mais Informa'#231#245'es'
    end
  end
end

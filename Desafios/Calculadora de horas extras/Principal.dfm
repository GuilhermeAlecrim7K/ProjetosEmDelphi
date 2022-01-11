object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 371
  ClientWidth = 339
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LblQtdeHoras: TLabel
    Left = 154
    Top = 8
    Width = 73
    Height = 13
    Caption = 'Qtde. de horas'
  end
  object CldData: TCalendarPicker
    Left = 8
    Top = 72
    Height = 32
    CalendarHeaderInfo.DaysOfWeekFont.Charset = DEFAULT_CHARSET
    CalendarHeaderInfo.DaysOfWeekFont.Color = clWindowText
    CalendarHeaderInfo.DaysOfWeekFont.Height = -13
    CalendarHeaderInfo.DaysOfWeekFont.Name = 'Segoe UI'
    CalendarHeaderInfo.DaysOfWeekFont.Style = []
    CalendarHeaderInfo.Font.Charset = DEFAULT_CHARSET
    CalendarHeaderInfo.Font.Color = clWindowText
    CalendarHeaderInfo.Font.Height = -20
    CalendarHeaderInfo.Font.Name = 'Segoe UI'
    CalendarHeaderInfo.Font.Style = []
    Color = clWindow
    Date = 44567.000000000000000000
    FirstYear = 2021
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Consolas'
    Font.Style = [fsBold]
    IsEmpty = False
    MinYear = 2021
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 2
    TextHint = 'select a date'
  end
  object RadGrpIsFeriado: TRadioGroup
    Left = 160
    Top = 72
    Width = 81
    Height = 57
    Caption = 'Feriado'
    ItemIndex = 1
    Items.Strings = (
      'Sim'
      'N'#227'o')
    TabOrder = 3
  end
  object BtnRegistraHoraExtra: TButton
    Left = 247
    Top = 22
    Width = 75
    Height = 25
    Caption = 'Registrar'
    TabOrder = 4
    OnClick = BtnRegistraHoraExtraClick
  end
  object CmbBoxQtdeHoras: TComboBox
    Left = 154
    Top = 24
    Width = 87
    Height = 22
    Style = csOwnerDrawFixed
    ItemIndex = 0
    TabOrder = 1
    Text = '1'
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5')
  end
  object MskEdtCodigoFuncionario: TMaskEdit
    Left = 8
    Top = 24
    Width = 122
    Height = 21
    EditMask = '!0000;0;_'
    MaxLength = 4
    TabOrder = 0
    Text = ''
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 144
    Width = 339
    Height = 227
    Align = alBottom
    TabOrder = 5
    ExplicitLeft = 8
  end
  object MainMenu1: TMainMenu
    Left = 272
    Top = 80
    object MenuRelatorios: TMenuItem
      Caption = 'Relat'#243'rios'
      object SubMenuGerarRelatorios: TMenuItem
        Caption = 'Gerar Relat'#243'rio'
        OnClick = SubMenuGerarRelatoriosClick
      end
    end
  end
end

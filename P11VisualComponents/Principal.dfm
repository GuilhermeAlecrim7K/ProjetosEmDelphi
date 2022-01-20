object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Componentes Visuais Delphi'
  ClientHeight = 540
  ClientWidth = 677
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 8
    Top = 32
    Width = 665
    Height = 473
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object Label1: TLabel
        Left = 16
        Top = 24
        Width = 31
        Height = 13
        Caption = 'Label1'
      end
      object SpeedButton1: TSpeedButton
        Left = 586
        Top = 250
        Width = 23
        Height = 22
      end
      object Image1: TImage
        Left = 424
        Top = 295
        Width = 105
        Height = 105
      end
      object Shape1: TShape
        Left = 545
        Top = 312
        Width = 65
        Height = 65
      end
      object Edit1: TEdit
        Left = 16
        Top = 43
        Width = 121
        Height = 21
        TabOrder = 0
        Text = 'Edit1'
      end
      object MaskEdit1: TMaskEdit
        Left = 152
        Top = 43
        Width = 97
        Height = 21
        EditMask = '!\(99\)0 0000-0000;1;_'
        MaxLength = 15
        TabOrder = 1
        Text = '(85)9 9999-9999'
      end
      object Memo1: TMemo
        Left = 16
        Top = 70
        Width = 233
        Height = 89
        BevelKind = bkSoft
        BevelOuter = bvRaised
        BiDiMode = bdLeftToRight
        Lines.Strings = (
          'Texto'
          'De'
          'V'#225'rias'
          'Linhas')
        ParentBiDiMode = False
        TabOrder = 2
      end
      object GroupBox1: TGroupBox
        Left = 16
        Top = 184
        Width = 185
        Height = 105
        Caption = 'GroupBox1'
        TabOrder = 3
        object CheckBox1: TCheckBox
          Left = 16
          Top = 24
          Width = 97
          Height = 17
          Caption = 'CheckBox1'
          TabOrder = 0
        end
        object CheckBox2: TCheckBox
          Left = 16
          Top = 47
          Width = 97
          Height = 17
          Caption = 'CheckBox2'
          TabOrder = 1
        end
        object CheckBox3: TCheckBox
          Left = 16
          Top = 70
          Width = 97
          Height = 17
          Caption = 'CheckBox3'
          TabOrder = 2
        end
      end
      object RadioGroup1: TRadioGroup
        Left = 216
        Top = 184
        Width = 185
        Height = 105
        Caption = 'RadioGroup1'
        Items.Strings = (
          'Item 1'
          'Item 2'
          'Item 3'
          'Item 4')
        TabOrder = 4
      end
      object ComboBox1: TComboBox
        Left = 272
        Top = 96
        Width = 129
        Height = 21
        TabOrder = 5
        Text = 'ComboBox1'
      end
      object CheckBox4: TCheckBox
        Left = 272
        Top = 43
        Width = 97
        Height = 17
        Caption = 'CheckBox4'
        TabOrder = 6
      end
      object RadioButton1: TRadioButton
        Left = 272
        Top = 66
        Width = 113
        Height = 17
        Caption = 'RadioButton1'
        TabOrder = 7
      end
      object SpinEdit1: TSpinEdit
        Left = 272
        Top = 123
        Width = 129
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 8
        Value = 0
      end
      object ListBox1: TListBox
        Left = 16
        Top = 295
        Width = 185
        Height = 97
        ItemHeight = 13
        Items.Strings = (
          'Item 1'
          'Item 2'
          'Item 3'
          'Item 4')
        TabOrder = 9
      end
      object CheckListBox1: TCheckListBox
        Left = 216
        Top = 295
        Width = 185
        Height = 97
        ItemHeight = 13
        Items.Strings = (
          'Item 1'
          'Item 2'
          'Item 3'
          'Item 4')
        TabOrder = 10
      end
      object DateTimePicker1: TDateTimePicker
        Left = 424
        Top = 39
        Width = 186
        Height = 21
        Margins.Bottom = 10
        Date = 44568.000000000000000000
        Time = 0.911774502317712200
        TabOrder = 11
      end
      object MonthCalendar1: TMonthCalendar
        Left = 424
        Top = 66
        Width = 225
        Height = 160
        Date = 44652.000000000000000000
        TabOrder = 12
      end
      object Button1: TButton
        Left = 424
        Top = 250
        Width = 75
        Height = 25
        Caption = 'Button1'
        TabOrder = 13
      end
      object BitBtn1: TBitBtn
        Left = 505
        Top = 250
        Width = 75
        Height = 25
        Caption = 'BitBtn1'
        TabOrder = 14
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      object StringGrid1: TStringGrid
        Left = 0
        Top = 40
        Width = 654
        Height = 387
        TabOrder = 0
      end
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 677
    Height = 29
    Caption = 'ToolBar1'
    TabOrder = 1
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Caption = 'ToolButton1'
      ImageIndex = 0
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 521
    Width = 677
    Height = 19
    Panels = <
      item
        Text = 'Texto1'
        Width = 100
      end
      item
        Text = 'Data de hoje'
        Width = 200
      end
      item
        Width = 50
      end>
    ExplicitTop = 489
    ExplicitWidth = 822
  end
  object ImageList1: TImageList
    Left = 692
    Top = 56
  end
  object ApplicationEvents1: TApplicationEvents
    Left = 768
    Top = 56
  end
  object Timer1: TTimer
    Left = 696
    Top = 120
  end
  object TrayIcon1: TTrayIcon
    Left = 768
    Top = 120
  end
  object OpenDialog1: TOpenDialog
    Left = 696
    Top = 184
  end
  object SaveDialog1: TSaveDialog
    Left = 696
    Top = 240
  end
end

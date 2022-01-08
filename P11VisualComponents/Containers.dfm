object FrmContainers: TFrmContainers
  Left = 0
  Top = 0
  Caption = 'Containers'
  ClientHeight = 455
  ClientWidth = 626
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 289
    Height = 193
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
    end
  end
  object GroupBox1: TGroupBox
    Left = 312
    Top = 32
    Width = 185
    Height = 165
    Caption = 'GroupBox1'
    TabOrder = 1
    object CheckBox1: TCheckBox
      Left = 16
      Top = 24
      Width = 97
      Height = 17
      Caption = 'CheckBox1'
      TabOrder = 0
    end
    object RadioButton1: TRadioButton
      Left = 16
      Top = 64
      Width = 113
      Height = 17
      Caption = 'RadioButton1'
      TabOrder = 1
    end
  end
  object ScrollBox1: TScrollBox
    Left = 312
    Top = 216
    Width = 185
    Height = 177
    TabOrder = 2
    object ButtonedEdit1: TButtonedEdit
      Left = 16
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'ButtonedEdit1'
    end
  end
  object Panel1: TPanel
    Left = 8
    Top = 216
    Width = 285
    Height = 177
    Caption = 'Panel1'
    TabOrder = 3
    object Edit1: TEdit
      Left = 4
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'Edit1'
    end
  end
end

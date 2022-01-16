object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 116
  Width = 286
  object ConnectionFB: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'User_Name=sysdba'
      'Password=masterkey')
    LoginPrompt = False
    Transaction = Transaction
    Left = 32
    Top = 32
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    Left = 208
    Top = 32
  end
  object Transaction: TFDTransaction
    Connection = ConnectionFB
    Left = 112
    Top = 32
  end
end

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
      'Password=masterkey'
      'Server=localhost'
      'Port=3050'
      'Database=C:\Projetos\P10AppFolha\Database\DATABASE.FDB')
    Connected = True
    LoginPrompt = False
    Transaction = Transaction
    Left = 32
    Top = 32
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    VendorLib = 'C:\Program Files\Firebird\Firebird_2_5\WOW64\fbclient.dll'
    Left = 208
    Top = 32
  end
  object Transaction: TFDTransaction
    Connection = ConnectionFB
    Left = 112
    Top = 32
  end
end

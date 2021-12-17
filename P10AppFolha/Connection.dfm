object DModule: TDModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 133
  Width = 270
  object FDConnect: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'Database=C:\Projetos\P10AppFolha\Win32\Debug\DADOSFOLHA.FDB'
      'Password=masterkey'
      'Server=localhost'
      'Port=3050'
      'User_Name=SYSDBA')
    LoginPrompt = False
    Transaction = FDTransaction1
    Left = 48
    Top = 16
  end
  object FDTransaction1: TFDTransaction
    Connection = FDConnect
    Left = 48
    Top = 72
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    VendorLib = 'C:\Program Files\Firebird\Firebird_2_5\WOW64\fbclient.dll'
    Left = 192
    Top = 16
  end
end

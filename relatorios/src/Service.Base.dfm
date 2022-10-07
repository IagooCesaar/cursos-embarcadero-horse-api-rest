object ServiceBase: TServiceBase
  OldCreateOrder = False
  Height = 150
  Width = 215
  object Connection: TFDConnection
    Params.Strings = (
      
        'Database=C:\#DEV\#Cursos\youtube\Delphi-Horse\api-rest\relatorio' +
        's\database\database.db'
      'DriverID=sQLite')
    ConnectedStoredUsage = [auDesignTime]
    LoginPrompt = False
    Left = 24
    Top = 16
  end
end

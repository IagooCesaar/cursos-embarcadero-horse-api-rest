program relatorios_horse;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  App in 'src\App.pas',
  Service.Base in 'src\services\Service.Base.pas' {ServiceBase: TDataModule},
  Service.Base.Simples in 'src\services\Service.Base.Simples.pas' {ServiceBaseSimples: TDataModule},
  Service.Cliente in 'src\services\Service.Cliente.pas' {ServiceCliente: TDataModule},
  Reports.Base in 'src\reports\Reports.Base.pas' {ReportBase: TFrame},
  Reports.Base.Simples in 'src\reports\Reports.Base.Simples.pas' {ReportBaseSimples: TFrame},
  Reports.Cliente in 'src\reports\Reports.Cliente.pas' {ReportCliente: TFrame},
  Controllers.Cliente in 'src\controllers\Controllers.Cliente.pas';

begin

  try
    App.Start;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.

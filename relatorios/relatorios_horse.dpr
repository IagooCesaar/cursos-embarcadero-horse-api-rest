program relatorios_horse;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  App in 'src\App.pas',
  Service.Base in 'src\services\Service.Base.pas' {ServiceBase: TDataModule},
  Service.Base.Simples in 'src\services\Service.Base.Simples.pas' {ServiceBaseSimples: TDataModule},
  Service.Cliente in 'src\services\Service.Cliente.pas' {ServiceBaseCliente: TDataModule},
  Report.Base in 'src\reports\Report.Base.pas' {Frame1: TFrame};

begin
  try
    App.Start;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.

unit App;

interface

procedure Start;

implementation

uses
  System.SyncObjs,
  System.SysUtils,
  Horse,
  Horse.OctetStream,

  Controllers.Cliente;

procedure Start;
begin

  {$IFDEF MSWINDOWS}
  IsConsole := False;
  ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}

  THorse.Use(OctetStream);

  Controllers.Cliente.Registry;

  THorse.Listen(StrToIntDef(GetEnvironmentVariable('SERVER_PORT'), 8486),
    procedure(Horse: THorse)
    begin
      Writeln(Format('Server is runing on %s:%d', [Horse.Host, Horse.Port]));
      Readln;
    end
  );

end;

end.

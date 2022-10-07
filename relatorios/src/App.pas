unit App;

interface

procedure Start;

implementation

uses
  System.SyncObjs,
  System.SysUtils,
  Horse;

procedure Start;
begin

  THorse.Listen(StrToIntDef(GetEnvironmentVariable('SERVER_PORT'), 8486),
    procedure(Horse: THorse)
    begin
      Writeln(Format('Server is runing on %s:%d', [Horse.Host, Horse.Port]));
      Readln;
    end
  );

end;

end.

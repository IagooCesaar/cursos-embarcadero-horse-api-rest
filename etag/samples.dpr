program samples;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Horse.Etag,
  Horse.Jhonson,
  System.JSON;

begin
  THorse
    .Use(Jhonson)
    .Use(eTag);

  THorse.Get('users',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      Res.Send<TJsonObject>(TJsonObject.Create.AddPair('login', 'iago'));
    end);

  THorse.Listen(9000);
end.

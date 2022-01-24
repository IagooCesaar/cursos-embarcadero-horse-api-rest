program backend;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Json,
  Horse,
  Horse.Jhonson,
  Horse.Commons;

var
  App: THorse;
  Users: TJSONArray;

begin
  Users := TJSONArray.Create;

  App   := THorse.Create(9000);
  App.Use(Jhonson);

  App.Get('/users',
    procedure (Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      Res.Send<TJSONAncestor>(Users.Clone);
    end);

  App.Post('/users',
    procedure (Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var user: TJSONObject;
    begin
      user  := Req.Body<TJSONObject>.Clone as TJSONObject;
      Users.AddElement(user);

      Res
        .Status(THTTPStatus.Created)
        .Send<TJSONAncestor>(user.Clone);
    end);

  App.Start;
end.

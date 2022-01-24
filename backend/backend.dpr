program backend;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Json,
  Horse,
  Horse.Jhonson,
  Horse.Commons,
  Horse.BasicAuthentication,
  Horse.Compression;

var
  App: THorse;
  Users: TJSONArray;

begin
  Users := TJSONArray.Create;

  App := THorse.Create(9000);
  App.Use(Compression());
  App.Use(Jhonson);

  THorse.Use(HorseBasicAuthentication(
    function(const AUsername, APassword: string): Boolean
    begin
      // Here inside you can access your database and validate if username and password are valid
      Result := AUsername.Equals('user') and APassword.Equals('password');
    end));

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

  App.Delete('/users/:id',
    procedure (Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var id: Integer;
    begin
      id  := Req.Params.Items['id'].ToInteger;
      Users.Remove(id).Free;// id utilizado como índice

      Res
        .Status(THTTPStatus.NoContent)
        .Send<TJSONAncestor>(Users.Clone);
    end);

  App.Get('/ping',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      I: Integer;
      LPong: TJSONArray;
    begin
      LPong := TJSONArray.Create;
      for I := 0 to 1000 do
        LPong.Add(TJSONObject.Create(TJSONPair.Create('ping', 'pong')));
      Res.Send(LPong);
    end);

  App.Get('/exception',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      LConteudo: TJSONObject;
    begin
      try
        raise Exception.Create('Erro de teste');

        LConteudo := TJSONObject.Create;
        LConteudo.AddPair('nome', 'iago');
        Res.Send(LConteudo)
      except
        on e: Exception do begin
          Res
            .Status(500)
            .Send(TJSONObject.Create(
              TJSONPair.Create('error', e.Message)
            ));
        end;
      end;

    end);

  App.Start;
end.

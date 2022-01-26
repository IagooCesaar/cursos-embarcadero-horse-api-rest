program paginate;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Horse,
  Horse.Paginate,
  Horse.Jhonson,
  System.JSON,
  DataSet.Serialize,
  Services.Bairro in 'src\services\Services.Bairro.pas'{ServiceBairro: TDataModule};

var
  App : THorse;

begin
  App := THorse.Create(9000);
  //App.Use(Paginate); err: [dcc32 Error] paginate.dpr(21): E2029 '.' expected but ')' found
  App.Use(Jhonson);

  App.Get('/bairros',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      LService: TServiceBairro;
    begin
      LService := TServiceBairro.Create(nil);
      try
        Res.Send(LService.Listar.ToJSONArray());
      finally
        LService.Free;
      end;
    end);

  App.Start;
end.

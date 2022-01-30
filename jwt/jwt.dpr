program jwt;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Horse,
  JOSE.Core.Jwt,
  JOSE.Core.Builder,
  Horse.Jwt;

const
  chave_jwt = 'my_very_long_and_safe_secret_key';

begin
  THorse.Post('/login',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      LToken: TJWT;
      LCompactToken: string;
    begin
      LToken := TJWT.Create;
      try
        // Token claims
        LToken.Claims.Issuer := 'Empresa';
        LToken.Claims.Subject := 'IagooCesaar';
        LToken.Claims.Expiration := Now + 1;

        // Outros claims
        LToken.Claims.SetClaimOfType<string>('nome', 'Iago César');
        LToken.Claims.SetClaimOfType<Boolean>('admin', true);

        // Signing and Compact format creation
        LCompactToken := TJOSE.SHA256CompactToken(
          chave_jwt,
          LToken
        );

        Res.Send(' { "token": "'+LCompactToken+'" }')
          .Status(THTTPStatus.Created);
      finally
        LToken.Free;
      end;
    end);

  THorse.Get('/private', HorseJWT(chave_jwt),
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      Res.Send('{ "message": "ok" }');
    end);

  THorse.Listen(9000);
end.

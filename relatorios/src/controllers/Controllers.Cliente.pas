unit Controllers.Cliente;

interface

uses
  System.SysUtils,
  System.Classes,
  Horse,
  Horse.OctetStream,
  Reports.Cliente;

procedure Registry;

implementation


procedure DoReportCliente(Req: THorseRequest; Resp: THorseResponse; Next: TProc);
var LReport: TReportCliente;
begin
  LReport := TReportCliente.Create(nil);
  try
    Resp
      .ContentType('application/pdf')
      .Send<TFileReturn>(LReport.GetReport);
  finally
    FreeAndNil(LReport);
  end;
end;

procedure Registry;
begin
    THorse.Get('/clientes', DoReportCliente);

end;

end.

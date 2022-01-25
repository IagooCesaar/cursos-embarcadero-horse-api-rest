program arquivos;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Horse.OctetStream, // It's necessary to use the unit
  System.Classes,
  System.SysUtils;
var
  App : THorse;
begin
  App := THorse.Create(9000);
  App.Use(OctetStream);

  App.Get('/arquivos',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      LStream: TFileStream;
    begin
      LStream := TFileStream.Create(
        ExtractFilePath(ParamStr(0)) + '../../' + 'pegasus.jpg',
        fmOpenRead);
      Res.Send<TStream>(LStream);
      //Caberá ao App que consome a API definir o tipo de arquivo recebido
    end);

  App.Post('/arquivos',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      LStream: TMemoryStream;
    begin
      LStream := Req.Body<TMemoryStream>;
      LStream.SaveToFile(
        ExtractFilePath(ParamStr(0)) + '../../' + 'pegasus-2.jpg'
      );
      Res.Send('Imagem recebida com sucesso'!).Status(201);
    end);

  App.Start;
end.

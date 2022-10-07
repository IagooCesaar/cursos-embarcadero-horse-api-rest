unit Reports.Base;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, RLFilters,
  RLPDFFilter, Horse.OctetStream;

type
  TReportBase = class(TFrame)
    Report: TRLReport;
    BandHeader: TRLBand;
    DrawBackground: TRLDraw;
    lblIntensive: TRLLabel;
    lblDelphi: TRLLabel;
    BandFooter: TRLBand;
    lblData: TRLSystemInfo;
    lblHora: TRLSystemInfo;
    RLPDFFilter: TRLPDFFilter;
  private
    FReportName: string;
    FReportDirectory: String;
    procedure SaveReportToFile;
    function GetReportFilePath: String;
    function GetReportStream: TMemoryStream;
    function GetTempDirectory: String;
  protected
    function GetReportName: String; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    function GetReport: TFileReturn;
    destructor Destroy; override;
  end;

implementation

{$R *.dfm}

{ TReportBase }

constructor TReportBase.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FReportName       := Format('%s%s.pdf',
    [GetReportName, FormatDateTime('yyyymmddhhmmss', Now)]);
  FReportDirectory  := GetTempDirectory;
end;

destructor TReportBase.Destroy;
begin
  if FileExists(GetReportFilePath) then
    DeleteFile(GetReportFilePath);

  inherited;
end;

function TReportBase.GetReport: TFileReturn;
begin
  SaveReportToFile;
  Result := TFileReturn.Create(GetReportName + '.pdf', GetReportStream);
end;

function TReportBase.GetReportFilePath: String;
begin
  Result := FReportDirectory + FReportName;
end;

function TReportBase.GetReportName: String;
begin
  Result := 'report';
end;

function TReportBase.GetReportStream: TMemoryStream;
begin
  Result := TMemoryStream.Create;
  Result.LoadFromFile(GetReportFilePath);
end;

function TReportBase.GetTempDirectory: String;
var LTempFolder: array[0..MAX_PATH] of Char;
begin
  GetTempPath(MAX_PATH, @LTempFolder);
  Result := StrPas(LTempFolder);
  if not Result.EndsWith('\') then
    Result := Result + '\';
end;

procedure TReportBase.SaveReportToFile;
begin
  // Não exibir modal
  RLPDFFilter.ShowProgress  := False;
  Report.PrintDialog        := False;
  Report.ShowProgress       := False;

  Report.Prepare;
  Report.SaveToFile(GetReportFilePath);
end;

end.

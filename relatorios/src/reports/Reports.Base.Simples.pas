unit Reports.Base.Simples;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Reports.Base, RLFilters, RLPDFFilter,
  RLReport, Data.DB, Service.Base.Simples;

type
  TReportBaseSimples = class(TReportBase)
    BandeCabecalho: TRLBand;
    BandDetail: TRLBand;
    dsReport: TDataSource;
    procedure ReportBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    FService: TServiceBaseSimples;
  protected
    function GetReportName: String; override;
    procedure CriarService; virtual; abstract;
    property Service: TServiceBaseSimples read FService write FService;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;


  end;


implementation

{$R *.dfm}

{ TReportBaseSimples }

constructor TReportBaseSimples.Create(AOwner: TComponent);
begin
  inherited;
  CriarService;
  dsReport.DataSet := FService.qRecord;
end;

destructor TReportBaseSimples.Destroy;
begin
  FService.DisposeOf;
  inherited;
end;

procedure TReportBaseSimples.ReportBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  FService.qRecord.Close;
  FService.qRecord.Open;
end;

end.

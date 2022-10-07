unit Reports.Base;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, RLFilters,
  RLPDFFilter;

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
  end;

implementation

{$R *.dfm}

end.

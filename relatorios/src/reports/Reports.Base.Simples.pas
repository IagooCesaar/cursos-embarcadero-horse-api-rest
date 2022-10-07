unit Reports.Base.Simples;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Reports.Base, RLFilters, RLPDFFilter,
  RLReport, Data.DB;

type
  TReportBaseSimples = class(TReportBase)
    BandeCabecalho: TRLBand;
    BandDetail: TRLBand;
    dsReport: TDataSource;
  end;


implementation

{$R *.dfm}

end.

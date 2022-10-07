unit Reports.Cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Reports.Base.Simples, Data.DB,
  RLFilters, RLPDFFilter, RLReport;

type
  TReportCliente = class(TReportBaseSimples)
    lblCodigo: TRLLabel;
    lblNome: TRLLabel;
    lblSobrenome: TRLLabel;
    lblEmail: TRLLabel;
    lblTelefone: TRLLabel;
    txtCodigo: TRLDBText;
    txtNome: TRLDBText;
    txtSobrenome: TRLDBText;
    txtEmail: TRLDBText;
    txtTelefone: TRLDBText;
  protected
    function GetReportName: String; override;
    procedure CriarService; override;
  end;


implementation

uses
  Service.Cliente;

{$R *.dfm}

{ TReportCliente }

procedure TReportCliente.CriarService;
begin
  inherited;
  Service := TServiceCliente.Create(Self);
end;

function TReportCliente.GetReportName: String;
begin
  Result := 'clientes';
end;

end.

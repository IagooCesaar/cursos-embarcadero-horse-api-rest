unit Providers.Connection;

interface

uses System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Phys.PGDef, FireDAC.Phys.PG, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat;

type
  TProviderConnection = class(TDataModule)
    FDConnection: TFDConnection;
  public
    constructor Create; reintroduce;
  end;

implementation

{$R *.dfm}

constructor TProviderConnection.Create;
begin
  inherited Create(nil);
end;

end.

unit UDataModuleTransiente;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient;

type
  TFDataModuleTransiente = class(TDataModule)
    CdsMeioPagamento: TClientDataSet;
    CdsFormaPagamento: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDataModuleTransiente: TFDataModuleTransiente;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

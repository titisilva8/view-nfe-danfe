unit UDataModuleItensDetalhados;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient;

type
  TDataModuleItensDetalhados = class(TDataModule)
    CdsDetalheItemFiltro: TClientDataSet;
    CdsDetalheItemFiltroSELECAO: TStringField;
    CdsDetalheItemFiltroCHAVE_ACESSO: TStringField;
    CdsDetalheItemFiltroNUMERO_NF: TStringField;
    CdsDetalheItemFiltroCODIGO: TStringField;
    CdsDetalheItemFiltroNOME: TStringField;
    CdsDetalheItemFiltroNCM: TStringField;
    CdsDetalheItemFiltroCFOP: TStringField;
    CdsDetalheItemFiltroCEST: TStringField;
    CdsDetalheItemFiltroVALOR_TOTAL: TFloatField;
    CdsDetalheItemFiltroORIGEM: TStringField;
    CdsDetalheItemFiltroCST_ICMS: TStringField;
    CdsDetalheItemFiltroCSOSN: TStringField;
    CdsDetalheItemFiltroCST_ICMS_CONCATENADA: TStringField;
    CdsDetalheItemFiltroBASE_CALCULO_ICMS: TFloatField;
    CdsDetalheItemFiltroALIQUOTA_ICMS: TFloatField;
    CdsDetalheItemFiltroVALOR_ICMS: TFloatField;
    CdsDetalheItemFiltroVALOR_BASE_CALCULO_ICMS_ST: TFloatField;
    CdsDetalheItemFiltroALIQUOTA_ICMS_ST: TFloatField;
    CdsDetalheItemFiltroVALOR_ICMS_ST: TFloatField;
    CdsDetalheItemFiltroALIQUOTA_CREDITO_ICMS_SN: TFloatField;
    CdsDetalheItemFiltroVALOR_CREDITO_ICMS_SN: TFloatField;
    CdsDetalheItemFiltroCST_PIS: TStringField;
    CdsDetalheItemFiltroBASE_CALCULO_PIS: TFloatField;
    CdsDetalheItemFiltroALIQUOTA_PIS_PERCENTUAL: TFloatField;
    CdsDetalheItemFiltroVALOR_PIS: TFloatField;
    CdsDetalheItemFiltroCST_COFINS: TStringField;
    CdsDetalheItemFiltroBASE_CALCULO_COFINS: TFloatField;
    CdsDetalheItemFiltroALIQUOTA_COFINS_PERCENTUAL: TFloatField;
    CdsDetalheItemFiltroVALOR_COFINS: TFloatField;
    CdsDetalheItemFiltroCST_IPI: TStringField;
    CdsDetalheItemFiltroVALOR_BASE_CALCULO_IPI: TFloatField;
    CdsDetalheItemFiltroALIQUOTA_IPI: TFloatField;
    CdsDetalheItemFiltroVALOR_IPI: TFloatField;
    CdsDetalheItemFiltroCNPJ_EMITENTE: TStringField;
    CdsDetalheItemFiltroEMITENTE: TStringField;
    CdsDetalheItemFiltroCNPJ_DESTINATARIO: TStringField;
    CdsDetalheItemFiltroDESTINATARIO: TStringField;
    CdsDetalheItemFiltroDATA_EMISSAO: TDateField;
    CdsDetalheItemFiltroDATA_SAIDA: TDateField;
    CdsDetalheItemFiltroVALOR_UNITARIO_COMERCIAL: TFloatField;
    CdsDetalheItemFiltroQUANTIDADE_COMERCIAL: TFloatField;
    CdsDetalheItemFiltroUNIDADE_COMERCIAL: TStringField;
    CdsDetalheItemFiltroTIPO_OPERACAO: TStringField;
    CdsDetalheItemFiltroCONSUMIDOR_FINAL: TStringField;
    CdsDetalheItemFiltroFORMA_EMISSAO: TStringField;
    CdsDetalheItemFiltroNATUREZA_OPERACAO: TStringField;
    CdsDetalheItemFiltroVALOR_TOTAL_NOTA_FISCAL: TFloatField;
    CdsDetalheItemFiltroCHAVE_ACESSO_EXPORTA_EXCEL: TStringField;
    DSDetalheItemFiltro: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleItensDetalhados: TDataModuleItensDetalhados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

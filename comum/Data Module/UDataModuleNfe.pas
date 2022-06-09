unit UDataModuleNFe;

interface

uses
  SysUtils, Classes, DB, DBClient, WideStrings, DBXMySql, FMTBcd, Provider,
  SqlExpr,Biblioteca,VO,  DBCtrls;

type
  TFDataModuleNFe = class(TDataModule)
    CDSNfReferenciada: TClientDataSet;
    DSNfReferenciada: TDataSource;
    CDSCteReferenciado: TClientDataSet;
    DSCteReferenciado: TDataSource;
    CDSNfRuralReferenciada: TClientDataSet;
    DSNfRuralReferenciada: TDataSource;
    CDSCupomReferenciado: TClientDataSet;
    DSCupomReferenciado: TDataSource;
    CDSNfeReferenciada: TClientDataSet;
    DSNfeReferenciada: TDataSource;
    CDSNfeDetalhe: TClientDataSet;
    DSNfeDetalhe: TDataSource;
    CDSNfeDetalheImpostoCofins: TClientDataSet;
    DSNfeDetalheImpostoCofins: TDataSource;
    CDSNfeImpostoIcms: TClientDataSet;
    DSNfeImpostoIcms: TDataSource;
    CDSNfeImpostoImportacao: TClientDataSet;
    DSNfeImpostoImportacao: TDataSource;
    CDSNfeDetalheImpostoIpi: TClientDataSet;
    DSNfeDetalheImpostoIpi: TDataSource;
    CDSNfeDetalheImpostoPis: TClientDataSet;
    DSNfeDetalheImpostoPis: TDataSource;
    CDSNfeDeclaracaoImportacao: TClientDataSet;
    DSNfeDeclaracaoImportacao: TDataSource;
    CDSNfeImportacaoDetalhe: TClientDataSet;
    DSNfeImportacaoDetalhe: TDataSource;
    CDSNfeTransporteVolumeLacre: TClientDataSet;
    DSNfeTransporteVolumeLacre: TDataSource;
    CDSNfeDetalheImpostoFcpDifal: TClientDataSet;
    DSNfeDetalheImpostoFcpDifal: TDataSource;
    CDSNfeTransporteReboque: TClientDataSet;
    DSNfeTransporteReboque: TDataSource;
    CDSNfeExportacao: TClientDataSet;
    DSNfeExportacao: TDataSource;
    CDSNfeDetalheRastreabilidade: TClientDataSet;
    DSNfeDetalheRastreabilidade: TDataSource;
    CdsNfeFormaPagamento: TClientDataSet;
    DSFormaPagamento: TDataSource;
    CDSNfeAutorizacaoDownload: TClientDataSet;
    DSNfeAutorizacaoDownload: TDataSource;
    CdsNfeDestinatario: TClientDataSet;
    DsNfeDestinatario: TDataSource;
    CDSNfeCabecalho: TClientDataSet;
    DSNfeCabecalho: TDataSource;
    CDSNfeEmitente: TClientDataSet;
    DSNfeEmitente: TDataSource;
    CDSNfeLocalEntrega: TClientDataSet;
    DSLocalEntrega: TDataSource;
    CDSNfeLocalRetirada: TClientDataSet;
    DSLocalRetirada: TDataSource;
    CdsNfeTransporte: TClientDataSet;
    DSNfeTransporte: TDataSource;
    CDSNfeTransporteVolume: TClientDataSet;
    DSNfeTransporteVolume: TDataSource;
    CDSNfeFatura: TClientDataSet;
    DSNfeFatura: TDataSource;
    CDSNfeDuplicata: TClientDataSet;
    DSNfeDuplicata: TDataSource;
    CDSNfeDetalheImpostoIssqn: TClientDataSet;
    DSNfeDetalheImpostoIssqn: TDataSource;
    CdsNfeDetalheCombustivel: TClientDataSet;
    CdsNfeDetalheVeiculo: TClientDataSet;
    CdsNfeDetalheMedicamento: TClientDataSet;
    DSDetalheCombustivel: TDataSource;
    DSNfeDetalheMedicamento: TDataSource;
    DSNfeDetalheVeiculo: TDataSource;
    CdsNfeDetalheObsContribuinte: TClientDataSet;
    DSNfeDetalheObsContribuinte: TDataSource;
    CdsNfeDetalheObsFisco: TClientDataSet;
    DSNfeDetalheObsFisco: TDataSource;
    procedure DataModuleCreate(Sender: TObject);


  private
    { Private declarations }

    procedure VinculadaCDSxObjetos;
    procedure VinculadaCDSxObjetoNfeCabecalho;
    procedure VinculadaCDSxObjetoEmitente;
    procedure VinculadaCDSxObjetoDestinatario;
    procedure VinculadaCDSxObjetoNfeReferenciada;
    procedure VinculadaCDSxObjetoEntregaRetirada;
    procedure VinculadaCDSxObjetoTransporte;
    procedure VinculadaCDSxObjetoCobranca;
    procedure VinculadaCDSxObjetoInformacaoPagamento;
    procedure VinculadaCDSxObjetoAutorizacaoDownload;
  public
    procedure VinculadaCDSxObjetoProdutos;
    procedure ConfiguraCds(Cds:TClientDataSet;ChaveEstrangeira:String;DataSourceMestre:TDataSource;VO:TClassVO);
    { Public declarations }
  end;

var
  FDataModuleNFe: TFDataModuleNFe;

implementation

uses
  NfeCabecalhoVO,
  NfeEmitenteVO,
  NfeDestinatarioVO,

  NfeDetalheVO,
  NfeDetalheImpostoCofinsVO, NfeDetalheImpostoIcmsVO,
  NfeDetalheImpostoPisVO,NfeDetalheImpostoIiVO,NfeDetalheImpostoIssqnVO,
  NfeDetalheImpostoIpiVO,NfeDeclaracaoImportacaoVO,NfeImportacaoDetalheVO,
  NfeDetEspecificoVeiculoVO,NfeDetEspecificoCombustivelVO,
  NfeDetalheImpostoFcpDifalVO,NfeExportacaoVO,NfeDetalheRastreabilidadeVO,

  NfeReferenciadaVO,NfeCupomFiscalReferenciadoVO,NfeProdRuralReferenciadaVO,
  NfeCteReferenciadoVO,NfeNfReferenciadaVO,

  NfeLocalRetiradaVO,NfeLocalEntregaVO,NfeDetEspecificoMedicamentoVO,

  NfeTransporteVO,NfeTransporteReboqueVO,
  NfeTransporteVolumeVO,NfeTransporteVolumeLacreVO,


  NfeFormaPagamentoVO,NfeDuplicataVO,NfeFaturaVO,
  NfeDetalheObsContribuinteVO,NfeDetalheObsFiscoVO,

  NfeAutorizacaoDownloadVO, PreencheDadosGlobaisController;

{$R *.dfm}

{ TFDataModuleNFe }

procedure TFDataModuleNFe.ConfiguraCds(Cds:TClientDataSet;ChaveEstrangeira:String;DataSourceMestre:TDataSource;VO:TClassVO);
begin
  ConfiguraCDSFromVO(CDS, VO);
  CDS.IndexFieldNames := ChaveEstrangeira;
  CDS.MasterSource := DataSourceMestre;
  CDS.MasterFields := 'ID';
end;

procedure TFDataModuleNFe.DataModuleCreate(Sender: TObject);
begin
  VinculadaCDSxObjetos;
end;

procedure TFDataModuleNFe.VinculadaCDSxObjetos;
begin
  VinculadaCDSxObjetoNfeCabecalho;
  VinculadaCDSxObjetoDestinatario;
  VinculadaCDSxObjetoEmitente;
  VinculadaCDSxObjetoProdutos;
  VinculadaCDSxObjetoNfeReferenciada;
  VinculadaCDSxObjetoEntregaRetirada;
  VinculadaCDSxObjetoTransporte;
  VinculadaCDSxObjetoCobranca;
  VinculadaCDSxObjetoInformacaoPagamento;
  VinculadaCDSxObjetoAutorizacaoDownload;
end;

procedure TFDataModuleNFe.VinculadaCDSxObjetoNfeCabecalho;
begin
  ConfiguraCDSFromVO(CDSNfeCabecalho, TNfeCabecalhoVO);
end;

procedure TFDataModuleNFe.VinculadaCDSxObjetoEmitente;
begin
  ConfiguraCds(CDSNfeEmitente,'ID_NFE_CABECALHO',DSNfeCabecalho,TNfeEmitenteVO);
end;

procedure TFDataModuleNFe.VinculadaCDSxObjetoDestinatario;
begin
  ConfiguraCds(CDSNfeDestinatario,'ID_NFE_CABECALHO',DSNfeCabecalho,TNfeDestinatarioVO);
end;

procedure TFDataModuleNFe.VinculadaCDSxObjetoProdutos;
begin
  ConfiguraCds(CDSNfeDetalhe,'ID_NFE_CABECALHO',DSNfeCabecalho,TNfeDetalheVO);
  ConfiguraCds(CDSNfeDetalheImpostoIpi,'ID_NFE_DETALHE',DSNfeDetalhe,TNfeDetalheImpostoIpiVO);
  ConfiguraCds(CDSNfeImpostoIcms,'ID_NFE_DETALHE',DSNfeDetalhe,TNfeDetalheImpostoIcmsVO);
  ConfiguraCds(CDSNfeDetalheImpostoPis,'ID_NFE_DETALHE',DSNfeDetalhe,TNfeDetalheImpostoPisVO);
  ConfiguraCds(CDSNfeDetalheImpostoCofins,'ID_NFE_DETALHE',DSNfeDetalhe,TNfeDetalheImpostoCofinsVO);
  ConfiguraCds(CDSNfeDetalheImpostoFcpDifal,'ID_NFE_DETALHE',DSNfeDetalhe,TNfeDetalheImpostoFcpDifalVO);
  ConfiguraCds(CDSNfeImpostoImportacao,'ID_NFE_DETALHE',DSNfeDetalhe,TNfeDetalheImpostoIiVO);
  ConfiguraCds(CDSNfeDeclaracaoImportacao,'ID_NFE_DETALHE',DSNfeDetalhe,TNfeDeclaracaoImportacaoVO);
  ConfiguraCds(CDSNfeImportacaoDetalhe,'ID_NFE_DECLARACAO_IMPORTACAO',DSNfeDeclaracaoImportacao,TNfeImportacaoDetalheVO);
  ConfiguraCds(CDSNfeExportacao,'ID_NFE_DETALHE',DSNfeDetalhe,TNfeExportacaoVO);
  ConfiguraCds(CDSNfeDetalheRastreabilidade,'ID_NFE_DETALHE',DSNfeDetalhe,TNfeDetalheRastreabilidadeVO);
  ConfiguraCds(CDSNfeDetalheImpostoIssqn,'ID_NFE_DETALHE',DSNfeDetalhe,TNfeDetalheImpostoIssqnVO);
  ConfiguraCds(CDSNfeDetalheObsContribuinte,'ID_NFE_DETALHE',DSNfeDetalhe,TNfeDetalheObsContribuinteVO);
  ConfiguraCds(CDSNfeDetalheObsFisco,'ID_NFE_DETALHE',DSNfeDetalhe,TNfeDetalheObsFiscoVO);

  ConfiguraCds(CdsNfeDetalheCombustivel,'ID_NFE_DETALHE',DSNfeDetalhe,TNfeDetEspecificoCombustivelVO);
  ConfiguraCds(CdsNfeDetalheMedicamento,'ID_NFE_DETALHE',DSNfeDetalhe,TNfeDetEspecificoMedicamentoVO);
  ConfiguraCds(CdsNfeDetalheVeiculo,'ID_NFE_DETALHE',DSNfeDetalhe,TNfeDetEspecificoVeiculoVO);


end;

procedure TFDataModuleNFe.VinculadaCDSxObjetoNfeReferenciada;
begin
  ConfiguraCds(CDSNfeReferenciada,'ID_NFE_CABECALHO',DSNfeCabecalho,TNfeReferenciadaVO);
  ConfiguraCds(CDSNfReferenciada,'ID_NFE_CABECALHO',DSNfeCabecalho,TNfeNfReferenciadaVO);
  ConfiguraCds(CDSCteReferenciado,'ID_NFE_CABECALHO',DSNfeCabecalho,TNfeCteReferenciadoVO);
  ConfiguraCds(CDSNfRuralReferenciada,'ID_NFE_CABECALHO',DSNfeCabecalho,TNfeProdRuralReferenciadaVO);
  ConfiguraCds(CDSCupomReferenciado,'ID_NFE_CABECALHO',DSNfeCabecalho,TNfeCupomFiscalReferenciadoVO);
end;

procedure TFDataModuleNFe.VinculadaCDSxObjetoEntregaRetirada;
begin
  ConfiguraCds(CDSNfeLocalEntrega,'ID_NFE_CABECALHO',DSNfeCabecalho,TNfeLocalEntregaVO);
  ConfiguraCds(CDSNfeLocalRetirada,'ID_NFE_CABECALHO',DSNfeCabecalho,TNfeLocalRetiradaVO);
end;

procedure TFDataModuleNFe.VinculadaCDSxObjetoTransporte;
begin
  ConfiguraCds(CDSNfeTransporte,'ID_NFE_CABECALHO',DSNfeCabecalho,TNfeTransporteVO);
  ConfiguraCds(CDSNfeTransporteReboque,'ID_NFE_TRANSPORTE',DSNfeTransporte,TNfeTransporteReboqueVO);
  ConfiguraCds(CDSNfeTransporteVolume,'ID_NFE_TRANSPORTE',DSNfeTransporte,TNfeTransporteVolumeVO);
  ConfiguraCds(CDSNfeTransporteVolumeLacre,'ID_NFE_TRANSPORTE_VOLUME',DSNfeTransporteVolume,TNfeTransporteVolumeLacreVO);
end;

procedure TFDataModuleNFe.VinculadaCDSxObjetoCobranca;
begin
  ConfiguraCds(CDSNfeDuplicata,'ID_NFE_CABECALHO',DSNfeCabecalho,TNfeDuplicataVO);
  ConfiguraCds(CDSNfeFatura,'ID_NFE_CABECALHO',DSNfeCabecalho,TNfeFaturaVO);
end;

procedure TFDataModuleNFe.VinculadaCDSxObjetoInformacaoPagamento;
var LookupField :TField;
teste:integer;
DBLookupComboBox1: TDBLookupComboBox;
Campo:TFieldDef;

begin
  TPreencheDadosGlobaisController.PreencheCdsInformacaoPagamento;
  ConfiguraCds(CDSNfeFormaPagamento,'ID_NFE_CABECALHO',DSNfeCabecalho,TNfeFormaPagamentoVO);

  {CDSNfeFormaPagamento.Active:=false;
  CdsFormaRecebimento.Active:=false;

  LookupField:=TStringField.Create(self);
  LookupField.Name:='CDSNfeFormaPagamentoMEIO_RECEBIMENTO_DESCRICAO';
  LookupField.FieldName:='MEIO_RECEBIMENTO_DESCRICAO';
  LookupField.FieldKind:=fkLookup;
  LookupField.KeyFields:='MEIO_RECEBIMENTO';
  LookupField.LookupDataSet:= CdsFormaRecebimento;
  LookupField.LookupKeyFields:='CODIGO';
  LookupField.LookupResultField:='DESCRICAO';
  LookupField.DataSet:=CDSNfeFormaPagamento;

  CDSNfeFormaPagamento.Active:=true;
  CdsFormaRecebimento.Active:=true;}


end;

procedure TFDataModuleNFe.VinculadaCDSxObjetoAutorizacaoDownload;
begin
  ConfiguraCds(CDSNfeAutorizacaoDownload,'ID_NFE_CABECALHO',DSNfeCabecalho,TNfeAutorizacaoDownloadVO);
end;

end.

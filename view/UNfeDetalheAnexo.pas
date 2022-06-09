unit UNfeDetalheAnexo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, LabeledCtrls, ExtCtrls, Mask, JvExMask, JvToolEdit,
  JvBaseEdits, ToolWin, ActnMan, ActnCtrls, Grids, DBGrids, JvExDBGrids,
  JvDBGrid, JvDBUltimGrid, ComCtrls, DBCtrls, LabeledDBCtrls, JvExStdCtrls,
  JvCombobox, JvDBCombobox, JvDBSearchComboBox,Biblioteca,db,DBClient,
  JvDBControls, System.Actions, Vcl.ActnList,Vcl.PlatformDefaultStyleActnCtrls,System.StrUtils,
  UDataModuleNFe
  {NfeDetalheController,NfeDetalheRastreabilidadeController,
  NfeDeclaracaoImportacaoController,NfeCabecalhoController,ULookup};

type
  TFNfeDetalheAnexo = class(TForm)
    PageControlDadosTributacao: TPageControl;
    TsIcms: TTabSheet;
    PanelIcms: TPanel;
    tsPis: TTabSheet;
    PanelDetalhePis: TPanel;
    tsCofins: TTabSheet;
    PanelDetalheCofins: TPanel;
    tsIpi: TTabSheet;
    PanelDetalheIpi: TPanel;
    tsImpostoImportacao: TTabSheet;
    tsIssqn: TTabSheet;
    PanelDetalheIssqn: TPanel;
    PanelDetalheImpostoImportacao: TPanel;
    DBEditQuantidadeUnidadeTributavelIpi: TLabeledDBEdit;
    DBEditValorBcIpi: TLabeledDBEdit;
    DBEditAliquotaIpi: TLabeledDBEdit;
    DBEditValorIpi: TLabeledDBEdit;
    DBEditValorUnidadeTributavelIpi: TLabeledDBEdit;
    DBEditEnquadramentoLegalIpi: TLabeledDBEdit;
    DBEditCnpjProdutor: TLabeledDBEdit;
    DBEditQuantidadeSeloIpi: TLabeledDBEdit;
    DBEditCodigoSeloIpi: TLabeledDBEdit;
    DBEditValorBcIi: TLabeledDBEdit;
    DBEditValorDespesasAduaneirasIi: TLabeledDBEdit;
    DBEditValorIofIi: TLabeledDBEdit;
    DBEditValorIi: TLabeledDBEdit;
    DBEditValorBcIssqn: TLabeledDBEdit;
    DBEditAliquotaIssqn: TLabeledDBEdit;
    DBEditValorIssqn: TLabeledDBEdit;
    DBEditMunicipioIssqn: TLabeledDBEdit;
    tsDeclaracaoImportacao: TTabSheet;
    PanelDeclaracaoImportacao: TPanel;
    ComboBoxCstIcmsA: TJvDBComboBox;
    ComboBoxCstIcmsB: TJvDBComboBox;
    Label1: TLabel;
    Label11: TLabel;
    ComboBoxCsosnB: TJvDBComboBox;
    ComboBoxCstPis: TJvDBComboBox;
    Label13: TLabel;
    ComboBoxCstCofins: TJvDBComboBox;
    Label14: TLabel;
    ComboBoxCstIpi: TJvDBComboBox;
    Label15: TLabel;
    PageControlPis: TPageControl;
    TBPIS: TTabSheet;
    TBPISST: TTabSheet;
    DBEditValorBcPis: TLabeledDBEdit;
    DBEditAliquotaPisPercentual: TLabeledDBEdit;
    DBEditQuantidadeVendidaPis: TLabeledDBEdit;
    DBEditAliquotaPisReais: TLabeledDBEdit;
    DBEditValorPis: TLabeledDBEdit;
    DBEditValorBCPisST: TLabeledDBEdit;
    DBEditAliquotaPisPercentualST: TLabeledDBEdit;
    DBEditQuantidadeVendidaPisST: TLabeledDBEdit;
    DBEditAliquotaPisReaisST: TLabeledDBEdit;
    DBEditValorPisST: TLabeledDBEdit;
    PageControlCofins: TPageControl;
    TBCOFINS: TTabSheet;
    TBCOFINSST: TTabSheet;
    DBEditValorBcCofins: TLabeledDBEdit;
    DBEditAliquotaCofinsPercentual: TLabeledDBEdit;
    DBEditQuantidadeVendidaCofins: TLabeledDBEdit;
    DBEditAliquotaCofinsReais: TLabeledDBEdit;
    DBEditValorCofins: TLabeledDBEdit;
    DBEditValorBcCofinsSt: TLabeledDBEdit;
    DBEditAliquotaCofinsPercentualSt: TLabeledDBEdit;
    DBEditQuantidadeVendidaCofinsSt: TLabeledDBEdit;
    DBEditAliquotaCofinsReaisST: TLabeledDBEdit;
    DBEditValorCofinsST: TLabeledDBEdit;
    PageControlIcms: TPageControl;
    tsIcmsNormal: TTabSheet;
    Label21: TLabel;
    ComboBoxModalidadeBcIcms: TJvDBComboBox;
    DBEditTaxaReducaoBcIcms: TLabeledDBEdit;
    DBEditBcIcms: TLabeledDBEdit;
    DBEditAliquotaIcms: TLabeledDBEdit;
    DBEditValorIcms: TLabeledDBEdit;
    TsIcmsSt: TTabSheet;
    ComboBoxModalidadeBcIcmsST: TJvDBComboBox;
    Label22: TLabel;
    DBEditPercentualMvaIcmsSt: TLabeledDBEdit;
    DBEditTaxaReducaoBcIcmsSt: TLabeledDBEdit;
    DBEditValorBcIcmsSt: TLabeledDBEdit;
    DBEditAliquotaIcmsSt: TLabeledDBEdit;
    DBEditValorIcmsSt: TLabeledDBEdit;
    DBEditValorBcIcmsStRetido: TLabeledDBEdit;
    DBEditValorIcmsStRetido: TLabeledDBEdit;
    DBEditValorCreditoIcmsSn: TLabeledDBEdit;
    DBEditAliquotaCreditoIcmsSn: TLabeledDBEdit;
    DBEditValorBcIcmsStDestino: TLabeledDBEdit;
    DBEditValorIcmsStDestino: TLabeledDBEdit;
    DBEditPercentualBcOperacaoPropria: TLabeledDBEdit;
    ComboBoxMotivoDesoneracaoIcms: TJvDBComboBox;
    DBEditIcmsDesonerado: TLabeledDBEdit;
    DBEditIcmsDiferido: TLabeledDBEdit;
    DBEditIcmsOperacao: TLabeledDBEdit;
    Label2: TLabel;
    ComboBoxUfST: TJvDBComboBox;
    Label3: TLabel;
    TSFcpDifal: TTabSheet;
    EditAliquotaIcmsInternaUfDestino: TLabeledDBEdit;
    EditValorIcmsUfDestino: TLabeledDBEdit;
    EditValorIcmsFcp: TLabeledDBEdit;
    EditAliquotaFcpUfDestino: TLabeledDBEdit;
    EditValorBcUfDestino: TLabeledDBEdit;
    ComboboxPercenturalPartilhaIcms: TJvDBComboBox;
    ComboboxAliquotaInterEstadual: TJvDBComboBox;
    EditValorIcmsUfRemetente: TLabeledDBEdit;
    Label4: TLabel;
    Label23: TLabel;
    TsExportação: TTabSheet;
    GridExportacao: TJvDBUltimGrid;
    TsRastreabilidadeProduto: TTabSheet;
    EditBaseCalculoFCP: TLabeledDBEdit;
    EditAliquotaFcp: TLabeledDBEdit;
    EditValorFcp: TLabeledDBEdit;
    EditBaseCalculoFCPST: TLabeledDBEdit;
    EditAliquotaFcpST: TLabeledDBEdit;
    EditValorFcpST: TLabeledDBEdit;
    EditBaseCalculoIcmsFcpStRetidoAnteriormente: TLabeledDBEdit;
    EditAliquotaIcmsFcpStRetidoAnteriormente: TLabeledDBEdit;
    EditValorIcmsFcpStRetidoAnteriormente: TLabeledDBEdit;
    EditAliquotaStSuportadaConsumidorFinal: TLabeledDBEdit;
    EditBaseCalculoFcpUfDestinatario: TLabeledDBEdit;
    PageControlImportacao: TPageControl;
    TsDeclaracaoImportacao2: TTabSheet;
    TsAdicoes: TTabSheet;
    GridNfeDeclaracaoImportacao: TJvDBUltimGrid;
    GridDeclaracaoImportacaoDetalhe: TJvDBUltimGrid;
    DBEditValorIcmsSubstituto: TLabeledDBEdit;
    ActionManager1: TActionManager;
    ActionIncluirExportacaoIndireta: TAction;
    ActionExcluirExportacaoIndireta: TAction;
    ActionIncluirDeclaracaoImportacao: TAction;
    ActionExcluirDeclaracaoImportacao: TAction;
    ActionExcluirImportacaoDetalhe: TAction;
    ActionIncluirImportacaoDetalhe: TAction;
    ActionIncluirRastreabilidade: TAction;
    ActionExcluirRastreabilidade: TAction;
    GridNfeDetalheRastreabilidade: TJvDBUltimGrid;
    EditEnquadramentoIpi: TLabeledDBEdit;
    JvDBComboBox1: TJvDBComboBox;
    Label5: TLabel;
    EditValorDeducao: TLabeledDBEdit;
    EditValorOutrasRetencoes: TLabeledDBEdit;
    TsVeiculo: TTabSheet;
    TsMedicamento: TTabSheet;
    TsArmamentos: TTabSheet;
    TsCombustivel: TTabSheet;
    Panel1: TPanel;
    TsPapelImune: TTabSheet;
    Panel2: TPanel;
    TsCana: TTabSheet;
    Panel3: TPanel;
    EditCombustivelCodigoAnp: TLabeledDBEdit;
    EditCombustivelPercentualGasNatural: TLabeledDBEdit;
    EditCombustivelCODIF: TLabeledDBEdit;
    EditCombustivelQuantidadeAmbiente: TLabeledDBEdit;
    EditCombustivelUFConsumo: TLabeledDBEdit;
    EditCombustivelBaseCalculoCIDE: TLabeledDBEdit;
    EditCombustivelAliquotaCIDE: TLabeledDBEdit;
    EditCombustivelValorCide: TLabeledDBEdit;
    ComboBoxVeiculoTipoOperacao: TJvDBComboBox;
    Label6: TLabel;
    EditVeiculoChassi: TLabeledDBEdit;
    EditVeiculoCor: TLabeledDBEdit;
    EditVeiculoDescricaoCor: TLabeledDBEdit;
    EditVeiculoPotenciaMotor: TLabeledDBEdit;
    EditVeiculoCilindradas: TLabeledDBEdit;
    EditVeiculoPesoLiquido: TLabeledDBEdit;
    EditVeiculoPesoBruto: TLabeledDBEdit;
    EditVeiculoNumeroSerie: TLabeledDBEdit;
    EditVeiculoNumeroMotor: TLabeledDBEdit;
    EditVeiculoCapacidadeMaximaTracao: TLabeledDBEdit;
    EditVeiculoDistanciaEixos: TLabeledDBEdit;
    EditVeiculoAnoModelo: TLabeledDBEdit;
    ComboVeiculoTipoCombustivel: TJvDBComboBox;
    Label7: TLabel;
    EditVeiculoAnoFabricacao: TLabeledDBEdit;
    EditVeiculoTipoPintura: TLabeledDBEdit;
    ComboVeiculoTipoVeiculo: TJvDBComboBox;
    Label8: TLabel;
    ComboVeiculoEspecieVeiculo: TJvDBComboBox;
    Label9: TLabel;
    ComboVeiculoCondicaoVIN: TJvDBComboBox;
    ComboVeiculoCondicaoVeiculo: TJvDBComboBox;
    Label10: TLabel;
    EditVeiculoCodigoMarcaModelo: TLabeledDBEdit;
    ComboVeiculoCodigoCor: TJvDBComboBox;
    Label12: TLabel;
    EditVeiculoLotacao: TLabeledDBEdit;
    ComboVeiculoRestricao: TJvDBComboBox;
    Label16: TLabel;
    EditMedicamentoNumeroLote: TLabeledDBEdit;
    EditMedicamentoQuantidadeLote: TLabeledDBEdit;
    EditMedicamentoDataFabricacao: TLabeledDBDateEdit;
    EditMedicamentoDataValidade: TLabeledDBDateEdit;
    EditMedicamentoPrecoMaximoConsumidor: TLabeledDBEdit;
    TSInfAdicionaisContribuinte: TTabSheet;
    TSInfAdicionaisFisco: TTabSheet;
    EditObsFiscoCampo: TLabeledDBEdit;
    EditObsFiscoTexto: TLabeledDBEdit;
    LabeledDBEdit1: TLabeledDBEdit;
    LabeledDBEdit2: TLabeledDBEdit;
    procedure FormCreate(Sender: TObject);
   
  private


  { Private declarations }
  public
  CDSTransienteDetalheAnexo, CDSConsultaGenerica: TClientDataSet;




  end;
  { Public declarations }


var
  FNfeDetalheAnexo: TFNfeDetalheAnexo;



implementation

{UDataModule,ViaTransporteInterNacionalVO,ViaTransporteInternacionalController,UNFe,
FormaIntermediacaoVO,FormaIntermediacaoController, UMenu,UNfeExportacao,UNfeImportacaoSaida,UNfeImportacaoDetalheSaida,
NfeImportacaoDetalheVO,NfeImportacaoDetalheController,UNfeRastreabilidadeSaida}

{$R *.dfm}


procedure TFNfeDetalheAnexo.FormCreate(Sender: TObject);
begin
  FDataModuleNfe.VinculadaCDSxObjetoProdutos;//
end;

end.

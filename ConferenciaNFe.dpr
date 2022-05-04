program ConferenciaNFe;

uses
  Vcl.Forms,
  DynamicButtons in 'PDFium\DynamicButtons.pas',
  Execute.libPDFium in 'PDFium\Execute.libPDFium.pas',
  PDFium.Frame in 'PDFium\PDFium.Frame.pas' {PDFiumFrame: TFrame},
  PDFium.PrintDlg in 'PDFium\PDFium.PrintDlg.pas' {PrintDlg},
  PDFium.SearchDlg in 'PDFium\PDFium.SearchDlg.pas' {SearchDlg},
  Atributos in 'infra\Atributos.pas',
  Biblioteca in 'infra\Biblioteca.pas',
  Constantes in 'infra\Constantes.pas',
  VO in 'infra\VO.pas',
  NfeAutorizacaoDownloadVO in 'model\NfeAutorizacaoDownloadVO.pas',
  NfeCteReferenciadoVO in 'model\NfeCteReferenciadoVO.pas',
  NfeCupomFiscalReferenciadoVO in 'model\NfeCupomFiscalReferenciadoVO.pas',
  NfeDeclaracaoImportacaoVO in 'model\NfeDeclaracaoImportacaoVO.pas',
  NfeDestinatarioVO in 'model\NfeDestinatarioVO.pas',
  NfeDetalheImpostoCofinsVO in 'model\NfeDetalheImpostoCofinsVO.pas',
  NfeDetalheImpostoFcpDifalVO in 'model\NfeDetalheImpostoFcpDifalVO.pas',
  NfeDetalheImpostoIcmsVO in 'model\NfeDetalheImpostoIcmsVO.pas',
  NfeDetalheImpostoIiVO in 'model\NfeDetalheImpostoIiVO.pas',
  NfeDetalheImpostoIpiVO in 'model\NfeDetalheImpostoIpiVO.pas',
  NfeDetalheImpostoIssqnVO in 'model\NfeDetalheImpostoIssqnVO.pas',
  NfeDetalheImpostoPisVO in 'model\NfeDetalheImpostoPisVO.pas',
  NfeDetalheRastreabilidadeVO in 'model\NfeDetalheRastreabilidadeVO.pas',
  NfeDetalheVO in 'model\NfeDetalheVO.pas',
  NfeDetEspecificoArmamentoVO in 'model\NfeDetEspecificoArmamentoVO.pas',
  NfeDetEspecificoCombustivelVO in 'model\NfeDetEspecificoCombustivelVO.pas',
  NfeDetEspecificoMedicamentoVO in 'model\NfeDetEspecificoMedicamentoVO.pas',
  NfeDetEspecificoVeiculoVO in 'model\NfeDetEspecificoVeiculoVO.pas',
  NfeDuplicataVO in 'model\NfeDuplicataVO.pas',
  NfeExportacaoVO in 'model\NfeExportacaoVO.pas',
  NfeFormaPagamentoVO in 'model\NfeFormaPagamentoVO.pas',
  NfeImportacaoDetalheVO in 'model\NfeImportacaoDetalheVO.pas',
  NfeNfReferenciadaVO in 'model\NfeNfReferenciadaVO.pas',
  NfeProdRuralReferenciadaVO in 'model\NfeProdRuralReferenciadaVO.pas',
  NfeReferenciadaVO in 'model\NfeReferenciadaVO.pas',
  NfeTransporteReboqueVO in 'model\NfeTransporteReboqueVO.pas',
  NfeTransporteVolumeLacreVO in 'model\NfeTransporteVolumeLacreVO.pas',
  NfeTransporteVolumeVO in 'model\NfeTransporteVolumeVO.pas',
  UDataModuleNfe in 'comum\Data Module\UDataModuleNfe.pas' {FDataModuleNFe: TDataModule},
  ImportaXmlParaComponentesVisuaisController in 'controller\ImportaXmlParaComponentesVisuaisController.pas',
  PreencheDadosGlobaisController in 'controller\PreencheDadosGlobaisController.pas',
  XmlPdfController in 'controller\XmlPdfController.pas',
  UNfeDetalheAnexo in 'view\UNfeDetalheAnexo.pas' {FNfeDetalheAnexo},
  UConverteXml in 'view\UConverteXml.pas' {FConverteXml},
  NfeCabecalhoVO in 'model\NfeCabecalhoVO.pas',
  NfeEmitenteVO in 'model\NfeEmitenteVO.pas',
  NfeLocalEntregaVO in 'model\NfeLocalEntregaVO.pas',
  NfeLocalRetiradaVO in 'model\NfeLocalRetiradaVO.pas',
  NfeTransporteVO in 'model\NfeTransporteVO.pas',
  NfeFaturaVO in 'model\NfeFaturaVO.pas',
  UDataModuleTransiente in 'comum\Data Module\UDataModuleTransiente.pas' {FDataModuleTransiente: TDataModule},
  UNfeDetalheItem in 'view\UNfeDetalheItem.pas' {FNfeDetalheItem},
  UItensDetalhados in 'view\UItensDetalhados.pas' {FItensDetalhados},
  UDataModuleItensDetalhados in 'comum\Data Module\UDataModuleItensDetalhados.pas' {DataModuleItensDetalhados: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFDataModuleTransiente, FDataModuleTransiente);
  Application.CreateForm(TFDataModuleNFe, FDataModuleNFe);
  Application.CreateForm(TDataModuleItensDetalhados, DataModuleItensDetalhados);
  Application.CreateForm(TFConverteXml, FConverteXml);
  Application.CreateForm(TFNfeDetalheItem, FNfeDetalheItem);
  Application.CreateForm(TFItensDetalhados, FItensDetalhados);
  Application.Run;
end.

unit UConverteXml;

{
   PDF viewer using libPDFium.dll (c)2017-2018 by Execute SARL
   http://www.execute.fr
   https://github.com/tothpaul/PDFiumReader


}
interface

uses
  Winapi.Windows, Winapi.Messages, Winapi.ShellAPI,

  System.SysUtils, System.Variants, System.Classes,

  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.Clipbrd, Vcl.StdCtrls,

  PDFium.Frame, Vcl.ComCtrls,Vcl.FileCtrl, ACBrDFeReport, ACBrDFeDANFeReport,
  ACBrNFeDANFEClass, ACBrNFeDANFeRLClass, ACBrBase, ACBrDFe, ACBrNFe, Data.DB,
  Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid,
  Datasnap.DBClient, Vcl.Buttons,XmlPdfController, LabeledCtrls, Vcl.Mask,
  JvExMask, JvToolEdit, JvBaseEdits, Vcl.ToolWin, Vcl.ActnMan,
  Vcl.ActnCtrls,Biblioteca,UDataModuleNfe,NfeReferenciadaVO,
  NfeCteReferenciadoVO,NfeCupomFiscalReferenciadoVO,NfeNfReferenciadaVO,NfeProdRuralReferenciadaVO,
  JvExExtCtrls, JvNetscapeSplitter,NfeTransporteVolumeVO,NfeTransporteReboqueVO,NfeTransporteVolumeLacreVO,
  UNfeDetalheAnexo,NfeDetalheVO,NfeDetalheImpostoPisVO,NfeDetalheImpostoCofinsVO,
  NfeDetalheImpostoIpiVO,NfeDetalheImpostoIcmsVO,NfeDetalheImpostoFcpDifalVO,
  NfeExportacaoVO,NfeDetalheImpostoIiVO,NfeDeclaracaoImportacaoVO,NfeImportacaoDetalheVO,NfeDetalheRastreabilidadeVO,
  NfeDuplicataVO,NfeAutorizacaoDownloadVO, Vcl.DBCtrls,
  LabeledDBCtrls,NfeDestinatarioVO,NfeFormaPagamentoVO, JvDBControls,
  JvExStdCtrls, JvCombobox, JvDBCombobox, JvExControls,
  JvSpecialProgress, UNfeDetalheItem, uExpiraSoftware, JvDialogs, JvBaseDlg,
  JvWinDialogs, UItensDetalhados,ImportaXmlParaComponentesVisuaisController;

type
  TFConverteXml= class(TForm)
    PDFium: TPDFiumFrame;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Open1: TMenuItem;
    N1: TMenuItem;
    Quit1: TMenuItem;
    pnButtons: TPanel;
    btZPlus: TPaintBox;
    btZMinus: TPaintBox;
    btOpen: TPaintBox;
    pbZoom: TPaintBox;
    ppZoom: TPopupMenu;
    N101: TMenuItem;
    N251: TMenuItem;
    N501: TMenuItem;
    N1001: TMenuItem;
    N1002: TMenuItem;
    N1251: TMenuItem;
    N1501: TMenuItem;
    N2001: TMenuItem;
    N4001: TMenuItem;
    N8001: TMenuItem;
    N16001: TMenuItem;
    N24001: TMenuItem;
    N32001: TMenuItem;
    N64001: TMenuItem;
    N2: TMenuItem;
    mnActualSize: TMenuItem;
    mnFitWidth: TMenuItem;
    mnPageLevel: TMenuItem;
    btPageWidth: TPaintBox;
    btFullPage: TPaintBox;
    btActualSize: TPaintBox;
    btAbout: TPaintBox;
    Close1: TMenuItem;
    btNext: TPaintBox;
    btPrev: TPaintBox;
    edPage: TEdit;
    lbPages: TLabel;
    shPage: TShape;
    pnPages: TPanel;
    Edit1: TMenuItem;
    Copy1: TMenuItem;
    btPrint: TPaintBox;
    mnProperties: TMenuItem;
    Search1: TMenuItem;
    TreeView1: TTreeView;
    ACBrNFe: TACBrNFe;
    ACBrDanfe: TACBrNFeDANFeRL;
    DSNotasFiscais: TDataSource;
    PanelVizualizacaoCompleta: TPanel;
    PageControlDadosFiscais: TPageControl;
    TSDadosNfe: TTabSheet;
    PanelDadosNotaFiscal: TPanel;
    TSDestinatario: TTabSheet;
    GroupBoxDestinatario: TGroupBox;
    PageControlTotais: TPageControl;
    tsTotaisGeral: TTabSheet;
    PanelTotais: TPanel;
    TsTotaisFcp: TTabSheet;
    TsOutrosTotais: TTabSheet;
    PanelOutrosTotais: TPanel;
    TSLocalEntregaRetirada: TTabSheet;
    GroupBoxEntrega: TGroupBox;
    GroupBoxRetirada: TGroupBox;
    TSTransporte: TTabSheet;
    TSCobranca: TTabSheet;
    TSProdutosServiços: TTabSheet;
    TSInformacoesAdicionais: TTabSheet;
    GroupBoxInformacoesAdicionaisComercioExterior: TGroupBox;
    GroupBoxInformacoesAdicionaisCompras: TGroupBox;
    Label6: TLabel;
    TSDocumentosReferenciados: TTabSheet;
    PageControlReferenciado: TPageControl;
    TabSheetReferenciadoNfe: TTabSheet;
    GridNfeReferenciada: TJvDBUltimGrid;
    TabSheetReferenciadoNf: TTabSheet;
    GridNfReferenciada: TJvDBUltimGrid;
    TabSheetReferenciadoCte: TTabSheet;
    GridCteReferenciado: TJvDBUltimGrid;
    TabSheetReferenciadoRural: TTabSheet;
    GridNfRuralReferenciada: TJvDBUltimGrid;
    TabSheetReferenciadoCupom: TTabSheet;
    GridCupomReferenciado: TJvDBUltimGrid;
    PageControlTransporte: TPageControl;
    TabSheetDadosTransportador: TTabSheet;
    TabSheetVeiculoReboque: TTabSheet;
    GroupBoxVeiculo: TGroupBox;
    GroupBoxReboqueCarreta: TGroupBox;
    GridReboque: TJvDBUltimGrid;
    TabSheetVolumes: TTabSheet;
    GroupBoxVolumes: TGroupBox;
    GridVolumes: TJvDBUltimGrid;
    TabSheetLacres: TTabSheet;
    GroupBoxLacres: TGroupBox;
    GridVolumesLacres: TJvDBUltimGrid;
    TabSheetRetencaoIcms: TTabSheet;
    GroupBoxTransporteRetencaoICMS: TGroupBox;
    TabSheetOutrasInformacoesFrete: TTabSheet;
    GroupBoxNfeTransporteOutrasInformacoes: TGroupBox;
    TSInformacoesPagamento: TTabSheet;
    PanelCobranca: TPanel;
    GroupBox1: TGroupBox;
    GridDuplicatas: TJvDBUltimGrid;
    GroupBoxFatura: TGroupBox;
    Panel2: TPanel;
    GridFormaPagamento: TJvDBUltimGrid;
    TSAutorizacaoDownload: TTabSheet;
    GridNfeAutorizacaoDownload: TJvDBUltimGrid;
    JvNetscapeSplitter1: TJvNetscapeSplitter;
    GridItens: TJvDBUltimGrid;
    PanelDetalhesAnexo: TPanel;
    TsEmitente: TTabSheet;
    EditDataHoraEmissao: TLabeledDBDateEdit;
    EditDataEntradaSaida: TLabeledDBDateEdit;
    EditChaveAcesso: TLabeledDBEdit;
    EditDigitoChaveAcesso: TLabeledDBEdit;
    EditCodigoNumerico: TLabeledDBEdit;
    EditSerie: TLabeledDBEdit;
    EditNumeroNfe: TLabeledDBEdit;
    EditDataHoraContingencia: TLabeledDBDateEdit;
    EditJustificativaContingencia1: TLabeledDBEdit;
    EditNaturezaOperacao: TLabeledDBEdit;
    EditBCIcms: TLabeledDBEdit;
    EditValorIcms: TLabeledDBEdit;
    EditValorTotalTributos: TLabeledDBEdit;
    EditValorTotalIcmsDesonerado: TLabeledDBEdit;
    EditValorOutrasDespesas: TLabeledDBEdit;
    EditValorPIS: TLabeledDBEdit;
    EditBCIcmsSt: TLabeledDBEdit;
    EditValorFrete: TLabeledDBEdit;
    EditValorDesconto: TLabeledDBEdit;
    EditValorIcmsSt: TLabeledDBEdit;
    EditValorSeguro: TLabeledDBEdit;
    EditTotalImpostoImportacao: TLabeledDBEdit;
    EditValorIPI: TLabeledDBEdit;
    EditValorTotalIpiDevolvido: TLabeledDBEdit;
    EditTotalProdutos: TLabeledDBEdit;
    EditValorTotalNota: TLabeledDBEdit;
    EditBaseCalculoIssqn: TLabeledDBEdit;
    EditValorRetidoPis: TLabeledDBEdit;
    EditValorIssqn: TLabeledDBEdit;
    EditValorRetidoCofins: TLabeledDBEdit;
    EditValorPisIssqn: TLabeledDBEdit;
    EditValorRetidoCsll: TLabeledDBEdit;
    EditValorCofinsIssqn: TLabeledDBEdit;
    EditBaseCalculoIrrf: TLabeledDBEdit;
    Label1: TLabel;
    JvDbComboboxConsumidorPresenca: TJvDBComboBox;
    Label2: TLabel;
    JvDbComboboxIndicadorIntermediador: TJvDBComboBox;
    Label3: TLabel;
    JvDbComboboxTipoEmissao: TJvDBComboBox;
    Label5: TLabel;
    EditIdCodigoMunicipio: TLabeledDBEdit;
    Emitente: TGroupBox;
    EditTransporteBalsa: TLabeledDBEdit;
    EditTransporteVagao: TLabeledDBEdit;
    JvDBComboBoxCfopRetencaoIcmsFrete: TJvDBComboBox;
    Label10: TLabel;
    EditTransporteIcmsValorServicos: TLabeledDBEdit;
    EditRetencaoIcmsBaseCalculo: TLabeledDBEdit;
    EditRetencaoIcmsAliquota: TLabeledDBEdit;
    EditRetencaoIcmsIcmsRetido: TLabeledDBEdit;
    EditRetencaoIcmsCidade: TLabeledDBEdit;
    EditVeiculoPlaca: TLabeledDBEdit;
    EditVeiculoUf: TLabeledDBEdit;
    EditVeiculoRNTC: TLabeledDBEdit;
    EditFaturaNumero: TLabeledDBEdit;
    EditFaturaValorOriginal: TLabeledDBEdit;
    EditFaturaValorDesconto: TLabeledDBEdit;
    EditFaturaValorLiquido: TLabeledDBEdit;
    EditComexUfEmbarque: TLabeledDBEdit;
    EditComexLocalEmbarque: TLabeledDBEdit;
    EditComexLocalDespacho: TLabeledDBEdit;
    EditCompraNotaEmpenho: TLabeledDBEdit;
    EditCompraPedido: TLabeledDBEdit;
    EditCompraContato: TLabeledDBEdit;
    MemoInfComplementarFisico: TDBMemo;
    Label12: TLabel;
    MemoInfComplementarContribuinte: TDBMemo;
    JvDbComboboxTipoOperacao: TJvDBComboBox;
    Label13: TLabel;
    EditValorCONFINS: TLabeledDBEdit;
    JvDbComboboxUfEmitente: TJvDBComboBox;
    Label4: TLabel;
    Label14: TLabel;
    JvDbComboboxCodigoModelo: TJvDBComboBox;
    JvDbComboboxFormatoImpressaoDanfe: TJvDBComboBox;
    Label15: TLabel;
    JvDbComboboxAmbiente: TJvDBComboBox;
    Label16: TLabel;
    Panel3: TPanel;
    EditValorIcmsUfRemet: TLabeledDBEdit;
    EditValorIcmsUfDest: TLabeledDBEdit;
    EditValorFcpUfDest: TLabeledDBEdit;
    EditValorTotalIcmsFCP: TLabeledDBEdit;
    EditValorTotalIcmsFcpStRetidoAnteriormente: TLabeledDBEdit;
    EditValorTotalIcmsFcpSt: TLabeledDBEdit;
    Panel5: TPanel;
    EditEmitenteCpfCnpj: TLabeledDBEdit;
    EditEmitenteRazao: TLabeledDBEdit;
    EditEmitenteNomeFantasia: TLabeledDBEdit;
    EditEmitenteLogradouro: TLabeledDBEdit;
    EditEmitenteBairro: TLabeledDBEdit;
    EditEmitenteCEP: TLabeledDBEdit;
    EditEmitenteNumero: TLabeledDBEdit;
    EditEmitenteComplemento: TLabeledDBEdit;
    EditEmitenteTelefone: TLabeledDBEdit;
    EditEmitenteCodigoPais: TLabeledDBEdit;
    EditEmitenteNomePais: TLabeledDBEdit;
    JvDbComboboxCRT: TJvDBComboBox;
    Label8: TLabel;
    EdiEmitenteUF: TLabeledDBEdit;
    EditEmitenteCnae: TLabeledDBEdit;
    EditEmitenteNomeMunicipio: TLabeledDBEdit;
    EditEmitenteSuframa: TLabeledDBEdit;
    EditEmitenteInscricaoMunicipal: TLabeledDBEdit;
    EditEmitenteInscricaoEstadual: TLabeledDBEdit;
    EditEmitenteCodigoIBGE: TLabeledDBEdit;
    Panel6: TPanel;
    EditDestinatarioCPFCNPJ: TLabeledDBEdit;
    EditDestinatarioRazao: TLabeledDBEdit;
    JvDBComboBoxIndicadorIe2: TJvDBComboBox;
    Label9: TLabel;
    EditDestinatarioCEP: TLabeledDBEdit;
    EditDestinatarioBairro: TLabeledDBEdit;
    EditDestinatarioLogradouro: TLabeledDBEdit;
    EditDestinatarioNumero: TLabeledDBEdit;
    EditDestinatarioComplemento: TLabeledDBEdit;
    EditDestinatarioTelefone: TLabeledDBEdit;
    EditDestinatarioCodigoIbge: TLabeledDBEdit;
    EditDestinatarioNomeMunicipio: TLabeledDBEdit;
    EditDestinatarioUf: TLabeledDBEdit;
    EditDestinatarioCodigoPais: TLabeledDBEdit;
    EditDestinatarioNomePais: TLabeledDBEdit;
    EditDestinatarioInscricaoEstadual: TLabeledDBEdit;
    JvDBComboboxLocalDestino: TJvDBComboBox;
    Label7: TLabel;
    EditDestinatarioEmail: TLabeledDBEdit;
    JvDBComboBoxConsumidorOperacao: TJvDBComboBox;
    Label17: TLabel;
    EditRetiradaCpfCnpj: TLabeledDBEdit;
    EditRetiradaInscricaoEstadual: TLabeledDBEdit;
    EditRetiradaNome: TLabeledDBEdit;
    EditRetiradaNumero: TLabeledDBEdit;
    EditRetiradaBairro: TLabeledDBEdit;
    EditRetiradaEmail: TLabeledDBEdit;
    EditRetiradaTelefone: TLabeledDBEdit;
    EditRetiradaCEP: TLabeledDBEdit;
    EditRetiradaLogradouro: TLabeledDBEdit;
    EditRetiradaComplemento: TLabeledDBEdit;
    EditRetiradaIbge: TLabeledDBEdit;
    EditRetiradaCidade: TLabeledDBEdit;
    EditRetiradaUF: TLabeledDBEdit;
    EditRetiradaCodigoPais: TLabeledDBEdit;
    EditRetiradaNomePais: TLabeledDBEdit;
    EditEntregaCpfCnpj: TLabeledDBEdit;
    EditEntregaInscricaoEstadual: TLabeledDBEdit;
    EditEntregaNome: TLabeledDBEdit;
    EditEntregaNumero: TLabeledDBEdit;
    EditEntregaBairro: TLabeledDBEdit;
    EditEntregaComplemento: TLabeledDBEdit;
    EditEntregaLogradouro: TLabeledDBEdit;
    EditEntregaCEP: TLabeledDBEdit;
    EditEntregaTelefone: TLabeledDBEdit;
    EditEntregaEmail: TLabeledDBEdit;
    EditEntregaIbge: TLabeledDBEdit;
    EditEntregaCidade: TLabeledDBEdit;
    EditEntregaUF: TLabeledDBEdit;
    EditEntregaCodigoPais: TLabeledDBEdit;
    EditEntregaNomePais: TLabeledDBEdit;
    Panel7: TPanel;
    Label11: TLabel;
    JvDbComboboxModalidadeFrete: TJvDBComboBox;
    EditTransportadorRazaoSocial: TLabeledDBEdit;
    EditTransportadorLogradouro: TLabeledDBEdit;
    EditTransportadorCpfCnpj: TLabeledDBEdit;
    EditTransportadorIE: TLabeledDBEdit;
    EditTransportadorCidade: TLabeledDBEdit;
    EditTransportadorUf: TLabeledDBEdit;
    EditDestinatarioSuframa: TLabeledDBEdit;
    EditValorCreditoIcmsSimplesNacional: TLabeledDBEdit;
    GroupBoxGridNotasFiscais: TGroupBox;
    GridNotasFiscais: TJvDBUltimGrid;
    PanelTotalizadorNf: TPanel;
    EditValorServicos: TLabeledDBEdit;
    EditValorRetidoIrrf: TLabeledDBEdit;
    EditBaseCalculoPrevidencia: TLabeledDBEdit;
    EditValorRetidoPrevidencia: TLabeledDBEdit;
    GroupBoxPesquisa: TGroupBox;
    EditPesquisa: TEdit;
    RadioButtonVisualizacaoCompleta: TRadioButton;
    RadioButtonVisualizacaoDanfe: TRadioButton;
    LabelPesquisa: TLabel;
    JvDbComboboxFinalidadeEmissao: TJvDBComboBox;
    MenuSped: TMenuItem;
    ImportarSped1: TMenuItem;
    PopupMenu1: TPopupMenu;
    PopupMenu11: TMenuItem;
    Configuraes1: TMenuItem;
    MostraropodevisualizodeDanfe1: TMenuItem;
    JvSpecialProgressNotasFiscais: TJvSpecialProgress;
    ExpiraConferenciaNfe: TExpiraSoftware;
    MMenutipoCarregamentoArquivos: TMenuItem;
    PesquisaAvanada1: TMenuItem;
    ItensDetalhados1: TMenuItem;
    CdsNotasFiscais: TClientDataSet;
    CdsNotasFiscaisNUMERO: TStringField;
    CdsNotasFiscaisFORNECEDOR_CLIENTE: TStringField;
    CdsNotasFiscaisSERIE: TStringField;
    CdsNotasFiscaisDATA_EMISSAO: TDateField;
    CdsNotasFiscaisDATA_SAIDA_ENTRADA: TDateField;
    CdsNotasFiscaisVALOR: TCurrencyField;
    CdsNotasFiscaisCAMINHO_ARQUIVO_XML: TStringField;
    CdsNotasFiscaisCAMINHO_ARQUIVO_PDF: TStringField;
    CdsNotasFiscaisSTATUS_NOTA: TStringField;
    CdsNotasFiscaisCHAVE_ACESSO: TStringField;
    SaveDialog1: TSaveDialog;
    procedure Open1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ButtonMouseLeave(Sender: TObject);
    procedure ButtonPaint(Sender: TObject);
    procedure ButtonMouseEnter(Sender: TObject);
    procedure pbZoomPaint(Sender: TObject);
    procedure pbZoomMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ppZoomPopup(Sender: TObject);
    procedure btZPlusClick(Sender: TObject);
    procedure MenuZoomClick(Sender: TObject);
    procedure mnPageLevelClick(Sender: TObject);
    procedure mnFitWidthClick(Sender: TObject);
    procedure PDFiumResize(Sender: TObject);
    procedure mnActualSizeClick(Sender: TObject);
    procedure btAboutClick(Sender: TObject);
    procedure Quit1Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure pnPagesResize(Sender: TObject);
    procedure btPrevClick(Sender: TObject);
    procedure btNextClick(Sender: TObject);
    procedure edPageExit(Sender: TObject);
    procedure edPageKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Copy1Click(Sender: TObject);
    procedure btPrintClick(Sender: TObject);
    procedure mnPropertiesClick(Sender: TObject);
    procedure Search1Click(Sender: TObject);
    procedure EditPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure GridNotasFiscaisKeyPress(Sender: TObject; var Key: Char);
    procedure RadioButtonVisualizacaoCompletaClick(Sender: TObject);
    procedure RadioButtonVisualizacaoDanfeClick(Sender: TObject);
    procedure GridNotasFiscaisTitleClick(Column: TColumn);
    procedure GridNotasFiscaisColEnter(Sender: TObject);
    procedure CdsNotasFiscaisAfterScroll(DataSet: TDataSet);
    procedure PopupMenu11Click(Sender: TObject);
    procedure MostraropodevisualizodeDanfe1Click(Sender: TObject);
    procedure GridItensDblClick(Sender: TObject);
    procedure MMenutipoCarregamentoArquivosClick(Sender: TObject);
    procedure ItensDetalhados1Click(Sender: TObject);
  private
    { Déclarations privées }
    FButtons  : TBitmap;
    FFocus    : TPaintBox;
    procedure CreateButtons;
    procedure OnPDFiumPaint(Sender: TObject);
    procedure VincularGrids;
    procedure CriaFormularioDetalhe;
    procedure AjustaGridNotasFiscais;
    procedure AjustesIniciais;
    procedure AjustesTelaPadrao;
    procedure ConfiguraCamposFormulario(Formulario:TForm);
    procedure ConfiguraEstadoTela(VisualizacaoCompleta:Boolean);
    function GetTipoVisuzaNotaFiscalCompleta:boolean;
    procedure AbreArquivoPeloWindows;


    procedure ConfiguraRadioButtons;

  public
    { Déclarations publiques }

  end;

var
  FConverteXml: TFConverteXml;

implementation

{$R *.dfm}

uses
  DynamicButtons, PDFium.SearchDlg,PreencheDadosGlobaisController;

resourcestring
  sPDFFiler  = 'Adobe PDF files (*.pdf)|*.pdf';
  sPDFPrompt = 'Open';

  const SELDIRHELP = 1000;

{$Region 'Infra Original Formulario'}

procedure TFConverteXml.MenuZoomClick(Sender: TObject);
begin
  PDFium.ZoomMode := zmCustom;
  PDFium.Zoom := TComponent(Sender).Tag;
end;

procedure TFConverteXml.mnActualSizeClick(Sender: TObject);
begin
  PDFium.ZoomMode := zmCustom;
  PDFium.Zoom := 100;
end;

procedure TFConverteXml.mnFitWidthClick(Sender: TObject);
begin
  PDFium.ZoomMode := zmPageWidth;
end;

procedure TFConverteXml.mnPageLevelClick(Sender: TObject);
begin
  PDFium.ZoomMode := zmPageLevel;
end;

procedure TFConverteXml.mnPropertiesClick(Sender: TObject);
begin
  ShowMessage(PDFium.GetProperties);
end;

procedure TFConverteXml.ButtonPaint(Sender: TObject);
var
  D, S: TRect;
  I: Integer;
begin
  D := TPaintBox(Sender).ClientRect;
  S := TRect.Create(0, 0, 24, 24);
  I := TPaintBox(Sender).Tag;
  if (Sender = FFocus) and (Odd(I) = False) then
    Inc(I);
  S.Offset(24 * I, 0);
  with TPaintBox(Sender).Canvas do
  begin
    CopyRect(D, FButtons.Canvas, S);
  end;
end;

procedure TFConverteXml.btAboutClick(Sender: TObject);
begin
  ShellExecute(0, nil, 'http://www.execute.fr', nil, nil, SW_SHOW);
end;

procedure TFConverteXml.btNextClick(Sender: TObject);
begin
  PDFium.NextPage;
end;

procedure TFConverteXml.btPrevClick(Sender: TObject);
begin
  PDFium.PrevPage;
end;

procedure TFConverteXml.btPrintClick(Sender: TObject);
begin
  PDFium.Print();
end;

procedure TFConverteXml.btZPlusClick(Sender: TObject);
var
  Zoom : Integer;
  Z1   : Integer;
  Z2   : Integer;
  Zx   : Integer;
  Index: Integer;
begin
  Z1 := 1000;
  Z2 := 640000;
  Zoom := Round(PDFium.Zoom * 100);
  for Index := 0 to ppZoom.Items.count - 1 do
  begin
    Zx := 100 * ppZoom.Items[Index].Tag;
    if Zx <> 0 then
    begin
      if (Zx < Zoom) and (Zx > Z1) then
        Z1 := Zx
      else
      if (Zx > Zoom) and (Zx < Z2) then
        Z2 := Zx;
    end;
  end;
  if Sender = btZPlus then
    Z1 := Z2;
  PDFium.ZoomMode := zmCustom;
  PDFium.Zoom := Z1/100;
  pbZoom.Invalidate;
end;

procedure TFConverteXml.ButtonMouseEnter(Sender: TObject);
begin
  if Sender = FFocus then
    Exit;
  if FFocus <> nil then
    FFocus.Invalidate;
  FFocus := TPaintBox(Sender);
  if FFocus <> nil then
    FFocus.Invalidate;
end;

procedure TFConverteXml.ButtonMouseLeave(Sender: TObject);
begin
  if FFocus <> nil then
  begin
    FFocus.Invalidate;
    FFocus := nil;
  end;
end;

procedure TFConverteXml.Close1Click(Sender: TObject);
begin
  PDFium.CloseDocument;
end;

procedure TFConverteXml.Copy1Click(Sender: TObject);
begin
  Clipboard.AsText := PDFium.GetSelectionText;
end;

procedure TFConverteXml.CreateButtons;
begin
  FButtons.PixelFormat := pf32Bit;
  FButtons.SetSize(2 * 2 * 10 * 24, 2 * 24);
  with FButtons.Canvas do
  begin
    Brush.Color := clBtnFace;
    FillRect(Rect(0, 0, FButtons.Width, FButtons.Height));

    Pen.Width := 4;
    DrawButtons( 0, $6F6F6F);
    DrawButtons(48, $C87521);
  end;
//  FButtons.SaveToFile('BUTTONS48.BMP');
  AntiAliaze(FButtons);
  with FButtons.Canvas do
  begin
    Pen.Width := 1;
    FixButtons( 0, $6F6F6F);
    FixButtons(24, $C87521);
  end;
//  FButtons.SaveToFile('BUTTONS24.BMP');
end;

procedure TFConverteXml.edPageExit(Sender: TObject);
begin
  edPage.Text := IntToStr(PDFium.PageIndex + 1);
end;

procedure TFConverteXml.edPageKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
var
  Page: Integer;
  Msg: TMsg;
begin
  if Key = VK_RETURN then
  begin
    if TryStrToInt(edPage.Text, Page) then
    begin
      PDFium.GoPage(Page - 1);
    end;
    Key := 0;
    PeekMessage(Msg, 0, WM_CHAR, WM_CHAR, PM_REMOVE);
  end;
end;

procedure TFConverteXml.OnPDFiumPaint(Sender: TObject);
begin
  edPage.Text := IntToStr(PDFium.PageIndex + 1);
  lbPages.Caption := Format('(%d / %d)', [PDFium.PageIndex + 1, PDFium.PAgeCount]);
end;

procedure TFConverteXml.pbZoomMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  p: TPoint;
begin
  if Button = mbLeft then
  begin
    p.x := x;
    p.y := y;
    p := pbZoom.ClientToScreen(p);
    ppZoom.Popup(p.x, p.y);
  end;
end;

procedure TFConverteXml.pbZoomPaint(Sender: TObject);
var
  Str: string;
  R  : TRect;
begin
  R := pbZoom.ClientRect;
  with pbZoom.Canvas do
  begin
    Pen.Color := $CBCBCB;
    Brush.Color := clWhite;
    Rectangle(R);
    if FFocus = Sender then
    begin
      Pen.Color := $D28E4A;
      Brush.Color := $C87521;
    end else begin
      Pen.Color := $8A8A8A;
      Brush.Color := $6F6F6F;
    end;
    Arrow(60, 12);
    Dec(R.Right, 24);
    Str := FloatToStrF(PDFium.Zoom, TFloatFormat.ffFixed, 18, 0) + '%';
    Brush.Color := clWhite;
    Font.Color := $4D4D4D;
    TextRect(R, Str, [TTextFormats.tfSingleLine, TTextFormats.tfCenter, TTextFormats.tfVerticalCenter]);
  end;
end;

procedure TFConverteXml.PDFiumResize(Sender: TObject);
begin
  btPageWidth.Tag := 6 + Ord(PDFium.ZoomMode = zmPageWidth);
  btFullPage.Tag := 8 + Ord(PDFium.ZoomMode = zmPageLevel);
  btActualSize.Tag := 10 + Ord((PDFium.ZoomMode = zmCustom) and (Round(PDFium.Zoom * 100) = 10000));
  pnButtons.Invalidate;
end;

procedure TFConverteXml.pnPagesResize(Sender: TObject);
begin
  shPAge.SetBounds(edPage.Left, edPage.Top + edPage.Height + 1, edPage.Width, 1);
end;

procedure TFConverteXml.Search1Click(Sender: TObject);
begin
  TSearchDlg.Execute(PDFium);
end;

procedure TFConverteXml.ppZoomPopup(Sender: TObject);
var
  Zoom : Integer;
  Index: Integer;
begin
  Zoom := Round(PDFium.Zoom * 100);
  for Index := 0 to ppZoom.Items.Count - 1 do
  begin
    ppZoom.Items[Index].Checked := (PDFium.ZoomMode = zmCustom) and (ppZoom.Items[Index].Tag * 100 = Zoom);
  end;
  mnActualSize.Checked := (PDFium.ZoomMode = zmCustom) and (Zoom = 10000);
  mnPageLevel.Checked := PDFium.ZoomMode = zmPageLevel;
  mnFitWidth.Checked := PDFium.ZoomMode = zmPageWidth;
end;

procedure TFConverteXml.Quit1Click(Sender: TObject);
begin
  Close();
end;

{$EndRegion}

{$Region 'Infra'}

procedure TFConverteXml.FormCreate(Sender: TObject);
var LookupField  : TStringField;
begin
  Application.Title := Caption;
  FButtons := TBitmap.Create;
  CreateButtons;
  PDFium.OnPaint := OnPDFiumPaint;
  AjustesIniciais;
  ConfiguraCamposFormulario(Self);
  ConfiguraCamposFormulario(FNfeDetalheAnexo);

  // Procedure que permite usuario configurar o windows para abrir arquivos xml pelo sistema
  AbreArquivoPeloWindows;
end;

procedure TFConverteXml.AbreArquivoPeloWindows;
begin
  if TImportaXmlParaComponentesVisuaisController.AbrirComDoWindows(ParamStr(1),CdsNotasFiscais) then
  begin
    PageControlDadosFiscais.ActivePageIndex:=3;
    FNfeDetalheAnexo.PageControlDadosTributacao.ActivePageIndex:=1;
  end;
end;

procedure TFConverteXml.FormDestroy(Sender: TObject);
begin
  FButtons.Free;
end;

procedure TFConverteXml.AjustesIniciais;
begin
  CriaFormularioDetalhe;
  TPreencheDadosGlobaisController.PreencheJvComboboxFormularioDados;
  TPreencheDadosGlobaisController.PreencheJvComboboxFormularioItens;
  VincularGrids;
  AjustesTelaPadrao;
  AjustaGridNotasFiscais;
end;

procedure TFConverteXml.PopupMenu11Click(Sender: TObject);
begin
  ConfiguraEstadoTela(false);
  TXmlPdfController.CarregaXmlDanfe(CdsNotasFiscais,GridNotasFiscais,pnPages,PDFium);
end;

{$EndRegion}

{$Region 'Grid e ClientDataset'}

procedure TFConverteXml.CdsNotasFiscaisAfterScroll(DataSet: TDataSet);
begin
  ConfiguraEstadoTela(GetTipoVisuzaNotaFiscalCompleta);
  TXmlPdfController.CarregaNotaFiscal(GetTipoVisuzaNotaFiscalCompleta,CdsNotasFiscais,GridNotasFiscais,pnPages,PDFium);
end;

procedure TFConverteXml.VincularGrids;
begin
  ConfiguraGridFromVO(GridNfeReferenciada, TNfeReferenciadaVO);
  ConfiguraGridFromVO(GridNfReferenciada, TNfeNfReferenciadaVO);
  ConfiguraGridFromVO(GridCteReferenciado, TNfeCteReferenciadoVO);
  ConfiguraGridFromVO(GridNfRuralReferenciada, TNfeProdRuralReferenciadaVO);
  ConfiguraGridFromVO(GridCupomReferenciado, TNfeCupomFiscalReferenciadoVO);

  ConfiguraGridFromVO(GridReboque, TNfeTransporteReboqueVO);
  ConfiguraGridFromVO(GridVolumes, TNfeTransporteVolumeVO);
  ConfiguraGridFromVO(GridVolumesLacres, TNfeTransporteVolumeLacreVO);

  ConfiguraGridFromVO(GridDuplicatas, TNfeDuplicataVO);
  ConfiguraGridFromVO(GridFormaPagamento, TNfeFormaPagamentoVO);
  ConfiguraGridFromVO(GridNfeAutorizacaoDownload, TNfeAutorizacaoDownloadVO);

  ConfiguraGridFromVO(GridItens, TNfeDetalheVO);
  ConfiguraGridFromVO(FNfeDetalheAnexo.GridExportacao, TNfeExportacaoVO);
  ConfiguraGridFromVO(FNfeDetalheAnexo.GridNfeDeclaracaoImportacao, TNfeDeclaracaoImportacaoVO);
  ConfiguraGridFromVO(FNfeDetalheAnexo.GridDeclaracaoImportacaoDetalhe, TNfeImportacaoDetalheVO);
  ConfiguraGridFromVO(FNfeDetalheAnexo.GridDeclaracaoImportacaoDetalhe, TNfeImportacaoDetalheVO);
  ConfiguraGridFromVO(FNfeDetalheAnexo.GridNfeDetalheRastreabilidade, TNfeDetalheRastreabilidadeVO);
  ConfiguraGridFromVO(GridDuplicatas, TNfeDuplicataVO);
end;

procedure TFConverteXml.GridItensDblClick(Sender: TObject);
begin
  FNfeDetalheItem.Show;
end;

procedure TFConverteXml.GridNotasFiscaisColEnter(Sender: TObject);
begin
  labelPesquisa.Caption:= 'Pesquisa pelo "'+GridNotasFiscais.Columns.Grid.SelectedField.DisplayLabel+'". Para mudar o campo de pesquisa selecione o campo desejado na grid'
end;

procedure TFConverteXml.GridNotasFiscaisKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  //CarregaNotaFiscal(true);
  if not ((Key = #13) or (Key = #9) or (Key = #27)) then
    begin
      EditPesquisa.Text := Key;
      EditPesquisa.Selstart := 1;
      EditPesquisa.SetFocus;
      EditPesquisa.Text := Key;
      EditPesquisa.SetFocus;
      EditPesquisa.Selstart := 1;
    end;
    if (Key = #27) then
    EditPesquisa.SetFocus;
end;

procedure TFConverteXml.GridNotasFiscaisTitleClick(Column: TColumn);
begin
  TXmlPdfController.OrdenarGrid(CdsNotasFiscais,Column);
end;

{$EndRegion}

{$Region 'Funções e procedimentos de layout'}

procedure TFConverteXml.AjustesTelaPadrao;
begin
  PageControlDadosFiscais.TabIndex:=0;
  PageControlTotais.TabIndex:=0;
  PageControlReferenciado.TabIndex:=0;
  PageControlTransporte.TabIndex:=0;
  FNFeDetalheAnexo.PageControlDadosTributacao.TabIndex:=0;
  FNFeDetalheAnexo.PageControlIcms.TabIndex:=0;
  FNFeDetalheAnexo.PageControlPis.TabIndex:=0;
  FNFeDetalheAnexo.PageControlCofins.TabIndex:=0;
  FNFeDetalheAnexo.PageControlImportacao.TabIndex:=0;
end;

procedure TFConverteXml.AjustaGridNotasFiscais;
begin
  GridNotasFiscais.Columns[2].Visible:=false;
  GridNotasFiscais.Columns[4].Visible:=false;
  GridNotasFiscais.Columns[6].Visible:=false;
  GridNotasFiscais.Columns[7].Visible:=false;
  GridNotasFiscais.Columns[8].Visible:=false;
  GridNotasFiscais.Columns[0].Font.Color:=clmaroon;
  GridNotasFiscais.Columns[0].Font.Style:=[fsbold];
  GridNotasFiscais.Columns[1].Font.Style:=[fsbold];
  GridItens.Columns[4].Font.Color:=clmaroon;
  GridItens.Columns[4].Font.Style:=[fsbold];
  GridItens.Columns[6].Font.Style:=[fsbold];
  GridNotasFiscais.ReadOnly:=true;

end;

procedure TFConverteXml.CriaFormularioDetalhe;
begin
  FNFeDetalheAnexo := TFNFeDetalheAnexo.Create(PanelDetalhesAnexo);
  with FNFeDetalheAnexo do
  begin
    Align := alClient;
    BorderStyle := bsNone;
    Parent := PanelDetalhesAnexo;
  end;
  FNFeDetalheAnexo.Show;
end;

procedure TFConverteXml.ConfiguraRadioButtons;
begin
  if MostraropodevisualizodeDanfe1.Checked = true then
  MostraropodevisualizodeDanfe1.Checked := false
  else
  MostraropodevisualizodeDanfe1.Checked := true;
  RadioButtonVisualizacaoCompleta.Visible:=MostraropodevisualizodeDanfe1.Checked;
  RadioButtonVisualizacaoDanfe.Visible:=MostraropodevisualizodeDanfe1.Checked;
end;

procedure TFConverteXml.ConfiguraCamposFormulario(Formulario:TForm);
var i:Integer;
begin
  for i := 0 to Formulario.ComponentCount - 1 do
  begin
    if (Formulario.Components[i] is TLabeledDBEdit) then
    (Formulario.Components[i] as TLabeledDBEdit).ReadOnly:=true;
    if (Formulario.Components[i] is TLabeledDBDateEdit) then
    (Formulario.Components[i] as TLabeledDBDateEdit).ReadOnly:=true;
    if (Formulario.Components[i] is TJvDBUltimGrid) then
    (Formulario.Components[i] as TJvDBUltimGrid).ReadOnly:=true;
    //if (Formulario.Components[i] is TJvDbCombobox) then
    //(Formulario.Components[i] as TJvDbCombobox).OnKeyPress(Formulario.Components[i],#0);
  end;
end;

procedure TFConverteXml.RadioButtonVisualizacaoCompletaClick(Sender: TObject);
begin
  ConfiguraEstadoTela(true);
end;

procedure TFConverteXml.ConfiguraEstadoTela(VisualizacaoCompleta:Boolean);
begin
  if VisualizacaoCompleta then
  begin
    pnPages.Visible:=false;
    btPageWidth.Visible:=false;
    btfullpage.Visible:=false;
    btActualsize.Visible:=false;
    pbZoom.Visible:=false;
    btZPlus.Visible:=false;
    btzminus.Visible:=false;
    btPrint.Visible:=false;
    PDFium.LoadFromFile('');
    PanelVizualizacaoCompleta.Visible:=true;
    PdFium.Visible:=false;
  end

  else
  begin
    pnPages.Visible:=true;
    btPageWidth.Visible:=true;
    btfullpage.Visible:=true;
    btActualsize.Visible:=true;
    pbZoom.Visible:=true;
    btZPlus.Visible:=true;
    btzminus.Visible:=true;
    btPrint.Visible:=true;
    PanelVizualizacaoCompleta.Visible:=false;
    PdFium.Visible:=True;
    PDFium.LoadFromFile('');
  end;
end;

function TFConverteXml.GetTipoVisuzaNotaFiscalCompleta: boolean;
begin
  Result:=True;
  if (RadioButtonVisualizacaoCompleta.Visible = false) and (RadioButtonVisualizacaoDanfe.Visible = false) then
  Exit(true)
  else if RadioButtonVisualizacaoDanfe.Checked = true then
  Exit(false);
end;


{$EndRegion}

{$Region 'Actions e Botões e outros cliques'}

procedure TFConverteXml.MMenutipoCarregamentoArquivosClick(Sender: TObject);
begin
  if MMenutipoCarregamentoArquivos.Checked then
  MMenutipoCarregamentoArquivos.Checked:=false
  else
  MMenutipoCarregamentoArquivos.Checked:=true;
end;

procedure TFConverteXml.EditPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    TXmlPdfController.PesquisaPadrao(CdsNotasFiscais,GridNotasFiscais,EditPesquisa.text,pnPages,PDFium);
    TImportaXmlParaComponentesVisuaisController.TotalizaNotasFiscais(CdsNotasFiscais,PanelTotalizadorNf);
  end;
end;

procedure TFConverteXml.ItensDetalhados1Click(Sender: TObject);
begin
  FitensDetalhados.Showmodal;
end;

procedure TFConverteXml.MostraropodevisualizodeDanfe1Click(Sender: TObject);
begin
  ConfiguraRadioButtons;
end;

procedure TFConverteXml.Open1Click(Sender: TObject);
var caminhoarquivos:string;
begin
  CdsNotasFiscais.Filtered:=false;
  ConfiguraEstadoTela(true);
  if not (MMenutipoCarregamentoArquivos.Checked) then
  TXmlPdfController.CarregarArquivosXmlPastaSelecionada(CdsNotasFiscais,False,JvSpecialProgressNotasFiscais)
  else
  TXmlPdfController.CarregarArquivosXml(CdsNotasFiscais,False,JvSpecialProgressNotasFiscais);
  TImportaXmlParaComponentesVisuaisController.TotalizaNotasFiscais(CdsNotasFiscais,PanelTotalizadorNf);
end;

procedure TFConverteXml.RadioButtonVisualizacaoDanfeClick(Sender: TObject);
begin
  ConfiguraEstadoTela(False);
end;


{$EndRegion}


























end.

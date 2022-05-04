unit NfeCabecalhoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils,
DB;

type
  [TEntity]
  [TTable('NFE_CABECALHO')]
  TNfeCabecalhoVO = class(TVO)
  private
    FID: Integer;
    FCODIGO_NUMERICO: String;
    FNATUREZA_OPERACAO: String;
    FINDICADOR_FORMA_PAGAMENTO: Integer;
    FINDICADOR_INTERMEDIADOR: String;
    FCODIGO_MODELO: String;
    FSERIE: String;
    FNUMERO: String;
    FDATA_HORA_EMISSAO: TDateTime;
    FDATA_HORA_ENTRADA_SAIDA: TDatetime;
    FTIPO_OPERACAO: String;
    FLOCAL_DESTINO: String;
    FCODIGO_MUNICIPIO: Integer;
    FFORMATO_IMPRESSAO_DANFE: String;
    FTIPO_EMISSAO: String;
    FCHAVE_ACESSO: String;
    FDIGITO_CHAVE_ACESSO: String;
    FAMBIENTE: String;
    FFINALIDADE_EMISSAO: String;
    FCONSUMIDOR_OPERACAO: String;
    FCONSUMIDOR_PRESENCA: String;
    FPROCESSO_EMISSAO: Integer;
    FVERSAO_PROCESSO_EMISSAO: String;
    FDATA_ENTRADA_CONTINGENCIA: TDateTime;
    FJUSTIFICATIVA_CONTINGENCIA: String;
    FBASE_CALCULO_ICMS: Extended;
    FVALOR_ICMS: Extended;
    FVALOR_ICMS_DESONERADO: Extended;
    FBASE_CALCULO_ICMS_ST: Extended;
    FVALOR_ICMS_ST: Extended;
    FVALOR_TOTAL_PRODUTOS: Extended;
    FVALOR_FRETE: Extended;
    FVALOR_SEGURO: Extended;
    FVALOR_DESCONTO: Extended;
    FVALOR_IMPOSTO_IMPORTACAO: Extended;
    FVALOR_IPI: Extended;
    FVALOR_PIS: Extended;
    FVALOR_COFINS: Extended;
    FVALOR_DESPESAS_ACESSORIAS: Extended;
    FVALOR_TOTAL: Extended;
    FVALOR_SERVICOS: Extended;
    FBASE_CALCULO_ISSQN: Extended;
    FVALOR_ISSQN: Extended;
    FVALOR_PIS_ISSQN: Extended;
    FVALOR_COFINS_ISSQN: Extended;
    FDATA_PRESTACAO_SERVICO: TDateTime;
    FVALOR_DEDUCAO_ISSQN: Extended;
    FOUTRAS_RETENCOES_ISSQN: Extended;
    FDESCONTO_INCONDICIONADO_ISSQN: Extended;
    FDESCONTO_CONDICIONADO_ISSQN: Extended;
    FTOTAL_RETENCAO_ISSQN: Extended;
    FREGIME_ESPECIAL_TRIBUTACAO: Integer;
    FVALOR_RETIDO_PIS: Extended;
    FVALOR_RETIDO_COFINS: Extended;
    FVALOR_RETIDO_CSLL: Extended;
    FBASE_CALCULO_IRRF: Extended;
    FVALOR_RETIDO_IRRF: Extended;
    FBASE_CALCULO_PREVIDENCIA: Extended;
    FVALOR_RETIDO_PREVIDENCIA: Extended;
    FCOMEX_UF_EMBARQUE: String;
    FCOMEX_LOCAL_EMBARQUE: String;
    FCOMEX_LOCAL_DESPACHO: String;
    FCOMPRA_NOTA_EMPENHO: String;
    FCOMPRA_PEDIDO: String;
    FCOMPRA_CONTRATO: String;
    FINFORMACOES_ADD_FISCO: String;
    FINFORMACOES_ADD_CONTRIBUINTE: String;
    FVALOR_TRIBUTOS: Extended;
    FCRT: Integer;   // 1 = SIMPLES NACIONAL 3 = REGIME NORMAL

    FVALOR_FCP_UF_DEST: Extended;
    FVALOR_ICMS_UF_DEST: Extended;
    FVALOR_ICMS_UF_REMET: Extended;

    FVALOR_ICMS_FCP: Extended;
    FVALOR_ICMS_FCP_ST_RETIDO_ANTERIORMENTE: Extended;
    FVALOR_ICMS_FCP_ST: Extended;
    FVALOR_IPI_DEVOLVIDO: Extended;
    FINDICADOR_EMITENTE:String;

    FUF_EMITENTE: Integer;
    FVALOR_CREDITO_ICMS_SIMPLES_NACIONAL: Extended;


  public
    constructor Create; override;
    destructor Destroy; override;
    [TId('ID', [ ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('NUMERO', 'Numero', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property Numero: String  read FNUMERO write FNUMERO;
    [TColumn('SERIE', 'Serie', 24, [ldGrid, ldLookup, ldCombobox], False)]
    property Serie: String  read FSERIE write FSERIE;
    [TColumn('NATUREZA_OPERACAO', 'Natureza Operacao', 200, [ldGrid, ldLookup, ldCombobox], False)]
    property NaturezaOperacao: String  read FNATUREZA_OPERACAO write FNATUREZA_OPERACAO;
    [TColumn('UF_EMITENTE', 'Uf Emitente', 80, [], False)]
    property UfEmitente: Integer  read FUF_EMITENTE write FUF_EMITENTE;
    [TColumn('CODIGO_NUMERICO', 'Codigo Numerico', 80, [], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property CodigoNumerico: String  read FCODIGO_NUMERICO write FCODIGO_NUMERICO;
    [TColumn('INDICADOR_FORMA_PAGAMENTO', 'Indicador Forma Pagamento', 80, [], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IndicadorFormaPagamento: Integer  read FINDICADOR_FORMA_PAGAMENTO write FINDICADOR_FORMA_PAGAMENTO;

    [TColumn('INDICADOR_INTERMEDIADOR', 'Indicador Intermediador', 700, [], False)]
    property IndicadorIntermediador: String  read FINDICADOR_INTERMEDIADOR write FINDICADOR_INTERMEDIADOR;

    [TColumn('CODIGO_MODELO', 'Codigo Modelo', 16, [], False)]
    property CodigoModelo: String  read FCODIGO_MODELO write FCODIGO_MODELO;
    [TColumn('DATA_HORA_EMISSAO', 'Emissão', 140, [ldGrid, ldLookup], False)]
    property DataHoraEmissao: TDatetime  read FDATA_HORA_EMISSAO write FDATA_HORA_EMISSAO;
    [TColumn('DATA_HORA_ENTRADA_SAIDA', 'Saída/Entrada', 140, [ldGrid, ldLookup], False)]
    property DataHoraEntradaSaida: TDatetime  read FDATA_HORA_ENTRADA_SAIDA write FDATA_HORA_ENTRADA_SAIDA;
    [TColumn('VALOR_TOTAL', 'Valor Total', 120, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorTotal: Extended  read FVALOR_TOTAL write FVALOR_TOTAL;
    [TColumn('TIPO_OPERACAO', 'Tipo Operação', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property TipoOperacao: String read FTIPO_OPERACAO write FTIPO_OPERACAO;
    [TColumn('LOCAL_DESTINO', 'Local Destino', 80, [], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property LocalDestino: String  read FLOCAL_DESTINO write FLOCAL_DESTINO;
    [TColumn('CODIGO_MUNICIPIO', 'Codigo Municipio', 80, [], False)]
    property CodigoMunicipio: Integer  read FCODIGO_MUNICIPIO write FCODIGO_MUNICIPIO;
    [TColumn('FORMATO_IMPRESSAO_DANFE', 'Formato Impressao Danfe', 80, [], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property FormatoImpressaoDanfe: String  read FFORMATO_IMPRESSAO_DANFE write FFORMATO_IMPRESSAO_DANFE;
    [TColumn('DIGITO_CHAVE_ACESSO', 'Digito Chave Acesso', 80, [], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property DigitoChaveAcesso: String  read FDIGITO_CHAVE_ACESSO write FDIGITO_CHAVE_ACESSO;
    [TColumn('FINALIDADE_EMISSAO', 'Finalidade Emissao', 80, [], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property FinalidadeEmissao: String  read FFINALIDADE_EMISSAO write FFINALIDADE_EMISSAO;
    [TColumn('CONSUMIDOR_OPERACAO', 'Consumidor Operacao', 80, [], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property ConsumidorOperacao: String  read FCONSUMIDOR_OPERACAO write FCONSUMIDOR_OPERACAO;
    [TColumn('CONSUMIDOR_PRESENCA', 'Consumidor Presenca', 80, [], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property ConsumidorPresenca: String  read FCONSUMIDOR_PRESENCA write FCONSUMIDOR_PRESENCA;
    [TColumn('PROCESSO_EMISSAO', 'Processo Emissao', 80, [], False)]
    property ProcessoEmissao: Integer  read FPROCESSO_EMISSAO write FPROCESSO_EMISSAO;
    [TColumn('VERSAO_PROCESSO_EMISSAO', 'Versao Processo Emissao', 160, [], False)]
    property VersaoProcessoEmissao: String  read FVERSAO_PROCESSO_EMISSAO write FVERSAO_PROCESSO_EMISSAO;
    [TColumn('DATA_ENTRADA_CONTINGENCIA', 'Data Entrada Contingencia', 272, [], False)]
    property DataEntradaContingencia: TDateTime  read FDATA_ENTRADA_CONTINGENCIA write FDATA_ENTRADA_CONTINGENCIA;
    [TColumn('JUSTIFICATIVA_CONTINGENCIA', 'Justificativa Contingencia', 450, [], False)]
    property JustificativaContingencia: String  read FJUSTIFICATIVA_CONTINGENCIA write FJUSTIFICATIVA_CONTINGENCIA;
    [TColumn('BASE_CALCULO_ICMS', 'Base Calculo Icms', 120, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property BaseCalculoIcms: Extended  read FBASE_CALCULO_ICMS write FBASE_CALCULO_ICMS;
    [TColumn('VALOR_ICMS', 'Valor Icms', 120, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcms: Extended  read FVALOR_ICMS write FVALOR_ICMS;
    [TColumn('VALOR_ICMS_DESONERADO', 'Valor Icms Desonerado', 120, [], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcmsDesonerado: Extended  read FVALOR_ICMS_DESONERADO write FVALOR_ICMS_DESONERADO;
    [TColumn('BASE_CALCULO_ICMS_ST', 'Base Calculo Icms St', 120, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property BaseCalculoIcmsSt: Extended  read FBASE_CALCULO_ICMS_ST write FBASE_CALCULO_ICMS_ST;
    [TColumn('VALOR_ICMS_ST', 'Valor Icms St', 120, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcmsSt: Extended  read FVALOR_ICMS_ST write FVALOR_ICMS_ST;
    [TColumn('VALOR_TOTAL_PRODUTOS', 'Valor Total Produtos', 120, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorTotalProdutos: Extended  read FVALOR_TOTAL_PRODUTOS write FVALOR_TOTAL_PRODUTOS;
    [TColumn('VALOR_FRETE', 'Frete', 120, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorFrete: Extended  read FVALOR_FRETE write FVALOR_FRETE;
    [TColumn('VALOR_SEGURO', 'Seguro', 120, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorSeguro: Extended  read FVALOR_SEGURO write FVALOR_SEGURO;
    [TColumn('VALOR_DESCONTO', 'Desconto', 120, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorDesconto: Extended  read FVALOR_DESCONTO write FVALOR_DESCONTO;
    [TColumn('VALOR_IMPOSTO_IMPORTACAO', 'Imposto Importacao', 168, [], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorImpostoImportacao: Extended  read FVALOR_IMPOSTO_IMPORTACAO write FVALOR_IMPOSTO_IMPORTACAO;
    [TColumn('VALOR_IPI', 'Ipi', 120, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIpi: Extended  read FVALOR_IPI write FVALOR_IPI;
    [TColumn('VALOR_PIS', 'Pis', 120, [], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorPis: Extended  read FVALOR_PIS write FVALOR_PIS;
    [TColumn('VALOR_COFINS', 'Cofins', 120, [], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorCofins: Extended  read FVALOR_COFINS write FVALOR_COFINS;
    [TColumn('VALOR_DESPESAS_ACESSORIAS', 'Despesas Acessorias', 120, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorDespesasAcessorias: Extended  read FVALOR_DESPESAS_ACESSORIAS write FVALOR_DESPESAS_ACESSORIAS;
    [TColumn('VALOR_FCP_UF_DEST', 'Valor FCP', 168, [], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorFcpUfDest: Extended  read FVALOR_FCP_UF_DEST write FVALOR_FCP_UF_DEST;
    [TColumn('VALOR_ICMS_UF_DEST', 'Valor Icms UF Destinatário', 168, [], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcmsUfDest: Extended  read FVALOR_ICMS_UF_DEST write FVALOR_ICMS_UF_DEST;
    [TColumn('VALOR_ICMS_UF_REMET', 'Valor Icms UF Remetente', 168, [], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcmsUfRemet: Extended  read FVALOR_ICMS_UF_REMET write FVALOR_ICMS_UF_REMET;
    [TColumn('VALOR_SERVICOS', 'Valor Servicos', 168, [], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorServicos: Extended  read FVALOR_SERVICOS write FVALOR_SERVICOS;
    [TColumn('BASE_CALCULO_ISSQN', 'Base Calculo Issqn', 168, [], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property BaseCalculoIssqn: Extended  read FBASE_CALCULO_ISSQN write FBASE_CALCULO_ISSQN;
    [TColumn('VALOR_ISSQN', 'Valor Issqn', 168, [], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIssqn: Extended  read FVALOR_ISSQN write FVALOR_ISSQN;
    [TColumn('VALOR_PIS_ISSQN', 'Valor Pis Issqn', 168, [], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorPisIssqn: Extended  read FVALOR_PIS_ISSQN write FVALOR_PIS_ISSQN;
    [TColumn('VALOR_COFINS_ISSQN', 'Valor Cofins Issqn', 168, [], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorCofinsIssqn: Extended  read FVALOR_COFINS_ISSQN write FVALOR_COFINS_ISSQN;
    [TColumn('DATA_PRESTACAO_SERVICO', 'Data Prestacao Servico', 80, [], False)]
    property DataPrestacaoServico: TDateTime  read FDATA_PRESTACAO_SERVICO write FDATA_PRESTACAO_SERVICO;
    [TColumn('VALOR_DEDUCAO_ISSQN', 'Valor Deducao Issqn', 168, [], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorDeducaoIssqn: Extended  read FVALOR_DEDUCAO_ISSQN write FVALOR_DEDUCAO_ISSQN;
    [TColumn('OUTRAS_RETENCOES_ISSQN', 'Outras Retencoes Issqn', 168, [], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property OutrasRetencoesIssqn: Extended  read FOUTRAS_RETENCOES_ISSQN write FOUTRAS_RETENCOES_ISSQN;
    [TColumn('DESCONTO_INCONDICIONADO_ISSQN', 'Desconto Incondicionado Issqn', 168, [], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property DescontoIncondicionadoIssqn: Extended  read FDESCONTO_INCONDICIONADO_ISSQN write FDESCONTO_INCONDICIONADO_ISSQN;
    [TColumn('DESCONTO_CONDICIONADO_ISSQN', 'Desconto Condicionado Issqn', 168, [], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property DescontoCondicionadoIssqn: Extended  read FDESCONTO_CONDICIONADO_ISSQN write FDESCONTO_CONDICIONADO_ISSQN;
    [TColumn('TOTAL_RETENCAO_ISSQN', 'Total Retencao Issqn', 168, [], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TotalRetencaoIssqn: Extended  read FTOTAL_RETENCAO_ISSQN write FTOTAL_RETENCAO_ISSQN;
    [TColumn('REGIME_ESPECIAL_TRIBUTACAO', 'Regime Especial Tributacao', 80, [], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property RegimeEspecialTributacao: Integer  read FREGIME_ESPECIAL_TRIBUTACAO write FREGIME_ESPECIAL_TRIBUTACAO;
    [TColumn('VALOR_RETIDO_PIS', 'Valor Retido Pis', 168, [], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorRetidoPis: Extended  read FVALOR_RETIDO_PIS write FVALOR_RETIDO_PIS;
    [TColumn('VALOR_RETIDO_COFINS', 'Valor Retido Cofins', 168, [], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorRetidoCofins: Extended  read FVALOR_RETIDO_COFINS write FVALOR_RETIDO_COFINS;
    [TColumn('VALOR_RETIDO_CSLL', 'Valor Retido Csll', 168, [], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorRetidoCsll: Extended  read FVALOR_RETIDO_CSLL write FVALOR_RETIDO_CSLL;
    [TColumn('BASE_CALCULO_IRRF', 'Base Calculo Irrf', 168, [], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property BaseCalculoIrrf: Extended  read FBASE_CALCULO_IRRF write FBASE_CALCULO_IRRF;
    [TColumn('VALOR_RETIDO_IRRF', 'Valor Retido Irrf', 168, [], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorRetidoIrrf: Extended  read FVALOR_RETIDO_IRRF write FVALOR_RETIDO_IRRF;
    [TColumn('BASE_CALCULO_PREVIDENCIA', 'Base Calculo Previdencia', 168, [], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property BaseCalculoPrevidencia: Extended  read FBASE_CALCULO_PREVIDENCIA write FBASE_CALCULO_PREVIDENCIA;
    [TColumn('VALOR_RETIDO_PREVIDENCIA', 'Valor Retido Previdencia', 168, [], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorRetidoPrevidencia: Extended  read FVALOR_RETIDO_PREVIDENCIA write FVALOR_RETIDO_PREVIDENCIA;
    [TColumn('COMEX_UF_EMBARQUE', 'Comex Uf Embarque', 16, [], False)]
    property ComexUfEmbarque: String  read FCOMEX_UF_EMBARQUE write FCOMEX_UF_EMBARQUE;
    [TColumn('COMEX_LOCAL_EMBARQUE', 'Comex Local Embarque', 450, [], False)]
    property ComexLocalEmbarque: String  read FCOMEX_LOCAL_EMBARQUE write FCOMEX_LOCAL_EMBARQUE;
    [TColumn('COMEX_LOCAL_DESPACHO', 'Comex Local Despacho', 450, [], False)]
    property ComexLocalDespacho: String  read FCOMEX_LOCAL_DESPACHO write FCOMEX_LOCAL_DESPACHO;
    [TColumn('COMPRA_NOTA_EMPENHO', 'Compra Nota Empenho', 176, [], False)]
    property CompraNotaEmpenho: String  read FCOMPRA_NOTA_EMPENHO write FCOMPRA_NOTA_EMPENHO;
    [TColumn('COMPRA_PEDIDO', 'Compra Pedido', 450, [], False)]
    property CompraPedido: String  read FCOMPRA_PEDIDO write FCOMPRA_PEDIDO;
    [TColumn('COMPRA_CONTRATO', 'Compra Contrato', 450, [], False)]
    property CompraContrato: String  read FCOMPRA_CONTRATO write FCOMPRA_CONTRATO;
    [TColumn('INFORMACOES_ADD_FISCO', 'Informacoes Add Fisco', 700, [], False)]
    property InformacoesAddFisco: String  read FINFORMACOES_ADD_FISCO write FINFORMACOES_ADD_FISCO;
    [TColumn('INFORMACOES_ADD_CONTRIBUINTE', 'Informacoes Add Contribuinte', 700, [], False)]
    property InformacoesAddContribuinte: String  read FINFORMACOES_ADD_CONTRIBUINTE write FINFORMACOES_ADD_CONTRIBUINTE;
    [TColumn('TIPO_EMISSAO', 'Tipo Emissao', 80, [], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property TipoEmissao: String  read FTIPO_EMISSAO write FTIPO_EMISSAO;
    [TColumn('CHAVE_ACESSO', 'Chave Acesso', 352, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftChaveAcessoNFe)]
    property ChaveAcesso: String  read FCHAVE_ACESSO write FCHAVE_ACESSO;
    [TColumn('AMBIENTE', 'Ambiente', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property Ambiente: String  read FAMBIENTE write FAMBIENTE;
    [TColumn('VALOR_TRIBUTOS', 'Valor Tributos', 168,[], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorTributos: Extended  read FVALOR_TRIBUTOS write FVALOR_TRIBUTOS;
    [TColumn('CRT', 'Regime', 168, [], False)]
    property Crt: Integer  read FCRT write FCRT;
    [TColumn('VALOR_ICMS_FCP', 'Valor Icms FCP', 168,[], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcmsFcp: Extended  read FVALOR_ICMS_FCP write FVALOR_ICMS_FCP;
    [TColumn('VALOR_ICMS_FCP_ST_RETIDO_ANTERIORMENTE', 'Valor Icms Fcp St Ret.Ant.', 168,[], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcmsFcpStRetidoAnteriormente: Extended  read FVALOR_ICMS_FCP_ST_RETIDO_ANTERIORMENTE write FVALOR_ICMS_FCP_ST_RETIDO_ANTERIORMENTE;
    [TColumn('VALOR_ICMS_FCP_ST', 'Valor Icms Fcp St', 168,[], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcmsFcpSt: Extended  read FVALOR_ICMS_FCP_ST write FVALOR_ICMS_FCP_ST;
    [TColumn('VALOR_IPI_DEVOLVIDO', 'Valor Ipi Dev.', 168,[], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIpiDevolvido: Extended  read FVALOR_IPI_DEVOLVIDO write FVALOR_IPI_DEVOLVIDO;
    [TColumn('INDICADOR_EMITENTE', 'Indicador Emitente', 168,[], False)]
    property IndicadorEmitente: String  read FINDICADOR_EMITENTE write FINDICADOR_EMITENTE;
    // simples nacional
    [TColumn('VALOR_CREDITO_ICMS_SIMPLES_NACIONAL', 'Simples Nacional', 168, [], False)] // este campo contem o saldo do valor que pode ser utilizado para devoluçao
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorCreditoIcmsSimplesNacional: Extended  read FVALOR_CREDITO_ICMS_SIMPLES_NACIONAL write FVALOR_CREDITO_ICMS_SIMPLES_NACIONAL;
  end;

implementation

constructor TNfeCabecalhoVO.Create;
begin
  inherited;
end;

destructor TNfeCabecalhoVO.Destroy;
begin
 inherited;
end;


initialization
  Classes.RegisterClass(TNfeCabecalhoVO);

finalization
  Classes.UnRegisterClass(TNfeCabecalhoVO);

end.

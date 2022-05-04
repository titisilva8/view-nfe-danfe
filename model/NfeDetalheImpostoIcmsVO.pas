
unit NfeDetalheImpostoIcmsVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('NFE_DETALHE_IMPOSTO_ICMS')]
  TNfeDetalheImpostoIcmsVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_DETALHE: Integer;
    FORIGEM_MERCADORIA: String;
    FCST_ICMS: String;
    FCSOSN: String;
    FMODALIDADE_BC_ICMS: String;
    FTAXA_REDUCAO_BC_ICMS: Extended;
    FBASE_CALCULO_ICMS: Extended;
    FALIQUOTA_ICMS: Extended;
    FVALOR_ICMS: Extended;
    FVALOR_ICMS_OPERACAO: Extended;
    FPERCENTUAL_DIFERIMENTO: Extended;
    FVALOR_ICMS_DIFERIDO: Extended;
    FMOTIVO_DESONERACAO_ICMS: String;
    FVALOR_ICMS_DESONERADO: Extended;
    FMODALIDADE_BC_ICMS_ST: String;
    FPERCENTUAL_MVA_ICMS_ST: Extended;
    FPERCENTUAL_REDUCAO_BC_ICMS_ST: Extended;
    FVALOR_BASE_CALCULO_ICMS_ST: Extended;
    FALIQUOTA_ICMS_ST: Extended;
    FVALOR_ICMS_ST: Extended;
    FVALOR_BC_ICMS_ST_RETIDO: Extended;
    FVALOR_ICMS_ST_RETIDO: Extended;
    FVALOR_BC_ICMS_ST_DESTINO: Extended;
    FVALOR_ICMS_ST_DESTINO: Extended;
    FALIQUOTA_CREDITO_ICMS_SN: Extended;
    FVALOR_CREDITO_ICMS_SN: Extended;
    FPERCENTUAL_BC_OPERACAO_PROPRIA: Extended;
    FBASE_CALCULO_ICMS_FCP:Extended;
    FALIQUOTA_ICMS_FCP:Extended;
    FVALOR_ICMS_FCP:Extended;
    FBASE_CALCULO_ICMS_FCP_ST:Extended;
    FALIQUOTA_ICMS_FCP_ST:Extended;
    FVALOR_ICMS_FCP_ST:Extended;
    FBASE_CALCULO_ICMS_FCP_ST_RETIDO_ANTERIORMENTE:Extended;
    FALIQUOTA_ICMS_FCP_ST_RETIDO_ANTERIORMENTE:Extended;
    FVALOR_ICMS_FCP_ST_RETIDO_ANTERIORMENTE:Extended;
    FALIQUOTA_ST_SUPORTADA_CONSUMIDOR_FINAL:Extended;
    FVALOR_ICMS_SUBSTITUTO: Extended;
    FUF_ST: String;

  public
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_DETALHE', 'Id Nfe Detalhe', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeDetalhe: Integer  read FID_NFE_DETALHE write FID_NFE_DETALHE;
    [TColumn('ORIGEM_MERCADORIA', 'Origem Mercadoria', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property OrigemMercadoria: String  read FORIGEM_MERCADORIA write FORIGEM_MERCADORIA;
    [TColumn('CST_ICMS', 'Cst Icms', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property CstIcms: String  read FCST_ICMS write FCST_ICMS;
    [TColumn('CSOSN', 'Csosn', 24, [ldGrid, ldLookup, ldCombobox], False)]
    property Csosn: String  read FCSOSN write FCSOSN;
    [TColumn('MODALIDADE_BC_ICMS', 'Modalidade Bc Icms', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property ModalidadeBcIcms: String  read FMODALIDADE_BC_ICMS write FMODALIDADE_BC_ICMS;
    [TColumn('TAXA_REDUCAO_BC_ICMS', 'Taxa Reducao Bc Icms', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador4, taRightJustify)]
    property TaxaReducaoBcIcms: Extended  read FTAXA_REDUCAO_BC_ICMS write FTAXA_REDUCAO_BC_ICMS;
    [TColumn('BASE_CALCULO_ICMS', 'Base Calculo Icms', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property BaseCalculoIcms: Extended  read FBASE_CALCULO_ICMS write FBASE_CALCULO_ICMS;
    [TColumn('ALIQUOTA_ICMS', 'Aliquota Icms', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador4, taRightJustify)]
    property AliquotaIcms: Extended  read FALIQUOTA_ICMS write FALIQUOTA_ICMS;
    [TColumn('VALOR_ICMS', 'Valor Icms', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcms: Extended  read FVALOR_ICMS write FVALOR_ICMS;
    [TColumn('VALOR_ICMS_OPERACAO', 'Valor Icms Operacao', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcmsOperacao: Extended  read FVALOR_ICMS_OPERACAO write FVALOR_ICMS_OPERACAO;
    [TColumn('PERCENTUAL_DIFERIMENTO', 'Percentual Diferimento', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador4, taRightJustify)]
    property PercentualDiferimento: Extended  read FPERCENTUAL_DIFERIMENTO write FPERCENTUAL_DIFERIMENTO;
    [TColumn('VALOR_ICMS_DIFERIDO', 'Valor Icms Diferido', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcmsDiferido: Extended  read FVALOR_ICMS_DIFERIDO write FVALOR_ICMS_DIFERIDO;
    [TColumn('MOTIVO_DESONERACAO_ICMS', 'Motivo Desoneracao Icms', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property MotivoDesoneracaoIcms: String  read FMOTIVO_DESONERACAO_ICMS write FMOTIVO_DESONERACAO_ICMS;
    [TColumn('VALOR_ICMS_DESONERADO', 'Valor Icms Desonerado', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcmsDesonerado: Extended  read FVALOR_ICMS_DESONERADO write FVALOR_ICMS_DESONERADO;
    [TColumn('MODALIDADE_BC_ICMS_ST', 'Modalidade Bc Icms St', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property ModalidadeBcIcmsSt: String  read FMODALIDADE_BC_ICMS_ST write FMODALIDADE_BC_ICMS_ST;
    [TColumn('PERCENTUAL_MVA_ICMS_ST', 'Percentual Mva Icms St', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador4, taRightJustify)]
    property PercentualMvaIcmsSt: Extended  read FPERCENTUAL_MVA_ICMS_ST write FPERCENTUAL_MVA_ICMS_ST;
    [TColumn('PERCENTUAL_REDUCAO_BC_ICMS_ST', 'Percentual Reducao Bc Icms St', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador4, taRightJustify)]
    property PercentualReducaoBcIcmsSt: Extended  read FPERCENTUAL_REDUCAO_BC_ICMS_ST write FPERCENTUAL_REDUCAO_BC_ICMS_ST;
    [TColumn('VALOR_BASE_CALCULO_ICMS_ST', 'Valor Base Calculo Icms St', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorBaseCalculoIcmsSt: Extended  read FVALOR_BASE_CALCULO_ICMS_ST write FVALOR_BASE_CALCULO_ICMS_ST;
    [TColumn('ALIQUOTA_ICMS_ST', 'Aliquota Icms St', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador4, taRightJustify)]
    property AliquotaIcmsSt: Extended  read FALIQUOTA_ICMS_ST write FALIQUOTA_ICMS_ST;
    [TColumn('VALOR_ICMS_ST', 'Valor Icms St', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcmsSt: Extended  read FVALOR_ICMS_ST write FVALOR_ICMS_ST;
    [TColumn('VALOR_BC_ICMS_ST_RETIDO', 'Valor Bc Icms St Retido', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorBcIcmsStRetido: Extended  read FVALOR_BC_ICMS_ST_RETIDO write FVALOR_BC_ICMS_ST_RETIDO;
    [TColumn('VALOR_ICMS_ST_RETIDO', 'Valor Icms St Retido', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcmsStRetido: Extended  read FVALOR_ICMS_ST_RETIDO write FVALOR_ICMS_ST_RETIDO;
    [TColumn('VALOR_BC_ICMS_ST_DESTINO', 'Valor Bc Icms St Destino', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorBcIcmsStDestino: Extended  read FVALOR_BC_ICMS_ST_DESTINO write FVALOR_BC_ICMS_ST_DESTINO;
    [TColumn('VALOR_ICMS_ST_DESTINO', 'Valor Icms St Destino', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcmsStDestino: Extended  read FVALOR_ICMS_ST_DESTINO write FVALOR_ICMS_ST_DESTINO;
    [TColumn('ALIQUOTA_CREDITO_ICMS_SN', 'Aliquota Credito Icms Sn', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaCreditoIcmsSn: Extended  read FALIQUOTA_CREDITO_ICMS_SN write FALIQUOTA_CREDITO_ICMS_SN;
    [TColumn('VALOR_CREDITO_ICMS_SN', 'Valor Credito Icms Sn', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorCreditoIcmsSn: Extended  read FVALOR_CREDITO_ICMS_SN write FVALOR_CREDITO_ICMS_SN;
    [TColumn('PERCENTUAL_BC_OPERACAO_PROPRIA', 'Percentual Bc Operacao Propria', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador4, taRightJustify)]
    property PercentualBcOperacaoPropria: Extended  read FPERCENTUAL_BC_OPERACAO_PROPRIA write FPERCENTUAL_BC_OPERACAO_PROPRIA;
    [TColumn('UF_ST', 'Uf St', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property UfSt: String  read FUF_ST write FUF_ST;
    [TColumn('BASE_CALCULO_ICMS_FCP', 'Base Calculo FCP',120, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property BaseCalculoIcmsFcp: Extended  read FBASE_CALCULO_ICMS_FCP write FBASE_CALCULO_ICMS_FCP;
    [TColumn('ALIQUOTA_ICMS_FCP', 'Aliquota FCP',120, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador4, taRightJustify)]
    property AliquotaIcmsFcp: Extended  read FALIQUOTA_ICMS_FCP write FALIQUOTA_ICMS_FCP;
    [TColumn('VALOR_ICMS_FCP', 'Valor FCP',120, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcmsFcp: Extended  read FVALOR_ICMS_FCP write FVALOR_ICMS_FCP;
    [TColumn('BASE_CALCULO_ICMS_FCP_ST', 'Base Calculo FCP ST',120, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property BaseCalculoIcmsFcpSt: Extended  read FBASE_CALCULO_ICMS_FCP_ST write FBASE_CALCULO_ICMS_FCP_ST;
    [TColumn('ALIQUOTA_ICMS_FCP_ST', 'Aliquota FCP ST',120, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador4, taRightJustify)]
    property AliquotaIcmsFcpSt: Extended  read FALIQUOTA_ICMS_FCP_ST write FALIQUOTA_ICMS_FCP_ST;
    [TColumn('VALOR_ICMS_FCP_ST', 'Valor FCP ST',120, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcmsFcpSt: Extended  read FVALOR_ICMS_FCP_ST write FVALOR_ICMS_FCP_ST;
    [TColumn('BASE_CALCULO_ICMS_FCP_ST_RETIDO_ANTERIORMENTE', 'Base Calculo FCP ST Ret.Ant.',120, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property BaseCalculoIcmsFcpStRetidoAnteriormente: Extended  read FBASE_CALCULO_ICMS_FCP_ST_RETIDO_ANTERIORMENTE write FBASE_CALCULO_ICMS_FCP_ST_RETIDO_ANTERIORMENTE;
    [TColumn('ALIQUOTA_ICMS_FCP_ST_RETIDO_ANTERIORMENTE', 'Aliquota FCP ST Retido Ant.',120, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador4, taRightJustify)]
    property AliquotaIcmsFcpStRetidoAnteriormente: Extended  read FALIQUOTA_ICMS_FCP_ST_RETIDO_ANTERIORMENTE write FALIQUOTA_ICMS_FCP_ST_RETIDO_ANTERIORMENTE;
    [TColumn('VALOR_ICMS_FCP_ST_RETIDO_ANTERIORMENTE', 'Valor FCP ST Ret.Ant.',120, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcmsFcpStRetidoAnteriormente: Extended  read FVALOR_ICMS_FCP_ST_RETIDO_ANTERIORMENTE write FVALOR_ICMS_FCP_ST_RETIDO_ANTERIORMENTE;
    [TColumn('ALIQUOTA_ST_SUPORTADA_CONSUMIDOR_FINAL', 'Valor FCP ST Ret.Ant.',120, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaStSuportadaConsumidorFinal: Extended  read FALIQUOTA_ST_SUPORTADA_CONSUMIDOR_FINAL write FALIQUOTA_ST_SUPORTADA_CONSUMIDOR_FINAL;
    [TColumn('VALOR_ICMS_SUBSTITUTO', 'Valor Icms Substituto',120, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcmsSubstituto: Extended  read FVALOR_ICMS_SUBSTITUTO write FVALOR_ICMS_SUBSTITUTO;


  end;

implementation


initialization
  Classes.RegisterClass(TNfeDetalheImpostoIcmsVO);

finalization
  Classes.UnRegisterClass(TNfeDetalheImpostoIcmsVO);

end.

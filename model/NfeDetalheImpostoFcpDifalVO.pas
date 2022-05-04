unit NfeDetalheImpostoFcpDifalVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('NFE_DETALHE_IMPOSTO_FCP_DIFAL')]
  TNfeDetalheImpostoFcpDifalVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_DETALHE: Integer;
    FVALOR_BC_UF_DESTINO: Extended;
    FALIQUOTA_FCP_UF_DESTINO: Extended;
    FALIQUOTA_ICMS_INTERNA_UF_DESTINO: Extended;
    FALIQUOTA_ICMS_INTERESTADUAL: Extended;
    FPERCENTUAL_PARTILHA_ICMS: Extended;
    FVALOR_ICMS_FCP: Extended;
    FVALOR_ICMS_UF_DESTINO: Extended;
    FVALOR_ICMS_UF_REMETENTE: Extended;
    FBASE_CALCULO_FCP_UF_DESTINATARIO: Extended;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_DETALHE', 'Id Nfe Detalhe', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeDetalhe: Integer  read FID_NFE_DETALHE write FID_NFE_DETALHE;
    [TColumn('VALOR_BC_UF_DESTINO', 'Valor Bc Uf Destino', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorBcUfDestino: Extended  read FVALOR_BC_UF_DESTINO write FVALOR_BC_UF_DESTINO;
    [TColumn('ALIQUOTA_FCP_UF_DESTINO', 'Aliquota Fcp Uf Destino', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaFcpUfDestino: Extended  read FALIQUOTA_FCP_UF_DESTINO write FALIQUOTA_FCP_UF_DESTINO;
    [TColumn('ALIQUOTA_ICMS_INTERNA_UF_DESTINO', 'Aliquota Icms Interna Uf Destino', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaIcmsInternaUfDestino: Extended  read FALIQUOTA_ICMS_INTERNA_UF_DESTINO write FALIQUOTA_ICMS_INTERNA_UF_DESTINO;
    [TColumn('ALIQUOTA_ICMS_INTERESTADUAL', 'Aliquota Icms Interestadual', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaIcmsInterestadual: Extended  read FALIQUOTA_ICMS_INTERESTADUAL write FALIQUOTA_ICMS_INTERESTADUAL;
    [TColumn('PERCENTUAL_PARTILHA_ICMS', 'Percentual Partilha Icms', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PercentualPartilhaIcms: Extended  read FPERCENTUAL_PARTILHA_ICMS write FPERCENTUAL_PARTILHA_ICMS;
    [TColumn('VALOR_ICMS_FCP', 'Valor Icms Fcp', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcmsFcp: Extended  read FVALOR_ICMS_FCP write FVALOR_ICMS_FCP;
    [TColumn('VALOR_ICMS_UF_DESTINO', 'Valor Icms Uf Destino', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcmsUfDestino: Extended  read FVALOR_ICMS_UF_DESTINO write FVALOR_ICMS_UF_DESTINO;
    [TColumn('VALOR_ICMS_UF_REMETENTE', 'Valor Icms Uf Remetente', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcmsUfRemetente: Extended  read FVALOR_ICMS_UF_REMETENTE write FVALOR_ICMS_UF_REMETENTE;
    [TColumn('BASE_CALCULO_FCP_UF_DESTINATARIO', 'Valor Bc Uf Destino', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property BaseCalculoFcpUfDestinatario: Extended  read FBASE_CALCULO_FCP_UF_DESTINATARIO write FBASE_CALCULO_FCP_UF_DESTINATARIO;

  end;

implementation


initialization
  Classes.RegisterClass(TNfeDetalheImpostoFcpDifalVO);

finalization
  Classes.UnRegisterClass(TNfeDetalheImpostoFcpDifalVO);

end.

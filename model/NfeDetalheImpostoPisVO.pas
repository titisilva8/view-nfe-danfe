unit NfeDetalheImpostoPisVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('NFE_DETALHE_IMPOSTO_PIS')]
  TNfeDetalheImpostoPisVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_DETALHE: Integer;
    FCST_PIS: String;
    FQUANTIDADE_VENDIDA: Extended;
    FBASE_CALCULO_PIS: Extended;
    FALIQUOTA_PIS_PERCENTUAL: Extended;
    FALIQUOTA_PIS_REAIS: Extended;
    FVALOR_PIS: Extended;
    FQUANTIDADE_VENDIDA_ST: Extended;
    FBASE_CALCULO_PIS_ST: Extended;
    FALIQUOTA_PIS_PERCENTUAL_ST: Extended;
    FALIQUOTA_PIS_REAIS_ST: Extended;
    FVALOR_PIS_ST: Extended;
  public
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_DETALHE', 'Id Nfe Detalhe', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeDetalhe: Integer  read FID_NFE_DETALHE write FID_NFE_DETALHE;
    [TColumn('CST_PIS', 'Cst Pis', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property CstPis: String  read FCST_PIS write FCST_PIS;
    [TColumn('QUANTIDADE_VENDIDA', 'Quantidade Vendida', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property QuantidadeVendida: Extended  read FQUANTIDADE_VENDIDA write FQUANTIDADE_VENDIDA;
    [TColumn('BASE_CALCULO_PIS', 'Valor Base Calculo Pis', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property BaseCalculoPis: Extended  read FBASE_CALCULO_PIS write FBASE_CALCULO_PIS;
    [TColumn('ALIQUOTA_PIS_PERCENTUAL', 'Aliquota Pis Percentual', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaPisPercentual: Extended  read FALIQUOTA_PIS_PERCENTUAL write FALIQUOTA_PIS_PERCENTUAL;
    [TColumn('ALIQUOTA_PIS_REAIS', 'Aliquota Pis Reais', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaPisReais: Extended  read FALIQUOTA_PIS_REAIS write FALIQUOTA_PIS_REAIS;
    [TColumn('VALOR_PIS', 'Valor Pis', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorPis: Extended  read FVALOR_PIS write FVALOR_PIS;
    [TColumn('QUANTIDADE_VENDIDA_ST', 'Quantidade Vendida St', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property QuantidadeVendidaSt: Extended  read FQUANTIDADE_VENDIDA_ST write FQUANTIDADE_VENDIDA_ST;
    [TColumn('BASE_CALCULO_PIS_ST', 'Valor Base Calculo Pis St', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property BaseCalculoPisSt: Extended  read FBASE_CALCULO_PIS_ST write FBASE_CALCULO_PIS_ST;
    [TColumn('ALIQUOTA_PIS_PERCENTUAL_ST', 'Aliquota Pis Percentual St', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaPisPercentualSt: Extended  read FALIQUOTA_PIS_PERCENTUAL_ST write FALIQUOTA_PIS_PERCENTUAL_ST;
    [TColumn('ALIQUOTA_PIS_REAIS_ST', 'Aliquota Pis Reais St', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaPisReaisSt: Extended  read FALIQUOTA_PIS_REAIS_ST write FALIQUOTA_PIS_REAIS_ST;
    [TColumn('VALOR_PIS_ST', 'Valor Pis St', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorPisSt: Extended  read FVALOR_PIS_ST write FVALOR_PIS_ST;
  end;

implementation


initialization
  Classes.RegisterClass(TNfeDetalheImpostoPisVO);

finalization
  Classes.UnRegisterClass(TNfeDetalheImpostoPisVO);

end.

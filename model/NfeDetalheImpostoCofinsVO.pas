unit NfeDetalheImpostoCofinsVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('NFE_DETALHE_IMPOSTO_COFINS')]
  TNfeDetalheImpostoCofinsVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_DETALHE: Integer;
    FCST_COFINS: String;
    FQUANTIDADE_VENDIDA: Extended;
    FBASE_CALCULO_COFINS: Extended;
    FALIQUOTA_COFINS_PERCENTUAL: Extended;
    FALIQUOTA_COFINS_REAIS: Extended;
    FVALOR_COFINS: Extended;
    FQUANTIDADE_VENDIDA_ST: Extended;
    FBASE_CALCULO_COFINS_ST: Extended;
    FALIQUOTA_COFINS_PERCENTUAL_ST: Extended;
    FALIQUOTA_COFINS_REAIS_ST: Extended;
    FVALOR_COFINS_ST: Extended;
  public
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_DETALHE', 'Id Nfe Detalhe', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeDetalhe: Integer  read FID_NFE_DETALHE write FID_NFE_DETALHE;
    [TColumn('CST_COFINS', 'Cst Cofins', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property CstCofins: String  read FCST_COFINS write FCST_COFINS;
    [TColumn('QUANTIDADE_VENDIDA', 'Quantidade Vendida', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property QuantidadeVendida: Extended  read FQUANTIDADE_VENDIDA write FQUANTIDADE_VENDIDA;
    [TColumn('BASE_CALCULO_COFINS', 'Base Calculo Cofins', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property BaseCalculoCofins: Extended  read FBASE_CALCULO_COFINS write FBASE_CALCULO_COFINS;
    [TColumn('ALIQUOTA_COFINS_PERCENTUAL', 'Aliquota Cofins Percentual', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaCofinsPercentual: Extended  read FALIQUOTA_COFINS_PERCENTUAL write FALIQUOTA_COFINS_PERCENTUAL;
    [TColumn('ALIQUOTA_COFINS_REAIS', 'Aliquota Cofins Reais', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaCofinsReais: Extended  read FALIQUOTA_COFINS_REAIS write FALIQUOTA_COFINS_REAIS;
    [TColumn('VALOR_COFINS', 'Valor Cofins', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorCofins: Extended  read FVALOR_COFINS write FVALOR_COFINS;
    [TColumn('QUANTIDADE_VENDIDA_ST', 'Quantidade Vendida St', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property QuantidadeVendidaSt: Extended  read FQUANTIDADE_VENDIDA_ST write FQUANTIDADE_VENDIDA_ST;
    [TColumn('BASE_CALCULO_COFINS_ST', 'Base Calculo Cofins St', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property BaseCalculoCofinsSt: Extended  read FBASE_CALCULO_COFINS_ST write FBASE_CALCULO_COFINS_ST;
    [TColumn('ALIQUOTA_COFINS_PERCENTUAL_ST', 'Aliquota Cofins Percentual St', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaCofinsPercentualSt: Extended  read FALIQUOTA_COFINS_PERCENTUAL_ST write FALIQUOTA_COFINS_PERCENTUAL_ST;
    [TColumn('ALIQUOTA_COFINS_REAIS_ST', 'Aliquota Cofins Reais St', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaCofinsReaisSt: Extended  read FALIQUOTA_COFINS_REAIS_ST write FALIQUOTA_COFINS_REAIS_ST;
    [TColumn('VALOR_COFINS_ST', 'Valor Cofins St', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorCofinsSt: Extended  read FVALOR_COFINS_ST write FVALOR_COFINS_ST;
  end;

implementation


initialization
  Classes.RegisterClass(TNfeDetalheImpostoCofinsVO);

finalization
  Classes.UnRegisterClass(TNfeDetalheImpostoCofinsVO);

end.

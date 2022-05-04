unit NfeDetEspecificoCombustivelVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('NFE_DET_ESPECIFICO_COMBUSTIVEL')]
  TNfeDetEspecificoCombustivelVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_DETALHE: Integer;
    FCODIGO_ANP: Integer;
    FPERCENTUAL_GAS_NATURAL: Extended;
    FCODIF: String;
    FQUANTIDADE_TEMP_AMBIENTE: Extended;
    FUF_CONSUMO: String;
    FBASE_CALCULO_CIDE: Extended;
    FALIQUOTA_CIDE: Extended;
    FVALOR_CIDE: Extended;
  public
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_DETALHE', 'Id Nfe Detalhe', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeDetalhe: Integer  read FID_NFE_DETALHE write FID_NFE_DETALHE;
    [TColumn('CODIGO_ANP', 'Codigo Anp', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property CodigoAnp: Integer  read FCODIGO_ANP write FCODIGO_ANP;
    [TColumn('PERCENTUAL_GAS_NATURAL', 'Percentual Gas Natural', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PercentualGasNatural: Extended  read FPERCENTUAL_GAS_NATURAL write FPERCENTUAL_GAS_NATURAL;
    [TColumn('CODIF', 'Codif', 168, [ldGrid, ldLookup, ldCombobox], False)]
    property Codif: String  read FCODIF write FCODIF;
    [TColumn('QUANTIDADE_TEMP_AMBIENTE', 'Quantidade Temp Ambiente', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property QuantidadeTempAmbiente: Extended  read FQUANTIDADE_TEMP_AMBIENTE write FQUANTIDADE_TEMP_AMBIENTE;
    [TColumn('UF_CONSUMO', 'Uf Consumo', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property UfConsumo: String  read FUF_CONSUMO write FUF_CONSUMO;
    [TColumn('BASE_CALCULO_CIDE', 'Base Calculo Cide', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property BaseCalculoCide: Extended  read FBASE_CALCULO_CIDE write FBASE_CALCULO_CIDE;
    [TColumn('ALIQUOTA_CIDE', 'Aliquota Cide', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaCide: Extended  read FALIQUOTA_CIDE write FALIQUOTA_CIDE;
    [TColumn('VALOR_CIDE', 'Valor Cide', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorCide: Extended  read FVALOR_CIDE write FVALOR_CIDE;
  end;

implementation


initialization
  Classes.RegisterClass(TNfeDetEspecificoCombustivelVO);

finalization
  Classes.UnRegisterClass(TNfeDetEspecificoCombustivelVO);

end.

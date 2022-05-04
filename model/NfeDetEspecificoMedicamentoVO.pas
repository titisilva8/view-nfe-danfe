unit NfeDetEspecificoMedicamentoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('NFE_DET_ESPECIFICO_MEDICAMENTO')]
  TNfeDetEspecificoMedicamentoVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_DETALHE: Integer;
    FNUMERO_LOTE: String;
    FQUANTIDADE_LOTE: Extended;
    FDATA_FABRICACAO: TDateTime;
    FDATA_VALIDADE: TDateTime;
    FPRECO_MAXIMO_CONSUMIDOR: Extended;
  public
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_DETALHE', 'Id Nfe Detalhe', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeDetalhe: Integer  read FID_NFE_DETALHE write FID_NFE_DETALHE;
    [TColumn('NUMERO_LOTE', 'Numero Lote', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property NumeroLote: String  read FNUMERO_LOTE write FNUMERO_LOTE;
    [TColumn('QUANTIDADE_LOTE', 'Quantidade Lote', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property QuantidadeLote: Extended  read FQUANTIDADE_LOTE write FQUANTIDADE_LOTE;
    [TColumn('DATA_FABRICACAO', 'Data Fabricacao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataFabricacao: TDateTime  read FDATA_FABRICACAO write FDATA_FABRICACAO;
    [TColumn('DATA_VALIDADE', 'Data Validade', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataValidade: TDateTime  read FDATA_VALIDADE write FDATA_VALIDADE;
    [TColumn('PRECO_MAXIMO_CONSUMIDOR', 'Preco Maximo Consumidor', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PrecoMaximoConsumidor: Extended  read FPRECO_MAXIMO_CONSUMIDOR write FPRECO_MAXIMO_CONSUMIDOR;

  end;

implementation


initialization
  Classes.RegisterClass(TNfeDetEspecificoMedicamentoVO);

finalization
  Classes.UnRegisterClass(TNfeDetEspecificoMedicamentoVO);

end.

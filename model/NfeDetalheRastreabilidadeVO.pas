unit NfeDetalheRastreabilidadeVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('NFE_DETALHE_RASTREABILIDADE')]
  TNfeDetalheRastreabilidadeVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_DETALHE: Integer;
    FNUMERO_LOTE: String;
    FQUANTIDADE_LOTE: Extended;
    FDATA_FABRICACAO: TDateTime;
    FDATA_VALIDADE: TDateTime;
    FCODIGO_AGREGACAO: String;

  public
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_DETALHE', 'Id Nfe Detalhe', 80, [], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeDetalhe: Integer  read FID_NFE_DETALHE write FID_NFE_DETALHE;
    [TColumn('NUMERO_LOTE', 'Numero Lote', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property NumeroLote: String  read FNUMERO_LOTE write FNUMERO_LOTE;
    [TColumn('CODIGO_AGREGACAO', 'Codigo Agregacao', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property CodigoAgregacao: String  read FCODIGO_AGREGACAO write FCODIGO_AGREGACAO;
    [TColumn('DATA_FABRICACAO', 'Data Fabricacao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataFabricacao: TDateTime  read FDATA_FABRICACAO write FDATA_FABRICACAO;
    [TColumn('DATA_VALIDADE', 'Data Validade', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataValidade: TDateTime  read FDATA_VALIDADE write FDATA_VALIDADE;
    [TColumn('QUANTIDADE_LOTE', 'Quantidade Lote', 152, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property QuantidadeLote: Extended  read FQUANTIDADE_LOTE write FQUANTIDADE_LOTE;
  end;

implementation


initialization
  Classes.RegisterClass(TNfeDetalheRastreabilidadeVO);

finalization
  Classes.UnRegisterClass(TNfeDetalheRastreabilidadeVO);

end.

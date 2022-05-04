unit NfeDuplicataVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('NFE_DUPLICATA')]
  TNfeDuplicataVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_CABECALHO: Integer;
    FNUMERO: String;
    FDATA_VENCIMENTO: TDateTime;
    FVALOR: Extended;
  public
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_CABECALHO', 'Id Nfe Cabecalho', 80, [], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeCabecalho: Integer  read FID_NFE_CABECALHO write FID_NFE_CABECALHO;
    [TColumn('NUMERO', 'Numero', 150, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftNumeroDuplicata, taRightJustify)]
    property Numero: String  read FNUMERO write FNUMERO;
    [TColumn('DATA_VENCIMENTO', 'Data Vencimento', 120, [ldGrid, ldLookup, ldCombobox], False)]
    property DataVencimento: TDateTime  read FDATA_VENCIMENTO write FDATA_VENCIMENTO;
    [TColumn('VALOR', 'Valor', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Valor: Extended  read FVALOR write FVALOR;
  end;

implementation


initialization
  Classes.RegisterClass(TNfeDuplicataVO);

finalization
  Classes.UnRegisterClass(TNfeDuplicataVO);

end.

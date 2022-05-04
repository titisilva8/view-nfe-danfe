unit NfeTransporteVolumeLacreVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('NFE_TRANSPORTE_VOLUME_LACRE')]
  TNfeTransporteVolumeLacreVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_TRANSPORTE_VOLUME: Integer;
    FNUMERO: String;
  public
    [TId('ID',[])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_TRANSPORTE_VOLUME', 'Id Nfe Transporte Volume', 80, [], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeTransporteVolume: Integer  read FID_NFE_TRANSPORTE_VOLUME write FID_NFE_TRANSPORTE_VOLUME;
    [TColumn('NUMERO', 'Numero', 300, [ldGrid, ldLookup, ldCombobox], False)]
    property Numero: String  read FNUMERO write FNUMERO;
  end;

implementation


initialization
  Classes.RegisterClass(TNfeTransporteVolumeLacreVO);

finalization
  Classes.UnRegisterClass(TNfeTransporteVolumeLacreVO);

end.

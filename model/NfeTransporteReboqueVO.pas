unit NfeTransporteReboqueVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('NFE_TRANSPORTE_REBOQUE')]
  TNfeTransporteReboqueVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_TRANSPORTE: Integer;
    FPLACA: String;
    FUF: String;
    FRNTC: String;
  public
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_TRANSPORTE', 'Id Nfe Transporte', 80, [], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeTransporte: Integer  read FID_NFE_TRANSPORTE write FID_NFE_TRANSPORTE;
    [TColumn('PLACA', 'Placa', 64, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftPlaca)]
    property Placa: String  read FPLACA write FPLACA;
    [TColumn('UF', 'UF', 30, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftUF)]
    property Uf: String  read FUF write FUF;
    [TColumn('RNTC', 'RNTC', 160, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftRntc)]
    property Rntc: String  read FRNTC write FRNTC;

  end;

implementation


initialization
  Classes.RegisterClass(TNfeTransporteReboqueVO);

finalization
  Classes.UnRegisterClass(TNfeTransporteReboqueVO);

end.

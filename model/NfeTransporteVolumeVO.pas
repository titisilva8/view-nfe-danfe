
unit NfeTransporteVolumeVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils,

  NfeTransporteVolumeLacreVO;

type
  [TEntity]
  [TTable('NFE_TRANSPORTE_VOLUME')]
  TNfeTransporteVolumeVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_TRANSPORTE: Integer;
    FQUANTIDADE: Integer;
    FESPECIE: String;
    FMARCA: String;
    FNUMERACAO: String;
    FPESO_LIQUIDO: Extended;
    FPESO_BRUTO: Extended;

  public 
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID',[])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_TRANSPORTE', 'Id Nfe Transporte', 80, [], False)]
    [TFormatter(taCenter)]
    property IdNfeTransporte: Integer  read FID_NFE_TRANSPORTE write FID_NFE_TRANSPORTE;
    [TColumn('QUANTIDADE', 'Quantidade',120, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(taCenter)]
    property Quantidade: Integer  read FQUANTIDADE write FQUANTIDADE;
    [TColumn('ESPECIE', 'Especie', 300, [ldGrid, ldLookup, ldCombobox], False)]
    property Especie: String  read FESPECIE write FESPECIE;
    [TColumn('MARCA', 'Marca', 200, [ldGrid, ldLookup, ldCombobox], False)]
    property Marca: String  read FMARCA write FMARCA;
    [TColumn('NUMERACAO', 'Numeracao', 300, [ldGrid, ldLookup, ldCombobox], False)]
    property Numeracao: String  read FNUMERACAO write FNUMERACAO;
    [TColumn('PESO_LIQUIDO', 'Peso Liquido', 120, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PesoLiquido: Extended  read FPESO_LIQUIDO write FPESO_LIQUIDO;
    [TColumn('PESO_BRUTO', 'Peso Bruto', 120, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PesoBruto: Extended  read FPESO_BRUTO write FPESO_BRUTO;
  end;

implementation

constructor TNfeTransporteVolumeVO.Create;
begin
  inherited;
end;

destructor TNfeTransporteVolumeVO.Destroy;
begin
  inherited;
end;


initialization
  Classes.RegisterClass(TNfeTransporteVolumeVO);

finalization
  Classes.UnRegisterClass(TNfeTransporteVolumeVO);

end.

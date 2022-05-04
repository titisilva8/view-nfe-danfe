
unit NfeNfReferenciadaVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils,DB;

type
  [TEntity]
  [TTable('NFE_NF_REFERENCIADA')]
  TNfeNfReferenciadaVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_CABECALHO: Integer;
    FCHAVEACESSO: String;
    FCODIGO_UF: Integer;
    FANO_MES: String;
    FCNPJ: String;
    FMODELO: String;
    FSERIE: String;
    FNUMERO_NF: String;

  public
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID', [])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_CABECALHO', 'Id Nfe Cabecalho', 80, [], False)]
    [TFormatter(taCenter)]
    property IdNfeCabecalho: Integer  read FID_NFE_CABECALHO write FID_NFE_CABECALHO;
    [TColumn('ANO_MES', 'Ano/Mês', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftanomes2, taLeftJustify)]
    property AnoMes: String  read FANO_MES write FANO_MES;
    [TColumn('CNPJ', 'Cnpj', 130, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftCnpj, taLeftJustify)]
    property Cnpj: String  read FCNPJ write FCNPJ;
    [TColumn('MODELO', 'Modelo', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property Modelo: String  read FMODELO write FMODELO;
    [TColumn('SERIE', 'Serie', 80, [ldGrid, ldLookup, ldCombobox], False)]
    //[TFormatter(ftSerie, taCenter)]
    property Serie: String  read FSERIE write FSERIE;
    [TColumn('NUMERO_NF', 'Numero Nf', 100, [ldGrid, ldLookup, ldCombobox], False)]
    //[TFormatter(ftZerosAEsquerda9, taCenter)]
    property NumeroNf: String  read FNUMERO_NF write FNUMERO_NF;
    [TColumn('CODIGO_UF', 'Codigo Uf', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter( taCenter)]
    property CodigoUf: Integer  read FCODIGO_UF write FCODIGO_UF;

  end;

implementation
constructor TNfeNfReferenciadaVO.Create;
begin
  inherited;
end;

destructor TNfeNfReferenciadaVO.Destroy;
begin
  inherited;
end;

initialization
  Classes.RegisterClass(TNfeNfReferenciadaVO);

finalization
  Classes.UnRegisterClass(TNfeNfReferenciadaVO);

end.

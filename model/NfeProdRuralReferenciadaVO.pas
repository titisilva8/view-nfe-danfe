unit NfeProdRuralReferenciadaVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils,DB;

type
  [TEntity]
  [TTable('NFE_PROD_RURAL_REFERENCIADA')]
  TNfeProdRuralReferenciadaVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_CABECALHO: Integer;
    FANO_MES: String;
    FCNPJ: String;
    FCPF: String;
    FINSCRICAO_ESTADUAL: String;
    FMODELO: String;
    FSERIE: String;
    FNUMERO_NF: Integer;
    FCODIGO_UF: Integer;

  public

    constructor Create; override;
    destructor Destroy; override;
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_CABECALHO', 'Id Nfe Cabecalho', 80, [], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeCabecalho: Integer  read FID_NFE_CABECALHO write FID_NFE_CABECALHO;
    [TColumn('ANO_MES', 'Ano/Mês', 100, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftanomes2, taLeftJustify)]
    property AnoMes: String  read FANO_MES write FANO_MES;
    [TColumn('CNPJ', 'Cnpj', 120, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftCnpj, taLeftJustify)]
    property Cnpj: String  read FCNPJ write FCNPJ;
    [TColumn('CPF', 'Cpf', 100, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftCpf, taLeftJustify)]
    property Cpf: String  read FCPF write FCPF;
    [TColumn('INSCRICAO_ESTADUAL', 'Inscricao Estadual', 100, [ldGrid, ldLookup, ldCombobox], False)]
    property InscricaoEstadual: String  read FINSCRICAO_ESTADUAL write FINSCRICAO_ESTADUAL;
    [TColumn('MODELO', 'Modelo', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property Modelo: String  read FMODELO write FMODELO;
    [TColumn('SERIE', 'Serie',80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftSerie, taLeftJustify)]
    property Serie: String  read FSERIE write FSERIE;
    [TColumn('NUMERO_NF', 'Numero Nf', 100, [ldGrid, ldLookup, ldCombobox], False)]
    //[TFormatter(ftZerosAEsquerda9, taCenter)]
    property NumeroNf: Integer  read FNUMERO_NF write FNUMERO_NF;
    [TColumn('CODIGO_UF', 'Codigo Uf', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter( taCenter)]
    property CodigoUf: Integer  read FCODIGO_UF write FCODIGO_UF;

  end;

implementation
constructor TNfeProdRuralReferenciadaVO.Create;
begin
  inherited;

end;

destructor TNfeProdRuralReferenciadaVO.Destroy;
begin


  inherited;
end;

initialization
  Classes.RegisterClass(TNfeProdRuralReferenciadaVO);

finalization
  Classes.UnRegisterClass(TNfeProdRuralReferenciadaVO);

end.

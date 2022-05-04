unit NfeCteReferenciadoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('NFE_CTE_REFERENCIADO')]
  TNfeCteReferenciadoVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_CABECALHO: Integer;
    FCHAVE_ACESSO: String;
  public
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_CABECALHO', 'Id Nfe Cabecalho', 80, [], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeCabecalho: Integer  read FID_NFE_CABECALHO write FID_NFE_CABECALHO;
    [TColumn('CHAVE_ACESSO', 'Chave Acesso', 352, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftChaveAcessoNFe, taLeftJustify)]
    property ChaveAcesso: String  read FCHAVE_ACESSO write FCHAVE_ACESSO;
  end;

implementation


initialization
  Classes.RegisterClass(TNfeCteReferenciadoVO);

finalization
  Classes.UnRegisterClass(TNfeCteReferenciadoVO);

end.

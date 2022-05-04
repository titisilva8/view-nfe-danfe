
unit NfeReferenciadaVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('NFE_REFERENCIADA')]
  TNfeReferenciadaVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_CABECALHO: Integer;
    FCHAVE_ACESSO: String;
  public
    [TId('ID',[])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_CABECALHO', 'Id Nfe Cabecalho', 80, [], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeCabecalho: Integer  read FID_NFE_CABECALHO write FID_NFE_CABECALHO;
    [TColumn('CHAVE_ACESSO', 'Chave Acesso', 350, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftChaveAcessoNFe3)]
    property ChaveAcesso: String  read FCHAVE_ACESSO write FCHAVE_ACESSO;
  end;

implementation


initialization
  Classes.RegisterClass(TNfeReferenciadaVO);

finalization
  Classes.UnRegisterClass(TNfeReferenciadaVO);

end.

unit NfeAutorizacaoDownloadVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('NFE_AUTORIZACAO_DOWNLOAD')]
  TNfeAutorizacaoDownloadVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_CABECALHO: Integer;
    FCNPJ_CPF: String;
  public
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_CABECALHO', 'Id Nfe Cabecalho', 80, [], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeCabecalho: Integer  read FID_NFE_CABECALHO write FID_NFE_CABECALHO;
    [TColumn('CNPJ_CPF', 'CNPJ / CPF', 300, [ldGrid, ldLookup, ldCombobox], False)]
    property CnpjCpf: String  read FCNPJ_CPF write FCNPJ_CPF;
   //Transientes
  end;

implementation


initialization
  Classes.RegisterClass(TNfeAutorizacaoDownloadVO);

finalization
  Classes.UnRegisterClass(TNfeAutorizacaoDownloadVO);

end.

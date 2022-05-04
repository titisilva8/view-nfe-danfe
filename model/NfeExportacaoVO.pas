unit NfeExportacaoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('NFE_EXPORTACAO')]
  TNfeExportacaoVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_DETALHE: Integer;
    FDRAWBACK: String;
    FNUMERO_REGISTRO: String;
    FCHAVE_ACESSO: String;
    FQUANTIDADE: Extended;
  public
    [TId('ID',[])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_DETALHE', 'Id Nfe Detalhe', 80, [], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeDetalhe: Integer  read FID_NFE_DETALHE write FID_NFE_DETALHE;
    [TColumn('DRAWBACK', 'Drawback', 150, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftDrawback, taCenter)]
    property Drawback: String  read FDRAWBACK write FDRAWBACK;
    [TColumn('NUMERO_REGISTRO', 'Numero Registro', 150, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftRe, taCenter)]
    property NumeroRegistro: String  read FNUMERO_REGISTRO write FNUMERO_REGISTRO;
    [TColumn('CHAVE_ACESSO', 'Chave Acesso', 400, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftChaveAcessoNFe)]
    property ChaveAcesso: String  read FCHAVE_ACESSO write FCHAVE_ACESSO;
    [TColumn('QUANTIDADE', 'Quantidade', 120, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador4, taRightJustify)]
    property Quantidade: Extended  read FQUANTIDADE write FQUANTIDADE;
  end;

implementation


initialization
  Classes.RegisterClass(TNfeExportacaoVO);

finalization
  Classes.UnRegisterClass(TNfeExportacaoVO);

end.

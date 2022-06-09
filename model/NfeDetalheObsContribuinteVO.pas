
unit NfeDetalheObsContribuinteVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('NFE_DETALHE_OBS_CONTRIBUINTE')]
  TNfeDetalheObsContribuinteVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_DETALHE: Integer;
    FCAMPO: String;
    FTEXTO: String;
    FPERSISTE:String;


  public
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_DETALHE', 'Id Nfe Detalhe', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeDetalhe: Integer  read FID_NFE_DETALHE write FID_NFE_DETALHE;
    [TColumn('CAMPO', 'Campo', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property Campo: String  read FCAMPO write FCAMPO;
    [TColumn('TEXTO', 'Campo', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property Texto: String  read FTEXTO write FTEXTO;
    [TColumn('PERSISTE', 'Persiste', 60, [], True)]                                                       //34
    property Persiste: String  read FPersiste write FPersiste;
    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TNfeDetalheObsContribuinteVO);

finalization
  Classes.UnRegisterClass(TNfeDetalheObsContribuinteVO);

end.

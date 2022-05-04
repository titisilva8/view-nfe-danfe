unit NfeDetalheImpostoIiVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('NFE_DETALHE_IMPOSTO_II')]
  TNfeDetalheImpostoIiVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_DETALHE: Integer;
    FVALOR_BC_II: Extended;
    FVALOR_DESPESAS_ADUANEIRAS: Extended;
    FVALOR_IMPOSTO_IMPORTACAO: Extended;
    FVALOR_IOF: Extended;

    //Usado no lado cliente para controlar quais registros serão persistidos
    FPersiste: String;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_DETALHE', 'Id Nfe Detalhe', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeDetalhe: Integer  read FID_NFE_DETALHE write FID_NFE_DETALHE;
    [TColumn('VALOR_BC_II', 'Valor Bc Ii', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorBcIi: Extended  read FVALOR_BC_II write FVALOR_BC_II;
    [TColumn('VALOR_DESPESAS_ADUANEIRAS', 'Valor Despesas Aduaneiras', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorDespesasAduaneiras: Extended  read FVALOR_DESPESAS_ADUANEIRAS write FVALOR_DESPESAS_ADUANEIRAS;
    [TColumn('VALOR_IMPOSTO_IMPORTACAO', 'Valor Imposto Importacao', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorImpostoImportacao: Extended  read FVALOR_IMPOSTO_IMPORTACAO write FVALOR_IMPOSTO_IMPORTACAO;
    [TColumn('VALOR_IOF', 'Valor Iof', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIof: Extended  read FVALOR_IOF write FVALOR_IOF;

    [TColumn('PERSISTE', 'Persiste', 60, [], True)]
    property Persiste: String  read FPersiste write FPersiste;

  end;

implementation


initialization
  Classes.RegisterClass(TNfeDetalheImpostoIiVO);

finalization
  Classes.UnRegisterClass(TNfeDetalheImpostoIiVO);

end.

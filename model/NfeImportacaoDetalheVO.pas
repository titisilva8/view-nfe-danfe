unit NfeImportacaoDetalheVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;
type
  [TEntity]
  [TTable('NFE_IMPORTACAO_DETALHE')]
  TNfeImportacaoDetalheVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_DECLARACAO_IMPORTACAO: Integer;
    FNUMERO_ADICAO: String;
    FNUMERO_SEQUENCIAL: String;
    FCODIGO_FABRICANTE_ESTRANGEIRO: String;
    FVALOR_DESCONTO: Extended;
    FDRAWBACK: String;
  public
    constructor Create; override;
    destructor Destroy; override;
    [TId('ID',[])]
    [TGeneratedValue(sAuto)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_DECLARACAO_IMPORTACAO', 'Id Nfe Declaracao Importacao', 80, [], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeDeclaracaoImportacao: Integer  read FID_NFE_DECLARACAO_IMPORTACAO write FID_NFE_DECLARACAO_IMPORTACAO;
    [TColumn('NUMERO_SEQUENCIAL', 'Numero Sequencial',3 ,[ldGrid, ldLookup, ldCombobox], False)]
    property NumeroSequencial: String  read FNUMERO_SEQUENCIAL write FNUMERO_SEQUENCIAL;
    [TColumn('NUMERO_ADICAO', 'Numero Adição', 3,[ldGrid, ldLookup, ldCombobox], False)]
    property NumeroAdicao: String  read FNUMERO_ADICAO write FNUMERO_ADICAO;
    [TColumn('CODIGO_FABRICANTE_ESTRANGEIRO', 'Codigo Fabricante Estrangeiro', 60, [ldGrid, ldLookup, ldCombobox], False)]
    property CodigoFabricanteEstrangeiro: String  read FCODIGO_FABRICANTE_ESTRANGEIRO write FCODIGO_FABRICANTE_ESTRANGEIRO;
    [TColumn('VALOR_DESCONTO', 'Valor Desconto', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorDesconto: Extended  read FVALOR_DESCONTO write FVALOR_DESCONTO;
    [TColumn('DRAWBACK', 'Drawback', 168, [ldGrid, ldLookup, ldCombobox], False)]
    property Drawback: String read FDRAWBACK write FDRAWBACK;
  end;

implementation

constructor TNfeImportacaoDetalheVO.Create;
begin
  inherited;
end;

destructor TNfeImportacaoDetalheVO.Destroy;
begin
  inherited;
end;

initialization
  Classes.RegisterClass(TNfeImportacaoDetalheVO);

finalization
  Classes.UnRegisterClass(TNfeImportacaoDetalheVO);

end.

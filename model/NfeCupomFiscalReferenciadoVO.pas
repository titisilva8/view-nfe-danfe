
unit NfeCupomFiscalReferenciadoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('NFE_CUPOM_FISCAL_REFERENCIADO')]
  TNfeCupomFiscalReferenciadoVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_CABECALHO: Integer;
    FMODELO_DOCUMENTO_FISCAL: String;
    FNUMERO_ORDEM_ECF: String;
    FCOO: String;
    FDATA_EMISSAO_CUPOM: TDateTime;
    FNUMERO_CAIXA: Integer;
    FNUMERO_SERIE_ECF: String;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    //[TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_CABECALHO', 'Id Nfe Cabecalho', 80, [], False)]
    //[TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeCabecalho: Integer  read FID_NFE_CABECALHO write FID_NFE_CABECALHO;
    [TColumn('MODELO_DOCUMENTO_FISCAL', 'Modelo Documento Fiscal', 2, [ldGrid, ldLookup, ldCombobox], False)]
    property ModeloDocumentoFiscal: String  read FMODELO_DOCUMENTO_FISCAL write FMODELO_DOCUMENTO_FISCAL;
    [TColumn('NUMERO_ORDEM_ECF', 'Numero Ordem Ecf', 80, [ldGrid, ldLookup, ldCombobox], False)]
    //[TFormatter(ftZerosAEsquerda, taCenter)]
    property NumeroOrdemEcf: String  read FNUMERO_ORDEM_ECF write FNUMERO_ORDEM_ECF;
    [TColumn('COO', 'Coo', 80, [ldGrid, ldLookup, ldCombobox], False)]
    //[TFormatter(ftZerosAEsquerda, taCenter)]
    property Coo: String  read FCOO write FCOO;
    [TColumn('DATA_EMISSAO_CUPOM', 'Data Emissao Cupom', 80, [ldGrid, ldLookup, ldCombobox], False)]
    //[TFormatter(ftData, taLeftJustify)]
    property DataEmissaoCupom: TDateTime  read FDATA_EMISSAO_CUPOM write FDATA_EMISSAO_CUPOM;
    [TColumn('NUMERO_CAIXA', 'Numero Caixa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    //[TFormatter(ftZerosAEsquerda, taCenter)]
    property NumeroCaixa: Integer  read FNUMERO_CAIXA write FNUMERO_CAIXA;
    [TColumn('NUMERO_SERIE_ECF', 'Numero Serie Ecf', 20, [ldGrid, ldLookup, ldCombobox], False)]
    property NumeroSerieEcf: String  read FNUMERO_SERIE_ECF write FNUMERO_SERIE_ECF;


  end;

implementation


initialization
  Classes.RegisterClass(TNfeCupomFiscalReferenciadoVO);

finalization
  Classes.UnRegisterClass(TNfeCupomFiscalReferenciadoVO);

end.

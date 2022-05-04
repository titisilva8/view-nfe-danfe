unit NfeDeclaracaoImportacaoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils,DB;

type
  [TEntity]
  [TTable('NFE_DECLARACAO_IMPORTACAO')]
  TNfeDeclaracaoImportacaoVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_DETALHE: Integer;
    FNUMERO_DOCUMENTO: String;
    FDATA_REGISTRO: TDateTime;
    FLOCAL_DESEMBARACO: String;
    FUF_DESEMBARACO: String;
    FDATA_DESEMBARACO: TDateTime;
    FCODIGO_EXPORTADOR: String;
    FVIA_TRANSPORTE: String;
    FVALOR_AFRMM: Extended;
    FFORMA_INTERMEDIACAO: String;
    FCNPJ: String;
    FUF_TERCEIRO: String;

  public
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID',[])]
    [TGeneratedValue(sAuto)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_DETALHE', 'Id Nfe Detalhe', 80, [], False)]
    property IdNfeDetalhe: Integer  read FID_NFE_DETALHE write FID_NFE_DETALHE;
    [TColumn('NUMERO_DOCUMENTO', 'Nº Documento', 120, [ldGrid, ldLookup, ldCombobox], False)]
    property NumeroDocumento: String  read FNUMERO_DOCUMENTO write FNUMERO_DOCUMENTO;
    [TColumn('DATA_REGISTRO', 'Data Registro', 100, [ldGrid, ldLookup, ldCombobox], False)]
    property DataRegistro: TDateTime  read FDATA_REGISTRO write FDATA_REGISTRO;
    [TColumn('CODIGO_EXPORTADOR', 'Codigo Exportador', 120, [ldGrid, ldLookup, ldCombobox], False)]
    property CodigoExportador: String  read FCODIGO_EXPORTADOR write FCODIGO_EXPORTADOR;
    // 1- Maritima, 2-Fluvial, 3-Lacustre, 4-Aerea, 5-Postal, 6-Ferroviaria, 7-Rodoviária,
    //8-Conduto, 9-Meios Proprios, 10-Entrada/Saida Ficta, 11-Courier, 12-Handcarry
    [TColumn('VIA_TRANSPORTE', 'Via Transporte', 80, [], False)]
    property ViaTransporte: String  read FVIA_TRANSPORTE write FVIA_TRANSPORTE;
    [TColumn('VALOR_AFRMM', 'Valor Afrmm', 100, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorAfrmm: Extended  read FVALOR_AFRMM write FVALOR_AFRMM;
    //1-Por Conta Propria, 2-Por Conta e Ordem, 3-Por Encomenda
    [TColumn('FORMA_INTERMEDIACAO', 'Forma Intermediacao', 80, [], False)]
    property FormaIntermediacao: String  read FFORMA_INTERMEDIACAO write FFORMA_INTERMEDIACAO;
    [TColumn('UF_DESEMBARACO', 'Uf Desembaraço', 100, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftUF, tacenter)]
    property UfDesembaraco: String  read FUF_DESEMBARACO write FUF_DESEMBARACO;
    [TColumn('LOCAL_DESEMBARACO', 'Local Desembaraço', 200, [ldGrid, ldLookup, ldCombobox], False)]
    property LocalDesembaraco: String  read FLOCAL_DESEMBARACO write FLOCAL_DESEMBARACO;
    [TColumn('DATA_DESEMBARACO', 'Data Desembaraço', 120, [ldGrid, ldLookup, ldCombobox], False)]
    property DataDesembaraco: TDateTime  read FDATA_DESEMBARACO write FDATA_DESEMBARACO;
    [TColumn('UF_TERCEIRO', 'Uf Adiquirente ou Encomendante', 140, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftUF, tacenter)]
    property UfTerceiro: String  read FUF_TERCEIRO write FUF_TERCEIRO;
    [TColumn('CNPJ', 'Cnpj', 120, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftCnpj, taLeftJustify)]
    property Cnpj: String  read FCNPJ write FCNPJ;
   end;

implementation

constructor TNfeDeclaracaoImportacaoVO.Create;
begin
  inherited;
end;

destructor TNfeDeclaracaoImportacaoVO.Destroy;
begin
  inherited;
end;

initialization
  Classes.RegisterClass(TNfeDeclaracaoImportacaoVO);

finalization
  Classes.UnRegisterClass(TNfeDeclaracaoImportacaoVO);

end.

unit NfeDetalheVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('NFE_DETALHE')]
  TNfeDetalheVO = class(TVO)
  private
    FID: Integer;
    FID_PRODUTO: Integer;
    FID_NFE_CABECALHO: Integer;
    FNUMERO_ITEM: Integer;
    FCODIGO_PRODUTO: String;
    FGTIN: String;
    FNOME_PRODUTO: String;
    FNCM: String;
    FCEST: String;
    FNVE: String;
    FEX_TIPI: String;
    FCFOP: String;
    FUNIDADE_COMERCIAL: String;
    FQUANTIDADE_COMERCIAL: Extended;
    FVALOR_UNITARIO_COMERCIAL: real;
    FVALOR_BRUTO_PRODUTO: Extended;
    FGTIN_UNIDADE_TRIBUTAVEL: String;
    FUNIDADE_TRIBUTAVEL: String;
    FQUANTIDADE_TRIBUTAVEL: Extended;
    FVALOR_UNITARIO_TRIBUTAVEL: Extended;
    FVALOR_FRETE: Extended;
    FVALOR_SEGURO: Extended;
    FVALOR_DESCONTO: Extended;
    FVALOR_OUTRAS_DESPESAS: Extended;
    FENTRA_TOTAL: String;
    FVALOR_TOTAL: Extended;
    FCUSTO_TOTAL: Extended;
    FNUMERO_PEDIDO_COMPRA: String;
    FITEM_PEDIDO_COMPRA: Integer;
    FINFORMACOES_ADICIONAIS: String;
    FNUMERO_FCI: String;
    FNUMERO_RECOPI: String;
    FVALOR_TOTAL_TRIBUTOS: Extended;
    FPERCENTUAL_DEVOLVIDO: Extended;
    FVALOR_IPI_DEVOLVIDO: Extended;
    FINDICADOR_ESCALA_RELEVANTE:String;
    FCNPJ_FABRICANTE:String;
    FBENEFICIO_FISCAL_UF:String;

  public
    constructor Create; override;
    destructor Destroy; override;

   [TId('ID',[])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('NUMERO_ITEM', 'Item', 40, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property NumeroItem: Integer  read FNUMERO_ITEM write FNUMERO_ITEM;
    [TColumn('ID_PRODUTO', 'Id Produto', 80, [], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdProduto: Integer  read FID_PRODUTO write FID_PRODUTO;
    [TColumn('ID_NFE_CABECALHO', 'Id Nfe Cabecalho', 80, [], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeCabecalho: Integer  read FID_NFE_CABECALHO write FID_NFE_CABECALHO;
    [TColumn('CODIGO_PRODUTO', 'Cod.Produto', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property CodigoProduto: String  read FCODIGO_PRODUTO write FCODIGO_PRODUTO;
    //[TFormatter(ftCodigoInterno, taLeftJustify)]
    [TColumn('GTIN', 'Código de Barras', 112, [], False)]
    property Gtin: String  read FGTIN write FGTIN;
    [TColumn('NOME_PRODUTO', 'Produto/Mercadoria', 350, [ldGrid, ldLookup, ldCombobox], False)]
    property NomeProduto: String  read FNOME_PRODUTO write FNOME_PRODUTO;
    [TColumn('UNIDADE_TRIBUTAVEL', 'Unid Trib.', 70, [ldGrid, ldLookup, ldCombobox], False)]
    property UnidadeTributavel: String  read FUNIDADE_TRIBUTAVEL write FUNIDADE_TRIBUTAVEL;
    [TColumn('UNIDADE_COMERCIAL', 'Unid Com.', 70, [ldGrid, ldLookup, ldCombobox], False)]
    property UnidadeComercial: String  read FUNIDADE_COMERCIAL write FUNIDADE_COMERCIAL;
    [TColumn('QUANTIDADE_COMERCIAL', 'Quant.Com.', 90, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatSemSeparador4, taRightJustify)]
    property QuantidadeComercial: Extended  read FQUANTIDADE_COMERCIAL write FQUANTIDADE_COMERCIAL;
    [TColumn('VALOR_UNITARIO_COMERCIAL', 'Valor Unit.Com.', 130, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatSemSeparador10, taRightJustify)]
    property ValorUnitarioComercial: real  read FVALOR_UNITARIO_COMERCIAL write FVALOR_UNITARIO_COMERCIAL;
    [TColumn('VALOR_BRUTO_PRODUTO', 'Valor Bruto', 100, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorBrutoProduto: Extended  read FVALOR_BRUTO_PRODUTO write FVALOR_BRUTO_PRODUTO;
    [TColumn('QUANTIDADE_TRIBUTAVEL', 'Quant.Trib.', 90, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatSemSeparador4, taRightJustify)]
    property QuantidadeTributavel: Extended  read FQUANTIDADE_TRIBUTAVEL write FQUANTIDADE_TRIBUTAVEL;
    [TColumn('VALOR_UNITARIO_TRIBUTAVEL', 'Valor Unit.Trib.', 130, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatSemSeparador10, taRightJustify)]
    property ValorUnitarioTributavel: Extended  read FVALOR_UNITARIO_TRIBUTAVEL write FVALOR_UNITARIO_TRIBUTAVEL;
    [TColumn('GTIN_UNIDADE_TRIBUTAVEL', 'Gtin Unidade Tributavel', 112, [], False)]
    property GtinUnidadeTributavel: String  read FGTIN_UNIDADE_TRIBUTAVEL write FGTIN_UNIDADE_TRIBUTAVEL;
    [TColumn('NVE', 'Nve', 48, [], False)]
    property Nve: String  read FNVE write FNVE;
    [TColumn('ENTRA_TOTAL', 'Entra Total', 80, [], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property EntraTotal: String  read FENTRA_TOTAL write FENTRA_TOTAL;
    [TColumn('VALOR_FRETE', 'Valor Frete', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatSemSeparador, taRightJustify)]
    property ValorFrete: Extended  read FVALOR_FRETE write FVALOR_FRETE;
    [TColumn('VALOR_SEGURO', 'Valor Seguro', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatSemSeparador, taRightJustify)]
    property ValorSeguro: Extended  read FVALOR_SEGURO write FVALOR_SEGURO;
    [TColumn('VALOR_DESCONTO', 'Valor Desconto', 100, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatSemSeparador, taRightJustify)]
    property ValorDesconto: Extended  read FVALOR_DESCONTO write FVALOR_DESCONTO;
    [TColumn('VALOR_OUTRAS_DESPESAS', 'Valor Outras Desp.', 100, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatSemSeparador, taRightJustify)]
    property ValorOutrasDespesas: Extended  read FVALOR_OUTRAS_DESPESAS write FVALOR_OUTRAS_DESPESAS;
    [TColumn('VALOR_TOTAL', 'Valor Total', 100, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorTotal: Extended  read FVALOR_TOTAL write FVALOR_TOTAL;
    [TColumn('CUSTO_TOTAL', 'Custo Total', 100, [], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property CustoTotal: Extended  read FCUSTO_TOTAL write FCUSTO_TOTAL;
    [TColumn('NCM', 'Ncm', 70, [ldGrid, ldLookup, ldCombobox], False)]
    property Ncm: String  read FNCM write FNCM;
    [TColumn('CEST', 'CEST', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property Cest: String  read FCEST write FCEST;
    [TColumn('CFOP', 'Cfop', 40, [ldGrid, ldLookup, ldCombobox], False)]
    property Cfop: String  read FCFOP write FCFOP;
    [TColumn('NUMERO_PEDIDO_COMPRA', 'Numero Pedido Compra', 120, [], False)]
    property NumeroPedidoCompra: String  read FNUMERO_PEDIDO_COMPRA write FNUMERO_PEDIDO_COMPRA;
    [TColumn('ITEM_PEDIDO_COMPRA', 'Item Pedido Compra', 80, [], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property ItemPedidoCompra: Integer  read FITEM_PEDIDO_COMPRA write FITEM_PEDIDO_COMPRA;
    [TColumn('NUMERO_FCI', 'Numero Fci', 288, [], False)]
    property NumeroFci: String  read FNUMERO_FCI write FNUMERO_FCI;
    [TColumn('NUMERO_RECOPI', 'Numero Recopi', 160, [], False)]
    property NumeroRecopi: String  read FNUMERO_RECOPI write FNUMERO_RECOPI;
    [TColumn('VALOR_TOTAL_TRIBUTOS', 'Valor Total Tributos', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatSemSeparador, taRightJustify)]
    property ValorTotalTributos: Extended  read FVALOR_TOTAL_TRIBUTOS write FVALOR_TOTAL_TRIBUTOS;
    [TColumn('INFORMACOES_ADICIONAIS', 'Informacoes Adicionais', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property InformacoesAdicionais: String  read FINFORMACOES_ADICIONAIS write FINFORMACOES_ADICIONAIS;
    [TColumn('PERCENTUAL_DEVOLVIDO', 'Percentual Devolvido', 100, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatSemSeparador, taRightJustify)]
    property PercentualDevolvido: Extended  read FPERCENTUAL_DEVOLVIDO write FPERCENTUAL_DEVOLVIDO;
    [TColumn('VALOR_IPI_DEVOLVIDO', 'Valor Ipi Devolvido', 100, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatSemSeparador, taRightJustify)]
    property ValorIpiDevolvido: Extended  read FVALOR_IPI_DEVOLVIDO write FVALOR_IPI_DEVOLVIDO;
    [TColumn('INDICADOR_ESCALA_RELEVANTE', 'Ind.Esc.Relevante', 80, [ldgrid], False)]
    property IndicadorEscalaRelevante: String  read FINDICADOR_ESCALA_RELEVANTE write FINDICADOR_ESCALA_RELEVANTE;
    [TColumn('CNPJ_FABRICANTE', 'CNPJ Fabricante', 80, [ldgrid], False)]
    [TFormatter(ftCnpj, taCenter)]
    property CnpjFabricante: String  read FCNPJ_FABRICANTE write FCNPJ_FABRICANTE;
    [TColumn('BENEFICIO_FISCAL_UF', 'Beneficio Fis.Uf', 80, [ldgrid], False)]
    property BeneficioFiscalUf: String  read FBENEFICIO_FISCAL_UF write FBENEFICIO_FISCAL_UF;
    [TColumn('EX_TIPI', 'Ex Tipi', 80, [ldgrid], False)]
    property ExTipi: String  read FEX_TIPI write FEX_TIPI;
  end;

implementation

constructor TNfeDetalheVO.Create;
begin
  inherited;
 end;

destructor TNfeDetalheVO.Destroy;
begin
  inherited;
end;


initialization
  Classes.RegisterClass(TNfeDetalheVO);

finalization
  Classes.UnRegisterClass(TNfeDetalheVO);

end.

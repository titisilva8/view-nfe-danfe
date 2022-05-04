unit Constantes;

interface

const
  // Formatter
  ftCnpj = '##.###.###/####-##;0; ';
  ftCpf = '###.###.###-##;0; ';
  ftCep = '##.###-###;0; ';
  ftTelefone = '(##)####-####;0; ';
  ftCelular = '(##)#####-####;0; ';
  ftInteiroComSeparador = '###,###,###';
  ftInteiroSemSeparador = '#########';
  ftFloatComSeparador = '###,###,##0.00';
  ftFloatSemSeparador = '0.00';

  ftFloatComSeparadorInteiro = '###,###,##0';

  ftFloatComSeparador3 = '###,###,####0.000';
  ftFloatSemSeparador3 = '0.000';

  ftFloatComSeparador4 = '###,###,####0.0000';
  ftFloatSemSeparador4 = '0.0000';

  ftFloatComSeparador10 = '###,###,####0.0000000000';
  ftFloatSemSeparador10 = '0.0000000000';

  ftZerosAEsquerda = '000000';
  ftNumeroDuplicata = '999;1; ';
  ftZeroInvisivel = '#';
  ftCnae = '0000-0/00;1; ';
  ftPlaca = 'aaa-aaaa;0; ';
  ftRntc =  'aaaaaaaaaaaaaaaaaaaa;0; ';
  ftUF =  'LL;1; ';
  ftChaveAcessoNFe =  '00-0000-00.000.000/0000-00-00-000-000.000.000-000.000.000-0;0; ';
  ftChaveAcessoNFe2 =  '9999 9999 9999 9999 9999 9999 9999 9999 9999 9999 9999;9; ';
  ftChaveAcessoNFe3 =  '9999 9999 9999 9999 9999 9999 9999 9999 9999 9999 9999;0; ';
  ftanomes2 = '99/99;0; ';
  ftZerosAEsquerda9 = '000000000;1; '; // para numero de nfe
  ftSerie = '000'; // para serie de nfe
  ftData = '99/99/9999;1;_';
  ftRe =  '00/0000000-000;0; ';
  ftDde =  '0000000000/0;0; ';
  ftDrawback =  '00000000000;0; ';
  ftCodigoInterno = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa;1; ';


  type
  TConstantes = class
  const
    QUANTIDADE_POR_PAGINA = 50;

    {$WRITEABLECONST ON}
    DECIMAIS_QUANTIDADE: Integer = 2;
    DECIMAIS_VALOR: Integer = 2;
    {$WRITEABLECONST OFF}

    TagBotao: array [Boolean] of Integer = (0, 1);
    TagPopupMenu: array [Boolean] of Integer = (0, 1);

    // M�dulos
    MODULO_SEGURANCA = 'Seguran�a';
    MODULO_CADASTROS = 'Cadastros';
  	MODULO_GED = 'GED - Gest�o Eletr�nica de Documentos';
    MODULO_VENDAS = 'Vendas';
    MODULO_CONTRATOS = 'Gest�o de Contratos';
    MODULO_NFE = 'Nota Fiscal Eletr�nica - NFe';
    MODULO_ESTOQUE = 'Controle de Estoque';
    MODULO_PATRIMONIO = 'Controle Patrimonial';
    MODULO_FINANCEIRO = 'Controle Financeiro';
    MODULO_CONTAS_PAGAR = 'Contas a Pagar';
    MODULO_CONTAS_RECEBER = 'Contas a Receber';
    MODULO_COMPRAS = 'Gest�o de Compras';
  	MODULO_FLUXO_CAIXA = 'Fluxo de Caixa';
  	MODULO_ORCAMENTO = 'Controle de Or�amentos';
    MODULO_PONTO_ELETRONICO = 'Ponto Eletr�nico';
    MODULO_FOLHA_PAGAMENTO = 'Folha de Pagamento';
    MODULO_CONTABILIDADE = 'Contabilidade';
    MODULO_CONCILIACAO_CONTABIL = 'Concilia��o Cont�bil';
    MODULO_ESCRITA_FISCAL = 'Escrita Fiscal';
    MODULO_SPED = 'Sped Cont�bil e Fiscal';
    MODULO_ADMINISTRATIVO = 'Administrativo';
    MODULO_SUPORTE = 'Suporte';
    MODULO_BALCAO = 'Balc�o';

  end;

implementation

end.

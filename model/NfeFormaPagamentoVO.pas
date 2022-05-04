
unit NfeFormaPagamentoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections;

type
  [TEntity]
  [TTable('NFE_FORMA_PAGAMENTO')]
  TNfeFormaPagamentoVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_CABECALHO: Integer;
    FMEIO_PAGAMENTO: String;
    FMEIO_PAGAMENTO_DESCRICAO:String;
    FFORMA_RECEBIMENTO: String;
    FFORMA_RECEBIMENTO_DESCRICAO:String;
    FDESCRICAO:String;
    FVALOR: Extended;
    FCNPJ_OPERADORA_CARTAO: String;
    FBANDEIRA: String;
    FNUMERO_AUTORIZACAO: String;



  public
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_CABECALHO', 'Id Nfe Cabecalho', 80, [], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeCabecalho: Integer  read FID_NFE_CABECALHO write FID_NFE_CABECALHO;

    [TColumn('MEIO_PAGAMENTO', 'Código Meio de Recebimento', 150, [], False)]
    property MeioPagamento: String  read FMEIO_PAGAMENTO write FMEIO_PAGAMENTO;
    [TColumn('MEIO_PAGAMENTO_DESCRICAO', 'Meio Pagamento', 160, [ldGrid], False)]
    property MeioPagamentoDescricao: String  read FMEIO_PAGAMENTO_DESCRICAO write FMEIO_PAGAMENTO_DESCRICAO;


    [TColumn('FORMA_RECEBIMENTO', 'Forma Recebimento', 150, [], False)]
    property FormaRecebimento: String  read FFORMA_RECEBIMENTO write FFORMA_RECEBIMENTO;
    [TColumn('FORMA_RECEBIMENTO_DESCRICAO', 'Forma Recebimento', 150, [ldGrid], False)]
    property FormaRecebimentoDescricao: String  read FFORMA_RECEBIMENTO_DESCRICAO write FFORMA_RECEBIMENTO_DESCRICAO;



    [TColumn('DESCRICAO', 'Descrição', 150, [ldGrid], False)]
    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    [TColumn('VALOR', 'Valor', 120, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Valor: Extended  read FVALOR write FVALOR;
    [TColumn('CNPJ_OPERADORA_CARTAO', 'Cnpj Operadora Cartao', 112, [ldGrid], False)]
    property CnpjOperadoraCartao: String  read FCNPJ_OPERADORA_CARTAO write FCNPJ_OPERADORA_CARTAO;
    [TColumn('BANDEIRA', 'Bandeira', 100, [ldGrid], False)]
    property Bandeira: String  read FBANDEIRA write FBANDEIRA;
    [TColumn('NUMERO_AUTORIZACAO', 'Numero Autorizacao', 160, [ldGrid], False)]
    property NumeroAutorizacao: String  read FNUMERO_AUTORIZACAO write FNUMERO_AUTORIZACAO;
  end;

implementation

constructor TNfeFormaPagamentoVO.Create;
begin
  inherited;
end;

destructor TNfeFormaPagamentoVO.Destroy;
begin
  inherited;
end;


initialization
  Classes.RegisterClass(TNfeFormaPagamentoVO);

finalization
  Classes.UnRegisterClass(TNfeFormaPagamentoVO);

end.

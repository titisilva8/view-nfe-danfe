unit UNfeDetalheItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UDataModuleNfe, Vcl.StdCtrls,
  JvExStdCtrls, JvCombobox, JvDBCombobox, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Mask,
  LabeledDBCtrls, JvDBControls;

type
  TFNfeDetalheItem = class(TForm)
    GroupBoxDados: TGroupBox;
    GroupBoxProdutos: TGroupBox;
    EditNumeroItem: TLabeledDBEdit;
    EditCodigoProduto: TLabeledDBEdit;
    EditNomeProduto: TLabeledDBEdit;
    GroupBoxInfTributarias: TGroupBox;
    EditCfop: TLabeledDBEdit;
    EditNcm: TLabeledDBEdit;
    EditCest: TLabeledDBEdit;
    EditNcmDescricao: TLabeledEdit;
    EditCestDescricao: TLabeledEdit;
    EditCfopDescricao: TLabeledEdit;
    GroupBoxComercial: TGroupBox;
    EdittQuantidadeComercial: TLabeledDBEdit;
    EditValorUnitarioComerial: TLabeledDBEdit;
    EditGtin: TLabeledDBEdit;
    EditValorBrutoProduto: TLabeledDBEdit;
    GroupBoxTributavel: TGroupBox;
    EditQuantidadeTributavel: TLabeledDBEdit;
    EditValorUnitarioTributavel: TLabeledDBEdit;
    EditGtinUnidadeTributavel: TLabeledDBEdit;
    EditValorBrutoProduto2: TLabeledDBEdit;
    GroupBoxValores: TGroupBox;
    EditValorFrete: TLabeledDBEdit;
    EditValorSeguro: TLabeledDBEdit;
    EditValorDesconto: TLabeledDBEdit;
    EditValorOutrasDespesas: TLabeledDBEdit;
    EditValorTotal: TLabeledDBEdit;
    EditValorTotalTributos: TLabeledDBEdit;
    GroupBoxOutrasInformacoes: TGroupBox;
    Label1: TLabel;
    Label13: TLabel;
    EditValorIpiDevolvido: TLabeledDBEdit;
    EditPercentualIpiDevolvido: TLabeledDBEdit;
    EditCnpjFabricante: TLabeledDBEdit;
    EditBeneficioFiscalUF: TLabeledDBEdit;
    EditExIpi: TLabeledDBEdit;
    MemoInformacoesAdicionais: TDBMemo;
    ComboBoxIndicadorEscalaRelevante: TJvDBComboBox;
    EditUnidadeComercial: TLabeledDBEdit;
    EditUnidadeTributavel: TLabeledDBEdit;
    DBNavigator1: TDBNavigator;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNfeDetalheItem: TFNfeDetalheItem;

implementation

{$R *.dfm}

procedure TFNfeDetalheItem.FormCreate(Sender: TObject);
begin
  MemoInformacoesAdicionais.Lines.Clear;
end;

end.

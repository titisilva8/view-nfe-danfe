unit PreencheDadosGlobaisController;

interface

uses Datasnap.DBClient,Data.DB,LabeledDBCtrls,JvDBCombobox,Vcl.Forms,
  UNfeDetalheAnexo;

type TPreencheDadosGlobaisController = class
  private

  public

  //Não está sendo utilizado
  class procedure PreencheLookupCombobox(TipoPK:TFieldType;DadosPK,DadosDescricao: array of String;LookupCombobox:TLabeledDBLookupComboBox);

  class procedure PreencheJvCombobox(DadosPK,DadosDescricao: array of String;LookupCombobox:TJvDbCombobox;ConcatenaChaveValor:Boolean=true);
  class procedure PreencheCdsTransiente(DadosPK,DadosDescricao: array of String;Cds:TClientDataSet;ConcatenaChaveValor:Boolean=true);
  class function GetCampoTransiente(Identificador:String;CdsPesquisa:TClientDataSet):String;


  // Metodos para preenchimento de Combobox do formulario de dados da Nfe
  class procedure PreencheJvComboboxFormularioDados;
  class procedure PreencheJvComboboxNfeCabecalho;
  class procedure PreencheJvComboboxNfeEmitente;
  class procedure PreencheJvComboboxNfeDestinatario;
  class procedure PreencheJvComboboxNfeTransporte;
  class procedure PreencheJvComboboxEntregaRetirada;
  class procedure PreencheJvComboboxVeiculos;

  // Metodos para preenchimento de Combobox do formulario de dados da Nfe
  class procedure PreencheJvComboboxFormularioItens;
  class procedure PreencheJvComboboxItensAbaIpi;
  class procedure PreencheJvComboboxItensAbaIcms;
  class procedure PreencheJvComboboxItensAbaPis;
  class procedure PreencheJvComboboxItensAbaCofins;
  class procedure PreencheJvComboboxItensAbaIcmsInterEstadual;

  class procedure PreencheCdsInformacaoPagamento;


end;

implementation



{ TPreencheDadosGlobaisController }

uses UDataModuleNfe,UDataModuleTransiente,UConverteXml;

// Não está sendo utilizado
class procedure TPreencheDadosGlobaisController.PreencheLookupCombobox(TipoPK: TFieldType;DadosPK, DadosDescricao: array of String;LookupCombobox: TLabeledDBLookupComboBox);
var CdsPreencheDadosGlobais:TClientDataSet;
DsPreencheDadosGlobais:TDataSource;
I:Integer;
begin
  TClientDataSet.Create(CdsPreencheDadosGlobais);
  TDataSource.Create(DsPreencheDadosGlobais);
  CdsPreencheDadosGlobais.Close;
  CdsPreencheDadosGlobais.FieldDefs.Clear;
  if TipoPk = ftInteger then
  CdsPreencheDadosGlobais.FieldDefs.Add('ID',TipoPK);
  if TipoPk = ftString then
  CdsPreencheDadosGlobais.FieldDefs.Add('ID',TipoPK,20);

  CdsPreencheDadosGlobais.FieldDefs.Add('DESCRICAO',ftString,100);
  CdsPreencheDadosGlobais.CreateDataSet;

  for I := Low(DadosPk) to High(DadosPk) do
  begin
    CdsPreencheDadosGlobais.Append;
    CdsPreencheDadosGlobais.FieldByName('ID').AsString:=DadosPK[I];
    CdsPreencheDadosGlobais.FieldByName('DESCRICAO').AsString:='|'+DadosPK[I]+'| '+DadosDescricao[I];
    CdsPreencheDadosGlobais.Post;
  end;

  DsPreencheDadosGlobais.DataSet:=CdsPreencheDadosGlobais;
  LookupCombobox.ListSource:=DsPreencheDadosGlobais;
  LookupCombobox.KeyField:='ID';
  LookupCombobox.ListField:='DESCRICAO';
end;

class procedure TPreencheDadosGlobaisController.PreencheCdsTransiente(DadosPK,DadosDescricao: array of String;Cds:TClientDataSet;ConcatenaChaveValor:Boolean=true);
var I:Integer;
begin
  Cds.Close;
  Cds.FieldDefs.Clear;
  Cds.FieldDefs.Add('IDENTIFICADOR',ftString,5);
  Cds.FieldDefs.Add('DESCRICAO',ftString,100);
  Cds.CreateDataSet;
  Cds.Open;
  for I := Low(DadosPk) to High(DadosPk) do
  begin
    Cds.Append;
    Cds.FieldByName('IDENTIFICADOR').AsString:=DadosPK[I];
    if ConcatenaChaveValor = true then
    Cds.FieldByName('DESCRICAO').AsString:=('|'+DadosPK[I]+'| '+DadosDescricao[I])
    else
    Cds.FieldByName('DESCRICAO').AsString:=DadosDescricao[I];
    Cds.Post;
  end;

end;

class function TPreencheDadosGlobaisController.GetCampoTransiente(Identificador:String;CdsPesquisa:TClientDataSet):String;
begin
  CdsPesquisa.Open;
  CdsPesquisa.RecordCount;
  CdsPesquisa.First;
  Result:=CdsPesquisa.FieldByName('DESCRICAO').AsString;
  if CdsPesquisa.Locate('IDENTIFICADOR',Identificador,[]) then
  Result:=CdsPesquisa.FieldByName('DESCRICAO').AsString
  else
  Result:='';
end;

class procedure TPreencheDadosGlobaisController.PreencheCdsInformacaoPagamento;
begin
  PreencheCdsTransiente(['01','02','03','04','05','10','11','12','13','15','16','17','18','19','90','99'],
  ['Dinheiro','Cheque','Cartão de Crédito','Cartão de Débito','Crédito Loja','Vale Alimentação',
  'Vale Refeição','Vale Presente','Vale Combustível','Boleto Bancário','Depósito Bancário','Pagamento Instantâneo(PIX)',
  'Transferência Bancária,Carteira Digital','Programa Fidelidade, Cashback,Crédito Virtual','Sem Pagamento','Outros'],
  FDataModuleTransiente.CdsMeioPagamento,true);

  PreencheCdsTransiente(['1','2'],['Pagamento a Vista','Pagamento a Prazo'],FDataModuleTransiente.CdsFormaPagamento,true);
end;

class procedure TPreencheDadosGlobaisController.PreencheJvCombobox(DadosPK, DadosDescricao: array of String; LookupCombobox: TJvDbCombobox;ConcatenaChaveValor:Boolean=true);
var I:Integer;
begin
  LookupCombobox.Items.Clear;
  LookupCombobox.Values.Clear;
  LookupCombobox.Items.Add('');
  LookupCombobox.Values.Add('');
  for I := Low(DadosPk) to High(DadosPk) do
  begin
    if ConcatenaChaveValor = true then
    LookupCombobox.Items.Add('|'+DadosPK[I]+'| '+DadosDescricao[I])
    else
    LookupCombobox.Items.Add(DadosDescricao[I]);
    LookupCombobox.Values.Add(DadosPK[I]);
  end;
end;

// Metodos para preenchimento de Combobox do formulario de dados da Nfe
class procedure TPreencheDadosGlobaisController.PreencheJvComboboxFormularioDados;
begin
  PreencheJvComboboxNfeCabecalho;
  PreencheJvComboboxNfeEmitente;
  PreencheJvComboboxNfeDestinatario;
  PreencheJvComboboxNfeTransporte;
  PreencheJvComboboxEntregaRetirada;
end;

class procedure TPreencheDadosGlobaisController.PreencheJvComboboxNfeCabecalho;
begin
  //Tipo Operação
  PreencheJvCombobox(['0','1'],['Entrada','Saída'],FConverteXml.JvDbComboboxTipoOperacao);
  //Finalidade Emissão
  PreencheJvCombobox(['1','2','3','4'],['Normal','Complementar','Ajuste','Devolução de Mercadorias'],
  FConverteXml.JvDbComboboxFinalidadeEmissao);
  //Tipo Atendimento
  PreencheJvCombobox(['0','1','2','3','4','5','9'],['Não se Aplica','Operação Presencial','Operação NÂO Presencial, pela INTERNET',
  'Operação NÂO Presencial, pela TELEATENDIMENTO','NFC-e em Operação com entrega a domicílio',
  'Operação Presencial, fora do estabelecimento','Operação NÃO Presencial, Outros'],FConverteXml.JvDbComboboxConsumidorPresenca);
  //Indicador Intermediador
  PreencheJvCombobox(['0','1'],['Operação sem Intermediador','Com Intermidiadores/Marketplaces'],FConverteXml.JvDbComboboxIndicadorIntermediador);

  //Uf Ocorrencia
  PreencheJvCombobox(['12','27','16','13','29','23','53','32','52','21','51','50','31','15','25','41','26','22',
  '33','24','43','11','14','42','35','28','17','99'],
  ['ACRE','ALAGOAS','AMAPÁ','AMAZONAS','BAHIA','CEARÁ','DISTRITO FEDERAL','ESPÍRITO SANTO','GOIÁS','MARANHÃO','MATO GROSSO',
  'MATO GROSSO DO SUL','MINAS GERAIS','PARÁ','PARAÍBA','PARANÁ','PERNAMBUCO','PIAUÍ','RIO DE JANEIRO','RIO GRANDE DO NORTE',
  'RIO GRANDE DO SUL','RONDÔNIA','RORAIMA','SANTA CATARINA','SÃO PAULO','SERGIPE','TOCANTINS','EXTERIOR'],FConverteXml.JvDbComboboxUfEmitente);

   //Tipos Emissão
  PreencheJvCombobox(['1','2','3','4','5','6','7','8','9'],['Normal','Contingência FS-IA','Contingência SCAN',
  'Contingência EPEC','Contingência FS-DA','Contingência SVC-AN','Contingência SVC-RS','Contingência SVC-SP',
  'Offline'],FConverteXml.JvDbComboboxTipoEmissao);



  //Modelo
  PreencheJvCombobox(['55'],['Nota Fiscal Eletrônica'],FConverteXml.JvDbComboboxCodigoModelo);

  //Tipo Impressão Danfe   1 - Retrato
  PreencheJvCombobox(['1','2'],['Retrato','Paisagem'],FConverteXml.JvDbComboboxFormatoImpressaoDanfe);

  //Ambiente
  PreencheJvCombobox(['1','2'],['Producao','Homologação'],FConverteXml.JvDbComboboxAmbiente);
end;

class procedure TPreencheDadosGlobaisController.PreencheJvComboboxNfeEmitente;
begin
  //Tipo Regime Empresa
  PreencheJvCombobox(['1','2','3'],['Simples Nacional','Simples Nacional - Excesso de sublimite de receita','Regime Normal'],FConverteXml.JvDbComboboxcrt);
end;

class procedure TPreencheDadosGlobaisController.PreencheJvComboboxNfeDestinatario;
begin
  //Tipo de Contribuinte
  PreencheJvCombobox(['1','2','3'],['Contribuinte ICMS','Contribuinte Isento','Não Contribuinte'],FConverteXml.JvDBComboBoxIndicadorIe2);
  //Destino da Operação
  PreencheJvCombobox(['1','2','3'],['Operação Interna','Operação Interestadual','Operação com Exterior'],FConverteXml.JvDBComboboxLocalDestino);
  //Consumidor Final
  PreencheJvCombobox(['0','1'],['Não','Sim'],FConverteXml.JvDBComboBoxConsumidorOperacao);
end;

class procedure TPreencheDadosGlobaisController.PreencheJvComboboxEntregaRetirada;
begin

end;

class procedure TPreencheDadosGlobaisController.PreencheJvComboboxVeiculos;
begin
  PreencheJvCombobox(['1','2','3','0'],['Venda concessionária,','Faturamento direto para consumidor final','Venda direta para grandes consumidores(frotista,governo,...)','Outros'],FNfeDetalheAnexo.ComboBoxVeiculoTipoOperacao);
  PreencheJvCombobox(['06','14','13','24','02','22','07','23','04','03','08','10','05','17'],['AUTOMÓVEL,','CAMINHÃO','CAMINHONETA','CARGA / CAM','CICLOMOTO','ESP/ONIBUS','MICROONIBUS','MISTO/CAM','MOTOCICLO','MOTONETA','ONIBUS','REBOQUE','TRICICLO','C.TRATOR'],FNfeDetalheAnexo.ComboVeiculoTipoVeiculo);
  PreencheJvCombobox(['1','2','3','4','5','6'],['PASSAGEIRO,','CARGA','MISTO','CORRIDA','TRAÇÃO','ESPECIAL'],FNfeDetalheAnexo.ComboVeiculoEspecieVeiculo);
  PreencheJvCombobox(['1','2','3'],['Acabado,','Inacabado','Semi-Acabado'],FNfeDetalheAnexo.ComboVeiculoCondicaoVeiculo);
  PreencheJvCombobox(['01','02','03','04','05','06','07','08','09','10','11','12','13','14','15','16'],
  ['AMARELO,','AZUL','BEGE','BRANCA','CINZA','DOURADA','GRENA','LARANJA','MARROM','PRATA','PRETA','ROSA','ROXA',
  'VERDE','VERMELHA','FANTASIA'],FNfeDetalheAnexo.ComboVeiculoCodigoCor);
  PreencheJvCombobox(['0','1','2','3','4','9'],['Não há,','ALienação Fiduciária','Arrendamento Mercantil','Reserva de Dominio','Penhor de Veículos','Outras'],FNfeDetalheAnexo.ComboVeiculoRestricao);
  PreencheJvCombobox(['01','02','03','16','17','18'],['Álcool,','Gasolina','Diesel(...)','Álcool/Gasolina','Gasolina/Álcool/GNV','Gasolina/Elétrico'],FNfeDetalheAnexo.ComboVeiculoTipoCombustivel);
  PreencheJvCombobox(['R','N'],['Remarcado,','Normal'],FNfeDetalheAnexo.ComboVeiculoCondicaoVIN);
end;

class procedure TPreencheDadosGlobaisController.PreencheJvComboboxNfeTransporte;
begin
  //Modalidade Frete
  PreencheJvCombobox(['0','1','2','3','4','9'],['Contratação do Frete por conta do Remetente(CIF)',
  'Contratação do Frete por conta do Destinatário (FOB)','Contratação do Frete por conta de Terceiros',
  'Transporte Próprio por conta do Remetente','Transporte Próprio por conta do Destinatário',
  'Sem Ocorrencia de Transporte'],FConverteXml.JvDbComboboxModalidadeFrete);

  PreencheJvCombobox(['6351','6352','6353','6354','6355','6356','6357','6359','6360','6931','6932','7358'],
                     ['6351','6352','6353','6354','6355','6356','6357','6359','6360','6931','6932','7358'],
  FConverteXml.JvDBComboBoxCfopRetencaoIcmsFrete);

end;

// Metodos para preenchimento de Combobox do formulario de Itens da Nfe
class procedure TPreencheDadosGlobaisController.PreencheJvComboboxFormularioItens;
begin
  PreencheJvComboboxItensAbaIpi;
  PreencheJvComboboxItensAbaIcms;
  PreencheJvComboboxItensAbaCofins;
  PreencheJvComboboxItensAbaPis;
  PreencheJvComboboxItensAbaIcmsInterEstadual;
  PreencheJvComboboxVeiculos;
end;

class procedure TPreencheDadosGlobaisController.PreencheJvComboboxItensAbaIpi;
begin
  PreencheJvCombobox(['00','01','02','03','04','05','49','50','51','52','53','54','55','99'],
  ['Entrada com Recuperação de Crédito','Entrada Tributável com Aliquota Zero','Entrada Isenta',
  'Entrada Não-Tributada','Entrada Imune','Entrada com Suspensão','Outras Entradas','Saída Tributada',
  'Saída Tributável com aliquota Zero','Saida Isenta','Saida Não-Tributada','Saida Imune','Saida com Suspensão',
  'Outras Saídas'],
  FNfeDetalheAnexo.ComboBoxCstIpi);
end;

class procedure TPreencheDadosGlobaisController.PreencheJvComboboxItensAbaIcms;
begin
  //Origem Mercadoria (Cst ICMS A)
  PreencheJvCombobox(['0','1','2','3','4','5','6','7','8'],
  ['Nacional, exceto as indicadas nos codigos 3,4,5 e 8','Estrageira - Importação Direta, exceto a indicada no código 6',
  'Estrangeira - Adiquirida no Mercado Interno, exceto a indicada no código 7','Nacional, mercadoria ou bem com conteúdo de Importação superior a 40% e inferior a 70%',
  'Nacional, cuja produção tenha sido feita em conformidade com os processos produtivos básicos de que tratam as legislações citadas nos Ajustes',
  'Nacional, mercadoria ou bem com conteúdo de Importação inferior ou igual a 40%','Estrangeira - Importação Direta, sem similar nacional, constante em lista da CAMEX E gás natural',
  'Estrangeira - Adiquirida no mercado interno, sem similar nacional, constante em lista da CAMEX e gás natural','Nacional, mercadoria ou bem com conteúdo de Importação superior a 70%'],
  FNfeDetalheAnexo.ComboBoxCstIcmsA);

  //Cst Icms Normal (Cst ICMS B)
  PreencheJvCombobox(['00','10','20','30','40','41','50','51','60','70','90'],
  ['Tributada Integralmente','Tributada com cobrança do ICMS por ST','Com redução da base de cálculo',
  'Isenta ou não tributada e com cobrança do ICMS por ST','Isenta','Não Tributada','Suspensão','Diferimento',
  'Cobrado anteriormente por ST','Com redução da base de cálculo e cobrança do ICMS por ST','Outras'],
  FNfeDetalheAnexo.ComboBoxCstIcmsB);

  //Cst Icms Simples Nacional (Csosn B)
  PreencheJvCombobox(['101','102','103','201','202','203','300','400','500','900'],
  ['Tributada pelo Simples Nacional com permissão de crédito',
  'Tributada pelo Simples Nacional sem permissão de crédito',
  'Isenção do ICMS no Simples Nacional para faixa de receita bruta',
  'Tributada pelo Simples Nacional com permissão de crédito e com cobrança do ICMS por substituição tributária',
  'Tributada pelo Simples Nacional sem permissão de crédito e com cobrança do ICMS por substituição tributária',
  'Isenção do ICMS no Simples Nacional para faixa de receita bruta e com cobrança do ICMS por substituição tributária',
  'Imune',
  'Não tributada pelo Simples Nacional',
  'ICMS cobrado anteriormente por substituição tributária (substituído) ou por antecipação',
  'Outros'],
  FNfeDetalheAnexo.ComboBoxCsosnB);
  //Motivo de Desoneração
  PreencheJvCombobox(['1','3','4','5','6','7','8','9','10','11','16','90'],
  ['Táxi',
  'Produtor Agropecuário',
  'Frotista/Locadora',
  'Diplomático/Consular',
  'Utilitários e Motocicletas da Amazônia Ocidental e Áreas de Livre Comércio (Resolução 714/88 e 790/94 – CONTRAN e suas alterações)',
  'SUFRAMA',
  'Venda a Órgão Público',
  'Outros. (NT 2011/004)',
  'Deficiente Condutor (Convênio ICMS 38/12)',
  'Deficiente Não Condutor (Convênio ICMS 38/12)',
  'Olimpíadas Rio 2016 (NT 2015.002)',
  'Solicitado pelo Fisco'],
  FNfeDetalheAnexo.ComboBoxMotivoDesoneracaoIcms);

  //Modalidade Base Calculo Icms Normal
  PreencheJvCombobox(['0','1','2','3'],
  ['Margem Valor Agregado (%)','Pauta (Valor)','Preço Tabelado Máx. (Valor)','Valor da Operação'],
  FNfeDetalheAnexo.ComboBoxModalidadeBcIcms);

   //Modalidade Base Calculo Icms ST
  PreencheJvCombobox(['0','1','2','3','4','5'],
  ['Preço Tabelado ou Maximo Sugerido','Lista Negativa (Valor)',
  'Lista Positiva (Valor)','Lista Neutra (Valor)','Margem Valor Agregado (%)','Valor da Operação','Pauta (Valor)'],
  FNfeDetalheAnexo.ComboBoxModalidadeBcIcmsST);


end;

class procedure TPreencheDadosGlobaisController.PreencheJvComboboxItensAbaPis;
begin
  PreencheJvCombobox(['01','02','03','04','05','06','07','08','09','49','50','51','52','53','54','55','56','60','61','62',
  '63','64','65','66','67','70','71','72','73','74','75','98','99'],
  ['Operacao Tributavel com Aliquota Basica','Operacao Tributavel com Aliquota Diferenciada',
  'Operacao Tributavel com Aliquota por Unidade de Me','Operacao Tributavel Monofasica - Revenda a Aliquota',
  'Operacao Tributavel por Substituicao Tributaria','Operacao Tributavel a Aliquota Zero','Operacao Isenta da Contribuicao',
  'Operacao sem Incidencia da Contribuicao','Operacao com Suspensao da Contribuicao','Outras Operacões de Saida',
  'Operacao com Direito a Credito - Vinculada Exclusi','Operacao com Direito a Credito Vinculada Exclusi',
  'Operacao com Direito a Credito - Vinculada Exclusi','Operacao com Direito a Credito - Vinculada a Receita',
  'Operacao com Direito a Credito - Vinculada a Receita','Operacao com Direito a Credito - Vinculada a Recei',
  'Operacao com Direito a Credito - Vinculada a Recei','Credito Presumido - Operacao de Aquisicao Vinculad',
  'Credito Presumido - Operacao de Aquisicao Vinculad','Credito Presumido - Operacao de Aquisicao Vinculad',
  'Credito Presumido - Operacao de Aquisicao Vinculad','Credito Presumido - Operacao de Aquisicao Vinculad',
  'Credito Presumido - Operacao de Aquisicao Vinculad','Credito Presumido - Operacao de Aquisicao Vinculad',
  'Credito Presumido - Outras Operacões','Operacao de Aquisicao sem Direito a Credito','Operacao de Aquisicao com Isencao',
  'Operacao de Aquisicao com Suspensao','Operacao de Aquisicao a Aliquota Zero','Operacao de Aquisicao sem Incidencia da Contribuic',
  'Operacao de Aquisicao por Substituicao Tributaria','Outras Operacões de Entrada','Outras Operacões'],
  FNfeDetalheAnexo.ComboBoxCstPis);
end;

class procedure TPreencheDadosGlobaisController.PreencheJvComboboxItensAbaCofins;
begin
  PreencheJvCombobox(['01','02','03','04','05','06','07','08','09','49','50','51','52','53','54','55','56','60','61','62',
  '63','64','65','66','67','70','71','72','73','74','75','98','99'],
  ['Operacao Tributavel com Aliquota Basica','Operacao Tributavel com Aliquota Diferenciada',
  'Operacao Tributavel com Aliquota por Unidade de Me','Operacao Tributavel Monofasica - Revenda a Aliquota',
  'Operacao Tributavel por Substituicao Tributaria','Operacao Tributavel a Aliquota Zero','Operacao Isenta da Contribuicao',
  'Operacao sem Incidencia da Contribuicao','Operacao com Suspensao da Contribuicao','Outras Operacões de Saida',
  'Operacao com Direito a Credito - Vinculada Exclusi','Operacao com Direito a Credito Vinculada Exclusi',
  'Operacao com Direito a Credito - Vinculada Exclusi','Operacao com Direito a Credito - Vinculada a Receita',
  'Operacao com Direito a Credito - Vinculada a Receita','Operacao com Direito a Credito - Vinculada a Recei',
  'Operacao com Direito a Credito - Vinculada a Recei','Credito Presumido - Operacao de Aquisicao Vinculad',
  'Credito Presumido - Operacao de Aquisicao Vinculad','Credito Presumido - Operacao de Aquisicao Vinculad',
  'Credito Presumido - Operacao de Aquisicao Vinculad','Credito Presumido - Operacao de Aquisicao Vinculad',
  'Credito Presumido - Operacao de Aquisicao Vinculad','Credito Presumido - Operacao de Aquisicao Vinculad',
  'Credito Presumido - Outras Operacões','Operacao de Aquisicao sem Direito a Credito','Operacao de Aquisicao com Isencao',
  'Operacao de Aquisicao com Suspensao','Operacao de Aquisicao a Aliquota Zero','Operacao de Aquisicao sem Incidencia da Contribuic',
  'Operacao de Aquisicao por Substituicao Tributaria','Outras Operacões de Entrada','Outras Operacões'],
  FNfeDetalheAnexo.ComboBoxCstCofins);
end;

class procedure TPreencheDadosGlobaisController.PreencheJvComboboxItensAbaIcmsInterEstadual;
begin
  //Aliquota Icms InterEstadual
  PreencheJvCombobox(['4','7','12'],
  ['4% aliquota interestdual para produtos importados',
  '7% para Estados de origem do Sul e Sudeste (exceto ES), destinado para os Estados do Norte e Nordeste',
  '12% para os demais casos'],
  FNfeDetalheAnexo.ComboboxAliquotaInterEstadual,false);

  //Percentual Provisorio Partilha Icms
  PreencheJvCombobox(['40','60','80','100'],
  ['40% em 2016','60% em 2017','80% em 2018','100% a partir de 2019'],
  FNfeDetalheAnexo.ComboboxPercenturalPartilhaIcms,false);

end;



end.

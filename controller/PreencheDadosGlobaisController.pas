unit PreencheDadosGlobaisController;

interface

uses Datasnap.DBClient,Data.DB,LabeledDBCtrls,JvDBCombobox,Vcl.Forms,
  UNfeDetalheAnexo;

type TPreencheDadosGlobaisController = class
  private

  public

  //N�o est� sendo utilizado
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

// N�o est� sendo utilizado
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
  ['Dinheiro','Cheque','Cart�o de Cr�dito','Cart�o de D�bito','Cr�dito Loja','Vale Alimenta��o',
  'Vale Refei��o','Vale Presente','Vale Combust�vel','Boleto Banc�rio','Dep�sito Banc�rio','Pagamento Instant�neo(PIX)',
  'Transfer�ncia Banc�ria,Carteira Digital','Programa Fidelidade, Cashback,Cr�dito Virtual','Sem Pagamento','Outros'],
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
  //Tipo Opera��o
  PreencheJvCombobox(['0','1'],['Entrada','Sa�da'],FConverteXml.JvDbComboboxTipoOperacao);
  //Finalidade Emiss�o
  PreencheJvCombobox(['1','2','3','4'],['Normal','Complementar','Ajuste','Devolu��o de Mercadorias'],
  FConverteXml.JvDbComboboxFinalidadeEmissao);
  //Tipo Atendimento
  PreencheJvCombobox(['0','1','2','3','4','5','9'],['N�o se Aplica','Opera��o Presencial','Opera��o N�O Presencial, pela INTERNET',
  'Opera��o N�O Presencial, pela TELEATENDIMENTO','NFC-e em Opera��o com entrega a domic�lio',
  'Opera��o Presencial, fora do estabelecimento','Opera��o N�O Presencial, Outros'],FConverteXml.JvDbComboboxConsumidorPresenca);
  //Indicador Intermediador
  PreencheJvCombobox(['0','1'],['Opera��o sem Intermediador','Com Intermidiadores/Marketplaces'],FConverteXml.JvDbComboboxIndicadorIntermediador);

  //Uf Ocorrencia
  PreencheJvCombobox(['12','27','16','13','29','23','53','32','52','21','51','50','31','15','25','41','26','22',
  '33','24','43','11','14','42','35','28','17','99'],
  ['ACRE','ALAGOAS','AMAP�','AMAZONAS','BAHIA','CEAR�','DISTRITO FEDERAL','ESP�RITO SANTO','GOI�S','MARANH�O','MATO GROSSO',
  'MATO GROSSO DO SUL','MINAS GERAIS','PAR�','PARA�BA','PARAN�','PERNAMBUCO','PIAU�','RIO DE JANEIRO','RIO GRANDE DO NORTE',
  'RIO GRANDE DO SUL','ROND�NIA','RORAIMA','SANTA CATARINA','S�O PAULO','SERGIPE','TOCANTINS','EXTERIOR'],FConverteXml.JvDbComboboxUfEmitente);

   //Tipos Emiss�o
  PreencheJvCombobox(['1','2','3','4','5','6','7','8','9'],['Normal','Conting�ncia FS-IA','Conting�ncia SCAN',
  'Conting�ncia EPEC','Conting�ncia FS-DA','Conting�ncia SVC-AN','Conting�ncia SVC-RS','Conting�ncia SVC-SP',
  'Offline'],FConverteXml.JvDbComboboxTipoEmissao);



  //Modelo
  PreencheJvCombobox(['55'],['Nota Fiscal Eletr�nica'],FConverteXml.JvDbComboboxCodigoModelo);

  //Tipo Impress�o Danfe   1 - Retrato
  PreencheJvCombobox(['1','2'],['Retrato','Paisagem'],FConverteXml.JvDbComboboxFormatoImpressaoDanfe);

  //Ambiente
  PreencheJvCombobox(['1','2'],['Producao','Homologa��o'],FConverteXml.JvDbComboboxAmbiente);
end;

class procedure TPreencheDadosGlobaisController.PreencheJvComboboxNfeEmitente;
begin
  //Tipo Regime Empresa
  PreencheJvCombobox(['1','2','3'],['Simples Nacional','Simples Nacional - Excesso de sublimite de receita','Regime Normal'],FConverteXml.JvDbComboboxcrt);
end;

class procedure TPreencheDadosGlobaisController.PreencheJvComboboxNfeDestinatario;
begin
  //Tipo de Contribuinte
  PreencheJvCombobox(['1','2','3'],['Contribuinte ICMS','Contribuinte Isento','N�o Contribuinte'],FConverteXml.JvDBComboBoxIndicadorIe2);
  //Destino da Opera��o
  PreencheJvCombobox(['1','2','3'],['Opera��o Interna','Opera��o Interestadual','Opera��o com Exterior'],FConverteXml.JvDBComboboxLocalDestino);
  //Consumidor Final
  PreencheJvCombobox(['0','1'],['N�o','Sim'],FConverteXml.JvDBComboBoxConsumidorOperacao);
end;

class procedure TPreencheDadosGlobaisController.PreencheJvComboboxEntregaRetirada;
begin

end;

class procedure TPreencheDadosGlobaisController.PreencheJvComboboxVeiculos;
begin
  PreencheJvCombobox(['1','2','3','0'],['Venda concession�ria,','Faturamento direto para consumidor final','Venda direta para grandes consumidores(frotista,governo,...)','Outros'],FNfeDetalheAnexo.ComboBoxVeiculoTipoOperacao);
  PreencheJvCombobox(['06','14','13','24','02','22','07','23','04','03','08','10','05','17'],['AUTOM�VEL,','CAMINH�O','CAMINHONETA','CARGA / CAM','CICLOMOTO','ESP/ONIBUS','MICROONIBUS','MISTO/CAM','MOTOCICLO','MOTONETA','ONIBUS','REBOQUE','TRICICLO','C.TRATOR'],FNfeDetalheAnexo.ComboVeiculoTipoVeiculo);
  PreencheJvCombobox(['1','2','3','4','5','6'],['PASSAGEIRO,','CARGA','MISTO','CORRIDA','TRA��O','ESPECIAL'],FNfeDetalheAnexo.ComboVeiculoEspecieVeiculo);
  PreencheJvCombobox(['1','2','3'],['Acabado,','Inacabado','Semi-Acabado'],FNfeDetalheAnexo.ComboVeiculoCondicaoVeiculo);
  PreencheJvCombobox(['01','02','03','04','05','06','07','08','09','10','11','12','13','14','15','16'],
  ['AMARELO,','AZUL','BEGE','BRANCA','CINZA','DOURADA','GRENA','LARANJA','MARROM','PRATA','PRETA','ROSA','ROXA',
  'VERDE','VERMELHA','FANTASIA'],FNfeDetalheAnexo.ComboVeiculoCodigoCor);
  PreencheJvCombobox(['0','1','2','3','4','9'],['N�o h�,','ALiena��o Fiduci�ria','Arrendamento Mercantil','Reserva de Dominio','Penhor de Ve�culos','Outras'],FNfeDetalheAnexo.ComboVeiculoRestricao);
  PreencheJvCombobox(['01','02','03','16','17','18'],['�lcool,','Gasolina','Diesel(...)','�lcool/Gasolina','Gasolina/�lcool/GNV','Gasolina/El�trico'],FNfeDetalheAnexo.ComboVeiculoTipoCombustivel);
  PreencheJvCombobox(['R','N'],['Remarcado,','Normal'],FNfeDetalheAnexo.ComboVeiculoCondicaoVIN);
end;

class procedure TPreencheDadosGlobaisController.PreencheJvComboboxNfeTransporte;
begin
  //Modalidade Frete
  PreencheJvCombobox(['0','1','2','3','4','9'],['Contrata��o do Frete por conta do Remetente(CIF)',
  'Contrata��o do Frete por conta do Destinat�rio (FOB)','Contrata��o do Frete por conta de Terceiros',
  'Transporte Pr�prio por conta do Remetente','Transporte Pr�prio por conta do Destinat�rio',
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
  ['Entrada com Recupera��o de Cr�dito','Entrada Tribut�vel com Aliquota Zero','Entrada Isenta',
  'Entrada N�o-Tributada','Entrada Imune','Entrada com Suspens�o','Outras Entradas','Sa�da Tributada',
  'Sa�da Tribut�vel com aliquota Zero','Saida Isenta','Saida N�o-Tributada','Saida Imune','Saida com Suspens�o',
  'Outras Sa�das'],
  FNfeDetalheAnexo.ComboBoxCstIpi);
end;

class procedure TPreencheDadosGlobaisController.PreencheJvComboboxItensAbaIcms;
begin
  //Origem Mercadoria (Cst ICMS A)
  PreencheJvCombobox(['0','1','2','3','4','5','6','7','8'],
  ['Nacional, exceto as indicadas nos codigos 3,4,5 e 8','Estrageira - Importa��o Direta, exceto a indicada no c�digo 6',
  'Estrangeira - Adiquirida no Mercado Interno, exceto a indicada no c�digo 7','Nacional, mercadoria ou bem com conte�do de Importa��o superior a 40% e inferior a 70%',
  'Nacional, cuja produ��o tenha sido feita em conformidade com os processos produtivos b�sicos de que tratam as legisla��es citadas nos Ajustes',
  'Nacional, mercadoria ou bem com conte�do de Importa��o inferior ou igual a 40%','Estrangeira - Importa��o Direta, sem similar nacional, constante em lista da CAMEX E g�s natural',
  'Estrangeira - Adiquirida no mercado interno, sem similar nacional, constante em lista da CAMEX e g�s natural','Nacional, mercadoria ou bem com conte�do de Importa��o superior a 70%'],
  FNfeDetalheAnexo.ComboBoxCstIcmsA);

  //Cst Icms Normal (Cst ICMS B)
  PreencheJvCombobox(['00','10','20','30','40','41','50','51','60','70','90'],
  ['Tributada Integralmente','Tributada com cobran�a do ICMS por ST','Com redu��o da base de c�lculo',
  'Isenta ou n�o tributada e com cobran�a do ICMS por ST','Isenta','N�o Tributada','Suspens�o','Diferimento',
  'Cobrado anteriormente por ST','Com redu��o da base de c�lculo e cobran�a do ICMS por ST','Outras'],
  FNfeDetalheAnexo.ComboBoxCstIcmsB);

  //Cst Icms Simples Nacional (Csosn B)
  PreencheJvCombobox(['101','102','103','201','202','203','300','400','500','900'],
  ['Tributada pelo Simples Nacional com permiss�o de cr�dito',
  'Tributada pelo Simples Nacional sem permiss�o de cr�dito',
  'Isen��o do ICMS no Simples Nacional para faixa de receita bruta',
  'Tributada pelo Simples Nacional com permiss�o de cr�dito e com cobran�a do ICMS por substitui��o tribut�ria',
  'Tributada pelo Simples Nacional sem permiss�o de cr�dito e com cobran�a do ICMS por substitui��o tribut�ria',
  'Isen��o do ICMS no Simples Nacional para faixa de receita bruta e com cobran�a do ICMS por substitui��o tribut�ria',
  'Imune',
  'N�o tributada pelo Simples Nacional',
  'ICMS cobrado anteriormente por substitui��o tribut�ria (substitu�do) ou por antecipa��o',
  'Outros'],
  FNfeDetalheAnexo.ComboBoxCsosnB);
  //Motivo de Desonera��o
  PreencheJvCombobox(['1','3','4','5','6','7','8','9','10','11','16','90'],
  ['T�xi',
  'Produtor Agropecu�rio',
  'Frotista/Locadora',
  'Diplom�tico/Consular',
  'Utilit�rios e Motocicletas da Amaz�nia Ocidental e �reas de Livre Com�rcio (Resolu��o 714/88 e 790/94 � CONTRAN e suas altera��es)',
  'SUFRAMA',
  'Venda a �rg�o P�blico',
  'Outros. (NT 2011/004)',
  'Deficiente Condutor (Conv�nio ICMS 38/12)',
  'Deficiente N�o Condutor (Conv�nio ICMS 38/12)',
  'Olimp�adas Rio 2016 (NT 2015.002)',
  'Solicitado pelo Fisco'],
  FNfeDetalheAnexo.ComboBoxMotivoDesoneracaoIcms);

  //Modalidade Base Calculo Icms Normal
  PreencheJvCombobox(['0','1','2','3'],
  ['Margem Valor Agregado (%)','Pauta (Valor)','Pre�o Tabelado M�x. (Valor)','Valor da Opera��o'],
  FNfeDetalheAnexo.ComboBoxModalidadeBcIcms);

   //Modalidade Base Calculo Icms ST
  PreencheJvCombobox(['0','1','2','3','4','5'],
  ['Pre�o Tabelado ou Maximo Sugerido','Lista Negativa (Valor)',
  'Lista Positiva (Valor)','Lista Neutra (Valor)','Margem Valor Agregado (%)','Valor da Opera��o','Pauta (Valor)'],
  FNfeDetalheAnexo.ComboBoxModalidadeBcIcmsST);


end;

class procedure TPreencheDadosGlobaisController.PreencheJvComboboxItensAbaPis;
begin
  PreencheJvCombobox(['01','02','03','04','05','06','07','08','09','49','50','51','52','53','54','55','56','60','61','62',
  '63','64','65','66','67','70','71','72','73','74','75','98','99'],
  ['Operacao Tributavel com Aliquota Basica','Operacao Tributavel com Aliquota Diferenciada',
  'Operacao Tributavel com Aliquota por Unidade de Me','Operacao Tributavel Monofasica - Revenda a Aliquota',
  'Operacao Tributavel por Substituicao Tributaria','Operacao Tributavel a Aliquota Zero','Operacao Isenta da Contribuicao',
  'Operacao sem Incidencia da Contribuicao','Operacao com Suspensao da Contribuicao','Outras Operac�es de Saida',
  'Operacao com Direito a Credito - Vinculada Exclusi','Operacao com Direito a Credito Vinculada Exclusi',
  'Operacao com Direito a Credito - Vinculada Exclusi','Operacao com Direito a Credito - Vinculada a Receita',
  'Operacao com Direito a Credito - Vinculada a Receita','Operacao com Direito a Credito - Vinculada a Recei',
  'Operacao com Direito a Credito - Vinculada a Recei','Credito Presumido - Operacao de Aquisicao Vinculad',
  'Credito Presumido - Operacao de Aquisicao Vinculad','Credito Presumido - Operacao de Aquisicao Vinculad',
  'Credito Presumido - Operacao de Aquisicao Vinculad','Credito Presumido - Operacao de Aquisicao Vinculad',
  'Credito Presumido - Operacao de Aquisicao Vinculad','Credito Presumido - Operacao de Aquisicao Vinculad',
  'Credito Presumido - Outras Operac�es','Operacao de Aquisicao sem Direito a Credito','Operacao de Aquisicao com Isencao',
  'Operacao de Aquisicao com Suspensao','Operacao de Aquisicao a Aliquota Zero','Operacao de Aquisicao sem Incidencia da Contribuic',
  'Operacao de Aquisicao por Substituicao Tributaria','Outras Operac�es de Entrada','Outras Operac�es'],
  FNfeDetalheAnexo.ComboBoxCstPis);
end;

class procedure TPreencheDadosGlobaisController.PreencheJvComboboxItensAbaCofins;
begin
  PreencheJvCombobox(['01','02','03','04','05','06','07','08','09','49','50','51','52','53','54','55','56','60','61','62',
  '63','64','65','66','67','70','71','72','73','74','75','98','99'],
  ['Operacao Tributavel com Aliquota Basica','Operacao Tributavel com Aliquota Diferenciada',
  'Operacao Tributavel com Aliquota por Unidade de Me','Operacao Tributavel Monofasica - Revenda a Aliquota',
  'Operacao Tributavel por Substituicao Tributaria','Operacao Tributavel a Aliquota Zero','Operacao Isenta da Contribuicao',
  'Operacao sem Incidencia da Contribuicao','Operacao com Suspensao da Contribuicao','Outras Operac�es de Saida',
  'Operacao com Direito a Credito - Vinculada Exclusi','Operacao com Direito a Credito Vinculada Exclusi',
  'Operacao com Direito a Credito - Vinculada Exclusi','Operacao com Direito a Credito - Vinculada a Receita',
  'Operacao com Direito a Credito - Vinculada a Receita','Operacao com Direito a Credito - Vinculada a Recei',
  'Operacao com Direito a Credito - Vinculada a Recei','Credito Presumido - Operacao de Aquisicao Vinculad',
  'Credito Presumido - Operacao de Aquisicao Vinculad','Credito Presumido - Operacao de Aquisicao Vinculad',
  'Credito Presumido - Operacao de Aquisicao Vinculad','Credito Presumido - Operacao de Aquisicao Vinculad',
  'Credito Presumido - Operacao de Aquisicao Vinculad','Credito Presumido - Operacao de Aquisicao Vinculad',
  'Credito Presumido - Outras Operac�es','Operacao de Aquisicao sem Direito a Credito','Operacao de Aquisicao com Isencao',
  'Operacao de Aquisicao com Suspensao','Operacao de Aquisicao a Aliquota Zero','Operacao de Aquisicao sem Incidencia da Contribuic',
  'Operacao de Aquisicao por Substituicao Tributaria','Outras Operac�es de Entrada','Outras Operac�es'],
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

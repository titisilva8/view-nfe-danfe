unit ImportaXmlParaComponentesVisuaisController;

interface

uses ACBrDFeSSL,ACBrNFeNotasFiscais,ACBrNFe,SysUtils,Vcl.Forms,
LabeledCtrls,Winapi.Windows, Winapi.Messages, Winapi.ShellAPI,
System.Variants, System.Classes,Vcl.Graphics, Vcl.Controls,  Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.Clipbrd, Vcl.StdCtrls,
  PDFium.Frame, Vcl.ComCtrls,Vcl.FileCtrl, ACBrDFeReport, ACBrDFeDANFeReport,
  ACBrNFeDANFEClass, ACBrNFeDANFeRLClass, ACBrBase, ACBrDFe, Data.DB,
  Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid,
  Datasnap.DBClient, Vcl.Buttons, Vcl.Mask,
  JvExMask, JvToolEdit, JvBaseEdits, pcnConversao,pcnConversaoNFe,UdataModuleNfe,PreencheDadosGlobaisController,
  UDataModuleTransiente;

 type
 TImportaXmlParaComponentesVisuaisController = class
   private
    class procedure CalculaValorTotalItem; static;

   public
     class procedure LimpaCds;
     class procedure CarregaXmlFormulario(Xml:String);
     class procedure TagIde(NFe:TAcbrNfe);
     class procedure TagTotal(NFe:TAcbrNfe);
     class procedure TagDest(Nfe:TAcbrNfe);
     class procedure TagEmit(Nfe:TAcbrNfe);
     class procedure TagEntrega(Nfe:TAcbrNfe);
     class procedure TagRetirada(Nfe:TAcbrNfe);
     class procedure TagTransp(Nfe:TAcbrNfe);
     class procedure TagInfadic(Nfe:TAcbrNfe);
     class procedure TagExporta(Nfe:TAcbrNfe);
     class procedure TagCompra(Nfe:TAcbrNfe);
     class procedure TagNfref(Nfe:TAcbrNfe);
     class procedure TagReboque(Nfe:TAcbrNfe);
     class procedure TagVol(Nfe:TacbrNfe);
     class procedure TagLacre(Nfe:TacbrNfe;FK:Integer);
     class procedure TagProd(Nfe:TAcbrNfe);
     class procedure TagImposto(Nfe:TAcbrNfe;FK:Integer);
     {1:1}
     class procedure TagISSQN(Nfe:TAcbrNfe;FK:Integer);
     class procedure TagIPI(Nfe:TAcbrNfe;FK:Integer);
     class procedure TagPIS(Nfe:TAcbrNfe;FK:Integer);
     class procedure TagCOFINS(Nfe:TAcbrNfe;FK:Integer);
     class procedure TagFCPDIFAL(Nfe:TAcbrNfe;FK:Integer);
     class procedure TagII(Nfe:TAcbrNfe;FK:Integer);
     class procedure TagICMS(Nfe:TAcbrNfe;FK:Integer);

     {1:n}
     class procedure TagDetExport(Nfe:TAcbrNfe;FK:Integer);
     class procedure TagDI(Nfe:TAcbrNfe;FK:Integer);
     class procedure TagAdi(Nfe:TAcbrNfe;IndiceProduto,IndiceDI:Integer);
     class procedure TagRasto(Nfe:TAcbrNfe;FK:Integer);

     class procedure TagPag(Nfe:TAcbrNfe);
     class procedure TagCobr(Nfe:TAcbrNfe);
     class procedure TagFat(Nfe:TAcbrNfe);
     class procedure TagDup(Nfe:TAcbrNfe);
     class procedure TagAutXml(Nfe:TAcbrNfe);

     class procedure TagCombustivel(Nfe:TAcbrNfe;FK:Integer);
     class procedure TagVeiculoNovo(Nfe:TAcbrNfe;FK:Integer);
     class procedure TagMedicamento(Nfe:TAcbrNfe;FK:Integer);

     class function GetTipoOperacao(Operacao:TpcnTipoNFe):Integer;
     class function VerificaCstPisNormal(Cst: TpcnCstPis):boolean;
     class procedure ConfiguraComboboxCstIcmsxIcmsSimples(Nfe: TAcbrNfe);
     class function GetCstIPI(Nfe:TAcbrNfe;FK:Integer):String;
     class function GetMotivoDesoneracaoIcms(Nfe:TAcbrNfe;FK:Integer):String;
     class function GetModalidadeBcICMSST(Nfe:TAcbrNfe;FK:Integer):String;
     class procedure TotalizaCreditoSimplesNacional(ValorCredito:Extended);
     class procedure TotalizaNotasFiscais(Cds:TClientDataSet;PainelDados:TPanel);
     class function GetValorTotalItem():Currency;
     class procedure CalculaCustoTotalItem;
     class function AbrirComDoWindows(Arquivo: string;CdsNotasFiscais:TClientDataSet): boolean;
 end;


implementation


{ TImportaXmlParaComponentesVisuaisController }

uses UNfeDetalheAnexo,UConverteXml,XmlPdfController;


class function TImportaXmlParaComponentesVisuaisController.AbrirComDoWindows(Arquivo: string;CdsNotasFiscais:TClientDataSet): boolean;
var Nfe:TAcbrNfe;
begin
  Result:=false;
  if arquivo <> ''  then
  if FileExists(arquivo) then
  begin
    Nfe:=TAcbrNfe.Create(nil);
    Nfe.NotasFiscais.LoadFromFile(Arquivo);
    CdsNotasFiscais.Append;
    CdsNotasFiscais.FieldByName('NUMERO').AsString:= IntToStr(Nfe.NotasFiscais.Items[0].NFe.Ide.nNF);
    CdsNotasFiscais.FieldByName('SERIE').AsString:= IntToStr(Nfe.NotasFiscais.Items[0].NFe.Ide.serie);
    CdsNotasFiscais.FieldByName('DATA_EMISSAO').AsDateTime:= Nfe.NotasFiscais.Items[0].NFe.Ide.dEmi;
    CdsNotasFiscais.FieldByName('DATA_SAIDA_ENTRADA').AsDateTime:= Nfe.NotasFiscais.Items[0].NFe.Ide.dSaiEnt;
    CdsNotasFiscais.FieldByName('FORNECEDOR_CLIENTE').AsString:= upperCase(Nfe.NotasFiscais.Items[0].NFe.Emit.xNome);
    CdsNotasFiscais.FieldByName('VALOR').AsCurrency:= Nfe.NotasFiscais.Items[0].NFe.Total.ICMSTot.vNF;
    CdsNotasFiscais.FieldByName('CAMINHO_ARQUIVO_XML').AsString:= Arquivo;
    CdsNotasFiscais.FieldByName('CHAVE_ACESSO').AsString:=Nfe.NotasFiscais.Items[0].NFe.procNFe.chNFe;
    CdsNotasFiscais.FieldByName('STATUS_NOTA').AsString:= IntToStr(Nfe.NotasFiscais.Items[0].NFe.Ide.nNF);
    CdsNotasFiscais.Post;
    CarregaXmlFormulario(Arquivo);
    TXmlPdfController.PreencheDadosItens(Nfe);
    Freeandnil(Nfe);
    Result:=true;
  end;
end;


class procedure TImportaXmlParaComponentesVisuaisController.CarregaXmlFormulario(Xml:String);
var Nfe:TAcbrNfe;
begin
  if FileExists(Xml) then
  begin
    try
      LimpaCds;
      Nfe:=TAcbrNfe.Create(nil);
      if Nfe.NotasFiscais.LoadFromFile(Xml) then
      begin
        //Aba Nfe
        TagIde(NFe);
        //Aba Informações Adicionais
        TagInfadic(Nfe);
        TagTotal(Nfe);
        //Aba Emitente
        TagEmit(Nfe);
        //Aba Destinatario
        TagDest(Nfe);
        //Aba Entrega/Retirada
        TagEntrega(Nfe);
        TagRetirada(Nfe);
        //Aba Documentos Referenciados
        TagNfref(Nfe);
        //Aba Transporte
        TagTransp(Nfe);
        //Aba Informações Pagamento
        TagPag(Nfe);
        //Aba Cobrança
        TagCobr(Nfe);
        //Aba Autorização Download
        TagAutXml(Nfe);
        TagExporta(Nfe);
        TagCompra(Nfe);
        //Aba Itens
        TagProd(Nfe);

      end;
    finally
      Freeandnil(Nfe);
    end;
  end;
end;

class procedure TImportaXmlParaComponentesVisuaisController.TagIde(NFe: TAcbrNfe);
var teste:string;
begin
  FDataModuleNfe.CDSNfeCabecalho.Append;
  FDataModuleNfe.CDSNfeCabecalho.FieldByName('ID').AsInteger:=1;
  FDataModuleNfe.CDSNfeCabecalho.FieldByName('TIPO_OPERACAO').AsString:=tpNFToStr(Nfe.NotasFiscais.Items[0].NFe.Ide.tpNF);
  FDataModuleNfe.CDSNfeCabecalho.FieldByName('NATUREZA_OPERACAO').AsString:=Nfe.NotasFiscais.Items[0].NFe.Ide.natOp;
  FDataModuleNfe.CDSNfeCabecalho.FieldByName('DATA_HORA_EMISSAO').AsDateTime:=Nfe.NotasFiscais.Items[0].NFe.Ide.dEmi;
  FDataModuleNfe.CDSNfeCabecalho.FieldByName('DATA_HORA_ENTRADA_SAIDA').AsDateTime:=Nfe.NotasFiscais.Items[0].NFe.Ide.dSaiEnt;
  FDataModuleNfe.CDSNfeCabecalho.FieldByName('CHAVE_ACESSO').AsString:=Nfe.NotasFiscais.Items[0].NFe.procNFe.chNFe;
  FDataModuleNfe.CDSNfeCabecalho.FieldByName('DIGITO_CHAVE_ACESSO').AsString:=IntToStr(Nfe.NotasFiscais.Items[0].NFe.Ide.cDV);
  FDataModuleNfe.CDSNfeCabecalho.FieldByName('CODIGO_NUMERICO').AsString:=IntToStr(Nfe.NotasFiscais.Items[0].NFe.Ide.cNF);
  FDataModuleNfe.CDSNfeCabecalho.FieldByName('SERIE').AsString:=IntToStr(Nfe.NotasFiscais.Items[0].NFe.Ide.serie);
  FDataModuleNfe.CDSNfeCabecalho.FieldByName('NUMERO').AsString:=IntToStr(Nfe.NotasFiscais.Items[0].NFe.Ide.nNF);
  FDataModuleNfe.CDSNfeCabecalho.FieldByName('FINALIDADE_EMISSAO').AsString:=FinNFeToStr(Nfe.NotasFiscais.Items[0].NFe.Ide.finNFe);
  FDataModuleNfe.CDSNfeCabecalho.FieldByName('CONSUMIDOR_PRESENCA').AsString:=PresencaCompradorToStr(Nfe.NotasFiscais.Items[0].NFe.Ide.indPres);
  FDataModuleNfe.CDSNfeCabecalho.FieldByName('INDICADOR_INTERMEDIADOR').AsString:=TipoIntermedioToStr(TpcnTipoIntermedio(Nfe.NotasFiscais.Items[0].NFe.Ide.indIntermed));
  FDataModuleNfe.CDSNfeCabecalho.FieldByName('CODIGO_MUNICIPIO').AsInteger:=Nfe.NotasFiscais.Items[0].NFe.Ide.cMunFG;
  FDataModuleNfe.CDSNfeCabecalho.FieldByName('TIPO_EMISSAO').AsString:=TpEmisToStr(Nfe.NotasFiscais.Items[0].NFe.Ide.tpEmis);
  FDataModuleNfe.CDSNfeCabecalho.FieldByName('DATA_ENTRADA_CONTINGENCIA').AsDateTime:=Nfe.NotasFiscais.Items[0].NFe.Ide.dhCont;
  FDataModuleNfe.CDSNfeCabecalho.FieldByName('JUSTIFICATIVA_CONTINGENCIA').AsString:=Nfe.NotasFiscais.Items[0].NFe.Ide.xJust;
  FDataModuleNfe.CDSNfeCabecalho.FieldByName('UF_EMITENTE').AsInteger:=Nfe.NotasFiscais.Items[0].NFe.Ide.cUF;
  FDataModuleNfe.CDSNfeCabecalho.FieldByName('CODIGO_MODELO').AsString:=IntToStr(Nfe.NotasFiscais.Items[0].NFe.Ide.modelo);
  FDataModuleNfe.CDSNfeCabecalho.FieldByName('FORMATO_IMPRESSAO_DANFE').AsString:=TpImpToStr(Nfe.NotasFiscais.Items[0].NFe.Ide.tpImp);
  FDataModuleNfe.CDSNfeCabecalho.FieldByName('UF_EMITENTE').AsInteger:=Nfe.NotasFiscais.Items[0].NFe.Ide.cUF;
  FDataModuleNfe.CDSNfeCabecalho.FieldByName('AMBIENTE').AsString:=TpAmbToStr(Nfe.NotasFiscais.Items[0].NFe.Ide.tpAmb);
  //campos que são da tag ide e que estao na aba destinatário
  FDataModuleNfe.CDSNfeCabecalho.FieldByName('CONSUMIDOR_OPERACAO').AsString:=ConsumidorFinalToStr(Nfe.NotasFiscais.Items[0].NFe.Ide.indFinal);
  FDataModuleNfe.CDSNfeCabecalho.FieldByName('LOCAL_DESTINO').AsString:=DestinoOperacaoToStr(Nfe.NotasFiscais.Items[0].NFe.Ide.idDest);
  //
  //TODO: COLOCAR CAMPO ABAIXO
  //Nfe.NotasFiscais.Items[0].NFe.Ide.verProc;
  FDataModuleNfe.CDSNfeCabecalho.Post;
end;

class procedure TImportaXmlParaComponentesVisuaisController.TagInfadic(Nfe: TAcbrNfe);
begin
  FDataModuleNfe.CDSNfeCabecalho.Edit;
  FDataModuleNfe.CDSNfeCabecalho.FieldByName('INFORMACOES_ADD_CONTRIBUINTE').AsString:=Nfe.NotasFiscais.Items[0].Nfe.infAdic.infCpl;
  FDataModuleNfe.CDSNfeCabecalho.FieldByName('INFORMACOES_ADD_FISCO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.infAdic.infAdFisco;
  FDataModuleNfe.CDSNfeCabecalho.Post;
end;

class procedure TImportaXmlParaComponentesVisuaisController.TagTotal(NFe: TAcbrNfe);
begin
  FDataModuleNfe.CDSNfeCabecalho.Edit;
  //Aba Totais Geral e FCP
  {$Region 'Tag ICMSTot'}
  //Aba Total Geral
  FDataModuleNfe.CdsNfeCabecalho.Fieldbyname('BASE_CALCULO_ICMS').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Total.ICMSTot.vBC;
  FDataModuleNfe.CdsNfeCabecalho.Fieldbyname('VALOR_ICMS').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Total.ICMSTot.vICMS;
  FDataModuleNfe.CdsNfeCabecalho.Fieldbyname('BASE_CALCULO_ICMS_ST').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Total.ICMSTot.vBCST;
  FDataModuleNfe.CdsNfeCabecalho.Fieldbyname('VALOR_ICMS_ST').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Total.ICMSTot.vST;
  FDataModuleNfe.CdsNfeCabecalho.Fieldbyname('VALOR_COFINS').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Total.ICMSTot.vCOFINS ;
  //Totalizador de credito de simples nacional nao vem no arquivo xml, entao fiz uma procedure para somar este valor na tagicms
  FDataModuleNfe.CdsNfeCabecalho.Fieldbyname('VALOR_TRIBUTOS').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Total.ICMSTot.vTotTrib;
  FDataModuleNfe.CdsNfeCabecalho.Fieldbyname('VALOR_ICMS_DESONERADO').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Total.ICMSTot.vICMSDeson;
  FDataModuleNfe.CdsNfeCabecalho.Fieldbyname('VALOR_FRETE').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Total.ICMSTot.vFrete ;
  FDataModuleNfe.CdsNfeCabecalho.Fieldbyname('VALOR_SEGURO').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Total.ICMSTot.vSeg ;
  FDataModuleNfe.CdsNfeCabecalho.Fieldbyname('VALOR_IPI').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Total.ICMSTot.vIPI;
  FDataModuleNfe.CdsNfeCabecalho.Fieldbyname('VALOR_TOTAL_PRODUTOS').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Total.ICMSTot.vProd ;
  FDataModuleNfe.CdsNfeCabecalho.Fieldbyname('VALOR_DESPESAS_ACESSORIAS').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Total.ICMSTot.vOutro ;
  FDataModuleNfe.CdsNfeCabecalho.Fieldbyname('VALOR_PIS').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Total.ICMSTot.vPIS ;
  FDataModuleNfe.CdsNfeCabecalho.Fieldbyname('VALOR_DESCONTO').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Total.ICMSTot.vDesc ;
  FDataModuleNfe.CdsNfeCabecalho.Fieldbyname('VALOR_IMPOSTO_IMPORTACAO').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Total.ICMSTot.vII ;
  FDataModuleNfe.CdsNfeCabecalho.Fieldbyname('VALOR_IPI_DEVOLVIDO').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Total.ICMSTot.vIPIDevol;
  FDataModuleNfe.CdsNfeCabecalho.Fieldbyname('VALOR_TOTAL').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Total.ICMSTot.vNF ;
  //Aba Total FCP
  FDataModuleNfe.CdsNfeCabecalho.Fieldbyname('VALOR_ICMS_UF_REMET').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Total.ICMSTot.vICMSUFRemet;
  FDataModuleNfe.CdsNfeCabecalho.Fieldbyname('VALOR_ICMS_UF_DEST').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Total.ICMSTot.vICMSUFDest;
  FDataModuleNfe.CdsNfeCabecalho.Fieldbyname('VALOR_FCP_UF_DEST').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Total.ICMSTot.vFCPUFDest;
  FDataModuleNfe.CdsNfeCabecalho.Fieldbyname('VALOR_ICMS_FCP').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Total.ICMSTot.vFCP;
  FDataModuleNfe.CdsNfeCabecalho.Fieldbyname('VALOR_ICMS_FCP_ST_RETIDO_ANTERIORMENTE').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Total.ICMSTot.vFCPSTRet;
  FDataModuleNfe.CdsNfeCabecalho.Fieldbyname('VALOR_ICMS_FCP_ST').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Total.ICMSTot.vFCPST;

  {$EndRegion}

  //Aba Serviços
  {$Region 'Tag ISSQNtot'}

  FDataModuleNfe.CdsNfeCabecalho.Fieldbyname('VALOR_SERVICOS').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Total.ISSQNtot.vServ ;
  FDataModuleNfe.CdsNfeCabecalho.Fieldbyname('BASE_CALCULO_ISSQN').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Total.ISSQNtot.vBC ;
  FDataModuleNfe.CdsNfeCabecalho.Fieldbyname('VALOR_ISSQN').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Total.ISSQNtot.vISS ;
  FDataModuleNfe.CdsNfeCabecalho.Fieldbyname('VALOR_PIS_ISSQN').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Total.ISSQNtot.vPIS ;
  FDataModuleNfe.CdsNfeCabecalho.Fieldbyname('VALOR_COFINS_ISSQN').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Total.ISSQNtot.vCOFINS ;

  {$EndRegion}

  {$Region 'Tag retTrib'}
  FDataModuleNfe.CdsNfeCabecalho.Fieldbyname('VALOR_RETIDO_PIS').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Total.retTrib.vRetPIS ;
  FDataModuleNfe.CdsNfeCabecalho.Fieldbyname('VALOR_RETIDO_COFINS').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Total.retTrib.vRetCOFINS ;
  FDataModuleNfe.CdsNfeCabecalho.Fieldbyname('VALOR_RETIDO_CSLL').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Total.retTrib.vRetCSLL ;
  FDataModuleNfe.CdsNfeCabecalho.Fieldbyname('VALOR_RETIDO_IRRF').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Total.retTrib.vIRRF ;
  FDataModuleNfe.CdsNfeCabecalho.Fieldbyname('BASE_CALCULO_IRRF').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Total.retTrib.vBCIRRF ;
  FDataModuleNfe.CdsNfeCabecalho.Fieldbyname('BASE_CALCULO_PREVIDENCIA').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Total.retTrib.vBCRetPrev ;
  FDataModuleNfe.CdsNfeCabecalho.Fieldbyname('VALOR_RETIDO_PREVIDENCIA').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Total.retTrib.vRetPrev ;
  {$EndRegion}

  FDataModuleNfe.CDSNfeCabecalho.Post;
end;

class procedure TImportaXmlParaComponentesVisuaisController.TagEmit(Nfe:TAcbrNfe);
begin
  FDataModuleNfe.CdsNfeEmitente.Append;
  FDataModuleNfe.CdsNfeEmitente.FieldByname('CPF_CNPJ').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Emit.CNPJCPF;
  FDataModuleNfe.CdsNfeEmitente.FieldByname('NOME').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Emit.xNome;
  FDataModuleNfe.CdsNfeEmitente.FieldByname('FANTASIA').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Emit.xFant;
  FDataModuleNfe.CdsNfeEmitente.FieldByname('LOGRADOURO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Emit.EnderEmit.xLgr;
  FDataModuleNfe.CdsNfeEmitente.FieldByname('NUMERO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Emit.EnderEmit.nro;
  FDataModuleNfe.CdsNfeEmitente.FieldByname('COMPLEMENTO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Emit.EnderEmit.xCpl;
  FDataModuleNfe.CdsNfeEmitente.FieldByname('BAIRRO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Emit.EnderEmit.xBairro;
  FDataModuleNfe.CdsNfeEmitente.FieldByname('CODIGO_MUNICIPIO').AsInteger:=Nfe.NotasFiscais.Items[0].Nfe.Emit.EnderEmit.cMun;
  FDataModuleNfe.CdsNfeEmitente.FieldByname('NOME_MUNICIPIO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Emit.EnderEmit.xMun;
  FDataModuleNfe.CdsNfeEmitente.FieldByname('UF').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Emit.EnderEmit.Uf;
  FDataModuleNfe.CdsNfeEmitente.FieldByname('CEP').AsString:=IntToStr(Nfe.NotasFiscais.Items[0].Nfe.Emit.EnderEmit.Cep);
  FDataModuleNfe.CdsNfeEmitente.FieldByname('CODIGO_PAIS').AsInteger:=Nfe.NotasFiscais.Items[0].Nfe.Emit.EnderEmit.cPais;
  FDataModuleNfe.CdsNfeEmitente.FieldByname('NOME_PAIS').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Emit.EnderEmit.xPais;
  FDataModuleNfe.CdsNfeEmitente.FieldByname('TELEFONE').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Emit.EnderEmit.Fone;
  FDataModuleNfe.CdsNfeEmitente.FieldByname('INSCRICAO_ESTADUAL').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Emit.Ie;
  FDataModuleNfe.CdsNfeEmitente.FieldByname('INSCRICAO_ESTADUAL_ST').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Emit.IEST;
  FDataModuleNfe.CdsNfeEmitente.FieldByname('INSCRICAO_MUNICIPAL').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Emit.IM;
  FDataModuleNfe.CdsNfeEmitente.FieldByname('CRT').AsString:=CRTToStr(Nfe.NotasFiscais.Items[0].Nfe.Emit.CRT);
  FDataModuleNfe.CdsNfeEmitente.FieldByname('CNAE').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Emit.CNAE;
  FDataModuleNfe.CdsNfeEmitente.Post;
end;

class procedure TImportaXmlParaComponentesVisuaisController.TagDest(NFe: TAcbrNfe);
begin
  FDataModuleNfe.CdsNfeDestinatario.Append;
  FDataModuleNfe.CdsNfeDestinatario.Fieldbyname('CPF_CNPJ').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Dest.CNPJCPF;
  FDataModuleNfe.CdsNfeDestinatario.Fieldbyname('NOME').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Dest.xNome;
  FDataModuleNfe.CdsNfeDestinatario.Fieldbyname('LOGRADOURO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Dest.EnderDest.xLgr;
  FDataModuleNfe.CdsNfeDestinatario.Fieldbyname('NUMERO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Dest.EnderDest.nro;
  FDataModuleNfe.CdsNfeDestinatario.Fieldbyname('COMPLEMENTO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Dest.EnderDest.xCpl;
  FDataModuleNfe.CdsNfeDestinatario.Fieldbyname('BAIRRO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Dest.EnderDest.xBairro;
  FDataModuleNfe.CdsNfeDestinatario.Fieldbyname('CODIGO_MUNICIPIO').AsInteger:=Nfe.NotasFiscais.Items[0].Nfe.Dest.EnderDest.cMun;
  FDataModuleNfe.CdsNfeDestinatario.Fieldbyname('NOME_MUNICIPIO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Dest.EnderDest.xMun;
  FDataModuleNfe.CdsNfeDestinatario.Fieldbyname('UF').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Dest.EnderDest.Uf;
  FDataModuleNfe.CdsNfeDestinatario.Fieldbyname('CEP').AsString:=IntToStr(Nfe.NotasFiscais.Items[0].Nfe.Dest.EnderDest.CEP);
  FDataModuleNfe.CdsNfeDestinatario.Fieldbyname('CODIGO_PAIS').AsInteger:=Nfe.NotasFiscais.Items[0].Nfe.Dest.EnderDest.cPais;
  FDataModuleNfe.CdsNfeDestinatario.Fieldbyname('NOME_PAIS').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Dest.EnderDest.xPais;
  FDataModuleNfe.CdsNfeDestinatario.Fieldbyname('TELEFONE').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Dest.EnderDest.Fone;
  FDataModuleNfe.CdsNfeDestinatario.Fieldbyname('INSCRICAO_ESTADUAL').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Dest.Ie;
  FDataModuleNfe.CdsNfeDestinatario.Fieldbyname('EMAIL').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Dest.Email;
  FDataModuleNfe.CdsNfeDestinatario.Fieldbyname('INDICADOR_IE').AsString:=indIEDestToStr(Nfe.NotasFiscais.Items[0].Nfe.Dest.indIEDest);
  FDataModuleNfe.CdsNfeDestinatario.Post;
end;

class procedure TImportaXmlParaComponentesVisuaisController.TagNfref(Nfe: TAcbrNfe);
var i:Integer;
begin
  if Nfe.NotasFiscais.Items[0].Nfe.Ide.Nfref.Count > 0 then
  begin
    for i := 0 to Nfe.NotasFiscais.Items[0].Nfe.Ide.Nfref.Count - 1 do
    begin
      { NF-e Referenciadas }
      if Nfe.NotasFiscais.Items[0].Nfe.Ide.Nfref.Items[i].refNFe <> '' then
      begin
        FDataModuleNfe.CDSNfeReferenciada.Append;
        FDataModuleNfe.CDSNfeReferenciada.FieldByName('ID').AsInteger := I;
        FDataModuleNfe.CDSNfeReferenciada.FieldByName('CHAVE_ACESSO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Ide.Nfref.Items[i].refNFe;
        FDataModuleNfe.CDSNfeReferenciada.Post
      end;

      { NF 1/1A Referenciadas }
      if Nfe.NotasFiscais.Items[0].Nfe.Ide.Nfref.Items[i].RefNF.nNF > 0 then
      begin
        FDataModuleNfe.CDSNfReferenciada.Append;
        FDataModuleNfe.CDSNfReferenciada.FieldByName('CODIGO_UF').AsInteger:=Nfe.NotasFiscais.Items[0].Nfe.Ide.Nfref.Items[i].RefNF.cUF;
        FDataModuleNfe.CDSNfReferenciada.FieldByName('ANO_MES').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Ide.Nfref.Items[i].RefNF.AAMM;
        FDataModuleNfe.CDSNfReferenciada.FieldByName('CNPJ').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Ide.Nfref.Items[i].RefNF.CNPJ;
        FDataModuleNfe.CDSNfReferenciada.FieldByName('MODELO').AsString:= IntToStr(Nfe.NotasFiscais.Items[0].Nfe.Ide.Nfref.Items[i].RefNF.modelo);
        FDataModuleNfe.CDSNfReferenciada.FieldByName('SERIE').AsString:=IntToStr(Nfe.NotasFiscais.Items[0].Nfe.Ide.Nfref.Items[i].RefNF.serie);
        FDataModuleNfe.CDSNfReferenciada.FieldByName('NUMERO_NF').AsString:= IntToStr(Nfe.NotasFiscais.Items[0].Nfe.Ide.Nfref.Items[i].RefNF.nNF);
        FDataModuleNfe.CDSNfReferenciada.Post;
      end;

      { NF de produtor rural referenciada }
       if Nfe.NotasFiscais.Items[0].Nfe.Ide.Nfref.Items[i].RefNFP.nNF > 0 then
       begin
         FDataModuleNfe.CDSNfRuralReferenciada.Append;
         FDataModuleNfe.CDSNfRuralReferenciada.FieldByName('ANO_MES').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Ide.NFref.Items[i].RefNFP.AAMM;
         if Length(Nfe.NotasFiscais.Items[0].Nfe.Ide.NFref.Items[i].RefNFP.CNPJCPF) = 14 then
         FDataModuleNfe.CDSNfRuralReferenciada.FieldByName('CNPJ').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Ide.NFref.Items[i].RefNFP.CNPJCPF;
         if Length(Nfe.NotasFiscais.Items[0].Nfe.Ide.NFref.Items[i].RefNFP.CNPJCPF) = 11 then
         FDataModuleNfe.CDSNfRuralReferenciada.FieldByName('CPF').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Ide.NFref.Items[i].RefNFP.CNPJCPF;
         FDataModuleNfe.CDSNfRuralReferenciada.FieldByName('INSCRICAO_ESTADUAL').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Ide.NFref.Items[i].RefNFP.IE;
         FDataModuleNfe.CDSNfRuralReferenciada.FieldByName('MODELO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Ide.NFref.Items[i].RefNFP.modelo;
         FDataModuleNfe.CDSNfRuralReferenciada.FieldByName('SERIE').AsString:=IntToStr(Nfe.NotasFiscais.Items[0].Nfe.Ide.NFref.Items[i].RefNFP.serie);
         FDataModuleNfe.CDSNfRuralReferenciada.FieldByName('NUMERO_NF').AsString:=IntToStr(Nfe.NotasFiscais.Items[0].Nfe.Ide.NFref.Items[i].RefNFP.nNF);
         FDataModuleNfe.CDSNfRuralReferenciada.FieldByName('CODIGO_UF').AsInteger:=Nfe.NotasFiscais.Items[0].Nfe.Ide.NFref.Items[i].RefNFP.cUF;
         FDataModuleNfe.CDSNfRuralReferenciada.Post;
       end;

       { Ct-e Referenciadas }
       if Nfe.NotasFiscais.Items[0].Nfe.Ide.Nfref.Items[i].refCTe <> '' then
       begin
         FDataModuleNfe.CDSCteReferenciado.Append;
         FDataModuleNfe.CDSCteReferenciado.FieldByName('ID').AsInteger := I;
         FDataModuleNfe.CDSCteReferenciado.FieldByName('CHAVE_ACESSO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Ide.Nfref.Items[i].refCTe;
         FDataModuleNfe.CDSCteReferenciado.Post
       end;

       { Cupom Fiscal Referenciadas }
       if Nfe.NotasFiscais.Items[0].Nfe.Ide.Nfref.Items[i].RefECF.nECF <> '' then
       begin
         FDataModuleNfe.CDSCupomReferenciado.Append;
         FDataModuleNfe.CDSCupomReferenciado.FieldByName('ID').AsInteger := I;
         FDataModuleNfe.CDSCupomReferenciado.FieldByName('MODELO_DOCUMENTO_FISCAL').AsString:=ECFModRefToStr(Nfe.NotasFiscais.Items[0].Nfe.Ide.Nfref.Items[i].RefECF.modelo);
         FDataModuleNfe.CDSCupomReferenciado.FieldByName('COO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Ide.Nfref.Items[i].RefECF.nCOO;
         FDataModuleNfe.CDSCupomReferenciado.FieldByName('NUMERO_ORDEM_ECF').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Ide.Nfref.Items[i].RefECF.nECF;
         FDataModuleNfe.CDSCupomReferenciado.Post;
       end;
    end;
  end;
end;

class procedure TImportaXmlParaComponentesVisuaisController.TagEntrega(Nfe: TAcbrNfe);
begin
  FDataModuleNfe.CDSNfeLocalEntrega.Append;
  FDataModuleNfe.CDSNfeLocalEntrega.FieldByName('CPF_CNPJ').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Entrega.CNPJCPF;
  FDataModuleNfe.CDSNfeLocalEntrega.FieldByName('LOGRADOURO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Entrega.xLgr;
  FDataModuleNfe.CDSNfeLocalEntrega.FieldByName('NUMERO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Entrega.nro;
  FDataModuleNfe.CDSNfeLocalEntrega.FieldByName('COMPLEMENTO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Entrega.xCpl;
  FDataModuleNfe.CDSNfeLocalEntrega.FieldByName('BAIRRO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Entrega.xBairro;
  FDataModuleNfe.CDSNfeLocalEntrega.FieldByName('CODIGO_MUNICIPIO').AsInteger:=Nfe.NotasFiscais.Items[0].Nfe.Entrega.cMun;
  FDataModuleNfe.CDSNfeLocalEntrega.FieldByName('NOME_MUNICIPIO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Entrega.xMun;
  FDataModuleNfe.CDSNfeLocalEntrega.FieldByName('UF').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Entrega.Uf;
  FDataModuleNfe.CDSNfeLocalEntrega.FieldByName('NOME').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Entrega.xNome;
  FDataModuleNfe.CDSNfeLocalEntrega.FieldByName('INSCRICAO_ESTADUAL').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Entrega.IE;
  FDataModuleNfe.CDSNfeLocalEntrega.FieldByName('CODIGO_PAIS').AsInteger:=Nfe.NotasFiscais.Items[0].Nfe.Entrega.cPais;
  FDataModuleNfe.CDSNfeLocalEntrega.FieldByName('NOME_PAIS').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Entrega.xPais;
  FDataModuleNfe.CDSNfeLocalEntrega.FieldByName('CEP').AsString:=IntToStr(Nfe.NotasFiscais.Items[0].Nfe.Entrega.CEP);
  FDataModuleNfe.CDSNfeLocalEntrega.FieldByName('TELEFONE').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Entrega.fone;
  FDataModuleNfe.CDSNfeLocalEntrega.FieldByName('EMAIL').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Entrega.Email;
  FDataModuleNfe.CDSNfeLocalEntrega.Post;
end;

class procedure TImportaXmlParaComponentesVisuaisController.TagRetirada(Nfe: TAcbrNfe);
begin
  FDataModuleNfe.CDSNfeLocalRetirada.Append;
  FDataModuleNfe.CDSNfeLocalRetirada.FieldByName('CPF_CNPJ').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Retirada.CNPJCPF;
  FDataModuleNfe.CDSNfeLocalRetirada.FieldByName('LOGRADOURO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Retirada.xLgr;
  FDataModuleNfe.CDSNfeLocalRetirada.FieldByName('NUMERO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Retirada.nro;
  FDataModuleNfe.CDSNfeLocalRetirada.FieldByName('COMPLEMENTO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Retirada.xCpl;
  FDataModuleNfe.CDSNfeLocalRetirada.FieldByName('BAIRRO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Retirada.xBairro;
  FDataModuleNfe.CDSNfeLocalRetirada.FieldByName('CODIGO_MUNICIPIO').AsInteger:=Nfe.NotasFiscais.Items[0].Nfe.Retirada.cMun;
  FDataModuleNfe.CDSNfeLocalRetirada.FieldByName('NOME_MUNICIPIO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Retirada.xMun;
  FDataModuleNfe.CDSNfeLocalRetirada.FieldByName('UF').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Retirada.Uf;
  FDataModuleNfe.CDSNfeLocalRetirada.FieldByName('NOME').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Retirada.xNome;
  FDataModuleNfe.CDSNfeLocalRetirada.FieldByName('INSCRICAO_ESTADUAL').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Retirada.IE;
  FDataModuleNfe.CDSNfeLocalRetirada.FieldByName('CODIGO_PAIS').AsInteger:=Nfe.NotasFiscais.Items[0].Nfe.Retirada.cPais;
  FDataModuleNfe.CDSNfeLocalRetirada.FieldByName('NOME_PAIS').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Retirada.xPais;
  FDataModuleNfe.CDSNfeLocalRetirada.FieldByName('CEP').AsString:=IntToStr(Nfe.NotasFiscais.Items[0].Nfe.Retirada.CEP);
  FDataModuleNfe.CDSNfeLocalRetirada.FieldByName('TELEFONE').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Retirada.fone;
  FDataModuleNfe.CDSNfeLocalRetirada.FieldByName('EMAIL').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Retirada.Email;
  FDataModuleNfe.CDSNfeLocalRetirada.Post;
end;

class procedure TImportaXmlParaComponentesVisuaisController.TagTransp(Nfe: TAcbrNfe);
begin
  FDataModuleNfe.CDSNfeTransporte.Append;
  FDataModuleNfe.CDSNfeTransporte.FieldByName('MODALIDADE_FRETE').AsString:=modFreteToStr(Nfe.NotasFiscais.Items[0].Nfe.Transp.modFrete);
  FDataModuleNfe.CDSNfeTransporte.FieldByName('CPF_CNPJ').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Transp.Transporta.CNPJCPF;
  FDataModuleNfe.CDSNfeTransporte.FieldByName('NOME').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Transp.Transporta.xNome;
  FDataModuleNfe.CDSNfeTransporte.FieldByName('INSCRICAO_ESTADUAL').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Transp.Transporta.Ie;
  FDataModuleNfe.CDSNfeTransporte.FieldByName('EMPRESA_ENDERECO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Transp.Transporta.xEnder;
  FDataModuleNfe.CDSNfeTransporte.FieldByName('NOME_MUNICIPIO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Transp.Transporta.xMun;
  FDataModuleNfe.CDSNfeTransporte.FieldByName('UF').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Transp.Transporta.Uf;

  FDataModuleNfe.CDSNfeTransporte.FieldByName('VALOR_SERVICO').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Transp.retTransp.vServ;
  FDataModuleNfe.CDSNfeTransporte.FieldByName('VALOR_BC_RETENCAO_ICMS').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Transp.retTransp.vBCRet;
  FDataModuleNfe.CDSNfeTransporte.FieldByName('ALIQUOTA_RETENCAO_ICMS').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Transp.retTransp.pICMSRet;
  FDataModuleNfe.CDSNfeTransporte.FieldByName('VALOR_ICMS_RETIDO').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Transp.retTransp.vICMSRet;
  FDataModuleNfe.CDSNfeTransporte.FieldByName('CFOP').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Transp.retTransp.Cfop;
  FDataModuleNfe.CDSNfeTransporte.FieldByName('MUNICIPIO').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Transp.retTransp.cMunFG;

  FDataModuleNfe.CDSNfeTransporte.FieldByName('PLACA_VEICULO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Transp.veicTransp.placa;
  FDataModuleNfe.CDSNfeTransporte.FieldByName('UF_VEICULO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Transp.veicTransp.Uf;
  FDataModuleNfe.CDSNfeTransporte.FieldByName('RNTC_VEICULO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Transp.veicTransp.RNTC;
  FDataModuleNfe.CDSNfeTransporte.FieldByName('VAGAO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Transp.vagao;
  FDataModuleNfe.CDSNfeTransporte.FieldByName('BALSA').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Transp.balsa;

  TagReboque(Nfe);
  TagVol(Nfe);
  FDataModuleNfe.CDSNfeTransporte.Post;

end;

class procedure TImportaXmlParaComponentesVisuaisController.TagReboque(Nfe:TAcbrNfe);
var i:Integer;
begin
  if Nfe.NotasFiscais.Items[0].Nfe.Transp.Reboque.Count > 0 then
  begin
    for i:= 0 to Nfe.NotasFiscais.Items[0].Nfe.Transp.Reboque.Count - 1 do
    begin
      FDataModuleNfe.CDSNfeTransporteReboque.Append;
      FDataModuleNfe.CDSNfeTransporteReboque.FieldByName('ID').AsInteger := I;
      FDataModuleNfe.CDSNfeTransporteReboque.FieldByName('PLACA').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Transp.Reboque.Items[i].placa;
      FDataModuleNfe.CDSNfeTransporteReboque.FieldByName('UF').AsString:= Nfe.NotasFiscais.Items[0].Nfe.Transp.Reboque.Items[i].Uf;
      FDataModuleNfe.CDSNfeTransporteReboque.FieldByName('RNTC').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Transp.Reboque.Items[i].RNTC;
      FDataModuleNfe.CDSNfeTransporteReboque.Post;
    end;
  end;
end;

class procedure TImportaXmlParaComponentesVisuaisController.TagVeiculoNovo(Nfe: TAcbrNfe; FK: Integer);
begin
  if Assigned(Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].prod.veicProd) then
  begin
    FDataModuleNfe.CdsNfeDetalheVeiculo.Append;
    FDataModuleNfe.CdsNfeDetalheVeiculo.FieldByName('TIPO_OPERACAO').Value:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.veicProd.tpOP;
    FDataModuleNfe.CdsNfeDetalheVeiculo.FieldByName('CHASSI').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.veicProd.chassi;
    FDataModuleNfe.CdsNfeDetalheVeiculo.FieldByName('COR').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.veicProd.cCor;
    FDataModuleNfe.CdsNfeDetalheVeiculo.FieldByName('DESCRICAO_COR').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.veicProd.xCor;
    FDataModuleNfe.CdsNfeDetalheVeiculo.FieldByName('POTENCIA_MOTOR').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.veicProd.pot;
    FDataModuleNfe.CdsNfeDetalheVeiculo.FieldByName('CILINDRADAS').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.veicProd.Cilin;
    FDataModuleNfe.CdsNfeDetalheVeiculo.FieldByName('PESO_LIQUIDO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.veicProd.pesoL;
    FDataModuleNfe.CdsNfeDetalheVeiculo.FieldByName('PESO_BRUTO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.veicProd.pesoB;
    FDataModuleNfe.CdsNfeDetalheVeiculo.FieldByName('NUMERO_SERIE').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.veicProd.nSerie;
    FDataModuleNfe.CdsNfeDetalheVeiculo.FieldByName('TIPO_COMBUSTIVEL').Value:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.veicProd.tpComb;
    FDataModuleNfe.CdsNfeDetalheVeiculo.FieldByName('NUMERO_MOTOR').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.veicProd.nMotor;
    FDataModuleNfe.CdsNfeDetalheVeiculo.FieldByName('CAPACIDADE_MAXIMA_TRACAO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.veicProd.CMT;
    FDataModuleNfe.CdsNfeDetalheVeiculo.FieldByName('DISTANCIA_EIXOS').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.veicProd.dist;
    FDataModuleNfe.CdsNfeDetalheVeiculo.FieldByName('ANO_MODELO').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.veicProd.anoMod;
    FDataModuleNfe.CdsNfeDetalheVeiculo.FieldByName('ANO_FABRICACAO').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.veicProd.anoFab;
    FDataModuleNfe.CdsNfeDetalheVeiculo.FieldByName('TIPO_PINTURA').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.veicProd.tpPint;
    FDataModuleNfe.CdsNfeDetalheVeiculo.FieldByName('TIPO_VEICULO').Value:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.veicProd.tpVeic;
    FDataModuleNfe.CdsNfeDetalheVeiculo.FieldByName('ESPECIE_VEICULO').Value:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.veicProd.espVeic;
    FDataModuleNfe.CdsNfeDetalheVeiculo.FieldByName('CONDICAO_VIN').Value:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.veicProd.VIN;
    FDataModuleNfe.CdsNfeDetalheVeiculo.FieldByName('CONDICAO_VEICULO').Value:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.veicProd.condVeic;
    FDataModuleNfe.CdsNfeDetalheVeiculo.FieldByName('CODIGO_MARCA_MODELO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.veicProd.cMod;
    FDataModuleNfe.CdsNfeDetalheVeiculo.FieldByName('CODIGO_COR').Value:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.veicProd.cCorDENATRAN;
    FDataModuleNfe.CdsNfeDetalheVeiculo.FieldByName('LOTACAO').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.veicProd.lota;
    FDataModuleNfe.CdsNfeDetalheVeiculo.FieldByName('RESTRICAO').Value:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.veicProd.tpRest;
    FDataModuleNfe.CdsNfeDetalheVeiculo.Post;
  end;
end;

class procedure TImportaXmlParaComponentesVisuaisController.TagVol(Nfe: TacbrNfe);
var i:integer;
begin
  if Nfe.NotasFiscais.Items[0].Nfe.Transp.Vol.Count > 0 then
  begin
    for i := 0 to Nfe.NotasFiscais.Items[0].Nfe.Transp.Vol.Count - 1 do
    begin
      FDataModuleNfe.CDSNfeTransporteVolume.Append;
      FDataModuleNfe.CDSNfeTransporteVolume.FieldByName('ID').AsInteger := I;
      FDataModuleNfe.CDSNfeTransporteVolume.FieldByName('QUANTIDADE').AsExtended:= Nfe.NotasFiscais.Items[0].Nfe.Transp.Vol.Items[i].qVol;
      FDataModuleNfe.CDSNfeTransporteVolume.FieldByName('ESPECIE').AsString:= Nfe.NotasFiscais.Items[0].Nfe.Transp.Vol.Items[i].esp;
      FDataModuleNfe.CDSNfeTransporteVolume.FieldByName('MARCA').AsString:= Nfe.NotasFiscais.Items[0].Nfe.Transp.Vol.Items[i].Marca;
      FDataModuleNfe.CDSNfeTransporteVolume.FieldByName('NUMERACAO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Transp.Vol.Items[i].nVol;
      FDataModuleNfe.CDSNfeTransporteVolume.FieldByName('PESO_LIQUIDO').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Transp.Vol.Items[i].pesoL;
      FDataModuleNfe.CDSNfeTransporteVolume.FieldByName('PESO_BRUTO').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Transp.Vol.Items[i].pesoB;
      FDataModuleNfe.CDSNfeTransporteVolume.Post;
      TagLacre(Nfe,i);

    end;
  end;
end;

class procedure TImportaXmlParaComponentesVisuaisController.TagLacre(Nfe: TacbrNfe; FK: Integer);
var i:Integer;
begin
  if Nfe.NotasFiscais.Items[0].Nfe.Transp.Vol.Items[FK].Lacres.Count > 0 then
  begin
    for i := 0 to Nfe.NotasFiscais.Items[0].Nfe.Transp.Vol.Items[FK].Lacres.Count - 1 do
    begin
      FDataModuleNfe.CDSNfeTransporteVolumeLacre.Append;
      FDataModuleNfe.CDSNfeTransporteVolumeLacre.FieldByName('ID').AsInteger := I;
      FDataModuleNfe.CDSNfeTransporteVolumeLacre.FieldByName('ID_NFE_TRANSPORTE_VOLUME').AsInteger := FK;
      FDataModuleNfe.CDSNfeTransporteVolumeLacre.FieldByName('NUMERO').AsString:= Nfe.NotasFiscais.Items[0].Nfe.Transp.Vol.Items[FK].Lacres.Items[i].nLacre;
    end;
  end;
end;

class procedure TImportaXmlParaComponentesVisuaisController.TagMedicamento(Nfe: TAcbrNfe; FK: Integer);
begin
  if Assigned(Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].prod.med) then
  begin
    FDataModuleNfe.CdsNfeDetalheMedicamento.Append;
    FDataModuleNfe.CdsNfeDetalheMedicamento.FieldByName('NUMERO_LOTE').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.med.Add.nLote;
    FDataModuleNfe.CdsNfeDetalheMedicamento.FieldByName('QUANTIDADE_LOTE').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.med.Add.qLote;
    FDataModuleNfe.CdsNfeDetalheMedicamento.FieldByName('DATA_FABRICACAO').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.med.Add.dFab;
    FDataModuleNfe.CdsNfeDetalheMedicamento.FieldByName('DATA_VALIDADE').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.med.Add.dVal;
    FDataModuleNfe.CdsNfeDetalheMedicamento.FieldByName('PRECO_MAXIMO_CONSUMIDOR').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.med.Add.vPMC;
    FDataModuleNfe.CdsNfeDetalheMedicamento.Post;
  end;
end;

class procedure TImportaXmlParaComponentesVisuaisController.TagCombustivel(Nfe: TAcbrNfe; FK: Integer);
begin
  if Assigned(Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].prod.comb) then
  begin
    FDataModuleNfe.CdsNfeDetalheCombustivel.Append;
    FDataModuleNfe.CdsNfeDetalheCombustivel.FieldByName('CODIGO_ANP').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.comb.cProdANP;
    FDataModuleNfe.CdsNfeDetalheCombustivel.FieldByName('PERCENTUAL_GAS_NATURAL').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.comb.pGNn;
    FDataModuleNfe.CdsNfeDetalheCombustivel.FieldByName('CODIF').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.comb.CODIF;
    FDataModuleNfe.CdsNfeDetalheCombustivel.FieldByName('QUANTIDADE_TEMP_AMBIENTE').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.comb.qTemp;
    FDataModuleNfe.CdsNfeDetalheCombustivel.FieldByName('UF_CONSUMO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.comb.UFcons;
    FDataModuleNfe.CdsNfeDetalheCombustivel.FieldByName('BASE_CALCULO_CIDE').Value:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.comb.CIDE.qBCProd;
    FDataModuleNfe.CdsNfeDetalheCombustivel.FieldByName('ALIQUOTA_CIDE').value:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.comb.CIDE.vAliqProd;
    FDataModuleNfe.CdsNfeDetalheCombustivel.FieldByName('VALOR_CIDE').value:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.comb.CIDE.vCIDE;
    FDataModuleNfe.CdsNfeDetalheCombustivel.Post;
  end;

end;

class procedure TImportaXmlParaComponentesVisuaisController.TagCompra(Nfe: TAcbrNfe);
begin
 FDataModuleNfe.CDSNfeCabecalho.Edit;
 FDataModuleNfe.CDSNfeCabecalho.FieldByName('COMPRA_NOTA_EMPENHO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.compra.xNEmp;
 FDataModuleNfe.CDSNfeCabecalho.FieldByName('COMPRA_PEDIDO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.compra.xPed;
 FDataModuleNfe.CDSNfeCabecalho.FieldByName('COMPRA_CONTRATO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.compra.xCont;
 FDataModuleNfe.CDSNfeCabecalho.Post;
end;

class procedure TImportaXmlParaComponentesVisuaisController.TagExporta(Nfe: TAcbrNfe);
begin
  FDataModuleNfe.CDSNfeCabecalho.Edit;
  FDataModuleNfe.CDSNfeCabecalho.FieldByName('COMEX_UF_EMBARQUE').AsString:=Nfe.NotasFiscais.Items[0].Nfe.exporta.UFSaidaPais;
  FDataModuleNfe.CDSNfeCabecalho.FieldByName('COMEX_LOCAL_EMBARQUE').AsString:=Nfe.NotasFiscais.Items[0].Nfe.exporta.xLocExporta;
  FDataModuleNfe.CDSNfeCabecalho.FieldByName('COMEX_LOCAL_DESPACHO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.exporta.xLocDespacho;
  FDataModuleNfe.CDSNfeCabecalho.Post;
end;

class procedure TImportaXmlParaComponentesVisuaisController.TagCobr(Nfe: TAcbrNfe);
begin
  TagFat(Nfe);
end;

class procedure TImportaXmlParaComponentesVisuaisController.TagFat(Nfe: TAcbrNfe);
begin
  FDataModuleNfe.CDSNfeFatura.Edit;
  FDataModuleNfe.CDSNfeFatura.FieldByName('NUMERO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Cobr.Fat.nFat;
  FDataModuleNfe.CDSNfeFatura.FieldByName('VALOR_ORIGINAL').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Cobr.Fat.vOrig;
  FDataModuleNfe.CDSNfeFatura.FieldByName('VALOR_DESCONTO').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Cobr.Fat.vDesc;
  FDataModuleNfe.CDSNfeFatura.FieldByName('VALOR_LIQUIDO').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Cobr.Fat.vLiq;
  FDataModuleNfe.CDSNfeFatura.Post;
  TagDup(Nfe);
end;

class procedure TImportaXmlParaComponentesVisuaisController.TagDup(Nfe: TAcbrNfe);
var I:Integer;
begin
  FDataModuleNfe.CDSNfeDuplicata.EmptyDataSet;
  if Nfe.NotasFiscais.Items[0].Nfe.Cobr.Dup.Count > 0 then
  begin
    for I := 0 to Nfe.NotasFiscais.Items[0].Nfe.Cobr.Dup.Count - 1 do
    begin
      FDataModuleNfe.CDSNfeDuplicata.Append;
      FDataModuleNfe.CDSNfeDuplicata.FieldByName('NUMERO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Cobr.Dup.Items[I].nDup;
      FDataModuleNfe.CDSNfeDuplicata.FieldByName('DATA_VENCIMENTO').AsDateTime:=Nfe.NotasFiscais.Items[0].Nfe.Cobr.Dup.Items[I].dVenc;
      FDataModuleNfe.CDSNfeDuplicata.FieldByName('VALOR').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Cobr.Dup.Items[I].vDup;
      FDataModuleNfe.CDSNfeDuplicata.Post;
    end;
  end;
end;

class procedure TImportaXmlParaComponentesVisuaisController.TagPag(Nfe: TAcbrNfe);
var I:Integer;
begin
  FDataModuleNfe.CdsNfeFormaPagamento.EmptyDataSet;
  if Nfe.NotasFiscais.Items[0].Nfe.pag.Count > 0 then
  begin
    for I := 0 to Nfe.NotasFiscais.Items[0].Nfe.pag.Count - 1 do
    begin
      FDataModuleNfe.CdsNfeFormaPagamento.Append;
      FDataModuleNfe.CdsNfeFormaPagamento.FieldByName('MEIO_PAGAMENTO').AsString:=FormaPagamentoToStr(Nfe.NotasFiscais.Items[0].Nfe.pag.Items[I].tPag);
      FDataModuleNfe.CdsNfeFormaPagamento.FieldByName('MEIO_PAGAMENTO_DESCRICAO').AsString:=
      TPreencheDadosGlobaisController.GetCampoTransiente(FDataModuleNfe.CdsNfeFormaPagamento.FieldByName('MEIO_PAGAMENTO').AsString,
      FDataModuleTransiente.CdsMeioPagamento);

      FDataModuleNfe.CdsNfeFormaPagamento.FieldByName('FORMA_RECEBIMENTO').AsString:=IndpagToStr(Nfe.NotasFiscais.Items[0].Nfe.pag.Items[I].indPag);
      FDataModuleNfe.CdsNfeFormaPagamento.FieldByName('FORMA_RECEBIMENTO_DESCRICAO').AsString:=
      TPreencheDadosGlobaisController.GetCampoTransiente(FDataModuleNfe.CdsNfeFormaPagamento.FieldByName('FORMA_RECEBIMENTO').AsString,
      FDataModuleTransiente.CdsFormaPagamento);

      FDataModuleNfe.CdsNfeFormaPagamento.FieldByName('DESCRICAO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.pag.Items[I].xPag;
      FDataModuleNfe.CdsNfeFormaPagamento.FieldByName('VALOR').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.pag.Items[I].vPag;
      FDataModuleNfe.CdsNfeFormaPagamento.FieldByName('CNPJ_OPERADORA_CARTAO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.pag.Items[I].CNPJ;
      FDataModuleNfe.CdsNfeFormaPagamento.FieldByName('BANDEIRA').AsString:=BandeiraCartaoToStr(Nfe.NotasFiscais.Items[0].Nfe.pag.Items[I].tBand);
      FDataModuleNfe.CdsNfeFormaPagamento.FieldByName('NUMERO_AUTORIZACAO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.pag.Items[I].cAut;
      FDataModuleNfe.CdsNfeFormaPagamento.Post;
    end;
  end;
end;

class procedure TImportaXmlParaComponentesVisuaisController.TagAutXml(Nfe: TAcbrNfe);
var I:Integer;
begin
  FDataModuleNfe.CDSNfeAutorizacaoDownload.EmptyDataSet;
  if Nfe.NotasFiscais.Items[0].NFe.autXML.Count > 0 then
  begin
    for I := 0 to Nfe.NotasFiscais.Items[0].NFe.autXML.Count - 1 do
    begin
      FDataModuleNfe.CDSNfeAutorizacaoDownload.Append;
      FDataModuleNfe.CDSNfeAutorizacaoDownload.FieldByName('CNPJ_CPF').AsString:=Nfe.NotasFiscais.Items[0].NFe.autXML.Items[i].CNPJCPF;
      FDataModuleNfe.CDSNfeAutorizacaoDownload.Post;
    end;
  end;
end;

class procedure TImportaXmlParaComponentesVisuaisController.TagProd(Nfe: TAcbrNfe);
var i:Integer;
begin
  for I := 0 to Nfe.NotasFiscais.Items[0].Nfe.Det.Count -1  do
  begin
    FDataModuleNFe.CDSNfeDetalhe.Append;
    FDataModuleNFe.CDSNfeDetalhe.FieldByName('ID').AsInteger:=I;
    FDataModuleNFe.CDSNfeDetalhe.FieldByName('NUMERO_ITEM').AsInteger:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[i].Prod.nItem;
    FDataModuleNFe.CDSNfeDetalhe.FieldByName('NOME_PRODUTO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[i].Prod.xProd;
    FdataModuleNfe.CDSNfeDetalhe.FieldByName('CODIGO_PRODUTO').AsString:=NFE.NotasFiscais.Items[0].Nfe.Det.Items[i].Prod.cProd;
    FdataModuleNfe.CDSNfeDetalhe.FieldByName('GTIN').AsString:=NFE.NotasFiscais.Items[0].Nfe.Det.Items[i].Prod.cEAN;
    FdataModuleNfe.CDSNfeDetalhe.FieldByName('NCM').AsString:=NFE.NotasFiscais.Items[0].Nfe.Det.Items[i].Prod.Ncm;
    FdataModuleNfe.CDSNfeDetalhe.FieldByName('CEST').AsString:=NFE.NotasFiscais.Items[0].Nfe.Det.Items[i].Prod.CEST;
    FdataModuleNfe.CDSNfeDetalhe.FieldByName('INDICADOR_ESCALA_RELEVANTE').AsString:=IndEscalaToStr(NFE.NotasFiscais.Items[0].Nfe.Det.Items[i].Prod.indEscala);
    FdataModuleNfe.CDSNfeDetalhe.FieldByName('CNPJ_FABRICANTE').AsString:=NFE.NotasFiscais.Items[0].Nfe.Det.Items[i].Prod.CNPJFab;
    FdataModuleNfe.CDSNfeDetalhe.FieldByName('BENEFICIO_FISCAL_UF').AsString:=NFE.NotasFiscais.Items[0].Nfe.Det.Items[i].Prod.cBenef;
    FdataModuleNfe.CDSNfeDetalhe.FieldByName('EX_TIPI').AsString:=NFE.NotasFiscais.Items[0].Nfe.Det.Items[i].Prod.EXTIPI;
    FdataModuleNfe.CDSNfeDetalhe.FieldByName('CFOP').AsString:=NFE.NotasFiscais.Items[0].Nfe.Det.Items[i].Prod.Cfop;
    FdataModuleNfe.CDSNfeDetalhe.FieldByName('UNIDADE_COMERCIAL').AsString:=NFE.NotasFiscais.Items[0].Nfe.Det.Items[i].Prod.uCom;
    FdataModuleNfe.CDSNfeDetalhe.FieldByName('QUANTIDADE_COMERCIAL').AsExtended:=NFE.NotasFiscais.Items[0].Nfe.Det.Items[i].Prod.qCom;
    FdataModuleNfe.CDSNfeDetalhe.FieldByName('VALOR_UNITARIO_COMERCIAL').AsExtended:=NFE.NotasFiscais.Items[0].Nfe.Det.Items[i].Prod.vUnCom;
    FdataModuleNfe.CDSNfeDetalhe.FieldByName('VALOR_BRUTO_PRODUTO').AsExtended:=NFE.NotasFiscais.Items[0].Nfe.Det.Items[i].Prod.vProd;
    FdataModuleNfe.CDSNfeDetalhe.FieldByName('GTIN_UNIDADE_TRIBUTAVEL').AsString:=NFE.NotasFiscais.Items[0].Nfe.Det.Items[i].Prod.cEANTrib;
    FdataModuleNfe.CDSNfeDetalhe.FieldByName('UNIDADE_TRIBUTAVEL').AsString:=NFE.NotasFiscais.Items[0].Nfe.Det.Items[i].Prod.uTrib;
    FdataModuleNfe.CDSNfeDetalhe.FieldByName('QUANTIDADE_TRIBUTAVEL').AsExtended:=NFE.NotasFiscais.Items[0].Nfe.Det.Items[i].Prod.qTrib;
    FdataModuleNfe.CDSNfeDetalhe.FieldByName('VALOR_UNITARIO_TRIBUTAVEL').AsExtended:=NFE.NotasFiscais.Items[0].Nfe.Det.Items[i].Prod.vUnTrib ;
    FdataModuleNfe.CDSNfeDetalhe.FieldByName('VALOR_FRETE').AsExtended:=NFE.NotasFiscais.Items[0].Nfe.Det.Items[i].Prod.vFrete;
    FdataModuleNfe.CDSNfeDetalhe.FieldByName('VALOR_SEGURO').AsExtended:=NFE.NotasFiscais.Items[0].Nfe.Det.Items[i].Prod.vSeg;
    FdataModuleNfe.CDSNfeDetalhe.FieldByName('VALOR_DESCONTO').AsExtended:=NFE.NotasFiscais.Items[0].Nfe.Det.Items[i].Prod.vDesc;
    FdataModuleNfe.CDSNfeDetalhe.FieldByName('VALOR_OUTRAS_DESPESAS').AsExtended:=NFE.NotasFiscais.Items[0].Nfe.Det.Items[i].Prod.vOutro;
    FdataModuleNfe.CDSNfeDetalhe.FieldByName('VALOR_TOTAL').AsExtended:=GetValorTotalItem;
    FdataModuleNfe.CDSNfeDetalhe.FieldByName('ENTRA_TOTAL').AsString:=indTotToStr(NFE.NotasFiscais.Items[0].Nfe.Det.Items[i].Prod.IndTot);
    FDataModuleNFe.CDSNfeDetalhe.FieldByName('INFORMACOES_ADICIONAIS').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[I].infAdProd;
    FDataModuleNfe.CDSNfeDetalhe.FieldByName('PERCENTUAL_DEVOLVIDO').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[I].pDevol;
    FDataModuleNfe.CDSNfeDetalhe.FieldByName('VALOR_IPI_DEVOLVIDO').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[I].vIPIDevol;
    FdataModuleNfe.CDSNfeDetalhe.FieldByName('VALOR_TOTAL_TRIBUTOS').AsExtended:=NFE.NotasFiscais.Items[0].Nfe.Det.Items[i].Imposto.vTotTrib;
    FDataModuleNFe.CDSNfeDetalhe.Post;
    TagImposto(Nfe,i);
    CalculaCustoTotalItem;
  end;

end;

class procedure TImportaXmlParaComponentesVisuaisController.TagImposto(Nfe: TAcbrNfe; FK: Integer);
begin
  {1:1}
  ConfiguraComboboxCstIcmsxIcmsSimples(Nfe);
  TagIPI(Nfe,FK);
  TagICMS(Nfe,FK);
  TagPIS(Nfe,FK);
  TagCOFINS(Nfe,FK);
  TagFCPDIFAL(Nfe,FK);
  TagII(Nfe,FK);
  TagRasto(Nfe,FK);
  TagISSQN(Nfe,FK);
  {1:n}
  TagDetExport(Nfe,FK);
  TagDI(Nfe,FK);

  TagCombustivel(Nfe,FK);
  TagVeiculoNovo(Nfe,FK);
  TagMedicamento(NFe,FK);

end;

class procedure TImportaXmlParaComponentesVisuaisController.TagIPI(Nfe: TAcbrNfe; FK: Integer);
begin
  if Assigned(Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.IPI) then
  begin
    FDataModuleNfe.CDSNfeDetalheImpostoIpi.Append;
    FDataModuleNfe.CDSNfeDetalheImpostoIpi.FieldByName('ID').AsInteger:=FK;
    FDataModuleNfe.CDSNfeDetalheImpostoIpi.FieldByName('ID_NFE_DETALHE').AsInteger:=FK;
    FDataModuleNfe.CDSNfeDetalheImpostoIpi.FieldByName('ENQUADRAMENTO_IPI').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.IPI.clEnq;
    FDataModuleNfe.CDSNfeDetalheImpostoIpi.FieldByName('ENQUADRAMENTO_LEGAL_IPI').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.IPI.cEnq;
    FDataModuleNfe.CDSNfeDetalheImpostoIpi.FieldByName('CNPJ_PRODUTOR').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.IPI.CNPJProd;
    FDataModuleNfe.CDSNfeDetalheImpostoIpi.FieldByName('CODIGO_SELO_IPI').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.IPI.cSelo;
    FDataModuleNfe.CDSNfeDetalheImpostoIpi.FieldByName('QUANTIDADE_SELO_IPI').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.IPI.qSelo;
    FDataModuleNfe.CDSNfeDetalheImpostoIpi.FieldByName('CST_IPI').AsString:=GetCstIPI(Nfe,FK);
    FDataModuleNfe.CDSNfeDetalheImpostoIpi.FieldByName('VALOR_BASE_CALCULO_IPI').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.IPI.vBC;
    FDataModuleNfe.CDSNfeDetalheImpostoIpi.FieldByName('ALIQUOTA_IPI').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.IPI.pIPI;
    FDataModuleNfe.CDSNfeDetalheImpostoIpi.FieldByName('QUANTIDADE_UNIDADE_TRIBUTAVEL').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.IPI.qUnid;
    FDataModuleNfe.CDSNfeDetalheImpostoIpi.FieldByName('VALOR_UNIDADE_TRIBUTAVEL').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.IPI.vUnid;
    FDataModuleNfe.CDSNfeDetalheImpostoIpi.FieldByName('VALOR_IPI').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.IPI.vIPI;
    FDataModuleNfe.CDSNfeDetalheImpostoIpi.Post;
  end;
end;

class procedure TImportaXmlParaComponentesVisuaisController.TagICMS(Nfe: TAcbrNfe; FK: Integer);
begin
  if Assigned(Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.ICMS) then
  begin
    FDataModuleNfe.CDSNfeImpostoIcms.Append;
    FDataModuleNfe.CDSNfeImpostoIcms.FieldByName('ID').AsInteger:=FK;
    FDataModuleNfe.CDSNfeImpostoIcms.FieldByName('ID_NFE_DETALHE').AsInteger:=FK;
    FDataModuleNfe.CDSNfeImpostoIcms.FieldByName('ORIGEM_MERCADORIA').AsString:=OrigToStr(Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].imposto.ICMS.orig);
    FDataModuleNfe.CDSNfeImpostoIcms.FieldByName('CST_ICMS').AsString:=CSTICMSToStr(Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].imposto.ICMS.CST);
    FDataModuleNfe.CDSNfeImpostoIcms.FieldByName('CSOSN').AsString:=CSOSNIcmsToStr(Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].imposto.ICMS.CSOSN);
    FDataModuleNfe.CDSNfeImpostoIcms.FieldByName('MODALIDADE_BC_ICMS').AsString:=modBCToStr(Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].imposto.ICMS.modBC);
    FDataModuleNfe.CDSNfeImpostoIcms.FieldByName('TAXA_REDUCAO_BC_ICMS').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].imposto.ICMS.pRedBC;
    FDataModuleNfe.CDSNfeImpostoIcms.FieldByName('BASE_CALCULO_ICMS').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].imposto.ICMS.vBC;
    FDataModuleNfe.CDSNfeImpostoIcms.FieldByName('ALIQUOTA_ICMS').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].imposto.ICMS.pICMS;
    FDataModuleNfe.CDSNfeImpostoIcms.FieldByName('VALOR_ICMS').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].imposto.ICMS.vICMS;
    FDataModuleNfe.CDSNfeImpostoIcms.FieldByName('VALOR_ICMS_OPERACAO').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].imposto.ICMS.vICMSOp;
    FDataModuleNfe.CDSNfeImpostoIcms.FieldByName('PERCENTUAL_DIFERIMENTO').AsExtended:= Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].imposto.ICMS.pDif;
    FDataModuleNfe.CDSNfeImpostoIcms.FieldByName('VALOR_ICMS_DIFERIDO').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].imposto.ICMS.vICMSDif ;
    FDataModuleNfe.CDSNfeImpostoIcms.FieldByName('MOTIVO_DESONERACAO_ICMS').AsString:=GetMotivoDesoneracaoIcms(Nfe,FK);
    FDataModuleNfe.CDSNfeImpostoIcms.FieldByName('VALOR_ICMS_DESONERADO').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].imposto.ICMS.vICMSDeson;
    FDataModuleNfe.CDSNfeImpostoIcms.FieldByName('MODALIDADE_BC_ICMS_ST').AsString:=GetModalidadeBcICMSST(Nfe,FK);
    FDataModuleNfe.CDSNfeImpostoIcms.FieldByName('PERCENTUAL_MVA_ICMS_ST').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].imposto.ICMS.pMVAST;
    FDataModuleNfe.CDSNfeImpostoIcms.FieldByName('PERCENTUAL_REDUCAO_BC_ICMS_ST').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].imposto.ICMS.pRedBCST;
    FDataModuleNfe.CDSNfeImpostoIcms.FieldByName('VALOR_BASE_CALCULO_ICMS_ST').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].imposto.ICMS.vBCST ;
    FDataModuleNfe.CDSNfeImpostoIcms.FieldByName('ALIQUOTA_ICMS_ST').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].imposto.ICMS.pST;
    FDataModuleNfe.CDSNfeImpostoIcms.FieldByName('VALOR_ICMS_ST').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].imposto.ICMS.vICMSST;
    FDataModuleNfe.CDSNfeImpostoIcms.FieldByName('VALOR_BC_ICMS_ST_RETIDO').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].imposto.ICMS.vBCSTRet;
    FDataModuleNfe.CDSNfeImpostoIcms.FieldByName('VALOR_ICMS_ST_RETIDO').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].imposto.ICMS.vICMSSTRet;
    FDataModuleNfe.CDSNfeImpostoIcms.FieldByName('VALOR_BC_ICMS_ST_DESTINO').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].imposto.ICMS.vBCSTDest;
    FDataModuleNfe.CDSNfeImpostoIcms.FieldByName('VALOR_ICMS_ST_DESTINO').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].imposto.ICMS.vICMSSTDest;
    FDataModuleNfe.CDSNfeImpostoIcms.FieldByName('ALIQUOTA_CREDITO_ICMS_SN').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].imposto.ICMS.pCredSN;
    FDataModuleNfe.CDSNfeImpostoIcms.FieldByName('VALOR_CREDITO_ICMS_SN').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].imposto.ICMS.vCredICMSSN;
    FDataModuleNfe.CDSNfeImpostoIcms.FieldByName('PERCENTUAL_BC_OPERACAO_PROPRIA').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].imposto.ICMS.pBCOp;
    FDataModuleNfe.CDSNfeImpostoIcms.FieldByName('BASE_CALCULO_ICMS_FCP').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].imposto.ICMS.vBCFCP;
    FDataModuleNfe.CDSNfeImpostoIcms.FieldByName('ALIQUOTA_ICMS_FCP').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].imposto.ICMS.pFCP;
    FDataModuleNfe.CDSNfeImpostoIcms.FieldByName('VALOR_ICMS_FCP').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].imposto.ICMS.vFCP;
    FDataModuleNfe.CDSNfeImpostoIcms.FieldByName('BASE_CALCULO_ICMS_FCP_ST').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].imposto.ICMS.vBCFCPST;
    FDataModuleNfe.CDSNfeImpostoIcms.FieldByName('ALIQUOTA_ICMS_FCP_ST').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].imposto.ICMS.pFCPST;
    FDataModuleNfe.CDSNfeImpostoIcms.FieldByName('VALOR_ICMS_FCP_ST').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].imposto.ICMS.vFCP;
    FDataModuleNfe.CDSNfeImpostoIcms.FieldByName('BASE_CALCULO_ICMS_FCP_ST_RETIDO_ANTERIORMENTE').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].imposto.ICMS.vBCFCPSTRet;
    FDataModuleNfe.CDSNfeImpostoIcms.FieldByName('ALIQUOTA_ICMS_FCP_ST_RETIDO_ANTERIORMENTE').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].imposto.ICMS.pFCPSTRet;
    FDataModuleNfe.CDSNfeImpostoIcms.FieldByName('VALOR_ICMS_FCP_ST_RETIDO_ANTERIORMENTE').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].imposto.ICMS.vFCPSTRet;

    //verificar tag
    FDataModuleNfe.CDSNfeImpostoIcms.FieldByName('ALIQUOTA_ST_SUPORTADA_CONSUMIDOR_FINAL').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].imposto.ICMS.pICMSEfet;
    FDataModuleNfe.CDSNfeImpostoIcms.FieldByName('VALOR_ICMS_SUBSTITUTO').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].imposto.ICMS.vICMSEfet;

    FDataModuleNfe.CDSNfeImpostoIcms.FieldByName('UF_ST').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].imposto.ICMS.UFST;

    FDataModuleNfe.CDSNfeImpostoIcms.Post;

    ToTalizaCreditoSimplesNacional(Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].imposto.ICMS.vCredICMSSN);

  end;
end;

class procedure TImportaXmlParaComponentesVisuaisController.TagPIS(Nfe: TAcbrNfe; FK: Integer);
begin
  if Assigned(Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.PIS) then
  begin
    FDataModuleNfe.CDSNfeDetalheImpostoPis.Append;
    FDataModuleNfe.CDSNfeDetalheImpostoPis.FieldByName('ID').AsInteger:=FK;
    FDataModuleNfe.CDSNfeDetalheImpostoPis.FieldByName('ID_NFE_DETALHE').AsInteger:=FK;
    FDataModuleNfe.CDSNfeDetalheImpostoPis.FieldByName('CST_PIS').AsString:=CSTPISToStr(Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.Pis.CST);
    FDataModuleNfe.CDSNfeDetalheImpostoPis.FieldByName('BASE_CALCULO_PIS_ST').AsExtended:= Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.PISST.vBc;
    FDataModuleNfe.CDSNfeDetalheImpostoPis.FieldByName('ALIQUOTA_PIS_PERCENTUAL_ST').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.PISST.pPis;
    FDataModuleNfe.CDSNfeDetalheImpostoPis.FieldByName('ALIQUOTA_PIS_REAIS_ST').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.PISST.vAliqProd;
    FDataModuleNfe.CDSNfeDetalheImpostoPis.FieldByName('QUANTIDADE_VENDIDA_ST').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.PISST.qBCProd;
    FDataModuleNfe.CDSNfeDetalheImpostoPis.FieldByName('VALOR_PIS_ST').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.PISST.vPIS;
    FDataModuleNfe.CDSNfeDetalheImpostoPis.FieldByName('BASE_CALCULO_PIS').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.PIS.vBc;
    FDataModuleNfe.CDSNfeDetalheImpostoPis.FieldByName('ALIQUOTA_PIS_PERCENTUAL').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.PIS.pPIS;
    FDataModuleNfe.CDSNfeDetalheImpostoPis.FieldByName('QUANTIDADE_VENDIDA').AsExtended:=nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.PIS.qBCProd;
    FDataModuleNfe.CDSNfeDetalheImpostoPis.FieldByName('ALIQUOTA_PIS_REAIS').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.PIS.vAliqProd;
    FDataModuleNfe.CDSNfeDetalheImpostoPis.FieldByName('VALOR_PIS').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.PIS.vPIS;
    FDataModuleNfe.CDSNfeDetalheImpostoPis.Post
  end;
end;

class procedure TImportaXmlParaComponentesVisuaisController.TagCOFINS(Nfe: TAcbrNfe; FK: Integer);
begin
  if Assigned(Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.Cofins) then
  begin
    FDataModuleNfe.CDSNfeDetalheImpostoCofins.Append;
    FDataModuleNfe.CDSNfeDetalheImpostoCofins.FieldByName('ID').AsInteger:=FK;
    FDataModuleNfe.CDSNfeDetalheImpostoCofins.FieldByName('ID_NFE_DETALHE').AsInteger:=FK;
    FDataModuleNfe.CDSNfeDetalheImpostoCofins.FieldByName('CST_COFINS').AsString:=CSTCofinsToStr(Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.Cofins.CST);
    FDataModuleNfe.CDSNfeDetalheImpostoCofins.FieldByName('BASE_CALCULO_COFINS_ST').AsExtended:= Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.CofinsST.vBc;
    FDataModuleNfe.CDSNfeDetalheImpostoCofins.FieldByName('ALIQUOTA_COFINS_PERCENTUAL_ST').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.CofinsST.pCofins;
    FDataModuleNfe.CDSNfeDetalheImpostoCofins.FieldByName('ALIQUOTA_COFINS_REAIS_ST').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.CofinsST.vAliqProd;
    FDataModuleNfe.CDSNfeDetalheImpostoCofins.FieldByName('QUANTIDADE_VENDIDA_ST').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.CofinsST.qBCProd;
    FDataModuleNfe.CDSNfeDetalheImpostoCofins.FieldByName('VALOR_COFINS_ST').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.CofinsST.vCofins;
    FDataModuleNfe.CDSNfeDetalheImpostoCofins.FieldByName('BASE_CALCULO_COFINS').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.Cofins.vBc;
    FDataModuleNfe.CDSNfeDetalheImpostoCofins.FieldByName('ALIQUOTA_COFINS_PERCENTUAL').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.Cofins.pCofins;
    FDataModuleNfe.CDSNfeDetalheImpostoCofins.FieldByName('QUANTIDADE_VENDIDA').AsExtended:=nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.Cofins.qBCProd;
    FDataModuleNfe.CDSNfeDetalheImpostoCofins.FieldByName('ALIQUOTA_COFINS_REAIS').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.Cofins.vAliqProd;
    FDataModuleNfe.CDSNfeDetalheImpostoCofins.FieldByName('VALOR_COFINS').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.Cofins.vCofins;
    FDataModuleNfe.CDSNfeDetalheImpostoCofins.Post
  end;
end;

class procedure TImportaXmlParaComponentesVisuaisController.TagFCPDIFAL(Nfe: TAcbrNfe; FK: Integer);
begin
  if Assigned(Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.ICMSUFDest) then
  begin
    FDataModuleNfe.CDSNfeDetalheImpostoFcpDifal.Append;
    FDataModuleNfe.CDSNfeDetalheImpostoFcpDifal.FieldByName('ID').AsInteger:=FK;
    FDataModuleNfe.CDSNfeDetalheImpostoFcpDifal.FieldByName('ID_NFE_DETALHE').AsInteger:=FK;
    FDataModuleNfe.CDSNfeDetalheImpostoFcpDifal.FieldByName('VALOR_BC_UF_DESTINO').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.ICMSUFDest.vBCUFDest;
    FDataModuleNfe.CDSNfeDetalheImpostoFcpDifal.FieldByName('BASE_CALCULO_FCP_UF_DESTINATARIO').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.ICMSUFDest.vBCFCPUFDest;
    FDataModuleNfe.CDSNfeDetalheImpostoFcpDifal.FieldByName('ALIQUOTA_FCP_UF_DESTINO').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.ICMSUFDest.pFCPUFDest;
    FDataModuleNfe.CDSNfeDetalheImpostoFcpDifal.FieldByName('ALIQUOTA_ICMS_INTERNA_UF_DESTINO').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.ICMSUFDest.pICMSUFDest;
    FDataModuleNfe.CDSNfeDetalheImpostoFcpDifal.FieldByName('ALIQUOTA_ICMS_INTERESTADUAL').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.ICMSUFDest.pICMSInter;
    FDataModuleNfe.CDSNfeDetalheImpostoFcpDifal.FieldByName('PERCENTUAL_PARTILHA_ICMS').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.ICMSUFDest.pICMSInterPart;
    FDataModuleNfe.CDSNfeDetalheImpostoFcpDifal.FieldByName('VALOR_ICMS_FCP').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.ICMSUFDest.vFCPUFDest;
    FDataModuleNfe.CDSNfeDetalheImpostoFcpDifal.FieldByName('VALOR_ICMS_UF_DESTINO').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.ICMSUFDest.vICMSUFDest;
    FDataModuleNfe.CDSNfeDetalheImpostoFcpDifal.FieldByName('VALOR_ICMS_UF_REMETENTE').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.ICMSUFDest.vICMSUFRemet;
    FDataModuleNfe.CDSNfeDetalheImpostoFcpDifal.Post;
  end;
end;

class procedure TImportaXmlParaComponentesVisuaisController.TagDetExport(Nfe: TAcbrNfe; FK: Integer);
var i:integer;
begin
  if (Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.detExport.Count > 0) then
  begin
    for I := 0 to Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.detExport.Count -1 do
    begin
      FDataModuleNfe.CDSNfeExportacao.Append;
      FDataModuleNfe.CDSNfeExportacao.FieldByName('ID').AsInteger:=FK+100+i;
      FDataModuleNfe.CDSNfeExportacao.FieldByName('ID_NFE_DETALHE').AsInteger:=FK;
      FDataModuleNfe.CDSNfeExportacao.FieldByName('DRAWBACK').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.detExport.Items[i].nDraw;
      FDataModuleNfe.CDSNfeExportacao.FieldByName('NUMERO_REGISTRO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].prod.detExport.Items[i].nRE;
      FDataModuleNfe.CDSNfeExportacao.FieldByName('CHAVE_ACESSO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].prod.detExport.Items[i].chNFe;
      FDataModuleNfe.CDSNfeExportacao.FieldByName('QUANTIDADE').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].prod.detExport.Items[i].qExport;
      FDataModuleNfe.CDSNfeExportacao.Post;
    end;
  end;
end;

class procedure TImportaXmlParaComponentesVisuaisController.TagII(Nfe: TAcbrNfe;FK: Integer);
begin
  if Assigned(Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.II) then
  begin
    FDataModuleNfe.CDSNfeImpostoImportacao.Append;
    FDataModuleNfe.CDSNfeImpostoImportacao.FieldByName('ID').AsInteger:=FK;
    FDataModuleNfe.CDSNfeImpostoImportacao.FieldByName('ID_NFE_DETALHE').AsInteger:=FK;
    FDataModuleNfe.CDSNfeImpostoImportacao.FieldByName('VALOR_BC_II').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.II.vBc;
    FDataModuleNfe.CDSNfeImpostoImportacao.FieldByName('VALOR_DESPESAS_ADUANEIRAS').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.II.vDespAdu;
    FDataModuleNfe.CDSNfeImpostoImportacao.FieldByName('VALOR_IMPOSTO_IMPORTACAO').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.II.vII;
    FDataModuleNfe.CDSNfeImpostoImportacao.FieldByName('VALOR_IOF').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.II.vIOF;
    FDataModuleNfe.CDSNfeImpostoImportacao.Post;
  end;
end;

class procedure TImportaXmlParaComponentesVisuaisController.TagDI(Nfe: TAcbrNfe;FK: Integer);
var i:integer;
begin
  if (Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.DI.Count > 0) then
  begin
    for I := 0 to Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.DI.Count -1 do
    begin
      FDataModuleNfe.CDSNfeDeclaracaoImportacao.Append;
      FDataModuleNfe.CDSNfeDeclaracaoImportacao.FieldByName('ID').AsInteger:=FK+100+i;
      FDataModuleNfe.CDSNfeDeclaracaoImportacao.FieldByName('ID_NFE_DETALHE').AsInteger:=FK;
      FDataModuleNfe.CDSNfeDeclaracaoImportacao.FieldByName('NUMERO_DOCUMENTO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.DI.Items[i].nDi;
      FDataModuleNfe.CDSNfeDeclaracaoImportacao.FieldByName('DATA_REGISTRO').AsDateTime:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.DI.Items[i].dDi;
      FDataModuleNfe.CDSNfeDeclaracaoImportacao.FieldByName('LOCAL_DESEMBARACO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.DI.Items[i].xLocDesemb;
      FDataModuleNfe.CDSNfeDeclaracaoImportacao.FieldByName('UF_DESEMBARACO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.DI.Items[i].UFDesemb;
      FDataModuleNfe.CDSNfeDeclaracaoImportacao.FieldByName('DATA_DESEMBARACO').AsDateTime:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.DI.Items[i].dDesemb;
      FDataModuleNfe.CDSNfeDeclaracaoImportacao.FieldByName('VIA_TRANSPORTE').AsString:=TipoViaTranspToStr(Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.DI.Items[i].tpViaTransp);
      FDataModuleNfe.CDSNfeDeclaracaoImportacao.FieldByName('VALOR_AFRMM').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.DI.Items[i].vAFRMM;
      FDataModuleNfe.CDSNfeDeclaracaoImportacao.FieldByName('FORMA_INTERMEDIACAO').AsString:=TipoIntermedioToStr(Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.DI.Items[i].tpIntermedio);
      FDataModuleNfe.CDSNfeDeclaracaoImportacao.FieldByName('CNPJ').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.DI.Items[i].CNPJ;
      FDataModuleNfe.CDSNfeDeclaracaoImportacao.FieldByName('UF_TERCEIRO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.DI.Items[i].UFTerceiro;
      FDataModuleNfe.CDSNfeDeclaracaoImportacao.FieldByName('CODIGO_EXPORTADOR').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.DI.Items[i].cExportador;
      FDataModuleNfe.CDSNfeDeclaracaoImportacao.Post;
      TagAdi(Nfe,FK,I);
    end;
  end;

end;

class procedure TImportaXmlParaComponentesVisuaisController.TagAdi(Nfe:TAcbrNfe;IndiceProduto,IndiceDI:Integer);
var i:integer;
begin
  if Nfe.NotasFiscais.Items[0].Nfe.Det.Items[IndiceProduto].Prod.DI.Items[IndiceDI].adi.Count > 0 then
  begin
    for i := 0 to Nfe.NotasFiscais.Items[0].Nfe.Det.Items[IndiceProduto].Prod.DI.Items[IndiceDI].adi.Count - 1 do
    begin
      FDataModuleNfe.CDSNfeImportacaoDetalhe.Append;
      FDataModuleNfe.CDSNfeImportacaoDetalhe.FieldByName('ID').AsInteger:=IndiceDI+100+i;
      FDataModuleNfe.CDSNfeImportacaoDetalhe.FieldByName('ID_NFE_DETALHE').AsInteger:=IndiceDI;
      FDataModuleNfe.CDSNfeImportacaoDetalhe.FieldByName('NUMERO_ADICAO').AsString:=IntToStr(Nfe.NotasFiscais.Items[0].Nfe.Det.Items[IndiceProduto].Prod.DI.Items[IndiceDI].adi.Items[I].nAdicao);
      FDataModuleNfe.CDSNfeImportacaoDetalhe.FieldByName('NUMERO_SEQUENCIAL').AsString:=IntToStr(Nfe.NotasFiscais.Items[0].Nfe.Det.Items[IndiceProduto].Prod.DI.Items[IndiceDI].adi.Items[I].nSeqAdi);
      FDataModuleNfe.CDSNfeImportacaoDetalhe.FieldByName('CODIGO_FABRICANTE_ESTRANGEIRO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[IndiceProduto].Prod.DI.Items[IndiceDI].adi.Items[I].cFabricante;
      FDataModuleNfe.CDSNfeImportacaoDetalhe.FieldByName('VALOR_DESCONTO').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[IndiceProduto].Prod.DI.Items[IndiceDI].adi.Items[I].vDescDI;
      FDataModuleNfe.CDSNfeImportacaoDetalhe.FieldByName('DRAWBACK').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[IndiceProduto].Prod.DI.Items[IndiceDI].adi.Items[I].nDraw;
      FDataModuleNfe.CDSNfeImportacaoDetalhe.Post;
    end;
  end;
end;

class procedure TImportaXmlParaComponentesVisuaisController.TagRasto(Nfe: TAcbrNfe; FK: Integer);
var i:integer;
begin
  if (Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.rastro.Count > 0) then
  begin
    for I := 0 to Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.rastro.Count -1 do
    begin
      FDataModuleNfe.CDSNfeDetalheRastreabilidade.Append;
      FDataModuleNfe.CDSNfeDetalheRastreabilidade.FieldByName('ID').AsInteger:=FK+100+i;
      FDataModuleNfe.CDSNfeDetalheRastreabilidade.FieldByName('ID_NFE_DETALHE').AsInteger:=FK;
      FDataModuleNfe.CDSNfeDetalheRastreabilidade.FieldByName('NUMERO_LOTE').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.rastro.Items[i].nLote;
      FDataModuleNfe.CDSNfeDetalheRastreabilidade.FieldByName('QUANTIDADE_LOTE').AsExtended:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.rastro.Items[i].qLote;
      FDataModuleNfe.CDSNfeDetalheRastreabilidade.FieldByName('DATA_FABRICACAO').AsDateTime:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.rastro.Items[i].dFab;
      FDataModuleNfe.CDSNfeDetalheRastreabilidade.FieldByName('DATA_VALIDADE').AsDateTime:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.rastro.Items[i].dVal;
      FDataModuleNfe.CDSNfeDetalheRastreabilidade.FieldByName('CODIGO_AGREGACAO').AsString:=Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Prod.rastro.Items[i].cAgreg;
      FDataModuleNfe.CDSNfeDetalheRastreabilidade.Post;
    end;
  end;
end;

class procedure TImportaXmlParaComponentesVisuaisController.TagISSQN(Nfe: TAcbrNfe; FK: Integer);
begin

end;

class function TImportaXmlParaComponentesVisuaisController.VerificaCstPisNormal(Cst: TpcnCstPis):boolean;
begin
  if (Cst = pis05) or (Cst=pis75)  then
  Result:=False
  else
  Result:=true;
  {if (Cst = pis01) or (Cst = pis02) or(Cst = pis03) or (Cst = pis49) OR (Cst = pis50) or
  (Cst = pis51) or (Cst = pis56) or (Cst = pis60) OR (Cst = pis61) or (Cst = pis62) or
  (Cst = pis63) or (Cst = pis64) OR (Cst = pis65) or (Cst = pis66) or (Cst = pis67) or
  (Cst = pis98) OR (Cst = pis99) then
  Result:=True
  else
  Result:=False;}
end;

class procedure TImportaXmlParaComponentesVisuaisController.ConfiguraComboboxCstIcmsxIcmsSimples(Nfe: TAcbrNfe);
begin
  if CRTToStr(Nfe.NotasFiscais.Items[0].Nfe.Emit.CRT) = '3' then
  begin
    FNFeDetalheAnexo.ComboBoxCsosnB.Visible:=false;
    FNFeDetalheAnexo.ComboBoxCstIcmsB.Visible:=true;
  end
  else
  begin
    FNFeDetalheAnexo.ComboBoxCsosnB.Visible:=true;
    FNFeDetalheAnexo.ComboBoxCstIcmsB.Visible:=false;
  end;
end;

class function TImportaXmlParaComponentesVisuaisController.GetCstIPI(Nfe:TAcbrNfe;FK:Integer):String;
begin
  // Tive que fazer esta função porque o componenete acbr traz a tag cst por default 00
  Result:=CSTIPIToStr(Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.IPI.CST);
  if Result = '00' then
  begin
    if not (Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.IPI.vBC > 0) then
    Result:='';
  end;
end;

class function TImportaXmlParaComponentesVisuaisController.GetMotivoDesoneracaoIcms(Nfe:TAcbrNfe;FK:Integer):String;
begin
  // Tive que fazer esta função porque o componenete acbr traz a tag motDesICMS por default 00
  Result:=motDesICMSToStr(Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].imposto.ICMS.motDesICMS);
  if Result = '1' then
  begin
    if not (Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.Icms.vICMSDeson > 0) then
    Result:='';
  end;
end;

class function TImportaXmlParaComponentesVisuaisController.GetModalidadeBcICMSST(Nfe:TAcbrNfe;FK:Integer):String;
begin
  // Tive que fazer esta função porque o componenete acbr traz a tag modBCST por default 0
  Result:=modBCSTToStr(Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].imposto.ICMS.modBCST);
  if Result = '0' then
  begin
    if not (Nfe.NotasFiscais.Items[0].Nfe.Det.Items[FK].Imposto.Icms.vBCST > 0) then
    Result:='';
  end;
end;

class function TImportaXmlParaComponentesVisuaisController.GetTipoOperacao(Operacao: TpcnTipoNFe): Integer;
begin
  if Operacao=tnEntrada then
  Result:=0
  else
  Result:=1;
end;

class function TImportaXmlParaComponentesVisuaisController.GetValorTotalItem: Currency;
begin
  Result:=FDataModuleNFe.CDSNfeDetalhe.FieldByName('VALOR_BRUTO_PRODUTO').AsCurrency
  - FDataModuleNFe.CDSNfeDetalhe.FieldByName('VALOR_DESCONTO').AsCurrency+
  FDataModuleNFe.CDSNfeDetalhe.FieldByName('VALOR_FRETE').AsCurrency+
  FDataModuleNFe.CDSNfeDetalhe.FieldByName('VALOR_SEGURO').AsCurrency+
  FDataModuleNFe.CDSNfeDetalhe.FieldByName('VALOR_OUTRAS_DESPESAS').AsCurrency;
end;

class procedure TImportaXmlParaComponentesVisuaisController.CalculaCustoTotalItem;
begin
  FDataModuleNFe.CDSNfeDetalhe.Edit;
  FdataModuleNfe.CDSNfeDetalhe.FieldByName('CUSTO_TOTAL').AsExtended:=FDataModuleNFe.CDSNfeDetalhe.FieldByName('VALOR_TOTAL').AsCurrency+
  FDataModuleNFe.CDSNfeImpostoIcms.FieldByName('VALOR_ICMS_ST').AsCurrency+
  FDataModuleNFe.CDSNfeDetalheImpostoIPI.FieldByName('VALOR_IPI').AsCurrency;
  FDataModuleNFe.CDSNfeDetalhe.Post;
end;

class procedure TImportaXmlParaComponentesVisuaisController.LimpaCds;
var I: Integer;
begin
  for I := 0 to FDataModuleNfe.ComponentCount - 1 do
  begin
    if FDataModuleNfe.Components[I] is TClientDataSet then
    begin
      if (FDataModuleNfe.Components[I] as TClientDataset).Tag = 0 then
      (FDataModuleNfe.Components[I] as TClientDataset).EmptyDataSet;
    end;
  end;
end;

class procedure TImportaXmlParaComponentesVisuaisController.CalculaValorTotalItem;
begin

end;

class procedure TImportaXmlParaComponentesVisuaisController.TotalizaCreditoSimplesNacional(ValorCredito:Extended);
begin
  if ValorCredito > 0 then
  begin
    FDataModuleNfe.CdsNfeCabecalho.Edit;
    FDataModuleNfe.CdsNfeCabecalho.FieldByName('VALOR_CREDITO_ICMS_SIMPLES_NACIONAL').AsExtended:=
    FDataModuleNfe.CdsNfeCabecalho.FieldByName('VALOR_CREDITO_ICMS_SIMPLES_NACIONAL').AsExtended+ValorCredito;
    FDataModuleNfe.CdsNfeCabecalho.Post;
  end;
end;

class procedure TImportaXmlParaComponentesVisuaisController.TotalizaNotasFiscais(Cds: TClientDataSet;PainelDados:TPanel);
var QuantidadeNotasFiscais:Integer;
I:INteger;
ValorTotalNotasFiscais:Currency;
begin
  QuantidadeNotasFiscais:=0;
  ValorTotalNotasFiscais:=0;
  Cds.First;
  for I := 0 to Cds.RecordCount - 1 do
  begin
    inc(QuantidadeNotasFiscais);
    ValorTotalNotasFiscais:=ValorTotalNotasFiscais+Cds.FieldByName('VALOR').AsCurrency;
  end;
  PainelDados.Caption:='';
  PainelDados.Caption:='|Quantidade NF-e(s): '+QuantidadeNotasFiscais.ToString+'| - |Valor Total NF-e(s): '+FloatToStrF(ValorTotalNotasFiscais,ffCurrency,15,2)+'|';
  Cds.First;
end;

end.

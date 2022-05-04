unit XmlPdfController;

interface

uses
  Winapi.Windows, Winapi.Messages, Winapi.ShellAPI,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.Clipbrd, Vcl.StdCtrls,
   Vcl.ComCtrls,Vcl.FileCtrl, ACBrDFeReport, ACBrDFeDANFeReport,
  ACBrNFeDANFEClass, ACBrNFeDANFeRLClass, ACBrBase, ACBrDFe, ACBrNFe, Data.DB,
  Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid,
  Datasnap.DBClient, Vcl.Buttons,Biblioteca,pcnConversao,JvSpecialProgress,UDataModuleNFe,
  UDataModuleItensDetalhados,ImportaXmlParaComponentesVisuaisController,PDFium.Frame,StrUtils,JvDBGridExport;

  type
    TXmlPdfController = class
    private

    public
      class procedure CarregarArquivosXml(CdsNotasFiscais:TClientDataSet;GeraDanfe:boolean;ProgressBar:TJvSpecialProgress);
      class procedure CarregarArquivosXmlPastaSelecionada(CdsNotasFiscais:TClientDataSet;GeraDanfe:boolean;ProgressBar:TJvSpecialProgress);
      class function ConverteArquivoXmlToPdf(ArquivoXml:String;AcbrNfe:TAcbrNfe):String;
      class function GetArquivoDanfe(CdsNotasFiscais:TClientDataSet):String;
      class function GetQuantidadeArquivosPasta(Pasta, Nome:string):integer;
      class procedure PreencheDadosItens(NotaFiscal:TAcbrNfe);
      class procedure DesenhaCheckBoxGridPadrao(Cds:TClientDataSet;Field,CheckTrue:String;Grid:TJvDBUltimGrid;Column: TColumn;const Rect: TRect);
      class function OrdenarGrid_PintaTitulo(xGrid: TJvDBUltimGrid; Column: TColumn; Cds: TClientDataSet): boolean;
      class procedure OrdenarGrid(Cds: TclientDataSet; Column: TColumn);

      class procedure PesquisaPadrao(Cds:TClientDataSet;Grid:TJvDBUltimGrid;Pesquisa:String;pnPages:TPanel;PDFium: TPDFiumFrame);overload;
      class procedure PesquisaPadrao(Cds:TClientDataSet;Grid:TJvDBUltimGrid;Pesquisa:String);overload;

      class procedure CarregaNotaFiscal(VisualizacaoCompleta:boolean;Cds:TClientDataset;Grid:TJvDBUltimGrid;pnPages:TPanel;PDFium: TPDFiumFrame);
      class procedure CarregaXmlDanfe(Cds:TClientDataSet;Grid:TJvDBUltimGrid;pnPages:TPanel;PDFium: TPDFiumFrame);
      class procedure LoadFile(const AFileName: string;pnPages:TPanel;PDFium: TPDFiumFrame);
      class procedure ConfiguraSelecaoTodosItens(ColunaGrid:Integer;ProgressBar:TJvSpecialProgress);
      class procedure FiltraNotasFiscaisRefFiltroItens(CdsNotasFiscais:TClientDataSet);
      class procedure ExportaItensParaExcel(Grid:TJvDBUltimGrid);
      class procedure SelecionaItemNaGrid(ColunaGrid:Integer);
    end;

implementation

uses UConverteXml;

Const
SELDIRHELP = 1000;



{ TXmlPdfController }


class procedure TXmlPdfController.OrdenarGrid(Cds: TclientDataSet; Column: TColumn);
var vIndice: string; vExiste: boolean;
begin
  if Cds.IndexFieldNames = Column.FieldName then
  begin
    vIndice := AnsiUpperCase(Column.FieldName + '');
    try
      Cds.IndexDefs.Find(vIndice);
      vExiste := True;
    except
      vExiste := False;
    end;

    if not (vExiste) then
    begin
      with Cds.IndexDefs.AddIndexDef do
      begin
        Name := vIndice;
        Fields := Column.FieldName;
        Options := [ixDescending];
      end;
    end;
    Cds.IndexName := vIndice;
  end
  else
  Cds.IndexFieldNames := Column.FieldName;
  Cds.First;
end;

class procedure TXmlPdfController.DesenhaCheckBoxGridPadrao(Cds:TClientDataSet;Field,CheckTrue:String;Grid:TJvDBUltimGrid;Column: TColumn;const Rect: TRect);
var
  iCheck: Integer;
  rRect: TRect;
begin
  //Desenha um checkbox no dbgrid
  if Column.FieldName = Field then
  begin
    Grid.Canvas.FillRect(Rect);
    iCheck := 0;
    if CDS.FieldByName(Field).AsString = CheckTrue then
      iCheck := DFCS_CHECKED
    else
      iCheck := 0;
    rRect := Rect;
    InflateRect(rRect,-2,-2);
    DrawFrameControl(Grid.Canvas.Handle,rRect,DFC_BUTTON, DFCS_BUTTONCHECK or iCheck);
  end;
end;

class function TXmlPdfController.OrdenarGrid_PintaTitulo(xGrid: TJvDBUltimGrid; Column: TColumn; Cds: TClientDataSet): boolean;
const
idxdefault='DEFAULT_ORDER';
var
  strColumn: string;
  bolUsed: Boolean;
  idOptions: TIndexOptions;
  I: Integer;
  VDescendField: string;
begin
  Result := false;
  if not CDS.Active then exit;
  strColumn := idxDefault;
  // Se for campo calculado não deve fazer nada
  if (Column.Field.FieldKind = fkCalculated) then exit;
  // O índice já está em uso
  bolUsed := (Column.Field.FieldName = cds.IndexName);
  // Verifica a existência do índice e propriedades
  CDS.IndexDefs.Update;
  idOptions := [];
  for I := 0 to CDS.IndexDefs.Count - 1 do
  begin
    if cds.IndexDefs.Items[I].Name = Column.Field.FieldName then
    begin
      strColumn := Column.Field.FieldName;
      // Determina como deve ser criado o índice, inverte a condição ixDescending
      case (ixDescending in cds.IndexDefs.Items[I].Options) of
      True: begin
              idOptions := [];
              VDescendField := '';
            end;
      False:begin
              idOptions := [ixDescending];
              vDescendField := strColumn;
            end;
      end;
    end;
  end;
  // Se não encontrou o índice, ou o índice já esta em uso...
  if (strColumn = idxDefault) or bolUsed then
  begin
    if bolUsed then
      CDS.DeleteIndex(Column.Field.FieldName);
    try
      CDS.AddIndex(Column.Field.FieldName, Column.Field.FieldName, idOptions, VDescendField, '', 0);
      strColumn := Column.Field.FieldName;
    except
        // O índice esta indeterminado, passo para o padrão
      if bolUsed then strColumn := idxDefault;
    end;
  end;
  for I := 0 to xGRID.Columns.Count - 1 do begin
    if Pos(StrColumn, xGrid.Columns[I].Field.FieldName) <> 0 then
      xGrid.Columns[I].Title.Font.Color := clBlue
    else
      xGrid.Columns[I].Title.Font.Color := clWindowText;
  end;
  try
    CDS.IndexName := strColumn;
  except
    CDS.IndexName := idxDefault;
  end;
  result := true;
end;

class function TXmlPdfController.GetQuantidadeArquivosPasta(Pasta, Nome:string):integer;
var
   Rec : TSearchRec;
   Procura, Contador:integer;
begin
   Contador:=0;
   procura:=FindFirst(Pasta+Nome,faAnyFile, Rec);
   Contador:=0;
   while procura = 0 do
      begin
      inc(Contador);
      procura:=FindNext(Rec)
      end;
   FindClose(Rec);
   Result:=Contador;
end;

class procedure TXmlPdfController.CarregarArquivosXmlPastaSelecionada(CdsNotasFiscais:TClientDataSet;GeraDanfe:boolean;ProgressBar:TJvSpecialProgress);
var I,I2,QuantidadeArquivosPasta:Integer;
AcbrNfe:TACBrNFe;
AcbrDanfe:TACBrNFeDANFeRL;
Dir,Arquivo:String;
Sr: TSearchRec;
FileOpenDialog:TFileOpenDialog;
begin
  AcbrNfe:=TAcbrNfe.Create(nil);
  AcbrDanfe:=TACBrNFeDANFeRL.Create(nil);
  ACBrNFe.DANFE:=AcbrDanfe;
  AcbrNfe.Configuracoes.Geral.RetirarAcentos:=true;

  FileOpenDialog:=TFileOpenDialog.Create(nil);
  FileOpenDialog.Options:=[fdoPickFolders];
  if FileOpenDialog.Execute then
  //if SelectDirectory(Dir, [sdAllowCreate, sdPerformCreate, sdPrompt],SELDIRHELP) then
  begin
    CdsNotasFiscais.EmptyDataSet;
    DataModuleItensDetalhados.CdsDetalheItemFiltro.EmptyDataSet;
    RemoveDiretorio(ExtractFilePath(Application.ExeName)+'Danfes\');
    ProgressBar.Position:=0;
    ProgressBar.Minimum:=0;
    Dir:=FileOpenDialog.FileName;
    QuantidadeArquivosPasta:=GetQuantidadeArquivosPasta(Dir,'\*.xml');
    ProgressBar.Maximum:=QuantidadeArquivosPasta;
    ProgressBar.Visible:=True;
    I2 := FindFirst(Dir+'\*.xml', faAnyFile, SR);
    //ProgressBar.TextOption:=toPercent;
    while I2 = 0 do
    begin
      inc(I);
      AcbrNfe.NotasFiscais.Clear;
      Arquivo:=Dir+'\'+Sr.Name;
      if AcbrNfe.NotasFiscais.LoadFromFile(Arquivo) then
      begin
        ProgressBar.Caption:='Carregando Nota Fiscal '+I.ToString+'/'+QuantidadeArquivosPasta.ToString;
        ProgressBar.Position:=ProgressBar.Position+1;
        CdsNotasFiscais.Append;
        CdsNotasFiscais.FieldByName('NUMERO').AsString:= IntToStr(AcbrNfe.NotasFiscais.Items[0].NFe.Ide.nNF);
        CdsNotasFiscais.FieldByName('SERIE').AsString:= IntToStr(AcbrNfe.NotasFiscais.Items[0].NFe.Ide.serie);
        CdsNotasFiscais.FieldByName('DATA_EMISSAO').AsDateTime:= AcbrNfe.NotasFiscais.Items[0].NFe.Ide.dEmi;
        CdsNotasFiscais.FieldByName('DATA_SAIDA_ENTRADA').AsDateTime:= AcbrNfe.NotasFiscais.Items[0].NFe.Ide.dSaiEnt;
        CdsNotasFiscais.FieldByName('FORNECEDOR_CLIENTE').AsString:= upperCase(AcbrNfe.NotasFiscais.Items[0].NFe.Emit.xNome);
        CdsNotasFiscais.FieldByName('VALOR').AsCurrency:= AcbrNfe.NotasFiscais.Items[0].NFe.Total.ICMSTot.vNF;
        CdsNotasFiscais.FieldByName('CAMINHO_ARQUIVO_XML').AsString:= Arquivo;
        CdsNotasFiscais.FieldByName('CHAVE_ACESSO').AsString:=AcbrNfe.NotasFiscais.Items[0].NFe.procNFe.chNFe;
        if GeraDanfe = true then
        CdsNotasFiscais.FieldByName('CAMINHO_ARQUIVO_PDF').AsString:= ConverteArquivoXmlToPdf(Arquivo,AcbrNfe);
        CdsNotasFiscais.FieldByName('STATUS_NOTA').AsString:= IntToStr(AcbrNfe.NotasFiscais.Items[0].NFe.Ide.nNF);
        CdsNotasFiscais.Post;
        PreencheDadosItens(AcbrNfe);
      end;
      I2 := FindNext(SR);
    end;
    Freeandnil(AcbrNfe);
    FreeandNil(AcbrDanfe);
    ProgressBar.Visible:=False;
  end;
end;

class procedure TXmlPdfController.PesquisaPadrao(Cds: TClientDataSet;Grid: TJvDBUltimGrid;Pesquisa:String;pnPages:TPanel;PDFium: TPDFiumFrame);
var NomeCampo:String;
IdentificaTipoFiltro:Integer;
begin
  NomeCampo:=Grid.Columns.Grid.SelectedField.FieldName;
  IdentificaTipoFiltro:=Grid.Columns.Grid.SelectedField.Tag;
  // Se Tag = 0 entao o filtro será exato . Se Tag = 1 entao o filtro será com like
  begin
    Cds.Filtered:=false;
    if Pesquisa <> '' then
    begin
      if IdentificaTipoFiltro = 1 then
      Cds.Filter:=NomeCampo+' LIKE '+QuotedStr('%'+Pesquisa+'%')
      else
      Cds.Filter:=NomeCampo+' = '+QuotedStr(Pesquisa);
      Cds.Filtered:=true;
      if Cds.RecordCount > 0 then
      begin
        Grid.SetFocus;
        CarregaNotaFiscal(true,Cds,Grid,pnPages,PDFium);
      end
      else
      begin
        Showmessage('Nenhum dado encontrado com estes parametros de pesquisa');
        TImportaXmlParaComponentesVisuaisController.LimpaCds;
      end;
    end;
  end;
end;

class procedure TXmlPdfController.PesquisaPadrao(Cds: TClientDataSet; Grid: TJvDBUltimGrid; Pesquisa: String);
var NomeCampo:String;
IdentificaTipoFiltro:Integer;
begin
  NomeCampo:=Grid.Columns.Grid.SelectedField.FieldName;
  IdentificaTipoFiltro:=Grid.Columns.Grid.SelectedField.Tag;
  // Se Tag = 0 entao o filtro será exato . Se Tag = 1 entao o filtro será com like
  begin
    Cds.Filtered:=false;
    if Pesquisa <> '' then
    begin

      if IdentificaTipoFiltro = 1 then
      Cds.Filter:=NomeCampo+' LIKE '+QuotedStr('%'+Pesquisa+'%')
      else
      Cds.Filter:=NomeCampo+' = '+QuotedStr(Pesquisa);

      Cds.Filtered:=true;

      if Cds.RecordCount > 0 then
      Grid.SetFocus
      else
      Showmessage('Nenhum dado encontrado com estes parametros de pesquisa');

    end;
  end;
end;

class procedure TXmlPdfController.CarregaNotaFiscal(VisualizacaoCompleta:boolean;Cds:TClientDataset;Grid:TJvDBUltimGrid;pnPages:TPanel;PDFium: TPDFiumFrame);
begin
  if VisualizacaoCompleta then
  TImportaXmlParaComponentesVisuaisController.CarregaXmlFormulario(Cds.FieldByName('CAMINHO_ARQUIVO_XML').AsString)
  else
  CarregaXmlDanfe(Cds,Grid,pnPages,PDFium);
end;

class procedure TXmlPdfController.CarregaXmlDanfe(Cds:TClientDataSet;Grid:TJvDBUltimGrid;pnPages:TPanel;PDFium: TPDFiumFrame);
begin
  LoadFile(GetArquivoDanfe(Cds),pnPages,PDFium);
  Grid.SetFocus;
end;

class procedure TXmlPdfController.LoadFile(const AFileName: string;pnPages:TPanel;PDFium: TPDFiumFrame);
begin
  PDFium.LoadFromFile(AFileName);
  PDFium.SetFocus();
  //FConverteXml.Caption := ExtractFileName(AFileName) + ' - ' + Application.Title;
  pnPages.Visible := PDFium.PageCount > 1;
end;

class procedure TXmlPdfController.PreencheDadosItens(NotaFiscal:TAcbrNfe);
var I:Integer;
begin
  for I := 0 to NotaFiscal.NotasFiscais.Items[0].NFe.Det.Count - 1 do
  begin
    DataModuleItensDetalhados.CdsDetalheItemFiltro.Append;
    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('CHAVE_ACESSO').AsString:=NotaFiscal.NotasFiscais.Items[0].NFe.procNFe.chNFe;
    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('CHAVE_ACESSO_EXPORTA_EXCEL').AsString:=''''+NotaFiscal.NotasFiscais.Items[0].NFe.procNFe.chNFe;
    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('NUMERO_NF').AsString:=NotaFiscal.NotasFiscais.Items[0].NFe.Ide.nNF.ToString;
    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('CODIGO').AsString:=''''+NotaFiscal.NotasFiscais.Items[0].NFe.Det.Items[i].Prod.cProd;
    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('NOME').AsString:=NotaFiscal.NotasFiscais.Items[0].NFe.Det.Items[i].Prod.xProd;

    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('NCM').AsString:=NotaFiscal.NotasFiscais.Items[0].NFe.Det.Items[i].Prod.NCM;
    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('CFOP').AsString:=NotaFiscal.NotasFiscais.Items[0].NFe.Det.Items[I].Prod.CFOP;
    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('CEST').AsString:=NotaFiscal.NotasFiscais.Items[0].NFe.Det.Items[I].Prod.CEST;

    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('VALOR_TOTAL').AsFloat:=NotaFiscal.NotasFiscais.Items[0].NFe.Det.Items[I].Prod.vProd+
    NotaFiscal.NotasFiscais.Items[0].NFe.Det.Items[I].Prod.vFrete+NotaFiscal.NotasFiscais.Items[0].NFe.Det.Items[I].Prod.vSeg+
    NotaFiscal.NotasFiscais.Items[0].NFe.Det.Items[I].Prod.vOutro-NotaFiscal.NotasFiscais.Items[0].NFe.Det.Items[I].Prod.vDesc;

    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('ORIGEM').AsString:=OrigToStr(NotaFiscal.NotasFiscais.Items[0].NFe.Det.Items[i].Imposto.ICMS.orig);
    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('CST_ICMS').AsString:=CSTICMSToStr(NotaFiscal.NotasFiscais.Items[0].Nfe.Det.Items[I].imposto.ICMS.CST);
    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('CSOSN').AsString:=CSOSNIcmsToStr(NotaFiscal.NotasFiscais.Items[0].Nfe.Det.Items[I].imposto.ICMS.CSOSN);

    if DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('CST_ICMS').AsString <> '' then
    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('CST_ICMS_CONCATENADA').AsString:=
    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('ORIGEM').AsString+DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('CST_ICMS').AsString
    else
    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('CST_ICMS_CONCATENADA').AsString:=
    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('ORIGEM').AsString+DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('CSOSN').AsString;

    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('BASE_CALCULO_ICMS').AsCurrency:=NotaFiscal.NotasFiscais.Items[0].NFe.Det.Items[I].Imposto.ICMS.vBC;
    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('ALIQUOTA_ICMS').AsCurrency:=NotaFiscal.NotasFiscais.Items[0].NFe.Det.Items[I].Imposto.ICMS.pICMS;
    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('VALOR_ICMS').AsCurrency:=NotaFiscal.NotasFiscais.Items[0].NFe.Det.Items[I].Imposto.ICMS.vICMS;

    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('VALOR_BASE_CALCULO_ICMS_ST').AsCurrency:=NotaFiscal.NotasFiscais.Items[0].NFe.Det.Items[I].Imposto.ICMS.vBCST;
    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('ALIQUOTA_ICMS_ST').AsCurrency:=NotaFiscal.NotasFiscais.Items[0].NFe.Det.Items[I].Imposto.ICMS.pICMSST;
    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('VALOR_ICMS_ST').AsCurrency:=NotaFiscal.NotasFiscais.Items[0].NFe.Det.Items[I].Imposto.ICMS.vICMSST;

    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('ALIQUOTA_CREDITO_ICMS_SN').AsCurrency:=NotaFiscal.NotasFiscais.Items[0].NFe.Det.Items[I].Imposto.ICMS.pCredSN;
    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('VALOR_CREDITO_ICMS_SN').AsCurrency:=NotaFiscal.NotasFiscais.Items[0].NFe.Det.Items[I].Imposto.ICMS.vCredICMSSN;


    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('CST_PIS').AsString:=CSTPISToStr(NotaFiscal.NotasFiscais.Items[0].Nfe.Det.Items[I].imposto.PIS.CST);
    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('BASE_CALCULO_PIS').AsCurrency:=NotaFiscal.NotasFiscais.Items[0].NFe.Det.Items[I].Imposto.PIS.vBC;
    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('ALIQUOTA_PIS_PERCENTUAL').AsCurrency:=NotaFiscal.NotasFiscais.Items[0].NFe.Det.Items[I].Imposto.PIS.pPIS;
    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('VALOR_PIS').AsCurrency:=NotaFiscal.NotasFiscais.Items[0].NFe.Det.Items[I].Imposto.PIS.vPIS;

    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('CST_COFINS').AsString:=CSTCOFINSToStr(NotaFiscal.NotasFiscais.Items[0].Nfe.Det.Items[I].imposto.COFINS.CST);
    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('BASE_CALCULO_COFINS').AsCurrency:=NotaFiscal.NotasFiscais.Items[0].NFe.Det.Items[I].Imposto.COFINS.vBC;
    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('ALIQUOTA_COFINS_PERCENTUAL').AsCurrency:=NotaFiscal.NotasFiscais.Items[0].NFe.Det.Items[I].Imposto.COFINS.pCOFINS;
    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('VALOR_COFINS').AsCurrency:=NotaFiscal.NotasFiscais.Items[0].NFe.Det.Items[I].Imposto.COFINS.vCOFINS;

    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('CST_IPI').AsString:=CSTIPIToStr(NotaFiscal.NotasFiscais.Items[0].Nfe.Det.Items[I].imposto.IPI.CST);
    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('VALOR_BASE_CALCULO_IPI').AsCurrency:=NotaFiscal.NotasFiscais.Items[0].NFe.Det.Items[I].Imposto.IPI.vBC;
    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('ALIQUOTA_IPI').AsCurrency:=NotaFiscal.NotasFiscais.Items[0].NFe.Det.Items[I].Imposto.IPI.pIPI;
    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('VALOR_IPI').AsCurrency:=NotaFiscal.NotasFiscais.Items[0].NFe.Det.Items[I].Imposto.IPI.vIPI;

    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('CNPJ_EMITENTE').AsString:=''''+NotaFiscal.NotasFiscais.Items[0].NFe.Emit.CNPJCPF;
    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('EMITENTE').AsString:=NotaFiscal.NotasFiscais.Items[0].NFe.Emit.xNome;

    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('CNPJ_DESTINATARIO').AsString:=''''+NotaFiscal.NotasFiscais.Items[0].NFe.Dest.CNPJCPF;
    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('DESTINATARIO').AsString:=NotaFiscal.NotasFiscais.Items[0].NFe.Dest.xNome;

    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('DATA_EMISSAO').AsDateTime:=NotaFiscal.NotasFiscais.Items[0].NFe.Ide.dEmi;
    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('DATA_SAIDA').AsDateTime:=NotaFiscal.NotasFiscais.Items[0].NFe.Ide.dSaiEnt;

    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('VALOR_UNITARIO_COMERCIAL').AsCurrency:=NotaFiscal.NotasFiscais.Items[0].NFe.Det.Items[I].Prod.vUnCom;
    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('QUANTIDADE_COMERCIAL').AsCurrency:=NotaFiscal.NotasFiscais.Items[0].NFe.Det.Items[I].Prod.qCom;
    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('UNIDADE_COMERCIAL').AsString:=NotaFiscal.NotasFiscais.Items[0].NFe.Det.Items[I].Prod.uCom;

    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('TIPO_OPERACAO').AsString:=tpNFToStr(NotaFiscal.NotasFiscais.Items[0].NFe.Ide.tpNF);
    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('CONSUMIDOR_FINAL').AsString:=ConsumidorFinalToStr(NotaFiscal.NotasFiscais.Items[0].NFe.Ide.indFinal);
    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('FORMA_EMISSAO').AsString:=TpEmisToStr(NotaFiscal.NotasFiscais.Items[0].NFe.Ide.tpEmis);

    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('NATUREZA_OPERACAO').AsString:=NotaFiscal.NotasFiscais.Items[0].NFe.Ide.natOp;

    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('VALOR_TOTAL_NOTA_FISCAL').AsFloat:=NotaFiscal.NotasFiscais.Items[0].NFe.Total.ICMSTot.vNF;

    DataModuleItensDetalhados.CdsDetalheItemFiltro.Post;
  end;



end;

class procedure TXmlPdfController.CarregarArquivosXml(CdsNotasFiscais:TClientDataSet;GeraDanfe:boolean;ProgressBar:TJvSpecialProgress);
var I:Integer;
OpenDialog:TOpenDialog;
AcbrNfe:TACBrNFe;
AcbrDanfe:TACBrNFeDANFeRL;
begin
  AcbrNfe:=TAcbrNfe.Create(nil);
  AcbrDanfe:=TACBrNFeDANFeRL.Create(nil);
  ACBrNFe.DANFE:=AcbrDanfe;
  AcbrNfe.Configuracoes.Geral.RetirarAcentos:=true;

  OpenDialog:=TOpenDialog.Create(nil);
  OpenDialog.Options:=[ofHideReadOnly,ofAllowMultiSelect,ofEnableSizing];
  Opendialog.Filter:='Arquivos Xml (*.xml)|*.xml|';

  if (OpenDialog.Execute) then
  begin
    CdsNotasFiscais.EmptyDataSet;
    DataModuleItensDetalhados.CdsDetalheItemFiltro.EmptyDataSet;
    RemoveDiretorio(ExtractFilePath(Application.ExeName)+'Danfes\');

    ProgressBar.Position:=0;
    ProgressBar.Minimum:=0;
    ProgressBar.Maximum:=OpenDialog.Files.Count;
    ProgressBar.Visible:=True;

    for I := 0 to OpenDialog.Files.Count -1 do
    begin
      AcbrNfe.NotasFiscais.Clear;
      if AcbrNfe.NotasFiscais.LoadFromFile(OpenDialog.Files[I]) then
      begin
        ProgressBar.Caption:='Carregando Nota Fiscal '+I.ToString+'/'+OpenDialog.Files.Count.ToString;
        ProgressBar.Position:=ProgressBar.Position+1;
        CdsNotasFiscais.Append;
        CdsNotasFiscais.FieldByName('NUMERO').AsString:= IntToStr(AcbrNfe.NotasFiscais.Items[0].NFe.Ide.nNF);
        CdsNotasFiscais.FieldByName('SERIE').AsString:= IntToStr(AcbrNfe.NotasFiscais.Items[0].NFe.Ide.serie);
        CdsNotasFiscais.FieldByName('DATA_EMISSAO').AsDateTime:= AcbrNfe.NotasFiscais.Items[0].NFe.Ide.dEmi;
        CdsNotasFiscais.FieldByName('DATA_SAIDA_ENTRADA').AsDateTime:= AcbrNfe.NotasFiscais.Items[0].NFe.Ide.dSaiEnt;
        CdsNotasFiscais.FieldByName('FORNECEDOR_CLIENTE').AsString:= upperCase(AcbrNfe.NotasFiscais.Items[0].NFe.Emit.xNome);
        CdsNotasFiscais.FieldByName('VALOR').AsCurrency:= AcbrNfe.NotasFiscais.Items[0].NFe.Total.ICMSTot.vNF;
        CdsNotasFiscais.FieldByName('CAMINHO_ARQUIVO_XML').AsString:= OpenDialog.Files[I];
        CdsNotasFiscais.FieldByName('CHAVE_ACESSO').AsString:=AcbrNfe.NotasFiscais.Items[0].NFe.procNFe.chNFe;
        if GeraDanfe = true then
        CdsNotasFiscais.FieldByName('CAMINHO_ARQUIVO_PDF').AsString:= ConverteArquivoXmlToPdf(OpenDialog.Files[I],AcbrNfe);
        CdsNotasFiscais.FieldByName('STATUS_NOTA').AsString:= IntToStr(AcbrNfe.NotasFiscais.Items[0].NFe.Ide.nNF);
        CdsNotasFiscais.Post;
        PreencheDadosItens(AcbrNfe);
      end;
    end;
  end;
  Freeandnil(OpenDialog);
  Freeandnil(AcbrNfe);
  FreeandNil(AcbrDanfe);
  ProgressBar.Visible:=False;
end;

class function TXmlPdfController.GetArquivoDanfe(CdsNotasFiscais:TClientDataSet):String;
var AcbrNfe:TAcbrNfe;
AcbrDanfe:TACBrNFeDANFeRL;
begin
  Result:='';
  if fileexists(CdsNotasFiscais.FieldByName('CAMINHO_ARQUIVO_PDF').AsString) then
  Result:=CdsNotasFiscais.FieldByName('CAMINHO_ARQUIVO_PDF').AsString
  else
  begin
    AcbrNfe:=TAcbrNfe.Create(nil);
    AcbrDanfe:=TACBrNFeDANFeRL.Create(nil);
    ACBrNFe.DANFE:=AcbrDanfe;
    CdsNotasFiscais.Edit;
    CdsNotasFiscais.FieldByName('CAMINHO_ARQUIVO_PDF').AsString:=
    TXmlPdfController.ConverteArquivoXmlToPdf(CdsNotasFiscais.FieldByName('CAMINHO_ARQUIVO_XML').AsString,AcbrNfe);
    CdsNotasFiscais.post;
    Freeandnil(AcbrNfe);
    Freeandnil(AcbrDanfe);
    Result:=CdsNotasFiscais.FieldByName('CAMINHO_ARQUIVO_PDF').AsString;
  end;
end;

class function TXmlPdfController.ConverteArquivoXmlToPdf(ArquivoXml:String;AcbrNfe:TAcbrNfe):String;
var DestinoArquivos:string;I,cont:integer;
begin
  Result:='';
  DestinoArquivos:=ExtractFilePath(Application.ExeName)+'Danfes\';
  ACBrNFe.DANFE.PathPDF:= DestinoArquivos;
  if FileExists(ArquivoXml) then
  begin
    ACBrNFe.NotasFiscais.Clear;
    ACBrNFe.NotasFiscais.LoadFromFile(ArquivoXml);
    if ACBrNFe.NotasFiscais.Items[0].cStat = 6 then
    ACBrNFe.DANFE.Cancelada:=true
    else
    ACBrNFe.DANFE.Cancelada:=false;
    ACBrNFe.NotasFiscais.ImprimirPDF;
    //RenomearArquivoPdf(Cds,DestinoArquivos,DestinoArquivos+'\'+Cds.FieldByName('CHAVE_ACESSO').AsString+'-nfe.pdf');
    Result:=DestinoArquivos+ACBrNFe.NotasFiscais.Items[0].Nfe.procNFe.chNFe+'-nfe.pdf';
  end;
end;

class procedure TXmlPdfController.ConfiguraSelecaoTodosItens(ColunaGrid:Integer;ProgressBar:TJvSpecialProgress);
var i:integer;
Selecionado:String;
begin
  if DataModuleItensDetalhados.CdsDetalheItemFiltro.RecordCount > 0 then
  begin
    if ColunaGrid = 0 then
    begin
      ProgressBar.Visible:=true;
      ProgressBar.TextOption:= toPercent;
      ProgressBar.Minimum:=0;
      ProgressBar.Maximum:=DataModuleItensDetalhados.CdsDetalheItemFiltro.RecordCount;
      ProgressBar.Position:=0;
      DataModuleItensDetalhados.CdsDetalheItemFiltro.First;
      Selecionado:= DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('SELECAO').AsString;
      Selecionado := IfThen(Selecionado='S','','S');
      for I := 0 to DataModuleItensDetalhados.CdsDetalheItemFiltro.RecordCount - 1 do
      begin
        ProgressBar.Position:=ProgressBar.Position+1;
        DataModuleItensDetalhados.CdsDetalheItemFiltro.Edit;
        DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('SELECAO').AsString := Selecionado;
        DataModuleItensDetalhados.CdsDetalheItemFiltro.Post;
        DataModuleItensDetalhados.CdsDetalheItemFiltro.Next;
      end;
      DataModuleItensDetalhados.CdsDetalheItemFiltro.First;
      ProgressBar.Visible:=false;
    end;
  end;
end;


class procedure TXmlPdfController.FiltraNotasFiscaisRefFiltroItens(CdsNotasFiscais:TClientDataSet);
var Filtro:String;
I:Integer;
begin
  DataModuleItensDetalhados.CdsDetalheItemFiltro.First;
  FConverteXml.CdsNotasFiscais.Filtered:=false;
  for I := 0  to DataModuleItensDetalhados.CdsDetalheItemFiltro.RecordCount - 1 do
  begin
    if DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('SELECAO').AsString = 'S' then
    begin
      if Filtro = '' then
      Filtro:='CHAVE_ACESSO'+' = '+QuotedStr(DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('CHAVE_ACESSO').AsString)
      else
      Filtro:=Filtro+' or CHAVE_ACESSO'+' = '+QuotedStr(DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('CHAVE_ACESSO').AsString);
    end;
    DataModuleItensDetalhados.CdsDetalheItemFiltro.Next;
  end;

  CdsNotasFiscais.Filter:=Filtro;
  CdsNotasFiscais.Filtered:=true;
end;

class procedure TXmlPdfController.ExportaItensParaExcel(Grid:TJvDBUltimGrid);
var NomeArquivo:String;
SaveDialog: TSaveDialog;
Excel: TJvDBGridExcelExport;
begin
  try
    SaveDialog:=TSaveDialog.Create(nil);
    Excel:= TJvDBGridExcelExport.Create(nil);

    try
      SaveDialog.Filter := 'Arquivos do EXCEL (*.XLS)|*.XLS';
      if SaveDialog.Execute then
      begin
        DataModuleItensDetalhados.CdsDetalheItemFiltro.Active:=true;
        Excel.Grid:=Grid;
        NomeArquivo := SaveDialog.FileName;
        Excel.FileName := NomeArquivo + '.XLS';
        Excel.ExportGrid;
        Application.MessageBox('Arquivo exportado com sucesso.', 'Informação do Sistema', MB_OK + MB_ICONINFORMATION);
      end;
    except
      Application.MessageBox('Ocorreu um erro na exportação dos dados.', 'Erro', MB_OK + MB_ICONERROR)
    end;

  finally
    Freeandnil(SaveDialog);
    Freeandnil(Excel);
  end;
end;

class procedure TXmlPdfController.SelecionaItemNaGrid(ColunaGrid:Integer);
begin
   if ColunaGrid = 0 then
  begin
    DataModuleItensDetalhados.CdsDetalheItemFiltro.Edit;
    if DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('SELECAO').AsString = '' then
    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('SELECAO').AsString := 'S'
    else
    DataModuleItensDetalhados.CdsDetalheItemFiltro.FieldByName('SELECAO').AsString := '';
    DataModuleItensDetalhados.CdsDetalheItemFiltro.Post;
  end;
end;

end.

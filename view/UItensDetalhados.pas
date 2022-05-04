unit UItensDetalhados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,Vcl.DBGrids,
  Vcl.ExtCtrls, UDataModuleNfe, JvExDBGrids, JvDBGrid,JvDBUltimGrid,XmlPdfController, JvExControls, JvSpecialProgress,
  Vcl.Buttons, JvComponentBase, JvDBGridExport, JvgExportComponents,UDataModuleItensDetalhados,System.StrUtils;

type
  TFItensDetalhados = class(TForm)
    GroupBoxPesquisa: TGroupBox;
    Panel1: TPanel;
    EditPesquisa: TEdit;
    LabelPesquisa: TLabel;
    GridItens: TJvDBUltimGrid;
    ProgressBarSelecao: TJvSpecialProgress;
    BotaoExecutaFiltro: TBitBtn;
    BotaoVoltar: TBitBtn;
    BotaoExportaParaExcel: TBitBtn;
    PanelTotais: TPanel;
    procedure EditPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure GridItensColEnter(Sender: TObject);
    procedure GridItensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GridItensCellClick(Column: TColumn);
    procedure GridItensTitleClick(Column: TColumn);
    procedure BotaoExecutaFiltroClick(Sender: TObject);
    procedure BotaoVoltarClick(Sender: TObject);
    procedure BotaoExportaParaExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FItensDetalhados: TFItensDetalhados;

implementation


{$R *.dfm}

uses UConverteXml;

procedure TFItensDetalhados.EditPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  TXmlPdfController.PesquisaPadrao(DataModuleItensDetalhados.CdsDetalheItemFiltro,GridItens,EditPesquisa.Text);
end;

procedure TFItensDetalhados.BotaoVoltarClick(Sender: TObject);
begin
  close;
end;

procedure TFItensDetalhados.FormShow(Sender: TObject);
begin
  DataModuleItensDetalhados.CdsDetalheItemFiltro.Filtered:=false;
end;

procedure TFItensDetalhados.GridItensColEnter(Sender: TObject);
begin
  labelPesquisa.Caption:= 'Pesquisa pelo "'+GridItens.Columns.Grid.SelectedField.DisplayLabel+'". Para mudar o campo de pesquisa selecione o campo desejado na grid';
end;

procedure TFItensDetalhados.GridItensDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TXmlPdfController.DesenhaCheckBoxGridPadrao(DataModuleItensDetalhados.CdsDetalheItemFiltro,'SELECAO','S',GridItens,Column,Rect);
end;

procedure TFItensDetalhados.GridItensTitleClick(Column: TColumn);
begin
  if Column.Index > 0 then
  TXmlPdfController.OrdenarGrid_PintaTitulo(GridItens,Column,DataModuleItensDetalhados.CdsDetalheItemFiltro)
  else
  TXmlPdfController.ConfiguraSelecaoTodosItens(Column.Index,ProgressBarSelecao);
end;

procedure TFItensDetalhados.BotaoExecutaFiltroClick(Sender: TObject);
begin
  TXmlPdfController.FiltraNotasFiscaisRefFiltroItens(FConverteXml.CdsNotasFiscais);
  Close;
end;

procedure TFItensDetalhados.BotaoExportaParaExcelClick(Sender: TObject);
begin
  TXmlPdfController.ExportaItensParaExcel(GridItens);
end;

procedure TFItensDetalhados.GridItensCellClick(Column: TColumn);
begin
  TXmlPdfController.SelecionaItemNaGrid(Column.Index);
end;





end.

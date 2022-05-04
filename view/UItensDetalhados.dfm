object FItensDetalhados: TFItensDetalhados
  Left = 0
  Top = 0
  Caption = 'Pesquisa Itens Detalhados'
  ClientHeight = 592
  ClientWidth = 996
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ProgressBarSelecao: TJvSpecialProgress
    Left = 0
    Top = 57
    Width = 996
    Height = 35
    Align = alTop
    Caption = 'teste'
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TextCentered = True
    TextOption = toCaption
    Visible = False
    ExplicitLeft = 2
    ExplicitTop = 15
    ExplicitWidth = 509
  end
  object GroupBoxPesquisa: TGroupBox
    Left = 0
    Top = 0
    Width = 996
    Height = 57
    Align = alTop
    Caption = 'Pesquisa'
    TabOrder = 0
    object LabelPesquisa: TLabel
      Left = 2
      Top = 42
      Width = 992
      Height = 13
      Align = alBottom
      Caption = 
        'Pesquisa pelo "Nome". Para mudar o campo de pesquisa selecione o' +
        ' campo desejado na grid'
      ExplicitWidth = 441
    end
    object EditPesquisa: TEdit
      Left = 2
      Top = 21
      Width = 992
      Height = 21
      Align = alBottom
      CharCase = ecUpperCase
      TabOrder = 0
      OnKeyPress = EditPesquisaKeyPress
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 551
    Width = 996
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 1
    object BotaoExecutaFiltro: TBitBtn
      Left = 335
      Top = 6
      Width = 313
      Height = 25
      Caption = 'Filtrar notas fiscais conforme itens selecionados acima'
      TabOrder = 0
      OnClick = BotaoExecutaFiltroClick
    end
    object BotaoVoltar: TBitBtn
      Left = 16
      Top = 6
      Width = 313
      Height = 25
      Caption = 'Voltar'
      TabOrder = 1
      OnClick = BotaoVoltarClick
    end
    object BotaoExportaParaExcel: TBitBtn
      Left = 654
      Top = 6
      Width = 313
      Height = 25
      Caption = 'Exportar para Excel'
      TabOrder = 2
      OnClick = BotaoExportaParaExcelClick
    end
  end
  object GridItens: TJvDBUltimGrid
    Left = 0
    Top = 92
    Width = 996
    Height = 428
    Align = alClient
    DataSource = DataModuleItensDetalhados.DSDetalheItemFiltro
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = GridItensCellClick
    OnColEnter = GridItensColEnter
    OnDrawColumnCell = GridItensDrawColumnCell
    OnTitleClick = GridItensTitleClick
    AlternateRowColor = 15593713
    TitleArrow = True
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'SELECAO'
        Width = 23
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO_NF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NCM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CFOP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CEST'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_TOTAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORIGEM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CST_ICMS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CSOSN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CST_ICMS_CONCATENADA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BASE_CALCULO_ICMS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALIQUOTA_ICMS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_ICMS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_BASE_CALCULO_ICMS_ST'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALIQUOTA_ICMS_ST'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_ICMS_ST'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALIQUOTA_CREDITO_ICMS_SN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_CREDITO_ICMS_SN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CST_PIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BASE_CALCULO_PIS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALIQUOTA_PIS_PERCENTUAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_PIS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CST_COFINS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BASE_CALCULO_COFINS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALIQUOTA_COFINS_PERCENTUAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_COFINS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CST_IPI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_BASE_CALCULO_IPI'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALIQUOTA_IPI'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_IPI'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CNPJ_EMITENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMITENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Width = 328
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CNPJ_DESTINATARIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESTINATARIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Width = 311
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_EMISSAO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_SAIDA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTIDADE_COMERCIAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIDADE_COMERCIAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_UNITARIO_COMERCIAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_OPERACAO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONSUMIDOR_FINAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FORMA_EMISSAO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NATUREZA_OPERACAO'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_TOTAL_NOTA_FISCAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CHAVE_ACESSO_EXPORTA_EXCEL'
        Visible = True
      end>
  end
  object PanelTotais: TPanel
    Left = 0
    Top = 520
    Width = 996
    Height = 31
    Align = alBottom
    Caption = ' '
    TabOrder = 3
  end
end

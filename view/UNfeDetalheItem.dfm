object FNfeDetalheItem: TFNfeDetalheItem
  Left = 0
  Top = 0
  Caption = 'FNfeDetalheItem'
  ClientHeight = 614
  ClientWidth = 1032
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBoxDados: TGroupBox
    Left = 0
    Top = 25
    Width = 1032
    Height = 589
    Align = alClient
    Caption = ' '
    TabOrder = 0
    ExplicitTop = 0
    ExplicitWidth = 1036
    ExplicitHeight = 593
    object GroupBoxProdutos: TGroupBox
      Left = 2
      Top = 15
      Width = 1028
      Height = 66
      Align = alTop
      Caption = 'Produto/Servi'#231'os/Mercadorias'
      TabOrder = 0
      ExplicitWidth = 1032
      object EditNumeroItem: TLabeledDBEdit
        Left = 11
        Top = 36
        Width = 115
        Height = 21
        BiDiMode = bdLeftToRight
        CharCase = ecUpperCase
        DataField = 'NUMERO_ITEM'
        DataSource = FDataModuleNFe.DSNfeDetalhe
        ParentBiDiMode = False
        TabOrder = 0
        DBEditLabel.Width = 91
        DBEditLabel.Height = 13
        DBEditLabel.BiDiMode = bdLeftToRight
        DBEditLabel.Caption = 'Numero Sequencial'
        DBEditLabel.ParentBiDiMode = False
      end
      object EditCodigoProduto: TLabeledDBEdit
        Left = 132
        Top = 36
        Width = 179
        Height = 21
        BiDiMode = bdLeftToRight
        CharCase = ecUpperCase
        DataField = 'CODIGO_PRODUTO'
        DataSource = FDataModuleNFe.DSNfeDetalhe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 1
        DBEditLabel.Width = 117
        DBEditLabel.Height = 13
        DBEditLabel.BiDiMode = bdLeftToRight
        DBEditLabel.Caption = 'C'#243'd Mercadoria/Produto'
        DBEditLabel.ParentBiDiMode = False
      end
      object EditNomeProduto: TLabeledDBEdit
        Left = 312
        Top = 36
        Width = 705
        Height = 21
        BiDiMode = bdLeftToRight
        CharCase = ecUpperCase
        DataField = 'NOME_PRODUTO'
        DataSource = FDataModuleNFe.DSNfeDetalhe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 2
        DBEditLabel.Width = 144
        DBEditLabel.Height = 13
        DBEditLabel.BiDiMode = bdLeftToRight
        DBEditLabel.Caption = 'Descri'#231#227'o Mercadoria/Produto'
        DBEditLabel.ParentBiDiMode = False
      end
    end
    object GroupBoxInfTributarias: TGroupBox
      Left = 2
      Top = 81
      Width = 1028
      Height = 152
      Align = alTop
      Caption = 'Informa'#231#245'es Tribut'#225'rias'
      TabOrder = 1
      ExplicitWidth = 1032
      object EditCfop: TLabeledDBEdit
        Left = 11
        Top = 35
        Width = 97
        Height = 21
        BiDiMode = bdLeftToRight
        CharCase = ecUpperCase
        DataField = 'CFOP'
        DataSource = FDataModuleNFe.DSNfeDetalhe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        MaxLength = 4
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 0
        DBEditLabel.Width = 27
        DBEditLabel.Height = 13
        DBEditLabel.BiDiMode = bdLeftToRight
        DBEditLabel.Caption = 'CFOP'
        DBEditLabel.ParentBiDiMode = False
      end
      object EditNcm: TLabeledDBEdit
        Left = 11
        Top = 80
        Width = 97
        Height = 21
        BiDiMode = bdLeftToRight
        CharCase = ecUpperCase
        DataField = 'NCM'
        DataSource = FDataModuleNFe.DSNfeDetalhe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        MaxLength = 8
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 2
        DBEditLabel.Width = 22
        DBEditLabel.Height = 13
        DBEditLabel.BiDiMode = bdLeftToRight
        DBEditLabel.Caption = 'NCM'
        DBEditLabel.ParentBiDiMode = False
      end
      object EditCest: TLabeledDBEdit
        Left = 11
        Top = 123
        Width = 97
        Height = 21
        BiDiMode = bdLeftToRight
        CharCase = ecUpperCase
        DataField = 'CEST'
        DataSource = FDataModuleNFe.DSNfeDetalhe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        MaxLength = 7
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 4
        DBEditLabel.Width = 22
        DBEditLabel.Height = 13
        DBEditLabel.BiDiMode = bdLeftToRight
        DBEditLabel.Caption = 'Cest'
        DBEditLabel.ParentBiDiMode = False
      end
      object EditNcmDescricao: TLabeledEdit
        Left = 109
        Top = 80
        Width = 908
        Height = 21
        TabStop = False
        BiDiMode = bdLeftToRight
        EditLabel.Width = 6
        EditLabel.Height = 13
        EditLabel.BiDiMode = bdLeftToRight
        EditLabel.Caption = '  '
        EditLabel.ParentBiDiMode = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object EditCestDescricao: TLabeledEdit
        Left = 109
        Top = 123
        Width = 908
        Height = 21
        TabStop = False
        BiDiMode = bdLeftToRight
        EditLabel.Width = 6
        EditLabel.Height = 13
        EditLabel.BiDiMode = bdLeftToRight
        EditLabel.Caption = '  '
        EditLabel.ParentBiDiMode = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object EditCfopDescricao: TLabeledEdit
        Left = 109
        Top = 35
        Width = 908
        Height = 21
        TabStop = False
        BiDiMode = bdLeftToRight
        EditLabel.Width = 6
        EditLabel.Height = 13
        EditLabel.BiDiMode = bdLeftToRight
        EditLabel.Caption = '  '
        EditLabel.ParentBiDiMode = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
    object GroupBoxComercial: TGroupBox
      Left = 2
      Top = 233
      Width = 1028
      Height = 72
      Align = alTop
      Caption = 'Quantidade/Valor Unit'#225'rio Comercial'
      TabOrder = 2
      ExplicitWidth = 1032
      object EdittQuantidadeComercial: TLabeledDBEdit
        Tag = 99
        Left = 192
        Top = 36
        Width = 150
        Height = 21
        BiDiMode = bdLeftToRight
        CharCase = ecUpperCase
        DataField = 'QUANTIDADE_COMERCIAL'
        DataSource = FDataModuleNFe.DSNfeDetalhe
        ParentBiDiMode = False
        TabOrder = 0
        DBEditLabel.Width = 56
        DBEditLabel.Height = 13
        DBEditLabel.BiDiMode = bdLeftToRight
        DBEditLabel.Caption = 'Quantidade'
        DBEditLabel.ParentBiDiMode = False
      end
      object EditValorUnitarioComerial: TLabeledDBEdit
        Left = 348
        Top = 36
        Width = 171
        Height = 21
        BiDiMode = bdLeftToRight
        CharCase = ecUpperCase
        DataField = 'VALOR_UNITARIO_COMERCIAL'
        DataSource = FDataModuleNFe.DSNfeDetalhe
        ParentBiDiMode = False
        TabOrder = 1
        DBEditLabel.Width = 64
        DBEditLabel.Height = 13
        DBEditLabel.BiDiMode = bdLeftToRight
        DBEditLabel.Caption = 'Valor Unit'#225'rio'
        DBEditLabel.ParentBiDiMode = False
      end
      object EditGtin: TLabeledDBEdit
        Left = 660
        Top = 36
        Width = 357
        Height = 21
        BiDiMode = bdLeftToRight
        CharCase = ecUpperCase
        DataField = 'GTIN'
        DataSource = FDataModuleNFe.DSNfeDetalhe
        ParentBiDiMode = False
        TabOrder = 3
        DBEditLabel.Width = 82
        DBEditLabel.Height = 13
        DBEditLabel.BiDiMode = bdLeftToRight
        DBEditLabel.Caption = 'C'#243'digo de Barras'
        DBEditLabel.ParentBiDiMode = False
      end
      object EditValorBrutoProduto: TLabeledDBEdit
        Left = 525
        Top = 35
        Width = 129
        Height = 21
        BiDiMode = bdLeftToRight
        CharCase = ecUpperCase
        DataField = 'VALOR_BRUTO_PRODUTO'
        DataSource = FDataModuleNFe.DSNfeDetalhe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        DBEditLabel.Width = 80
        DBEditLabel.Height = 13
        DBEditLabel.BiDiMode = bdLeftToRight
        DBEditLabel.Caption = 'Valor do Produto'
        DBEditLabel.ParentBiDiMode = False
      end
      object EditUnidadeComercial: TLabeledDBEdit
        Left = 14
        Top = 36
        Width = 172
        Height = 21
        BiDiMode = bdLeftToRight
        CharCase = ecUpperCase
        DataField = 'UNIDADE_COMERCIAL'
        DataSource = FDataModuleNFe.DSNfeDetalhe
        MaxLength = 6
        ParentBiDiMode = False
        TabOrder = 4
        DBEditLabel.Width = 88
        DBEditLabel.Height = 13
        DBEditLabel.BiDiMode = bdLeftToRight
        DBEditLabel.Caption = 'Unidade Comercial'
        DBEditLabel.ParentBiDiMode = False
      end
    end
    object GroupBoxTributavel: TGroupBox
      Left = 2
      Top = 305
      Width = 1028
      Height = 72
      Align = alTop
      Caption = 'Quantidade/Valor Unit'#225'rio Tribut'#225'rio'
      TabOrder = 3
      ExplicitWidth = 1032
      object EditQuantidadeTributavel: TLabeledDBEdit
        Left = 192
        Top = 36
        Width = 150
        Height = 21
        BiDiMode = bdLeftToRight
        CharCase = ecUpperCase
        DataField = 'QUANTIDADE_TRIBUTAVEL'
        DataSource = FDataModuleNFe.DSNfeDetalhe
        ParentBiDiMode = False
        TabOrder = 0
        DBEditLabel.Width = 56
        DBEditLabel.Height = 13
        DBEditLabel.BiDiMode = bdLeftToRight
        DBEditLabel.Caption = 'Quantidade'
        DBEditLabel.ParentBiDiMode = False
      end
      object EditValorUnitarioTributavel: TLabeledDBEdit
        Left = 348
        Top = 36
        Width = 170
        Height = 21
        BiDiMode = bdLeftToRight
        CharCase = ecUpperCase
        DataField = 'VALOR_UNITARIO_TRIBUTAVEL'
        DataSource = FDataModuleNFe.DSNfeDetalhe
        ParentBiDiMode = False
        ReadOnly = True
        TabOrder = 1
        DBEditLabel.Width = 64
        DBEditLabel.Height = 13
        DBEditLabel.BiDiMode = bdLeftToRight
        DBEditLabel.Caption = 'Valor Unit'#225'rio'
        DBEditLabel.ParentBiDiMode = False
      end
      object EditGtinUnidadeTributavel: TLabeledDBEdit
        Left = 659
        Top = 36
        Width = 358
        Height = 21
        BiDiMode = bdLeftToRight
        CharCase = ecUpperCase
        DataField = 'GTIN_UNIDADE_TRIBUTAVEL'
        DataSource = FDataModuleNFe.DSNfeDetalhe
        ParentBiDiMode = False
        TabOrder = 3
        DBEditLabel.Width = 82
        DBEditLabel.Height = 13
        DBEditLabel.BiDiMode = bdLeftToRight
        DBEditLabel.Caption = 'C'#243'digo de Barras'
        DBEditLabel.ParentBiDiMode = False
      end
      object EditValorBrutoProduto2: TLabeledDBEdit
        Left = 524
        Top = 36
        Width = 129
        Height = 21
        BiDiMode = bdLeftToRight
        CharCase = ecUpperCase
        DataField = 'VALOR_BRUTO_PRODUTO'
        DataSource = FDataModuleNFe.DSNfeDetalhe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        DBEditLabel.Width = 80
        DBEditLabel.Height = 13
        DBEditLabel.BiDiMode = bdLeftToRight
        DBEditLabel.Caption = 'Valor do Produto'
        DBEditLabel.ParentBiDiMode = False
      end
      object EditUnidadeTributavel: TLabeledDBEdit
        Left = 14
        Top = 36
        Width = 172
        Height = 21
        BiDiMode = bdLeftToRight
        CharCase = ecUpperCase
        DataField = 'UNIDADE_TRIBUTAVEL'
        DataSource = FDataModuleNFe.DSNfeDetalhe
        MaxLength = 6
        ParentBiDiMode = False
        TabOrder = 4
        DBEditLabel.Width = 88
        DBEditLabel.Height = 13
        DBEditLabel.BiDiMode = bdLeftToRight
        DBEditLabel.Caption = 'Unidade Tribut'#225'ria'
        DBEditLabel.ParentBiDiMode = False
      end
    end
    object GroupBoxValores: TGroupBox
      Left = 2
      Top = 377
      Width = 1028
      Height = 71
      Align = alTop
      Caption = 'Descontos/Acr'#233'scimos'
      TabOrder = 4
      ExplicitWidth = 1032
      object EditValorFrete: TLabeledDBEdit
        Left = 11
        Top = 34
        Width = 175
        Height = 21
        BiDiMode = bdLeftToRight
        CharCase = ecUpperCase
        DataField = 'VALOR_FRETE'
        DataSource = FDataModuleNFe.DSNfeDetalhe
        ParentBiDiMode = False
        TabOrder = 0
        DBEditLabel.Width = 26
        DBEditLabel.Height = 13
        DBEditLabel.BiDiMode = bdLeftToRight
        DBEditLabel.Caption = 'Frete'
        DBEditLabel.ParentBiDiMode = False
      end
      object EditValorSeguro: TLabeledDBEdit
        Left = 192
        Top = 34
        Width = 150
        Height = 21
        BiDiMode = bdLeftToRight
        CharCase = ecUpperCase
        DataField = 'VALOR_SEGURO'
        DataSource = FDataModuleNFe.DSNfeDetalhe
        ParentBiDiMode = False
        TabOrder = 1
        DBEditLabel.Width = 34
        DBEditLabel.Height = 13
        DBEditLabel.BiDiMode = bdLeftToRight
        DBEditLabel.Caption = 'Seguro'
        DBEditLabel.ParentBiDiMode = False
      end
      object EditValorDesconto: TLabeledDBEdit
        Left = 348
        Top = 34
        Width = 150
        Height = 21
        BiDiMode = bdLeftToRight
        CharCase = ecUpperCase
        DataField = 'VALOR_DESCONTO'
        DataSource = FDataModuleNFe.DSNfeDetalhe
        ParentBiDiMode = False
        TabOrder = 2
        DBEditLabel.Width = 45
        DBEditLabel.Height = 13
        DBEditLabel.BiDiMode = bdLeftToRight
        DBEditLabel.Caption = 'Desconto'
        DBEditLabel.ParentBiDiMode = False
      end
      object EditValorOutrasDespesas: TLabeledDBEdit
        Left = 504
        Top = 34
        Width = 150
        Height = 21
        BiDiMode = bdLeftToRight
        CharCase = ecUpperCase
        DataField = 'VALOR_OUTRAS_DESPESAS'
        DataSource = FDataModuleNFe.DSNfeDetalhe
        ParentBiDiMode = False
        TabOrder = 3
        DBEditLabel.Width = 100
        DBEditLabel.Height = 13
        DBEditLabel.BiDiMode = bdLeftToRight
        DBEditLabel.Caption = 'Despesas Acessorias'
        DBEditLabel.ParentBiDiMode = False
      end
      object EditValorTotal: TLabeledDBEdit
        Left = 660
        Top = 34
        Width = 143
        Height = 21
        BiDiMode = bdLeftToRight
        CharCase = ecUpperCase
        DataField = 'VALOR_TOTAL'
        DataSource = FDataModuleNFe.DSNfeDetalhe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        DBEditLabel.Width = 51
        DBEditLabel.Height = 13
        DBEditLabel.BiDiMode = bdLeftToRight
        DBEditLabel.Caption = 'Valor Total'
        DBEditLabel.Color = clYellow
        DBEditLabel.ParentBiDiMode = False
        DBEditLabel.ParentColor = False
      end
      object EditValorTotalTributos: TLabeledDBEdit
        Left = 809
        Top = 34
        Width = 208
        Height = 21
        BiDiMode = bdLeftToRight
        CharCase = ecUpperCase
        DataField = 'VALOR_FRETE'
        DataSource = FDataModuleNFe.DSNfeDetalhe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 5
        DBEditLabel.Width = 113
        DBEditLabel.Height = 13
        DBEditLabel.BiDiMode = bdLeftToRight
        DBEditLabel.Caption = 'Valor Total dos Tributos'
        DBEditLabel.ParentBiDiMode = False
      end
    end
    object GroupBoxOutrasInformacoes: TGroupBox
      Left = 2
      Top = 448
      Width = 1028
      Height = 139
      Align = alClient
      Caption = 'Outras Informa'#231#245'es'
      TabOrder = 5
      ExplicitWidth = 1032
      ExplicitHeight = 143
      DesignSize = (
        1028
        139)
      object Label1: TLabel
        Left = 14
        Top = 64
        Width = 110
        Height = 13
        Caption = 'Informa'#231#245'es Adicionais'
      end
      object Label13: TLabel
        Left = 348
        Top = 15
        Width = 130
        Height = 13
        Caption = 'Indicador Escala Relevante'
      end
      object EditValorIpiDevolvido: TLabeledDBEdit
        Left = 13
        Top = 34
        Width = 173
        Height = 21
        BiDiMode = bdLeftToRight
        CharCase = ecUpperCase
        DataField = 'VALOR_IPI_DEVOLVIDO'
        DataSource = FDataModuleNFe.DSNfeDetalhe
        ParentBiDiMode = False
        TabOrder = 0
        DBEditLabel.Width = 62
        DBEditLabel.Height = 13
        DBEditLabel.BiDiMode = bdLeftToRight
        DBEditLabel.Caption = 'Ipi Devolvido'
        DBEditLabel.ParentBiDiMode = False
      end
      object EditPercentualIpiDevolvido: TLabeledDBEdit
        Left = 192
        Top = 34
        Width = 150
        Height = 21
        BiDiMode = bdLeftToRight
        CharCase = ecUpperCase
        DataField = 'PERCENTUAL_DEVOLVIDO'
        DataSource = FDataModuleNFe.DSNfeDetalhe
        ParentBiDiMode = False
        TabOrder = 1
        DBEditLabel.Width = 116
        DBEditLabel.Height = 13
        DBEditLabel.BiDiMode = bdLeftToRight
        DBEditLabel.Caption = 'Percentual Ipi Devolvido'
        DBEditLabel.ParentBiDiMode = False
      end
      object EditCnpjFabricante: TLabeledDBEdit
        Left = 504
        Top = 34
        Width = 150
        Height = 21
        BiDiMode = bdLeftToRight
        CharCase = ecUpperCase
        DataField = 'CNPJ_FABRICANTE'
        DataSource = FDataModuleNFe.DSNfeDetalhe
        MaxLength = 14
        ParentBiDiMode = False
        TabOrder = 3
        DBEditLabel.Width = 76
        DBEditLabel.Height = 13
        DBEditLabel.BiDiMode = bdLeftToRight
        DBEditLabel.Caption = 'Cnpj Fabricante'
        DBEditLabel.ParentBiDiMode = False
      end
      object EditBeneficioFiscalUF: TLabeledDBEdit
        Left = 809
        Top = 34
        Width = 208
        Height = 21
        BiDiMode = bdLeftToRight
        CharCase = ecUpperCase
        DataField = 'BENEFICIO_FISCAL_UF'
        DataSource = FDataModuleNFe.DSNfeDetalhe
        MaxLength = 10
        ParentBiDiMode = False
        TabOrder = 5
        DBEditLabel.Width = 88
        DBEditLabel.Height = 13
        DBEditLabel.BiDiMode = bdLeftToRight
        DBEditLabel.Caption = 'Benef'#237'cio Fiscal UF'
        DBEditLabel.ParentBiDiMode = False
      end
      object EditExIpi: TLabeledDBEdit
        Left = 660
        Top = 34
        Width = 143
        Height = 21
        BiDiMode = bdLeftToRight
        CharCase = ecUpperCase
        DataField = 'EX_TIPI'
        DataSource = FDataModuleNFe.DSNfeDetalhe
        MaxLength = 3
        ParentBiDiMode = False
        TabOrder = 4
        DBEditLabel.Width = 35
        DBEditLabel.Height = 13
        DBEditLabel.BiDiMode = bdLeftToRight
        DBEditLabel.Caption = 'EX TIPI'
        DBEditLabel.ParentBiDiMode = False
      end
      object MemoInformacoesAdicionais: TDBMemo
        Left = 13
        Top = 80
        Width = 1004
        Height = 52
        DataField = 'INFORMACOES_ADICIONAIS'
        DataSource = FDataModuleNFe.DSNfeDetalhe
        TabOrder = 6
      end
      object ComboBoxIndicadorEscalaRelevante: TJvDBComboBox
        Left = 348
        Top = 34
        Width = 150
        Height = 21
        DataField = 'INDICADOR_ESCALA_RELEVANTE'
        DataSource = FDataModuleNFe.DSNfeDetalhe
        Anchors = [akLeft, akTop, akRight]
        Items.Strings = (
          ''
          'Sim'
          'N'#227'o')
        TabOrder = 2
        Values.Strings = (
          ''
          'S'
          'N')
        ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
        ListSettings.OutfilteredValueFont.Color = clRed
        ListSettings.OutfilteredValueFont.Height = -11
        ListSettings.OutfilteredValueFont.Name = 'Tahoma'
        ListSettings.OutfilteredValueFont.Style = []
      end
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 0
    Width = 1032
    Height = 25
    DataSource = FDataModuleNFe.DSNfeDetalhe
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    Align = alTop
    TabOrder = 1
    ExplicitLeft = 387
    ExplicitTop = 6
    ExplicitWidth = 240
  end
end

object FNfeDetalheAnexo: TFNfeDetalheAnexo
  Tag = 1
  Left = 291
  Top = 274
  Caption = 'NF-e Detalhes Anexo'
  ClientHeight = 258
  ClientWidth = 1207
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControlDadosTributacao: TPageControl
    Left = 0
    Top = 0
    Width = 1207
    Height = 258
    ActivePage = TsCombustivel
    Align = alClient
    TabOrder = 0
    object tsIpi: TTabSheet
      Caption = 'IPI'
      ImageIndex = 3
      object PanelDetalheIpi: TPanel
        Left = 0
        Top = 0
        Width = 1199
        Height = 230
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Label15: TLabel
          Left = 13
          Top = 4
          Width = 90
          Height = 13
          Caption = 'Situa'#231#227'o Tribut'#225'ria'
        end
        object DBEditQuantidadeUnidadeTributavelIpi: TLabeledDBEdit
          Left = 258
          Top = 98
          Width = 114
          Height = 21
          CharCase = ecUpperCase
          DataField = 'QUANTIDADE_UNIDADE_TRIBUTAVEL'
          DataSource = FDataModuleNFe.DSNfeDetalheImpostoIpi
          TabOrder = 8
          DBEditLabel.Width = 101
          DBEditLabel.Height = 13
          DBEditLabel.Caption = 'Qtde Und Tribut'#225'vel:'
        end
        object DBEditValorBcIpi: TLabeledDBEdit
          Left = 9
          Top = 98
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          DataField = 'VALOR_BASE_CALCULO_IPI'
          DataSource = FDataModuleNFe.DSNfeDetalheImpostoIpi
          TabOrder = 6
          DBEditLabel.Width = 103
          DBEditLabel.Height = 13
          DBEditLabel.Caption = 'Base de C'#225'lculo (BC):'
        end
        object DBEditAliquotaIpi: TLabeledDBEdit
          Left = 136
          Top = 98
          Width = 116
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ALIQUOTA_IPI'
          DataSource = FDataModuleNFe.DSNfeDetalheImpostoIpi
          TabOrder = 7
          DBEditLabel.Width = 43
          DBEditLabel.Height = 13
          DBEditLabel.Caption = 'Al'#237'quota:'
        end
        object DBEditValorIpi: TLabeledDBEdit
          Left = 505
          Top = 98
          Width = 233
          Height = 21
          CharCase = ecUpperCase
          DataField = 'VALOR_IPI'
          DataSource = FDataModuleNFe.DSNfeDetalheImpostoIpi
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 10
          DBEditLabel.Width = 28
          DBEditLabel.Height = 13
          DBEditLabel.Caption = 'Valor:'
        end
        object DBEditValorUnidadeTributavelIpi: TLabeledDBEdit
          Left = 378
          Top = 98
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          DataField = 'VALOR_UNIDADE_TRIBUTAVEL'
          DataSource = FDataModuleNFe.DSNfeDetalheImpostoIpi
          TabOrder = 9
          DBEditLabel.Width = 101
          DBEditLabel.Height = 13
          DBEditLabel.Caption = 'Valor Und Tribut'#225'vel:'
        end
        object DBEditEnquadramentoLegalIpi: TLabeledDBEdit
          Left = 9
          Top = 58
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ENQUADRAMENTO_LEGAL_IPI'
          DataSource = FDataModuleNFe.DSNfeDetalheImpostoIpi
          TabOrder = 1
          DBEditLabel.Width = 121
          DBEditLabel.Height = 13
          DBEditLabel.Caption = 'Enquadramento Legal IPI'
        end
        object DBEditCnpjProdutor: TLabeledDBEdit
          Left = 378
          Top = 58
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CNPJ_PRODUTOR'
          DataSource = FDataModuleNFe.DSNfeDetalheImpostoIpi
          TabOrder = 3
          DBEditLabel.Width = 74
          DBEditLabel.Height = 13
          DBEditLabel.Caption = 'CNPJ Produtor:'
        end
        object DBEditQuantidadeSeloIpi: TLabeledDBEdit
          Left = 624
          Top = 58
          Width = 114
          Height = 21
          CharCase = ecUpperCase
          DataField = 'QUANTIDADE_SELO_IPI'
          DataSource = FDataModuleNFe.DSNfeDetalheImpostoIpi
          TabOrder = 5
          DBEditLabel.Width = 83
          DBEditLabel.Height = 13
          DBEditLabel.Caption = 'Quantidade Selo:'
        end
        object DBEditCodigoSeloIpi: TLabeledDBEdit
          Left = 505
          Top = 58
          Width = 113
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CODIGO_SELO_IPI'
          DataSource = FDataModuleNFe.DSNfeDetalheImpostoIpi
          TabOrder = 4
          DBEditLabel.Width = 60
          DBEditLabel.Height = 13
          DBEditLabel.Caption = 'C'#243'digo Selo:'
        end
        object ComboBoxCstIpi: TJvDBComboBox
          Left = 9
          Top = 19
          Width = 729
          Height = 21
          DataField = 'CST_IPI'
          DataSource = FDataModuleNFe.DSNfeDetalheImpostoIpi
          TabOrder = 0
          ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
          ListSettings.OutfilteredValueFont.Color = clRed
          ListSettings.OutfilteredValueFont.Height = -11
          ListSettings.OutfilteredValueFont.Name = 'Tahoma'
          ListSettings.OutfilteredValueFont.Style = []
        end
        object EditEnquadramentoIpi: TLabeledDBEdit
          Left = 136
          Top = 58
          Width = 236
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ENQUADRAMENTO_IPI'
          DataSource = FDataModuleNFe.DSNfeDetalheImpostoIpi
          TabOrder = 2
          DBEditLabel.Width = 191
          DBEditLabel.Height = 13
          DBEditLabel.Caption = 'Enquadramento IPI (cigarros e bebidas)'
        end
      end
    end
    object TsIcms: TTabSheet
      Caption = 'ICMS'
      ImageIndex = 2
      object PanelIcms: TPanel
        Left = 0
        Top = 0
        Width = 1199
        Height = 230
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 0
          Width = 105
          Height = 13
          Caption = 'Origem da Mercadoria'
        end
        object Label11: TLabel
          Left = 278
          Top = 0
          Width = 57
          Height = 13
          Caption = 'CST/CSOSN'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object ComboBoxCstIcmsA: TJvDBComboBox
          Left = 8
          Top = 16
          Width = 264
          Height = 21
          DataField = 'ORIGEM_MERCADORIA'
          DataSource = FDataModuleNFe.DSNfeImpostoIcms
          DragKind = dkDock
          TabOrder = 0
          ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
          ListSettings.OutfilteredValueFont.Color = clRed
          ListSettings.OutfilteredValueFont.Height = -11
          ListSettings.OutfilteredValueFont.Name = 'Tahoma'
          ListSettings.OutfilteredValueFont.Style = []
        end
        object ComboBoxCstIcmsB: TJvDBComboBox
          Left = 278
          Top = 16
          Width = 563
          Height = 21
          DataField = 'CST_ICMS'
          DataSource = FDataModuleNFe.DSNfeImpostoIcms
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
          ListSettings.OutfilteredValueFont.Color = clRed
          ListSettings.OutfilteredValueFont.Height = -11
          ListSettings.OutfilteredValueFont.Name = 'Tahoma'
          ListSettings.OutfilteredValueFont.Style = []
        end
        object ComboBoxCsosnB: TJvDBComboBox
          Left = 278
          Top = 16
          Width = 563
          Height = 21
          DataField = 'CSOSN'
          DataSource = FDataModuleNFe.DSNfeImpostoIcms
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
          ListSettings.OutfilteredValueFont.Color = clRed
          ListSettings.OutfilteredValueFont.Height = -11
          ListSettings.OutfilteredValueFont.Name = 'Tahoma'
          ListSettings.OutfilteredValueFont.Style = []
        end
        object PageControlIcms: TPageControl
          Left = 8
          Top = 43
          Width = 825
          Height = 121
          ActivePage = TsIcmsSt
          TabOrder = 3
          object tsIcmsNormal: TTabSheet
            Caption = 'ICMS Normal'
            object Label21: TLabel
              Left = 3
              Top = 0
              Width = 145
              Height = 13
              Caption = 'Modalidade Base Calculo ICMS'
            end
            object Label2: TLabel
              Left = 3
              Top = 41
              Width = 126
              Height = 13
              Caption = 'Motivo Desonera'#231#227'o ICMS'
            end
            object ComboBoxModalidadeBcIcms: TJvDBComboBox
              Left = 3
              Top = 16
              Width = 158
              Height = 21
              DataField = 'MODALIDADE_BC_ICMS'
              DataSource = FDataModuleNFe.DSNfeImpostoIcms
              TabOrder = 0
              ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
              ListSettings.OutfilteredValueFont.Color = clRed
              ListSettings.OutfilteredValueFont.Height = -11
              ListSettings.OutfilteredValueFont.Name = 'Tahoma'
              ListSettings.OutfilteredValueFont.Style = []
            end
            object DBEditTaxaReducaoBcIcms: TLabeledDBEdit
              Left = 167
              Top = 16
              Width = 74
              Height = 21
              CharCase = ecUpperCase
              DataField = 'TAXA_REDUCAO_BC_ICMS'
              DataSource = FDataModuleNFe.DSNfeImpostoIcms
              TabOrder = 1
              DBEditLabel.Width = 72
              DBEditLabel.Height = 13
              DBEditLabel.Caption = '% Redu'#231#227'o BC'
            end
            object DBEditBcIcms: TLabeledDBEdit
              Left = 247
              Top = 16
              Width = 106
              Height = 21
              CharCase = ecUpperCase
              DataField = 'BASE_CALCULO_ICMS'
              DataSource = FDataModuleNFe.DSNfeImpostoIcms
              TabOrder = 2
              DBEditLabel.Width = 46
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'B.C.ICMS'
            end
            object DBEditAliquotaIcms: TLabeledDBEdit
              Left = 359
              Top = 16
              Width = 54
              Height = 21
              CharCase = ecUpperCase
              DataField = 'ALIQUOTA_ICMS'
              DataSource = FDataModuleNFe.DSNfeImpostoIcms
              TabOrder = 3
              DBEditLabel.Width = 39
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Al'#237'quota'
            end
            object DBEditValorIcms: TLabeledDBEdit
              Left = 419
              Top = 16
              Width = 93
              Height = 21
              CharCase = ecUpperCase
              DataField = 'VALOR_ICMS'
              DataSource = FDataModuleNFe.DSNfeImpostoIcms
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 4
              DBEditLabel.Width = 52
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Valor ICMS'
            end
            object DBEditValorCreditoIcmsSn: TLabeledDBEdit
              Left = 610
              Top = 16
              Width = 151
              Height = 21
              CharCase = ecUpperCase
              DataField = 'VALOR_CREDITO_ICMS_SN'
              DataSource = FDataModuleNFe.DSNfeImpostoIcms
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 6
              DBEditLabel.Width = 78
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Valor Cr'#233'dito SN'
            end
            object DBEditAliquotaCreditoIcmsSn: TLabeledDBEdit
              Left = 518
              Top = 16
              Width = 86
              Height = 21
              CharCase = ecUpperCase
              DataField = 'ALIQUOTA_CREDITO_ICMS_SN'
              DataSource = FDataModuleNFe.DSNfeImpostoIcms
              TabOrder = 5
              DBEditLabel.Width = 72
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Al'#237'q.Cr'#233'dito SN'
            end
            object DBEditPercentualBcOperacaoPropria: TLabeledDBEdit
              Left = 267
              Top = 55
              Width = 86
              Height = 21
              CharCase = ecUpperCase
              DataField = 'PERCENTUAL_BC_OPERACAO_PROPRIA'
              DataSource = FDataModuleNFe.DSNfeImpostoIcms
              TabOrder = 9
              DBEditLabel.Width = 86
              DBEditLabel.Height = 13
              DBEditLabel.Caption = '% BC Op.Pr'#243'pria:'
            end
            object ComboBoxMotivoDesoneracaoIcms: TJvDBComboBox
              Left = 3
              Top = 55
              Width = 158
              Height = 21
              DataField = 'MOTIVO_DESONERACAO_ICMS'
              DataSource = FDataModuleNFe.DSNfeImpostoIcms
              TabOrder = 7
              ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
              ListSettings.OutfilteredValueFont.Color = clRed
              ListSettings.OutfilteredValueFont.Height = -11
              ListSettings.OutfilteredValueFont.Name = 'Tahoma'
              ListSettings.OutfilteredValueFont.Style = []
            end
            object DBEditIcmsDesonerado: TLabeledDBEdit
              Left = 167
              Top = 55
              Width = 94
              Height = 21
              CharCase = ecUpperCase
              DataField = 'VALOR_ICMS_DESONERADO'
              DataSource = FDataModuleNFe.DSNfeImpostoIcms
              TabOrder = 8
              DBEditLabel.Width = 86
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'ICMS Desonerado'
            end
            object DBEditIcmsDiferido: TLabeledDBEdit
              Left = 448
              Top = 55
              Width = 81
              Height = 21
              CharCase = ecUpperCase
              DataField = 'VALOR_ICMS_DIFERIDO'
              DataSource = FDataModuleNFe.DSNfeImpostoIcms
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 11
              DBEditLabel.Width = 65
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'ICMS Diferido'
            end
            object DBEditIcmsOperacao: TLabeledDBEdit
              Left = 359
              Top = 55
              Width = 83
              Height = 21
              CharCase = ecUpperCase
              DataField = 'VALOR_ICMS_OPERACAO'
              DataSource = FDataModuleNFe.DSNfeImpostoIcms
              TabOrder = 10
              DBEditLabel.Width = 82
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Icms Oper. Prop.'
            end
            object EditBaseCalculoFCP: TLabeledDBEdit
              Left = 535
              Top = 55
              Width = 69
              Height = 21
              CharCase = ecUpperCase
              DataField = 'BASE_CALCULO_ICMS_FCP'
              DataSource = FDataModuleNFe.DSNfeImpostoIcms
              TabOrder = 12
              DBEditLabel.Width = 65
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'B.C.Icms FCP'
            end
            object EditAliquotaFcp: TLabeledDBEdit
              Left = 610
              Top = 55
              Width = 58
              Height = 21
              CharCase = ecUpperCase
              DataField = 'ALIQUOTA_ICMS_FCP'
              DataSource = FDataModuleNFe.DSNfeImpostoIcms
              TabOrder = 13
              DBEditLabel.Width = 50
              DBEditLabel.Height = 13
              DBEditLabel.Caption = '% Rel.Fcp'
            end
            object EditValorFcp: TLabeledDBEdit
              Left = 674
              Top = 55
              Width = 87
              Height = 21
              CharCase = ecUpperCase
              DataField = 'VALOR_ICMS_FCP'
              DataSource = FDataModuleNFe.DSNfeImpostoIcms
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 14
              DBEditLabel.Width = 74
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Valor ICMS FCP'
            end
          end
          object TsIcmsSt: TTabSheet
            Caption = 'ICMS ST'
            ImageIndex = 1
            object Label22: TLabel
              Left = 0
              Top = 1
              Width = 121
              Height = 13
              Caption = 'Modalidade B.C. ICMS ST'
            end
            object Label3: TLabel
              Left = 748
              Top = 44
              Width = 28
              Height = 13
              Caption = 'UF ST'
            end
            object ComboBoxModalidadeBcIcmsST: TJvDBComboBox
              Left = 0
              Top = 17
              Width = 134
              Height = 21
              DataField = 'MODALIDADE_BC_ICMS_ST'
              DataSource = FDataModuleNFe.DSNfeImpostoIcms
              TabOrder = 0
              ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
              ListSettings.OutfilteredValueFont.Color = clRed
              ListSettings.OutfilteredValueFont.Height = -11
              ListSettings.OutfilteredValueFont.Name = 'Tahoma'
              ListSettings.OutfilteredValueFont.Style = []
            end
            object DBEditPercentualMvaIcmsSt: TLabeledDBEdit
              Left = 220
              Top = 17
              Width = 47
              Height = 21
              CharCase = ecUpperCase
              DataField = 'PERCENTUAL_MVA_ICMS_ST'
              DataSource = FDataModuleNFe.DSNfeImpostoIcms
              TabOrder = 2
              DBEditLabel.Width = 35
              DBEditLabel.Height = 13
              DBEditLabel.Caption = '% MVA'
            end
            object DBEditTaxaReducaoBcIcmsSt: TLabeledDBEdit
              Left = 140
              Top = 17
              Width = 74
              Height = 21
              CharCase = ecUpperCase
              DataField = 'PERCENTUAL_REDUCAO_BC_ICMS_ST'
              DataSource = FDataModuleNFe.DSNfeImpostoIcms
              TabOrder = 1
              DBEditLabel.Width = 68
              DBEditLabel.Height = 13
              DBEditLabel.Caption = '% Red. BC ST'
            end
            object DBEditValorBcIcmsSt: TLabeledDBEdit
              Left = 273
              Top = 17
              Width = 101
              Height = 21
              CharCase = ecUpperCase
              DataField = 'VALOR_BASE_CALCULO_ICMS_ST'
              DataSource = FDataModuleNFe.DSNfeImpostoIcms
              TabOrder = 3
              DBEditLabel.Width = 36
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'B.C. ST'
            end
            object DBEditAliquotaIcmsSt: TLabeledDBEdit
              Left = 380
              Top = 17
              Width = 53
              Height = 21
              CharCase = ecUpperCase
              DataField = 'ALIQUOTA_ICMS_ST'
              DataSource = FDataModuleNFe.DSNfeImpostoIcms
              TabOrder = 4
              DBEditLabel.Width = 50
              DBEditLabel.Height = 13
              DBEditLabel.Caption = '% Al'#237'q. ST'
            end
            object DBEditValorIcmsSt: TLabeledDBEdit
              Left = 438
              Top = 17
              Width = 83
              Height = 21
              CharCase = ecUpperCase
              DataField = 'VALOR_ICMS_ST'
              DataSource = FDataModuleNFe.DSNfeImpostoIcms
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 5
              DBEditLabel.Width = 39
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Valor ST'
            end
            object DBEditValorBcIcmsStRetido: TLabeledDBEdit
              Left = 326
              Top = 57
              Width = 80
              Height = 21
              CharCase = ecUpperCase
              DataField = 'VALOR_BC_ICMS_ST_RETIDO'
              DataSource = FDataModuleNFe.DSNfeImpostoIcms
              TabOrder = 13
              DBEditLabel.Width = 70
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'B.C. ST Retido'
            end
            object DBEditValorIcmsStRetido: TLabeledDBEdit
              Left = 412
              Top = 57
              Width = 66
              Height = 21
              CharCase = ecUpperCase
              DataField = 'VALOR_ICMS_ST_RETIDO'
              DataSource = FDataModuleNFe.DSNfeImpostoIcms
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 14
              DBEditLabel.Width = 46
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'ST Retido'
            end
            object DBEditValorBcIcmsStDestino: TLabeledDBEdit
              Left = 578
              Top = 57
              Width = 86
              Height = 21
              CharCase = ecUpperCase
              DataField = 'VALOR_BC_ICMS_ST_DESTINO'
              DataSource = FDataModuleNFe.DSNfeImpostoIcms
              TabOrder = 16
              DBEditLabel.Width = 75
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'B.C. ST Destino'
            end
            object DBEditValorIcmsStDestino: TLabeledDBEdit
              Left = 670
              Top = 57
              Width = 72
              Height = 21
              CharCase = ecUpperCase
              DataField = 'VALOR_ICMS_ST_DESTINO'
              DataSource = FDataModuleNFe.DSNfeImpostoIcms
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 17
              DBEditLabel.Width = 51
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'ST Destino'
            end
            object ComboBoxUfST: TJvDBComboBox
              Left = 748
              Top = 57
              Width = 66
              Height = 21
              DataField = 'UF_ST'
              DataSource = FDataModuleNFe.DSNfeImpostoIcms
              TabOrder = 18
              ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
              ListSettings.OutfilteredValueFont.Color = clRed
              ListSettings.OutfilteredValueFont.Height = -11
              ListSettings.OutfilteredValueFont.Name = 'Tahoma'
              ListSettings.OutfilteredValueFont.Style = []
            end
            object EditBaseCalculoFCPST: TLabeledDBEdit
              Left = 0
              Top = 57
              Width = 86
              Height = 21
              CharCase = ecUpperCase
              DataField = 'BASE_CALCULO_ICMS_FCP_ST'
              DataSource = FDataModuleNFe.DSNfeImpostoIcms
              TabOrder = 9
              DBEditLabel.Width = 80
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'B.C.Icms FCP ST'
            end
            object EditAliquotaFcpST: TLabeledDBEdit
              Left = 92
              Top = 57
              Width = 64
              Height = 21
              CharCase = ecUpperCase
              DataField = 'ALIQUOTA_ICMS_FCP_ST'
              DataSource = FDataModuleNFe.DSNfeImpostoIcms
              TabOrder = 10
              DBEditLabel.Width = 50
              DBEditLabel.Height = 13
              DBEditLabel.Caption = '% Rel.Fcp'
            end
            object EditValorFcpST: TLabeledDBEdit
              Left = 162
              Top = 57
              Width = 68
              Height = 21
              CharCase = ecUpperCase
              DataField = 'VALOR_ICMS_FCP_ST'
              DataSource = FDataModuleNFe.DSNfeImpostoIcms
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 11
              DBEditLabel.Width = 62
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'ICMS FCP ST'
            end
            object EditBaseCalculoIcmsFcpStRetidoAnteriormente: TLabeledDBEdit
              Left = 527
              Top = 17
              Width = 103
              Height = 21
              CharCase = ecUpperCase
              DataField = 'BASE_CALCULO_ICMS_FCP_ST_RETIDO_ANTERIORMENTE'
              DataSource = FDataModuleNFe.DSNfeImpostoIcms
              TabOrder = 6
              DBEditLabel.Width = 100
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'B.C.FCP ST Ret.Ant.'
            end
            object EditAliquotaIcmsFcpStRetidoAnteriormente: TLabeledDBEdit
              Left = 636
              Top = 17
              Width = 98
              Height = 21
              CharCase = ecUpperCase
              DataField = 'ALIQUOTA_ICMS_FCP_ST_RETIDO_ANTERIORMENTE'
              DataSource = FDataModuleNFe.DSNfeImpostoIcms
              TabOrder = 7
              DBEditLabel.Width = 93
              DBEditLabel.Height = 13
              DBEditLabel.Caption = '% FCP ST Ret.Ant.'
            end
            object EditValorIcmsFcpStRetidoAnteriormente: TLabeledDBEdit
              Left = 740
              Top = 17
              Width = 74
              Height = 21
              CharCase = ecUpperCase
              DataField = 'VALOR_ICMS_FCP_ST_RETIDO_ANTERIORMENTE'
              DataSource = FDataModuleNFe.DSNfeImpostoIcms
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 8
              DBEditLabel.Width = 79
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'FCP ST Ret.Ant.'
            end
            object EditAliquotaStSuportadaConsumidorFinal: TLabeledDBEdit
              Left = 236
              Top = 57
              Width = 84
              Height = 21
              CharCase = ecUpperCase
              DataField = 'ALIQUOTA_ST_SUPORTADA_CONSUMIDOR_FINAL'
              DataSource = FDataModuleNFe.DSNfeImpostoIcms
              TabOrder = 12
              DBEditLabel.Width = 79
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Al'#237'q. Sup.C.Final'
            end
            object DBEditValorIcmsSubstituto: TLabeledDBEdit
              Left = 484
              Top = 57
              Width = 88
              Height = 21
              CharCase = ecUpperCase
              DataField = 'VALOR_ICMS_SUBSTITUTO'
              DataSource = FDataModuleNFe.DSNfeImpostoIcms
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 15
              DBEditLabel.Width = 74
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Icms Substituto'
            end
          end
        end
      end
    end
    object tsPis: TTabSheet
      Caption = 'PIS'
      object PanelDetalhePis: TPanel
        Left = 0
        Top = 0
        Width = 1199
        Height = 230
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Label13: TLabel
          Left = 8
          Top = -1
          Width = 19
          Height = 13
          Caption = 'CST'
        end
        object ComboBoxCstPis: TJvDBComboBox
          Left = 8
          Top = 14
          Width = 601
          Height = 21
          DataField = 'CST_PIS'
          DataSource = FDataModuleNFe.DSNfeDetalheImpostoPis
          TabOrder = 0
          ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
          ListSettings.OutfilteredValueFont.Color = clRed
          ListSettings.OutfilteredValueFont.Height = -11
          ListSettings.OutfilteredValueFont.Name = 'Tahoma'
          ListSettings.OutfilteredValueFont.Style = []
        end
        object PageControlPis: TPageControl
          Left = 8
          Top = 41
          Width = 601
          Height = 83
          ActivePage = TBPISST
          TabOrder = 1
          object TBPIS: TTabSheet
            Caption = 'PIS'
            object DBEditValorBcPis: TLabeledDBEdit
              Left = 3
              Top = 19
              Width = 110
              Height = 21
              CharCase = ecUpperCase
              DataField = 'BASE_CALCULO_PIS'
              DataSource = FDataModuleNFe.DSNfeDetalheImpostoPis
              TabOrder = 0
              DBEditLabel.Width = 103
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Base de C'#225'lculo (BC):'
            end
            object DBEditAliquotaPisPercentual: TLabeledDBEdit
              Left = 119
              Top = 19
              Width = 110
              Height = 21
              CharCase = ecUpperCase
              DataField = 'ALIQUOTA_PIS_PERCENTUAL'
              DataSource = FDataModuleNFe.DSNfeDetalheImpostoPis
              TabOrder = 1
              DBEditLabel.Width = 97
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Al'#237'quota Percentual:'
            end
            object DBEditQuantidadeVendidaPis: TLabeledDBEdit
              Left = 235
              Top = 19
              Width = 110
              Height = 21
              CharCase = ecUpperCase
              DataField = 'QUANTIDADE_VENDIDA'
              DataSource = FDataModuleNFe.DSNfeDetalheImpostoPis
              TabOrder = 2
              DBEditLabel.Width = 101
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Quantidade Vendida:'
            end
            object DBEditAliquotaPisReais: TLabeledDBEdit
              Left = 351
              Top = 19
              Width = 110
              Height = 21
              CharCase = ecUpperCase
              DataField = 'ALIQUOTA_PIS_REAIS'
              DataSource = FDataModuleNFe.DSNfeDetalheImpostoPis
              TabOrder = 3
              DBEditLabel.Width = 72
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Al'#237'quota Reais:'
            end
            object DBEditValorPis: TLabeledDBEdit
              Left = 467
              Top = 19
              Width = 110
              Height = 21
              CharCase = ecUpperCase
              DataField = 'VALOR_PIS'
              DataSource = FDataModuleNFe.DSNfeDetalheImpostoPis
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 4
              DBEditLabel.Width = 28
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Valor:'
            end
          end
          object TBPISST: TTabSheet
            Caption = 'PIS ST'
            ImageIndex = 1
            object DBEditValorBCPisST: TLabeledDBEdit
              Left = 3
              Top = 19
              Width = 110
              Height = 21
              CharCase = ecUpperCase
              DataField = 'BASE_CALCULO_PIS_ST'
              DataSource = FDataModuleNFe.DSNfeDetalheImpostoPis
              TabOrder = 0
              DBEditLabel.Width = 103
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Base de C'#225'lculo (BC):'
            end
            object DBEditAliquotaPisPercentualST: TLabeledDBEdit
              Left = 120
              Top = 19
              Width = 110
              Height = 21
              CharCase = ecUpperCase
              DataField = 'ALIQUOTA_PIS_PERCENTUAL_ST'
              DataSource = FDataModuleNFe.DSNfeDetalheImpostoPis
              TabOrder = 1
              DBEditLabel.Width = 97
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Al'#237'quota Percentual:'
            end
            object DBEditQuantidadeVendidaPisST: TLabeledDBEdit
              Left = 236
              Top = 19
              Width = 110
              Height = 21
              CharCase = ecUpperCase
              DataField = 'QUANTIDADE_VENDIDA_ST'
              DataSource = FDataModuleNFe.DSNfeDetalheImpostoPis
              TabOrder = 2
              DBEditLabel.Width = 101
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Quantidade Vendida:'
            end
            object DBEditAliquotaPisReaisST: TLabeledDBEdit
              Left = 352
              Top = 19
              Width = 110
              Height = 21
              CharCase = ecUpperCase
              DataField = 'ALIQUOTA_PIS_REAIS_ST'
              DataSource = FDataModuleNFe.DSNfeDetalheImpostoPis
              TabOrder = 3
              DBEditLabel.Width = 72
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Al'#237'quota Reais:'
            end
            object DBEditValorPisST: TLabeledDBEdit
              Left = 468
              Top = 19
              Width = 110
              Height = 21
              CharCase = ecUpperCase
              DataField = 'VALOR_PIS_ST'
              DataSource = FDataModuleNFe.DSNfeDetalheImpostoPis
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 4
              DBEditLabel.Width = 28
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Valor:'
            end
          end
        end
      end
    end
    object tsCofins: TTabSheet
      Caption = 'COFINS'
      ImageIndex = 2
      object PanelDetalheCofins: TPanel
        Left = 0
        Top = 0
        Width = 1199
        Height = 230
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Label14: TLabel
          Left = 8
          Top = 5
          Width = 22
          Height = 13
          Caption = 'CST '
        end
        object ComboBoxCstCofins: TJvDBComboBox
          Left = 8
          Top = 18
          Width = 601
          Height = 21
          DataField = 'CST_COFINS'
          DataSource = FDataModuleNFe.DSNfeDetalheImpostoCofins
          TabOrder = 0
          ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
          ListSettings.OutfilteredValueFont.Color = clRed
          ListSettings.OutfilteredValueFont.Height = -11
          ListSettings.OutfilteredValueFont.Name = 'Tahoma'
          ListSettings.OutfilteredValueFont.Style = []
        end
        object PageControlCofins: TPageControl
          Left = 8
          Top = 45
          Width = 601
          Height = 83
          ActivePage = TBCOFINSST
          TabOrder = 1
          object TBCOFINS: TTabSheet
            Caption = 'COFINS'
            object DBEditValorBcCofins: TLabeledDBEdit
              Left = 7
              Top = 18
              Width = 110
              Height = 21
              CharCase = ecUpperCase
              DataField = 'BASE_CALCULO_COFINS'
              DataSource = FDataModuleNFe.DSNfeDetalheImpostoCofins
              TabOrder = 0
              DBEditLabel.Width = 103
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Base de C'#225'lculo (BC):'
            end
            object DBEditAliquotaCofinsPercentual: TLabeledDBEdit
              Left = 123
              Top = 18
              Width = 110
              Height = 21
              CharCase = ecUpperCase
              DataField = 'ALIQUOTA_COFINS_PERCENTUAL'
              DataSource = FDataModuleNFe.DSNfeDetalheImpostoCofins
              TabOrder = 1
              DBEditLabel.Width = 97
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Al'#237'quota Percentual:'
            end
            object DBEditQuantidadeVendidaCofins: TLabeledDBEdit
              Left = 239
              Top = 18
              Width = 110
              Height = 21
              CharCase = ecUpperCase
              DataField = 'QUANTIDADE_VENDIDA'
              DataSource = FDataModuleNFe.DSNfeDetalheImpostoCofins
              TabOrder = 2
              DBEditLabel.Width = 101
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Quantidade Vendida:'
            end
            object DBEditAliquotaCofinsReais: TLabeledDBEdit
              Left = 355
              Top = 18
              Width = 110
              Height = 21
              CharCase = ecUpperCase
              DataField = 'ALIQUOTA_COFINS_REAIS'
              DataSource = FDataModuleNFe.DSNfeDetalheImpostoCofins
              TabOrder = 3
              DBEditLabel.Width = 72
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Al'#237'quota Reais:'
            end
            object DBEditValorCofins: TLabeledDBEdit
              Left = 471
              Top = 18
              Width = 110
              Height = 21
              CharCase = ecUpperCase
              DataField = 'VALOR_COFINS'
              DataSource = FDataModuleNFe.DSNfeDetalheImpostoCofins
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 4
              DBEditLabel.Width = 28
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Valor:'
            end
          end
          object TBCOFINSST: TTabSheet
            Caption = 'COFINS ST'
            ImageIndex = 1
            object DBEditValorBcCofinsSt: TLabeledDBEdit
              Left = 3
              Top = 18
              Width = 110
              Height = 21
              CharCase = ecUpperCase
              DataField = 'BASE_CALCULO_COFINS_ST'
              DataSource = FDataModuleNFe.DSNfeDetalheImpostoCofins
              TabOrder = 0
              DBEditLabel.Width = 103
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Base de C'#225'lculo (BC):'
              DBEditLabel.Font.Charset = DEFAULT_CHARSET
              DBEditLabel.Font.Color = clWindowText
              DBEditLabel.Font.Height = -11
              DBEditLabel.Font.Name = 'Tahoma'
              DBEditLabel.Font.Style = []
              DBEditLabel.ParentFont = False
            end
            object DBEditAliquotaCofinsPercentualSt: TLabeledDBEdit
              Left = 119
              Top = 18
              Width = 110
              Height = 21
              CharCase = ecUpperCase
              DataField = 'ALIQUOTA_COFINS_PERCENTUAL_ST'
              DataSource = FDataModuleNFe.DSNfeDetalheImpostoCofins
              TabOrder = 1
              DBEditLabel.Width = 97
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Al'#237'quota Percentual:'
            end
            object DBEditQuantidadeVendidaCofinsSt: TLabeledDBEdit
              Left = 235
              Top = 18
              Width = 110
              Height = 21
              CharCase = ecUpperCase
              DataField = 'QUANTIDADE_VENDIDA_ST'
              DataSource = FDataModuleNFe.DSNfeDetalheImpostoCofins
              TabOrder = 2
              DBEditLabel.Width = 101
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Quantidade Vendida:'
            end
            object DBEditAliquotaCofinsReaisST: TLabeledDBEdit
              Left = 351
              Top = 18
              Width = 110
              Height = 21
              CharCase = ecUpperCase
              DataField = 'ALIQUOTA_COFINS_REAIS_ST'
              DataSource = FDataModuleNFe.DSNfeDetalheImpostoCofins
              TabOrder = 3
              DBEditLabel.Width = 72
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Al'#237'quota Reais:'
            end
            object DBEditValorCofinsST: TLabeledDBEdit
              Left = 467
              Top = 18
              Width = 110
              Height = 21
              CharCase = ecUpperCase
              DataField = 'VALOR_COFINS_ST'
              DataSource = FDataModuleNFe.DSNfeDetalheImpostoCofins
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 4
              DBEditLabel.Width = 28
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Valor:'
            end
          end
        end
      end
    end
    object TSFcpDifal: TTabSheet
      Caption = 'Icms em Opera'#231#245'es Interestaduais'
      ImageIndex = 11
      DesignSize = (
        1199
        230)
      object Label4: TLabel
        Left = 3
        Top = 48
        Width = 180
        Height = 13
        Caption = 'Percentual Provis'#243'rio Partilha do Icms'
      end
      object Label23: TLabel
        Left = 607
        Top = 3
        Width = 132
        Height = 13
        Caption = 'Aliquota Icms InterEstadual'
      end
      object EditAliquotaIcmsInternaUfDestino: TLabeledDBEdit
        Left = 451
        Top = 18
        Width = 146
        Height = 21
        CharCase = ecUpperCase
        DataField = 'ALIQUOTA_ICMS_INTERNA_UF_DESTINO'
        DataSource = FDataModuleNFe.DSNfeDetalheImpostoFcpDifal
        TabOrder = 3
        DBEditLabel.Width = 133
        DBEditLabel.Height = 13
        DBEditLabel.Caption = 'Aliquota Interna UF Destino'
      end
      object EditValorIcmsUfDestino: TLabeledDBEdit
        Left = 435
        Top = 66
        Width = 134
        Height = 21
        CharCase = ecUpperCase
        DataField = 'VALOR_ICMS_UF_DESTINO'
        DataSource = FDataModuleNFe.DSNfeDetalheImpostoFcpDifal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        DBEditLabel.Width = 126
        DBEditLabel.Height = 13
        DBEditLabel.Caption = 'Valor Icms UF Destinat'#225'rio'
      end
      object EditValorIcmsFcp: TLabeledDBEdit
        Left = 199
        Top = 66
        Width = 230
        Height = 21
        CharCase = ecUpperCase
        DataField = 'VALOR_ICMS_FCP'
        DataSource = FDataModuleNFe.DSNfeDetalheImpostoFcpDifal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        DBEditLabel.Width = 129
        DBEditLabel.Height = 13
        DBEditLabel.Caption = 'Valor ICMS FCP UF Destino'
      end
      object EditAliquotaFcpUfDestino: TLabeledDBEdit
        Left = 3
        Top = 18
        Width = 178
        Height = 21
        CharCase = ecUpperCase
        DataField = 'ALIQUOTA_FCP_UF_DESTINO'
        DataSource = FDataModuleNFe.DSNfeDetalheImpostoFcpDifal
        TabOrder = 0
        DBEditLabel.Width = 160
        DBEditLabel.Height = 13
        DBEditLabel.Caption = '% Icms Relativo ao FCP UF Dest.'
      end
      object EditValorBcUfDestino: TLabeledDBEdit
        Left = 187
        Top = 18
        Width = 118
        Height = 21
        CharCase = ecUpperCase
        DataField = 'VALOR_BC_UF_DESTINO'
        DataSource = FDataModuleNFe.DSNfeDetalheImpostoFcpDifal
        TabOrder = 1
        DBEditLabel.Width = 73
        DBEditLabel.Height = 13
        DBEditLabel.Caption = 'B.C.UF Destino'
      end
      object ComboboxPercenturalPartilhaIcms: TJvDBComboBox
        Left = 3
        Top = 66
        Width = 190
        Height = 21
        DataField = 'PERCENTUAL_PARTILHA_ICMS'
        DataSource = FDataModuleNFe.DSNfeDetalheImpostoFcpDifal
        Items.Strings = (
          '')
        TabOrder = 5
        ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
        ListSettings.OutfilteredValueFont.Color = clRed
        ListSettings.OutfilteredValueFont.Height = -11
        ListSettings.OutfilteredValueFont.Name = 'Tahoma'
        ListSettings.OutfilteredValueFont.Style = []
      end
      object ComboboxAliquotaInterEstadual: TJvDBComboBox
        Left = 603
        Top = 18
        Width = 131
        Height = 21
        DataField = 'ALIQUOTA_ICMS_INTERESTADUAL'
        DataSource = FDataModuleNFe.DSNfeDetalheImpostoFcpDifal
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
        ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
        ListSettings.OutfilteredValueFont.Color = clRed
        ListSettings.OutfilteredValueFont.Height = -11
        ListSettings.OutfilteredValueFont.Name = 'Tahoma'
        ListSettings.OutfilteredValueFont.Style = []
      end
      object EditValorIcmsUfRemetente: TLabeledDBEdit
        Left = 575
        Top = 66
        Width = 159
        Height = 21
        CharCase = ecUpperCase
        DataField = 'VALOR_ICMS_UF_REMETENTE'
        DataSource = FDataModuleNFe.DSNfeDetalheImpostoFcpDifal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        DBEditLabel.Width = 121
        DBEditLabel.Height = 13
        DBEditLabel.Caption = 'Valor Icms UF Remetente'
      end
      object EditBaseCalculoFcpUfDestinatario: TLabeledDBEdit
        Left = 311
        Top = 18
        Width = 134
        Height = 21
        CharCase = ecUpperCase
        DataField = 'BASE_CALCULO_FCP_UF_DESTINATARIO'
        DataSource = FDataModuleNFe.DSNfeDetalheImpostoFcpDifal
        TabOrder = 2
        DBEditLabel.Width = 85
        DBEditLabel.Height = 13
        DBEditLabel.Caption = 'B.C.FCP UF Dest.'
      end
    end
    object TsExportação: TTabSheet
      Caption = 'Doc. Exporta'#231#227'o Indireta'
      ImageIndex = 12
      object GridExportacao: TJvDBUltimGrid
        Left = 0
        Top = 0
        Width = 1199
        Height = 230
        Align = alClient
        DataSource = FDataModuleNFe.DSNfeExportacao
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        TitleArrow = True
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 17
        TitleRowHeight = 17
      end
    end
    object tsImpostoImportacao: TTabSheet
      Caption = 'Imposto Importa'#231#227'o'
      ImageIndex = 4
      object PanelDetalheImpostoImportacao: TPanel
        Left = 0
        Top = 0
        Width = 1199
        Height = 230
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object DBEditValorBcIi: TLabeledDBEdit
          Left = 9
          Top = 26
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          DataField = 'VALOR_BC_II'
          DataSource = FDataModuleNFe.DSNfeImpostoImportacao
          TabOrder = 0
          DBEditLabel.Width = 103
          DBEditLabel.Height = 13
          DBEditLabel.Caption = 'Base de C'#225'lculo (BC):'
        end
        object DBEditValorDespesasAduaneirasIi: TLabeledDBEdit
          Left = 136
          Top = 26
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          DataField = 'VALOR_DESPESAS_ADUANEIRAS'
          DataSource = FDataModuleNFe.DSNfeImpostoImportacao
          TabOrder = 1
          DBEditLabel.Width = 107
          DBEditLabel.Height = 13
          DBEditLabel.Caption = 'Despesas Aduaneiras:'
        end
        object DBEditValorIofIi: TLabeledDBEdit
          Left = 390
          Top = 26
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          DataField = 'VALOR_IOF'
          DataSource = FDataModuleNFe.DSNfeImpostoImportacao
          TabOrder = 3
          DBEditLabel.Width = 22
          DBEditLabel.Height = 13
          DBEditLabel.Caption = 'IOF:'
        end
        object DBEditValorIi: TLabeledDBEdit
          Left = 263
          Top = 26
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          DataField = 'VALOR_IMPOSTO_IMPORTACAO'
          DataSource = FDataModuleNFe.DSNfeImpostoImportacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          DBEditLabel.Width = 28
          DBEditLabel.Height = 13
          DBEditLabel.Caption = 'Valor:'
        end
      end
    end
    object tsDeclaracaoImportacao: TTabSheet
      Caption = 'Declara'#231#227'o Importa'#231#227'o/Adi'#231'oes'
      ImageIndex = 10
      object PanelDeclaracaoImportacao: TPanel
        Left = 0
        Top = 0
        Width = 1199
        Height = 230
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object PageControlImportacao: TPageControl
          Left = 0
          Top = 0
          Width = 1199
          Height = 230
          ActivePage = TsAdicoes
          Align = alClient
          TabOrder = 0
          object TsDeclaracaoImportacao2: TTabSheet
            Caption = 'Declara'#231#227'o de Importa'#231#227'o'
            object GridNfeDeclaracaoImportacao: TJvDBUltimGrid
              Left = 0
              Top = 0
              Width = 1191
              Height = 202
              Align = alClient
              DataSource = FDataModuleNFe.DSNfeDeclaracaoImportacao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              TitleButtons = True
              AlternateRowColor = 15593713
              TitleArrow = True
              SelectColumnsDialogStrings.Caption = 'Select columns'
              SelectColumnsDialogStrings.OK = '&OK'
              SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
              CanDelete = False
              EditControls = <>
              RowsHeight = 17
              TitleRowHeight = 17
              SortWith = swFields
            end
          end
          object TsAdicoes: TTabSheet
            Caption = 'Adi'#231'oes'
            ImageIndex = 1
            object GridDeclaracaoImportacaoDetalhe: TJvDBUltimGrid
              Left = 0
              Top = 0
              Width = 1191
              Height = 202
              Align = alClient
              DataSource = FDataModuleNFe.DSNfeImportacaoDetalhe
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              TitleButtons = True
              AlternateRowColor = 15593713
              TitleArrow = True
              SelectColumnsDialogStrings.Caption = 'Select columns'
              SelectColumnsDialogStrings.OK = '&OK'
              SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
              CanDelete = False
              EditControls = <>
              RowsHeight = 17
              TitleRowHeight = 17
              SortWith = swFields
            end
          end
        end
      end
    end
    object TsRastreabilidadeProduto: TTabSheet
      Caption = 'Rastreabilidade do Produto'
      ImageIndex = 13
      object GridNfeDetalheRastreabilidade: TJvDBUltimGrid
        Left = 0
        Top = 0
        Width = 1199
        Height = 230
        Align = alClient
        DataSource = FDataModuleNFe.DSNfeDetalheRastreabilidade
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        TitleButtons = True
        AlternateRowColor = 15593713
        TitleArrow = True
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        CanDelete = False
        EditControls = <>
        RowsHeight = 17
        TitleRowHeight = 17
        SortWith = swFields
      end
    end
    object tsIssqn: TTabSheet
      Caption = 'ISSQN'
      ImageIndex = 5
      object PanelDetalheIssqn: TPanel
        Left = 0
        Top = 0
        Width = 1199
        Height = 230
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Label5: TLabel
          Left = 10
          Top = 50
          Width = 90
          Height = 13
          Caption = 'Item Lista Servi'#231'os'
        end
        object DBEditValorBcIssqn: TLabeledDBEdit
          Left = 7
          Top = 20
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          DataField = 'BASE_CALCULO_ISSQN'
          TabOrder = 0
          DBEditLabel.Width = 103
          DBEditLabel.Height = 13
          DBEditLabel.Caption = 'Base de C'#225'lculo (BC):'
        end
        object DBEditAliquotaIssqn: TLabeledDBEdit
          Left = 134
          Top = 20
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ALIQUOTA_ISSQN'
          TabOrder = 1
          DBEditLabel.Width = 43
          DBEditLabel.Height = 13
          DBEditLabel.Caption = 'Al'#237'quota:'
        end
        object DBEditValorIssqn: TLabeledDBEdit
          Left = 261
          Top = 20
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          DataField = 'VALOR_ISSQN'
          TabOrder = 2
          DBEditLabel.Width = 28
          DBEditLabel.Height = 13
          DBEditLabel.Caption = 'Valor:'
        end
        object DBEditMunicipioIssqn: TLabeledDBEdit
          Left = 388
          Top = 20
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          DataField = 'MUNICIPIO_ISSQN'
          TabOrder = 3
          DBEditLabel.Width = 47
          DBEditLabel.Height = 13
          DBEditLabel.Caption = 'Munic'#237'pio:'
        end
        object JvDBComboBox1: TJvDBComboBox
          Left = 7
          Top = 67
          Width = 248
          Height = 21
          DataField = 'ITEM_LISTA_SERVICOS'
          TabOrder = 4
          ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
          ListSettings.OutfilteredValueFont.Color = clRed
          ListSettings.OutfilteredValueFont.Height = -11
          ListSettings.OutfilteredValueFont.Name = 'Tahoma'
          ListSettings.OutfilteredValueFont.Style = []
        end
        object EditValorDeducao: TLabeledDBEdit
          Left = 261
          Top = 67
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          DataField = 'VALOR_DEDUCAO'
          TabOrder = 5
          DBEditLabel.Width = 69
          DBEditLabel.Height = 13
          DBEditLabel.Caption = 'Valor Dedu'#231#227'o'
        end
        object EditValorOutrasRetencoes: TLabeledDBEdit
          Left = 388
          Top = 67
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          DataField = 'VALOR_OUTRAS_RETENCOES'
          TabOrder = 6
          DBEditLabel.Width = 114
          DBEditLabel.Height = 13
          DBEditLabel.Caption = 'Valor Outras Reten'#231#245'es'
        end
      end
    end
    object TsCombustivel: TTabSheet
      Caption = 'Combustivel'
      ImageIndex = 13
      object EditCombustivelCodigoAnp: TLabeledDBEdit
        Left = 3
        Top = 19
        Width = 87
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CODIGO_ANP'
        DataSource = FDataModuleNFe.DSDetalheCombustivel
        TabOrder = 0
        DBEditLabel.Width = 55
        DBEditLabel.Height = 13
        DBEditLabel.Caption = 'Codigo Anp'
      end
      object EditCombustivelPercentualGasNatural: TLabeledDBEdit
        Left = 97
        Top = 19
        Width = 89
        Height = 21
        CharCase = ecUpperCase
        DataField = 'PERCENTUAL_GAS_NATURAL'
        DataSource = FDataModuleNFe.DSDetalheCombustivel
        TabOrder = 1
        DBEditLabel.Width = 70
        DBEditLabel.Height = 13
        DBEditLabel.Caption = '% G'#225's Natural'
      end
      object EditCombustivelCODIF: TLabeledDBEdit
        Left = 193
        Top = 19
        Width = 83
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CODIF'
        DataSource = FDataModuleNFe.DSDetalheCombustivel
        TabOrder = 2
        DBEditLabel.Width = 32
        DBEditLabel.Height = 13
        DBEditLabel.Caption = 'CODIF'
      end
      object EditCombustivelQuantidadeAmbiente: TLabeledDBEdit
        Left = 283
        Top = 19
        Width = 68
        Height = 21
        CharCase = ecUpperCase
        DataField = 'QUANTIDADE_TEMP_AMBIENTE'
        DataSource = FDataModuleNFe.DSDetalheCombustivel
        TabOrder = 3
        DBEditLabel.Width = 45
        DBEditLabel.Height = 13
        DBEditLabel.Caption = 'Ambiente'
      end
      object EditCombustivelUFConsumo: TLabeledDBEdit
        Left = 358
        Top = 19
        Width = 53
        Height = 21
        CharCase = ecUpperCase
        DataField = 'UF_CONSUMO'
        DataSource = FDataModuleNFe.DSDetalheCombustivel
        TabOrder = 4
        DBEditLabel.Width = 13
        DBEditLabel.Height = 13
        DBEditLabel.Caption = 'UF'
      end
      object EditCombustivelBaseCalculoCIDE: TLabeledDBEdit
        Left = 418
        Top = 19
        Width = 98
        Height = 21
        CharCase = ecUpperCase
        DataField = 'BASE_CALCULO_CIDE'
        DataSource = FDataModuleNFe.DSDetalheCombustivel
        TabOrder = 5
        DBEditLabel.Width = 87
        DBEditLabel.Height = 13
        DBEditLabel.Caption = 'Base Calculo CIDE'
      end
      object EditCombustivelAliquotaCIDE: TLabeledDBEdit
        Left = 523
        Top = 19
        Width = 98
        Height = 21
        CharCase = ecUpperCase
        DataField = 'ALIQUOTA_CIDE'
        DataSource = FDataModuleNFe.DSDetalheCombustivel
        TabOrder = 6
        DBEditLabel.Width = 66
        DBEditLabel.Height = 13
        DBEditLabel.Caption = 'Aliquota CIDE'
      end
      object EditCombustivelValorCide: TLabeledDBEdit
        Left = 627
        Top = 19
        Width = 74
        Height = 21
        CharCase = ecUpperCase
        DataField = 'VALOR_CIDE'
        DataSource = FDataModuleNFe.DSDetalheCombustivel
        TabOrder = 7
        DBEditLabel.Width = 51
        DBEditLabel.Height = 13
        DBEditLabel.Caption = 'Valor CIDE'
      end
    end
    object TsVeiculo: TTabSheet
      Caption = 'Veiculo Novo'
      ImageIndex = 10
      object Label6: TLabel
        Left = 7
        Top = 9
        Width = 70
        Height = 13
        Caption = 'Tipo Opera'#231#227'o'
      end
      object Label7: TLabel
        Left = 591
        Top = 101
        Width = 81
        Height = 13
        Caption = 'Tipo Combustivel'
      end
      object Label8: TLabel
        Left = 722
        Top = 56
        Width = 56
        Height = 13
        Caption = 'Tipo Veiculo'
      end
      object Label9: TLabel
        Left = 7
        Top = 101
        Width = 72
        Height = 13
        Caption = 'Especie Veiculo'
      end
      object TLabel
        Left = 722
        Top = 101
        Width = 79
        Height = 13
        Caption = 'Condi'#231#227'o do VIN'
      end
      object Label10: TLabel
        Left = 157
        Top = 101
        Width = 95
        Height = 13
        Caption = 'Condi'#231#227'o do Veiculo'
      end
      object Label12: TLabel
        Left = 289
        Top = 101
        Width = 68
        Height = 13
        Caption = 'Codigo da Cor'
      end
      object Label16: TLabel
        Left = 440
        Top = 101
        Width = 45
        Height = 13
        Caption = 'Restri'#231#227'o'
      end
      object ComboBoxVeiculoTipoOperacao: TJvDBComboBox
        Left = 7
        Top = 24
        Width = 126
        Height = 21
        DataField = 'TIPO_OPERACAO'
        DataSource = FDataModuleNFe.DSNfeDetalheVeiculo
        TabOrder = 0
        ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
        ListSettings.OutfilteredValueFont.Color = clRed
        ListSettings.OutfilteredValueFont.Height = -11
        ListSettings.OutfilteredValueFont.Name = 'Tahoma'
        ListSettings.OutfilteredValueFont.Style = []
      end
      object EditVeiculoChassi: TLabeledDBEdit
        Left = 139
        Top = 24
        Width = 85
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CHASSI'
        DataSource = FDataModuleNFe.DSNfeDetalheVeiculo
        TabOrder = 1
        DBEditLabel.Width = 31
        DBEditLabel.Height = 13
        DBEditLabel.Caption = 'Chassi'
      end
      object EditVeiculoCor: TLabeledDBEdit
        Left = 230
        Top = 24
        Width = 69
        Height = 21
        CharCase = ecUpperCase
        DataField = 'COR'
        DataSource = FDataModuleNFe.DSNfeDetalheVeiculo
        TabOrder = 2
        DBEditLabel.Width = 17
        DBEditLabel.Height = 13
        DBEditLabel.Caption = 'Cor'
      end
      object EditVeiculoDescricaoCor: TLabeledDBEdit
        Left = 305
        Top = 24
        Width = 90
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DESCRICAO_COR'
        DataSource = FDataModuleNFe.DSNfeDetalheVeiculo
        TabOrder = 3
        DBEditLabel.Width = 81
        DBEditLabel.Height = 13
        DBEditLabel.Caption = 'Descricao da Cor'
      end
      object EditVeiculoPotenciaMotor: TLabeledDBEdit
        Left = 401
        Top = 24
        Width = 54
        Height = 21
        CharCase = ecUpperCase
        DataField = 'POTENCIA_MOTOR'
        DataSource = FDataModuleNFe.DSNfeDetalheVeiculo
        TabOrder = 4
        DBEditLabel.Width = 13
        DBEditLabel.Height = 13
        DBEditLabel.Caption = 'CV'
      end
      object EditVeiculoCilindradas: TLabeledDBEdit
        Left = 461
        Top = 24
        Width = 61
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CILINDRADAS'
        DataSource = FDataModuleNFe.DSNfeDetalheVeiculo
        TabOrder = 5
        DBEditLabel.Width = 52
        DBEditLabel.Height = 13
        DBEditLabel.Caption = 'Cilindradas'
      end
      object EditVeiculoPesoLiquido: TLabeledDBEdit
        Left = 528
        Top = 24
        Width = 91
        Height = 21
        CharCase = ecUpperCase
        DataField = 'PESO_LIQUIDO'
        DataSource = FDataModuleNFe.DSNfeDetalheVeiculo
        TabOrder = 6
        DBEditLabel.Width = 59
        DBEditLabel.Height = 13
        DBEditLabel.Caption = 'Peso Liquido'
      end
      object EditVeiculoPesoBruto: TLabeledDBEdit
        Left = 625
        Top = 24
        Width = 91
        Height = 21
        CharCase = ecUpperCase
        DataField = 'PESO_BRUTO'
        DataSource = FDataModuleNFe.DSNfeDetalheVeiculo
        TabOrder = 7
        DBEditLabel.Width = 52
        DBEditLabel.Height = 13
        DBEditLabel.Caption = 'Peso Bruto'
      end
      object EditVeiculoNumeroSerie: TLabeledDBEdit
        Left = 722
        Top = 24
        Width = 111
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NUMERO_SERIE'
        DataSource = FDataModuleNFe.DSNfeDetalheVeiculo
        TabOrder = 8
        DBEditLabel.Width = 79
        DBEditLabel.Height = 13
        DBEditLabel.Caption = 'Numero de Serie'
      end
      object EditVeiculoNumeroMotor: TLabeledDBEdit
        Left = 7
        Top = 70
        Width = 87
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NUMERO_MOTOR'
        DataSource = FDataModuleNFe.DSNfeDetalheVeiculo
        TabOrder = 9
        DBEditLabel.Width = 83
        DBEditLabel.Height = 13
        DBEditLabel.Caption = 'Numero do Motor'
      end
      object EditVeiculoCapacidadeMaximaTracao: TLabeledDBEdit
        Left = 625
        Top = 70
        Width = 91
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CAPACIDADE_MAXIMA_TRACAO'
        DataSource = FDataModuleNFe.DSNfeDetalheVeiculo
        TabOrder = 16
        DBEditLabel.Width = 73
        DBEditLabel.Height = 13
        DBEditLabel.Caption = 'M'#225'ximo/Tra'#231#227'o'
      end
      object EditVeiculoDistanciaEixos: TLabeledDBEdit
        Left = 191
        Top = 70
        Width = 126
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DISTANCIA_EIXOS'
        DataSource = FDataModuleNFe.DSNfeDetalheVeiculo
        TabOrder = 11
        DBEditLabel.Width = 114
        DBEditLabel.Height = 13
        DBEditLabel.Caption = 'Distancia entre os Eixos'
      end
      object EditVeiculoAnoModelo: TLabeledDBEdit
        Left = 323
        Top = 70
        Width = 69
        Height = 21
        CharCase = ecUpperCase
        DataField = 'ANO_MODELO'
        DataSource = FDataModuleNFe.DSNfeDetalheVeiculo
        TabOrder = 12
        DBEditLabel.Width = 57
        DBEditLabel.Height = 13
        DBEditLabel.Caption = 'Ano/Modelo'
      end
      object ComboVeiculoTipoCombustivel: TJvDBComboBox
        Left = 591
        Top = 115
        Width = 125
        Height = 21
        DataField = 'TIPO_COMBUSTIVEL'
        DataSource = FDataModuleNFe.DSNfeDetalheVeiculo
        TabOrder = 22
        ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
        ListSettings.OutfilteredValueFont.Color = clRed
        ListSettings.OutfilteredValueFont.Height = -11
        ListSettings.OutfilteredValueFont.Name = 'Tahoma'
        ListSettings.OutfilteredValueFont.Style = []
      end
      object EditVeiculoAnoFabricacao: TLabeledDBEdit
        Left = 100
        Top = 70
        Width = 85
        Height = 21
        CharCase = ecUpperCase
        DataField = 'ANO_FABRICACAO'
        DataSource = FDataModuleNFe.DSNfeDetalheVeiculo
        TabOrder = 10
        DBEditLabel.Width = 75
        DBEditLabel.Height = 13
        DBEditLabel.Caption = 'Ano/Fabrica'#231#227'o'
      end
      object EditVeiculoTipoPintura: TLabeledDBEdit
        Left = 398
        Top = 70
        Width = 90
        Height = 21
        CharCase = ecUpperCase
        DataField = 'TIPO_PINTURA'
        DataSource = FDataModuleNFe.DSNfeDetalheVeiculo
        TabOrder = 13
        DBEditLabel.Width = 72
        DBEditLabel.Height = 13
        DBEditLabel.Caption = 'Tipo da Pintura'
      end
      object ComboVeiculoTipoVeiculo: TJvDBComboBox
        Left = 722
        Top = 71
        Width = 111
        Height = 21
        DataField = 'TIPO_VEICULO'
        DataSource = FDataModuleNFe.DSNfeDetalheVeiculo
        TabOrder = 17
        ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
        ListSettings.OutfilteredValueFont.Color = clRed
        ListSettings.OutfilteredValueFont.Height = -11
        ListSettings.OutfilteredValueFont.Name = 'Tahoma'
        ListSettings.OutfilteredValueFont.Style = []
      end
      object ComboVeiculoEspecieVeiculo: TJvDBComboBox
        Left = 7
        Top = 115
        Width = 145
        Height = 21
        DataField = 'ESPECIE_VEICULO'
        DataSource = FDataModuleNFe.DSNfeDetalheVeiculo
        TabOrder = 18
        ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
        ListSettings.OutfilteredValueFont.Color = clRed
        ListSettings.OutfilteredValueFont.Height = -11
        ListSettings.OutfilteredValueFont.Name = 'Tahoma'
        ListSettings.OutfilteredValueFont.Style = []
      end
      object ComboVeiculoCondicaoVIN: TJvDBComboBox
        Left = 722
        Top = 115
        Width = 111
        Height = 21
        DataField = 'CONDICAO_VIN'
        DataSource = FDataModuleNFe.DSNfeDetalheVeiculo
        TabOrder = 23
        ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
        ListSettings.OutfilteredValueFont.Color = clRed
        ListSettings.OutfilteredValueFont.Height = -11
        ListSettings.OutfilteredValueFont.Name = 'Tahoma'
        ListSettings.OutfilteredValueFont.Style = []
      end
      object ComboVeiculoCondicaoVeiculo: TJvDBComboBox
        Left = 157
        Top = 115
        Width = 126
        Height = 21
        DataField = 'CONDICAO_VEICULO'
        DataSource = FDataModuleNFe.DSNfeDetalheVeiculo
        TabOrder = 19
        ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
        ListSettings.OutfilteredValueFont.Color = clRed
        ListSettings.OutfilteredValueFont.Height = -11
        ListSettings.OutfilteredValueFont.Name = 'Tahoma'
        ListSettings.OutfilteredValueFont.Style = []
      end
      object EditVeiculoCodigoMarcaModelo: TLabeledDBEdit
        Left = 493
        Top = 70
        Width = 59
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CODIGO_MARCA_MODELO'
        DataSource = FDataModuleNFe.DSNfeDetalheVeiculo
        TabOrder = 14
        DBEditLabel.Width = 57
        DBEditLabel.Height = 13
        DBEditLabel.Caption = 'Cod/Modelo'
      end
      object ComboVeiculoCodigoCor: TJvDBComboBox
        Left = 289
        Top = 115
        Width = 145
        Height = 21
        DataField = 'CODIGO_COR'
        DataSource = FDataModuleNFe.DSNfeDetalheVeiculo
        TabOrder = 20
        ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
        ListSettings.OutfilteredValueFont.Color = clRed
        ListSettings.OutfilteredValueFont.Height = -11
        ListSettings.OutfilteredValueFont.Name = 'Tahoma'
        ListSettings.OutfilteredValueFont.Style = []
      end
      object EditVeiculoLotacao: TLabeledDBEdit
        Left = 558
        Top = 70
        Width = 61
        Height = 21
        CharCase = ecUpperCase
        DataField = 'LOTACAO'
        DataSource = FDataModuleNFe.DSNfeDetalheVeiculo
        TabOrder = 15
        DBEditLabel.Width = 38
        DBEditLabel.Height = 13
        DBEditLabel.Caption = 'Lota'#231#227'o'
      end
      object ComboVeiculoRestricao: TJvDBComboBox
        Left = 440
        Top = 115
        Width = 145
        Height = 21
        DataField = 'RESTRICAO'
        DataSource = FDataModuleNFe.DSNfeDetalheVeiculo
        TabOrder = 21
        ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
        ListSettings.OutfilteredValueFont.Color = clRed
        ListSettings.OutfilteredValueFont.Height = -11
        ListSettings.OutfilteredValueFont.Name = 'Tahoma'
        ListSettings.OutfilteredValueFont.Style = []
      end
    end
    object TsMedicamento: TTabSheet
      Caption = 'Medicamento'
      ImageIndex = 11
      object EditMedicamentoNumeroLote: TLabeledDBEdit
        Left = 9
        Top = 22
        Width = 70
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NUMERO_LOTE'
        DataSource = FDataModuleNFe.DSNfeDetalheMedicamento
        TabOrder = 0
        DBEditLabel.Width = 51
        DBEditLabel.Height = 13
        DBEditLabel.Caption = 'N'#186' do Lote'
      end
      object EditMedicamentoQuantidadeLote: TLabeledDBEdit
        Left = 84
        Top = 22
        Width = 90
        Height = 21
        CharCase = ecUpperCase
        DataField = 'QUANTIDADE_LOTE'
        DataSource = FDataModuleNFe.DSNfeDetalheMedicamento
        TabOrder = 1
        DBEditLabel.Width = 58
        DBEditLabel.Height = 13
        DBEditLabel.Caption = 'Quant. Lote'
      end
      object EditMedicamentoDataFabricacao: TLabeledDBDateEdit
        Left = 179
        Top = 22
        Width = 108
        Height = 21
        DataField = 'DATA_FABRICACAO'
        DataSource = FDataModuleNFe.DSNfeDetalheMedicamento
        ShowNullDate = False
        TabOrder = 2
        DBDateEditLabel.Width = 93
        DBDateEditLabel.Height = 13
        DBDateEditLabel.Caption = 'Data da Fabrica'#231#227'o'
      end
      object EditMedicamentoDataValidade: TLabeledDBDateEdit
        Left = 293
        Top = 22
        Width = 108
        Height = 21
        DataField = 'DATA_VALIDADE'
        DataSource = FDataModuleNFe.DSNfeDetalheMedicamento
        ShowNullDate = False
        TabOrder = 3
        DBDateEditLabel.Width = 81
        DBDateEditLabel.Height = 13
        DBDateEditLabel.Caption = 'Data de Validade'
      end
      object EditMedicamentoPrecoMaximoConsumidor: TLabeledDBEdit
        Left = 407
        Top = 22
        Width = 112
        Height = 21
        CharCase = ecUpperCase
        DataField = 'PRECO_MAXIMO_CONSUMIDOR'
        DataSource = FDataModuleNFe.DSNfeDetalheMedicamento
        TabOrder = 4
        DBEditLabel.Width = 66
        DBEditLabel.Height = 13
        DBEditLabel.Caption = 'Pre'#231'o M'#225'ximo'
      end
    end
    object TsArmamentos: TTabSheet
      Caption = 'Armamentos'
      ImageIndex = 12
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 1199
        Height = 230
        Align = alClient
        Caption = 'Em Desenvolvimento'
        TabOrder = 0
      end
    end
    object TsPapelImune: TTabSheet
      Caption = 'Papel Imune'
      ImageIndex = 14
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 1199
        Height = 230
        Align = alClient
        Caption = 'Em Desenvolvimento'
        TabOrder = 0
      end
    end
    object TsCana: TTabSheet
      Caption = 'Cana'
      ImageIndex = 15
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 1199
        Height = 230
        Align = alClient
        Caption = 'Em Desenvolvimento'
        TabOrder = 0
      end
    end
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = ActionIncluirExportacaoIndireta
            Caption = '&Incluir'
            ImageIndex = 31
          end
          item
            Action = ActionExcluirExportacaoIndireta
            Caption = '&Excluir'
            ImageIndex = 10
          end>
      end
      item
        Items = <
          item
            Action = ActionIncluirDeclaracaoImportacao
            Caption = '&Incluir'
            ImageIndex = 31
          end
          item
            Action = ActionExcluirDeclaracaoImportacao
            Caption = '&Excluir'
            ImageIndex = 10
          end>
      end
      item
        Items = <
          item
            Action = ActionIncluirImportacaoDetalhe
            Caption = '&Incluir'
            ImageIndex = 31
          end
          item
            Action = ActionExcluirImportacaoDetalhe
            Caption = '&Excluir'
            ImageIndex = 10
          end>
      end
      item
        Items = <
          item
            Action = ActionExcluirRastreabilidade
            Caption = '&Excluir'
            ImageIndex = 10
          end
          item
            Action = ActionIncluirRastreabilidade
            Caption = '&Incluir'
            ImageIndex = 31
          end>
      end>
    Left = 764
    Top = 176
    StyleName = 'Platform Default'
    object ActionIncluirExportacaoIndireta: TAction
      Category = 'Exportacao-Indireta'
      Caption = 'Incluir'
      ImageIndex = 31
    end
    object ActionExcluirExportacaoIndireta: TAction
      Category = 'Exportacao-Indireta'
      Caption = 'Excluir'
      ImageIndex = 10
    end
    object ActionIncluirDeclaracaoImportacao: TAction
      Category = 'Declaracao-Importacao'
      Caption = 'Incluir'
      ImageIndex = 31
    end
    object ActionExcluirDeclaracaoImportacao: TAction
      Category = 'Declaracao-Importacao'
      Caption = 'Excluir'
      ImageIndex = 10
    end
    object ActionExcluirImportacaoDetalhe: TAction
      Category = 'Importacao-Detalhe'
      Caption = 'Excluir'
      ImageIndex = 10
    end
    object ActionIncluirImportacaoDetalhe: TAction
      Category = 'Importacao-Detalhe'
      Caption = 'Incluir'
      ImageIndex = 31
    end
    object ActionIncluirRastreabilidade: TAction
      Category = 'Rastreabilidade'
      Caption = 'Incluir'
      ImageIndex = 31
    end
    object ActionExcluirRastreabilidade: TAction
      Category = 'Rastreabilidade'
      Caption = 'Excluir'
      ImageIndex = 10
    end
  end
end

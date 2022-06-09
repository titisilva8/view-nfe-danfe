object FConverteXml: TFConverteXml
  Left = 0
  Top = 0
  Caption = 'Vizualiza NF-e'
  ClientHeight = 621
  ClientWidth = 1784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inline PDFium: TPDFiumFrame
    Left = 513
    Top = 48
    Width = 1271
    Height = 573
    HorzScrollBar.Tracking = True
    VertScrollBar.Increment = 27
    VertScrollBar.Tracking = True
    Align = alClient
    DoubleBuffered = True
    Color = clGray
    ParentBackground = False
    ParentColor = False
    ParentDoubleBuffered = False
    TabOrder = 0
    Visible = False
    OnResize = PDFiumResize
    ExplicitLeft = 513
    ExplicitTop = 48
    ExplicitWidth = 1271
    ExplicitHeight = 573
  end
  object pnButtons: TPanel
    Left = 0
    Top = 0
    Width = 1784
    Height = 48
    Align = alTop
    Caption = 'pnButtons'
    ParentBackground = False
    ParentShowHint = False
    ShowCaption = False
    ShowHint = True
    TabOrder = 1
    object btZPlus: TPaintBox
      Tag = 4
      AlignWithMargins = True
      Left = 108
      Top = 12
      Width = 24
      Height = 24
      Hint = 'Zoom in'
      Margins.Left = 5
      Margins.Top = 11
      Margins.Right = 5
      Margins.Bottom = 11
      Align = alLeft
      OnClick = btZPlusClick
      OnDblClick = btZPlusClick
      OnMouseEnter = ButtonMouseEnter
      OnMouseLeave = ButtonMouseLeave
      OnPaint = ButtonPaint
      ExplicitLeft = 41
    end
    object btZMinus: TPaintBox
      Tag = 2
      AlignWithMargins = True
      Left = 74
      Top = 12
      Width = 24
      Height = 24
      Hint = 'Zoom out'
      Margins.Left = 5
      Margins.Top = 11
      Margins.Right = 5
      Margins.Bottom = 11
      Align = alLeft
      OnClick = btZPlusClick
      OnDblClick = btZPlusClick
      OnMouseEnter = ButtonMouseEnter
      OnMouseLeave = ButtonMouseLeave
      OnPaint = ButtonPaint
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitHeight = 46
    end
    object btOpen: TPaintBox
      AlignWithMargins = True
      Left = 6
      Top = 12
      Width = 24
      Height = 24
      Hint = 'Open file'
      Margins.Left = 5
      Margins.Top = 11
      Margins.Right = 5
      Margins.Bottom = 11
      Align = alLeft
      OnClick = Open1Click
      OnMouseEnter = ButtonMouseEnter
      OnMouseLeave = ButtonMouseLeave
      OnPaint = ButtonPaint
      ExplicitTop = 10
    end
    object pbZoom: TPaintBox
      AlignWithMargins = True
      Left = 140
      Top = 10
      Width = 72
      Height = 28
      Hint = 'Zoom'
      Margins.Top = 9
      Margins.Bottom = 9
      Align = alLeft
      OnMouseDown = pbZoomMouseDown
      OnMouseEnter = ButtonMouseEnter
      OnMouseLeave = ButtonMouseLeave
      OnPaint = pbZoomPaint
      ExplicitLeft = 106
    end
    object btPageWidth: TPaintBox
      Tag = 6
      AlignWithMargins = True
      Left = 288
      Top = 12
      Width = 24
      Height = 24
      Hint = 'Page width'
      Margins.Left = 5
      Margins.Top = 11
      Margins.Right = 5
      Margins.Bottom = 11
      Align = alLeft
      OnClick = mnFitWidthClick
      OnDblClick = mnFitWidthClick
      OnMouseEnter = ButtonMouseEnter
      OnMouseLeave = ButtonMouseLeave
      OnPaint = ButtonPaint
      ExplicitLeft = 338
      ExplicitTop = 24
    end
    object btFullPage: TPaintBox
      Tag = 8
      AlignWithMargins = True
      Left = 254
      Top = 12
      Width = 24
      Height = 24
      Hint = 'Page level'
      Margins.Left = 5
      Margins.Top = 11
      Margins.Right = 5
      Margins.Bottom = 11
      Align = alLeft
      OnClick = mnPageLevelClick
      OnDblClick = mnPageLevelClick
      OnMouseEnter = ButtonMouseEnter
      OnMouseLeave = ButtonMouseLeave
      OnPaint = ButtonPaint
      ExplicitLeft = 220
      ExplicitTop = 10
    end
    object btActualSize: TPaintBox
      Tag = 10
      AlignWithMargins = True
      Left = 220
      Top = 12
      Width = 24
      Height = 24
      Hint = 'Actual size'
      Margins.Left = 5
      Margins.Top = 11
      Margins.Right = 5
      Margins.Bottom = 11
      Align = alLeft
      OnClick = mnActualSizeClick
      OnDblClick = mnActualSizeClick
      OnMouseEnter = ButtonMouseEnter
      OnMouseLeave = ButtonMouseLeave
      OnPaint = ButtonPaint
      ExplicitLeft = 186
      ExplicitTop = 10
    end
    object btAbout: TPaintBox
      Tag = 12
      AlignWithMargins = True
      Left = 1754
      Top = 12
      Width = 24
      Height = 24
      Hint = 'Execute SARL'
      Margins.Left = 5
      Margins.Top = 11
      Margins.Right = 5
      Margins.Bottom = 11
      Align = alRight
      Visible = False
      OnClick = btAboutClick
      OnMouseEnter = ButtonMouseEnter
      OnMouseLeave = ButtonMouseLeave
      OnPaint = ButtonPaint
      ExplicitLeft = 338
      ExplicitTop = 24
    end
    object btPrint: TPaintBox
      Tag = 18
      AlignWithMargins = True
      Left = 40
      Top = 12
      Width = 24
      Height = 24
      Hint = 'Print'
      Margins.Left = 5
      Margins.Top = 11
      Margins.Right = 5
      Margins.Bottom = 11
      Align = alLeft
      OnClick = btPrintClick
      OnMouseEnter = ButtonMouseEnter
      OnMouseLeave = ButtonMouseLeave
      OnPaint = ButtonPaint
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitHeight = 46
    end
    object pnPages: TPanel
      Left = 317
      Top = 1
      Width = 158
      Height = 46
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'pnPages'
      ParentBackground = False
      ParentColor = True
      ShowCaption = False
      TabOrder = 0
      Visible = False
      OnResize = pnPagesResize
      object btNext: TPaintBox
        Tag = 16
        AlignWithMargins = True
        Left = 39
        Top = 11
        Width = 24
        Height = 24
        Hint = 'Page width'
        Margins.Left = 5
        Margins.Top = 11
        Margins.Right = 5
        Margins.Bottom = 11
        Align = alLeft
        OnClick = btNextClick
        OnDblClick = btNextClick
        OnMouseEnter = ButtonMouseEnter
        OnMouseLeave = ButtonMouseLeave
        OnPaint = ButtonPaint
        ExplicitLeft = 374
        ExplicitTop = 10
      end
      object btPrev: TPaintBox
        Tag = 14
        AlignWithMargins = True
        Left = 5
        Top = 11
        Width = 24
        Height = 24
        Hint = 'Page width'
        Margins.Left = 5
        Margins.Top = 11
        Margins.Right = 5
        Margins.Bottom = 11
        Align = alLeft
        OnClick = btPrevClick
        OnDblClick = btPrevClick
        OnMouseEnter = ButtonMouseEnter
        OnMouseLeave = ButtonMouseLeave
        OnPaint = ButtonPaint
        ExplicitTop = 9
      end
      object lbPages: TLabel
        Left = 113
        Top = 0
        Width = 24
        Height = 46
        Align = alLeft
        Caption = '(0/0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5066061
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object shPage: TShape
        Left = 77
        Top = 32
        Width = 31
        Height = 1
        Brush.Style = bsClear
        Pen.Color = 13355979
      end
      object edPage: TEdit
        AlignWithMargins = True
        Left = 74
        Top = 16
        Width = 33
        Height = 14
        Margins.Left = 6
        Margins.Top = 16
        Margins.Right = 6
        Margins.Bottom = 16
        TabStop = False
        Align = alLeft
        Alignment = taCenter
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5066061
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        TabOrder = 0
        Text = '0'
        OnExit = edPageExit
        OnKeyDown = edPageKeyDown
      end
    end
    object RadioButtonVisualizacaoCompleta: TRadioButton
      Left = 513
      Top = 16
      Width = 129
      Height = 17
      Caption = 'Vizualiza'#231#227'o Completa'
      Checked = True
      TabOrder = 1
      TabStop = True
      Visible = False
      OnClick = RadioButtonVisualizacaoCompletaClick
    end
    object RadioButtonVisualizacaoDanfe: TRadioButton
      Left = 648
      Top = 16
      Width = 113
      Height = 17
      Caption = 'Vizualiza'#231#227'o Danfe'
      TabOrder = 2
      Visible = False
      OnClick = RadioButtonVisualizacaoDanfeClick
    end
  end
  object TreeView1: TTreeView
    Left = 928
    Top = 72
    Width = 129
    Height = 44
    Indent = 19
    TabOrder = 2
    ToolTips = False
    Visible = False
  end
  object PanelVizualizacaoCompleta: TPanel
    Left = 513
    Top = 48
    Width = 1271
    Height = 573
    Align = alClient
    Caption = ' '
    TabOrder = 3
    object PageControlDadosFiscais: TPageControl
      Left = 1
      Top = 1
      Width = 1269
      Height = 405
      ActivePage = TSProdutosServiços
      Align = alClient
      TabOrder = 0
      object TSDadosNfe: TTabSheet
        Caption = 'Dados da Nfe'
        object PanelDadosNotaFiscal: TPanel
          Left = 0
          Top = 0
          Width = 1261
          Height = 377
          Align = alClient
          BevelInner = bvLowered
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Ctl3D = True
          UseDockManager = False
          DoubleBuffered = False
          FullRepaint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBiDiMode = False
          ParentBackground = False
          ParentCtl3D = False
          ParentDoubleBuffered = False
          ParentFont = False
          ShowCaption = False
          TabOrder = 0
          object Label1: TLabel
            Left = 9
            Top = 120
            Width = 109
            Height = 16
            Caption = 'Finalidade Emiss'#227'o'
          end
          object Label2: TLabel
            Left = 185
            Top = 120
            Width = 101
            Height = 16
            Caption = 'Tipo Atendimento'
          end
          object Label3: TLabel
            Left = 443
            Top = 120
            Width = 138
            Height = 16
            Caption = 'Indicador Intermediador'
          end
          object Label5: TLabel
            Left = 271
            Top = 170
            Width = 81
            Height = 16
            Caption = 'Tipo Emiss'#227'o:'
          end
          object Label13: TLabel
            Left = 9
            Top = 21
            Width = 84
            Height = 16
            Caption = 'Tipo Opera'#231#227'o'
          end
          object Label4: TLabel
            Left = 185
            Top = 170
            Width = 15
            Height = 16
            Caption = 'UF'
          end
          object Label14: TLabel
            Left = 443
            Top = 170
            Width = 41
            Height = 16
            Caption = 'Modelo'
          end
          object Label15: TLabel
            Left = 617
            Top = 170
            Width = 126
            Height = 16
            Caption = 'Tipo Impress'#227'o Danfe'
          end
          object Label16: TLabel
            Left = 618
            Top = 220
            Width = 54
            Height = 16
            Caption = 'Ambiente'
          end
          object EditDataHoraEmissao: TLabeledDBDateEdit
            Left = 442
            Top = 40
            Width = 150
            Height = 21
            DataField = 'DATA_HORA_EMISSAO'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ShowNullDate = False
            TabOrder = 2
            DBDateEditLabel.Width = 109
            DBDateEditLabel.Height = 16
            DBDateEditLabel.Caption = 'Data/Hora Emiss'#227'o'
          end
          object EditDataEntradaSaida: TLabeledDBDateEdit
            Left = 598
            Top = 40
            Width = 203
            Height = 21
            DataField = 'DATA_HORA_ENTRADA_SAIDA'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ShowNullDate = False
            TabOrder = 3
            DBDateEditLabel.Width = 112
            DBDateEditLabel.Height = 16
            DBDateEditLabel.Caption = 'Data/Hora-Sa'#237'./Ent.'
          end
          object EditChaveAcesso: TLabeledDBEdit
            Left = 9
            Top = 90
            Width = 428
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CHAVE_ACESSO'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
            DBEditLabel.Width = 97
            DBEditLabel.Height = 16
            DBEditLabel.Caption = 'Chave de Acesso'
          end
          object EditDigitoChaveAcesso: TLabeledDBEdit
            Left = 443
            Top = 90
            Width = 46
            Height = 21
            CharCase = ecUpperCase
            DataField = 'DIGITO_CHAVE_ACESSO'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            DBEditLabel.Width = 16
            DBEditLabel.Height = 16
            DBEditLabel.Caption = 'DV'
          end
          object EditCodigoNumerico: TLabeledDBEdit
            Left = 494
            Top = 90
            Width = 98
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CODIGO_NUMERICO'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
            DBEditLabel.Width = 84
            DBEditLabel.Height = 16
            DBEditLabel.Caption = 'C'#243'd. Numerico'
          end
          object EditSerie: TLabeledDBEdit
            Left = 598
            Top = 90
            Width = 56
            Height = 21
            CharCase = ecUpperCase
            DataField = 'SERIE'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
            DBEditLabel.Width = 30
            DBEditLabel.Height = 16
            DBEditLabel.Caption = 'Serie'
          end
          object EditNumeroNfe: TLabeledDBEdit
            Left = 660
            Top = 90
            Width = 141
            Height = 21
            CharCase = ecUpperCase
            DataField = 'NUMERO'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 8
            DBEditLabel.Width = 50
            DBEditLabel.Height = 16
            DBEditLabel.Caption = 'N'#250'mero:'
          end
          object EditDataHoraContingencia: TLabeledDBDateEdit
            Left = 9
            Top = 240
            Width = 169
            Height = 21
            DataField = 'DATA_ENTRADA_CONTINGENCIA'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ShowNullDate = False
            TabOrder = 13
            DBDateEditLabel.Width = 157
            DBDateEditLabel.Height = 16
            DBDateEditLabel.Caption = 'Data/Hora Ent.Contingencia'
          end
          object EditJustificativaContingencia1: TLabeledDBEdit
            Left = 184
            Top = 240
            Width = 429
            Height = 21
            CharCase = ecUpperCase
            DataField = 'JUSTIFICATIVA_CONTINGENCIA'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 14
            DBEditLabel.Width = 142
            DBEditLabel.Height = 16
            DBEditLabel.Caption = 'Justificativa Conting'#234'ncia'
          end
          object EditNaturezaOperacao: TLabeledDBEdit
            Left = 126
            Top = 40
            Width = 310
            Height = 21
            CharCase = ecUpperCase
            DataField = 'NATUREZA_OPERACAO'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            DBEditLabel.Width = 128
            DBEditLabel.Height = 16
            DBEditLabel.Caption = 'Natureza da Opera'#231#227'o'
          end
          object JvDbComboboxConsumidorPresenca: TJvDBComboBox
            Left = 185
            Top = 140
            Width = 252
            Height = 21
            DataField = 'CONSUMIDOR_PRESENCA'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Items.Strings = (
              '0 - N'#227'o se aplica'
              '1 - Opera'#231#227'o Presencial'
              '2 - Opera'#231#227'o N'#194'O Presencial, pela INTERNET'
              '3 - Opera'#231#227'o N'#194'O Presencial, pela TELEATENDIMENTO'
              '4 - NFC-e em Opera'#231#227'o com entrega a domic'#237'lio'
              '5 - Opera'#231#227'o Presencial, fora do estabelecimento'
              '9 - Opera'#231#227'o N'#195'O Presencial, Outros')
            ParentFont = False
            TabOrder = 9
            ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
            ListSettings.OutfilteredValueFont.Color = clRed
            ListSettings.OutfilteredValueFont.Height = -11
            ListSettings.OutfilteredValueFont.Name = 'Tahoma'
            ListSettings.OutfilteredValueFont.Style = []
          end
          object JvDbComboboxIndicadorIntermediador: TJvDBComboBox
            Left = 443
            Top = 140
            Width = 358
            Height = 21
            DataField = 'INDICADOR_INTERMEDIADOR'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Items.Strings = (
              '0 - Opera'#231#227'o sem Intermediador'
              '1 - Com Intermidiadores/Marketplaces'
              '')
            ParentFont = False
            TabOrder = 10
            ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
            ListSettings.OutfilteredValueFont.Color = clRed
            ListSettings.OutfilteredValueFont.Height = -11
            ListSettings.OutfilteredValueFont.Name = 'Tahoma'
            ListSettings.OutfilteredValueFont.Style = []
          end
          object JvDbComboboxTipoEmissao: TJvDBComboBox
            Left = 271
            Top = 190
            Width = 165
            Height = 21
            DataField = 'TIPO_EMISSAO'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Items.Strings = (
              '1 - Normal'
              '2 - Conting'#234'ncia FS-IA'
              '3 - Conting'#234'ncia SCAN'
              '4 - Conting'#234'ncia EPEC'
              '5 - Conting'#234'ncia FS-DA'
              '6 - Conting'#234'ncia SVC-AN'
              '7 - Conting'#234'ncia SVC-RS'
              '8 - Conting'#234'ncia SVC-SP'
              '9 - Offline')
            ParentFont = False
            TabOrder = 12
            ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
            ListSettings.OutfilteredValueFont.Color = clRed
            ListSettings.OutfilteredValueFont.Height = -11
            ListSettings.OutfilteredValueFont.Name = 'Tahoma'
            ListSettings.OutfilteredValueFont.Style = []
          end
          object EditIdCodigoMunicipio: TLabeledDBEdit
            Left = 9
            Top = 190
            Width = 169
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CODIGO_MUNICIPIO'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 11
            DBEditLabel.Width = 145
            DBEditLabel.Height = 16
            DBEditLabel.Caption = 'C'#243'd.Municipio Ocorr'#234'ncia'
          end
          object JvDbComboboxTipoOperacao: TJvDBComboBox
            Left = 9
            Top = 40
            Width = 111
            Height = 21
            DataField = 'TIPO_OPERACAO'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Items.Strings = (
              '0 - Entrada'
              '1 - Sa'#237'da')
            ParentFont = False
            TabOrder = 0
            ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
            ListSettings.OutfilteredValueFont.Color = clRed
            ListSettings.OutfilteredValueFont.Height = -11
            ListSettings.OutfilteredValueFont.Name = 'Tahoma'
            ListSettings.OutfilteredValueFont.Style = []
          end
          object JvDbComboboxUfEmitente: TJvDBComboBox
            Left = 184
            Top = 190
            Width = 81
            Height = 21
            DataField = 'UF_EMITENTE'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 15
            ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
            ListSettings.OutfilteredValueFont.Color = clRed
            ListSettings.OutfilteredValueFont.Height = -11
            ListSettings.OutfilteredValueFont.Name = 'Tahoma'
            ListSettings.OutfilteredValueFont.Style = []
          end
          object JvDbComboboxCodigoModelo: TJvDBComboBox
            Left = 443
            Top = 190
            Width = 170
            Height = 21
            DataField = 'CODIGO_MODELO'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 16
            ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
            ListSettings.OutfilteredValueFont.Color = clRed
            ListSettings.OutfilteredValueFont.Height = -11
            ListSettings.OutfilteredValueFont.Name = 'Tahoma'
            ListSettings.OutfilteredValueFont.Style = []
          end
          object JvDbComboboxFormatoImpressaoDanfe: TJvDBComboBox
            Left = 618
            Top = 190
            Width = 184
            Height = 21
            DataField = 'FORMATO_IMPRESSAO_DANFE'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 17
            ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
            ListSettings.OutfilteredValueFont.Color = clRed
            ListSettings.OutfilteredValueFont.Height = -11
            ListSettings.OutfilteredValueFont.Name = 'Tahoma'
            ListSettings.OutfilteredValueFont.Style = []
          end
          object JvDbComboboxAmbiente: TJvDBComboBox
            Left = 618
            Top = 240
            Width = 184
            Height = 21
            DataField = 'AMBIENTE'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 18
            ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
            ListSettings.OutfilteredValueFont.Color = clRed
            ListSettings.OutfilteredValueFont.Height = -11
            ListSettings.OutfilteredValueFont.Name = 'Tahoma'
            ListSettings.OutfilteredValueFont.Style = []
          end
          object JvDbComboboxFinalidadeEmissao: TJvDBComboBox
            Left = 9
            Top = 140
            Width = 169
            Height = 21
            DataField = 'FINALIDADE_EMISSAO'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 19
            ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
            ListSettings.OutfilteredValueFont.Color = clRed
            ListSettings.OutfilteredValueFont.Height = -11
            ListSettings.OutfilteredValueFont.Name = 'Tahoma'
            ListSettings.OutfilteredValueFont.Style = []
          end
        end
      end
      object TsEmitente: TTabSheet
        Caption = 'Emitente'
        ImageIndex = 10
        object Emitente: TGroupBox
          Left = 0
          Top = 0
          Width = 1261
          Height = 377
          Align = alClient
          Caption = 'Emitente'
          TabOrder = 0
          object Panel5: TPanel
            Left = 2
            Top = 15
            Width = 1257
            Height = 360
            Align = alClient
            Caption = ' '
            ParentBackground = False
            TabOrder = 0
            object Label8: TLabel
              Left = 571
              Top = 175
              Width = 20
              Height = 13
              Caption = 'CRT'
            end
            object EditEmitenteCpfCnpj: TLabeledDBEdit
              Left = 17
              Top = 30
              Width = 128
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CPF_CNPJ'
              DataSource = FDataModuleNFe.DSNfeEmitente
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              DBEditLabel.Width = 54
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'CPF / CNPJ'
            end
            object EditEmitenteRazao: TLabeledDBEdit
              Left = 151
              Top = 30
              Width = 414
              Height = 21
              CharCase = ecUpperCase
              DataField = 'NOME'
              DataSource = FDataModuleNFe.DSNfeEmitente
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              DBEditLabel.Width = 27
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Nome'
            end
            object EditEmitenteNomeFantasia: TLabeledDBEdit
              Left = 571
              Top = 30
              Width = 238
              Height = 21
              CharCase = ecUpperCase
              DataField = 'FANTASIA'
              DataSource = FDataModuleNFe.DSNfeEmitente
              TabOrder = 2
              DBEditLabel.Width = 71
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Nome Fantasia'
            end
            object EditEmitenteLogradouro: TLabeledDBEdit
              Left = 571
              Top = 70
              Width = 238
              Height = 21
              CharCase = ecUpperCase
              DataField = 'LOGRADOURO'
              DataSource = FDataModuleNFe.DSNfeEmitente
              TabOrder = 5
              DBEditLabel.Width = 59
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Logradouro:'
            end
            object EditEmitenteBairro: TLabeledDBEdit
              Left = 151
              Top = 70
              Width = 414
              Height = 21
              CharCase = ecUpperCase
              DataField = 'BAIRRO'
              DataSource = FDataModuleNFe.DSNfeEmitente
              TabOrder = 4
              DBEditLabel.Width = 28
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Bairro'
            end
            object EditEmitenteCEP: TLabeledDBEdit
              Left = 17
              Top = 70
              Width = 128
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CEP'
              DataSource = FDataModuleNFe.DSNfeEmitente
              TabOrder = 3
              DBEditLabel.Width = 19
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'CEP'
            end
            object EditEmitenteNumero: TLabeledDBEdit
              Left = 17
              Top = 110
              Width = 128
              Height = 21
              CharCase = ecUpperCase
              DataField = 'NUMERO'
              DataSource = FDataModuleNFe.DSNfeEmitente
              TabOrder = 6
              DBEditLabel.Width = 41
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'N'#250'mero:'
            end
            object EditEmitenteComplemento: TLabeledDBEdit
              Left = 151
              Top = 110
              Width = 414
              Height = 21
              CharCase = ecUpperCase
              DataField = 'COMPLEMENTO'
              DataSource = FDataModuleNFe.DSNfeEmitente
              TabOrder = 7
              DBEditLabel.Width = 65
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Complemento'
            end
            object EditEmitenteTelefone: TLabeledDBEdit
              Left = 571
              Top = 110
              Width = 238
              Height = 21
              CharCase = ecUpperCase
              DataField = 'TELEFONE'
              DataSource = FDataModuleNFe.DSNfeEmitente
              TabOrder = 8
              DBEditLabel.Width = 42
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Telefone'
            end
            object EditEmitenteCodigoPais: TLabeledDBEdit
              Left = 571
              Top = 150
              Width = 74
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CODIGO_PAIS'
              DataSource = FDataModuleNFe.DSNfeEmitente
              TabOrder = 12
              DBEditLabel.Width = 59
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Codigo Pa'#237's:'
            end
            object EditEmitenteNomePais: TLabeledDBEdit
              Left = 646
              Top = 150
              Width = 163
              Height = 21
              CharCase = ecUpperCase
              DataField = 'NOME_PAIS'
              DataSource = FDataModuleNFe.DSNfeEmitente
              TabOrder = 13
              DBEditLabel.Width = 3
              DBEditLabel.Height = 13
              DBEditLabel.Caption = ' '
            end
            object JvDbComboboxCRT: TJvDBComboBox
              Left = 571
              Top = 190
              Width = 238
              Height = 21
              DataField = 'CRT'
              DataSource = FDataModuleNFe.DSNfeEmitente
              TabOrder = 18
              ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
              ListSettings.OutfilteredValueFont.Color = clRed
              ListSettings.OutfilteredValueFont.Height = -11
              ListSettings.OutfilteredValueFont.Name = 'Tahoma'
              ListSettings.OutfilteredValueFont.Style = []
            end
            object EdiEmitenteUF: TLabeledDBEdit
              Left = 487
              Top = 150
              Width = 78
              Height = 21
              CharCase = ecUpperCase
              DataField = 'UF'
              DataSource = FDataModuleNFe.DSNfeEmitente
              TabOrder = 11
              DBEditLabel.Width = 13
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'UF'
            end
            object EditEmitenteCnae: TLabeledDBEdit
              Left = 487
              Top = 190
              Width = 78
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CNAE'
              DataSource = FDataModuleNFe.DSNfeEmitente
              TabOrder = 17
              DBEditLabel.Width = 29
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Cnae:'
            end
            object EditEmitenteNomeMunicipio: TLabeledDBEdit
              Left = 92
              Top = 150
              Width = 389
              Height = 21
              CharCase = ecUpperCase
              DataField = 'NOME_MUNICIPIO'
              DataSource = FDataModuleNFe.DSNfeEmitente
              TabOrder = 10
              DBEditLabel.Width = 3
              DBEditLabel.Height = 13
              DBEditLabel.Caption = ' '
            end
            object EditEmitenteSuframa: TLabeledDBEdit
              Left = 365
              Top = 190
              Width = 116
              Height = 21
              CharCase = ecUpperCase
              DataField = 'SUFRAMA'
              DataSource = FDataModuleNFe.DSNfeEmitente
              TabOrder = 16
              DBEditLabel.Width = 52
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'SUFRAMA:'
            end
            object EditEmitenteInscricaoMunicipal: TLabeledDBEdit
              Left = 191
              Top = 190
              Width = 168
              Height = 21
              CharCase = ecUpperCase
              DataField = 'INSCRICAO_MUNICIPAL'
              DataSource = FDataModuleNFe.DSNfeEmitente
              TabOrder = 15
              DBEditLabel.Width = 89
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Inscri'#231#227'o Municipal'
            end
            object EditEmitenteInscricaoEstadual: TLabeledDBEdit
              Left = 17
              Top = 190
              Width = 168
              Height = 21
              CharCase = ecUpperCase
              DataField = 'INSCRICAO_ESTADUAL'
              DataSource = FDataModuleNFe.DSNfeEmitente
              TabOrder = 14
              DBEditLabel.Width = 87
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Inscri'#231#227'o Estadual'
            end
            object EditEmitenteCodigoIBGE: TLabeledDBEdit
              Left = 17
              Top = 150
              Width = 74
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CODIGO_MUNICIPIO'
              DataSource = FDataModuleNFe.DSNfeEmitente
              TabOrder = 9
              DBEditLabel.Width = 63
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Codigo IBGE:'
            end
          end
        end
      end
      object TSDestinatario: TTabSheet
        Caption = 'Destinat'#225'rio'
        ImageIndex = 1
        object GroupBoxDestinatario: TGroupBox
          Left = 0
          Top = 0
          Width = 1261
          Height = 377
          Align = alClient
          Caption = 'Destinat'#225'rio:'
          TabOrder = 0
          object Panel6: TPanel
            Left = 2
            Top = 15
            Width = 1257
            Height = 360
            Align = alClient
            Caption = ' '
            ParentBackground = False
            TabOrder = 0
            object Label9: TLabel
              Left = 572
              Top = 14
              Width = 97
              Height = 13
              Caption = 'Tipo de Contribuinte'
            end
            object Label7: TLabel
              Left = 314
              Top = 174
              Width = 63
              Height = 13
              Caption = 'Local Destino'
            end
            object Label17: TLabel
              Left = 488
              Top = 174
              Width = 53
              Height = 13
              Caption = 'Cons. Final'
            end
            object EditDestinatarioCPFCNPJ: TLabeledDBEdit
              Left = 18
              Top = 30
              Width = 128
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CPF_CNPJ'
              DataSource = FDataModuleNFe.DsNfeDestinatario
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              DBEditLabel.Width = 54
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'CPF / CNPJ'
            end
            object EditDestinatarioRazao: TLabeledDBEdit
              Left = 152
              Top = 30
              Width = 414
              Height = 21
              CharCase = ecUpperCase
              DataField = 'NOME'
              DataSource = FDataModuleNFe.DsNfeDestinatario
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              DBEditLabel.Width = 60
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Raz'#227'o Social'
            end
            object JvDBComboBoxIndicadorIe2: TJvDBComboBox
              Left = 572
              Top = 30
              Width = 238
              Height = 21
              DataField = 'INDICADOR_IE'
              DataSource = FDataModuleNFe.DsNfeDestinatario
              Items.Strings = (
                '1 - Contribuinte ICMS'
                '2 - Contribuinte Isento'
                '9 - N'#227'o Contribuinte')
              TabOrder = 2
              ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
              ListSettings.OutfilteredValueFont.Color = clRed
              ListSettings.OutfilteredValueFont.Height = -11
              ListSettings.OutfilteredValueFont.Name = 'Tahoma'
              ListSettings.OutfilteredValueFont.Style = []
            end
            object EditDestinatarioCEP: TLabeledDBEdit
              Left = 18
              Top = 70
              Width = 128
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CEP'
              DataSource = FDataModuleNFe.DsNfeDestinatario
              TabOrder = 3
              DBEditLabel.Width = 23
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'CEP:'
            end
            object EditDestinatarioBairro: TLabeledDBEdit
              Left = 152
              Top = 70
              Width = 414
              Height = 21
              CharCase = ecUpperCase
              DataField = 'BAIRRO'
              DataSource = FDataModuleNFe.DsNfeDestinatario
              TabOrder = 4
              DBEditLabel.Width = 32
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Bairro:'
            end
            object EditDestinatarioLogradouro: TLabeledDBEdit
              Left = 572
              Top = 70
              Width = 238
              Height = 21
              CharCase = ecUpperCase
              DataField = 'LOGRADOURO'
              DataSource = FDataModuleNFe.DsNfeDestinatario
              TabOrder = 5
              DBEditLabel.Width = 59
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Logradouro:'
            end
            object EditDestinatarioNumero: TLabeledDBEdit
              Left = 18
              Top = 110
              Width = 128
              Height = 21
              CharCase = ecUpperCase
              DataField = 'NUMERO'
              DataSource = FDataModuleNFe.DsNfeDestinatario
              TabOrder = 6
              DBEditLabel.Width = 41
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Numero:'
            end
            object EditDestinatarioComplemento: TLabeledDBEdit
              Left = 152
              Top = 110
              Width = 414
              Height = 21
              CharCase = ecUpperCase
              DataField = 'COMPLEMENTO'
              DataSource = FDataModuleNFe.DsNfeDestinatario
              TabOrder = 7
              DBEditLabel.Width = 69
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Complemento:'
            end
            object EditDestinatarioTelefone: TLabeledDBEdit
              Left = 572
              Top = 110
              Width = 238
              Height = 21
              CharCase = ecUpperCase
              DataField = 'TELEFONE'
              DataSource = FDataModuleNFe.DsNfeDestinatario
              TabOrder = 8
              DBEditLabel.Width = 46
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Telefone:'
            end
            object EditDestinatarioCodigoIbge: TLabeledDBEdit
              Left = 18
              Top = 150
              Width = 71
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CODIGO_MUNICIPIO'
              DataSource = FDataModuleNFe.DsNfeDestinatario
              TabOrder = 9
              DBEditLabel.Width = 43
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Municipio'
            end
            object EditDestinatarioNomeMunicipio: TLabeledDBEdit
              Left = 90
              Top = 150
              Width = 392
              Height = 21
              CharCase = ecUpperCase
              DataField = 'NOME_MUNICIPIO'
              DataSource = FDataModuleNFe.DsNfeDestinatario
              TabOrder = 10
              DBEditLabel.Width = 3
              DBEditLabel.Height = 13
              DBEditLabel.Caption = ' '
            end
            object EditDestinatarioUf: TLabeledDBEdit
              Left = 488
              Top = 150
              Width = 78
              Height = 21
              CharCase = ecUpperCase
              DataField = 'UF'
              DataSource = FDataModuleNFe.DsNfeDestinatario
              TabOrder = 11
              DBEditLabel.Width = 17
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'UF:'
            end
            object EditDestinatarioCodigoPais: TLabeledDBEdit
              Left = 572
              Top = 150
              Width = 72
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CODIGO_PAIS'
              DataSource = FDataModuleNFe.DsNfeDestinatario
              TabOrder = 12
              DBEditLabel.Width = 19
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Pa'#237's'
            end
            object EditDestinatarioNomePais: TLabeledDBEdit
              Left = 645
              Top = 150
              Width = 165
              Height = 21
              CharCase = ecUpperCase
              DataField = 'NOME_PAIS'
              DataSource = FDataModuleNFe.DsNfeDestinatario
              TabOrder = 13
              DBEditLabel.Width = 3
              DBEditLabel.Height = 13
              DBEditLabel.Caption = ' '
            end
            object EditDestinatarioInscricaoEstadual: TLabeledDBEdit
              Left = 18
              Top = 190
              Width = 168
              Height = 21
              CharCase = ecUpperCase
              DataField = 'INSCRICAO_ESTADUAL'
              DataSource = FDataModuleNFe.DsNfeDestinatario
              TabOrder = 14
              DBEditLabel.Width = 87
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Inscri'#231#227'o Estadual'
            end
            object JvDBComboboxLocalDestino: TJvDBComboBox
              Left = 314
              Top = 190
              Width = 168
              Height = 21
              DataField = 'LOCAL_DESTINO'
              DataSource = FDataModuleNFe.DSNfeCabecalho
              Items.Strings = (
                '1 - Contribuinte ICMS'
                '2 - Contribuinte Isento'
                '9 - N'#227'o Contribuinte')
              TabOrder = 16
              ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
              ListSettings.OutfilteredValueFont.Color = clRed
              ListSettings.OutfilteredValueFont.Height = -11
              ListSettings.OutfilteredValueFont.Name = 'Tahoma'
              ListSettings.OutfilteredValueFont.Style = []
            end
            object EditDestinatarioEmail: TLabeledDBEdit
              Left = 572
              Top = 190
              Width = 238
              Height = 21
              CharCase = ecUpperCase
              DataField = 'EMAIL'
              DataSource = FDataModuleNFe.DsNfeDestinatario
              TabOrder = 18
              DBEditLabel.Width = 32
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'E-Mail:'
            end
            object JvDBComboBoxConsumidorOperacao: TJvDBComboBox
              Left = 488
              Top = 190
              Width = 78
              Height = 21
              DataField = 'CONSUMIDOR_OPERACAO'
              DataSource = FDataModuleNFe.DSNfeCabecalho
              Items.Strings = (
                '1 - Contribuinte ICMS'
                '2 - Contribuinte Isento'
                '9 - N'#227'o Contribuinte')
              TabOrder = 17
              ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
              ListSettings.OutfilteredValueFont.Color = clRed
              ListSettings.OutfilteredValueFont.Height = -11
              ListSettings.OutfilteredValueFont.Name = 'Tahoma'
              ListSettings.OutfilteredValueFont.Style = []
            end
            object EditDestinatarioSuframa: TLabeledDBEdit
              Left = 191
              Top = 190
              Width = 117
              Height = 21
              CharCase = ecUpperCase
              DataField = 'SUFRAMA'
              DataSource = FDataModuleNFe.DsNfeDestinatario
              TabOrder = 15
              DBEditLabel.Width = 40
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Suframa'
            end
          end
        end
      end
      object TSProdutosServiços: TTabSheet
        Caption = 'Produtos / Servi'#231'os'
        ImageIndex = 5
        object JvNetscapeSplitter1: TJvNetscapeSplitter
          Left = 0
          Top = 166
          Width = 1261
          Height = 26
          Cursor = crDefault
          Align = alBottom
          Color = clBtnFace
          MinSize = 1
          ParentColor = False
          Maximized = False
          Minimized = False
          ButtonCursor = crDefault
          ButtonStyle = bsWindows
          WindowsButtons = [wbMin, wbMax]
          ButtonWidth = 300
          ExplicitLeft = 155
          ExplicitTop = 344
        end
        object GridItens: TJvDBUltimGrid
          Left = 0
          Top = 0
          Width = 1261
          Height = 166
          Align = alClient
          Color = cl3DLight
          DataSource = FDataModuleNFe.DSNfeDetalhe
          FixedColor = cl3DLight
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
          OnDblClick = GridItensDblClick
          AlternateRowColor = 15593713
          TitleArrow = True
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          RowsHeight = 17
          TitleRowHeight = 17
        end
        object PanelDetalhesAnexo: TPanel
          Left = 0
          Top = 192
          Width = 1261
          Height = 185
          Align = alBottom
          BevelInner = bvLowered
          BevelOuter = bvNone
          TabOrder = 1
        end
      end
      object TSDocumentosReferenciados: TTabSheet
        Caption = 'Documentos Referenciados'
        ImageIndex = 7
        object PageControlReferenciado: TPageControl
          Left = 0
          Top = 0
          Width = 1261
          Height = 377
          ActivePage = TabSheetReferenciadoCupom
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object TabSheetReferenciadoNfe: TTabSheet
            Caption = 'NF-e'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            object GridNfeReferenciada: TJvDBUltimGrid
              Left = 0
              Top = 0
              Width = 1253
              Height = 349
              Align = alClient
              DataSource = FDataModuleNFe.DSNfeReferenciada
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
              TitleFont.Height = -13
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              AlternateRowColor = 15593713
              TitleArrow = True
              SelectColumnsDialogStrings.Caption = 'Select columns'
              SelectColumnsDialogStrings.OK = '&OK'
              SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
              EditControls = <>
              RowsHeight = 17
              TitleRowHeight = 20
            end
          end
          object TabSheetReferenciadoNf: TTabSheet
            Caption = 'NF 1/1A'
            ImageIndex = 1
            object GridNfReferenciada: TJvDBUltimGrid
              Left = 0
              Top = 0
              Width = 1253
              Height = 349
              Align = alClient
              DataSource = FDataModuleNFe.DSNfReferenciada
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
              TitleFont.Height = -13
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              AlternateRowColor = 15593713
              AlternateRowFontColor = clBlack
              SelectColumnsDialogStrings.Caption = 'Select columns'
              SelectColumnsDialogStrings.OK = '&OK'
              SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
              EditControls = <>
              RowsHeight = 17
              TitleRowHeight = 20
            end
          end
          object TabSheetReferenciadoCte: TTabSheet
            Caption = 'CT-e'
            ImageIndex = 2
            object GridCteReferenciado: TJvDBUltimGrid
              Left = 0
              Top = 0
              Width = 1253
              Height = 349
              Align = alClient
              DataSource = FDataModuleNFe.DSCteReferenciado
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
              TitleFont.Height = -13
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              AlternateRowColor = 15593713
              SelectColumnsDialogStrings.Caption = 'Select columns'
              SelectColumnsDialogStrings.OK = '&OK'
              SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
              EditControls = <>
              RowsHeight = 17
              TitleRowHeight = 20
            end
          end
          object TabSheetReferenciadoRural: TTabSheet
            Caption = 'NF Produtor Rural'
            ImageIndex = 3
            object GridNfRuralReferenciada: TJvDBUltimGrid
              Left = 0
              Top = 0
              Width = 1253
              Height = 349
              Align = alClient
              DataSource = FDataModuleNFe.DSNfRuralReferenciada
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              AlternateRowColor = 15593713
              SelectColumnsDialogStrings.Caption = 'Select columns'
              SelectColumnsDialogStrings.OK = '&OK'
              SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
              EditControls = <>
              RowsHeight = 17
              TitleRowHeight = 17
            end
          end
          object TabSheetReferenciadoCupom: TTabSheet
            Caption = 'Cupom Fiscal'
            ImageIndex = 4
            object GridCupomReferenciado: TJvDBUltimGrid
              Left = 0
              Top = 0
              Width = 1253
              Height = 349
              Align = alClient
              DataSource = FDataModuleNFe.DSCupomReferenciado
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              AlternateRowColor = 15593713
              SelectColumnsDialogStrings.Caption = 'Select columns'
              SelectColumnsDialogStrings.OK = '&OK'
              SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
              EditControls = <>
              RowsHeight = 17
              TitleRowHeight = 17
            end
          end
        end
      end
      object TSLocalEntregaRetirada: TTabSheet
        Caption = 'Entrega/Retirada'
        ImageIndex = 2
        object GroupBoxEntrega: TGroupBox
          Left = 0
          Top = 0
          Width = 1261
          Height = 182
          Align = alTop
          Caption = 'Dados para entrega:'
          Color = clBtnFace
          ParentBackground = False
          ParentColor = False
          TabOrder = 0
          object EditEntregaCpfCnpj: TLabeledDBEdit
            Left = 20
            Top = 35
            Width = 128
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CPF_CNPJ'
            DataSource = FDataModuleNFe.DSLocalEntrega
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            DBEditLabel.Width = 54
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'CPF / CNPJ'
          end
          object EditEntregaInscricaoEstadual: TLabeledDBEdit
            Left = 577
            Top = 35
            Width = 216
            Height = 21
            CharCase = ecUpperCase
            DataField = 'INSCRICAO_ESTADUAL'
            DataSource = FDataModuleNFe.DSLocalEntrega
            TabOrder = 2
            DBEditLabel.Width = 87
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Inscri'#231#227'o Estadual'
          end
          object EditEntregaNome: TLabeledDBEdit
            Left = 154
            Top = 35
            Width = 414
            Height = 21
            CharCase = ecUpperCase
            DataField = 'NOME'
            DataSource = FDataModuleNFe.DSLocalEntrega
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            DBEditLabel.Width = 171
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Razao Social ou Nome do Expedidor'
          end
          object EditEntregaNumero: TLabeledDBEdit
            Left = 20
            Top = 115
            Width = 128
            Height = 21
            CharCase = ecUpperCase
            DataField = 'NUMERO'
            DataSource = FDataModuleNFe.DSLocalEntrega
            TabOrder = 6
            DBEditLabel.Width = 37
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Numero'
          end
          object EditEntregaBairro: TLabeledDBEdit
            Left = 154
            Top = 75
            Width = 414
            Height = 21
            CharCase = ecUpperCase
            DataField = 'BAIRRO'
            DataSource = FDataModuleNFe.DSLocalEntrega
            TabOrder = 4
            DBEditLabel.Width = 28
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Bairro'
          end
          object EditEntregaComplemento: TLabeledDBEdit
            Left = 154
            Top = 115
            Width = 287
            Height = 21
            CharCase = ecUpperCase
            DataField = 'COMPLEMENTO'
            DataSource = FDataModuleNFe.DSLocalEntrega
            TabOrder = 7
            DBEditLabel.Width = 69
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Complemento:'
          end
          object EditEntregaLogradouro: TLabeledDBEdit
            Left = 577
            Top = 75
            Width = 216
            Height = 21
            CharCase = ecUpperCase
            DataField = 'LOGRADOURO'
            DataSource = FDataModuleNFe.DSLocalEntrega
            TabOrder = 5
            DBEditLabel.Width = 55
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Logradouro'
          end
          object EditEntregaCEP: TLabeledDBEdit
            Left = 20
            Top = 75
            Width = 128
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CEP'
            DataSource = FDataModuleNFe.DSLocalEntrega
            TabOrder = 3
            DBEditLabel.Width = 19
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'CEP'
          end
          object EditEntregaTelefone: TLabeledDBEdit
            Left = 447
            Top = 115
            Width = 121
            Height = 21
            CharCase = ecUpperCase
            DataField = 'TELEFONE'
            DataSource = FDataModuleNFe.DSLocalEntrega
            TabOrder = 8
            DBEditLabel.Width = 42
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Telefone'
          end
          object EditEntregaEmail: TLabeledDBEdit
            Left = 577
            Top = 115
            Width = 216
            Height = 21
            CharCase = ecUpperCase
            DataField = 'EMAIL'
            DataSource = FDataModuleNFe.DSLocalEntrega
            TabOrder = 9
            DBEditLabel.Width = 28
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'E-Mail'
          end
          object EditEntregaIbge: TLabeledDBEdit
            Left = 20
            Top = 155
            Width = 74
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CODIGO_MUNICIPIO'
            DataSource = FDataModuleNFe.DSLocalEntrega
            TabOrder = 10
            DBEditLabel.Width = 43
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Municipio'
          end
          object EditEntregaCidade: TLabeledDBEdit
            Left = 95
            Top = 155
            Width = 273
            Height = 21
            CharCase = ecUpperCase
            DataField = 'NOME_MUNICIPIO'
            DataSource = FDataModuleNFe.DSLocalEntrega
            TabOrder = 11
            DBEditLabel.Width = 3
            DBEditLabel.Height = 13
            DBEditLabel.Caption = ' '
          end
          object EditEntregaUF: TLabeledDBEdit
            Left = 374
            Top = 155
            Width = 67
            Height = 21
            CharCase = ecUpperCase
            DataField = 'UF'
            DataSource = FDataModuleNFe.DSLocalEntrega
            TabOrder = 12
            DBEditLabel.Width = 13
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'UF'
          end
          object EditEntregaCodigoPais: TLabeledDBEdit
            Left = 447
            Top = 155
            Width = 84
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CODIGO_PAIS'
            DataSource = FDataModuleNFe.DSLocalEntrega
            TabOrder = 13
            DBEditLabel.Width = 19
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Pa'#237's'
          end
          object EditEntregaNomePais: TLabeledDBEdit
            Left = 532
            Top = 155
            Width = 261
            Height = 21
            CharCase = ecUpperCase
            DataField = 'NOME_PAIS'
            DataSource = FDataModuleNFe.DSLocalEntrega
            TabOrder = 14
            DBEditLabel.Width = 3
            DBEditLabel.Height = 13
            DBEditLabel.Caption = ' '
          end
        end
        object GroupBoxRetirada: TGroupBox
          Left = 0
          Top = 182
          Width = 1261
          Height = 195
          Align = alClient
          Caption = 'Dados para retirada:'
          Color = clBtnFace
          ParentBackground = False
          ParentColor = False
          TabOrder = 1
          object EditRetiradaCpfCnpj: TLabeledDBEdit
            Left = 21
            Top = 35
            Width = 127
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CPF_CNPJ'
            DataSource = FDataModuleNFe.DSLocalRetirada
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            DBEditLabel.Width = 54
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'CPF / CNPJ'
          end
          object EditRetiradaInscricaoEstadual: TLabeledDBEdit
            Left = 574
            Top = 35
            Width = 219
            Height = 21
            CharCase = ecUpperCase
            DataField = 'INSCRICAO_ESTADUAL'
            DataSource = FDataModuleNFe.DSLocalRetirada
            TabOrder = 2
            DBEditLabel.Width = 87
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Inscri'#231#227'o Estadual'
          end
          object EditRetiradaNome: TLabeledDBEdit
            Left = 154
            Top = 35
            Width = 414
            Height = 21
            CharCase = ecUpperCase
            DataField = 'NOME'
            DataSource = FDataModuleNFe.DSLocalRetirada
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            DBEditLabel.Width = 171
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Raz'#227'o Social ou Nome do Expedidor'
          end
          object EditRetiradaNumero: TLabeledDBEdit
            Left = 21
            Top = 115
            Width = 127
            Height = 21
            CharCase = ecUpperCase
            DataField = 'NUMERO'
            DataSource = FDataModuleNFe.DSLocalRetirada
            TabOrder = 6
            DBEditLabel.Width = 37
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Numero'
          end
          object EditRetiradaBairro: TLabeledDBEdit
            Left = 154
            Top = 75
            Width = 414
            Height = 21
            CharCase = ecUpperCase
            DataField = 'BAIRRO'
            DataSource = FDataModuleNFe.DSLocalRetirada
            TabOrder = 4
            DBEditLabel.Width = 28
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Bairro'
          end
          object EditRetiradaEmail: TLabeledDBEdit
            Left = 574
            Top = 115
            Width = 219
            Height = 21
            CharCase = ecUpperCase
            DataField = 'EMAIL'
            DataSource = FDataModuleNFe.DSLocalRetirada
            TabOrder = 9
            DBEditLabel.Width = 28
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'E-Mail'
          end
          object EditRetiradaTelefone: TLabeledDBEdit
            Left = 447
            Top = 115
            Width = 121
            Height = 21
            CharCase = ecUpperCase
            DataField = 'TELEFONE'
            DataSource = FDataModuleNFe.DSLocalRetirada
            TabOrder = 8
            DBEditLabel.Width = 42
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Telefone'
          end
          object EditRetiradaCEP: TLabeledDBEdit
            Left = 21
            Top = 75
            Width = 127
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CEP'
            DataSource = FDataModuleNFe.DSLocalRetirada
            TabOrder = 3
            DBEditLabel.Width = 19
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'CEP'
          end
          object EditRetiradaLogradouro: TLabeledDBEdit
            Left = 574
            Top = 75
            Width = 219
            Height = 21
            CharCase = ecUpperCase
            DataField = 'LOGRADOURO'
            DataSource = FDataModuleNFe.DSLocalRetirada
            TabOrder = 5
            DBEditLabel.Width = 55
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Logradouro'
          end
          object EditRetiradaComplemento: TLabeledDBEdit
            Left = 154
            Top = 115
            Width = 287
            Height = 21
            CharCase = ecUpperCase
            DataField = 'COMPLEMENTO'
            DataSource = FDataModuleNFe.DSLocalRetirada
            TabOrder = 7
            DBEditLabel.Width = 65
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Complemento'
          end
          object EditRetiradaIbge: TLabeledDBEdit
            Left = 21
            Top = 155
            Width = 73
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CODIGO_MUNICIPIO'
            DataSource = FDataModuleNFe.DSLocalRetirada
            TabOrder = 10
            DBEditLabel.Width = 43
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Municipio'
          end
          object EditRetiradaCidade: TLabeledDBEdit
            Left = 95
            Top = 155
            Width = 273
            Height = 21
            CharCase = ecUpperCase
            DataField = 'NOME_MUNICIPIO'
            DataSource = FDataModuleNFe.DSLocalRetirada
            TabOrder = 11
            DBEditLabel.Width = 3
            DBEditLabel.Height = 13
            DBEditLabel.Caption = ' '
          end
          object EditRetiradaUF: TLabeledDBEdit
            Left = 374
            Top = 155
            Width = 67
            Height = 21
            CharCase = ecUpperCase
            DataField = 'UF'
            DataSource = FDataModuleNFe.DSLocalRetirada
            TabOrder = 12
            DBEditLabel.Width = 13
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'UF'
          end
          object EditRetiradaCodigoPais: TLabeledDBEdit
            Left = 447
            Top = 155
            Width = 84
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CODIGO_PAIS'
            DataSource = FDataModuleNFe.DSLocalRetirada
            TabOrder = 13
            DBEditLabel.Width = 19
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Pa'#237's'
          end
          object EditRetiradaNomePais: TLabeledDBEdit
            Left = 532
            Top = 155
            Width = 261
            Height = 21
            CharCase = ecUpperCase
            DataField = 'NOME_PAIS'
            DataSource = FDataModuleNFe.DSLocalRetirada
            TabOrder = 14
            DBEditLabel.Width = 3
            DBEditLabel.Height = 13
            DBEditLabel.Caption = ' '
          end
        end
      end
      object TSTransporte: TTabSheet
        Caption = 'Transporte'
        ImageIndex = 3
        object PageControlTransporte: TPageControl
          Left = 0
          Top = 0
          Width = 1261
          Height = 377
          ActivePage = TabSheetRetencaoIcms
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object TabSheetDadosTransportador: TTabSheet
            Caption = 'Transportador'
            object Panel7: TPanel
              Left = 0
              Top = 0
              Width = 1253
              Height = 346
              Align = alClient
              Caption = ' '
              ParentBackground = False
              TabOrder = 0
              object Label11: TLabel
                Left = 16
                Top = 11
                Width = 99
                Height = 16
                Caption = 'Modalidade Frete'
              end
              object JvDbComboboxModalidadeFrete: TJvDBComboBox
                Left = 16
                Top = 30
                Width = 624
                Height = 21
                DataField = 'MODALIDADE_FRETE'
                DataSource = FDataModuleNFe.DSNfeTransporte
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Items.Strings = (
                  '0 - Contrata'#231#227'o do Frete por conta do Remetente(CIF)'
                  '1 - Contrata'#231#227'o do Frete por conta do Destinat'#225'rio (FOB)'
                  '2 - Contrata'#231#227'o do Frete por conta de Terceiros'
                  '3 - Transporte Pr'#243'prio por conta do Remetente'
                  '4 - Transporte Pr'#243'prio por conta do Destinat'#225'rio'
                  '9 - Sem Ocorrencia de Transporte')
                ParentFont = False
                TabOrder = 0
                ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
                ListSettings.OutfilteredValueFont.Color = clRed
                ListSettings.OutfilteredValueFont.Height = -11
                ListSettings.OutfilteredValueFont.Name = 'Tahoma'
                ListSettings.OutfilteredValueFont.Style = []
              end
              object EditTransportadorRazaoSocial: TLabeledDBEdit
                Left = 158
                Top = 70
                Width = 482
                Height = 21
                CharCase = ecUpperCase
                DataField = 'NOME'
                DataSource = FDataModuleNFe.DSNfeTransporte
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 2
                DBEditLabel.Width = 82
                DBEditLabel.Height = 16
                DBEditLabel.Caption = 'Transportador'
              end
              object EditTransportadorLogradouro: TLabeledDBEdit
                Left = 16
                Top = 110
                Width = 497
                Height = 21
                CharCase = ecUpperCase
                DataField = 'EMPRESA_ENDERECO'
                DataSource = FDataModuleNFe.DSNfeTransporte
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
                DBEditLabel.Width = 65
                DBEditLabel.Height = 16
                DBEditLabel.Caption = 'Logradouro'
              end
              object EditTransportadorCpfCnpj: TLabeledDBEdit
                Left = 16
                Top = 70
                Width = 136
                Height = 21
                CharCase = ecUpperCase
                DataField = 'CPF_CNPJ'
                DataSource = FDataModuleNFe.DSNfeTransporte
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                DBEditLabel.Width = 63
                DBEditLabel.Height = 16
                DBEditLabel.Caption = 'CPF / CNPJ'
              end
              object EditTransportadorIE: TLabeledDBEdit
                Left = 519
                Top = 110
                Width = 121
                Height = 21
                CharCase = ecUpperCase
                DataField = 'INSCRICAO_ESTADUAL'
                DataSource = FDataModuleNFe.DSNfeTransporte
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 4
                DBEditLabel.Width = 103
                DBEditLabel.Height = 16
                DBEditLabel.Caption = 'Inscri'#231#227'o Estadual'
              end
              object EditTransportadorCidade: TLabeledDBEdit
                Left = 16
                Top = 150
                Width = 300
                Height = 21
                CharCase = ecUpperCase
                DataField = 'NOME_MUNICIPIO'
                DataSource = FDataModuleNFe.DSNfeTransporte
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 5
                DBEditLabel.Width = 53
                DBEditLabel.Height = 16
                DBEditLabel.Caption = 'Municipio'
              end
              object EditTransportadorUf: TLabeledDBEdit
                Left = 317
                Top = 150
                Width = 56
                Height = 21
                CharCase = ecUpperCase
                DataField = 'UF'
                DataSource = FDataModuleNFe.DSNfeTransporte
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 6
                DBEditLabel.Width = 15
                DBEditLabel.Height = 16
                DBEditLabel.Caption = 'UF'
              end
            end
          end
          object TabSheetVeiculoReboque: TTabSheet
            Caption = 'Veiculo/Reboque'
            ImageIndex = 1
            object GroupBoxVeiculo: TGroupBox
              Left = 0
              Top = 0
              Width = 1253
              Height = 73
              Align = alTop
              Caption = 'Ve'#237'culo'
              TabOrder = 0
              object EditVeiculoPlaca: TLabeledDBEdit
                Left = 16
                Top = 35
                Width = 96
                Height = 21
                CharCase = ecUpperCase
                DataField = 'PLACA_VEICULO'
                DataSource = FDataModuleNFe.DSNfeTransporte
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
                DBEditLabel.Width = 30
                DBEditLabel.Height = 16
                DBEditLabel.Caption = 'Placa'
              end
              object EditVeiculoUf: TLabeledDBEdit
                Left = 117
                Top = 35
                Width = 53
                Height = 21
                CharCase = ecUpperCase
                DataField = 'UF_VEICULO'
                DataSource = FDataModuleNFe.DSNfeTransporte
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                DBEditLabel.Width = 15
                DBEditLabel.Height = 16
                DBEditLabel.Caption = 'UF'
              end
              object EditVeiculoRNTC: TLabeledDBEdit
                Left = 176
                Top = 35
                Width = 200
                Height = 21
                CharCase = ecUpperCase
                DataField = 'RNTC_VEICULO'
                DataSource = FDataModuleNFe.DSNfeTransporte
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
                DBEditLabel.Width = 32
                DBEditLabel.Height = 16
                DBEditLabel.Caption = 'RNTC'
              end
            end
            object GroupBoxReboqueCarreta: TGroupBox
              Left = 0
              Top = 73
              Width = 1253
              Height = 273
              Align = alClient
              Caption = 'Placas Reboque/Carreta'
              TabOrder = 1
              object GridReboque: TJvDBUltimGrid
                Left = 2
                Top = 18
                Width = 1249
                Height = 253
                Align = alClient
                DataSource = FDataModuleNFe.DSNfeTransporteReboque
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
                TitleFont.Height = -13
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                AlternateRowColor = 15593713
                TitleArrow = True
                SelectColumnsDialogStrings.Caption = 'Select columns'
                SelectColumnsDialogStrings.OK = '&OK'
                SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                EditControls = <>
                RowsHeight = 17
                TitleRowHeight = 20
              end
            end
          end
          object TabSheetVolumes: TTabSheet
            Caption = 'Volumes'
            ImageIndex = 2
            object GroupBoxVolumes: TGroupBox
              Left = 0
              Top = 0
              Width = 1253
              Height = 346
              Align = alClient
              Caption = 'Volumes'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object GridVolumes: TJvDBUltimGrid
                Left = 2
                Top = 18
                Width = 1249
                Height = 326
                Align = alClient
                DataSource = FDataModuleNFe.DSNfeTransporteVolume
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
                TitleFont.Height = -13
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                AlternateRowColor = 15593713
                TitleArrow = True
                SelectColumnsDialogStrings.Caption = 'Select columns'
                SelectColumnsDialogStrings.OK = '&OK'
                SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                EditControls = <>
                RowsHeight = 17
                TitleRowHeight = 20
              end
            end
          end
          object TabSheetLacres: TTabSheet
            Caption = 'Lacres'
            ImageIndex = 3
            object GroupBoxLacres: TGroupBox
              Left = 0
              Top = 0
              Width = 1253
              Height = 346
              Align = alClient
              Caption = 'Lacres:'
              TabOrder = 0
              object GridVolumesLacres: TJvDBUltimGrid
                Left = 2
                Top = 18
                Width = 1249
                Height = 326
                Align = alClient
                DataSource = FDataModuleNFe.DSNfeTransporteVolumeLacre
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -13
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                AlternateRowColor = 15593713
                TitleArrow = True
                SelectColumnsDialogStrings.Caption = 'Select columns'
                SelectColumnsDialogStrings.OK = '&OK'
                SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                EditControls = <>
                RowsHeight = 17
                TitleRowHeight = 20
              end
            end
          end
          object TabSheetRetencaoIcms: TTabSheet
            Caption = 'Reten'#231#227'o de Icms'
            ImageIndex = 4
            object GroupBoxTransporteRetencaoICMS: TGroupBox
              Left = 0
              Top = 0
              Width = 1253
              Height = 346
              Align = alClient
              Caption = 'Municipio'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object Label10: TLabel
                Left = 16
                Top = 19
                Width = 31
                Height = 16
                Caption = 'CFOP'
              end
              object JvDBComboBoxCfopRetencaoIcmsFrete: TJvDBComboBox
                Left = 16
                Top = 36
                Width = 130
                Height = 21
                DataField = 'CFOP'
                DataSource = FDataModuleNFe.DSNfeTransporte
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
                ListSettings.OutfilteredValueFont.Color = clRed
                ListSettings.OutfilteredValueFont.Height = -11
                ListSettings.OutfilteredValueFont.Name = 'Tahoma'
                ListSettings.OutfilteredValueFont.Style = []
              end
              object EditTransporteIcmsValorServicos: TLabeledDBEdit
                Left = 151
                Top = 36
                Width = 106
                Height = 21
                CharCase = ecUpperCase
                DataField = 'VALOR_SERVICO'
                DataSource = FDataModuleNFe.DSNfeTransporte
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                DBEditLabel.Width = 94
                DBEditLabel.Height = 16
                DBEditLabel.Caption = 'Valor do Servi'#231'o'
              end
              object EditRetencaoIcmsBaseCalculo: TLabeledDBEdit
                Left = 263
                Top = 36
                Width = 119
                Height = 21
                CharCase = ecUpperCase
                DataField = 'VALOR_BC_RETENCAO_ICMS'
                DataSource = FDataModuleNFe.DSNfeTransporte
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
                DBEditLabel.Width = 90
                DBEditLabel.Height = 16
                DBEditLabel.Caption = 'Base de C'#225'lculo'
              end
              object EditRetencaoIcmsAliquota: TLabeledDBEdit
                Left = 388
                Top = 36
                Width = 100
                Height = 21
                CharCase = ecUpperCase
                DataField = 'ALIQUOTA_RETENCAO_ICMS'
                DataSource = FDataModuleNFe.DSNfeTransporte
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
                DBEditLabel.Width = 46
                DBEditLabel.Height = 16
                DBEditLabel.Caption = 'Al'#237'quota'
              end
              object EditRetencaoIcmsIcmsRetido: TLabeledDBEdit
                Left = 493
                Top = 36
                Width = 107
                Height = 21
                CharCase = ecUpperCase
                DataField = 'VALOR_ICMS_RETIDO'
                DataSource = FDataModuleNFe.DSNfeTransporte
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 4
                DBEditLabel.Width = 70
                DBEditLabel.Height = 16
                DBEditLabel.Caption = 'ICMS Retido'
              end
              object EditRetencaoIcmsCidade: TLabeledDBEdit
                Left = 606
                Top = 36
                Width = 187
                Height = 21
                CharCase = ecUpperCase
                DataField = 'MUNICIPIO'
                DataSource = FDataModuleNFe.DSNfeTransporte
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 5
                DBEditLabel.Width = 171
                DBEditLabel.Height = 16
                DBEditLabel.Caption = 'C'#243'digo Municipio da Reten'#231#227'o'
              end
            end
          end
          object TabSheetOutrasInformacoesFrete: TTabSheet
            Caption = 'Outras Informacoes'
            ImageIndex = 5
            object GroupBoxNfeTransporteOutrasInformacoes: TGroupBox
              Left = 0
              Top = 0
              Width = 1253
              Height = 346
              Align = alClient
              Caption = ' '
              TabOrder = 0
              object EditTransporteBalsa: TLabeledDBEdit
                Left = 16
                Top = 38
                Width = 319
                Height = 21
                CharCase = ecUpperCase
                DataField = 'BALSA'
                DataSource = FDataModuleNFe.DSNfeTransporte
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                DBEditLabel.Width = 30
                DBEditLabel.Height = 16
                DBEditLabel.Caption = 'Balsa'
              end
              object EditTransporteVagao: TLabeledDBEdit
                Left = 341
                Top = 38
                Width = 364
                Height = 21
                CharCase = ecUpperCase
                DataField = 'VAGAO'
                DataSource = FDataModuleNFe.DSNfeTransporte
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                DBEditLabel.Width = 36
                DBEditLabel.Height = 16
                DBEditLabel.Caption = 'Vag'#227'o'
              end
            end
          end
        end
      end
      object TSCobranca: TTabSheet
        Caption = 'Cobran'#231'a'
        ImageIndex = 4
        object PanelCobranca: TPanel
          Left = 0
          Top = 0
          Width = 1261
          Height = 377
          Align = alClient
          BevelInner = bvLowered
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
          object GroupBox1: TGroupBox
            Left = 1
            Top = 73
            Width = 1259
            Height = 303
            Align = alClient
            Caption = 'Duplicatas'
            TabOrder = 0
            object GridDuplicatas: TJvDBUltimGrid
              Left = 2
              Top = 15
              Width = 1255
              Height = 286
              Align = alClient
              DataSource = FDataModuleNFe.DSNfeDuplicata
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
              TitleFont.Height = -13
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              AlternateRowColor = 15593713
              TitleArrow = True
              SelectColumnsDialogStrings.Caption = 'Select columns'
              SelectColumnsDialogStrings.OK = '&OK'
              SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
              EditControls = <>
              RowsHeight = 17
              TitleRowHeight = 20
            end
          end
          object GroupBoxFatura: TGroupBox
            Left = 1
            Top = 1
            Width = 1259
            Height = 72
            Align = alTop
            Caption = 'Fatura:'
            TabOrder = 1
            object EditFaturaNumero: TLabeledDBEdit
              Left = 11
              Top = 33
              Width = 150
              Height = 21
              CharCase = ecUpperCase
              DataField = 'NUMERO'
              DataSource = FDataModuleNFe.DSNfeFatura
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              DBEditLabel.Width = 37
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'N'#250'mero'
            end
            object EditFaturaValorOriginal: TLabeledDBEdit
              Left = 166
              Top = 33
              Width = 121
              Height = 21
              CharCase = ecUpperCase
              DataField = 'VALOR_ORIGINAL'
              DataSource = FDataModuleNFe.DSNfeFatura
              TabOrder = 1
              DBEditLabel.Width = 63
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Valor Original'
            end
            object EditFaturaValorDesconto: TLabeledDBEdit
              Left = 293
              Top = 33
              Width = 121
              Height = 21
              CharCase = ecUpperCase
              DataField = 'VALOR_DESCONTO'
              DataSource = FDataModuleNFe.DSNfeFatura
              TabOrder = 2
              DBEditLabel.Width = 87
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Valor do Desconto'
            end
            object EditFaturaValorLiquido: TLabeledDBEdit
              Left = 420
              Top = 33
              Width = 139
              Height = 21
              CharCase = ecUpperCase
              DataField = 'VALOR_LIQUIDO'
              DataSource = FDataModuleNFe.DSNfeFatura
              TabOrder = 3
              DBEditLabel.Width = 60
              DBEditLabel.Height = 13
              DBEditLabel.Caption = 'Valor L'#237'quido'
            end
          end
        end
      end
      object TSInformacoesPagamento: TTabSheet
        Caption = 'Informa'#231#245'es de Pagamento'
        ImageIndex = 8
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 1261
          Height = 377
          Align = alClient
          BevelInner = bvLowered
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
          object GridFormaPagamento: TJvDBUltimGrid
            Left = 1
            Top = 1
            Width = 1259
            Height = 375
            Align = alClient
            DataSource = FDataModuleNFe.DSFormaPagamento
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
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            AlternateRowColor = 15593713
            TitleArrow = True
            SelectColumnsDialogStrings.Caption = 'Select columns'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
            EditControls = <>
            RowsHeight = 17
            TitleRowHeight = 20
          end
        end
      end
      object TSInformacoesAdicionais: TTabSheet
        Caption = 'Informa'#231#245'es Adicionais'
        ImageIndex = 6
        DesignSize = (
          1261
          377)
        object Label6: TLabel
          Left = 9
          Top = 253
          Width = 274
          Height = 13
          Caption = 'Informa'#231#245'es Adicionais de Interesse do Contribuinte [F1]'
        end
        object Label12: TLabel
          Left = 9
          Top = 137
          Width = 239
          Height = 13
          Caption = 'Informa'#231#245'es Adicionais de Interesse do Fisco [F1]'
        end
        object GroupBoxInformacoesAdicionaisComercioExterior: TGroupBox
          Left = 0
          Top = 0
          Width = 1261
          Height = 64
          Align = alTop
          Caption = 'Informa'#231#245'es de Com'#233'rcio Exterior:'
          TabOrder = 0
          object EditComexUfEmbarque: TLabeledDBEdit
            Left = 9
            Top = 31
            Width = 71
            Height = 21
            CharCase = ecUpperCase
            DataField = 'COMEX_UF_EMBARQUE'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            TabOrder = 0
            DBEditLabel.Width = 33
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'UF[F1]'
          end
          object EditComexLocalEmbarque: TLabeledDBEdit
            Left = 81
            Top = 31
            Width = 376
            Height = 21
            CharCase = ecUpperCase
            DataField = 'COMEX_LOCAL_EMBARQUE'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            TabOrder = 1
            DBEditLabel.Width = 75
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Local Embarque'
          end
          object EditComexLocalDespacho: TLabeledDBEdit
            Left = 463
            Top = 31
            Width = 322
            Height = 21
            CharCase = ecUpperCase
            DataField = 'COMEX_LOCAL_DESPACHO'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            TabOrder = 2
            DBEditLabel.Width = 74
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Local Despacho'
          end
        end
        object GroupBoxInformacoesAdicionaisCompras: TGroupBox
          Left = 0
          Top = 64
          Width = 1261
          Height = 64
          Align = alTop
          Caption = 'Informa'#231#245'es de Compras'
          TabOrder = 1
          object EditCompraNotaEmpenho: TLabeledDBEdit
            Left = 9
            Top = 31
            Width = 184
            Height = 21
            CharCase = ecUpperCase
            DataField = 'COMPRA_NOTA_EMPENHO'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            TabOrder = 0
            DBEditLabel.Width = 70
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Nota Empenho'
          end
          object EditCompraPedido: TLabeledDBEdit
            Left = 198
            Top = 31
            Width = 259
            Height = 21
            CharCase = ecUpperCase
            DataField = 'COMPRA_PEDIDO'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            TabOrder = 1
            DBEditLabel.Width = 32
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Pedido'
          end
          object EditCompraContato: TLabeledDBEdit
            Left = 463
            Top = 31
            Width = 322
            Height = 21
            CharCase = ecUpperCase
            DataField = 'COMPRA_CONTRATO'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            TabOrder = 2
            DBEditLabel.Width = 43
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Contrato'
          end
        end
        object MemoInfComplementarFisico: TDBMemo
          Left = 9
          Top = 151
          Width = 776
          Height = 96
          DataField = 'INFORMACOES_ADD_FISCO'
          DataSource = FDataModuleNFe.DSNfeCabecalho
          TabOrder = 2
        end
        object MemoInfComplementarContribuinte: TDBMemo
          Left = 9
          Top = 268
          Width = 776
          Height = 97
          Anchors = [akLeft, akTop, akBottom]
          DataField = 'INFORMACOES_ADD_CONTRIBUINTE'
          DataSource = FDataModuleNFe.DSNfeCabecalho
          TabOrder = 3
        end
      end
      object TSAutorizacaoDownload: TTabSheet
        Caption = 'Autoriza'#231#227'o de Download'
        ImageIndex = 9
        object GridNfeAutorizacaoDownload: TJvDBUltimGrid
          Left = 0
          Top = 0
          Width = 1261
          Height = 377
          Align = alClient
          DataSource = FDataModuleNFe.DSNfeAutorizacaoDownload
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
          TitleFont.Height = -13
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          AlternateRowColor = 15593713
          TitleArrow = True
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          RowsHeight = 17
          TitleRowHeight = 20
        end
      end
    end
    object PageControlTotais: TPageControl
      Left = 1
      Top = 406
      Width = 1269
      Height = 166
      ActivePage = tsTotaisGeral
      Align = alBottom
      TabOrder = 1
      object tsTotaisGeral: TTabSheet
        Caption = 'Totais Geral'
        object PanelTotais: TPanel
          Left = 0
          Top = 0
          Width = 1261
          Height = 138
          Align = alClient
          BevelInner = bvLowered
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
          object EditBCIcms: TLabeledDBEdit
            Left = 20
            Top = 20
            Width = 130
            Height = 21
            CharCase = ecUpperCase
            DataField = 'BASE_CALCULO_ICMS'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            DBEditLabel.Width = 75
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Base C'#225'lc.ICMS'
          end
          object EditValorIcms: TLabeledDBEdit
            Left = 155
            Top = 20
            Width = 130
            Height = 21
            CharCase = ecUpperCase
            DataField = 'VALOR_ICMS'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            DBEditLabel.Width = 52
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Total ICMS'
          end
          object EditValorTotalTributos: TLabeledDBEdit
            Left = 20
            Top = 60
            Width = 130
            Height = 21
            CharCase = ecUpperCase
            DataField = 'VALOR_TRIBUTOS'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            DBEditLabel.Width = 66
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Total Tributos'
          end
          object EditValorTotalIcmsDesonerado: TLabeledDBEdit
            Left = 155
            Top = 60
            Width = 130
            Height = 21
            CharCase = ecUpperCase
            DataField = 'VALOR_ICMS_DESONERADO'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            DBEditLabel.Width = 110
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Total Icms Desonerado'
          end
          object EditValorOutrasDespesas: TLabeledDBEdit
            Left = 20
            Top = 100
            Width = 130
            Height = 21
            CharCase = ecUpperCase
            DataField = 'VALOR_DESPESAS_ACESSORIAS'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
            DBEditLabel.Width = 93
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Outras Desp.  Aces'
          end
          object EditValorPIS: TLabeledDBEdit
            Left = 155
            Top = 100
            Width = 130
            Height = 21
            CharCase = ecUpperCase
            DataField = 'VALOR_PIS'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 5
            DBEditLabel.Width = 43
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Total PIS'
          end
          object EditBCIcmsSt: TLabeledDBEdit
            Left = 290
            Top = 20
            Width = 130
            Height = 21
            CharCase = ecUpperCase
            DataField = 'BASE_CALCULO_ICMS'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 6
            DBEditLabel.Width = 90
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Base C'#225'lc.ICMS ST'
          end
          object EditValorFrete: TLabeledDBEdit
            Left = 290
            Top = 60
            Width = 130
            Height = 21
            CharCase = ecUpperCase
            DataField = 'VALOR_FRETE'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 7
            DBEditLabel.Width = 53
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Total Frete'
          end
          object EditValorDesconto: TLabeledDBEdit
            Left = 290
            Top = 100
            Width = 130
            Height = 21
            CharCase = ecUpperCase
            DataField = 'VALOR_DESCONTO'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 8
            DBEditLabel.Width = 72
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Total Desconto'
          end
          object EditValorIcmsSt: TLabeledDBEdit
            Left = 425
            Top = 20
            Width = 130
            Height = 21
            CharCase = ecUpperCase
            DataField = 'VALOR_ICMS_ST'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 9
            DBEditLabel.Width = 67
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Total ICMS ST'
          end
          object EditValorSeguro: TLabeledDBEdit
            Left = 425
            Top = 60
            Width = 130
            Height = 21
            CharCase = ecUpperCase
            DataField = 'VALOR_SEGURO'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 10
            DBEditLabel.Width = 61
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Total Seguro'
          end
          object EditTotalImpostoImportacao: TLabeledDBEdit
            Left = 425
            Top = 100
            Width = 130
            Height = 21
            CharCase = ecUpperCase
            DataField = 'VALOR_IMPOSTO_IMPORTACAO'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 11
            DBEditLabel.Width = 101
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Tot. Imposto Import.'
          end
          object EditValorCONFINS: TLabeledDBEdit
            Left = 560
            Top = 20
            Width = 130
            Height = 21
            CharCase = ecUpperCase
            DataField = 'VALOR_COFINS'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 12
            DBEditLabel.Width = 65
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Total COFINS'
          end
          object EditValorIPI: TLabeledDBEdit
            Left = 560
            Top = 60
            Width = 130
            Height = 21
            CharCase = ecUpperCase
            DataField = 'VALOR_IPI'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 13
            DBEditLabel.Width = 41
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Total IPI'
          end
          object EditValorTotalIpiDevolvido: TLabeledDBEdit
            Left = 560
            Top = 100
            Width = 130
            Height = 21
            CharCase = ecUpperCase
            DataField = 'VALOR_IPI_DEVOLVIDO'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 14
            DBEditLabel.Width = 73
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Total Ipi Devol.'
          end
          object EditTotalProdutos: TLabeledDBEdit
            Left = 695
            Top = 60
            Width = 130
            Height = 21
            CharCase = ecUpperCase
            DataField = 'VALOR_TOTAL_PRODUTOS'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 15
            DBEditLabel.Width = 86
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Total Produtos:'
            DBEditLabel.Font.Charset = DEFAULT_CHARSET
            DBEditLabel.Font.Color = clWindowText
            DBEditLabel.Font.Height = -11
            DBEditLabel.Font.Name = 'Tahoma'
            DBEditLabel.Font.Style = [fsBold]
            DBEditLabel.ParentFont = False
          end
          object EditValorTotalNota: TLabeledDBEdit
            Left = 695
            Top = 100
            Width = 130
            Height = 21
            CharCase = ecUpperCase
            DataField = 'VALOR_TOTAL'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 16
            DBEditLabel.Width = 61
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Total Nota:'
            DBEditLabel.Font.Charset = DEFAULT_CHARSET
            DBEditLabel.Font.Color = clWindowText
            DBEditLabel.Font.Height = -11
            DBEditLabel.Font.Name = 'Tahoma'
            DBEditLabel.Font.Style = [fsBold]
            DBEditLabel.ParentFont = False
          end
          object EditValorCreditoIcmsSimplesNacional: TLabeledDBEdit
            Left = 695
            Top = 20
            Width = 130
            Height = 21
            CharCase = ecUpperCase
            DataField = 'VALOR_CREDITO_ICMS_SIMPLES_NACIONAL'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 17
            DBEditLabel.Width = 116
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Cr'#233'dito ICMS S.Nacional'
          end
        end
      end
      object TsTotaisFcp: TTabSheet
        Caption = 'Totais FCP/Difal'
        ImageIndex = 2
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 1261
          Height = 138
          Align = alClient
          Caption = ' '
          ParentBackground = False
          TabOrder = 0
          object EditValorIcmsUfRemet: TLabeledDBEdit
            Left = 17
            Top = 25
            Width = 130
            Height = 21
            CharCase = ecUpperCase
            DataField = 'VALOR_ICMS_UF_REMET'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            DBEditLabel.Width = 103
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Icms Part. UF Remet.'
          end
          object EditValorIcmsUfDest: TLabeledDBEdit
            Left = 152
            Top = 25
            Width = 130
            Height = 21
            CharCase = ecUpperCase
            DataField = 'VALOR_ICMS_UF_DEST'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            DBEditLabel.Width = 94
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Icms Part. UF Dest.'
          end
          object EditValorFcpUfDest: TLabeledDBEdit
            Left = 287
            Top = 25
            Width = 130
            Height = 21
            CharCase = ecUpperCase
            DataField = 'VALOR_FCP_UF_DEST'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            DBEditLabel.Width = 101
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Valor FCP UF Destino'
          end
          object EditValorTotalIcmsFCP: TLabeledDBEdit
            Left = 422
            Top = 25
            Width = 130
            Height = 21
            CharCase = ecUpperCase
            DataField = 'VALOR_ICMS_FCP'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            DBEditLabel.Width = 44
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Icms FCP'
          end
          object EditValorTotalIcmsFcpStRetidoAnteriormente: TLabeledDBEdit
            Left = 557
            Top = 25
            Width = 130
            Height = 21
            CharCase = ecUpperCase
            DataField = 'VALOR_ICMS_FCP_ST_RETIDO_ANTERIORMENTE'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
            DBEditLabel.Width = 96
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Icms FCP ST Ret.An'
          end
          object EditValorTotalIcmsFcpSt: TLabeledDBEdit
            Left = 692
            Top = 25
            Width = 130
            Height = 21
            CharCase = ecUpperCase
            DataField = 'VALOR_ICMS_FCP_ST'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 5
            DBEditLabel.Width = 59
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Icms FCP ST'
          end
        end
      end
      object TsOutrosTotais: TTabSheet
        Caption = 'Totais Servi'#231'os'
        ImageIndex = 3
        object PanelOutrosTotais: TPanel
          Left = 0
          Top = 0
          Width = 1261
          Height = 138
          Align = alClient
          BevelInner = bvLowered
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
          object EditBaseCalculoIssqn: TLabeledDBEdit
            Left = 17
            Top = 28
            Width = 130
            Height = 21
            CharCase = ecUpperCase
            DataField = 'BASE_CALCULO_ISSQN'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            DBEditLabel.Width = 128
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Base de C'#225'lculo do ISSQN:'
          end
          object EditValorRetidoPis: TLabeledDBEdit
            Left = 17
            Top = 68
            Width = 130
            Height = 21
            CharCase = ecUpperCase
            DataField = 'VALOR_RETIDO_PIS'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            DBEditLabel.Width = 77
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Valor Retido PIS'
          end
          object EditValorIssqn: TLabeledDBEdit
            Left = 152
            Top = 28
            Width = 130
            Height = 21
            CharCase = ecUpperCase
            DataField = 'VALOR_ISSQN'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            DBEditLabel.Width = 77
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Valor do ISSQN:'
          end
          object EditValorRetidoCofins: TLabeledDBEdit
            Left = 152
            Top = 68
            Width = 130
            Height = 21
            CharCase = ecUpperCase
            DataField = 'VALOR_RETIDO_COFINS'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            DBEditLabel.Width = 103
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Valor Retido COFINS:'
          end
          object EditValorPisIssqn: TLabeledDBEdit
            Left = 422
            Top = 68
            Width = 130
            Height = 21
            CharCase = ecUpperCase
            DataField = 'VALOR_PIS_ISSQN'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
            DBEditLabel.Width = 81
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Valor PIS ISSQN:'
          end
          object EditValorRetidoCsll: TLabeledDBEdit
            Left = 286
            Top = 68
            Width = 130
            Height = 21
            CharCase = ecUpperCase
            DataField = 'VALOR_RETIDO_CSLL'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 5
            DBEditLabel.Width = 88
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Valor Retido CSLL:'
          end
          object EditValorCofinsIssqn: TLabeledDBEdit
            Left = 557
            Top = 68
            Width = 130
            Height = 21
            CharCase = ecUpperCase
            DataField = 'VALOR_COFINS_ISSQN'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 6
            DBEditLabel.Width = 118
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Valor do COFINS ISSQN:'
          end
          object EditBaseCalculoIrrf: TLabeledDBEdit
            Left = 287
            Top = 28
            Width = 130
            Height = 21
            CharCase = ecUpperCase
            DataField = 'BASE_CALCULO_IRRF'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 7
            DBEditLabel.Width = 106
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Base de C'#225'lculo IRRF:'
          end
          object EditValorServicos: TLabeledDBEdit
            Left = 692
            Top = 68
            Width = 130
            Height = 21
            CharCase = ecUpperCase
            DataField = 'VALOR_SERVICOS'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 8
            DBEditLabel.Width = 67
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Valor Servi'#231'os'
          end
          object EditValorRetidoIrrf: TLabeledDBEdit
            Left = 422
            Top = 28
            Width = 130
            Height = 21
            CharCase = ecUpperCase
            DataField = 'VALOR_RETIDO_IRRF'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 9
            DBEditLabel.Width = 85
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Valor Retido IRRF'
          end
          object EditBaseCalculoPrevidencia: TLabeledDBEdit
            Left = 557
            Top = 28
            Width = 130
            Height = 21
            CharCase = ecUpperCase
            DataField = 'BASE_CALCULO_PREVIDENCIA'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 10
            DBEditLabel.Width = 118
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Base Calculo Previd'#234'ncia'
          end
          object EditValorRetidoPrevidencia: TLabeledDBEdit
            Left = 692
            Top = 28
            Width = 130
            Height = 21
            CharCase = ecUpperCase
            DataField = 'VALOR_RETIDO_PREVIDENCIA'
            DataSource = FDataModuleNFe.DSNfeCabecalho
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 11
            DBEditLabel.Width = 116
            DBEditLabel.Height = 13
            DBEditLabel.Caption = 'Valor Retido Previd'#234'ncia'
          end
        end
      end
    end
  end
  object GroupBoxGridNotasFiscais: TGroupBox
    Left = 0
    Top = 48
    Width = 513
    Height = 573
    Align = alLeft
    Caption = ' '
    TabOrder = 4
    object JvSpecialProgressNotasFiscais: TJvSpecialProgress
      Left = 2
      Top = 15
      Width = 509
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
    end
    object GridNotasFiscais: TJvDBUltimGrid
      Left = 2
      Top = 153
      Width = 509
      Height = 383
      Align = alClient
      DataSource = DSNotasFiscais
      PopupMenu = PopupMenu1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnColEnter = GridNotasFiscaisColEnter
      OnKeyPress = GridNotasFiscaisKeyPress
      OnTitleClick = GridNotasFiscaisTitleClick
      TitleArrow = True
      SelectColumnsDialogStrings.Caption = 'Select columns'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
      EditControls = <>
      RowsHeight = 17
      TitleRowHeight = 17
      SortWith = swClient
      Columns = <
        item
          Expanded = False
          FieldName = 'NUMERO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FORNECEDOR_CLIENTE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SERIE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_EMISSAO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_SAIDA_ENTRADA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CAMINHO_ARQUIVO_XML'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'CAMINHO_ARQUIVO_PDF'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'STATUS_NOTA'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'CHAVE_ACESSO'
          Visible = False
        end>
    end
    object PanelTotalizadorNf: TPanel
      Left = 2
      Top = 536
      Width = 509
      Height = 35
      Align = alBottom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object GroupBoxPesquisa: TGroupBox
      Left = 2
      Top = 89
      Width = 509
      Height = 64
      Align = alTop
      Caption = 'Pesquisa'
      TabOrder = 2
      object LabelPesquisa: TLabel
        Left = 2
        Top = 49
        Width = 505
        Height = 13
        Align = alBottom
        Caption = 
          'Pesquisa pelo "N'#250'mero". Para mudar o campo de pesquisa selecione' +
          ' o campo desejado na grid'
        ExplicitTop = 42
        ExplicitWidth = 451
      end
      object EditPesquisa: TEdit
        Left = 2
        Top = 28
        Width = 505
        Height = 21
        Align = alBottom
        CharCase = ecUpperCase
        TabOrder = 0
        OnKeyPress = EditPesquisaKeyPress
        ExplicitTop = 21
      end
    end
    object RadioGroupTipoVisualizacao: TRadioGroup
      Left = 2
      Top = 50
      Width = 509
      Height = 39
      Align = alTop
      Caption = ' '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Visualizar por Emitente'
        'Visualizar por Destinat'#225'rio')
      TabOrder = 3
      OnClick = RadioGroupTipoVisualizacaoClick
      ExplicitLeft = 1
      ExplicitTop = 71
    end
  end
  object MainMenu1: TMainMenu
    Left = 176
    Top = 256
    object File1: TMenuItem
      Caption = '&Arquivo'
      object Open1: TMenuItem
        Caption = '&Abrir...'
        ShortCut = 16463
        OnClick = Open1Click
      end
      object Close1: TMenuItem
        Caption = 'Fechar'
        OnClick = Close1Click
      end
      object mnProperties: TMenuItem
        Caption = 'Propriedades'
        OnClick = mnPropertiesClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Quit1: TMenuItem
        Caption = '&Sair'
        ShortCut = 16465
        OnClick = Quit1Click
      end
    end
    object Edit1: TMenuItem
      Caption = 'Editar'
      object Copy1: TMenuItem
        Caption = 'Copiar'
        ShortCut = 16451
        OnClick = Copy1Click
      end
      object Search1: TMenuItem
        Caption = 'Pesquisar...'
        ShortCut = 16454
        OnClick = Search1Click
      end
    end
    object MenuSped: TMenuItem
      Caption = 'Sped'
      Visible = False
      object ImportarSped1: TMenuItem
        Caption = 'Importar Sped'
      end
    end
    object Configuraes1: TMenuItem
      Caption = 'Configura'#231#245'es'
      object MostraropodevisualizodeDanfe1: TMenuItem
        Caption = 'Mostrar op'#231#227'o de visualiz'#231#227'o de Danfe'
        OnClick = MostraropodevisualizodeDanfe1Click
      end
      object MMenutipoCarregamentoArquivos: TMenuItem
        Caption = 'Permite escolher arquivos a serem carregados na pasta'
        OnClick = MMenutipoCarregamentoArquivosClick
      end
    end
    object PesquisaAvanada1: TMenuItem
      Caption = 'Pesquisa Avan'#231'ada'
      object ItensDetalhados1: TMenuItem
        Caption = 'Itens Detalhados'
        OnClick = ItensDetalhados1Click
      end
    end
  end
  object ppZoom: TPopupMenu
    OnPopup = ppZoomPopup
    Left = 336
    Top = 256
    object N101: TMenuItem
      Tag = 10
      Caption = '10%'
      OnClick = MenuZoomClick
    end
    object N251: TMenuItem
      Tag = 25
      Caption = '25%'
      OnClick = MenuZoomClick
    end
    object N501: TMenuItem
      Tag = 50
      Caption = '50%'
      OnClick = MenuZoomClick
    end
    object N1001: TMenuItem
      Tag = 75
      Caption = '75%'
      OnClick = MenuZoomClick
    end
    object N1002: TMenuItem
      Tag = 100
      Caption = '100%'
      OnClick = MenuZoomClick
    end
    object N1251: TMenuItem
      Tag = 125
      Caption = '125%'
      OnClick = MenuZoomClick
    end
    object N1501: TMenuItem
      Tag = 150
      Caption = '150%'
      OnClick = MenuZoomClick
    end
    object N2001: TMenuItem
      Tag = 200
      Caption = '200%'
      OnClick = MenuZoomClick
    end
    object N4001: TMenuItem
      Tag = 400
      Caption = '400%'
      OnClick = MenuZoomClick
    end
    object N8001: TMenuItem
      Tag = 800
      Caption = '800%'
      OnClick = MenuZoomClick
    end
    object N16001: TMenuItem
      Tag = 1600
      Caption = '1600%'
      OnClick = MenuZoomClick
    end
    object N24001: TMenuItem
      Tag = 2400
      Caption = '2400%'
      OnClick = MenuZoomClick
    end
    object N32001: TMenuItem
      Tag = 3200
      Caption = '3200%'
      OnClick = MenuZoomClick
    end
    object N64001: TMenuItem
      Tag = 6400
      Caption = '6400%'
      OnClick = MenuZoomClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object mnActualSize: TMenuItem
      Caption = 'Actual size'
      OnClick = mnActualSizeClick
    end
    object mnPageLevel: TMenuItem
      Caption = 'Zoom to page level'
      OnClick = mnPageLevelClick
    end
    object mnFitWidth: TMenuItem
      Caption = 'Fit width'
      OnClick = mnFitWidthClick
    end
  end
  object ACBrNFe: TACBrNFe
    Configuracoes.Geral.SSLLib = libNone
    Configuracoes.Geral.SSLCryptLib = cryNone
    Configuracoes.Geral.SSLHttpLib = httpNone
    Configuracoes.Geral.SSLXmlSignLib = xsNone
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.QuebradeLinha = '|'
    Configuracoes.RespTec.IdCSRT = 0
    DANFE = ACBrDanfe
    Left = 400
    Top = 352
  end
  object ACBrDanfe: TACBrNFeDANFeRL
    Sistema = 'Projeto ACBr - www.projetoacbr.com.br'
    MargemInferior = 8.000000000000000000
    MargemSuperior = 8.000000000000000000
    MargemEsquerda = 6.000000000000000000
    MargemDireita = 5.099999999999999000
    ExpandeLogoMarcaConfig.Altura = 0
    ExpandeLogoMarcaConfig.Esquerda = 0
    ExpandeLogoMarcaConfig.Topo = 0
    ExpandeLogoMarcaConfig.Largura = 0
    ExpandeLogoMarcaConfig.Dimensionar = False
    ExpandeLogoMarcaConfig.Esticar = True
    CasasDecimais.Formato = tdetInteger
    CasasDecimais.qCom = 2
    CasasDecimais.vUnCom = 2
    CasasDecimais.MaskqCom = ',0.00'
    CasasDecimais.MaskvUnCom = ',0.00'
    ACBrNFe = ACBrNFe
    Left = 400
    Top = 192
  end
  object DSNotasFiscais: TDataSource
    DataSet = CdsNotasFiscais
    Left = 72
    Top = 400
  end
  object PopupMenu1: TPopupMenu
    Left = 280
    Top = 432
    object PopupMenu11: TMenuItem
      Caption = 'Gerar Danfe'
      OnClick = PopupMenu11Click
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 232
    Top = 360
  end
  object CdsNotasFiscais: TClientDataSet
    PersistDataPacket.Data = {
      820100009619E0BD01000000180000000B0000000000030000008201064E554D
      45524F010049000000010005574944544802000200090012464F524E45434544
      4F525F434C49454E54450100490000000100055749445448020002003C000553
      4552494501004900000001000557494454480200020003000C444154415F454D
      495353414F040006000000000012444154415F53414944415F454E5452414441
      04000600000000000556414C4F52080004000000010007535542545950450200
      490006004D6F6E6579001343414D494E484F5F4152515549564F5F584D4C0200
      49000000010005574944544802000200E8031343414D494E484F5F4152515549
      564F5F504446020049000000010005574944544802000200E8030B5354415455
      535F4E4F544101004900000001000557494454480200020002000C4348415645
      5F41434553534F0100490000000100055749445448020002003200144944454E
      544946494341444F525F46494C54524F01004900000001000557494454480200
      020001000000}
    Active = True
    Aggregates = <>
    Params = <>
    AfterScroll = CdsNotasFiscaisAfterScroll
    Left = 72
    Top = 272
    object CdsNotasFiscaisNUMERO: TStringField
      DisplayLabel = 'N'#186' NF-e'
      FieldName = 'NUMERO'
      Size = 9
    end
    object CdsNotasFiscaisFORNECEDOR_CLIENTE: TStringField
      Tag = 1
      DisplayLabel = 'Emitente/Destinat'#225'rio'
      DisplayWidth = 37
      FieldName = 'FORNECEDOR_CLIENTE'
      Size = 60
    end
    object CdsNotasFiscaisSERIE: TStringField
      DisplayLabel = 'S'#233'rie'
      DisplayWidth = 5
      FieldName = 'SERIE'
      Size = 3
    end
    object CdsNotasFiscaisDATA_EMISSAO: TDateField
      DisplayLabel = 'Emiss'#227'o'
      FieldName = 'DATA_EMISSAO'
    end
    object CdsNotasFiscaisDATA_SAIDA_ENTRADA: TDateField
      DisplayLabel = 'Entrada/Saida'
      FieldName = 'DATA_SAIDA_ENTRADA'
    end
    object CdsNotasFiscaisVALOR: TCurrencyField
      DisplayLabel = 'Valor'
      DisplayWidth = 17
      FieldName = 'VALOR'
    end
    object CdsNotasFiscaisCAMINHO_ARQUIVO_XML: TStringField
      DisplayLabel = 'Caminho Arquivo XML'
      FieldName = 'CAMINHO_ARQUIVO_XML'
      Size = 1000
    end
    object CdsNotasFiscaisCAMINHO_ARQUIVO_PDF: TStringField
      DisplayLabel = 'Caminho Arquivo PDF'
      FieldName = 'CAMINHO_ARQUIVO_PDF'
      Size = 1000
    end
    object CdsNotasFiscaisSTATUS_NOTA: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_NOTA'
      Size = 2
    end
    object CdsNotasFiscaisCHAVE_ACESSO: TStringField
      FieldName = 'CHAVE_ACESSO'
      Visible = False
      Size = 50
    end
    object CdsNotasFiscaisIDENTIFICADOR_FILTRO: TStringField
      DisplayLabel = 'Identif. Filtro'
      FieldName = 'IDENTIFICADOR_FILTRO'
      Visible = False
      Size = 1
    end
  end
end

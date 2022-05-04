object DataModuleItensDetalhados: TDataModuleItensDetalhados
  OldCreateOrder = False
  Height = 159
  Width = 313
  object CdsDetalheItemFiltro: TClientDataSet
    Tag = 1
    PersistDataPacket.Data = {
      820500009619E0BD01000000180000003000000000000300000082050C434841
      56455F41434553534F0100490000000100055749445448020002003200094E55
      4D45524F5F4E460100490000000100055749445448020002000C0006434F4449
      474F0100490000000100055749445448020002003C00044E4F4D450100490000
      000100055749445448020002006400034E434D01004900000001000557494454
      480200020008000443464F500100490000000100055749445448020002000400
      04434553540100490000000100055749445448020002000A000B56414C4F525F
      544F54414C0800040000000000064F524947454D010049000000010005574944
      5448020002000100084353545F49434D53010049000000010005574944544802
      00020002000543534F534E010049000000010005574944544802000200030014
      4353545F49434D535F434F4E434154454E414441010049000000010005574944
      544802000200040011424153455F43414C43554C4F5F49434D53080004000000
      00000D414C4951554F54415F49434D5308000400000000000A56414C4F525F49
      434D5308000400000000001A56414C4F525F424153455F43414C43554C4F5F49
      434D535F5354080004000000000010414C4951554F54415F49434D535F535408
      000400000000000D56414C4F525F49434D535F5354080004000000000018414C
      4951554F54415F4352454449544F5F49434D535F534E08000400000000001556
      414C4F525F4352454449544F5F49434D535F534E080004000000000007435354
      5F504953010049000000010005574944544802000200020010424153455F4341
      4C43554C4F5F504953080004000000000017414C4951554F54415F5049535F50
      455243454E5455414C08000400000000000956414C4F525F5049530800040000
      0000000A4353545F434F46494E53010049000000010005574944544802000200
      020013424153455F43414C43554C4F5F434F46494E5308000400000000001A41
      4C4951554F54415F434F46494E535F50455243454E5455414C08000400000000
      000C56414C4F525F434F46494E530800040000000000074353545F4950490100
      4900000001000557494454480200020002001656414C4F525F424153455F4341
      4C43554C4F5F49504908000400000000000C414C4951554F54415F4950490800
      0400000000000956414C4F525F49504908000400000000000753454C4543414F
      01004900000001000557494454480200020001000D434E504A5F454D4954454E
      54450100490000000100055749445448020002000E0008454D4954454E544501
      0049000000010005574944544802000200640011434E504A5F44455354494E41
      544152494F0100490000000100055749445448020002000E000C44455354494E
      41544152494F01004900000001000557494454480200020064000C444154415F
      454D495353414F04000600000000000A444154415F5341494441040006000000
      00001856414C4F525F554E49544152494F5F434F4D45524349414C0800040000
      000000145155414E5449444144455F434F4D45524349414C0800040000000000
      11554E49444144455F434F4D45524349414C0100490000000100055749445448
      0200020014000D5449504F5F4F5045524143414F010049000000010005574944
      544802000200010010434F4E53554D49444F525F46494E414C01004900000001
      000557494454480200020001000D464F524D415F454D495353414F0100490000
      000100055749445448020002000200114E41545552455A415F4F504552414341
      4F01004900000001000557494454480200020064001756414C4F525F544F5441
      4C5F4E4F54415F46495343414C08000400000000001A43484156455F41434553
      534F5F4558504F5254415F455843454C01004900000001000557494454480200
      020032000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 55
    Top = 40
    object CdsDetalheItemFiltroSELECAO: TStringField
      DisplayLabel = ' '
      FieldName = 'SELECAO'
      Size = 1
    end
    object CdsDetalheItemFiltroCHAVE_ACESSO: TStringField
      DisplayLabel = 'Chave Acesso'
      FieldName = 'CHAVE_ACESSO'
      Visible = False
      Size = 50
    end
    object CdsDetalheItemFiltroNUMERO_NF: TStringField
      DisplayLabel = 'N'#186' NF-e'
      FieldName = 'NUMERO_NF'
      Size = 12
    end
    object CdsDetalheItemFiltroCODIGO: TStringField
      DisplayLabel = 'C'#243'digo Prod/Merc'
      DisplayWidth = 19
      FieldName = 'CODIGO'
      Size = 60
    end
    object CdsDetalheItemFiltroNOME: TStringField
      Tag = 1
      DisplayLabel = 'Produto/Mercadoria'
      DisplayWidth = 55
      FieldName = 'NOME'
      Size = 100
    end
    object CdsDetalheItemFiltroNCM: TStringField
      DisplayWidth = 11
      FieldName = 'NCM'
      Size = 8
    end
    object CdsDetalheItemFiltroCFOP: TStringField
      DisplayWidth = 9
      FieldName = 'CFOP'
      Size = 4
    end
    object CdsDetalheItemFiltroCEST: TStringField
      FieldName = 'CEST'
      Size = 10
    end
    object CdsDetalheItemFiltroVALOR_TOTAL: TFloatField
      DisplayLabel = 'Valor Total Item'
      DisplayWidth = 15
      FieldName = 'VALOR_TOTAL'
      EditFormat = '###,###,##0.00'
      currency = True
    end
    object CdsDetalheItemFiltroORIGEM: TStringField
      DisplayLabel = 'Origem'
      DisplayWidth = 10
      FieldName = 'ORIGEM'
      Size = 1
    end
    object CdsDetalheItemFiltroCST_ICMS: TStringField
      DisplayLabel = 'CST ICMS'
      DisplayWidth = 10
      FieldName = 'CST_ICMS'
      Size = 2
    end
    object CdsDetalheItemFiltroCSOSN: TStringField
      DisplayWidth = 10
      FieldName = 'CSOSN'
      Size = 3
    end
    object CdsDetalheItemFiltroCST_ICMS_CONCATENADA: TStringField
      DisplayLabel = 'CST ICMS Completa'
      DisplayWidth = 22
      FieldName = 'CST_ICMS_CONCATENADA'
      Size = 4
    end
    object CdsDetalheItemFiltroBASE_CALCULO_ICMS: TFloatField
      DisplayLabel = 'Base Calc. ICMS'
      FieldName = 'BASE_CALCULO_ICMS'
      EditFormat = '###,###,##0.00'
      currency = True
    end
    object CdsDetalheItemFiltroALIQUOTA_ICMS: TFloatField
      DisplayLabel = '% ICMS'
      FieldName = 'ALIQUOTA_ICMS'
      DisplayFormat = '###,###,##0.00'
    end
    object CdsDetalheItemFiltroVALOR_ICMS: TFloatField
      DisplayLabel = 'ICMS'
      FieldName = 'VALOR_ICMS'
      EditFormat = '###,###,##0.00'
      currency = True
    end
    object CdsDetalheItemFiltroVALOR_BASE_CALCULO_ICMS_ST: TFloatField
      DisplayLabel = 'Base Calc. ICMS ST'
      FieldName = 'VALOR_BASE_CALCULO_ICMS_ST'
      EditFormat = '###,###,##0.00'
      currency = True
    end
    object CdsDetalheItemFiltroALIQUOTA_ICMS_ST: TFloatField
      DisplayLabel = '% ICMS ST'
      FieldName = 'ALIQUOTA_ICMS_ST'
      DisplayFormat = '###,###,##0.00'
    end
    object CdsDetalheItemFiltroVALOR_ICMS_ST: TFloatField
      DisplayLabel = 'ICMS ST'
      FieldName = 'VALOR_ICMS_ST'
      EditFormat = '###,###,##0.00'
      currency = True
    end
    object CdsDetalheItemFiltroALIQUOTA_CREDITO_ICMS_SN: TFloatField
      DisplayLabel = '% Cr'#233'd. ICMS S.N.'
      FieldName = 'ALIQUOTA_CREDITO_ICMS_SN'
      DisplayFormat = '###,###,##0.00'
    end
    object CdsDetalheItemFiltroVALOR_CREDITO_ICMS_SN: TFloatField
      DisplayLabel = 'ICMS S.N.'
      FieldName = 'VALOR_CREDITO_ICMS_SN'
      EditFormat = '###,###,##0.00'
      currency = True
    end
    object CdsDetalheItemFiltroCST_PIS: TStringField
      DisplayLabel = 'CST PIS'
      FieldName = 'CST_PIS'
      Size = 2
    end
    object CdsDetalheItemFiltroBASE_CALCULO_PIS: TFloatField
      DisplayLabel = 'Base Calc. PIS'
      FieldName = 'BASE_CALCULO_PIS'
      EditFormat = '###,###,##0.00'
      currency = True
    end
    object CdsDetalheItemFiltroALIQUOTA_PIS_PERCENTUAL: TFloatField
      DisplayLabel = '% PIS'
      FieldName = 'ALIQUOTA_PIS_PERCENTUAL'
      DisplayFormat = '###,###,##0.00'
    end
    object CdsDetalheItemFiltroVALOR_PIS: TFloatField
      DisplayLabel = 'PIS'
      FieldName = 'VALOR_PIS'
      EditFormat = '###,###,##0.00'
      currency = True
    end
    object CdsDetalheItemFiltroCST_COFINS: TStringField
      DisplayLabel = 'CST COFINS'
      FieldName = 'CST_COFINS'
      Size = 2
    end
    object CdsDetalheItemFiltroBASE_CALCULO_COFINS: TFloatField
      DisplayLabel = 'Base Calc. COFINS'
      FieldName = 'BASE_CALCULO_COFINS'
      EditFormat = '###,###,##0.00'
      currency = True
    end
    object CdsDetalheItemFiltroALIQUOTA_COFINS_PERCENTUAL: TFloatField
      DisplayLabel = '% COFINS'
      FieldName = 'ALIQUOTA_COFINS_PERCENTUAL'
      DisplayFormat = '###,###,##0.00'
    end
    object CdsDetalheItemFiltroVALOR_COFINS: TFloatField
      DisplayLabel = 'COFINS'
      FieldName = 'VALOR_COFINS'
      EditFormat = '###,###,##0.00'
      currency = True
    end
    object CdsDetalheItemFiltroCST_IPI: TStringField
      DisplayLabel = 'CST IPI'
      FieldName = 'CST_IPI'
      Size = 2
    end
    object CdsDetalheItemFiltroVALOR_BASE_CALCULO_IPI: TFloatField
      DisplayLabel = 'Base Calc. IPI'
      FieldName = 'VALOR_BASE_CALCULO_IPI'
      EditFormat = '###,###,##0.00'
      currency = True
    end
    object CdsDetalheItemFiltroALIQUOTA_IPI: TFloatField
      DisplayLabel = '% IPI'
      FieldName = 'ALIQUOTA_IPI'
      DisplayFormat = '###,###,##0.00'
    end
    object CdsDetalheItemFiltroVALOR_IPI: TFloatField
      DisplayLabel = 'IPI'
      FieldName = 'VALOR_IPI'
      EditFormat = '###,###,##0.00'
      currency = True
    end
    object CdsDetalheItemFiltroCNPJ_EMITENTE: TStringField
      DisplayLabel = 'CNPJ Emitente'
      DisplayWidth = 15
      FieldName = 'CNPJ_EMITENTE'
      Size = 14
    end
    object CdsDetalheItemFiltroEMITENTE: TStringField
      DisplayLabel = 'Emitente'
      FieldName = 'EMITENTE'
      Size = 100
    end
    object CdsDetalheItemFiltroCNPJ_DESTINATARIO: TStringField
      DisplayLabel = 'CNPJ Destinat'#225'rio'
      DisplayWidth = 15
      FieldName = 'CNPJ_DESTINATARIO'
      Size = 14
    end
    object CdsDetalheItemFiltroDESTINATARIO: TStringField
      DisplayLabel = 'Destinat'#225'rio'
      FieldName = 'DESTINATARIO'
      Size = 100
    end
    object CdsDetalheItemFiltroDATA_EMISSAO: TDateField
      DisplayLabel = 'Data Emiss'#227'o'
      FieldName = 'DATA_EMISSAO'
    end
    object CdsDetalheItemFiltroDATA_SAIDA: TDateField
      DisplayLabel = 'Data Sa'#237'da'
      FieldName = 'DATA_SAIDA'
    end
    object CdsDetalheItemFiltroVALOR_UNITARIO_COMERCIAL: TFloatField
      DisplayLabel = 'Valor Unit'#225'rio Comercial'
      FieldName = 'VALOR_UNITARIO_COMERCIAL'
      DisplayFormat = '###,###,##0.0000000000'
      currency = True
    end
    object CdsDetalheItemFiltroQUANTIDADE_COMERCIAL: TFloatField
      DisplayLabel = 'Quantidade Comercial'
      FieldName = 'QUANTIDADE_COMERCIAL'
      DisplayFormat = '###,###,##0.0000'
    end
    object CdsDetalheItemFiltroUNIDADE_COMERCIAL: TStringField
      DisplayLabel = 'Un Comercial'
      FieldName = 'UNIDADE_COMERCIAL'
    end
    object CdsDetalheItemFiltroTIPO_OPERACAO: TStringField
      DisplayLabel = 'Tipo Opera'#231#227'o'
      FieldName = 'TIPO_OPERACAO'
      Size = 1
    end
    object CdsDetalheItemFiltroCONSUMIDOR_FINAL: TStringField
      DisplayLabel = 'Consumidor Final'
      FieldName = 'CONSUMIDOR_FINAL'
      Size = 1
    end
    object CdsDetalheItemFiltroFORMA_EMISSAO: TStringField
      DisplayLabel = 'Forma Emiss'#227'o'
      FieldName = 'FORMA_EMISSAO'
      Size = 2
    end
    object CdsDetalheItemFiltroNATUREZA_OPERACAO: TStringField
      DisplayLabel = 'Natureza Opera'#231#227'o'
      FieldName = 'NATUREZA_OPERACAO'
      Size = 100
    end
    object CdsDetalheItemFiltroVALOR_TOTAL_NOTA_FISCAL: TFloatField
      DisplayLabel = 'Valor Total da Nota Fiscal'
      FieldName = 'VALOR_TOTAL_NOTA_FISCAL'
      currency = True
    end
    object CdsDetalheItemFiltroCHAVE_ACESSO_EXPORTA_EXCEL: TStringField
      DisplayLabel = 'Chave Acesso'
      FieldName = 'CHAVE_ACESSO_EXPORTA_EXCEL'
      Size = 50
    end
  end
  object DSDetalheItemFiltro: TDataSource
    DataSet = CdsDetalheItemFiltro
    Left = 175
    Top = 40
  end
end

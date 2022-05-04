object FDataModuleNFe: TFDataModuleNFe
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 909
  Width = 907
  object CDSNfReferenciada: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 356
    Top = 134
  end
  object DSNfReferenciada: TDataSource
    DataSet = CDSNfReferenciada
    Left = 356
    Top = 182
  end
  object CDSCteReferenciado: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 212
    Top = 134
  end
  object DSCteReferenciado: TDataSource
    DataSet = CDSCteReferenciado
    Left = 212
    Top = 182
  end
  object CDSNfRuralReferenciada: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 212
    Top = 22
  end
  object DSNfRuralReferenciada: TDataSource
    DataSet = CDSNfRuralReferenciada
    Left = 212
    Top = 70
  end
  object CDSCupomReferenciado: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 68
    Top = 254
  end
  object DSCupomReferenciado: TDataSource
    DataSet = CDSCupomReferenciado
    Left = 68
    Top = 326
  end
  object CDSNfeReferenciada: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 68
    Top = 134
  end
  object DSNfeReferenciada: TDataSource
    DataSet = CDSNfeReferenciada
    Left = 68
    Top = 182
  end
  object CDSNfeDetalhe: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 68
    Top = 22
  end
  object DSNfeDetalhe: TDataSource
    DataSet = CDSNfeDetalhe
    Left = 68
    Top = 70
  end
  object CDSNfeDetalheImpostoCofins: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    MasterSource = DSNfeDetalhe
    PacketRecords = 0
    Params = <>
    StoreDefs = True
    Left = 780
    Top = 30
  end
  object DSNfeDetalheImpostoCofins: TDataSource
    DataSet = CDSNfeDetalheImpostoCofins
    Left = 780
    Top = 86
  end
  object CDSNfeImpostoIcms: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    MasterSource = DSNfeDetalhe
    PacketRecords = 0
    Params = <>
    StoreDefs = True
    Left = 636
    Top = 430
  end
  object DSNfeImpostoIcms: TDataSource
    DataSet = CDSNfeImpostoIcms
    Left = 636
    Top = 478
  end
  object CDSNfeImpostoImportacao: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    MasterSource = DSNfeDetalhe
    PacketRecords = 0
    Params = <>
    StoreDefs = True
    Left = 772
    Top = 302
  end
  object DSNfeImpostoImportacao: TDataSource
    DataSet = CDSNfeImpostoImportacao
    Left = 772
    Top = 350
  end
  object CDSNfeDetalheImpostoIpi: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    MasterSource = DSNfeDetalhe
    PacketRecords = 0
    Params = <>
    StoreDefs = True
    Left = 644
    Top = 302
  end
  object DSNfeDetalheImpostoIpi: TDataSource
    DataSet = CDSNfeDetalheImpostoIpi
    Left = 644
    Top = 350
  end
  object CDSNfeDetalheImpostoPis: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    MasterSource = DSNfeDetalhe
    PacketRecords = 0
    Params = <>
    StoreDefs = True
    Left = 772
    Top = 174
  end
  object DSNfeDetalheImpostoPis: TDataSource
    DataSet = CDSNfeDetalheImpostoPis
    Left = 772
    Top = 222
  end
  object CDSNfeDeclaracaoImportacao: TClientDataSet
    Aggregates = <
      item
        Visible = False
      end>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    Params = <>
    StoreDefs = True
    Left = 172
    Top = 734
  end
  object DSNfeDeclaracaoImportacao: TDataSource
    DataSet = CDSNfeDeclaracaoImportacao
    Left = 180
    Top = 798
  end
  object CDSNfeImportacaoDetalhe: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 356
    Top = 734
  end
  object DSNfeImportacaoDetalhe: TDataSource
    DataSet = CDSNfeImportacaoDetalhe
    Left = 356
    Top = 782
  end
  object CDSNfeTransporteVolumeLacre: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    PacketRecords = 0
    Params = <>
    StoreDefs = True
    Left = 500
    Top = 566
  end
  object DSNfeTransporteVolumeLacre: TDataSource
    DataSet = CDSNfeTransporteVolumeLacre
    Left = 500
    Top = 646
  end
  object CDSNfeDetalheImpostoFcpDifal: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 508
    Top = 278
  end
  object DSNfeDetalheImpostoFcpDifal: TDataSource
    DataSet = CDSNfeDetalheImpostoFcpDifal
    Left = 500
    Top = 342
  end
  object CDSNfeTransporteReboque: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 196
    Top = 566
  end
  object DSNfeTransporteReboque: TDataSource
    DataSet = CDSNfeTransporteReboque
    Left = 196
    Top = 646
  end
  object CDSNfeExportacao: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    MasterSource = DSNfeDetalhe
    PacketRecords = 0
    Params = <>
    StoreDefs = True
    Left = 764
    Top = 430
  end
  object DSNfeExportacao: TDataSource
    DataSet = CDSNfeExportacao
    Left = 764
    Top = 486
  end
  object CDSNfeDetalheRastreabilidade: TClientDataSet
    Aggregates = <>
    MasterSource = DSNfeDetalhe
    PacketRecords = 0
    Params = <>
    Left = 360
    Top = 16
  end
  object DSNfeDetalheRastreabilidade: TDataSource
    DataSet = CDSNfeDetalheRastreabilidade
    Left = 360
    Top = 80
  end
  object CdsNfeFormaPagamento: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 672
    Top = 568
  end
  object DSFormaPagamento: TDataSource
    DataSet = CdsNfeFormaPagamento
    Left = 672
    Top = 640
  end
  object CDSNfeAutorizacaoDownload: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 200
    Top = 408
  end
  object DSNfeAutorizacaoDownload: TDataSource
    DataSet = CDSNfeAutorizacaoDownload
    Left = 200
    Top = 472
  end
  object CdsNfeDestinatario: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 488
    Top = 416
  end
  object DsNfeDestinatario: TDataSource
    DataSet = CdsNfeDestinatario
    Left = 496
    Top = 488
  end
  object CDSNfeCabecalho: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 520
    Top = 24
  end
  object DSNfeCabecalho: TDataSource
    DataSet = CDSNfeCabecalho
    Left = 520
    Top = 88
  end
  object CDSNfeEmitente: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 656
    Top = 176
  end
  object DSNfeEmitente: TDataSource
    DataSet = CDSNfeEmitente
    Left = 648
    Top = 240
  end
  object CDSNfeLocalEntrega: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 344
    Top = 408
  end
  object DSLocalEntrega: TDataSource
    DataSet = CDSNfeLocalEntrega
    Left = 664
    Top = 24
  end
  object CDSNfeLocalRetirada: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 344
    Top = 480
  end
  object DSLocalRetirada: TDataSource
    DataSet = CDSNfeLocalRetirada
    Left = 656
    Top = 96
  end
  object CdsNfeTransporte: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 568
  end
  object DSNfeTransporte: TDataSource
    DataSet = CdsNfeTransporte
    Left = 40
    Top = 640
  end
  object CDSNfeTransporteVolume: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 336
    Top = 568
  end
  object DSNfeTransporteVolume: TDataSource
    DataSet = CDSNfeTransporteVolume
    Left = 344
    Top = 648
  end
  object CDSNfeFatura: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 808
    Top = 568
  end
  object DSNfeFatura: TDataSource
    DataSet = CDSNfeFatura
    Left = 808
    Top = 640
  end
  object CDSNfeDuplicata: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 744
  end
  object DSNfeDuplicata: TDataSource
    DataSet = CDSNfeDuplicata
    Left = 40
    Top = 816
  end
  object CDSNfeDetalheImpostoIssqn: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 208
    Top = 256
  end
  object DSNfeDetalheImpostoIssqn: TDataSource
    DataSet = CDSNfeDetalheImpostoIssqn
    Left = 208
    Top = 328
  end
  object CdsNfeDetalheCombustivel: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 520
    Top = 152
  end
  object CdsNfeDetalheVeiculo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 64
    Top = 408
  end
  object CdsNfeDetalheMedicamento: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 352
    Top = 256
  end
  object DSDetalheCombustivel: TDataSource
    DataSet = CdsNfeDetalheCombustivel
    Left = 520
    Top = 216
  end
  object DSNfeDetalheMedicamento: TDataSource
    DataSet = CdsNfeDetalheMedicamento
    Left = 352
    Top = 328
  end
  object DSNfeDetalheVeiculo: TDataSource
    DataSet = CdsNfeDetalheVeiculo
    Left = 56
    Top = 472
  end
end

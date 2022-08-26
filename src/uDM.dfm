object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 259
  Width = 783
  object cnnBD: TFDConnection
    Params.Strings = (
      'Server='
      'DriverID=MySQL')
    TxOptions.AutoStop = False
    LoginPrompt = False
    Transaction = FDTransaction1
    Left = 64
    Top = 16
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 64
    Top = 64
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 64
    Top = 112
  end
  object FDTransaction1: TFDTransaction
    Options.AutoStop = False
    Connection = cnnBD
    Left = 64
    Top = 160
  end
  object qryClientes: TFDQuery
    Connection = cnnBD
    Transaction = FDTransaction1
    SQL.Strings = (
      'SELECT * FROM CLIENTES'
      'ORDER BY DS_NOME')
    Left = 192
    Top = 64
  end
  object dspClientes: TDataSetProvider
    DataSet = qryClientes
    UpdateMode = upWhereKeyOnly
    Left = 192
    Top = 112
  end
  object cdsClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClientes'
    Left = 192
    Top = 160
  end
  object qryProdutos: TFDQuery
    Connection = cnnBD
    Transaction = FDTransaction1
    SQL.Strings = (
      'SELECT * FROM PRODUTOS'
      'ORDER BY DS_PRODUTO')
    Left = 296
    Top = 64
  end
  object dspProdutos: TDataSetProvider
    DataSet = qryProdutos
    UpdateMode = upWhereKeyOnly
    Left = 296
    Top = 112
  end
  object cdsProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdutos'
    Left = 296
    Top = 160
  end
  object qryVendas: TFDQuery
    Connection = cnnBD
    Transaction = FDTransaction1
    SQL.Strings = (
      'SELECT * FROM VENDAS'
      'ORDER BY VE_DATA DESC, VE_ID DESC')
    Left = 400
    Top = 64
  end
  object dspVendas: TDataSetProvider
    DataSet = qryVendas
    UpdateMode = upWhereKeyOnly
    Left = 400
    Top = 112
  end
  object cdsVendas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVendas'
    AfterPost = ComitaTransacao
    Left = 400
    Top = 160
  end
  object qryVendasItens: TFDQuery
    Connection = cnnBD
    Transaction = FDTransaction1
    SQL.Strings = (
      'SELECT VI.*, P.DS_PRODUTO '
      'FROM VENDAS_ITENS VI '
      #10'LEFT JOIN PRODUTOS P ON P.ID_PRODUTO = VI.VI_ID_PRODUTO'#10
      'WHERE VI_DT_VENDA = '#39'2022-08-26'#39' '#10'AND VI_ID_VENDA = 1')
    Left = 504
    Top = 64
  end
  object dspVendasItens: TDataSetProvider
    DataSet = qryVendasItens
    UpdateMode = upWhereKeyOnly
    Left = 504
    Top = 112
  end
  object cdsVendasItens: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVendasItens'
    AfterPost = ComitaTransacao
    AfterDelete = ComitaTransacao
    Left = 504
    Top = 160
    object cdsVendasItensVI_DT_VENDA: TDateField
      FieldName = 'VI_DT_VENDA'
      Origin = 'VI_DT_VENDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsVendasItensVI_ID_VENDA: TIntegerField
      FieldName = 'VI_ID_VENDA'
      Origin = 'VI_ID_VENDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsVendasItensVI_ITEM: TIntegerField
      FieldName = 'VI_ITEM'
      Origin = 'VI_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsVendasItensVI_ID_PRODUTO: TIntegerField
      FieldName = 'VI_ID_PRODUTO'
      Origin = 'VI_ID_PRODUTO'
      Required = True
    end
    object cdsVendasItensNR_QUANTIDADE: TBCDField
      FieldName = 'NR_QUANTIDADE'
      Origin = 'NR_QUANTIDADE'
      Required = True
      Precision = 15
      Size = 2
    end
    object cdsVendasItensVL_UNITARIO: TBCDField
      FieldName = 'VL_UNITARIO'
      Origin = 'VL_UNITARIO'
      Required = True
      currency = True
      Precision = 15
      Size = 2
    end
    object cdsVendasItensVL_TOTAL: TBCDField
      FieldName = 'VL_TOTAL'
      Origin = 'VL_TOTAL'
      currency = True
      Precision = 15
      Size = 2
    end
    object cdsVendasItensDS_PRODUTO: TStringField
      FieldName = 'DS_PRODUTO'
      Origin = 'DS_PRODUTO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object qryTmp: TFDQuery
    Connection = cnnBD
    Left = 192
    Top = 16
  end
  object cdsTmp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 296
    Top = 16
  end
end

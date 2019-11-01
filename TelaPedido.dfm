object TelaPedidos: TTelaPedidos
  Left = 0
  Top = 0
  Caption = 'Pedido - Valbernielson'#39's Hamburgueria'
  ClientHeight = 700
  ClientWidth = 1300
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgDadosPedido: TPageControl
    Left = 0
    Top = 0
    Width = 1300
    Height = 700
    ActivePage = tbPedido
    Align = alClient
    TabOrder = 0
    object tbPedido: TTabSheet
      Caption = 'Inclus'#227'o/Altera'#231#227'o de Pedidos'
      object lblVrPedido: TLabel
        Left = 1014
        Top = 634
        Width = 136
        Height = 19
        Caption = 'VALOR PEDIDO :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object grpPedido: TGroupBox
        Left = 0
        Top = 3
        Width = 1286
        Height = 438
        TabOrder = 0
        object lblStatus: TLabel
          Left = 8
          Top = 6
          Width = 94
          Height = 29
          Caption = 'STATUS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCliente: TLabel
          Left = 8
          Top = 91
          Width = 81
          Height = 19
          Caption = 'CLIENTE :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblEndereco: TLabel
          Left = 8
          Top = 124
          Width = 100
          Height = 19
          Caption = 'ENDERECO :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCEP: TLabel
          Left = 8
          Top = 157
          Width = 43
          Height = 19
          Caption = 'CEP :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblTelefone: TLabel
          Left = 768
          Top = 124
          Width = 94
          Height = 19
          Caption = 'TELEFONE :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblBairro: TLabel
          Left = 240
          Top = 157
          Width = 77
          Height = 19
          Caption = 'BAIRRO :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object grdProduto: TDBGrid
          Left = 8
          Top = 232
          Width = 1268
          Height = 202
          TabStop = False
          DataSource = dsIPED
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 5
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnKeyUp = grdProdutoKeyUp
          Columns = <
            item
              Expanded = False
              FieldName = 'COD'
              Title.Alignment = taCenter
              Title.Caption = 'COD. PROD'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 71
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Alignment = taCenter
              Title.Caption = 'DESCRI'#199#195'O'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 441
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QTDE'
              Title.Alignment = taCenter
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VRUNIT'
              Title.Alignment = taCenter
              Title.Caption = 'VR UNIT.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 125
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VRTOTAL'
              Title.Alignment = taCenter
              Title.Caption = 'VR TOTAL'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 117
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COMPLITEM'
              Title.Alignment = taCenter
              Title.Caption = 'INFORMA'#199#213'ES EXTRAS'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 496
              Visible = True
            end>
        end
        object edtCliente: TDBEdit
          Left = 114
          Top = 88
          Width = 599
          Height = 27
          CharCase = ecUpperCase
          DataField = 'RAZSOCIAL'
          DataSource = dsCPED
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object edtSTATUS: TDBEdit
          Left = 114
          Top = 3
          Width = 911
          Height = 37
          CharCase = ecUpperCase
          DataField = 'STATUS'
          DataSource = dsCPED
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object edtEndereco: TDBEdit
          Left = 114
          Top = 121
          Width = 599
          Height = 27
          CharCase = ecUpperCase
          DataField = 'ENDERECO'
          DataSource = dsCPED
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object edtBAIRRO: TDBEdit
          Left = 323
          Top = 154
          Width = 120
          Height = 27
          CharCase = ecUpperCase
          DataField = 'BAIRRO'
          DataSource = dsCPED
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object edtTELEFONE: TMaskEdit
          Left = 867
          Top = 121
          Width = 156
          Height = 27
          EditMask = '9999999999999999;1; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 16
          ParentFont = False
          TabOrder = 2
          Text = '                '
          OnExit = edtTELEFONEExit
        end
        object edtCEP: TMaskEdit
          Left = 114
          Top = 154
          Width = 120
          Height = 27
          EditMask = '99999-999;1; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 9
          ParentFont = False
          TabOrder = 3
          Text = '     -   '
        end
      end
      object edtVRTOTAL: TDBEdit
        Left = 1156
        Top = 631
        Width = 120
        Height = 27
        DataField = 'VALOR'
        DataSource = dsCPED
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object pgDadosExtra: TPageControl
        Left = 8
        Top = 445
        Width = 1268
        Height = 169
        ActivePage = tbPagamento
        TabOrder = 2
        object Produto: TTabSheet
          Caption = 'Produto'
          ImageIndex = 2
          OnEnter = ProdutoEnter
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object grpProduto: TGroupBox
            Left = 0
            Top = 3
            Width = 1257
            Height = 135
            TabOrder = 0
            object lblProduto: TLabel
              Left = 14
              Top = 9
              Width = 93
              Height = 19
              Caption = 'PRODUTO :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblQTDE: TLabel
              Left = 14
              Top = 43
              Width = 56
              Height = 19
              Caption = 'QTDE :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblVrUnit: TLabel
              Left = 14
              Top = 78
              Width = 86
              Height = 19
              Caption = 'VR UNIT. :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblVrTotal: TLabel
              Left = 14
              Top = 108
              Width = 94
              Height = 19
              Caption = 'VR TOTAL :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblInfoExtra: TLabel
              Left = 638
              Top = 41
              Width = 203
              Height = 19
              Caption = 'INFORMA'#199#213'ES EXTRAS :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lkProduto: TDBLookupComboBox
              Left = 113
              Top = 7
              Width = 1111
              Height = 27
              Ctl3D = False
              DataField = 'COD'
              DataSource = dsIPED
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              KeyField = 'CODPROD'
              ListField = 'DESCRICAO;INFOPROD'
              ListSource = dsProdutos
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 0
              OnEnter = lkProdutoEnter
              OnExit = lkProdutoExit
            end
            object edtQTDEItem: TDBEdit
              Left = 113
              Top = 41
              Width = 121
              Height = 27
              DataField = 'QTDE'
              DataSource = dsIPED
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object edtVrTotItem: TDBEdit
              Left = 114
              Top = 103
              Width = 120
              Height = 27
              DataField = 'VRTOTAL'
              DataSource = dsIPED
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object edtVRUnit: TDBEdit
              Left = 114
              Top = 74
              Width = 120
              Height = 27
              DataField = 'VRUNIT'
              DataSource = dsIPED
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object dbmemoINFOPROD: TDBMemo
              Left = 240
              Top = 36
              Width = 377
              Height = 94
              DataField = 'INFOPROD'
              DataSource = dsIPED
              Enabled = False
              TabOrder = 4
            end
            object dbmemoINFOEXTRA: TDBMemo
              Left = 856
              Top = 38
              Width = 368
              Height = 92
              DataField = 'COMPLITEM'
              DataSource = dsIPED
              TabOrder = 5
              OnExit = dbmemoINFOEXTRAExit
            end
          end
        end
        object tbInformacoes: TTabSheet
          Caption = 'Outras Informa'#231#245'es'
          ImageIndex = 1
          object dbmemoComplemento: TDBMemo
            Left = 3
            Top = 3
            Width = 1254
            Height = 135
            DataField = 'COMPLEMENTO'
            DataSource = dsCPED
            TabOrder = 0
          end
        end
        object tbPagamento: TTabSheet
          Caption = 'Condi'#231#227'o de Pagamento'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object grpPag: TGroupBox
            Left = 0
            Top = 0
            Width = 1260
            Height = 141
            Align = alClient
            TabOrder = 0
            object lblTipoPag: TLabel
              Left = 6
              Top = 6
              Width = 163
              Height = 19
              Caption = 'TIPO PAGAMENTO :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lstCondPag: TListBox
              Left = 175
              Top = 3
              Width = 218
              Height = 126
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -19
              Font.Name = 'Tahoma'
              Font.Style = []
              ItemHeight = 23
              Items.Strings = (
                'VISA CR'#201'DITO'
                'VISA D'#201'BITO'
                'MASTER CR'#201'DITO'
                'MASTER D'#201'BITO'
                'DINHEIRO')
              ParentFont = False
              TabOrder = 0
            end
          end
        end
      end
    end
  end
  object btCancelar: TButton
    Left = 1124
    Top = 33
    Width = 73
    Height = 42
    Caption = 'CANCELAR'
    TabOrder = 1
    TabStop = False
    OnClick = btCancelarClick
  end
  object btGravar: TButton
    Left = 1203
    Top = 33
    Width = 73
    Height = 42
    Caption = 'GRAVAR'
    TabOrder = 2
    TabStop = False
    OnClick = btGravarClick
  end
  object QInsereIPED: TFDQuery
    Connection = Conection.ConexaoBanco
    Transaction = Conection.Transacao
    SQL.Strings = (
      'INSERT OR REPLACE INTO IPED'
      '('
      '  NRPEDIDO,'
      '  NRITEM,'
      '  COD,'
      '  DESCRICAO,'
      '  QTDE,'
      '  VRUNIT,'
      '  VRTOTAL,'
      '  COMPLITEM'
      ')'
      'VALUES'
      '('
      '  :NRPEDIDO,'
      '  :NRITEM,'
      '  :COD,'
      '  :DESCRICAO,'
      '  :QTDE,'
      '  :VRUNIT,'
      '  :VRTOTAL,'
      '  :COMPLITEM'
      ')')
    Left = 1164
    Top = 371
    ParamData = <
      item
        Name = 'NRPEDIDO'
        ParamType = ptInput
      end
      item
        Name = 'NRITEM'
        ParamType = ptInput
      end
      item
        Name = 'COD'
        ParamType = ptInput
      end
      item
        Name = 'DESCRICAO'
        ParamType = ptInput
      end
      item
        Name = 'QTDE'
        ParamType = ptInput
      end
      item
        Name = 'VRUNIT'
        ParamType = ptInput
      end
      item
        Name = 'VRTOTAL'
        ParamType = ptInput
      end
      item
        Name = 'COMPLITEM'
        ParamType = ptInput
      end>
  end
  object QProd: TFDTable
    IndexFieldNames = 'CODPROD'
    Connection = Conection.ConexaoBanco
    UpdateOptions.UpdateTableName = 'PRODUTO'
    TableName = 'PRODUTO'
    Left = 1164
    Top = 315
    object QProdCODPROD: TIntegerField
      FieldName = 'CODPROD'
      Origin = 'CODPROD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QProdDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 50
    end
    object QProdINFOPROD: TStringField
      FieldName = 'INFOPROD'
      Origin = 'INFOPROD'
      Required = True
      Size = 100
    end
    object QProdVRUNITARIO: TFMTBCDField
      FieldName = 'VRUNITARIO'
      Origin = 'VRUNITARIO'
      Required = True
      DisplayFormat = '###,##0.00'
      Precision = 15
      Size = 6
    end
  end
  object dsProdutos: TDataSource
    AutoEdit = False
    DataSet = QProd
    Left = 1204
    Top = 315
  end
  object TbIPED: TFDMemTable
    OnCalcFields = TbIPEDCalcFields
    IndexFieldNames = 'NRITEM'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 1076
    Top = 371
    object TbIPEDCOD: TIntegerField
      FieldName = 'COD'
    end
    object TbIPEDDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object TbIPEDVRTOTAL: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'VRTOTAL'
      DisplayFormat = '###,##0.00'
      Calculated = True
    end
    object TbIPEDQTDE: TIntegerField
      FieldName = 'QTDE'
    end
    object TbIPEDCOMPLITEM: TStringField
      FieldName = 'COMPLITEM'
      Size = 50
    end
    object TbIPEDVRUNIT: TFMTBCDField
      FieldName = 'VRUNIT'
      Origin = 'VRUNIT'
      Required = True
      DisplayFormat = '###,##0.00'
      currency = True
      Precision = 15
      Size = 6
    end
    object TbIPEDNRITEM: TIntegerField
      FieldName = 'NRITEM'
    end
    object TbIPEDINFOPROD: TStringField
      FieldName = 'INFOPROD'
      Size = 100
    end
  end
  object dsIPED: TDataSource
    DataSet = TbIPED
    Left = 1076
    Top = 315
  end
  object TbCPED: TFDTable
    IndexFieldNames = 'NRPEDIDO'
    Connection = Conection.ConexaoBanco
    Transaction = Conection.Transacao
    UpdateOptions.UpdateTableName = 'CPED'
    TableName = 'CPED'
    Left = 1108
    Top = 171
    object TbCPEDNRPEDIDO: TFDAutoIncField
      FieldName = 'NRPEDIDO'
      Origin = 'NRPEDIDO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object TbCPEDSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
      Size = 30
    end
    object TbCPEDRAZSOCIAL: TStringField
      FieldName = 'RAZSOCIAL'
      Origin = 'RAZSOCIAL'
      Required = True
      Size = 60
    end
    object TbCPEDVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Required = True
      DisplayFormat = '###,##0.00'
      Precision = 15
      Size = 6
    end
    object TbCPEDDTPEDIDO: TDateTimeField
      FieldName = 'DTPEDIDO'
      Origin = 'DTPEDIDO'
      Required = True
    end
    object TbCPEDCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 100
    end
    object TbCPEDENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Required = True
      Size = 60
    end
    object TbCPEDTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Required = True
      Size = 15
    end
    object TbCPEDCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Required = True
      Size = 9
    end
    object TbCPEDBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Required = True
      Size = 40
    end
    object TbCPEDCONDPAGAMENTO: TIntegerField
      FieldName = 'CONDPAGAMENTO'
      Origin = 'CONDPAGAMENTO'
      Required = True
    end
  end
  object dsCPED: TDataSource
    DataSet = TbCPED
    Left = 1180
    Top = 171
  end
end

object CadPedidos: TCadPedidos
  Left = 0
  Top = 0
  Caption = 'Cadastro de Pedidos - Valbernielson'#39's Hamburgueria'
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
  object grpCadPed: TGroupBox
    Left = 0
    Top = 0
    Width = 1300
    Height = 700
    Align = alClient
    TabOrder = 0
    object pgConsulta: TPageControl
      Left = 2
      Top = 32
      Width = 1296
      Height = 666
      ActivePage = tbDadosConsulta
      Align = alCustom
      TabOrder = 0
      object tbDadosConsulta: TTabSheet
        Caption = 'Pedidos'
        object lblTotal: TLabel
          Left = 1004
          Top = 490
          Width = 145
          Height = 19
          Caption = 'TOTAL PEDIDOS :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object grpFiltro: TGroupBox
          Left = 0
          Top = 3
          Width = 1285
          Height = 134
          Caption = 'FILTROS'
          TabOrder = 0
          object lblNrpedido: TLabel
            Left = 16
            Top = 22
            Width = 84
            Height = 13
            Caption = 'N'#218'MERO PEDIDO'
          end
          object lblPedidoDe: TLabel
            Left = 320
            Top = 22
            Width = 13
            Height = 13
            Caption = 'DE'
          end
          object lblPedidoAte: TLabel
            Left = 466
            Top = 22
            Width = 19
            Height = 13
            Caption = 'AT'#201
          end
          object lblDataPedidoDe: TLabel
            Left = 16
            Top = 49
            Width = 86
            Height = 13
            Caption = 'DATA DO PEDIDO'
          end
          object lblStatusList: TLabel
            Left = 16
            Top = 75
            Width = 38
            Height = 13
            Caption = 'STATUS'
          end
          object lblAteDT: TLabel
            Left = 209
            Top = 49
            Width = 19
            Height = 13
            Caption = 'AT'#201
          end
          object edtNrPedido: TEdit
            Left = 106
            Top = 16
            Width = 121
            Height = 21
            TabOrder = 0
          end
          object edtDE: TEdit
            Left = 339
            Top = 16
            Width = 121
            Height = 21
            TabOrder = 1
          end
          object edtATE: TEdit
            Left = 491
            Top = 16
            Width = 121
            Height = 21
            TabOrder = 2
          end
          object btPesquisar: TButton
            Left = 1160
            Top = 14
            Width = 122
            Height = 46
            Caption = 'PESQUISAR'
            TabOrder = 3
            OnClick = btPesquisarClick
          end
          object dtPedido: TDateTimePicker
            Left = 107
            Top = 43
            Width = 95
            Height = 21
            Date = 43768.000000000000000000
            Time = 43768.000000000000000000
            ShowCheckbox = True
            TabOrder = 4
          end
          object dtPedidoAte: TDateTimePicker
            Left = 237
            Top = 43
            Width = 95
            Height = 21
            Date = 43768.000000000000000000
            Time = 43768.000000000000000000
            ShowCheckbox = True
            TabOrder = 5
          end
          object lstcbStatus: TCheckListBox
            Left = 106
            Top = 70
            Width = 227
            Height = 51
            ItemHeight = 13
            Items.Strings = (
              'AGUARDANDO APROVA'#199#195'O'
              'PEDIDO RECEBIDO'
              'PEDIDO EM TRANSPORTE')
            TabOrder = 6
          end
        end
        object gridPedidos: TDBGrid
          Left = 0
          Top = 152
          Width = 1285
          Height = 329
          DataSource = dsPedido
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = gridPedidosCellClick
          OnDrawColumnCell = gridPedidosDrawColumnCell
          OnDblClick = gridPedidosDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'NRPEDIDO'
              Title.Alignment = taCenter
              Title.Caption = 'NR PEDIDO'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 73
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RAZSOCIAL'
              Title.Alignment = taCenter
              Title.Caption = 'RAZ'#195'O SOCIAL'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 622
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STATUS'
              Title.Alignment = taCenter
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 310
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR'
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
              FieldName = 'DTPEDIDO'
              Title.Alignment = taCenter
              Title.Caption = 'DATA'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Visible = True
            end>
        end
        object grpControlePedido: TGroupBox
          Left = 3
          Top = 520
          Width = 1282
          Height = 115
          Caption = 'CONTROLE DO PEDIDO'
          TabOrder = 2
          object btPedidoRec: TSpeedButton
            Left = 13
            Top = 24
            Width = 164
            Height = 73
            Caption = 'PEDIDO RECEBIDO'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = btPedidoRecClick
          end
          object btPedidoTrans: TSpeedButton
            Left = 183
            Top = 24
            Width = 187
            Height = 73
            Caption = 'PEDIDO EM TRANSPORTE'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = btPedidoTransClick
          end
          object lblPendenteAprov: TLabel
            Left = 960
            Top = 16
            Width = 268
            Height = 19
            Caption = 'PEDIDO PENDENTE DE APROVA'#199#195'O'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblPedidoRec: TLabel
            Left = 960
            Top = 41
            Width = 276
            Height = 19
            Caption = 'PEDIDO RECEBIDO ENVIO PENDENTE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblPedidoEnviado: TLabel
            Left = 960
            Top = 66
            Width = 133
            Height = 19
            Caption = 'PEDIDO ENVIADO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
        end
        object edtTotPedidos: TEdit
          Left = 1164
          Top = 487
          Width = 121
          Height = 27
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
      end
    end
    object btIncluir: TButton
      Left = 2
      Top = 5
      Width = 75
      Height = 25
      Caption = 'INCLUIR'
      TabOrder = 1
      OnClick = btIncluirClick
    end
    object btAlterar: TButton
      Left = 83
      Top = 5
      Width = 75
      Height = 25
      Caption = 'ALTERAR'
      TabOrder = 2
      OnClick = btAlterarClick
    end
    object btExcluir: TButton
      Left = 164
      Top = 5
      Width = 75
      Height = 25
      Caption = 'EXCLUIR'
      TabOrder = 3
      OnClick = btExcluirClick
    end
  end
  object dsPedido: TDataSource
    DataSet = QCPED
    Left = 918
    Top = 368
  end
  object QCPED: TFDQuery
    Connection = Conection.ConexaoBanco
    SQL.Strings = (
      'SELECT CPED.NRPEDIDO'
      '       ,CPED.STATUS'
      '       ,CPED.RAZSOCIAL'
      '       ,CPED.VALOR'
      '       ,CPED.DTPEDIDO'
      '       ,CPED.COMPLEMENTO'
      '       ,CPED.CONDPAGAMENTO'
      '       ,CPED.ENDERECO'
      '       ,CPED.TELEFONE'
      '       ,CPED.CEP'
      '       ,CPED.BAIRRO'
      'FROM CPED')
    Left = 910
    Top = 304
    object QCPEDNRPEDIDO: TFDAutoIncField
      FieldName = 'NRPEDIDO'
      Origin = 'NRPEDIDO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QCPEDSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      ReadOnly = True
      Required = True
      Size = 30
    end
    object QCPEDRAZSOCIAL: TStringField
      FieldName = 'RAZSOCIAL'
      Origin = 'RAZSOCIAL'
      ReadOnly = True
      Required = True
      Size = 60
    end
    object QCPEDVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      ReadOnly = True
      Required = True
      DisplayFormat = '###,##0.00'
      Precision = 15
      Size = 6
    end
    object QCPEDDTPEDIDO: TDateTimeField
      FieldName = 'DTPEDIDO'
      Origin = 'DTPEDIDO'
      ReadOnly = True
      Required = True
    end
    object QCPEDCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      ReadOnly = True
      Size = 100
    end
    object QCPEDENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      ReadOnly = True
      Required = True
      Size = 60
    end
    object QCPEDTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      ReadOnly = True
      Required = True
      Size = 15
    end
    object QCPEDCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      ReadOnly = True
      Required = True
      Size = 9
    end
    object QCPEDBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      ReadOnly = True
      Required = True
      Size = 40
    end
    object QCPEDCONDPAGAMENTO: TIntegerField
      FieldName = 'CONDPAGAMENTO'
      Origin = 'CONDPAGAMENTO'
      Required = True
    end
  end
end

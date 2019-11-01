object Conection: TConection
  Left = 0
  Top = 0
  Caption = 'ModuloConexao'
  ClientHeight = 242
  ClientWidth = 472
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ConexaoBanco: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Pedro Lourencini\Documents\Embarcadero\Studio\' +
        'Projects\Hamburgueria.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    Left = 28
    Top = 22
  end
  object Transacao: TFDTransaction
    Connection = ConexaoBanco
    Left = 120
    Top = 22
  end
end

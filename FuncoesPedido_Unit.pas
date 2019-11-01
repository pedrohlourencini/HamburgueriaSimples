unit FuncoesPedido_Unit;

interface
  uses
    DMConection, TelaPedido, Hamburgueria, System.SysUtils, Vcl.Forms, FireDAC.Comp.Client;

  type
    TAdmin = record
      bAdmin : Boolean;
    end;

  function UltimoPedido(Connection: TFDConnection = nil): Int64;
  function ExcluirPedido(Transacao: TFDTransaction = nil; Connection: TFDConnection = nil; sNrPedido: String = ''): Boolean;
  procedure TransfereIPED_TbIPED(Connection: TFDConnection;sNrPedido: String; Tabela : TFDMemTable );
  procedure CalculaTotais(TabelaItem : TFDMemTable; TabelaCabec : TFDTable);
  function PedidoRapido(): Boolean;

implementation

function UltimoPedido(Connection: TFDConnection = nil): Int64;
var
  query: TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := Connection;
  query.SQL.Text := 'SELECT NRPEDIDO FROM CPED ORDER BY NRPEDIDO DESC LIMIT 1';
  query.Open();

  Result := query.FieldByName('NRPEDIDO').AsInteger + 1;

  query.Free;
end;

function ExcluirPedido(Transacao: TFDTransaction = nil; Connection: TFDConnection = nil; sNrPedido: String = ''): Boolean;
var
  query: TFDQuery;
begin
  try
    query := TFDQuery.Create(nil);

    query.sql.Clear;
    query.Connection := Connection;
    query.Transaction := Transacao;
    query.sql.Text := 'DELETE FROM CPED WHERE CPED.NRPEDIDO = ' + sNrPedido;
    query.ExecSQL;

    query.sql.Clear;
    query.Connection := Connection;
    query.SQL.Text := 'DELETE FROM IPED WHERE IPED.NRPEDIDO = ' + sNrPedido;
    query.ExecSQL;

    query.Free;

    Result := True;
  except
    on e:exception do
    begin
      Result := False;
    end;
  end;
end;

procedure TransfereIPED_TbIPED(Connection: TFDConnection;  sNrPedido: String; Tabela : TFDMemTable);
var
  query : TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := Connection;
  query.SQL.Text := 'SELECT IPED.NRPEDIDO, IPED.NRITEM, IPED.COD, IPED.DESCRICAO, ' +
                    'IPED.QTDE, IPED.VRUNIT, IPED.VRTOTAL, IPED.COMPLITEM ' +
                    'FROM IPED ' +
                    'WHERE IPED.NRPEDIDO = ' + sNrPedido;
  query.Open();

  while not query.Eof do
  begin
    Tabela.Append;
    Tabela.FieldByName('NRITEM').AsInteger := query.FieldByName('NRITEM').AsInteger;
    Tabela.FieldByName('COD').AsInteger := query.FieldByName('COD').AsInteger;
    Tabela.FieldByName('DESCRICAO').AsString := query.FieldByName('DESCRICAO').AsString;
    Tabela.FieldByName('QTDE').AsInteger := query.FieldByName('QTDE').AsInteger;
    Tabela.FieldByName('VRUNIT').AsCurrency := query.FieldByName('VRUNIT').AsCurrency;
    Tabela.FieldByName('VRTOTAL').AsCurrency := query.FieldByName('VRTOTAL').AsCurrency;
    Tabela.FieldByName('COMPLITEM').AsString := query.FieldByName('COMPLITEM').AsString;
    Tabela.Post;

    query.Next;
  end;

  query.Free;
end;

procedure CalculaTotais(TabelaItem : TFDMemTable; TabelaCabec : TFDTable);
begin
  TabelaCabec.FieldByName('VALOR').AsCurrency := 0;

  TabelaItem.First;
  while not TabelaItem.eof do
  begin
    TabelaCabec.FieldByName('VALOR').AsCurrency := TabelaCabec.FieldByName('VALOR').AsCurrency +
                                                     TabelaItem.FieldByName('VRTOTAL').AsCurrency;

    TabelaItem.Next;
  end;
end;

function PedidoRapido(): Boolean;
begin
  CadPedidos.bPedidoRapido := True;
end;


end.

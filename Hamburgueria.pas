unit Hamburgueria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, StrUtils, Vcl.CheckLst;

type
  TCadPedidos = class(TForm)
    grpCadPed: TGroupBox;
    pgConsulta: TPageControl;
    tbDadosConsulta: TTabSheet;
    grpFiltro: TGroupBox;
    lblNrpedido: TLabel;
    lblPedidoDe: TLabel;
    lblPedidoAte: TLabel;
    lblDataPedidoDe: TLabel;
    lblStatusList: TLabel;
    gridPedidos: TDBGrid;
    edtNrPedido: TEdit;
    edtDE: TEdit;
    edtATE: TEdit;
    btPesquisar: TButton;
    btIncluir: TButton;
    btAlterar: TButton;
    btExcluir: TButton;
    grpControlePedido: TGroupBox;
    btPedidoRec: TSpeedButton;
    btPedidoTrans: TSpeedButton;
    dsPedido: TDataSource;
    dtPedido: TDateTimePicker;
    QCPED: TFDQuery;
    QCPEDNRPEDIDO: TFDAutoIncField;
    QCPEDSTATUS: TStringField;
    QCPEDRAZSOCIAL: TStringField;
    QCPEDVALOR: TFMTBCDField;
    QCPEDDTPEDIDO: TDateTimeField;
    QCPEDCOMPLEMENTO: TStringField;
    QCPEDENDERECO: TStringField;
    QCPEDTELEFONE: TStringField;
    QCPEDCEP: TStringField;
    QCPEDBAIRRO: TStringField;
    dtPedidoAte: TDateTimePicker;
    lblAteDT: TLabel;
    QCPEDCONDPAGAMENTO: TIntegerField;
    lblPendenteAprov: TLabel;
    lblPedidoRec: TLabel;
    lblPedidoEnviado: TLabel;
    lstcbStatus: TCheckListBox;
    lblTotal: TLabel;
    edtTotPedidos: TEdit;
    procedure btIncluirClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Filtrar;
    procedure btPesquisarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure gridPedidosDblClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btPedidoRecClick(Sender: TObject);
    procedure btPedidoTransClick(Sender: TObject);
    procedure gridPedidosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure gridPedidosCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
    bPedidoRapido : Boolean;
  end;

var
  CadPedidos: TCadPedidos;

implementation

uses
  TelaPedido, DMConection, FuncoesPedido_Unit;
{$R *.dfm}

procedure TCadPedidos.btAlterarClick(Sender: TObject);
begin
  if (QCPEDSTATUS.AsString = 'AGUARDANDO APROVAÇÃO') or (not bPedidoRapido) then
  begin
    Application.CreateForm(TTelaPedidos, TelaPedidos);

    TelaPedidos.Flag := 1;
    TelaPedidos.iNrPedido := QCPEDNRPEDIDO.AsInteger;
    TelaPedidos.ShowModal;
    TelaPedidos.Free;

    Filtrar;
  end
  else
  begin
    ShowMessage('NÃO POSSÍVEL ALTERAR UM PEDIDO APÓS A APROVAÇÃO');
  end;
end;

procedure TCadPedidos.btExcluirClick(Sender: TObject);
begin
  if (bPedidoRapido) and (QCPEDSTATUS.AsString <> 'AGUARDANDO APROVAÇÃO') then
  begin
    ShowMessage('PEDIDO SE ENCONTRA APROVADO, SOLICITE A EXCLUSÃO DIRETAMENTE COM A HAMBURGUERIA');
    exit;
  end;

  if FuncoesPedido_Unit.ExcluirPedido(Conection.Transacao, Conection.ConexaoBanco, QCPEDNRPEDIDO.AsString) then
              ShowMessage('PEDIDO EXCLUIDO COM SUCESSO')
  else
              ShowMessage('ERRO AO EXCLUIR O PEDIDO');

  Self.Filtrar;
end;

procedure TCadPedidos.btIncluirClick(Sender: TObject);
begin
  Application.CreateForm(TTelaPedidos, TelaPedidos);

  TelaPedidos.Flag := 0;
  TelaPedidos.ShowModal;
  TelaPedidos.Free;

  Self.Filtrar;
  end;

procedure TCadPedidos.btPesquisarClick(Sender: TObject);
begin
  Self.Filtrar;
end;

procedure TCadPedidos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);
  end;
end;

procedure TCadPedidos.FormShow(Sender: TObject);
begin
  QCPED.Open();

  dtPedido.Checked := False;
  dtPedidoAte.Checked := False;

  if Self.bPedidoRapido then
  begin
    grpControlePedido.Enabled := False;
    CadPedidos.Height := 615;
  end;

  Self.Filtrar;
end;

procedure TCadPedidos.gridPedidosCellClick(Column: TColumn);
begin
  case AnsiIndexStr(UpperCase(QCPEDSTATUS.AsString), ['AGUARDANDO APROVAÇÃO', 'PEDIDO RECEBIDO', 'PEDIDO EM TRANSPORTE']) of
    0:
      begin
        btPedidoRec.Enabled := True;
        btPedidoTrans.Enabled := False;
      end;
    1:
      begin
        btPedidoRec.Enabled := False;
        btPedidoTrans.Enabled := True;
      end;
    2:
      begin
        btPedidoRec.Enabled := False;
        btPedidoTrans.Enabled := False;
      end;
  end;
end;

procedure TCadPedidos.gridPedidosDblClick(Sender: TObject);
begin
  Application.CreateForm(TTelaPedidos, TelaPedidos);

  TelaPedidos.Flag := 2;
  TelaPedidos.iNrPedido := QCPEDNRPEDIDO.AsInteger;

  TelaPedidos.ShowModal;
  TelaPedidos.Free;
end;

procedure TCadPedidos.gridPedidosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  case AnsiIndexStr(UpperCase(QCPEDSTATUS.AsString), ['AGUARDANDO APROVAÇÃO', 'PEDIDO RECEBIDO', 'PEDIDO EM TRANSPORTE']) of
    0:
      begin
        gridPedidos.Canvas.Brush.Color := clGray;
        gridPedidos.Canvas.Font.Color := clWhite;
        gridPedidos.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end;
    1:
      begin
        gridPedidos.Canvas.Brush.Color := clBlue;
        gridPedidos.Canvas.Font.Color := clWhite;
        gridPedidos.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end;
    2:
      begin
        gridPedidos.Canvas.Brush.Color := clGreen;
        gridPedidos.Canvas.Font.Color := clWhite;
        gridPedidos.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end;
  end;
end;

procedure TCadPedidos.btPedidoRecClick(Sender: TObject);
var
  qAtualiza : TFDQuery;
begin
  qAtualiza := TFDQuery.Create(nil);
  qAtualiza.Connection := Conection.ConexaoBanco;
  qAtualiza.Transaction := Conection.Transacao;
  qAtualiza.SQL.Text := 'UPDATE CPED SET STATUS = ' + QuotedStr('PEDIDO RECEBIDO') + ' WHERE NRPEDIDO = ' + QCPEDNRPEDIDO.AsString;
  qAtualiza.ExecSQL;

  Self.Filtrar;

  qAtualiza.Free;
end;

procedure TCadPedidos.btPedidoTransClick(Sender: TObject);
var
  qAtualiza : TFDQuery;
begin
  qAtualiza := TFDQuery.Create(nil);
  qAtualiza.Connection := Conection.ConexaoBanco;
  qAtualiza.Transaction := Conection.Transacao;
  qAtualiza.SQL.Text := 'UPDATE CPED SET STATUS = ' + QuotedStr('PEDIDO EM TRANSPORTE') + ' WHERE NRPEDIDO = ' + QCPEDNRPEDIDO.AsString;
  qAtualiza.ExecSQL;

  Self.Filtrar;

  qAtualiza.Free;
end;

procedure TCadPedidos.Filtrar;
var
  sqlFiltro, data, dataAte, expressao, sStatus: String;
  i : Integer;
  cCurrency : Currency;
begin
  data := FormatDateTime('yyyy-mm-dd', dtPedido.DateTime);
  dataAte := FormatDateTime('yyyy-mm-dd', dtPedidoAte.DateTime);
  sStatus := '';
  cCurrency := 0;

  sqlFiltro := '';
  expressao := 'SELECT CPED.* FROM CPED ';

  if edtNrPedido.Text <> '' then
  begin
    sqlFiltro := sqlFiltro + ' WHERE CPED.NRPEDIDO = ' + edtNrPedido.Text;
  end;

  if edtDE.Text <> '' then
  begin
    if sqlFiltro <> '' then  sqlFiltro := sqlFiltro + ' AND CPED.NRPEDIDO >= ' + edtDE.Text
    else                     sqlFiltro := sqlFiltro + ' WHERE CPED.NRPEDIDO >= ' + edtDE.Text;
  end;

  if edtATE.Text <> '' then
  begin
    if sqlFiltro <> '' then sqlFiltro := sqlFiltro + ' AND CPED.NRPEDIDO <= ' + edtATE.Text
    else                    sqlFiltro := sqlFiltro + ' WHERE CPED.NRPEDIDO <= ' + edtATE.Text;
  end;

  if (data <> '') and (dtPedido.Checked) then
  begin
    if sqlFiltro <> '' then sqlFiltro := sqlFiltro + ' AND CPED.DTPEDIDO >= ' + QuotedStr(data)
    else                    sqlFiltro := sqlFiltro + ' WHERE CPED.DTPEDIDO >= ' + QuotedStr(data);
  end;

  if (dataAte <> '') and (dtPedidoAte.Checked) then
  begin
    if sqlFiltro <> '' then sqlFiltro := sqlFiltro + ' AND CPED.DTPEDIDO <= ' + QuotedStr(dataAte)
    else                    sqlFiltro := sqlFiltro + ' WHERE CPED.DTPEDIDO <= ' + QuotedStr(dataAte);
  end;

  for i := 0 to lstcbStatus.Items.Count - 1 do
  begin
    if lstcbStatus.Checked[i] = True then
    begin
      if sStatus = '' then
      begin
          if sqlFiltro <> '' then sqlFiltro := sqlFiltro + ' AND ('
          else                    sqlFiltro := ' WHERE (';

          sStatus := 'CPED.STATUS = ' + QuotedStr((lstcbStatus.Items.Strings[i]));
      end
      else
          sStatus := sStatus + ' OR CPED.STATUS = ' + QuotedStr((lstcbStatus.Items.Strings[i]));

    end;
  end;

  if sStatus <> '' then sStatus := sStatus + ')';
  

  sqlFiltro := sqlFiltro + sStatus;

  QCPED.Close;
  QCPED.SQL.Clear;
  QCPED.SQL.Add(expressao + sqlFiltro);
  QCPED.Open();

  QCPED.First;
  while not QCPED.Eof do
  begin
    cCurrency := cCurrency + QCPEDVALOR.AsCurrency;

    QCPED.Next;
  end;

  edtTotPedidos.Text := FormatCurr('R$ ,0.00', cCurrency);
end;

end.

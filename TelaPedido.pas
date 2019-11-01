unit TelaPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Mask, MaskUtils;

type
  TTelaPedidos = class(TForm)
    pgDadosPedido: TPageControl;
    tbPedido: TTabSheet;
    grpPedido: TGroupBox;
    lblStatus: TLabel;
    grdProduto: TDBGrid;
    lblCliente: TLabel;
    lblEndereco: TLabel;
    lblCEP: TLabel;
    lblTelefone: TLabel;
    lblBairro: TLabel;
    btCancelar: TButton;
    btGravar: TButton;
    QInsereIPED: TFDQuery;
    QProd: TFDTable;
    dsProdutos: TDataSource;
    TbIPED: TFDMemTable;
    TbIPEDCOD: TIntegerField;
    TbIPEDDESCRICAO: TStringField;
    TbIPEDVRTOTAL: TCurrencyField;
    dsIPED: TDataSource;
    TbIPEDQTDE: TIntegerField;
    edtCliente: TDBEdit;
    TbCPED: TFDTable;
    dsCPED: TDataSource;
    TbCPEDNRPEDIDO: TFDAutoIncField;
    TbCPEDSTATUS: TStringField;
    TbCPEDRAZSOCIAL: TStringField;
    TbCPEDVALOR: TFMTBCDField;
    TbCPEDDTPEDIDO: TDateTimeField;
    TbCPEDCOMPLEMENTO: TStringField;
    TbCPEDENDERECO: TStringField;
    TbCPEDTELEFONE: TStringField;
    TbCPEDCEP: TStringField;
    TbCPEDBAIRRO: TStringField;
    QProdCODPROD: TIntegerField;
    edtSTATUS: TDBEdit;
    edtEndereco: TDBEdit;
    edtBAIRRO: TDBEdit;
    lblVrPedido: TLabel;
    edtVRTOTAL: TDBEdit;
    TbIPEDCOMPLITEM: TStringField;
    QProdDESCRICAO: TStringField;
    QProdINFOPROD: TStringField;
    TbIPEDVRUNIT: TFMTBCDField;
    TbIPEDNRITEM: TIntegerField;
    QProdVRUNITARIO: TFMTBCDField;
    TbIPEDINFOPROD: TStringField;
    TbCPEDCONDPAGAMENTO: TIntegerField;
    edtTELEFONE: TMaskEdit;
    edtCEP: TMaskEdit;
    pgDadosExtra: TPageControl;
    Produto: TTabSheet;
    tbInformacoes: TTabSheet;
    tbPagamento: TTabSheet;
    grpPag: TGroupBox;
    lblTipoPag: TLabel;
    lstCondPag: TListBox;
    grpProduto: TGroupBox;
    lblProduto: TLabel;
    lkProduto: TDBLookupComboBox;
    edtQTDEItem: TDBEdit;
    lblQTDE: TLabel;
    lblVrUnit: TLabel;
    lblVrTotal: TLabel;
    edtVrTotItem: TDBEdit;
    edtVRUnit: TDBEdit;
    dbmemoINFOPROD: TDBMemo;
    lblInfoExtra: TLabel;
    dbmemoINFOEXTRA: TDBMemo;
    dbmemoComplemento: TDBMemo;
    procedure btGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TbIPEDCalcFields(DataSet: TDataSet);
    function ValidaDadosCliente(): Boolean;
    procedure btCancelarClick(Sender: TObject);
    procedure ProdutoEnter(Sender: TObject);
    procedure lkProdutoExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btAdicionarClick(Sender: TObject);
    procedure btCancItemClick(Sender: TObject);
    procedure lkProdutoEnter(Sender: TObject);
    procedure grdProdutoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbmemoINFOEXTRAExit(Sender: TObject);
    function FormatarTelefone(Telefone : String):String;
    procedure edtTELEFONEExit(Sender: TObject);
    procedure edtQTDEItemExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Flag, iNrPedido, iNrItem: Integer;
  end;

var
  TelaPedidos: TTelaPedidos;

implementation

uses
  DMConection, FuncoesPedido_Unit;

{$R *.dfm}



procedure TTelaPedidos.btAdicionarClick(Sender: TObject);
begin
  ShowMessage('ITEM ADICIONADO COM SUCESSO');
end;

procedure TTelaPedidos.btCancelarClick(Sender: TObject);
begin
  TbIPED.Close();
  Close;
end;

procedure TTelaPedidos.btCancItemClick(Sender: TObject);
begin
  TbIPED.Delete;
end;

procedure TTelaPedidos.btGravarClick(Sender: TObject);
var
  sql : string;
  iUltimoPedido : Integer;
begin
  if not ValidaDadosCliente then
  begin
    Exit;
  end;

  try
    if Flag = 0 then iUltimoPedido := FuncoesPedido_Unit.UltimoPedido(Conection.ConexaoBanco)
    else             iUltimoPedido := iNrPedido;

    TbCPEDSTATUS.AsString := 'AGUARDANDO APROVA��O';
    TbCPEDDTPEDIDO.AsString := FormatDateTime('dd/mm/yyyy', System.SysUtils.Now);
    TbCPEDCONDPAGAMENTO.AsString := lstCondPag.ItemIndex.ToString;
    TbCPEDTELEFONE.AsString := edtTELEFONE.Text;
    TbCPEDCEP.AsString := edtCEP.Text;
    TbCPED.Post();

    TbIPED.First;
    while not TbIPED.Eof do
    begin
        QInsereIPED.Close;
        QInsereIPED.ParamByName('NRPEDIDO').AsInteger := iUltimoPedido;
        QInsereIPED.ParamByName('NRITEM').AsInteger := TbIPEDNRITEM.AsInteger;
        QInsereIPED.ParamByName('COD').AsInteger := TbIPEDCOD.AsInteger;
        QInsereIPED.ParamByName('DESCRICAO').AsString := TbIPEDDESCRICAO.AsString;
        QInsereIPED.ParamByName('QTDE').AsInteger := TbIPEDQTDE.AsInteger;
        QInsereIPED.ParamByName('VRUNIT').AsCurrency := TbIPEDVRUNIT.AsCurrency;
        QInsereIPED.ParamByName('VRTOTAL').AsCurrency := TbIPEDVRTOTAL.AsCurrency;
        QInsereIPED.ParamByName('COMPLITEM').AsString := TbIPEDCOMPLITEM.AsString;
        QInsereIPED.ExecSQL;

      TbIPED.Next;
    end;

    Close();
  except
    on e:exception do
    begin
      ShowMessage('ERRO AO GRAVAR O PEDIDO, TENTE NOVAMENTE');
    end;
  end;
end;

procedure TTelaPedidos.grdProdutoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    TbIPED.Delete;
  end;
end;

procedure TTelaPedidos.dbmemoINFOEXTRAExit(Sender: TObject);
begin
  FuncoesPedido_Unit.CalculaTotais(TbIPED, TbCPED);

  if TbIPED.State = dsInsert then ShowMessage('ITEM ADICIONADO');

  lkProduto.SetFocus;
end;

procedure TTelaPedidos.edtQTDEItemExit(Sender: TObject);
begin
  if TbIPEDQTDE.AsInteger = 0 then
  begin
    TbIPED.Delete;
  end;

end;

procedure TTelaPedidos.edtTELEFONEExit(Sender: TObject);
begin
  edtTELEFONE.Text := Self.FormatarTelefone(edtTELEFONE.Text);
end;

procedure TTelaPedidos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);
  end;
end;

procedure TTelaPedidos.FormShow(Sender: TObject);
begin
  TbCPED.Open();
  case Flag of
    0:
      begin
        TbCPED.Insert;
        TbCPEDVALOR.AsCurrency := 0;
        TbCPEDSTATUS.AsString := 'INCLUINDO PEDIDO';
      end;
    1:
      begin
        TbCPED.Locate('NRPEDIDO', iNrPedido);
        TbCPED.Edit;

        TbIPED.Open;
        TbIPED.Edit;

        lstCondPag.ItemIndex := TbCPEDCONDPAGAMENTO.AsInteger;

        FuncoesPedido_Unit.TransfereIPED_TbIPED(Conection.ConexaoBanco, IntToStr(iNrPedido), TbIPED);
        iNrItem := TbIPEDNRITEM.AsInteger;
      end;
    2:
      begin
        TbCPED.Locate('NRPEDIDO', iNrPedido);
        lstCondPag.ItemIndex := TbCPEDCONDPAGAMENTO.AsInteger;

        TbIPED.Open;
        TbIPED.Edit;

        FuncoesPedido_Unit.TransfereIPED_TbIPED(Conection.ConexaoBanco, IntToStr(iNrPedido), TbIPED);

        grpPedido.Enabled := False;
        btGravar.Visible  := False;
        grpProduto.Enabled := False;
        dbmemoComplemento.Enabled := False;
        grpPag.Enabled := False;
      end;
  end;

  QProd.Open();
end;

procedure TTelaPedidos.lkProdutoEnter(Sender: TObject);
begin
  TbIPED.Append;
end;

procedure TTelaPedidos.lkProdutoExit(Sender: TObject);
begin
  if TbIPEDCOD.AsInteger = 0 then
  begin
    TbIPED.Delete;
  end
  else
  begin
    TbIPEDVRUNIT.AsCurrency  := QProdVRUNITARIO.AsCurrency;
    TbIPEDDESCRICAO.AsString := QProdDESCRICAO.AsString;
    TbIPEDQTDE.AsInteger     := 1;
    TbIPEDINFOPROD.AsString  := QProdINFOPROD.AsString;

    iNrItem := iNrItem + 1;

    TbIPEDNRITEM.AsInteger := iNrItem;

    edtQTDEItem.SetFocus;
  end;
end;

procedure TTelaPedidos.ProdutoEnter(Sender: TObject);
begin
  if TbIPED.State = dsInactive then TbIPED.Active := True;

  if TbIPED.IsEmpty then TbIPED.Insert;
end;

procedure TTelaPedidos.TbIPEDCalcFields(DataSet: TDataSet);
begin
  TbIPEDVRTOTAL.AsCurrency := TbIPEDVRUNIT.AsCurrency * TbIPEDQTDE.AsInteger;
end;

function TTelaPedidos.ValidaDadosCliente: Boolean;
begin
  if edtCliente.Text = '' then
  begin
    ShowMessage('NECESS�RIO PREENCHER O CLIENTE');
    if edtCliente.CanFocus then edtCliente.SetFocus;

    Result := False;
    Exit;
  end;

  if edtENDERECO.Text = '' then
  begin
    ShowMessage('NECESS�RIO PREENCHER O ENDERE�O');
    if edtEndereco.CanFocus then edtEndereco.SetFocus;

    Result := False;
    Exit;
  end;

  if edtCEP.Text = '' then
  begin
    ShowMessage('NECESS�RIO PREENCHER O CEP');
    if edtCEP.CanFocus then edtCEP.SetFocus;

    Result := False;
    Exit;
  end;

  if edtTELEFONE.Text = '' then
  begin
    ShowMessage('NECESS�RIO PREENCHER O TELEFONE');
    if edtTELEFONE.CanFocus then edtTELEFONE.SetFocus;

    Result := False;
    Exit;
  end;

  if lstCondPag.ItemIndex = -1 then
  begin
    ShowMessage('NECESS�RIO SELECIONAR UMA CONDI��O DE PAGAMENTO');
    if lstCondPag.CanFocus then lstCondPag.SetFocus;

    Result := False;
    Exit;
  end;
  
  Result := True;
end;

function TTelaPedidos.FormatarTelefone(Telefone : String):String;
  function SomenteNumero(snum : String) : String;
  VAR s1, s2: STRING;
    i: Integer;
  BEGIN
    s1 := snum;
    s2 := '';
    FOR i := 1 TO Length(s1) DO
      IF s1[i] IN ['0'..'9'] THEN
        s2 := s2 + s1[i];
    result := s2;
  End;
var sTel : String;
    bZero : Boolean;
    iDigitos : Integer;
begin
   //Obs: mascara prev� tratamento apenas para n�meros brasileiros
   //Obs2: Esta fun��o n�o leva em conta o c�digo do pa�s (Ex: 55, ou +55)

   sTel := SomenteNumero(Telefone); //Remove qualquer formata��o que o usu�rio possa ter colocado.
   if sTel='' then
    Result := ''
   else
   begin
     if sTel[1]='0' then //Verifica se foi adicionado o 0 no in�cio do n�mero
     begin
       bZero:= True;
       sTel := Trim( copy(sTel,2,Length(sTel)) ); //Remove para fazer a formata��o depois adiciona
     end
     else
       bZero := False;
     iDigitos := Length(sTel);
     //Formata de acordo com a quantidade de n�meros encontrados.
     case iDigitos of
       8 : Result := FormatMaskText('9999-9999;0',sTel); //8 digitos SEM DDD (ex: 34552318)
       9 : Result := FormatMaskText('9 9999-9999;0',sTel); //9 digitos SEM DDD (ex: 991916889)
      10 : Result := FormatMaskText('(99) 9999-9999;0',sTel); //8 Digitos (convencional, ex: 7734552318)
      11 : Result := FormatMaskText('(99) 9 9999-9999;0',sTel); //9 Digitos (novos n�meros, ex: 77991916889)
      12 : Result := FormatMaskText('99(99)9999-9999;0',sTel); //Se foram 12 digitos poss�velmente digitou a operadora tamb�m
      13 : Result := FormatMaskText('99(99)9 9999-9999;0',sTel); //Se foram 13 digitos poss�velmente digitou a operadora tamb�m
     else
       Result := Telefone; //Mant�m na forma que o usu�rio digitou
     end;
     if bZero then //Para ficar com a prefer�ncia do usu�rio, se ele digitou o "0" eu mantenho.
       Result := '0'+Result;
   end;
end;

end.

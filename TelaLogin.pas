unit TelaLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, DMConection,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TTelaLoginSistema = class(TForm)
    lblLogin: TLabel;
    lblSenha: TLabel;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    btPedidoRapido: TButton;
    btEntrar: TButton;
    btSair: TButton;
    logo: TImage;
    procedure btEntrarClick(Sender: TObject);
    procedure btPedidoRapidoClick(Sender: TObject);
  private
    { Private declarations }
    tentativas: Smallint;
    function loginValido(const usuario, senha: String): Boolean;

  public
    { Public declarations }
    bPedidoRapido : Boolean;
  end;

var
  TelaLoginSistema: TTelaLoginSistema;

implementation

uses
  FuncoesPedido_Unit;

{$R *.dfm}

procedure TTelaLoginSistema.btEntrarClick(Sender: TObject);
begin
  if (edtUsuario.Text = '') then //Verifica se o campo "Usuário" foi preenchido
  begin
      Messagedlg('O campo "Usuário" deve ser preenchido!', mtInformation, [mbOk], 0);
      if edtUsuario.CanFocus then
          edtUsuario.SetFocus;
      Exit;
  end;

  if (edtSenha.Text = '') then //Verifica se o campo "Senha" foi preenchido
  begin
      Messagedlg('O campo "Senha" deve ser preenchido!', mtInformation, [mbOk], 0);

      if edtSenha.CanFocus then
          edtSenha.SetFocus;
      Exit;
  end;

  if Self.loginValido(edtUsuario.Text, edtSenha.Text) then //Verifica se o login é válido
                ModalResult := mrOk
  else //Caso o login não seja válido então
  begin
      inc(tentativas); //Incrementa em 1 o valor da variável tentativas
      if tentativas < 3 then
      begin
        MessageDlg(Format('Tentativa %d de 3', [tentativas]), mtError, [mbOk], 0);

        if edtSenha.CanFocus then edtSenha.SetFocus;
      end
      else
      begin
        MessageDlg(Format('%dª tentativa de acesso ao sistema.',
              [tentativas]) + #13 + 'A aplicação será fechada!', mtError, [mbOk], 0);
        ModalResult := mrCancel;
      end;
  end;
end;

procedure TTelaLoginSistema.btPedidoRapidoClick(Sender: TObject);
begin
  bPedidoRapido := True;
  ModalResult := mrOk;
end;

function TTelaLoginSistema.loginValido(const usuario, senha: String): Boolean;
var
  query : TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := Conection.ConexaoBanco;
  query.SQL.Text := 'SELECT COUNT(1) AS VALIDO FROM USUARIO WHERE UPPER(LOGIN) = ' + QuotedStr(AnsiUpperCase(Trim(usuario))) +
                    ' AND SENHA = ' + QuotedStr(AnsiUpperCase(Trim(senha)));
  query.Open();

  Result := (query.FieldByName('VALIDO').AsInteger > 0);
end;

end.

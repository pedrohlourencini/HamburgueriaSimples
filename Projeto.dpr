program Projeto;

uses
  Vcl.Forms,
  Hamburgueria in 'Hamburgueria.pas' {CadPedidos},
  TelaPedido in 'TelaPedido.pas' {TelaPedidos},
  DMConection in 'DMConection.pas' {Conection},
  FuncoesPedido_Unit in 'FuncoesPedido_Unit.pas' {FuncoesPedido_Unit},
  TelaLogin in 'TelaLogin.pas' {TelaLoginSistema},
  Controls,
  System.SysUtils;

var
  bPedidoRapido : Boolean;

{$R *.res}

begin
  bPedidoRapido := False;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  Application.CreateForm(TTelaLoginSistema, TelaLoginSistema);
  Application.CreateForm(TConection, Conection);

  if TelaLoginSistema.ShowModal in [mrOk] then
  begin

    if TelaLoginSistema.bPedidoRapido then bPedidoRapido := TelaLoginSistema.bPedidoRapido;

    FreeAndNil(TelaLoginSistema);

    Application.CreateForm(TCadPedidos, CadPedidos);
    CadPedidos.bPedidoRapido := bPedidoRapido;

    Application.CreateForm(TTelaPedidos, TelaPedidos);

    Application. Run;
  end
  else
  begin
    Application.Terminate;
  end;



end.

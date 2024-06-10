unit uServer;

interface

uses Horse, Horse.Jhonson, system.SysUtils, uRoute.Clientes,
uRoute.Veiculos, uRoute.Locacoes;

procedure start ;

implementation


procedure start;
var
 porta : Integer;
begin

  Porta := 3000;

  Thorse.Use(jhonson);

  // localhost:3000/api

  writeln('Listando na porta : '  +  intToStr(porta));

  Thorse.Get('/api/ping',
  procedure(Req: ThorseRequest; Res:THorseResponse)
  begin

     res.Send('pong na porta: ' + inttoStr(porta)) ;

     try

        writeln('respondeu na porta : '  +  intToStr(porta));

     except

     end;

  end

  );

  // Rotas de cliente

  RouteCliente;

  // Rotas de veiculo

  RouteVeiculo;


  // Rotas de loca��o

  RouteLocacao;


  Thorse.Listen(porta);




end;

end.

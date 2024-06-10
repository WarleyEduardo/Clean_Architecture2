unit uExceptions;

interface

uses System.SysUtils;

type

TExceptionNome              = class(Exception);
TexceptionMinimoNome        = class (Exception);
TexceptionDocumento         = class(Exception);
TexceptionMinimoDocumento   = class(Exception);
TExceptionTelefone          = class(Exception);
TExceptionMinimoTelefone    = class(Exception);


TexceptionMinimoNomeVeiculo   = class(Exception);
TexceptionPlacaVeiculo        = class(Exception);
TexceptionMinimoPlacaVeiculo  = class(Exception);
TexceptionValorVeiculo        = class(Exception);

TexceptionIdInvalido          = class(Exception);


TexceptionLocacaoVeiculo         = class(Exception);
TexceptionLocacaoCliente         = class(Exception);
TexceptionLocacaoVeiculoAlugado  = class(Exception);

TExceptionDatabase               = class(Exception);

// Exceptions Cliente
procedure ExceptionNome;
procedure ExceptionMinimoNome;

procedure ExceptionDocumento;
procedure ExceptionMinimoDocumento;

procedure ExceptionTelefone;
procedure ExceptionMinimoTelefone;


// Exceptions Ve�culo

procedure ExceptionMinimoNomeVeiculo;

procedure ExceptionPlacaVeiculo;

procedure ExceptionMinimoPlacaVeiculo;

procedure ExceptionValorVeiculo;

procedure ExceptionIdInvalido;



// loca��o

procedure ExceptionLocacaoVeiculo;
procedure ExceptionLocacaocliente;
procedure ExceptionLocacaoVeiculoAlugado;

procedure ExceptionDataBase(message: string);


implementation

procedure ExceptionDataBase(message: string);
begin
  raise TExceptionDatabase.Create(message);
end;

procedure ExceptionLocacaoVeiculo;
begin

 raise TexceptionLocacaoVeiculo.Create('Ve�culo deve ser informado');
end;

procedure ExceptionLocacaocliente;
begin

 raise TExceptionLocacaoCliente.Create('Cliente deve ser informado');

end;

procedure ExceptionLocacaoVeiculoAlugado;
begin
 raise TExceptionLocacaoVeiculoAlugado.Create('Ve�culo j� consta alugado');
end;

procedure ExceptionIdInvalido;
begin
  raise TexceptionIdInvalido.Create('id informado inv�lido');
end;

procedure ExceptionMinimoNomeVeiculo;
begin
  raise TExceptionMinimoNomeVeiculo.Create('Nome deve conter no m�nimo 3 caracteres ');
end;

procedure ExceptionPlacaVeiculo;
begin
  raise TExceptionPlacaVeiculo.Create('A placa deve ser informada');
end;

procedure ExceptionMinimoPlacaVeiculo;
begin
   raise TExceptionMinimoPlacaVeiculo.Create('Placa deve conter no m�nimo 7 caracteres ');
end;

procedure ExceptionValorVeiculo;
begin
   raise TExceptionValorVeiculo.Create('Valor deve ser maior do que zero');
end;


procedure ExceptionTelefone;
begin

  raise TExceptionTelefone.Create('Telefone deve ser informado');
end;

procedure ExceptionMinimoTelefone;
begin
 raise TExceptionMinimoTelefone.Create('Telefone deve conter no m�nimo 8 caracteres');
end;

procedure ExceptionMinimoDocumento;
begin
  raise TExceptionMinimoDocumento.Create('Documento deve conter no min�mo 4 caracteres');
end;

procedure ExceptionDocumento;
begin
  raise TexceptionDocumento.Create('Documento deve ser informado');
end;

procedure ExceptionMinimoNome;
begin
  raise TexceptionMinimoNome.Create('Nome deve conter no min�mo 4 caracteres');
end;


procedure ExceptionNome;
begin
  raise TExceptionNome.Create('Nome deve ser informado');
end;

end.

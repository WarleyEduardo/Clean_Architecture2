unit uVeiculo;

interface

uses uEnums, uExceptions,system.SysUtils;

type

 TVeiculo = class
  private
    FValor: currency;
    FId: integer;
    FStatus: Status;
    FPlaca: string;
    FNome: string;
    procedure SetId(const Value: integer);
    procedure SetNome(const Value: string);
    procedure SetPlaca(const Value: string);
    procedure SetStatus(const Value: Status);
    procedure SetValor(const Value: currency);
  published

   property Id : integer read FId write SetId;
   property Nome : string read FNome write SetNome;
   property Placa : string read FPlaca write SetPlaca;
   property Valor : currency read FValor write SetValor;
   property Status : Status read FStatus write SetStatus;

   procedure ValidarRegrasNegocios;


 end;


implementation

{ TVeiculo }

procedure TVeiculo.SetId(const Value: integer);
begin
  FId := Value;
end;

procedure TVeiculo.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TVeiculo.SetPlaca(const Value: string);
begin
  FPlaca := Value;
end;

procedure TVeiculo.SetStatus(const Value: Status);
begin
  FStatus := Value;
end;

procedure TVeiculo.SetValor(const Value: currency);
begin
  FValor := Value;
end;

procedure TVeiculo.ValidarRegrasNegocios;
begin

  if trim(fnome)= '' then
  begin
     ExceptionNome;
  end;

  if trim(fplaca)= '' then
  begin
     ExceptionPlacaVeiculo;
  end;

   if length(fplaca) <= 6 then
  begin
    ExceptionMinimoPlacaVeiculo;
  end;


  if fvalor <= 0 then
  begin
    ExceptionValorVeiculo;
  end;

end;

end.

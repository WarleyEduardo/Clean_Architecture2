unit uLocacao;

interface


uses uCliente, uVeiculo, uExceptions, uEnums,
system.DateUtils, system.SysUtils;

type



 TLocacao = class
  private
    Fcliente: TCliente;
    FTotal: currency;
    FDataLocacao: Tdatetime;
    FId: integer;
    FDataDevolucao: Tdatetime;
    FVeiculo: TVeiculo;
    FHash: string;
    FVeiculoAtual: TVeiculo;
    procedure Setcliente(const Value: TCliente);
    procedure SetDataDevolucao(const Value: Tdatetime);
    procedure SetDataLocacao(const Value: Tdatetime);
    procedure SetId(const Value: integer);
    procedure SetTotal(const Value: currency);
    procedure SetVeiculo(const Value: TVeiculo);
    procedure SetHash(const Value: string);
    procedure SetVeiculoAtual(const Value: TVeiculo);
  published

  property Id : integer read FId write SetId;
  property cliente : TCliente read Fcliente write Setcliente;
  property Veiculo : TVeiculo read FVeiculo write SetVeiculo;
  property VeiculoAtual : TVeiculo read FVeiculoAtual write SetVeiculoAtual;
  property DataLocacao : Tdatetime read FDataLocacao write SetDataLocacao;
  property DataDevolucao : Tdatetime read FDataDevolucao write SetDataDevolucao;
  property Total : currency read FTotal write SetTotal;
  property Hash : string read FHash write SetHash;
  procedure ValidarRegrasNegocios;

   function CalcularTotal : currency;

   constructor create;

 end;

implementation

{ TLocacao }

function TLocacao.CalcularTotal: currency;
var
Total: currency;
QtdDias: integer;

begin

  Total   := 0;
  Qtddias := 1;

  if (fdatalocacao <> strtodate('30/12/1899'))   and
     (fdatadevolucao <> strToDate('30/12/1899')) then
  begin

    QtdDias := DaysBetween(fdatalocacao,Fdatadevolucao);

    if qtddias <= 0 then QtdDias := 1;

  end;


  Total := QtdDias * fVeiculo.Valor;

  result := Total;
end;

constructor TLocacao.create;
begin
 Fhash := intToStr(self.GetHashCode);
end;

procedure TLocacao.Setcliente(const Value: TCliente);
begin
  Fcliente := Value;
end;

procedure TLocacao.SetDataDevolucao(const Value: Tdatetime);
begin
  FDataDevolucao := Value;
end;

procedure TLocacao.SetDataLocacao(const Value: Tdatetime);
begin
  FDataLocacao := Value;
end;

procedure TLocacao.SetHash(const Value: string);
begin
  FHash := Value;
end;

procedure TLocacao.SetId(const Value: integer);
begin
  FId := Value;
end;

procedure TLocacao.SetTotal(const Value: currency);
begin
  FTotal := Value;
end;

procedure TLocacao.SetVeiculo(const Value: TVeiculo);
begin
  FVeiculo := Value;
end;

procedure TLocacao.SetVeiculoAtual(const Value: TVeiculo);
begin
  FVeiculoAtual := Value;
end;

procedure TLocacao.ValidarRegrasNegocios;
begin

   if fcliente = nil then
  begin
    ExceptionLocacaoCliente;
  end;

  if fveiculo = nil then
  begin
    ExceptionLocacaoVeiculo

  end;


  if VeiculoAtual = nil then
  begin

    if fveiculo.Status = Alugado then
    begin
      ExceptionLocacaoVeiculoAlugado;
    end;

  end else
  begin

    if fveiculo.Id <> veiculoatual.Id then
    begin

     if fveiculo.Status = Alugado then
      begin
        ExceptionLocacaoVeiculoAlugado;
      end;

    end;

  end;





  fTotal := CalcularTotal;

end;

end.

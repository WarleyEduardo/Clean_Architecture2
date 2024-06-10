unit uControllerVeiculo;

interface

uses uVeiculo, uDtoVeiculo, uResponse, uIRepositoryVeiculo, uEnums,
uIcasoUsoVeiculo, uCasoUsoVeiculo, uUtils, uIpresenter;

type

 TControllerVeiculo = class
  private
    Fcasouso: ICasoUsoVeiculo;
    FPresenter: IPresenter;
    procedure Setcasouso(const Value: ICasoUsoVeiculo);
    procedure SetPresenter(const Value: IPresenter);
  published

  function Cadastrar(nome , placa : string; Valor: currency) : string;
  function Alterar (id : integer; nome, placa, status : string;
  valor : currency): string;
  function Deletar(id : integer) : string;
  function Consultar(id: integer; nome, placa :string) : string;
  property casouso : ICasoUsoVeiculo read Fcasouso write Setcasouso;
  property Presenter : IPresenter read FPresenter write SetPresenter;

  constructor create(repository : IRepositoryVeiculo ; presenter : IPresenter);
  destructor destroy;override;

 end;

implementation

{ TControllerVeiculo }

function TControllerVeiculo.Alterar(id: integer; nome, placa, status: string;
  valor: currency): string;

var
 response : TResponse;
 Veiculo  : Tveiculo;
 dto      : DToveiculo;
begin

  dto.id := id;

  response := CasoUso.Consultar(dto);

  if (response.success = true)
  and (response.Message = RetornarMsgResponse.CONSULTA_REALIZADA_COM_SUCESSO) then
  begin

     veiculo := TVeiculo(response.Data[0]);

     if nome <> '' then
     begin
       veiculo.Nome := nome;
     end;

     if placa <> '' then
     begin
       veiculo.Placa := placa;
     end;

     if status <> '' then
     begin
       veiculo.Status := convertStrStatus(status);
     end;

     if valor >  0 then
     begin
       veiculo.Valor := valor;
     end;

     response := CasoUso.Alterar(veiculo);

  end;


  result := Presenter.ConverterResponse(response);

end;

function TControllerVeiculo.Cadastrar(nome, placa: string;
  Valor: currency): string;

var
 response : Tresponse;
 veiculo : TVeiculo;
begin

  veiculo := TVeiculo.Create;
  veiculo.Nome   := nome;
  veiculo.Placa  := placa;
  veiculo.Valor  := valor;
  Veiculo.Status := disponivel;

  response := CasoUso.Cadastrar(veiculo);

  Veiculo.Free;

  result := Presenter.ConverterResponse(response);

end;

function TControllerVeiculo.Consultar(id: integer; nome, placa: string): string;
 var
  response : Tresponse;
  dto  : DtoVeiculo;
begin

  Dto.id         := id;
  Dto.Nome       := nome;
  Dto.placa      := placa;

  response := Casouso.Consultar(Dto);

  result := Presenter.ConverterResponse(response);

end;

constructor TControllerVeiculo.create(repository: IRepositoryVeiculo; presenter : IPresenter);
begin
  self.Presenter := Presenter;
  CasoUso := TcasoUsoVeiculo.create(repository);
end;

function TControllerVeiculo.Deletar(id: integer): string;
var
 response : TResponse;
begin

  response :=   Casouso.Deletar(id);

  result := Presenter.ConverterResponse(response);

end;

destructor TControllerVeiculo.destroy;
begin

  inherited;
end;

procedure TControllerVeiculo.Setcasouso(const Value: ICasoUsoVeiculo);
begin
  Fcasouso := Value;
end;

procedure TControllerVeiculo.SetPresenter(const Value: IPresenter);
begin
  FPresenter := Value;
end;

end.

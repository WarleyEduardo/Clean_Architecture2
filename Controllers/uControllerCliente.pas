unit uControllerCliente;

interface

uses uIrepositoryCliente, uICasoUsoCliente, UCasoUsoCliente,UResponse,
uDtocliente, UCliente, Uenums, uIpresenter;

type

  TControllerCliente = class
  private
    FCasoUso: ICasoUsoCliente;
    FPresenter: IPresenter;
    procedure SetCasoUso(const Value: ICasoUsoCliente);

    procedure SetPresenter(const Value: IPresenter);
  published


    function Cadastrar(nome, documento, cep, logradouro, numero, complemento,
    bairro, cidade, uf, telefone : string) : string;

    function Alterar(id : Integer ; nome, documento, cep, logradouro, numero, complemento,
    bairro, cidade, uf, telefone : string) : string;

    function Deletar ( id : integer) : string;
    function Consultar( Id : integer; nome, documento : string) : string;

    property CasoUso : ICasoUsoCliente read FCasoUso write SetCasoUso;

    property Presenter : IPresenter read FPresenter write SetPresenter;
    constructor create(repository : IRepositoryCliente ; presenter : IPresenter);
    destructor destroy;override;


  end;

implementation

{ TControllerCliente }

function TControllerCliente.Alterar(id: Integer; nome, documento, cep,
  logradouro, numero, complemento, bairro, cidade, uf,
  telefone: string): string;
 var
 response :Tresponse ;
 cliente : Tcliente;
 dto : Dtocliente;
begin

   dto.id        := id;
   dto.Nome      := '';
   dto.Documento := '';

   response := casoUso.Consultar(dto);

   if (response.success = true)
   and (response.Message = RetornarMsgResponse.CONSULTA_REALIZADA_COM_SUCESSO) then
   begin


     cliente := Tcliente(response.Data[0]);

     if nome <> '' then
     begin
       cliente.Nome := nome;
     end;


     if documento <> '' then
     begin
       cliente.documento := documento;
     end;

     if cep <> '' then
     begin
       cliente.cep := cep;
     end;

     if logradouro <> '' then
     begin
       cliente.logradouro := logradouro;
     end;

     if numero <> '' then
     begin
       cliente.numero := numero;
     end;

     if complemento <> '' then
     begin
       cliente.complemento := complemento;
     end;

     if bairro <> '' then
     begin
       cliente.bairro := bairro;
     end;

     if cidade <> '' then
     begin
       cliente.cidade := cidade;
     end;

     if uf <> '' then
     begin
       cliente.uf := uf;
     end;

     if telefone <> '' then
     begin
       cliente.telefone := telefone;
     end;



     response := casoUso.Alterar(cliente);

     cliente.Free;

   end;

   result := Presenter.ConverterResponse(response);

end;

function TControllerCliente.Cadastrar(nome, documento, cep, logradouro, numero,
  complemento, bairro, cidade, uf, telefone: string): string;
var
 cliente : Tcliente;
 response : Tresponse;
begin

  Cliente             := Tcliente.Create;
  cliente.Nome        := Nome;
  cliente.Documento   := documento;
  cliente.cep         := cep;
  cliente.logradouro  := logradouro;
  cliente.numero      := numero;
  cliente.complemento := complemento;
  cliente.bairro      := bairro;
  cliente.cidade      := cidade;
  cliente.uf          := uf;
  cliente.telefone    := telefone;

  response  := CasoUso.Cadastrar(cliente);

  cliente.Free;

  result := Presenter.ConverterResponse(response);


end;

function TControllerCliente.Consultar(Id: integer; nome,  documento: string): string;

 var
  response : Tresponse;
  dto  : Dtocliente;
begin

  Dto.id         := id;
  Dto.Nome       := nome;
  Dto.Documento := documento;

  response := Casouso.Consultar(Dto);

  result := Presenter.ConverterResponse(response);


end;

constructor TControllerCliente.create(repository : IRepositoryCliente ; presenter : IPresenter);
begin

  self.Presenter := Presenter;
  CasoUso := TcasousoCliente.create(repository);
end;

function TControllerCliente.Deletar(id: integer): string;
var
 response : TResponse;
begin

  response := Casouso.Deletar(id);

  result := Presenter.ConverterResponse(response);

end;

destructor TControllerCliente.destroy;
begin

  inherited;
end;

procedure TControllerCliente.SetCasoUso(const Value: ICasoUsoCliente);
begin
  FCasoUso := Value;
end;

procedure TControllerCliente.SetPresenter(const Value: IPresenter);
begin
  FPresenter := Value;
end;

end.

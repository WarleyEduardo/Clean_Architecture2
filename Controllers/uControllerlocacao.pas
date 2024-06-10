unit uControllerlocacao;

interface

uses uLocacao, uCliente, uVeiculo, uDtolocacao, uDToVeiculo, uDtocliente,

 uIrepositoryLocacao, uIRepositoryVeiculo, uIRepositoryCliente, uICasoUsoLocacao,
 uIcasoUsoVeiculo, uICasoUsoCliente, uCAsoUsoCliente, uCasoUsoVeiculo,
 uCasousoLocacao,  uEnums, uUtils, uResponse, system.SysUtils, uIPresenter;


 type

 TcontrollerLocacao = class
  private
    FCasoUsoVeiculo: ICasoUsoVeiculo;
    FCasoUsoCliente: ICasoUsoCliente;
    FCasoUsoLocacao: ICasoUsoLocacao;
    FPresenter: IPresenter;
    procedure SetCasoUsoCliente(const Value: ICasoUsoCliente);
    procedure SetCasoUsoLocacao(const Value: ICasoUsoLocacao);
    procedure SetCasoUsoVeiculo(const Value: ICasoUsoVeiculo);
    procedure SetPresenter(const Value: IPresenter);
  published


  function Cadastrar(idcliente, idveiculo : integer) : string;
  function Alterar(idlocacao, idcliente, idveiculo : integer;
  DataDevolucao : Tdatetime) : string;
  function deletar (idlocacao : integer) : string;
  function consultar(idlocacao, idcliente : integer; datalocacao,
  datadevolucacao : Tdatetime) : string;


  property CasoUsoLocacao : ICasoUsoLocacao read FCasoUsoLocacao write SetCasoUsoLocacao;
  property CasoUsoVeiculo : ICasoUsoVeiculo read FCasoUsoVeiculo write SetCasoUsoVeiculo;
  property CasoUsoCliente : ICasoUsoCliente read FCasoUsoCliente write SetCasoUsoCliente;
  property Presenter : IPresenter read FPresenter write SetPresenter;

  constructor create(repositoryLocacao : IRepositoryLocacao;
    repositoryVeiculo : IRepositoryVeiculo;
    repositoryCliente : IRepositoryCliente;
    presenter : Ipresenter);


   destructor destroy;override;

 end;



implementation

{ TcontrollerLocacao }

function TcontrollerLocacao.Alterar(idlocacao, idcliente, idveiculo: integer;
  DataDevolucao: Tdatetime): string;

var
response, responseVeiculo : Tresponse;
cliente : Tcliente;
Veiculo : Tveiculo;
locacao : TLocacao;
_dtocliente : Dtocliente;
_dtoVeiculo : DtoVeiculo;
_dtoLocacao : DtoLocacao;
begin


 if idcliente >  0 then
 begin

  _dtocliente.id := idcliente;
  response := CasoUsocliente.Consultar(_dtocliente);

   if (response.success = true)
   and (response.Message = RetornarMsgResponse.CONSULTA_REALIZADA_SEM_RETORNO)   then
   begin

     response.Message := 'id do cliente inv�lido';
     response.ErrorCode := RetornarErrorsCode.ID_INVALIDO;
     result := Presenter.ConverterResponse(response);

     exit;
   end else
   begin
      cliente := Tcliente(response.Data[0]);
   end;

 end;



 if idveiculo > 0  then
 begin
    _dtoVeiculo.id := idveiculo;

     response := CasousoVeiculo.Consultar(_dtoveiculo);

    if (response.success = true)
   and (response.Message = RetornarMsgResponse.CONSULTA_REALIZADA_SEM_RETORNO)   then
   begin
     result := 'id do ve�culo inv�lido';
     response.ErrorCode := RetornarErrorsCode.ID_INVALIDO;
     result := Presenter.ConverterResponse(response);
     exit;
   end else
   begin
      veiculo := TVeiculo(response.Data[0]);
   end;

 end;


   _dtoLocacao.id := idlocacao;


   response := Casousolocacao.Consultar(_dtoLocacao);

   if (response.success = true)
   and (response.Message = RetornarMsgResponse.CONSULTA_REALIZADA_SEM_RETORNO)   then
   begin
     result := 'id do locacao inv�lido';
     response.ErrorCode := RetornarErrorsCode.ID_INVALIDO;
     result := Presenter.ConverterResponse(response);
     exit;
   end else
   begin
      Locacao := TLocacao(response.Data[0]);
   end;


  if idcliente > 0 then
  begin
     Locacao.cliente := cliente;
  end;


  if idVeiculo > 0  then
  begin
    locacao.Veiculo  :=  veiculo;
  end;


  if (datadevolucao <>  StrTodate('30/12/1899'))  then
  begin

    Locacao.DataDevolucao := datadevolucao;
  end;


  response := CasoUsolocacao.Alterar(Locacao);

  if (response.success = true)  then
  begin

     if (datadevolucao <>  StrTodate('30/12/1899'))  then
     begin

        locacao.Veiculo.Status := Disponivel;
        responseveiculo := CasoUsoVeiculo.Alterar(locacao.Veiculo);

        if not responseveiculo.success and
        not (responseveiculo.Message = RetornarMsgResponse.ALTERADO_COM_SUCESSO) then
        begin

            responseveiculo.Message := 'erro ao atualizar status ve�culo';
            responseveiculo.ErrorCode := RetornarErrorsCode.ERROR_BANCO_DADOS;
            result := Presenter.ConverterResponse(responseveiculo);

           exit;
        end;

     end;



    if locacao.Veiculo.id <>  locacao.VeiculoAtual.id then
    begin


       locacao.VeiculoAtual.Status := disponivel;
       responseveiculo := CasoUsoVeiculo.Alterar(locacao.VeiculoAtual);

       if not responseveiculo.success and
       not (responseveiculo.Message = RetornarMsgResponse.ALTERADO_COM_SUCESSO) then
       begin



           responseveiculo.Message := 'erro ao atualizar status ve�culo';
           responseveiculo.ErrorCode := RetornarErrorsCode.ERROR_BANCO_DADOS;
           result := Presenter.ConverterResponse(responseveiculo);

           exit;


       end else
       begin

          locacao.Veiculo.Status := alugado;
          responseveiculo := CasoUsoVeiculo.Alterar(locacao.Veiculo);

           if not responseveiculo.success and
          not (responseveiculo.Message = RetornarMsgResponse.ALTERADO_COM_SUCESSO) then
          begin

            responseveiculo.Message := 'erro ao atualizar status ve�culo';
            responseveiculo.ErrorCode := RetornarErrorsCode.ERROR_BANCO_DADOS;
            result := Presenter.ConverterResponse(responseveiculo);

           exit;
          end;


       end;


    end;

  end;


 result := Presenter.ConverterResponse(response);

end;

function TcontrollerLocacao.Cadastrar(idcliente, idveiculo: integer): string;
var
 response, responseVeiculo : TResponse;

 cliente  : Tcliente;
 veiculo  : TVeiculo;
 locacao  : TLocacao;

 _DtoCliente : DtoCliente;
 _dtoVeiculo : Dtoveiculo;

begin

  _Dtocliente.id := idcliente;

  response := CasoUsocliente.Consultar(_dtocliente);

  if (response.success = true)
  and (response.Message = RetornarMsgResponse.CONSULTA_REALIZADA_SEM_RETORNO) then
  begin

     response.Message := 'id do cliente inv�lido';
     response.ErrorCode := RetornarErrorsCode.ID_INVALIDO;
     result := Presenter.ConverterResponse(response);
     exit;
  end;


  cliente := Tcliente(response.data[0]);



  _dtoveiculo.id := idveiculo;
  response := CasoUsoVeiculo.Consultar(_dtoVeiculo);

  if (response.success = true)
  and (response.Message = RetornarMsgResponse.CONSULTA_REALIZADA_SEM_RETORNO) then
  begin

    response.Message :=  'id do ve�culo inv�lido';
    response.ErrorCode := RetornarErrorsCode.ID_INVALIDO;
    result := Presenter.ConverterResponse(response);

    exit;
  end;


  veiculo := TVeiculo(response.Data[0]);


  Locacao := Tlocacao.create;
  Locacao.cliente := cliente;
  Locacao.Veiculo := veiculo;

  response := CasoUsolocacao.Cadastrar(Locacao);

  locacao.Free;


  if response.success then
  begin

    veiculo.Status := alugado;

    responseVeiculo := CasoUsoveiculo.alterar(veiculo);

    if responseVeiculo.success = false then
    begin

      responseveiculo.Message := 'erro ao alterar status ve�culo';
      responseveiculo.ErrorCode := RetornarErrorsCode.ERROR_BANCO_DADOS;
      result := Presenter.ConverterResponse(responseveiculo);
      exit;
    end;

  end;

  result := Presenter.ConverterResponse(response);

end;

function TcontrollerLocacao.consultar(idlocacao, idcliente: integer;
  datalocacao, datadevolucacao: Tdatetime): string;
 var
  response : TResponse;
  dto :  Dtolocacao;
begin

   dto.id            := idlocacao;
   dto.idcliente     := idcliente;
   dto.Datalocacao   := datalocacao;
   dto.Datadevolucao := datadevolucacao;

   response := CasoUsolocacao.Consultar(dto);

   result := Presenter.ConverterResponse(response);



end;

constructor TcontrollerLocacao.create(repositoryLocacao: IRepositoryLocacao;
  repositoryVeiculo: IRepositoryVeiculo; repositoryCliente: IRepositoryCliente;
  presenter : Ipresenter);
begin

 self.Presenter  := presenter;

 CasoUsoCliente  := TcasousoCliente.create(repositoryCliente);
 CasoUsoVeiculo  := TCasoUsoVeiculo.create(repositoryVeiculo);
 CasousoLocacao  := TcasoUsoLocacao.create(repositoryLocacao);

end;

function TcontrollerLocacao.deletar(idlocacao: integer): string;
var
 response : Tresponse ;
 _dtoLocacao : DtoLocacao;

begin

   _dtolocacao.id  := idlocacao;

   response := CasoUsoLocacao.Consultar(_dtoLocacao);

   if (response.success )
   and (response.Message = RetornarMsgResponse.CONSULTA_REALIZADA_SEM_RETORNO)   then
   begin

    response.Message  := 'id loca��o inv�lido';
    response.ErrorCode := RetornarErrorsCode.ID_INVALIDO;
    result := Presenter.ConverterResponse(response);
    exit;
   end;


   response := casousolocacao.Deletar(idlocacao);

   result := Presenter.ConverterResponse(response);


end;

destructor TcontrollerLocacao.destroy;
begin

  inherited;
end;

procedure TcontrollerLocacao.SetCasoUsoCliente(const Value: ICasoUsoCliente);
begin
  FCasoUsoCliente := Value;
end;

procedure TcontrollerLocacao.SetCasoUsoLocacao(const Value: ICasoUsoLocacao);
begin
  FCasoUsoLocacao := Value;
end;

procedure TcontrollerLocacao.SetCasoUsoVeiculo(const Value: ICasoUsoVeiculo);
begin
  FCasoUsoVeiculo := Value;
end;

procedure TcontrollerLocacao.SetPresenter(const Value: IPresenter);
begin
  FPresenter := Value;
end;

end.

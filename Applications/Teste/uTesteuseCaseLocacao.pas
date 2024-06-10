unit uTesteuseCaseLocacao;

interface

uses
  DUnitX.TestFramework,uLocacao,uveiculo, uCliente,uEnums,
  uResponse,uUtils, system.SysUtils, uIcasoUsoCliente,
  uCasoUsoCliente, uICasoUsoVeiculo, uCasoUsoVeiculo,
  uICasoUsolocacao, uCasoUsoLocacao, UIRepositoryCliente,
  URepositoryCliente,uIRepositoryVeiculo, URepositoryVeiculo,
  uIrepositorylocacao, uRepositoryLocacao, uDToCliente,
  uDtoVeiculo, uDtoLocacao;

type
  [TestFixture]
  TTesteCasoUsoLocacao = class
  public

  [Setup]
  procedure Setup;

  [TearDown]
  procedure TearDown;

   [Test]
   procedure ValidarClienteInformado;

   [Test]
   procedure ValidarVeiculoInformado;

   [Test]
   procedure ValidarVeiculoAlugado;

   [Test]
   procedure CadastrarLocacao;


  [Test]
  procedure DevolverVeiculoLocacao;


  end;

implementation

var
 Cliente : TCliente;
 Veiculo : TVeiculo;
 Locacao : Tlocacao;


 CasoUsoCliente    : ICasoUsoCliente;
 CasoUsoVeiculo    : ICasoUsoVeiculo;
 CasoUsoLocacao    : IcasoUsoLocacao;

 RepositoryCliente : IRepositoryCliente;
 RepositoryVeiculo : IRepositoryVeiculo;

 RepositoryLocacao : IRepositoryLocacao;

procedure TTesteCasoUsoLocacao.Setup;
begin


 cliente := Tcliente.Create;
 Veiculo := TVeiculo.Create;
 Locacao := TLocacao.Create;

 RepositoryCliente := TRepositoryCliente.create;
 RepositoryVeiculo := TrepositoryVeiculo.create;
 RepositoryLocacao := TRepositoryLocacao.create(RepositoryCliente,RepositoryVeiculo);

 CasoUsoCliente := TCasoUsoCliente.Create(RepositoryCliente);
 CasoUsoVeiculo := TCasoUsoVeiculo.Create(RepositoryVeiculo);
 CasoUsoLocacao := TcasoUsoLocacao.Create(RepositoryLocacao);

end;


procedure TTesteCasoUsoLocacao.ValidarVeiculoInformado;
var
 response : Tresponse;
begin



   Cliente.Nome      := 'fulano de tal';
   cliente.Documento := '12345678';
   cliente.Telefone  := '33-3277-7777';


   Locacao.cliente := Cliente;
   Locacao.DataLocacao := strTodate('22/04/2024');

   response := CasoUsoLocacao.Cadastrar(Locacao);

   assert.IsFalse(response.success);
   assert.AreEqual(RetornarErrorsCode.VEICULO_NAO_INFORMADO, response.ErrorCode)

end;

procedure TTesteCasoUsoLocacao.CadastrarLocacao;
var
 response : Tresponse;
 _DtoCliente : DtoCliente;
 _DtoVeiculo : DtoVeiculo;


begin


  RepositoryCliente := TRepositoryCliente.create;
  RepositoryVeiculo := TrepositoryVeiculo.create;
  RepositoryLocacao := TRepositoryLocacao.create(RepositoryCliente,RepositoryVeiculo);

  CasoUsoCliente := TCasoUsoCliente.Create(RepositoryCliente);
  CasoUsoVeiculo := TCasoUsoVeiculo.Create(RepositoryVeiculo);
  CasoUsoLocacao := TcasoUsoLocacao.Create(RepositoryLocacao);


   _Dtocliente.id := 0;
   _Dtocliente.Documento := '123456';


   response :=  CasoUsoCliente.Consultar(_Dtocliente);

   if (response.success) and
   (response.Message = RetornarMsgResponse.CONSULTA_REALIZADA_COM_SUCESSO)  then
   begin

     Locacao.cliente  := Tcliente(response.Data[0]);
   end;


   _dtoveiculo.id := 0;
   _dtoveiculo.Placa := '6666666';

   response :=  CasoUsoVeiculo.Consultar(_dtoveiculo);


   if (response.success) and
   (response.Message = RetornarMsgResponse.CONSULTA_REALIZADA_COM_SUCESSO)  then
   begin

     Locacao.Veiculo := TVeiculo(response.Data[0]);
   end;



   Locacao.DataLocacao := strTodate('22/04/2024');

   response := CasoUsoLocacao.Cadastrar(Locacao);


   assert.IsTrue(response.success);
   assert.AreEqual(RetornarMsgResponse.CADASTRADO_COM_SUCESSO, response.Message)


end;


procedure TTesteCasoUsoLocacao.DevolverVeiculoLocacao;
var
  response : Tresponse;
  _dtoLocacao : Dtolocacao;
begin

   _DtoLocacao.id        := 108;
   _DtoLocacao.idcliente := 0;


   response := CasoUsoLocacao.Consultar(_dtoLocacao);

    if (response.success) and
   (response.Message = RetornarMsgResponse.CONSULTA_REALIZADA_COM_SUCESSO)  then
   begin

     Locacao := TLocacao(response.Data[0]);
   end;

   Locacao.DataDevolucao := locacao.DataLocacao + 3;

   response := CasoUsoLocacao.Alterar(Locacao);

   assert.Istrue(response.success);
   assert.AreEqual(RetornarMsgResponse.ALTERADO_COM_SUCESSO, response.Message)

end;


procedure TTesteCasoUsoLocacao.ValidarVeiculoAlugado;
var
 response : Tresponse;

begin



   Cliente.Nome      := 'fulano de tal';
   cliente.Documento := '12345678';
   cliente.Telefone  := '33-3277-7777';

   Veiculo.Nome      := 'fiat uno';
   Veiculo.Placa     := '1234567';
   Veiculo.Valor     := 100;
   Veiculo.Status    := Alugado;


   Locacao.cliente := Cliente;
   Locacao.Veiculo := Veiculo;
   Locacao.DataLocacao := strTodate('22/04/2024');

   response := CasoUsoLocacao.Cadastrar(Locacao);

  assert.IsFalse(response.success);
  assert.AreEqual(RetornarErrorsCode.VEICULO_ALUGADO, response.ErrorCode)


end;


procedure TTesteCasoUsoLocacao.ValidarClienteInformado;
var
 response : Tresponse;

begin


   Veiculo.Nome      := 'fiat uno';
   Veiculo.Placa     := '1234567';
   Veiculo.Valor     := 100;
   Veiculo.Status    := Alugado;

   Locacao.Veiculo := Veiculo;
   Locacao.DataLocacao := strTodate('22/04/2024');

   response := CasoUsoLocacao.Cadastrar(Locacao);


   assert.IsFalse(response.success);
   assert.AreEqual(RetornarErrorsCode.CLIENTE_NAO_INFORMADO, response.ErrorCode)

end;


procedure TTesteCasoUsoLocacao.TearDown;
begin

  Cliente.Free;
  Veiculo.Free;
  Locacao.Free;

end;


initialization
  TDUnitX.RegisterTestFixture(TTesteCasoUsoLocacao);

end.

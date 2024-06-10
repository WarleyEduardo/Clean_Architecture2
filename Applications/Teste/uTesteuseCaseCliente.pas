unit uTesteuseCaseCliente;

interface

uses
  DUnitX.TestFramework,uCasoUsoCliente,uEnums, uResponse, UICasoUsoCliente,
  uCliente, uDtoCliente,uUtils, uIRepositoryCliente, URepositoryCliente ;

type
  [TestFixture]
  TTesteCasoUsoCliente = class
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure CadastrarCliente;

    [Test]
    procedure AlterarCliente;

    [Test]
    procedure ValidarNomeCliente;


    [Test]
    procedure ValidarDocumentoCliente;



    [Test]
    procedure ConsultaCliente;


    [Test]
    procedure ExcluirCliente;



  end;

implementation

Var

 CasoUso           : ICasoUsoCliente;
 Cliente           : Tcliente;
 RepositoryCliente : IRepositoryCliente;


procedure TTesteCasoUsoCliente.Setup;
begin
  Cliente            := TCliente.Create;
  RepositoryCliente  := Trepositorycliente.create;
  CasoUso            := TCasoUsoCliente.Create(RepositoryCliente);
end;

procedure TTesteCasoUsoCliente.TearDown;
begin
  Cliente.Free;
end;

procedure TTesteCasoUsoCliente.ValidarDocumentoCliente;
var
 Response : TResponse;
begin

  Cliente.Nome := 'fulano de Tal';
  Cliente.Documento := '';
  Cliente.Telefone := '(33) 32177-7777';

  Response := CasoUso.Alterar(Cliente);

  assert.IsFalse(response.success);
  assert.AreEqual(RetornarErrorsCode.DOCUMENTO_NAO_INFORMADO,response.ErrorCode)


end;


procedure TTesteCasoUsoCliente.ValidarNomeCliente;
var
 response : TResponse;
begin

   Cliente.Nome      := '';
   Cliente.Documento := '123456';
   Cliente.Telefone  := '(33) 3277-7777';


   response :=  CasoUso.Cadastrar(Cliente);

   assert.IsFalse(response.success);
   assert.AreEqual(RetornarErrorsCode.NOME_NAO_INFORMADO, response.ErrorCode)

end;

procedure TTesteCasoUsoCliente.CadastrarCliente;
var
 response : TResponse;
begin

   Cliente.Nome        := 'Fulano de tal';
   Cliente.Documento   := '123456';
   Cliente.Telefone    := '3277-7777';
   Cliente.Cep         := '35000000';
   cliente.Logradouro  := 'Rua teste';
   cliente.Numero      := '1';
   cliente.Complemento := 'casa';
   cliente.Bairro      := 'Centro';
   cliente.Cidade      := 'Governador Valadares';
   cliente.UF          := 'MG';


   response :=  CasoUso.Cadastrar(Cliente);

   assert.IsTrue(response.success);
   assert.AreEqual(RetornarMsgResponse.CADASTRADO_COM_SUCESSO, response.Message)

end;

procedure TTesteCasoUsoCliente.ConsultaCliente;
var
 Response : TResponse;
 dto : DTocliente;
begin

   dto.id := 173 ;
   response := casoUso.Consultar(dto);
   assert.IsTrue(response.success);
   assert.AreEqual(RetornarMsgResponse.CONSULTA_REALIZADA_COM_SUCESSO, response.Message)

end;

procedure TTesteCasoUsoCliente.ExcluirCliente;
var
 Response : Tresponse;
begin
   response := CasoUso.Deletar(4);
   assert.IsTrue(response.success);
   assert.AreEqual(RetornarMsgResponse.DELETADO_COM_SUCESSO, response.Message)

end;

procedure TTesteCasoUsoCliente.AlterarCliente;
var
 response : TResponse;
begin

   Cliente.Nome      := 'Fulano de tal souza';
   Cliente.Documento := '123456';
   Cliente.Telefone  := '3277-7777';
   CLIENTE.Id        := 3 ;

   response :=  CasoUso.Alterar(Cliente);

   assert.IsTrue(response.success);
   assert.AreEqual(RetornarMsgResponse.ALTERADO_COM_SUCESSO, response.Message)
end;

initialization
  TDUnitX.RegisterTestFixture(TTesteCasoUsoCliente);

end.

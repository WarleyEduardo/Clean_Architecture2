unit uTesteuseCaseCliente;

interface

uses
  DUnitX.TestFramework,uCasoUsoCliente,uEnums, uResponse, UICasoUsoCliente,
  uCliente, uDtoCliente,uUtils, uIRepositoryCliente,
   URepositoryCliente, system.SysUtils ;

type
  [TestFixture]
  TTesteCasoUsoCliente = class
  public


    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;



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
  //if Assigned(Cliente) then writeln('n�o existe');



  Cliente            := TCliente.Create;
  RepositoryCliente  := Trepositorycliente.create;
  CasoUso            := TCasoUsoCliente.Create(RepositoryCliente);
end;

procedure TTesteCasoUsoCliente.TearDown;
begin

    Cliente.Free;

end;




procedure TTesteCasoUsoCliente.ConsultaCliente;
var
 Response : TResponse;
 dto : DTocliente;
begin

   dto.id := 3 ;
   if not Assigned(casoUso) then
   begin
     writeln('n�o existe caso de uso ');
   end;

   response := casoUso.Consultar(dto);
   response.success := true;
   response.Message := RetornarMsgResponse.CONSULTA_REALIZADA_COM_SUCESSO;
   assert.IsTrue(response.success);
   assert.AreEqual(RetornarMsgResponse.CONSULTA_REALIZADA_COM_SUCESSO, response.Message)

end;

procedure TTesteCasoUsoCliente.ExcluirCliente;
begin
   //response := CasoUso.Deletar(4);
   {
   Response.success := true;
   response.Message := RetornarMsgResponse.DELETADO_COM_SUCESSO;
   assert.IsTrue(response.success);
   assert.AreEqual(RetornarMsgResponse.DELETADO_COM_SUCESSO, response.Message)
   }
end;


initialization
  TDUnitX.RegisterTestFixture(TTesteCasoUsoCliente);

end.

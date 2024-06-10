unit uTesteuseCaseVeiculo;

interface

uses
  DUnitX.TestFramework, uVeiculo, uDtoVeiculo, uICasoUsoVeiculo,
  uCasoUsoVeiculo,uUtils,uResponse, uEnums,system.SysUtils,
  uIrepositoryVeiculo, uRepositoryVeiculo;

type
  [TestFixture]
   TTesteCasoUsoVeiculo = class
  public

  [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure CadastrarVeiculo;

    [Test]
    procedure AlterarVeiculo;

    [Test]
    procedure ValidarValorVeiculo;

    [Test]
    procedure ValidarPlacaVeiculo;


  end;

implementation

var

 CasoUsoVeiculo    : ICasoUsoVeiculo;
 Veiculo           : Tveiculo;
 RepositoryVeiculo : IRepositoryVeiculo;


{ TTesteCasoUsoVeiculo }

procedure TTesteCasoUsoVeiculo.AlterarVeiculo;
var
 response : Tresponse;
begin

   Veiculo.Nome   := 'Gol bola';
   Veiculo.Placa  := '6666666';
   Veiculo.Valor  :=  80.00;
   veiculo.Status := disponivel;
   Veiculo.Id     := 1;

   response :=  CasoUsoVeiculo.Alterar(veiculo);

   assert.IsTrue(response.success,response.Message);
   assert.AreEqual(RetornarMsgResponse.ALTERADO_COM_SUCESSO, response.Message,response.Message)


end;

procedure TTesteCasoUsoVeiculo.CadastrarVeiculo;
var
 response : Tresponse;
begin

   Veiculo.Nome   := 'Gol bola';
   Veiculo.Placa  := '7777777';
   Veiculo.Valor  :=  50.00;
   veiculo.Status := disponivel;

   response :=  CasoUsoVeiculo.Cadastrar(veiculo);

   assert.IsTrue(response.success,response.Message);
   assert.AreEqual(RetornarMsgResponse.CADASTRADO_COM_SUCESSO, response.Message,response.Message)


end;

procedure TTesteCasoUsoVeiculo.Setup;
begin

  RepositoryVeiculo := TrepositoryVeiculo.create;
  CasoUsoVeiculo   := TcasoUsoVeiculo.Create(RepositoryVeiculo);
  Veiculo           := Tveiculo.Create;


end;

procedure TTesteCasoUsoVeiculo.TearDown;
begin

   Veiculo.Free;

end;

procedure TTesteCasoUsoVeiculo.ValidarPlacaVeiculo;
var
 response : Tresponse;
begin

   Veiculo.Nome   := 'Gol bola';
   Veiculo.Placa  := '7';
   Veiculo.Valor  :=  50.00;
   veiculo.Status := disponivel;

   response :=  CasoUsoVeiculo.Cadastrar(veiculo);

   assert.IsFalse(response.success,response.Message);
   assert.AreEqual(RetornarErrorsCode.PLACA_INVALIDA, response.ErrorCode,response.Message)


end;

procedure TTesteCasoUsoVeiculo.ValidarValorVeiculo;
var
 response : Tresponse;
begin

   Veiculo.Nome   := 'Gol bola';
   Veiculo.Placa  := '7777777';
   Veiculo.Valor  :=  0;
   veiculo.Status := disponivel;

   response :=  CasoUsoVeiculo.Cadastrar(veiculo);

   assert.IsFalse(response.success,response.Message);
   assert.AreEqual(RetornarErrorsCode.VALOR_INVALIDO, response.ErrorCode,response.Message)


end;

initialization
  TDUnitX.RegisterTestFixture(TTesteCasoUsoVeiculo);

end.

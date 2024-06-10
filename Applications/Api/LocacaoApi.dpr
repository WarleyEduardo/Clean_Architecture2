program LocacaoApi;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uServer in 'uServer.pas',
  uController.Clientes in 'Controllers\uController.Clientes.pas',
  uDTOCliente in '..\..\Core\DTO\uDTOCliente.pas',
  uDTOLocacao in '..\..\Core\DTO\uDTOLocacao.pas',
  uDTOVeiculo in '..\..\Core\DTO\uDTOVeiculo.pas',
  uEnums in '..\..\Core\Enums\uEnums.pas',
  uExceptions in '..\..\Core\Exceptions\uExceptions.pas',
  uCliente in '..\..\Core\Models\uCliente.pas',
  uLocacao in '..\..\Core\Models\uLocacao.pas',
  uVeiculo in '..\..\Core\Models\uVeiculo.pas',
  uICasoUsoCliente in '..\..\Core\Ports\uICasoUsoCliente.pas',
  uICasoUsoLocacao in '..\..\Core\Ports\uICasoUsoLocacao.pas',
  uICasoUsoVeiculo in '..\..\Core\Ports\uICasoUsoVeiculo.pas',
  uIRepositoryCliente in '..\..\Core\Ports\uIRepositoryCliente.pas',
  uIRepositoryLocacao in '..\..\Core\Ports\uIRepositoryLocacao.pas',
  uIRepositoryVeiculo in '..\..\Core\Ports\uIRepositoryVeiculo.pas',
  uResponse in '..\..\Core\Response\uResponse.pas',
  uCasoUsoCliente in '..\..\Core\Usecases\uCasoUsoCliente.pas',
  uCasoUsoLocacao in '..\..\Core\Usecases\uCasoUsoLocacao.pas',
  uCasoUsoVeiculo in '..\..\Core\Usecases\uCasoUsoVeiculo.pas',
  uControllerCliente in '..\..\Controllers\uControllerCliente.pas',
  uControllerlocacao in '..\..\Controllers\uControllerlocacao.pas',
  uControllerVeiculo in '..\..\Controllers\uControllerVeiculo.pas',
  uIPresenter in '..\..\Presenters\uIPresenter.pas',
  uPresenterJson in '..\..\Presenters\uPresenterJson.pas',
  uPresenterStr in '..\..\Presenters\uPresenterStr.pas',
  uConfiguracaoDB in '..\..\Repository\uConfiguracaoDB.pas',
  uRepositoryCliente in '..\..\Repository\uRepositoryCliente.pas',
  uRepositoryLocacao in '..\..\Repository\uRepositoryLocacao.pas',
  uRepositoryVeiculo in '..\..\Repository\uRepositoryVeiculo.pas',
  uUtils in '..\..\Utils\uUtils.pas',
  uRoute.Clientes in 'Routes\uRoute.Clientes.pas',
  uController.Veiculos in 'Controllers\uController.Veiculos.pas',
  uRoute.Veiculos in 'Routes\uRoute.Veiculos.pas',
  uController.Locacoes in 'Controllers\uController.Locacoes.pas',
  uRoute.Locacoes in 'Routes\uRoute.Locacoes.pas';

begin
  try
     start;
    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.

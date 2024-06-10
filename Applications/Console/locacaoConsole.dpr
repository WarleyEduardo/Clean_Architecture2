program locacaoConsole;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uMenuPrincipal in 'uMenuPrincipal.pas',
  uCliente in '..\..\Core\Models\uCliente.pas',
  uICasoUsoCliente in '..\..\Core\Ports\uICasoUsoCliente.pas',
  uResponse in '..\..\Core\Response\uResponse.pas',
  uDTOCliente in '..\..\Core\DTO\uDTOCliente.pas',
  uCasoUsoCliente in '..\..\Core\Usecases\uCasoUsoCliente.pas',
  uEnums in '..\..\Core\Enums\uEnums.pas',
  uExceptions in '..\..\Core\Exceptions\uExceptions.pas',
  uUtils in '..\..\Utils\uUtils.pas',
  uVeiculo in '..\..\Core\Models\uVeiculo.pas',
  uICasoUsoVeiculo in '..\..\Core\Ports\uICasoUsoVeiculo.pas',
  uDTOVeiculo in '..\..\Core\DTO\uDTOVeiculo.pas',
  uCasoUsoVeiculo in '..\..\Core\Usecases\uCasoUsoVeiculo.pas',
  uLocacao in '..\..\Core\Models\uLocacao.pas',
  uICasoUsoLocacao in '..\..\Core\Ports\uICasoUsoLocacao.pas',
  uDTOLocacao in '..\..\Core\DTO\uDTOLocacao.pas',
  uCasoUsoLocacao in '..\..\Core\Usecases\uCasoUsoLocacao.pas',
  uIRepositoryCliente in '..\..\Core\Ports\uIRepositoryCliente.pas',
  uConfiguracaoDB in '..\..\Repository\uConfiguracaoDB.pas',
  uRepositoryCliente in '..\..\Repository\uRepositoryCliente.pas',
  uIRepositoryVeiculo in '..\..\Core\Ports\uIRepositoryVeiculo.pas',
  uRepositoryVeiculo in '..\..\Repository\uRepositoryVeiculo.pas',
  uIRepositoryLocacao in '..\..\Core\Ports\uIRepositoryLocacao.pas',
  uRepositoryLocacao in '..\..\Repository\uRepositoryLocacao.pas',
  uControllerCliente in '..\..\Controllers\uControllerCliente.pas',
  uControllerVeiculo in '..\..\Controllers\uControllerVeiculo.pas',
  uControllerlocacao in '..\..\Controllers\uControllerlocacao.pas',
  uIPresenter in '..\..\Presenters\uIPresenter.pas',
  uPresenterStr in '..\..\Presenters\uPresenterStr.pas',
  uPresenterJson in '..\..\Presenters\uPresenterJson.pas';

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }

    InjecaoDependencia;
    Menu;
    Destroy;

  except

    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.

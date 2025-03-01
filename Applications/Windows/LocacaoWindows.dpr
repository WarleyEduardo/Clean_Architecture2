program LocacaoWindows;

uses
  Vcl.Forms,
  uMernuPrincipal in 'uMernuPrincipal.pas' {FrmMenuPrincipal},
  uFrmPadrao in 'uFrmPadrao.pas' {FrmPadrao},
  uFrmClientes in 'uFrmClientes.pas' {FrmClientes},
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
  uIPresenter in '..\..\Presenters\uIPresenter.pas',
  uPresenterJson in '..\..\Presenters\uPresenterJson.pas',
  uConfiguracaoDB in '..\..\Repository\uConfiguracaoDB.pas',
  uRepositoryCliente in '..\..\Repository\uRepositoryCliente.pas',
  uRepositoryLocacao in '..\..\Repository\uRepositoryLocacao.pas',
  uRepositoryVeiculo in '..\..\Repository\uRepositoryVeiculo.pas',
  uUtils in '..\..\Utils\uUtils.pas',
  uControllerCliente in '..\..\Controllers\uControllerCliente.pas',
  uControllerlocacao in '..\..\Controllers\uControllerlocacao.pas',
  uControllerVeiculo in '..\..\Controllers\uControllerVeiculo.pas',
  uFrmVeiculos in 'uFrmVeiculos.pas' {FrmVeiculos},
  uFrmLocacoes in 'uFrmLocacoes.pas' {FrmLocacoes},
  uRepositoryClienteMemory in '..\..\Repository\uRepositoryClienteMemory.pas',
  uRepositoryLocacaoMemory in '..\..\Repository\uRepositoryLocacaoMemory.pas',
  uRepositoryVeiculoMemory in '..\..\Repository\uRepositoryVeiculoMemory.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMenuPrincipal, FrmMenuPrincipal);
  Application.Run;
end.

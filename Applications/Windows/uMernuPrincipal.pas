unit uMernuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TFrmMenuPrincipal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    btnClientes: TSpeedButton;
    Panel6: TPanel;
    btnVeiculos: TSpeedButton;
    Panel7: TPanel;
    btnLocacoes: TSpeedButton;
    procedure btnClientesClick(Sender: TObject);
    procedure btnVeiculosClick(Sender: TObject);
    procedure btnLocacoesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMenuPrincipal: TFrmMenuPrincipal;

implementation

{$R *.dfm}

uses uFrmClientes, uFrmVeiculos, uFrmLocacoes;

procedure TFrmMenuPrincipal.btnClientesClick(Sender: TObject);
begin
 FrmClientes := TFrmClientes.Create(self);
 FrmClientes.ShowModal;
 FrmClientes.Free;

end;

procedure TFrmMenuPrincipal.btnLocacoesClick(Sender: TObject);
begin
 FrmLocacoes := TFrmLocacoes.create(self);
 FrmLocacoes.ShowModal;
 FrmLocacoes.Free;
end;

procedure TFrmMenuPrincipal.btnVeiculosClick(Sender: TObject);
begin
 FrmVeiculos := TfrmVeiculos.create(self);
 FrmVeiculos.showModal;
 FrmVeiculos.free;
end;

end.

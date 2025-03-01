unit uFrmPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TFrmPadrao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    pgPrincipal: TPageControl;
    tsconsulta: TTabSheet;
    tsCadastro: TTabSheet;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    btnConsultar: TButton;
    btnIncluir: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    Panel8: TPanel;
    Panel9: TPanel;
    btnSalvar: TButton;
    btnVoltar: TButton;
    btnOk: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    status , nome ,  codigo : string;

  end;

var
  FrmPadrao: TFrmPadrao;

implementation

{$R *.dfm}

procedure TFrmPadrao.btnEditarClick(Sender: TObject);
begin
    pgPrincipal.ActivePage  :=  tsCadastro;
end;

procedure TFrmPadrao.btnIncluirClick(Sender: TObject);
begin
    pgPrincipal.ActivePage  :=  tsCadastro;
end;

procedure TFrmPadrao.btnVoltarClick(Sender: TObject);
begin
   pgPrincipal.ActivePage  :=  tsconsulta;
end;

procedure TFrmPadrao.FormShow(Sender: TObject);
begin

  btnok.Visible :=  status = 'Consultar';

  tsconsulta.TabVisible := false;
  tsCadastro.TabVisible := false;

  pgPrincipal.ActivePage  :=  tsconsulta;

end;

end.

unit uFrmVeiculos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmPadrao, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls, system.JSON, uControllerVeiculo,uRepositoryVeiculo,
  uIRepositoryVeiculo , uIPresenter, uPresenterJson, uenums, uUtils,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids,
  Vcl.DBGrids,uRepositoryVeiculoMemory ;

type
  TFrmVeiculos = class(TFrmPadrao)
    Label1: TLabel;
    edtNome: TEdit;
    Label12: TLabel;
    edtCodigo: TEdit;
    edtPlaca: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtValor: TEdit;
    Label4: TLabel;
    TableVeiculos: TFDMemTable;
    TableVeiculosId: TIntegerField;
    TableVeiculosNome: TStringField;
    TableVeiculosPlaca: TStringField;
    TableVeiculosValor: TCurrencyField;
    TableVeiculosStatus: TStringField;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Label14: TLabel;
    edtBuscaCodigo: TEdit;
    Label13: TLabel;
    edtBuscaNome: TEdit;
    edtBuscaPlaca: TEdit;
    Label5: TLabel;
    cbbStatus: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
    acao : string;
    procedure Salvar;

    procedure InjecaoDepencia;
    procedure destroy;
    procedure LimparCampos;
    procedure SetarCampos;
    procedure Excluir(id : integer);
    procedure consultar(id,nome, placa : string);


  public
    { Public declarations }
  end;

var
  FrmVeiculos: TFrmVeiculos;

  ControllerVeiculo : TcontrollerVeiculo;
  RepositoryVeiculo : IRepositoryVeiculo;
  Presenter         : IPresenter;

implementation

{$R *.dfm}

{ TFrmVeiculos }

procedure TFrmVeiculos.btnConsultarClick(Sender: TObject);
begin
  inherited;
   consultar(edtBuscacodigo.Text,
             edtBuscaNome.Text,
             edtBuscaPlaca.text);
end;

procedure TFrmVeiculos.btnEditarClick(Sender: TObject);
begin
  inherited;
   acao := 'Editar';
   SetarCampos;
end;

procedure TFrmVeiculos.btnExcluirClick(Sender: TObject);
begin

   Excluir(TableVeiculosid.AsInteger);

end;

procedure TFrmVeiculos.btnIncluirClick(Sender: TObject);
begin
  inherited;
  acao := 'Incluir';
  LimparCampos;
end;

procedure TFrmVeiculos.btnOkClick(Sender: TObject);
begin
  inherited;

  codigo := TableVeiculosid.AsString;
  Nome   := TableVeiculosNome.asString;

  self.Close;
end;

procedure TFrmVeiculos.btnSalvarClick(Sender: TObject);
begin

  salvar;

end;

procedure TFrmVeiculos.consultar(id, nome, placa: string);
var
 mensagem ,  response : string;
 sucesso : boolean;
 JsonValue, Veiculo : TJsonValue;
 status, errorcode : integer;
 arrayVeiculo : TJSONArray;
 i : integer;
begin

  if id = ''  then id := '0';

  Response := ControllerVeiculo.Consultar(strToInt(id),nome,placa);

  Jsonvalue  := converterStrJsonParaObjectJson(response);

  mensagem     := JsonValue.GetValue<string>('Message');
  sucesso      := JsonValue.GetValue<boolean>('Success');
  errorcode    := JsonValue.GetValue<integer>('ErrorCode');
  arrayVeiculo := JsonValue.GetValue<TJSONArray>('Data');



  if sucesso then
  begin

    if not(tableVeiculos.Active) then  tableVeiculos.Open;

    tableVeiculos.EmptyDataSet;


    if arrayVeiculo.Count > 0 then
    begin

      for I := 0 to arrayVeiculo.Count -1 do
      begin

        Veiculo := arrayVeiculo[I];

        TableVeiculos.Insert;
        TableVeiculosid.AsInteger     := Veiculo.GetValue<integer>('Id');
        TableVeiculosNome.asString    := Veiculo.GetValue<string>('Nome');
        TableVeiculosPlaca.asString   := Veiculo.GetValue<string>('Placa');
        TableVeiculosValor.AsCurrency := Veiculo.GetValue<currency>('Valor');
        TableVeiculosStatus.asString  := Veiculo.GetValue<string>('Status');

        tableVeiculos.post;
      end;

    end;


    showmessage(mensagem);

  end else
  begin
    showmessage('Erro: ' + intToStr(errorcode) + #13#10 + mensagem);
  end;


end;

procedure TFrmVeiculos.destroy;
begin
  ControllerVeiculo.Free;
end;

procedure TFrmVeiculos.Excluir(id: integer);
var
 mensagem ,  response : string;
 sucesso : boolean;
 JsonValue : TJsonValue;
 status, errorcode : integer;
begin

   Response := ControllerVeiculo.Deletar(id);

   Jsonvalue  := converterStrJsonParaObjectJson(response);

   mensagem  := JsonValue.GetValue<string>('Message');
   sucesso   := JsonValue.GetValue<boolean>('Success');
   errorcode := JsonValue.GetValue<integer>('ErrorCode');

   if sucesso then
   begin
      showmessage(mensagem);
   end else
   begin
    showmessage('Erro: ' + intToStr(errorcode) + #13#10 + mensagem);
   end;


end;

procedure TFrmVeiculos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Destroy;
end;

procedure TFrmVeiculos.FormShow(Sender: TObject);
begin
  inherited;

  InjecaoDepencia;

end;

procedure TFrmVeiculos.InjecaoDepencia;
begin

 Presenter         := TPresenterJson.Create;
 //RepositoryVeiculo := TRepositoryVeiculo.create;
 RepositoryVeiculo := TRepositoryVeiculoMemory.create;

 ControllerVeiculo :=  TcontrollerVeiculo.create(RepositoryVeiculo,Presenter)


end;

procedure TFrmVeiculos.LimparCampos;
begin
  edtCodigo.Clear;
  edtNome.Clear;
  edtPlaca.Clear;
  edtvalor.Clear;
  cbbStatus.Clear;
end;

procedure TFrmVeiculos.Salvar;
var

 body : TJsonObject;
 mensagem ,nome , id, placa, valor, statusVeiculo,response : string;
 sucesso : boolean;
 JsonValue : TJsonValue;
 status, errorcode : integer;
begin

   id            := edtCodigo.Text;
   nome          := edtnome.text;
   placa         := edtPlaca.text;
   valor         := edtValor.Text;
   statusVeiculo := cbbStatus.Text;

   if acao = 'Incluir' then
   begin
     response  := ControllerVeiculo.Cadastrar(nome,placa,StrToCurr(valor));
   end else
   begin

    if id = '' then id := '0';

     response  := ControllerVeiculo.alterar(strToint(id),
     nome,placa,statusveiculo,  StrToCurr(valor));


   end;

   Jsonvalue  := converterStrJsonParaObjectJson(response);

   mensagem  := JsonValue.GetValue<string>('Message');
   sucesso   := JsonValue.GetValue<boolean>('Success');
   errorcode := JsonValue.GetValue<integer>('ErrorCode');

   if sucesso then
   begin
      showmessage(mensagem);
   end else
   begin
    showmessage('Erro: ' + intToStr(errorcode) + #13#10 + mensagem);
   end;


end;

procedure TFrmVeiculos.SetarCampos;
begin

 edtCodigo.Text  := TableVeiculosId.AsString;
 edtNome.text    := TableVeiculosNome.AsString;
 edtplaca.Text   := TableVeiculosPlaca.AsString;
 edtValor.Text   := TableVeiculosValor.asString;
 cbbStatus.ItemIndex := cbbStatus.Items.IndexOf(TableVeiculosStatus.AsString)

end;

end.

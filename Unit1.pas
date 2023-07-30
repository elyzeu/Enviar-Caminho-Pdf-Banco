unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, unit2;

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    btnSalvarBoleto: TButton;
    edtEmail: TEdit; // Adicione um componente TEdit para inserir o email
    Label1: TLabel; // Adicione um TLabel para indicar o campo do email
    procedure btnSalvarBoletoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnSalvarBoletoClick(Sender: TObject);
var
  BoletoPath: string;
  Email: string;
begin
  Email := Trim(edtEmail.Text); // Obtenha o email inserido pelo usuário

  if Email = '' then
  begin
    ShowMessage('Insira um email válido.');
    Exit;
  end;

  // Abra o diálogo de seleção do arquivo PDF
  if OpenDialog1.Execute then
  begin
    BoletoPath := OpenDialog1.FileName;

    // Verifique o email antes de atualizar o campo 'boleto'
    if DataModule2.FDTable1.FieldByName('EMAIL').AsString = Email then
    begin
      // Atualize o campo 'boleto' na tabela NP do Firebird com o caminho do arquivo PDF
      DataModule2.FDTable1.Edit;
      DataModule2.FDTable1.FieldByName('boleto').AsString := BoletoPath;
      DataModule2.FDTable1.Post;

      ShowMessage('Caminho do boleto salvo com sucesso!');
    end
    else
    begin
      ShowMessage('O email inserido não corresponde ao email do banco de dados. O boleto não será salvo.');
    end;
  end;
end;

end.


program Project1;

uses
  Vcl.Forms,
  View in 'View.pas' {Form1},
  ViewModel in 'ViewModel.pas',
  Model in 'Model.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

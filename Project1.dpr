program Project1;

uses
  Vcl.Forms,
  Main_Wnd in 'Main_Wnd.pas' {Form1},
  Generation_Code in 'Generation_Code.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

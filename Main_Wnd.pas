unit Main_Wnd;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, System.Threading, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    AsyncStartIntGeneration: TButton;
    LastValue: TLabel;
    StopIntGeneration: TButton;
    LastValueLabel: TLabel;
    AverageValueLabel: TLabel;
    AverageValue: TLabel;
		procedure StopIntGenerationClick(Sender: TObject);
		procedure StartGenerationClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Results_Code, Generation_Code;

var
  lSignalGenerator: TSignalGenerator;
  lResults: TResults;

{$R *.dfm}

procedure TForm1.StartGenerationClick(Sender: TObject);
var
  lCount : Integer;
begin
  lCount := lSignalGenerator.GenerateSignals.Count;
  LastValue.Caption := lCount.ToString;
  //lResult := TResults.Create(lCount);
end;

procedure TForm1.StopIntGenerationClick(Sender: TObject);
begin
  //gIsWorking := False;
end;

initialization
begin
  lSignalGenerator := TSignalGenerator.Create(1.5, 5);
end;

finalization
begin
  lSignalGenerator.Free;
  lResults.Free;
end;

end.

unit Main_Wnd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
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
    procedure AsyncStartIntGenerationClick(Sender: TObject);
		procedure StopIntGenerationClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.AsyncStartIntGenerationClick(Sender: TObject);
var
  lValue: Integer;
  lIndex: Integer;
  lSum: integer;
  lValues: array of Integer;
begin
  //gIsWorking := True;
	LastValue.Caption := '--';
  TTask.Run(procedure
  	begin
      while gIsWorking do
      begin
        Sleep(500);
        lValue := Random(10);
        lIndex := Length(lValues);
        SetLength(lValues, lIndex+1);
        lValues[lIndex] := lValue;
        lSum := lSum + lValue;
        AverageValue.Caption := (lSum/(lIndex+1)).ToString;
        TThread.Synchronize(nil,
      	procedure
        begin
        	LastValue.Caption := lValue.ToString;
        end);
      end;
    end);
end;

procedure TForm1.StopIntGenerationClick(Sender: TObject);
begin
  gIsWorking := False;
end;

end.

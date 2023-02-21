unit Generation_Code;

interface

uses System.Diagnostics, Vcl.StdCtrls, System.SysUtils, System.Threading, System.Classes;

implementation
type
  SignalGenerator = class
    fSignalRate: Real;
    fSignalAmount: Integer;
    fStopwatch: TStopwatch;
    fIsWorking: Boolean;
    procedure GenerateRandomIntegers(var LastValue, AverageValue: TLabel);
  end;

procedure SignalGenerator.GenerateRandomIntegers(var LastValue, AverageValue: TLabel);
  var
  lValue: Integer;
  lIndex: Integer;
  lSum: integer;
  lValues: array of Integer;
begin
  fIsWorking := True;
	LastValue.Caption := '--';
  TTask.Run(procedure
  	begin
      while fIsWorking do
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
end.

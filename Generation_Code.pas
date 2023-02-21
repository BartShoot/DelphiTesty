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
    procedure StartTaskRandomIntegerGeneration(var LastValue, AverageValue: TLabel);
    procedure SynchronizeLastValue(var LastValue: Tlabel; value: Integer);
    function SetLastValue(var LastValue: Tlabel; value: Integer) : TThreadProcedure;
  end;

procedure SignalGenerator.GenerateRandomIntegers(var LastValue, AverageValue: TLabel);
var
  lValue: Integer;
  lIndex: Integer;
  lSum: integer;
  lValues: array of Integer;
begin
  lSum := 0;
  while fIsWorking do
  begin
    Sleep(500);
    lValue := Random(10);
    lIndex := Length(lValues);
    SetLength(lValues, lIndex+1);
    lValues[lIndex] := lValue;
    lSum := lSum + lValue;
    AverageValue.Caption := (lSum/(lIndex+1)).ToString;
    SynchronizeLastValue(LastValue, lValue);
  end;
end;

procedure SignalGenerator.SynchronizeLastValue(var LastValue: Tlabel; value: Integer);
var
  lSetLastValue : TThreadProcedure;
begin
  lSetLastValue := SetLastValue(LastValue, value);
  TThread.Synchronize(nil, lSetLastValue);
end;

function SignalGenerator.SetLastValue(var LastValue: Tlabel; value: Integer) : TThreadProcedure;
begin
  Result :=
    procedure
    begin
      LastValue.Caption := value.ToString;
    end;
end;


procedure SignalGenerator.StartTaskRandomIntegerGeneration(var LastValue, AverageValue: TLabel);
  var
  lValue: Integer;
  lIndex: Integer;
  lSum: integer;
  lValues: array of Integer;
begin
  fIsWorking := True;
	LastValue.Caption := '--';
  TTask.Run(GenerateRandomIntegers(LastValue, AverageValue));
end;
end.

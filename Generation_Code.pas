unit Generation_Code;

interface

uses System.Diagnostics, System.SysUtils, System.Threading, System.Classes,
  System.Generics.Collections;

type
  TSignalGenerator = class
    fSignalRatePerSecond: Real;
    fSignalInterval: Real;
    fSignalAmount: Integer;
    fStopwatch: TStopwatch;
    fIsWorking: Boolean;
    fTemporaryResults: TList<Integer>;

  public
    constructor Create(SignalRatePerSecond: Real; SignalAmount: Integer);
    destructor Destroy; override;
    function GenerateSignals: TList<Integer>;
  end;

implementation



constructor TSignalGenerator.Create(SignalRatePerSecond: Real;
  SignalAmount: Integer);
begin
  fSignalInterval := 1 / SignalRatePerSecond;
  fSignalRatePerSecond := SignalRatePerSecond;
  fSignalAmount := SignalAmount;
  fStopwatch := TStopwatch.Create;
  fTemporaryResults := TList<Integer>.Create;
end;

destructor TSignalGenerator.Destroy;
begin
  fTemporaryResults.Free;
  inherited;
end;

function TSignalGenerator.GenerateSignals: TList<Integer>;
begin
  var
    i: Integer;
  for i := 0 to fSignalAmount do
  begin
    fStopwatch.Start;
    Sleep(50);
    fStopwatch.Stop;
    fTemporaryResults.Add(fStopwatch.ElapsedMilliseconds);
    Sleep(Round(fSignalInterval * 1000) - fStopwatch.ElapsedMilliseconds);
  end;
  Result := fTemporaryResults;
end;

end.

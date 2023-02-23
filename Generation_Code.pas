unit Generation_Code;

interface

uses System.Diagnostics, System.SysUtils, System.Threading, System.Classes,
  System.Generics.Collections;

implementation

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

constructor TSignalGenerator.Create(SignalRatePerSecond: Real;
  SignalAmount: Integer);
begin
  fSignalInterval := SignalRatePerSecond / 60;
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
var
  lTask: ITask;
begin
  lTask := TTask.Create(
    procedure
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
    end);
  lTask.Start;
  TTask.WaitForAll(lTask);
  Result := fTemporaryResults;
end;

end.

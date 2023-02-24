unit Results_Code;

interface

type
  TResults = class
    fResultAmount: Integer;
    fActualTimeMs: UInt32;
  public
    constructor Create(ResultAmount : Integer);
  end;

implementation

constructor TResults.Create(ResultAmount : Integer);
begin
  fResultAmount := ResultAmount;
end;

end.

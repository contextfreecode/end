program Ends;
{$mode objfpc}

uses StrUtils, SysUtils;

type
  TRegion = record
    Name: AnsiString;
    Population: Int64;
    SouthEdge: Double;
  end;

var
  inputFile: TextFile;
  region: TRegion;
  regions: array of TRegion = (
    (Name: 'North'; Population: 0; SouthEdge: 0),
    (Name: 'South'; Population: 0; SouthEdge: -90)
  );

procedure Tally(var inputFile: TextFile; var regions: array of TRegion);
var
  fields: array of AnsiString;
  latitude: Double;
  line: AnsiString;
  population: Int64;
begin
  while not Eof(inputFile) do begin
    ReadLn(inputFile, line);
    fields := SplitString(line, #9);
    latitude := StrToFloat(fields[4]);
    population := StrToInt(fields[14]);
  end;
end;

begin
  if ParamCount() < 1 then raise Exception.Create('No file name');
  AssignFile(inputFile, ParamStr(1));
  WriteLn(ParamStr(1));
  Reset(inputFile);
  try
    Tally(inputFile, regions);
  finally
    Close(inputFile);
  end;
  for region in regions do begin
    WriteLn(region.Name, ': ', region.Population);
  end;
end.

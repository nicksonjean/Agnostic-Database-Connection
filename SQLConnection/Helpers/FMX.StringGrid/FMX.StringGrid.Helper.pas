﻿unit FMX.StringGrid.Helper;

interface

uses
  FMX.Grid,
  FMX.Controls,
  FMX.Graphics;

type
  TStringGridHelper = class helper for TStringGrid
  public
    procedure AutoSizeColumns(Column: Integer);
    procedure RemoveRows(RowIndex, RCount: Integer);
    procedure Clear;
  end;

//https://stackoverflow.com/questions/57747499/show-tooltips-for-a-tstringgrid-cell
//https://stackoverflow.com/questions/23366062/sort-tstringgrid-by-row-and-its-integer-value
//http://www.interface.ru/home.asp?artId=27914
//https://stackoverrun.com/es/q/2415838
//https://community.idera.com/developer-tools/programming-languages/f/delphi-language/68962/stringgrid-adding-columns-at-run-time

implementation

{ TStringGridHelper }

procedure TStringGridHelper.AutoSizeColumns(Column: Integer);
var
  i, W, WMax: Integer;
begin
  WMax := 0;
  for i := 1 to (Self.RowCount - 1) do begin
    W := Round(Self.Canvas.TextWidth(Self.Cells[Column, i]));
    if W > WMax then
      WMax := W;
  end;
  if WMax*2 > Self.Columns[Column].Width then
  begin
    Self.Columns[Column].Width := WMax*2;
  end;
end;

procedure TStringGridHelper.Clear;
var
  I: Integer;
begin
  for I := 0 to RowCount - 1 do
    RemoveRows(0, RowCount);
  ClearColumns;
end;

procedure TStringGridHelper.RemoveRows(RowIndex, RCount: Integer);
var
  I, J: Integer;
begin
  for I := RCount to RowCount - 1 do
    for J := 0 to ColumnCount - 1 do
      Cells[J, I] := Cells[J, I + 1];
  RowCount := RowCount - RCount;
end;

end.
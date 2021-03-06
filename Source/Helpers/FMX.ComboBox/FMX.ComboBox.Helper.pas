﻿unit FMX.ComboBox.Helper;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.DateUtils,
  FMX.Forms,
  FMX.Pickers,
  FMX.ListBox,
  FMX.Types,
  FMX.Controls,
  FMX.StdCtrls,
  EventDriven;

type
  TComboBoxHelper = class helper for TComboBox
  private
    class var FLastTimeKeydown : TDatetime;
    class var FKeys : String;
    class var FAutoComplete: Boolean;
    function GetAutoComplete : Boolean;
    procedure SetAutoComplete(Value : Boolean);
    procedure DoAutoComplete;
  public
    property AutoComplete: Boolean read GetAutoComplete write SetAutoComplete default false;
  end;

implementation

uses
  FMX.ListBox.Helper;

{ TComboBoxHelper }

procedure TComboBoxHelper.DoAutoComplete;
begin
  if FAutoComplete = True then
  begin
    Self.OnKeyDown := DelegateKeyEvent(Self,
    procedure(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState)
    var
      I: Integer;
    begin
      if Key = vkReturn then
        Exit;
      if (CharInSet(KeyChar,[Chr(48)..Chr(57)])) or (CharInSet(KeyChar,[Chr(65)..Chr(90)])) or (CharInSet(KeyChar,[Chr(97)..Chr(122)])) then
      begin
        if MilliSecondsBetween(FLastTimeKeydown, Now) < 500 then
          FKeys := FKeys + KeyChar
        else
          FKeys := KeyChar;
        FLastTimeKeydown := Now;
        for I := 0 to TComboBox(Sender).Count-1 do
        if UpperCase(Copy(TComboBox(Sender).Items[I], 0, FKeys.Length)) = UpperCase(FKeys) then
        begin
          TComboBox(Sender).ItemIndex := I;
          Break;
        end;
      end;
    end);
  end;
end;

function TComboBoxHelper.GetAutoComplete : Boolean;
begin
  Result := FAutoComplete;
end;

procedure TComboBoxHelper.SetAutoComplete(Value: Boolean);
begin
  FAutoComplete := Value;
  Self.DoAutoComplete;
end;

end.

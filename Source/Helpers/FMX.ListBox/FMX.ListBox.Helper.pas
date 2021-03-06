unit FMX.ListBox.Helper;

interface

uses
  System.SysUtils,
  FMX.Types,
  FMX.ListBox,
  FMX.SearchBox;

type
  TListBoxHelper = class helper for TListBox
  public
    procedure EmptyFilter;
    function FindItemByName(Name: String): Integer;
    function ItemIsChecked(Name: String): Boolean;
    procedure ItemChecked(Name: String; Mark: Boolean);
  end;

implementation

{ TListBoxHelper }

procedure TListBoxHelper.EmptyFilter;
  procedure ListChildren(Obj : TFMXObject; Level : Integer);
  var
    I: Integer;
    SearchEdit: TSearchBox;
  begin
    for I := 0 to Obj.ChildrenCount - 1 do
    begin
      if (Obj.Children[I] is TSearchBox) then
      begin
        SearchEdit := Obj.Children[I] as TSearchBox;
        if (SearchEdit <> nil) then
          SearchEdit.Text := EmptyStr;
      end;
      ListChildren(Obj.Children[I],Level+1);
    end;
  end;
begin
  ListChildren(Self,1);
end;

function TListBoxHelper.FindItemByName(Name: String): Integer;
var
  i: Integer;
begin
  result := -1;
  for i := 0 to Pred(Items.Count) do
  begin
    if ListItems[i].Name = Name then
    begin
      result := ListItems[i].Index;
      Break;
    end;
  end;
end;

procedure TListBoxHelper.ItemChecked(Name: String; Mark: Boolean);
begin
  if Mark = true then
    ListItems[FindItemByName(Name)].ItemData.Accessory := TListBoxItemData.TAccessory.aCheckmark
  else
    ListItems[FindItemByName(Name)].ItemData.Accessory := TListBoxItemData.TAccessory.aNone;
end;

function TListBoxHelper.ItemIsChecked(Name: String): Boolean;
begin
  if ListItems[FindItemByName(Name)].ItemData.Accessory = TListBoxItemData.TAccessory.aCheckmark then
    result := true
  else
    result := False;
end;

end.

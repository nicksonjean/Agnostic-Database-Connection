{
https://stackoverflow.com/questions/1423411/delphi-how-to-know-when-a-tedit-changes-size
}

unit FMX.Objects.Helper;

interface

uses
  System.Classes,
  System.UITypes,
  System.SysUtils,
  FMX.Forms,
  FMX.Controls,
  FMX.StdCtrls,
  FMX.Types,
  FMX.Edit,
  FMX.Ani,
  FMX.Dialogs,
  EventDriven;

var
  VarHeight: Single;
  ConstHeight: Single;

type
  TObjects = class helper for TFMXObject
  private
    procedure Enter(Sender: TObject; Height : Single);
    procedure Exit(Sender: TObject; Height : Single);
  public
    procedure Placeholder(Text: String);
  end;

implementation

{ TObjects }

procedure TObjects.Enter(Sender: TObject; Height : Single);
var
  AnimateLabel : TLabel;
begin
  if (Self as TEdit).Text = EmptyStr then
  begin
    AnimateLabel := TLabel((Self as TEdit).FindComponent('Label'+(Self as TEdit).Name));
    FMX.Ani.TAnimator.AnimateFloat(AnimateLabel, 'Font.Size', 10, 0.1, TAnimationType.InOut, TInterpolationType.Elastic);
    FMX.Ani.TAnimator.AnimateFloat(AnimateLabel, 'Position.Y', Height, 0.1, TAnimationType.InOut, TInterpolationType.Elastic);
    AnimateLabel.FontColor := TAlphaColors.Royalblue;
  end;
end;
procedure TObjects.Exit(Sender: TObject; Height : Single);
var
  AnimateLabel : TLabel;
begin
  if (Self as TEdit).Text = EmptyStr then
  begin
    AnimateLabel := TLabel((Self as TEdit).FindComponent('Label'+(Self as TEdit).Name));
    FMX.Ani.TAnimator.AnimateFloat(AnimateLabel, 'Font.Size', TEdit(Self).TextSettings.Font.Size, 0.1, TAnimationType.InOut, TInterpolationType.Elastic);
    FMX.Ani.TAnimator.AnimateFloat(AnimateLabel, 'Position.Y', Height, 0.1, TAnimationType.InOut, TInterpolationType.Elastic);
    AnimateLabel.FontColor := TAlphaColors.Darkgray;
  end;
end;

procedure TObjects.Placeholder(Text: String);
var
  &Label : TLabel;
begin
  VarHeight := Trunc(TEdit(Self).Height);
  ConstHeight := VarHeight;

  &Label := TLabel.Create(Self);
  &Label.Text := Text;
  &Label.Name := 'Label'+Self.Name;
  &Label.StyledSettings := [TStyledSetting.Family];
  &Label.TextSettings.Font.Family := TEdit(Self).TextSettings.Font.Family;
  &Label.TextSettings.Font.Size := TEdit(Self).TextSettings.Font.Size;
  &Label.TextSettings.FontColor := TAlphaColors.Darkgray;
  &Label.Position.X := 3;
  &Label.Position.Y := ((ConstHeight - &Label.Height) / 2);
  &Label.Parent := Self;

  TEdit(Self).OnResize := DelegateEvent(
    TEdit(Self),
    procedure(Sender: TObject)
    begin
      VarHeight := Trunc(TEdit(Self).Height);
      if ( ( not(Self as TEdit).IsFocused) and ( (Self as TEdit).Text = EmptyStr) ) then
        &Label.Position.Y := ((VarHeight - &Label.Height) / 2);
    end
  );

  TEdit(Self).OnEnter := DelegateEvent(
    TEdit(Self),
    procedure(Sender: TObject)
    begin
      Self.Enter(Sender, -( (ConstHeight/2) + 4 ));
    end
  );

  TEdit(Self).OnExit := DelegateEvent(
    TEdit(Self),
    procedure(Sender: TObject)
    begin
      Self.Exit(Sender, ((VarHeight - &Label.Height) / 2));
    end
  );

end;

end.

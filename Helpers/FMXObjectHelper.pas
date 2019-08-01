unit FMXObjectHelper;

interface

uses
  System.Classes,
  System.UITypes,
  FMX.StdCtrls,
  FMX.Forms,
  FMX.Types,
  FMX.Edit,
  NotifyHelper;

  { Classe Helper para o Objeto TFMXObject }
type
  TFMXObjectHelper = class helper for TFMXObject
  public
    procedure Placeholder(Desc: String);
  end;

implementation

{ TFMXObject }

procedure TFMXObjectHelper.Placeholder(Desc: String);
var
  lbl : TLabel;
  Win: TForm;
begin
  lbl := TLabel.Create(Self);
  lbl.Text := Desc;
  lbl.Name := 'Label'+Self.Name;
  lbl.StyledSettings := [TStyledSetting.Family];
  lbl.Position.X := 3;
  lbl.Position.Y := 0;
  lbl.TextSettings.Font.Size := 13;
  lbl.TextSettings.FontColor := TAlphaColors.Darkgray;
  lbl.Parent := Self;

  TEdit(Self).OnEnter := TEventComponent.NotifyEvent(Win,
              procedure
              var
                runlbl :TLabel;
              begin
                if (Self as TEdit).Text = '' then
                begin
                  runlbl := TLabel((Self as TEdit).FindComponent('Label'+(Self as TEdit).Name));
                  runlbl.AnimateFloat('Font.Size',9,0.1, TAnimationType.InOut,TInterpolationType.Elastic);
                  runlbl.AnimateFloat('Position.Y',-16,0.1, TAnimationType.InOut,TInterpolationType.Elastic);
                  runlbl.FontColor := TAlphaColors.Royalblue;
                end;
                Win.Free;
              end);

  TEdit(Self).OnExit := TEventComponent.NotifyEvent(Win,
              procedure
              var
                runlbl :TLabel;
              begin
                if (Self as TEdit).Text = '' then
                begin
                  runlbl := TLabel((Self as TEdit).FindComponent('Label'+(Self as TEdit).Name));
                  runlbl.AnimateFloat('Font.Size',14,0.1, TAnimationType.InOut,TInterpolationType.Elastic);
                  runlbl.AnimateFloat('Position.Y',3,0.1, TAnimationType.InOut,TInterpolationType.Elastic);
                  runlbl.FontColor := TAlphaColors.Darkgray;
                end;
                Win.Free;
              end);
end;

end.

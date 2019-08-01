//https://www.youtube.com/watch?v=cyhfAZbHZ7s

unit FormHelper;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Ani,
  FMX.Objects,
  FMX.Layouts;

  { Classe TFormHelper Herdada de TForm }
type
  TFormHelper = class helper for TForm
  public
    { Public declarations }
    procedure AvisoPositivo(msg: String; Cor: TAlphaColor = TAlphaColors.Cornflowerblue);
    procedure AnimaArcFinish(Sender: TObject);
    procedure Anima1Finish(Sender: TObject);
    procedure Anima2Finish(Sender: TObject);
    procedure AnimaSaidaFinish(Sender: TObject);

    procedure AvisoBottomPositivo(msg: String; Cor: TAlphaColor = TAlphaColors.Cornflowerblue);
    procedure Check(msg: String; Cor: TAlphaColor = TAlphaColors.Cornflowerblue);
    procedure AvisoNegativo(msg: String);
    procedure AvisoInformativo(msg: String; Cor: TAlphaColor = TAlphaColors.Cornflowerblue);
  end;

var
  RetFundo, RetAviso, RetText, RetCheck : TRectangle;
  Arc : TArc;
  Cor: Integer;
  Layout : TLayout;
  AnimaArc, Anima1, Anima2, AnimaSaida : TFloatAnimation;
  Text : TText;

implementation

{ TFormHelper }

procedure TFormHelper.Anima1Finish(Sender: TObject);
begin
  Anima2.Start;
end;

procedure TFormHelper.Anima2Finish(Sender: TObject);
begin
  AnimaSaida.Start;
end;

procedure TFormHelper.AnimaArcFinish(Sender: TObject);
begin
  Anima1.Start;
end;

procedure TFormHelper.AnimaSaidaFinish(Sender: TObject);
begin
  RetAviso.DisposeOf;
  RetFundo.DisposeOf;
end;

procedure TFormHelper.AvisoBottomPositivo(msg: String; Cor: TAlphaColor);
begin
//
end;

procedure TFormHelper.AvisoInformativo(msg: String; Cor: TAlphaColor);
begin
//
end;

procedure TFormHelper.AvisoNegativo(msg: String);
begin
//
end;

procedure TFormHelper.AvisoPositivo(msg: String; Cor: TAlphaColor);
begin
  {$REGION 'Background'}
  RetFundo := TRectangle.Create(Self);
  RetFundo.Fill.Color := TAlphaColors.Black;
  RetFundo.Align := TAlignLayout.Contents;
  RetFundo.Size.PlatformDefault := False;
  RetFundo.Stroke.Color := RetFundo.Fill.Color;
  RetFundo.Opacity := 0.1;
  RetFundo.Parent := Self;
  {$ENDREGION}

  {$REGION '�rea do Aviso'}
  RetAviso := TRectangle.Create(Self);
  RetAviso.Fill.Color := TAlphaColors.White;
  RetAviso.Align := TAlignLayout.Center;
  RetAviso.Size.PlatformDefault := False;
  RetAviso.Width := 250;
  RetAviso.Height := 180;
  RetAviso.Stroke.Color := RetAviso.Fill.Color;
  RetAviso.Parent := Self;
  {$ENDREGION}

  {$REGION 'C�rculo'}
  Layout := TLayout.Create(RetAviso);
  Layout.Align := TAlignLayout.Top;
  Layout.Size.Height := 100;
  Layout.Size.PlatformDefault := False;
  Layout.TabOrder := 0;
  Layout.Parent := RetAviso;

  Arc := TArc.Create(Layout);
  Arc.Align := TAlignLayout.Center;
  Arc.Size.Width := 50;
  Arc.Size.Height := 50;
  Arc.Size.PlatformDefault := False;
  Arc.Stroke.Color := Cor;
  Arc.Stroke.Thickness := 5;
  Arc.StartAngle := 200;
  Arc.EndAngle := 1;
  Arc.Parent := Layout;
  {$ENDREGION}

  {$REGION 'Anima��o do C�rculo'}
  AnimaArc := TFloatAnimation.Create(Arc);
  AnimaArc.Duration := 0.5;
  AnimaArc.Interpolation := TInterpolationType.Exponential;
  AnimaArc.OnFinish := AnimaArcFinish;
  AnimaArc.PropertyName := 'EndAngle';
  AnimaArc.StartValue := 0;
  AnimaArc.StopValue := 360;
  AnimaArc.Parent := Arc;
  AnimaArc.Start;
  {$ENDREGION}

  {$REGION 'Primeira Linha'}
  Layout := TLayout.Create(Arc);
  Layout.Position.X := 8;
  Layout.Position.Y := 27;
  Layout.RotationAngle := 45;
  Layout.Size.Width := 15;
  Layout.Size.Height := 7;
  Layout.Size.PlatformDefault := False;
  Layout.TabOrder := 0;
  Layout.Parent := Arc;

  RetText := TRectangle.Create(Layout);
  RetText.Fill.Color := Cor;
  RetText.Size.Width := 0;
  RetText.Size.Height := 6;
  RetText.Size.PlatformDefault := False;
  RetText.Stroke.Color := Cor;
  RetText.XRadius := 3;
  RetText.YRadius := 3;
  RetText.Parent := Layout;
  {$ENDREGION}

  {$REGION 'Anima��o Primeira Linha'}
  Anima1 := TFloatAnimation.Create(RetText);
  Anima1.Duration := 0.2;
  Anima1.Interpolation := TInterpolationType.Exponential;
  Anima1.OnFinish := Anima1Finish;
  Anima1.PropertyName := 'Width';
  Anima1.StartValue := 0;
  Anima1.StopValue := 15;
  Anima1.Parent := RetText;
  {$ENDREGION}

  {$REGION 'Segunda Linha'}
  Layout := TLayout.Create(Arc);
  Layout.Position.X := 15;
  Layout.Position.Y := 24;
  Layout.RotationAngle := -45;
  Layout.Size.Width := 28;
  Layout.Size.Height := 7;
  Layout.Size.PlatformDefault := False;
  Layout.TabOrder := 0;
  Layout.Parent := Arc;

  RetText := TRectangle.Create(Layout);
  RetText.Fill.Color := Cor;
  RetText.Size.Width := 0;
  RetText.Size.Height := 6;
  RetText.Size.PlatformDefault := False;
  RetText.Stroke.Color := Cor;
  RetText.XRadius := 3;
  RetText.YRadius := 3;
  RetText.Parent := Layout;
  {$ENDREGION}

  {$REGION 'Anima��o Segunda Linha'}
  Anima2 := TFloatAnimation.Create(RetText);
  Anima2.Duration := 0.1;
  Anima2.Interpolation := TInterpolationType.Exponential;
  Anima2.PropertyName := 'Width';
  Anima2.OnFinish := Anima2Finish;
  Anima2.StartValue := 0;
  Anima2.StopValue := Layout.Size.Width;// Apresenta Inconsistencias
  //Anima2.StopValue := 28.5;
  Anima2.Parent := RetText;
  {$ENDREGION}

  {$REGION 'Mensagem'}
  Text := TText.Create(RetAviso);
  Text.Align := TAlignLayout.Center;
  Text.Size.PlatformDefault := False;
  Text.TextSettings.Font.Size := 14;
  Text.TextSettings.FontColor := Cor;
  Text.Text := Msg;
  Text.Parent := RetAviso;
  {$ENDREGION}

  {$REGION 'Camada Modal & Overlay'}
  AnimaSaida := TFloatAnimation.Create(RetAviso);
  AnimaSaida.Duration := 2;
  AnimaSaida.Interpolation := TInterpolationType.Exponential;
  AnimaSaida.OnFinish := AnimaSaidaFinish;
  AnimaSaida.PropertyName := 'Opacity';
  AnimaSaida.StartValue := 1;
  AnimaSaida.StopValue := 1;
  AnimaSaida.Parent := RetAviso;
  {$ENDREGION}
end;

procedure TFormHelper.Check(msg: String; Cor: TAlphaColor);
begin
//
end;

end.

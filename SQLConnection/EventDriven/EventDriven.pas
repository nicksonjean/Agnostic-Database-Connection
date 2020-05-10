{ ***************************************************************************

  Copyright (c) 2015-2019 Nickson Jeanmerson

  Unit        : UDelegateEvent
  Description : Lib for Work with Delegate Events
  Author      : Nickson Jeanmerson
  Version     : 1.0
  Created     : 27/08/2017
  Modified    : 27/08/2017

  This file is hosted in:
  https://www.oipapio.com/question-6606946,
  https://codeday.me/es/qa/20190307/282169.html,
  http://qaru.site/questions/403876/tproctobject-to-tnotifyevent,
  https://coredump.pt/questions/11491593/tproclttobjectgt-to-tnotifyevent,
  https://itproblemy.pl/questions/11491593/tproclttobjectgt-to-tnotifyevent,
  https://stackoverflow.com/questions/11491593/tproctobject-to-tnotifyevent,
  http://git.fzwise.com:81/index.php/archives/162/
  https://stackoverflow.com/questions/29159763/dynamically-assigning-anonymous-functions-in-pascal;
  https://codereview.stackexchange.com/questions/52418/anonymous-events-in-delphi

  https://delphihaven.wordpress.com/2009/09/13/calling-an-event-handler-using-rtti/

  (*
  // Sample
  Button1.OnClick := DelegateNotifyEvent(
    Button1,
    procedure(Sender: TObject)
    begin
      (Sender as TButton).Caption := 'Clicked';
    end
  );
  *)

  or

  https://stackoverflow.com/questions/360254/can-i-use-a-closure-on-an-event-handler-ie-tbutton-onclick;
  https://stackoverflow.com/questions/8025481/vcl-events-with-anonymous-methods-what-do-you-think-about-this-implementation // Estudar DSharp

  (*
  // Sample
  procedure TForm36.Button2Click(Sender: TObject);
  var
    Win: TForm;
  begin
    Win:= TForm.Create(Self);
    Win.OnClick := TEventComponent.NotifyEvent(
      Win,
      procedure
      begin
        ShowMessage('Hello');
        Win.Free;
      end
    );
  Win.Show;
  end;
  *)

  ***************************************************************************

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.

  *************************************************************************** }

unit EventDriven;

interface

uses
  System.Classes,
  System.Types,
  System.SysUtils,
  System.DateUtils,
  System.UITypes,
  System.Math.Vectors,
  System.RTTI,
  FMX.Graphics,
  FMX.Forms,
  FMX.ExtCtrls,
  FMX.Controls,
  FMX.Types,
  FMX.StdCtrls,
  FMX.ListView.Types,
  FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base,
  FMX.ListView,
  FMX.ListBox,
  FMX.Grid;

type
  TNotifyEvent = procedure(Sender: TObject) of object; { OK }
  TItemBoxEvent = procedure(const Sender: TCustomListBox; const Item: TListBoxItem) of object; { OK }
  TItemViewEvent = procedure(const Sender: TObject; const AItem: TListViewItem) of object; { OK }
  TPaintEvent = procedure(Sender: TObject; Canvas: TCanvas; const ARect: TRectF) of object; { OK }
  TMouseEvent = procedure(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single) of object;
  TMouseMoveEvent = procedure(Sender: TObject; Shift: TShiftState; X, Y: Single) of object;
  TMouseWheelEvent = procedure(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; var Handled: Boolean) of object;
  TKeyEvent = procedure(Sender: TObject; var Key: Word; var KeyChar: WideChar; Shift: TShiftState) of object; { OK }
  TProcessTickEvent = procedure(Sender: TObject; time, deltaTime: Single) of object;
  TVirtualKeyboardEvent = procedure(Sender: TObject; KeyboardVisible: Boolean; const Bounds: TRect) of object;
  TTapEvent = procedure(Sender: TObject; const Point: TPointF) of object;
  TTouchEvent = procedure(Sender: TObject; const Touches: TTouches; const Action: TTouchAction) of object;
  TItemControlEvent = procedure(const Sender: TObject; const AItem: TListItem; const AObject: TListItemSimpleControl) of object;
  TUpdatingObjectsEvent = procedure(const Sender: TObject; const AItem: TListViewItem; var AHandled: Boolean) of object;
  TOnGetValue = procedure(Sender: TObject; const ACol, ARow: Integer; var Value: System.Rtti.TValue) of object;

type
  TNotifyEventReference = reference to procedure(Sender: TObject);
  TNofifyKeyEventReference = reference to procedure(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
  TNotifyItemBoxEventReference = reference to procedure(const Sender: TCustomListBox; const Item: TListBoxItem);
  TNotifyItemViewEventReference = reference to procedure(const Sender: TObject; const AItem: TListViewItem);
  TNotifyPaintEventReference = reference to procedure(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
  TNotifyMouseEventReference = reference to procedure(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
  TNotifyItemButtonEventReference = reference to procedure(const Sender: TObject; const AItem: TListItem; const AObject: TListItemSimpleControl);
  TNotifyItemUpdatingEventReference = reference to procedure(const Sender: TObject; const AItem: TListViewItem; var AHandled: Boolean);
  TNotifyOnGetValueEventReference = reference to procedure(Sender: TObject; const ACol, ARow: Integer; var Value: System.Rtti.TValue);

type
  TNotifyEventWrapper = class(TComponent)
  private
    FProc: TNotifyEventReference;
  public
    constructor Create(Owner: TComponent; Proc: TNotifyEventReference); reintroduce;
  published
    procedure Event(Sender: TObject);
  end;

type
  TNotifyKeyEventWrapper = class(TComponent)
  private
    FProc: TNofifyKeyEventReference;
  public
    constructor Create(Owner: TComponent; Proc: TNofifyKeyEventReference); reintroduce;
  published
    procedure KeyEvent(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
  end;

type
  TNotifyItemBoxEventWrapper = class(TComponent)
  private
    FProc: TNotifyItemBoxEventReference;
  public
    constructor Create(Owner: TComponent; Proc: TNotifyItemBoxEventReference); reintroduce;
  published
    procedure ItemBoxEvent(const Sender: TCustomListBox; const AItem: TListBoxItem);
  end;

type
  TNotifyItemViewEventWrapper = class(TComponent)
  private
    FProc: TNotifyItemViewEventReference;
  public
    constructor Create(Owner: TComponent; Proc: TNotifyItemViewEventReference); reintroduce;
  published
    procedure ItemViewEvent(const Sender: TObject; const AItem: TListViewItem);
  end;

type
  TNotifyPaintEventWrapper = class(TComponent)
  private
    FProc: TNotifyPaintEventReference;
  public
    constructor Create(Owner: TComponent; Proc: TNotifyPaintEventReference); reintroduce;
  published
    procedure PaintEvent(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
  end;

type
  TNotifyItemButtonEventWrapper = class(TComponent)
  private
    FProc: TNotifyItemButtonEventReference;
  public
    constructor Create(Owner: TComponent; Proc: TNotifyItemButtonEventReference); reintroduce;
  published
    procedure ItemControlEvent(const Sender: TObject; const AItem: TListItem; const AObject: TListItemSimpleControl);
  end;

type
  TNotifyItemUpdatingEventReferenceWrapper = class(TComponent)
  private
    FProc: TNotifyItemUpdatingEventReference;
  public
    constructor Create(Owner: TComponent; Proc: TNotifyItemUpdatingEventReference); reintroduce;
  published
    procedure ItemUpdatingEvent(const Sender: TObject; const AItem: TListViewItem; var AHandled: Boolean);
  end;

type
  TNotifyOnGetValueEventReferenceWrapper = class(TComponent)
  private
    FProc: TNotifyOnGetValueEventReference;
  public
    constructor Create(Owner: TComponent; Proc: TNotifyOnGetValueEventReference); reintroduce;
  published
    procedure OnGetValue(Sender: TObject; const ACol, ARow: Integer; var Value: System.Rtti.TValue);
  end;

type
  TEventComponent = class(TComponent)
  protected
    FAnon: TProc;
    procedure Notify(Sender: TObject);
    class function MakeComponent(const AOwner: TComponent; const AProc: TProc) : TEventComponent;
  public
    class procedure MethodReferenceToMethodPointer(const MethodReference; var MethodPointer);
    class function NotifyEvent(const AOwner: TComponent; const AProc: TProc) : TNotifyEvent; overload;
    class function NotifyEvent(const ANotifyReference: TNotifyEventReference) : TNotifyEvent; overload;
  end;

  { Shortcut Functions }
function DelegateEvent(Owner: TComponent; Proc: TNotifyEventReference) : TNotifyEvent;
function DelegateKeyEvent(Owner: TComponent; Proc: TNofifyKeyEventReference) : TKeyEvent;
function DelegatePaintEvent(Owner: TComponent; Proc: TNotifyPaintEventReference) : TPaintEvent;
function DelegateItemBoxEvent(Owner: TComponent; Proc: TNotifyItemBoxEventReference) : TItemBoxEvent;
function DelegateItemViewEvent(Owner: TComponent; Proc: TNotifyItemViewEventReference) : TItemViewEvent;
function DelegateItemButtonEvent(Owner: TComponent; Proc: TNotifyItemButtonEventReference): TItemControlEvent;
function DelegateItemUpdatingEvent(Owner: TComponent; Proc: TNotifyItemUpdatingEventReference): TUpdatingObjectsEvent;
function DelegateOnGetValueEvent(Owner: TComponent; Proc: TNotifyOnGetValueEventReference): TOnGetValue;

implementation

{ TNotifyEventWrapper }

constructor TNotifyEventWrapper.Create(Owner: TComponent; Proc: TNotifyEventReference);
begin
  inherited Create(Owner);
  FProc := Proc;
end;

procedure TNotifyEventWrapper.Event(Sender: TObject);
begin
  FProc(Sender);
end;

function DelegateEvent(Owner: TComponent; Proc: TNotifyEventReference) : TNotifyEvent;
begin
  Result := TNotifyEventWrapper.Create(Owner, Proc).Event;
end;

{ TNotifyKeyEventWrapper }

constructor TNotifyKeyEventWrapper.Create(Owner: TComponent; Proc: TNofifyKeyEventReference);
begin
  inherited Create(Owner);
  FProc := Proc;
end;

procedure TNotifyKeyEventWrapper.KeyEvent(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  FProc(Sender, Key, KeyChar, Shift);
end;

function DelegateKeyEvent(Owner: TComponent; Proc: TNofifyKeyEventReference) : TKeyEvent;
begin
  Result := TNotifyKeyEventWrapper.Create(Owner, Proc).KeyEvent;
end;

{ TNotifyItemViewEventWrapper }

constructor TNotifyItemViewEventWrapper.Create(Owner: TComponent; Proc: TNotifyItemViewEventReference);
begin
  inherited Create(Owner);
  FProc := Proc;
end;

procedure TNotifyItemViewEventWrapper.ItemViewEvent(const Sender: TObject; const AItem: TListViewItem);
begin
  FProc(Sender, AItem);
end;

function DelegateItemViewEvent(Owner: TComponent; Proc: TNotifyItemViewEventReference) : TItemViewEvent;
begin
  Result := TNotifyItemViewEventWrapper.Create(Owner, Proc).ItemViewEvent;
end;

{ TNotifyItemBoxEventWrapper }

constructor TNotifyItemBoxEventWrapper.Create(Owner: TComponent; Proc: TNotifyItemBoxEventReference);
begin
  inherited Create(Owner);
  FProc := Proc;
end;

procedure TNotifyItemBoxEventWrapper.ItemBoxEvent(const Sender: TCustomListBox; const AItem: TListBoxItem);
begin
  FProc(Sender, AItem);
end;

function DelegateItemBoxEvent(Owner: TComponent; Proc: TNotifyItemBoxEventReference) : TItemBoxEvent;
begin
  Result := TNotifyItemBoxEventWrapper.Create(Owner, Proc).ItemBoxEvent;
end;

{ TNotifyItemButtonEventWrapper }

constructor TNotifyItemButtonEventWrapper.Create(Owner: TComponent; Proc: TNotifyItemButtonEventReference);
begin
  inherited Create(Owner);
  FProc := Proc;
end;

procedure TNotifyItemButtonEventWrapper.ItemControlEvent(const Sender: TObject; const AItem: TListItem; const AObject: TListItemSimpleControl);
begin
  FProc(Sender, AItem, AObject);
end;

function DelegateItemButtonEvent(Owner: TComponent; Proc: TNotifyItemButtonEventReference): TItemControlEvent;
begin
  Result := TNotifyItemButtonEventWrapper.Create(Owner, Proc).ItemControlEvent;
end;

{ TNotifyPaintEventWrapper }

constructor TNotifyPaintEventWrapper.Create(Owner: TComponent; Proc: TNotifyPaintEventReference);
begin
  inherited Create(Owner);
  FProc := Proc;
end;

procedure TNotifyPaintEventWrapper.PaintEvent(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
begin
  FProc(Sender, Canvas, ARect);
end;

function DelegatePaintEvent(Owner: TComponent; Proc: TNotifyPaintEventReference) : TPaintEvent;
begin
  Result := TNotifyPaintEventWrapper.Create(Owner, Proc).PaintEvent;
end;

{ TNotifyItemUpdatingEventReferenceWrapper }

constructor TNotifyItemUpdatingEventReferenceWrapper.Create(Owner: TComponent; Proc: TNotifyItemUpdatingEventReference);
begin
  inherited Create(Owner);
  FProc := Proc;
end;

procedure TNotifyItemUpdatingEventReferenceWrapper.ItemUpdatingEvent(const Sender: TObject; const AItem: TListViewItem; var AHandled: Boolean);
begin
  FProc(Sender, AItem, AHandled);
end;

function DelegateItemUpdatingEvent(Owner: TComponent; Proc: TNotifyItemUpdatingEventReference): TUpdatingObjectsEvent;
begin
  Result := TNotifyItemUpdatingEventReferenceWrapper.Create(Owner, Proc).ItemUpdatingEvent;
end;

{ TNotifyOnGetValueEventReferenceWrapper }

constructor TNotifyOnGetValueEventReferenceWrapper.Create(Owner: TComponent; Proc: TNotifyOnGetValueEventReference);
begin
  inherited Create(Owner);
  FProc := Proc;
end;

procedure TNotifyOnGetValueEventReferenceWrapper.OnGetValue(Sender: TObject; const ACol, ARow: Integer; var Value: System.Rtti.TValue);
begin
  FProc(Sender, ACol, ARow, Value);
end;

function DelegateOnGetValueEvent(Owner: TComponent; Proc: TNotifyOnGetValueEventReference): TOnGetValue;
begin
  Result := TNotifyOnGetValueEventReferenceWrapper.Create(Owner, Proc).OnGetValue;
end;

{ TEventComponent }

class function TEventComponent.MakeComponent(const AOwner: TComponent; const AProc: TProc): TEventComponent;
begin
  Result := TEventComponent.Create(AOwner);
  Result.FAnon := AProc;
end;

class function TEventComponent.NotifyEvent(const AOwner: TComponent; const AProc: TProc): TNotifyEvent;
begin
  Result := MakeComponent(AOwner, AProc).Notify;
end;

class procedure TEventComponent.MethodReferenceToMethodPointer(const MethodReference; var MethodPointer);
type
  TVtable = array [0 .. 3] of Pointer;
  PVtable = ^TVtable;
  PPVtable = ^PVtable;
begin
  System.TMethod(MethodPointer).Code := PPVtable(MethodReference)^^[3];
  System.TMethod(MethodPointer).Data := Pointer(MethodReference);
end;

class function TEventComponent.NotifyEvent(const ANotifyReference : TNotifyEventReference): TNotifyEvent;
begin
  TEventComponent.MethodReferenceToMethodPointer(ANotifyReference, Result);
end;

procedure TEventComponent.Notify(Sender: TObject);
begin
  FAnon();
end;

end.

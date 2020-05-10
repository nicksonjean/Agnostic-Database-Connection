program Project1;

uses
  System.StartUpCopy,
  FMX.Forms,
  SQLConnection in 'SQLConnection\SQLConnection.pas',
  EventDriven in 'SQLConnection\EventDriven\EventDriven.pas',
  Locale in 'SQLConnection\Types\Locale\Locale.pas',
  Connector in 'SQLConnection\Connector\Connector.pas',
  FMX.ListView.Extension in 'SQLConnection\Extensions\FMX.ListView\FMX.ListView.Extension.pas',
  FMX.Grid.Helper in 'SQLConnection\Helpers\FMX.Grid\FMX.Grid.Helper.pas',
  FMX.ListBox.Helper in 'SQLConnection\Helpers\FMX.ListBox\FMX.ListBox.Helper.pas',
  FMX.ListView.Helper in 'SQLConnection\Helpers\FMX.ListView\FMX.ListView.Helper.pas',
  FMX.StringGrid.Helper in 'SQLConnection\Helpers\FMX.StringGrid\FMX.StringGrid.Helper.pas',
  FMX.Edit.Helper in 'SQLConnection\Helpers\FMX.Edit\FMX.Edit.Helper.pas',
  FMX.&Object.Helper in 'SQLConnection\Helpers\FMX.Object\FMX.Object.Helper.pas',
  Float in 'SQLConnection\Types\Float.pas',
  &String in 'SQLConnection\Types\String.pas',
  &Array in 'SQLConnection\Types\Array.pas',
  TimeDate in 'SQLConnection\Types\TimeDate.pas',
  MimeType in 'SQLConnection\Reflection\MimeType.pas',
  Unit1 in 'Unit1.pas' {SQLConnectionTester};

{$R *.res}

begin
  //ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.CreateForm(TSQLConnectionTester, SQLConnectionTester);
  Application.Run;
end.

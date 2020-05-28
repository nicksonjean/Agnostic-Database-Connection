unit Unit1;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.Rtti,
  System.StrUtils,
  System.Generics.Collections,

  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.TabControl,
  FMX.Bind.Editors,
  FMX.Grid.Style,
  FMX.ScrollBox,
  FMX.Grid,
  FMX.Bind.DBEngExt,
  FMX.Bind.Grid,
  FMX.ExtCtrls,
  FMX.ListBox,
  FMX.ComboEdit,
  FMX.Layouts,
  FMX.Edit,
  FMX.ListView.Types,
  FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base,
  FMX.ListView,
  FMX.Objects,
  FMX.SearchBox,
  FMX.Memo,
  FMX.Pickers,

  FMX.Edit.Helper,
  FMX.&Object.Helper,
  TimeDate,
  Float,
  &Array,
  MimeType,
  SQLConnection,
  Connector
  ;

const
  Methods: Array of String = ['Fetch','Copy','Clone','ToList','ToTags','ToXML','ToJSON','ToYAML'];

type
  TSQLConnectionTester = class(TForm)
    TabControl: TTabControl;
    TabSQLConnection: TTabItem;
    TabDataTypes: TTabItem;
    TabControlSQLConnection: TTabControl;
    TabDBSQLite: TTabItem;
    GroupBoxComponentsSQLite: TGroupBox;
    GridPanelLayoutSQLite: TGridPanelLayout;
    LabelComboBoxSQLite: TLabel;
    LabelComboEditSQLite: TLabel;
    ComboBoxSQLite: TComboBox;
    ComboEditSQLite: TComboEdit;
    LabelListBoxSQLite: TLabel;
    LabelListViewSQLite: TLabel;
    ListBoxSQLite: TListBox;
    ListViewSQLite: TListView;
    LabelStringGridSQLite: TLabel;
    LabelGridSQLite: TLabel;
    StringGridSQLite: TStringGrid;
    GridSQLite: TGrid;
    TabDBFirebird: TTabItem;
    GroupBoxComponentsFirebird: TGroupBox;
    GridPanelLayoutFirebird: TGridPanelLayout;
    LabelComboBoxFirebird: TLabel;
    LabelComboEditFirebird: TLabel;
    ComboEditFirebird: TComboEdit;
    LabelListBoxFirebird: TLabel;
    LabelListViewFirebird: TLabel;
    LabelStringGridFirebird: TLabel;
    LabelGridFirebird: TLabel;
    ComboBoxFirebird: TComboBox;
    ListBoxFirebird: TListBox;
    ListViewFirebird: TListView;
    StringGridFirebird: TStringGrid;
    GridFirebird: TGrid;
    TabDBMySQL: TTabItem;
    GroupBoxComponentsMySQL: TGroupBox;
    GridPanelLayoutMySQL: TGridPanelLayout;
    LabelComboBoxMySQL: TLabel;
    LabelComboEditMySQL: TLabel;
    ComboEditMySQL: TComboEdit;
    LabelListBoxMySQL: TLabel;
    LabelListViewMySQL: TLabel;
    LabelStringGridMySQL: TLabel;
    LabelGridMySQL: TLabel;
    ComboBoxMySQL: TComboBox;
    ListBoxMySQL: TListBox;
    ListViewMySQL: TListView;
    StringGridMySQL: TStringGrid;
    GridMySQL: TGrid;
    TabDBPostgreSQL: TTabItem;
    GroupBoxComponentsPostgreSQL: TGroupBox;
    GridPanelLayoutPostgreSQL: TGridPanelLayout;
    LabelComboBoxPostgreSQL: TLabel;
    LabelComboEditPostgreSQL: TLabel;
    ComboEditPostgreSQL: TComboEdit;
    LabelListBoxPostgreSQL: TLabel;
    LabelListViewPostgreSQL: TLabel;
    LabelStringGridPostgreSQL: TLabel;
    LabelGridPostgreSQL: TLabel;
    ComboBoxPostgreSQL: TComboBox;
    ListBoxPostgreSQL: TListBox;
    ListViewPostgreSQL: TListView;
    StringGridPostgreSQL: TStringGrid;
    GridPostgreSQL: TGrid;
    SearchBoxSQLite: TSearchBox;
    SearchBoxFirebird: TSearchBox;
    SearchBoxMySQL: TSearchBox;
    SearchBoxPostgreSQL: TSearchBox;
    TabQueryBuilder: TTabItem;
    TabControlDataTypes: TTabControl;
    TabStrings: TTabItem;
    TabFloats: TTabItem;
    TabDateTime: TTabItem;
    TabArrays: TTabItem;
    GroupBoxQueryBuilderArrays: TGroupBox;
    GridPanelLayoutQueryBuilderArray: TGridPanelLayout;
    LabelQueryBuilderArray: TLabel;
    LabelQueryBuilderArrayVariant: TLabel;
    LabelQueryBuilderArrayField: TLabel;
    ComboBoxQueryBuilderArray: TComboBox;
    ComboBoxQueryBuilderArrayVariant: TComboBox;
    ComboBoxQueryBuilderArrayField: TComboBox;
    GroupBoxDataTypeArray: TGroupBox;
    GridPanelLayoutDataTypeArray: TGridPanelLayout;
    LabelDataTypeArray: TLabel;
    LabelDataTypeArrayVariant: TLabel;
    LabelDataTypeArrayField: TLabel;
    ComboBoxDataTypeTArray: TComboBox;
    ComboBoxDataTypeTArrayVariant: TComboBox;
    ComboBoxDataTypeTArrayField: TComboBox;
    MemoQueryBuilderArrayResult: TMemo;
    MemoDataTypeArrayResult: TMemo;
    GridPanelLayoutFloats: TGridPanelLayout;
    GroupBoxFloatFormat: TGroupBox;
    GridPanelLayoutFloatFormat: TGridPanelLayout;
    LayoutFloatFormatTest1: TLayout;
    EditLength1: TEdit;
    EditDecimal1: TEdit;
    LayoutFloatFormatTest2: TLayout;
    EditLength2: TEdit;
    EditDecimal2: TEdit;
    LayoutFloatFormatTest3: TLayout;
    EditLength3: TEdit;
    EditDecimal3: TEdit;
    LayoutFloatFormatTest4: TLayout;
    EditLength4: TEdit;
    EditDecimal4: TEdit;
    LayoutFloatFormatTest5: TLayout;
    EditLength5: TEdit;
    EditDecimal5: TEdit;
    LayoutFloatFormatTest6: TLayout;
    EditLength6: TEdit;
    EditDecimal6: TEdit;
    LayoutFloatFormatTest7: TLayout;
    EditLength7: TEdit;
    EditDecimal7: TEdit;
    MemoResultFormat: TMemo;
    GroupBoxFloatCalculate: TGroupBox;
    GridPanelLayoutFloatCalculate: TGridPanelLayout;
    Calculate: TButton;
    MemoResultCalculate: TMemo;
    ComboBoxResult1: TComboBox;
    ComboBoxResult2: TComboBox;
    ComboBoxResult3: TComboBox;
    ComboBoxResult4: TComboBox;
    ComboBoxResult5: TComboBox;
    ComboBoxResult6: TComboBox;
    ComboBoxResult7: TComboBox;
    GridPanelLayoutFloatCalculate1: TGridPanelLayout;
    EditCalculate1: TEdit;
    EditAmount1: TEdit;
    GridPanelLayoutFloatCalculate2: TGridPanelLayout;
    EditCalculate2: TEdit;
    EditAmount2: TEdit;
    GridPanelLayoutFloatCalculate3: TGridPanelLayout;
    EditCalculate3: TEdit;
    EditAmount3: TEdit;
    GridPanelLayoutFloatCalculate4: TGridPanelLayout;
    EditCalculate4: TEdit;
    EditAmount4: TEdit;
    GridPanelLayoutFloatCalculate5: TGridPanelLayout;
    EditCalculate5: TEdit;
    EditAmount5: TEdit;
    GridPanelLayoutFloatCalculate6: TGridPanelLayout;
    EditCalculate6: TEdit;
    EditAmount6: TEdit;
    GridPanelLayoutFloatCalculate7: TGridPanelLayout;
    EditCalculate7: TEdit;
    EditAmount7: TEdit;
    EditOperation1: TEdit;
    EditOperation2: TEdit;
    EditOperation3: TEdit;
    EditOperation4: TEdit;
    EditOperation5: TEdit;
    EditOperation6: TEdit;
    EditOperation7: TEdit;
    GridPanelLayoutFloatFormatActions: TGridPanelLayout;
    FormatExplicit: TButton;
    FormatImplicit: TButton;
    GridPanelLayoutPlaceholderMasks: TGridPanelLayout;
    EditKeyDownFloat: TEdit;
    EditKeyDownMoney: TEdit;
    Button1: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
    ComboEdit1: TComboEdit;
    procedure TabDBSQLiteClick(Sender: TObject);
    procedure TabDBFirebirdClick(Sender: TObject);
    procedure TabDBMySQLClick(Sender: TObject);
    procedure TabDBPostgreSQLClick(Sender: TObject);
    procedure ComboBoxDataTypeTArrayChange(Sender: TObject);
    procedure ComboBoxDataTypeTArrayVariantChange(Sender: TObject);
    procedure ComboBoxDataTypeTArrayFieldChange(Sender: TObject);
    procedure FormatExplicitClick(Sender: TObject);
    procedure CalculateClick(Sender: TObject);
    procedure FormatImplicitClick(Sender: TObject);
    procedure EditKeyDownMoneyKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure EditKeyDownFloatKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBoxSQLiteChange(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
    function ArrayTest(const MethodName : String) : String;
    function ArrayVariantTest(const MethodName : String) : String;
    function ArrayFieldTest(const MethodName : String) : String;
  end;

var
  SQLConnectionTester: TSQLConnectionTester;

implementation

{$R *.fmx}

function TSQLConnectionTester.ArrayTest(const MethodName : String) : String;
var
  Array1, Array2: TArray;
  Query: TQueryBuilder;
  SQL: TQuery;
  DB: TConnection;
begin
  DB := TConnection.Create;
  //DB := TConnectionClass.GetInstance();
  try
    DB.Driver := MYSQL;
    DB.Host := '127.0.0.1';
    DB.Port := 3306;
    DB.Database := 'demodev';
    DB.Username := 'root';
    DB.Password := '';

    if not DB.GetInstance.Connection.Connected then
      DB.GetInstance.Connection.Connected := True;

    Array1 := TArray.Create;
    try
      Array1.Clear;

      if MethodName <> 'Fetch' then
      begin
        SQL := Query.View('SELECT * FROM test_fields');
        Array1['field_inc'] := SQL.Query.FieldByName('field_inc').Value;
        Array1['field_int'] := SQL.Query.FieldByName('field_int').Value;
        Array1['field_char'] := SQL.Query.FieldByName('field_char').Value;
        Array1['field_varchar'] := SQL.Query.FieldByName('field_varchar').Value;
        Array1['field_enum'] := SQL.Query.FieldByName('field_enum').Value;
        Array1['field_set'] := SQL.Query.FieldByName('field_set').Value;
        Array1['field_date'] := SQL.Query.FieldByName('field_date').Value;
        Array1['field_time'] := SQL.Query.FieldByName('field_time').Value;
        Array1['field_year'] := SQL.Query.FieldByName('field_year').Value;
        Array1['field_datetime'] := SQL.Query.FieldByName('field_datetime').Value;
        Array1['field_timestamp'] := SQL.Query.FieldByName('field_timestamp').Value;
        Array1['field_decimal'] := SQL.Query.FieldByName('field_decimal').Value;
        Array1['field_float'] := SQL.Query.FieldByName('field_float').Value;
        Array1['field_double'] := SQL.Query.FieldByName('field_double').Value;
        Array1['field_bit'] := SQL.Query.FieldByName('field_bit').Value;
        Array1['field_binary'] := Trim(TEncoding.UTF8.GetString(SQL.Query.FieldByName('field_binary').Value));
        Array1['field_blob'] := Trim(TEncoding.UTF8.GetString(SQL.Query.FieldByName('field_blob').Value)); // Leitura
        //Array1['field_blob'] := TBase64.ToEncode(TEncoding.UTF8.GetString(SQL.Query.FieldByName('field_blob').Value)); // Grava��o
        Array1['field_base64'] := SQL.Query.FieldByName('field_base64').Value;
        Array1['field_varbinary'] := Trim(TEncoding.UTF8.GetString(SQL.Query.FieldByName('field_varbinary').Value));
        Array1['field_null'] := System.StrUtils.IfThen(SQL.Query.FieldByName('field_null').Value = NULL, 'null', SQL.Query.FieldByName('field_null').Value);
      end;

      case AnsiIndexStr(MethodName, Methods) of
        0 :
        begin
          Query.FetchOne('SELECT * FROM test_fields', Array1);
          Result := Array1.ToList(True);
        end;
        1 :
        begin
          Array2 := TArray.Create;
          Array2.Clear;
          Array2['field_copied'] := 'field_copied';
          Array2.Assign(Array1);
          Result := Array2.ToList(True);
          FreeAndNil(Array2);
        end;
        2 :
        begin
          Array2 := TArray.Create(Array1);
          Result := Array2.ToList(True);
          FreeAndNil(Array2);
        end;
        3 : Result := Array1.ToList(True);
        4 : Result := Array1.ToTags(True);
        5 : Result := Array1.ToXML(True);
        6 : Result := Array1.ToJSON(True);
        7 : Result := '';
      end;

    finally
      FreeAndNil(Array1);
    end;

  finally
    FreeAndNil(DB);
  end;
end;

function TSQLConnectionTester.ArrayVariantTest(const MethodName : String) : String;
var
  Array1, Array2: TArrayVariant;
  Query: TQueryBuilder;
  SQL: TQuery;
  DB: TConnection;
begin
  DB := TConnection.Create;
  //DB := TConnectionClass.GetInstance();
  try
    DB.Driver := MYSQL;
    DB.Host := '127.0.0.1';
    DB.Port := 3306;
    DB.Database := 'demodev';
    DB.Username := 'root';
    DB.Password := '';

    if not DB.GetInstance.Connection.Connected then
      DB.GetInstance.Connection.Connected := True;

    Array1 := TArrayVariant.Create;
    try
      Array1.Clear;

      if MethodName <> 'Fetch' then
      begin
        SQL := Query.View('SELECT * FROM test_fields');
        Array1['field_inc'] := SQL.Query.FieldByName('field_inc').Value;
        Array1['field_int'] := SQL.Query.FieldByName('field_int').Value;
        Array1['field_char'] := SQL.Query.FieldByName('field_char').Value;
        Array1['field_varchar'] := SQL.Query.FieldByName('field_varchar').Value;
        Array1['field_enum'] := SQL.Query.FieldByName('field_enum').Value;
        Array1['field_set'] := SQL.Query.FieldByName('field_set').Value;
        Array1['field_date'] := SQL.Query.FieldByName('field_date').Value;
        Array1['field_time'] := SQL.Query.FieldByName('field_time').Value;
        Array1['field_year'] := SQL.Query.FieldByName('field_year').Value;
        Array1['field_datetime'] := SQL.Query.FieldByName('field_datetime').Value;
        Array1['field_timestamp'] := SQL.Query.FieldByName('field_timestamp').Value;
        Array1['field_decimal'] := SQL.Query.FieldByName('field_decimal').Value;
        Array1['field_float'] := SQL.Query.FieldByName('field_float').Value;
        Array1['field_double'] := SQL.Query.FieldByName('field_double').Value;
        Array1['field_bit'] := SQL.Query.FieldByName('field_bit').Value;
        Array1['field_binary'] := SQL.Query.FieldByName('field_binary').Value;
        Array1['field_blob'] := SQL.Query.FieldByName('field_blob').Value;
        Array1['field_base64'] := SQL.Query.FieldByName('field_base64').Value;
        Array1['field_varbinary'] := SQL.Query.FieldByName('field_varbinary').Value;
        Array1['field_null'] := SQL.Query.FieldByName('field_null').Value;
      end;

      case AnsiIndexStr(MethodName, Methods) of
        0 :
        begin
          Query.FetchOne('SELECT * FROM test_fields', Array1);
          Result := Array1.ToList(True);
        end;
        1 :
        begin
          Array2 := TArrayVariant.Create;
          Array2.Clear;
          Array2['field_copied'] := 'field_copied';
          Array2.Assign(Array1);
          Result := Array2.ToList(True);
          FreeAndNil(Array2);
        end;
        2 :
        begin
          Array2 := TArrayVariant.Create(Array1);
          Result := Array2.ToList(True);
          FreeAndNil(Array2);
        end;
        3 : Result := Array1.ToList(True);
        4 : Result := Array1.ToTags(True);
        5 : Result := Array1.ToXML(True);
        6 : Result := Array1.ToJSON(True);
        7 : Result := '';
      end;

    finally
      FreeAndNil(Array1);
    end;

  finally
    FreeAndNil(DB);
  end;
end;

procedure TSQLConnectionTester.Button1Click(Sender: TObject);
var
  Array1 : TArrayAssoc;
  Query: TQueryBuilder;
//  SQL: TQuery;
  DB: TConnection;
//  Item: TPair<Variant, TArrayAssoc>;
//  Enum: TPair<Variant, TArrayAssoc>;
begin
  DB := TConnection.Create;
  //DB := TConnectionClass.GetInstance();
  try
    DB.Driver := MYSQL;
    DB.Host := '127.0.0.1';
    DB.Port := 3306;
    DB.Database := 'demodev';
    DB.Username := 'root';
    DB.Password := '';

    if not DB.GetInstance.Connection.Connected then
      DB.GetInstance.Connection.Connected := True;

    Array1 := TArrayAssoc.Create;
    try
      Array1.Clear;

      Query.FetchAll('SELECT * FROM test_fields', Array1);
      Showmessage(Array1.ToList(True));
      Showmessage(Array1.ToTags(True));
      Showmessage(Array1.ToXML(True));
      Showmessage(Array1.ToJSON(True));

//      for Enum in Array1.ToArray do
//      begin
//        for Item in Enum.Value.ToArray do
//        begin
//          //Showmessage('Property ' + String(Item.Key) + ' = ' + String(Enum.Value[Item.Key].Val));
//        end;
//      end;

    finally
      FreeAndNil(Array1);
    end;

  finally
    FreeAndNil(DB);
  end;
end;

procedure TSQLConnectionTester.Button2Click(Sender: TObject);
var
  i: Integer;
begin
  { ComboBox1 }
  ComboBox1.DropDownKind := TDropDownKind.Custom;
  for i := 0 to 9 do
    ComboBox1.Items.Add(Format('Item_%d', [i]));

  with ComboBox1 do
  begin
    ItemIndex := 0;
    DropDownCount := 5;
    TListBox(ListBox).AlternatingRowBackground := True;
  end;

  { ComboEdit1 }
  ComboEdit1.DropDownKind := TDropDownKind.Custom;
  ComboEdit1.Items.Assign(ComboBox1.Items);
  with ComboEdit1 do
  begin
    ItemIndex := 0;
    DropDownCount := 5;
    //TListBox(ListBox).AlternatingRowBackground := True;
  end;
//  ComboEdit1.Text := 'Text';
end;

function TSQLConnectionTester.ArrayFieldTest(const MethodName : String) : String;
var
  Array1, Array2: TArrayField;
  Array3: TArrayVariant;
  Query: TQueryBuilder;
  SQL: TQuery;
  DB: TConnection;
begin
  DB := TConnection.Create;
  //DB := TConnectionClass.GetInstance();
  try
    DB.Driver := MYSQL;
    DB.Host := '127.0.0.1';
    DB.Port := 3306;
    DB.Database := 'demodev';
    DB.Username := 'root';
    DB.Password := '';

    if not DB.GetInstance.Connection.Connected then
      DB.GetInstance.Connection.Connected := True;

    Array1 := TArrayField.Create;
    try
      Array1.Clear;

      if MethodName <> 'Fetch' then
      begin
        SQL := Query.View('SELECT * FROM test_fields');
        Array1['field_inc'] := SQL.Query.FieldByName('field_inc');
        Array1['field_int'] := SQL.Query.FieldByName('field_int');
        Array1['field_char'] := SQL.Query.FieldByName('field_char');
        Array1['field_varchar'] := SQL.Query.FieldByName('field_varchar');
        Array1['field_enum'] := SQL.Query.FieldByName('field_enum');
        Array1['field_set'] := SQL.Query.FieldByName('field_set');
        Array1['field_date'] := SQL.Query.FieldByName('field_date');
        Array1['field_time'] := SQL.Query.FieldByName('field_time');
        Array1['field_year'] := SQL.Query.FieldByName('field_year');
        Array1['field_datetime'] := SQL.Query.FieldByName('field_datetime');
        Array1['field_timestamp'] := SQL.Query.FieldByName('field_timestamp');
        Array1['field_decimal'] := SQL.Query.FieldByName('field_decimal');
        Array1['field_float'] := SQL.Query.FieldByName('field_float');
        Array1['field_double'] := SQL.Query.FieldByName('field_double');
        Array1['field_bit'] := SQL.Query.FieldByName('field_bit');
        Array1['field_binary'] := SQL.Query.FieldByName('field_binary');
        Array1['field_blob'] := SQL.Query.FieldByName('field_blob');
        Array1['field_base64'] := SQL.Query.FieldByName('field_base64');
        Array1['field_varbinary'] := SQL.Query.FieldByName('field_varbinary');
        Array1['field_null'] := SQL.Query.FieldByName('field_null');
      end;

      case AnsiIndexStr(MethodName, Methods) of
        0 :
        begin
          Query.FetchOne('SELECT * FROM test_fields', Array1);
          Result := Array1.ToList(True);
        end;
        1 :
        begin
          Array3 := TArrayVariant.Create;
          Array3.Clear;
          Array3['field_cloned'] := 'cloned_field';
          Array3.Assign(Array1);
          Result := Array3.ToList(True);
          FreeAndNil(Array3);
        end;
        2 :
        begin
          Array2 := TArrayField.Create(Array1);
          Result := Array2.ToList(True);
          FreeAndNil(Array2);
        end;
        3 : Result := Array1.ToList(True);
        4 : Result := Array1.ToTags(True);
        5 : Result := Array1.ToXML(True);
        6 : Result := Array1.ToJSON(True);
        7 : Result := '';
      end;

    finally
      FreeAndNil(Array1);
    end;

  finally
    FreeAndNil(DB);
  end;
end;

procedure TSQLConnectionTester.EditKeyDownFloatKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  TEdit(Sender).SetMaskFloatKeyDown(KeyChar, Key);
end;

procedure TSQLConnectionTester.EditKeyDownMoneyKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  TEdit(Sender).SetMaskMoneyKeyDown(KeyChar, Key);
end;

procedure TSQLConnectionTester.ComboBoxDataTypeTArrayChange(Sender: TObject);
var
  Value : String;
begin
  Value := TComboBox(Sender).Selected.Text;
  case AnsiIndexStr(Value, Methods) of
    0 : MemoDataTypeArrayResult.Lines.Text := Self.ArrayTest(Value);
    1 : MemoDataTypeArrayResult.Lines.Text := Self.ArrayTest(Value);
    2 : MemoDataTypeArrayResult.Lines.Text := Self.ArrayTest(Value);
    3 : MemoDataTypeArrayResult.Lines.Text := Self.ArrayTest(Value);
    4 : MemoDataTypeArrayResult.Lines.Text := Self.ArrayTest(Value);
    5 : MemoDataTypeArrayResult.Lines.Text := Self.ArrayTest(Value);
    6 : MemoDataTypeArrayResult.Lines.Text := Self.ArrayTest(Value);
    7 : MemoDataTypeArrayResult.Lines.Text := Self.ArrayTest(Value);
  end;
end;

procedure TSQLConnectionTester.ComboBoxDataTypeTArrayVariantChange(Sender: TObject);
var
  Value : String;
begin
  Value := TComboBox(Sender).Selected.Text;
  case AnsiIndexStr(Value, Methods) of
    0 : MemoDataTypeArrayResult.Lines.Text := Self.ArrayVariantTest(Value);
    1 : MemoDataTypeArrayResult.Lines.Text := Self.ArrayVariantTest(Value);
    2 : MemoDataTypeArrayResult.Lines.Text := Self.ArrayVariantTest(Value);
    3 : MemoDataTypeArrayResult.Lines.Text := Self.ArrayVariantTest(Value);
    4 : MemoDataTypeArrayResult.Lines.Text := Self.ArrayVariantTest(Value);
    5 : MemoDataTypeArrayResult.Lines.Text := Self.ArrayVariantTest(Value);
    6 : MemoDataTypeArrayResult.Lines.Text := Self.ArrayVariantTest(Value);
    7 : MemoDataTypeArrayResult.Lines.Text := Self.ArrayVariantTest(Value);
  end;
end;

procedure TSQLConnectionTester.ComboBoxDataTypeTArrayFieldChange(Sender: TObject);
var
  Value : String;
begin
  Value := TComboBox(Sender).Selected.Text;
  case AnsiIndexStr(Value, Methods) of
    0 : MemoDataTypeArrayResult.Lines.Text := Self.ArrayFieldTest(Value);
    1 : MemoDataTypeArrayResult.Lines.Text := Self.ArrayFieldTest(Value);
    2 : MemoDataTypeArrayResult.Lines.Text := Self.ArrayFieldTest(Value);
    3 : MemoDataTypeArrayResult.Lines.Text := Self.ArrayFieldTest(Value);
    4 : MemoDataTypeArrayResult.Lines.Text := Self.ArrayFieldTest(Value);
    5 : MemoDataTypeArrayResult.Lines.Text := Self.ArrayFieldTest(Value);
    6 : MemoDataTypeArrayResult.Lines.Text := Self.ArrayFieldTest(Value);
    7 : MemoDataTypeArrayResult.Lines.Text := Self.ArrayFieldTest(Value);
  end;
end;

procedure TSQLConnectionTester.CalculateClick(Sender: TObject);
begin
  MemoResultCalculate.Lines.Clear;
  MemoResultCalculate.Lines.Append(
    'C�lculo com ToCurrency: ' + TFloat.ToString(EditCalculate1.Text) + ' * ' + TFloat.ToString(EditAmount1.Text)
     + ' - Truncando: ' + TFloat.ToString(CurrToStr(TFloat.ToCurrency(EditCalculate1.Text) * TFloat.ToCurrency(EditAmount1.Text)), 4, TResultMode.Truncate)
     + ' - Arredondando: ' + TFloat.ToString(CurrToStr(TFloat.ToCurrency(EditCalculate1.Text) * TFloat.ToCurrency(EditAmount1.Text)), 4, TResultMode.Round)
  );
  MemoResultCalculate.Lines.Append('------------------------------------------------------------------------------');
  MemoResultCalculate.Lines.Append(
    'C�lculo com Double: ' + TFloat.ToString(EditCalculate2.Text) + ' * ' + TFloat.ToString(EditAmount2.Text)
     + ' - Truncando: ' + TFloat.ToString(FloatToStr(TFloat.ToDouble(EditCalculate2.Text) * TFloat.ToDouble(EditAmount2.Text)), 4, TResultMode.Truncate)
     + ' - Arredondando: ' + TFloat.ToString(FloatToStr(TFloat.ToDouble(EditCalculate2.Text) * TFloat.ToDouble(EditAmount2.Text)), 4, TResultMode.Round)
  );
  MemoResultCalculate.Lines.Append('------------------------------------------------------------------------------');
  MemoResultCalculate.Lines.Append(
    'C�lculo com Extended: ' + TFloat.ToString(EditCalculate3.Text) + ' * ' + TFloat.ToString(EditAmount3.Text)
     + ' - Truncando: ' + TFloat.ToString(FloatToStr(TFloat.ToExtended(EditCalculate3.Text) * TFloat.ToExtended(EditAmount3.Text)), 4, TResultMode.Truncate)
     + ' - Arredondando: ' + TFloat.ToString(FloatToStr(TFloat.ToExtended(EditCalculate3.Text) * TFloat.ToExtended(EditAmount3.Text)), 4, TResultMode.Round)
  );
  MemoResultCalculate.Lines.Append('------------------------------------------------------------------------------');
  MemoResultCalculate.Lines.Append(
    'C�lculo com ToMoney: ' + TFloat.ToString(EditCalculate4.Text) + ' * ' + TFloat.ToString(EditAmount4.Text)
     + ' - Truncando: ' + TFloat.ToMoney(FloatToStr(TFloat.ToCurrency(EditCalculate4.Text) * TFloat.ToCurrency(EditAmount4.Text)), 4, TResultMode.Truncate)
     + ' - Arredondando: ' + TFloat.ToMoney(FloatToStr(TFloat.ToCurrency(EditCalculate4.Text) * TFloat.ToCurrency(EditAmount4.Text)), 4, TResultMode.Round)
  );
  MemoResultCalculate.Lines.Append('------------------------------------------------------------------------------');
  MemoResultCalculate.Lines.Append(
    'C�lculo com ToSQL: ' + TFloat.ToString(EditCalculate5.Text) + ' * ' + TFloat.ToString(EditAmount5.Text)
     + ' - Truncando: ' + TFloat.ToSQL(FloatToStr(TFloat.ToCurrency(EditCalculate5.Text) * TFloat.ToCurrency(EditAmount5.Text)), 4, TResultMode.Truncate)
     + ' - Arredondando: ' + TFloat.ToSQL(FloatToStr(TFloat.ToCurrency(EditCalculate5.Text) * TFloat.ToCurrency(EditAmount5.Text)), 4, TResultMode.Round)
  );
end;

procedure TSQLConnectionTester.FormatExplicitClick(Sender: TObject);
begin
  MemoResultFormat.Lines.Clear;
  MemoResultFormat.Lines.Append('Original: ' + EditLength1.Text + ' - Valor: ' + TFloat.ToString(EditLength1.Text, StrToInt(EditDecimal1.Text), TResultMode(ComboBoxResult1.ItemIndex)));
  MemoResultFormat.Lines.Append('------------------------------------------------------------------------------');
  MemoResultFormat.Lines.Append('Original: ' + EditLength2.Text + ' - Valor: ' + TFloat.ToString(EditLength2.Text, StrToInt(EditDecimal2.Text), TResultMode(ComboBoxResult2.ItemIndex)));
  MemoResultFormat.Lines.Append('------------------------------------------------------------------------------');
  MemoResultFormat.Lines.Append('Original: ' + EditLength3.Text + ' - Valor: ' + TFloat.ToString(EditLength3.Text, StrToInt(EditDecimal3.Text), TResultMode(ComboBoxResult3.ItemIndex)));
  MemoResultFormat.Lines.Append('------------------------------------------------------------------------------');
  MemoResultFormat.Lines.Append('Original: ' + EditLength4.Text + ' - Valor: ' + TFloat.ToString(EditLength4.Text, StrToInt(EditDecimal4.Text), TResultMode(ComboBoxResult4.ItemIndex)));
  MemoResultFormat.Lines.Append('------------------------------------------------------------------------------');
  MemoResultFormat.Lines.Append('Original: ' + EditLength5.Text + ' - Valor: ' + TFloat.ToString(EditLength5.Text, StrToInt(EditDecimal5.Text), TResultMode(ComboBoxResult5.ItemIndex)));
  MemoResultFormat.Lines.Append('------------------------------------------------------------------------------');
  MemoResultFormat.Lines.Append('Original: ' + EditLength6.Text + ' - Valor: ' + TFloat.ToString(EditLength6.Text, StrToInt(EditDecimal6.Text), TResultMode(ComboBoxResult6.ItemIndex)));
  MemoResultFormat.Lines.Append('------------------------------------------------------------------------------');
  MemoResultFormat.Lines.Append('Original: ' + EditLength7.Text + ' - Valor: ' + TFloat.ToString(EditLength7.Text, StrToInt(EditDecimal7.Text), TResultMode(ComboBoxResult7.ItemIndex)));
end;

procedure TSQLConnectionTester.FormatImplicitClick(Sender: TObject);
begin
  MemoResultFormat.Lines.Clear;
  MemoResultFormat.Lines.Append('Original: ' + EditLength1.Text + ' - Valor: ' + TFloat.ToString(EditLength1.Text));
  MemoResultFormat.Lines.Append('------------------------------------------------------------------------------');
  MemoResultFormat.Lines.Append('Original: ' + EditLength2.Text + ' - Valor: ' + TFloat.ToString(EditLength2.Text));
  MemoResultFormat.Lines.Append('------------------------------------------------------------------------------');
  MemoResultFormat.Lines.Append('Original: ' + EditLength3.Text + ' - Valor: ' + TFloat.ToString(EditLength3.Text));
  MemoResultFormat.Lines.Append('------------------------------------------------------------------------------');
  MemoResultFormat.Lines.Append('Original: ' + EditLength4.Text + ' - Valor: ' + TFloat.ToString(EditLength4.Text));
  MemoResultFormat.Lines.Append('------------------------------------------------------------------------------');
  MemoResultFormat.Lines.Append('Original: ' + EditLength5.Text + ' - Valor: ' + TFloat.ToString(EditLength5.Text));
  MemoResultFormat.Lines.Append('------------------------------------------------------------------------------');
  MemoResultFormat.Lines.Append('Original: ' + EditLength6.Text + ' - Valor: ' + TFloat.ToString(EditLength6.Text));
  MemoResultFormat.Lines.Append('------------------------------------------------------------------------------');
  MemoResultFormat.Lines.Append('Original: ' + EditLength7.Text + ' - Valor: ' + TFloat.ToString(EditLength7.Text));
end;

procedure TSQLConnectionTester.FormShow(Sender: TObject);
begin
  EditKeyDownMoney.Placeholder('M�scara Monet�ria');
  EditKeyDownFloat.Placeholder('M�scara Decimal[4]');
end;

procedure TSQLConnectionTester.TabDBFirebirdClick(Sender: TObject);
var
  DBFirebird : TConnection;
  SQL: TQuery;
  Query: TQueryBuilder;
  Connector: TConnector;
begin
  DBFirebird := TConnection.Create;
  //DBFirebird := TConnectionClass.GetInstance();
  try
    DBFirebird.Driver := FIREBIRD;
    DBFirebird.Host := '127.0.0.1';
    DBFirebird.Port := 3050;
    DBFirebird.Database :=
    {$IFDEF MSWINDOWS}
      ExtractFilePath(ParamStr(0)) + 'DB.FDB';
    {$ELSE}
      TPath.Combine(TPath.GetDocumentsPath, 'DB.FDB');
    {$ENDIF}
    DBFirebird.Username := 'SYSDBA';
    DBFirebird.Password := 'masterkey';

    if not DBFirebird.GetInstance.Connection.Connected then
      DBFirebird.GetInstance.Connection.Connected := True;

    SQL := TQuery.Create;
    try
      SQL := Query.View('SELECT "id" AS "Codigo", "nome" AS "Estado", "sigla" AS "Sigla" FROM "estado" ORDER BY "id"');

      Connector := TConnector.Create(SQL);
      try
        Connector.ToCombo(ComboBoxFirebird, 'Codigo', 'Estado', 1);
        Connector.ToCombo(ComboEditFirebird, 'Codigo', 'Estado', 2);
        Connector.ToListBox(ListBoxFirebird, 'Codigo', 'Estado', 3);
        Connector.ToListView(ListViewFirebird, 'Codigo', 'Estado', ['Sigla', 'Sigla', 'Sigla'], 4);
        Connector.ToGrid(StringGridFirebird, 5);
        Connector.ToGrid(GridFirebird, 6);
      finally
        Connector.Destroy;
      end;

    finally
      SQL.Destroy;
    end;

  finally
    DBFirebird.Destroy;
  end;
end;

procedure TSQLConnectionTester.TabDBMySQLClick(Sender: TObject);
var
  DBMySQL : TConnection;
  SQL: TQuery;
  Query: TQueryBuilder;
  Connector: TConnector;
begin
  DBMySQL := TConnection.Create;
  //DBMySQL := TConnectionClass.GetInstance();
  try
    DBMySQL.Driver := MYSQL;
    DBMySQL.Host := '127.0.0.1';
    DBMySQL.Port := 3306;
    DBMySQL.Database := 'demodev';
    DBMySQL.Username := 'root';
    DBMySQL.Password := '';

    if not DBMySQL.GetInstance.Connection.Connected then
      DBMySQL.GetInstance.Connection.Connected := True;

    SQL := TQuery.Create;
    try
      SQL := Query.View('SELECT id AS Codigo, nome AS Estado, sigla AS Sigla FROM estado ORDER BY id');

      Connector := TConnector.Create(SQL);
      try
        Connector.ToCombo(ComboBoxMySQL, 'Codigo', 'Estado', 1);
        Connector.ToCombo(ComboEditMySQL, 'Codigo', 'Estado', 2);
        Connector.ToListBox(ListBoxMySQL, 'Codigo', 'Estado', 3);
        Connector.ToListView(ListViewMySQL, 'Codigo', 'Estado', ['Sigla', 'Sigla', 'Sigla'], 4);
        Connector.ToGrid(StringGridMySQL, 5);
        Connector.ToGrid(GridMySQL, 6);
      finally
        Connector.Destroy;
      end;

    finally
      SQL.Destroy;
    end;

  finally
    DBMySQL.Destroy;
  end;
end;

procedure TSQLConnectionTester.TabDBPostgreSQLClick(Sender: TObject);
var
  DBPostgreSQL : TConnection;
  SQL: TQuery;
  Query: TQueryBuilder;
  Connector: TConnector;
begin
  DBPostgreSQL := TConnection.Create;
  //DBPostgreSQL := TConnectionClass.GetInstance();
  try
    DBPostgreSQL.Driver := POSTGRES;
    DBPostgreSQL.Host := '127.0.0.1';
    DBPostgreSQL.Port := 5432;
    DBPostgreSQL.Database := 'postgres';
    DBPostgreSQL.Schema := 'demodev';
    DBPostgreSQL.Username := 'postgres';
    DBPostgreSQL.Password := 'masterkey';

    if not DBPostgreSQL.GetInstance.Connection.Connected then
      DBPostgreSQL.GetInstance.Connection.Connected := True;

    SQL := TQuery.Create;
    try
      SQL := Query.View('SELECT "id" AS "Codigo", "nome" AS "Estado", "sigla" AS "Sigla" FROM "estado" ORDER BY "id"');

      Connector := TConnector.Create(SQL);
      try
        Connector.ToCombo(ComboBoxPostgreSQL, 'Codigo', 'Estado', 1);
        Connector.ToCombo(ComboEditPostgreSQL, 'Codigo', 'Estado', 2);
        Connector.ToListBox(ListBoxPostgreSQL, 'Codigo', 'Estado', 3);
        Connector.ToListView(ListViewPostgreSQL, 'Codigo', 'Estado', ['Sigla', 'Sigla', 'Sigla'], 4);
        Connector.ToGrid(StringGridPostgreSQL, 5);
        Connector.ToGrid(GridPostgreSQL, 6);
      finally
        Connector.Destroy;
      end;

    finally
      SQL.Destroy;
    end;

  finally
    DBPostgreSQL.Destroy;
  end;
end;

procedure TSQLConnectionTester.ComboBoxSQLiteChange(Sender: TObject);
//var
//  Idx: Integer;
begin
//  Idx := TComboBox(Sender).ItemIndex;
//  Showmessage(TComboBox(Sender).Items[Idx]);
//  Showmessage(TValueObject(TComboBox(Sender).Items.Objects[Idx]).Value.AsString);
end;

procedure TSQLConnectionTester.TabDBSQLiteClick(Sender: TObject);
var
  DBSQLite : TConnection;
  SQL: TQuery;
  Query: TQueryBuilder;
  Connector: TConnector;
begin
  DBSQLite := TConnection.Create;
  //DBSQLite := TConnectionClass.GetInstance();
  try
    DBSQLite.Driver := SQLITE;
    DBSQLite.Database :=
    {$IFDEF MSWINDOWS}
      ExtractFilePath(ParamStr(0)) + 'DB.SQLITE';
    {$ELSE}
      TPath.Combine(TPath.GetDocumentsPath, 'DB.SQLITE');
    {$ENDIF}

    if not DBSQLite.GetInstance.Connection.Connected then
      DBSQLite.GetInstance.Connection.Connected := True;

    SQL := TQuery.Create;
    try
      SQL := Query.View('SELECT id AS Codigo, nome AS Estado, sigla AS Sigla FROM estado ORDER BY id');

      Connector := TConnector.Create(SQL);
      try
        //Connector.ToCombo(ComboBoxSQLite, 'Codigo', 'Estado', TDictHelper<String, TArray<Variant>>.Make(['Index'], [[1]]));
        //Connector.ToCombo(ComboBoxSQLite, 'Codigo', 'Estado', TDictHelper<String, TArray<Variant>>.Make(['Column'], [['Estado', 'Acre']]));
        //Connector.ToCombo(ComboBoxSQLite, 'Codigo', 'Estado', TDictHelper<String, TArray<Variant>>.Make(['Column'], [['Codigo', 1]]));
        Connector.ToCombo(ComboBoxSQLite, 'Codigo', 'Estado', 1);
        Connector.ToCombo(ComboEditSQLite, 'Codigo', 'Estado', 2);
        Connector.ToListBox(ListBoxSQLite, 'Codigo', 'Estado', 3);
        Connector.ToListView(ListViewSQLite, 'Codigo', 'Estado', ['Sigla', 'Sigla', 'Sigla'], 4);
        Connector.ToGrid(StringGridSQLite, 5);
        Connector.ToGrid(GridSQLite, 6);
      finally
        Connector.Destroy;
      end;

    finally
      SQL.Destroy;
    end;

  finally
    DBSQLite.Destroy;
  end;
end;

end.

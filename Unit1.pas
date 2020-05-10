unit Unit1;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.Rtti,
  System.Bindings.Outputs,
  System.StrUtils,
  System.Math,

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

  FMX.Edit.Helper,
  FMX.&Object.Helper,
  TimeDate,
  Float,
  &Array,
  MimeType,
  SQLConnection,
  Connector
  ;

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
    GridPanelLayout2: TGridPanelLayout;
    ButToStr: TButton;
    ButInsert: TButton;
    ButUpdate: TButton;
    ButDelete: TButton;
    ButFetch: TButton;
    ButReplace: TButton;
    ButUpsert: TButton;
    GridPanelLayout3: TGridPanelLayout;
    ButClone: TButton;
    ButCopy: TButton;
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
    Button1: TButton;
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
    procedure ButInsertClick(Sender: TObject);
    procedure ButUpdateClick(Sender: TObject);
    procedure ButDeleteClick(Sender: TObject);
    procedure ButReplaceClick(Sender: TObject);
    procedure ButUpsertClick(Sender: TObject);
    procedure ButToStrClick(Sender: TObject);
    procedure ButFetchClick(Sender: TObject);
    procedure ButCloneClick(Sender: TObject);
    procedure ButCopyClick(Sender: TObject);
    procedure TabDBSQLiteClick(Sender: TObject);
    procedure TabDBFirebirdClick(Sender: TObject);
    procedure TabDBMySQLClick(Sender: TObject);
    procedure TabDBPostgreSQLClick(Sender: TObject);
    procedure ComboBoxDataTypeTArrayChange(Sender: TObject);
    procedure ComboBoxDataTypeTArrayVariantChange(Sender: TObject);
    procedure ComboBoxDataTypeTArrayFieldChange(Sender: TObject);
    procedure FormatExplicitClick(Sender: TObject);
    procedure CalculateClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormatImplicitClick(Sender: TObject);
    procedure EditKeyDownMoneyKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure EditKeyDownFloatKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
    procedure DataTypeArrayTest(Sender : TObject);

  end;

var
  SQLConnectionTester: TSQLConnectionTester;

implementation

{$R *.fmx}

procedure TSQLConnectionTester.DataTypeArrayTest(Sender: TObject);
var
  Value : String;
begin
  Value := TComboBox(Sender).Selected.Text;
  case AnsiIndexStr(Value, ['Fetch','Copy','Clone','ToList','ToTags','ToXML','ToJSON','ToYAML']) of
    0 : MemoDataTypeArrayResult.Lines.Text := Value;
    1 : MemoDataTypeArrayResult.Lines.Text := Value;
    2 : MemoDataTypeArrayResult.Lines.Text := Value;
    3 : MemoDataTypeArrayResult.Lines.Text := Value;
    4 : MemoDataTypeArrayResult.Lines.Text := Value;
    5 : MemoDataTypeArrayResult.Lines.Text := Value;
    6 : MemoDataTypeArrayResult.Lines.Text := Value;
    7 : MemoDataTypeArrayResult.Lines.Text := Value;
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

procedure TSQLConnectionTester.ButFetchClick(Sender: TObject);
var
  DB: TConnection;
  Dados1 : TArray;
  Query1: TQueryBuilder;
  Dados2 : TArrayVariant;
  Query2: TQueryBuilder;
begin
  DB := TConnection.Create;
  //DB := TConnectionClass.GetInstance();
  try
    DB.Driver := MYSQL;
    DB.Host := '127.0.0.1';
    DB.Port := 3306;
    DB.Database := 'simapp_dev_000';
    DB.Username := 'root';
    DB.Password := '';

    if not DB.GetInstance.Connection.Connected then
      DB.GetInstance.Connection.Connected := True;

    Dados1 := TArray.Create;
    try
      Dados1.Clear;
      Query1.FetchOne('SELECT * FROM app_empresa', Dados1);
      ShowMessage(Dados1['arquivo_imagem_raw']);
    finally
      FreeAndNil(Dados1);
    end;

    Dados2 := TArrayVariant.Create;
    try
      Dados2.Clear;
      Query2.FetchOne('SELECT * FROM app_empresa', Dados2);
      ShowMessage(Dados2['arquivo_imagem_raw']);
    finally
      FreeAndNil(Dados2);
    end;

  finally
    FreeAndNil(DB);
  end;
end;

procedure TSQLConnectionTester.ButToStrClick(Sender: TObject);
var
  DB: TConnection;
  Dados1 : TArray;
  Query1: TQueryBuilder;
  SQL1: TQuery;
  Dados2 : TArrayVariant;
  Query2: TQueryBuilder;
  SQL2: TQuery;
begin
  DB := TConnection.Create;
  //DB := TConnectionClass.GetInstance();
  try
    DB.Driver := MYSQL;
    DB.Host := '127.0.0.1';
    DB.Port := 3306;
    DB.Database := 'simapp_dev_000';
    DB.Username := 'root';
    DB.Password := '';

    if not DB.GetInstance.Connection.Connected then
      DB.GetInstance.Connection.Connected := True;

    Dados1 := TArray.Create;
    SQL1 := TQuery.Create();
    try
      Dados1.Clear;
      SQL1 := Query1.View('SELECT * FROM app_empresa');
      Dados1['id'] := SQL1.Query.FieldByName('id').Value;
      Dados1['tipo_pessoa'] := SQL1.Query.FieldByName('tipo_pessoa').Value;
      Dados1['tipo_documento'] := SQL1.Query.FieldByName('tipo_documento').Value;
      Dados1['tipo_estabelecimento'] := SQL1.Query.FieldByName('tipo_estabelecimento').Value;
      Dados1['regime_tributario'] := SQL1.Query.FieldByName('regime_tributario').Value;
      Dados1['documento_cadastral'] := SQL1.Query.FieldByName('documento_cadastral').Value;
      Dados1['inscricao_estadual'] := SQL1.Query.FieldByName('inscricao_estadual').Value;
      Dados1['inscricao_municipal'] := SQL1.Query.FieldByName('inscricao_municipal').Value;
      Dados1['razao_social'] := SQL1.Query.FieldByName('razao_social').Value;
      Dados1['nome_fantasia'] := SQL1.Query.FieldByName('nome_fantasia').Value;
      Dados1['cnae_principal_id'] := SQL1.Query.FieldByName('cnae_principal_id').Value;
      Dados1['arquivo_imagem_url'] := SQL1.Query.FieldByName('arquivo_imagem_url').Value;
      Dados1['arquivo_imagem_raw'] := SQL1.Query.FieldByName('arquivo_imagem_raw').Value;
      Dados1['endereco'] := SQL1.Query.FieldByName('endereco').Value;
      Dados1['contato'] := SQL1.Query.FieldByName('contato').Value;
      Dados1['email'] := SQL1.Query.FieldByName('email').Value;
      Dados1['sincronizado'] := SQL1.Query.FieldByName('sincronizado').Value;
      Dados1['data_insercao'] := SQL1.Query.FieldByName('data_insercao').Value;
      Dados1['data_edicao'] := SQL1.Query.FieldByName('data_edicao').Value;
      Showmessage(Dados1.ToList);
    finally
      FreeAndNil(Dados1);
      FreeAndNil(SQL1);
    end;

    Dados2 := TArrayVariant.Create;
    SQL2 := TQuery.Create();
    try
      Dados2.Clear;
      SQL2 := Query2.View('SELECT * FROM app_empresa');
      Dados2['id'] := SQL2.Query.FieldByName('id').Value;
      Dados2['tipo_pessoa'] := SQL2.Query.FieldByName('tipo_pessoa').Value;
      Dados2['tipo_documento'] := SQL2.Query.FieldByName('tipo_documento').Value;
      Dados2['tipo_estabelecimento'] := SQL2.Query.FieldByName('tipo_estabelecimento').Value;
      Dados2['regime_tributario'] := SQL2.Query.FieldByName('regime_tributario').Value;
      Dados2['documento_cadastral'] := SQL2.Query.FieldByName('documento_cadastral').Value;
      Dados2['inscricao_estadual'] := SQL2.Query.FieldByName('inscricao_estadual').Value;
      Dados2['inscricao_municipal'] := SQL2.Query.FieldByName('inscricao_municipal').Value;
      Dados2['razao_social'] := SQL2.Query.FieldByName('razao_social').Value;
      Dados2['nome_fantasia'] := SQL2.Query.FieldByName('nome_fantasia').Value;
      Dados2['cnae_principal_id'] := SQL2.Query.FieldByName('cnae_principal_id').Value;
      Dados2['arquivo_imagem_url'] := SQL2.Query.FieldByName('arquivo_imagem_url').Value;
      Dados2['arquivo_imagem_raw'] := SQL2.Query.FieldByName('arquivo_imagem_raw').Value;
      Dados2['endereco'] := SQL2.Query.FieldByName('endereco').Value;
      Dados2['contato'] := SQL2.Query.FieldByName('contato').Value;
      Dados2['email'] := SQL2.Query.FieldByName('email').Value;
      Dados2['sincronizado'] := SQL2.Query.FieldByName('sincronizado').Value;
      Dados2['data_insercao'] := SQL2.Query.FieldByName('data_insercao').Value;
      Dados2['data_edicao'] := SQL2.Query.FieldByName('data_edicao').Value;
      Showmessage(Dados2.ToList);
    finally
      FreeAndNil(Dados2);
      FreeAndNil(SQL2);
    end;

  finally
    FreeAndNil(DB);
  end;
end;

procedure TSQLConnectionTester.ButUpsertClick(Sender: TObject);
var
  DB: TConnection;
  Dados1 : TArray;
  Query1: TQueryBuilder;
  SQL1: TQuery;
  Dados2 : TArrayVariant;
  Query2: TQueryBuilder;
  SQL2: TQuery;
begin
  DB := TConnection.Create;
  //DB := TConnectionClass.GetInstance();
  try
    DB.Driver := MYSQL;
    DB.Host := '127.0.0.1';
    DB.Port := 3306;
    DB.Database := 'simapp_dev_000';
    DB.Username := 'root';
    DB.Password := '';

    if not DB.GetInstance.Connection.Connected then
      DB.GetInstance.Connection.Connected := True;

    Dados1 := TArray.Create;
    SQL1 := TQuery.Create();
    try
      Dados1.Clear;
      SQL1 := Query1.View('SELECT * FROM app_empresa');
      Dados1['id'] := SQL1.Query.FieldByName('id').Value;
      Dados1['tipo_pessoa'] := SQL1.Query.FieldByName('tipo_pessoa').Value;
      Dados1['tipo_documento'] := SQL1.Query.FieldByName('tipo_documento').Value;
      Dados1['tipo_estabelecimento'] := SQL1.Query.FieldByName('tipo_estabelecimento').Value;
      Dados1['regime_tributario'] := SQL1.Query.FieldByName('regime_tributario').Value;
      Dados1['documento_cadastral'] := SQL1.Query.FieldByName('documento_cadastral').Value;
      Dados1['inscricao_estadual'] := SQL1.Query.FieldByName('inscricao_estadual').Value;
      Dados1['inscricao_municipal'] := SQL1.Query.FieldByName('inscricao_municipal').Value;
      Dados1['razao_social'] := SQL1.Query.FieldByName('razao_social').Value;
      Dados1['nome_fantasia'] := SQL1.Query.FieldByName('nome_fantasia').Value;
      Dados1['cnae_principal_id'] := SQL1.Query.FieldByName('cnae_principal_id').Value;
      Dados1['arquivo_imagem_url'] := SQL1.Query.FieldByName('arquivo_imagem_url').Value;
      Dados1['arquivo_imagem_raw'] := SQL1.Query.FieldByName('arquivo_imagem_raw').Value;
      Dados1['endereco'] := SQL1.Query.FieldByName('endereco').Value;
      Dados1['contato'] := SQL1.Query.FieldByName('contato').Value;
      Dados1['email'] := SQL1.Query.FieldByName('email').Value;
      Dados1['sincronizado'] := SQL1.Query.FieldByName('sincronizado').Value;
      Dados1['data_insercao'] := SQL1.Query.FieldByName('data_insercao').Value;
      Dados1['data_edicao'] := SQL1.Query.FieldByName('data_edicao').Value;
      Showmessage(Query1.Upsert('app_empresa', Dados1, False, False, False));
      Showmessage(Query1.Upsert('app_empresa', Dados1, False, False, True));
    finally
      FreeAndNil(Dados1);
      FreeAndNil(SQL1);
    end;

    Dados2 := TArrayVariant.Create;
    SQL2 := TQuery.Create();
    try
      Dados2.Clear;
      SQL2 := Query2.View('SELECT * FROM app_empresa');
      Dados2['id'] := SQL2.Query.FieldByName('id').Value;
      Dados2['tipo_pessoa'] := SQL2.Query.FieldByName('tipo_pessoa').Value;
      Dados2['tipo_documento'] := SQL2.Query.FieldByName('tipo_documento').Value;
      Dados2['tipo_estabelecimento'] := SQL2.Query.FieldByName('tipo_estabelecimento').Value;
      Dados2['regime_tributario'] := SQL2.Query.FieldByName('regime_tributario').Value;
      Dados2['documento_cadastral'] := SQL2.Query.FieldByName('documento_cadastral').Value;
      Dados2['inscricao_estadual'] := SQL2.Query.FieldByName('inscricao_estadual').Value;
      Dados2['inscricao_municipal'] := SQL2.Query.FieldByName('inscricao_municipal').Value;
      Dados2['razao_social'] := SQL2.Query.FieldByName('razao_social').Value;
      Dados2['nome_fantasia'] := SQL2.Query.FieldByName('nome_fantasia').Value;
      Dados2['cnae_principal_id'] := SQL2.Query.FieldByName('cnae_principal_id').Value;
      Dados2['arquivo_imagem_url'] := SQL2.Query.FieldByName('arquivo_imagem_url').Value;
      Dados2['arquivo_imagem_raw'] := SQL2.Query.FieldByName('arquivo_imagem_raw').Value;
      Dados2['endereco'] := SQL2.Query.FieldByName('endereco').Value;
      Dados2['contato'] := SQL2.Query.FieldByName('contato').Value;
      Dados2['email'] := SQL2.Query.FieldByName('email').Value;
      Dados2['sincronizado'] := SQL2.Query.FieldByName('sincronizado').Value;
      Dados2['data_insercao'] := SQL2.Query.FieldByName('data_insercao').Value;
      Dados2['data_edicao'] := SQL2.Query.FieldByName('data_edicao').Value;
      Showmessage(Query2.Upsert('app_empresa', Dados2, False, False, False));
      Showmessage(Query2.Upsert('app_empresa', Dados2, False, False, True));
    finally
      FreeAndNil(Dados2);
      FreeAndNil(SQL2);
    end;

  finally
    FreeAndNil(DB);
  end;
end;

procedure TSQLConnectionTester.ComboBoxDataTypeTArrayChange(Sender: TObject);
begin
  Self.DataTypeArrayTest(Sender);
end;

procedure TSQLConnectionTester.ComboBoxDataTypeTArrayFieldChange(Sender: TObject);
begin
  Self.DataTypeArrayTest(Sender);
end;

procedure TSQLConnectionTester.ComboBoxDataTypeTArrayVariantChange(Sender: TObject);
begin
  Self.DataTypeArrayTest(Sender);
end;

procedure TSQLConnectionTester.CalculateClick(Sender: TObject);
begin
{
  TODO -oNickson Jeanmerson -cProgrammer :
  1)   Estudar Diferen�a Entre CurrToStr e FloatToStr
}
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

procedure TSQLConnectionTester.ButReplaceClick(Sender: TObject);
var
  DB: TConnection;
  Dados1, Filtros1 : TArray;
  Query1: TQueryBuilder;
  SQL1: TQuery;
  Dados2, Filtros2 : TArrayVariant;
  Query2: TQueryBuilder;
  SQL2: TQuery;
begin
  DB := TConnection.Create;
  //DB := TConnectionClass.GetInstance();
  try
    DB.Driver := MYSQL;
    DB.Host := '127.0.0.1';
    DB.Port := 3306;
    DB.Database := 'simapp_dev_000';
    DB.Username := 'root';
    DB.Password := '';

    if not DB.GetInstance.Connection.Connected then
      DB.GetInstance.Connection.Connected := True;

    Dados1 := TArray.Create;
    Filtros1 := TArray.Create;
    SQL1 := TQuery.Create();
    try
      Dados1.Clear;
      SQL1 := Query1.View('SELECT * FROM app_empresa');
      Dados1['id'] := SQL1.Query.FieldByName('id').Value;
      Dados1['tipo_pessoa'] := SQL1.Query.FieldByName('tipo_pessoa').Value;
      Dados1['tipo_documento'] := SQL1.Query.FieldByName('tipo_documento').Value;
      Dados1['tipo_estabelecimento'] := SQL1.Query.FieldByName('tipo_estabelecimento').Value;
      Dados1['regime_tributario'] := SQL1.Query.FieldByName('regime_tributario').Value;
      Dados1['documento_cadastral'] := SQL1.Query.FieldByName('documento_cadastral').Value;
      Dados1['inscricao_estadual'] := SQL1.Query.FieldByName('inscricao_estadual').Value;
      Dados1['inscricao_municipal'] := SQL1.Query.FieldByName('inscricao_municipal').Value;
      Dados1['razao_social'] := SQL1.Query.FieldByName('razao_social').Value;
      Dados1['nome_fantasia'] := SQL1.Query.FieldByName('nome_fantasia').Value;
      Dados1['cnae_principal_id'] := SQL1.Query.FieldByName('cnae_principal_id').Value;
      Dados1['arquivo_imagem_url'] := SQL1.Query.FieldByName('arquivo_imagem_url').Value;
      Dados1['arquivo_imagem_raw'] := SQL1.Query.FieldByName('arquivo_imagem_raw').Value;
      Dados1['endereco'] := SQL1.Query.FieldByName('endereco').Value;
      Dados1['contato'] := SQL1.Query.FieldByName('contato').Value;
      Dados1['email'] := SQL1.Query.FieldByName('email').Value;
      Dados1['sincronizado'] := SQL1.Query.FieldByName('sincronizado').Value;
      Dados1['data_insercao'] := SQL1.Query.FieldByName('data_insercao').Value;
      Dados1['data_edicao'] := SQL1.Query.FieldByName('data_edicao').Value;
      Showmessage(Query1.Replace('app_empresa', Dados1));
      Filtros1.Clear;
      Filtros1['id ='] := '1';
      Showmessage(Query1.Replace('app_empresa', Dados1, Filtros1));
    finally
      FreeAndNil(Filtros1);
      FreeAndNil(Dados1);
      FreeAndNil(SQL1);
    end;

    Filtros2 := TArrayVariant.Create;
    Dados2 := TArrayVariant.Create;
    SQL2 := TQuery.Create();
    try
      Dados2.Clear;
      SQL2 := Query2.View('SELECT * FROM app_empresa');
      Dados2['id'] := SQL2.Query.FieldByName('id').Value;
      Dados2['tipo_pessoa'] := SQL2.Query.FieldByName('tipo_pessoa').Value;
      Dados2['tipo_documento'] := SQL2.Query.FieldByName('tipo_documento').Value;
      Dados2['tipo_estabelecimento'] := SQL2.Query.FieldByName('tipo_estabelecimento').Value;
      Dados2['regime_tributario'] := SQL2.Query.FieldByName('regime_tributario').Value;
      Dados2['documento_cadastral'] := SQL2.Query.FieldByName('documento_cadastral').Value;
      Dados2['inscricao_estadual'] := SQL2.Query.FieldByName('inscricao_estadual').Value;
      Dados2['inscricao_municipal'] := SQL2.Query.FieldByName('inscricao_municipal').Value;
      Dados2['razao_social'] := SQL2.Query.FieldByName('razao_social').Value;
      Dados2['nome_fantasia'] := SQL2.Query.FieldByName('nome_fantasia').Value;
      Dados2['cnae_principal_id'] := SQL2.Query.FieldByName('cnae_principal_id').Value;
      Dados2['arquivo_imagem_url'] := SQL2.Query.FieldByName('arquivo_imagem_url').Value;
      Dados2['arquivo_imagem_raw'] := SQL2.Query.FieldByName('arquivo_imagem_raw').Value;
      Dados2['endereco'] := SQL2.Query.FieldByName('endereco').Value;
      Dados2['contato'] := SQL2.Query.FieldByName('contato').Value;
      Dados2['email'] := SQL2.Query.FieldByName('email').Value;
      Dados2['sincronizado'] := SQL2.Query.FieldByName('sincronizado').Value;
      Dados2['data_insercao'] := SQL2.Query.FieldByName('data_insercao').Value;
      Dados2['data_edicao'] := SQL2.Query.FieldByName('data_edicao').Value;
      Showmessage(Query2.Replace('app_empresa', Dados2));
      Filtros2.Clear;
      Filtros2['id ='] := '1';
      Showmessage(Query2.Replace('app_empresa', Dados2, Filtros2));
    finally
      FreeAndNil(Filtros2);
      FreeAndNil(Dados2);
      FreeAndNil(SQL2);
    end;

  finally
    FreeAndNil(DB);
  end;
end;

procedure TSQLConnectionTester.Button1Click(Sender: TObject);
var
  Array1 : TArray;
  Array2 : TArrayVariant;
  Array3 : TArrayField;
  Array1F: TArray;
  Array2F, Array3F: TArrayVariant;
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

//    Array1 := TArray.Create;
//    try
//      Array1.Clear;
//      SQL := Query.FetchOne('SELECT * FROM test_fields', Array1);
//      //SQL := Query.View('SELECT * FROM test_fields');
//      //Array1['field_inc'] := SQL.Query.FieldByName('field_inc').Value;
//      //Array1['field_int'] := SQL.Query.FieldByName('field_int').Value;
//      //Array1['field_char'] := SQL.Query.FieldByName('field_char').Value;
//      //Array1['field_varchar'] := SQL.Query.FieldByName('field_varchar').Value;
//      //Array1['field_enum'] := SQL.Query.FieldByName('field_enum').Value;
//      //Array1['field_set'] := SQL.Query.FieldByName('field_set').Value;
//      //Array1['field_date'] := SQL.Query.FieldByName('field_date').Value;
//      //Array1['field_time'] := SQL.Query.FieldByName('field_time').Value;
//      //Array1['field_year'] := SQL.Query.FieldByName('field_year').Value;
//      //Array1['field_datetime'] := SQL.Query.FieldByName('field_datetime').Value;
//      //Array1['field_timestamp'] := SQL.Query.FieldByName('field_timestamp').Value;
//      //Array1['field_decimal'] := SQL.Query.FieldByName('field_decimal').Value;
//      //Array1['field_float'] := SQL.Query.FieldByName('field_float').Value;
//      //Array1['field_double'] := SQL.Query.FieldByName('field_double').Value;
//      //Array1['field_bit'] := SQL.Query.FieldByName('field_bit').Value;
//      //Array1['field_binary'] := Trim(TEncoding.UTF8.GetString(SQL.Query.FieldByName('field_binary').Value));
//      //Array1['field_blob'] := Trim(TEncoding.UTF8.GetString(SQL.Query.FieldByName('field_blob').Value)); // Leitura
//      ////Array1['field_blob'] := TBase64.ToEncode(TEncoding.UTF8.GetString(SQL.Query.FieldByName('field_blob').Value)); // Grava��o
//      //Array1['field_base64'] := SQL.Query.FieldByName('field_base64').Value;
//      //Array1['field_varbinary'] := Trim(TEncoding.UTF8.GetString(SQL.Query.FieldByName('field_varbinary').Value));
//      //Array1['field_null'] := System.StrUtils.IfThen(SQL.Query.FieldByName('field_null').Value = NULL, 'null', SQL.Query.FieldByName('field_null').Value);
//      Showmessage(Array1.ToList(True));
//      Showmessage(Array1.ToTags(True));
//      Showmessage(Array1.ToXML(True));
//      Showmessage(Array1.ToJSON(True));
//      Array1F := TArray.Create;
//      Array1F.Clear;
//      Array1F['field_inc ='] := '1,2,4,3';
//      Array1F['and field_inc ='] := '4,3,2,1';
//      Showmessage(Query.Insert('test_fields', Array1, False));
//      Showmessage(Query.Update('test_fields', Array1, false));
//      Showmessage(Query.Update('test_fields', Array1, Array1F, false));
//      Showmessage(Query.Delete('test_fields', Array1F, false));
//      Showmessage(Query.Replace('test_fields', Array1, false));
//      Showmessage(Query.Replace('test_fields', Array1, Array1F, false));
//      Showmessage(Query.Upsert('test_fields', Array1, false, true, true));
//    finally
//      FreeAndNil(Array1);
//    end;

//    Array2 := TArrayVariant.Create;
//    try
//      Array2.Clear;
//      SQL := Query.FetchOne('SELECT * FROM test_fields', Array2);
//      //SQL := Query.View('SELECT * FROM test_fields');
//      //Array2['field_inc'] := SQL.Query.FieldByName('field_inc').Value;
//      //Array2['field_int'] := SQL.Query.FieldByName('field_int').Value;
//      //Array2['field_char'] := SQL.Query.FieldByName('field_char').Value;
//      //Array2['field_varchar'] := SQL.Query.FieldByName('field_varchar').Value;
//      //Array2['field_enum'] := SQL.Query.FieldByName('field_enum').Value;
//      //Array2['field_set'] := SQL.Query.FieldByName('field_set').Value;
//      //Array2['field_date'] := SQL.Query.FieldByName('field_date').Value;
//      //Array2['field_time'] := SQL.Query.FieldByName('field_time').Value;
//      //Array2['field_year'] := SQL.Query.FieldByName('field_year').Value;
//      //Array2['field_datetime'] := SQL.Query.FieldByName('field_datetime').Value;
//      //Array2['field_timestamp'] := SQL.Query.FieldByName('field_timestamp').Value;
//      //Array2['field_decimal'] := SQL.Query.FieldByName('field_decimal').Value;
//      //Array2['field_float'] := SQL.Query.FieldByName('field_float').Value;
//      //Array2['field_double'] := SQL.Query.FieldByName('field_double').Value;
//      //Array2['field_bit'] := SQL.Query.FieldByName('field_bit').Value;
//      //Array2['field_binary'] := SQL.Query.FieldByName('field_binary').Value;
//      //Array2['field_blob'] := SQL.Query.FieldByName('field_blob').Value;
//      //Array2['field_base64'] := SQL.Query.FieldByName('field_base64').Value;
//      //Array2['field_varbinary'] := SQL.Query.FieldByName('field_varbinary').Value;
//      //Array2['field_null'] := SQL.Query.FieldByName('field_null').Value;
//      Showmessage(Array2.ToList(True));
//      Showmessage(Array2.ToTags(True));
//      Showmessage(Array2.ToXML(True));
//      Showmessage(Array2.ToJSON(True));
//      Array2F := TArrayVariant.Create;
//      Array2F.Clear;
//      Array2F['field_inc ='] := '1,2,4,3';
//      Array2F['and field_inc ='] := '4,3,2,1';
//      Showmessage(Query.Insert('test_fields', Array2, False));
//      Showmessage(Query.Update('test_fields', Array2, false));
//      Showmessage(Query.Update('test_fields', Array2, Array2F, false));
//      Showmessage(Query.Delete('test_fields', Array2F, false));
//      Showmessage(Query.Replace('test_fields', Array2, false));
//      Showmessage(Query.Replace('test_fields', Array2, Array2F, false));
//      Showmessage(Query.Upsert('test_fields', Array2, false, true, true));
//    finally
//      FreeAndNil(Array2);
//    end;

//    Array3 := TArrayField.Create;
//    try
//      Array3.Clear;
//      SQL := Query.FetchOne('SELECT * FROM test_fields', Array3);
      //SQL := Query.View('SELECT * FROM test_fields');
      //Array3['field_inc'] := SQL.Query.FieldByName('field_inc');
      //Array3['field_int'] := SQL.Query.FieldByName('field_int');
      //Array3['field_char'] := SQL.Query.FieldByName('field_char');
      //Array3['field_varchar'] := SQL.Query.FieldByName('field_varchar');
      //Array3['field_enum'] := SQL.Query.FieldByName('field_enum');
      //Array3['field_set'] := SQL.Query.FieldByName('field_set');
      //Array3['field_date'] := SQL.Query.FieldByName('field_date');
      //Array3['field_time'] := SQL.Query.FieldByName('field_time');
      //Array3['field_year'] := SQL.Query.FieldByName('field_year');
      //Array3['field_datetime'] := SQL.Query.FieldByName('field_datetime');
      //Array3['field_timestamp'] := SQL.Query.FieldByName('field_timestamp');
      //Array3['field_decimal'] := SQL.Query.FieldByName('field_decimal');
      //Array3['field_float'] := SQL.Query.FieldByName('field_float');
      //Array3['field_double'] := SQL.Query.FieldByName('field_double');
      //Array3['field_bit'] := SQL.Query.FieldByName('field_bit');
      //Array3['field_binary'] := SQL.Query.FieldByName('field_binary');
      //Array3['field_blob'] := SQL.Query.FieldByName('field_blob');
      //Array3['field_base64'] := SQL.Query.FieldByName('field_base64');
      //Array3['field_varbinary'] := SQL.Query.FieldByName('field_varbinary');
      //Array3['field_null'] := SQL.Query.FieldByName('field_null');
//      Showmessage(Array3.ToList(True));
//      Showmessage(Array3.ToTags(True));
//      Showmessage(Array3.ToXML(True));
//      Showmessage(Array3.ToJSON(True));
//      Array3F := TArrayVariant.Create;
//      Array3F.Clear;
//      Array3F['field_inc ='] := '1,2,4,3';
//      Array3F['and field_inc ='] := '4,3,2,1';
//      Showmessage(Query.Insert('test_fields', Array3, False));
//      Showmessage(Query.Update('test_fields', Array3, false));
//      Showmessage(Query.Update('test_fields', Array3, Array3F, false));
//      Showmessage(Query.Delete('test_fields', Array3F, false));
//      Showmessage(Query.Replace('test_fields', Array3, false));
//      Showmessage(Query.Replace('test_fields', Array3, Array3F, false));
//      Showmessage(Query.Upsert('test_fields', Array3, false, true, true));
//    finally
//      FreeAndNil(Array3);
//    end;

  finally
    FreeAndNil(DB);
  end;

//  Showmessage(TTimeDate.ToArray('2020-02-28 10:23:59 +02:00').ToList(True));
//  Showmessage(TTimeDate.ToArray('29/02/2020 10:23:59 AM').ToList(True));
end;

procedure TSQLConnectionTester.ButCopyClick(Sender: TObject);
var
  DB: TConnection;
  Dados1 : TArrayVariant;
  Query1: TQueryBuilder;
  SQL1: TQuery;

  Dados2 : TArrayVariant;
begin
  DB := TConnection.Create;
  //DB := TConnectionClass.GetInstance();
  try
    DB.Driver := MYSQL;
    DB.Host := '127.0.0.1';
    DB.Port := 3306;
    DB.Database := 'simapp_dev_000';
    DB.Username := 'root';
    DB.Password := '';

    if not DB.GetInstance.Connection.Connected then
      DB.GetInstance.Connection.Connected := True;

    Dados1 := TArrayVariant.Create;
    SQL1 := TQuery.Create();
    try
      Dados1.Clear;
      SQL1 := Query1.View('SELECT * FROM app_empresa');
      Dados1['id'] := SQL1.Query.FieldByName('id').Value;
      Dados1['tipo_pessoa'] := SQL1.Query.FieldByName('tipo_pessoa').Value;
      Dados1['tipo_documento'] := SQL1.Query.FieldByName('tipo_documento').Value;
      Dados1['tipo_estabelecimento'] := SQL1.Query.FieldByName('tipo_estabelecimento').Value;
      Dados1['regime_tributario'] := SQL1.Query.FieldByName('regime_tributario').Value;
      Dados1['documento_cadastral'] := SQL1.Query.FieldByName('documento_cadastral').Value;
      Dados1['inscricao_estadual'] := SQL1.Query.FieldByName('inscricao_estadual').Value;
      Dados1['inscricao_municipal'] := SQL1.Query.FieldByName('inscricao_municipal').Value;
      Dados1['razao_social'] := SQL1.Query.FieldByName('razao_social').Value;
      Dados1['nome_fantasia'] := SQL1.Query.FieldByName('nome_fantasia').Value;
      Dados1['cnae_principal_id'] := SQL1.Query.FieldByName('cnae_principal_id').Value;
      Dados1['arquivo_imagem_url'] := SQL1.Query.FieldByName('arquivo_imagem_url').Value;
      Dados1['arquivo_imagem_raw'] := SQL1.Query.FieldByName('arquivo_imagem_raw').Value;
      Dados1['endereco'] := SQL1.Query.FieldByName('endereco').Value;
      Dados1['contato'] := SQL1.Query.FieldByName('contato').Value;
      Dados1['email'] := SQL1.Query.FieldByName('email').Value;
      Dados1['sincronizado'] := SQL1.Query.FieldByName('sincronizado').Value;
      Dados1['data_insercao'] := SQL1.Query.FieldByName('data_insercao').Value;
      Dados1['data_edicao'] := SQL1.Query.FieldByName('data_edicao').Value;
      ShowMessage(Dados1['arquivo_imagem_raw']);
      Dados2 := TArrayVariant.Create(Dados1);
      ShowMessage(Dados2['arquivo_imagem_raw']);
    finally
      FreeAndNil(Dados1);
      FreeAndNil(SQL1);
      FreeAndNil(Dados2);
    end;

  finally
    FreeAndNil(DB);
  end;
end;

procedure TSQLConnectionTester.ButCloneClick(Sender: TObject);
var
  DB: TConnection;
  Dados1 : TArrayVariant;
  Query1: TQueryBuilder;
  Dados2 : TArrayVariant;
begin
  DB := TConnection.Create;
  //DB := TConnectionClass.GetInstance();
  try
    DB.Driver := MYSQL;
    DB.Host := '127.0.0.1';
    DB.Port := 3306;
    DB.Database := 'simapp_dev_000';
    DB.Username := 'root';
    DB.Password := '';

    if not DB.GetInstance.Connection.Connected then
      DB.GetInstance.Connection.Connected := True;

    Dados1 := TArrayVariant.Create;

    try
      Dados1.Clear;
      Query1.FetchOne('SELECT * FROM app_empresa', Dados1);
      ShowMessage(Dados1['arquivo_imagem_raw']);

      Dados2 := TArrayVariant.Create(Dados1);
      ShowMessage(Dados2['arquivo_imagem_raw']);
    finally
      FreeAndNil(Dados1);
      FreeAndNil(Dados2);
    end;

  finally
    FreeAndNil(DB);
  end;
end;

procedure TSQLConnectionTester.ButDeleteClick(Sender: TObject);
var
  DB: TConnection;
  Filtros1: TArray;
  Query1: TQueryBuilder;
  Filtros2 : TArrayVariant;
  Query2: TQueryBuilder;
begin
  DB := TConnection.Create;
  //DB := TConnectionClass.GetInstance();
  try
    DB.Driver := MYSQL;
    DB.Host := '127.0.0.1';
    DB.Port := 3306;
    DB.Database := 'simapp_dev_000';
    DB.Username := 'root';
    DB.Password := '';

    if not DB.GetInstance.Connection.Connected then
      DB.GetInstance.Connection.Connected := True;

    //Delete Gen�rico
    Showmessage(Query1.Delete('app_empresa'));

    Filtros1 := TArray.Create;
    try
      Filtros1.Clear;
      Filtros1['id ='] := '1';
      Showmessage(Query1.Delete('app_empresa', Filtros1));
    finally
      FreeAndNil(Filtros1);
    end;

    Filtros2 := TArrayVariant.Create;
    try
      Filtros2.Clear;
      Filtros2['id ='] := '1';
      Showmessage(Query2.Delete('app_empresa', Filtros2));
    finally
      FreeAndNil(Filtros1);
    end;

  finally
    FreeAndNil(DB);
  end;
end;

procedure TSQLConnectionTester.ButUpdateClick(Sender: TObject);
var
  DB: TConnection;
  Dados1, Filtros1: TArray;
  Query1: TQueryBuilder;
  SQL1: TQuery;
  Dados2, Filtros2 : TArrayVariant;
  Query2: TQueryBuilder;
  SQL2: TQuery;
begin
  DB := TConnection.Create;
  //DB := TConnectionClass.GetInstance();
  try
    DB.Driver := MYSQL;
    DB.Host := '127.0.0.1';
    DB.Port := 3306;
    DB.Database := 'simapp_dev_000';
    DB.Username := 'root';
    DB.Password := '';

    if not DB.GetInstance.Connection.Connected then
      DB.GetInstance.Connection.Connected := True;

    Dados1 := TArray.Create;
    Filtros1 := TArray.Create;
    SQL1 := TQuery.Create();
    try
      Dados1.Clear;
      SQL1 := Query1.View('SELECT * FROM app_empresa');
      Dados1['id'] := SQL1.Query.FieldByName('id').Value;
      Dados1['tipo_pessoa'] := SQL1.Query.FieldByName('tipo_pessoa').Value;
      Dados1['tipo_documento'] := SQL1.Query.FieldByName('tipo_documento').Value;
      Dados1['tipo_estabelecimento'] := SQL1.Query.FieldByName('tipo_estabelecimento').Value;
      Dados1['regime_tributario'] := SQL1.Query.FieldByName('regime_tributario').Value;
      Dados1['documento_cadastral'] := SQL1.Query.FieldByName('documento_cadastral').Value;
      Dados1['inscricao_estadual'] := SQL1.Query.FieldByName('inscricao_estadual').Value;
      Dados1['inscricao_municipal'] := SQL1.Query.FieldByName('inscricao_municipal').Value;
      Dados1['razao_social'] := SQL1.Query.FieldByName('razao_social').Value;
      Dados1['nome_fantasia'] := SQL1.Query.FieldByName('nome_fantasia').Value;
      Dados1['cnae_principal_id'] := SQL1.Query.FieldByName('cnae_principal_id').Value;
      Dados1['arquivo_imagem_url'] := SQL1.Query.FieldByName('arquivo_imagem_url').Value;
      Dados1['arquivo_imagem_raw'] := SQL1.Query.FieldByName('arquivo_imagem_raw').Value;
      Dados1['endereco'] := SQL1.Query.FieldByName('endereco').Value;
      Dados1['contato'] := SQL1.Query.FieldByName('contato').Value;
      Dados1['email'] := SQL1.Query.FieldByName('email').Value;
      Dados1['sincronizado'] := SQL1.Query.FieldByName('sincronizado').Value;
      Dados1['data_insercao'] := SQL1.Query.FieldByName('data_insercao').Value;
      Dados1['data_edicao'] := SQL1.Query.FieldByName('data_edicao').Value;
      Showmessage(Query1.Update('app_empresa', Dados1));
      Filtros1.Clear;
      Filtros1['id ='] := '1';
      Showmessage(Query1.Update('app_empresa', Dados1, Filtros1));
    finally
      FreeAndNil(Filtros1);
      FreeAndNil(Dados1);
      FreeAndNil(SQL1);
    end;

    Dados2 := TArrayVariant.Create;
    Filtros2 := TArrayVariant.Create;
    SQL2 := TQuery.Create();
    try
      Dados2.Clear;
      SQL2 := Query2.View('SELECT * FROM app_empresa');
      Dados2['id'] := SQL2.Query.FieldByName('id').Value;
      Dados2['tipo_pessoa'] := SQL2.Query.FieldByName('tipo_pessoa').Value;
      Dados2['tipo_documento'] := SQL2.Query.FieldByName('tipo_documento').Value;
      Dados2['tipo_estabelecimento'] := SQL2.Query.FieldByName('tipo_estabelecimento').Value;
      Dados2['regime_tributario'] := SQL2.Query.FieldByName('regime_tributario').Value;
      Dados2['documento_cadastral'] := SQL2.Query.FieldByName('documento_cadastral').Value;
      Dados2['inscricao_estadual'] := SQL2.Query.FieldByName('inscricao_estadual').Value;
      Dados2['inscricao_municipal'] := SQL2.Query.FieldByName('inscricao_municipal').Value;
      Dados2['razao_social'] := SQL2.Query.FieldByName('razao_social').Value;
      Dados2['nome_fantasia'] := SQL2.Query.FieldByName('nome_fantasia').Value;
      Dados2['cnae_principal_id'] := SQL2.Query.FieldByName('cnae_principal_id').Value;
      Dados2['arquivo_imagem_url'] := SQL2.Query.FieldByName('arquivo_imagem_url').Value;
      Dados2['arquivo_imagem_raw'] := SQL2.Query.FieldByName('arquivo_imagem_raw').Value;
      Dados2['endereco'] := SQL2.Query.FieldByName('endereco').Value;
      Dados2['contato'] := SQL2.Query.FieldByName('contato').Value;
      Dados2['email'] := SQL2.Query.FieldByName('email').Value;
      Dados2['sincronizado'] := SQL2.Query.FieldByName('sincronizado').Value;
      Dados2['data_insercao'] := SQL2.Query.FieldByName('data_insercao').Value;
      Dados2['data_edicao'] := SQL2.Query.FieldByName('data_edicao').Value;
      Showmessage(Query2.Update('app_empresa', Dados2));
      Filtros2.Clear;
      Filtros2['id ='] := '1';
      Showmessage(Query2.Update('app_empresa', Dados2, Filtros2));
    finally
      FreeAndNil(Filtros2);
      FreeAndNil(Dados2);
      FreeAndNil(SQL2);
    end;

  finally
    FreeAndNil(DB);
  end;
end;

procedure TSQLConnectionTester.ButInsertClick(Sender: TObject);
var
  DB: TConnection;
  Dados1 : TArray;
  Query1: TQueryBuilder;
  SQL1: TQuery;
  Dados2 : TArrayVariant;
  Query2: TQueryBuilder;
  SQL2: TQuery;
begin
  DB := TConnection.Create;
  //DB := TConnectionClass.GetInstance();
  try
    DB.Driver := MYSQL;
    DB.Host := '127.0.0.1';
    DB.Port := 3306;
    DB.Database := 'simapp_dev_000';
    DB.Username := 'root';
    DB.Password := '';

    if not DB.GetInstance.Connection.Connected then
      DB.GetInstance.Connection.Connected := True;

    Dados1 := TArray.Create;
    SQL1 := TQuery.Create();
    try
      Dados1.Clear;
      SQL1 := Query1.View('SELECT * FROM app_empresa');
      Dados1['id'] := SQL1.Query.FieldByName('id').Value;
      Dados1['tipo_pessoa'] := SQL1.Query.FieldByName('tipo_pessoa').Value;
      Dados1['tipo_documento'] := SQL1.Query.FieldByName('tipo_documento').Value;
      Dados1['tipo_estabelecimento'] := SQL1.Query.FieldByName('tipo_estabelecimento').Value;
      Dados1['regime_tributario'] := SQL1.Query.FieldByName('regime_tributario').Value;
      Dados1['documento_cadastral'] := SQL1.Query.FieldByName('documento_cadastral').Value;
      Dados1['inscricao_estadual'] := SQL1.Query.FieldByName('inscricao_estadual').Value;
      Dados1['inscricao_municipal'] := SQL1.Query.FieldByName('inscricao_municipal').Value;
      Dados1['razao_social'] := SQL1.Query.FieldByName('razao_social').Value;
      Dados1['nome_fantasia'] := SQL1.Query.FieldByName('nome_fantasia').Value;
      Dados1['cnae_principal_id'] := SQL1.Query.FieldByName('cnae_principal_id').Value;
      Dados1['arquivo_imagem_url'] := SQL1.Query.FieldByName('arquivo_imagem_url').Value;
      Dados1['arquivo_imagem_raw'] := SQL1.Query.FieldByName('arquivo_imagem_raw').Value;
      Dados1['endereco'] := SQL1.Query.FieldByName('endereco').Value;
      Dados1['contato'] := SQL1.Query.FieldByName('contato').Value;
      Dados1['email'] := SQL1.Query.FieldByName('email').Value;
      Dados1['sincronizado'] := SQL1.Query.FieldByName('sincronizado').Value;
      Dados1['data_insercao'] := SQL1.Query.FieldByName('data_insercao').Value;
      Dados1['data_edicao'] := SQL1.Query.FieldByName('data_edicao').Value;
      Showmessage(Query1.Insert('app_empresa', Dados1));
    finally
      FreeAndNil(Dados1);
      FreeAndNil(SQL1);
    end;

    Dados2 := TArrayVariant.Create;
    SQL2 := TQuery.Create();
    try
      Dados2.Clear;
      SQL2 := Query2.View('SELECT * FROM app_empresa');
      Dados2['id'] := SQL2.Query.FieldByName('id').Value;
      Dados2['tipo_pessoa'] := SQL2.Query.FieldByName('tipo_pessoa').Value;
      Dados2['tipo_documento'] := SQL2.Query.FieldByName('tipo_documento').Value;
      Dados2['tipo_estabelecimento'] := SQL2.Query.FieldByName('tipo_estabelecimento').Value;
      Dados2['regime_tributario'] := SQL2.Query.FieldByName('regime_tributario').Value;
      Dados2['documento_cadastral'] := SQL2.Query.FieldByName('documento_cadastral').Value;
      Dados2['inscricao_estadual'] := SQL2.Query.FieldByName('inscricao_estadual').Value;
      Dados2['inscricao_municipal'] := SQL2.Query.FieldByName('inscricao_municipal').Value;
      Dados2['razao_social'] := SQL2.Query.FieldByName('razao_social').Value;
      Dados2['nome_fantasia'] := SQL2.Query.FieldByName('nome_fantasia').Value;
      Dados2['cnae_principal_id'] := SQL2.Query.FieldByName('cnae_principal_id').Value;
      Dados2['arquivo_imagem_url'] := SQL2.Query.FieldByName('arquivo_imagem_url').Value;
      Dados2['arquivo_imagem_raw'] := SQL2.Query.FieldByName('arquivo_imagem_raw').Value;
      Dados2['endereco'] := SQL2.Query.FieldByName('endereco').Value;
      Dados2['contato'] := SQL2.Query.FieldByName('contato').Value;
      Dados2['email'] := SQL2.Query.FieldByName('email').Value;
      Dados2['sincronizado'] := SQL2.Query.FieldByName('sincronizado').Value;
      Dados2['data_insercao'] := SQL2.Query.FieldByName('data_insercao').Value;
      Dados2['data_edicao'] := SQL2.Query.FieldByName('data_edicao').Value;
      Showmessage(Query2.Insert('app_empresa', Dados2));
    finally
      FreeAndNil(Dados2);
      FreeAndNil(SQL2);
    end;

  finally
    FreeAndNil(DB);
  end;
end;

end.

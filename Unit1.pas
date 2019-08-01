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
  FMX.Layouts,
  FMX.Edit,
  FMX.ListView.Types,
  FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base,
  FMX.ListView,

  ArrayAssoc,
  SQLConnection,

  FormHelper, FMX.Objects;

type
  TForm1 = class(TForm)
    GridPanelLayout1: TGridPanelLayout;
    TabControl1: TTabControl;
    TabSQLite: TTabItem;
    TabFirebird: TTabItem;
    TabMySQL: TTabItem;
    TabPostgreSQL: TTabItem;
    GridPanelLayout4: TGridPanelLayout;
    StringGridSQLite: TStringGrid;
    GridSQLite: TGrid;
    GridPanelLayout5: TGridPanelLayout;
    GridFirebird: TGrid;
    StringGridFirebird: TStringGrid;
    ListBoxFirebird: TListBox;
    ListViewFirebird: TListView;
    ListBoxSQLite: TListBox;
    ListViewSQLite: TListView;
    GridPanelLayout6: TGridPanelLayout;
    GridMySQL: TGrid;
    StringGridMySQL: TStringGrid;
    ListBoxMySQL: TListBox;
    ListViewMySQL: TListView;
    GridPanelLayout7: TGridPanelLayout;
    GridPostgreSQL: TGrid;
    StringGridPostgreSQL: TStringGrid;
    ListBoxPostgreSQL: TListBox;
    ListViewPostgreSQL: TListView;
    GridPanelLayout2: TGridPanelLayout;
    ComboBoxSQLite: TComboBox;
    ComboBoxFirebird: TComboBox;
    ComboBoxMySQL: TComboBox;
    ComboBoxPostgreSQL: TComboBox;
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
    ButFirebird: TButton;
    ButMySQL: TButton;
    ButPostgreSQL: TButton;
    ButSQLite: TButton;
    Button1: TButton;
    procedure ButSQLiteClick(Sender: TObject);
    procedure ButMySQLClick(Sender: TObject);
    procedure ButPostgreSQLClick(Sender: TObject);
    procedure ButFirebirdClick(Sender: TObject);
    procedure ButInsertClick(Sender: TObject);
    procedure ButUpdateClick(Sender: TObject);
    procedure ButDeleteClick(Sender: TObject);
    procedure ButReplaceClick(Sender: TObject);
    procedure ButUpsertClick(Sender: TObject);
    procedure ButToStrClick(Sender: TObject);
    procedure ButFetchClick(Sender: TObject);
    procedure ButCloneClick(Sender: TObject);
    procedure ButCopyClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.ButFetchClick(Sender: TObject);
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
      Query1.Fetch('SELECT * FROM app_empresa', Dados1);
      ShowMessage(Dados1['arquivo_imagem_raw']);
    finally
      FreeAndNil(Dados1);
    end;

    Dados2 := TArrayVariant.Create;
    try
      Dados2.Clear;
      Query2.Fetch('SELECT * FROM app_empresa', Dados2);
      ShowMessage(Dados2['arquivo_imagem_raw']);
    finally
      FreeAndNil(Dados2);
    end;

  finally
    FreeAndNil(DB);
  end;
end;

procedure TForm1.ButToStrClick(Sender: TObject);
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
      Showmessage(Dados1.ToFilter);
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
      Showmessage(Dados2.ToFilter);
    finally
      FreeAndNil(Dados2);
      FreeAndNil(SQL2);
    end;

  finally
    FreeAndNil(DB);
  end;
end;

procedure TForm1.ButUpsertClick(Sender: TObject);
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

procedure TForm1.ButReplaceClick(Sender: TObject);
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

procedure TForm1.ButCopyClick(Sender: TObject);
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

procedure TForm1.ButCloneClick(Sender: TObject);
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
      Query1.Fetch('SELECT * FROM app_empresa', Dados1);
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

procedure TForm1.ButDeleteClick(Sender: TObject);
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

procedure TForm1.ButUpdateClick(Sender: TObject);
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

procedure TForm1.ButInsertClick(Sender: TObject);
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

procedure TForm1.ButSQLiteClick(Sender: TObject);
var
  DBSQLite : TConnection;
  Query: TQueryBuilder;
  SQL: TQuery;
begin
  TabControl1.ActiveTab := TabSQLite;

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
      SQL.toGrid(GridSQLite);
      SQL.toGrid(StringGridSQLite);
      SQL.toComboBox(ComboBoxSQLite, 'Codigo', 'Estado');
      SQL.toListBox(ListBoxSQLite, 'Codigo', 'Estado');
      SQL.toListView(ListViewSQLite, 'Codigo', 'Estado', 'Sigla', 'Sigla', 'Sigla');
      //ShowMessage(SQL.Query.RecordCount.ToString);
    finally
      FreeAndNil(SQL);
    end;

  finally
    FreeAndNil(DBSQLite);
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Self.AvisoPositivo('teste');
end;

procedure TForm1.ButFirebirdClick(Sender: TObject);
var
  DBFirebird : TConnection;
  Query: TQueryBuilder;
  SQL: TQuery;
begin
  TabControl1.ActiveTab := TabFirebird;

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
      SQL.toGrid(GridFirebird);
      SQL.toGrid(StringGridFirebird);
      SQL.toComboBox(ComboBoxFirebird, 'Codigo', 'Estado');
      SQL.toListBox(ListBoxFirebird, 'Codigo', 'Estado');
      SQL.toListView(ListViewFirebird, 'Codigo', 'Estado', 'Sigla', 'Sigla', 'Sigla');
      //ShowMessage(SQL.Query.RecordCount.ToString);
    finally
      FreeAndNil(SQL);
    end;

  finally
    FreeAndNil(DBFirebird);
  end;
end;

procedure TForm1.ButMySQLClick(Sender: TObject);
var
  DBMySQL : TConnection;
  Query: TQueryBuilder;
  SQL: TQuery;
begin
  TabControl1.ActiveTab := TabMySQL;

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
      //SQL := Query.View('SELECT id AS Codigo, nome AS Estado, sigla AS Sigla FROM estado ORDER BY id');
      SQL := Query.View('SELECT c.id AS Codigo, c.nome AS Cidade, e.nome AS Estado, e.sigla AS Sigla FROM cidade c INNER JOIN estado e ON c.estado_id = e.id');
      SQL.toGrid(GridMySQL);
      SQL.toGrid(StringGridMySQL);
      SQL.toComboBox(ComboBoxMySQL, 'Codigo', 'Estado');
      SQL.toComboBox(ListBoxMySQL, 'Codigo', 'Estado');
      SQL.toListView(ListViewMySQL, 'Codigo', 'Estado', 'Sigla', 'Sigla', 'Sigla');
      //ShowMessage(SQL.Query.RecordCount.ToString);
    finally
      FreeAndNil(SQL);
    end;

  finally
    FreeAndNil(DBMySQL);
  end;
end;

procedure TForm1.ButPostgreSQLClick(Sender: TObject);
var
  DBPostgreSQL : TConnection;
  Query: TQueryBuilder;
  SQL: TQuery;
begin
  TabControl1.ActiveTab := TabPostgreSQL;

  DBPostgreSQL := TConnection.Create;
  //DBPostgreSQL := TConnectionClass.GetInstance();
  try
    DBPostgreSQL.Driver := POSTGRES;
    DBPostgreSQL.Host := '127.0.0.1';
    DBPostgreSQL.Port := 5432;
    DBPostgreSQL.Database := 'demodev';
    DBPostgreSQL.Schema := 'demodev';
    DBPostgreSQL.Username := 'postgres';
    DBPostgreSQL.Password := 'masterkey';

    if not DBPostgreSQL.GetInstance.Connection.Connected then
      DBPostgreSQL.GetInstance.Connection.Connected := True;

    SQL := TQuery.Create;
    try
      SQL := Query.View('SELECT "id" AS "Codigo", "nome" AS "Estado", "sigla" AS "Sigla" FROM "estado" ORDER BY "id"');
      SQL.toGrid(GridPostgreSQL);
      SQL.toGrid(StringGridPostgreSQL);
      SQL.toComboBox(ComboBoxPostgreSQL, 'Codigo', 'Estado');
      SQL.toListBox(ListBoxPostgreSQL, 'Codigo', 'Estado');
      SQL.toListView(ListViewPostgreSQL, 'Codigo', 'Estado', 'Sigla', 'Sigla', 'Sigla');
      //ShowMessage(SQL.Query.RecordCount.ToString);
    finally
      FreeAndNil(SQL);
    end;

  finally
    FreeAndNil(DBPostgreSQL);
  end;
end;

end.

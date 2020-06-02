﻿{
  Connector.
  ------------------------------------------------------------------------------
  Objetivo : Conectar o Objeto TQuery aos Componentes TGrid, TStringGrid,
  TListBox, TListView, TComboBox, TComboEdit e TEdit.
  ------------------------------------------------------------------------------
  Autor : Nickson Jeanmerson
  ------------------------------------------------------------------------------
  Esta biblioteca é software livre; você pode redistribuí-la e/ou modificá-la
  sob os termos da Licença Pública Geral Menor do GNU conforme publicada pela
  Free Software Foundation; tanto a versão 3.29 da Licença, ou (a seu critério)
  qualquer versão posterior.
  Esta biblioteca é distribuída na expectativa de que seja útil, porém, SEM
  NENHUMA GARANTIA; nem mesmo a garantia implícita de COMERCIABILIDADE OU
  ADEQUAÇÃO A UMA FINALIDADE ESPECÍFICA. Consulte a Licença Pública Geral Menor
  do GNU para mais detalhes. (Arquivo LICENÇA.TXT ou LICENSE.TXT)
  Você deve ter recebido uma cópia da Licença Pública Geral Menor do GNU junto
  com esta biblioteca; se não, escreva para a Free Software Foundation, Inc.,
  no endereço 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.
  Você também pode obter uma copia da licença em:
  http://www.opensource.org/licenses/lgpl-license.php
}

unit Connector;

interface

{ Carrega a Interface Padrão }
{$I CNC.Default.inc}

uses
  System.SysUtils,
  System.IOUtils,
  System.StrUtils,
  System.DateUtils,
  System.Classes,
  System.Math,
  System.SyncObjs,
  System.Threading,
  System.Generics.Collections,
  System.RTLConsts,
  System.Variants,
  System.JSON,
  System.RTTI,
  System.TypInfo,
  System.Types,
  System.UITypes,

  FMX.Consts,
  FMX.Types,
  FMX.Grid,
  FMX.ComboEdit,
  FMX.ListBox,
  FMX.ListView.Types,
  FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base,
  FMX.ListView,
  FMX.SearchBox,
  FMX.StdCtrls,
  FMX.Controls,
  FMX.Graphics,
  FMX.Layouts,
  FMX.Objects,
  FMX.Pickers,
  FMX.Edit,
  FMX.Edit.Style,
  FMX.Controls.Presentation,

  FMX.Dialogs,

  Data.DB,

{$IFDEF FireDACLib}
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
{$ENDIF}
{$IF DEFINED(dbExpressLib) OR DEFINED(ZeOSLib)}
  Datasnap.Provider,
  Datasnap.DBClient,
  Data.FMTBcd,
  Data.SqlExpr,
{$ENDIF}
{$IFDEF ZeOSLib}
  ZAbstractConnection,
  ZConnection,
  ZAbstractRODataset,
  ZAbstractDataset,
  ZDataset,
{$ENDIF}

  FMX.ListView.Extension,
  FMX.Edit.Extension,

  FMX.Edit.Helper,
  FMX.ListView.Helper,
  FMX.ListBox.Helper,
  FMX.StringGrid.Helper,
  FMX.Grid.Helper,
  FMX.ComboEdit.Helper,
  FMX.ComboBox.Helper,
  DictionaryHelper,
  ArrayHelper,

  EventDriven,
  SQLConnection,
  &Array
  ;

  { Classe Utilizada para Armazenamento de Dados }
type
  TValueObject = class(TObject)
  strict private
    FValue: TValue;
  public
    constructor Create(const aValue: TValue);
    property Value: TValue read FValue;
  end;

  { Classe TConnector Herdade de TQuery }
type
  TConnector = class(TQuery)
  strict protected
    { Strict Protected declarations }
    procedure AddEdit<T: Class>(AOwner: TComponent; FieldIndexValue, IndexValue : TArray<String>; SelectedBy : TDictionary<String, TArray<Variant>>);
    procedure AddComboEdit<T: Class>(AOwner: TComponent; FieldIndexValue, IndexValue : TArray<String>; SelectedBy : TDictionary<String, TArray<Variant>>);
    procedure AddComboBox<T: Class>(AOwner: TComponent; FieldIndexValue, IndexValue : TArray<String>; SelectedBy : TDictionary<String, TArray<Variant>>);
    procedure AddListBox<T: Class>(AOwner: TComponent; FieldIndexValue, IndexValue : TArray<String>; SelectedBy : TDictionary<String, TArray<Variant>>);
    procedure AddGrid<T: Class>(AOwner: TComponent; DataSet: {$I CNC.Type.inc}; SelectedBy : TDictionary<String, TArray<Variant>>);
    procedure AddStringGrid<T: Class>(AOwner: TComponent; DataSet: {$I CNC.Type.inc}; SelectedBy : TDictionary<String, TArray<Variant>>);
  strict private
    { Strict Private declarations }
    procedure AddObject<T: Class>(AOwner: TComponent; DataSet: {$I CNC.Type.inc}; SelectedBy : Integer); overload;
    procedure AddObject<T: Class>(AOwner: TComponent; DataSet: {$I CNC.Type.inc}; SelectedBy : TDictionary<String, TArray<Variant>>); overload;
    procedure AddObject<T: Class>(AOwner: TComponent; Index : String; Value : TObject; SelectedBy : Integer); overload;
    procedure AddObject<T: Class>(AOwner: TComponent; FieldIndexValue, IndexValue : TArray<String>; SelectedBy : TDictionary<String, TArray<Variant>>); overload;
    procedure AddObject<T: Class>(AOwner: TComponent; DataSet: {$I CNC.Type.inc}; IndexField, ValueField: String; Detail1Fields: TArray<String> = []; SelectedBy : Integer = -1); overload;
    procedure AddObject<T: Class>(AOwner: TComponent; DataSet: {$I CNC.Type.inc}; IndexField, ValueField: String; Detail1Fields: TArray<String> = []; SelectedBy : TDictionary<String, TArray<Variant>> = nil); overload;
  private
    { Private declarations }
    FQuery: TQuery;
    function ToDataSet(Query: TQuery): {$I CNC.Type.inc};
    procedure ToFillList(AOwner: TComponent; IndexField, ValueField: String; SelectedBy: Integer = -1); overload;
    procedure ToFillList(AOwner: TComponent; IndexField, ValueField: String; SelectedBy : TDictionary<String, TArray<Variant>> = nil); overload;
    procedure ToMultiList(AOwner: TComponent; IndexField, ValueField: String; Detail1Fields: TArray<String> = []; SelectedBy : Integer = -1); overload;
    procedure ToMultiList(AOwner: TComponent; IndexField, ValueField: String; Detail1Fields: TArray<String> = []; SelectedBy : TDictionary<String, TArray<Variant>> = nil); overload;
    procedure ToGridTable(AOwner: TComponent; SelectedBy : Integer = -1); overload;
    procedure ToGridTable(AOwner: TComponent; SelectedBy : TDictionary<String, TArray<Variant>> = nil); overload;
  public
    { Public declarations }
    constructor Create(Query: TQuery);
    destructor Destroy; override;
    /// <summary>
    ///   Método para Exibir os Dados de uma Consulta SQL Diretamente nos Componentes <c>TGrid</c> e/ou <c>TStringGrid</c>
    ///   <para>
    ///     Exemplo:
    ///   </para>
    ///   <code>
    ///     <para>SQL := TQuery.Create;</para>
    ///     <para>try</para>
    ///     <para>  SQL := Query.View('SQLQuery');</para>
    ///     <para>  Connector := TConnector.Create(SQL);</para>
    ///     <para>  try</para>
    ///     <para>    Connector.ToGrid(GridComponent, 0);</para>
    ///     <para>  finally</para>
    ///     <para>    Connector.Destroy;</para>
    ///     <para>  end;</para>
    ///     <para>finally</para>
    ///     <para>  SQL.Destroy;</para>
    ///     <para>end;</para>
    ///   </code>
    /// </summary>
    /// <param name="AOwner">
    ///   O Componente do Tipo <c>TGrid</c> e/ou <c>TStringGrid</c>
    /// </param>
    /// <param name="SelectedBy">
    ///   O Índice Numérico da Linha do <c>TGrid</c> e/ou <c>TStringGrid</c> que se quer Selecionar
    /// </param>
    procedure ToGrid(AOwner: TComponent; SelectedBy : Integer = -1); overload;
    /// <summary>
    ///   Método para Exibir os Dados de uma Consulta SQL Diretamente nos Componentes <c>TGrid</c> e/ou <c>TStringGrid</c>
    ///   <para>
    ///     Exemplo:
    ///   </para>
    ///   <code>
    ///     <para>SQL := TQuery.Create;</para>
    ///     <para>try</para>
    ///     <para>  SQL := Query.View('SQLQuery');</para>
    ///     <para>  Connector := TConnector.Create(SQL);</para>
    ///     <para>  try</para>
    ///     <para>    Connector.ToGrid(GridComponent1, TDictionaryHelper&lt;String, TArray&lt;Variant&gt;&gt;.Make(['Index'], [[0]]));</para>
    ///     <para>    Connector.ToGrid(GridComponent2, TDictionaryHelper&lt;String, TArray&lt;Variant&gt;&gt;.Make(['Column'], [['DBColumn', 'DBValue']]));</para>
    ///     <para>  finally</para>
    ///     <para>    Connector.Destroy;</para>
    ///     <para>  end;</para>
    ///     <para>finally</para>
    ///     <para>  SQL.Destroy;</para>
    ///     <para>end;</para>
    ///   </code>
    /// </summary>
    /// <param name="AOwner">
    ///   O Componente do Tipo <c>TGrid</c> e/ou <c>TStringGrid</c>
    /// </param>
    /// <param name="SelectedBy">
    ///   Matriz Multidimensional que pode ser Utilizada da Seguinte Forma:
    ///   <para>1) TDictionaryHelper&lt;String, TArray&lt;Variant&gt;&gt;.Make(['Index'], [[0]]));</para>
    ///   <para>2) TDictionaryHelper&lt;String, TArray&lt;Variant&gt;&gt;.Make(['Column'], [['DBColumn', 'DBValue']]));</para>
    /// </param>
    procedure ToGrid(AOwner: TComponent; SelectedBy : TDictionary<String, TArray<Variant>> = nil); overload;
    procedure ToEdit(AOwner: TComponent; IndexField, ValueField: String; SelectedBy : Integer = -1); overload;
    procedure ToEdit(AOwner: TComponent; IndexField, ValueField: String; SelectedBy : TDictionary<String, TArray<Variant>> = nil); overload;
    procedure ToCombo(AOwner: TComponent; IndexField, ValueField: String; SelectedBy : Integer = -1); overload;
    procedure ToCombo(AOwner: TComponent; IndexField, ValueField: String; SelectedBy : TDictionary<String, TArray<Variant>> = nil); overload;
    procedure ToListBox(AOwner: TComponent; IndexField, ValueField: String; SelectedBy : Integer = -1); overload;
    procedure ToListBox(AOwner: TComponent; IndexField, ValueField: String; SelectedBy : TDictionary<String, TArray<Variant>> = nil); overload;
    procedure ToListView(AOwner: TComponent; IndexField, ValueField: String; Detail1Fields: TArray<String> = []; SelectedBy : Integer = -1); overload;
    procedure ToListView(AOwner: TComponent; IndexField, ValueField: String; Detail1Fields: TArray<String> = []; SelectedBy : TDictionary<String, TArray<Variant>> = nil); overload;
  end;

implementation

{ TValueObject }

constructor TValueObject.Create(const aValue: TValue);
begin
  FValue := aValue;
end;

{ TConnector }

constructor TConnector.Create(Query : TQuery);
begin
  inherited Create;

  Self.FQuery := Query;
end;

procedure TConnector.AddObject<T>(AOwner: TComponent; DataSet: {$I CNC.Type.inc}; SelectedBy : Integer);
begin
  if (TypeInfo(T) = TypeInfo(TGrid)) then
  begin
    TGrid(AOwner).Options := [TGridOption.AlternatingRowBackground, TGridOption.RowSelect, TGridOption.ColumnResize, TGridOption.ColumnMove, TGridOption.ColLines, TGridOption.RowLines, TGridOption.Tabs, TGridOption.Header, TGridOption.HeaderClick, TGridOption.AutoDisplacement];
    TGrid(AOwner).FillData := DataSet;
    TGrid(AOwner).AutoSizeColumns := True;

    if SelectedBy <> -1 then
    begin
      TGrid(AOwner).Row := SelectedBy;
      TGrid(AOwner).Col := 0;
    end;
  end
  else if (TypeInfo(T) = TypeInfo(TStringGrid)) then
  begin
    TStringGrid(AOwner).Options := [TGridOption.AlternatingRowBackground, TGridOption.RowSelect, TGridOption.ColumnResize, TGridOption.ColumnMove, TGridOption.ColLines, TGridOption.RowLines, TGridOption.Tabs, TGridOption.Header, TGridOption.HeaderClick, TGridOption.AutoDisplacement];
    TStringGrid(AOwner).FillData := DataSet;
    TStringGrid(AOwner).AutoSizeColumns := True;

    if SelectedBy <> -1 then
    begin
      TStringGrid(AOwner).Row := SelectedBy;
      TStringGrid(AOwner).Col := 0;
    end;
  end;
end;

procedure TConnector.AddObject<T>(AOwner: TComponent; DataSet: {$I CNC.Type.inc}; SelectedBy : TDictionary<String, TArray<Variant>>);
begin
  if (TypeInfo(T) = TypeInfo(TGrid)) then
    Self.AddGrid<TGrid>(AOwner, DataSet, SelectedBy)
  else if (TypeInfo(T) = TypeInfo(TStringGrid)) then
    Self.AddStringGrid<TStringGrid>(AOwner, DataSet, SelectedBy);
end;

procedure TConnector.AddObject<T>(AOwner: TComponent; Index: String; Value: TObject; SelectedBy: Integer);
begin
  if (TypeInfo(T) = TypeInfo(TEdit)) then
  begin
    TEdit(AOwner).Items.BeginUpdate;
    try
      TEdit(AOwner).Items.AddObject(Index, TValueObject.Create(Value));
      if TEdit(AOwner).Items.IndexOf(Index) = SelectedBy then
        TEdit(AOwner).ItemIndex := SelectedBy;
    finally
      TEdit(AOwner).Items.EndUpdate;
    end;
  end
  else if (TypeInfo(T) = TypeInfo(TComboEdit)) then
  begin
    TComboEdit(AOwner).Items.BeginUpdate;
    try
      TComboEdit(AOwner).Items.AddObject(Index, TValueObject.Create(Value));
      if TComboEdit(AOwner).Items.IndexOf(Index) = SelectedBy then
        TComboEdit(AOwner).ItemIndex := SelectedBy;
    finally
      TComboEdit(AOwner).Items.EndUpdate;
    end;
  end
  else if (TypeInfo(T) = TypeInfo(TComboBox)) then
  begin
    TComboBox(AOwner).Items.BeginUpdate;
    try
      TComboBox(AOwner).Items.AddObject(Index, TValueObject.Create(Value));
      if TComboBox(AOwner).Items.IndexOf(Index) = SelectedBy then
        TComboBox(AOwner).ItemIndex := SelectedBy;
    finally
      TComboBox(AOwner).Items.EndUpdate;
    end;
  end
  else if (TypeInfo(T) = TypeInfo(TListBox)) then
  begin
    TListBox(AOwner).Items.BeginUpdate;
    try
      TListBox(AOwner).Items.AddObject(Index, TValueObject.Create(Value));
      if TListBox(AOwner).Items.IndexOf(Index) = SelectedBy then
        TListBox(AOwner).ItemIndex := SelectedBy;
    finally
      TListBox(AOwner).Items.EndUpdate;
    end;
  end;
end;

procedure TConnector.AddEdit<T>(AOwner: TComponent; FieldIndexValue, IndexValue: TArray<String>; SelectedBy: TDictionary<String, TArray<Variant>>);
var
  Pair: TPair<String, TArray<Variant>>;
begin
  TEdit(AOwner).Items.BeginUpdate;
  try
    TEdit(AOwner).Items.AddObject(IndexValue[0], TValueObject.Create(IndexValue[1]));
    if SelectedBy <> nil then
    begin
      for Pair in SelectedBy do
      begin
        if Pair.Key = 'Index' then
        begin
          if TEdit(AOwner).Items.IndexOf(IndexValue[0]) = Pair.Value[0] then
            TEdit(AOwner).ItemIndex := Pair.Value[0];
        end
        else if Pair.Key = 'Column' then
        begin
          if Pair.Value[0] = FieldIndexValue[0] then
          begin
            if IndexValue[1] = Pair.Value[1] then
              TEdit(AOwner).ItemIndex := TEdit(AOwner).Items.IndexOf(IndexValue[0]);
          end
          else if Pair.Value[0] = FieldIndexValue[1] then
          begin
            if IndexValue[0] = Pair.Value[1] then
              TEdit(AOwner).ItemIndex := TEdit(AOwner).Items.IndexOf(IndexValue[0]);
          end;
        end;
      end;
    end;
  finally
    TEdit(AOwner).Items.EndUpdate;
  end;
end;

procedure TConnector.AddComboEdit<T>(AOwner: TComponent; FieldIndexValue, IndexValue: TArray<String>; SelectedBy: TDictionary<String, TArray<Variant>>);
var
  Pair: TPair<String, TArray<Variant>>;
begin
  TComboEdit(AOwner).Items.BeginUpdate;
  try
    TComboEdit(AOwner).Items.AddObject(IndexValue[0], TValueObject.Create(IndexValue[1]));
    if SelectedBy <> nil then
    begin
      for Pair in SelectedBy do
      begin
        if Pair.Key = 'Index' then
        begin
          if TComboEdit(AOwner).Items.IndexOf(IndexValue[0]) = Pair.Value[0] then
            TComboEdit(AOwner).ItemIndex := Pair.Value[0];
        end
        else if Pair.Key = 'Column' then
        begin
          if Pair.Value[0] = FieldIndexValue[0] then
          begin
            if IndexValue[1] = Pair.Value[1] then
              TComboEdit(AOwner).ItemIndex := TComboEdit(AOwner).Items.IndexOf(IndexValue[0]);
          end
          else if Pair.Value[0] = FieldIndexValue[1] then
          begin
            if IndexValue[0] = Pair.Value[1] then
              TComboEdit(AOwner).ItemIndex := TComboEdit(AOwner).Items.IndexOf(IndexValue[0]);
          end;
        end;
      end;
    end;
  finally
    TComboEdit(AOwner).Items.EndUpdate;
  end;
end;

procedure TConnector.AddComboBox<T>(AOwner: TComponent; FieldIndexValue, IndexValue: TArray<String>; SelectedBy: TDictionary<String, TArray<Variant>>);
var
  Pair: TPair<String, TArray<Variant>>;
begin
  TComboBox(AOwner).Items.BeginUpdate;
  try
    TComboBox(AOwner).Items.AddObject(IndexValue[0], TValueObject.Create(IndexValue[1]));
    if SelectedBy <> nil then
    begin
      for Pair in SelectedBy do
      begin
        if Pair.Key = 'Index' then
        begin
          if TComboBox(AOwner).Items.IndexOf(IndexValue[0]) = Pair.Value[0] then
            TComboBox(AOwner).ItemIndex := Pair.Value[0];
        end
        else if Pair.Key = 'Column' then
        begin
          if Pair.Value[0] = FieldIndexValue[0] then
          begin
            if IndexValue[1] = Pair.Value[1] then
              TComboBox(AOwner).ItemIndex := TComboBox(AOwner).Items.IndexOf(IndexValue[0]);
          end
          else if Pair.Value[0] = FieldIndexValue[1] then
          begin
            if IndexValue[0] = Pair.Value[1] then
              TComboBox(AOwner).ItemIndex := TComboBox(AOwner).Items.IndexOf(IndexValue[0]);
          end;
        end;
      end;
    end;
  finally
    TComboBox(AOwner).Items.EndUpdate;
  end;
end;

procedure TConnector.AddListBox<T>(AOwner: TComponent; FieldIndexValue, IndexValue: TArray<String>; SelectedBy: TDictionary<String, TArray<Variant>>);
var
  Pair: TPair<String, TArray<Variant>>;
begin
  TListBox(AOwner).Items.BeginUpdate;
  try
    TListBox(AOwner).Items.AddObject(IndexValue[0], TValueObject.Create(IndexValue[1]));
    if SelectedBy <> nil then
    begin
      for Pair in SelectedBy do
      begin
        if Pair.Key = 'Index' then
        begin
          if TListBox(AOwner).Items.IndexOf(IndexValue[0]) = Pair.Value[0] then
            TListBox(AOwner).ItemIndex := Pair.Value[0];
        end
        else if Pair.Key = 'Column' then
        begin
          if Pair.Value[0] = FieldIndexValue[0] then
          begin
            if IndexValue[1] = Pair.Value[1] then
              TListBox(AOwner).ItemIndex := TListBox(AOwner).Items.IndexOf(IndexValue[0]);
          end
          else if Pair.Value[0] = FieldIndexValue[1] then
          begin
            if IndexValue[0] = Pair.Value[1] then
              TListBox(AOwner).ItemIndex := TListBox(AOwner).Items.IndexOf(IndexValue[0]);
          end;
        end;
      end;
    end;
  finally
    TListBox(AOwner).Items.EndUpdate;
  end;
end;

procedure TConnector.AddGrid<T>(AOwner: TComponent; DataSet: {$I CNC.Type.inc}; SelectedBy: TDictionary<String, TArray<Variant>>);
var
  Row, Column: Integer;
  Pair: TPair<String, TArray<Variant>>;
begin
  TGrid(AOwner).Options := [TGridOption.AlternatingRowBackground, TGridOption.RowSelect, TGridOption.ColumnResize, TGridOption.ColumnMove, TGridOption.ColLines, TGridOption.RowLines, TGridOption.Tabs, TGridOption.Header, TGridOption.HeaderClick, TGridOption.AutoDisplacement];
  TGrid(AOwner).FillData := DataSet;
  TGrid(AOwner).AutoSizeColumns := True;

  if SelectedBy <> nil then
  begin
    for Pair in SelectedBy do
    begin
      if Pair.Key = 'Index' then
      begin
        for Row := 0 to TGrid(AOwner).RowCount - 1 do
        begin
          if (Row = Pair.Value[0]) then
          begin
            TGrid(AOwner).Row := Pair.Value[0];
            TGrid(AOwner).Col := 0;
            Break;
          end;
        end;
      end
      else if Pair.Key = 'Column' then
      begin
        for Column := 0 to TGrid(AOwner).ColumnCount - 1 do
        begin
          if TGrid(AOwner).ColumnByIndex(Column).Header = Pair.Value[0] then
          begin
            Row := 0;
            DataSet.First;
            while not DataSet.Eof do
            begin
              if DataSet.Fields[Column].AsString = Pair.Value[1] then
              begin
                TGrid(AOwner).Row := Row;
                TGrid(AOwner).Col := 0;
                Break;
              end;
              Inc(Row);
              DataSet.Next;
            end;
            DataSet.Last;
          end;
        end;
      end;
    end;
  end;
end;

procedure TConnector.AddStringGrid<T>(AOwner: TComponent; DataSet: {$I CNC.Type.inc}; SelectedBy: TDictionary<String, TArray<Variant>>);
var
  I, J: Integer;
  Pair: TPair<String, TArray<Variant>>;
begin
  TStringGrid(AOwner).Options := [TGridOption.AlternatingRowBackground, TGridOption.RowSelect, TGridOption.ColumnResize, TGridOption.ColumnMove, TGridOption.ColLines, TGridOption.RowLines, TGridOption.Tabs, TGridOption.Header, TGridOption.HeaderClick, TGridOption.AutoDisplacement];
  TStringGrid(AOwner).FillData := DataSet;
  TStringGrid(AOwner).AutoSizeColumns := True;

  if SelectedBy <> nil then
  begin
    for Pair in SelectedBy do
    begin
      if Pair.Key = 'Index' then
      begin
        for I := 0 to TStringGrid(AOwner).RowCount - 1 do
        begin
          if (I = Pair.Value[0]) then
          begin
            TStringGrid(AOwner).Row := Pair.Value[0];
            TStringGrid(AOwner).Col := 0;
            Break;
          end;
        end;
      end
      else if Pair.Key = 'Column' then
      begin
        for I := 0 to TStringGrid(AOwner).ColumnCount - 1 do
        begin
          if TStringGrid(AOwner).ColumnByIndex(I).Header = Pair.Value[0] then
          begin
            J := 0;
            DataSet.First;
            while not DataSet.Eof do
            begin
              if DataSet.Fields[I].AsString = Pair.Value[1] then
              begin
                TStringGrid(AOwner).Row := J;
                TStringGrid(AOwner).Col := 0;
                Break;
              end;
              Inc(J);
              DataSet.Next;
            end;
            DataSet.Last;
          end;
        end;
      end;
    end;
  end;
end;

procedure TConnector.AddObject<T>(AOwner: TComponent; FieldIndexValue, IndexValue : TArray<String>; SelectedBy : TDictionary<String, TArray<Variant>>);
begin
  if (TypeInfo(T) = TypeInfo(TEdit)) then
    Self.AddEdit<TEdit>(AOwner, FieldIndexValue, IndexValue, SelectedBy)
  else if (TypeInfo(T) = TypeInfo(TComboEdit)) then
    Self.AddComboEdit<TComboEdit>(AOwner, FieldIndexValue, IndexValue, SelectedBy)
  else if (TypeInfo(T) = TypeInfo(TComboBox)) then
    Self.AddComboBox<TComboBox>(AOwner, FieldIndexValue, IndexValue, SelectedBy)
  else if (TypeInfo(T) = TypeInfo(TListBox)) then
    Self.AddListBox<TListBox>(AOwner, FieldIndexValue, IndexValue, SelectedBy);
end;

procedure TConnector.AddObject<T>(AOwner: TComponent; DataSet: {$I CNC.Type.inc}; IndexField, ValueField: String; Detail1Fields: TArray<String> = []; SelectedBy : Integer = -1);
begin

end;

procedure TConnector.AddObject<T>(AOwner: TComponent; DataSet: {$I CNC.Type.inc}; IndexField, ValueField: String; Detail1Fields: TArray<String> = []; SelectedBy : TDictionary<String, TArray<Variant>> = nil);
begin

end;

function TConnector.ToDataSet(Query: TQuery): {$I CNC.Type.inc};
var
  DataSet : {$I CNC.Type.inc};
{$IF DEFINED(dbExpressLib) OR DEFINED(ZeOSLib)}
  DataSetProvider : TDataSetProvider;
{$ENDIF}
begin
{$IF DEFINED(FireDACLib)}
  DataSet := {$I CNC.Type.inc}.Create(Query.Query);
  Query.Query.FetchOptions.Unidirectional := False;
  Query.Query.Open;
  Query.Query.FetchAll;
  DataSet.Data := Query.Query.Data;
{$ENDIF}
{$IF DEFINED(dbExpressLib) OR DEFINED(ZeOSLib)}
  DataSetProvider.DataSet := Query.Query;
  DataSet := {$I CNC.Type.inc}.Create(DataSetProvider);
  DataSet.Data := DataSetProvider.Data;
  DataSet.Active := True;
{$ENDIF}
  DataSet.First;
  while not DataSet.Eof do begin
    DataSet.Edit;
    DataSet.Post;
    DataSet.Next;
  end;
  DataSet.Last;
  Result := DataSet;
end;

{
  ComboBoxComponent, 'Index', 'Value', IndexNumber;
}

procedure TConnector.ToFillList(AOwner: TComponent; IndexField, ValueField: String; SelectedBy : Integer = -1);
var
  I: Integer;
  Items : TStringList;
  DataSet : {$I CNC.Type.inc};
begin
  if (AOwner is TEdit) and (TEdit(AOwner) <> nil) and (TEdit(AOwner).Items.Count > 0) then
    TEdit(AOwner).Items.Clear
  else if (AOwner is TComboEdit) and (TComboEdit(AOwner) <> nil) and (TComboEdit(AOwner).Items.Count > 0) then
    TComboEdit(AOwner).Items.Clear
  else if (AOwner is TComboBox) and (TComboBox(AOwner) <> nil) and (TComboBox(AOwner).Items.Count > 0) then
    TComboBox(AOwner).Items.Clear
  else if (AOwner is TListBox) and (TListBox(AOwner) <> nil) and (TListBox(AOwner).Items.Count > 0) then
  begin
    TListBox(AOwner).Items.Clear;
    TListBox(AOwner).EmptyFilter;
  end;

  if AOwner Is TComboBox then
  begin
    TComboBox(AOwner).DropDownKind := TDropDownKind.Custom;
    TComboBox(AOwner).AutoComplete := True;
  end
  else if AOwner Is TComboEdit then
  begin
    TComboEdit(AOwner).DropDownKind := TDropDownKind.Custom;
    TComboEdit(AOwner).AutoComplete := True;
  end;

  DataSet := Self.ToDataSet(Self.FQuery);

  if DataSet.RecordCount > 0 then
  begin
    Items := TStringList.Create(True);

    DataSet.First;
    while not(DataSet.Eof) do
    begin
      Items.AddPair(DataSet.FieldByName(ValueField).AsString, DataSet.FieldByName(IndexField).AsString);
      DataSet.Next;
    end;
    DataSet.Last;

    for I := 0 to Items.Count - 1 do
    begin
      if (AOwner is TEdit) then
        Self.AddObject<TEdit>(AOwner, Items.Names[I], TValueObject.Create(Items.ValueFromIndex[I]), SelectedBy)
      else if AOwner Is TComboEdit then
        Self.AddObject<TComboEdit>(AOwner, Items.Names[I], TValueObject.Create(Items.ValueFromIndex[I]), SelectedBy)
      else if AOwner Is TComboBox then
        Self.AddObject<TComboBox>(AOwner, Items.Names[I], TValueObject.Create(Items.ValueFromIndex[I]), SelectedBy)
      else if AOwner Is TListBox then
        Self.AddObject<TListBox>(AOwner, Items.Names[I], TValueObject.Create(Items.ValueFromIndex[I]), SelectedBy);
    end;
    Items.Destroy;

    if AOwner Is TComboBox then
      TListBox(TComboBox(AOwner).ListBox).AlternatingRowBackground := True
    else if AOwner Is TComboEdit then
      TListBox(TComboEdit(AOwner).ListBox).AlternatingRowBackground := True
    else if AOwner Is TListBox then
      TListBox(AOwner).AlternatingRowBackground := True;
  end;
  DataSet.Destroy;
end;

{
  ComboBoxComponent, 'Index', 'Value', SelectedBy<'Index', IndexNumber>;
  ComboBoxComponent, 'Index', 'Value', SelectedBy<'Column', <'ColumnName', 'Value'>>;
}

procedure TConnector.ToFillList(AOwner: TComponent; IndexField, ValueField: String; SelectedBy: TDictionary<String, TArray<Variant>>);
var
  I: Integer;
  Items : TStringList;
  DataSet : {$I CNC.Type.inc};
begin
  if (AOwner is TEdit) and (TEdit(AOwner) <> nil) and (TEdit(AOwner).Items.Count > 0) then
    TEdit(AOwner).Items.Clear
  else if (AOwner is TComboEdit) and (TComboEdit(AOwner) <> nil) and (TComboEdit(AOwner).Items.Count > 0) then
    TComboEdit(AOwner).Items.Clear
  else if (AOwner is TComboBox) and (TComboBox(AOwner) <> nil) and (TComboBox(AOwner).Items.Count > 0) then
    TComboBox(AOwner).Items.Clear
  else if (AOwner is TListBox) and (TListBox(AOwner) <> nil) and (TListBox(AOwner).Items.Count > 0) then
  begin
    TListBox(AOwner).Items.Clear;
    TListBox(AOwner).EmptyFilter;
  end;

  if AOwner Is TComboBox then
  begin
    TComboBox(AOwner).DropDownKind := TDropDownKind.Custom;
    TComboBox(AOwner).AutoComplete := True;
  end
  else if AOwner Is TComboEdit then
  begin
    TComboEdit(AOwner).DropDownKind := TDropDownKind.Custom;
    TComboEdit(AOwner).AutoComplete := True;
  end;

  DataSet := Self.ToDataSet(Self.FQuery);

  if DataSet.RecordCount > 0 then
  begin
    Items := TStringList.Create(True);

    DataSet.First;
    while not(DataSet.Eof) do
    begin
      Items.AddPair(DataSet.FieldByName(ValueField).AsString, DataSet.FieldByName(IndexField).AsString);
      DataSet.Next;
    end;
    DataSet.Last;

    for I := 0 to Items.Count - 1 do
    begin
      if AOwner Is TEdit then
        Self.AddObject<TEdit>(AOwner, [IndexField, ValueField], [Items.Names[I], Items.ValueFromIndex[I]], SelectedBy)
      else if AOwner Is TComboEdit then
        Self.AddObject<TComboEdit>(AOwner, [IndexField, ValueField], [Items.Names[I], Items.ValueFromIndex[I]], SelectedBy)
      else if AOwner Is TComboBox then
        Self.AddObject<TComboBox>(AOwner, [IndexField, ValueField], [Items.Names[I], Items.ValueFromIndex[I]], SelectedBy)
      else if AOwner Is TListBox then
        Self.AddObject<TListBox>(AOwner, [IndexField, ValueField], [Items.Names[I], Items.ValueFromIndex[I]], SelectedBy);
    end;
    Items.Destroy;

    if AOwner Is TComboBox then
      TListBox(TComboBox(AOwner).ListBox).AlternatingRowBackground := True
    else if AOwner Is TComboEdit then
      TListBox(TComboEdit(AOwner).ListBox).AlternatingRowBackground := True
    else if AOwner Is TListBox then
      TListBox(AOwner).AlternatingRowBackground := True;
  end;
  DataSet.Destroy;
end;

{
  ComboBoxComponent, 'Index', 'Value', IndexNumber;
}

procedure TConnector.ToMultiList(AOwner: TComponent; IndexField, ValueField: String; Detail1Fields: TArray<String> = []; SelectedBy : Integer = -1);
var
  Item: TListViewItem;
  DataSet : {$I CNC.Type.inc};
begin
  TListView(AOwner).ItemAppearanceClassName := 'TMultiDetailItemAppearance';
  TListView(AOwner).ItemEditAppearanceClassName := 'TMultiDetailDeleteAppearance';

  if (AOwner is TListView) and (TListView(AOwner) <> nil) and (TListView(AOwner).Items.Count > 0) then
  begin
    TListView(AOwner).Items.Clear;
    TListView(AOwner).EmptyFilter;
  end;

  DataSet := Self.ToDataSet(Self.FQuery);

  if DataSet.RecordCount > 0 then
  begin

    TListView(AOwner).BeginUpdate;
    try

      DataSet.First;
      while not(DataSet.Eof) do
      begin
        TListView(AOwner).AlternatingColors := True;

        Item := TListView(AOwner).Items.Add;
        Item.Index := DataSet.FieldByName(IndexField).AsInteger;
        Item.Text := DataSet.FieldByName(ValueField).AsString;
        if Length(Detail1Fields) > 0 then
        begin
          if Length(Detail1Fields) = 1 then
          begin
            if Detail1Fields[0] <> EmptyStr then
              Item.Data[TMultiDetailAppearanceNames.Detail1] := DataSet.FieldByName(Detail1Fields[0]).AsString;
          end;
          if Length(Detail1Fields) = 2 then
          begin
            if Detail1Fields[0] <> EmptyStr then
              Item.Data[TMultiDetailAppearanceNames.Detail1] := DataSet.FieldByName(Detail1Fields[0]).AsString;
            if Detail1Fields[1] <> EmptyStr then
              Item.Data[TMultiDetailAppearanceNames.Detail2] := DataSet.FieldByName(Detail1Fields[1]).AsString;
          end;
          if Length(Detail1Fields) = 3 then
          begin
            if Detail1Fields[0] <> EmptyStr then
              Item.Data[TMultiDetailAppearanceNames.Detail1] := DataSet.FieldByName(Detail1Fields[0]).AsString;
            if Detail1Fields[1] <> EmptyStr then
              Item.Data[TMultiDetailAppearanceNames.Detail2] := DataSet.FieldByName(Detail1Fields[1]).AsString;
            if Detail1Fields[2] <> EmptyStr then
              Item.Data[TMultiDetailAppearanceNames.Detail3] := DataSet.FieldByName(Detail1Fields[2]).AsString;
          end;
        end;

{ TODO -oNickson Jeanmerson -cProgrammer :
  1) Adicionar Suporte à Imagens via Blog com TImage/TBitmap e ImageString em Base64;
  2) Adicionar Suporte à Accessory; }

        //Item.BitmapRef := ImageRAD.Bitmap;
        DataSet.Next;
      end;
      DataSet.Last;

      if SelectedBy <> 0 then
        TListView(AOwner).ItemIndex := SelectedBy;

      DataSet.Destroy;
    finally
      TListView(AOwner).EndUpdate;
    end;

  end;
end;

{
  ComboBoxComponent, 'Index', 'Value', SelectedBy<'Index', IndexNumber>;
  ComboBoxComponent, 'Index', 'Value', SelectedBy<'Column', <'ColumnName', 'Value'>>;
}

procedure TConnector.ToMultiList(AOwner: TComponent; IndexField, ValueField: String; Detail1Fields: TArray<String>; SelectedBy: TDictionary<String, TArray<Variant>>);
begin

end;

procedure TConnector.ToGridTable(AOwner: TComponent; SelectedBy : Integer = -1);
var
  DataSet : {$I CNC.Type.inc};
begin
  if (AOwner is TStringGrid) and (TStringGrid(AOwner) <> nil) then
    TStringGrid(AOwner).ClearColumns
  else if (AOwner is TGrid) and (TGrid(AOwner) <> nil) then
    TGrid(AOwner).ClearColumns;

  DataSet := Self.ToDataSet(Self.FQuery);

  if DataSet.RecordCount > 0 then
  begin
    if AOwner Is TStringGrid then
      Self.AddObject<TStringGrid>(AOwner, DataSet, SelectedBy)
    else if AOwner Is TGrid then
      Self.AddObject<TGrid>(AOwner, DataSet, SelectedBy);
  end;
end;

procedure TConnector.ToGridTable(AOwner: TComponent; SelectedBy : TDictionary<String, TArray<Variant>> = nil);
var
  DataSet : {$I CNC.Type.inc};
begin
  if (AOwner is TStringGrid) and (TStringGrid(AOwner) <> nil) then
    TStringGrid(AOwner).ClearColumns
  else if (AOwner is TGrid) and (TGrid(AOwner) <> nil) then
    TGrid(AOwner).ClearColumns;

  DataSet := Self.ToDataSet(Self.FQuery);

  if DataSet.RecordCount > 0 then
  begin
    if AOwner Is TStringGrid then
      Self.AddObject<TStringGrid>(AOwner, DataSet, SelectedBy)
    else if AOwner Is TGrid then
      Self.AddObject<TGrid>(AOwner, DataSet, SelectedBy);
  end;
end;

procedure TConnector.ToGrid(AOwner: TComponent; SelectedBy : Integer = -1);
begin
  Self.ToGridTable(AOwner, SelectedBy);
end;

procedure TConnector.ToGrid(AOwner: TComponent; SelectedBy: TDictionary<String, TArray<Variant>>);
begin
  Self.ToGridTable(AOwner, SelectedBy);
end;

procedure TConnector.ToEdit(AOwner: TComponent; IndexField, ValueField: String; SelectedBy: Integer);
begin
  Self.ToFillList(AOwner, IndexField, ValueField, SelectedBy);
end;

procedure TConnector.ToEdit(AOwner: TComponent; IndexField, ValueField: String; SelectedBy: TDictionary<String, TArray<Variant>>);
begin
  Self.ToFillList(AOwner, IndexField, ValueField, SelectedBy);
end;

procedure TConnector.ToCombo(AOwner: TComponent; IndexField, ValueField: String; SelectedBy : Integer = -1);
begin
  Self.ToFillList(AOwner, IndexField, ValueField, SelectedBy);
end;

procedure TConnector.ToCombo(AOwner: TComponent; IndexField, ValueField: String; SelectedBy: TDictionary<String, TArray<Variant>> = nil);
begin
  Self.ToFillList(AOwner, IndexField, ValueField, SelectedBy);
end;

procedure TConnector.ToListBox(AOwner: TComponent; IndexField, ValueField: String; SelectedBy : Integer = -1);
begin
  Self.ToFillList(AOwner, IndexField, ValueField, SelectedBy);
end;

procedure TConnector.ToListBox(AOwner: TComponent; IndexField, ValueField: String; SelectedBy: TDictionary<String, TArray<Variant>>);
begin
  Self.ToFillList(AOwner, IndexField, ValueField, SelectedBy);
end;

procedure TConnector.ToListView(AOwner: TComponent; IndexField, ValueField: String; Detail1Fields: TArray<String> = []; SelectedBy : Integer = -1);
begin
  Self.ToMultiList(AOwner, IndexField, ValueField, Detail1Fields, SelectedBy);
end;

procedure TConnector.ToListView(AOwner: TComponent; IndexField, ValueField: String; Detail1Fields: TArray<String>; SelectedBy: TDictionary<String, TArray<Variant>>);
begin
  Self.ToMultiList(AOwner, IndexField, ValueField, Detail1Fields, SelectedBy);
end;

destructor TConnector.Destroy;
begin

  inherited;
end;

end.

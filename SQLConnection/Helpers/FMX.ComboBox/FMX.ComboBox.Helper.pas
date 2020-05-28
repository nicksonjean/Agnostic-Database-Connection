﻿unit FMX.ComboBox.Helper;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.DateUtils,
  FMX.Forms,
  FMX.Pickers,
  FMX.ListBox,
  FMX.Types,
  FMX.Controls,
  FMX.StdCtrls,
  FMX.SearchBox,
  EventDriven;

//https://living-sun.com/pt/delphi/232199-how-can-i-make-a-searchbox-visible-when-i-open-the-list-of-a-combobox-in-delphi-delphi-combobox-firemonkey-search-box.html
//https://code5.cn/so/delphi/706730
//https://android.developreference.com/article/18385583/TSearchBox+in+front+of+TListBoxItem+in+Android+with+Delphi+XE8

//https://blog.dummzeuch.de/2019/06/22/setting-the-drop-down-width-of-a-combobox-in-delphi/
//https://android.developreference.com/article/16137058/AutoComplete+functionality+for+FireMonkey+'s+TComboEdit
//http://www.devsuperpage.com/search/Articles.aspx?G=2&ArtID=22743
//http://codeverge.com/embarcadero.delphi.firemonkey/combobox-auto-complete/1059515
//http://www.planetadelphi.com.br/dica/5104/auto-preencher-combo-ao-digitar
//https://www.devmedia.com.br/forum/autocomplete-combobox-em-firemonkey-delphi/598816

//http://yaroslavbrovin.ru/new-approach-of-development-of-firemonkey-control-control-model-presentation-part-2-tedit-with-autocomplete-en/
//https://www.developpez.net/forums/d1701716/environnements-developpement/delphi/composants-fmx/fonctionnement-tcomboedit/
//https://jquery.develop-bugs.com/article/15398626/How+can+I+make+a+SearchBox+visible+when+I+open+the+list+of+a+ComboBox+in+Delphi
//https://www.developpez.net/forums/d1942684/environnements-developpement/delphi/composants-fmx/combobox-auto-completion-chose/

type
  TComboBoxHelper = class helper for TComboBox
  public
    procedure ShowSearchBox;
  end;

implementation

uses
  FMX.ListBox.Helper;

{ TComboBoxHelper }

procedure TComboBoxHelper.ShowSearchBox;
var
  FSearchBox: TSearchBox;
  FComboBoxIndex : Integer;
begin
  FSearchBox := TSearchBox.Create(Self.ListBox);
  FSearchBox.Align := TAlignLayout.Contents;
  FSearchBox.Parent := Self;
  FSearchBox.Visible := False;

  OnPopup := DelegateEvent(
    Self,
    procedure(Sender: TObject)
    begin
      FSearchBox.Visible := True;
      Sleep(10);
      Application.ProcessMessages;
      FSearchBox.SetFocus;
    end
  );
//  OnClosePopup := DelegateEvent(
//    Self,
//    procedure(Sender: TObject)
//    begin
//      //FSearchBox.Visible := False;
//    end
//  );
  FSearchBox.OnExit := DelegateEvent(
    Self,
    procedure(Sender: TObject)
    begin
      FSearchBox.Visible := False;
      FComboBoxIndex := TListBox(Self.ListBox).Items.IndexOf(FSearchBox.Text);
      Self.ItemIndex := FComboBoxIndex;
    end
  );
end;

end.

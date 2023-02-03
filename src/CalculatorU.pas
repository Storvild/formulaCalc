unit CalculatorU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Menus;

type
  TBtnPropRec = record
    Name: string;
    Width: integer;
    Height: integer;
    Left: integer;
    Top: integer;
    Button: TButton;
  end;

type
  TCalculatorF = class(TForm)
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    OkB: TButton;
    ResultL: TLabel;
    PopupMenu1: TPopupMenu;
    MICommaToDot: TMenuItem;
    MIAlwaysOnTop: TMenuItem;
    N1: TMenuItem;
    MIExit: TMenuItem;
    MICompactMode: TMenuItem;
    MICopy: TMenuItem;
    MIPaste: TMenuItem;
    MIClear: TMenuItem;
    N2: TMenuItem;
    HelpL: TLabel;
    MIResetSettings: TMenuItem;
    procedure OkBClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure MIAlwaysOnTopClick(Sender: TObject);
    procedure MICommaToDotClick(Sender: TObject);
    procedure MICompactModeClick(Sender: TObject);
    procedure MIExitClick(Sender: TObject);
    procedure MICopyClick(Sender: TObject);
    procedure MIPasteClick(Sender: TObject);
    procedure MIClearClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MIResetSettingsClick(Sender: TObject);
    procedure HelpLClick(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    buttonsProps: array of TBtnPropRec;
    oldFormWidth: integer;
    oldFormHeight: integer;
    FSettingCommaToDot: boolean;
    FSettingAlwaysOnTop: boolean;
    FSettingCompactMode: boolean;
    procedure SetSettingCommaToDot(const Value: boolean);
    procedure SetSettingAlwaysOnTop(const Value: boolean);
    procedure SetSettingCompactMode(const Value: boolean);
    { Private declarations }
  public
    Value: Double;
    procedure SetValue(inval: Double);
    procedure RecalcLabel();
    property SettingCommaToDot: boolean read FSettingCommaToDot write SetSettingCommaToDot;
    property SettingAlwaysOnTop: boolean read FSettingAlwaysOnTop write SetSettingAlwaysOnTop;
    property SettingCompactMode: boolean read FSettingCompactMode write SetSettingCompactMode;
    { Public declarations }
  end;

var
  CalculatorF: TCalculatorF;


implementation

{$R *.dfm}

uses ActiveX, ComObj, Registry, Clipbrd, HelpFormulasU;

function Recalc(intext: string): string;
var
  formula:OleVariant;
begin
  formula :=CreateOleObject('MSScriptControl.ScriptControl');
  formula.Language :='VBScript';
  Result := formula.Eval(intext);
end;

procedure TCalculatorF.OkBClick(Sender: TObject);
begin
  Edit1.Text := Recalc(Edit1.Text);
  Value := 0;
  Value := StrToFloat(Edit1.Text);
  ModalResult := mrOk;
end;


procedure TCalculatorF.BitBtn1Click(Sender: TObject);
begin
  if TBitBtn(Sender).Caption = '=' then
    Edit1.Text := Recalc(Edit1.Text)
  else if TBitBtn(Sender).Caption = 'С' then
    Edit1.Text := ''
  else if TBitBtn(Sender).Caption = '<=' then
  begin
    if Edit1.SelLength>0 then
      Edit1.Text := Copy(Edit1.Text, 0, Edit1.SelStart) + Copy(Edit1.Text, Edit1.SelStart+Edit1.SelLength+1, Length(Edit1.Text))
    else
      Edit1.Text := Copy(Edit1.Text, 1, Length(Edit1.Text)-1)
    //Edit1.SelStart
    //Edit1.Perform(WM_CHAR, VK_BACK, 0)
    //Edit1.Perform(WM_KEYDOWN, VK_DELETE, 0);
  end
  else
  begin
    if Edit1.SelLength>0 then
      Edit1.Text := Copy(Edit1.Text, 0, Edit1.SelStart) + TBitBtn(Sender).Caption + Copy(Edit1.Text, Edit1.SelStart+Edit1.SelLength+1, Length(Edit1.Text))
    else
      Edit1.Text := Edit1.Text + TBitBtn(Sender).Caption;
  end;
end;



procedure TCalculatorF.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    BitBtn15.Click;
    Edit1.SelStart := Length(Edit1.Text);
  end;
  if SettingCommaToDot and (Key = ',') then
    Key := '.';
end;

procedure TCalculatorF.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 13) then
    OkB.Click;
end;

procedure TCalculatorF.SetValue(inval: Double);
begin
  Value := inval;
end;

procedure TCalculatorF.FormResize(Sender: TObject);
var i: integer;
begin
  for i:= 0 to Length(buttonsProps)-1 do
  begin
    buttonsProps[i].Button.Left := Trunc(buttonsProps[i].Left * (Self.Width/oldFormWidth));
    buttonsProps[i].Button.Top := Trunc(buttonsProps[i].Top * (Self.Height/oldFormHeight));
    buttonsProps[i].Button.Width := Trunc(buttonsProps[i].Width * (Self.Width/oldFormWidth));
    buttonsProps[i].Button.Height := Trunc(buttonsProps[i].Height * (Self.Height/oldFormHeight));
    buttonsProps[i].Button.Font.Height := Trunc(buttonsProps[i].Button.Height*0.7);
  end;
end;

procedure TCalculatorF.FormCreate(Sender: TObject);
var i: integer;
    b: boolean;
    Reg: TRegistry;
begin
  // Параметры по умолчанию
  SettingCommaToDot := true;
  SettingAlwaysOnTop := false;
  SettingCompactMode := false;

  // Загрузка параметров из реестра
  Reg := TRegistry.Create(); //KEY_READ
  Reg.RootKey := HKEY_CURRENT_USER;
  b := Reg.OpenKey('Software\VSSoft\formulaCalc', true);
  //if not b then
  //  ShowMessage('Ошибка работы с реестром');
  try
    SettingCommaToDot := Reg.ReadBool('CommaToDot');
    SettingAlwaysOnTop := Reg.ReadBool('AlwaysOnTop');
    SettingCompactMode := Reg.ReadBool('CompactMode');
    //if Reg.KeyExists('FormWidth')=True then
    //self.Width := Reg.ReadInteger('FormWidth');
    //self.Height := Reg.ReadInteger('FormHeight');
  except
  end;
  Reg.CloseKey; // Запись и закрытие реестра
  Reg.Free;

  oldFormWidth := Self.Width;
  oldFormHeight := Self.Height;
  for i:=0 to Self.ComponentCount-1 do
  begin
    if (Self.Components[i].ClassName = 'TBitBtn') or (Self.Components[i].ClassName = 'TButton') then
    begin
      SetLength(buttonsProps, Length(buttonsProps) + 1);
      buttonsProps[High(buttonsProps)].Name := Self.Components[i].Name;
      buttonsProps[High(buttonsProps)].Button := TButton(Self.Components[i]);
      buttonsProps[High(buttonsProps)].Width := TButton(Self.Components[i]).Width;
      buttonsProps[High(buttonsProps)].Height := TButton(Self.Components[i]).Height;
      buttonsProps[High(buttonsProps)].Left := TButton(Self.Components[i]).Left;
      buttonsProps[High(buttonsProps)].Top := TButton(Self.Components[i]).Top;
    end;
  end;

  HelpL.ShowHint := true;
  Application.HintHidePause := 30000; //Время показа хинта 30сек
  HelpL.Hint := 'Пример: (1+2)/(3*2)^2'+#13#10;

end;

procedure TCalculatorF.RecalcLabel;
begin
  try
    ResultL.Caption := Recalc(Edit1.Text);
  except
    ResultL.Caption := '';
  end;

end;

procedure TCalculatorF.Edit1Change(Sender: TObject);
begin
  RecalcLabel();
end;

procedure TCalculatorF.MIAlwaysOnTopClick(Sender: TObject);
begin
  SettingAlwaysOnTop := not SettingAlwaysOnTop;
end;

procedure TCalculatorF.MICommaToDotClick(Sender: TObject);
begin
  SettingCommaToDot := not SettingCommaToDot;
end;

procedure TCalculatorF.MICompactModeClick(Sender: TObject);
begin
  SettingCompactMode := not SettingCompactMode;
end;


procedure TCalculatorF.SetSettingAlwaysOnTop(const Value: boolean);
begin
  FSettingAlwaysOnTop := Value;
  MIAlwaysOnTop.Checked := FSettingAlwaysOnTop;
  if SettingAlwaysOnTop then
    Self.FormStyle := fsStayOnTop
  else
    Self.FormStyle := fsNormal;
end;

procedure TCalculatorF.SetSettingCommaToDot(const Value: boolean);
begin
  FSettingCommaToDot := Value;
  MICommaToDot.Checked:= FSettingCommaToDot;
end;

procedure TCalculatorF.SetSettingCompactMode(const Value: boolean);
var i: integer;
begin
  FSettingCompactMode := Value;
  MICompactMode.Checked := FSettingCompactMode;
  for i:=0 to Self.ComponentCount-1 do
  begin
    if (Self.Components[i].ClassName = 'TBitBtn') or (Self.Components[i].ClassName = 'TButton') then
      TButton(Self.Components[i]).Visible := not Value;
  end;

  if FSettingCompactMode then
  begin
    Self.ClientHeight := ResultL.Top + ResultL.Height + 10;
  end
  else
  begin
    Self.ClientHeight := 200;
  end;
end;

procedure TCalculatorF.MIExitClick(Sender: TObject);
begin
  Close;
end;

procedure TCalculatorF.MICopyClick(Sender: TObject);
begin
  Clipboard.AsText := Edit1.Text;
end;

procedure TCalculatorF.MIPasteClick(Sender: TObject);
begin
  Edit1.Text := Clipboard.AsText;
end;

procedure TCalculatorF.MIClearClick(Sender: TObject);
begin
  Edit1.Clear;
end;

procedure TCalculatorF.FormClose(Sender: TObject; var Action: TCloseAction);
var Reg: TRegistry;
begin
  // Запись параметров в реестр
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_CURRENT_USER;
  Reg.OpenKey('Software\VSSoft\formulaCalc', true);
  Reg.WriteBool('CommaToDot', SettingCommaToDot);
  Reg.WriteBool('AlwaysOnTop', SettingAlwaysOnTop);
  Reg.WriteBool('CompactMode', SettingCompactMode);
  //Reg.WriteInteger('FormWidth', self.Width);
  //Reg.WriteInteger('FormHeight', self.Height);
  Reg.CloseKey;
  Reg.Free;
end;

procedure TCalculatorF.MIResetSettingsClick(Sender: TObject);
var Reg: TRegistry;
begin
  SettingCommaToDot := true;
  SettingAlwaysOnTop := false;
  SettingCompactMode := false;
  Self.Width := 171;
  Self.Height := 236;
  //Reg := TRegistry.Create;
  //Reg.RootKey := HKEY_CURRENT_USER;
  //Reg.DeleteKey('Software\VSSoft\formulaCalc');
  //Reg.CloseKey;
  //Reg.Free;

end;

procedure TCalculatorF.HelpLClick(Sender: TObject);
begin
  HelpFormulasF.Show;
end;

procedure TCalculatorF.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
  SC_DragMove = $F012; 
begin
  ReleaseCapture;    CalculatorF.perform(WM_SysCommand,SC_DragMove,0); 
end;

end.

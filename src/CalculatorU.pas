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
    procedure OkBClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    buttonsProps: array of TBtnPropRec;
    oldFormWidth: integer;
    oldFormHeight: integer;
    SettingCommaToDot: boolean;
  public
    Value: Double;
    procedure SetValue(inval: Double);
    procedure RecalcLabel();
  end;

var
  CalculatorF: TCalculatorF;


implementation

{$R *.dfm}

uses ActiveX, ComObj, Registry;

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
  else if TBitBtn(Sender).Caption = 'Ñ' then
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
begin
  SettingCommaToDot := false;

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

end.

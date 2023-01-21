unit CalculatorU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
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
    procedure OkBClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    Value : Double;
    { Public declarations }
  end;

var
  Form1: TForm1;

function Recalc(intext: string): string;

implementation

{$R *.dfm}

uses ActiveX, ComObj;

function Recalc(intext: string): string;
var
  formula:OleVariant;
begin
  formula :=CreateOleObject('MSScriptControl.ScriptControl');
  formula.Language :='VBScript';
  Result := formula.Eval(intext);
end;

procedure TForm1.OkBClick(Sender: TObject);
begin
  Value := 0;
  Value := StrToFloat(Edit1.Text);
  ModalResult := mrOk;
end;


procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  if TBitBtn(Sender).Caption = '=' then
    Edit1.Text := Recalc(Edit1.Text)
    //Button1.Click
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



procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    BitBtn15.Click;
    Edit1.SelStart := Length(Edit1.Text);
  end;
end;

end.

unit HelpFormulasU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  THelpFormulasF = class(TForm)
    ListBox1: TListBox;
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HelpFormulasF: THelpFormulasF;

implementation

{$R *.dfm}

uses CalculatorU;

procedure THelpFormulasF.FormCreate(Sender: TObject);
var
  s: string;
begin
  s :='sqrt(4) : Квадратный корень из 4'+#13#10+
      'DateAdd("d", 5, "29.01.2023") : Добавление 5 дней к дате 29.01.2023. Возможные варианты: d-день, m-месяц, yyyy-год, q-квартал, y-день года, w-день недели, ww-неделя года, h-час, n-минута, s-секунда'+#13#10+
      '';
  //Источник: https://codernotes.ru/articles/vbs/vstroennye-funkcii-v-vbscript.html

  ListBox1.Items.Text := s;


end;

procedure THelpFormulasF.ListBox1DblClick(Sender: TObject);
var s: string;
begin
  s := ListBox1.Items[ListBox1.ItemIndex];
  s := Copy(s, 1, pos(' : ', s)-1);
  CalculatorF.Edit1.Text := CalculatorF.Edit1.Text + s;
end;

end.


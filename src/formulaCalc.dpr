program formulaCalc;

uses
  Forms,
  CalculatorU in 'CalculatorU.pas' {CalculatorF};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TCalculatorF, CalculatorF);
  Application.Run;
end.

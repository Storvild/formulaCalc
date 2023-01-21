program formulaCalc;

uses
  Forms,
  CalculatorU in 'CalculatorU.pas' {CalculatorF},
  HelpFormulasU in 'HelpFormulasU.pas' {HelpFormulasF};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TCalculatorF, CalculatorF);
  Application.CreateForm(THelpFormulasF, HelpFormulasF);
  Application.Run;
end.

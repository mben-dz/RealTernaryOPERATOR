program Test;

uses
  Vcl.Forms,
  Main.View in 'Main.View.pas' {MainView},
  API.Test in 'API\API.Test.pas';

{$R *.res}
var
  MainView: TMainView;
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainView, MainView);
  Application.Run;
end.

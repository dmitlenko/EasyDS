program easyds;





uses
  Vcl.Forms,
  main in 'main.pas' {mainForm},
  about in 'about.pas' {aboutForm},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'EasyDS';
  Application.CreateForm(TmainForm, mainForm);
  Application.CreateForm(TaboutForm, aboutForm);
  Application.Run;
end.

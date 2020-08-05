program easyds;





uses
  Vcl.Forms,
  main in 'main.pas' {mainForm},
  about in 'about.pas' {aboutForm},
  configure in 'configure.pas' {configureForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'EasyDS';
  Application.CreateForm(TmainForm, mainForm);
  Application.CreateForm(TaboutForm, aboutForm);
  Application.CreateForm(TconfigureForm, configureForm);
  Application.Run;
end.

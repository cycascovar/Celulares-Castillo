program CelularesCastillo;

uses
  Forms,
  F_Login in 'F_Login.pas' {FLogin},
  splashScreen in 'splashScreen.pas' {SplashForm},
  FPrincipalEmpleados in 'FPrincipalEmpleados.pas' {FPrincipal},
  FGarantia in 'FGarantia.pas' {FGarantias},
  FReparacion in 'FReparacion.pas' {FReparaciones},
  FAlmacen_Local in 'FAlmacen_Local.pas' {FAlmacenLocal},
  FRecargas in 'FRecargas.pas' {F_Recargas},
  FR_VentaDiario in 'FR_VentaDiario.pas' {FRVentaDiario},
  FA_Login in 'super\FA_Login.pas' {FALogin},
  F_PrincipalAdmin in 'super\F_PrincipalAdmin.pas' {FPrincipalAdmin},
  CClientesGarantia in 'super\CClientesGarantia.pas' {C_ClientesGarantia},
  F_AltaEquipos in 'super\F_AltaEquipos.pas' {FAltaEquipo},
  F_Usuarios in 'super\F_Usuarios.pas' {FUsuarios},
  FC_EquiposEntregados in 'super\FC_EquiposEntregados.pas' {FCEquiposEntregados},
  uCore in 'uCore.pas',
  C_Recargas in 'super\C_Recargas.pas' {CRecargas},
  F_Main in 'super\F_Main.pas' {FMain},
  F_About in 'F_About.pas' {FAbout},
  FR_Movimientoslog in 'super\FR_Movimientoslog.pas' {FRMovimientosLog},
  CClientesReparacion in 'super\CClientesReparacion.pas' {C_ClientesReparacion},
  F_AContacto in 'super\F_AContacto.pas' {FAContacto},
  FR_Almacen in 'FR_Almacen.pas' {FRAlmacen},
  CClientesVentas in 'super\CClientesVentas.pas' {Form1},
  FC_EquiposReparacion in 'super\FC_EquiposReparacion.pas' {Form2},
  FC_EquiposGarantia in 'super\FC_EquiposGarantia.pas' {FCEQuiposGarantia},
  _FReporteTest in '_FReporteTest.pas' {__FReporteTest},
  FR_EReparacion in 'FR_EReparacion.pas' {FREReparacion},
  FR_EGarantia in 'FR_EGarantia.pas' {FREGarantia};

{$R *.res}
begin
  SplashForm := TSplashForm.Create(Application);
  SplashForm.Show;
  SplashForm.Update;

  SplashForm.ProgressBar1.Min := 0;
  SplashForm.ProgressBar1.Step := 1;

{  Application.Initialize;}

{  SplashForm := TSplashForm.Create(Application);
  SplashForm.Show;
  SplashForm.Update;}

//  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFLogin, FLogin);
  Application.CreateForm(T__FReporteTest, __FReporteTest);
  Application.CreateForm(TFREReparacion, FREReparacion);
  Application.CreateForm(TFREGarantia, FREGarantia);
  SplashForm.ProgressBar1.StepIt();
  Application.CreateForm(TFRMovimientosLog, FRMovimientosLog);
    SplashForm.ProgressBar1.StepIt();
  Application.CreateForm(TC_ClientesReparacion, C_ClientesReparacion);
    SplashForm.ProgressBar1.StepIt();
  Application.CreateForm(TFAContacto, FAContacto);
    SplashForm.ProgressBar1.StepIt();
  Application.CreateForm(TFRAlmacen, FRAlmacen);
    SplashForm.ProgressBar1.StepIt();
  Application.CreateForm(TForm1, Form1);
    SplashForm.ProgressBar1.StepIt();
  Application.CreateForm(TForm2, Form2);
    SplashForm.ProgressBar1.StepIt();
  Application.CreateForm(TFCEquiposGarantia, FCEquiposGarantia);
  //  Application.CreateForm(TSplashForm, SplashForm);
  SplashForm.ProgressBar1.StepIt();
  Application.CreateForm(TFPrincipal, FPrincipal);
  SplashForm.ProgressBar1.StepIt();
  Application.CreateForm(TFGarantias, FGarantias);
  SplashForm.ProgressBar1.StepIt();
  Application.CreateForm(TFReparaciones, FReparaciones);
  SplashForm.ProgressBar1.StepIt();
  Application.CreateForm(TFAlmacenLocal, FAlmacenLocal);
  SplashForm.ProgressBar1.StepIt();
  Application.CreateForm(TF_Recargas, F_Recargas);
  SplashForm.ProgressBar1.StepIt();
  Application.CreateForm(TFRVentaDiario, FRVentaDiario);
  SplashForm.ProgressBar1.StepIt();
  Application.CreateForm(TFALogin, FALogin);
  SplashForm.ProgressBar1.StepIt();
  Application.CreateForm(TFPrincipalAdmin, FPrincipalAdmin);
  SplashForm.ProgressBar1.StepIt();
  Application.CreateForm(TC_ClientesGarantia, C_ClientesGarantia);
  SplashForm.ProgressBar1.StepIt();
  Application.CreateForm(TFAltaEquipo, FAltaEquipo);
  SplashForm.ProgressBar1.StepIt();
  Application.CreateForm(TFUsuarios, FUsuarios);
  SplashForm.ProgressBar1.StepIt();
  Application.CreateForm(TFCEquiposEntregados, FCEquiposEntregados);
  SplashForm.ProgressBar1.StepIt();
  Application.CreateForm(TCRecargas, CRecargas);
  SplashForm.ProgressBar1.StepIt();
  Application.CreateForm(TFMain, FMain);
  SplashForm.ProgressBar1.StepIt();
  Application.CreateForm(TFAbout, FAbout);
  SplashForm.ProgressBar1.StepIt();
  SplashForm.Hide;
  SplashForm.Free;
  Application.Run;
end.

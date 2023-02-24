program prjAtualizaVersao;

uses
  Vcl.Forms,
  uPrincipal in 'Unit\uPrincipal.pas' {frmPrincipal},
  uDM in 'Unit\uDM.pas' {DM: TDataModule},
  Bib.Functions in 'Unit\Bib.Functions.pas',
  BO.AtualizaVersao in 'Unit\BO\BO.AtualizaVersao.pas',
  Pattern.SingletonConecta in 'Unit\Pattern.SingletonConecta.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.

program PDV;

uses
  Vcl.Forms,
  uDM in 'uDM.pas' {DM: TDataModule},
  uClassProdutos in 'uClassProdutos.pas',
  uClassClientes in 'uClassClientes.pas',
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uClassVendas in 'uClassVendas.pas',
  uFuncoes in 'uFuncoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.

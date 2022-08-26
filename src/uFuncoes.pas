unit uFuncoes;

interface

uses
  Vcl.StdCtrls, Vcl.Dialogs, Vcl.Samples.Spin, Vcl.Forms, Winapi.Windows;

function isEmpty(obj: TObject; msg: string): Boolean;
function iif(pCond: boolean; pTrue, pFalse: Variant): Variant;
function ShowConfirmationDlg(const sMsg: string; bBotaoSim: boolean = True): boolean;

implementation

function isEmpty(obj: TObject; msg: string): Boolean;
begin
  if obj is TEdit then
  begin
    if (obj as TEdit).Text = '' then
    begin
      ShowMessage(msg);
      (obj as TEdit).SetFocus;
      Result := False;
    end;
  end else
  if obj is TSpinEdit then
  begin
    if (obj as TSpinEdit).Value = 0 then
    begin
      ShowMessage(msg);
      (obj as TSpinEdit).SetFocus;
      Result := False;
    end;
  end;
end;

function iif(pCond: boolean; pTrue, pFalse: Variant): Variant;
begin
  If pCond Then
    Result := pTrue
  else
    Result := pFalse;
end;

function ShowConfirmationDlg(const sMsg: string; bBotaoSim: boolean = True): boolean;
begin
  If application.MessageBox(PChar(sMsg), 'Confirmação', MB_ICONQUESTION + MB_YESNO + iif(bBotaoSim, MB_DEFBUTTON1, MB_DEFBUTTON2)) = idyes then
    Result := True
  else
    Result := False;
end;

end.

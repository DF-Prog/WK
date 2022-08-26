unit uClassClientes;

interface

uses
  Vcl.StdCtrls, System.Classes;

function listClientes: TStringList;

implementation

uses
  uDM;

function listClientes: TStringList;
var
  cmbClientes: TComboBox;
  lst: TStringList;
begin
  lst := TStringList.Create;
  try
    DM.sqlData('CLIENTES', '*', '', 'DS_NOME');
    DM.qryTmp.First;
    while not DM.qryTmp.Eof do
    begin
      lst.Add(DM.qryTmp.FieldByName('ID_CLIENTE').AsString + ' | ' + DM.qryTmp.FieldByName('DS_NOME').AsString);
      DM.qryTmp.Next;
    end;
    Result := lst;
  finally
    lst := nil;
  end;
end;

end.

unit uClassVendas;

interface

uses
  System.SysUtils;

procedure getVenda;
procedure newVenda;
procedure updVenda(id: string);
procedure getItens;

implementation

uses
  uDM;

procedure getVenda;
begin
  DM.cdsVendas.Close;
  DM.qryVendas.Close;
  DM.qryVendas.SQL.Text := 'SELECT * FROM VENDAS WHERE VE_EM_ANDAMENTO = 1 LIMIT 1';
  DM.qryVendas.Open;
  DM.cdsVendas.Open;
  if DM.cdsVendas.IsEmpty then
    newVenda
  else
    getItens;
end;

procedure newVenda;
var
  str: string;
begin
  str := 'INSERT INTO VENDAS (VE_ID_CLIENTE) VALUES (1)';
  DM.cnnBD.ExecSQL(str);
  if DM.FDTransaction1.Active then
    DM.FDTransaction1.CommitRetaining;
  getVenda;
end;

procedure updVenda(id: string);
begin
  DM.cdsVendas.Edit;
  DM.cdsVendas.FieldByName('VE_ID_CLIENTE').AsString := id;
  DM.cdsVendas.FieldByName('VE_EM_ANDAMENTO').AsBoolean := False;
  DM.cdsVendas.Post;
end;

procedure getItens;
begin
  DM.cdsVendasItens.Close;
  DM.qryVendasItens.SQL.Text := 'SELECT VI.*, P.DS_PRODUTO FROM VENDAS_ITENS VI';
  DM.qryVendasItens.SQL.Add('LEFT JOIN PRODUTOS P ON P.ID_PRODUTO = VI.VI_ID_PRODUTO');
  DM.qryVendasItens.SQL.Add('WHERE VI_DT_VENDA = '+QuotedStr(FormatDateTime('yyyy-mm-dd', DM.qryVendas.FieldByName('VE_DATA').AsDateTime)));
  DM.qryVendasItens.SQL.Add('AND VI_ID_VENDA = '+DM.qryVendas.FieldByName('VE_ID').AsString);
  DM.cdsVendasItens.Open;
  DM.cdsVendasItens.Last;
end;

end.

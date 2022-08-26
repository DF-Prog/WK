unit uClassProdutos;

interface

uses
  System.SysUtils;

function getProduto(id: string): Boolean;
function insProduto(id, nr_quantidade, vl_unitario: string): Boolean;
function updProduto(nr_quantidade, vl_unitario: string): Boolean;
function delProduto: Boolean;

implementation

uses
  uDM;

function getProduto(id: string): Boolean;
begin
  DM.sqlData('PRODUTOS', ' *', ' AND ID_PRODUTO = '+id, 'DS_PRODUTO LIMIT 1');
  Result := DM.qryTmp.IsEmpty;
end;

function insProduto(id, nr_quantidade, vl_unitario: string): Boolean;
var
  str: string;
begin
  DM.cdsVendasItens.Insert;
  DM.cdsVendasItens.FieldByName('VI_DT_VENDA').AsDateTime := DM.cdsVendas.FieldByName('VE_DATA').AsDateTime;
  DM.cdsVendasItens.FieldByName('VI_ID_VENDA').AsInteger := DM.cdsVendas.FieldByName('VE_ID').AsInteger;
  DM.cdsVendasItens.FieldByName('VI_ITEM').AsInteger := 0;

  DM.cdsVendasItens.FieldByName('VI_ID_PRODUTO').AsInteger := StrToInt(Id);
  DM.cdsVendasItens.FieldByName('NR_QUANTIDADE').AsCurrency := StrToCurr(nr_quantidade);
  DM.cdsVendasItens.FieldByName('VL_UNITARIO').AsCurrency := StrToCurr(vl_unitario);
  DM.cdsVendasItens.Post;
end;

function updProduto(nr_quantidade, vl_unitario: string): Boolean;
var
  str: string;
begin
  DM.cdsVendasItens.Edit;
  DM.cdsVendasItens.FieldByName('NR_QUANTIDADE').AsCurrency := StrToCurr(nr_quantidade);
  DM.cdsVendasItens.FieldByName('VL_UNITARIO').AsCurrency := StrToCurr(vl_unitario);
  DM.cdsVendasItens.Post;
end;

function delProduto: Boolean;
begin
  DM.cdsVendasItens.Delete;
end;

end.

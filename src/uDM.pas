unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  FireDAC.Comp.UI, Data.DB, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Datasnap.DBClient, Datasnap.Provider,
  FireDAC.Comp.DataSet;

type
  TDM = class(TDataModule)
    cnnBD: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    FDTransaction1: TFDTransaction;
    qryClientes: TFDQuery;
    dspClientes: TDataSetProvider;
    cdsClientes: TClientDataSet;
    qryProdutos: TFDQuery;
    dspProdutos: TDataSetProvider;
    cdsProdutos: TClientDataSet;
    qryVendas: TFDQuery;
    dspVendas: TDataSetProvider;
    cdsVendas: TClientDataSet;
    qryVendasItens: TFDQuery;
    dspVendasItens: TDataSetProvider;
    cdsVendasItens: TClientDataSet;
    qryTmp: TFDQuery;
    cdsTmp: TClientDataSet;
    cdsVendasItensVI_DT_VENDA: TDateField;
    cdsVendasItensVI_ID_VENDA: TIntegerField;
    cdsVendasItensVI_ITEM: TIntegerField;
    cdsVendasItensVI_ID_PRODUTO: TIntegerField;
    cdsVendasItensNR_QUANTIDADE: TBCDField;
    cdsVendasItensVL_UNITARIO: TBCDField;
    cdsVendasItensVL_TOTAL: TBCDField;
    cdsVendasItensDS_PRODUTO: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure ComitaTransacao(DataSet: TDataSet);
  private
    { Private declarations }
  public
    function sqlData(table, fields, where, order: string): Boolean;
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.ComitaTransacao(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  if FDTransaction1.Active then
    FDTransaction1.CommitRetaining;
  (DataSet as TClientDataSet).Close;
  (DataSet as TClientDataSet).Open;

end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  cdsTmp.FieldDefs.Clear;
  cdsTmp.FieldDefs.Add('ID_PRODUTO', ftInteger);
  cdsTmp.FieldDefs.Add('NR_QUANTIDADE', ftCurrency);
  cdsTmp.FieldDefs.Add('VL_UNITARIO', ftCurrency);
  cdsTmp.FieldDefs.Add('VL_TOTAL', ftCurrency);
  cdsTmp.CreateDataSet;
end;

function TDM.sqlData(table, fields, where, order: string): Boolean;
begin
  qryTmp.Close;
  qryTmp.SQL.Text := 'SELECT '+fields;
  qryTmp.SQL.Add('FROM '+table);
  qryTmp.SQL.Add('WHERE 1=1 '+where);
  qryTmp.SQL.Add('ORDER BY '+order);
  qryTmp.Open;
end;

end.

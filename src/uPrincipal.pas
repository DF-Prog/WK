unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Samples.Spin, Vcl.Grids, Vcl.DBGrids;

type
  TfrmPrincipal = class(TForm)
    grpProdutos: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    dbgrdProdutos: TDBGrid;
    speQuantidade: TSpinEdit;
    edtCodigo: TEdit;
    edtVlUnitario: TEdit;
    btnInserir: TBitBtn;
    edtTotal: TEdit;
    edtDescricao: TEdit;
    grpClientes: TGroupBox;
    cmbClientes: TComboBox;
    dtsVendasItens: TDataSource;
    btnGravar: TBitBtn;
    Label6: TLabel;
    lblNrPedido: TLabel;
    procedure FormShow(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ProximoCampo(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnInserirClick(Sender: TObject);
    procedure dbgrdProdutosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  uDM, uFuncoes, uClassClientes, uClassProdutos, uClassVendas;

{$R *.dfm}

procedure novoRegistro;
begin
  getVenda;
  frmPrincipal.edtTotal.Text := FormatFloat(',0.00', DM.cdsVendas.FieldByName('VE_VL_TOTAL').AsCurrency);
  frmPrincipal.cmbClientes.Items := listClientes();
  frmPrincipal.cmbClientes.ItemIndex := frmPrincipal.cmbClientes.Items.IndexOf('1 | CONSUMIDOR');
  frmPrincipal.speQuantidade.Value := 1;
  frmPrincipal.lblNrPedido.Caption := DM.cdsVendas.FieldByName('VE_ID').AsString;
  frmPrincipal.edtVlUnitario.Clear;
  frmPrincipal.edtCodigo.Clear;
  frmPrincipal.edtCodigo.SetFocus;
end;

procedure TfrmPrincipal.btnGravarClick(Sender: TObject);
begin
  updVenda(Copy(cmbClientes.Text, 1, Pos(' | ', cmbClientes.Text)-1));
  novoRegistro;
end;

procedure TfrmPrincipal.btnInserirClick(Sender: TObject);
begin
  if IsEmpty(edtCodigo, 'Produto não informado, verifique e tente novamente.') = False then
    Abort;

  if IsEmpty(speQuantidade, 'Quantidade não informada, verifique e tente novamente.') = False then
    Abort;

  if IsEmpty(edtVlUnitario, 'Preço do Produto não informado, verifique e tente novamente.') = False then
    Abort;

  try
    if btnInserir.Caption = 'Inserir' then
      insPRODUTO(edtCodigo.Text, speQuantidade.Text, edtVlUnitario.Text)
    else
      updPRODUTO(speQuantidade.Text, edtVlUnitario.Text);
  finally
    btnInserir.Caption := 'Inserir';
    novoRegistro;
    edtVlUnitario.Clear;
    edtDescricao.Clear;
    edtCodigo.Clear;
    edtCodigo.SetFocus;
  end;
end;

procedure TfrmPrincipal.dbgrdProdutosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key in ([VK_LEFT, VK_RIGHT]) then
    edtCodigo.SetFocus
  else if Key = VK_RETURN then
  begin
    if DM.cdsVendasItens.IsEmpty then
      Exit;
    edtCodigo.Text := DM.cdsVendasItens.FieldByName('VI_ID_PRODUTO').AsString;
    edtDescricao.Text := DM.cdsVendasItens.FieldByName('DS_PRODUTO').AsString;
    speQuantidade.Value := DM.cdsVendasItens.FieldByName('VI_ID_PRODUTO').AsInteger;
    edtVlUnitario.Text := DM.cdsVendasItens.FieldByName('VI_ID_PRODUTO').AsString;
    edtCodigo.Text := DM.cdsVendasItens.FieldByName('VI_ID_PRODUTO').AsString;
    btnInserir.Caption := 'Atualizar';
    speQuantidade.SetFocus;
  end
  else if Key = VK_DELETE then
  begin
    if DM.cdsVendasItens.IsEmpty then
      Exit;
    if ShowConfirmationDlg('Confirma a exclusão desse registro?', False) then
    begin
      delProduto;
      novoRegistro;
    end;
  end;
end;

procedure TfrmPrincipal.edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    if edtCodigo.Text = '' then
      Exit;
    if getProduto(edtCodigo.Text) then
    begin
      ShowMessage('Produto não encontrado, verifique e tente novamente.');
      edtCodigo.SelectAll;
      edtCodigo.SetFocus;
      Exit;
    end
    else
    begin
      edtDescricao.Text := DM.qryTmp.FieldByName('DS_PRODUTO').AsString;
      edtVlUnitario.Text := DM.qryTmp.FieldByName('VL_UNITARIO').AsString;
      speQuantidade.SetFocus;
    end;
  end
  else if Key in ([VK_UP, VK_DOWN]) then
    dbgrdProdutos.SetFocus

end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  novoRegistro;
end;

procedure TfrmPrincipal.ProximoCampo(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    perform(WM_NEXTDLGCTL, 0, 0);
end;

end.

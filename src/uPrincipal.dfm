object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Pedido de Venda'
  ClientHeight = 375
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  ScreenSnap = True
  ShowHint = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grpProdutos: TGroupBox
    Left = 8
    Top = 72
    Width = 785
    Height = 295
    Caption = ' Produtos '
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 103
      Height = 13
      Caption = 'C'#243'digo do Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 56
      Width = 130
      Height = 13
      Caption = 'Quantidade do Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 96
      Width = 97
      Height = 13
      Caption = 'Pre'#231'o do Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 8
      Top = 208
      Width = 61
      Height = 13
      Caption = 'Valor Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 144
      Top = 16
      Width = 120
      Height = 13
      Caption = 'Descri'#231#227'o do Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 8
      Top = 256
      Width = 46
      Height = 13
      Caption = 'Pedido n'#176
    end
    object lblNrPedido: TLabel
      Left = 64
      Top = 256
      Width = 63
      Height = 13
      Caption = 'lblNrPedido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbgrdProdutos: TDBGrid
      Left = 144
      Top = 72
      Width = 633
      Height = 209
      TabStop = False
      DataSource = dtsVendasItens
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnKeyDown = dbgrdProdutosKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'VI_ID_PRODUTO'
          Title.Caption = 'C'#243'digo do Produto'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_PRODUTO'
          Title.Caption = 'Descri'#231#227'o do Produto'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_QUANTIDADE'
          Title.Caption = 'Quantidade'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_UNITARIO'
          Title.Caption = 'R$ Unit'#225'rio'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_TOTAL'
          Title.Caption = 'R$ Total'
          Width = 80
          Visible = True
        end>
    end
    object speQuantidade: TSpinEdit
      Left = 8
      Top = 72
      Width = 130
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      MaxValue = 0
      MinValue = 0
      ParentFont = False
      TabOrder = 2
      Value = 1
      OnKeyDown = ProximoCampo
    end
    object edtCodigo: TEdit
      Left = 8
      Top = 32
      Width = 130
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Text = '1'
      OnKeyDown = edtCodigoKeyDown
    end
    object edtVlUnitario: TEdit
      Left = 8
      Top = 112
      Width = 130
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      MaxLength = 14
      ParentFont = False
      TabOrder = 4
      Text = '1,00'
      OnKeyDown = ProximoCampo
    end
    object btnInserir: TBitBtn
      Left = 8
      Top = 144
      Width = 130
      Height = 25
      Caption = 'Inserir'
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      ModalResult = 1
      NumGlyphs = 2
      TabOrder = 5
      OnClick = btnInserirClick
    end
    object edtTotal: TEdit
      Left = 8
      Top = 224
      Width = 130
      Height = 21
      TabStop = False
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      MaxLength = 14
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
      Text = '0'
    end
    object edtDescricao: TEdit
      Left = 144
      Top = 32
      Width = 633
      Height = 21
      TabStop = False
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object btnGravar: TBitBtn
      Left = 8
      Top = 175
      Width = 130
      Height = 25
      Caption = 'Gravar Pedido'
      TabOrder = 6
      TabStop = False
      OnClick = btnGravarClick
    end
  end
  object grpClientes: TGroupBox
    Left = 8
    Top = 8
    Width = 784
    Height = 58
    Caption = ' Cliente '
    TabOrder = 0
    object cmbClientes: TComboBox
      Left = 8
      Top = 24
      Width = 769
      Height = 21
      Style = csDropDownList
      TabOrder = 0
    end
  end
  object dtsVendasItens: TDataSource
    DataSet = DM.cdsVendasItens
    Left = 696
    Top = 208
  end
end

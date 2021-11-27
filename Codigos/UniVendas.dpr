//////////////////////////////////////////////////////////////////////////
// Criacao...........: 07/2002
// Sistema...........: Controle de Vendas - Unimed
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

program UniVendas;

uses
  Forms,
  UnitVendedor in 'UnitVendedor.pas' {FrmVendedor},
  UnitDmdados in 'UnitDmdados.pas' {DMdados: TDataModule},
  UnitMotCancel in 'UnitMotCancel.pas' {FrmMotCancel},
  UnitPrincipal in 'UnitPrincipal.pas' {FrmPrincipal},
  UnitSobre in 'UnitSobre.pas' {FrmSobre},
  unitParametro in 'unitParametro.pas' {FrmParametro},
  unitCadPlano in 'unitCadPlano.pas' {FrmCadPlano},
  unitLocVenda in 'UnitLocVenda.pas' {frmLocVenda},
  unitGeraComis in 'unitGeraComis.pas' {frmGeraComis},
  unitQrVenda in 'unitQrVenda.pas' {QrVenda},
  unitRelVendas in 'unitRelVendas.pas' {FrmRelVenda},
  unitQrComissao in 'unitQrComissao.pas' {QrComissao},
  UnitLocFunc in 'UnitLocFunc.pas' {FrmLocVend},
  UnitRelFunc in 'UnitRelFunc.pas' {FrmRelFunc},
  UnitQRFunc in 'UnitQRFunc.pas' {QRFunc: TQuickRep},
  unitQrVendaCancel in 'unitQrVendaCancel.pas' {QrVendaCancel},
  unitLocCliente in 'unitLocCliente.pas' {frmLocCliente},
  UnitRelCliente in 'UnitRelCliente.pas' {FrmRelCliente},
  UnitQRCliente in 'UnitQRCliente.pas' {QRCliente: TQuickRep},
  unitTotais in 'unitTotais.pas' {frmTotal},
  unitQrLancado in 'unitQrLancado.pas' {QrLancado},
  unitQrClassif in 'unitQrClassif.pas' {QrClassif},
  UnitCadSenha in 'UnitCadSenha.pas' {frmCadSenha},
  unitRelVendaTxT in 'unitRelVendaTxT.pas' {FrmRelVendaTxT},
  unitQrVendaTxT in 'unitQrVendaTxT.pas' {QrVendaTxT},
  unitQrComissaoTxT in 'unitQrComissaoTxT.pas' {QrComissaoTxT},
  unitQrClassifTxT in 'unitQrClassifTxT.pas' {QrClassifTxt},
  unitRelMotCancel in 'unitRelMotCancel.pas' {FrmRelCodMotCancel},
  unitQrMotCancel in 'unitQrMotCancel.pas' {QrCodMotCancel},
  UnitCadCliente in 'UnitCadCliente.pas' {FrmCadClientes},
  UnitContVenda in 'UnitContVenda.pas' {FrmContVenda},
  UnitCancelar in 'UnitCancelar.pas' {FrmCancelar},
  unitAberto in 'unitAberto.pas' {FrmAberto},
  unitPagar in 'unitPagar.pas' {frmPagar};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDMdados, DMdados);
  Application.CreateForm(TFrmCadClientes, FrmCadClientes);
  Application.CreateForm(TFrmContVenda, FrmContVenda);
  Application.CreateForm(TFrmCancelar, FrmCancelar);
  Application.CreateForm(TFrmAberto, FrmAberto);
  Application.CreateForm(TfrmPagar, frmPagar);
  Application.Run;
end.

//////////////////////////////////////////////////////////////////////////
// Criacao...........: 07/2002
// Sistema...........: Controle de Vendas - Unimed
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, RxMenus, StdCtrls, ImgList, ComCtrls, ToolWin, ExtCtrls, jpeg,
  SRLabel, LMDGraphicControl, LMDScrollText, LMDControl, LMDBaseControl,
  LMDBaseGraphicControl, LMDBaseLabel, LMDCustomLabel, LMDCustomLabelFill,
  LMDLabelFill, XPMenu, ShellApi, LMDCustomComponent, LMDCustomHint,
  LMDCustomShapeHint, LMDShapeHint, EHintBal, EAppProt, EFocCol, RXCtrls,
  EUserAcs, EPaswd, DB, DBTables, ECripto, RxGrdCpt;

type
  TFrmPrincipal = class(TForm)
    ControlBar1: TControlBar;
    stMenuBotoes: TToolBar;
    btVend: TToolButton;
    ToolButton2: TToolButton;
    btRelatorio: TToolButton;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    Configuraes1: TMenuItem;
    Gerais1: TMenuItem;
    Ajuda1: TMenuItem;
    EnviesuaDvidapeloEmail1: TMenuItem;
    SobreoTritonLigth1: TMenuItem;
    ImageList2: TImageList;
    Clientes1: TMenuItem;
    Bancos1: TMenuItem;
    PopRelatorio: TPopupMenu;
    PopAjuda: TPopupMenu;
    Cliente2: TMenuItem;
    Ajuda2: TMenuItem;
    EnviesuaDvidapeloEmail2: TMenuItem;
    SobreoTriton1: TMenuItem;
    btParametro: TToolButton;
    EvHintBalloon1: TEvHintBalloon;
    EvAppProtect1: TEvAppProtect;
    ImageList1: TImageList;
    N1: TMenuItem;
    EvFocusColor1: TEvFocusColor;
    Panel1: TPanel;
    lbTitulo: TLMDLabelFill;
    lbEmpresa: TRxLabel;
    lbEndereco: TRxLabel;
    lbFone: TRxLabel;
    StatusBar1: TStatusBar;
    N2: TMenuItem;
    N3: TMenuItem;
    Vendas1: TMenuItem;
    Planilha1: TMenuItem;
    btVenda: TToolButton;
    btPlano: TToolButton;
    GerarComisso1: TMenuItem;
    Relatrios1: TMenuItem;
    Vendas2: TMenuItem;
    Vendas3: TMenuItem;
    ToolButton7: TToolButton;
    Vendas4: TMenuItem;
    XPMenu1: TXPMenu;
    Clientes2: TMenuItem;
    Clientes3: TMenuItem;
    otalDirio1: TMenuItem;
    Senhas1: TMenuItem;
    EvPassword1: TEvPassword;
    Table1: TTable;
    Table1Usuario: TStringField;
    Table1Senha: TStringField;
    Exportar1: TMenuItem;
    EfetuarLogOff1: TMenuItem;
    MotivoCancelamento1: TMenuItem;
    Clientes4: TMenuItem;
    Cancelamento1: TMenuItem;
    Table1Acesso: TStringField;
    Ajuda3: TMenuItem;
    btAjuda: TToolButton;
    EvCripto: TEvCriptografa;
    Image1: TImage;
    RxGradientCaption1: TRxGradientCaption;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Sair1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Sair2Click(Sender: TObject);
    procedure CadastrodaEmpresa1Click(Sender: TObject);
    procedure SobreoOlimpoLigth1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure StatusTeclas(vAcao:boolean;vTeclas:string);
    procedure Clientes1Click(Sender: TObject);
    procedure Bancos1Click(Sender: TObject);
    procedure Gerais1Click(Sender: TObject);
    procedure EnviesuaDvidapeloEmail1Click(Sender: TObject);
    procedure SobreoTritonLigth1Click(Sender: TObject);
    procedure btParametroClick(Sender: TObject);
    procedure btVendClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Planilha1Click(Sender: TObject);
    procedure btPlanoClick(Sender: TObject);
    procedure btVendaClick(Sender: TObject);
    procedure GerarComisso1Click(Sender: TObject);
    procedure Vendas3Click(Sender: TObject);
    procedure Vendas2Click(Sender: TObject);
    procedure Cliente2Click(Sender: TObject);
    procedure Vendas4Click(Sender: TObject);
    procedure Clientes2Click(Sender: TObject);
    procedure Clientes3Click(Sender: TObject);
    procedure otalDirio1Click(Sender: TObject);
    procedure Senhas1Click(Sender: TObject);
    procedure EvPassword1AfterInput(Sender: TObject);
    procedure EvPassword1BeforeInput(Sender: TObject);
    procedure EvPassword1Validate(Sender: TObject; UserName,
      Password: String; var Valid: Boolean);
    procedure EvPassword1Error(Sender: TObject; Error: TEvPasswordError);
    procedure EfetuarLogOff1Click(Sender: TObject);
    procedure Exportar1Click(Sender: TObject);
    procedure MotivoCancelamento1Click(Sender: TObject);
    procedure Clientes4Click(Sender: TObject);
    procedure Cancelamento1Click(Sender: TObject);
    procedure Ajuda3Click(Sender: TObject);
    procedure btAjudaClick(Sender: TObject);
  private
    { Private declarations }
    facesso : string;
  public
    { Public declarations }
    property acesso : string READ facesso Write facesso;
  end;

var
  FrmPrincipal : TFrmPrincipal;
  ListaTeclas : String;
  PilhaTeclas : array[1..10] of string;
  Topo : integer;
  Acao:boolean;


implementation

uses
   UnitSobre, unitDmDados, unitParametro, UnitVendedor, UnitMotCancel,
  unitCadPlano, unitGeraComis, unitRelVendas, UnitRelFunc,
  UnitCadClientes, UnitRelCliente, unitTotais, UnitCadSenha,
  unitRelVendaTxT, unitRelMotCancel, UnitContVenda, UnitCadCliente;


{$R *.DFM}

procedure TfrmPrincipal.StatusTeclas(vAcao:boolean;vTeclas:string);
begin
  if vAcao then
    begin
    Topo:=Topo + 1;
    if Topo > 0 Then
      PilhaTeclas[Topo]:=StatusBar1.Panels[0].Text;
    StatusBar1.Panels[0].Text:=vTeclas;
    end
  else
    begin
    StatusBar1.Panels[0].Text:=PilhaTeclas[Topo];
    Topo:=Topo-1;
    end;
end;

procedure TFrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= Cafree;
end;

procedure TFrmPrincipal.Sair1Click(Sender: TObject);
begin
	Close;
end;

procedure TFrmPrincipal.Button2Click(Sender: TObject);
begin
  frmParametro:=tfrmParametro.create(application);
  frmParametro.showmodal;
end;

procedure TFrmPrincipal.Sair2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPrincipal.CadastrodaEmpresa1Click(Sender: TObject);
begin
  FrmParametro:=tfrmParametro.create(application);
  FrmParametro.showmodal;
end;

procedure TFrmPrincipal.SobreoOlimpoLigth1Click(Sender: TObject);
begin
  FrmSobre:=TFrmSobre.create(application);
  FrmSobre.Showmodal;
end;

procedure TFrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmDados.HabilitaTeclado then
    case (key) of
      // Teclas de navega��o
      VK_F2   : btVend.Click;
      VK_F3   : btPlano.Click;
      VK_F4   : btVenda.Click;
      VK_F5   : btRelatorio.CheckMenuDropdown;
      VK_F6   : btParametro.Click;
      VK_ESCAPE : close;
    end;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  Topo:= -1;
  ListaTeclas:='[F1] Ajuda  [F2] Vendedor  [F3] Planos  [F4] Vendas  [F5] Relat�rio [F6] Par�metros  [ESC] Sai';
  StatusTeclas(True,ListaTeclas);
  if table1.RecordCount=1 then  //obriga o cadastro de senha no 1� uso
      begin
        frmCadSenha:=tfrmCadSenha.create(application);
        frmCadSenha.EvUserAccess1.Active:=false;
        frmCadSenha.showModal;
      end;
  evPassword1.Execute;
end;

procedure TFrmPrincipal.Clientes1Click(Sender: TObject);
begin
  frmVendedor:=tfrmVendedor.create(application);
  frmVendedor.showmodal;
end;

procedure TFrmPrincipal.Bancos1Click(Sender: TObject);
begin
  frmMotCancel:=tfrmMotCancel.create(application);
  frmMotCancel.showmodal;
end;

procedure TFrmPrincipal.Gerais1Click(Sender: TObject);
begin
  frmParametro:=tfrmParametro.create(application);
  frmParametro.showmodal;
end;

procedure TFrmPrincipal.EnviesuaDvidapeloEmail1Click(Sender: TObject);
var
 url : string;
begin
url :='mailto:gensysinfo_softwares@uol.com.br';
shellexecute(0, 'open',Pchar(url), nil, nil, sw_showNormal);

end;

procedure TFrmPrincipal.SobreoTritonLigth1Click(Sender: TObject);
begin
  frmSobre:=tfrmSobre.create(application);
  frmSobre.showmodal;
end;

procedure TFrmPrincipal.btParametroClick(Sender: TObject);
begin
  frmParametro:=tfrmParametro.create(application);
  frmParametro.showmodal;
end;

procedure TFrmPrincipal.btVendClick(Sender: TObject);
begin
frmVendedor:=tfrmVendedor.create(application);
frmVendedor.showmodal;
end;

procedure TFrmPrincipal.N1Click(Sender: TObject);
begin
frmCadPlano:=tfrmCadPlano.create(application);
frmCadPlano.showmodal;
end;

procedure TFrmPrincipal.Planilha1Click(Sender: TObject);
begin
frmContVenda:=tfrmContVenda.create(application);
frmContVenda.showmodal;
end;

procedure TFrmPrincipal.btPlanoClick(Sender: TObject);
begin
frmcadPlano:=tfrmcadPlano.Create(application);
frmcadPlano.ShowModal;
end;

procedure TFrmPrincipal.btVendaClick(Sender: TObject);
begin
frmContVenda:=tfrmContVenda.Create(application);
frmContVenda.ShowModal;
end;

procedure TFrmPrincipal.GerarComisso1Click(Sender: TObject);
begin
frmGeraComis:=tfrmGeraComis.Create(application);
frmGeraComis.ShowModal;
end;

procedure TFrmPrincipal.Vendas3Click(Sender: TObject);
begin
frmRelVenda:=tfrmRelVenda.create(application);
frmRelVenda.showmodal;
end;

procedure TFrmPrincipal.Vendas2Click(Sender: TObject);
begin
frmRelFunc:=tfrmRelFunc.create(application);
frmRelFunc.showmodal;
end;

procedure TFrmPrincipal.Cliente2Click(Sender: TObject);
begin
frmRelFunc:=tfrmRelFunc.create(application);
frmRelFunc.showmodal;
end;

procedure TFrmPrincipal.Vendas4Click(Sender: TObject);
begin
frmRelVenda:=tfrmRelVenda.create(application);
frmRelVenda.showmodal;
end;

procedure TFrmPrincipal.Clientes2Click(Sender: TObject);
begin
frmCadClientes:=tfrmCadClientes.create(application);
frmCadClientes.showmodal;
end;

procedure TFrmPrincipal.Clientes3Click(Sender: TObject);
begin
frmrelCliente:=tfrmrelCliente.create(application);
frmrelCliente.showmodal;
end;

procedure TFrmPrincipal.otalDirio1Click(Sender: TObject);
begin
frmTotal:=tfrmTotal.create(application);
frmTotal.showmodal;
end;

procedure TFrmPrincipal.Senhas1Click(Sender: TObject);
begin
frmCadSenha:=tfrmCadSenha.create(application);
frmCadSenha.showmodal;
end;

procedure TFrmPrincipal.EvPassword1AfterInput(Sender: TObject);
begin
table1.close;
end;

procedure TFrmPrincipal.EvPassword1BeforeInput(Sender: TObject);
begin
table1.Open;
end;

procedure TFrmPrincipal.EvPassword1Validate(Sender: TObject; UserName,
  Password: String; var Valid: Boolean);
begin
if Table1.FindKey([username]) then
   begin
   Valid := EvCripto.CriptoBinToText(Table1senha.AsString) = Password;
   acesso:=table1Acesso.Value;
   end
else
   ShowMessage('O nome de usu�rio e senha informado n�o s�o v�lidos.');

end;

procedure TFrmPrincipal.EvPassword1Error(Sender: TObject;
  Error: TEvPasswordError);
begin
ShowMessage('Usu�rio n�o pode ser aplicado'+#13+'Aplica��o ser� encerrada).');
application.Terminate;
end;

procedure TFrmPrincipal.EfetuarLogOff1Click(Sender: TObject);
begin
  evPassword1.Execute;
end;

procedure TFrmPrincipal.Exportar1Click(Sender: TObject);
begin
frmRelVendaTxT:=tfrmRelVendaTxT.create(application);
frmRelVendaTxT.showmodal;
end;

procedure TFrmPrincipal.MotivoCancelamento1Click(Sender: TObject);
begin
frmRelCodMotCancel:=tfrmRelCodMotCancel.create(application);
frmRelCodMotCancel.showmodal;
end;

procedure TFrmPrincipal.Clientes4Click(Sender: TObject);
begin
frmrelCliente:=tfrmrelCliente.create(application);
frmrelCliente.showmodal;
end;

procedure TFrmPrincipal.Cancelamento1Click(Sender: TObject);
begin
frmRelCodMotCancel:=tfrmRelCodMotCancel.create(application);
frmRelCodMotCancel.showmodal;
end;

procedure TFrmPrincipal.Ajuda3Click(Sender: TObject);
begin
  WinHelp(FrmPrincipal.Handle,'C:\Gensys\Univendas\UniHelp.hlp',HELP_CONTENTS,0);
end;

procedure TFrmPrincipal.btAjudaClick(Sender: TObject);
begin
  WinHelp(FrmPrincipal.Handle,'C:\Gensys\Univendas\UniHelp.hlp',HELP_CONTENTS,0);
end;

end.

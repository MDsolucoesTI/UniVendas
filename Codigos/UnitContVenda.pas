//////////////////////////////////////////////////////////////////////////
// Criacao...........: 07/2002
// Sistema...........: Controle de Vendas - Unimed
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitContVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, CurrEdit, RXDBCtrl, RxLookup, Mask, ToolEdit,
  fcButton, fcImgBtn, RxGrdCpt, EUserAcs, RXCtrls, ExtCtrls, DB, DBTables;

type
  TFrmContVenda = class(TForm)
    Panel3: TPanel;
    Image3: TImage;
    RxLabel4: TRxLabel;
    Image1: TImage;
    EvUserAccess1: TEvUserAccess;
    RxGradientCaption1: TRxGradientCaption;
    Panel2: TPanel;
    Image2: TImage;
    btnPrimeiro: TfcImageBtn;
    btnAnterior: TfcImageBtn;
    btnUltimo: TfcImageBtn;
    btnGravar: TfcImageBtn;
    btnCancelar: TfcImageBtn;
    btnDeletar: TfcImageBtn;
    btnSair: TfcImageBtn;
    btnProximo: TfcImageBtn;
    btnNovo: TfcImageBtn;
    btnAlterar: TfcImageBtn;
    Panel1: TPanel;
    Image4: TImage;
    RxLabel13: TRxLabel;
    dbDataVen: TDBDateEdit;
    RxLabel1: TRxLabel;
    dbNumero: TDBEdit;
    RxLabel2: TRxLabel;
    dbTitular: TDBEdit;
    RxLabel6: TRxLabel;
    lookPlano: TRxDBLookupCombo;
    RxLabel3: TRxLabel;
    dbVidas: TDBEdit;
    RxLabel19: TRxLabel;
    dbValor: TRxDBCalcEdit;
    RxLabel5: TRxLabel;
    dbComis: TRxDBCalcEdit;
    lookVend: TRxDBLookupCombo;
    RxLabel7: TRxLabel;
    RxLabel8: TRxLabel;
    dbStatus: TDBEdit;
    dbDataSts: TDBDateEdit;
    RxLabel9: TRxLabel;
    RxLabel10: TRxLabel;
    dbObs: TDBMemo;
    dbDataPagto: TDBDateEdit;
    RxLabel20: TRxLabel;
    RxLabel35: TRxLabel;
    btnLocalizar: TfcImageBtn;
    dbCancelar: TDBEdit;
    btnCancelVenda: TfcImageBtn;
    btnAberto: TfcImageBtn;
    btnPagar: TfcImageBtn;
    procedure btnCancelVendaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure dbDataVenExit(Sender: TObject);
    procedure dbNumeroExit(Sender: TObject);
    procedure lookVendExit(Sender: TObject);
    procedure dbDataStsEnter(Sender: TObject);
    procedure dbTitularExit(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnAbertoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPagarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmContVenda: TFrmContVenda;
  NovoItem, Incluir: Boolean;

implementation

uses UnitCancelar, UnitPrincipal, UnitDmdados, unitLocVenda, unitAberto,
  unitPagar;

{$R *.dfm}

procedure TFrmContVenda.btnCancelVendaClick(Sender: TObject);
begin
  if dmdados.tbVendaStatus.Value='Cancelado' then
    ShowMessage('Venda j� est� CANCELADA')
  else
    if (dmdados.tbVendaStatus.Value='Pago') or (dmdados.tbVendaStatus.Value='Aberto') then
      begin
      If application.MessageBox('Venda Paga ou Aberta, voc� quer mesmo CANCELAR?','ATEN��O', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
        begin
        dmdados.tbVenda.Edit;
        FrmCancelar:=TFrmCancelar.create(application);
        FrmCancelar.showmodal;
        end;
      end
    else
      begin
      dmdados.tbVenda.Edit;
      FrmCancelar:=TFrmCancelar.create(application);
      FrmCancelar.showmodal;
      end;
end;

procedure TFrmContVenda.FormActivate(Sender: TObject);
begin
if frmPrincipal.acesso='PARCIAL' then
    EvUserAccess1.UserID := 0
  else if frmPrincipal.acesso='TOTAL' then
    EvUserAccess1.UserID := 1;
end;

procedure TFrmContVenda.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
  Begin
  Key:=#0;
  Perform(wm_nextdlgctl,0,0);
  End;
end;

procedure TFrmContVenda.FormShow(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,'[F6] pagar [F7] Em Aberto [F8] Cancelar Venda [F9] Localizar [Esc] Cancelar ou Sair');
  dmDados.vTabStt:=True;
  novoitem:=false;
  incluir:=false;
  dmdados.tbVenda.IndexName:='iDataVenda';
end;

procedure TFrmContVenda.dbDataVenExit(Sender: TObject);
begin
if NovoItem then
 begin
  if dbDataVen.Text='' then
     begin
     ShowMessage('Obrigat�rio informar a Data');
     dbDataVen.SetFocus;
     end;
 end;
end;

procedure TFrmContVenda.dbNumeroExit(Sender: TObject);
begin
if NovoItem then
 begin
  if dbNumero.Text='' then
     begin
     ShowMessage('Obrigat�rio informar o N�mero');
     dbNumero.SetFocus;
     end;
 end;
end;

procedure TFrmContVenda.lookVendExit(Sender: TObject);
begin
if NovoItem then
 begin
  if lookVend.Text='' then
     begin
     ShowMessage('Obrigat�rio informar o Vendedor');
     lookvend.SetFocus;
     end
  else
     dmdados.tbVendaComissao.Value:=dmdados.TbVendedorComissao.Value;
 end;
end;

procedure TFrmContVenda.dbDataStsEnter(Sender: TObject);
begin
  if Incluir Then
    dbDataSts.Text:=dbDataVen.Text;
end;

procedure TFrmContVenda.dbTitularExit(Sender: TObject);
var
 tabela : ttable;
begin
  if NovoItem then
    begin
    Tabela := TTable.Create(Application);
    Tabela.DatabaseName := dmDados.tbVenda.DatabaseName;
    Tabela.TableName := dmDados.tbVenda.TableName;
    Tabela.IndexName := dmdados.tbVenda.IndexName;
    Tabela.Open;
    If Tabela.Locate('Titular',dbTitular.Text,[]) Then
      If not((DmDados.tbVenda.State=dsEdit) And (dmDados.tbVenda.RecNo = Tabela.RecNo)) Then
        Begin
        Showmessage('TITULAR j� Cadastrado');
        dbTitular.Clear;
        dbTitular.setfocus;
        End;
    Tabela.Free;
    end;
end;

procedure TFrmContVenda.btnNovoClick(Sender: TObject);
begin
  dmdados.tbVenda.Append;
  Incluir:=True;
  novoItem:=true;
  dmdados.vTabStt:=false;
  {habilitando os bot�es}
  BtnGravar.Enabled := true;
  BtnCancelar.Enabled:=true;
  BtnNovo.Enabled:=False;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  BtnAlterar.Enabled:=False;
  BtnDeletar.Enabled:=False;
  BtnLocalizar.Enabled:=False;
  btnCancelVenda.Enabled:=False;
  btnAberto.Enabled:=False;
  {habilitando componentes}
  dbDataVen.Enabled:=true;
  dbNumero.Enabled:=true;
  dbTitular.Enabled:=true;
  dbVidas.Enabled:=true;
  dbValor.Enabled:=true;
  lookPlano.Enabled:=true;
  lookVend.Enabled:=true;
  dbComis.Enabled:=true;
  dbObs.Enabled:=true;
  dbDataSts.Enabled:=True;
  dbDataVen.SetFocus;
end;

procedure TFrmContVenda.btnGravarClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar:Boolean;
  tabela : ttable;
begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbVenda.DatabaseName;
  Tabela.TableName := dmDados.tbVenda.TableName;
  Tabela.IndexName := dmdados.tbVenda.IndexName;
  Tabela.Open;
  If dbnumero.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'N�mero';
    Gravar:=False;
    Vazio:=True;
    end;
  If dbTitular.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'Titular';
    Gravar:=False;
    Vazio:=True;
    end
  else
    If Tabela.Locate('Titular',dbTitular.Text,[]) Then
      If not((DmDados.tbVenda.State=dsEdit) And (dmDados.tbVenda.RecNo = Tabela.RecNo)) Then
        Begin
        Showmessage('TITULAR j� Cadastrado');
        Gravar:=False;
        End;
  If lookVend.Text='' Then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'Vendedor';
    Gravar:=False;
    Vazio:=True;
    End;
  If dbDataVen.Text= '  /  /    ' then
    Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Data';
    Gravar:=False;
    Vazio:=True;
    End;
  If Gravar Then
    Begin
    NovoItem:=false;
    Incluir:=False;
    dmDados.vTabStt:=True;
    dmdados.tbVendaAvista.Value:=(dmdados.tbVendaValor.Value/2);
    dmdados.tbVendaAreceber.Value:=(dmdados.tbVendaValor.Value*0.3);
    if Incluir then
      begin
      dmdados.tbVendaStatus.Value:='Lan�ado';
      dmdados.tbVendaNumVerif.Value:=1;
      end;
    dmdados.tbVenda.Post;
    dbDataVen.Enabled:=false;
    dbNumero.Enabled:=false;
    dbTitular.Enabled:=false;
    dbVidas.Enabled:=false;
    dbValor.Enabled:=false;
    lookPlano.Enabled:=false;
    lookVend.Enabled:=false;
    dbComis.Enabled:=false;
    dbObs.Enabled:=false;
    dbDataSts.Enabled:=False;
    {habilitando de desabilitando bot�es}
    BtnGravar.Enabled := False;
    BtnCancelar.Enabled:=False;
    BtnNovo.Enabled:=True;
    BtnPrimeiro.Enabled:=True;
    BtnAnterior.Enabled:=True;
    BtnProximo.Enabled:=True;
    BtnUltimo.Enabled:=True;
    BtnAlterar.Enabled:=True;
    BtnDeletar.Enabled:=True;
    BtnLocalizar.Enabled:=True;
    btnCancelVenda.Enabled:=True;
    btnAberto.Enabled:=True;
    ShowMessage('Venda gravada com sucesso');
    end
  else
    begin
    If Vazio Then
      ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
    dbDataVen.SetFocus;
    end;
  Tabela.Free;
end;

procedure TFrmContVenda.btnCancelarClick(Sender: TObject);
begin
  NovoItem:=false;
  dmdados.vTabStt:=true;
  dmdados.tbVenda.cancel;
  dbDataVen.Enabled:=false;
  dbNumero.Enabled:=false;
  dbTitular.Enabled:=false;
  dbVidas.Enabled:=false;
  dbValor.Enabled:=false;
  lookPlano.Enabled:=false;
  lookVend.Enabled:=false;
  dbComis.Enabled:=false;
  dbObs.Enabled:=false;
  dbDataSts.Enabled:=False;
  {habilitando de desabilitando bot�es}
  BtnGravar.Enabled := False;
  BtnCancelar.Enabled:=False;
  BtnNovo.Enabled:=True;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  BtnAlterar.Enabled:=True;
  BtnDeletar.Enabled:=True;
  BtnLocalizar.Enabled:=True;
  btnCancelVenda.Enabled:=True;
  btnAberto.Enabled:=True;
end;

procedure TFrmContVenda.btnLocalizarClick(Sender: TObject);
begin
  frmLocVenda:=tfrmLocVenda.create(application);
  frmLocVenda.showModal;
  frmLocVenda.Free;     
end;

procedure TFrmContVenda.btnAbertoClick(Sender: TObject);
begin
  if (dmdados.tbVendaStatus.Value='Pago') or (dmdados.tbVendaStatus.Value='Cancelado') then
    begin
    If application.MessageBox('Venda Paga ou Cancelado, voc� quer mesmo MANTER ABERTA?','ATEN��O', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
      begin
      dmdados.tbVenda.Edit;
      frmAberto:=tfrmAberto.Create(Application);
      frmAberto.ShowModal;
      end;
    end
  else
    begin
    dmdados.tbVenda.Edit;
    frmAberto:=tfrmAberto.Create(Application);
    frmAberto.ShowModal;
    end;
end;

procedure TFrmContVenda.btnAlterarClick(Sender: TObject);
begin
  dmdados.tbVenda.Edit;
  NovoItem:=true;
  dmdados.vTabStt:=false;
  {habilitando os bot�es}
  BtnGravar.Enabled := True;
  BtnCancelar.Enabled:=True;
  BtnNovo.Enabled:=False;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  BtnAlterar.Enabled:=False;
  BtnDeletar.Enabled:=False;
  BtnLocalizar.Enabled:=False;
  btnCancelVenda.Enabled:=False;
  btnAberto.Enabled:=False;
  {habilitando componentes}
  dbDataVen.Enabled:=true;
  dbNumero.Enabled:=true;
  dbTitular.Enabled:=true;
  dbVidas.Enabled:=true;
  dbValor.Enabled:=true;
  lookPlano.Enabled:=true;
  lookVend.Enabled:=true;
  dbComis.Enabled:=true;
  dbObs.Enabled:=true;
  dbDataSts.Enabled:=True;
  dbDataVen.SetFocus;
end;

procedure TFrmContVenda.btnDeletarClick(Sender: TObject);
begin
  if dmdados.tbVenda.RecordCount=0 then
    ShowMessage('Tabela vazia')
  else
    If application.MessageBox('Tem certeza que deseja excluir esse registro?','ATEN��O', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
      dmdados.tbVenda.Delete;
end;

procedure TFrmContVenda.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmContVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  Action:=caFree;
end;

procedure TFrmContVenda.btnAnteriorClick(Sender: TObject);
begin
  dmdados.tbVenda.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If dmdados.tbVenda.bof Then
  Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
  End;
  dmDados.vTabStt:=True; 
end;

procedure TFrmContVenda.btnPrimeiroClick(Sender: TObject);
begin
  dmdados.tbVenda.First;
  Btnprimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  dmDados.vTabStt:=True;
end;

procedure TFrmContVenda.btnUltimoClick(Sender: TObject);
begin
  dmdados.tbVenda.last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  dmDados.vTabStt:=True;
end;

procedure TFrmContVenda.btnProximoClick(Sender: TObject);
begin
  dmdados.tbVenda.next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  If dmdados.tbVenda.Eof Then
  Begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
  End;
  dmDados.vTabStt:=True;
end;

procedure TFrmContVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_Insert : if (dmDados.vTabStt) then BtnNovo.Click;
      VK_Home   : if (dmDados.vTabStt) then BtnAlterar.Click;
      VK_Delete : if (dmDados.vTabStt) then BtnDeletar.Click;
      VK_End    : if not(dmDados.vTabStt) then BtnGravar.Click;
      VK_ESCAPE : if not(dmDados.vTabStt) then BtnCancelar.Click
                  else BtnSair.Click;
      VK_F9     : btnLocalizar.Click;
      VK_F8     : btnCancelVenda.Click;
      VK_F7     : btnAberto.Click;
      VK_F6     : btnPagar.Click;
      //Vk_F2     : btnProximo.Click;
      //vk_F1     : btnAnterior.Click;
      //VK_NEXT : dmdados.tbVenda.Next;
      //VK_PRIOR : dmdados.tbVenda.Prior;
    end;
end;

procedure TFrmContVenda.btnPagarClick(Sender: TObject);
begin
  if dmdados.tbVendaStatus.Value='Pago' then
    ShowMessage('Venda j� est� PAGA')
  else
    if (dmdados.tbVendaStatus.Value='Cancelado') then
      begin
      If application.MessageBox('Venda Cancelada, voc� quer mesmo PAGAR?','ATEN��O', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
        begin
        dmdados.tbVenda.Edit;
        FrmPagar:=TFrmPagar.create(application);
        FrmPagar.showmodal;
        end;
      end
    else
      begin
      dmdados.tbVenda.Edit;
      FrmPagar:=TFrmPagar.create(application);
      FrmPagar.showmodal;
      end;
end;

end.

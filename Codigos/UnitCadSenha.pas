//////////////////////////////////////////////////////////////////////////
// Criacao...........: 07/2002
// Sistema...........: Controle de Vendas - Unimed
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitCadSenha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RXCtrls, ExtCtrls, StdCtrls, Mask, DBCtrls, ToolEdit, RXDBCtrl, RXSplit,
  TFlatCheckBoxUnit, SpeedBar, jpeg, RxDBComb, RxLookup, fcLabel, ComCtrls,
  Grids, DBGrids, EUserAcs, ECripto, RxGrdCpt, fcButton, fcImgBtn;

type
  TfrmCadSenha = class(TForm)
    Panel2: TPanel;
    dbsenha: TDBEdit;
    dbUsuario: TDBEdit;
    gridSenha: TDBGrid;
    EvUserAccess1: TEvUserAccess;
    dbAcesso: TDBComboBox;
    EvCripto: TEvCriptografa;
    Panel1: TPanel;
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
    Panel3: TPanel;
    Image3: TImage;
    RxLabel4: TRxLabel;
    Image1: TImage;
    RxGradientCaption1: TRxGradientCaption;
    Image4: TImage;
    RxLabel3: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel1: TRxLabel;
    procedure btprimeiroClick(Sender: TObject);
    procedure btanteriorClick(Sender: TObject);
    procedure btproximoClick(Sender: TObject);
    procedure btultimoClick(Sender: TObject);
    procedure btnovoClick(Sender: TObject);
    procedure btgravarClick(Sender: TObject);
    procedure btcancelarClick(Sender: TObject);
    procedure btalterarClick(Sender: TObject);
    procedure btexcluirClick(Sender: TObject);
    procedure btsairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbsenhaExit(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadSenha: TfrmCadSenha;

implementation

uses UnitDmdados, UnitPrincipal;


{$R *.DFM}

procedure TfrmCadSenha.btprimeiroClick(Sender: TObject);
begin
dmdados.tbSenha.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;

end;

procedure TfrmCadSenha.btanteriorClick(Sender: TObject);
begin
dmdados.tbSenha.Prior;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
If dmdados.tbSenha.Bof Then
 Begin
  btnPrimeiro.Enabled:=False;
  btnAnterior.Enabled:=False;
  End;
end;

procedure TfrmCadSenha.btproximoClick(Sender: TObject);
begin
dmdados.tbSenha.Next;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
If dmdados.tbSenha.Eof Then
 Begin
 btnProximo.Enabled:=False;
 btnUltimo.Enabled:=False;
 end;

end;

procedure TfrmCadSenha.btultimoClick(Sender: TObject);
begin
dmdados.tbSenha.Last;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
btnProximo.Enabled:=False;
btnUltimo.Enabled:=False;
end;

procedure TfrmCadSenha.btnovoClick(Sender: TObject);
begin
dmdados.tbSenha.Append;
dmDados.vTabStt:=False;
BtnGravar.Enabled := true;
BtnCancelar.Enabled:=true;
BtnNovo.Enabled:=False;
BtnPrimeiro.Enabled:=False;
BtnAnterior.Enabled:=False;
BtnProximo.Enabled:=False;
BtnUltimo.Enabled:=False;
BtnAlterar.Enabled:=False;
BtnDeletar.Enabled:=False;
dbUsuario.Enabled:=true;
dbSenha.Enabled:=true;
dbacesso.Enabled:=true;
dbUsuario.SetFocus;
end;

procedure TfrmCadSenha.btgravarClick(Sender: TObject);
var campos:string;
begin
If (dbUsuario.Text = 'Gensys') then
  begin
    ShowMessage('Palavra Reservada!  Por favor utilize outra.');
    dbUsuario.SetFocus;
  end;
if (dbUsuario.Text='') then campos:='USUARIO';
if (dbSenha.Text='') then campos:=campos+'  SENHA';
if (dbAcesso.Text='') then campos:=campos+'  RESTRITO';
If Length(campos)=0 then
begin
  dmdados.tbSenha.Post;
  dmDados.vTabStt:=True;
  BtnGravar.enabled := False;
  BtnCancelar.Enabled := False;
  BtnNovo.Enabled:=True;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  BtnAlterar.Enabled:=True;
  BtnDeletar.Enabled:=True;
  dbUsuario.Enabled:=false;
  dbSenha.Enabled:=false;
  dbacesso.Enabled:=false;
  showmessage('Dados gravados com sucesso!');
  Panel2.SetFocus;
end else
      Showmessage('O(s) campo(s)  '+campos+'  n�o foram preenchidos');
end;

procedure TfrmCadSenha.btcancelarClick(Sender: TObject);
begin
dmdados.tbSenha.cancel;
dmDados.vTabStt:=True;
BtnGravar.enabled := false;
BtnCancelar.Enabled := false;
BtnNovo.Enabled:=True;
BtnPrimeiro.Enabled:=True;
BtnAnterior.Enabled:=True;
Btnproximo.Enabled:=True;
BtnUltimo.Enabled:=True;
BtnAlterar.Enabled:=True;
BtnDeletar.Enabled:=True;
dbUsuario.Enabled:=false;
dbSenha.Enabled:=false;
dbacesso.Enabled:=false;
Panel2.SetFocus
end;

procedure TfrmCadSenha.btalterarClick(Sender: TObject);
begin
if dmdados.tbSenhaUsuario.Value='Gensys' then
   ShowMessage('Senha de seguran�a.'+#13+'N�o pode ser alterada.')
else
  begin
  dmdados.tbSenha.Edit;
  dmDados.vTabStt:=False;
  BtnCancelar.enabled:= true;
  BtnGravar.Enabled:= true;
  BtnNovo.Enabled:=False;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  BtnAlterar.Enabled:=False;
  BtnDeletar.Enabled:=False;
  dbUsuario.Enabled:=true;
  dbSenha.Enabled:=true;
  dbacesso.Enabled:=true;
  dbUsuario.SetFocus;
  end;
end;

procedure TfrmCadSenha.btexcluirClick(Sender: TObject);
begin
if dmdados.tbSenhaUsuario.Value='Gensys' then
   ShowMessage('Senha de seguran�a.'+#13+'N�o pode ser exclu�da.')
else
  begin
  If application.MessageBox('Tem certeza que deseja excluir este registro?','Aten��o', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
    begin
    dmdados.tbSenha.Delete;
    end
  else
    dmdados.tbSenha.Cancel;
  end;
end;

procedure TfrmCadSenha.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure TfrmCadSenha.btsairClick(Sender: TObject);
begin
close;
end;



procedure TfrmCadSenha.FormActivate(Sender: TObject);
begin
 if frmPrincipal.acesso='TOTAL' then
    EvUserAccess1.UserID := 1
 else if frmPrincipal.acesso='PARCIAL' then
    EvUserAccess1.UserID := 2;
end;

procedure TfrmCadSenha.FormKeyDown(Sender: TObject; var Key: Word;
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
    end;
end;

procedure TfrmCadSenha.FormShow(Sender: TObject);
begin
dmDados.vTabStt:=True;
dmDados.tbSenha.Filtered:=false;
dmDados.tbSenha.Filter:='(usuario <> '''+'Gensys'+''')';
dmDados.tbSenha.Filtered:=true;
end;

procedure TfrmCadSenha.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TfrmCadSenha.dbsenhaExit(Sender: TObject);
begin
dbsenha.Text:=EvCripto.TextToCriptoBin(dbsenha.Text);
end;

procedure TfrmCadSenha.btnPrimeiroClick(Sender: TObject);
begin
dmdados.tbSenha.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
end;

procedure TfrmCadSenha.btnAnteriorClick(Sender: TObject);
begin
dmdados.tbSenha.Prior;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
If dmdados.tbSenha.Bof Then
 Begin
  btnPrimeiro.Enabled:=False;
  btnAnterior.Enabled:=False;
  End;
end;

procedure TfrmCadSenha.btnProximoClick(Sender: TObject);
begin
dmdados.tbSenha.Next;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
If dmdados.tbSenha.Eof Then
 Begin
 btnProximo.Enabled:=False;
 btnUltimo.Enabled:=False;
 end;
end;

procedure TfrmCadSenha.btnUltimoClick(Sender: TObject);
begin
dmdados.tbSenha.Last;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
btnProximo.Enabled:=False;
btnUltimo.Enabled:=False;
end;

procedure TfrmCadSenha.btnNovoClick(Sender: TObject);
begin
dmdados.tbSenha.Append;
dmDados.vTabStt:=False;
BtnGravar.Enabled := true;
BtnCancelar.Enabled:=true;
BtnNovo.Enabled:=False;
BtnPrimeiro.Enabled:=False;
BtnAnterior.Enabled:=False;
BtnProximo.Enabled:=False;
BtnUltimo.Enabled:=False;
BtnAlterar.Enabled:=False;
BtnDeletar.Enabled:=False;
dbUsuario.Enabled:=true;
dbSenha.Enabled:=true;
dbacesso.Enabled:=true;
dbUsuario.SetFocus;
end;

procedure TfrmCadSenha.btnGravarClick(Sender: TObject);
var campos:string;
begin
If (dbUsuario.Text = 'Gensys') then
  begin
    ShowMessage('Palavra Reservada!  Por favor utilize outra.');
    dbUsuario.SetFocus;
  end;
if (dbUsuario.Text='') then campos:='USUARIO';
if (dbSenha.Text='') then campos:=campos+'  SENHA';
if (dbAcesso.Text='') then campos:=campos+'  RESTRITO';
If Length(campos)=0 then
begin
  dmdados.tbSenha.Post;
  dmDados.vTabStt:=True;
  BtnGravar.enabled := False;
  BtnCancelar.Enabled := False;
  BtnNovo.Enabled:=True;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  BtnAlterar.Enabled:=True;
  BtnDeletar.Enabled:=True;
  dbUsuario.Enabled:=false;
  dbSenha.Enabled:=false;
  dbacesso.Enabled:=false;
  showmessage('Dados gravados com sucesso!');
  Panel2.SetFocus;
end else
      Showmessage('O(s) campo(s)  '+campos+'  n�o foram preenchidos');
end;

procedure TfrmCadSenha.btnCancelarClick(Sender: TObject);
begin
dmdados.tbSenha.cancel;
dmDados.vTabStt:=True;
BtnGravar.enabled := false;
BtnCancelar.Enabled := false;
BtnNovo.Enabled:=True;
BtnPrimeiro.Enabled:=True;
BtnAnterior.Enabled:=True;
Btnproximo.Enabled:=True;
BtnUltimo.Enabled:=True;
BtnAlterar.Enabled:=True;
BtnDeletar.Enabled:=True;
dbUsuario.Enabled:=false;
dbSenha.Enabled:=false;
dbacesso.Enabled:=false;
Panel2.SetFocus
end;

procedure TfrmCadSenha.btnAlterarClick(Sender: TObject);
begin
if dmdados.tbSenhaUsuario.Value='Gensys' then
   ShowMessage('Senha de seguran�a.'+#13+'N�o pode ser alterada.')
else
  begin
  dmdados.tbSenha.Edit;
  dmDados.vTabStt:=False;
  BtnCancelar.enabled:= true;
  BtnGravar.Enabled:= true;
  BtnNovo.Enabled:=False;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  BtnAlterar.Enabled:=False;
  BtnDeletar.Enabled:=False;
  dbUsuario.Enabled:=true;
  dbSenha.Enabled:=true;
  dbacesso.Enabled:=true;
  dbUsuario.SetFocus;
  end;
end;

procedure TfrmCadSenha.btnDeletarClick(Sender: TObject);
begin
if dmdados.tbSenhaUsuario.Value='Gensys' then
   ShowMessage('Senha de seguran�a.'+#13+'N�o pode ser exclu�da.')
else
  begin
  If application.MessageBox('Tem certeza que deseja excluir este registro?','Aten��o', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
    begin
    dmdados.tbSenha.Delete;
    end
  else
    dmdados.tbSenha.Cancel;
  end;
end;

procedure TfrmCadSenha.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.

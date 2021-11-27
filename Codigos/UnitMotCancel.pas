//////////////////////////////////////////////////////////////////////////
// Criacao...........: 07/2002
// Sistema...........: Controle de Vendas - Unimed
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitMotCancel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fcButton, fcImgBtn, RXSplit, Grids, DBGrids, StdCtrls, Mask, DBCtrls,
  RXCtrls, ExtCtrls, SpeedBar, jpeg, RackCtls, DBTables, DB,
  LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint, LMDShapeHint,
  RxGrdCpt;

type
  TFrmMotCancel = class(TForm)
    Panel1: TPanel;
    RxLabel1: TRxLabel;
    dbCod: TDBEdit;
    RxLabel2: TRxLabel;
    dbMotivo: TDBEdit;
    gridCancel: TDBGrid;
    Panel3: TPanel;
    Image3: TImage;
    RxLabel4: TRxLabel;
    Image1: TImage;
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
    Image4: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbMotivoExit(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbCodExit(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure fcImageBtn1Click(Sender: TObject);
    procedure fcImageBtn2Click(Sender: TObject);
    procedure fcImageBtn8Click(Sender: TObject);
    procedure fcImageBtn3Click(Sender: TObject);
    procedure fcImageBtn9Click(Sender: TObject);
    procedure fcImageBtn4Click(Sender: TObject);
    procedure fcImageBtn5Click(Sender: TObject);
    procedure fcImageBtn10Click(Sender: TObject);
    procedure fcImageBtn6Click(Sender: TObject);
    procedure fcImageBtn7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMotCancel: TFrmMotCancel;
  NovoItem, Mudar: Boolean;

implementation

uses UnitDmdados, unitPrincipal;

{$R *.DFM}

procedure TFrmMotCancel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmDados.HabilitaTeclado:=True;
  Action:= Cafree;
end;

procedure TFrmMotCancel.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmMotCancel.dbMotivoExit(Sender: TObject);
Var
Tabela : TTable;
begin
Panel2.SetFocus;
Tabela := TTable.Create(Application);
Tabela.DatabaseName := dmDados.TbMotCancel.DatabaseName;
Tabela.TableName := dmDados.TbMotCancel.TableName;
Tabela.IndexName := dmdados.TbMotCancel.IndexName;
Tabela.Open;
If NovoItem Then
begin
  If dbMotivo.Text = '' Then
     Begin
     ShowMessage('� necess�rio Informar o PLANO');
     dbMotivo.setfocus;
     end
  Else
     Begin
     If Tabela.Locate('Motivo',dbMotivo.Text,[]) Then
        begin
        If not ((DmDados.tbMotCancel.State=dsEdit) And (dmDados.tbMotCancel.RecNo = Tabela.RecNo)) Then
          begin
          Showmessage('Motivo j� cadastrado');
          dbMotivo.Clear;
          dbMotivo.setfocus;
          End
        else
        Panel2.SetFocus;
        end
     else
       Tabela.Free;
    end;
end;
end;

procedure TFrmMotCancel.BtnSairClick(Sender: TObject);
begin
 Close;
end;

procedure TFrmMotCancel.BtnNovoClick(Sender: TObject);
begin
DMDados.tbMotCancel.Append;
NovoItem:=True;
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
{habilitando os componentes}
dbCod.Enabled:=True;
dbMotivo.Enabled:=true;
gridCancel.Enabled:=true;
dbCod.SetFocus;
end;

procedure TFrmMotCancel.BtnCancelarClick(Sender: TObject);
begin
dmdados.tbMotCancel.cancel;
NovoItem:= False;
dmdados.vTabStt:=true;
{Desabilitando os bot�es}
BtnGravar.enabled := false;
BtnCancelar.Enabled := false;
BtnNovo.Enabled:=True;
btnPrimeiro.Enabled:=True;
BtnAnterior.Enabled:=True;
Btnproximo.Enabled:=True;
BtnUltimo.Enabled:=True;
BtnAlterar.Enabled:=True;
BtnDeletar.Enabled:=True;
{Habilitando os componentes}
gridCancel.Enabled:=false;
dbCod.Enabled:=False;
dbMotivo.Enabled:=false;
Panel2.SetFocus;
end;

procedure TFrmMotCancel.BtnAlterarClick(Sender: TObject);
begin
if dmdados.tbMotCancel.recordCount=0 then
   showMessage('tabela vazia')
else
  begin
  if dmdados.tbMotCancelCodMotCancel.Value='1' then
     showMessage('Item n�o pode ser alterado')
  else
   begin
   novoitem:=true;
   dmdados.vTabStt:=false;
   dmdados.tbMotCancel.Edit;
   DbMotivo.Enabled:=True;
   btnGravar.Enabled:=True;
   btnCancelar.Enabled:=True;
   DbMotivo.SetFocus;
   end;
  end;
end;

procedure TFrmMotCancel.BtnDeletarClick(Sender: TObject);
begin
if dmdados.tbMotCancel.RecordCount=0 then
   begin
   ShowMessage('Tabela vazia');
   end
else
   begin
   if dmdados.tbMotCancelCodMotCancel.Value='1' then
      showMessage('Item n�o pode ser exclu�do')
   else
     begin
     NovoItem:=False;
     If application.MessageBox('Tem certeza que deseja excluir esse registro?','ATEN��O', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
        dmdados.tbMotCancel.Delete
     else
        dmdados.tbMotCancel.Cancel;
     end;
   end;
end;

procedure TFrmMotCancel.BtnProximoClick(Sender: TObject);
begin
  dmdados.tbMotCancel.next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  If dmdados.tbMotCancel.Eof Then
  Begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
  End;
  dmdados.vTabStt:=true;
end;

procedure TFrmMotCancel.BtnPrimeiroClick(Sender: TObject);
begin
  dmdados.tbMotCancel.First;
  Btnprimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  dmdados.vTabStt:=true;
end;

procedure TFrmMotCancel.BtnAnteriorClick(Sender: TObject);
begin
  dmdados.tbMotCancel.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If dmdados.tbMotCancel.bof Then
  Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
  End;
  dmdados.vTabStt:=true;
end;

procedure TFrmMotCancel.BtnUltimoClick(Sender: TObject);
begin
  dmdados.tbMotCancel.last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  dmdados.vTabStt:=true;
end;

procedure TFrmMotCancel.FormShow(Sender: TObject);
begin
dmDados.vTabStt:=True;
NovoItem:= false;
FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [F9] Localizar [Delete] Excluir [Esc] Cancelar ou Sair');
if dmdados.tbMotCancel.RecordCount=0 then
 begin
 BtnGravar.Enabled   := false;
 BtnCancelar.Enabled := false;
 BtnPrimeiro.Enabled := False;
 BtnAnterior.Enabled := False;
 BtnProximo.Enabled  := False;
 BtnUltimo.Enabled   := False;
 BtnAlterar.Enabled  := False;
 BtnDeletar.Enabled  := False;
 end;
end;

procedure TFrmMotCancel.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_Insert : if (dmDados.vTabStt) then BtnNovo.Click;
      VK_Home   : if (dmDados.vTabStt) then BtnAlterar.Click;
      VK_Delete : if (dmDados.vTabStt) then BtnDeletar.Click;
      VK_End    : if not(dmDados.vTabStt) then btnGravar.Click;
      VK_ESCAPE : if not(dmDados.vTabStt) then BtnCancelar.Click
                  else BtnSair.Click;
    end;
end;

procedure TFrmMotCancel.dbCodExit(Sender: TObject);
Var
Tabela: TTable;

begin
Tabela := TTable.Create(Application);
Tabela.DatabaseName := dmDados.TbMotcancel.DatabaseName;
Tabela.TableName := dmDados.TbMotcancel.TableName;
Tabela.IndexName := dmdados.tbMotcancel.IndexName;
Tabela.Open;
If NovoItem Then
BEGIN
 If dbCod.Text= '' then
   Begin
   ShowMessage('� obrigat�rio o C�DIGO');
   dbCod.SetFocus;
   End
 else
   begin
   If Tabela.Locate('CodMotCancel',dbCod.Text,[]) Then
     begin
     If not ((DmDados.tbMotcancel.State=dsEdit) And (dmDados.tbMotcancel.RecNo = Tabela.RecNo)) Then
       begin
       Showmessage('C�digo j� cadastrado');
       dbCod.Clear;
       dbCod.setfocus;
       end;
     end
   else
      tabela.Free;
   end;
end;
end;

procedure TFrmMotCancel.btnGravarClick(Sender: TObject);
Var
  Campos : String;
  Gravar : Boolean;
  tabela : ttable;

begin
 Campos:='';
 Gravar:=True;
 Tabela := TTable.Create(Application);
 Tabela.DatabaseName := dmDados.TbMotCancel.DatabaseName;
 Tabela.TableName := dmDados.TbMotCancel.TableName;
 Tabela.IndexName := dmdados.tbMotCancel.IndexName;
 Tabela.Open;

	If dbCod.Text='' Then
  	Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
      Campos:=Campos+'C�DIGO';
      Gravar:=False;
    end
  else
     begin
     If Tabela.Locate('CodMotCancel',dbCod.Text,[]) Then
       If not((DmDados.tbMotCancel.State=dsEdit) And (dmDados.tbMotCancel.RecNo = Tabela.RecNo)) Then
          Begin
          Gravar:=False;
          Showmessage('C�DIGO j� cadastrado');
          dbCod.SetFocus;
          End;
     end;

If dbMotivo.Text='' Then
   Begin
   If Length(Campos)>0 Then
    	Campos:=Campos+', ';
      Campos:=Campos+'MOTIVO';
      Gravar:=False;
   end
else
   begin
   If Tabela.Locate('MOTIVO',dbMotivo.Text,[]) Then
     If not((DmDados.tbMotcancel.State=dsEdit) And (dmDados.tbMotcancel.RecNo = Tabela.RecNo)) Then
        Begin
        Gravar:=False;
        Showmessage('MOTIVO j� cadastrado');
        dbMotivo.SetFocus;
        End;
   end;

if gravar then
 begin
 NovoItem:= False;
 dmdados.tbMotCancel.Post;
 dmDados.vTabStt:=True;
 BtnGravar.enabled := False;
 BtnCancelar.Enabled := False;
 BtnNovo.Enabled:=True;
 BtnPrimeiro.Enabled:=True;
 BtnAnterior.Enabled:=True;
 BtnProximo.Enabled:=True;
 BtnUltimo.Enabled:=True;
 BtnAlterar.Enabled:=True;
 Btndeletar.Enabled:=True;
 dbCod.Enabled:=false;
 dbMotivo.Enabled:=false;
 showmessage('Dados gravados com sucesso!');
 Panel2.SetFocus;
 end
else
  begin
  ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
  dbMotivo.Enabled:=true;
  end;
end;

procedure TFrmMotCancel.fcImageBtn1Click(Sender: TObject);
begin
  dmdados.tbMotCancel.First;
  Btnprimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  dmdados.vTabStt:=true;
end;

procedure TFrmMotCancel.fcImageBtn2Click(Sender: TObject);
begin
  dmdados.tbMotCancel.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If dmdados.tbMotCancel.bof Then
  Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
  End;
  dmdados.vTabStt:=true;
end;

procedure TFrmMotCancel.fcImageBtn8Click(Sender: TObject);
begin
  dmdados.tbMotCancel.next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  If dmdados.tbMotCancel.Eof Then
  Begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
  End;
  dmdados.vTabStt:=true;
end;

procedure TFrmMotCancel.fcImageBtn3Click(Sender: TObject);
begin
  dmdados.tbMotCancel.last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  dmdados.vTabStt:=true;
end;

procedure TFrmMotCancel.fcImageBtn9Click(Sender: TObject);
begin
DMDados.tbMotCancel.Append;
NovoItem:=True;
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
{habilitando os componentes}
dbCod.Enabled:=True;
dbMotivo.Enabled:=true;
gridCancel.Enabled:=true;
dbCod.SetFocus;
end;

procedure TFrmMotCancel.fcImageBtn4Click(Sender: TObject);
Var
  Campos : String;
  Gravar : Boolean;
  tabela : ttable;

begin
 Campos:='';
 Gravar:=True;
 Tabela := TTable.Create(Application);
 Tabela.DatabaseName := dmDados.TbMotCancel.DatabaseName;
 Tabela.TableName := dmDados.TbMotCancel.TableName;
 Tabela.IndexName := dmdados.tbMotCancel.IndexName;
 Tabela.Open;

	If dbCod.Text='' Then
  	Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
      Campos:=Campos+'C�DIGO';
      Gravar:=False;
    end
  else
     begin
     If Tabela.Locate('CodMotCancel',dbCod.Text,[]) Then
       If not((DmDados.tbMotCancel.State=dsEdit) And (dmDados.tbMotCancel.RecNo = Tabela.RecNo)) Then
          Begin
          Gravar:=False;
          Showmessage('C�DIGO j� cadastrado');
          dbCod.SetFocus;
          End;
     end;

If dbMotivo.Text='' Then
   Begin
   If Length(Campos)>0 Then
    	Campos:=Campos+', ';
      Campos:=Campos+'MOTIVO';
      Gravar:=False;
   end
else
   begin
   If Tabela.Locate('MOTIVO',dbMotivo.Text,[]) Then
     If not((DmDados.tbMotcancel.State=dsEdit) And (dmDados.tbMotcancel.RecNo = Tabela.RecNo)) Then
        Begin
        Gravar:=False;
        Showmessage('MOTIVO j� cadastrado');
        dbMotivo.SetFocus;
        End;
   end;

if gravar then
 begin
 NovoItem:= False;
 dmdados.tbMotCancel.Post;
 dmDados.vTabStt:=True;
 BtnGravar.enabled := False;
 BtnCancelar.Enabled := False;
 BtnNovo.Enabled:=True;
 BtnPrimeiro.Enabled:=True;
 BtnAnterior.Enabled:=True;
 BtnProximo.Enabled:=True;
 BtnUltimo.Enabled:=True;
 BtnAlterar.Enabled:=True;
 Btndeletar.Enabled:=True;
 dbCod.Enabled:=false;
 dbMotivo.Enabled:=false;
 showmessage('Dados gravados com sucesso!');
 Panel2.SetFocus;
 end
else
  begin
  ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
  dbMotivo.Enabled:=true;
  end;
end;


procedure TFrmMotCancel.fcImageBtn5Click(Sender: TObject);
begin
dmdados.tbMotCancel.cancel;
NovoItem:= False;
dmdados.vTabStt:=true;
{Desabilitando os bot�es}
BtnGravar.enabled := false;
BtnCancelar.Enabled := false;
BtnNovo.Enabled:=True;
btnPrimeiro.Enabled:=True;
BtnAnterior.Enabled:=True;
Btnproximo.Enabled:=True;
BtnUltimo.Enabled:=True;
BtnAlterar.Enabled:=True;
BtnDeletar.Enabled:=True;
{Habilitando os componentes}
gridCancel.Enabled:=false;
dbCod.Enabled:=False;
dbMotivo.Enabled:=false;
Panel2.SetFocus;
end;

procedure TFrmMotCancel.fcImageBtn10Click(Sender: TObject);
begin
if dmdados.tbMotCancel.recordCount=0 then
   showMessage('tabela vazia')
else
  begin
  if dmdados.tbMotCancelCodMotCancel.Value='1' then
     showMessage('Item n�o pode ser alterado')
  else
   begin
   novoitem:=true;
   dmdados.vTabStt:=false;
   dmdados.tbMotCancel.Edit;
   DbMotivo.Enabled:=True;
   btnGravar.Enabled:=True;
   btnCancelar.Enabled:=True;
   DbMotivo.SetFocus;
   end;
  end;
end;

procedure TFrmMotCancel.fcImageBtn6Click(Sender: TObject);
begin
if dmdados.tbMotCancel.RecordCount=0 then
   begin
   ShowMessage('Tabela vazia');
   end
else
   begin
   if dmdados.tbMotCancelCodMotCancel.Value='1' then
      showMessage('Item n�o pode ser exclu�do')
   else
     begin
     NovoItem:=False;
     If application.MessageBox('Tem certeza que deseja excluir esse registro?','ATEN��O', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
        dmdados.tbMotCancel.Delete
     else
        dmdados.tbMotCancel.Cancel;
     end;
   end;
end;

procedure TFrmMotCancel.fcImageBtn7Click(Sender: TObject);
begin
  Close;
end;

end.

//////////////////////////////////////////////////////////////////////////
// Criacao...........: 07/2002
// Sistema...........: Controle de Vendas - Unimed
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitCadPlano;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolEdit, RXDBCtrl, Grids, DBGrids, SpeedBar, jpeg, ExtCtrls, StdCtrls,
  RackCtls, fcButton, fcImgBtn, RXSplit, Mask, DBCtrls, RXCtrls, ComCtrls,
  db,dbutils, CurrEdit,dbTables, LMDCustomComponent, LMDCustomHint,
  LMDCustomShapeHint, LMDShapeHint, EFocCol, RxGrdCpt;

type
  TFrmCadPlano = class(TForm)
    Panel1: TPanel;
    dbPlano: TDBEdit;
    gridPlano: TDBGrid;
    dbCod: TDBEdit;
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
    Panel3: TPanel;
    Image3: TImage;
    RxLabel4: TRxLabel;
    Image1: TImage;
    Image4: TImage;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    RxGradientCaption1: TRxGradientCaption;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbPlanoExit(Sender: TObject);
    procedure btnGravarClick0(Sender: TObject);
    procedure dbCodExit(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure fcImageBtn2Click(Sender: TObject);
    procedure fcImageBtn1Click(Sender: TObject);
    procedure fcImageBtn3Click(Sender: TObject);
    procedure fcImageBtn4Click(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure fcImageBtn6Click(Sender: TObject);
    procedure fcImageBtn7Click(Sender: TObject);
    procedure fcImageBtn8Click(Sender: TObject);
    procedure fcImageBtn9Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadPlano: TFrmCadPlano;
  NovoItem,mudar:Boolean;

implementation

uses UnitDmDados, unitPrincipal;

{$R *.DFM}

procedure TFrmCadPlano.FormClose(Sender: TObject; var Action: TCloseAction);
begin
FrmPrincipal.StatusTeclas(False,'');
dmDados.HabilitaTeclado:=True;
Action:= Cafree;
end;

procedure TFrmCadPlano.BtnSairClick(Sender: TObject);
begin
	Close;
end;

procedure TFrmCadPlano.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
  Begin
  Key:=#0;
  Perform(wm_nextdlgctl,0,0);
  End;
end;

procedure TFrmCadPlano.FormShow(Sender: TObject);
begin
dmDados.vTabStt:=True;
NovoItem:= false;
FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [F9] Localizar [Delete] Excluir [Esc] Cancelar ou Sair');
if dmdados.tbPlano.RecordCount=0 then
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

procedure TFrmCadPlano.BtnNovoClick(Sender: TObject);
begin
  DMDados.tbPlano.Append;
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
  dbCod.Enabled:=true;
  dbPlano.Enabled:=True;
  gridPlano.Enabled:=true;
  dbCod.SetFocus;
end;

procedure TFrmCadPlano.BtnCancelarClick(Sender: TObject);
begin
 dmdados.tbPlano.cancel;
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
//  BtnLocalizar.Enabled:=True;
 {Habilitando os componentes}
 gridPlano.Enabled:=false;
 dbCod.Enabled:=false;
 dbPlano.Enabled:=False;
end;

procedure TFrmCadPlano.BtnAlterarClick(Sender: TObject);
begin
if dmdados.tbPlano.RecordCount=0 then
  ShowMessage('Tabela vazia')
else
  begin
  novoitem:=true;
  dmdados.vTabStt:=false;
  dmdados.tbPlano.Edit;
  //habilitar bot�es
  BtnCancelar.enabled:= true;
  BtnGravar.Enabled:= true;
  BtnNovo.Enabled:=False;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  BtnAlterar.Enabled:=False;
  Btndeletar.Enabled:=False;
  //habilitar objetos
  gridPlano.Enabled:=true;
  dbCod.Enabled:=true;
  dbPlano.Enabled:=True;
  dbCod.SetFocus;
  end;
end;

procedure TFrmCadPlano.BtnDeletarClick(Sender: TObject);
begin
  if dmdados.tbPlano.RecordCount=0 then
    begin
    ShowMessage('Tabela vazia');
    end
  else
    If Application.MessageBox('Tem certeza que deseja excluir este registro?','ATEN��O', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
      begin
      DMDados.tbPlano.Delete;
      end
    else
      DMDados.tbPlano.Cancel;
end;

procedure TFrmCadPlano.BtnPrimeiroClick(Sender: TObject);
begin
  DMDados.tbPlano.First;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  dmDados.vTabStt:=True;
end;

procedure TFrmCadPlano.BtnAnteriorClick(Sender: TObject);
begin
  DMDados.tbPlano.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If DMDados.tbPlano.Bof Then
    Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    End;
  dmDados.vTabStt:=True;
end;


procedure TFrmCadPlano.BtnProximoClick(Sender: TObject);
begin
  DMDados.tbPlano.Next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  If DMDados.tbPlano.Eof Then
    Begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
    End;
  dmDados.vTabStt:=True;
end;

procedure TFrmCadPlano.BtnUltimoClick(Sender: TObject);
begin
  DMDados.tbPlano.Last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  dmDados.vTabStt:=True;
end;

procedure TFrmCadPlano.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmCadPlano.dbPlanoExit(Sender: TObject);
Var
  Tabela : TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.TbPlano.DatabaseName;
  Tabela.TableName := dmDados.TbPlano.TableName;
  Tabela.IndexName := dmdados.TbPlano.IndexName;
  Tabela.Open;
  If NovoItem Then
  begin
   If dbPlano.Text = '' Then
     Begin
     ShowMessage('� necess�rio Informar o PLANO');
     DbPlano.setfocus;
     end
   Else
     Begin
     If Tabela.Locate('TipoPlano',dbPlano.Text,[]) Then
       begin
       If not ((DmDados.tbPlano.State=dsEdit) And (dmDados.tbPlano.RecNo = Tabela.RecNo)) Then
         begin
         Showmessage('PLANO j� cadastrado');
         dbPlano.Clear;
         dbPlano.setfocus;
         End
       else
       end
     else
       Tabela.Free;
    end;
end;


end;

procedure TFrmCadPlano.btnGravarClick0(Sender: TObject);
Var
  Campos : String;
  Gravar : Boolean;
  tabela : ttable;

begin
  Campos:='';
  Gravar:=True;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.TbPlano.DatabaseName;
  Tabela.TableName := dmDados.TbPlano.TableName;
  Tabela.IndexName := dmdados.tbPlano.IndexName;
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
     If Tabela.Locate('CodPlano',dbCod.Text,[]) Then
       If not((DmDados.tbPlano.State=dsEdit) And (dmDados.tbPlano.RecNo = Tabela.RecNo)) Then
          Begin
          Gravar:=False;
          Showmessage('C�DIGO j� cadastrado');
          dbCod.SetFocus;
          End;
     end;

If dbPlano.Text='' Then
   Begin
   If Length(Campos)>0 Then
    	Campos:=Campos+', ';
      Campos:=Campos+'PLANO';
      Gravar:=False;
   end
else
   begin
   If Tabela.Locate('TIPOPLANO',dbPlano.Text,[]) Then
     If not((DmDados.tbPlano.State=dsEdit) And (dmDados.tbPlano.RecNo = Tabela.RecNo)) Then
        Begin
        Gravar:=False;
        Showmessage('PLANO j� cadastrado');
        dbPlano.SetFocus;
        End;
   end;

if gravar then
 begin
 NovoItem:= False;
 dmdados.TBPlano.Post;
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
 dbPlano.Enabled:=false;
 showmessage('Dados gravados com sucesso!');
 end
else
  begin
  ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
  dbPlano.Enabled:=true;
  end;
end;




procedure TFrmCadPlano.dbCodExit(Sender: TObject);
Var
Tabela: TTable;

begin
Tabela := TTable.Create(Application);
Tabela.DatabaseName := dmDados.TbPlano.DatabaseName;
Tabela.TableName := dmDados.TbPlano.TableName;
Tabela.IndexName := dmdados.tbPlano.IndexName;
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
   If Tabela.Locate('CodPlano',dbCod.Text,[]) Then
    begin
    If not ((DmDados.tbPlano.State=dsEdit) And (dmDados.tbPlano.RecNo = Tabela.RecNo)) Then
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

procedure TFrmCadPlano.btnExcluirClick(Sender: TObject);
begin
  DMDados.tbPlano.First;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  dmDados.vTabStt:=True;
end;

procedure TFrmCadPlano.fcImageBtn2Click(Sender: TObject);
begin
  DMDados.tbPlano.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If DMDados.tbPlano.Bof Then
    Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    End;
  dmDados.vTabStt:=True;
end;

procedure TFrmCadPlano.fcImageBtn1Click(Sender: TObject);
begin
  DMDados.tbPlano.Next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  If DMDados.tbPlano.Eof Then
    Begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
    End;
  dmDados.vTabStt:=True;
end;

procedure TFrmCadPlano.fcImageBtn3Click(Sender: TObject);
begin
  DMDados.tbPlano.Last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  dmDados.vTabStt:=True;
end;

procedure TFrmCadPlano.fcImageBtn4Click(Sender: TObject);
begin
  DMDados.tbPlano.Append;
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
  dbCod.Enabled:=true;
  dbPlano.Enabled:=True;
  gridPlano.Enabled:=true;
  dbCod.SetFocus;
end;

procedure TFrmCadPlano.btnGravarClick(Sender: TObject);
Var
  Campos : String;
  Gravar : Boolean;
  tabela : ttable;

begin
  Campos:='';
  Gravar:=True;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.TbPlano.DatabaseName;
  Tabela.TableName := dmDados.TbPlano.TableName;
  Tabela.IndexName := dmdados.tbPlano.IndexName;
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
     If Tabela.Locate('CodPlano',dbCod.Text,[]) Then
       If not((DmDados.tbPlano.State=dsEdit) And (dmDados.tbPlano.RecNo = Tabela.RecNo)) Then
          Begin
          Gravar:=False;
          Showmessage('C�DIGO j� cadastrado');
          dbCod.SetFocus;
          End;
     end;

If dbPlano.Text='' Then
   Begin
   If Length(Campos)>0 Then
    	Campos:=Campos+', ';
      Campos:=Campos+'PLANO';
      Gravar:=False;
   end
else
   begin
   If Tabela.Locate('TIPOPLANO',dbPlano.Text,[]) Then
     If not((DmDados.tbPlano.State=dsEdit) And (dmDados.tbPlano.RecNo = Tabela.RecNo)) Then
        Begin
        Gravar:=False;
        Showmessage('PLANO j� cadastrado');
        dbPlano.SetFocus;
        End;
   end;

if gravar then
 begin
 NovoItem:= False;
 dmdados.TBPlano.Post;
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
 dbPlano.Enabled:=false;
 Panel2.SetFocus;
 showmessage('Dados gravados com sucesso!');
 end
else
  begin
  ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
  dbPlano.Enabled:=true;
  end;
end;

procedure TFrmCadPlano.fcImageBtn6Click(Sender: TObject);
begin
 dmdados.tbPlano.cancel;
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
//  BtnLocalizar.Enabled:=True;
 {Habilitando os componentes}
 gridPlano.Enabled:=false;
 dbCod.Enabled:=false;
 dbPlano.Enabled:=False;
 Panel2.SetFocus;
end;

procedure TFrmCadPlano.fcImageBtn7Click(Sender: TObject);
begin
if dmdados.tbPlano.RecordCount=0 then
  ShowMessage('Tabela vazia')
else
  begin
  novoitem:=true;
  dmdados.vTabStt:=false;
  dmdados.tbPlano.Edit;
  //habilitar bot�es
  BtnCancelar.enabled:= true;
  BtnGravar.Enabled:= true;
  BtnNovo.Enabled:=False;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  BtnAlterar.Enabled:=False;
  Btndeletar.Enabled:=False;
  //habilitar objetos
  gridPlano.Enabled:=true;
  dbCod.Enabled:=true;
  dbPlano.Enabled:=True;
  dbCod.SetFocus;
  end;
end;

procedure TFrmCadPlano.fcImageBtn8Click(Sender: TObject);
begin
 if dmdados.tbPlano.RecordCount=0 then
    begin
    ShowMessage('Tabela vazia');
    end
  else
    If Application.MessageBox('Tem certeza que deseja excluir este registro?','ATEN��O', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
      begin
      DMDados.tbPlano.Delete;
      end
    else
      DMDados.tbPlano.Cancel;
end;

procedure TFrmCadPlano.fcImageBtn9Click(Sender: TObject);
begin
  Close;
end;

end.

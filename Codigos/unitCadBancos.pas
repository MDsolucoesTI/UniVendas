//////////////////////////////////////////////////////////////////////////
// Criacao...........: 07/2002
// Sistema...........: Controle de Vendas - Unimed
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitCadBancos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fcButton, fcImgBtn, RXSplit, Grids, DBGrids, StdCtrls, Mask, DBCtrls,
  RXCtrls, ExtCtrls, SpeedBar, jpeg, RackCtls, DBTables, DB,
  LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint, LMDShapeHint;

type
  TFrmCadBancos = class(TForm)
    Panel1: TPanel;
    RxLabel1: TRxLabel;
    DBEnum: TDBEdit;
    RxSplitter1: TRxSplitter;
    fclGravar: TfcImageBtn;
    Panel2: TPanel;
    RxLabel2: TRxLabel;
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    DBEBanco: TDBEdit;
    SpeedBar1: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    BtnPrimeiro: TSpeedItem;
    BtnAnterior: TSpeedItem;
    BtnProximo: TSpeedItem;
    BtnUltimo: TSpeedItem;
    BtnNovo: TSpeedItem;
    BtnCancelar: TSpeedItem;
    BtnAlterar: TSpeedItem;
    BtnDeletar: TSpeedItem;
    BtnSair: TSpeedItem;
    DBGridBanco: TDBGrid;
    RxLabel4: TRxLabel;
    Image2: TImage;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBEnumExit(Sender: TObject);
    procedure DBEbancoExit(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure fclGravarClick(Sender: TObject);
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadBancos: TFrmCadBancos;
  NovoItem, Mudar: Boolean;

implementation

uses UnitDmdados, unitPrincipal;

{$R *.DFM}

procedure TFrmCadBancos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  Action:= Cafree;
end;

procedure TFrmCadBancos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmCadBancos.DBEnumExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.TbBanco.DatabaseName;
  Tabela.TableName := dmDados.TbBanco.TableName;
  Tabela.IndexName := dmdados.tbBanco.IndexName;
  Tabela.Open;
If NovoItem Then
begin
    If dbenum.Text = '' Then
      Begin
      ShowMessage('??? necess???rio Informar o N???MERO DO BANCO');
      Dbenum.setfocus;
      end
    Else
      Begin
        If Tabela.Locate('NUMBANCO',dbeBanco.Text,[loCaseInsensitive]) Then
        begin
           If not((DmDados.tbBanco.State=dsEdit) And (dmDados.tbBanco.RecNo=Tabela.RecNo)) Then
              Begin
              Showmessage('N???MERO DO BANCO j??? cadastrado');
              dbenum.Clear;
              dbenum.setfocus;
              End;
        End;
      Tabela.Free;
      end;
end;      
end;


procedure TFrmCadBancos.DBEbancoExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.TbBanco.DatabaseName;
  Tabela.TableName := dmDados.TbBanco.TableName;
  Tabela.IndexName := dmdados.tbBanco.IndexName;
  Tabela.Open;
If NovoItem Then
begin
    If dbeBanco.Text = '' Then
      Begin
      ShowMessage('??? necess???rio Informar o BANCO');
      DbeBanco.setfocus;
      end
    Else
    Begin
        If Tabela.Locate('NOMEBANCO',dbeBanco.Text,[]) Then
        begin
            If not ((DmDados.tbBanco.State=dsEdit) And (dmDados.tbBanco.RecNo = Tabela.RecNo)) Then
               Begin
               fclGravar.Default:=True;
               fclGravar.SetFocus;
               end
            Else
               Begin
               Showmessage('BANCO j??? cadastrado');
               dbeBanco.Clear;
               dbeBanco.setfocus;
               End;
        end
        else
              begin
              fclGravar.Default:=True;
              fclGravar.SetFocus;
              end;
      End;
    Tabela.Free;
    end;
end;

procedure TFrmCadBancos.BtnSairClick(Sender: TObject);
begin
 Dmdados.tbBanco.Cancel;
 Close;
end;

procedure TFrmCadBancos.fclGravarClick(Sender: TObject);
var
  Tabela: TTable;
  Gravar,Vazio:Boolean;
  Campos:String;
begin
  fclGravar.Default:=False;
  Gravar:=True;
  Vazio:=False;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.TbBanco.DatabaseName;
  Tabela.TableName := dmDados.TbBanco.TableName;
  Tabela.IndexName := dmdados.tbBanco.IndexName;
  Tabela.Open;
	If dbeNum.Text='' Then
  	Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'N???mero do Banco';
    Gravar:=False;
    Vazio:=True;
  	End
  Else
    If Tabela.Locate('NumBanco',dbeNum.Text,[]) Then
      If (DmDados.tbBanco.State=dsEdit) And (dmDados.tbBanco.RecNo = Tabela.RecNo) Then
        Gravar:=True
      Else
        Begin
        Showmessage('N???MERO DO BANCO j??? Cadastrado');
       	Gravar:=False;
        End;
	If dbeBanco.Text='' Then
  	Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Banco';
    Gravar:=False;
    Vazio:=True;
  	End
  Else
    If Tabela.Locate('NOMEBANCO',dbeBanco.Text,[]) Then
      If (DmDados.tbBanco.State=dsEdit) And (dmDados.tbBanco.RecNo = Tabela.RecNo) Then
        Gravar:=True
      Else
        Begin
        Showmessage('BANCO j??? Cadastrado');
       	Gravar:=False;
        End;
  Tabela.Free;
  If Gravar Then
    begin
    if Mudar Then
	    Begin
      dmdados.vTabStt:=true;
     	dmdados.tbBanco.Post;
     	NovoItem:=False;
     	fclGravar.Enabled:=False;
     	dbeBanco.Enabled:=False;
    	Mudar:=False;
     	End
  	Else
     	Begin
      dmdados.vTabStt:=False;
     	dmdados.tbBanco.Post;
     	NovoItem:=True;
     	dmdados.tbBanco.Append;
     	dbeNum.SetFocus;
   		End;
    End
  Else
    Begin
    If Vazio Then
      ShowMessage('O(s) Campo(s) '+Campos+' n???o tem Valor(es) ');
    dbeNum.SetFocus;
    end;
end;

procedure TFrmCadBancos.BtnNovoClick(Sender: TObject);
begin
  DMDados.tbBanco.Append;
  NovoItem:=True;
  dmdados.vTabStt:=false;
  Mudar:= False;
  {habilitando os bot???es}
  fclgravar.Enabled:=True;
  BtnCancelar.Enabled := True;
  BtnAlterar.Enabled:=False;
  BtnDeletar.Enabled:=False;
  BtnNovo.Enabled:=False;
  {habilitando os componentes}
  DBenum.Enabled:=True;
  DBebanco.Enabled:= True;
  DBenum.SetFocus;
end;

procedure TFrmCadBancos.BtnCancelarClick(Sender: TObject);
begin
  dmdados.tbBanco.cancel;
  NovoItem:= False;
  Mudar:=False;
  dmdados.vTabStt:=true;
  {Desabilitando os bot???es}
  FclGravar.Enabled:=false;
  BtnCancelar.Enabled := false;
  BtnAlterar.Enabled:=True;
  BtnDeletar.Enabled:=True;
  BtnNovo.Enabled:=True;
  {Habilitando os componentes}
  DbeNum.Enabled:=False;
  DbeBanco.enabled:=false;
  SpeedBar1.SetFocus;
end;

procedure TFrmCadBancos.BtnAlterarClick(Sender: TObject);
begin
  novoitem:=true;
  dmdados.vTabStt:=false;
  Mudar:=True;
  dmdados.tbBanco.Edit;
  DbeNum.Enabled:=True;
  dbeBanco.Enabled:=True;
  fclGravar.Enabled:=True;
  btnCancelar.Enabled:=True;
  Dbenum.SetFocus;
end;

procedure TFrmCadBancos.BtnDeletarClick(Sender: TObject);
begin
  NovoItem:=False;
  if dmdados.tbBanco.RecordCount=0 then
    begin
    ShowMessage('Tabela sem registro');
    end
  else
    If application.MessageBox('Tem certeza que deseja exluir esse registro?','Excluir', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
      if dmDados.TbCCorrente.Locate('NumBanco',dmDados.tbBancoNumBanco.Value,[]) then
        ShowMessage('Banco com Conta Corrente Ativa, n???o pode ser exclu???do !!!')
      else
        dmdados.tbBanco.Delete;
end;

procedure TFrmCadBancos.BtnProximoClick(Sender: TObject);
begin
  dmdados.TbBanco.next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  If dmdados.TbBanco.Eof Then
  Begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
  End;
  dmdados.vTabStt:=true;
end;

procedure TFrmCadBancos.BtnPrimeiroClick(Sender: TObject);
begin
  dmdados.TbBanco.First;
  Btnprimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  dmdados.vTabStt:=true;
end;

procedure TFrmCadBancos.BtnAnteriorClick(Sender: TObject);
begin
  dmdados.TbBanco.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If dmdados.TbBanco.bof Then
  Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
  End;
  dmdados.vTabStt:=true;
end;

procedure TFrmCadBancos.BtnUltimoClick(Sender: TObject);
begin
  dmdados.TbBanco.last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  dmdados.vTabStt:=true;
end;

procedure TFrmCadBancos.FormShow(Sender: TObject);
begin
  Mudar:=False;
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [Esc] Cancelar ou Sair');
end;

procedure TFrmCadBancos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a??????o na tabela
      VK_Insert : if (dmDados.vTabStt) then BtnNovo.Click;
      VK_Home   : if (dmDados.vTabStt) then BtnAlterar.Click;
      VK_Delete : if (dmDados.vTabStt) then BtnDeletar.Click;
      VK_End    : if not(dmDados.vTabStt) then fclGravar.Click;
      VK_ESCAPE : if not(dmDados.vTabStt) then BtnCancelar.Click
                  else BtnSair.Click;
    end;
end;

end.

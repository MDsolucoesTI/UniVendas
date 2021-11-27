//////////////////////////////////////////////////////////////////////////
// Criacao...........: 07/2002
// Sistema...........: Controle de Vendas - Unimed
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitVendedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  VerCPF, ToolEdit, RXDBCtrl, RackCtls, StdCtrls, DBCtrls, RXSplit, Mask,
  RXCtrls, ExtCtrls, SpeedBar, jpeg, CurrEdit, fcButton, fcImgBtn, RxLookup,
  DB, DBTables, DCStdCtrls, ImgList, Grids, DBGrids, ComCtrls, EDBZero,
  EFocCol,ShellApi, RxGrdCpt;

type
  TFrmVendedor = class(TForm)
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
    Panel4: TPanel;
    Image3: TImage;
    RxLabel4: TRxLabel;
    Image1: TImage;
    Panel3: TPanel;
    RxLabel13: TRxLabel;
    RxLabel3: TRxLabel;
    RxLabel12: TRxLabel;
    RxLabel19: TRxLabel;
    RxLabelnasc: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel11: TRxLabel;
    RxLabel17: TRxLabel;
    RxLabel18: TRxLabel;
    RxLabelcpf: TRxLabel;
    RxLabelrg: TRxLabel;
    RxLabel5: TRxLabel;
    RxLabel6: TRxLabel;
    RxLabel7: TRxLabel;
    RxLabel21: TRxLabel;
    RxLabel10: TRxLabel;
    RxLabel9: TRxLabel;
    RxLabel8: TRxLabel;
    RxLabel1: TRxLabel;
    DbDateEditCad: TDBDateEdit;
    dbdedtAdm: TDBDateEdit;
    DBcmbSit: TDBComboBox;
    rxdbComissao: TRxDBCalcEdit;
    dbdEdtNasc: TDBDateEdit;
    DBEnome: TDBEdit;
    DBEtel1: TDBEdit;
    DBETel2: TDBEdit;
    DBEcel: TDBEdit;
    DBEcpf: TDBEdit;
    DBErg: TDBEdit;
    DBEend: TDBEdit;
    DBEbairro: TDBEdit;
    DBEcidade: TDBEdit;
    dbeNum: TEvDBZeroEdit;
    DBEcompl: TDBEdit;
    DBEcep: TDBEdit;
    DBCBoxUF: TDBComboBox;
    dbemail: TDBEdit;
    fcImageBtn2: TfcImageBtn;
    Image4: TImage;
    RxGradientCaption1: TRxGradientCaption;
    RxLabel14: TRxLabel;
    Bevel1: TBevel;
    btnLocalizar: TfcImageBtn;
    procedure rxdbComissaoEnter(Sender: TObject);
    procedure DBEnomeExit(Sender: TObject);
    procedure dbdedtAdmExit(Sender: TObject);
    procedure DBCBoxUFExit(Sender: TObject);
    procedure DBcmbSitExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure DBMemoInfoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnSairClick(Sender: TObject);
    procedure dbemailExit(Sender: TObject);
    procedure dbdEdtNascExit(Sender: TObject);
    procedure rxdbComissaoExit(Sender: TObject);
    procedure DBEcpfExit(Sender: TObject);
    procedure fcImageBtn2Click(Sender: TObject);
    procedure SpeedBar1Click(Sender: TObject);
    procedure fcImageBtn1Click(Sender: TObject);
    procedure fcImageBtn3Click(Sender: TObject);
    procedure fcImageBtn9Click(Sender: TObject);
    procedure fcImageBtn4Click(Sender: TObject);
    procedure fcImageBtn10Click(Sender: TObject);
    procedure fcImageBtn5Click(Sender: TObject);
    procedure fcImageBtn6Click(Sender: TObject);
    procedure fcImageBtn11Click(Sender: TObject);
    procedure fcImageBtn7Click(Sender: TObject);
    procedure fcImageBtn8Click(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmVendedor: TFrmVendedor;
  NovoItem:Boolean;

implementation

uses UnitDmDados, unitPrincipal, UnitLocFunc;

{$R *.DFM}

procedure TFrmVendedor.rxdbComissaoEnter(Sender: TObject);
begin
  rxdbComissao.Value:=0;
end;

procedure TFrmVendedor.DBEnomeExit(Sender: TObject);
begin
If NovoItem Then
    If DBEnome.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o Nome do Vendedor!!');
      DBEnome.SetFocus;
      End;
end;

procedure TFrmVendedor.dbdedtAdmExit(Sender: TObject);
begin
  If NovoItem Then
    If dbdedtAdm.Text= '  /  /    ' then
      Begin
      ShowMessage('� obrigat�rio a Data de Admiss�o!!');
      dbdedtAdm.SetFocus;
      End
    else
      begin
    try
      StrToDate(dbdedtAdm.Text);
      except
       on EConvertError do
       begin
       ShowMessage ('Data Inv�lida!!');
       dbdedtAdm.SetFocus;
        end;
     end;
     end;
end;

procedure TFrmVendedor.DBCBoxUFExit(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
Flag:=True;
If NovoItem Then
 Begin
   If DBCBoxUF.Text= '' then
    Begin
      ShowMessage('� obrigat�rio informar o Estado');
      DBCBoxUF.SetFocus;
    End
    Else
    Begin
       If DBCBoxUF.Text<> '' then
        For x:=0 to DBCBoxUF.Items.Count-1 Do
          If DBCBoxUF.Text=DBCBoxUF.Items[x] Then
            Flag:=False;

        If Flag Then
        Begin
          ShowMessage('Sigla do Estado inv�lida');
          DBCBoxUF.SetFocus;
        End;

    End;
  end;

end;

procedure TFrmVendedor.DBcmbSitExit(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
  If NovoItem Then
    Begin
    If DBcmbSit.Text= '' then
      Begin
      ShowMessage('� obrigat�rio informar a Situa��o');
      DBcmbSit.SetFocus;
      End
    Else
      Begin
      Flag:=True;
      For x:=0 to DBcmbSit.Items.Count-1 Do
        If DBcmbSit.Text=DBcmbSit.Items[x] Then
          Flag:=False;
      If Flag Then
        Begin
        ShowMessage('Tipo de Situa��o inv�lida');
        DBcmbSit.SetFocus;
        End;
      End;
    end;
end;

procedure TFrmVendedor.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
  Begin
  Key:=#0;
  Perform(wm_nextdlgctl,0,0);
  End;
end;

procedure TFrmVendedor.BtnPrimeiroClick(Sender: TObject);
begin
DMDados.TbVendedor.First;
BtnPrimeiro.Enabled:=False;
BtnAnterior.Enabled:=False;
BtnProximo.Enabled:=True;
BtnUltimo.Enabled:=True;
dmdados.vTabStt:=true;
end;

procedure TFrmVendedor.BtnAnteriorClick(Sender: TObject);
begin
DMDados.TbVendedor.Prior;
BtnProximo.Enabled:=True;
BtnUltimo.Enabled:=True;
If DMDados.TbVendedor.Bof Then
  Begin
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  End;
dmdados.vTabStt:=true;
end;

procedure TFrmVendedor.BtnProximoClick(Sender: TObject);
begin
DMDados.TbVendedor.Next;
BtnPrimeiro.Enabled:=True;
BtnAnterior.Enabled:=True;
If DMDados.TbVendedor.Eof Then
  Begin
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  End;
dmdados.vTabStt:=true;
end;

procedure TFrmVendedor.BtnUltimoClick(Sender: TObject);
begin
DMDados.TbVendedor.Last;
BtnPrimeiro.Enabled:=True;
BtnAnterior.Enabled:=True;
BtnProximo.Enabled:=False;
BtnUltimo.Enabled:=False;
dmdados.vTabStt:=true;
end;

procedure TFrmVendedor.BtnNovoClick(Sender: TObject);
begin
DMDados.TbVendedor.Append;
NovoItem:=True;
{habilitando os bot�es}
BtnGravar.Enabled :=True;
BtnCancelar.Enabled:=True;
BtnNovo.Enabled:=False;
BtnPrimeiro.Enabled:=False;
BtnAnterior.Enabled:=False;
BtnProximo.Enabled:=False;
BtnUltimo.Enabled:=False;
BtnAlterar.Enabled:=False;
BtnDeletar.Enabled:=False;
{habilitando os componentes}
dbdedtAdm.Enabled:= True;
DBcmbSit.Enabled:=True;
rxdbComissao.Enabled:=True;
DBENome.Enabled:=True;
DBdEdtNasc.Enabled:=True;
DBETel1.Enabled:=True;
dbeTel2.Enabled:=True;
dbeCel.Enabled:=True;
DBEcpf.Enabled:=True;
DBErg.Enabled:=True;
DBEend.Enabled:=True;
DBEnum.Enabled:=True;
DBEcompl.Enabled:=True;
DBEbairro.Enabled:=True;
DBEcidade.Enabled:=True;
DBEcep.Enabled:=True;
DBCBoxUF.Enabled:=True;
dbemail.Enabled:= True;
dmdados.vTabStt:=false;
dbdedtAdm.SetFocus;
end;

procedure TFrmVendedor.BtnCancelarClick(Sender: TObject);
begin
NovoItem:=False;
dmdados.vTabStt:=true;
DMDados.TbVendedor.Cancel;
BtnGravar.Enabled:=False;
BtnCancelar.Enabled:=False;
BtnNovo.Enabled:=True;
BtnPrimeiro.Enabled:=True;
BtnAnterior.Enabled:=True;
BtnProximo.Enabled:=True;
BtnUltimo.Enabled:=True;
BtnAlterar.Enabled:=True;
BtnDeletar.Enabled:=True;
Panel1.SetFocus;
{desabilitando os objetos}
dbdedtAdm.Enabled:= False;
DBcmbSit.Enabled:=False;
rxdbComissao.Enabled:=False;
DBENome.Enabled:=False;
DBdEdtNasc.Enabled:=False;
DBETel1.Enabled:=False;
dbeTel2.Enabled:=False;
dbeCel.Enabled:=False;
DBEcpf.Enabled:=False;
DBErg.Enabled:=False;
DBEend.Enabled:=False;
DBEnum.Enabled:=False;
DBEcompl.Enabled:=False;
DBEbairro.Enabled:=False;
DBEcidade.Enabled:=False;
DBEcep.Enabled:=False;
DBCBoxUF.Enabled:=False;
dbemail.Enabled:= False;
end;

procedure TFrmVendedor.BtnAlterarClick(Sender: TObject);
begin
if dmdados.TbVendedor.RecordCount=0 then
 ShowMessage('Tabela Vazia')
else
begin
NovoItem:=True;
dmdados.vTabStt:=false;
DMDados.TbVendedor.Edit;
dmdados.vTabStt:=false;
{habilitando os bot�es}
BtnCancelar.Enabled:=True;
BtnGravar.Enabled:=True;
BtnNovo.Enabled:=False;
BtnPrimeiro.Enabled:=False;
BtnAnterior.Enabled:=False;
BtnProximo.Enabled:=False;
BtnUltimo.Enabled:=False;
BtnAlterar.Enabled:=False;
Btndeletar.Enabled:=False;
{habilitando os componentes}
dbdedtAdm.Enabled:= True;
DBcmbSit.Enabled:=True;
rxdbComissao.Enabled:=True;
DBENome.Enabled:=True;
DBdEdtNasc.Enabled:=True;
DBETel1.Enabled:=True;
dbeTel2.Enabled:=True;
dbeCel.Enabled:=True;
DBEcpf.Enabled:=True;
DBErg.Enabled:=True;
DBEend.Enabled:=True;
DBEnum.Enabled:=True;
DBEcompl.Enabled:=True;
DBEbairro.Enabled:=True;
DBEcidade.Enabled:=True;
DBEcep.Enabled:=True;
DBCBoxUF.Enabled:=True;
dbemail.Enabled:= True;
dbdedtAdm.SetFocus;
end;
end;

procedure TFrmVendedor.BtnDeletarClick(Sender: TObject);
begin
if dmdados.TbVendedor.RecordCount=0 then
  ShowMessage('Tabela vazia')
else
  If Application.MessageBox('Tem certeza que deseja excluir este Vendedor?','Excluir', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
    begin
    if dmdados.tbVenda.Locate('CodVend',dmdados.TbVendedorCodVend.Value,[]) then
      ShowMessage('Existem Vendas para este vendedor o registro n�o pode ser excluido')
    else
      begin
      dmdados.tbComis.Filtered:=False;
      dmdados.tbComis.Filter:='CodVend = '''+IntToStr(dmdados.TbVendedorCodVend.Value)+''')';
      dmdados.tbComis.Filtered:=True;
      dmdados.tbComis.First;
      while not dmdados.tbComis.Eof do
        begin
        dmdados.tbComis.Delete;
        dmdados.tbComis.First;
        end;
      dmdados.TbVendedor.Delete;
      dmdados.TbVendedor.Refresh;
      end;
    end
  else
    DMDados.TbVendedor.cancel;
end;

procedure TFrmVendedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmDados.HabilitaTeclado:=True;
  Action:=caFree;
end;

procedure TFrmVendedor.FormCreate(Sender: TObject);
begin
  NovoItem:=False;
end;

procedure TFrmVendedor.BtnGravarClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar,Flag:Boolean;
  x:Integer;
  Tabela: TTable;
begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.TbVendedor.DatabaseName;
  Tabela.TableName := dmDados.TbVendedor.TableName;
  Tabela.Open;
  //Campo que n�o pode repetir
  {If dbeCpf.Text='           ' Then
     Begin
      Campos:=Campos+' CPF ';
      Gravar:=False;
      Vazio:=True;
     End
  else
     Begin
     If Tabela.Locate('CPF',dbeCPF.Text,[]) Then
       begin
       If not((DmDados.TbVendedor.State=dsEdit) And (dmDados.TbVendedor.RecNo = Tabela.RecNo)) Then
         Gravar:=False;
       End;
     End;}
  //Campo que n�o pode estar vazio
  If rxdbComissao.Text= '' then
    Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'comissao';
    Gravar:=False;
    Vazio:=True;
    End;

  If DBEnome.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'Nome do Funcion�rio';
    Gravar:=False;
    Vazio:=True;
    end;
  //Campos com uso de Combo
  {If DBCBoxUF.Text= '' then
    begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Estado';
    Gravar:=False;
    Vazio:=True;
    End
  Else
    Begin
    If DBCBoxUF.Text<> '' then
    Flag:=True;
    For x:=0 to DBCBoxUF.Items.Count-1 Do
      If DBCBoxUF.Text=DBCBoxUF.Items[x] Then
        Flag:=False;
    If Flag Then
      Begin
      ShowMessage('Valor do Estado inv�lido');
      Gravar:=False;
      End;
    end;}

  If DBcmbSit.Text= '' then
    begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Situa��o';
    Gravar:=False;
    Vazio:=True;
    End
  Else
    Begin
    Flag:=True;
    For x:=0 to DBcmbSit.Items.Count-1 Do
      If DBcmbSit.Text=DBcmbSit.Items[x] Then
        Flag:=False;
    If Flag Then
      Begin
      ShowMessage('Valor do Situa��o inv�lido');
      Gravar:=False;
      End;
    End;
  //Campo Data n�o podendo ser vazio
  If dbdedtAdm.Text= '  /  /    ' then
    Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Data de Admiss�o';
    Gravar:=False;
    Vazio:=True;
    End;
  If Gravar Then
    Begin
    DMDados.TbVendedor.Post;
    NovoItem:=False;
    dmdados.vTabStt:=true;
    BtnGravar.Enabled:=False;
    BtnCancelar.Enabled:=False;
    BtnNovo.Enabled:=True;
    BtnPrimeiro.Enabled:=True;
    BtnAnterior.Enabled:=True;
    BtnProximo.Enabled:=True;
    BtnUltimo.Enabled:=True;
    BtnAlterar.Enabled:=True;
    Btndeletar.Enabled:=True;
    Panel1.SetFocus;
    {desabilitando os componentes}
    dbDateEditCad.Enabled:= False;
    dbdedtAdm.Enabled:= False;
    DBcmbSit.Enabled:=False;
    rxdbComissao.Enabled:=False;
    DBENome.Enabled:=False;
    DBdEdtNasc.Enabled:=False;
    DBETel1.Enabled:=False;
    dbeTel2.Enabled:=False;
    dbeCel.Enabled:=False;
    DBEcpf.Enabled:=False;
    DBErg.Enabled:=False;
    DBEend.Enabled:=False;
    DBEnum.Enabled:=False;
    DBEcompl.Enabled:=False;
    DBEbairro.Enabled:=False;
    DBEcidade.Enabled:=False;
    DBEcep.Enabled:=False;
    DBCBoxUF.Enabled:=False;
    dbemail.Enabled:= False;
    ShowMessage ('Dados gravados com sucesso!');
    End
  Else
    Begin
    If Vazio Then
      ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
    end;
  Tabela.Free;
end;

procedure TFrmVendedor.DBMemoInfoExit(Sender: TObject);
begin
  Panel1.SetFocus;
end;

procedure TFrmVendedor.FormShow(Sender: TObject);
begin
  NovoItem:= false;
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar  [F9] Localizar [Delete] Excluir [Esc] Cancelar ou Sair');
end;

procedure TFrmVendedor.FormKeyDown(Sender: TObject; var Key: Word;
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
procedure TFrmVendedor.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmVendedor.dbemailExit(Sender: TObject);
begin
  Panel1.SetFocus;
end;

procedure TFrmVendedor.dbdEdtNascExit(Sender: TObject);
begin
    If dbdEdtNasc.Text= '  /  /    ' then
    Begin
      ShowMessage('� obrigat�rio a DATA DE NASCIMENTO');
      dbdEdtNasc.SetFocus;
    End
    else
    try
      StrToDate(dbdEdtNasc.Text);
      except
       on EConvertError do
       begin
       ShowMessage ('Data Inv�lida!!');
       dbdEdtNasc.SetFocus;
       end;
     end;
end;
procedure TFrmVendedor.rxdbComissaoExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If rxdbComissao.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o campo Comiss�o!!');
      rxdbComissao.SetFocus;
      End;
    End;
end;

procedure TFrmVendedor.DBEcpfExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbVendedor.DatabaseName;
  Tabela.TableName := dmDados.tbVendedor.TableName;
  Tabela.IndexName := dmdados.tbVendedor.IndexName;
  Tabela.Open;
  If NovoItem Then
    If dbeCPF.Text = '           ' Then
      Begin
      ShowMessage('� necess�rio Informar o CPF');
      dbeCPF.setfocus;
      end
    else
      Begin
        If Tabela.Locate('CPF',dbeCPF.Text,[]) Then
        begin
          If not((DmDados.tbVendedor.State=dsEdit) And (dmDados.tbVendedor.RecNo = Tabela.RecNo)) Then
            Begin
            Showmessage('CPF j� Cadastrado');
            dbecpf.Clear;
            dbecpf.setfocus;
            End
        End;
      End;
  Tabela.Free;

end;

procedure TFrmVendedor.fcImageBtn2Click(Sender: TObject);
var
 url : string;
begin
  url :='mailto:'+dmdados.tbVendedorEMail.Value;
  shellexecute(0, 'open',Pchar(url), nil, nil, sw_showNormal);

end;

procedure TFrmVendedor.SpeedBar1Click(Sender: TObject);
begin
DMDados.TbVenda.Last;
BtnPrimeiro.Enabled:=True;
BtnAnterior.Enabled:=True;
BtnProximo.Enabled:=False;
BtnUltimo.Enabled:=False;
end;

procedure TFrmVendedor.fcImageBtn1Click(Sender: TObject);
begin
DMDados.TbVendedor.First;
BtnPrimeiro.Enabled:=False;
BtnAnterior.Enabled:=False;
BtnProximo.Enabled:=True;
BtnUltimo.Enabled:=True;
dmdados.vTabStt:=true;
end;

procedure TFrmVendedor.fcImageBtn3Click(Sender: TObject);
begin
DMDados.TbVendedor.Prior;
BtnProximo.Enabled:=True;
BtnUltimo.Enabled:=True;
If DMDados.TbVendedor.Bof Then
  Begin
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  End;
dmdados.vTabStt:=true;
end;

procedure TFrmVendedor.fcImageBtn9Click(Sender: TObject);
begin
DMDados.TbVendedor.Next;
BtnPrimeiro.Enabled:=True;
BtnAnterior.Enabled:=True;
If DMDados.TbVendedor.Eof Then
  Begin
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  End;
dmdados.vTabStt:=true;
end;

procedure TFrmVendedor.fcImageBtn4Click(Sender: TObject);
begin
DMDados.TbVendedor.Last;
BtnPrimeiro.Enabled:=True;
BtnAnterior.Enabled:=True;
BtnProximo.Enabled:=False;
BtnUltimo.Enabled:=False;
dmdados.vTabStt:=true;
end;

procedure TFrmVendedor.fcImageBtn10Click(Sender: TObject);
begin
DMDados.TbVendedor.Append;
NovoItem:=True;
{habilitando os bot�es}
BtnGravar.Enabled :=True;
BtnCancelar.Enabled:=True;
BtnNovo.Enabled:=False;
BtnPrimeiro.Enabled:=False;
BtnAnterior.Enabled:=False;
BtnProximo.Enabled:=False;
BtnUltimo.Enabled:=False;
BtnAlterar.Enabled:=False;
BtnDeletar.Enabled:=False;
BtnLocalizar.Enabled:=False;
{habilitando os componentes}
dbdedtAdm.Enabled:= True;
DBcmbSit.Enabled:=True;
rxdbComissao.Enabled:=True;
DBENome.Enabled:=True;
DBdEdtNasc.Enabled:=True;
DBETel1.Enabled:=True;
dbeTel2.Enabled:=True;
dbeCel.Enabled:=True;
DBEcpf.Enabled:=True;
DBErg.Enabled:=True;
DBEend.Enabled:=True;
DBEnum.Enabled:=True;
DBEcompl.Enabled:=True;
DBEbairro.Enabled:=True;
DBEcidade.Enabled:=True;
DBEcep.Enabled:=True;
DBCBoxUF.Enabled:=True;
dbemail.Enabled:= True;
dmdados.vTabStt:=false;
dbdedtAdm.SetFocus;
end;

procedure TFrmVendedor.fcImageBtn5Click(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar,Flag:Boolean;
  x:Integer;
  Tabela: TTable;
begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.TbVendedor.DatabaseName;
  Tabela.TableName := dmDados.TbVendedor.TableName;
  Tabela.Open;
  //Campo que n�o pode repetir
  {If dbeCpf.Text='           ' Then
     Begin
      Campos:=Campos+' CPF ';
      Gravar:=False;
      Vazio:=True;
     End
  else
     Begin
     If Tabela.Locate('CPF',dbeCPF.Text,[]) Then
       begin
       If not((DmDados.TbVendedor.State=dsEdit) And (dmDados.TbVendedor.RecNo = Tabela.RecNo)) Then
         Gravar:=False;
       End;
     End;}
  //Campo que n�o pode estar vazio
  If rxdbComissao.Text= '' then
    Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'comissao';
    Gravar:=False;
    Vazio:=True;
    End;

  If DBEnome.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'Nome do Funcion�rio';
    Gravar:=False;
    Vazio:=True;
    end;
  //Campos com uso de Combo
  {If DBCBoxUF.Text= '' then
    begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Estado';
    Gravar:=False;
    Vazio:=True;
    End
  Else
    Begin
    If DBCBoxUF.Text<> '' then
    Flag:=True;
    For x:=0 to DBCBoxUF.Items.Count-1 Do
      If DBCBoxUF.Text=DBCBoxUF.Items[x] Then
        Flag:=False;
    If Flag Then
      Begin
      ShowMessage('Valor do Estado inv�lido');
      Gravar:=False;
      End;
    end;}

  If DBcmbSit.Text= '' then
    begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Situa��o';
    Gravar:=False;
    Vazio:=True;
    End
  Else
    Begin
    Flag:=True;
    For x:=0 to DBcmbSit.Items.Count-1 Do
      If DBcmbSit.Text=DBcmbSit.Items[x] Then
        Flag:=False;
    If Flag Then
      Begin
      ShowMessage('Valor do Situa��o inv�lido');
      Gravar:=False;
      End;
    End;
  //Campo Data n�o podendo ser vazio
  If dbdedtAdm.Text= '  /  /    ' then
    Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Data de Admiss�o';
    Gravar:=False;
    Vazio:=True;
    End;
  If Gravar Then
    Begin
    DMDados.TbVendedor.Post;
    NovoItem:=False;
    dmdados.vTabStt:=true;
    BtnGravar.Enabled:=False;
    BtnCancelar.Enabled:=False;
    BtnNovo.Enabled:=True;
    BtnPrimeiro.Enabled:=True;
    BtnAnterior.Enabled:=True;
    BtnProximo.Enabled:=True;
    BtnUltimo.Enabled:=True;
    BtnAlterar.Enabled:=True;
    Btndeletar.Enabled:=True;
    BtnLocalizar.Enabled:=True;
    Panel1.SetFocus;
    {desabilitando os componentes}
    dbDateEditCad.Enabled:= False;
    dbdedtAdm.Enabled:= False;
    DBcmbSit.Enabled:=False;
    rxdbComissao.Enabled:=False;
    DBENome.Enabled:=False;
    DBdEdtNasc.Enabled:=False;
    DBETel1.Enabled:=False;
    dbeTel2.Enabled:=False;
    dbeCel.Enabled:=False;
    DBEcpf.Enabled:=False;
    DBErg.Enabled:=False;
    DBEend.Enabled:=False;
    DBEnum.Enabled:=False;
    DBEcompl.Enabled:=False;
    DBEbairro.Enabled:=False;
    DBEcidade.Enabled:=False;
    DBEcep.Enabled:=False;
    DBCBoxUF.Enabled:=False;
    dbemail.Enabled:= False;
    ShowMessage ('Dados gravados com sucesso!');
    End
  Else
    Begin
    If Vazio Then
      ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
    end;
  Tabela.Free;
end;


procedure TFrmVendedor.fcImageBtn6Click(Sender: TObject);
begin
NovoItem:=False;
dmdados.vTabStt:=true;
DMDados.TbVendedor.Cancel;
BtnGravar.Enabled:=False;
BtnCancelar.Enabled:=False;
BtnNovo.Enabled:=True;
BtnPrimeiro.Enabled:=True;
BtnAnterior.Enabled:=True;
BtnProximo.Enabled:=True;
BtnUltimo.Enabled:=True;
BtnAlterar.Enabled:=True;
BtnDeletar.Enabled:=True;
BtnLocalizar.Enabled:=True;
Panel1.SetFocus;
{desabilitando os objetos}
dbdedtAdm.Enabled:= False;
DBcmbSit.Enabled:=False;
rxdbComissao.Enabled:=False;
DBENome.Enabled:=False;
DBdEdtNasc.Enabled:=False;
DBETel1.Enabled:=False;
dbeTel2.Enabled:=False;
dbeCel.Enabled:=False;
DBEcpf.Enabled:=False;
DBErg.Enabled:=False;
DBEend.Enabled:=False;
DBEnum.Enabled:=False;
DBEcompl.Enabled:=False;
DBEbairro.Enabled:=False;
DBEcidade.Enabled:=False;
DBEcep.Enabled:=False;
DBCBoxUF.Enabled:=False;
dbemail.Enabled:= False;
end;

procedure TFrmVendedor.fcImageBtn11Click(Sender: TObject);
begin
if dmdados.TbVendedor.RecordCount=0 then
 ShowMessage('Tabela Vazia')
else
begin
NovoItem:=True;
dmdados.vTabStt:=false;
DMDados.TbVendedor.Edit;
dmdados.vTabStt:=false;
{habilitando os bot�es}
BtnCancelar.Enabled:=True;
BtnGravar.Enabled:=True;
BtnNovo.Enabled:=False;
BtnPrimeiro.Enabled:=False;
BtnAnterior.Enabled:=False;
BtnProximo.Enabled:=False;
BtnUltimo.Enabled:=False;
BtnAlterar.Enabled:=False;
Btndeletar.Enabled:=False;
BtnLocalizar.Enabled:=False;
{habilitando os componentes}
dbdedtAdm.Enabled:= True;
DBcmbSit.Enabled:=True;
rxdbComissao.Enabled:=True;
DBENome.Enabled:=True;
DBdEdtNasc.Enabled:=True;
DBETel1.Enabled:=True;
dbeTel2.Enabled:=True;
dbeCel.Enabled:=True;
DBEcpf.Enabled:=True;
DBErg.Enabled:=True;
DBEend.Enabled:=True;
DBEnum.Enabled:=True;
DBEcompl.Enabled:=True;
DBEbairro.Enabled:=True;
DBEcidade.Enabled:=True;
DBEcep.Enabled:=True;
DBCBoxUF.Enabled:=True;
dbemail.Enabled:= True;
dbdedtAdm.SetFocus;
end;
end;

procedure TFrmVendedor.fcImageBtn7Click(Sender: TObject);
begin
if dmdados.TbVendedor.RecordCount=0 then
  ShowMessage('Tabela vazia')
else
  If Application.MessageBox('Tem certeza que deseja excluir este Vendedor?','Excluir', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
    begin
    if dmdados.tbVenda.Locate('CodVend',dmdados.TbVendedorCodVend.Value,[]) then
      ShowMessage('Existem Vendas para este vendedor o registro n�o pode ser excluido')
    else
      begin
      dmdados.tbComis.Filtered:=False;
      dmdados.tbComis.Filter:='CodVend = '''+IntToStr(dmdados.TbVendedorCodVend.Value)+''')';
      dmdados.tbComis.Filtered:=True;
      dmdados.tbComis.First;
      while not dmdados.tbComis.Eof do
        begin
        dmdados.tbComis.Delete;
        dmdados.tbComis.First;
        end;
      dmdados.TbVendedor.Delete;
      dmdados.TbVendedor.Refresh;
      end;
    end
  else
    DMDados.TbVendedor.cancel;
end;

procedure TFrmVendedor.fcImageBtn8Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmVendedor.btnLocalizarClick(Sender: TObject);
begin
FrmLocVend:=tfrmLocVend.create(application);
frmLocVend.showmodal;
end;

end.

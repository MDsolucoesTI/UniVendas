//////////////////////////////////////////////////////////////////////////
// Criacao...........: 07/2002
// Sistema...........: Controle de Vendas - Unimed
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitCadCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fcButton, fcImgBtn, RxGrdCpt, RXCtrls, ExtCtrls, ToolEdit,
  RXDBCtrl, StdCtrls, RxDBComb, Mask, DBCtrls, EDBZero, ShellAPI, DB, DBTables;

type
  TFrmCadClientes = class(TForm)
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
    Panel4: TPanel;
    Image4: TImage;
    DBECod: TDBEdit;
    lctipopessoa: TRxLabel;
    DBCBoxTipo: TRxDBComboBox;
    labelNome: TRxLabel;
    labelFan: TRxLabel;
    rxLabelNasc: TRxLabel;
    dbFantasia: TDBEdit;
    RxLabelcpf: TRxLabel;
    RxLabelcnpj: TRxLabel;
    RxLabelrg: TRxLabel;
    RxLabelie: TRxLabel;
    DBEcnpj: TDBEdit;
    DBEcpf: TDBEdit;
    DBErg: TDBEdit;
    DBEie: TDBEdit;
    dbRaz: TDBEdit;
    dbdEdtNasc: TDBDateEdit;
    lbtel1: TRxLabel;
    DBEtel1: TDBEdit;
    lbtel2: TRxLabel;
    DBETel2: TDBEdit;
    lbcelular: TRxLabel;
    DBEcel: TDBEdit;
    RxLabel2: TRxLabel;
    DBEend: TDBEdit;
    RxLabel3: TRxLabel;
    dbeNum: TEvDBZeroEdit;
    RxLabel5: TRxLabel;
    DBEcompl: TDBEdit;
    RxLabel6: TRxLabel;
    DBEbairro: TDBEdit;
    RxLabel7: TRxLabel;
    DBEcidade: TDBEdit;
    RxLabel8: TRxLabel;
    DBEcep: TDBEdit;
    RxLabel9: TRxLabel;
    DBCBoxUF: TDBComboBox;
    RxLabel10: TRxLabel;
    DBEemail: TDBEdit;
    fcImageBtn2: TfcImageBtn;
    RxLabel11: TRxLabel;
    DbDateEditCad: TDBDateEdit;
    Bevel1: TBevel;
    RxLabel1: TRxLabel;
    dbNome: TDBEdit;
    labelRaz: TRxLabel;
    btnLocalizar: TfcImageBtn;
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure fcImageBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure DBCBoxTipoChange(Sender: TObject);
    procedure dbNomeExit(Sender: TObject);
    procedure dbRazExit(Sender: TObject);
    procedure DBEcnpjExit(Sender: TObject);
    procedure DBEcpfExit(Sender: TObject);
    procedure DBEemailExit(Sender: TObject);
    procedure DBCBoxUFExit(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadClientes: TFrmCadClientes;
  NovoItem: Boolean;
  mudaPag:boolean;

implementation

uses UnitDmdados, UnitPrincipal, unitLocCliente;

{$R *.dfm}

procedure TFrmCadClientes.btnPrimeiroClick(Sender: TObject);
begin
  dmdados.tbCliente.First;
  Btnprimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If (DBCBoxTipo.Text='Pessoa F�sica') then
    Begin
    dbfantasia.Visible:= False;
    Labelfan.Visible:= False;
    dbRaz.Visible:= False;
    LabelRaz.Visible:= False;
    dbeCnpj.visible:= false;
    dbeIE.visible:= false;
    RxLabelcnpj.visible:= false;
    RxLabelie.visible:= false;
    dbNome.Visible:= True;
    Labelnome.Visible:= True;
    dbeCpf.visible:= true;
    dbeRg.visible:= true;
    Rxlabelcpf.visible:= true;
    RxlabelRg.visible:= true;
    dbdEdtNasc.Visible:= True;
    RxLabelNasc.Visible:= True;
    end
  else
    Begin
    dbfantasia.Visible:= True;
    labelfan.Visible:= True;
    dbRaz.Visible:= True;
    labelRaz.Visible:=True;
    dbeCnpj.visible:= true;
    RxlabelCnpj.visible:= true;
    dbeIE.visible:= true;
    Rxlabelie.visible:= true;
    dbNome.Visible:=False;
    LabelNome.Visible:=false;
    dbeRg.visible:= false;
    dbeCpf.visible:= false;
    RxlabelRg.visible:= false;
    RxlabelCpf.visible:= false;
    dbdEdtNasc.Visible:= false;
    RxLabelNasc.Visible:= false;
    end;
end;

procedure TFrmCadClientes.btnAnteriorClick(Sender: TObject);
begin
  dmdados.tbCliente.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If dmdados.TbCliente.bof Then
  Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
  End;
  If (dbCboxTipo.Text='Pessoa F�sica') then
    Begin
    dbfantasia.Visible:= False;
    Labelfan.Visible:= False;
    dbRaz.Visible:= False;
    LabelRaz.Visible:= False;
    dbeCnpj.visible:= false;
    dbeIE.visible:= false;
    RxLabelcnpj.visible:= false;
    RxLabelie.visible:= false;
    dbNome.Visible:= True;
    Labelnome.Visible:= True;
    dbeCpf.visible:= true;
    dbeRg.visible:= true;
    Rxlabelcpf.visible:= true;
    RxlabelRg.visible:= true;
    dbdEdtNasc.Visible:= True;
    RxLabelNasc.Visible:= True;
    end
  else
    Begin
    dbfantasia.Visible:= True;
    labelfan.Visible:= True;
    dbRaz.Visible:= True;
    labelRaz.Visible:=True;
    dbeCnpj.visible:= true;
    RxlabelCnpj.visible:= true;
    dbeIE.visible:= true;
    Rxlabelie.visible:= true;
    dbNome.Visible:=False;
    LabelNome.Visible:=false;
    dbeRg.visible:= false;
    dbeCpf.visible:= false;
    RxlabelRg.visible:= false;
    RxlabelCpf.visible:= false;
    dbdEdtNasc.Visible:= false;
    RxLabelNasc.Visible:= false;
    end;
end;

procedure TFrmCadClientes.btnProximoClick(Sender: TObject);
begin
 dmdados.tbCliente.next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  If dmdados.TbCliente.Eof Then
  Begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
  End;
  If (dbcBoxTipo.Text='Pessoa F�sica') then
    Begin
    dbfantasia.Visible:= False;
    Labelfan.Visible:= False;
    dbRaz.Visible:= False;
    LabelRaz.Visible:= False;
    dbeCnpj.visible:= false;
    dbeIE.visible:= false;
    RxLabelcnpj.visible:= false;
    RxLabelie.visible:= false;
    dbNome.Visible:= True;
    Labelnome.Visible:= True;
    dbeCpf.visible:= true;
    dbeRg.visible:= true;
    Rxlabelcpf.visible:= true;
    RxlabelRg.visible:= true;
    dbdEdtNasc.Visible:= True;
    RxLabelNasc.Visible:= True;
    end
  else
    Begin
    dbfantasia.Visible:= True;
    labelfan.Visible:= True;
    dbRaz.Visible:= True;
    labelRaz.Visible:=True;
    dbeCnpj.visible:= true;
    RxlabelCnpj.visible:= true;
    dbeIE.visible:= true;
    Rxlabelie.visible:= true;
    dbNome.Visible:=False;
    LabelNome.Visible:=false;
    dbeRg.visible:= false;
    dbeCpf.visible:= false;
    RxlabelRg.visible:= false;
    RxlabelCpf.visible:= false;
    dbdEdtNasc.Visible:= false;
    RxLabelNasc.Visible:= false;
    end;
end;

procedure TFrmCadClientes.btnUltimoClick(Sender: TObject);
begin
  dmdados.tbCliente.last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  If (dbcBoxTipo.Text='Pessoa F�sica') then
    Begin
    dbfantasia.Visible:= False;
    Labelfan.Visible:= False;
    dbRaz.Visible:= False;
    LabelRaz.Visible:= False;
    dbeCnpj.visible:= false;
    dbeIE.visible:= false;
    RxLabelcnpj.visible:= false;
    RxLabelie.visible:= false;
    dbNome.Visible:= True;
    Labelnome.Visible:= True;
    dbeCpf.visible:= true;
    dbeRg.visible:= true;
    Rxlabelcpf.visible:= true;
    RxlabelRg.visible:= true;
    dbdEdtNasc.Visible:= True;
    RxLabelNasc.Visible:= True;
    end
  else
    Begin
    dbfantasia.Visible:= True;
    labelfan.Visible:= True;
    dbRaz.Visible:= True;
    labelRaz.Visible:=True;
    dbeCnpj.visible:= true;
    RxlabelCnpj.visible:= true;
    dbeIE.visible:= true;
    Rxlabelie.visible:= true;
    dbNome.Visible:=False;
    LabelNome.Visible:=false;
    dbeRg.visible:= false;
    dbeCpf.visible:= false;
    RxlabelRg.visible:= false;
    RxlabelCpf.visible:= false;
    dbdEdtNasc.Visible:= false;
    RxLabelNasc.Visible:= false;
    end;
end;

procedure TFrmCadClientes.btnNovoClick(Sender: TObject);
begin
  dmdados.tbCliente.Append;
  novoitem:=true;
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
  {habilitando os componentes}
  If (dbcBoxTipo.Text='Pessoa F�sica') then
    Begin
    dbfantasia.Visible:= False;
    Labelfan.Visible:= False;
    dbRaz.Visible:= False;
    LabelRaz.Visible:= False;
    dbeCnpj.visible:= false;
    dbeIE.visible:= false;
    RxLabelcnpj.visible:= false;
    RxLabelie.visible:= false;
    dbNome.Visible:= True;
    Labelnome.Visible:= True;
    dbeCpf.visible:= true;
    dbeRg.visible:= true;
    Rxlabelcpf.visible:= true;
    RxlabelRg.visible:= true;
    dbdEdtNasc.Visible:= True;
    RxLabelNasc.Visible:= True;
    end
  else
    Begin
    dbfantasia.Visible:= True;
    labelfan.Visible:= True;
    dbRaz.Visible:= True;
    labelRaz.Visible:=True;
    dbeCnpj.visible:= true;
    RxlabelCnpj.visible:= true;
    dbeIE.visible:= true;
    Rxlabelie.visible:= true;
    dbNome.Visible:=False;
    LabelNome.Visible:=false;
    dbeRg.visible:= false;
    dbeCpf.visible:= false;
    RxlabelRg.visible:= false;
    RxlabelCpf.visible:= false;
    dbdEdtNasc.Visible:= false;
    RxLabelNasc.Visible:= false;
    end;
  dbCBoxTipo.Enabled:=true;
  DbRaz.Enabled:=true;
  DbNome.Enabled:= True;
//dblookrota.Enabled:=true;
//dbprazo.Enabled:=true;
  dbfantasia.Enabled:=true;
  DbDedtnasc.Enabled:=true;
  DbeTel1.Enabled:=true;
  dbeTel2.Enabled:=true;
  dbecel.Enabled:=true;
  dbecpf.Enabled:=true;
  dbecnpj.Enabled:=true;
  dberg.Enabled:=true;
  dbeie.Enabled:=true;
  dbeEnd.Enabled:=true;
  dbenum.Enabled:=true;
  Dbecompl.Enabled:=true;
  DbeBairro.Enabled:=true;
  dbeCidade.Enabled:=true;
  dbecep.Enabled:=true;
  DBCBoxUF.Enabled:=true;
  dbeemail.Enabled:=true;
  dmDados.vTabStt:=False;
  DbcBoxTipo.setfocus;
end;

procedure TFrmCadClientes.btnGravarClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar,Flag:Boolean;
  Tabela: TTable;
  x:integer;
begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.TbCliente.DatabaseName;
  Tabela.TableName := dmDados.TbCliente.TableName;
  Tabela.IndexName := dmdados.tbCliente.IndexName;
  Tabela.Open;

If dbCBoxTipo.Text= '' then
   begin {a}
   If Length(Campos)>0 Then
      begin
  	  Campos:=Campos+', ';
      Campos:=Campos+'Tipo de Pessoa';
      Gravar:=False;
      Vazio:=True;
      End
    Else
      Begin
      Flag:=True;
      For x:=0 to dbCBoxTipo.Items.Count-1 Do
        If dbCBoxTipo.Text=dbCBoxTipo.Items[x] Then
          Flag:=False;
      If Flag Then
        Begin
        ShowMessage('Valor do TIPO DE PESSOA inv�lido');
        Gravar:=False;
        End;
      End;
   end
else
   begin
   If (dbCBoxTipo.Text='Pessoa F�sica') Then
      Begin
      If dbNome.Text='' Then
         Begin
         If Length(Campos)>0 Then
         Campos:=Campos+', ';
         Campos:='Nome';
         Gravar:=False;
         Vazio:=True;
         end;
      End
   Else
      Begin
         If dbRaz.Text='' Then
         Begin
         If Length(Campos)>0 Then
            Campos:=Campos+', ';
            Campos:=' Raz�o Social ';
            Gravar:=False;
            Vazio:=True;
         End;
      end;
  end;
If Gravar Then
Begin
NovoItem:= False;
dmdados.tbCliente.Post;
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
BtnLocalizar.Enabled:=True;
{desabilitando os componentes}
dbCBoxTipo.Enabled:=false;
DbRaz.Enabled:=false;
DbNome.Enabled:= false;
dbfantasia.Enabled:=false;
DbDedtnasc.Enabled:=false;
DbeTel1.Enabled:=false;
dbeTel2.Enabled:=false;
dbecel.Enabled:=false;
dbecpf.Enabled:=false;
DBEcnpj.Enabled:=false;
DBEie.Enabled:=false;
dberg.Enabled:=false;
dbeEnd.Enabled:=false;
dbenum.Enabled:=false;
Dbecompl.Enabled:=false;
DbeBairro.Enabled:=false;
dbeCidade.Enabled:=false;
dbecep.Enabled:=false;
dbcBoxUF.Enabled:=false;
dbeemail.Enabled:=false;
DbDateEditCad.enabled:=false;
showmessage('Dados gravados com sucesso!');
Panel2.SetFocus;
end
Else
 Begin
 If Vazio Then
    begin
    mudaPag:=false;
    ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
    If (dbcBoxTipo.Text='Pessoa F�sica') then
      begin
      dbnome.Enabled:=true;
      dbNome.SetFocus;
      end
    else
      begin
      dbfantasia.SetFocus;
      end;
    mudapag:=true;
    end;
 end;
If (dbcBoxTipo.Text='Pessoa F�sica') then
 Begin
 dbfantasia.Visible:= False;
 Labelfan.Visible:= False;
 dbRaz.Visible:= False;
 LabelRaz.Visible:= False;
 dbeCnpj.visible:= false;
 dbeIE.visible:= false;
 RxLabelcnpj.visible:= false;
 RxLabelie.visible:= false;
 dbNome.Visible:= True;
 Labelnome.Visible:= True;
 dbeCpf.visible:= true;
 dbeRg.visible:= true;
 Rxlabelcpf.visible:= true;
 RxlabelRg.visible:= true;
 dbdEdtNasc.Visible:= True;
 RxLabelNasc.Visible:= True;
 end
else
 Begin
 dbfantasia.Visible:= True;
 labelfan.Visible:= True;
 dbRaz.Visible:= True;
 labelRaz.Visible:=True;
 dbeCnpj.visible:= true;
 RxlabelCnpj.visible:= true;
 dbeIE.visible:= true;
 Rxlabelie.visible:= true;
 dbNome.Visible:=False;
 LabelNome.Visible:=false;
 dbeRg.visible:= false;
 dbeCpf.visible:= false;
 RxlabelRg.visible:= false;
 RxlabelCpf.visible:= false;
 dbdEdtNasc.Visible:= false;
 RxLabelNasc.Visible:= false;
end;
end;

procedure TFrmCadClientes.btnCancelarClick(Sender: TObject);
begin
  dmdados.tbCliente.cancel;
  NovoItem:= False;
  BtnGravar.enabled := false;
  BtnCancelar.Enabled := false;
  BtnNovo.Enabled:=True;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  Btnproximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  BtnAlterar.Enabled:=True;
  BtnDeletar.Enabled:=True;
  BtnLocalizar.Enabled:=True;
  {desabilitando os componentes}
  dbCBoxTipo.Enabled:=false;
  DbRaz.Enabled:=false;
  dbNome.Enabled:=false;
  //dblookrota.Enabled:=false;
  //dbprazo.Enabled:=false;
  dbfantasia.Enabled:=false;
  DbDedtnasc.Enabled:=false;
  DbeTel1.Enabled:=false;
  dbeTel2.Enabled:=false;
  dbecel.Enabled:=false;
  dbecpf.Enabled:=false;
  DBEcnpj.Enabled:= False;
  DBEie.Enabled:= False;
  dberg.Enabled:=false;
  dbeEnd.Enabled:=false;
  dbenum.Enabled:=false;
  Dbecompl.Enabled:=false;
  DbeBairro.Enabled:=false;
  dbeCidade.Enabled:=false;
  dbecep.Enabled:=false;
  dbcBoxUF.Enabled:=false;
  dbeemail.Enabled:=false;
  DbDateEditCad.enabled:=false;
  dmDados.vTabStt:=True;
  Panel2.SetFocus;
end;

procedure TFrmCadClientes.btnAlterarClick(Sender: TObject);
begin
if dmdados.tbCliente.RecordCount=0 then
begin
ShowMessage('Tabela vazia')
end
else
  begin
  dmdados.tbCliente.Edit;
  NovoItem:= True;
  {habilitando os bot�es}
  BtnCancelar.enabled:= true;
  BtnGravar.Enabled:= true;
  BtnNovo.Enabled:=False;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  BtnAlterar.Enabled:=False;
  Btndeletar.Enabled:=False;
  BtnLocalizar.Enabled:=False;
  {habilitando os componentes}
  dbCBoxTipo.Enabled:=True;
  DbRaz.Enabled:=True;
  dbNome.Enabled:= True;
  //dblookrota.Enabled:=true;
  //dbprazo.Enabled:=true;
  dbfantasia.Enabled:=true;
  DbDedtnasc.Enabled:=True;
  DbeTel1.Enabled:=True;
  dbeTel2.Enabled:=True;
  dbecel.Enabled:=True;
  dbecpf.Enabled:=True;
  dberg.Enabled:=True;
  dbecnpj.Enabled:=True;
  dbeie.Enabled:=True;
  dbeEnd.Enabled:=True;
  dbenum.Enabled:=True;
  Dbecompl.Enabled:=True;
  DbeBairro.Enabled:=True;
  dbeCidade.Enabled:=True;
  dbecep.Enabled:=True;
  DBCBoxUF.Enabled:=True;
  dbeemail.Enabled:=True;
  DbDateEditCad.enabled:=True;
  dmDados.vTabStt:=False;
  dbCBoxTipo.SetFocus;
  end;
end;

procedure TFrmCadClientes.btnDeletarClick(Sender: TObject);
var
  Flag : Boolean;
begin
  Flag:=False;
  if dmdados.tbCliente.RecordCount=0 then
    begin
    ShowMessage('Tabela vazia');
    end
  else
    begin
    If application.MessageBox('Tem certeza que deseja excluir esse registro?','ATEN��O', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
       dmdados.tbCliente.Delete
    else
        dmdados.tbCliente.Cancel;
        dmdados.tbCliente.Refresh;
If (dbCBoxTipo.Text='Pessoa F�sica') then
   Begin
   dbfantasia.Visible:= False;
   Labelfan.Visible:= False;
   dbRaz.Visible:= False;
   LabelRaz.Visible:= False;
   dbeCnpj.visible:= false;
   dbeIE.visible:= false;
   RxLabelcnpj.visible:= false;
   RxLabelie.visible:= false;
   dbNome.Visible:= True;
   Labelnome.Visible:= True;
   dbeCpf.visible:= true;
   dbeRg.visible:= true;
   Rxlabelcpf.visible:= true;
   RxlabelRg.visible:= true;
   dbdEdtNasc.Visible:= True;
   RxLabelNasc.Visible:= True;
   end
else
   Begin
   dbfantasia.Visible:= True;
   labelfan.Visible:= True;
   dbRaz.Visible:= True;
   labelRaz.Visible:=True;
   dbeCnpj.visible:= true;
   RxlabelCnpj.visible:= true;
   dbeIE.visible:= true;
   Rxlabelie.visible:= true;
   dbNome.Visible:=False;
   LabelNome.Visible:=false;
   dbeRg.visible:= false;
   dbeCpf.visible:= false;
   RxlabelRg.visible:= false;
   RxlabelCpf.visible:= false;
   dbdEdtNasc.Visible:= false;
   RxLabelNasc.Visible:= false;
   end;
end;   

end;

procedure TFrmCadClientes.fcImageBtn2Click(Sender: TObject);
var
 url : string;
begin
  url :='mailto:'+dmdados.tbClienteEMail.Value;
  shellexecute(0, 'open',Pchar(url), nil, nil, sw_showNormal);
end;

procedure TFrmCadClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  Action:= Cafree;
end;

procedure TFrmCadClientes.FormKeyDown(Sender: TObject; var Key: Word;
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
    end;
end;

procedure TFrmCadClientes.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmCadClientes.FormShow(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [F9] Localizar [Esc] Cancelar ou Sair');
  dmDados.vTabStt:=True;
  NovoItem:= false;
  mudaPag:=true;
  If dmdados.tbClienteTipo.Value='1' then
    begin
    dbfantasia.Visible:= False;
    Labelfan.Visible:= False;
    dbRaz.Visible:= False;
    LabelRaz.Visible:= False;
    dbeCnpj.visible:= false;
    dbeIE.visible:= false;
    RxLabelcnpj.visible:= false;
    RxLabelie.visible:= false;
    dbNome.Visible:= True;
    Labelnome.Visible:= True;
    dbeCpf.visible:= true;
    dbeRg.visible:= true;
    Rxlabelcpf.visible:= true;
    RxlabelRg.visible:= true;
    dbdEdtNasc.Visible:= True;
    RxLabelNasc.Visible:= True;
    end
  else
    Begin
    dbfantasia.Visible:= True;
    labelfan.Visible:= True;
    dbRaz.Visible:= True;
    labelRaz.Visible:=True;
    dbeCnpj.visible:= true;
    RxlabelCnpj.visible:= true;
    dbeIE.visible:= true;
    Rxlabelie.visible:= true;
    dbNome.Visible:=False;
    LabelNome.Visible:=false;
    dbeRg.visible:= false;
    dbeCpf.visible:= false;
    RxlabelRg.visible:= false;
    RxlabelCpf.visible:= false;
    dbdEdtNasc.Visible:= false;
    RxLabelNasc.Visible:= false;
    end;
  if dmdados.TbCliente.RecordCount=0 then
    begin
    Btnprimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    BtnProximo.Enabled:=false;
    BtnUltimo.Enabled:=false;
    btnGravar.Enabled:=false;
    btnAlterar.Enabled:=false;
    btnCancelar.Enabled:=false;
    btnDeletar.Enabled:=false;
    btnLocalizar.Enabled:=false;
    end;
end;

procedure TFrmCadClientes.DBCBoxTipoChange(Sender: TObject);
begin
  If (dbcBoxTipo.Text='Pessoa F�sica') then
    begin
    dbfantasia.Visible:= False;
    Labelfan.Visible:= False;
    dbRaz.Visible:= False;
    LabelRaz.Visible:= False;
    dbeCnpj.visible:= false;
    dbeIE.visible:= false;
    RxLabelcnpj.visible:= false;
    RxLabelie.visible:= false;
    dbNome.Visible:= True;
    Labelnome.Visible:= True;
    dbeCpf.visible:= true;
    dbeRg.visible:= true;
    Rxlabelcpf.visible:= true;
    RxlabelRg.visible:= true;
    dbdEdtNasc.Visible:= True;
    RxLabelNasc.Visible:= True;
    end
  else
    Begin
    dbfantasia.Visible:= True;
    labelfan.Visible:= True;
    dbRaz.Visible:= True;
    labelRaz.Visible:=True;
    dbeCnpj.visible:= true;
    RxlabelCnpj.visible:= true;
    dbeIE.visible:= true;
    Rxlabelie.visible:= true;
    dbNome.Visible:=False;
    LabelNome.Visible:=false;
    dbeRg.visible:= false;
    dbeCpf.visible:= false;
    RxlabelRg.visible:= false;
    RxlabelCpf.visible:= false;
    dbdEdtNasc.Visible:= false;
    RxLabelNasc.Visible:= false;
    end;
end;

procedure TFrmCadClientes.dbNomeExit(Sender: TObject);
begin
If NovoItem Then
    If DBnome.Text= '' then
      Begin
      ShowMessage('� obrigat�rio cadastrar o NOME');
      DBNome.SetFocus;
      End;
end;

procedure TFrmCadClientes.dbRazExit(Sender: TObject);
begin
If NovoItem Then
    If dbRaz.Text= '' then
      Begin
      ShowMessage('� obrigat�rio cadastrar a RAZ�O SOCIAL');
      dbRaz.SetFocus;
      End;
end;

procedure TFrmCadClientes.DBEcnpjExit(Sender: TObject);
var
 tabela : ttable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.TbCliente.DatabaseName;
  Tabela.TableName := dmDados.TbCliente.TableName;
  Tabela.IndexName := dmdados.tbCliente.IndexName;
  Tabela.Open;
  If Tabela.Locate('CNPJ',dbeCnpj.Text,[]) Then
     begin
     If not((DmDados.tbCliente.State=dsEdit) And (dmDados.tbCliente.RecNo = Tabela.RecNo)) Then
        Begin
        Showmessage('CNPJ j� Cadastrado');
        dbecnpj.Clear;
        dbecnpj.setfocus;
        End;
     End;
Tabela.Free;

end;

procedure TFrmCadClientes.DBEcpfExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.TbCliente.DatabaseName;
  Tabela.TableName := dmDados.TbCliente.TableName;
  Tabela.IndexName := dmdados.tbCliente.IndexName;
  Tabela.Open;
  If Tabela.Locate('CPF',dbeCPF.Text,[]) Then
     begin
     If not((DmDados.tbCliente.State=dsEdit) And (dmDados.tbCliente.RecNo = Tabela.RecNo)) Then
        Begin
        Showmessage('CPF j� Cadastrado');
        dbecpf.Clear;
        dbecpf.setfocus;
        End
     End;
Tabela.Free;

end;

procedure TFrmCadClientes.DBEemailExit(Sender: TObject);
begin
Panel2.SetFocus;
end;

procedure TFrmCadClientes.DBCBoxUFExit(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
  If NovoItem Then
    If DBCBoxUF.Text= '' then
      Begin
      ShowMessage('� obrigat�rio informar o ESTADO');
      DBCBoxUF.SetFocus;
      End
    Else
      Begin
      Flag:=True;
      For x:=0 to DBCboxUF.Items.Count-1 Do
        If DBCboxUF.Text=DBCboxUF.Items[x] Then
          Flag:=False;
      If Flag Then
        Begin
        ShowMessage('ESTADO inv�lido');
        DBCboxUF.SetFocus;
        End
      End;
end;

procedure TFrmCadClientes.btnLocalizarClick(Sender: TObject);
begin
frmLocCliente:=tfrmLocCliente.create(application);
frmLocCliente.showmodal;
end;

procedure TFrmCadClientes.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.

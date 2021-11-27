//////////////////////////////////////////////////////////////////////////
// Criacao...........: 07/2002
// Sistema...........: Controle de Vendas - Unimed
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, RXCtrls, RackCtls, SpeedBar, Mask,db,
  ToolEdit, RXDBCtrl, DBCtrls, RXSplit, ImgList, fcOutlookList, fcButton,
  fcImgBtn, fcShapeBtn, fcClearPanel, fcButtonGroup, fcOutlookBar,
  RxLookup, CurrEdit, DCStdCtrls, LMDControl, LMDBaseControl,
  LMDBaseGraphicButton, LMDCustomMMButton, LMDMMButton,
  LMDCustomShapeButton, LMDShapeButton, EUserAcs;

type
  TfrmVenda = class(TForm)
    Image2: TImage;
    Label2: TLabel;
    ImageList1: TImageList;
    ScrewPanel1: TScrewPanel;
    RxLabel15: TRxLabel;
    outVenda: TfcOutlookBar;
    outVendaInserir: TfcShapeBtn;
    outVendaAberto: TfcShapeBtn;
    outInserir: TfcOutlookList;
    outAberto: TfcOutlookList;
    pgcVendas: TDCPageControl;
    pgInserir: TDCPage;
    RxLabel13: TRxLabel;
    dbDataVen: TDBDateEdit;
    RxLabel2: TRxLabel;
    RxLabel1: TRxLabel;
    dbNumero: TDBEdit;
    RxSplitter1: TRxSplitter;
    dbVidas: TDBEdit;
    RxLabel3: TRxLabel;
    dbValor: TRxDBCalcEdit;
    RxLabel19: TRxLabel;
    dbComis: TRxDBCalcEdit;
    RxLabel4: TRxLabel;
    lookVend: TRxDBLookupCombo;
    RxLabel5: TRxLabel;
    RxLabel6: TRxLabel;
    RxSplitter2: TRxSplitter;
    RxSplitter3: TRxSplitter;
    outVendaOutlookList2: TfcOutlookList;
    outVendaSair: TfcShapeBtn;
    RxLabel7: TRxLabel;
    dbStatus: TDBEdit;
    RxSplitter4: TRxSplitter;
    RxLabel8: TRxLabel;
    dbDataSts: TDBDateEdit;
    RxLabel9: TRxLabel;
    pgAberto: TDCPage;
    RxLabel10: TRxLabel;
    RxLabel11: TRxLabel;
    RxLabel12: TRxLabel;
    RxLabel14: TRxLabel;
    RxLabel16: TRxLabel;
    RxLabel17: TRxLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText6: TDBText;
    RxLabel18: TRxLabel;
    DBText7: TDBText;
    DBText9: TDBText;
    RxLabel20: TRxLabel;
    dbDataPagto: TDBDateEdit;
    RxLabel21: TRxLabel;
    RxSplitter5: TRxSplitter;
    RxSplitter6: TRxSplitter;
    RxSplitter7: TRxSplitter;
    dbDataStsBaixa: TDBDateEdit;
    RxLabel22: TRxLabel;
    RxSplitter8: TRxSplitter;
    pgCancel: TDCPage;
    outVendaOutlookList3: TfcOutlookList;
    outVendaCancel: TfcShapeBtn;
    RxLabel24: TRxLabel;
    DBText10: TDBText;
    DBText11: TDBText;
    RxLabel25: TRxLabel;
    RxLabel26: TRxLabel;
    DBText12: TDBText;
    DBText13: TDBText;
    RxLabel27: TRxLabel;
    RxSplitter9: TRxSplitter;
    RxLabel28: TRxLabel;
    DBText14: TDBText;
    RxSplitter10: TRxSplitter;
    RxLabel29: TRxLabel;
    DBText16: TDBText;
    DBText17: TDBText;
    RxLabel30: TRxLabel;
    RxLabel31: TRxLabel;
    dbDataStsCancel: TDBDateEdit;
    RxLabel33: TRxLabel;
    RxSplitter12: TRxSplitter;
    RxSplitter13: TRxSplitter;
    RxLabel35: TRxLabel;
    lookMotivo: TRxDBLookupCombo;
    RxLabel38: TRxLabel;
    DBText8: TDBText;
    outVisu: TfcOutlookList;
    outVendaVisu: TfcShapeBtn;
    dbObs: TDBMemo;
    dbObsBaixa: TDBMemo;
    dbObsCancel: TDBMemo;
    pgVisu: TDCPage;
    RxLabel23: TRxLabel;
    RxLabel32: TRxLabel;
    RxSplitter11: TRxSplitter;
    RxLabel34: TRxLabel;
    RxSplitter14: TRxSplitter;
    RxLabel36: TRxLabel;
    RxLabel37: TRxLabel;
    RxLabel39: TRxLabel;
    RxLabel40: TRxLabel;
    RxLabel41: TRxLabel;
    RxLabel42: TRxLabel;
    RxLabel43: TRxLabel;
    DBMemo1: TDBMemo;
    RxLabel44: TRxLabel;
    RxSplitter15: TRxSplitter;
    DBText5: TDBText;
    DBText15: TDBText;
    DBText18: TDBText;
    DBText19: TDBText;
    DBText20: TDBText;
    DBText21: TDBText;
    DBText22: TDBText;
    DBText23: TDBText;
    DBText24: TDBText;
    DBText25: TDBText;
    lookPlano: TRxDBLookupCombo;
    btnGravar: TfcImageBtn;
    btnAlterar: TfcImageBtn;
    btnExcluir: TfcImageBtn;
    EvUserAccess1: TEvUserAccess;
    dbTitular: TDBEdit;
    procedure outVendaOutlookList2Items0Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure outInserirItems0Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure outInserirItems1Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure outInserirItems2Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure outVendaOutlookList1Items0Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure outVendaOutlookList1Items1Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure outVendaOutlookList1Items2Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure outVendaInserirClick(Sender: TObject);
    procedure outVendaAbertoClick(Sender: TObject);
    procedure outVendaCancelClick(Sender: TObject);
    procedure outBaixaItems3Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure lookVendExit(Sender: TObject);
    procedure outVendaOutlookList3Items1Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure outVendaOutlookList3Items0Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure outVendaOutlookList3Items2Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure outVendaVisuClick(Sender: TObject);
    procedure outVisuItems3Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure outVisuItems2Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure outVisuItems1Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure outVisuItems0Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure dbTitularExit(Sender: TObject);
    procedure dbNumeroExit(Sender: TObject);
    procedure dbDataVenExit(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure dbDataStsEnter(Sender: TObject);
    procedure outInserirItems3Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVenda: TfrmVenda;
  novoItem, Incluir:boolean;

implementation

uses UnitDmdados, unitLocVenda, UnitPrincipal;

{$R *.dfm}

procedure TfrmVenda.outVendaOutlookList2Items0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
close;
end;

procedure TfrmVenda.outInserirItems0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
outInserir.Items[0].Selected:=true;
outInserir.Items[1].Selected:=false;
outInserir.Items[2].Selected:=false;
dmdados.tbVenda.Append;
Incluir:=True;
novoItem:=true;
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

procedure TfrmVenda.outInserirItems1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
Var
  Campos:String;
  Vazio,Gravar,Flag:Boolean;
  x:Integer;

begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  Incluir:=False;
if novoitem then
begin

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
    end;

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
novoItem:=false;
outInserir.Items[0].Selected:=false;
outInserir.Items[1].Selected:=true;
outInserir.Items[2].Selected:=false;
dmdados.tbVendaDataSts.Value:=date;
dmdados.tbVendaAvista.Value:=((dmdados.tbVendaValor.Value*(dmdados.tbVendaComissao.Value/100))/2);
dmdados.tbVendaAreceber.Value:=((dmdados.tbVendaValor.Value*(dmdados.tbVendaComissao.Value/100))*0.3);
dmdados.tbVendaStatus.Value:='Lan�ado';
dmdados.tbVendaNumVerif.Value:=1;
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
ShowMessage('Venda gravada com sucesso');
end
else
  begin
  If Vazio Then
      ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
    dbDataVen.SetFocus;
   end;
end;
end;

procedure TfrmVenda.outInserirItems2Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
novoItem:=false;
outInserir.Items[0].Selected:=false;
outInserir.Items[1].Selected:=false;
outInserir.Items[2].Selected:=true;
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
end;

procedure TfrmVenda.outVendaOutlookList1Items0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
novoitem:=true;
outAberto.Items[0].Selected:=true;
outAberto.Items[1].Selected:=false;
outAberto.Items[2].Selected:=false;
dmdados.tbVenda.Edit;
dbDataStsBaixa.Enabled:=true;
dbDataPagto.Enabled:=true;
dbObsBaixa.Enabled:=true;
dbDataStsBaixa.SetFocus;
end;

procedure TfrmVenda.outVendaOutlookList1Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
if novoitem then
 begin
 novoItem:=false;
 outAberto.Items[0].Selected:=false;
 outAberto.Items[1].Selected:=true;
 outAberto.Items[2].Selected:=false;
 dmdados.tbVendaNumVerif.Value:=dmdados.tbVendaNumVerif.Value+1;
 dmdados.tbVendaStatus.Value:='Aberto';
 dmdados.tbVenda.Post;
 dbDataStsBaixa.Enabled:=false;
 dbDataPagto.Enabled:=false;
 dbObsBaixa.Enabled:=false;
 ShowMessage('Verifica��o efetuada com sucesso');
 end;
end;

procedure TfrmVenda.outVendaOutlookList1Items2Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
novoitem:=false;
outAberto.Items[0].Selected:=false;
outAberto.Items[1].Selected:=false;
outAberto.Items[2].Selected:=true;
dmdados.tbVenda.Cancel;
dbDataStsBaixa.Enabled:=false;
dbDataPagto.Enabled:=false;
dbObsBaixa.Enabled:=false;
end;

procedure TfrmVenda.outVendaInserirClick(Sender: TObject);
begin
pgcVendas.ActivePage:=pgInserir;
end;

procedure TfrmVenda.outVendaAbertoClick(Sender: TObject);
begin
pgcVendas.ActivePage:=pgAberto;
end;

procedure TfrmVenda.outVendaCancelClick(Sender: TObject);
begin
  pgcVendas.ActivePage:=pgCancel;
end;

procedure TfrmVenda.outBaixaItems3Click(OutlookList: TfcCustomOutlookList;
  Item: TfcOutlookListItem);
begin
frmLocVenda:=tfrmLocVenda.create(application);
frmLocVenda.showModal;
end;

procedure TfrmVenda.lookVendExit(Sender: TObject);
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

procedure TfrmVenda.outVendaOutlookList3Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
frmLocVenda:=tfrmLocVenda.create(application);
frmLocVenda.showModal;
end;

procedure TfrmVenda.outVendaOutlookList3Items0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
if (DMdados.tbVenda.State=dsedit) then
begin
 novoitem:=false;
 dmdados.tbVendaStatus.Value:='Cancelado';
 dmdados.tbVenda.Post;
 dbDataStsCancel.Enabled:=false;
 lookMotivo.Enabled:=false;
 dbObsCancel.Enabled:=false;
 ShowMessage('Cancelamento efetuado com sucesso');
end;
end;

procedure TfrmVenda.outVendaOutlookList3Items2Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
novoitem:=true;
dmdados.tbVenda.Edit;
dbDataStsCancel.Enabled:=true;
lookMotivo.Enabled:=true;
dbObsCancel.Enabled:=true;
dbDataStsCancel.SetFocus;
end;

procedure TfrmVenda.outVendaVisuClick(Sender: TObject);
begin
pgcVendas.ActivePage:=pgVisu;
end;

procedure TfrmVenda.outVisuItems3Click(OutlookList: TfcCustomOutlookList;
  Item: TfcOutlookListItem);
begin
DMDados.TbVenda.Last;
end;

procedure TfrmVenda.outVisuItems2Click(OutlookList: TfcCustomOutlookList;
  Item: TfcOutlookListItem);
begin
DMDados.TbVenda.Next;
if dmdados.tbVenda.Eof then
  ShowMessage('Final da tabela');
end;

procedure TfrmVenda.outVisuItems1Click(OutlookList: TfcCustomOutlookList;
  Item: TfcOutlookListItem);
begin
DMDados.TbVenda.Prior;
if dmdados.tbVenda.Bof then
   ShowMessage('In�cio da tabela');
end;

procedure TfrmVenda.outVisuItems0Click(OutlookList: TfcCustomOutlookList;
  Item: TfcOutlookListItem);
begin
DMDados.TbVenda.First;
end;

procedure TfrmVenda.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
  Begin
  Key:=#0;
  Perform(wm_nextdlgctl,0,0);
  End;
end;

procedure TfrmVenda.FormShow(Sender: TObject);
begin
  novoitem:=false;
  Incluir:=False;
  OutVenda.ActivePage:= outvendainserir;
  pgcvendas.ActivePage:=pginserir;
end;

procedure TfrmVenda.dbTitularExit(Sender: TObject);
begin
if NovoItem then
 begin
  if dbtitular.Text='' then
     begin
     ShowMessage('Obrigat�rio informar o Titular');
     dbtitular.SetFocus;
     end;
 end;
end;

procedure TfrmVenda.dbNumeroExit(Sender: TObject);
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

procedure TfrmVenda.dbDataVenExit(Sender: TObject);
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

procedure TfrmVenda.btnAlterarClick(Sender: TObject);
begin
dmdados.tbVenda.Edit;
novoItem:=true;
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

procedure TfrmVenda.btnGravarClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar,Flag:Boolean;
  x:Integer;
begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;

if novoitem then
begin
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
    end;

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
novoItem:=false;
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
ShowMessage('Venda alterada com sucesso');
end
else
  begin
  If Vazio Then
      ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
    dbDataVen.SetFocus;
    end;
end;
end;

procedure TfrmVenda.FormActivate(Sender: TObject);
begin
if frmPrincipal.acesso='PARCIAL' then
    EvUserAccess1.UserID := 0
  else if frmPrincipal.acesso='TOTAL' then
    EvUserAccess1.UserID := 1;
end;

procedure TfrmVenda.btnExcluirClick(Sender: TObject);
begin
if dmdados.tbVenda.RecordCount=0 then
   begin
   ShowMessage('Tabela vazia');
   end
else
   begin
   If application.MessageBox('Tem certeza que deseja excluir esse registro?','ATEN��O', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
      dmdados.tbVenda.Delete
   else
      dmdados.tbVenda.Cancel;
   end;
end;

procedure TfrmVenda.dbDataStsEnter(Sender: TObject);
begin
  if Incluir Then
    dbDataVen.Text:=dbDataVen.Text;
end;

procedure TfrmVenda.outInserirItems3Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
frmLocVenda:=tfrmLocVenda.create(application);
frmLocVenda.showModal;
end;
end.

//////////////////////////////////////////////////////////////////////////
// Criacao...........: 07/2002
// Sistema...........: Controle de Vendas - Unimed
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitLocVenda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CurrEdit, RXDBCtrl, ToolEdit, RXSplit, fcButton, fcImgBtn, Grids,
  DBGrids, StdCtrls, DBCtrls, Mask, ExtCtrls, RXCtrls, RackCtls, jpeg, DBTables, DB,
  EnhEdit, LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint,
  LMDShapeHint, EFocCol, RxGrdCpt;

type
  TfrmLocVenda = class(TForm)
    Panel1: TPanel;
    fclSair: TfcImageBtn;
    EdtValor: TEdit;
    EdtCampo: TEdit;
    fclLocVen: TfcImageBtn;
    Cmbcampo: TComboBox;
    RxDBGrid1: TRxDBGrid;
    Panel3: TPanel;
    Image3: TImage;
    RxLabel4: TRxLabel;
    Image2: TImage;
    RxGradientCaption2: TRxGradientCaption;
    Image1: TImage;
    RxLabel3: TRxLabel;
    RxLabel1: TRxLabel;
    LEDButton1: TLEDButton;
    LEDButton2: TLEDButton;
    RxLabel7: TRxLabel;
    RxLabel2: TRxLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValorExit(Sender: TObject);
    procedure fclSairClick(Sender: TObject);
    procedure CmbcampoExit(Sender: TObject);
    procedure fclLocVenClick(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
              AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LEDButton1DblClick(Sender: TObject);
    procedure LEDButton2DblClick(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  frmLocVenda: TfrmLocVenda;
  LocOpts : TLocateOptions;
  cor,PorNumero,PorCod,PorTitular : boolean;
  NumeroTab, TitularTab : String;
  CodTab : LongInt;
  VerTipo : Char;

implementation

uses UnitDmdados, unitPrincipal ;

{$R *.DFM}

procedure TfrmLocVenda.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TfrmLocVenda.EdtValorExit(Sender: TObject);
begin
  fclLocVen.Default:= True;
  fclLocVen.SetFocus;
end;

procedure TfrmLocVenda.fclSairClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmLocVenda.CmbcampoExit(Sender: TObject);
begin
  PorNumero:=False;
  PorTitular:=false;
  if cmbcampo.text = 'N�mero' then
    Begin
    VerTipo:='K';
    PorNumero:=True;
    edtCampo.Text:='NumVenda';
    dmdados.tbVenda.IndexName:='iNumVenda';
    End;
  if cmbcampo.text = 'Titular' then
    Begin
    VerTipo:='K';
    PorTitular:=True;
    edtCampo.Text:='Titular';
    dmdados.tbVenda.IndexName:='iTitular';
    End
end;

procedure TfrmLocVenda.fclLocVenClick(Sender: TObject);
begin
{verificando se dado digitado corresponde ao tipo}
  if (vertipo='I') and (StrToIntDef(edtvalor.text,-1)= -1) then
    begin
    ShowMessage('Valor digitado deve ser num�rico');
    edtvalor.SetFocus;
    abort;
    end;
    
  fclLocVen.Default:= False;
  LocOpts:=[];
  if LEDButton1.StateOn then
    LocOpts:=LocOpts+[loPartialKey];
  if LEDButton2.StateOn then
    LocOpts:=LocOpts+[loCaseInsensitive];
  If not dmdados.tbVenda.locate(edtCampo.Text,edtValor.text,LocOpts) Then
    begin
    ShowMessage ('N�o foi encontrado o valor ' + edtValor.text + ' para o campo '+ cmbCampo.text);
    end
  else
    Begin
    cor := true;
    If PorNumero Then
      NumeroTab:=dmDados.tbVendaNumVenda.Value;
    If PorTitular Then
      TitularTab:=dmDados.tbVendaTitular.Value;
    End;
  Cmbcampo.SetFocus;
end;

procedure TfrmLocVenda.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  Numero,titular : string;
  Codigo : longInt;
begin
  Numero  := (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('NumVenda').asString;
  Codigo  := (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('CodVen').asInteger;
  Titular := (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('Titular').asString;
  if cor then
    begin
    If PorNumero Then
      If Numero = NumeroTab Then
        background:=$00D2E2FF;
    If PorCod Then
      If CODIGO = CodTab Then
        background:=$00D2E2FF;
    If PorTitular Then
      If Titular = TitularTab Then
        background:=$00D2E2FF;
    end;
end;

procedure TfrmLocVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_ESCAPE then
    fclSair.Click;
  if Key=VK_PRIOR then
    LEDButton1DblClick(Sender);
  if Key=VK_NEXT then
    LEDButton2DblClick(Sender);
end;

procedure TfrmLocVenda.FormShow(Sender: TObject);
begin
  frmPrincipal.StatusTeclas(True,'[PageUp] A=ABC [PageDown] A=a [F2] Localizar [ESC] Sai');

  LocOpts:=[];
  edtCampo.Text:='NumVenda';
  VerTipo:='K';
  dmdados.tbVenda.IndexName:='iNumVenda';
end;

procedure TfrmLocVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.StatusTeclas(False,'');
  dmdados.tbVenda.IndexName:='iDataVenda';
end;

procedure TfrmLocVenda.LEDButton1DblClick(Sender: TObject);
begin
  if LEDButton1.StateOn then
    LEDButton1.StateOn:=False
  else
    LEDButton1.StateOn:=True;
end;

procedure TfrmLocVenda.LEDButton2DblClick(Sender: TObject);
begin
if LEDButton2.StateOn then
    LEDButton2.StateOn:=False
  else
    LEDButton2.StateOn:=True;
end;

end.

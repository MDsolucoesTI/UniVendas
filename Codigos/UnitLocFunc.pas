//////////////////////////////////////////////////////////////////////////
// Criacao...........: 07/2002
// Sistema...........: Controle de Vendas - Unimed
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitLocFunc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jpeg, Grids, DBGrids, RXDBCtrl, StdCtrls, ExtCtrls, RackCtls, fcButton,
  fcImgBtn, RXCtrls, db, LMDCustomComponent, LMDCustomHint,
  LMDCustomShapeHint, LMDShapeHint, RxGrdCpt;

type
  TFrmLocVend = class(TForm)
    Panel1: TPanel;
    fclSair: TfcImageBtn;
    edtvalor: TEdit;
    EdtCampo: TEdit;
    fclLocFunc: TfcImageBtn;
    cmbcampo: TComboBox;
    RxDBGrid1: TRxDBGrid;
    Panel3: TPanel;
    Image3: TImage;
    RxLabel4: TRxLabel;
    Image2: TImage;
    RxGradientCaption2: TRxGradientCaption;
    Image1: TImage;
    LEDButton1: TLEDButton;
    LEDButton2: TLEDButton;
    RxLabel7: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel1: TRxLabel;
    RxLabel3: TRxLabel;
    procedure fclSairClick(Sender: TObject);
    procedure LEDButton2Click(Sender: TObject);
    procedure cmbcampoExit(Sender: TObject);
    procedure edtvalorExit(Sender: TObject);
    procedure fclLocFuncClick(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
        AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LEDButton1DblClick(Sender: TObject);
    procedure LEDButton2DblClick(Sender: TObject);
  private
    { Private declarations }
    fresultado : longint;
  public
    { Public declarations }
    Property Resultado:longint Read Fresultado Write Fresultado;
  end;

var
  FrmLocVend: TFrmLocVend;
  LocOpts : TLocateOptions;
  cor,PorNome,PorCod : boolean;
  NomeTab : String;
  CodTab : LongInt;
  vertipo :char;

implementation

uses UnitDmDados, unitPrincipal;

{$R *.DFM}

procedure TFrmLocVend.fclSairClick(Sender: TObject);
begin
  resultado:=dmdados.tbVendedorCodVend.Value;
  Close;
end;

procedure TFrmLocVend.LEDButton2Click(Sender: TObject);
begin
  if LEDButton2.StateOn then
    LEDButton2.StateOn:=False
  else
    LEDButton2.StateOn:=True;
end;

procedure TFrmLocVend.cmbcampoExit(Sender: TObject);
begin
  PorNome:=False;
  PorCod:=False;
  if cmbCampo.Text = 'C�digo' Then
    Begin
    vertipo:='I';
    PorCod:=True;
    edtCampo.Text:='CodVend';
    End
  Else if cmbcampo.text = 'Nome' then
    Begin
    vertipo:='K';
    PorNome:=True;
    edtCampo.Text:='Nome';
    End;
end;

procedure TFrmLocVend.edtvalorExit(Sender: TObject);
begin
  fclLocFunc.Default:= True;
  fclLocFunc.SetFocus;
end;

procedure TFrmLocVend.fclLocFuncClick(Sender: TObject);
begin
  {verificando se dado digitado corresponde ao tipo}
  if (vertipo='I') and (StrToIntDef(edtvalor.text,-1)= -1) then
    begin
     ShowMessage('Valor digitado deve ser num�rico');
     edtvalor.SetFocus;
     abort;
    end;
    
  fclLocFunc.Default:= False;
  LocOpts:=[];
  if LEDButton1.StateOn then
    LocOpts:=LocOpts+[loPartialKey];
  if LEDButton2.StateOn then
    LocOpts:=LocOpts+[loCaseInsensitive];
  If not dmdados.TbVendedor.locate(edtCampo.Text, edtValor.text,LocOpts) Then
    begin
    ShowMessage ('N�o foi encontrado o valor ' + edtValor.text + ' para o campo '+ cmbCampo.text);
    end
  else
    Begin
    cor := true;
    If PorNome Then
      NomeTab:=dmDados.tbVendedorNome.Value;
    If PorCod Then
      CodTab:=dmDados.tbVendedorCodVend.Value;
    End;
  cmbCampo.SetFocus;
end;

procedure TFrmLocVend.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  NOME : string;
  CODIGO : longInt;
begin
  NOME   :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('Nome').asString;
  CODIGO :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('CodVend').asInteger;
  if cor then
    If PorNome Then
      If NOME = NomeTab Then
        background:=$00D2E2FF;
    If PorCod Then
      If CODIGO = CodTab Then
        background:=$00D2E2FF;
end;

procedure TFrmLocVend.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmLocVend.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_ESCAPE then
    fclSair.Click;
  if Key=VK_PRIOR then
    LEDButton1DblClick(Sender);
  if Key=VK_NEXT then
    LEDButton2DblClick(Sender);
end;

procedure TFrmLocVend.FormShow(Sender: TObject);
begin
  frmPrincipal.StatusTeclas(True,'[PageUp] A=ABC [PageDown] A=a [F2] Localizar [ESC] Sai');

  LocOpts:=[];
  edtcampo.Text:='CodVend';
  VerTipo:='I';

end;

procedure TFrmLocVend.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPrincipal.StatusTeclas(False,'');
end;

procedure TFrmLocVend.LEDButton1DblClick(Sender: TObject);
begin
  if LEDButton1.StateOn then
    LEDButton1.StateOn:=False
  else
    LEDButton1.StateOn:=True;
end;

procedure TFrmLocVend.LEDButton2DblClick(Sender: TObject);
begin
  if LEDButton2.StateOn then
    LEDButton2.StateOn:=False
  else
    LEDButton2.StateOn:=True;
end;

end.

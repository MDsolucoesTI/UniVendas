//////////////////////////////////////////////////////////////////////////
// Criacao...........: 07/2002
// Sistema...........: Controle de Vendas - Unimed
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitRelMotCancel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, ToolEdit, RXSplit, fcButton, fcImgBtn, RXCtrls,
  SpeedBar, jpeg, DBCtrls, LMDCustomComponent, LMDCustomHint,
  LMDCustomShapeHint, LMDShapeHint, DCChoice, RxGrdCpt;

type
  TFrmRelCodMotCancel = class(TForm)
    Panel1: TPanel;
    RxLabel5: TRxLabel;
    fclGravar: TfcImageBtn;
    RxLabel4: TRxLabel;
    cmbClassif: TComboBox;
    cmbDestino: TDCComboBox;
    Panel2: TPanel;
    Image2: TImage;
    btnImprimir: TfcImageBtn;
    btnSair: TfcImageBtn;
    Panel3: TPanel;
    Image3: TImage;
    Image4: TImage;
    RxLabel1: TRxLabel;
    RxGradientCaption1: TRxGradientCaption;
    Image1: TImage;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnimprimirClick(Sender: TObject);
    procedure cmbClassifChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure cmbDestinoExit(Sender: TObject);
    procedure cmbDestinoCloseUp(Sender: TObject);
    procedure cmbDestinoChange(Sender: TObject);
    procedure fcImageBtn1Click(Sender: TObject);
    procedure fcImageBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelCodMotCancel: TFrmRelCodMotCancel;

implementation

uses UnitQRCliente, unitDmDados, UnitPrincipal, unitQrMotCancel;


{$R *.DFM}

procedure TFrmRelCodMotCancel.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;

procedure TFrmRelCodMotCancel.BtnSairClick(Sender: TObject);
begin
	Close;
end;

procedure TFrmRelCodMotCancel.BtnimprimirClick(Sender: TObject);
begin
QrCodMotCancel:= TQrCodMotCancel.Create(application);
If cmbDestino.Text= 'V�deo' Then
	QrCodMotCancel.QuickRep1.Preview
else
	QrCodMotCancel.QuickRep1.Print;

QrCodMotCancel.Free;
end;

procedure TFrmRelCodMotCancel.cmbClassifChange(Sender: TObject);
begin
If cmbClassif.Text= 'C�digo' Then
	dmdados.tbMotCancel.IndexFieldNames:= 'CodMotCancel'
Else
	dmdados.tbMotCancel.IndexFieldNames:= 'Motivo';
end;

procedure TFrmRelCodMotCancel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  action:=cafree;
end;

procedure TFrmRelCodMotCancel.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_F7    : Btnimprimir.Click;
      VK_ESCAPE : if dmDados.vTabStt then BtnSair.Click;
    end;
end;

procedure TFrmRelCodMotCancel.FormShow(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,'[F7] Imprimir [Esc] Cancelar ou Sair');
end;

procedure TFrmRelCodMotCancel.cmbDestinoExit(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
 If cmbDestino.Text= '' then
      Begin
      ShowMessage('� obrigat�rio informar o destino do relat�rio');
      cmbDestino.SetFocus;
      End
   Else
      Begin
      Flag:=True;
      For x:=0 to cmbDestino.Items.Count-1 Do
        If cmbDestino.Text=cmbDestino.Items[x] Then
          Flag:=False;
      If Flag Then
        Begin
        ShowMessage('Valor inv�lido');
        cmbDestino.clear;
        cmbDestino.SetFocus;
        End
      else
        begin
        Panel2.SetFocus;
        btnImprimir.Enabled:=true;
        end;
      end;
end;

procedure TFrmRelCodMotCancel.cmbDestinoCloseUp(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
 If cmbDestino.Text= '' then
      Begin
      ShowMessage('� obrigat�rio informar o destino do relat�rio');
      cmbDestino.SetFocus;
      End
   Else
      Begin
      Flag:=True;
      For x:=0 to cmbDestino.Items.Count-1 Do
        If cmbDestino.Text=cmbDestino.Items[x] Then
          Flag:=False;
      If Flag Then
        Begin
        ShowMessage('Valor inv�lido');
        cmbDestino.clear;
        cmbDestino.SetFocus;
        End
      else
        begin
        Panel2.SetFocus;
        btnImprimir.Enabled:=true;
        end;
      end;
end;

procedure TFrmRelCodMotCancel.cmbDestinoChange(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
 If cmbDestino.Text= '' then
      Begin
      ShowMessage('� obrigat�rio informar o destino do relat�rio');
      cmbDestino.SetFocus;
      End
   Else
      Begin
      Flag:=True;
      For x:=0 to cmbDestino.Items.Count-1 Do
        If cmbDestino.Text=cmbDestino.Items[x] Then
          Flag:=False;
      If Flag Then
        Begin
        ShowMessage('Valor inv�lido');
        cmbDestino.clear;
        cmbDestino.SetFocus;
        End
      else
        begin
        Panel2.SetFocus;
        btnImprimir.Enabled:=true;
        end;
      end;
end;

procedure TFrmRelCodMotCancel.fcImageBtn1Click(Sender: TObject);
begin
QrCodMotCancel:= TQrCodMotCancel.Create(application);
If cmbDestino.Text= 'V�deo' Then
	QrCodMotCancel.QuickRep1.Preview
else
	QrCodMotCancel.QuickRep1.Print;

QrCodMotCancel.Free;
end;

procedure TFrmRelCodMotCancel.fcImageBtn2Click(Sender: TObject);
begin
  Close;
end;

end.

//////////////////////////////////////////////////////////////////////////
// Criacao...........: 07/2002
// Sistema...........: Controle de Vendas - Unimed
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitCancelar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, RxGrdCpt, fcButton, fcImgBtn, RXCtrls,
  ExtCtrls, RxLookup, ToolEdit, RXDBCtrl;

type
  TFrmCancelar = class(TForm)
    Panel1: TPanel;
    Image4: TImage;
    RxLabel12: TRxLabel;
    Panel2: TPanel;
    Image2: TImage;
    btnGravar: TfcImageBtn;
    btnSair: TfcImageBtn;
    Panel3: TPanel;
    Image3: TImage;
    Image1: TImage;
    RxLabel15: TRxLabel;
    RxGradientCaption1: TRxGradientCaption;
    lookMotivo: TRxDBLookupCombo;
    dbDataSts: TDBDateEdit;
    RxLabel9: TRxLabel;
    RxLabel10: TRxLabel;
    dbObs: TDBMemo;
    procedure btnSairClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCancelar: TFrmCancelar;

implementation

uses UnitDmdados, UnitPrincipal;

{$R *.dfm}

procedure TFrmCancelar.btnSairClick(Sender: TObject);
begin
  dmdados.tbVenda.Cancel;
  Close;
end;

procedure TFrmCancelar.btnGravarClick(Sender: TObject);
begin
  dmdados.tbVendaStatus.Value:='Cancelado';
  dmdados.tbVenda.Post;
  ShowMessage('Cancelamento efetuado com sucesso');
  Close;
end;

procedure TFrmCancelar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmDados.HabilitaTeclado:=True;
  Action:=caFree;
end;

procedure TFrmCancelar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_End    : if (dmDados.vTabStt) then BtnGravar.Click;
      VK_ESCAPE : if (dmDados.vTabStt) then btnSair.Click;
    end;
end;

procedure TFrmCancelar.FormShow(Sender: TObject);
begin
  dmDados.vTabStt:=True;
  dmDados.HabilitaTeclado:=True;
  FrmPrincipal.StatusTeclas(True,'[End] Gravar [Esc] Sair');
end;

procedure TFrmCancelar.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

end.

//////////////////////////////////////////////////////////////////////////
// Criacao...........: 07/2002
// Sistema...........: Controle de Vendas - Unimed
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitAberto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, RxGrdCpt, fcButton, fcImgBtn, RXCtrls,
  ExtCtrls, RxLookup, ToolEdit, RXDBCtrl;

type
  TFrmAberto = class(TForm)
    Panel1: TPanel;
    Image4: TImage;
    Panel2: TPanel;
    Image2: TImage;
    btnGravar: TfcImageBtn;
    btnSair: TfcImageBtn;
    Panel3: TPanel;
    Image3: TImage;
    Image1: TImage;
    RxLabel15: TRxLabel;
    RxGradientCaption1: TRxGradientCaption;
    dbDataSts: TDBDateEdit;
    RxLabel9: TRxLabel;
    RxLabel10: TRxLabel;
    dbObs: TDBMemo;
    RxLabel20: TRxLabel;
    dbDataPagto: TDBDateEdit;
    procedure btnSairClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAberto: TFrmAberto;

implementation

uses UnitDmdados, UnitPrincipal;

{$R *.dfm}

procedure TFrmAberto.btnSairClick(Sender: TObject);
begin
  dmdados.tbVenda.Cancel;
  Close;
end;

procedure TFrmAberto.btnGravarClick(Sender: TObject);
begin
  dmdados.tbVendaNumVerif.Value:=dmdados.tbVendaNumVerif.Value+1;
  dmdados.tbVendaStatus.Value:='Aberto';
  dmdados.tbVenda.Post;
  ShowMessage('Verifica��o efetuada com sucesso');
  Close;
end;

procedure TFrmAberto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmDados.HabilitaTeclado:=True;
  Action:=caFree;
end;

procedure TFrmAberto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_End    : if (dmDados.vTabStt) then BtnGravar.Click;
      VK_ESCAPE : if (dmDados.vTabStt) then btnSair.Click;
    end;
end;

procedure TFrmAberto.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
  Begin
  Key:=#0;
  Perform(wm_nextdlgctl,0,0);
  End;
end;

procedure TFrmAberto.FormShow(Sender: TObject);
begin
dmDados.vTabStt:=True;
dmDados.HabilitaTeclado:=True;
FrmPrincipal.StatusTeclas(True,'[End] Gravar [Esc] Sair');
end;

end.

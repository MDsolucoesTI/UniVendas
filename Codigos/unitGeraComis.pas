//////////////////////////////////////////////////////////////////////////
// Criacao...........: 07/2002
// Sistema...........: Controle de Vendas - Unimed
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitGeraComis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, jpeg, ExtCtrls, RXCtrls, RackCtls,
  SpeedBar, Grids, DBGrids, fcButton, fcImgBtn, RxGrdCpt;

type
  TfrmGeraComis = class(TForm)
    Panel1: TPanel;
    dataInicio: TDateEdit;
    dataFinal: TDateEdit;
    Panel2: TPanel;
    Image2: TImage;
    btnGerar: TfcImageBtn;
    btnSair: TfcImageBtn;
    Panel3: TPanel;
    Image3: TImage;
    Image1: TImage;
    RxLabel15: TRxLabel;
    Image4: TImage;
    RxLabel12: TRxLabel;
    RxLabel1: TRxLabel;
    RxGradientCaption1: TRxGradientCaption;
    procedure btnGerarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dataFinalExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure dataInicioExit(Sender: TObject);
    procedure fcImageBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeraComis: TfrmGeraComis;

implementation

uses UnitDmdados, UnitPrincipal;

{$R *.dfm}

procedure TfrmGeraComis.btnGerarClick(Sender: TObject);
var
   ano,mes,dia : word;
   campos,mesComis,anoComis : string;
   VlComiss : real;
begin
  campos:='';
  try
    StrToDate(dataInicio.Text);
  except on EConvertError do
   Campos:=Campos+'DATA INICIAL';
  end;
  Try
    StrToDate(dataFinal.Text);
  except on EConvertError do
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'DATA FINAL';
    end;
  end;
  If Length(Campos)>0 then
    ShowMessage('O(s) campo(s) '+campos+' s�o inv�lidos')
  else
    begin
    //registrar comiss�o
    dmdados.tbVendorCom.Filtered:=False;
    dmdados.tbVendorCom.First;
    while not dmdados.tbVendorCom.Eof do
      begin
      dmdados.tbVenda.IndexName:='iDataVenda';
      dmdados.tbVenda.Filtered:=false;
      dmdados.tbVenda.Filter:='(DataSts >= '''+dataInicio.Text+''')and '+
                              '(DataSts <= '''+dataFinal.Text+''')and'+
                              '(CodVend= '''+dmdados.tbVendorComCodVend.AsString+''')';
      dmdados.tbVenda.Filtered:=true;
      //gravar comis
      decodedate(dataFinal.Date,ano,mes,dia);
      mesComis:=IntToStr(mes);
      anoComis:=IntToStr(ano);
      if not dmdados.tbComis.Locate('CodVend;Mes;Ano',VarArrayOf([dmdados.tbVendorComCodVend.Value,mesComis,anoComis]),[]) then
        begin
        dmdados.tbcomis.append;
        dmdados.tbComisCodVend.Value:=dmdados.tbVendorComCodVend.Value;
        dmdados.tbComisMes.Value:=mesComis;
        dmdados.tbComisAno.Value:=anoComis;
        dmdados.tbComis.post;
        end;
      dmdados.tbVenda.First;
      VlComiss:=0;
      while not dmdados.tbVenda.Eof do
        begin
        if dmdados.tbVendaStatus.Value='Cancelado' then
          VlComiss:=VlComiss-dmdados.tbVendaAvista.Value;
        if (dmdados.tbVendaStatus.Value='Lan�ado') or (dmdados.tbVendaStatus.Value='Pago') then
          VlComiss:=VlComiss+dmdados.tbVendaAreceber.Value;
        if ((dmdados.tbVendaStatus.Value='Aberto')and(dmdados.tbVendaNumVerif.Value=5)) then
          VlComiss:=VlComiss-dmdados.tbVendaAvista.Value;
        dmdados.tbVenda.Next;
        end;
      dmdados.tbComis.Edit;
      dmdados.tbComisValor.Value:=VlComiss;
      dmdados.tbComis.Post;
      dmdados.tbVenda.Filtered:=False;
      dmdados.tbVenda.Refresh;
      dmdados.tbVendorCom.Next;
      end;

    // Fazer la�o para dar a baixa
    dmdados.tbVenda.filtered:=false;
    dmdados.tbVenda.filter:='(DataSts >= '''+dataInicio.Text+''')and '+
                            '(DataSts <= '''+dataFinal.Text+''')';
    dmdados.tbVenda.Filtered:=true;
    dmdados.tbVenda.First;
    while not dmdados.tbVenda.Eof do
      begin
      if dmdados.tbVendaStatus.Value='Lan�ado' then
        begin
        dmdados.tbVenda.Edit;
        dmdados.tbVendaStatus.Value:='Pago';
        dmdados.tbVenda.Post;
        end;
      if ((dmdados.tbVendaStatus.Value='Aberto')and(dmdados.tbVendaNumVerif.Value=5)) then
        begin
        dmdados.tbVenda.Edit;
        dmdados.tbVendaStatus.Value:='Cancelado';
        dmdados.tbVendaCodMotCancel.Value:=107;
        dmdados.tbVenda.Post;
        end;
      dmdados.tbVenda.Next;
      end;
    ShowMessage('Dados Gerados com Sucesso!!');
    btnGerar.Enabled:=false;
    dataInicio.Enabled:=false;
    dataFinal.Enabled:=false;
  end;
end;

procedure TfrmGeraComis.BtnSairClick(Sender: TObject);
begin
dmdados.tbVenda.Filtered:=false;
close;
end;

procedure TfrmGeraComis.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
  Begin
  Key:=#0;
  Perform(wm_nextdlgctl,0,0);
  End;
end;

procedure TfrmGeraComis.dataFinalExit(Sender: TObject);
begin
If dataFinal.Text= '  /  /    ' then
   Begin
   ShowMessage('� obrigat�rio a DATA FINAL');
   dataFinal.SetFocus;
   End
else
   begin
   try
     StrToDate(dataFinal.Text);
     except
     on EConvertError do
     begin
     ShowMessage ('Data Inv�lida');
     dataFinal.SetFocus;
     end;
end;
end;
end;

procedure TfrmGeraComis.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
FrmPrincipal.StatusTeclas(False,'');
dmDados.HabilitaTeclado:=True;
Action:= Cafree;
end;

procedure TfrmGeraComis.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_F8     : btnGerar.Click;
      VK_ESCAPE : BtnSair.Click
    end;
end;

procedure TfrmGeraComis.FormShow(Sender: TObject);
begin
 dmDados.vTabStt:=True;
 FrmPrincipal.StatusTeclas(True,'[F8] Gerar [Esc] Cancelar ou Sair');
end;

procedure TfrmGeraComis.dataInicioExit(Sender: TObject);
begin
If dataInicio.Text= '  /  /    ' then
   Begin
   ShowMessage('� obrigat�rio a DATA INICIAL');
   dataInicio.SetFocus;
   End
else
   begin
   try
     StrToDate(dataInicio.Text);
     except
     on EConvertError do
     begin
     ShowMessage ('Data Inv�lida');
     dataInicio.SetFocus;
     end;
   end;
   end;
end;

procedure TfrmGeraComis.fcImageBtn1Click(Sender: TObject);
begin
dmdados.tbVenda.Filtered:=false;
close;
end;

end.

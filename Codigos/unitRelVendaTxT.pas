//////////////////////////////////////////////////////////////////////////
// Criacao...........: 07/2002
// Sistema...........: Controle de Vendas - Unimed
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitRelVendaTxT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, ToolEdit, RXSplit, fcButton, fcImgBtn, RXCtrls,
  SpeedBar, jpeg, DBCtrls, LMDCustomComponent, LMDCustomHint,qrexport,
  LMDCustomShapeHint, LMDShapeHint, RxLookup, RXDBCtrl, DCChoice, RxGrdCpt;

type
  TFrmRelVendaTxT = class(TForm)
    Panel1: TPanel;
    RxLabel5: TRxLabel;
    fclGravar: TfcImageBtn;
    RxLabel4: TRxLabel;
    cmbClassif: TComboBox;
    RxLabel1: TRxLabel;
    edVendedor: TRxLookupEdit;
    Edit1: TEdit;
    RxLabel2: TRxLabel;
    RxLabel6: TRxLabel;
    dataInicial: TDateEdit;
    dataFinal: TDateEdit;
    cmbDestino: TDCComboBox;
    Panel2: TPanel;
    Image2: TImage;
    btnImprimir: TfcImageBtn;
    btnSair: TfcImageBtn;
    Panel3: TPanel;
    Image3: TImage;
    Image4: TImage;
    RxLabel7: TRxLabel;
    Image1: TImage;
    RxGradientCaption1: TRxGradientCaption;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnimprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure cmbDestinoExit(Sender: TObject);
    procedure cmbDestinoCloseUp(Sender: TObject);
    procedure edVendedorExit(Sender: TObject);
    procedure cmbClassifChange(Sender: TObject);
    procedure cmbDestinoChange(Sender: TObject);
    procedure edVendedorChange(Sender: TObject);
    procedure edVendedorCloseUp(Sender: TObject);
    procedure dataInicialExit(Sender: TObject);
    procedure dataFinalExit(Sender: TObject);
    function DiscoNoDrive(const drive : char): boolean;
    procedure fcImageBtn1Click(Sender: TObject);
    procedure fcImageBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelVendaTxT: TFrmRelVendaTxT;

implementation

uses unitDmDados, unitQrVenda, UnitPrincipal, unitQrComissao,
  unitQrVendaCancel, unitQrLancado, unitQrClassif, unitQrVendaTxT,
  unitQrComissaoTxT, unitQrVendaCancelTxt, unitQrLanacadoTxt,
  unitQrClassifTxT;


{$R *.DFM}

procedure TFrmRelVendaTxT.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;

procedure TFrmRelVendaTxT.BtnSairClick(Sender: TObject);
begin
	Close;
end;

procedure TFrmRelVendaTxT.BtnimprimirClick(Sender: TObject);
var
  ano,mes,dia : word;
  mesComis,anoComis : string;
begin
QrVendaTxT:=TQrVendaTxT.create(application);
QrComissaoTxt:=TQrComissaoTxt.create(application);

if cmbClassif.Text='Unimed' then
   begin
   QrVendaTxT.tbVenda.filtered:=false;
   QrVendaTxT.tbVenda.Filter:='(dataSts <='''+dataFinal.Text+''') and '+
                              '((Status = '''+'Lan�ado'+''')or'+
                              '(Status = '''+'Aberto'+'''))';
   QrVendaTxT.tbVenda.Filtered:=true;
   end;

if cmbClassif.Text='Comiss�o' then
   begin
   dmdados.tbRelVenda.Filtered:=false;
   dmdados.tbRelVenda.Filter:='(dataSts >='''+dataInicial.Text+''')and' +
                              '(dataSts <='''+dataFinal.Text+''')';
   dmdados.tbRelVenda.Filtered:=true;

   decodedate(dataFinal.Date,ano,mes,dia);
   mesComis:=IntToStr(mes);
   anoComis:=IntToStr(ano);
   QrComissaoTxT.table1.Filtered:=false;
   QrComissaoTxT.table1.Filter:='(Mes = '''+mesComis+''')and' +
                             '(Ano = '''+anoComis+''')';
   QrComissaoTxT.table1.Filtered:=True;
   QrComissaoTxT.DataIni.Caption:=dataInicial.Text;
   QrComissaoTxT.DataFim.Caption:=dataFinal.Text;
   end;

if cmbClassif.Text='Comiss�o por vendedor' then
   begin
   dmdados.tbRelVendedor.Filtered:=false;
   dmdados.tbRelVendedor.Filter:='(CodVend='''+edit1.Text+''')';
   dmdados.tbRelVendedor.Filtered:=true;

   dmdados.tbRelVenda.Filtered:=false;
   dmdados.tbRelVenda.Filter:='(dataSts >='''+dataInicial.Text+''')and' +
                              '(dataSts <='''+dataFinal.Text+''')';
   dmdados.tbRelVenda.Filtered:=true;

   decodedate(dataFinal.Date,ano,mes,dia);
   mesComis:=IntToStr(mes);
   anoComis:=IntToStr(ano);
   QrComissaoTxT.table1.Filtered:=false;
   QrComissaoTxT.table1.Filter:='(Mes = '''+mesComis+''')and' +
                             '(Ano = '''+anoComis+''')';
   QrComissaoTxT.table1.Filtered:=True;
   QrComissaoTxT.DataIni.Caption:=dataInicial.Text;
   QrComissaoTxT.DataFim.Caption:=dataFinal.Text;
   end;

//
If cmbDestino.Text= 'V�deo' Then
  begin
  if cmbClassif.Text='Unimed' then
    QRVendaTxT.rpVendaTxT.Preview;

  if (cmbClassif.Text='Comiss�o')then
    QrComissaoTxt.rpComissaoTxt.Preview;

  if (cmbClassif.Text='Comiss�o por vendedor') then
    QrComissaoTxt.rpComissaoTxt.Preview;
  end;
If cmbDestino.Text= 'Exportar' Then
  begin
  if cmbClassif.Text='Unimed' then
    QRVendaTxt.rpVendaTxT.ExportToFilter(TQRAsciiExportFilter.Create('C:\Unimed.txt'));

  if cmbClassif.Text='Comiss�o' then
    QrComissaoTxt.rpComissaoTxt.ExportToFilter(TQRAsciiExportFilter.Create('C:\ComissaoGeral.txt'));

  if cmbClassif.Text='Comiss�o por vendedor' then
    QrComissaoTxt.rpComissaoTxt.ExportToFilter(TQRAsciiExportFilter.Create('C:\ComissaoVend.txt'));

 end;
If cmbDestino.Text= 'Exportar Disquete' Then
  begin
  ShowMessage('Ensira um diso formatado na unidade A para prosseguir');
  while not DiscoNoDrive('a') do
    ShowMessage('� necess�rio um disco na Unidade A para prosseguir!!!');
  if cmbClassif.Text='Unimed' then
    QRVendaTxt.rpVendaTxT.ExportToFilter(TQRAsciiExportFilter.Create('A:\Unimed.txt'));

  if cmbClassif.Text='Comiss�o' then
    QrComissaoTxt.rpComissaoTxt.ExportToFilter(TQRAsciiExportFilter.Create('A:\ComissaoGeral.txt'));

  if cmbClassif.Text='Comiss�o por vendedor' then
    QrComissaoTxt.rpComissaoTxt.ExportToFilter(TQRAsciiExportFilter.Create('A:\ComissaoVend.txt'));

 end;
QRVendaTxt.Free;
QrComissaoTxt.Free;
dmdados.tbRelVendedor.Filtered:=false;
dmdados.tbVenda.filtered:=false;
dmdados.tbRelVenda.Filtered:=false;
Btnimprimir.Enabled:=False;
cmbClassif.SetFocus;
end;

procedure TFrmRelVendaTxT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  action:=cafree;
end;

procedure TFrmRelVendaTxT.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_F7     : if Btnimprimir.Enabled then Btnimprimir.Click;
      VK_ESCAPE : BtnSair.Click;
    end;
end;

procedure TFrmRelVendaTxT.FormShow(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,'[F7] Imprimir [Esc] Cancelar ou Sair');
end;

procedure TFrmRelVendaTxT.cmbDestinoExit(Sender: TObject);
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
        cmbDestino.SetFocus;
        End
      else
        begin
        Panel2.SetFocus;
        btnImprimir.Enabled:=true;
        end;
      end;
end;

procedure TFrmRelVendaTxT.cmbDestinoCloseUp(Sender: TObject);
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
        cmbDestino.SetFocus;
        End
      else
        begin
        Panel2.SetFocus;
        btnImprimir.Enabled:=true;
        end;
      end;
end;

procedure TFrmRelVendaTxT.edVendedorExit(Sender: TObject);
begin
  if edVendedor.Text=''then
    begin
    ShowMessage('Necess�rio informar o Nome do Vendedor');
    edVendedor.SetFocus;
    end
  else
    edit1.Text:=IntToStr(dmdados.tbRelVendedorCodVend.value);
end;

procedure TFrmRelVendaTxT.cmbClassifChange(Sender: TObject);
begin
if (cmbClassif.Text='Unimed') then
   begin
   edvendedor.Enabled:=false;
   dataInicial.Enabled:=True;
   dataFinal.Enabled:=True;
   end;
if (cmbClassif.Text='Comiss�o por vendedor') then
   begin
   edvendedor.Enabled:=true;
   dataInicial.Enabled:=True;
   dataFinal.Enabled:=True;
   end;

if (cmbClassif.Text='Comiss�o') then
   begin
   edvendedor.Enabled:=false;
   dataInicial.Enabled:=True;
   dataFinal.Enabled:=True;
   end;

end;
procedure TFrmRelVendaTxT.cmbDestinoChange(Sender: TObject);
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
        cmbDestino.SetFocus;
        End
      else
        begin
        Panel2.SetFocus;
        btnImprimir.Enabled:=true;
        end;
      end;
end;

procedure TFrmRelVendaTxT.edVendedorChange(Sender: TObject);
begin
  if edVendedor.Text<>''then
    edit1.Text:=IntToStr(dmdados.tbRelVendedorCodVend.value);
end;

procedure TFrmRelVendaTxT.edVendedorCloseUp(Sender: TObject);
begin
  if edVendedor.Text<>''then
    edit1.Text:=IntToStr(dmdados.tbRelVendedorCodVend.value);
end;

procedure TFrmRelVendaTxT.dataInicialExit(Sender: TObject);
begin
If dataInicial.Text= '  /  /    ' then
   Begin
   ShowMessage('� obrigat�rio a DATA INICIAL');
   dataInicial.SetFocus;
   End
else
   begin
   try
     StrToDate(dataInicial.Text);
     except
     on EConvertError do
     begin
     ShowMessage ('Data Inv�lida');
     dataInicial.SetFocus;
     end;
   end;
   end;
end;

procedure TFrmRelVendaTxT.dataFinalExit(Sender: TObject);
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

function TFrmRelVendaTxT.DiscoNoDrive(const drive : char): boolean;
{Detecta se h� disco no Drive}
var
  DriveNumero : byte;
  EMode : word;
begin
  EMode:=0;
  result := false;
  DriveNumero := ord(Drive);
  if DriveNumero >= ord('a') then
    begin
    dec(DriveNumero,$20);
    EMode := SetErrorMode(SEM_FAILCRITICALERRORS);
    end;
  try
    if DiskSize(DriveNumero-$40) = -1 then
      begin
      Result := False;
      end
    else
      begin
      Result := True;
      end;
  Except
    SetErrorMode(EMode);
  end;
end;

procedure TFrmRelVendaTxT.fcImageBtn1Click(Sender: TObject);
var
  ano,mes,dia : word;
  mesComis,anoComis : string;
begin
QrVendaTxT:=TQrVendaTxT.create(application);
QrComissaoTxt:=TQrComissaoTxt.create(application);

if cmbClassif.Text='Unimed' then
   begin
   QrVendaTxT.tbVenda.filtered:=false;
   QrVendaTxT.tbVenda.Filter:='(Status = '''+'Lan�ado'+''')or'+
                           '(Status = '''+'Aberto'+''')';
   QrVendaTxT.tbVenda.Filtered:=true;
   end;

if cmbClassif.Text='Comiss�o' then
   begin
   dmdados.tbRelVenda.Filtered:=false;
   dmdados.tbRelVenda.Filter:='(dataSts >='''+dataInicial.Text+''')and' +
                              '(dataSts <='''+dataFinal.Text+''')and '+
                              '(Status <> '''+'Aberto'+''')';
   dmdados.tbRelVenda.Filtered:=true;

   decodedate(dataFinal.Date,ano,mes,dia);
   mesComis:=IntToStr(mes);
   anoComis:=IntToStr(ano);
   QrComissaoTxT.table1.Filtered:=false;
   QrComissaoTxT.table1.Filter:='(Mes = '''+mesComis+''')and' +
                             '(Ano = '''+anoComis+''')';
   QrComissaoTxT.table1.Filtered:=True;
   QrComissaoTxT.DataIni.Caption:=dataInicial.Text;
   QrComissaoTxT.DataFim.Caption:=dataFinal.Text;
   end;

if cmbClassif.Text='Comiss�o por vendedor' then
   begin
   dmdados.tbRelVendedor.Filtered:=false;
   dmdados.tbRelVendedor.Filter:='(CodVend='''+edit1.Text+''')';
   dmdados.tbRelVendedor.Filtered:=true;

   dmdados.tbRelVenda.Filtered:=false;
   dmdados.tbRelVenda.Filter:='(dataSts >='''+dataInicial.Text+''')and' +
                              '(dataSts <='''+dataFinal.Text+''')and '+
                              '(Status <> '''+'Aberto'+''')';
   dmdados.tbRelVenda.Filtered:=true;

   decodedate(dataFinal.Date,ano,mes,dia);
   mesComis:=IntToStr(mes);
   anoComis:=IntToStr(ano);
   QrComissaoTxT.table1.Filtered:=false;
   QrComissaoTxT.table1.Filter:='(Mes = '''+mesComis+''')and' +
                             '(Ano = '''+anoComis+''')';
   QrComissaoTxT.table1.Filtered:=True;
   QrComissaoTxT.DataIni.Caption:=dataInicial.Text;
   QrComissaoTxT.DataFim.Caption:=dataFinal.Text;
   end;

//
If cmbDestino.Text= 'V�deo' Then
  begin
  if cmbClassif.Text='Unimed' then
    QRVendaTxT.rpVendaTxT.Preview;

  if (cmbClassif.Text='Comiss�o')then
    QrComissaoTxt.rpComissaoTxt.Preview;

  if (cmbClassif.Text='Comiss�o por vendedor') then
    QrComissaoTxt.rpComissaoTxt.Preview;
  end;
If cmbDestino.Text= 'Exportar' Then
  begin
  if cmbClassif.Text='Unimed' then
    QRVendaTxt.rpVendaTxT.ExportToFilter(TQRAsciiExportFilter.Create('C:\Unimed.txt'));

  if cmbClassif.Text='Comiss�o' then
    QrComissaoTxt.rpComissaoTxt.ExportToFilter(TQRAsciiExportFilter.Create('C:\ComissaoGeral.txt'));

  if cmbClassif.Text='Comiss�o por vendedor' then
    QrComissaoTxt.rpComissaoTxt.ExportToFilter(TQRAsciiExportFilter.Create('C:\ComissaoVend.txt'));

 end;
If cmbDestino.Text= 'Exportar Disquete' Then
  begin
  ShowMessage('Ensira um diso formatado na unidade A para prosseguir');
  while not DiscoNoDrive('a') do
    ShowMessage('� necess�rio um disco na Unidade A para prosseguir!!!');
  if cmbClassif.Text='Unimed' then
    QRVendaTxt.rpVendaTxT.ExportToFilter(TQRAsciiExportFilter.Create('A:\Unimed.txt'));

  if cmbClassif.Text='Comiss�o' then
    QrComissaoTxt.rpComissaoTxt.ExportToFilter(TQRAsciiExportFilter.Create('A:\ComissaoGeral.txt'));

  if cmbClassif.Text='Comiss�o por vendedor' then
    QrComissaoTxt.rpComissaoTxt.ExportToFilter(TQRAsciiExportFilter.Create('A:\ComissaoVend.txt'));

 end;
QRVendaTxt.Free;
QrComissaoTxt.Free;
dmdados.tbRelVendedor.Filtered:=false;
dmdados.tbVenda.filtered:=false;
dmdados.tbRelVenda.Filtered:=false;
Btnimprimir.Enabled:=False;
cmbClassif.SetFocus;
end;

procedure TFrmRelVendaTxT.fcImageBtn2Click(Sender: TObject);
begin
  Close;
end;

end.

//////////////////////////////////////////////////////////////////////////
// Criacao...........: 07/2002
// Sistema...........: Controle de Vendas - Unimed
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitRelVendas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, ToolEdit, RXSplit, fcButton, fcImgBtn, RXCtrls,
  SpeedBar, jpeg, DBCtrls, LMDCustomComponent, LMDCustomHint,qrexport,
  LMDCustomShapeHint, LMDShapeHint, RxLookup, RXDBCtrl, DCChoice, RxGrdCpt;

type
  TFrmRelVenda = class(TForm)
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
    Panel3: TPanel;
    Image3: TImage;
    Image4: TImage;
    RxLabel7: TRxLabel;
    RxGradientCaption1: TRxGradientCaption;
    Panel2: TPanel;
    Image2: TImage;
    btnImprimir: TfcImageBtn;
    btnSair: TfcImageBtn;
    Image1: TImage;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure cmbDestinoExit(Sender: TObject);
    procedure cmbDestinoCloseUp(Sender: TObject);
    procedure edVendedorExit(Sender: TObject);
    procedure cmbClassifChange(Sender: TObject);
    procedure dataInicialExit(Sender: TObject);
    procedure dataFinalExit(Sender: TObject);
    procedure edVendedorChange(Sender: TObject);
    procedure edVendedorCloseUp(Sender: TObject);
    procedure cmbDestinoChange(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelVenda: TFrmRelVenda;

implementation

uses unitDmDados, unitQrVenda, UnitPrincipal, unitQrComissao,
  unitQrVendaCancel, unitQrLancado, unitQrClassif;


{$R *.DFM}

procedure TFrmRelVenda.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;

procedure TFrmRelVenda.BtnSairClick(Sender: TObject);
begin
	Close;
end;

procedure TFrmRelVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  action:=cafree;
end;

procedure TFrmRelVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_F7     : if Btnimprimir.Enabled then Btnimprimir.Click;
      VK_ESCAPE : BtnSair.Click;
    end;
end;

procedure TFrmRelVenda.FormShow(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,'[F7] Imprimir [Esc] Cancelar ou Sair');
end;

procedure TFrmRelVenda.cmbDestinoExit(Sender: TObject);
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

procedure TFrmRelVenda.cmbDestinoCloseUp(Sender: TObject);
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

procedure TFrmRelVenda.edVendedorExit(Sender: TObject);
begin
  if edVendedor.Text=''then
    begin
    ShowMessage('Necess�rio informar o Nome do Vendedor');
    edVendedor.SetFocus;
    end
  else
    edit1.Text:=IntToStr(dmdados.tbRelVendedorCodVend.value);
end;

procedure TFrmRelVenda.cmbClassifChange(Sender: TObject);
begin
if (cmbClassif.Text='Unimed') then
   begin
   edvendedor.Enabled:=false;
   dataInicial.Enabled:=True;
   dataFinal.Enabled:=True;
   end;

if (cmbClassif.Text='Cancelada por vendedor') or
   (cmbClassif.Text='Comiss�o por vendedor') then
    begin
    edvendedor.Enabled:=true;
    dataInicial.Enabled:=true;
    dataFinal.Enabled:=true;
    end;

if (cmbClassif.Text='Lan�ado por vendedor') then
   begin
   edvendedor.Enabled:=true;
   dataInicial.Enabled:=true;
   dataFinal.Enabled:=true;
   end;

if (cmbClassif.Text='Lan�ado') then
   begin
   edvendedor.Enabled:=False;
   dataInicial.Enabled:=True;
   dataFinal.Enabled:=True;
   end;

if (cmbClassif.Text='Classificar por venda') or
   (cmbClassif.Text='Comiss�o') then
   begin
   edvendedor.Enabled:=false;
   dataInicial.Enabled:=True;
   dataFinal.Enabled:=True;
   end;

end;
procedure TFrmRelVenda.dataInicialExit(Sender: TObject);
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

procedure TFrmRelVenda.dataFinalExit(Sender: TObject);
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

procedure TFrmRelVenda.edVendedorChange(Sender: TObject);
begin
  if edVendedor.Text<>''then
    edit1.Text:=IntToStr(dmdados.tbRelVendedorCodVend.value);
end;

procedure TFrmRelVenda.edVendedorCloseUp(Sender: TObject);
begin
  if edVendedor.Text<>''then
    edit1.Text:=IntToStr(dmdados.tbRelVendedorCodVend.value);
end;

procedure TFrmRelVenda.cmbDestinoChange(Sender: TObject);
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

procedure TFrmRelVenda.btnImprimirClick(Sender: TObject);
var
  ano,mes,dia : word;
  mesComis,anoComis : string;
  Imprime:boolean;
begin
Imprime:=True;
QRVenda:= TQRVenda.Create(application);
QrComissao:=TQrComissao.create(application);
QrVendaCancel:=TQrVendaCancel.create(application);
QrLancado:=TQrLancado.create(application);
QrClassif:=TQrClassif.create(application);

if cmbClassif.Text='Unimed' then
   begin
   QRVenda.tbVenda.filtered:=false;
   QRVenda.tbVenda.Filter:='(dataSts <='''+dataFinal.Text+''') and '+
                           '((Status = '''+'Lan�ado'+''')or'+
                           '(Status = '''+'Aberto'+'''))';
   QRVenda.tbVenda.Filtered:=true;
   QrVenda.DataIni.Caption:=dataInicial.Text;
   QrVenda.DataFim.Caption:=dataFinal.Text;
   if QRVenda.tbVenda.RecordCount = 0 then Imprime:=False;
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
   QrComissao.table1.Filtered:=false;
   QrComissao.table1.Filter:='(Mes = '''+mesComis+''')and' +
                             '(Ano = '''+anoComis+''')';
   QrComissao.table1.Filtered:=True;
   QrComissao.DataIni.Caption:=dataInicial.Text;
   QrComissao.DataFim.Caption:=dataFinal.Text;
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
   QrComissao.table1.Filtered:=false;
   QrComissao.table1.Filter:='(Mes = '''+mesComis+''')and' +
                             '(Ano = '''+anoComis+''')';
   QrComissao.table1.Filtered:=True;
   QrComissao.DataIni.Caption:=dataInicial.Text;
   QrComissao.DataFim.Caption:=dataFinal.Text;
   end;

if cmbClassif.Text='Cancelada por vendedor' then
   begin
   dmdados.tbRelVendedor.Filtered:=false;
   dmdados.tbRelVendedor.Filter:='(CodVend='''+edit1.Text+''')';
   dmdados.tbRelVendedor.Filtered:=true;

   dmdados.tbRelVenda.Filtered:=false;
   dmdados.tbRelVenda.Filter:='((dataSts >='''+dataInicial.Text+''')and' +
                              '(dataSts <='''+dataFinal.Text+'''))and '+
                              '((Status = '''+'Cancelado'+''')or'+
                              '(Status = '''+'Aberto'+'''))';
   dmdados.tbRelVenda.Filtered:=true;

   QrVendaCancel.Table1.Filtered:=false;
   QrVendaCancel.Table1.Filter:='((dataSts >='''+dataInicial.Text+''')and' +
                                '(dataSts <='''+dataFinal.Text+'''))and '+
                                '((Status = '''+'Cancelado'+''')or'+
                                '(Status = '''+'Aberto'+'''))';
   QrVendaCancel.Table1.Filtered:=true;
   end;

if cmbClassif.Text='Lan�ado' then
   begin
   QRVenda.tbVenda.filtered:=false;
   QRVenda.tbVenda.Filter:='((dataSts >='''+dataInicial.Text+''')and' +
                           '(dataSts <='''+dataFinal.Text+''')) and '+
                           '(Status = '''+'Lan�ado'+''')';
   QRVenda.tbVenda.Filtered:=true;
   QRVenda.DataIni.Caption:=dataInicial.Text;
   QRVenda.DataFim.Caption:=dataFinal.Text;
   if QRVenda.tbVenda.RecordCount = 0 then Imprime:=False;
   end;

if cmbClassif.Text='Lan�ado por vendedor' then
   begin
   dmdados.tbRelVendedor.Filtered:=false;
   dmdados.tbRelVendedor.Filter:='(CodVend='''+edit1.Text+''')';
   dmdados.tbRelVendedor.Filtered:=true;

   dmdados.tbRelVenda.Filtered:=false;
   dmdados.tbRelVenda.Filter:='(dataSts >='''+dataInicial.Text+''')and'+
                              '(dataSts <='''+dataFinal.Text+''') and'+
                              '(Status = '''+'Lan�ado'+''')';
   dmdados.tbRelVenda.Filtered:=true;
   QrLancado.Table1.Filtered:=false;
   QrLancado.Table1.Filter:='((dataSts >='''+dataInicial.Text+''')and' +
                            '(dataSts <='''+dataFinal.Text+'''))and '+
                            '(Status = '''+'Lan�ado'+''')';
   QrLancado.Table1.Filtered:=true;
   end;

if cmbClassif.Text='Classificar por venda' then
  begin
  decodedate(dataFinal.Date,ano,mes,dia);
  mesComis:=IntToStr(mes);
  anoComis:=IntToStr(ano);
  QrClassif.Comis.Filtered:=false;
  QrClassif.Comis.Filter:='(Mes = '''+mesComis+''')and' +
                          '(Ano = '''+anoComis+''')';
  QrClassif.Comis.Filtered:=True;
  if QrClassif.Comis.RecordCount = 0 then Imprime:=False;
  end;

//  verifica se vai haver impress�o
if Imprime then
begin
If cmbDestino.Text= 'V�deo' Then
  begin
   if cmbClassif.Text='Unimed' then
      QRVenda.rpVenda.Preview;

   if (cmbClassif.Text='Comiss�o') then
      QrComissao.rpComissao.Preview;

   if (cmbClassif.Text='Comiss�o por vendedor') then
      QrComissao.rpComissao.Preview;

   if cmbclassif.Text='Cancelada por vendedor' then
      QrVendaCancel.rpVenda.Preview;

   if cmbClassif.Text='Lan�ado' then
      QRVenda.rpVenda.Preview;

   if cmbclassif.Text='Lan�ado por vendedor' then
      QrLancado.rpLancado.Preview;

   if cmbClassif.Text='Classificar por venda' then
      begin
      QrClassif.Comis.IndexName:='ivalor';
      QrClassif.rpClassif.preview;
      end;
   end
else
   begin
     if cmbClassif.Text='Unimed' then
        QRVenda.rpVenda.Print;

     if (cmbClassif.Text='Comiss�o')or
        (cmbClassif.Text='Comiss�o por vendedor')then
        QrComissao.rpComissao.Print;

     if cmbclassif.Text='Cancelada por vendedor' then
       QrVendaCancel.rpVenda.Print;

     if cmbClassif.Text='Lan�ado' then
      QRVenda.rpVenda.Print;

     if cmbclassif.Text='Lan�ado por vendedor' then
       QrLancado.rpLancado.Print;

     if cmbClassif.Text='Classificar por venda' then
        begin
        QrClassif.Comis.IndexName:='ivalor';
        QrClassif.rpClassif.print;
        end;
   end;
end
else
  ShowMessage('N�o existe dados para Imprimir');
QRVenda.Free;
QrComissao.Free;
QrVendacancel.Free;
QrLancado.Free;
QrClassif.free;
dmdados.tbRelVendedor.Filtered:=false;
dmdados.tbVenda.filtered:=false;
dmdados.tbRelVenda.Filtered:=false;
Btnimprimir.Enabled:=False;
cmbClassif.SetFocus;
end;

end.

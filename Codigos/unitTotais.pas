//////////////////////////////////////////////////////////////////////////
// Criacao...........: 07/2002
// Sistema...........: Controle de Vendas - Unimed
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitTotais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RXCtrls, ExtCtrls, RackCtls, StdCtrls, jpeg, ComCtrls, Mask,
  ToolEdit, CurrEdit, RxGrdCpt;

type
  TfrmTotal = class(TForm)
    Panel1: TPanel;
    Calendario: TMonthCalendar;
    lbdata: TRxLabel;
    ceValor: TCurrencyEdit;
    Panel3: TPanel;
    Image3: TImage;
    Image4: TImage;
    RxLabel7: TRxLabel;
    RxGradientCaption1: TRxGradientCaption;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure CalendarioClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTotal: TfrmTotal;

implementation

uses UnitDmdados;

{$R *.dfm}

procedure TfrmTotal.FormShow(Sender: TObject);
begin
calendario.Date:=date;
Lbdata.Caption:=DateToStr(calendario.Date);
dmdados.tbVenda.filtered:=false;
dmdados.tbVenda.Filter:='(DataVenda='''+DateToStr(Calendario.Date)+''')';
dmdados.tbVenda.Filtered:=true;
dmdados.tbVenda.First;
while not dmdados.tbVenda.Eof do
 begin
 ceValor.Value:=ceValor.Value+dmdados.tbVendaValor.Value;
 dmdados.tbVenda.Next;
 end;
end;

procedure TfrmTotal.CalendarioClick(Sender: TObject);
begin
Lbdata.Caption:=DateToStr(calendario.Date);
dmdados.tbVenda.filtered:=false;
dmdados.tbVenda.Filter:='(DataVenda='''+DateToStr(Calendario.Date)+''')';
dmdados.tbVenda.Filtered:=true;
if dmdados.tbVenda.RecordCount=0 then
   ceValor.Value:=0
else
  begin
  ceValor.Value:=0;
  dmdados.tbVenda.First;
  while not dmdados.tbVenda.Eof do
   begin
   ceValor.Value:=ceValor.Value+dmdados.tbVendaValor.Value;
   dmdados.tbVenda.Next;
   end;
  end;
end;

procedure TfrmTotal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
dmdados.tbVenda.Filtered:=false;
end;

procedure TfrmTotal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmDados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_ESCAPE : close;
    end;

end;

end.

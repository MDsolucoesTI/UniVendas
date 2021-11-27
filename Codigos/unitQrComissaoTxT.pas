//////////////////////////////////////////////////////////////////////////
// Criacao...........: 07/2002
// Sistema...........: Controle de Vendas - Unimed
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitQrComissaoTxT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, DBTables;

type
  TQrComissaoTxT = class(TForm)
    rpComissaoTxT: TQuickRep;
    dtVendedor: TQRBand;
    QRDBText6: TQRDBText;
    QRDBText17: TQRDBText;
    subVenda: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText4: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    qrValor: TQRDBText;
    SummaryBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    table1: TTable;
    table1Nada: TAutoIncField;
    table1CodVend: TIntegerField;
    table1Mes: TStringField;
    table1Ano: TStringField;
    table1Valor: TCurrencyField;
    DataSource1: TDataSource;
    QRBand1: TQRBand;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    DataIni: TQRLabel;
    QRLabel17: TQRLabel;
    DataFim: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    ghVenda: TQRBand;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    procedure subVendaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QrComissaoTxT: TQrComissaoTxT;

implementation

uses UnitDmdados;

{$R *.dfm}

procedure TQrComissaoTxT.subVendaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
if dmdados.tbRelVendaStatus.Value='Aberto' then
    begin
    QRDBText1.Font.Color:=clRed;
    QRDBText2.Font.Color:=clRed;
    QRDBText3.Font.Color:=clRed;
    QRDBText4.Font.Color:=clRed;
    QRDBText9.Font.Color:=clRed;
    end;
  if dmdados.tbRelVendaStatus.Value='Lan�ado' then
    begin
    QRDBText1.Font.Color:=clBlue;
    QRDBText2.Font.Color:=clBlue;
    QRDBText3.Font.Color:=clBlue;
    QRDBText4.Font.Color:=clBlue;
    QRDBText9.Font.Color:=clBlue;
    end;
  if dmdados.tbRelVendaStatus.Value='Cancelado' then
    begin
    QRDBText1.Font.Color:=clMaroon;
    QRDBText2.Font.Color:=clMaroon;
    QRDBText3.Font.Color:=clMaroon;
    QRDBText4.Font.Color:=clMaroon;
    QRDBText9.Font.Color:=clMaroon;
    end;
  if dmdados.tbRelVendaStatus.Value='Pago' then
    begin
    QRDBText1.Font.Color:=clGreen;
    QRDBText2.Font.Color:=clGreen;
    QRDBText3.Font.Color:=clGreen;
    QRDBText4.Font.Color:=clGreen;
    QRDBText9.Font.Color:=clGreen;
    end;
end;

end.

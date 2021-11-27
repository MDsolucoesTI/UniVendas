//////////////////////////////////////////////////////////////////////////
// Criacao...........: 07/2002
// Sistema...........: Controle de Vendas - Unimed
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitQrVendaCancelTxt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, DBTables;

type
  TQrVendaCancelTxt = class(TForm)
    rpVendaCancelTxt: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText10: TQRDBText;
    QRDBText9: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText5: TQRDBText;
    SummaryBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    Table1: TTable;
    Table1CodVen: TAutoIncField;
    Table1NumVenda: TStringField;
    Table1DataVenda: TDateField;
    Table1CodVend: TIntegerField;
    Table1CodPlano: TStringField;
    Table1CodMotCancel: TIntegerField;
    Table1Titular: TStringField;
    Table1Vidas: TFloatField;
    Table1Valor: TCurrencyField;
    Table1DataRecibo: TDateField;
    Table1NumVerif: TFloatField;
    Table1Status: TStringField;
    Table1DataSts: TDateField;
    Table1Comissao: TFloatField;
    Table1Obs: TMemoField;
    Table1Avista: TCurrencyField;
    Table1Areceber: TCurrencyField;
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QrVendaCancelTxt: TQrVendaCancelTxt;

implementation

uses UnitDmdados;

{$R *.dfm}

procedure TQrVendaCancelTxt.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if dmdados.tbRelVendaStatus.Value='Aberto' then
    begin
    QRDBText1.Font.Color:=clRed;
    QRDBText2.Font.Color:=clRed;
    QRDBText3.Font.Color:=clRed;
    QRDBText4.Font.Color:=clRed;
    QRDBText5.Font.Color:=clRed;
    QRDBText6.Font.Color:=clRed;
    QRDBText7.Font.Color:=clRed;
    end;
  if dmdados.tbRelVendaStatus.Value='Cancelado' then
    begin
    QRDBText1.Font.Color:=clMaroon;
    QRDBText2.Font.Color:=clMaroon;
    QRDBText3.Font.Color:=clMaroon;
    QRDBText4.Font.Color:=clMaroon;
    QRDBText5.Font.Color:=clMaroon;
    QRDBText6.Font.Color:=clMaroon;
    QRDBText7.Font.Color:=clMaroon;
    end;
end;

end.

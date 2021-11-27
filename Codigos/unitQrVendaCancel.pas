//////////////////////////////////////////////////////////////////////////
// Criacao...........: 07/2002
// Sistema...........: Controle de Vendas - Unimed
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitQrVendaCancel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, DBTables;

type
  TQrVendaCancel = class(TForm)
    rpVenda: TQuickRep;
    TitleBand1: TQRBand;
    QRDBText8: TQRDBText;
    QRDBImage1: TQRDBImage;
    QRLabel2: TQRLabel;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText5: TQRDBText;
    GroupHeaderBand1: TQRBand;
    QRLabel8: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape1: TQRShape;
    QRDBText10: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel9: TQRLabel;
    SummaryBand1: TQRBand;
    QRExpr1: TQRExpr;
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
    QRLabel11: TQRLabel;
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QrVendaCancel: TQrVendaCancel;

implementation

uses UnitDmdados;

{$R *.dfm}

procedure TQrVendaCancel.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
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

//////////////////////////////////////////////////////////////////////////
// Criacao...........: 07/2002
// Sistema...........: Controle de Vendas - Unimed
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitQrVendaTxT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, DBTables;

type
  TQrVendaTxT = class(TForm)
    rpVendaTxT: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    tbVenda: TTable;
    QRBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRShape1: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRBand2: TQRBand;
    tbVendaCodVen: TAutoIncField;
    tbVendaNumVenda: TStringField;
    tbVendaDataVenda: TDateField;
    tbVendaCodVend: TIntegerField;
    tbVendaCodPlano: TStringField;
    tbVendaCodMotCancel: TIntegerField;
    tbVendaTitular: TStringField;
    tbVendaVidas: TFloatField;
    tbVendaValor: TCurrencyField;
    tbVendaDataRecibo: TDateField;
    tbVendaNumVerif: TFloatField;
    tbVendaStatus: TStringField;
    tbVendaDataSts: TDateField;
    tbVendaComissao: TFloatField;
    tbVendaObs: TMemoField;
    tbVendaAvista: TCurrencyField;
    tbVendaAreceber: TCurrencyField;
    qrlTitulo: TQRLabel;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QrVendaTxT: TQrVendaTxT;

implementation

{$R *.dfm}

procedure TQrVendaTxT.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if tbVendaStatus.Value='Aberto' then
    begin
    QRDBText1.Font.Color:=clRed;
    QRDBText3.Font.Color:=clRed;
    QRDBText5.Font.Color:=clRed;
    end
  else
    begin
    QRDBText1.Font.Color:=clBlue;
    QRDBText3.Font.Color:=clBlue;
    QRDBText5.Font.Color:=clBlue;
    end;
end;

end.

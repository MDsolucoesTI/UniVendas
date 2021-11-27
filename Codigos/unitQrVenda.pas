//////////////////////////////////////////////////////////////////////////
// Criacao...........: 07/2002
// Sistema...........: Controle de Vendas - Unimed
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitQrVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, QRExport, DB, DBTables;

type
  TQrVenda = class(TForm)
    rpVenda: TQuickRep;
    TitleBand1: TQRBand;
    DetailBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    qrlempresa: TQRDBText;
    logo: TQRDBImage;
    qrlTitulo: TQRLabel;
    qrlVenda: TQRLabel;
    qrltitular: TQRLabel;
    qrlValor: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRShape2: TQRShape;
    PageFooterBand1: TQRBand;
    data: TQRSysData;
    pagina: TQRSysData;
    tbVenda: TTable;
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
    tbVendaLkVendedor: TStringField;
    tbVendaLkPlano: TStringField;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRExpr1: TQRExpr;
    QRLabel8: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel10: TQRLabel;
    DataIni: TQRLabel;
    QRLabel12: TQRLabel;
    DataFim: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText2: TQRDBText;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
//    procedure QRSysData2Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QrVenda: TQrVenda;

implementation

uses UnitDmdados;

{$R *.dfm}

procedure TQrVenda.DetailBand1BeforePrint(Sender: TQRCustomBand;
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
    end
end;

end.

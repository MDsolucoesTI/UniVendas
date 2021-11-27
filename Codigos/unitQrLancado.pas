//////////////////////////////////////////////////////////////////////////
// Criacao...........: 07/2002
// Sistema...........: Controle de Vendas - Unimed
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitQrLancado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, DBTables;

type
  TQrLancado = class(TForm)
    rpLancado: TQuickRep;
    TitleBand1: TQRBand;
    QRDBText8: TQRDBText;
    QRDBImage1: TQRDBImage;
    QRLabel2: TQRLabel;
    dtVendedor: TQRBand;
    QRShape1: TQRShape;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText17: TQRDBText;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    subVenda: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText4: TQRDBText;
    ghVenda: TQRBand;
    QRLabel7: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel4: TQRLabel;
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
    SummaryBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel11: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QrLancado: TQrLancado;

implementation

uses UnitDmdados;

{$R *.dfm}

end.

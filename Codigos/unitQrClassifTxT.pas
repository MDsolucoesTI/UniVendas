//////////////////////////////////////////////////////////////////////////
// Criacao...........: 07/2002
// Sistema...........: Controle de Vendas - Unimed
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitQrClassifTxT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, QRCtrls, QuickRpt, ExtCtrls;

type
  TQrClassifTxt = class(TForm)
    rpClassifTxt: TQuickRep;
    dtVendedor: TQRBand;
    QRDBText6: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText4: TQRDBText;
    SummaryBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    Vend: TTable;
    VendCodVend: TAutoIncField;
    VendNome: TStringField;
    VendComissao: TFloatField;
    VendDataAdim: TDateField;
    VendRG: TStringField;
    VendCPF: TStringField;
    VendEndereco: TStringField;
    VendNumero: TSmallintField;
    VendComplemento: TStringField;
    VendBairro: TStringField;
    VendCEP: TStringField;
    VendCidade: TStringField;
    VendUF: TStringField;
    VendTel1: TStringField;
    VendTel2: TStringField;
    VendCelular: TStringField;
    VendNascimento: TDateField;
    VendEMail: TStringField;
    VendSituacao: TStringField;
    VendDataCad: TDateField;
    VendObs: TMemoField;
    VendUltimaVenda: TDateField;
    Comis: TTable;
    ComisNada: TAutoIncField;
    ComisCodVend: TIntegerField;
    ComisMes: TStringField;
    ComisAno: TStringField;
    ComisValor: TCurrencyField;
    ComisLkVidas: TIntegerField;
    ComisLkVendedor: TStringField;
    ComisLkNumero: TStringField;
    ComisLkTitular: TStringField;
    Vendas: TTable;
    VendasCodVen: TAutoIncField;
    VendasNumVenda: TStringField;
    VendasDataVenda: TDateField;
    VendasCodVend: TIntegerField;
    VendasCodPlano: TStringField;
    VendasCodMotCancel: TIntegerField;
    VendasTitular: TStringField;
    VendasVidas: TFloatField;
    VendasValor: TCurrencyField;
    VendasDataRecibo: TDateField;
    VendasNumVerif: TFloatField;
    VendasStatus: TStringField;
    VendasDataSts: TDateField;
    VendasComissao: TFloatField;
    VendasObs: TMemoField;
    VendasAvista: TCurrencyField;
    VendasAreceber: TCurrencyField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QrClassifTxt: TQrClassifTxt;

implementation

uses UnitDmdados;

{$R *.dfm}

end.

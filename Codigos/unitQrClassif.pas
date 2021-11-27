//////////////////////////////////////////////////////////////////////////
// Criacao...........: 07/2002
// Sistema...........: Controle de Vendas - Unimed
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitQrClassif;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, DBTables;

type
  TQrClassif = class(TForm)
    rpClassif: TQuickRep;
    TitleBand1: TQRBand;
    QRDBText8: TQRDBText;
    QRDBImage1: TQRDBImage;
    QRLabel2: TQRLabel;
    dtVendedor: TQRBand;
    QRDBText6: TQRDBText;
    QRDBText17: TQRDBText;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    ghVenda: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel4: TQRLabel;
    SummaryBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel5: TQRLabel;
    Vend: TTable;
    Comis: TTable;
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
    ComisNada: TAutoIncField;
    ComisCodVend: TIntegerField;
    ComisMes: TStringField;
    ComisAno: TStringField;
    ComisValor: TCurrencyField;
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
    ComisLkVidas: TIntegerField;
    ComisLkVendedor: TStringField;
    ComisLkNumero: TStringField;
    QRDBText4: TQRDBText;
    ComisLkTitular: TStringField;
    ColumnHeaderBand1: TQRBand;
    QRLabel8: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel10: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QrClassif: TQrClassif;

implementation

{$R *.dfm}

procedure TQrClassif.FormClose(Sender: TObject; var Action: TCloseAction);
begin
comis.IndexName:='';
end;

end.

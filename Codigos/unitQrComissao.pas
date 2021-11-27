//////////////////////////////////////////////////////////////////////////
// Criacao...........: 07/2002
// Sistema...........: Controle de Vendas - Unimed
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitQrComissao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, DBTables;

type
  TQrComissao = class(TForm)
    rpComissao: TQuickRep;
    TitleBand1: TQRBand;
    QRDBText8: TQRDBText;
    QRDBImage1: TQRDBImage;
    QRLabel2: TQRLabel;
    dtVendedor: TQRBand;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRShape1: TQRShape;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel6: TQRLabel;
    subVenda: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText9: TQRDBText;
    ghVenda: TQRBand;
    QRLabel7: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel9: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    qrValor: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText17: TQRDBText;
    SummaryBand1: TQRBand;
    QRExpr1: TQRExpr;
    DataSource1: TDataSource;
    table1: TTable;
    table1Nada: TAutoIncField;
    table1CodVend: TIntegerField;
    table1Mes: TStringField;
    table1Ano: TStringField;
    table1Valor: TCurrencyField;
    QRLabel5: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    DataIni: TQRLabel;
    DataFim: TQRLabel;
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure subVendaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QrComissao: TQrComissao;

implementation

uses UnitDmdados;

{$R *.dfm}

procedure TQrComissao.QRDBText6Print(sender: TObject; var Value: String);
begin
dmdados.tbRelComis.Filtered:=false;
dmdados.tbRelComis.Filter:='(CodVend='''+dmdados.tbRelVendedorCodVend.AsString+''')';
dmdados.tbRelComis.Filtered:=true;
end;

procedure TQrComissao.subVendaBeforePrint(Sender: TQRCustomBand;
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

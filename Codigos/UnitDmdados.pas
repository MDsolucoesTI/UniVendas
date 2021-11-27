//////////////////////////////////////////////////////////////////////////
// Criacao...........: 07/2002
// Sistema...........: Controle de Vendas - Unimed
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitDmdados;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  TDMdados = class(TDataModule)
    TbVendedor: TTable;
    DSVendedor: TDataSource;
    TbVendedorCodVend: TAutoIncField;
    TbVendedorNome: TStringField;
    TbVendedorComissao: TFloatField;
    TbVendedorDataAdim: TDateField;
    TbVendedorRG: TStringField;
    TbVendedorCPF: TStringField;
    TbVendedorEndereco: TStringField;
    TbVendedorNumero: TSmallintField;
    TbVendedorComplemento: TStringField;
    TbVendedorBairro: TStringField;
    TbVendedorCEP: TStringField;
    TbVendedorCidade: TStringField;
    TbVendedorUF: TStringField;
    TbVendedorTel1: TStringField;
    TbVendedorTel2: TStringField;
    TbVendedorCelular: TStringField;
    TbVendedorNascimento: TDateField;
    TbVendedorEMail: TStringField;
    TbVendedorSituacao: TStringField;
    TbVendedorDataCad: TDateField;
    TbVendedorObs: TMemoField;
    TbVendedorUltimaVenda: TDateField;
    dsMotCancel: TDataSource;
    tbMotCancel: TTable;
    tbMotCancelMotivo: TStringField;
    dsPlano: TDataSource;
    tbPlano: TTable;
    tbPlanoTipoPlano: TStringField;
    tbVenda: TTable;
    dsVenda: TDataSource;
    tbVendaDataVenda: TDateField;
    tbVendaCodVend: TIntegerField;
    tbVendaCodMotCancel: TIntegerField;
    tbVendaTitular: TStringField;
    tbVendaVidas: TFloatField;
    tbVendaValor: TCurrencyField;
    tbVendaDataRecibo: TDateField;
    tbVendaNumVerif: TFloatField;
    tbVendaDataSts: TDateField;
    tbVendaLkVendedor: TStringField;
    tbVendaCodVen: TAutoIncField;
    tbVendaComissao: TFloatField;
    tbVendaAvista: TCurrencyField;
    tbVendaAreceber: TCurrencyField;
    dsComis: TDataSource;
    tbComis: TTable;
    tbComisNada: TAutoIncField;
    tbComisCodVend: TIntegerField;
    tbComisMes: TStringField;
    tbComisAno: TStringField;
    tbComisValor: TCurrencyField;
    tbVendaObs: TMemoField;
    dsRelVendedor: TDataSource;
    tbRelVendedor: TTable;
    tbRelVenda: TTable;
    dsRelVendas: TDataSource;
    tbRelVendaCodVen: TAutoIncField;
    tbRelVendaNumVenda: TStringField;
    tbRelVendaDataVenda: TDateField;
    tbRelVendaCodVend: TIntegerField;
    tbRelVendaCodMotCancel: TIntegerField;
    tbRelVendaTitular: TStringField;
    tbRelVendaVidas: TFloatField;
    tbRelVendaValor: TCurrencyField;
    tbRelVendaDataRecibo: TDateField;
    tbRelVendaNumVerif: TFloatField;
    tbRelVendaStatus: TStringField;
    tbRelVendaDataSts: TDateField;
    tbRelVendaComissao: TFloatField;
    tbRelVendaObs: TMemoField;
    tbRelVendaAvista: TCurrencyField;
    tbRelVendaAreceber: TCurrencyField;
    dsRelComis: TDataSource;
    tbRelComis: TTable;
    tbRelComisNada: TAutoIncField;
    tbRelComisCodVend: TIntegerField;
    tbRelComisMes: TStringField;
    tbRelComisAno: TStringField;
    tbRelComisValor: TCurrencyField;
    tbRelVendedorCodVend: TAutoIncField;
    tbRelVendedorNome: TStringField;
    tbRelVendedorComissao: TFloatField;
    tbRelVendedorDataAdim: TDateField;
    tbRelVendedorRG: TStringField;
    tbRelVendedorCPF: TStringField;
    tbRelVendedorEndereco: TStringField;
    tbRelVendedorNumero: TSmallintField;
    tbRelVendedorComplemento: TStringField;
    tbRelVendedorBairro: TStringField;
    tbRelVendedorCEP: TStringField;
    tbRelVendedorCidade: TStringField;
    tbRelVendedorUF: TStringField;
    tbRelVendedorTel1: TStringField;
    tbRelVendedorTel2: TStringField;
    tbRelVendedorCelular: TStringField;
    tbRelVendedorNascimento: TDateField;
    tbRelVendedorEMail: TStringField;
    tbRelVendedorSituacao: TStringField;
    tbRelVendedorDataCad: TDateField;
    tbRelVendedorObs: TMemoField;
    tbRelVendedorUltimaVenda: TDateField;
    TbParametro: TTable;
    TbParametroCodPar: TAutoIncField;
    TbParametroEmpresa: TStringField;
    TbParametroCNPJ: TStringField;
    TbParametroProprietario: TStringField;
    TbParametroCPF: TStringField;
    TbParametroEndereco: TStringField;
    TbParametroNumero: TSmallintField;
    TbParametroComplemento: TStringField;
    TbParametroBairro: TStringField;
    TbParametroCEP: TStringField;
    TbParametroCidade: TStringField;
    TbParametroUF: TStringField;
    TbParametroTel1: TStringField;
    TbParametroTel2: TStringField;
    TbParametroCelular: TStringField;
    TbParametroICMS: TFloatField;
    TbParametroLogo: TGraphicField;
    TbParametroCredRenda: TFloatField;
    TbParametroComissao: TFloatField;
    TbParametroCPMF: TFloatField;
    TbParametroMultaDia: TSmallintField;
    TbParametroValorMulta: TCurrencyField;
    TbParametroPercMulta: TFloatField;
    TbParametroDescDia: TSmallintField;
    TbParametroValorDesc: TCurrencyField;
    TbParametroPercDesc: TFloatField;
    TbParametroJurosDia: TSmallintField;
    TbParametroValorJuros: TCurrencyField;
    TbParametroPercJuros: TFloatField;
    TbParametroDecoEntra: TStringField;
    TbParametroMensPromo: TStringField;
    TbParametroMensRodape: TStringField;
    TbParametroPis: TFloatField;
    TbParametroCofins: TFloatField;
    TbParametroCS: TFloatField;
    dsParametro: TDataSource;
    tbVendaNumVenda: TStringField;
    tbRelVendaLkVendedor: TStringField;
    tbRelVendaLkMotCancel: TStringField;
    tbMotCancelNada: TAutoIncField;
    tbMotCancelCodMotCancel: TStringField;
    tbPlanoNada: TAutoIncField;
    tbPlanoCodPlano: TStringField;
    dsCliente: TDataSource;
    tbCliente: TTable;
    tbClienteCodCli: TAutoIncField;
    tbClienteTipo: TStringField;
    tbClienteNome: TStringField;
    tbClienteFantasia: TStringField;
    tbClienteNascimento: TDateField;
    tbClienteTel1: TStringField;
    tbClienteTel2: TStringField;
    tbClienteCelular: TStringField;
    tbClienteCnpj: TStringField;
    tbClienteCpf: TStringField;
    tbClienteInsEstado: TStringField;
    tbClienteRg: TStringField;
    tbClienteEndereco: TStringField;
    tbClienteNumero: TSmallintField;
    tbClienteComplemento: TStringField;
    tbClienteBairro: TStringField;
    tbClienteCep: TStringField;
    tbClienteCidade: TStringField;
    tbClienteUf: TStringField;
    tbClienteEmail: TStringField;
    tbClienteUltimaCompra: TDateField;
    tbClienteCodRota: TStringField;
    tbClienteObs: TMemoField;
    tbClienteDataCad: TDateField;
    tbClientePrazoPagto: TFloatField;
    tbVendaStatus: TStringField;
    tbVendaCodPlano: TStringField;
    tbVendaLkPlano: TStringField;
    tbRelVendaCodPlano: TStringField;
    tbRelVendaLKPlano: TStringField;
    dsSenha: TDataSource;
    tbSenha: TTable;
    tbSenhaUsuario: TStringField;
    tbSenhaSenha: TStringField;
    tbSenhaAcesso: TStringField;
    TbParametroInsEstado: TStringField;
    tbVendalkMotCancel: TStringField;
    tbVendorCom: TTable;
    tbVendorComCodVend: TAutoIncField;
    tbVendorComNome: TStringField;
    tbVendorComComissao: TFloatField;
    tbVendorComDataAdim: TDateField;
    tbVendorComRG: TStringField;
    tbVendorComCPF: TStringField;
    tbVendorComEndereco: TStringField;
    tbVendorComNumero: TSmallintField;
    tbVendorComComplemento: TStringField;
    tbVendorComBairro: TStringField;
    tbVendorComCEP: TStringField;
    tbVendorComCidade: TStringField;
    tbVendorComUF: TStringField;
    tbVendorComTel1: TStringField;
    tbVendorComTel2: TStringField;
    tbVendorComCelular: TStringField;
    tbVendorComNascimento: TDateField;
    tbVendorComEMail: TStringField;
    tbVendorComSituacao: TStringField;
    tbVendorComDataCad: TDateField;
    tbVendorComObs: TMemoField;
    tbVendorComUltimaVenda: TDateField;
    procedure DataModuleCreate(Sender: TObject);
 private
    { Private declarations }
    fHabilitaTeclado : Boolean;
    fvTabStt:Boolean;
  public
    { Public declarations }
    Property HabilitaTeclado : Boolean Read  fHabilitaTeclado Write fHabilitaTeclado;
    Property vTabStt : Boolean Read  fvTabStt Write fvTabStt;
  end;

var
  DMdados: TDMdados;

implementation

{$R *.dfm}

procedure TDMdados.DataModuleCreate(Sender: TObject);
begin
HabilitaTeclado:=True;
  vTabStt:=True;
end;

end.

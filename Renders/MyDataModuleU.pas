unit MyDataModuleU;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef;

type
  TMyDataModule = class(TDataModule)
    Connection: TFDConnection;
    QryCustomers: TFDQuery;
    QryCustomersCUSTOMER_NO: TStringField;
    QryCustomersCUSTOMER: TStringField;
    QryCustomersCONTACT_FIRST: TStringField;
    QryCustomersCONTACT_LAST: TStringField;
    QryCustomersPHONE_NO: TStringField;
    QryCustomersADDRESS_LINE1: TStringField;
    QryCustomersADDRESS_LINE2: TStringField;
    QryCustomersCITY: TStringField;
    QryCustomersSTATE_PROVINCE: TStringField;
    QryCustomersCOUNTRY: TStringField;
    QryCustomersPOSTAL_CODE: TStringField;
    QryCustomersON_HOLD: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MyDataModule: TMyDataModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

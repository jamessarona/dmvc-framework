unit MyControllerU;

interface

uses
  MVCFramework, MVCFramework.Commons, MVCFramework.Serializer.Commons;

type

  [MVCPath('/api')]
  TMyControllerU = class(TMVCController) 
  public
    [MVCPath]
    [MVCHTTPMethod([httpGET])]
    procedure Index;

    [MVCPath('/reversedstrings/($Value)')]
    [MVCHTTPMethod([httpGET])]
    procedure GetReversedString(const Value: String);
  protected
    procedure OnBeforeAction(Context: TWebContext; const AActionName: string; var Handled: Boolean); override;
    procedure OnAfterAction(Context: TWebContext; const AActionName: string); override;

  public
    //Sample CRUD Actions for a "Customer" entity
    [MVCPath('/customers')]
    [MVCHTTPMethod([httpGET])]
    procedure GetCustomers;

    [MVCPath('/customers/($id)')]
    [MVCHTTPMethod([httpGET])]
    procedure GetCustomer(id: Integer);

    [MVCPath('/customers')]
    [MVCHTTPMethod([httpPOST])]
    procedure CreateCustomer;

    [MVCPath('/customers/($id)')]
    [MVCHTTPMethod([httpPUT])]
    procedure UpdateCustomer(id: Integer);

    [MVCPath('/customers/($id)')]
    [MVCHTTPMethod([httpDELETE])]
    procedure DeleteCustomer(id: Integer);

  end;

implementation

uses
  System.SysUtils, MVCFramework.Logger, System.StrUtils;

procedure TMyControllerU.Index;
begin
  //use Context property to access to the HTTP request and response 
  Render('Hello DelphiMVCFramework World');
end;

procedure TMyControllerU.GetReversedString(const Value: String);
begin
  Render(System.StrUtils.ReverseString(Value.Trim));
end;

procedure TMyControllerU.OnAfterAction(Context: TWebContext; const AActionName: string); 
begin
  { Executed after each action }
  inherited;
end;

procedure TMyControllerU.OnBeforeAction(Context: TWebContext; const AActionName: string; var Handled: Boolean);
begin
  { Executed before each action
    if handled is true (or an exception is raised) the actual
    action will not be called }
  inherited;
end;

//Sample CRUD Actions for a "Customer" entity
procedure TMyControllerU.GetCustomers;
begin
  //todo: render a list of customers
end;

procedure TMyControllerU.GetCustomer(id: Integer);
begin
  //todo: render the customer by id
end;

procedure TMyControllerU.CreateCustomer;

begin
  //todo: create a new customer
end;

procedure TMyControllerU.UpdateCustomer(id: Integer);
begin
  //todo: update customer by id
end;

procedure TMyControllerU.DeleteCustomer(id: Integer);
begin
  //todo: delete customer by id
end;



end.

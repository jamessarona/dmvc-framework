unit RenderSampleU;

interface

uses
  MVCFramework, MVCFramework.Commons, MVCFramework.Serializer.Commons;

type

  [MVCPath('/api/customers')] {this controller handles "customers"}
  TRenderSampleController = class(TMVCController) 
  public
    {this route requires a parameter named "id"}
    [MVCPath('/($id)')]
    {and can be called only with GET HTTP verb}
    [MVCHTTPMethods([httpGET])]
    {the action prototype must match with the parameter that we expect from the route}
    procedure GetCustomer(const id: Integer);
  end;

implementation

uses
  BusinessObjectsU, System.IOUtils, System.Classes, MVCFramework.Logger {where our TCustomer class is declared};

procedure TRenderSampleController.GetCustomer(const id: Integer);
var
  lCust: TCustomerWithNotes;
begin
  lCust := TCustomerWithNotes.Create;
  try
    {in this example, just set the id equals to the id parameter}
    lCust.ID := id;
    lCust.Name := 'Daniele''s -Pizza!';
    lCust.ContactFirst := 'Daniele';
    lCust.ContactLast := 'Teti';
    lCust.AddressLine1 := 'Via Roma, 7';
    lCust.AddressLine2 := '00100, RM, ITALY';
    lCust.City := 'ROME';
    lCust.CustomerSecret := 'This is a secret';
//    lCust.Photo := TFile.OpenRead('..\..\person.png');
    lCust.Notes := TStringStream.Create('This is a long text that I want to use to describe the customer');

    Render(lCust, false { "false" do not automatically frees lCust} );
  finally
    lCust.Free; {free lCust manually for now}
  end;
end;
end.
unit ProductsController;

interface

uses
  MVCFramework, MVCFramework.Commons, MVCFramework.Serializer.Commons;

type
  [MVCDoc('Provides CRUD actions for product entity')]
  [MVCPath('/products')] //MVCPath used at controller level
  TProductsController = class(TMVCController)
  public
    [MVCDoc('Returns a list of products as JSON array')]
    [MVCPath()]
    [MVCHTTPMethods([httpGET])]
    [MVCProduces('application/json')]
    procedure GetProducts;

    [MVCDoc('Returns the product identified with the passed id as JSON object')]
    [MVCPath('/($id)')]
    [MVCHTTPMethods([httpGET])]
    [MVCProduces('application/json')]
    procedure GetProductsByID(const id: Integer);

    [MVCDoc('Allows to create a new product using the JSON object passed in the request body')]
    [MVCPath()]
    [MVCHTTPMethods([httpPOST])]
    procedure CreateProduct;

    [MVCDoc('Allows to update the product identified with the passed id using the JSON object passed in the request body')]
    [MVCPath('/($id)')]
    [MVCHTTPMethods([httpPUT])]
    [MVCProduces('application/json')]
    [MVCConsumes('application/json')]
    procedure UpdateProduct(const id: Integer);

    [MVCDoc('Deletes the product idenfitied by the passed id')]
    [MVCPath('/($id)')]
    [MVCHTTPMethods([httpDELETE])]
    procedure DeleteProduct(const id: Integer);
  end;

implementation

uses
  System.SysUtils, MVCFramework.Logger, System.StrUtils;

procedure TProductsController.GetProducts;
begin

end;

procedure TProductsController.GetProductsByID(
  const id: Integer);
begin
  //just use the paramater "id" as in a normal method!
end;

procedure TProductsController.CreateProduct;
begin

end;

procedure TProductsController.UpdateProduct(const id: Integer);
begin

end;

procedure TProductsController.DeleteProduct(const id: Integer);
begin

end;

end.


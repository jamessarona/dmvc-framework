unit ProductsController;

interface

uses
  MVCFramework, MVCFramework.Commons, MVCFramework.Serializer.Commons;

type

  [MVCPath('/products')] //MVCPath used at controller level
  TProductsController = class(TMVCController)
  public
    [MVCPath()]
    [MVCHTTPMethods([httpGET])]
    [MVCProduces('application/json')]
    procedure GetProducts;

    [MVCPath('/($id)')]
    [MVCHTTPMethods([httpGET])]
    [MVCProduces('application/json')]
    procedure GetProductsByID(const id: Integer);

    [MVCPath()]
    [MVCHTTPMethods([httpPOST])]
    procedure CreateProduct;

    [MVCPath('/($id)')]
    [MVCHTTPMethods([httpPUT])]
    [MVCProduces('application/json')]
    [MVCConsumes('application/json')]
    procedure UpdateProduct(const id: Integer);

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


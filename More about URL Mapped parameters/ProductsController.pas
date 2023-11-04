unit ProductsController;

interface

uses
  MVCFramework, MVCFramework.Commons, MVCFramework.Serializer.Commons;

type

  [MVCPath('/products')] //MVCPath used at controller level
  TProductsController = class(TMVCController)
  public
    [MVCPath('/($id)')]
    [MVCHTTPMethods([httpGET])]
    procedure GetProductsByID(const id: Integer);

    [MVCPath('/categories/($category)')]
    [MVCHTTPMethods([httpGET])]
    procedure GetProductsByCategory(const category: String);

    [MVCPath('/categories/($category)/($offer)')]
    procedure GetProductsByCategoryAndOffer(
    const category: String; const offer: String);

    [MVCPath('/categories/($category)')]
    procedure GetProductsByCategoryAsInt(const category: Integer);

    [MVCPath('/categories/($category)')]
    procedure GetProductsByCategoryAsStr(const category: String);
  end;

implementation

uses
  System.SysUtils, MVCFramework.Logger, System.StrUtils;

procedure TProductsController.GetProductsByID(
  const id: Integer);
begin
  //just use the paramater "id" as in a normal method!
end;

procedure TProductsController.GetProductsByCategory(
  const category: String);
begin
  //just use "category"
end;

procedure TProductsController.GetProductsByCategoryAndOffer(
  const category: String; const offer: String);
begin
  //just use "category" and "offer"
end;

procedure TProductsController.GetProductsByCategoryAsInt(const category: Integer);
begin

end;

procedure TProductsController.GetProductsByCategoryAsStr(const category: string);
begin

end;

end.

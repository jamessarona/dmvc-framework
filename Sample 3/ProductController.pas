unit ProductController;

interface

uses
  MVCFramework, MVCFramework.Commons, MVCFramework.Serializer.Commons;

type

  [MVCPath('/product')]
  TProductController = class(TMVCController) 
  public
    procedure GetProducts;
  end;

implementation

uses
  System.SysUtils, MVCFramework.Logger, System.StrUtils;

procedure TProductController.GetProducts;
begin
  Render('Response from action <action name here>');
end;

end.

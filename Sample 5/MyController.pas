unit MyController;

interface

uses
  MVCFramework, MVCFramework.Commons, MVCFramework.Serializer.Commons;

type

  [MVCPath('/blog')]
  TMyController = class(TMVCController) 
  public
    [MVCPath('/posts/($user)')]
    [MVCHTTPMethod([httpGET])]
    procedure GetArticles;
  end;

implementation

uses
  System.SysUtils, MVCFramework.Logger, System.StrUtils;

procedure TMyController.GetArticles;
var
  year, month: Integer;
  user: string;
begin
  user := Context.Request.Params['user']; //URL mapped param
  year := Context.Request.Params['year'].ToInteger; //QueryString param
  month := Context.Request.ParamsAsInteger['month']; //QueryString param
end;

end.

unit BusinessObjectsU;

interface

uses
  MVCFramework.Serializer.Commons, System.Classes; {add this unit}

type
  [MVCNameCase(ncLowerCase)] {add this attribute}
  TCustomer = class
  private
    fID: Integer;
    fName: String;
    fAddressLine2: String;
    fAddressLine1: String;
    fContactFirst: String;
    fCity: String;
    fContactLast: String;    fCustomerSecret: String;  public
    property ID: Integer
      read fID write fID;
    property Name: String
      read fName write fName;
    property ContactFirst: String
      read fContactFirst write fContactFirst;
    property ContactLast: String
      read fContactLast write fContactLast;
    property AddressLine1: String
      read fAddressLine1 write fAddressLine1;
    property AddressLine2: String
      read fAddressLine2 write fAddressLine2;
    property City: String
      read fCity write fCity;
    [MVCDoNotSerialize] {this property will not serialized}
    property CustomerSecret: String
      read fCustomerSecret write fCustomerSecret;
  end;
  [MVCNameCase(ncLowerCase)] {warning! type attributes are not inherited!}
  TCustomerWithPhoto = class(TCustomer)
  public
    destructor Destroy; override;
  private
    FPhoto: TStream;
    procedure SetPhoto(const Value: TStream);
  public
    property Photo: TStream read FPhoto write SetPhoto;
  end;

  [MVCNameCase(ncLowerCase)]
  TCustomerWithNotes = class(TCustomer)
  public
    destructor Destroy; override;
  private
    FNotes: TStream;
    procedure SetNotes(const Value: TStream);
  public
    property Notes: TStream read FNotes write SetNotes;
  end;

implementation

procedure TCustomerWithPhoto.SetPhoto(const Value: TStream);
begin
  FPhoto.Free;
  FPhoto := Value; {the stream is owned}
end;

destructor TCustomerWithPhoto.Destroy;
begin
  FPhoto.Free;
  inherited;
end;

procedure TCustomerWithNotes.SetNotes(const Value: TStream);
begin
  FNotes.Free;
  FNotes := Value; {the stream is owned}
end;

destructor TCustomerWithNotes.Destroy;
begin
  FNotes.Free;
  inherited;
end;

end.

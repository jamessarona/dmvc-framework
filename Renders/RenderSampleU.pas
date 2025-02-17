unit RenderSampleU;

interface

uses
  MVCFramework, MVCFramework.Commons, MVCFramework.Serializer.Commons;

type

  [MVCPath('/api')] {this controller handles "customers"}
  TRenderSampleController = class(TMVCController) 
  public
    {this route requires a parameter named "id"}
    [MVCPath('/customers/($id)')]
    {and can be called only with GET HTTP verb}
    [MVCHTTPMethods([httpGET])]
    {the action prototype must match with the parameter that we expect from the route}
    procedure GetCustomer(const id: Integer);

    [MVCPath('/customers')]
    [MVCHTTPMethods([httpGET])]
    procedure GetDbCustomers;

    [MVCPath('/people/($id)')]
    [MVCHTTPMethods([httpGET])]
    procedure GetPerson(const id: Integer);

    [MVCPath('/people')]
    [MVCHTTPMethods([httpPOST])]
    procedure CreatePerson;

    [MVCPath('/dictionary')]
    [MVCHTTPMethods([httpGET])]
    procedure GetDictionary;

    [MVCPath('/photo/($id)')]
    [MVCHTTPMethods([httpGET])]
    procedure GetCustomerPhoto(const id: Integer);

    [MVCHTTPMethod([httpPOST])]
    [MVCConsumes(TMVCMediaType.MULTIPART_FORM_DATA)]
    [MCPath('/files')]
    procedure UploadBinaryData;

    [MVCHTTPMethod([httpGET])]
    [MVCPath('/files/($filename)')]
    procedure GetBinaryData(const filename: string);
  end;

implementation

uses
  BusinessObjectsU, System.IOUtils, System.Classes, MVCFramework.Logger,
  MyDataModuleU, System.JSON, System.SysUtils, System.Generics.Collections,
  Web.HTTPApp {where our TCustomer class is declared};

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

procedure TRenderSampleController.GetPerson(const id: Integer);
var
//  lPerson: TPerson;
  lPerson: TJSONObject;
begin
//  lPerson := TPerson.Create;
  lPerson := TJSONObject.Create;
  try
//    lPerson.FirstName := 'James Angelo';
//    lPerson.LastName := 'Sarona';
//    lPerson.Age := 40;
//    lPerson.PrimaryContact.ContactType := 'email';
//    lPerson.PrimaryContact.Value := 'james.sarona@activesystems.ph';

    lPerson.AddPair('firstName', 'James');
    lPerson.AddPair('lastName', 'Sarona');
    lPerson.AddPair('DOB', EncodeDate(1975, 5, 2));
    lPerson.AddPair('married', TJSONTrue.Create);
    Render(lPerson, false);
  finally
    lPerson.Free;
  end;
end;

procedure TRenderSampleController.CreatePerson;
var
  lPerson: TPerson;
  lPeople: TObjectList<TPerson>;
begin
  if Context.Request.QueryStringParam('multi').ToLower() = 'true' then
  begin
    lPeople := Context.Request.BodyAsListOf<TPerson>;
    try
      LogD(lPeople);
    finally
      lPeople.Free;
    end;
    Render201Created('', 'People Created');
  end
  else
  begin
    lPerson := Context.Request.BodyAs<TPerson>;
    try
      LogD(lPerson);
    finally
      lPerson.Free;
    end;
    Render201Created('', 'Person created');
  end;

end;

procedure TRenderSampleController.GetDbCustomers;
var
  lCustomerModule: TMyDataModule;
begin
  lCustomerModule := TMyDataModule.Create(nil);
  try
    lCustomerModule.QryCustomers.Open();
    Render(lCustomerModule.QryCustomers, False);
  finally
    lCustomerModule.Free;
  end;
end;

procedure TRenderSampleController.GetDictionary;
var
  lDict: TMVCStringDictionary;
begin
  lDict := TMVCStringDictionary.Create;
  lDict.Items['prop1'] := 'one';
  lDict.Items['prop2'] := 'two';
  lDict.Items['prop3'] := 'three';
  Render(lDict);
end;

procedure TRenderSampleController.GetCustomerPhoto(const id: Integer);
var
  ContentType: String;
begin
  ContentType := TMVCMediaType.IMAGE_PNG;
  Render(TFile.OpenRead('..\..\person.png'));

//  ContentType := TMVCMediaType.APPLICATION_PDF;
//  Render(TFile.OpenRead('..\..\invoice.pd'));

end;

procedure TRenderSampleController.UploadBinaryData;
var
  lFile: TAbstractWebRequestFile;
  lFileExt: string;
  lOutputFileName: string;
  lOutputFullPath: string;
  lOutFile: TFileStream;
  lOutputFolder: string;
begin
  if Context.Request.Files.Count <> 1 then
    raise EMVCException.Create(HTTP_STATUS.BadRequest, 'Expected exactly 1 file');

  lFile := Context.Request.Files[0];

  LogI(Format('Upload: [FieldName: %s] [FileName: %s] [ContentType: %s] [Size: %d bytes]',
  [lFile.FieldName, lFile.filename, lFile.ContentType, lFile.Stream.Size]));

  { Be sure that our data directory always exists. We could also do it in the server startup. }
  lOutputFolder := TPath.Combine(AppPath, 'uploadedfiles');
  if not TDirectory.Exists(lOutputFolder) then
    TDirectory.CreateDirectory(lOutputFolder);
  lFileExt := TPath.GetExtension(lFile.filename);
  {
    Here we could check for allowed extensions or check the file contents looking for
    accepted file headers (e.g. Zip, PNG, BMP, TIFF etc).
    In this case we just use the extension of the filename sent by the client.
  }

  { Find a valid random filename to store the stream on disk. }
  repeat
    lOutputFileName := TPath.ChangeExtension(TPath.GetRandomFileName, lFileExt);
    lOutputFullPath := TPath.Combine(lOutputFolder, lOutputFileName);
  until not TFile.Exists(lOutputFullPath);

  lOutFile := TFileStream.Create(lOutputFullPath, fmCreate);
  try
    lOutFile.CopyFrom(lFile.Stream, 0);
  finally
    lOutFile.Free;
  end;

 { Inform the client about the name assigned to the file on disk and how to retrieve it. }
  Context.Response.ContentType := TMVCMediaType.APPLICATION_JSON;
  Context.Response.StatusCode := HTTP_STATUS.OK;
  Render(StrDict(['filename', 'ref'], [lOutputFileName, '/files/' + lOutputFileName]));
  end;

procedure TRenderSampleController.GetBinaryData(const filename: string);
var
  lFilesFolder: string;
  lFullFilePath: string;
begin
  lFilesFolder := TPath.Combine(AppPath, 'uploadedfiles');
  lFullFilePath := TPath.Combine(lFilesFolder, filename);
  if not TFile.Exists(lFullFilePath) then
  begin
   raise EMVCException.Create('File not found');
  end;
  Context.Response.ContentType := TMVCMediaType.APPLICATION_OCTET_STREAM;
  Context.Response.StatusCode := HTTP_STATUS.OK;
  Context.Response.CustomHeaders.Values['Content-Disposition'] := 'attachment; filename=' +
  filename + ';';
  Render(TFileStream.Create(lFullFilePath, fmOpenRead or fmShareDenyNone));end;

end.

object MyDataModule: TMyDataModule
  Height = 451
  Width = 575
  object Connection: TFDConnection
    Params.Strings = (
      'User_Name=root'
      'Password=M@st3rk3y'
      'Port=3306'
      'Database=renders'
      'Server=127.0.0.1'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 176
    Top = 96
  end
  object QryCustomers: TFDQuery
    Connection = Connection
    SQL.Strings = (
      'select * from EMPLOYEE')
    Left = 176
    Top = 192
    object QryCustomersCUSTOMER_NO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CUSTOMER_NO'
      Origin = 'CUSTOMER_NO'
    end
    object QryCustomersCUSTOMER: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CUSTOMER'
      Origin = 'CUSTOMER'
      Size = 50
    end
    object QryCustomersCONTACT_FIRST: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CONTACT_FIRST'
      Origin = 'CONTACT_FIRST'
      Size = 25
    end
    object QryCustomersCONTACT_LAST: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CONTACT_LAST'
      Origin = 'CONTACT_LAST'
      Size = 25
    end
    object QryCustomersPHONE_NO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PHONE_NO'
      Origin = 'PHONE_NO'
      Size = 15
    end
    object QryCustomersADDRESS_LINE1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ADDRESS_LINE1'
      Origin = 'ADDRESS_LINE1'
      Size = 255
    end
    object QryCustomersADDRESS_LINE2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ADDRESS_LINE2'
      Origin = 'ADDRESS_LINE2'
      Size = 255
    end
    object QryCustomersCITY: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CITY'
      Origin = 'CITY'
      Size = 50
    end
    object QryCustomersSTATE_PROVINCE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'STATE_PROVINCE'
      Origin = 'STATE_PROVINCE'
      Size = 10
    end
    object QryCustomersCOUNTRY: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COUNTRY'
      Origin = 'COUNTRY'
      Size = 50
    end
    object QryCustomersPOSTAL_CODE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'POSTAL_CODE'
      Origin = 'POSTAL_CODE'
      Size = 10
    end
    object QryCustomersON_HOLD: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ON_HOLD'
      Origin = 'ON_HOLD'
      Size = 10
    end
  end
end

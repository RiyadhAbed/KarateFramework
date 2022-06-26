Feature: Post New Account

Background: 
    Given url 'https://tek-insurance-api.azurewebsites.net/'
    * def result = callonce read('GenerateToken.feature')
    * def token = result.token
    * headers {Authorization:'#("Bearer " + token)'}
    
    @PostNewAccount
    Scenario: Post New Account
    Given path 'api/accounts/add-account'
    When request
    """
    {
  "primaryPerson": {
    "email": "Riyadh.181@tekschool.us",
    "title": "MR.",
    "firstName": "RIYADH",
    "lastName": "ABED",
    "gender": "MALE",
    "maritalStatus": "MARRIED",
    "employmentStatus": "EMPLOYE",
    "dateOfBirth": "10/13/1980"
  },
  "primaryPersonMailingAddress": {
    "addressType": "HOUSE",
    "addressLine1": "1149 WELLINGTON DR",
    "city": "HARRISONBURG",
    "state": "VA",
    "postalCode": "22802",
    "countryCode": "001"
  },
  "primaryPersonPhone": {
    "phoneNumber": "7034567890",
    "phoneExtension": "123",
    "phoneTime": "DAY",
    "phoneType": "CELL"
  }
}
"""
And method post
Then status 201
* print response

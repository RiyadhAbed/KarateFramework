Feature: Create account in Insurance

  Background: 
    Given url 'https://tek-insurance-api.azurewebsites.net/'
    * def result = callonce read('GenerateToken.feature')
    * def token = result.token
    * headers {Authorization:'#("Bearer " + token)'}

  @postMethodTest
  Scenario: Add Account Test
    Given path 'api/accounts/add-account'
    When request
      """
      {
      "primaryPerson": {
      "email": "RiyadhAbed.105022@gmail.com",
      "title": "MR.",
      "firstName": "RIYADH",
      "lastName": "ABED",
      "gender": "MALE",
      "maritalStatus": "MARRIED",
      "employmentStatus": "STUDENT",
      "dateOfBirth": "1/10/1990"
      },
      "primaryPersonMailingAddress": {
      "addressType": "HOUSE",
      "addressLine1": "123 WASHINGTON DR",
      "city": "HARRISONBURG",
      "state": "VA",
      "postalCode": "22802",
      "countryCode": "001"
      },
      "primaryPersonPhone": {
      "phoneNumber": "7033987654",
      "phoneExtension": "",
      "phoneTime": "day",
      "phoneType": "cell"
      }
      }
      """
    And method post
    Then status 201
    * print response
    * def status = response.primaryPersonMailingAddresses.status
    * print status
    * def phoneNumber = response.primaryPersonPhones.phoneNumber
    * print phoneNumber

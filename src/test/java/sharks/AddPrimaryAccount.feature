Feature: Add primary Account

  Background: 
    Given url 'https://tek-insurance-api.azurewebsites.net/'
    * def result = callonce read('GenerateToken.feature')
    * def token = result.token
    * headers {Authorization:'#("Bearer " + token)'}

  @postNewPrimaryAccount
  Scenario: Add primary Account one
    Given path 'api/accounts/add-primary-account'
    When request
      """
      {
      "email": "Riyadh.144411@gmail.com",
      "title": "MR.",
      "firstName": "SAWSAWW",
      "lastName": "AASSWED",
      "gender": "MALE",
      "maritalStatus": "MARRIED",
      "employmentStatus": "STUDENT",
      "dateOfBirth": "10/10/1985"
      }
      """
    And method post
    Then status 201
    * print response

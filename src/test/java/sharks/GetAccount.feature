Feature: Get Accounts 

Background: 
    Given url 'https://tek-insurance-api.azurewebsites.net/'
    * def result = callonce read('GenerateToken.feature')
    * def token = result.token
    * headers {Authorization:'#("Bearer " + token)'} 
    
    @GetAccounts
    Scenario: Get Accounts Test
    Given path 'api/accounts/get-account'
    And param primaryPersonId = 4873
    And method get
    * status 200
    * print response 
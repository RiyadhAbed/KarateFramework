Feature: Cet Accounts Test


  Background: 
    Given url 'https://tek-insurance-api.azurewebsites.net/'
    * def result = callonce read('GenerateToken.feature')
    * def token = result.token
    * headers {Authorization:'#("Bearer " + token)'}
    
    @GetAccountTest1
    Scenario: Get Account
    Given path 'api/accounts/get-account'
    And param primaryPersonId = 4873
    * method get
    And status 200
    * print response 
    
Feature: Insurence API Automation

  Background: 
    Given url 'https://tek-insurance-api.azurewebsites.net/'
    * def result = call read('GenerateToken.feature')
    * def token = result.token

  @getAccount
  Scenario: GetAccount
    Given headers {Authorization:'#("Bearer " + token)'}
    * path 'api/accounts/get-account'
    * param primaryPersonId = 4225 , 4227
    When method get
    Then status 200
    And print response

  @getAllAccount
  Scenario: Get All Accounts
    Given headers {Authorization: '#("Bearer " + token)'}
    And path 'api/accounts/get-all-accounts'
    When method get
    Then status 200
    And print response

  @getPrimaryAccount
  Scenario: get primary Account
    Given headers {Authorization: '#("Bearer " + token)'}
    And path 'api/accounts/get-primary-account'
    And param primaryPersonId = 499
    When method get
    Then status 200
    And print response
    * def id = response.id
    * match id ==499
    * def email = response.email
    * match email !contains '@gmail.com'

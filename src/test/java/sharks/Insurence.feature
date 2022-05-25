Feature: Insurence API Automation

Background:
Given url 'https://tek-insurance-api.azurewebsites.net/'
And path 'api/token'
When request {"username": "admin","password": "admin"}
And method post
Then status 200
And print response 
* def token = response.token
* print token 

@getAccount
Scenario: GetAccount
Given headers {Authorization:'#("Bearer " + token)'}
* path 'api/accounts/get-account'
* param primaryPersonId = 500
When method get
Then status 200
And print response
Feature: Sign Up

    Background:
      Given I send and accept JSON

    Scenario: Successful sign up
      When I send a POST request to "/api/v1/users" with the following:
      """
      {
        "user" : {
          "first_name": "Saul",
          "last_name": "Hudson",
          "email": "slash@gmail.com",
          "password": "sekr@t123",
          "password_confirmation": "sekr@t123"
        }
      }
      """
      Then the response status should be "201"
      And the JSON response should have "auth_token"
      And the JSON response at "auth_token" should be a string
      And the JSON response at "user_role" should be "user"
      And the JSON response at "first_name" should be "Saul"
      And the JSON response at "last_name" should be "Hudson"
      Given I keep the JSON response at "auth_token" as "AUTH_TOKEN"
      Then the user with email "slash@gmail.com" should have "%{AUTH_TOKEN}" as his authentication_token
      And a user should be present with the following
        |first_name|Saul|
        |last_name|Hudson|
        |email|slash@gmail.com|


    Scenario: Passwords do not match
      When I send a POST request to "/api/v1/users" with the following:
      """
      {
        "user" : {
          "first_name": "Kobe",
          "last_name": "Bryant",
          "email": "kobe@gmail.com",
          "password": "kobe1234",
          "password_confirmation": "kobe12345"
        }
      }
      """
      Then the response status should be "422"
      And the JSON response should be:
      """
      {"errors" : ["Password confirmation doesn't match Password"]}
      """

    Scenario: Email is already taken
      Given "Adam" is a user with email id "user@gmail.com" and password "password123"
      When I send a POST request to "/api/v1/users" with the following:
      """
      {
        "user" : {
          "first_name": "Kobe",
          "last_name": "Bryant",
          "email": "user@gmail.com",
          "password": "kobe1234",
          "password_confirmation": "kobe1234"
        }
      }
      """
      Then the response status should be "422"
      And the JSON response should be:
      """
      {"errors" : ["Email has already been taken"]}
      """

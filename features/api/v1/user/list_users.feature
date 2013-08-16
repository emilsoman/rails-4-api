Feature: List Users

    Background:
      Given I send and accept JSON

    Scenario: Successfully list users when logged in user is admin
      Given the following users exist
        |id|email           |first_name |last_name  |password |authentication_token|role |
        |10|user1@gmail.com |First      |User       |test1234 |auth_token_123      |user |
        |11|user2@gmail.com |Second     |User       |test1234 |auth_token_223      |user |
        |12|user3@gmail.com |Third      |User       |test1234 |auth_token_323      |user |
        |13|user4@gmail.com |Fourth     |User       |test1234 |auth_token_423      |user |
        |14|user5@gmail.com |Fifth      |User       |test1234 |auth_token_523      |admin|
      When I authenticate as the user "auth_token_523" with the password "random string"
      And I send a GET request to "/api/users"
      And the JSON response should be:
      """
      {
        "users": [
          {
            "email": "user1@gmail.com",
            "first_name": "First",
            "last_name": "User"
          },
          {
            "email": "user2@gmail.com",
            "first_name": "Second",
            "last_name": "User"
          },
          {
            "email": "user3@gmail.com",
            "first_name": "Third",
            "last_name": "User"
          },
          {
            "email": "user4@gmail.com",
            "first_name": "Fourth",
            "last_name": "User"
          },
          {
            "email": "user5@gmail.com",
            "first_name": "Fifth",
            "last_name": "User"
          }
        ]
      }
      """
      Then the response status should be "200"

    Scenario: Logged in user is not admin
      Given the following users exist
        |id|email           |first_name |last_name  |password |authentication_token|role |
        |10|user1@gmail.com |First      |User       |test1234 |auth_token_123      |user |
        |11|user2@gmail.com |Second     |User       |test1234 |auth_token_223      |user |
        |12|user3@gmail.com |Third      |User       |test1234 |auth_token_323      |user |
        |13|user4@gmail.com |Fourth     |User       |test1234 |auth_token_423      |user |
        |14|user5@gmail.com |Fifth      |User       |test1234 |auth_token_523      |admin|
      When I authenticate as the user "auth_token_123" with the password "random string"
      And I send a GET request to "/api/users"
      Then the response status should be "403"
      And the JSON response should be:
      """
      {"errors" : ["Insufficient privileges"]}
      """

    Scenario: User is not authenticated
      When I authenticate as the user "invalid_auth_token" with the password "random string"
      And I send a GET request to "/api/users"
      Then the response status should be "401"
      And the JSON response should be:
      """
      { "errors": ["Invalid login"] }
      """

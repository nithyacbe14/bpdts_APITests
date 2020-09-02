Feature: Rest API Tests

  Scenario: Retrieve List of users
    Given a rest api "baseURL"
    When the system requests GET "/users"
    And trace out the response
    Then the response code is 200
    And the response body contains
      | id | first_name | last_name | email                  | ip_address     | latitude  | longitude    |
      | 1  | Maurise    | Shieldon  | mshieldon0@squidoo.com | 192.57.232.111 | 34.003135 | -117.7228641 |

  Scenario: Retrieve Instruction details
    Given a rest api "baseURL"
    When the system requests GET "/instructions"
    And trace out the response
    Then the response code is 200

  Scenario: Retrieve List of users living in London
    Given a rest api "baseURL"
    And path parameters
      | city| London |
    When the system requests GET "/city/{city}/users"
    Then the response code is 200
    And trace out the response
    And the response body contains
      | id  | first_name | last_name | email                  | ip_address     | latitude   | longitude  |
      | 135 | Mechelle   | Boam      | mboam3q@thetimes.co.uk | 113.71.242.187 | -6.5115909 | 105.652983 |

  Scenario: Retrieve specific user id details
    Given a rest api "baseURL"
    And path parameters
      | id | 135 |
    When the system requests GET "/user/{id}"
    And trace out the response
    Then the response code is 200
    And the response body contains
      | id  | first_name | last_name | email                  | ip_address     | latitude   | longitude  |
      | 135 | Mechelle   | Boam      | mboam3q@thetimes.co.uk | 113.71.242.187 | -6.5115909 | 105.652983 |

  Scenario: Retrieve invalid user id
    Given a rest api "baseURL"
    And path parameters
      | id | 1350000** |
    When the system requests GET "/user/{id}"
    And trace out the response
    Then the response code is 404
    And the response contains "Id 1350000** doesn't exist"










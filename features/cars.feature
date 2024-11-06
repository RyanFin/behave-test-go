Feature: Car Information API

  Scenario: Health check endpoint
    Given the Go application is running
    When I make a GET request to "/health"
    Then I should receive a 200 status code
    And the response should contain "status" with value "healthy"

  Scenario: Get car information
    Given the Go application is running
    When I make a GET request to "/cars"
    Then I should receive a 200 status code
    And the response should contain a list of cars
    And each car should have "make", "model", and "year" fields

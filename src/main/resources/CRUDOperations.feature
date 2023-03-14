@All
Feature: Perform CRUD operations on Heroku booking app with unique bookingid created for every scenario

Background: Check the app is healthy
  Given Verify the API endpoint healthcheck
  Given the request is for "Create" Booking
    """
    {
    "firstname" : "Kenny",
    "lastname" : "Sebastian",
    "totalprice" : "280",
    "depositpaid" : "true",
    "bookingdates" : {
        "checkin" : "2023-02-01",
        "checkout" : "2023-02-10"
    },
    "additionalneeds" : "Breakfast"
}
    """
  When I send a "POST" request
  Then the response is present
  And the response code is 200
  And the response has firstname as "Kenny"
  And the response has lastname as "Sebastian"
  And the response has totalprice as 280
  And the response has depositpaid as "true"
  And the response has checkin as "2023-02-01"
  And the response has checkout as "2023-02-10"
  And the response has additionalneeds as "Breakfast"

@Get
  Scenario: Get Booking details for the Created request
    When I send a "GET" request
    Then the response is present
    And the response code is 200
    And the updated response has firstname as "Kenny"
    And the updated response has lastname as "Sebastian"
    And the updated response has totalprice as 280
    And the updated response has depositpaid as "true"
    And the updated response has checkin as "2023-02-01"
    And the updated response has checkout as "2023-02-10"
    And the updated response has additionalneeds as "Breakfast"

  @Put
  Scenario: Updating the entire Created booking
    Given the request is for "Update" Booking
    """
    {
    "firstname" : "Mahat",
    "lastname" : "Rana",
    "totalprice" : "240",
    "depositpaid" : "true",
    "bookingdates" : {
        "checkin" : "2023-02-01",
        "checkout" : "2023-02-12"
    },
    "additionalneeds" : "Breakfast"
}
    """
    When I send a "PUT" request
    Then the response is present
    And the response code is 200
    And the updated response has firstname as "Mahat"
    And the updated response has lastname as "Rana"
    And the updated response has totalprice as 240
    And the updated response has depositpaid as "true"
    And the updated response has checkin as "2023-02-01"
    And the updated response has checkout as "2023-02-12"
    And the updated response has additionalneeds as "Breakfast"

    @Patch
  Scenario: Modifying some fields for the Updated booking
    Given the request is for "PartialUpdate" Booking
    """
    {
    "firstname" : "Kunal",
    "lastname" : "Kapoor",
    "totalprice" : "240",
    "depositpaid" : "true",
    "bookingdates" : {
        "checkin" : "2023-02-01",
        "checkout" : "2023-02-12"
    },
    "additionalneeds" : "Breakfast"
}
    """
    When I send a "PATCH" request
    Then the response is present
    And the response code is 200
    And the updated response has firstname as "Kunal"
    And the updated response has lastname as "Kapoor"
    And the updated response has totalprice as 240
    And the updated response has depositpaid as "true"
    And the updated response has checkin as "2023-02-01"
    And the updated response has checkout as "2023-02-12"
    And the updated response has additionalneeds as "Breakfast"

      @GetAll
  Scenario: Get all the Booking ID's
    When I send a "GET" request to get all Booking ID details
    Then the response is present
    And the response code is 200
    And the response has my bookingID

        @Delete
  Scenario: Delete the Created booking
    When I send a "DELETE" request
    Then the response is present
    And the response code is 201
    And the response body has message "Created"
@All @CRUD
Feature: Performing CRUD operations on Heroku booking app in one single scenario

  Scenario Outline: Create a booking, Update, Partial Update, Get, Delete the booking
    Given Verify the API endpoint healthcheck
    Given the request is for "Create" Booking
 """
    {
    "firstname" : <FN>,
    "lastname" : <LN>,
    "totalprice" : "<PR>",
    "depositpaid" : "<DP>",
    "bookingdates" : {
        "checkin" : "<CKIN>",
        "checkout" : "<CKOUT>"
    },
    "additionalneeds" : "<AN>"
}
    """
    When I send a "POST" request
    Then the response is present
    And the response code is 200
    And the response has firstname as "<FN>"
    And the response has lastname as "<LN>"
    And the response has totalprice as "<PR>"
    And the response has depositpaid as "<DP>"
    And the response has checkin as "<CKIN>"
    And the response has checkout as "<CKOUT>"
    And the response has additionalneeds as "<AN>"

    | FN         |LN            |PR    | DP      | CKIN             | CKOUT         | AN              |
    | "Rohit"   | "Sharma" | 740 |  true  |2023-03-01 | 2023-03-10 | Breakfast|
    | Rishab | Pant       | 460 | true   |2023-03-02 | 2023-03-11 | Breakfast|
    | Virat     | Kohli      | 580 | true   |2023-03-03 | 2023-03-12 | Breakfast|
    | Anil       | Kumble | 820 | true   |2023-03-04 | 2023-03-13 | Breakfast|
    | Yuzi       | Chahal   | 950 | true   |2023-03-05 | 2023-03-14 | Breakfast|


    Given Verify the API endpoint healthcheck
    When I send a "GET" request
    Then the response is present
    And the response code is 200
    And the updated response has firstname as "<FN>"
    And the updated response has lastname as "<LN>"
    And the updated response has totalprice as "<PR>"
    And the updated response has depositpaid as "<DP>"
    And the updated response has checkin as "<CKIN>"
    And the updated response has checkout as "<CKOUT>"
    And the updated response has additionalneeds as "<AN>"

      | FN         |LN            |PR    | DP      | CKIN             | CKOUT         | AN              |
      | Rohit   | Sharma | 740 |  true  |2023-03-01 | 2023-03-10 | Breakfast|
      | Rishab | Pant       | 460 | true   |2023-03-02 | 2023-03-11 | Breakfast|
      | Virat     | Kohli      | 580 | true   |2023-03-03 | 2023-03-12 | Breakfast|
      | Anil       | Kumble | 820 | true   |2023-03-04 | 2023-03-13 | Breakfast|
      | Yuzi       | Chahal   | 950 | true   |2023-03-05 | 2023-03-14 | Breakfast|


    Given Verify the API endpoint healthcheck
    Given the request is for "Update" Booking
 """
    {
    "firstname" : "<FN>",
    "lastname" : "<LN>",
    "totalprice" : "<PR>",
    "depositpaid" : "<DP>",
    "bookingdates" : {
        "checkin" : "<CKIN>",
        "checkout" : "<CKOUT>"
    },
    "additionalneeds" : "<AN>"
}
    """
    When I send a "PUT" request
    Then the response is present
    And the response code is 200
    And the updated response has firstname as "<FN>"
    And the updated response has lastname as "<LN>"
    And the updated response has totalprice as "<PR>"
    And the updated response has depositpaid as "<DP>"
    And the updated response has checkin as "<CKIN>"
    And the updated response has checkout as "<CKOUT>"
    And the updated response has additionalneeds as "<AN>"

      | FN         |LN            |PR    | DP      | CKIN             | CKOUT         | AN              |
      | Sachin   | Tendulkar | 440 |  true  |2023-03-01 | 2023-03-5 | Breakfast and Blanket|
      | Ravindra  | Jadeja       | 820 | true   |2023-03-02 | 2023-03-6 | Breakfast and Blanket|
      | Hardik     | Pandya      | 650 | true   |2023-03-03 | 2023-03-7 | Breakfast and Blanket|
      | Krunal       | Pandya | 760 | true   |2023-03-04 | 2023-03-8 | Breakfast and Blanket|
      | Bhuvaneshwar       | Kumar   | 980 | true   |2023-03-05 | 2023-03-9 | Breakfast and Blanket|


    Given Verify the API endpoint healthcheck
    When I send a "GET" request
    Then the response is present
    And the response code is 200
    And the updated response has firstname as "<FN>"
    And the updated response has lastname as "<LN>"
    And the updated response has totalprice as "<PR>"
    And the updated response has depositpaid as "<DP>"
    And the updated response has checkin as "<CKIN>"
    And the updated response has checkout as "<CKOUT>"
    And the updated response has additionalneeds as "<AN>"

      | FN         |LN            |PR    | DP      | CKIN             | CKOUT         | AN              |
      | Sachin   | Tendulkar | 440 |  true  |2023-03-01 | 2023-03-5 | Breakfast and Blanket|
      | Ravindra  | Jadeja       | 820 | true   |2023-03-02 | 2023-03-6 | Breakfast and Blanket|
      | Hardik     | Pandya      | 650 | true   |2023-03-03 | 2023-03-7 | Breakfast and Blanket|
      | Krunal       | Pandya | 760 | true   |2023-03-04 | 2023-03-8 | Breakfast and Blanket|
      | Bhuvaneshwar       | Kumar   | 980 | true   |2023-03-05 | 2023-03-9 | Breakfast and Blanket|

    Given Verify the API endpoint healthcheck
    Given the request is for "PartialUpdate" Booking
  """
    {
    "firstname" : "<FN>",
    "lastname" : "<LN>",
    "totalprice" : "<PR>",
    "depositpaid" : "<DP>",
    "bookingdates" : {
        "checkin" : "<CKIN>",
        "checkout" : "<CKOUT>"
    },
    "additionalneeds" : "<AN>"
}
    """
    When I send a "PATCH" request
    Then the response is present
    And the response code is 200
    And the updated response has firstname as "<FN>"
    And the updated response has lastname as "<LN>"
    And the updated response has totalprice as "<PR>"
    And the updated response has depositpaid as "<DP>"
    And the updated response has checkin as "<CKIN>"
    And the updated response has checkout as "<CKOUT>"
    And the updated response has additionalneeds as "<AN>"

      | FN         |LN            |PR    | DP      | CKIN             | CKOUT         | AN              |
      | Anil   | Ambani | 440 |  true  |2023-03-01 | 2023-03-5 | Breakfast and Blanket|
      | Mukesh  | Ambani       | 820 | true   |2023-03-02 | 2023-03-6 | Breakfast and Blanket|
      | Ratan     | Tata      | 650 | true   |2023-03-03 | 2023-03-7 | Breakfast and Blanket|
      | Narayana       | Murthy | 760 | true   |2023-03-04 | 2023-03-8 | Breakfast and Blanket|
      | Sunil       | Mittal   | 980 | true   |2023-03-05 | 2023-03-9 | Breakfast and Blanket|

    Given Verify the API endpoint healthcheck
    When I send a "GET" request
    Then the response is present
    And the response code is 200
    And the updated response has firstname as "<FN>"
    And the updated response has lastname as "<LN>"
    And the updated response has totalprice as "<PR>"
    And the updated response has depositpaid as "<DP>"
    And the updated response has checkin as "<CKIN>"
    And the updated response has checkout as "<CKOUT>"
    And the updated response has additionalneeds as "<AN>"

      | FN         |LN            |PR    | DP      | CKIN             | CKOUT         | AN              |
      | Anil   | Ambani | 440 |  true  |2023-03-01 | 2023-03-5 | Breakfast and Blanket|
      | Mukesh  | Ambani       | 820 | true   |2023-03-02 | 2023-03-6 | Breakfast and Blanket|
      | Ratan     | Tata      | 650 | true   |2023-03-03 | 2023-03-7 | Breakfast and Blanket|
      | Narayana       | Murthy | 760 | true   |2023-03-04 | 2023-03-8 | Breakfast and Blanket|
      | Sunil       | Mittal   | 980 | true   |2023-03-05 | 2023-03-9 | Breakfast and Blanket|

    Given Verify the API endpoint healthcheck
    When I send a "GET" request to get all Booking ID details
    Then the response is present
    And the response code is 200
    And the response has my bookingID

    Given Verify the API endpoint healthcheck
    When I send a "DELETE" request
    Then the response is present
    And the response code is 201
    And the response body has message "Created"


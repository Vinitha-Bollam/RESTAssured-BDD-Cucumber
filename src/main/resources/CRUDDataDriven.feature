@All @CRUD
Feature: Performing CRUD operations on Heroku booking app in one single scenario with Data Driven Approach

  Scenario Outline: Create a booking, Update, Partial Update, Get, Delete the booking
    Given Verify the API endpoint healthcheck
    Given the request is for "Create" Booking
 """
    {
    "firstname" : <FN>,
    "lastname" : <LN> ,
    "totalprice" : <PR>,
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
    And the response has firstname as <FN>
    And the response has lastname as <LN>
    And the response has totalprice as <PR>
    And the response has depositpaid as "<DP>"
    And the response has checkin as "<CKIN>"
    And the response has checkout as "<CKOUT>"
    And the response has additionalneeds as "<AN>"




    Given Verify the API endpoint healthcheck
    When I send a "GET" request
    Then the response is present
    And the response code is 200
    And the updated response has firstname as <FN>
    And the updated response has lastname as <LN>
    And the updated response has totalprice as <PR>
    And the updated response has depositpaid as "<DP>"
    And the updated response has checkin as "<CKIN>"
    And the updated response has checkout as "<CKOUT>"
    And the updated response has additionalneeds as "<AN>"



    Given Verify the API endpoint healthcheck
    And the request is for "Update" Booking
 """
    {
    "firstname" : <PUTFN>,
    "lastname" : <PUTLN>,
    "totalprice" : <PUTPR>,
    "depositpaid" : "<PUTDP>",
    "bookingdates" : {
        "checkin" : "<PUTCKIN>",
        "checkout" : "<PUTCKOUT>"
    },
    "additionalneeds" : "<PUTAN>"
}
    """
    When I send a "PUT" request
    Then the response is present
    And the response code is 200
    And the updated response has firstname as <PUTFN>
    And the updated response has lastname as <PUTLN>
    And the updated response has totalprice as <PUTPR>
    And the updated response has depositpaid as "<PUTDP>"
    And the updated response has checkin as "<PUTCKIN>"
    And the updated response has checkout as "<PUTCKOUT>"
    And the updated response has additionalneeds as "<PUTAN>"


    Given Verify the API endpoint healthcheck
    When I send a "GET" request
    Then the response is present
    And the response code is 200
    And the updated response has firstname as <PUTFN>
    And the updated response has lastname as <PUTLN>
    And the updated response has totalprice as <PUTPR>
    And the updated response has depositpaid as "<PUTDP>"
    And the updated response has checkin as "<PUTCKIN>"
    And the updated response has checkout as "<PUTCKOUT>"
    And the updated response has additionalneeds as "<PUTAN>"


    Given Verify the API endpoint healthcheck
    And the request is for "PartialUpdate" Booking
  """
    {
    "firstname" : <PATCHFN>,
    "lastname" : <PATCHLN>,
    "totalprice" : <PATCHPR>,
    "depositpaid" : "<PATCHDP>",
    "bookingdates" : {
        "checkin" : "<PATCHCKIN>",
        "checkout" : "<PATCHCKOUT>"
    },
    "additionalneeds" : "<PATCHAN>"
}
    """
    When I send a "PATCH" request
    Then the response is present
    And the response code is 200
    And the updated response has firstname as <PATCHFN>
    And the updated response has lastname as <PATCHLN>
    And the updated response has totalprice as <PATCHPR>
    And the updated response has depositpaid as "<PATCHDP>"
    And the updated response has checkin as "<PATCHCKIN>"
    And the updated response has checkout as "<PATCHCKOUT>"
    And the updated response has additionalneeds as "<PATCHAN>"



    Given Verify the API endpoint healthcheck
    When I send a "GET" request
    Then the response is present
    And the response code is 200
    And the updated response has firstname as <PATCHFN>
    And the updated response has lastname as <PATCHLN>
    And the updated response has totalprice as <PATCHPR>
    And the updated response has depositpaid as "<PATCHDP>"
    And the updated response has checkin as "<PATCHCKIN>"
    And the updated response has checkout as "<PATCHCKOUT>"
    And the updated response has additionalneeds as "<PATCHAN>"


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

    Examples:
      | FN              |LN                 |PR    | DP      | CKIN           | CKOUT        | AN            |  PUTFN                    |PUTLN                |PUTPR    | PUTDP      | PUTCKIN    | PUTCKOUT| PUTAN                              | PATCHFN         |PATCHLN   |PATCHPR    | PATCHDP      | PATCHCKIN   | PATCHCKOUT       | PATCHAN                      |
      | "Rohit"      | "Sharma"   | 740 |  true  |2023-03-01 | 2023-03-10 | Breakfast| "Sachin"                 | "Tendulkar"     | 440         |  true         |2023-03-01 | 2023-03-05 | Breakfast and Blanket    | "Anil"              | "Ambani"  | 440             |  true               |2023-03-01    | 2023-03-05          | Breakfast and Blanket|
      | "Rishab"    | "Pant"        | 460 | true   |2023-03-02 | 2023-03-11 | Breakfast| "Ravindra"             | "Jadeja"            | 820         | true         |2023-03-02 | 2023-03-06 | Breakfast and Blanket    | "Mukesh"       | "Ambani"  | 820             | true                |2023-03-02    | 2023-03-06          | Breakfast and Blanket|
      | "Virat"       | "Kohli"       | 580 | true   |2023-03-03 | 2023-03-12 | Breakfast| "Hardik"                  | "Pandya"          | 650         | true         |2023-03-03 | 2023-03-07 | Breakfast and Blanket    | "Ratan"           | "Tata"       | 650              | true                |2023-03-03    | 2023-03-07         | Breakfast and Blanket|
      |"Anil"          | "Kumble"   | 820 | true   |2023-03-04 | 2023-03-13 | Breakfast| "Krunal"                  | "Pandya"          | 760         | true         |2023-03-04 | 2023-03-08 | Breakfast and Blanket   | "Narayana"     | "Murthy"  | 760              | true                |2023-03-04    | 2023-03-08         | Breakfast and Blanket|
      | "Yuzi"         | "Chahal"    | 950 | true   |2023-03-05 | 2023-03-14 | Breakfast|"Bhuvaneshwar"   | "Kumar"            | 980         | true         |2023-03-05 | 2023-03-09 | Breakfast and Blanket   | "Sunil"             | "Mittal"     | 980              | true                |2023-03-05    | 2023-03-09         | Breakfast and Blanket|
package ReusableClasses;

import io.restassured.response.Response;
import static io.restassured.RestAssured.baseURI;
import static io.restassured.RestAssured.given;

public class GetBooking {

    public static int bookingID;

    public GetBooking(int bookingID) {
        this.bookingID = bookingID;
    }

    public Response getBooking() {
        baseURI = "https://restful-booker.herokuapp.com";

        Response response = given()
                .header("Content-Type", "application/json")
                .when()
                .get("/booking/" + bookingID)
                .then()
                .extract()
                .response();
        return response;
    }
    }


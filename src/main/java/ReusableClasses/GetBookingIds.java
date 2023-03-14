package ReusableClasses;

import io.restassured.response.Response;
import static io.restassured.RestAssured.baseURI;
import static io.restassured.RestAssured.given;

public class GetBookingIds {

    private final int bookingID;

    public GetBookingIds(int bookingID) {
        this.bookingID = bookingID;
    }

    public  Response getAllBookingIds()
    {
        baseURI = "https://restful-booker.herokuapp.com";

        Response response = given()
                .when()
                .get("/booking")
                .then()
                .statusCode(200)
                .extract()
                .response();
        return response;
    }
}

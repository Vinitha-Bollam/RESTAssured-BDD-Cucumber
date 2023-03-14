package ReusableClasses;

import io.restassured.response.Response;
import static io.restassured.RestAssured.baseURI;
import static io.restassured.RestAssured.given;

public class PartialUpdateBooking {

    CreateToken T = new CreateToken();
    private String request;
    private String token;
    public static int bookingID;

    public PartialUpdateBooking(String request, int bookingID)
    {
        this.request = request;
        this.bookingID = bookingID;
    }

    public Response partialUpdateBooking() {
        baseURI = "https://restful-booker.herokuapp.com";

        token = T.createToken();

        Response response = given()
                .header("cookie", "token="+token)
                .contentType("application/json")
                .and()
                .body(request)
                .when()
                .patch("/booking/"+bookingID)
                .then()
                .extract()
                .response();

        return response;
    }
}


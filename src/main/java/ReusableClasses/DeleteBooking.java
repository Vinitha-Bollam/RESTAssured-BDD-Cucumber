package ReusableClasses;

import io.restassured.response.Response;
import static io.restassured.RestAssured.baseURI;
import static io.restassured.RestAssured.given;

public class DeleteBooking {

    CreateToken T = new CreateToken();
    private String request;
    private String token;
    public static int bookingID;

    public DeleteBooking( int bookingID)
    {
        this.bookingID = bookingID;
    }

    public Response deleteBooking() {
        baseURI = "https://restful-booker.herokuapp.com";

        token = T.createToken();

        Response deleteBooking = given()
                .header("cookie", "token="+ token)
                .contentType("application/json")
                .when()
                .delete("/booking/" + bookingID)
                .then()
                .extract()
                .response();
        return deleteBooking;
    }
}

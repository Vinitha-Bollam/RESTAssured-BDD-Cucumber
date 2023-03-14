package ReusableClasses;

import io.restassured.response.Response;
import static io.restassured.RestAssured.baseURI;
import static io.restassured.RestAssured.given;

public class UpdateBooking {
    CreateToken T = new CreateToken();
    private String request;
    private String token;
    public static int bookingID;

    public UpdateBooking(String request, int bookingID)
    {
        this.request = request;
        this.bookingID = bookingID;
    }
    public Response updateBooking()
    {
        baseURI = "https://restful-booker.herokuapp.com";

        token = T.createToken();

        Response response = given()
                .header("cookie", "token="+token)
                .contentType("application/json")
                .and()
                .body(request)
                .when()
                .put("/booking/" +bookingID)
                .then()
                .extract()
                .response();
            return response;
    }
}

package ReusableClasses;

import io.restassured.response.Response;
import static io.restassured.RestAssured.baseURI;
import static io.restassured.RestAssured.given;

public class CreateBooking {

    public static String jsonAsString;
    private String request;
    private String response;

    public CreateBooking(String request) {
        this.request = request;
    }

    public Response postOperation() {
        baseURI = "https://restful-booker.herokuapp.com";

        Response response = given()
                .header("Content-Type", "application/json")
                .contentType("application/json")
                .body(request)
                .and()
                .when()
                .post("/booking" )
                .then()
                .extract()
                .response();

        jsonAsString = response.asString();
        return response;

    }
    }


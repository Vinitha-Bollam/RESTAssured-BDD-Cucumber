package ReusableClasses;

import io.restassured.response.Response;
import static io.restassured.RestAssured.*;

public class HealthCheck {

    public Response healthCheck()
    {
        baseURI = "https://restful-booker.herokuapp.com";

        Response healthCheck = given()
                .when()
                .get("/ping")
                .then()
                .statusCode(201)
                .extract()
                .response();
        return healthCheck;

    }
}

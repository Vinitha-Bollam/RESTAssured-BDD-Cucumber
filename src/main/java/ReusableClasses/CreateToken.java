package ReusableClasses;

import io.restassured.response.Response;
import java.util.HashMap;
import static io.restassured.RestAssured.baseURI;
import static io.restassured.RestAssured.given;
import static io.restassured.path.json.JsonPath.from;

public class CreateToken {

    private static String token;

    public  String createToken()
    {
        baseURI = "https://restful-booker.herokuapp.com";

        HashMap auth = new HashMap();
        auth.put("username", "admin");
        auth.put("password", "password123");

       Response  NewToken = given()
                .contentType("application/json")
                .body(auth)
                .when()
                .post("/auth")
                .then()
               .extract()
               .response();

        String Token = NewToken.asString();
        String token = from(Token).getString("token");
        return token;

    }
}

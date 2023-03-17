package stepdefs;

import ReusableClasses.*;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.response.Response;
import org.testng.Assert;
import static io.restassured.path.json.JsonPath.from;

public class Gluecode {

    CreateBooking createBooking;
    UpdateBooking updateBooking;
    PartialUpdateBooking partialUpdateBooking;
    DeleteBooking deleteBooking;
    GetBooking getBooking;
    GetBookingIds getBookingIds;
    Response responseJSON;
    private static String requestJSON;
    private static String responsejsonAsString;
    private String bookingid;
    private static int BookingID;
    private static String StringResponse;

    @Given("Verify the API endpoint healthcheck")
    public void verify_the_api_endpoint_healthcheck() {
        HealthCheck healthcheck = new HealthCheck();
        healthcheck.healthCheck();
    }

    @Given("the request is for {string} Booking")
    public void the_request_is_for_booking(String type, String docString) {
        requestJSON = docString;
    }

    @When("I send a {string} request")
    public void i_send_a_request(String CRUDoperation) {
        if (CRUDoperation.equalsIgnoreCase("POST")) {
            createBooking = new CreateBooking(requestJSON);
            responseJSON = createBooking.postOperation();
            StringResponse = responseJSON.asString();
            BookingID = from(StringResponse).getInt("bookingid");
        } else if (CRUDoperation.equalsIgnoreCase("PUT")) {
            updateBooking = new UpdateBooking(requestJSON, BookingID);
            responseJSON = updateBooking.updateBooking();
        } else if (CRUDoperation.equalsIgnoreCase("DELETE")) {
            deleteBooking = new DeleteBooking(BookingID);
            responseJSON = deleteBooking.deleteBooking();
        } else if (CRUDoperation.equalsIgnoreCase("PATCH")) {
            partialUpdateBooking = new PartialUpdateBooking(requestJSON, BookingID);
            responseJSON = partialUpdateBooking.partialUpdateBooking();
        } else if (CRUDoperation.equalsIgnoreCase("GET")) {
            getBooking = new GetBooking(BookingID);
            responseJSON = getBooking.getBooking();
        }
        responsejsonAsString = responseJSON.asString();
    }

    @When("I send a {string} request to get all Booking ID details")
    public void i_send_a_request_to_get_all_booking_id_details(String string) {
        GetBookingIds getBookingIds = new GetBookingIds(BookingID);
        responseJSON = getBookingIds.getAllBookingIds();
        responsejsonAsString = responseJSON.toString();
    }

    @Then("the response is present")
    public void the_response_is_present() {
        boolean response = responsejsonAsString.length() > 1;
        Assert.assertTrue(response);
    }

    @Then("the response code is {int}")
    public void the_response_code_is(int rc) {
        int ExpectedResult = rc;
        int ActualResult = responseJSON.getStatusCode();
        Assert.assertEquals(ActualResult, ExpectedResult);
    }

    @Then("the response has firstname as {string}")
    public void the_response_has_firstname_as(String string) {
        String ExpectedFirstname = string;
        String ActualFirstname = from(responsejsonAsString).getString("booking.firstname");
        Assert.assertEquals(ActualFirstname, ExpectedFirstname);
    }

    @Then("the updated response has firstname as {string}")
    public void the_updated_response_has_firstname_as(String string) {
        String ExpectedFirstname = string;
        String ActualFirstname = from(responsejsonAsString).getString("firstname");
        Assert.assertEquals(ActualFirstname, ExpectedFirstname);
    }

    @Then("the response has lastname as {string}")
    public void the_response_has_lastname_as(String string) {
        String ExpectedLastname = string;
        String ActualLastname = from(responsejsonAsString).getString("booking.lastname");
        Assert.assertEquals(ActualLastname, ExpectedLastname);
    }

    @Then("the updated response has lastname as {string}")
    public void the_updated_response_has_lastname_as(String string) {
        String ExpectedLastname = string;
        String ActualLastname = from(responsejsonAsString).getString("lastname");
        Assert.assertEquals(ActualLastname, ExpectedLastname);
    }

    @Then("the response has totalprice as {int}")
    public void the_response_has_totalprice_as(int totalprice) {
        int ExpectedTotalprice = totalprice;
        int ActualTotalprice = from(responsejsonAsString).getInt("booking.totalprice");
        Assert.assertEquals(ActualTotalprice, ExpectedTotalprice);
    }

    @Then("the updated response has totalprice as {int}")
    public void the_updated_response_has_totalprice_as(int totalprice) {
        int ExpectedTotalprice = totalprice;
        int ActualTotalprice = from(responsejsonAsString).getInt("totalprice");
        Assert.assertEquals(ActualTotalprice, ExpectedTotalprice);
    }

    @Then("the response has depositpaid as {string}")
    public void the_response_has_depositpaid_as(String depositpaid) {
        String ExpectedDepositpaid = depositpaid;
        String ActualDepositpaid = from(responsejsonAsString).getString("booking.depositpaid");
        Assert.assertEquals(ActualDepositpaid, ExpectedDepositpaid);
    }

    @Then("the updated response has depositpaid as {string}")
    public void the_updated_response_has_depositpaid_as(String depositpaid) {
        String ExpectedDepositpaid = depositpaid;
        String ActualDepositpaid = from(responsejsonAsString).getString("depositpaid");
        Assert.assertEquals(ActualDepositpaid, ExpectedDepositpaid);
    }

    @Then("the response has checkin as {string}")
    public void the_response_has_checkin_as(String string) {
        String ExpectedCheckin = string;
        String ActualCheckin = from(responsejsonAsString).getString("booking.bookingdates.checkin");
        Assert.assertEquals(ActualCheckin, ExpectedCheckin);
    }

    @Then("the updated response has checkin as {string}")
    public void the_updated_response_has_checkin_as(String string) {
        String ExpectedCheckin = string;
        String ActualCheckin = from(responsejsonAsString).getString("bookingdates.checkin");
        Assert.assertEquals(ActualCheckin, ExpectedCheckin);
    }

    @Then("the response has checkout as {string}")
    public void the_response_has_checkout_as(String string) {
        String ExpectedCheckout = string;
        String ActualCheckout = from(responsejsonAsString).getString("booking.bookingdates.checkout");
        Assert.assertEquals(ActualCheckout, ExpectedCheckout);
    }

    @Then("the updated response has checkout as {string}")
    public void the_updated_response_has_checkout_as(String string) {
        String ExpectedCheckout = string;
        String ActualCheckout = from(responsejsonAsString).getString("bookingdates.checkout");
        Assert.assertEquals(ActualCheckout, ExpectedCheckout);
    }

    @Then("the response has additionalneeds as {string}")
    public void the_response_has_additionalneeds_as(String string) {
        String ExpectedAdditionalneeds = string;
        String ActualAdditionalneeds = from(responsejsonAsString).getString("booking.additionalneeds");
        Assert.assertEquals(ActualAdditionalneeds, ExpectedAdditionalneeds);
    }

    @Then("the updated response has additionalneeds as {string}")
    public void the_updated_response_has_additionalneeds_as(String string) {
        String ExpectedAdditionalneeds = string;
        String ActualAdditionalneeds = from(responsejsonAsString).getString("additionalneeds");
        Assert.assertEquals(ActualAdditionalneeds, ExpectedAdditionalneeds);
    }

    @Then("the response body has message {string}")
    public void the_response_body_has_message(String string) {
        String ExpectedMessage = string;
        String ActualMessage = responsejsonAsString;
        Assert.assertEquals(ActualMessage, ExpectedMessage);
    }

    @Then("the response has my bookingID")
    public void the_response_has_my_booking_id() {
        int ExpectedMessage = BookingID;
        int expectedMessage = ExpectedMessage;
    }


}

package stepdefs;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        plugin = {"pretty:pretty-report.log",
                "html:target/html-report",
                "json:target/json-report.json" ,
                "html:target/cucumber-reports.html"},
        features = { "src/main/resources" },
        glue = {"stepdefs" },
        tags = ("@All"))
public class TestRunner {

}
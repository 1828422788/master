package com.yottabyte.stepDefs;

import com.yottabyte.utils.TakeScreenShot;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;

/**
 * @author sunxj
 */
public class Screenshot {
    private TakeScreenShot screenShot = new TakeScreenShot();

    @Then("^take a screenshot$")
    public void takeScreenshot() {
        screenShot.screenShot();
    }

    @And("^take a screenshot with name \"([^\"]*)\"$")
    public void takeScreenshot(String name) {
        screenShot.screenShot(name);
    }
}

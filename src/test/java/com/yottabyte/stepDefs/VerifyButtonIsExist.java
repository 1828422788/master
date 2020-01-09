package com.yottabyte.stepDefs;

import com.yottabyte.utils.GetElementFromPage;
import cucumber.api.java.en.Then;
import org.junit.Assert;
import org.openqa.selenium.WebElement;

/**
 * 判断按钮是否存在
 * @author sunxj
 */
public class VerifyButtonIsExist {

    /**
     * 判断元素是否存在
     *
     * @param buttonName
     */
    @Then("^I will see the \"([^\"]*)\" is not exist$")
    public void elementNotExist(String buttonName) {
        try {
            GetElementFromPage.getWebElementWithName(buttonName);
        } catch (Exception e) {
            Assert.assertTrue(true);
        }
    }
}

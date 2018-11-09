package com.yottabyte.stepDefs;

import com.yottabyte.utils.GetElementFromPage;
import cucumber.api.PendingException;
import cucumber.api.java.en.Then;
import org.openqa.selenium.WebElement;

import static org.junit.Assert.*;

/**
 * Created by A on 2017/4/13.
 */
public class VerifyElementTextWillBe {

    @Then("^I will see the \"([^\"]*)\" result will be \"([^\"]*)\"$")
    public void iWillSeeTheResultWillBe(String elementName, String excpText) {
        WebElement element = GetElementFromPage.getWebElementWithName(elementName);
        String realText = element.getText();
        assertEquals(excpText, realText);
    }

    /**
     * 验证输入框中的内容
     *
     * @param elementName
     * @param value
     */
    @Then("^I will see the input element \"([^\"]*)\" value will be \"([^割]*)\"$")
    public void verifyInputValue(String elementName, String value) {
        WebElement element = GetElementFromPage.getWebElementWithName(elementName);
        String realValue = element.getAttribute("value");
        assertEquals(value, realValue);
    }
}

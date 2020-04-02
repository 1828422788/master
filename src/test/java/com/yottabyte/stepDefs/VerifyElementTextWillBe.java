package com.yottabyte.stepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.GetElementFromPage;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import static org.junit.Assert.*;

/**
 * 验证元素文本内容
 *
 * @author A on 2017/4/13.
 */
public class VerifyElementTextWillBe {

    /**
     * 验证某一元素文本内容是否正确
     *
     * @param elementName
     * @param excpText
     */
    @Then("^I will see the \"([^\"]*)\" result will be \"([^割]*)\"$")
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
        WebDriver webDriver = LoginBeforeAllTests.getWebDriver();
        WebElement element = GetElementFromPage.getWebElementWithName(elementName);

        if (element.getAttribute("class").contains("CodeMirror")) {
            WebElement webElement = webDriver.findElement(By.xpath("//span[@role='presentation']"));
            assertEquals(value, webElement.getText());
        } else {
            String realValue = element.getAttribute("value");
            assertEquals(value, realValue);
        }
    }

    /**
     * 验证元素的value是否包含某一值
     *
     * @param elementName 元素名称
     * @param value       值
     */
    @And("^I will see the input element \"([^\"]*)\" value will contains \"([^\"]*)\"$")
    public void iWillSeeTheInputElementValueWillContains(String elementName, String value) {
        WebElement element = GetElementFromPage.getWebElementWithName(elementName);
        String realValue = element.getAttribute("value");
        Assert.assertTrue(realValue.contains(value));
    }

    /**
     * 验证弹框内容
     *
     * @param errorMessage
     */
    @Then("^I will see the alertErrorMessage \"([^\"]*)\"$")
    public void iWillSeeAlertErrorMessage(String errorMessage) {
        WebElement element = GetElementFromPage.getWebElementWithName("Alert");
        String realResult = element.getText();
        assertEquals(errorMessage, realResult);
    }

    @Then("^I will see the success message \"([^\"]*)\"$")
    public void iWillSeeTheSuccessMessage(String messageText) {
        WebElement element = GetElementFromPage.getWebElementWithName("getSuccessMessage");
        String realText = element.getText();
        assertEquals(messageText, realText);
    }

    @Then("^I will see the message \"([^\"]*)\"$")
    public void iWillSeeTheMessage(String messageText) {
        WebElement element = GetElementFromPage.getWebElementWithName("getMessage");
        String realText = element.getText();
        assertEquals(messageText, realText);
    }

    @Then("^I will see the message contains \"([^\"]*)\"$")
    public void seeTheMessageContains(String messageText) {
        WebElement element = GetElementFromPage.getWebElementWithName("getMessage");
        String realText = element.getText();
        assertTrue("实际值:" + realText, realText.contains(messageText));
    }

    @Then("^I will see the success message contains \"([^\"]*)\"$")
    public void iWillSeeTheSuccessMessageContains(String messageText) {
        WebElement element = GetElementFromPage.getWebElementWithName("getSuccessMessage");
        String realText = element.getText();
        assertTrue(realText.contains(messageText));
    }

    @Then("^I will see the error message \"([^\"]*)\"$")
    public void iWillSeeErrorMessage(String errorMessage) {
        WebElement element = GetElementFromPage.getWebElementWithName("ErrorMessage");
        String realResult = element.getText();
        assertEquals(errorMessage, realResult);
    }

    @Then("^I will see the error message contains \"([^\"]*)\"$")
    public void iWillSeeTheErrorMessageContains(String errorMessage) {
        WebElement element = GetElementFromPage.getWebElementWithName("ErrorMessage");
        String realResult = element.getText();
        assertTrue(realResult.contains(errorMessage));
    }
}

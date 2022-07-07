package com.yottabyte.stepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.GetElementFromPage;
import com.yottabyte.utils.JsonStringPaser;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import org.junit.Assert;
import org.openqa.selenium.*;

import java.util.Map;

import static org.junit.Assert.*;

/**
 * 验证元素文本内容
 *
 * @author A on 2017/4/13.
 */
public class VerifyElementTextWillBe {
    private WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    /**
     * 验证某一元素文本内容是否正确
     *
     * @param elementName
     * @param expectText
     */
    @Then("^I will see the \"([^\"]*)\" result will be \"([^割]*)\"$")
    public void iWillSeeTheResultWillBe(String elementName, String expectText) {
        WaitElementChangeTextTo.waitUntilElementsTextEqualsTo(elementName, expectText);
    }

    /**
     * 验证某一元素文本内容是否包含
     *
     * @param elementName
     * @param expectText
     */
    @Then("^I will see the \"([^\"]*)\" result will contain \"([^割]*)\"$")
    public void iWillSeeTheResultWillContain(String elementName, String expectText) {
        WaitElementChangeTextTo.waitUntilElementContainsText(elementName, expectText);
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
            System.out.println("realValue============="+realValue);
            System.out.println("Value============="+value);
            assertEquals(value, realValue);
        }
    }

    /**
     * 验证元素的value是否包含某一值
     * @param elementName 元素名称
     * @param value       值
     */
    @And("^I will see the input element \"([^\"]*)\" value will contains \"([^\"]*)\"$")
    public void iWillSeeTheInputElementValueWillContains(String elementName, String value) {
        WebElement element = GetElementFromPage.getWebElementWithName(elementName);
        String realValue = element.getAttribute("value");
        Assert.assertTrue("实际值" + realValue, realValue.contains(value));
    }

    @Then("^I will see the message \"([^\"]*)\" in alert window$")
    public void iWillSeeAlert(String alertMessage) {
        String realResult = webDriver.switchTo().alert().getText();;
        assertEquals(alertMessage, realResult);
    }

    @Then("^I will see the message \"([^\"]*)\"$")
    public void iWillSeeTheMessage(String messageText) {
        WaitElementChangeTextTo.waitUntilElementsTextEqualsTo("Message", messageText);
    }

    @Then("^I will see the message contains \"([^\"]*)\"$")
    public void seeTheMessageContains(String messageText) {
        WaitElementChangeTextTo.waitUntilElementContainsText("Message", messageText);
    }

    @Then("^I will see the success message contains \"([^\"]*)\"$")
    public void iWillSeeTheSuccessMessageContains(String messageText) {
        WaitElementChangeTextTo.waitUntilElementContainsText("SuccessMessage", messageText);
    }

    @Then("^I will see the success message \"([^\"]*)\"$")
    public void iWillSeeTheSuccessMessage(String messageText) {
        WaitElementChangeTextTo.waitUntilElementsTextEqualsTo("SuccessMessage", messageText);
    }

    @Then("^I will see the error message \"([^\"]*)\"$")
    public void iWillSeeErrorMessage(String errorMessage) {
        WaitElementChangeTextTo.waitUntilElementsTextEqualsTo("ErrorMessage",errorMessage);
    }

    @Then("^I will see the error message contains \"([^\"]*)\"$")
    public void iWillSeeTheErrorMessageContains(String errorMessage) {
        WaitElementChangeTextTo.waitUntilElementContainsText("ErrorMessage", errorMessage);
    }

    /**
     * 验证字段提取页的解析结果
     *
     * @param json {'字段名称'：'字段值'}
     */
    @Then("^I will see the field extraction result \"([^割]*)\"$")
    public void iWillSeeTheFieldExtractionResult(String json) {
        Map<String, Object> map = JsonStringPaser.json2Stirng(json);
        for (String key : map.keySet()) {
            WebElement tr = webDriver.findElement(By.xpath("(//div[text()='" + key + "']//ancestor::td//following-sibling::td)[last()]"));
            String actualValue = tr.getText();
            Assert.assertEquals(map.get(key), actualValue);
        }
    }
}

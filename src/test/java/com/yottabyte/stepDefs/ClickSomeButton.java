package com.yottabyte.stepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.*;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.List;
import java.util.Map;

/**
 * Created by A on 2017/4/7.
 */
public class ClickSomeButton {
    WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    @When("^I click the \"([^\"]*)\" button$")
    public void iClickTheButton(String buttonName) {
        if (buttonName != null && buttonName.trim().length() != 0) {
            String parameters = "";
            WebElement button = null;
            if (JsonStringPaser.isJson(buttonName)) {
                Map<String, Object> map = JsonStringPaser.json2Stirng(buttonName);
                for (Map.Entry<String, Object> entry : map.entrySet()) {
                    buttonName = entry.getKey();
                    parameters = (String) entry.getValue();
                }
                button = GetElementFromPage.getWebElementWithName(buttonName, parameters);
            } else {
                button = GetElementFromPage.getWebElementWithName(buttonName);
            }
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].scrollIntoView();", button);
            iClickTheButton(button);
        } else {
            System.out.println("skip this step!");
        }
    }

    public void iClickTheButton(WebElement button) {
        WaitForElement.waitForElementWithExpectedCondition(
                LoginBeforeAllTests.getWebDriver(), ExpectedConditions.elementToBeClickable(button));
        ((JavascriptExecutor) webDriver).executeScript("arguments[0].scrollIntoView();", button);
        button.click();
    }

    @And("^I click the table \"([^\"]*)\" button$")
    public void iClickTheTableButton(String tableAddress) {
        if (tableAddress.contains("-")) {
            String buttonName = tableAddress.split("-")[0];
            int row = Integer.parseInt(tableAddress.split("-")[1]);
            WebElement button = GetElementFromPage.getWebElementWithName(buttonName, row);
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].scrollIntoView();", button);
            button.click();
        } else {
            System.out.println("Table Address is wrong!!!");
        }
    }

    @And("^I trigger the button \"([^\"]*)\"$")
    public void trigger(String buttonName) {
        GetElementFromPage.getWebElementWithName(buttonName);
    }

    /**
     * 监控专用（展开告警）
     *
     * @param buttonName
     */
    @And("^I click the expand button \"([^\"]*)\" if exist$")
    public void clickExpandButtonIfExist(String buttonName) {
        WebElement expandButton = GetElementFromPage.getWebElementWithName(buttonName);
        boolean flag = ElementExist.isElementExist(webDriver, expandButton);
        if (flag) {
            String text = expandButton.getText();
            int dumplicateNum = Integer.parseInt(ParsingString.getNumberInString(text).get(0));

            expandButton.click();
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }

            List<WebElement> list = expandButton.findElements(By.xpath(".//ancestor::tr/following-sibling::tr"));
            String alertName = null;
            for (int i = 0; i < dumplicateNum; i++) {
                WebElement element = list.get(i);
                String name = element.findElement(By.xpath(".//td[2]")).getText();
                if (alertName == null)
                    alertName = name;
                else
                    Assert.assertEquals(alertName, name);
            }
        }
    }
}

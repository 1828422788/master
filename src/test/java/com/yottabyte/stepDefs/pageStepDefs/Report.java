package com.yottabyte.stepDefs.pageStepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.stepDefs.ClickSomeButton;
import com.yottabyte.utils.ElementExist;
import cucumber.api.java.en.When;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

public class Report {
    WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    /**
     * 如果元素存在则点击（word报表）
     *
     * @param title 元素名称 (颜色码)
     */
    @When("^I click the button with data-color \"([^\"]*)\"$")
    public void clickTheButtonWithTitle(String title) {
        String xpath = "//a[@data-color='" + title + "']";
        WebElement button = webDriver.findElement(By.xpath(xpath));
        if (ElementExist.isElementExist(webDriver, button))
            button.click();
    }

    @When("^I click the element \"([^\"]*)\" in word report$")
    public void clickTheButtonWordReport(String buttonName) {
        if (buttonName != null && buttonName.trim().length() != 0) {
            WebElement button = ClickSomeButton.findButton(buttonName);
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].scrollIntoView();", button);
            button.click();
        } else {
            System.out.println("skip this step!");
        }
    }
}

package com.yottabyte.stepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import cucumber.api.java.en.When;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

/**
 * @author sunxj
 */
public class ButtonWithoutPaging {
    private WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    /**
     * 数据大屏列表页点击操作
     *
     * @param dataName
     * @param className
     */
    @When("^the galaxee name is \"([^\"]*)\" then I click the \"([^\"]*)\" button$")
    public void theGalaxeeNameIsThenIClickTheButton(String dataName, String className) {
        String xpath = "//div[@title='" + dataName + "']/preceding-sibling::div//*[@class='" + className + "']";
        WebElement button = webDriver.findElement(By.xpath(xpath));
        button.click();
    }
}

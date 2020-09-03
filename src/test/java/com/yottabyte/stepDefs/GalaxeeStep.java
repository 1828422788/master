package com.yottabyte.stepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import cucumber.api.java.en.When;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

/**
 * 在无分页的列表下，点击相应按钮
 */
public class GalaxeeStep {
    private WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    //发布和删除的定位不同，分开来写
    //大屏发布
    @When("^the galaxee name is \"([^\"]*)\" then I click the \"([^\"]*)\" release button$")
    public void clickGalaxeeReleaseButton(String dataName, String className) {

        String xpath = "//a[contains(@href, '" + dataName + "')]/i[@class='" + className + "']";
        WebElement button = webDriver.findElement(By.xpath(xpath));
        button.click();
    }

    //大屏删除
    @When("^the galaxee name is \"([^\"]*)\" then I click the \"([^\"]*)\" delete button$")
    public void clickGalaxeeDeleteButton(String dataName, String className) {

        String xpath = "//a[contains(@href, '" + dataName + "')]/following-sibling::span/i[@class='" + className + "']";
        WebElement button = webDriver.findElement(By.xpath(xpath));
        button.click();
    }

    //大屏编辑
    @When("^the galaxee name is \"([^\"]*)\" then I click the \"([^\"]*)\" edit button$")
    public void clickGalaxeeEditButton(String dataName, String className) {
        String xpath = "//a[contains(@href, '" + dataName + "')]/i[@class='" + className + "']";
        WebElement button = webDriver.findElement(By.xpath(xpath));
        button.click();
    }


}


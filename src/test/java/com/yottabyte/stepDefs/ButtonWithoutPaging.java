package com.yottabyte.stepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import cucumber.api.java.en.When;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

/**
 * 在无分页的列表下，点击相应按钮
 *
 * @author sunxj
 */
public class ButtonWithoutPaging {
    private WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    /**
     * 数据大屏列表页点击操作
     *
     * @param dataName：数据大屏名称
     * @param className：要点击按钮的class
     */

    /*


    @When("^the galaxee name is \"([^\"]*)\" then I click the \"([^\"]*)\" button$")
    public void clickGalaxeeButton(String dataName, String className) {
       // String xpath = "//div[@title='" + dataName + "']/preceding-sibling::div//*[@class='" + className + "']";

       //发布  String xpath = "//a[contains(@href, '" + dataName + "')]/i[@class='" + className + "']";
       //删除 String xpath = "//a[contains(@href, '" + dataName + "')]/following-sibling::span/i[@class='" + className + "']";
        WebElement button = webDriver.findElement(By.xpath(xpath));
        button.click();
    }
    */


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
        String xpath = "//a[contains(@href, '" + dataName + "')]/button[@class='" + className + "']";
        WebElement button = webDriver.findElement(By.xpath(xpath));
        button.click();
    }




}


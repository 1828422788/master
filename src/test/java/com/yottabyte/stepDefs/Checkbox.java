package com.yottabyte.stepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.ListPageUtils;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import java.util.List;

/**
 * @author sunxj
 */
public class Checkbox {
    WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    /**
     * 勾选或取消勾选名称前面的checkbox
     *
     * @param status   checked or unchecked
     * @param nameList
     */
    @And("^I \"([^\"]*)\" the label before \"([^\"]*)\"$")
    public void clickCheckLabel(String status, List<String> nameList) {
        for (String name : nameList) {
            String xpath = "//div[contains(text(),'" + name + "')]/ancestor::td/preceding-sibling::td//label";
            WebElement label = webDriver.findElement(By.xpath(xpath));
            WebElement span = label.findElement(By.xpath(".//span"));
            String attribute = span.getAttribute("class");
            if (attribute.contains("checked") && "unchecked".equals(status) || !attribute.contains("checked") && "checked".equals(status)) {
                label.click();
            }
        }
    }

    /**
     * 勾选或取消勾选checkbox（名称可直接点击）
     *
     * @param status   checked or unchecked
     * @param nameList
     */
    @When("^I \"([^\"]*)\" the checkbox which name is \"([^\"]*)\"$")
    public void clickCheckboxWithGivenName(String status, List<String> nameList) {
        for (String name : nameList) {
            String xpath = "(//span[@class='el-checkbox__label'][contains(text(),'" + name + "')])[last()]";
            WebElement label = webDriver.findElement(By.xpath(xpath));
            WebElement span = label.findElement(By.xpath(".//preceding-sibling::span"));
            String attribute = span.getAttribute("class");
            if (attribute.contains("checked") && "unchecked".equals(status) || !attribute.contains("checked") && "checked".equals(status)) {
                label.findElement(By.xpath(".//ancestor::label")).click();
            }
        }
    }

    @Then("^I will see the checkbox in list before \"([^\"]*)\" is \"([^\"]*)\"$")
    public void checkAttribute(String name, String attribute) {
        ListPageUtils listPageUtils = new ListPageUtils();
        WebElement tr = listPageUtils.getTr(name);
        WebElement label = tr.findElement(By.xpath(".//button"));
        Assert.assertTrue("enabled".equals(attribute) && label.isEnabled() || "disabled".equals(attribute) && !label.isEnabled());
    }
}

package com.yottabyte.stepDefs.pageStepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.ElementExist;
import com.yottabyte.utils.GetElementFromPage;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import static org.junit.Assert.assertTrue;


/**
 * 仪表盘相关操作
 * Created by Kate
 */
public class Dashboard {
    WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    /**
     * 验证仪表盘高级编辑文本内容是否包含
     *
     * @param excpText
     */
    @Then("^I will see the dashboard highEditor text will contain \"([^割]*)\"$")
    public void iWillSeeTheDashboardHighEditorWillContain(String excpText) {
        WebElement element = webDriver.findElement(By.id("ace-nav"));
        String realText = element.getAttribute("data-ace");
        assertTrue(realText.contains(excpText));
    }

    /**
     * 点击仪表盘某个记录前的icon
     *
     * @param name 仪表盘记录名称
     */
    @When("^I click the dashboard icon which name is \"([^\"]*)\"$")
    public void clickTheIconWhichname(String name) {
        String xpath = "//span[text()='" + name + "']/parent::a/preceding-sibling::div/span";
        WebElement button = webDriver.findElement(By.xpath(xpath));
        if (ElementExist.isElementExist(webDriver, button))
            button.click();
    }

    /**
     * 关闭或开启仪表盘开关
     *
     * @param buttonName 元素名称
     * @param value      状态 enable/disable
     */
    @And("^I switch the dashboard \"([^\"]*)\" button to \"([^\"]*)\"$")
    public void operateDashboardSwitch(String buttonName, String value) {
        WebElement element = GetElementFromPage.getWebElementWithName(buttonName);
        String status = element.getAttribute("class");
        if (value.equalsIgnoreCase("enable")) {
            if (status.contains("checked")) {
                System.out.println("already enable");
            } else {
                element.click();
            }
        } else if (value.equalsIgnoreCase("disable")) {
            if (status.contains("checked")) {
                element.click();
            } else {
                System.out.println("already disable");
            }
        } else {
            System.out.println("error value :" + value);
        }
    }
}

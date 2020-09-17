package com.yottabyte.stepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.GetElementFromPage;
import cucumber.api.java.en.And;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

/**
 * switch button相关操作
 */
public class SwitchButton {
    WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    /**
     * 将switch button置为disable/enable
     *
     * @param buttonName 元素名称
     * @param status     disable/enable
     */
    @And("^I switch the \"([^\"]*)\" button to \"([^\"]*)\"$")
    public void iSwitchTheButtonTo(String buttonName, String status) {
        String xpath = "//label[text()='" + buttonName + "']/following-sibling::button";
        WebElement switchButton = webDriver.findElement(By.xpath(xpath));
        String attribute = switchButton.getAttribute("class");
        if (attribute.contains("checked") && "unchecked".equals(status) || !attribute.contains("checked") && "checked".equals(status)) {
            switchButton.click();
        }
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
        String status = element.getAttribute("aria-checked");
        if (value.equalsIgnoreCase("enable")) {
            if (status.contains("false")) {
                element.click();
            } else {
                System.out.println("already enable");
            }
        } else if (value.equalsIgnoreCase("disable")) {
            if (status.contains("true")) {
                element.click();
            } else {
                System.out.println("already disable");
            }
        } else {
            System.out.println("error value :" + value);
        }
    }
}

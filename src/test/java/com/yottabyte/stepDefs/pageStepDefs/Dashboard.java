package com.yottabyte.stepDefs.pageStepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import cucumber.api.java.en.Then;
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
}

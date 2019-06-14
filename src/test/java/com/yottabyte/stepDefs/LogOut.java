package com.yottabyte.stepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.WaitForElement;
import cucumber.api.java.en.And;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

public class LogOut {
    WebDriver webDriver = LoginBeforeAllTests.getWebDriver();


    @FindBy(partialLinkText = "仪表盘")
    private WebElement dashboard;

    @And("^I logout current user$")
    public void iLogoutCurrentUser() {
//        WebElement owner = webDriver.findElement(By.xpath("//*[@class='yw-nav-icon iconfont icon-owner_icon']"));
//        owner.click();
//        WebElement logout = webDriver.findElement(By.xpath("//a[text()='退出登录']"));
//        logout.click();
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(webDriver.findElement(By.partialLinkText("仪表盘"))));
        webDriver.manage().deleteAllCookies();
        webDriver.navigate().refresh();
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}

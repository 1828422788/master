package com.yottabyte.stepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import cucumber.api.java.en.And;
import org.openqa.selenium.By;
import org.openqa.selenium.Cookie;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

public class LogOut {
    WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    @And("^I logout current user$")
    public void iLogoutCurrentUser() {
        WebElement owner = webDriver.findElement(By.xpath("//*[@class='yw-nav-icon iconfont icon-owner_icon']"));
        owner.click();
        WebElement logout = webDriver.findElement(By.xpath("//a[text()='退出登录']"));
        logout.click();
    }
}

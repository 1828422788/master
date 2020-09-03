package com.yottabyte.pages.users;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

/**
 * @author sunxj
 */
public class DetailPage extends PageTemplate {
    public DetailPage(WebDriver driver) {
        super(driver);
    }

    public WebElement getFullName() {
        return getInfo("全名");
    }

    public WebElement getEmail() {
        return getInfo("邮箱");
    }

    public WebElement getTel() {
        return getInfo("电话号码");
    }

    public WebElement getInfo(String name) {
        String xpath = "//span[text()='" + name + ":']/following-sibling::span";
        return webDriver.findElement(By.xpath(xpath));
    }
}

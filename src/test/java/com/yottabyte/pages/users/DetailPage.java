package com.yottabyte.pages.users;

import com.yottabyte.pages.EditorPage;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

/**
 * @author sunxj
 */
public class DetailPage extends EditorPage {
    public DetailPage(WebDriver driver) {
        super(driver);
    }

    public WebElement getFullName() {
        return getInfo("全名");
    }

    public WebElement getEmail() {
        return getMess("邮箱");
    }

    public WebElement getTel() {
        return getMess("电话号码");
    }

    public WebElement getInfo(String name) {
        String xpath = "//span[text()='" + name + ":']/following-sibling::span";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getMess(String name) {
        String xpath = "//span[text()='" + name + ":']/parent::div/following-sibling::div/span";
        return webDriver.findElement(By.xpath(xpath));
    }
}

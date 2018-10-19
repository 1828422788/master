package com.yottabyte.pages.app;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class DetailPage extends PageTemplate {
    public DetailPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "node-name")
    private WebElement menuName;

    public WebElement getName() {
        return getSpanElement("名称");
    }

    public WebElement getDescribe() {
        return getSpanElement("描述");
    }

    public WebElement getDefaultPage() {
        return getSpanElement("默认首页");
    }

    public WebElement getResourceRange() {
        return getSpanElement("资源范围");
    }

    public WebElement getMenuName() {
        return menuName;
    }

    private WebElement getSpanElement(String text) {
        String xpath = "//span[text()='" + text + "']/following-sibling::span";
        return webDriver.findElement(By.xpath(xpath));
    }
}

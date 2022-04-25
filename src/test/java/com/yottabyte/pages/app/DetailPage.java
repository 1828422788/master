package com.yottabyte.pages.app;

import com.yottabyte.pages.EditorPage;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class DetailPage extends EditorPage {
    public DetailPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "//span[@class='ant-tree-title']//span")
    private WebElement menuName;

    //@FindBy(id = "register_name")
    @FindBy(xpath = "//div[@class='yotta-form-field']/div/input")
    private WebElement name;

    @FindBy(className = "ant-select-selection-selected-value")
    private WebElement defaultPage;

    @FindBy(id = "register_description")
    private WebElement describe;

    public WebElement getName() {
        return name;
    }

    public WebElement getDescribe() {
        return describe;
    }

    public WebElement getDefaultPage() {
        return defaultPage;
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

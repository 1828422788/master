package com.yottabyte.pages;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * 其他页面的公共的元素
 */
public class EditorPage extends PageTemplate {

    public EditorPage(WebDriver driver) {
        super(driver);
    }

    public static WebElement getNextPageButton() {
        String xpath = "//div[@class='yotta-pagination-pages yotta-pagination-elements']/span[last()]";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getNextStep() {
        return getButton("下一步");
    }

    public WebElement getPreviousStep() {
        return getButton("上一步");
    }

    @FindBy(className = "yotta-empty-description")
    private WebElement resultMessage;
    public WebElement getResultMessage() {
        return resultMessage;
    }
}
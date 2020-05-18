package com.yottabyte.pages.kv;

import com.yottabyte.pages.ListPageFactory;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class ListPage extends ListPageFactory {
    @FindBy(xpath = "//label[text()='名称:']/following-sibling::span")
    private WebElement name;

    public ListPage(WebDriver driver) {
        super(driver);
    }

    public WebElement getName() {
        return name;
    }
}

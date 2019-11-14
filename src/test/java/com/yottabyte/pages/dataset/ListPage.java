package com.yottabyte.pages.dataset;

import com.yottabyte.pages.ListPageFactory;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class ListPage extends ListPageFactory {
    @FindBy(id = "EditDatabase_name")
    private WebElement name;
    @FindBy(id = "EditDatabase_alias")
    private WebElement alias;
    @FindBy(id = "EditDatabase_queryfilter")
    private WebElement spl;

    public ListPage(WebDriver driver) {
        super(driver);
    }

    public WebElement getName() {
        return name;
    }

    public WebElement getAlias() {
        return alias;
    }

    public WebElement getSpl() {
        return spl;
    }
}

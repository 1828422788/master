package com.yottabyte.pages.knowledge;

import com.yottabyte.pages.ListPageFactory;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class ListPage extends ListPageFactory {
    public ListPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "ant-input")
    private WebElement searchInput;

    @Override
    public WebElement getSearchInput() {
        return searchInput;
    }
}

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

    @FindBy(className = "search-count")
    private WebElement searchCount;

    @FindBy(className = "grep-key")
    private WebElement key;

    public WebElement getSearchAll() {
        return super.getButton("全文搜索");
    }

    public WebElement getKey() {
        return key;
    }

    public WebElement getSearchCount() {
        return searchCount;
    }

    public WebElement getSearch() {
        return getButton("全文搜索");
    }
}

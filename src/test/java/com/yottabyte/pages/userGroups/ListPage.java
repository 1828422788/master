package com.yottabyte.pages.userGroups;

import com.yottabyte.pages.ListPageFactory;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class ListPage extends ListPageFactory {

    public ListPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "el-input__inner")
    private WebElement searchInput;

    @FindBy(className = "el-loading-mask")
    private WebElement loading;

    public WebElement getLoading() {
        return loading;
    }

    @Override
    public WebElement getSearchInput() {
        return searchInput;
    }
}

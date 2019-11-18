package com.yottabyte.pages.app;

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

    @FindBy(xpath = "//input[@placeholder='请输入']")
    private WebElement getSearchInput;

    @FindBy(className = "el-table__empty-text")
    private WebElement emptyText;

    public WebElement getEmptyText() {
        return emptyText;
    }

    public WebElement getCreateButton() {
        return super.getButton("新 建");
    }

    public WebElement getInstallButton() {
        return super.getButton("安 装");
    }

    public WebElement getGetSearchInput() {
        return getSearchInput;
    }
}

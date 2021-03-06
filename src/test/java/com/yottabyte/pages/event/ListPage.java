package com.yottabyte.pages.event;

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

    @FindBy(xpath = "//input[@placeholder='请输入名称']")
    private WebElement searchInput;

    public WebElement getCreate() {
        return super.getButton("新建");
    }

    public WebElement getSearchInput() {
        return searchInput;
    }
}

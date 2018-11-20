package com.yottabyte.pages.tenant;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class ListPage extends PageTemplate {
    public ListPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "//input[@placeholder='搜索租户']")
    private WebElement searchInput;

    public WebElement getSearchInput() {
        return searchInput;
    }

    public WebElement getCreateButton() {
        return super.getButton("新建");
    }
}

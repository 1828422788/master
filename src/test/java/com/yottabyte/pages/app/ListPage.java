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

    @FindBy(xpath = "//span[text()='名称']/following-sibling::span")
    private WebElement nameText;

    public WebElement getNameText() {
        return nameText;
    }

    public WebElement getEmptyText() {
        return emptyText;
    }

    public WebElement getCreateButton() {
        return super.getButton("制 作");
    }

    public WebElement getInstallButton() {
        return super.getButton("安 装");
    }

    public WebElement getGetSearchInput() {
        return getSearchInput;
    }
}

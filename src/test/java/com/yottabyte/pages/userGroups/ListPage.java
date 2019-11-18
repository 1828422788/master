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

    @FindBy(className = "el-icon-search")
    private WebElement searchIcon;

    @FindBy(xpath = "//span[contains(text(),'确定')]/ancestor::button")
    private WebElement messageBoxOKButton;

    @FindBy(className = "el-message__group")
    private WebElement successMessage;

    @Override
    public WebElement getSuccessMessage() {
        return successMessage;
    }

    public WebElement getMessageBoxOKButton() {
        return messageBoxOKButton;
    }

    @Override
    public WebElement getSearchIcon() {
        return searchIcon;
    }

    public WebElement getLoading() {
        return loading;
    }

    @Override
    public WebElement getSearchInput() {
        return searchInput;
    }
}

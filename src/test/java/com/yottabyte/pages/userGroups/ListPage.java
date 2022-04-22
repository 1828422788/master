package com.yottabyte.pages.userGroups;

import com.yottabyte.pages.ListPageFactory;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class ListPage extends ListPageFactory {

    public ListPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "//li[@yotta-test='usergroup-authorize-button']/span")
    private WebElement auth;

    public WebElement getAuth() { return auth; }

    @FindBy(xpath = "//li[@yotta-test='usergroup-delete-button']/span")
    private WebElement delete;

    public WebElement getDelete() { return delete; }

}

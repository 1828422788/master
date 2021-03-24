package com.yottabyte.pages.dbConnectionPre;

import com.yottabyte.pages.ListPageFactory;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class LdapConnListPage extends ListPageFactory {
    public LdapConnListPage(WebDriver driver) {
        super(driver);
//        driver.manage().window().fullscreen();
    }

    public WebElement getCreateLdapConn() {
        return super.getButton("新建");
    }

    @FindBy(xpath = "//input[@placeholder='输入关键字']")
    private WebElement ldapConnNameSearchInput;

    public WebElement getLdapConnNameSearchInput() {
        return ldapConnNameSearchInput;
    }

    @FindBy(xpath = "//a[text()='删除']")
    private WebElement delLdapConnButton;

    public WebElement getDelLdapConnButton() {
        return delLdapConnButton;
    }

    public WebElement getAffirmDelLdapConnButton() {
        return super.getButton("确定");
    }

}


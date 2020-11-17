package com.yottabyte.pages.dbConnection;

import com.yottabyte.pages.ListPageFactory;
import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.SearchContext;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.List;

public class LdapConnListPage extends ListPageFactory {
    public LdapConnListPage(WebDriver driver) {
        super(driver);
//        driver.manage().window().fullscreen();
    }

    public WebElement getCreateLdapConn() {
        return super.getButton("新建");
    }

    @FindBy(xpath = "//label[contains(text(),'名称')]/following::span[@class='ant-form-item-children']/input[@placeholder='请输入']")
    private WebElement newLdapConnName;

    public WebElement getNewLdapConnName() {
        return newLdapConnName;
    }

    @FindBy(xpath = "//label[contains(text(),'Base DN')]/following::input[@placeholder='请输入']")
    private WebElement newBaseDName;

    public WebElement getNewBaseDName() {
        return newBaseDName;
    }

    @FindBy(xpath = "//label[contains(text(),'Hostname')]/following::input[@placeholder='请输入']")
    private WebElement newLdapHost;

    public WebElement getNewLdapHost() {
        return newLdapHost;
    }

    @FindBy(xpath = "//label[contains(text(),'端口')]/following::input[@placeholder='请输入']")
    private WebElement newLdapConnPort;

    public WebElement getNewLdapConnPort() {
        return newLdapConnPort;
    }

    @FindBy(xpath = "//label[contains(text(),'Bind DN')]/following::input[@placeholder='请输入']")
    private WebElement newBindDnName;

    public WebElement getNewBindDnName() {
        return newBindDnName;
    }

    @FindBy(xpath = "//label[contains(text(),'密码')]/following::input[@placeholder='请输入']")
    private WebElement ldapUserPassword;

    public WebElement getLdapUserPassword() {
        return ldapUserPassword;
    }

    public WebElement getLdapConnVerifyButton() {
        return super.getButton("验证");
    }

    public WebElement getSaveButton() {
        return super.getButton("保存");
    }

}


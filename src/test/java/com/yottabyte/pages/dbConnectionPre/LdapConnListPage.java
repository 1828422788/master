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

    public WebElement getAffirmSaveButton() {
        return super.getButton("保存成功");
    }

    @FindBy(xpath = "//label[contains(text(),'SSL')]/following::button[@id='register_enable_ssl']")
    private WebElement ldapSSlOnOff;

    public WebElement getLdapSSlOnOff() {
        return ldapSSlOnOff;
    }

    @FindBy(xpath = "//span[text()='上传证书']/parent::button/preceding-sibling::input")
    private WebElement upload;
    public WebElement getUpload() {
        return upload;
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


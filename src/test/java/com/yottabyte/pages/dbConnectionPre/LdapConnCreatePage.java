package com.yottabyte.pages.dbConnectionPre;

import com.yottabyte.pages.EditorPage;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class LdapConnCreatePage extends EditorPage {
    public LdapConnCreatePage(WebDriver driver) {
        super(driver);
//        driver.manage().window().fullscreen();
    }

    //    @FindBy(xpath = "//label[contains(text(),'名称')]/following::input[@placeholder='请输入']")
//    @FindBy(xpath = "//label[@title='名称')]/following::input[@placeholder='请输入']")
//            return webDriver.findElement(By.xpath("//label[contains(text(),'名称')]/following::span[@class='ant-form-item-children']/input[@placeholder='请输入']"));
    @FindBy(xpath = "//form[@class='ant-form ant-form-horizontal']/descendant::label[contains(text(),'名称')]/following::span[@class='ant-form-item-children']/input[@placeholder='请输入']")
    private WebElement newLdapConnName;

    public WebElement getNewDbConnName() {
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


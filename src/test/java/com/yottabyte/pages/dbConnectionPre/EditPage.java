package com.yottabyte.pages.dbConnectionPre;

import com.yottabyte.pages.EditorPage;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author jiangnd
 */

public class EditPage extends EditorPage {

    public EditPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "//label[contains(text(),'名称')]/parent::div/following-sibling::div//input[@placeholder='请输入']")
    private WebElement newLdapConnName;

    public WebElement getNewLdapConnName() {
        return newLdapConnName;
    }

    //    @FindBy(xpath = "//label[contains(text(),'Base DN')]/following::input[@placeholder='请输入']")
    @FindBy(xpath = "//label[contains(text(),'Base DN')]/parent::div/following-sibling::div//input[@placeholder='请输入']")
    private WebElement newBaseDName;
    public WebElement getNewBaseDName() {
        return newBaseDName;
    }

    //    @FindBy(xpath = "//label[contains(text(),'Hostname')]/following::input[@placeholder='请输入']")
    @FindBy(xpath = "//label[contains(text(),'Hostname')]/parent::div/following-sibling::div//input[@placeholder='请输入']")
    private WebElement newLdapHost;
    public WebElement getNewLdapHost() {
        return newLdapHost;
    }

    //    @FindBy(xpath = "//label[contains(text(),'端口')]/following::input[@placeholder='请输入']")
    @FindBy(xpath = "//label[contains(text(),'端口')]/parent::div/following-sibling::div//input[@placeholder='请输入']")
    private WebElement newLdapConnPort;

    public WebElement getNewLdapConnPort() {
        return newLdapConnPort;
    }

    //    @FindBy(xpath = "//label[contains(text(),'Bind DN')]/following::input[@placeholder='请输入']")
    @FindBy(xpath = "//label[contains(text(),'Bind DN')]/parent::div/following-sibling::div//input[@placeholder='请输入']")
    private WebElement newBindDnName;

    public WebElement getNewBindDnName() {
        return newBindDnName;
    }

    //@FindBy(xpath = "//label[contains(text(),'密码')]/following::input[@placeholder='请输入']")
    @FindBy(xpath = "//label[contains(text(),'密码')]/parent::div/following-sibling::div//input[@placeholder='请输入']")
    private WebElement ldapUserPassword;

    public WebElement getLdapUserPassword() {
        return ldapUserPassword;
    }

    @FindBy(xpath = "//label[contains(text(),'SSL')]/parent::div/following-sibling::div//input[@name='enable_ssl']")
    private WebElement ldapSSlOnOff;
    public WebElement getLdapSSlOnOff() {
        return ldapSSlOnOff;
    }

//    @FindBy(xpath = "//span[text()='上传证书']/parent::button/preceding-sibling::input")
    @FindBy(xpath = "//span[text()='上传证书']/parent::span/input")
    private WebElement upload;
    public WebElement getUpload() {
        return upload;
    }
    public WebElement getAffirmSaveButton() {
        return super.getButton("保存成功");
    }

    public WebElement getLdapConnVerifyButton() {
        return super.getButton("验证");
    }

    @FindBy(xpath = "//span[text()='保存']//parent::button")
    private WebElement saveButton;
    public WebElement getSaveButton() {
//        return super.getButton("保存");
          return saveButton;
    }

    @FindBy(xpath = "//button[@yotta-test='dialog-confirm-button']")
    private WebElement confirmButton;
    public WebElement getConfirmButton()
    {
        return confirmButton;
    }
}
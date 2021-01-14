package com.yottabyte.pages;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * 登陆页面的页面元素
 * Created by A on 2017/4/5.
 */
public class LoginPage extends PageTemplate {
    WebDriver webDriver;

    public LoginPage(WebDriver driver) {
        super(driver);
        webDriver = driver;
//        webDriver.manage().window().fullscreen();
        parentPageName = "";
    }

    @FindBy(className = "ant-message")
    private WebElement message;

    @FindBy(xpath = "//div[@class='ant-modal-body']//p")
    private WebElement errorMessage;

    @FindBy(xpath = "//span[text()='去修改→']")
    private WebElement modify;

    @FindBy(className = "ant-popover-inner-content")
    private WebElement innerContent;

    public WebElement getInnerContent() {
        return innerContent;
    }

    public WebElement getModify() {
        return modify;
    }

    public WebElement getUsername() {
        return this.getYottaInput("login-username-input");
    }

    public WebElement getPassword() {
        return this.getYottaInput("login-password-input");
    }

    public WebElement getLoginButton() {
        return super.getYottaButton("login-login-button");
    }


    public WebElement getUpdate() {
        return super.getButton("更 新");
    }

    public WebElement getNewPassword() {
        return this.getInputElement("新密码");
    }

    public WebElement getRepeatPassword() {
        return this.getInputElement("重复密码");
    }
    public String getTitle() {
        return webDriver.getTitle();
    }

    public WebElement getErrorMessage() {
        return errorMessage;
    }

    public WebElement getMessage() {
        return message;
    }

    public WebElement getInputElement(String name) {
        String xpath = "//label[text()='" + name + "']/following-sibling::input";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getYottaInput(String test) {
        String xpath = "//input[@yotta-test='" + test +"']";
        return webDriver.findElement(By.xpath(xpath));
    }

    public void getLogin(String userName, String password) {
        this.getUsername().sendKeys(userName);
        this.getPassword().sendKeys(password);
        this.getLoginButton().click();
        webDriver.navigate().refresh();
    }

}

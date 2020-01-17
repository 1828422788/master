package com.yottabyte.pages;

import com.yottabyte.stepDefs.ClickSomeButton;
import com.yottabyte.stepDefs.SetKeyWithValue;
import com.yottabyte.utils.ElementExist;
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
        parentPageName = "";
    }

    @FindBy(className = "el-message-box__message")
    private WebElement errorMessageBox;

    @FindBy(className = "el-message__group")
    private WebElement errorMessage;

    public WebElement getUsername() {
        return this.getInputElement("用户名");
    }

    public WebElement getPassword() {
        return this.getInputElement("密码");
    }

    public WebElement getLoginButton() {
        return super.getButton("登 录");
    }

    public String getTitle() {
        return webDriver.getTitle();
    }

    public WebElement getErrorMessage() {
        By by = By.className("el-message__group");
        WebElement message;
        if (ElementExist.isElementExist(webDriver, by)) {
            message = errorMessage;
        } else {
            message = errorMessageBox;
        }

        return message;
    }

    public WebElement getInputElement(String name) {
        String xpath = "//label[text()='" + name + "']/following-sibling::input";
        return webDriver.findElement(By.xpath(xpath));
    }

}

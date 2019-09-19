package com.yottabyte.pages.manager;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class ManagerLoginPage extends PageTemplate {
    @FindBy(id = "LoginForm-UserName")
    private WebElement userName;
    @FindBy(id = "LoginForm-Password")
    private WebElement password;
    @FindBy(xpath = "//button[@type='submit']")
    private WebElement login;

    public ManagerLoginPage(WebDriver driver) {
        super(driver);
    }

    public WebElement getUsername() {
        return userName;
    }

    @Override
    public WebElement getPassword() {
        return password;
    }

    public WebElement getLoginButton() {
        return login;
    }
}
